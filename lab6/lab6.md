# 练习1

## 调度类的初始化流程

### 1. 从内核启动到进入 C 代码

硬件上电后最终进入 kern/init/entry.S 的 kern_entry：保存 hartid/DTB，设置 boot_page_table_sv39 到 satp，执行 sfence.vma 刷新 TLB，切换到内核的虚拟地址空间，然后设置内核栈 sp，跳转到 C 入口函数 kern_init。此时 CPU 已在内核虚拟地址空间中执行 C 代码。

### 2. kern_init 中与调度相关的关键步骤

在 kern_init（kern/init/init.c）中，内核依次完成基础输出和内存、中断等初始化后，先调用 sched_init() 建立调度器框架和运行队列，再调用 proc_init() 创建 idleproc 和 initproc，随后通过 clock_init() 与 intr_enable() 打开时钟中断，最后进入 cpu_idle() 循环，在空闲时根据 need_resched 标志调用 schedule() 完成进程切换。

注意：sched_init 早于 proc_init，这样后面创建出的进程可以直接被放入运行队列并由调度器管理。

### 3. sched_init

sched_init（kern/schedule/sched.c）主要是调用 
list_init 初始化定时器链表，把全局调度类指针 sched_class 设为 default_sched_class（RR 调度），准备全局运行队列 rq 并设置最大时间片 max_time_slice，然后通过默认调度类的 init 函数 RR_init 初始化 rq->run_list 和 rq->proc_num，最后打印当前使用的调度类名字，从而完成对全局运行队列 rq 和调度类指针 sched_class 的初始化，为后续进程创建和调度做好准备。

### 4. default_sched_class 如何挂到调度框架上

在 sched.h 中，调度框架只依赖统一的抽象：struct sched_class 提供 init/enqueue/dequeue/pick_next/proc_tick 等回调，struct run_queue 保存 run_list、proc_num、max_time_slice 等队列信息；在 default_sched.c 中，这些回调由 RR_init/RR_enqueue/RR_dequeue/RR_pick_next/RR_proc_tick 实现，组成一个名为 default_sched_class 的调度类。sched_init 中把全局指针 sched_class 指向 default_sched_class，之后 wakeup_proc、时钟中断处理和 schedule 等通用代码都通过 sched_class 的函数指针间接调用 RR 策略，因此只要在初始化时把 sched_class 换成 stride_sched_class，就可以在同一框架下切换到 stride 调度，而无需修改其它调用逻辑。


## 进程调度流程
```text
       +---------------------------+
       |   时钟到期 (IRQ_S_TIMER)  |
       +---------------------------+
                     |
                     v
           +-----------------+
           |   进入 trap()   |
           +-----------------+
                     |
                     v
      +------------------------------+
      | interrupt_handler():         |
      |  - clock_set_next_event()    |
      |  - ticks++                   |
      |  - sched_class_proc_tick(    |
      |        current )             |
      +------------------------------+
                     |
                     v
      +------------------------------+
      | 调度类的 proc_tick 回调      |
      | (RR_proc_tick /              |
      |  stride_proc_tick 等)：      |
      |  - current->time_slice--     |
      |  - 若 time_slice==0:         |
      |      current->need_resched=1 |
      +------------------------------+
                     |
                     v
           +-----------------+
           |   返回 trap()   |
           +-----------------+
                     |
                     v
      +------------------------------+
      | trap() 结束前：              |
      |  若返回用户态且              |
      |  current->need_resched==1    |
      |    -> 调用 schedule()        |
      +------------------------------+
                     |
                     v
      +------------------------------+
      |          schedule():         |
      | 1. current->need_resched=0   |
      | 2. 若 current 仍 RUNNABLE    |
      |    -> sched_class_enqueue(   |
      |          current )           |
      | 3. next =                    |
      |    sched_class_pick_next()   |
      | 4. 若 next != NULL:          |
      |    sched_class_dequeue(next) |
      |    否则 next = idleproc      |
      | 5. proc_run(next)            |
      +------------------------------+
                     |
                     v
       +---------------------------+
       |  切换到 next 继续运行     |
       +---------------------------+
```

### need_resched 标志位在调度过程中的作用
need_resched 是进程控制块中的一个布尔标志，表示“当前进程是否需要被重新调度”。调度类的 proc_tick 在时钟中断里根据时间片等条件将其置 1，进程主动让出 CPU 也会置 1；trap() 在返回用户态前只在 need_resched==1 时才调用 schedule()，而 schedule() 开头会清零该标志并根据当前状态决定是否重新入队。这样由中断/系统调用提出“调度请求”，由 trap() 在安全时机统一触发一次真正的调度，既保证了调度的及时性，又避免每次时钟中断都切换进程。


### 调度算法的切换机制

要添加一个新的调度算法（例如 stride 调度），在当前设计下主要只需两步：一是在调度模块中实现一个新的 struct sched_class（如 stride_sched_class），按接口填好 `init/enqueue/dequeue/pick_next/proc_tick` 并完成相关数据结构；二是在 sched_init 中把全局指针 `sched_class` 从 `&default_sched_class` 改为 `&stride_sched_class`（或按配置选择其一），再结合 lab6_set_priority 等接口为进程设置与新算法相关的优先级字段。之所以改动很小，是因为调度框架对外只暴露统一的 sched_class 抽象：wakeup_proc、schedule、trap 等通用代码都只通过 sched_class 指针调用这些回调，而不关心是 RR 还是 stride，从而实现了“策略（调度算法）与机制（调度框架和时钟中断）分离”。

### RR 调度类各函数实现思路

1. **RR_init**：只负责初始化运行队列本身。具体做法是调用 list_init 将 rq->run_list 置为空循环链表，并把 rq->proc_num 设为 0，不在这里设置时间片（由 sched_init 设置 rq->max_time_slice）。
2. **RR_enqueue**：实现“按 FIFO 入队”。在确保 proc 当前不在任何队列（run_link 为空）后，将 proc->run_link 插入到 rq->run_list 的尾部，同时为新进程分配时间片：如果 proc->time_slice 为 0 或大于 rq->max_time_slice，就重置为 rq->max_time_slice；再把 proc->rq 指向 rq，并将 rq->proc_num 加 1。
3. **RR_dequeue**：从运行队列中删除指定进程。先断言 proc 的 run_link 不为空且 proc->rq == rq，然后用 list_del_init 把它从 rq->run_list 中摘除，并将 rq->proc_num 减 1，不在这里修改时间片，只是维护队列一致性。
4. **RR_pick_next**：从队首选择下一个要运行的进程。具体就是取 rq->run_list 的第一个元素（list_next），如果不等于表头则用 le2proc 宏转换为 struct proc_struct 指针并返回，否则返回 NULL，表示当前没有可运行进程。
5. **RR_proc_tick**：在每个时钟中断时更新当前进程的时间片。若 proc->time_slice 大于 0，则将其减 1；当减到 0 时，将 proc->need_resched 置为 1，通知调度框架在合适的时机调用 schedule() 进行进程切换，从而实现简单的时间片轮转策略。

### 为什么选择特定的数据结构实现 RR 调度
这里的链表操作与 RR 调度策略对应关系是：RR_init 用 list_init 初始化双向循环链表表头；RR_enqueue 把进程插到表尾以实现 FIFO，且插入为 O(1)；RR_pick_next 直接取表头后第一个元素作为下一个进程，无需遍历；RR_dequeue 用 list_del_init 在 O(1) 时间删除任意节点并将其复位为“未在队列中”。这样既满足时间片轮转的先来先服务语义，又保证入队、出队、选取等核心操作都是 O(1)，符合内核调度对高效性的要求。

### RR 调度中的边界情况处理

在实现 RR 调度类时，几个关键的边界情况是这样处理的：首先，RR_enqueue 在插入前通过断言保证 proc 的 run_link 为空，防止同一进程被重复入队；RR_dequeue 则断言 proc->rq == rq，确保不会误从错误的运行队列删除进程。其次，RR_pick_next 在队列为空时会返回 NULL，schedule() 会在这种情况下自动选择 idleproc 运行，保证系统始终有“空闲进程”可调度。再次，RR_enqueue 会在入队时修正异常的 time_slice（为 0 或大于 max_time_slice 的情况），统一成合法区间，避免进程饿死或独占 CPU。最后，RR_proc_tick 只在时间片耗尽时将 need_resched 置 1，而不会在每次时钟中断都强制触发调度，这既保证了时间片用完一定会切换，又避免了过于频繁的上下文切换。

## 分析 Round Robin 调度算法的优缺点

Round Robin（RR）调度的优点是实现简单、开销小、所有进程轮流获得 CPU，能较好地兼顾交互任务的公平性和响应时间；缺点是不区分任务类型和优先级，在就绪进程很多时上下文切换频繁，整体吞吐量可能不如更复杂的调度算法。

时间片过大时系统趋近 FCFS、响应变差但切换少，时间片过小时响应很好但上下文切换开销大，因此需要在二者之间折中，本实验中通过 max_time_slice 来控制合适的时间片长度。

RR_proc_tick 在时间片减到 0 时设置 need_resched，用标志记录“该换人了”的请求，再由 trap() 在统一、安全的位置调用 schedule() 完成真正的进程切换，既保证时间片轮转语义，又避免在中断处理函数中直接切换带来的控制流混乱。

### 以 schedule() 为例比较 lab5 和 lab6

- lab5：直接遍历就绪队列 `proc_list` 选取 `PROC_RUNNABLE`；未命中则用 `idleproc`。不做入/出队抽象，策略内联在 `schedule()`。
- lab6：通过 `sched_class_enqueue/pick_next/dequeue` 与 `run_queue` 选择；当前仍可运行会先入队；为空回退 `idleproc`。流程与策略解耦。
- 结论：lab5 简单直接但难扩展；lab6 机制与策略分离，便于切换 RR/stride 等调度算法，扩展性更好。




















































































































































