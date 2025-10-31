## 练习1
代码实现：
```cpp
case IRQ_S_TIMER:
    clock_set_next_event();
    ticks ++;
    static int num = 0;
    if (ticks % TICK_NUM == 0) {
        print_ticks();
        ticks = 0;
        num ++;
        if (num == 10)
            sbi_shutdown();
    }
    break;
```
运行结果：
```bash
# make qemu

OpenSBI v0.4 (Jul  2 2019 11:53:53)
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name          : QEMU Virt Machine
Platform HART Features : RV64ACDFIMSU
Platform Max HARTs     : 8
Current Hart           : 0
Firmware Base          : 0x80000000
Firmware Size          : 112 KB
Runtime SBI Version    : 0.1

PMP0: 0x0000000080000000-0x000000008001ffff (A)
PMP1: 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
DTB Init
HartID: 0
DTB Address: 0x82200000
Physical Memory from DTB:
  Base: 0x0000000080000000
  Size: 0x0000000008000000 (128 MB)
  End:  0x0000000087ffffff
DTB init completed
(THU.CST) os is loading ...
Special kernel symbols:
  entry  0xffffffffc0200054 (virtual)
  etext  0xffffffffc0201f2c (virtual)
  edata  0xffffffffc0206028 (virtual)
  end    0xffffffffc02064a0 (virtual)
Kernel executable memory footprint: 26KB
memory management: default_pmm_manager
physcial memory map:
  memory: 0x0000000008000000, [0x0000000080000000, 0x0000000087ffffff].
check_alloc_page() succeeded!
satp virtual address: 0xffffffffc0205000
satp physical address: 0x0000000080205000
++ setup timer interrupts
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
```

## 扩展练习 Challenge 1
### 1.1 ucore 处理中断的流程
1. 异常 / 中断产生：
os会执行以下流程:
- 保存关键状态：CPU将当前的 `pc` 保存到 `sepc`，异常原因保存到 `scause`，出错地址保存到 `stval`
- 更新状态寄存器：设置 `sstatus` 的 SPP 位（记录之前的特权级）
- 跳转到异常向量：CPU跳转到 `stvec` 寄存器指向的地址（即 __alltraps）

2. 通过`__alltraps` 处理
```asm
__alltraps:
    SAVE_ALL              # 保存所有通用寄存器到栈上
    move a0, sp           # 将栈指针sp的值传给a0作为参数
    jal trap              # 调用trap()函数处理
    __trapret:
    RESTORE_ALL           # 恢复所有寄存器
    sret                  # 从异常返回
```

3. `trap()` 进行路由，来判断是中断 / 异常

4. return 阶段，主要操作是恢复所有寄存器，然后`sret`或`mret`使 `pc` 回复到 `sepc`，并回复特权级

### 1.2 `mov a0, sp`的目的
将 trapframe 的地址作为参数传递给 trap() 函数。因为在 `SAVE_ALL` 执行后，栈上已经构建好了完整的 `struct trapframe` 结构, `sp` 此时指向这个 `trapframe` 的起始地址, `move a0, sp` 将栈指针赋值给 `a0` 寄存器，而 `a0` 正好为 riscv 的第一个函数参数，因此 `trap()` 函数就可以读取修改所有寄存器的状态

### 1.3 SAVE_ALL 中寄存器保存位置的确定
由 `struct trapframe` 的结构定义决定。

`SAVE_ALL` 中首先为整个 `trapframe` 分配栈空间，由于 c 语言的结构体成员在分配内存中是按照定义顺序连续占据的，在内存中即从高到低地址依次存储，因此最后 `sp` 指向了 `trapframe` 的起始位置

### 1.4 __alltraps 中都需要保存所有寄存器吗
需要的，因为在这个极小型os中，始终要保持上下文的完整性，中断或异常可能发生在任意时刻，如果不保存某个寄存器，那么在调用 `trap()` 处理后，未保存的寄存器的值可能会发生改变，从而影响其他能够正常运行的函数

## 2. 扩展练习 Challenge 2
### 2.1 `csrw sscratch, sp；csrrw s0, sscratch, x0`
实现的操作有：
- `csrw sscratch, sp`

    异常刚发生时，sp 还是用户态/被中断代码的栈指针，先把这个原始的 sp 临时保存到 sscratch CSR 中，因为接下来要修改 sp 来分配 trapframe 空间

经过中间步骤：`addi sp, sp, -36 * REGBYTES`，此时 sp 已经改变，指向 trapframe 的底部
- `csrrw s0, sscratch, x0`

`csrrw` 指令读取 `sscratch`（原始sp）到 `s0`，同时将 `x0`（值为0）写入 `sscratch`，然后执行 `STORE s0, 2*REGBYTES(sp)` 将原始sp保存到 `trapframe`。 这里的`sscratch` 设为 0 是为了告诉 os 已经在处理异常

### 2.2 为什么保存 `stval、scause` 等 CSR 但不恢复
因为`stval`是保存的错误地址，`scause`是错误的原因，这两者在之后的恢复过程中不影响 os 的正常运行，而是在处理错误时候作为输出信息和引导错误路由存在，在之后捕获新的错误后会被覆盖，因此没有必要恢复

## 3. 扩展练习 Challenge 3
完善两条异常处理
```cpp
case CAUSE_ILLEGAL_INSTRUCTION:
    cprintf("Exception type: Illegal instruction\n");
    cprintf("Illegal instruction caught at 0x%08x\n", tf->epc);
    tf->epc += 4;
    break;

case CAUSE_BREAKPOINT:
    cprintf("Exception type: breakpoint\n"); 
    cprintf("ebreak caught at 0x%08x\n", tf->epc);  
    tf->epc += 2; // 启用了 C 扩展（压缩指令集), ebreak 是 2 bytes
    break;
```

测试结果：
```bash
root@Martexz:~/labcode/lab3# make qemu
+ cc kern/trap/trap.c
+ ld bin/kernel
~/riscv64-unknown-elf-toolchain-10.2.0/bin/riscv64-unknown-elf-objcopy bin/kernel --strip-all -O binary bin/ucore.img

OpenSBI v0.4 (Jul  2 2019 11:53:53)
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name          : QEMU Virt Machine
Platform HART Features : RV64ACDFIMSU
Platform Max HARTs     : 8
Current Hart           : 0
Firmware Base          : 0x80000000
Firmware Size          : 112 KB
Runtime SBI Version    : 0.1

PMP0: 0x0000000080000000-0x000000008001ffff (A)
PMP1: 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
DTB Init
HartID: 0
DTB Address: 0x82200000
Physical Memory from DTB:
  Base: 0x0000000080000000
  Size: 0x0000000008000000 (128 MB)
  End:  0x0000000087ffffff
DTB init completed
(THU.CST) os is loading ...
Special kernel symbols:
  entry  0xffffffffc0200054 (virtual)
  etext  0xffffffffc0201fb4 (virtual)
  edata  0xffffffffc0207028 (virtual)
  end    0xffffffffc02074a0 (virtual)
Kernel executable memory footprint: 30KB
memory management: default_pmm_manager
physcial memory map:
  memory: 0x0000000008000000, [0x0000000080000000, 0x0000000087ffffff].
check_alloc_page() succeeded!
satp virtual address: 0xffffffffc0206000
satp physical address: 0x0000000080206000
Exception type: breakpoint
ebreak caught at 0xc0200094
Exception type: Illegal instruction
Illegal instruction caught at 0xc0200096
++ setup timer interrupts
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks
```