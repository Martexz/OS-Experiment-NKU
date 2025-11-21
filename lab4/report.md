# 练习1：alloc_proc函数实现

## alloc_proc函数代码
```c
alloc_proc(void)
{
    struct proc_struct *proc = kmalloc(sizeof(struct proc_struct));
    if (proc != NULL)
    {
        proc->state = PROC_UNINIT;                          // 设置进程状态为未初始化
        proc->pid = -1;                                     // 未分配PID
        proc->runs = 0;                                     // 运行次数初始化为0
        proc->kstack = 0;                                   // 内核栈地址初始化为0
        proc->need_resched = 0;                             // 不需要调度
        proc->parent = NULL;                                // 父进程指针初始化为NULL
        proc->mm = NULL;                                    // 内存管理结构初始化为NULL
        memset(&(proc->context), 0, sizeof(struct context));// 初始化上下文为0
        proc->tf = NULL;                                    // 中断帧指针初始化为NULL
        proc->pgdir = boot_pgdir_pa;                        // 页目录表基址设置为内核页目录表
        proc->flags = 0;                                    // 进程标志初始化为0
        memset(proc->name, 0, PROC_NAME_LEN + 1);           // 进程名初始化为空字符串
    }
    return proc;
}

```

## alloc_proc函数的实现思路

1. **分配内存**：使用`kmalloc`为进程控制块分配内存空间
2. **初始化字段**：将进程控制块的各字段设置为初始状态，包括进程状态设为`PROC_UNINIT`（未初始化），pid设为-1（未分配），调度相关字段（`runs、need_resched`）清零，内存相关指针（`parent`、`mm`、`kstack`、`tf`）设为NULL/0，上下文和进程名清零，页目录指向内核页目录表`boot_pgdir_pa`
3. **返回指针**：返回初始化好的进程控制块指针（失败则返回 `NULL`）

## struct context 结构说明

`struct context context`的含义为**进程上下文**，保存的是进程在主动让出CPU（调用schedule() 进行进程切换）时需要保存的关键寄存器

其定义为：
```c
struct context {
    uintptr_t ra;   // 返回地址 (return address)
    uintptr_t sp;   // 栈指针 (stack pointer)
    uintptr_t s0;   // 被调用者保存寄存器 s0-s11
    uintptr_t s1;
    uintptr_t s2;
    uintptr_t s3;
    uintptr_t s4;
    uintptr_t s5;
    uintptr_t s6;
    uintptr_t s7;
    uintptr_t s8;
    uintptr_t s9;
    uintptr_t s10;
    uintptr_t s11;
};
```
在本次实验中该成员变量对进程切换(`switch_to`函数)具有重要作用：**保存当前进程的context以及恢复目标进程的context**，恢复 ra 寄存器(返回地址)，ret 会==跳转到目标进程上次被切换出去时的位置继续执行==

## struct trapframe 结构说明

`struct trapframe *tf`的含义为**中断帧**，保存的是进程在==被中断/异常打断时==的**完整CPU状态**，包括所有寄存器、程序计数器等。
其定义为：
```c
struct trapframe {
    struct pushregs gpr;  // 所有通用寄存器 (x0-x31)
    uintptr_t status;     // sstatus 寄存器
    uintptr_t epc;        // sepc (异常程序计数器)
    uintptr_t badvaddr;   // 出错的地址
    uintptr_t cause;      // scause (异常原因)
};
```
其作用为：
- 为新进程设置初始执行环境
在 `kernel_thread` 函数中，创建新进程时需要构造一个"人工的"trapframe
- 在进程内核栈上保存和传递执行状态
在 `copy_thread` 函数中，trapframe 被复制到新进程的内核栈顶
- 当时钟中断发生时,硬件自动跳转到中断入口,保存现场到 trapframe,调用C语言中断处理函数,从 trapframe 恢复

# 练习2：do_fork函数实现

## do_fork函数代码
```c
int do_fork(uint32_t clone_flags, uintptr_t stack, struct trapframe *tf)
{
    int ret = -E_NO_FREE_PROC;
    struct proc_struct *proc;
    if (nr_process >= MAX_PROCESS)
    {
        goto fork_out;
    }
    ret = -E_NO_MEM;

    if ((proc = alloc_proc()) == NULL) {
        goto fork_out;
    }

    // 设置父进程
    proc->parent = current;

    // 2. 调用 setup_kstack 为子进程分配内核栈
    if (setup_kstack(proc) != 0) {
        goto bad_fork_cleanup_proc;
    }

    // 3. 调用 copy_mm 复制或共享内存管理信息
    if (copy_mm(clone_flags, proc) != 0) {
        goto bad_fork_cleanup_kstack;
    }

    // 4. 调用 copy_thread 复制父进程的中断帧和上下文信息
    copy_thread(proc, stack, tf);

    // 5. 将新进程添加到进程列表和哈希表中
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        proc->pid = get_pid();              // 获取新的 PID
        hash_proc(proc);                    // 将进程加入哈希表
        list_add(&proc_list, &(proc->list_link)); // 将进程加入进程链表
        nr_process++;                       // 进程总数加1
    }
    local_intr_restore(intr_flag);

    // 6. 调用 wakeup_proc 使新进程处于就绪状态
    wakeup_proc(proc);

    // 7. 返回新进程的 PID
    ret = proc->pid;

fork_out:
    return ret;

bad_fork_cleanup_kstack:
    put_kstack(proc);
bad_fork_cleanup_proc:
    kfree(proc);
    goto fork_out;
}
```

## do_fork函数的实现逻辑

1. **检查资源**：检查进程数是否达到上限，达到则返回错误
2. **分配PCB**：调用`alloc_proc()`分配并初始化进程控制块，失败则返回错误
3. **设置父进程**：将当前进程设置为新进程的父进程
4. **分配内核栈**：调用`setup_kstack()`为子进程分配内核栈
5. **复制内存**：调用`copy_mm()`根据`clone_flags`复制或共享父进程的内存空间
6. **复制上下文**：调用`copy_thread()`复制父进程的中断帧和上下文信息，设置子进程的执行环境
7. **注册进程**：==关中断==，分配PID，将新进程加入哈希表和进程链表，进程数加1，==开中断==
8. **唤醒进程**：调用`wakeup_proc()`将新进程状态设为就绪态
9. **返回PID**：返回新进程的PID给父进程

**错误处理**：任何步骤失败都会跳转到相应的清理标签，==释放已分配的资源==后返回错误码

## ucore是否做到给每个新fork的线程一个唯一的id？
ucore 做到了为每个新 fork 的线程分配唯一的 ID，主要原因有以下三点：

### 1. get_pid() 函数的唯一性算法 
ucore中采用了PID分配机制(`get_pid()`函数),其算法逻辑为：
- 递增尝试：`last_pid++`，从上次分配位置继续
- 循环复用：如果 `last_pid >= MAX_PID`，则回绕到 1（PID 0 保留给 idle 进程）
- 冲突检测：遍历 `proc_list` 链表，检查是否有进程使用了 `last_pid`
- 冲突解决：如果发现冲突，继续递增 `last_pid` 并重新扫描
- 优化机制：`next_safe` 记录下一个已知的被占用 PID，避免重复扫描

### 2. 临界区保护
在`do_fork`函数中有以下代码：
```c
local_intr_save(intr_flag);
{
    proc->pid = get_pid();              // 原子获取 PID
    hash_proc(proc);                    // 加入哈希表
    list_add(&proc_list, &(proc->list_link)); // 加入进程链表
    nr_process++;
}
local_intr_restore(intr_flag);
```
PID 分配被放在临界区内,这确保了 PID 分配、进程加入链表是一个**不可分割的原子操作**，不会被中断打断，避免了竞态条件。

# 练习3：proc_run函数实现

## proc_run函数代码
```c
void proc_run(struct proc_struct *proc)
{
    if (proc != current)
    {
        bool intr_flag;
        struct proc_struct *prev = current, *next = proc;
        local_intr_save(intr_flag);                 // 禁用中断
        {
            current = proc;                         // 切换当前进程为要运行的进程
            lsatp(next->pgdir);                     // 切换页表，使用新进程的地址空间
            switch_to(&(prev->context), &(next->context)); // 实现上下文切换
        }
        local_intr_restore(intr_flag);              // 允许中断
    }
}
```

## proc_run函数的实现逻辑

1. **判断是否需要切换**：检查目标进程是否为当前进程，如果相同则无需切换，直接返回
2. **保存中断状态并关中断**：调用`local_intr_save()`关闭中断，保证进程切换的原子性，避免切换过程中被打断
3. **更新当前进程指针**：将全局变量`current`指向新进程
4. **切换页表**：调用`lsatp()`加载新进程的页目录表地址，切换到新进程的虚拟地址空间
5. **切换上下文**：调用`switch_to()`保存当前进程的寄存器状态到`prev->context`，并恢复新进程的寄存器状态从`next->context`，实现进程执行流的切换
6. **恢复中断状态**：调用`local_intr_restore()`恢复之前的中断状态

## 本次实验创建且运行了几个内核线程？
本次实验总共创建并运行了**两个内核线程**：

### 1. idleproc线程

其为**系统的空闲进程**，当没有其他进程需要运行时执行，运行 `cpu_idle()` 函数，不断检查 `current->need_resched`，如果需要调度就调用 `schedule()` 切换到其他进程

**创建方式**：在 `proc_init()` 函数中直接调用 `alloc_proc()` 创建

### 2. initproc线程

**第一个通过 `do_fork()` 创建的内核线程**，用于执行初始化工作，运行 `init_main()` 函数，打印输出信息

**创建方式**：在 `proc_init()` 函数中通过` kernel_thread(init_main, "Hello world!!", 0)` 创建

# 扩展练习
## 1. 说明语句`local_intr_save(intr_flag);....local_intr_restore(intr_flag);`是如何实现开关中断的？
-  `local_intr_save(intr_flag)`:
    - 保存状态：首先读取当前的 `sstatus` 寄存器，检查其中的 `SIE` (Supervisor Interrupt Enable) 位。如果 `SIE` 为 1（中断开启），则 `intr_flag` 被设为 1；否则设为 0。
    - 关闭中断：接着执行 `csrc sstatus, SSTATUS_SIE` 指令（通过 `intr_disable()`），将 `SIE` 位置 0，从而在硬件层面关闭 S 态的中断响应。

- `local_intr_restore(intr_flag)`:
   - 恢复状态：根据之前保存的 `intr_flag` 来决定操作。
    - 如果 `intr_flag` 为 1（说明进入前中断是开的），则执行 `csrs sstatus, SSTATUS_SIE`（通过 `intr_enable()`）重新开启中断。
    - 如果 `intr_flag` 为 0（说明进入前中断本来就是关的），则什么都不做，保持中断关闭状态。
---

## 2. 深入理解不同分页模式的工作原理 (思考题)

### 2.1 函数中有两段形式类似的代码， 结合sv32，sv39，sv48的异同，解释这两段代码为什么如此相像。

在 RISC-V 的多级页表机制中（无论是 Sv32 的二级、Sv39 的三级还是 Sv48 的四级），查找页表项（PTE）的逻辑是递归或迭代的，且每一级的处理逻辑高度一致。
-  `get_pte` 的任务是找到最后一级页表项。在多级页表中，除了最后一级指向物理页帧外，前面所有级别的页表项（PTE）都指向下一级页表的物理基址。
因为每一级“查表-判空-分配-下钻”的逻辑完全一样，所以代码看起来非常相似。

### 2.2 目前`get_pte()`函数将页表项的查找和页表项的分配合并在一个函数里，你认为这种写法好吗？有没有必要把两个功能拆开？

目前的写法是合理的，但拆开也可以。

**合并的好处：**
这样做很便利，当我们调用 `get_pte` 时，通常意图就是“我要往这个虚拟地址写东西，给我一个能用的 PTE”。如果不存在就自动创建，符合大多数使用场景。
如果拆开，调用者往往需要写成 `pte = find_pte(); if (!pte) pte = alloc_pte();`，这在多处调用时会产生重复的样板代码

**拆开的好处：**
查找（Query）和修改（Command/Alloc）是两种不同的操作。有时候我们只想查询一个地址是否已映射（例如调试器查看内存、内存统计），并不希望在查询时意外分配内存。目前的 `get_pte` 需要通过传参 `create=0` 来控制，接口略显复杂。拆开后，分配失败的处理逻辑可以由调用者更灵活地控制。