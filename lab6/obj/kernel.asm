
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
    .globl kern_entry
kern_entry:
    # a0: hartid
    # a1: dtb physical address
    # save hartid and dtb address
    la t0, boot_hartid
ffffffffc0200000:	0000c297          	auipc	t0,0xc
ffffffffc0200004:	00028293          	mv	t0,t0
    sd a0, 0(t0)
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc020c000 <boot_hartid>
    la t0, boot_dtb
ffffffffc020000c:	0000c297          	auipc	t0,0xc
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc020c008 <boot_dtb>
    sd a1, 0(t0)
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)

    # t0 := 三级页表的虚拟地址
    lui     t0, %hi(boot_page_table_sv39)
ffffffffc0200018:	c020b2b7          	lui	t0,0xc020b
    # t1 := 0xffffffff40000000 即虚实映射偏移量
    li      t1, 0xffffffffc0000000 - 0x80000000
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
    # t0 减去虚实映射偏移量 0xffffffff40000000，变为三级页表的物理地址
    sub     t0, t0, t1
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
    # t0 >>= 12，变为三级页表的物理页号
    srli    t0, t0, 12
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc

    # t1 := 8 << 60，设置 satp 的 MODE 字段为 Sv39
    li      t1, 8 << 60
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
    # 将刚才计算出的预设三级页表物理页号附加到 satp 中
    or      t0, t0, t1
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
    # 将算出的 t0(即新的MODE|页表基址物理页号) 覆盖到 satp 中
    csrw    satp, t0
ffffffffc0200034:	18029073          	csrw	satp,t0
    # 使用 sfence.vma 指令刷新 TLB
    sfence.vma
ffffffffc0200038:	12000073          	sfence.vma
    # 从此，我们给内核搭建出了一个完美的虚拟内存空间！
    #nop # 可能映射的位置有些bug。。插入一个nop
    
    # 我们在虚拟内存空间中：随意将 sp 设置为虚拟地址！
    lui sp, %hi(bootstacktop)
ffffffffc020003c:	c020b137          	lui	sp,0xc020b

    # 我们在虚拟内存空间中：随意跳转到虚拟地址！
    # 跳转到 kern_init
    lui t0, %hi(kern_init)
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
    addi t0, t0, %lo(kern_init)
ffffffffc0200044:	04a28293          	addi	t0,t0,74 # ffffffffc020004a <kern_init>
    jr t0
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <kern_init>:
void grade_backtrace(void);

int kern_init(void)
{
    extern char edata[], end[];
    memset(edata, 0, end - edata);
ffffffffc020004a:	000c2517          	auipc	a0,0xc2
ffffffffc020004e:	5fe50513          	addi	a0,a0,1534 # ffffffffc02c2648 <buf>
ffffffffc0200052:	000c7617          	auipc	a2,0xc7
ffffffffc0200056:	ad660613          	addi	a2,a2,-1322 # ffffffffc02c6b28 <end>
{
ffffffffc020005a:	1141                	addi	sp,sp,-16
    memset(edata, 0, end - edata);
ffffffffc020005c:	8e09                	sub	a2,a2,a0
ffffffffc020005e:	4581                	li	a1,0
{
ffffffffc0200060:	e406                	sd	ra,8(sp)
    memset(edata, 0, end - edata);
ffffffffc0200062:	3f1050ef          	jal	ra,ffffffffc0205c52 <memset>
    cons_init(); // init the console
ffffffffc0200066:	520000ef          	jal	ra,ffffffffc0200586 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
    cprintf("%s\n\n", message);
ffffffffc020006a:	00006597          	auipc	a1,0x6
ffffffffc020006e:	c1658593          	addi	a1,a1,-1002 # ffffffffc0205c80 <etext+0x4>
ffffffffc0200072:	00006517          	auipc	a0,0x6
ffffffffc0200076:	c2e50513          	addi	a0,a0,-978 # ffffffffc0205ca0 <etext+0x24>
ffffffffc020007a:	11e000ef          	jal	ra,ffffffffc0200198 <cprintf>

    print_kerninfo();
ffffffffc020007e:	1a2000ef          	jal	ra,ffffffffc0200220 <print_kerninfo>

    // grade_backtrace();

    dtb_init(); // init dtb
ffffffffc0200082:	576000ef          	jal	ra,ffffffffc02005f8 <dtb_init>

    pmm_init(); // init physical memory management
ffffffffc0200086:	5cc020ef          	jal	ra,ffffffffc0202652 <pmm_init>

    pic_init(); // init interrupt controller
ffffffffc020008a:	12b000ef          	jal	ra,ffffffffc02009b4 <pic_init>
    idt_init(); // init interrupt descriptor table
ffffffffc020008e:	129000ef          	jal	ra,ffffffffc02009b6 <idt_init>

    vmm_init(); // init virtual memory management
ffffffffc0200092:	099030ef          	jal	ra,ffffffffc020392a <vmm_init>
    sched_init();
ffffffffc0200096:	452050ef          	jal	ra,ffffffffc02054e8 <sched_init>
    proc_init(); // init process table
ffffffffc020009a:	4df040ef          	jal	ra,ffffffffc0204d78 <proc_init>

    clock_init();  // init clock interrupt
ffffffffc020009e:	4a0000ef          	jal	ra,ffffffffc020053e <clock_init>
    intr_enable(); // enable irq interrupt
ffffffffc02000a2:	107000ef          	jal	ra,ffffffffc02009a8 <intr_enable>

    cpu_idle(); // run idle process
ffffffffc02000a6:	66b040ef          	jal	ra,ffffffffc0204f10 <cpu_idle>

ffffffffc02000aa <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
ffffffffc02000aa:	715d                	addi	sp,sp,-80
ffffffffc02000ac:	e486                	sd	ra,72(sp)
ffffffffc02000ae:	e0a6                	sd	s1,64(sp)
ffffffffc02000b0:	fc4a                	sd	s2,56(sp)
ffffffffc02000b2:	f84e                	sd	s3,48(sp)
ffffffffc02000b4:	f452                	sd	s4,40(sp)
ffffffffc02000b6:	f056                	sd	s5,32(sp)
ffffffffc02000b8:	ec5a                	sd	s6,24(sp)
ffffffffc02000ba:	e85e                	sd	s7,16(sp)
    if (prompt != NULL) {
ffffffffc02000bc:	c901                	beqz	a0,ffffffffc02000cc <readline+0x22>
ffffffffc02000be:	85aa                	mv	a1,a0
        cprintf("%s", prompt);
ffffffffc02000c0:	00006517          	auipc	a0,0x6
ffffffffc02000c4:	be850513          	addi	a0,a0,-1048 # ffffffffc0205ca8 <etext+0x2c>
ffffffffc02000c8:	0d0000ef          	jal	ra,ffffffffc0200198 <cprintf>
readline(const char *prompt) {
ffffffffc02000cc:	4481                	li	s1,0
    while (1) {
        c = getchar();
        if (c < 0) {
            return NULL;
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc02000ce:	497d                	li	s2,31
            cputchar(c);
            buf[i ++] = c;
        }
        else if (c == '\b' && i > 0) {
ffffffffc02000d0:	49a1                	li	s3,8
            cputchar(c);
            i --;
        }
        else if (c == '\n' || c == '\r') {
ffffffffc02000d2:	4aa9                	li	s5,10
ffffffffc02000d4:	4b35                	li	s6,13
            buf[i ++] = c;
ffffffffc02000d6:	000c2b97          	auipc	s7,0xc2
ffffffffc02000da:	572b8b93          	addi	s7,s7,1394 # ffffffffc02c2648 <buf>
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc02000de:	3fe00a13          	li	s4,1022
        c = getchar();
ffffffffc02000e2:	12e000ef          	jal	ra,ffffffffc0200210 <getchar>
        if (c < 0) {
ffffffffc02000e6:	00054a63          	bltz	a0,ffffffffc02000fa <readline+0x50>
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc02000ea:	00a95a63          	bge	s2,a0,ffffffffc02000fe <readline+0x54>
ffffffffc02000ee:	029a5263          	bge	s4,s1,ffffffffc0200112 <readline+0x68>
        c = getchar();
ffffffffc02000f2:	11e000ef          	jal	ra,ffffffffc0200210 <getchar>
        if (c < 0) {
ffffffffc02000f6:	fe055ae3          	bgez	a0,ffffffffc02000ea <readline+0x40>
            return NULL;
ffffffffc02000fa:	4501                	li	a0,0
ffffffffc02000fc:	a091                	j	ffffffffc0200140 <readline+0x96>
        else if (c == '\b' && i > 0) {
ffffffffc02000fe:	03351463          	bne	a0,s3,ffffffffc0200126 <readline+0x7c>
ffffffffc0200102:	e8a9                	bnez	s1,ffffffffc0200154 <readline+0xaa>
        c = getchar();
ffffffffc0200104:	10c000ef          	jal	ra,ffffffffc0200210 <getchar>
        if (c < 0) {
ffffffffc0200108:	fe0549e3          	bltz	a0,ffffffffc02000fa <readline+0x50>
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc020010c:	fea959e3          	bge	s2,a0,ffffffffc02000fe <readline+0x54>
ffffffffc0200110:	4481                	li	s1,0
            cputchar(c);
ffffffffc0200112:	e42a                	sd	a0,8(sp)
ffffffffc0200114:	0ba000ef          	jal	ra,ffffffffc02001ce <cputchar>
            buf[i ++] = c;
ffffffffc0200118:	6522                	ld	a0,8(sp)
ffffffffc020011a:	009b87b3          	add	a5,s7,s1
ffffffffc020011e:	2485                	addiw	s1,s1,1
ffffffffc0200120:	00a78023          	sb	a0,0(a5)
ffffffffc0200124:	bf7d                	j	ffffffffc02000e2 <readline+0x38>
        else if (c == '\n' || c == '\r') {
ffffffffc0200126:	01550463          	beq	a0,s5,ffffffffc020012e <readline+0x84>
ffffffffc020012a:	fb651ce3          	bne	a0,s6,ffffffffc02000e2 <readline+0x38>
            cputchar(c);
ffffffffc020012e:	0a0000ef          	jal	ra,ffffffffc02001ce <cputchar>
            buf[i] = '\0';
ffffffffc0200132:	000c2517          	auipc	a0,0xc2
ffffffffc0200136:	51650513          	addi	a0,a0,1302 # ffffffffc02c2648 <buf>
ffffffffc020013a:	94aa                	add	s1,s1,a0
ffffffffc020013c:	00048023          	sb	zero,0(s1)
            return buf;
        }
    }
}
ffffffffc0200140:	60a6                	ld	ra,72(sp)
ffffffffc0200142:	6486                	ld	s1,64(sp)
ffffffffc0200144:	7962                	ld	s2,56(sp)
ffffffffc0200146:	79c2                	ld	s3,48(sp)
ffffffffc0200148:	7a22                	ld	s4,40(sp)
ffffffffc020014a:	7a82                	ld	s5,32(sp)
ffffffffc020014c:	6b62                	ld	s6,24(sp)
ffffffffc020014e:	6bc2                	ld	s7,16(sp)
ffffffffc0200150:	6161                	addi	sp,sp,80
ffffffffc0200152:	8082                	ret
            cputchar(c);
ffffffffc0200154:	4521                	li	a0,8
ffffffffc0200156:	078000ef          	jal	ra,ffffffffc02001ce <cputchar>
            i --;
ffffffffc020015a:	34fd                	addiw	s1,s1,-1
ffffffffc020015c:	b759                	j	ffffffffc02000e2 <readline+0x38>

ffffffffc020015e <cputch>:
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt)
{
ffffffffc020015e:	1141                	addi	sp,sp,-16
ffffffffc0200160:	e022                	sd	s0,0(sp)
ffffffffc0200162:	e406                	sd	ra,8(sp)
ffffffffc0200164:	842e                	mv	s0,a1
    cons_putc(c);
ffffffffc0200166:	422000ef          	jal	ra,ffffffffc0200588 <cons_putc>
    (*cnt)++;
ffffffffc020016a:	401c                	lw	a5,0(s0)
}
ffffffffc020016c:	60a2                	ld	ra,8(sp)
    (*cnt)++;
ffffffffc020016e:	2785                	addiw	a5,a5,1
ffffffffc0200170:	c01c                	sw	a5,0(s0)
}
ffffffffc0200172:	6402                	ld	s0,0(sp)
ffffffffc0200174:	0141                	addi	sp,sp,16
ffffffffc0200176:	8082                	ret

ffffffffc0200178 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int vcprintf(const char *fmt, va_list ap)
{
ffffffffc0200178:	1101                	addi	sp,sp,-32
ffffffffc020017a:	862a                	mv	a2,a0
ffffffffc020017c:	86ae                	mv	a3,a1
    int cnt = 0;
    vprintfmt((void *)cputch, &cnt, fmt, ap);
ffffffffc020017e:	00000517          	auipc	a0,0x0
ffffffffc0200182:	fe050513          	addi	a0,a0,-32 # ffffffffc020015e <cputch>
ffffffffc0200186:	006c                	addi	a1,sp,12
{
ffffffffc0200188:	ec06                	sd	ra,24(sp)
    int cnt = 0;
ffffffffc020018a:	c602                	sw	zero,12(sp)
    vprintfmt((void *)cputch, &cnt, fmt, ap);
ffffffffc020018c:	6a2050ef          	jal	ra,ffffffffc020582e <vprintfmt>
    return cnt;
}
ffffffffc0200190:	60e2                	ld	ra,24(sp)
ffffffffc0200192:	4532                	lw	a0,12(sp)
ffffffffc0200194:	6105                	addi	sp,sp,32
ffffffffc0200196:	8082                	ret

ffffffffc0200198 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int cprintf(const char *fmt, ...)
{
ffffffffc0200198:	711d                	addi	sp,sp,-96
    va_list ap;
    int cnt;
    va_start(ap, fmt);
ffffffffc020019a:	02810313          	addi	t1,sp,40 # ffffffffc020b028 <boot_page_table_sv39+0x28>
{
ffffffffc020019e:	8e2a                	mv	t3,a0
ffffffffc02001a0:	f42e                	sd	a1,40(sp)
ffffffffc02001a2:	f832                	sd	a2,48(sp)
ffffffffc02001a4:	fc36                	sd	a3,56(sp)
    vprintfmt((void *)cputch, &cnt, fmt, ap);
ffffffffc02001a6:	00000517          	auipc	a0,0x0
ffffffffc02001aa:	fb850513          	addi	a0,a0,-72 # ffffffffc020015e <cputch>
ffffffffc02001ae:	004c                	addi	a1,sp,4
ffffffffc02001b0:	869a                	mv	a3,t1
ffffffffc02001b2:	8672                	mv	a2,t3
{
ffffffffc02001b4:	ec06                	sd	ra,24(sp)
ffffffffc02001b6:	e0ba                	sd	a4,64(sp)
ffffffffc02001b8:	e4be                	sd	a5,72(sp)
ffffffffc02001ba:	e8c2                	sd	a6,80(sp)
ffffffffc02001bc:	ecc6                	sd	a7,88(sp)
    va_start(ap, fmt);
ffffffffc02001be:	e41a                	sd	t1,8(sp)
    int cnt = 0;
ffffffffc02001c0:	c202                	sw	zero,4(sp)
    vprintfmt((void *)cputch, &cnt, fmt, ap);
ffffffffc02001c2:	66c050ef          	jal	ra,ffffffffc020582e <vprintfmt>
    cnt = vcprintf(fmt, ap);
    va_end(ap);
    return cnt;
}
ffffffffc02001c6:	60e2                	ld	ra,24(sp)
ffffffffc02001c8:	4512                	lw	a0,4(sp)
ffffffffc02001ca:	6125                	addi	sp,sp,96
ffffffffc02001cc:	8082                	ret

ffffffffc02001ce <cputchar>:

/* cputchar - writes a single character to stdout */
void cputchar(int c)
{
    cons_putc(c);
ffffffffc02001ce:	ae6d                	j	ffffffffc0200588 <cons_putc>

ffffffffc02001d0 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int cputs(const char *str)
{
ffffffffc02001d0:	1101                	addi	sp,sp,-32
ffffffffc02001d2:	e822                	sd	s0,16(sp)
ffffffffc02001d4:	ec06                	sd	ra,24(sp)
ffffffffc02001d6:	e426                	sd	s1,8(sp)
ffffffffc02001d8:	842a                	mv	s0,a0
    int cnt = 0;
    char c;
    while ((c = *str++) != '\0')
ffffffffc02001da:	00054503          	lbu	a0,0(a0)
ffffffffc02001de:	c51d                	beqz	a0,ffffffffc020020c <cputs+0x3c>
ffffffffc02001e0:	0405                	addi	s0,s0,1
ffffffffc02001e2:	4485                	li	s1,1
ffffffffc02001e4:	9c81                	subw	s1,s1,s0
    cons_putc(c);
ffffffffc02001e6:	3a2000ef          	jal	ra,ffffffffc0200588 <cons_putc>
    while ((c = *str++) != '\0')
ffffffffc02001ea:	00044503          	lbu	a0,0(s0)
ffffffffc02001ee:	008487bb          	addw	a5,s1,s0
ffffffffc02001f2:	0405                	addi	s0,s0,1
ffffffffc02001f4:	f96d                	bnez	a0,ffffffffc02001e6 <cputs+0x16>
    (*cnt)++;
ffffffffc02001f6:	0017841b          	addiw	s0,a5,1
    cons_putc(c);
ffffffffc02001fa:	4529                	li	a0,10
ffffffffc02001fc:	38c000ef          	jal	ra,ffffffffc0200588 <cons_putc>
    {
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
    return cnt;
}
ffffffffc0200200:	60e2                	ld	ra,24(sp)
ffffffffc0200202:	8522                	mv	a0,s0
ffffffffc0200204:	6442                	ld	s0,16(sp)
ffffffffc0200206:	64a2                	ld	s1,8(sp)
ffffffffc0200208:	6105                	addi	sp,sp,32
ffffffffc020020a:	8082                	ret
    while ((c = *str++) != '\0')
ffffffffc020020c:	4405                	li	s0,1
ffffffffc020020e:	b7f5                	j	ffffffffc02001fa <cputs+0x2a>

ffffffffc0200210 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int getchar(void)
{
ffffffffc0200210:	1141                	addi	sp,sp,-16
ffffffffc0200212:	e406                	sd	ra,8(sp)
    int c;
    while ((c = cons_getc()) == 0)
ffffffffc0200214:	3a8000ef          	jal	ra,ffffffffc02005bc <cons_getc>
ffffffffc0200218:	dd75                	beqz	a0,ffffffffc0200214 <getchar+0x4>
        /* do nothing */;
    return c;
}
ffffffffc020021a:	60a2                	ld	ra,8(sp)
ffffffffc020021c:	0141                	addi	sp,sp,16
ffffffffc020021e:	8082                	ret

ffffffffc0200220 <print_kerninfo>:
/* *
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void print_kerninfo(void) {
ffffffffc0200220:	1141                	addi	sp,sp,-16
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
ffffffffc0200222:	00006517          	auipc	a0,0x6
ffffffffc0200226:	a8e50513          	addi	a0,a0,-1394 # ffffffffc0205cb0 <etext+0x34>
void print_kerninfo(void) {
ffffffffc020022a:	e406                	sd	ra,8(sp)
    cprintf("Special kernel symbols:\n");
ffffffffc020022c:	f6dff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  entry  0x%08x (virtual)\n", kern_init);
ffffffffc0200230:	00000597          	auipc	a1,0x0
ffffffffc0200234:	e1a58593          	addi	a1,a1,-486 # ffffffffc020004a <kern_init>
ffffffffc0200238:	00006517          	auipc	a0,0x6
ffffffffc020023c:	a9850513          	addi	a0,a0,-1384 # ffffffffc0205cd0 <etext+0x54>
ffffffffc0200240:	f59ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  etext  0x%08x (virtual)\n", etext);
ffffffffc0200244:	00006597          	auipc	a1,0x6
ffffffffc0200248:	a3858593          	addi	a1,a1,-1480 # ffffffffc0205c7c <etext>
ffffffffc020024c:	00006517          	auipc	a0,0x6
ffffffffc0200250:	aa450513          	addi	a0,a0,-1372 # ffffffffc0205cf0 <etext+0x74>
ffffffffc0200254:	f45ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  edata  0x%08x (virtual)\n", edata);
ffffffffc0200258:	000c2597          	auipc	a1,0xc2
ffffffffc020025c:	3f058593          	addi	a1,a1,1008 # ffffffffc02c2648 <buf>
ffffffffc0200260:	00006517          	auipc	a0,0x6
ffffffffc0200264:	ab050513          	addi	a0,a0,-1360 # ffffffffc0205d10 <etext+0x94>
ffffffffc0200268:	f31ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  end    0x%08x (virtual)\n", end);
ffffffffc020026c:	000c7597          	auipc	a1,0xc7
ffffffffc0200270:	8bc58593          	addi	a1,a1,-1860 # ffffffffc02c6b28 <end>
ffffffffc0200274:	00006517          	auipc	a0,0x6
ffffffffc0200278:	abc50513          	addi	a0,a0,-1348 # ffffffffc0205d30 <etext+0xb4>
ffffffffc020027c:	f1dff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n",
            (end - kern_init + 1023) / 1024);
ffffffffc0200280:	000c7597          	auipc	a1,0xc7
ffffffffc0200284:	ca758593          	addi	a1,a1,-857 # ffffffffc02c6f27 <end+0x3ff>
ffffffffc0200288:	00000797          	auipc	a5,0x0
ffffffffc020028c:	dc278793          	addi	a5,a5,-574 # ffffffffc020004a <kern_init>
ffffffffc0200290:	40f587b3          	sub	a5,a1,a5
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc0200294:	43f7d593          	srai	a1,a5,0x3f
}
ffffffffc0200298:	60a2                	ld	ra,8(sp)
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc020029a:	3ff5f593          	andi	a1,a1,1023
ffffffffc020029e:	95be                	add	a1,a1,a5
ffffffffc02002a0:	85a9                	srai	a1,a1,0xa
ffffffffc02002a2:	00006517          	auipc	a0,0x6
ffffffffc02002a6:	aae50513          	addi	a0,a0,-1362 # ffffffffc0205d50 <etext+0xd4>
}
ffffffffc02002aa:	0141                	addi	sp,sp,16
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc02002ac:	b5f5                	j	ffffffffc0200198 <cprintf>

ffffffffc02002ae <print_stackframe>:
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before
 * jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the
 * boundary.
 * */
void print_stackframe(void) {
ffffffffc02002ae:	1141                	addi	sp,sp,-16
    panic("Not Implemented!");
ffffffffc02002b0:	00006617          	auipc	a2,0x6
ffffffffc02002b4:	ad060613          	addi	a2,a2,-1328 # ffffffffc0205d80 <etext+0x104>
ffffffffc02002b8:	04d00593          	li	a1,77
ffffffffc02002bc:	00006517          	auipc	a0,0x6
ffffffffc02002c0:	adc50513          	addi	a0,a0,-1316 # ffffffffc0205d98 <etext+0x11c>
void print_stackframe(void) {
ffffffffc02002c4:	e406                	sd	ra,8(sp)
    panic("Not Implemented!");
ffffffffc02002c6:	1cc000ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02002ca <mon_help>:
    }
}

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
ffffffffc02002ca:	1141                	addi	sp,sp,-16
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
ffffffffc02002cc:	00006617          	auipc	a2,0x6
ffffffffc02002d0:	ae460613          	addi	a2,a2,-1308 # ffffffffc0205db0 <etext+0x134>
ffffffffc02002d4:	00006597          	auipc	a1,0x6
ffffffffc02002d8:	afc58593          	addi	a1,a1,-1284 # ffffffffc0205dd0 <etext+0x154>
ffffffffc02002dc:	00006517          	auipc	a0,0x6
ffffffffc02002e0:	afc50513          	addi	a0,a0,-1284 # ffffffffc0205dd8 <etext+0x15c>
mon_help(int argc, char **argv, struct trapframe *tf) {
ffffffffc02002e4:	e406                	sd	ra,8(sp)
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
ffffffffc02002e6:	eb3ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
ffffffffc02002ea:	00006617          	auipc	a2,0x6
ffffffffc02002ee:	afe60613          	addi	a2,a2,-1282 # ffffffffc0205de8 <etext+0x16c>
ffffffffc02002f2:	00006597          	auipc	a1,0x6
ffffffffc02002f6:	b1e58593          	addi	a1,a1,-1250 # ffffffffc0205e10 <etext+0x194>
ffffffffc02002fa:	00006517          	auipc	a0,0x6
ffffffffc02002fe:	ade50513          	addi	a0,a0,-1314 # ffffffffc0205dd8 <etext+0x15c>
ffffffffc0200302:	e97ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
ffffffffc0200306:	00006617          	auipc	a2,0x6
ffffffffc020030a:	b1a60613          	addi	a2,a2,-1254 # ffffffffc0205e20 <etext+0x1a4>
ffffffffc020030e:	00006597          	auipc	a1,0x6
ffffffffc0200312:	b3258593          	addi	a1,a1,-1230 # ffffffffc0205e40 <etext+0x1c4>
ffffffffc0200316:	00006517          	auipc	a0,0x6
ffffffffc020031a:	ac250513          	addi	a0,a0,-1342 # ffffffffc0205dd8 <etext+0x15c>
ffffffffc020031e:	e7bff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    }
    return 0;
}
ffffffffc0200322:	60a2                	ld	ra,8(sp)
ffffffffc0200324:	4501                	li	a0,0
ffffffffc0200326:	0141                	addi	sp,sp,16
ffffffffc0200328:	8082                	ret

ffffffffc020032a <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
ffffffffc020032a:	1141                	addi	sp,sp,-16
ffffffffc020032c:	e406                	sd	ra,8(sp)
    print_kerninfo();
ffffffffc020032e:	ef3ff0ef          	jal	ra,ffffffffc0200220 <print_kerninfo>
    return 0;
}
ffffffffc0200332:	60a2                	ld	ra,8(sp)
ffffffffc0200334:	4501                	li	a0,0
ffffffffc0200336:	0141                	addi	sp,sp,16
ffffffffc0200338:	8082                	ret

ffffffffc020033a <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
ffffffffc020033a:	1141                	addi	sp,sp,-16
ffffffffc020033c:	e406                	sd	ra,8(sp)
    print_stackframe();
ffffffffc020033e:	f71ff0ef          	jal	ra,ffffffffc02002ae <print_stackframe>
    return 0;
}
ffffffffc0200342:	60a2                	ld	ra,8(sp)
ffffffffc0200344:	4501                	li	a0,0
ffffffffc0200346:	0141                	addi	sp,sp,16
ffffffffc0200348:	8082                	ret

ffffffffc020034a <kmonitor>:
kmonitor(struct trapframe *tf) {
ffffffffc020034a:	7115                	addi	sp,sp,-224
ffffffffc020034c:	ed5e                	sd	s7,152(sp)
ffffffffc020034e:	8baa                	mv	s7,a0
    cprintf("Welcome to the kernel debug monitor!!\n");
ffffffffc0200350:	00006517          	auipc	a0,0x6
ffffffffc0200354:	b0050513          	addi	a0,a0,-1280 # ffffffffc0205e50 <etext+0x1d4>
kmonitor(struct trapframe *tf) {
ffffffffc0200358:	ed86                	sd	ra,216(sp)
ffffffffc020035a:	e9a2                	sd	s0,208(sp)
ffffffffc020035c:	e5a6                	sd	s1,200(sp)
ffffffffc020035e:	e1ca                	sd	s2,192(sp)
ffffffffc0200360:	fd4e                	sd	s3,184(sp)
ffffffffc0200362:	f952                	sd	s4,176(sp)
ffffffffc0200364:	f556                	sd	s5,168(sp)
ffffffffc0200366:	f15a                	sd	s6,160(sp)
ffffffffc0200368:	e962                	sd	s8,144(sp)
ffffffffc020036a:	e566                	sd	s9,136(sp)
ffffffffc020036c:	e16a                	sd	s10,128(sp)
    cprintf("Welcome to the kernel debug monitor!!\n");
ffffffffc020036e:	e2bff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
ffffffffc0200372:	00006517          	auipc	a0,0x6
ffffffffc0200376:	b0650513          	addi	a0,a0,-1274 # ffffffffc0205e78 <etext+0x1fc>
ffffffffc020037a:	e1fff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    if (tf != NULL) {
ffffffffc020037e:	000b8563          	beqz	s7,ffffffffc0200388 <kmonitor+0x3e>
        print_trapframe(tf);
ffffffffc0200382:	855e                	mv	a0,s7
ffffffffc0200384:	01b000ef          	jal	ra,ffffffffc0200b9e <print_trapframe>
ffffffffc0200388:	00006c17          	auipc	s8,0x6
ffffffffc020038c:	b60c0c13          	addi	s8,s8,-1184 # ffffffffc0205ee8 <commands>
        if ((buf = readline("K> ")) != NULL) {
ffffffffc0200390:	00006917          	auipc	s2,0x6
ffffffffc0200394:	b1090913          	addi	s2,s2,-1264 # ffffffffc0205ea0 <etext+0x224>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc0200398:	00006497          	auipc	s1,0x6
ffffffffc020039c:	b1048493          	addi	s1,s1,-1264 # ffffffffc0205ea8 <etext+0x22c>
        if (argc == MAXARGS - 1) {
ffffffffc02003a0:	49bd                	li	s3,15
            cprintf("Too many arguments (max %d).\n", MAXARGS);
ffffffffc02003a2:	00006b17          	auipc	s6,0x6
ffffffffc02003a6:	b0eb0b13          	addi	s6,s6,-1266 # ffffffffc0205eb0 <etext+0x234>
        argv[argc ++] = buf;
ffffffffc02003aa:	00006a17          	auipc	s4,0x6
ffffffffc02003ae:	a26a0a13          	addi	s4,s4,-1498 # ffffffffc0205dd0 <etext+0x154>
    for (i = 0; i < NCOMMANDS; i ++) {
ffffffffc02003b2:	4a8d                	li	s5,3
        if ((buf = readline("K> ")) != NULL) {
ffffffffc02003b4:	854a                	mv	a0,s2
ffffffffc02003b6:	cf5ff0ef          	jal	ra,ffffffffc02000aa <readline>
ffffffffc02003ba:	842a                	mv	s0,a0
ffffffffc02003bc:	dd65                	beqz	a0,ffffffffc02003b4 <kmonitor+0x6a>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc02003be:	00054583          	lbu	a1,0(a0)
    int argc = 0;
ffffffffc02003c2:	4c81                	li	s9,0
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc02003c4:	e1bd                	bnez	a1,ffffffffc020042a <kmonitor+0xe0>
    if (argc == 0) {
ffffffffc02003c6:	fe0c87e3          	beqz	s9,ffffffffc02003b4 <kmonitor+0x6a>
        if (strcmp(commands[i].name, argv[0]) == 0) {
ffffffffc02003ca:	6582                	ld	a1,0(sp)
ffffffffc02003cc:	00006d17          	auipc	s10,0x6
ffffffffc02003d0:	b1cd0d13          	addi	s10,s10,-1252 # ffffffffc0205ee8 <commands>
        argv[argc ++] = buf;
ffffffffc02003d4:	8552                	mv	a0,s4
    for (i = 0; i < NCOMMANDS; i ++) {
ffffffffc02003d6:	4401                	li	s0,0
ffffffffc02003d8:	0d61                	addi	s10,s10,24
        if (strcmp(commands[i].name, argv[0]) == 0) {
ffffffffc02003da:	01f050ef          	jal	ra,ffffffffc0205bf8 <strcmp>
ffffffffc02003de:	c919                	beqz	a0,ffffffffc02003f4 <kmonitor+0xaa>
    for (i = 0; i < NCOMMANDS; i ++) {
ffffffffc02003e0:	2405                	addiw	s0,s0,1
ffffffffc02003e2:	0b540063          	beq	s0,s5,ffffffffc0200482 <kmonitor+0x138>
        if (strcmp(commands[i].name, argv[0]) == 0) {
ffffffffc02003e6:	000d3503          	ld	a0,0(s10)
ffffffffc02003ea:	6582                	ld	a1,0(sp)
    for (i = 0; i < NCOMMANDS; i ++) {
ffffffffc02003ec:	0d61                	addi	s10,s10,24
        if (strcmp(commands[i].name, argv[0]) == 0) {
ffffffffc02003ee:	00b050ef          	jal	ra,ffffffffc0205bf8 <strcmp>
ffffffffc02003f2:	f57d                	bnez	a0,ffffffffc02003e0 <kmonitor+0x96>
            return commands[i].func(argc - 1, argv + 1, tf);
ffffffffc02003f4:	00141793          	slli	a5,s0,0x1
ffffffffc02003f8:	97a2                	add	a5,a5,s0
ffffffffc02003fa:	078e                	slli	a5,a5,0x3
ffffffffc02003fc:	97e2                	add	a5,a5,s8
ffffffffc02003fe:	6b9c                	ld	a5,16(a5)
ffffffffc0200400:	865e                	mv	a2,s7
ffffffffc0200402:	002c                	addi	a1,sp,8
ffffffffc0200404:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200408:	9782                	jalr	a5
            if (runcmd(buf, tf) < 0) {
ffffffffc020040a:	fa0555e3          	bgez	a0,ffffffffc02003b4 <kmonitor+0x6a>
}
ffffffffc020040e:	60ee                	ld	ra,216(sp)
ffffffffc0200410:	644e                	ld	s0,208(sp)
ffffffffc0200412:	64ae                	ld	s1,200(sp)
ffffffffc0200414:	690e                	ld	s2,192(sp)
ffffffffc0200416:	79ea                	ld	s3,184(sp)
ffffffffc0200418:	7a4a                	ld	s4,176(sp)
ffffffffc020041a:	7aaa                	ld	s5,168(sp)
ffffffffc020041c:	7b0a                	ld	s6,160(sp)
ffffffffc020041e:	6bea                	ld	s7,152(sp)
ffffffffc0200420:	6c4a                	ld	s8,144(sp)
ffffffffc0200422:	6caa                	ld	s9,136(sp)
ffffffffc0200424:	6d0a                	ld	s10,128(sp)
ffffffffc0200426:	612d                	addi	sp,sp,224
ffffffffc0200428:	8082                	ret
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc020042a:	8526                	mv	a0,s1
ffffffffc020042c:	011050ef          	jal	ra,ffffffffc0205c3c <strchr>
ffffffffc0200430:	c901                	beqz	a0,ffffffffc0200440 <kmonitor+0xf6>
ffffffffc0200432:	00144583          	lbu	a1,1(s0)
            *buf ++ = '\0';
ffffffffc0200436:	00040023          	sb	zero,0(s0)
ffffffffc020043a:	0405                	addi	s0,s0,1
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc020043c:	d5c9                	beqz	a1,ffffffffc02003c6 <kmonitor+0x7c>
ffffffffc020043e:	b7f5                	j	ffffffffc020042a <kmonitor+0xe0>
        if (*buf == '\0') {
ffffffffc0200440:	00044783          	lbu	a5,0(s0)
ffffffffc0200444:	d3c9                	beqz	a5,ffffffffc02003c6 <kmonitor+0x7c>
        if (argc == MAXARGS - 1) {
ffffffffc0200446:	033c8963          	beq	s9,s3,ffffffffc0200478 <kmonitor+0x12e>
        argv[argc ++] = buf;
ffffffffc020044a:	003c9793          	slli	a5,s9,0x3
ffffffffc020044e:	0118                	addi	a4,sp,128
ffffffffc0200450:	97ba                	add	a5,a5,a4
ffffffffc0200452:	f887b023          	sd	s0,-128(a5)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
ffffffffc0200456:	00044583          	lbu	a1,0(s0)
        argv[argc ++] = buf;
ffffffffc020045a:	2c85                	addiw	s9,s9,1
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
ffffffffc020045c:	e591                	bnez	a1,ffffffffc0200468 <kmonitor+0x11e>
ffffffffc020045e:	b7b5                	j	ffffffffc02003ca <kmonitor+0x80>
ffffffffc0200460:	00144583          	lbu	a1,1(s0)
            buf ++;
ffffffffc0200464:	0405                	addi	s0,s0,1
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
ffffffffc0200466:	d1a5                	beqz	a1,ffffffffc02003c6 <kmonitor+0x7c>
ffffffffc0200468:	8526                	mv	a0,s1
ffffffffc020046a:	7d2050ef          	jal	ra,ffffffffc0205c3c <strchr>
ffffffffc020046e:	d96d                	beqz	a0,ffffffffc0200460 <kmonitor+0x116>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc0200470:	00044583          	lbu	a1,0(s0)
ffffffffc0200474:	d9a9                	beqz	a1,ffffffffc02003c6 <kmonitor+0x7c>
ffffffffc0200476:	bf55                	j	ffffffffc020042a <kmonitor+0xe0>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
ffffffffc0200478:	45c1                	li	a1,16
ffffffffc020047a:	855a                	mv	a0,s6
ffffffffc020047c:	d1dff0ef          	jal	ra,ffffffffc0200198 <cprintf>
ffffffffc0200480:	b7e9                	j	ffffffffc020044a <kmonitor+0x100>
    cprintf("Unknown command '%s'\n", argv[0]);
ffffffffc0200482:	6582                	ld	a1,0(sp)
ffffffffc0200484:	00006517          	auipc	a0,0x6
ffffffffc0200488:	a4c50513          	addi	a0,a0,-1460 # ffffffffc0205ed0 <etext+0x254>
ffffffffc020048c:	d0dff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    return 0;
ffffffffc0200490:	b715                	j	ffffffffc02003b4 <kmonitor+0x6a>

ffffffffc0200492 <__panic>:
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
ffffffffc0200492:	000c6317          	auipc	t1,0xc6
ffffffffc0200496:	60e30313          	addi	t1,t1,1550 # ffffffffc02c6aa0 <is_panic>
ffffffffc020049a:	00033e03          	ld	t3,0(t1)
__panic(const char *file, int line, const char *fmt, ...) {
ffffffffc020049e:	715d                	addi	sp,sp,-80
ffffffffc02004a0:	ec06                	sd	ra,24(sp)
ffffffffc02004a2:	e822                	sd	s0,16(sp)
ffffffffc02004a4:	f436                	sd	a3,40(sp)
ffffffffc02004a6:	f83a                	sd	a4,48(sp)
ffffffffc02004a8:	fc3e                	sd	a5,56(sp)
ffffffffc02004aa:	e0c2                	sd	a6,64(sp)
ffffffffc02004ac:	e4c6                	sd	a7,72(sp)
    if (is_panic) {
ffffffffc02004ae:	020e1a63          	bnez	t3,ffffffffc02004e2 <__panic+0x50>
        goto panic_dead;
    }
    is_panic = 1;
ffffffffc02004b2:	4785                	li	a5,1
ffffffffc02004b4:	00f33023          	sd	a5,0(t1)

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
ffffffffc02004b8:	8432                	mv	s0,a2
ffffffffc02004ba:	103c                	addi	a5,sp,40
    cprintf("kernel panic at %s:%d:\n    ", file, line);
ffffffffc02004bc:	862e                	mv	a2,a1
ffffffffc02004be:	85aa                	mv	a1,a0
ffffffffc02004c0:	00006517          	auipc	a0,0x6
ffffffffc02004c4:	a7050513          	addi	a0,a0,-1424 # ffffffffc0205f30 <commands+0x48>
    va_start(ap, fmt);
ffffffffc02004c8:	e43e                	sd	a5,8(sp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
ffffffffc02004ca:	ccfff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    vcprintf(fmt, ap);
ffffffffc02004ce:	65a2                	ld	a1,8(sp)
ffffffffc02004d0:	8522                	mv	a0,s0
ffffffffc02004d2:	ca7ff0ef          	jal	ra,ffffffffc0200178 <vcprintf>
    cprintf("\n");
ffffffffc02004d6:	00007517          	auipc	a0,0x7
ffffffffc02004da:	b6250513          	addi	a0,a0,-1182 # ffffffffc0207038 <default_pmm_manager+0x578>
ffffffffc02004de:	cbbff0ef          	jal	ra,ffffffffc0200198 <cprintf>
#endif
}

static inline void sbi_shutdown(void)
{
	SBI_CALL_0(SBI_SHUTDOWN);
ffffffffc02004e2:	4501                	li	a0,0
ffffffffc02004e4:	4581                	li	a1,0
ffffffffc02004e6:	4601                	li	a2,0
ffffffffc02004e8:	48a1                	li	a7,8
ffffffffc02004ea:	00000073          	ecall
    va_end(ap);

panic_dead:
    // No debug monitor here
    sbi_shutdown();
    intr_disable();
ffffffffc02004ee:	4c0000ef          	jal	ra,ffffffffc02009ae <intr_disable>
    while (1) {
        kmonitor(NULL);
ffffffffc02004f2:	4501                	li	a0,0
ffffffffc02004f4:	e57ff0ef          	jal	ra,ffffffffc020034a <kmonitor>
    while (1) {
ffffffffc02004f8:	bfed                	j	ffffffffc02004f2 <__panic+0x60>

ffffffffc02004fa <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
ffffffffc02004fa:	715d                	addi	sp,sp,-80
ffffffffc02004fc:	832e                	mv	t1,a1
ffffffffc02004fe:	e822                	sd	s0,16(sp)
    va_list ap;
    va_start(ap, fmt);
    cprintf("kernel warning at %s:%d:\n    ", file, line);
ffffffffc0200500:	85aa                	mv	a1,a0
__warn(const char *file, int line, const char *fmt, ...) {
ffffffffc0200502:	8432                	mv	s0,a2
ffffffffc0200504:	fc3e                	sd	a5,56(sp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
ffffffffc0200506:	861a                	mv	a2,t1
    va_start(ap, fmt);
ffffffffc0200508:	103c                	addi	a5,sp,40
    cprintf("kernel warning at %s:%d:\n    ", file, line);
ffffffffc020050a:	00006517          	auipc	a0,0x6
ffffffffc020050e:	a4650513          	addi	a0,a0,-1466 # ffffffffc0205f50 <commands+0x68>
__warn(const char *file, int line, const char *fmt, ...) {
ffffffffc0200512:	ec06                	sd	ra,24(sp)
ffffffffc0200514:	f436                	sd	a3,40(sp)
ffffffffc0200516:	f83a                	sd	a4,48(sp)
ffffffffc0200518:	e0c2                	sd	a6,64(sp)
ffffffffc020051a:	e4c6                	sd	a7,72(sp)
    va_start(ap, fmt);
ffffffffc020051c:	e43e                	sd	a5,8(sp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
ffffffffc020051e:	c7bff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    vcprintf(fmt, ap);
ffffffffc0200522:	65a2                	ld	a1,8(sp)
ffffffffc0200524:	8522                	mv	a0,s0
ffffffffc0200526:	c53ff0ef          	jal	ra,ffffffffc0200178 <vcprintf>
    cprintf("\n");
ffffffffc020052a:	00007517          	auipc	a0,0x7
ffffffffc020052e:	b0e50513          	addi	a0,a0,-1266 # ffffffffc0207038 <default_pmm_manager+0x578>
ffffffffc0200532:	c67ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    va_end(ap);
}
ffffffffc0200536:	60e2                	ld	ra,24(sp)
ffffffffc0200538:	6442                	ld	s0,16(sp)
ffffffffc020053a:	6161                	addi	sp,sp,80
ffffffffc020053c:	8082                	ret

ffffffffc020053e <clock_init>:
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void clock_init(void)
{
    set_csr(sie, MIP_STIP);
ffffffffc020053e:	02000793          	li	a5,32
ffffffffc0200542:	1047a7f3          	csrrs	a5,sie,a5
    __asm__ __volatile__("rdtime %0" : "=r"(n));
ffffffffc0200546:	c0102573          	rdtime	a0
    ticks = 0;

    cprintf("++ setup timer interrupts\n");
}

void clock_set_next_event(void) { sbi_set_timer(get_cycles() + timebase); }
ffffffffc020054a:	67e1                	lui	a5,0x18
ffffffffc020054c:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_matrix_out_size+0xbfa0>
ffffffffc0200550:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
ffffffffc0200552:	4581                	li	a1,0
ffffffffc0200554:	4601                	li	a2,0
ffffffffc0200556:	4881                	li	a7,0
ffffffffc0200558:	00000073          	ecall
    cprintf("++ setup timer interrupts\n");
ffffffffc020055c:	00006517          	auipc	a0,0x6
ffffffffc0200560:	a1450513          	addi	a0,a0,-1516 # ffffffffc0205f70 <commands+0x88>
    ticks = 0;
ffffffffc0200564:	000c6797          	auipc	a5,0xc6
ffffffffc0200568:	5407b223          	sd	zero,1348(a5) # ffffffffc02c6aa8 <ticks>
    cprintf("++ setup timer interrupts\n");
ffffffffc020056c:	b135                	j	ffffffffc0200198 <cprintf>

ffffffffc020056e <clock_set_next_event>:
    __asm__ __volatile__("rdtime %0" : "=r"(n));
ffffffffc020056e:	c0102573          	rdtime	a0
void clock_set_next_event(void) { sbi_set_timer(get_cycles() + timebase); }
ffffffffc0200572:	67e1                	lui	a5,0x18
ffffffffc0200574:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_matrix_out_size+0xbfa0>
ffffffffc0200578:	953e                	add	a0,a0,a5
ffffffffc020057a:	4581                	li	a1,0
ffffffffc020057c:	4601                	li	a2,0
ffffffffc020057e:	4881                	li	a7,0
ffffffffc0200580:	00000073          	ecall
ffffffffc0200584:	8082                	ret

ffffffffc0200586 <cons_init>:

/* serial_intr - try to feed input characters from serial port */
void serial_intr(void) {}

/* cons_init - initializes the console devices */
void cons_init(void) {}
ffffffffc0200586:	8082                	ret

ffffffffc0200588 <cons_putc>:
#include <assert.h>
#include <atomic.h>

static inline bool __intr_save(void)
{
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0200588:	100027f3          	csrr	a5,sstatus
ffffffffc020058c:	8b89                	andi	a5,a5,2
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
ffffffffc020058e:	0ff57513          	zext.b	a0,a0
ffffffffc0200592:	e799                	bnez	a5,ffffffffc02005a0 <cons_putc+0x18>
ffffffffc0200594:	4581                	li	a1,0
ffffffffc0200596:	4601                	li	a2,0
ffffffffc0200598:	4885                	li	a7,1
ffffffffc020059a:	00000073          	ecall
    return 0;
}

static inline void __intr_restore(bool flag)
{
    if (flag)
ffffffffc020059e:	8082                	ret

/* cons_putc - print a single character @c to console devices */
void cons_putc(int c) {
ffffffffc02005a0:	1101                	addi	sp,sp,-32
ffffffffc02005a2:	ec06                	sd	ra,24(sp)
ffffffffc02005a4:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc02005a6:	408000ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc02005aa:	6522                	ld	a0,8(sp)
ffffffffc02005ac:	4581                	li	a1,0
ffffffffc02005ae:	4601                	li	a2,0
ffffffffc02005b0:	4885                	li	a7,1
ffffffffc02005b2:	00000073          	ecall
    local_intr_save(intr_flag);
    {
        sbi_console_putchar((unsigned char)c);
    }
    local_intr_restore(intr_flag);
}
ffffffffc02005b6:	60e2                	ld	ra,24(sp)
ffffffffc02005b8:	6105                	addi	sp,sp,32
    {
        intr_enable();
ffffffffc02005ba:	a6fd                	j	ffffffffc02009a8 <intr_enable>

ffffffffc02005bc <cons_getc>:
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02005bc:	100027f3          	csrr	a5,sstatus
ffffffffc02005c0:	8b89                	andi	a5,a5,2
ffffffffc02005c2:	eb89                	bnez	a5,ffffffffc02005d4 <cons_getc+0x18>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
ffffffffc02005c4:	4501                	li	a0,0
ffffffffc02005c6:	4581                	li	a1,0
ffffffffc02005c8:	4601                	li	a2,0
ffffffffc02005ca:	4889                	li	a7,2
ffffffffc02005cc:	00000073          	ecall
ffffffffc02005d0:	2501                	sext.w	a0,a0
    {
        c = sbi_console_getchar();
    }
    local_intr_restore(intr_flag);
    return c;
}
ffffffffc02005d2:	8082                	ret
int cons_getc(void) {
ffffffffc02005d4:	1101                	addi	sp,sp,-32
ffffffffc02005d6:	ec06                	sd	ra,24(sp)
        intr_disable();
ffffffffc02005d8:	3d6000ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc02005dc:	4501                	li	a0,0
ffffffffc02005de:	4581                	li	a1,0
ffffffffc02005e0:	4601                	li	a2,0
ffffffffc02005e2:	4889                	li	a7,2
ffffffffc02005e4:	00000073          	ecall
ffffffffc02005e8:	2501                	sext.w	a0,a0
ffffffffc02005ea:	e42a                	sd	a0,8(sp)
        intr_enable();
ffffffffc02005ec:	3bc000ef          	jal	ra,ffffffffc02009a8 <intr_enable>
}
ffffffffc02005f0:	60e2                	ld	ra,24(sp)
ffffffffc02005f2:	6522                	ld	a0,8(sp)
ffffffffc02005f4:	6105                	addi	sp,sp,32
ffffffffc02005f6:	8082                	ret

ffffffffc02005f8 <dtb_init>:

// 保存解析出的系统物理内存信息
static uint64_t memory_base = 0;
static uint64_t memory_size = 0;

void dtb_init(void) {
ffffffffc02005f8:	7119                	addi	sp,sp,-128
    cprintf("DTB Init\n");
ffffffffc02005fa:	00006517          	auipc	a0,0x6
ffffffffc02005fe:	99650513          	addi	a0,a0,-1642 # ffffffffc0205f90 <commands+0xa8>
void dtb_init(void) {
ffffffffc0200602:	fc86                	sd	ra,120(sp)
ffffffffc0200604:	f8a2                	sd	s0,112(sp)
ffffffffc0200606:	e8d2                	sd	s4,80(sp)
ffffffffc0200608:	f4a6                	sd	s1,104(sp)
ffffffffc020060a:	f0ca                	sd	s2,96(sp)
ffffffffc020060c:	ecce                	sd	s3,88(sp)
ffffffffc020060e:	e4d6                	sd	s5,72(sp)
ffffffffc0200610:	e0da                	sd	s6,64(sp)
ffffffffc0200612:	fc5e                	sd	s7,56(sp)
ffffffffc0200614:	f862                	sd	s8,48(sp)
ffffffffc0200616:	f466                	sd	s9,40(sp)
ffffffffc0200618:	f06a                	sd	s10,32(sp)
ffffffffc020061a:	ec6e                	sd	s11,24(sp)
    cprintf("DTB Init\n");
ffffffffc020061c:	b7dff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("HartID: %ld\n", boot_hartid);
ffffffffc0200620:	0000c597          	auipc	a1,0xc
ffffffffc0200624:	9e05b583          	ld	a1,-1568(a1) # ffffffffc020c000 <boot_hartid>
ffffffffc0200628:	00006517          	auipc	a0,0x6
ffffffffc020062c:	97850513          	addi	a0,a0,-1672 # ffffffffc0205fa0 <commands+0xb8>
ffffffffc0200630:	b69ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("DTB Address: 0x%lx\n", boot_dtb);
ffffffffc0200634:	0000c417          	auipc	s0,0xc
ffffffffc0200638:	9d440413          	addi	s0,s0,-1580 # ffffffffc020c008 <boot_dtb>
ffffffffc020063c:	600c                	ld	a1,0(s0)
ffffffffc020063e:	00006517          	auipc	a0,0x6
ffffffffc0200642:	97250513          	addi	a0,a0,-1678 # ffffffffc0205fb0 <commands+0xc8>
ffffffffc0200646:	b53ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    
    if (boot_dtb == 0) {
ffffffffc020064a:	00043a03          	ld	s4,0(s0)
        cprintf("Error: DTB address is null\n");
ffffffffc020064e:	00006517          	auipc	a0,0x6
ffffffffc0200652:	97a50513          	addi	a0,a0,-1670 # ffffffffc0205fc8 <commands+0xe0>
    if (boot_dtb == 0) {
ffffffffc0200656:	120a0463          	beqz	s4,ffffffffc020077e <dtb_init+0x186>
        return;
    }
    
    // 转换为虚拟地址
    uintptr_t dtb_vaddr = boot_dtb + PHYSICAL_MEMORY_OFFSET;
ffffffffc020065a:	57f5                	li	a5,-3
ffffffffc020065c:	07fa                	slli	a5,a5,0x1e
ffffffffc020065e:	00fa0733          	add	a4,s4,a5
    const struct fdt_header *header = (const struct fdt_header *)dtb_vaddr;
    
    // 验证DTB
    uint32_t magic = fdt32_to_cpu(header->magic);
ffffffffc0200662:	431c                	lw	a5,0(a4)
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200664:	00ff0637          	lui	a2,0xff0
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200668:	6b41                	lui	s6,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020066a:	0087d59b          	srliw	a1,a5,0x8
ffffffffc020066e:	0187969b          	slliw	a3,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200672:	0187d51b          	srliw	a0,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200676:	0105959b          	slliw	a1,a1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020067a:	0107d79b          	srliw	a5,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020067e:	8df1                	and	a1,a1,a2
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200680:	8ec9                	or	a3,a3,a0
ffffffffc0200682:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200686:	1b7d                	addi	s6,s6,-1
ffffffffc0200688:	0167f7b3          	and	a5,a5,s6
ffffffffc020068c:	8dd5                	or	a1,a1,a3
ffffffffc020068e:	8ddd                	or	a1,a1,a5
    if (magic != 0xd00dfeed) {
ffffffffc0200690:	d00e07b7          	lui	a5,0xd00e0
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200694:	2581                	sext.w	a1,a1
    if (magic != 0xd00dfeed) {
ffffffffc0200696:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfe193c5>
ffffffffc020069a:	10f59163          	bne	a1,a5,ffffffffc020079c <dtb_init+0x1a4>
        return;
    }
    
    // 提取内存信息
    uint64_t mem_base, mem_size;
    if (extract_memory_info(dtb_vaddr, header, &mem_base, &mem_size) == 0) {
ffffffffc020069e:	471c                	lw	a5,8(a4)
ffffffffc02006a0:	4754                	lw	a3,12(a4)
    int in_memory_node = 0;
ffffffffc02006a2:	4c81                	li	s9,0
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006a4:	0087d59b          	srliw	a1,a5,0x8
ffffffffc02006a8:	0086d51b          	srliw	a0,a3,0x8
ffffffffc02006ac:	0186941b          	slliw	s0,a3,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006b0:	0186d89b          	srliw	a7,a3,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006b4:	01879a1b          	slliw	s4,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006b8:	0187d81b          	srliw	a6,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006bc:	0105151b          	slliw	a0,a0,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006c0:	0106d69b          	srliw	a3,a3,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006c4:	0105959b          	slliw	a1,a1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006c8:	0107d79b          	srliw	a5,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006cc:	8d71                	and	a0,a0,a2
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006ce:	01146433          	or	s0,s0,a7
ffffffffc02006d2:	0086969b          	slliw	a3,a3,0x8
ffffffffc02006d6:	010a6a33          	or	s4,s4,a6
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006da:	8e6d                	and	a2,a2,a1
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006dc:	0087979b          	slliw	a5,a5,0x8
ffffffffc02006e0:	8c49                	or	s0,s0,a0
ffffffffc02006e2:	0166f6b3          	and	a3,a3,s6
ffffffffc02006e6:	00ca6a33          	or	s4,s4,a2
ffffffffc02006ea:	0167f7b3          	and	a5,a5,s6
ffffffffc02006ee:	8c55                	or	s0,s0,a3
ffffffffc02006f0:	00fa6a33          	or	s4,s4,a5
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc02006f4:	1402                	slli	s0,s0,0x20
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc02006f6:	1a02                	slli	s4,s4,0x20
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc02006f8:	9001                	srli	s0,s0,0x20
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc02006fa:	020a5a13          	srli	s4,s4,0x20
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc02006fe:	943a                	add	s0,s0,a4
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc0200700:	9a3a                	add	s4,s4,a4
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200702:	00ff0c37          	lui	s8,0xff0
        switch (token) {
ffffffffc0200706:	4b8d                	li	s7,3
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc0200708:	00006917          	auipc	s2,0x6
ffffffffc020070c:	91090913          	addi	s2,s2,-1776 # ffffffffc0206018 <commands+0x130>
ffffffffc0200710:	49bd                	li	s3,15
        switch (token) {
ffffffffc0200712:	4d91                	li	s11,4
ffffffffc0200714:	4d05                	li	s10,1
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc0200716:	00006497          	auipc	s1,0x6
ffffffffc020071a:	8fa48493          	addi	s1,s1,-1798 # ffffffffc0206010 <commands+0x128>
        uint32_t token = fdt32_to_cpu(*struct_ptr++);
ffffffffc020071e:	000a2703          	lw	a4,0(s4)
ffffffffc0200722:	004a0a93          	addi	s5,s4,4
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200726:	0087569b          	srliw	a3,a4,0x8
ffffffffc020072a:	0187179b          	slliw	a5,a4,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020072e:	0187561b          	srliw	a2,a4,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200732:	0106969b          	slliw	a3,a3,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200736:	0107571b          	srliw	a4,a4,0x10
ffffffffc020073a:	8fd1                	or	a5,a5,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020073c:	0186f6b3          	and	a3,a3,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200740:	0087171b          	slliw	a4,a4,0x8
ffffffffc0200744:	8fd5                	or	a5,a5,a3
ffffffffc0200746:	00eb7733          	and	a4,s6,a4
ffffffffc020074a:	8fd9                	or	a5,a5,a4
ffffffffc020074c:	2781                	sext.w	a5,a5
        switch (token) {
ffffffffc020074e:	09778c63          	beq	a5,s7,ffffffffc02007e6 <dtb_init+0x1ee>
ffffffffc0200752:	00fbea63          	bltu	s7,a5,ffffffffc0200766 <dtb_init+0x16e>
ffffffffc0200756:	07a78663          	beq	a5,s10,ffffffffc02007c2 <dtb_init+0x1ca>
ffffffffc020075a:	4709                	li	a4,2
ffffffffc020075c:	00e79763          	bne	a5,a4,ffffffffc020076a <dtb_init+0x172>
ffffffffc0200760:	4c81                	li	s9,0
ffffffffc0200762:	8a56                	mv	s4,s5
ffffffffc0200764:	bf6d                	j	ffffffffc020071e <dtb_init+0x126>
ffffffffc0200766:	ffb78ee3          	beq	a5,s11,ffffffffc0200762 <dtb_init+0x16a>
        cprintf("  End:  0x%016lx\n", mem_base + mem_size - 1);
        // 保存到全局变量，供 PMM 查询
        memory_base = mem_base;
        memory_size = mem_size;
    } else {
        cprintf("Warning: Could not extract memory info from DTB\n");
ffffffffc020076a:	00006517          	auipc	a0,0x6
ffffffffc020076e:	92650513          	addi	a0,a0,-1754 # ffffffffc0206090 <commands+0x1a8>
ffffffffc0200772:	a27ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    }
    cprintf("DTB init completed\n");
ffffffffc0200776:	00006517          	auipc	a0,0x6
ffffffffc020077a:	95250513          	addi	a0,a0,-1710 # ffffffffc02060c8 <commands+0x1e0>
}
ffffffffc020077e:	7446                	ld	s0,112(sp)
ffffffffc0200780:	70e6                	ld	ra,120(sp)
ffffffffc0200782:	74a6                	ld	s1,104(sp)
ffffffffc0200784:	7906                	ld	s2,96(sp)
ffffffffc0200786:	69e6                	ld	s3,88(sp)
ffffffffc0200788:	6a46                	ld	s4,80(sp)
ffffffffc020078a:	6aa6                	ld	s5,72(sp)
ffffffffc020078c:	6b06                	ld	s6,64(sp)
ffffffffc020078e:	7be2                	ld	s7,56(sp)
ffffffffc0200790:	7c42                	ld	s8,48(sp)
ffffffffc0200792:	7ca2                	ld	s9,40(sp)
ffffffffc0200794:	7d02                	ld	s10,32(sp)
ffffffffc0200796:	6de2                	ld	s11,24(sp)
ffffffffc0200798:	6109                	addi	sp,sp,128
    cprintf("DTB init completed\n");
ffffffffc020079a:	bafd                	j	ffffffffc0200198 <cprintf>
}
ffffffffc020079c:	7446                	ld	s0,112(sp)
ffffffffc020079e:	70e6                	ld	ra,120(sp)
ffffffffc02007a0:	74a6                	ld	s1,104(sp)
ffffffffc02007a2:	7906                	ld	s2,96(sp)
ffffffffc02007a4:	69e6                	ld	s3,88(sp)
ffffffffc02007a6:	6a46                	ld	s4,80(sp)
ffffffffc02007a8:	6aa6                	ld	s5,72(sp)
ffffffffc02007aa:	6b06                	ld	s6,64(sp)
ffffffffc02007ac:	7be2                	ld	s7,56(sp)
ffffffffc02007ae:	7c42                	ld	s8,48(sp)
ffffffffc02007b0:	7ca2                	ld	s9,40(sp)
ffffffffc02007b2:	7d02                	ld	s10,32(sp)
ffffffffc02007b4:	6de2                	ld	s11,24(sp)
        cprintf("Error: Invalid DTB magic number: 0x%x\n", magic);
ffffffffc02007b6:	00006517          	auipc	a0,0x6
ffffffffc02007ba:	83250513          	addi	a0,a0,-1998 # ffffffffc0205fe8 <commands+0x100>
}
ffffffffc02007be:	6109                	addi	sp,sp,128
        cprintf("Error: Invalid DTB magic number: 0x%x\n", magic);
ffffffffc02007c0:	bae1                	j	ffffffffc0200198 <cprintf>
                int name_len = strlen(name);
ffffffffc02007c2:	8556                	mv	a0,s5
ffffffffc02007c4:	3ec050ef          	jal	ra,ffffffffc0205bb0 <strlen>
ffffffffc02007c8:	8a2a                	mv	s4,a0
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc02007ca:	4619                	li	a2,6
ffffffffc02007cc:	85a6                	mv	a1,s1
ffffffffc02007ce:	8556                	mv	a0,s5
                int name_len = strlen(name);
ffffffffc02007d0:	2a01                	sext.w	s4,s4
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc02007d2:	444050ef          	jal	ra,ffffffffc0205c16 <strncmp>
ffffffffc02007d6:	e111                	bnez	a0,ffffffffc02007da <dtb_init+0x1e2>
                    in_memory_node = 1;
ffffffffc02007d8:	4c85                	li	s9,1
                struct_ptr = (const uint32_t *)(((uintptr_t)struct_ptr + name_len + 4) & ~3);
ffffffffc02007da:	0a91                	addi	s5,s5,4
ffffffffc02007dc:	9ad2                	add	s5,s5,s4
ffffffffc02007de:	ffcafa93          	andi	s5,s5,-4
        switch (token) {
ffffffffc02007e2:	8a56                	mv	s4,s5
ffffffffc02007e4:	bf2d                	j	ffffffffc020071e <dtb_init+0x126>
                uint32_t prop_len = fdt32_to_cpu(*struct_ptr++);
ffffffffc02007e6:	004a2783          	lw	a5,4(s4)
                uint32_t prop_nameoff = fdt32_to_cpu(*struct_ptr++);
ffffffffc02007ea:	00ca0693          	addi	a3,s4,12
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02007ee:	0087d71b          	srliw	a4,a5,0x8
ffffffffc02007f2:	01879a9b          	slliw	s5,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02007f6:	0187d61b          	srliw	a2,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02007fa:	0107171b          	slliw	a4,a4,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02007fe:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200802:	00caeab3          	or	s5,s5,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200806:	01877733          	and	a4,a4,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020080a:	0087979b          	slliw	a5,a5,0x8
ffffffffc020080e:	00eaeab3          	or	s5,s5,a4
ffffffffc0200812:	00fb77b3          	and	a5,s6,a5
ffffffffc0200816:	00faeab3          	or	s5,s5,a5
ffffffffc020081a:	2a81                	sext.w	s5,s5
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc020081c:	000c9c63          	bnez	s9,ffffffffc0200834 <dtb_init+0x23c>
                struct_ptr = (const uint32_t *)(((uintptr_t)struct_ptr + prop_len + 3) & ~3);
ffffffffc0200820:	1a82                	slli	s5,s5,0x20
ffffffffc0200822:	00368793          	addi	a5,a3,3
ffffffffc0200826:	020ada93          	srli	s5,s5,0x20
ffffffffc020082a:	9abe                	add	s5,s5,a5
ffffffffc020082c:	ffcafa93          	andi	s5,s5,-4
        switch (token) {
ffffffffc0200830:	8a56                	mv	s4,s5
ffffffffc0200832:	b5f5                	j	ffffffffc020071e <dtb_init+0x126>
                uint32_t prop_nameoff = fdt32_to_cpu(*struct_ptr++);
ffffffffc0200834:	008a2783          	lw	a5,8(s4)
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc0200838:	85ca                	mv	a1,s2
ffffffffc020083a:	e436                	sd	a3,8(sp)
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020083c:	0087d51b          	srliw	a0,a5,0x8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200840:	0187d61b          	srliw	a2,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200844:	0187971b          	slliw	a4,a5,0x18
ffffffffc0200848:	0105151b          	slliw	a0,a0,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020084c:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200850:	8f51                	or	a4,a4,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200852:	01857533          	and	a0,a0,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200856:	0087979b          	slliw	a5,a5,0x8
ffffffffc020085a:	8d59                	or	a0,a0,a4
ffffffffc020085c:	00fb77b3          	and	a5,s6,a5
ffffffffc0200860:	8d5d                	or	a0,a0,a5
                const char *prop_name = strings_base + prop_nameoff;
ffffffffc0200862:	1502                	slli	a0,a0,0x20
ffffffffc0200864:	9101                	srli	a0,a0,0x20
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc0200866:	9522                	add	a0,a0,s0
ffffffffc0200868:	390050ef          	jal	ra,ffffffffc0205bf8 <strcmp>
ffffffffc020086c:	66a2                	ld	a3,8(sp)
ffffffffc020086e:	f94d                	bnez	a0,ffffffffc0200820 <dtb_init+0x228>
ffffffffc0200870:	fb59f8e3          	bgeu	s3,s5,ffffffffc0200820 <dtb_init+0x228>
                    *mem_base = fdt64_to_cpu(reg_data[0]);
ffffffffc0200874:	00ca3783          	ld	a5,12(s4)
                    *mem_size = fdt64_to_cpu(reg_data[1]);
ffffffffc0200878:	014a3703          	ld	a4,20(s4)
        cprintf("Physical Memory from DTB:\n");
ffffffffc020087c:	00005517          	auipc	a0,0x5
ffffffffc0200880:	7a450513          	addi	a0,a0,1956 # ffffffffc0206020 <commands+0x138>
           fdt32_to_cpu(x >> 32);
ffffffffc0200884:	4207d613          	srai	a2,a5,0x20
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200888:	0087d31b          	srliw	t1,a5,0x8
           fdt32_to_cpu(x >> 32);
ffffffffc020088c:	42075593          	srai	a1,a4,0x20
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200890:	0187de1b          	srliw	t3,a5,0x18
ffffffffc0200894:	0186581b          	srliw	a6,a2,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200898:	0187941b          	slliw	s0,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020089c:	0107d89b          	srliw	a7,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02008a0:	0187d693          	srli	a3,a5,0x18
ffffffffc02008a4:	01861f1b          	slliw	t5,a2,0x18
ffffffffc02008a8:	0087579b          	srliw	a5,a4,0x8
ffffffffc02008ac:	0103131b          	slliw	t1,t1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02008b0:	0106561b          	srliw	a2,a2,0x10
ffffffffc02008b4:	010f6f33          	or	t5,t5,a6
ffffffffc02008b8:	0187529b          	srliw	t0,a4,0x18
ffffffffc02008bc:	0185df9b          	srliw	t6,a1,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02008c0:	01837333          	and	t1,t1,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02008c4:	01c46433          	or	s0,s0,t3
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02008c8:	0186f6b3          	and	a3,a3,s8
ffffffffc02008cc:	01859e1b          	slliw	t3,a1,0x18
ffffffffc02008d0:	01871e9b          	slliw	t4,a4,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02008d4:	0107581b          	srliw	a6,a4,0x10
ffffffffc02008d8:	0086161b          	slliw	a2,a2,0x8
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02008dc:	8361                	srli	a4,a4,0x18
ffffffffc02008de:	0107979b          	slliw	a5,a5,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02008e2:	0105d59b          	srliw	a1,a1,0x10
ffffffffc02008e6:	01e6e6b3          	or	a3,a3,t5
ffffffffc02008ea:	00cb7633          	and	a2,s6,a2
ffffffffc02008ee:	0088181b          	slliw	a6,a6,0x8
ffffffffc02008f2:	0085959b          	slliw	a1,a1,0x8
ffffffffc02008f6:	00646433          	or	s0,s0,t1
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02008fa:	0187f7b3          	and	a5,a5,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02008fe:	01fe6333          	or	t1,t3,t6
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200902:	01877c33          	and	s8,a4,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200906:	0088989b          	slliw	a7,a7,0x8
ffffffffc020090a:	011b78b3          	and	a7,s6,a7
ffffffffc020090e:	005eeeb3          	or	t4,t4,t0
ffffffffc0200912:	00c6e733          	or	a4,a3,a2
ffffffffc0200916:	006c6c33          	or	s8,s8,t1
ffffffffc020091a:	010b76b3          	and	a3,s6,a6
ffffffffc020091e:	00bb7b33          	and	s6,s6,a1
ffffffffc0200922:	01d7e7b3          	or	a5,a5,t4
ffffffffc0200926:	016c6b33          	or	s6,s8,s6
ffffffffc020092a:	01146433          	or	s0,s0,a7
ffffffffc020092e:	8fd5                	or	a5,a5,a3
           fdt32_to_cpu(x >> 32);
ffffffffc0200930:	1702                	slli	a4,a4,0x20
ffffffffc0200932:	1b02                	slli	s6,s6,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc0200934:	1782                	slli	a5,a5,0x20
           fdt32_to_cpu(x >> 32);
ffffffffc0200936:	9301                	srli	a4,a4,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc0200938:	1402                	slli	s0,s0,0x20
           fdt32_to_cpu(x >> 32);
ffffffffc020093a:	020b5b13          	srli	s6,s6,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc020093e:	0167eb33          	or	s6,a5,s6
ffffffffc0200942:	8c59                	or	s0,s0,a4
        cprintf("Physical Memory from DTB:\n");
ffffffffc0200944:	855ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
        cprintf("  Base: 0x%016lx\n", mem_base);
ffffffffc0200948:	85a2                	mv	a1,s0
ffffffffc020094a:	00005517          	auipc	a0,0x5
ffffffffc020094e:	6f650513          	addi	a0,a0,1782 # ffffffffc0206040 <commands+0x158>
ffffffffc0200952:	847ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
        cprintf("  Size: 0x%016lx (%ld MB)\n", mem_size, mem_size / (1024 * 1024));
ffffffffc0200956:	014b5613          	srli	a2,s6,0x14
ffffffffc020095a:	85da                	mv	a1,s6
ffffffffc020095c:	00005517          	auipc	a0,0x5
ffffffffc0200960:	6fc50513          	addi	a0,a0,1788 # ffffffffc0206058 <commands+0x170>
ffffffffc0200964:	835ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
        cprintf("  End:  0x%016lx\n", mem_base + mem_size - 1);
ffffffffc0200968:	008b05b3          	add	a1,s6,s0
ffffffffc020096c:	15fd                	addi	a1,a1,-1
ffffffffc020096e:	00005517          	auipc	a0,0x5
ffffffffc0200972:	70a50513          	addi	a0,a0,1802 # ffffffffc0206078 <commands+0x190>
ffffffffc0200976:	823ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("DTB init completed\n");
ffffffffc020097a:	00005517          	auipc	a0,0x5
ffffffffc020097e:	74e50513          	addi	a0,a0,1870 # ffffffffc02060c8 <commands+0x1e0>
        memory_base = mem_base;
ffffffffc0200982:	000c6797          	auipc	a5,0xc6
ffffffffc0200986:	1287b723          	sd	s0,302(a5) # ffffffffc02c6ab0 <memory_base>
        memory_size = mem_size;
ffffffffc020098a:	000c6797          	auipc	a5,0xc6
ffffffffc020098e:	1367b723          	sd	s6,302(a5) # ffffffffc02c6ab8 <memory_size>
    cprintf("DTB init completed\n");
ffffffffc0200992:	b3f5                	j	ffffffffc020077e <dtb_init+0x186>

ffffffffc0200994 <get_memory_base>:

uint64_t get_memory_base(void) {
    return memory_base;
}
ffffffffc0200994:	000c6517          	auipc	a0,0xc6
ffffffffc0200998:	11c53503          	ld	a0,284(a0) # ffffffffc02c6ab0 <memory_base>
ffffffffc020099c:	8082                	ret

ffffffffc020099e <get_memory_size>:

uint64_t get_memory_size(void) {
    return memory_size;
}
ffffffffc020099e:	000c6517          	auipc	a0,0xc6
ffffffffc02009a2:	11a53503          	ld	a0,282(a0) # ffffffffc02c6ab8 <memory_size>
ffffffffc02009a6:	8082                	ret

ffffffffc02009a8 <intr_enable>:
#include <intr.h>
#include <riscv.h>

/* intr_enable - enable irq interrupt */
void intr_enable(void) { set_csr(sstatus, SSTATUS_SIE); }
ffffffffc02009a8:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc02009ac:	8082                	ret

ffffffffc02009ae <intr_disable>:

/* intr_disable - disable irq interrupt */
void intr_disable(void) { clear_csr(sstatus, SSTATUS_SIE); }
ffffffffc02009ae:	100177f3          	csrrci	a5,sstatus,2
ffffffffc02009b2:	8082                	ret

ffffffffc02009b4 <pic_init>:
#include <picirq.h>

void pic_enable(unsigned int irq) {}

/* pic_init - initialize the 8259A interrupt controllers */
void pic_init(void) {}
ffffffffc02009b4:	8082                	ret

ffffffffc02009b6 <idt_init>:
void idt_init(void)
{
    extern void __alltraps(void);
    /* Set sscratch register to 0, indicating to exception vector that we are
     * presently executing in the kernel */
    write_csr(sscratch, 0);
ffffffffc02009b6:	14005073          	csrwi	sscratch,0
    /* Set the exception vector address */
    write_csr(stvec, &__alltraps);
ffffffffc02009ba:	00000797          	auipc	a5,0x0
ffffffffc02009be:	46e78793          	addi	a5,a5,1134 # ffffffffc0200e28 <__alltraps>
ffffffffc02009c2:	10579073          	csrw	stvec,a5
    /* Allow kernel to access user memory */
    set_csr(sstatus, SSTATUS_SUM);
ffffffffc02009c6:	000407b7          	lui	a5,0x40
ffffffffc02009ca:	1007a7f3          	csrrs	a5,sstatus,a5
}
ffffffffc02009ce:	8082                	ret

ffffffffc02009d0 <print_regs>:
    cprintf("  cause    0x%08x\n", tf->cause);
}

void print_regs(struct pushregs *gpr)
{
    cprintf("  zero     0x%08x\n", gpr->zero);
ffffffffc02009d0:	610c                	ld	a1,0(a0)
{
ffffffffc02009d2:	1141                	addi	sp,sp,-16
ffffffffc02009d4:	e022                	sd	s0,0(sp)
ffffffffc02009d6:	842a                	mv	s0,a0
    cprintf("  zero     0x%08x\n", gpr->zero);
ffffffffc02009d8:	00005517          	auipc	a0,0x5
ffffffffc02009dc:	70850513          	addi	a0,a0,1800 # ffffffffc02060e0 <commands+0x1f8>
{
ffffffffc02009e0:	e406                	sd	ra,8(sp)
    cprintf("  zero     0x%08x\n", gpr->zero);
ffffffffc02009e2:	fb6ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  ra       0x%08x\n", gpr->ra);
ffffffffc02009e6:	640c                	ld	a1,8(s0)
ffffffffc02009e8:	00005517          	auipc	a0,0x5
ffffffffc02009ec:	71050513          	addi	a0,a0,1808 # ffffffffc02060f8 <commands+0x210>
ffffffffc02009f0:	fa8ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  sp       0x%08x\n", gpr->sp);
ffffffffc02009f4:	680c                	ld	a1,16(s0)
ffffffffc02009f6:	00005517          	auipc	a0,0x5
ffffffffc02009fa:	71a50513          	addi	a0,a0,1818 # ffffffffc0206110 <commands+0x228>
ffffffffc02009fe:	f9aff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  gp       0x%08x\n", gpr->gp);
ffffffffc0200a02:	6c0c                	ld	a1,24(s0)
ffffffffc0200a04:	00005517          	auipc	a0,0x5
ffffffffc0200a08:	72450513          	addi	a0,a0,1828 # ffffffffc0206128 <commands+0x240>
ffffffffc0200a0c:	f8cff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  tp       0x%08x\n", gpr->tp);
ffffffffc0200a10:	700c                	ld	a1,32(s0)
ffffffffc0200a12:	00005517          	auipc	a0,0x5
ffffffffc0200a16:	72e50513          	addi	a0,a0,1838 # ffffffffc0206140 <commands+0x258>
ffffffffc0200a1a:	f7eff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  t0       0x%08x\n", gpr->t0);
ffffffffc0200a1e:	740c                	ld	a1,40(s0)
ffffffffc0200a20:	00005517          	auipc	a0,0x5
ffffffffc0200a24:	73850513          	addi	a0,a0,1848 # ffffffffc0206158 <commands+0x270>
ffffffffc0200a28:	f70ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  t1       0x%08x\n", gpr->t1);
ffffffffc0200a2c:	780c                	ld	a1,48(s0)
ffffffffc0200a2e:	00005517          	auipc	a0,0x5
ffffffffc0200a32:	74250513          	addi	a0,a0,1858 # ffffffffc0206170 <commands+0x288>
ffffffffc0200a36:	f62ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  t2       0x%08x\n", gpr->t2);
ffffffffc0200a3a:	7c0c                	ld	a1,56(s0)
ffffffffc0200a3c:	00005517          	auipc	a0,0x5
ffffffffc0200a40:	74c50513          	addi	a0,a0,1868 # ffffffffc0206188 <commands+0x2a0>
ffffffffc0200a44:	f54ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s0       0x%08x\n", gpr->s0);
ffffffffc0200a48:	602c                	ld	a1,64(s0)
ffffffffc0200a4a:	00005517          	auipc	a0,0x5
ffffffffc0200a4e:	75650513          	addi	a0,a0,1878 # ffffffffc02061a0 <commands+0x2b8>
ffffffffc0200a52:	f46ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s1       0x%08x\n", gpr->s1);
ffffffffc0200a56:	642c                	ld	a1,72(s0)
ffffffffc0200a58:	00005517          	auipc	a0,0x5
ffffffffc0200a5c:	76050513          	addi	a0,a0,1888 # ffffffffc02061b8 <commands+0x2d0>
ffffffffc0200a60:	f38ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  a0       0x%08x\n", gpr->a0);
ffffffffc0200a64:	682c                	ld	a1,80(s0)
ffffffffc0200a66:	00005517          	auipc	a0,0x5
ffffffffc0200a6a:	76a50513          	addi	a0,a0,1898 # ffffffffc02061d0 <commands+0x2e8>
ffffffffc0200a6e:	f2aff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  a1       0x%08x\n", gpr->a1);
ffffffffc0200a72:	6c2c                	ld	a1,88(s0)
ffffffffc0200a74:	00005517          	auipc	a0,0x5
ffffffffc0200a78:	77450513          	addi	a0,a0,1908 # ffffffffc02061e8 <commands+0x300>
ffffffffc0200a7c:	f1cff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  a2       0x%08x\n", gpr->a2);
ffffffffc0200a80:	702c                	ld	a1,96(s0)
ffffffffc0200a82:	00005517          	auipc	a0,0x5
ffffffffc0200a86:	77e50513          	addi	a0,a0,1918 # ffffffffc0206200 <commands+0x318>
ffffffffc0200a8a:	f0eff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  a3       0x%08x\n", gpr->a3);
ffffffffc0200a8e:	742c                	ld	a1,104(s0)
ffffffffc0200a90:	00005517          	auipc	a0,0x5
ffffffffc0200a94:	78850513          	addi	a0,a0,1928 # ffffffffc0206218 <commands+0x330>
ffffffffc0200a98:	f00ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  a4       0x%08x\n", gpr->a4);
ffffffffc0200a9c:	782c                	ld	a1,112(s0)
ffffffffc0200a9e:	00005517          	auipc	a0,0x5
ffffffffc0200aa2:	79250513          	addi	a0,a0,1938 # ffffffffc0206230 <commands+0x348>
ffffffffc0200aa6:	ef2ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  a5       0x%08x\n", gpr->a5);
ffffffffc0200aaa:	7c2c                	ld	a1,120(s0)
ffffffffc0200aac:	00005517          	auipc	a0,0x5
ffffffffc0200ab0:	79c50513          	addi	a0,a0,1948 # ffffffffc0206248 <commands+0x360>
ffffffffc0200ab4:	ee4ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  a6       0x%08x\n", gpr->a6);
ffffffffc0200ab8:	604c                	ld	a1,128(s0)
ffffffffc0200aba:	00005517          	auipc	a0,0x5
ffffffffc0200abe:	7a650513          	addi	a0,a0,1958 # ffffffffc0206260 <commands+0x378>
ffffffffc0200ac2:	ed6ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  a7       0x%08x\n", gpr->a7);
ffffffffc0200ac6:	644c                	ld	a1,136(s0)
ffffffffc0200ac8:	00005517          	auipc	a0,0x5
ffffffffc0200acc:	7b050513          	addi	a0,a0,1968 # ffffffffc0206278 <commands+0x390>
ffffffffc0200ad0:	ec8ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s2       0x%08x\n", gpr->s2);
ffffffffc0200ad4:	684c                	ld	a1,144(s0)
ffffffffc0200ad6:	00005517          	auipc	a0,0x5
ffffffffc0200ada:	7ba50513          	addi	a0,a0,1978 # ffffffffc0206290 <commands+0x3a8>
ffffffffc0200ade:	ebaff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s3       0x%08x\n", gpr->s3);
ffffffffc0200ae2:	6c4c                	ld	a1,152(s0)
ffffffffc0200ae4:	00005517          	auipc	a0,0x5
ffffffffc0200ae8:	7c450513          	addi	a0,a0,1988 # ffffffffc02062a8 <commands+0x3c0>
ffffffffc0200aec:	eacff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s4       0x%08x\n", gpr->s4);
ffffffffc0200af0:	704c                	ld	a1,160(s0)
ffffffffc0200af2:	00005517          	auipc	a0,0x5
ffffffffc0200af6:	7ce50513          	addi	a0,a0,1998 # ffffffffc02062c0 <commands+0x3d8>
ffffffffc0200afa:	e9eff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s5       0x%08x\n", gpr->s5);
ffffffffc0200afe:	744c                	ld	a1,168(s0)
ffffffffc0200b00:	00005517          	auipc	a0,0x5
ffffffffc0200b04:	7d850513          	addi	a0,a0,2008 # ffffffffc02062d8 <commands+0x3f0>
ffffffffc0200b08:	e90ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s6       0x%08x\n", gpr->s6);
ffffffffc0200b0c:	784c                	ld	a1,176(s0)
ffffffffc0200b0e:	00005517          	auipc	a0,0x5
ffffffffc0200b12:	7e250513          	addi	a0,a0,2018 # ffffffffc02062f0 <commands+0x408>
ffffffffc0200b16:	e82ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s7       0x%08x\n", gpr->s7);
ffffffffc0200b1a:	7c4c                	ld	a1,184(s0)
ffffffffc0200b1c:	00005517          	auipc	a0,0x5
ffffffffc0200b20:	7ec50513          	addi	a0,a0,2028 # ffffffffc0206308 <commands+0x420>
ffffffffc0200b24:	e74ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s8       0x%08x\n", gpr->s8);
ffffffffc0200b28:	606c                	ld	a1,192(s0)
ffffffffc0200b2a:	00005517          	auipc	a0,0x5
ffffffffc0200b2e:	7f650513          	addi	a0,a0,2038 # ffffffffc0206320 <commands+0x438>
ffffffffc0200b32:	e66ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s9       0x%08x\n", gpr->s9);
ffffffffc0200b36:	646c                	ld	a1,200(s0)
ffffffffc0200b38:	00006517          	auipc	a0,0x6
ffffffffc0200b3c:	80050513          	addi	a0,a0,-2048 # ffffffffc0206338 <commands+0x450>
ffffffffc0200b40:	e58ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s10      0x%08x\n", gpr->s10);
ffffffffc0200b44:	686c                	ld	a1,208(s0)
ffffffffc0200b46:	00006517          	auipc	a0,0x6
ffffffffc0200b4a:	80a50513          	addi	a0,a0,-2038 # ffffffffc0206350 <commands+0x468>
ffffffffc0200b4e:	e4aff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  s11      0x%08x\n", gpr->s11);
ffffffffc0200b52:	6c6c                	ld	a1,216(s0)
ffffffffc0200b54:	00006517          	auipc	a0,0x6
ffffffffc0200b58:	81450513          	addi	a0,a0,-2028 # ffffffffc0206368 <commands+0x480>
ffffffffc0200b5c:	e3cff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  t3       0x%08x\n", gpr->t3);
ffffffffc0200b60:	706c                	ld	a1,224(s0)
ffffffffc0200b62:	00006517          	auipc	a0,0x6
ffffffffc0200b66:	81e50513          	addi	a0,a0,-2018 # ffffffffc0206380 <commands+0x498>
ffffffffc0200b6a:	e2eff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  t4       0x%08x\n", gpr->t4);
ffffffffc0200b6e:	746c                	ld	a1,232(s0)
ffffffffc0200b70:	00006517          	auipc	a0,0x6
ffffffffc0200b74:	82850513          	addi	a0,a0,-2008 # ffffffffc0206398 <commands+0x4b0>
ffffffffc0200b78:	e20ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  t5       0x%08x\n", gpr->t5);
ffffffffc0200b7c:	786c                	ld	a1,240(s0)
ffffffffc0200b7e:	00006517          	auipc	a0,0x6
ffffffffc0200b82:	83250513          	addi	a0,a0,-1998 # ffffffffc02063b0 <commands+0x4c8>
ffffffffc0200b86:	e12ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  t6       0x%08x\n", gpr->t6);
ffffffffc0200b8a:	7c6c                	ld	a1,248(s0)
}
ffffffffc0200b8c:	6402                	ld	s0,0(sp)
ffffffffc0200b8e:	60a2                	ld	ra,8(sp)
    cprintf("  t6       0x%08x\n", gpr->t6);
ffffffffc0200b90:	00006517          	auipc	a0,0x6
ffffffffc0200b94:	83850513          	addi	a0,a0,-1992 # ffffffffc02063c8 <commands+0x4e0>
}
ffffffffc0200b98:	0141                	addi	sp,sp,16
    cprintf("  t6       0x%08x\n", gpr->t6);
ffffffffc0200b9a:	dfeff06f          	j	ffffffffc0200198 <cprintf>

ffffffffc0200b9e <print_trapframe>:
{
ffffffffc0200b9e:	1141                	addi	sp,sp,-16
ffffffffc0200ba0:	e022                	sd	s0,0(sp)
    cprintf("trapframe at %p\n", tf);
ffffffffc0200ba2:	85aa                	mv	a1,a0
{
ffffffffc0200ba4:	842a                	mv	s0,a0
    cprintf("trapframe at %p\n", tf);
ffffffffc0200ba6:	00006517          	auipc	a0,0x6
ffffffffc0200baa:	83a50513          	addi	a0,a0,-1990 # ffffffffc02063e0 <commands+0x4f8>
{
ffffffffc0200bae:	e406                	sd	ra,8(sp)
    cprintf("trapframe at %p\n", tf);
ffffffffc0200bb0:	de8ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    print_regs(&tf->gpr);
ffffffffc0200bb4:	8522                	mv	a0,s0
ffffffffc0200bb6:	e1bff0ef          	jal	ra,ffffffffc02009d0 <print_regs>
    cprintf("  status   0x%08x\n", tf->status);
ffffffffc0200bba:	10043583          	ld	a1,256(s0)
ffffffffc0200bbe:	00006517          	auipc	a0,0x6
ffffffffc0200bc2:	83a50513          	addi	a0,a0,-1990 # ffffffffc02063f8 <commands+0x510>
ffffffffc0200bc6:	dd2ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  epc      0x%08x\n", tf->epc);
ffffffffc0200bca:	10843583          	ld	a1,264(s0)
ffffffffc0200bce:	00006517          	auipc	a0,0x6
ffffffffc0200bd2:	84250513          	addi	a0,a0,-1982 # ffffffffc0206410 <commands+0x528>
ffffffffc0200bd6:	dc2ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  tval 0x%08x\n", tf->tval);
ffffffffc0200bda:	11043583          	ld	a1,272(s0)
ffffffffc0200bde:	00006517          	auipc	a0,0x6
ffffffffc0200be2:	84a50513          	addi	a0,a0,-1974 # ffffffffc0206428 <commands+0x540>
ffffffffc0200be6:	db2ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
    cprintf("  cause    0x%08x\n", tf->cause);
ffffffffc0200bea:	11843583          	ld	a1,280(s0)
}
ffffffffc0200bee:	6402                	ld	s0,0(sp)
ffffffffc0200bf0:	60a2                	ld	ra,8(sp)
    cprintf("  cause    0x%08x\n", tf->cause);
ffffffffc0200bf2:	00006517          	auipc	a0,0x6
ffffffffc0200bf6:	84650513          	addi	a0,a0,-1978 # ffffffffc0206438 <commands+0x550>
}
ffffffffc0200bfa:	0141                	addi	sp,sp,16
    cprintf("  cause    0x%08x\n", tf->cause);
ffffffffc0200bfc:	d9cff06f          	j	ffffffffc0200198 <cprintf>

ffffffffc0200c00 <interrupt_handler>:

extern struct mm_struct *check_mm_struct;

void interrupt_handler(struct trapframe *tf)
{
    intptr_t cause = (tf->cause << 1) >> 1;
ffffffffc0200c00:	11853783          	ld	a5,280(a0)
ffffffffc0200c04:	472d                	li	a4,11
ffffffffc0200c06:	0786                	slli	a5,a5,0x1
ffffffffc0200c08:	8385                	srli	a5,a5,0x1
ffffffffc0200c0a:	08f76363          	bltu	a4,a5,ffffffffc0200c90 <interrupt_handler+0x90>
ffffffffc0200c0e:	00006717          	auipc	a4,0x6
ffffffffc0200c12:	8f270713          	addi	a4,a4,-1806 # ffffffffc0206500 <commands+0x618>
ffffffffc0200c16:	078a                	slli	a5,a5,0x2
ffffffffc0200c18:	97ba                	add	a5,a5,a4
ffffffffc0200c1a:	439c                	lw	a5,0(a5)
ffffffffc0200c1c:	97ba                	add	a5,a5,a4
ffffffffc0200c1e:	8782                	jr	a5
        break;
    case IRQ_H_SOFT:
        cprintf("Hypervisor software interrupt\n");
        break;
    case IRQ_M_SOFT:
        cprintf("Machine software interrupt\n");
ffffffffc0200c20:	00006517          	auipc	a0,0x6
ffffffffc0200c24:	89050513          	addi	a0,a0,-1904 # ffffffffc02064b0 <commands+0x5c8>
ffffffffc0200c28:	d70ff06f          	j	ffffffffc0200198 <cprintf>
        cprintf("Hypervisor software interrupt\n");
ffffffffc0200c2c:	00006517          	auipc	a0,0x6
ffffffffc0200c30:	86450513          	addi	a0,a0,-1948 # ffffffffc0206490 <commands+0x5a8>
ffffffffc0200c34:	d64ff06f          	j	ffffffffc0200198 <cprintf>
        cprintf("User software interrupt\n");
ffffffffc0200c38:	00006517          	auipc	a0,0x6
ffffffffc0200c3c:	81850513          	addi	a0,a0,-2024 # ffffffffc0206450 <commands+0x568>
ffffffffc0200c40:	d58ff06f          	j	ffffffffc0200198 <cprintf>
        cprintf("Supervisor software interrupt\n");
ffffffffc0200c44:	00006517          	auipc	a0,0x6
ffffffffc0200c48:	82c50513          	addi	a0,a0,-2004 # ffffffffc0206470 <commands+0x588>
ffffffffc0200c4c:	d4cff06f          	j	ffffffffc0200198 <cprintf>
{
ffffffffc0200c50:	1141                	addi	sp,sp,-16
ffffffffc0200c52:	e406                	sd	ra,8(sp)
        /*(1)设置下次时钟中断- clock_set_next_event()
         *(2)计数器（ticks）加一
         *(3)当计数器加到100的时候，我们会输出一个`100ticks`表示我们触发了100次时钟中断，同时打印次数（num）加一
         * (4)判断打印次数，当打印次数为10时，调用<sbi.h>中的关机函数关机
         */
        clock_set_next_event();
ffffffffc0200c54:	91bff0ef          	jal	ra,ffffffffc020056e <clock_set_next_event>
        ticks ++;
ffffffffc0200c58:	000c6797          	auipc	a5,0xc6
ffffffffc0200c5c:	e5078793          	addi	a5,a5,-432 # ffffffffc02c6aa8 <ticks>
ffffffffc0200c60:	6398                	ld	a4,0(a5)
ffffffffc0200c62:	0705                	addi	a4,a4,1
ffffffffc0200c64:	e398                	sd	a4,0(a5)
        if (ticks % TICK_NUM == 0) {
ffffffffc0200c66:	639c                	ld	a5,0(a5)
ffffffffc0200c68:	06400713          	li	a4,100
ffffffffc0200c6c:	02e7f7b3          	remu	a5,a5,a4
ffffffffc0200c70:	c785                	beqz	a5,ffffffffc0200c98 <interrupt_handler+0x98>
            print_ticks();
        }
        // lab6: YOUR CODE  (update LAB3 steps)
        //  在时钟中断时调用调度器的 sched_class_proc_tick 函数
        if (current != NULL) { sched_class_proc_tick(current); }
ffffffffc0200c72:	000c6517          	auipc	a0,0xc6
ffffffffc0200c76:	e8653503          	ld	a0,-378(a0) # ffffffffc02c6af8 <current>
ffffffffc0200c7a:	cd01                	beqz	a0,ffffffffc0200c92 <interrupt_handler+0x92>
        break;
    default:
        print_trapframe(tf);
        break;
    }
}
ffffffffc0200c7c:	60a2                	ld	ra,8(sp)
ffffffffc0200c7e:	0141                	addi	sp,sp,16
        if (current != NULL) { sched_class_proc_tick(current); }
ffffffffc0200c80:	0410406f          	j	ffffffffc02054c0 <sched_class_proc_tick>
        cprintf("Supervisor external interrupt\n");
ffffffffc0200c84:	00006517          	auipc	a0,0x6
ffffffffc0200c88:	85c50513          	addi	a0,a0,-1956 # ffffffffc02064e0 <commands+0x5f8>
ffffffffc0200c8c:	d0cff06f          	j	ffffffffc0200198 <cprintf>
        print_trapframe(tf);
ffffffffc0200c90:	b739                	j	ffffffffc0200b9e <print_trapframe>
}
ffffffffc0200c92:	60a2                	ld	ra,8(sp)
ffffffffc0200c94:	0141                	addi	sp,sp,16
ffffffffc0200c96:	8082                	ret
    cprintf("%d ticks\n", TICK_NUM);
ffffffffc0200c98:	06400593          	li	a1,100
ffffffffc0200c9c:	00006517          	auipc	a0,0x6
ffffffffc0200ca0:	83450513          	addi	a0,a0,-1996 # ffffffffc02064d0 <commands+0x5e8>
ffffffffc0200ca4:	cf4ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
}
ffffffffc0200ca8:	b7e9                	j	ffffffffc0200c72 <interrupt_handler+0x72>

ffffffffc0200caa <exception_handler>:
void kernel_execve_ret(struct trapframe *tf, uintptr_t kstacktop);
void exception_handler(struct trapframe *tf)
{
    int ret;
    switch (tf->cause)
ffffffffc0200caa:	11853783          	ld	a5,280(a0)
{
ffffffffc0200cae:	1141                	addi	sp,sp,-16
ffffffffc0200cb0:	e022                	sd	s0,0(sp)
ffffffffc0200cb2:	e406                	sd	ra,8(sp)
ffffffffc0200cb4:	473d                	li	a4,15
ffffffffc0200cb6:	842a                	mv	s0,a0
ffffffffc0200cb8:	0cf76263          	bltu	a4,a5,ffffffffc0200d7c <exception_handler+0xd2>
ffffffffc0200cbc:	00006717          	auipc	a4,0x6
ffffffffc0200cc0:	a0470713          	addi	a4,a4,-1532 # ffffffffc02066c0 <commands+0x7d8>
ffffffffc0200cc4:	078a                	slli	a5,a5,0x2
ffffffffc0200cc6:	97ba                	add	a5,a5,a4
ffffffffc0200cc8:	439c                	lw	a5,0(a5)
ffffffffc0200cca:	97ba                	add	a5,a5,a4
ffffffffc0200ccc:	8782                	jr	a5
        // cprintf("Environment call from U-mode\n");
        tf->epc += 4;
        syscall();
        break;
    case CAUSE_SUPERVISOR_ECALL:
        cprintf("Environment call from S-mode\n");
ffffffffc0200cce:	00006517          	auipc	a0,0x6
ffffffffc0200cd2:	94a50513          	addi	a0,a0,-1718 # ffffffffc0206618 <commands+0x730>
ffffffffc0200cd6:	cc2ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
        tf->epc += 4;
ffffffffc0200cda:	10843783          	ld	a5,264(s0)
        do_exit(-E_KILLED); break;
    default:
        print_trapframe(tf);
        break;
    }
}
ffffffffc0200cde:	60a2                	ld	ra,8(sp)
        tf->epc += 4;
ffffffffc0200ce0:	0791                	addi	a5,a5,4
ffffffffc0200ce2:	10f43423          	sd	a5,264(s0)
}
ffffffffc0200ce6:	6402                	ld	s0,0(sp)
ffffffffc0200ce8:	0141                	addi	sp,sp,16
        syscall();
ffffffffc0200cea:	2410406f          	j	ffffffffc020572a <syscall>
        cprintf("Environment call from H-mode\n");
ffffffffc0200cee:	00006517          	auipc	a0,0x6
ffffffffc0200cf2:	94a50513          	addi	a0,a0,-1718 # ffffffffc0206638 <commands+0x750>
}
ffffffffc0200cf6:	6402                	ld	s0,0(sp)
ffffffffc0200cf8:	60a2                	ld	ra,8(sp)
ffffffffc0200cfa:	0141                	addi	sp,sp,16
        cprintf("Instruction access fault\n");
ffffffffc0200cfc:	c9cff06f          	j	ffffffffc0200198 <cprintf>
        cprintf("Environment call from M-mode\n");
ffffffffc0200d00:	00006517          	auipc	a0,0x6
ffffffffc0200d04:	95850513          	addi	a0,a0,-1704 # ffffffffc0206658 <commands+0x770>
ffffffffc0200d08:	b7fd                	j	ffffffffc0200cf6 <exception_handler+0x4c>
        cprintf("Instruction page fault\n");
ffffffffc0200d0a:	00006517          	auipc	a0,0x6
ffffffffc0200d0e:	96e50513          	addi	a0,a0,-1682 # ffffffffc0206678 <commands+0x790>
        cprintf("Store/AMO page fault\n");
ffffffffc0200d12:	c86ff0ef          	jal	ra,ffffffffc0200198 <cprintf>
}
ffffffffc0200d16:	6402                	ld	s0,0(sp)
ffffffffc0200d18:	60a2                	ld	ra,8(sp)
        do_exit(-E_KILLED); break;
ffffffffc0200d1a:	555d                	li	a0,-9
}
ffffffffc0200d1c:	0141                	addi	sp,sp,16
        do_exit(-E_KILLED); break;
ffffffffc0200d1e:	5a60306f          	j	ffffffffc02042c4 <do_exit>
        cprintf("Load page fault\n");
ffffffffc0200d22:	00006517          	auipc	a0,0x6
ffffffffc0200d26:	96e50513          	addi	a0,a0,-1682 # ffffffffc0206690 <commands+0x7a8>
ffffffffc0200d2a:	b7e5                	j	ffffffffc0200d12 <exception_handler+0x68>
        cprintf("Store/AMO page fault\n");
ffffffffc0200d2c:	00006517          	auipc	a0,0x6
ffffffffc0200d30:	97c50513          	addi	a0,a0,-1668 # ffffffffc02066a8 <commands+0x7c0>
ffffffffc0200d34:	bff9                	j	ffffffffc0200d12 <exception_handler+0x68>
        cprintf("Instruction address misaligned\n");
ffffffffc0200d36:	00005517          	auipc	a0,0x5
ffffffffc0200d3a:	7fa50513          	addi	a0,a0,2042 # ffffffffc0206530 <commands+0x648>
ffffffffc0200d3e:	bf65                	j	ffffffffc0200cf6 <exception_handler+0x4c>
        cprintf("Instruction access fault\n");
ffffffffc0200d40:	00006517          	auipc	a0,0x6
ffffffffc0200d44:	81050513          	addi	a0,a0,-2032 # ffffffffc0206550 <commands+0x668>
ffffffffc0200d48:	b77d                	j	ffffffffc0200cf6 <exception_handler+0x4c>
        cprintf("Illegal instruction\n");
ffffffffc0200d4a:	00006517          	auipc	a0,0x6
ffffffffc0200d4e:	82650513          	addi	a0,a0,-2010 # ffffffffc0206570 <commands+0x688>
ffffffffc0200d52:	b755                	j	ffffffffc0200cf6 <exception_handler+0x4c>
        cprintf("Breakpoint\n");
ffffffffc0200d54:	00006517          	auipc	a0,0x6
ffffffffc0200d58:	83450513          	addi	a0,a0,-1996 # ffffffffc0206588 <commands+0x6a0>
ffffffffc0200d5c:	bf69                	j	ffffffffc0200cf6 <exception_handler+0x4c>
        cprintf("Load address misaligned\n");
ffffffffc0200d5e:	00006517          	auipc	a0,0x6
ffffffffc0200d62:	83a50513          	addi	a0,a0,-1990 # ffffffffc0206598 <commands+0x6b0>
ffffffffc0200d66:	bf41                	j	ffffffffc0200cf6 <exception_handler+0x4c>
        cprintf("Load access fault\n");
ffffffffc0200d68:	00006517          	auipc	a0,0x6
ffffffffc0200d6c:	85050513          	addi	a0,a0,-1968 # ffffffffc02065b8 <commands+0x6d0>
ffffffffc0200d70:	b759                	j	ffffffffc0200cf6 <exception_handler+0x4c>
        cprintf("Store/AMO access fault\n");
ffffffffc0200d72:	00006517          	auipc	a0,0x6
ffffffffc0200d76:	88e50513          	addi	a0,a0,-1906 # ffffffffc0206600 <commands+0x718>
ffffffffc0200d7a:	bfb5                	j	ffffffffc0200cf6 <exception_handler+0x4c>
        print_trapframe(tf);
ffffffffc0200d7c:	8522                	mv	a0,s0
}
ffffffffc0200d7e:	6402                	ld	s0,0(sp)
ffffffffc0200d80:	60a2                	ld	ra,8(sp)
ffffffffc0200d82:	0141                	addi	sp,sp,16
        print_trapframe(tf);
ffffffffc0200d84:	bd29                	j	ffffffffc0200b9e <print_trapframe>
        panic("AMO address misaligned\n");
ffffffffc0200d86:	00006617          	auipc	a2,0x6
ffffffffc0200d8a:	84a60613          	addi	a2,a2,-1974 # ffffffffc02065d0 <commands+0x6e8>
ffffffffc0200d8e:	0bd00593          	li	a1,189
ffffffffc0200d92:	00006517          	auipc	a0,0x6
ffffffffc0200d96:	85650513          	addi	a0,a0,-1962 # ffffffffc02065e8 <commands+0x700>
ffffffffc0200d9a:	ef8ff0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0200d9e <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void trap(struct trapframe *tf)
{
ffffffffc0200d9e:	1101                	addi	sp,sp,-32
ffffffffc0200da0:	e822                	sd	s0,16(sp)
    // dispatch based on what type of trap occurred
    //    cputs("some trap");
    if (current == NULL)
ffffffffc0200da2:	000c6417          	auipc	s0,0xc6
ffffffffc0200da6:	d5640413          	addi	s0,s0,-682 # ffffffffc02c6af8 <current>
ffffffffc0200daa:	6018                	ld	a4,0(s0)
{
ffffffffc0200dac:	ec06                	sd	ra,24(sp)
ffffffffc0200dae:	e426                	sd	s1,8(sp)
ffffffffc0200db0:	e04a                	sd	s2,0(sp)
    if ((intptr_t)tf->cause < 0)
ffffffffc0200db2:	11853683          	ld	a3,280(a0)
    if (current == NULL)
ffffffffc0200db6:	cf1d                	beqz	a4,ffffffffc0200df4 <trap+0x56>
    return (tf->status & SSTATUS_SPP) != 0;
ffffffffc0200db8:	10053483          	ld	s1,256(a0)
    {
        trap_dispatch(tf);
    }
    else
    {
        struct trapframe *otf = current->tf;
ffffffffc0200dbc:	0a073903          	ld	s2,160(a4)
        current->tf = tf;
ffffffffc0200dc0:	f348                	sd	a0,160(a4)
    return (tf->status & SSTATUS_SPP) != 0;
ffffffffc0200dc2:	1004f493          	andi	s1,s1,256
    if ((intptr_t)tf->cause < 0)
ffffffffc0200dc6:	0206c463          	bltz	a3,ffffffffc0200dee <trap+0x50>
        exception_handler(tf);
ffffffffc0200dca:	ee1ff0ef          	jal	ra,ffffffffc0200caa <exception_handler>

        bool in_kernel = trap_in_kernel(tf);

        trap_dispatch(tf);

        current->tf = otf;
ffffffffc0200dce:	601c                	ld	a5,0(s0)
ffffffffc0200dd0:	0b27b023          	sd	s2,160(a5)
        if (!in_kernel)
ffffffffc0200dd4:	e499                	bnez	s1,ffffffffc0200de2 <trap+0x44>
        {
            if (current->flags & PF_EXITING)
ffffffffc0200dd6:	0b07a703          	lw	a4,176(a5)
ffffffffc0200dda:	8b05                	andi	a4,a4,1
ffffffffc0200ddc:	e329                	bnez	a4,ffffffffc0200e1e <trap+0x80>
            {
                do_exit(-E_KILLED);
            }
            if (current->need_resched)
ffffffffc0200dde:	6f9c                	ld	a5,24(a5)
ffffffffc0200de0:	eb85                	bnez	a5,ffffffffc0200e10 <trap+0x72>
            {
                schedule();
            }
        }
    }
}
ffffffffc0200de2:	60e2                	ld	ra,24(sp)
ffffffffc0200de4:	6442                	ld	s0,16(sp)
ffffffffc0200de6:	64a2                	ld	s1,8(sp)
ffffffffc0200de8:	6902                	ld	s2,0(sp)
ffffffffc0200dea:	6105                	addi	sp,sp,32
ffffffffc0200dec:	8082                	ret
        interrupt_handler(tf);
ffffffffc0200dee:	e13ff0ef          	jal	ra,ffffffffc0200c00 <interrupt_handler>
ffffffffc0200df2:	bff1                	j	ffffffffc0200dce <trap+0x30>
    if ((intptr_t)tf->cause < 0)
ffffffffc0200df4:	0006c863          	bltz	a3,ffffffffc0200e04 <trap+0x66>
}
ffffffffc0200df8:	6442                	ld	s0,16(sp)
ffffffffc0200dfa:	60e2                	ld	ra,24(sp)
ffffffffc0200dfc:	64a2                	ld	s1,8(sp)
ffffffffc0200dfe:	6902                	ld	s2,0(sp)
ffffffffc0200e00:	6105                	addi	sp,sp,32
        exception_handler(tf);
ffffffffc0200e02:	b565                	j	ffffffffc0200caa <exception_handler>
}
ffffffffc0200e04:	6442                	ld	s0,16(sp)
ffffffffc0200e06:	60e2                	ld	ra,24(sp)
ffffffffc0200e08:	64a2                	ld	s1,8(sp)
ffffffffc0200e0a:	6902                	ld	s2,0(sp)
ffffffffc0200e0c:	6105                	addi	sp,sp,32
        interrupt_handler(tf);
ffffffffc0200e0e:	bbcd                	j	ffffffffc0200c00 <interrupt_handler>
}
ffffffffc0200e10:	6442                	ld	s0,16(sp)
ffffffffc0200e12:	60e2                	ld	ra,24(sp)
ffffffffc0200e14:	64a2                	ld	s1,8(sp)
ffffffffc0200e16:	6902                	ld	s2,0(sp)
ffffffffc0200e18:	6105                	addi	sp,sp,32
                schedule();
ffffffffc0200e1a:	7d20406f          	j	ffffffffc02055ec <schedule>
                do_exit(-E_KILLED);
ffffffffc0200e1e:	555d                	li	a0,-9
ffffffffc0200e20:	4a4030ef          	jal	ra,ffffffffc02042c4 <do_exit>
            if (current->need_resched)
ffffffffc0200e24:	601c                	ld	a5,0(s0)
ffffffffc0200e26:	bf65                	j	ffffffffc0200dde <trap+0x40>

ffffffffc0200e28 <__alltraps>:
    LOAD x2, 2*REGBYTES(sp)
    .endm

    .globl __alltraps
__alltraps:
    SAVE_ALL
ffffffffc0200e28:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0200e2c:	00011463          	bnez	sp,ffffffffc0200e34 <__alltraps+0xc>
ffffffffc0200e30:	14002173          	csrr	sp,sscratch
ffffffffc0200e34:	712d                	addi	sp,sp,-288
ffffffffc0200e36:	e002                	sd	zero,0(sp)
ffffffffc0200e38:	e406                	sd	ra,8(sp)
ffffffffc0200e3a:	ec0e                	sd	gp,24(sp)
ffffffffc0200e3c:	f012                	sd	tp,32(sp)
ffffffffc0200e3e:	f416                	sd	t0,40(sp)
ffffffffc0200e40:	f81a                	sd	t1,48(sp)
ffffffffc0200e42:	fc1e                	sd	t2,56(sp)
ffffffffc0200e44:	e0a2                	sd	s0,64(sp)
ffffffffc0200e46:	e4a6                	sd	s1,72(sp)
ffffffffc0200e48:	e8aa                	sd	a0,80(sp)
ffffffffc0200e4a:	ecae                	sd	a1,88(sp)
ffffffffc0200e4c:	f0b2                	sd	a2,96(sp)
ffffffffc0200e4e:	f4b6                	sd	a3,104(sp)
ffffffffc0200e50:	f8ba                	sd	a4,112(sp)
ffffffffc0200e52:	fcbe                	sd	a5,120(sp)
ffffffffc0200e54:	e142                	sd	a6,128(sp)
ffffffffc0200e56:	e546                	sd	a7,136(sp)
ffffffffc0200e58:	e94a                	sd	s2,144(sp)
ffffffffc0200e5a:	ed4e                	sd	s3,152(sp)
ffffffffc0200e5c:	f152                	sd	s4,160(sp)
ffffffffc0200e5e:	f556                	sd	s5,168(sp)
ffffffffc0200e60:	f95a                	sd	s6,176(sp)
ffffffffc0200e62:	fd5e                	sd	s7,184(sp)
ffffffffc0200e64:	e1e2                	sd	s8,192(sp)
ffffffffc0200e66:	e5e6                	sd	s9,200(sp)
ffffffffc0200e68:	e9ea                	sd	s10,208(sp)
ffffffffc0200e6a:	edee                	sd	s11,216(sp)
ffffffffc0200e6c:	f1f2                	sd	t3,224(sp)
ffffffffc0200e6e:	f5f6                	sd	t4,232(sp)
ffffffffc0200e70:	f9fa                	sd	t5,240(sp)
ffffffffc0200e72:	fdfe                	sd	t6,248(sp)
ffffffffc0200e74:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0200e78:	100024f3          	csrr	s1,sstatus
ffffffffc0200e7c:	14102973          	csrr	s2,sepc
ffffffffc0200e80:	143029f3          	csrr	s3,stval
ffffffffc0200e84:	14202a73          	csrr	s4,scause
ffffffffc0200e88:	e822                	sd	s0,16(sp)
ffffffffc0200e8a:	e226                	sd	s1,256(sp)
ffffffffc0200e8c:	e64a                	sd	s2,264(sp)
ffffffffc0200e8e:	ea4e                	sd	s3,272(sp)
ffffffffc0200e90:	ee52                	sd	s4,280(sp)

    move  a0, sp
ffffffffc0200e92:	850a                	mv	a0,sp
    jal trap
ffffffffc0200e94:	f0bff0ef          	jal	ra,ffffffffc0200d9e <trap>

ffffffffc0200e98 <__trapret>:
    # sp should be the same as before "jal trap"

    .globl __trapret
__trapret:
    RESTORE_ALL
ffffffffc0200e98:	6492                	ld	s1,256(sp)
ffffffffc0200e9a:	6932                	ld	s2,264(sp)
ffffffffc0200e9c:	1004f413          	andi	s0,s1,256
ffffffffc0200ea0:	e401                	bnez	s0,ffffffffc0200ea8 <__trapret+0x10>
ffffffffc0200ea2:	1200                	addi	s0,sp,288
ffffffffc0200ea4:	14041073          	csrw	sscratch,s0
ffffffffc0200ea8:	10049073          	csrw	sstatus,s1
ffffffffc0200eac:	14191073          	csrw	sepc,s2
ffffffffc0200eb0:	60a2                	ld	ra,8(sp)
ffffffffc0200eb2:	61e2                	ld	gp,24(sp)
ffffffffc0200eb4:	7202                	ld	tp,32(sp)
ffffffffc0200eb6:	72a2                	ld	t0,40(sp)
ffffffffc0200eb8:	7342                	ld	t1,48(sp)
ffffffffc0200eba:	73e2                	ld	t2,56(sp)
ffffffffc0200ebc:	6406                	ld	s0,64(sp)
ffffffffc0200ebe:	64a6                	ld	s1,72(sp)
ffffffffc0200ec0:	6546                	ld	a0,80(sp)
ffffffffc0200ec2:	65e6                	ld	a1,88(sp)
ffffffffc0200ec4:	7606                	ld	a2,96(sp)
ffffffffc0200ec6:	76a6                	ld	a3,104(sp)
ffffffffc0200ec8:	7746                	ld	a4,112(sp)
ffffffffc0200eca:	77e6                	ld	a5,120(sp)
ffffffffc0200ecc:	680a                	ld	a6,128(sp)
ffffffffc0200ece:	68aa                	ld	a7,136(sp)
ffffffffc0200ed0:	694a                	ld	s2,144(sp)
ffffffffc0200ed2:	69ea                	ld	s3,152(sp)
ffffffffc0200ed4:	7a0a                	ld	s4,160(sp)
ffffffffc0200ed6:	7aaa                	ld	s5,168(sp)
ffffffffc0200ed8:	7b4a                	ld	s6,176(sp)
ffffffffc0200eda:	7bea                	ld	s7,184(sp)
ffffffffc0200edc:	6c0e                	ld	s8,192(sp)
ffffffffc0200ede:	6cae                	ld	s9,200(sp)
ffffffffc0200ee0:	6d4e                	ld	s10,208(sp)
ffffffffc0200ee2:	6dee                	ld	s11,216(sp)
ffffffffc0200ee4:	7e0e                	ld	t3,224(sp)
ffffffffc0200ee6:	7eae                	ld	t4,232(sp)
ffffffffc0200ee8:	7f4e                	ld	t5,240(sp)
ffffffffc0200eea:	7fee                	ld	t6,248(sp)
ffffffffc0200eec:	6142                	ld	sp,16(sp)
    # return from supervisor call
    sret
ffffffffc0200eee:	10200073          	sret

ffffffffc0200ef2 <forkrets>:
 
    .globl forkrets
forkrets:
    # set stack to this new process's trapframe
    move sp, a0
ffffffffc0200ef2:	812a                	mv	sp,a0
ffffffffc0200ef4:	b755                	j	ffffffffc0200e98 <__trapret>

ffffffffc0200ef6 <default_init>:
 * list_init - initialize a new entry
 * @elm:        new entry to be initialized
 * */
static inline void
list_init(list_entry_t *elm) {
    elm->prev = elm->next = elm;
ffffffffc0200ef6:	000c2797          	auipc	a5,0xc2
ffffffffc0200efa:	b5278793          	addi	a5,a5,-1198 # ffffffffc02c2a48 <free_area>
ffffffffc0200efe:	e79c                	sd	a5,8(a5)
ffffffffc0200f00:	e39c                	sd	a5,0(a5)

static void
default_init(void)
{
    list_init(&free_list);
    nr_free = 0;
ffffffffc0200f02:	0007a823          	sw	zero,16(a5)
}
ffffffffc0200f06:	8082                	ret

ffffffffc0200f08 <default_nr_free_pages>:

static size_t
default_nr_free_pages(void)
{
    return nr_free;
}
ffffffffc0200f08:	000c2517          	auipc	a0,0xc2
ffffffffc0200f0c:	b5056503          	lwu	a0,-1200(a0) # ffffffffc02c2a58 <free_area+0x10>
ffffffffc0200f10:	8082                	ret

ffffffffc0200f12 <default_check>:

// LAB2: below code is used to check the first fit allocation algorithm (your EXERCISE 1)
// NOTICE: You SHOULD NOT CHANGE basic_check, default_check functions!
static void
default_check(void)
{
ffffffffc0200f12:	715d                	addi	sp,sp,-80
ffffffffc0200f14:	e0a2                	sd	s0,64(sp)
 * list_next - get the next entry
 * @listelm:    the list head
 **/
static inline list_entry_t *
list_next(list_entry_t *listelm) {
    return listelm->next;
ffffffffc0200f16:	000c2417          	auipc	s0,0xc2
ffffffffc0200f1a:	b3240413          	addi	s0,s0,-1230 # ffffffffc02c2a48 <free_area>
ffffffffc0200f1e:	641c                	ld	a5,8(s0)
ffffffffc0200f20:	e486                	sd	ra,72(sp)
ffffffffc0200f22:	fc26                	sd	s1,56(sp)
ffffffffc0200f24:	f84a                	sd	s2,48(sp)
ffffffffc0200f26:	f44e                	sd	s3,40(sp)
ffffffffc0200f28:	f052                	sd	s4,32(sp)
ffffffffc0200f2a:	ec56                	sd	s5,24(sp)
ffffffffc0200f2c:	e85a                	sd	s6,16(sp)
ffffffffc0200f2e:	e45e                	sd	s7,8(sp)
ffffffffc0200f30:	e062                	sd	s8,0(sp)
    int count = 0, total = 0;
    list_entry_t *le = &free_list;
    while ((le = list_next(le)) != &free_list)
ffffffffc0200f32:	2a878d63          	beq	a5,s0,ffffffffc02011ec <default_check+0x2da>
    int count = 0, total = 0;
ffffffffc0200f36:	4481                	li	s1,0
ffffffffc0200f38:	4901                	li	s2,0
 * test_bit - Determine whether a bit is set
 * @nr:     the bit to test
 * @addr:   the address to count from
 * */
static inline bool test_bit(int nr, volatile void *addr) {
    return (((*(volatile unsigned long *)addr) >> nr) & 1);
ffffffffc0200f3a:	ff07b703          	ld	a4,-16(a5)
    {
        struct Page *p = le2page(le, page_link);
        assert(PageProperty(p));
ffffffffc0200f3e:	8b09                	andi	a4,a4,2
ffffffffc0200f40:	2a070a63          	beqz	a4,ffffffffc02011f4 <default_check+0x2e2>
        count++, total += p->property;
ffffffffc0200f44:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200f48:	679c                	ld	a5,8(a5)
ffffffffc0200f4a:	2905                	addiw	s2,s2,1
ffffffffc0200f4c:	9cb9                	addw	s1,s1,a4
    while ((le = list_next(le)) != &free_list)
ffffffffc0200f4e:	fe8796e3          	bne	a5,s0,ffffffffc0200f3a <default_check+0x28>
    }
    assert(total == nr_free_pages());
ffffffffc0200f52:	89a6                	mv	s3,s1
ffffffffc0200f54:	6df000ef          	jal	ra,ffffffffc0201e32 <nr_free_pages>
ffffffffc0200f58:	6f351e63          	bne	a0,s3,ffffffffc0201654 <default_check+0x742>
    assert((p0 = alloc_page()) != NULL);
ffffffffc0200f5c:	4505                	li	a0,1
ffffffffc0200f5e:	657000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc0200f62:	8aaa                	mv	s5,a0
ffffffffc0200f64:	42050863          	beqz	a0,ffffffffc0201394 <default_check+0x482>
    assert((p1 = alloc_page()) != NULL);
ffffffffc0200f68:	4505                	li	a0,1
ffffffffc0200f6a:	64b000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc0200f6e:	89aa                	mv	s3,a0
ffffffffc0200f70:	70050263          	beqz	a0,ffffffffc0201674 <default_check+0x762>
    assert((p2 = alloc_page()) != NULL);
ffffffffc0200f74:	4505                	li	a0,1
ffffffffc0200f76:	63f000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc0200f7a:	8a2a                	mv	s4,a0
ffffffffc0200f7c:	48050c63          	beqz	a0,ffffffffc0201414 <default_check+0x502>
    assert(p0 != p1 && p0 != p2 && p1 != p2);
ffffffffc0200f80:	293a8a63          	beq	s5,s3,ffffffffc0201214 <default_check+0x302>
ffffffffc0200f84:	28aa8863          	beq	s5,a0,ffffffffc0201214 <default_check+0x302>
ffffffffc0200f88:	28a98663          	beq	s3,a0,ffffffffc0201214 <default_check+0x302>
    assert(page_ref(p0) == 0 && page_ref(p1) == 0 && page_ref(p2) == 0);
ffffffffc0200f8c:	000aa783          	lw	a5,0(s5)
ffffffffc0200f90:	2a079263          	bnez	a5,ffffffffc0201234 <default_check+0x322>
ffffffffc0200f94:	0009a783          	lw	a5,0(s3)
ffffffffc0200f98:	28079e63          	bnez	a5,ffffffffc0201234 <default_check+0x322>
ffffffffc0200f9c:	411c                	lw	a5,0(a0)
ffffffffc0200f9e:	28079b63          	bnez	a5,ffffffffc0201234 <default_check+0x322>
extern uint_t va_pa_offset;

static inline ppn_t
page2ppn(struct Page *page)
{
    return page - pages + nbase;
ffffffffc0200fa2:	000c6797          	auipc	a5,0xc6
ffffffffc0200fa6:	b3e7b783          	ld	a5,-1218(a5) # ffffffffc02c6ae0 <pages>
ffffffffc0200faa:	40fa8733          	sub	a4,s5,a5
ffffffffc0200fae:	00007617          	auipc	a2,0x7
ffffffffc0200fb2:	57263603          	ld	a2,1394(a2) # ffffffffc0208520 <nbase>
ffffffffc0200fb6:	8719                	srai	a4,a4,0x6
ffffffffc0200fb8:	9732                	add	a4,a4,a2
    assert(page2pa(p0) < npage * PGSIZE);
ffffffffc0200fba:	000c6697          	auipc	a3,0xc6
ffffffffc0200fbe:	b1e6b683          	ld	a3,-1250(a3) # ffffffffc02c6ad8 <npage>
ffffffffc0200fc2:	06b2                	slli	a3,a3,0xc
}

static inline uintptr_t
page2pa(struct Page *page)
{
    return page2ppn(page) << PGSHIFT;
ffffffffc0200fc4:	0732                	slli	a4,a4,0xc
ffffffffc0200fc6:	28d77763          	bgeu	a4,a3,ffffffffc0201254 <default_check+0x342>
    return page - pages + nbase;
ffffffffc0200fca:	40f98733          	sub	a4,s3,a5
ffffffffc0200fce:	8719                	srai	a4,a4,0x6
ffffffffc0200fd0:	9732                	add	a4,a4,a2
    return page2ppn(page) << PGSHIFT;
ffffffffc0200fd2:	0732                	slli	a4,a4,0xc
    assert(page2pa(p1) < npage * PGSIZE);
ffffffffc0200fd4:	4cd77063          	bgeu	a4,a3,ffffffffc0201494 <default_check+0x582>
    return page - pages + nbase;
ffffffffc0200fd8:	40f507b3          	sub	a5,a0,a5
ffffffffc0200fdc:	8799                	srai	a5,a5,0x6
ffffffffc0200fde:	97b2                	add	a5,a5,a2
    return page2ppn(page) << PGSHIFT;
ffffffffc0200fe0:	07b2                	slli	a5,a5,0xc
    assert(page2pa(p2) < npage * PGSIZE);
ffffffffc0200fe2:	30d7f963          	bgeu	a5,a3,ffffffffc02012f4 <default_check+0x3e2>
    assert(alloc_page() == NULL);
ffffffffc0200fe6:	4505                	li	a0,1
    list_entry_t free_list_store = free_list;
ffffffffc0200fe8:	00043c03          	ld	s8,0(s0)
ffffffffc0200fec:	00843b83          	ld	s7,8(s0)
    unsigned int nr_free_store = nr_free;
ffffffffc0200ff0:	01042b03          	lw	s6,16(s0)
    elm->prev = elm->next = elm;
ffffffffc0200ff4:	e400                	sd	s0,8(s0)
ffffffffc0200ff6:	e000                	sd	s0,0(s0)
    nr_free = 0;
ffffffffc0200ff8:	000c2797          	auipc	a5,0xc2
ffffffffc0200ffc:	a607a023          	sw	zero,-1440(a5) # ffffffffc02c2a58 <free_area+0x10>
    assert(alloc_page() == NULL);
ffffffffc0201000:	5b5000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc0201004:	2c051863          	bnez	a0,ffffffffc02012d4 <default_check+0x3c2>
    free_page(p0);
ffffffffc0201008:	4585                	li	a1,1
ffffffffc020100a:	8556                	mv	a0,s5
ffffffffc020100c:	5e7000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    free_page(p1);
ffffffffc0201010:	4585                	li	a1,1
ffffffffc0201012:	854e                	mv	a0,s3
ffffffffc0201014:	5df000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    free_page(p2);
ffffffffc0201018:	4585                	li	a1,1
ffffffffc020101a:	8552                	mv	a0,s4
ffffffffc020101c:	5d7000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    assert(nr_free == 3);
ffffffffc0201020:	4818                	lw	a4,16(s0)
ffffffffc0201022:	478d                	li	a5,3
ffffffffc0201024:	28f71863          	bne	a4,a5,ffffffffc02012b4 <default_check+0x3a2>
    assert((p0 = alloc_page()) != NULL);
ffffffffc0201028:	4505                	li	a0,1
ffffffffc020102a:	58b000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc020102e:	89aa                	mv	s3,a0
ffffffffc0201030:	26050263          	beqz	a0,ffffffffc0201294 <default_check+0x382>
    assert((p1 = alloc_page()) != NULL);
ffffffffc0201034:	4505                	li	a0,1
ffffffffc0201036:	57f000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc020103a:	8aaa                	mv	s5,a0
ffffffffc020103c:	3a050c63          	beqz	a0,ffffffffc02013f4 <default_check+0x4e2>
    assert((p2 = alloc_page()) != NULL);
ffffffffc0201040:	4505                	li	a0,1
ffffffffc0201042:	573000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc0201046:	8a2a                	mv	s4,a0
ffffffffc0201048:	38050663          	beqz	a0,ffffffffc02013d4 <default_check+0x4c2>
    assert(alloc_page() == NULL);
ffffffffc020104c:	4505                	li	a0,1
ffffffffc020104e:	567000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc0201052:	36051163          	bnez	a0,ffffffffc02013b4 <default_check+0x4a2>
    free_page(p0);
ffffffffc0201056:	4585                	li	a1,1
ffffffffc0201058:	854e                	mv	a0,s3
ffffffffc020105a:	599000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    assert(!list_empty(&free_list));
ffffffffc020105e:	641c                	ld	a5,8(s0)
ffffffffc0201060:	20878a63          	beq	a5,s0,ffffffffc0201274 <default_check+0x362>
    assert((p = alloc_page()) == p0);
ffffffffc0201064:	4505                	li	a0,1
ffffffffc0201066:	54f000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc020106a:	30a99563          	bne	s3,a0,ffffffffc0201374 <default_check+0x462>
    assert(alloc_page() == NULL);
ffffffffc020106e:	4505                	li	a0,1
ffffffffc0201070:	545000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc0201074:	2e051063          	bnez	a0,ffffffffc0201354 <default_check+0x442>
    assert(nr_free == 0);
ffffffffc0201078:	481c                	lw	a5,16(s0)
ffffffffc020107a:	2a079d63          	bnez	a5,ffffffffc0201334 <default_check+0x422>
    free_page(p);
ffffffffc020107e:	854e                	mv	a0,s3
ffffffffc0201080:	4585                	li	a1,1
    free_list = free_list_store;
ffffffffc0201082:	01843023          	sd	s8,0(s0)
ffffffffc0201086:	01743423          	sd	s7,8(s0)
    nr_free = nr_free_store;
ffffffffc020108a:	01642823          	sw	s6,16(s0)
    free_page(p);
ffffffffc020108e:	565000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    free_page(p1);
ffffffffc0201092:	4585                	li	a1,1
ffffffffc0201094:	8556                	mv	a0,s5
ffffffffc0201096:	55d000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    free_page(p2);
ffffffffc020109a:	4585                	li	a1,1
ffffffffc020109c:	8552                	mv	a0,s4
ffffffffc020109e:	555000ef          	jal	ra,ffffffffc0201df2 <free_pages>

    basic_check();

    struct Page *p0 = alloc_pages(5), *p1, *p2;
ffffffffc02010a2:	4515                	li	a0,5
ffffffffc02010a4:	511000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc02010a8:	89aa                	mv	s3,a0
    assert(p0 != NULL);
ffffffffc02010aa:	26050563          	beqz	a0,ffffffffc0201314 <default_check+0x402>
ffffffffc02010ae:	651c                	ld	a5,8(a0)
ffffffffc02010b0:	8385                	srli	a5,a5,0x1
ffffffffc02010b2:	8b85                	andi	a5,a5,1
    assert(!PageProperty(p0));
ffffffffc02010b4:	54079063          	bnez	a5,ffffffffc02015f4 <default_check+0x6e2>

    list_entry_t free_list_store = free_list;
    list_init(&free_list);
    assert(list_empty(&free_list));
    assert(alloc_page() == NULL);
ffffffffc02010b8:	4505                	li	a0,1
    list_entry_t free_list_store = free_list;
ffffffffc02010ba:	00043b03          	ld	s6,0(s0)
ffffffffc02010be:	00843a83          	ld	s5,8(s0)
ffffffffc02010c2:	e000                	sd	s0,0(s0)
ffffffffc02010c4:	e400                	sd	s0,8(s0)
    assert(alloc_page() == NULL);
ffffffffc02010c6:	4ef000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc02010ca:	50051563          	bnez	a0,ffffffffc02015d4 <default_check+0x6c2>

    unsigned int nr_free_store = nr_free;
    nr_free = 0;

    free_pages(p0 + 2, 3);
ffffffffc02010ce:	08098a13          	addi	s4,s3,128
ffffffffc02010d2:	8552                	mv	a0,s4
ffffffffc02010d4:	458d                	li	a1,3
    unsigned int nr_free_store = nr_free;
ffffffffc02010d6:	01042b83          	lw	s7,16(s0)
    nr_free = 0;
ffffffffc02010da:	000c2797          	auipc	a5,0xc2
ffffffffc02010de:	9607af23          	sw	zero,-1666(a5) # ffffffffc02c2a58 <free_area+0x10>
    free_pages(p0 + 2, 3);
ffffffffc02010e2:	511000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    assert(alloc_pages(4) == NULL);
ffffffffc02010e6:	4511                	li	a0,4
ffffffffc02010e8:	4cd000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc02010ec:	4c051463          	bnez	a0,ffffffffc02015b4 <default_check+0x6a2>
ffffffffc02010f0:	0889b783          	ld	a5,136(s3)
ffffffffc02010f4:	8385                	srli	a5,a5,0x1
ffffffffc02010f6:	8b85                	andi	a5,a5,1
    assert(PageProperty(p0 + 2) && p0[2].property == 3);
ffffffffc02010f8:	48078e63          	beqz	a5,ffffffffc0201594 <default_check+0x682>
ffffffffc02010fc:	0909a703          	lw	a4,144(s3)
ffffffffc0201100:	478d                	li	a5,3
ffffffffc0201102:	48f71963          	bne	a4,a5,ffffffffc0201594 <default_check+0x682>
    assert((p1 = alloc_pages(3)) != NULL);
ffffffffc0201106:	450d                	li	a0,3
ffffffffc0201108:	4ad000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc020110c:	8c2a                	mv	s8,a0
ffffffffc020110e:	46050363          	beqz	a0,ffffffffc0201574 <default_check+0x662>
    assert(alloc_page() == NULL);
ffffffffc0201112:	4505                	li	a0,1
ffffffffc0201114:	4a1000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc0201118:	42051e63          	bnez	a0,ffffffffc0201554 <default_check+0x642>
    assert(p0 + 2 == p1);
ffffffffc020111c:	418a1c63          	bne	s4,s8,ffffffffc0201534 <default_check+0x622>

    p2 = p0 + 1;
    free_page(p0);
ffffffffc0201120:	4585                	li	a1,1
ffffffffc0201122:	854e                	mv	a0,s3
ffffffffc0201124:	4cf000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    free_pages(p1, 3);
ffffffffc0201128:	458d                	li	a1,3
ffffffffc020112a:	8552                	mv	a0,s4
ffffffffc020112c:	4c7000ef          	jal	ra,ffffffffc0201df2 <free_pages>
ffffffffc0201130:	0089b783          	ld	a5,8(s3)
    p2 = p0 + 1;
ffffffffc0201134:	04098c13          	addi	s8,s3,64
ffffffffc0201138:	8385                	srli	a5,a5,0x1
ffffffffc020113a:	8b85                	andi	a5,a5,1
    assert(PageProperty(p0) && p0->property == 1);
ffffffffc020113c:	3c078c63          	beqz	a5,ffffffffc0201514 <default_check+0x602>
ffffffffc0201140:	0109a703          	lw	a4,16(s3)
ffffffffc0201144:	4785                	li	a5,1
ffffffffc0201146:	3cf71763          	bne	a4,a5,ffffffffc0201514 <default_check+0x602>
ffffffffc020114a:	008a3783          	ld	a5,8(s4)
ffffffffc020114e:	8385                	srli	a5,a5,0x1
ffffffffc0201150:	8b85                	andi	a5,a5,1
    assert(PageProperty(p1) && p1->property == 3);
ffffffffc0201152:	3a078163          	beqz	a5,ffffffffc02014f4 <default_check+0x5e2>
ffffffffc0201156:	010a2703          	lw	a4,16(s4)
ffffffffc020115a:	478d                	li	a5,3
ffffffffc020115c:	38f71c63          	bne	a4,a5,ffffffffc02014f4 <default_check+0x5e2>

    assert((p0 = alloc_page()) == p2 - 1);
ffffffffc0201160:	4505                	li	a0,1
ffffffffc0201162:	453000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc0201166:	36a99763          	bne	s3,a0,ffffffffc02014d4 <default_check+0x5c2>
    free_page(p0);
ffffffffc020116a:	4585                	li	a1,1
ffffffffc020116c:	487000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    assert((p0 = alloc_pages(2)) == p2 + 1);
ffffffffc0201170:	4509                	li	a0,2
ffffffffc0201172:	443000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc0201176:	32aa1f63          	bne	s4,a0,ffffffffc02014b4 <default_check+0x5a2>

    free_pages(p0, 2);
ffffffffc020117a:	4589                	li	a1,2
ffffffffc020117c:	477000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    free_page(p2);
ffffffffc0201180:	4585                	li	a1,1
ffffffffc0201182:	8562                	mv	a0,s8
ffffffffc0201184:	46f000ef          	jal	ra,ffffffffc0201df2 <free_pages>

    assert((p0 = alloc_pages(5)) != NULL);
ffffffffc0201188:	4515                	li	a0,5
ffffffffc020118a:	42b000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc020118e:	89aa                	mv	s3,a0
ffffffffc0201190:	48050263          	beqz	a0,ffffffffc0201614 <default_check+0x702>
    assert(alloc_page() == NULL);
ffffffffc0201194:	4505                	li	a0,1
ffffffffc0201196:	41f000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc020119a:	2c051d63          	bnez	a0,ffffffffc0201474 <default_check+0x562>

    assert(nr_free == 0);
ffffffffc020119e:	481c                	lw	a5,16(s0)
ffffffffc02011a0:	2a079a63          	bnez	a5,ffffffffc0201454 <default_check+0x542>
    nr_free = nr_free_store;

    free_list = free_list_store;
    free_pages(p0, 5);
ffffffffc02011a4:	4595                	li	a1,5
ffffffffc02011a6:	854e                	mv	a0,s3
    nr_free = nr_free_store;
ffffffffc02011a8:	01742823          	sw	s7,16(s0)
    free_list = free_list_store;
ffffffffc02011ac:	01643023          	sd	s6,0(s0)
ffffffffc02011b0:	01543423          	sd	s5,8(s0)
    free_pages(p0, 5);
ffffffffc02011b4:	43f000ef          	jal	ra,ffffffffc0201df2 <free_pages>
    return listelm->next;
ffffffffc02011b8:	641c                	ld	a5,8(s0)

    le = &free_list;
    while ((le = list_next(le)) != &free_list)
ffffffffc02011ba:	00878963          	beq	a5,s0,ffffffffc02011cc <default_check+0x2ba>
    {
        struct Page *p = le2page(le, page_link);
        count--, total -= p->property;
ffffffffc02011be:	ff87a703          	lw	a4,-8(a5)
ffffffffc02011c2:	679c                	ld	a5,8(a5)
ffffffffc02011c4:	397d                	addiw	s2,s2,-1
ffffffffc02011c6:	9c99                	subw	s1,s1,a4
    while ((le = list_next(le)) != &free_list)
ffffffffc02011c8:	fe879be3          	bne	a5,s0,ffffffffc02011be <default_check+0x2ac>
    }
    assert(count == 0);
ffffffffc02011cc:	26091463          	bnez	s2,ffffffffc0201434 <default_check+0x522>
    assert(total == 0);
ffffffffc02011d0:	46049263          	bnez	s1,ffffffffc0201634 <default_check+0x722>
}
ffffffffc02011d4:	60a6                	ld	ra,72(sp)
ffffffffc02011d6:	6406                	ld	s0,64(sp)
ffffffffc02011d8:	74e2                	ld	s1,56(sp)
ffffffffc02011da:	7942                	ld	s2,48(sp)
ffffffffc02011dc:	79a2                	ld	s3,40(sp)
ffffffffc02011de:	7a02                	ld	s4,32(sp)
ffffffffc02011e0:	6ae2                	ld	s5,24(sp)
ffffffffc02011e2:	6b42                	ld	s6,16(sp)
ffffffffc02011e4:	6ba2                	ld	s7,8(sp)
ffffffffc02011e6:	6c02                	ld	s8,0(sp)
ffffffffc02011e8:	6161                	addi	sp,sp,80
ffffffffc02011ea:	8082                	ret
    while ((le = list_next(le)) != &free_list)
ffffffffc02011ec:	4981                	li	s3,0
    int count = 0, total = 0;
ffffffffc02011ee:	4481                	li	s1,0
ffffffffc02011f0:	4901                	li	s2,0
ffffffffc02011f2:	b38d                	j	ffffffffc0200f54 <default_check+0x42>
        assert(PageProperty(p));
ffffffffc02011f4:	00005697          	auipc	a3,0x5
ffffffffc02011f8:	50c68693          	addi	a3,a3,1292 # ffffffffc0206700 <commands+0x818>
ffffffffc02011fc:	00005617          	auipc	a2,0x5
ffffffffc0201200:	51460613          	addi	a2,a2,1300 # ffffffffc0206710 <commands+0x828>
ffffffffc0201204:	11000593          	li	a1,272
ffffffffc0201208:	00005517          	auipc	a0,0x5
ffffffffc020120c:	52050513          	addi	a0,a0,1312 # ffffffffc0206728 <commands+0x840>
ffffffffc0201210:	a82ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(p0 != p1 && p0 != p2 && p1 != p2);
ffffffffc0201214:	00005697          	auipc	a3,0x5
ffffffffc0201218:	5ac68693          	addi	a3,a3,1452 # ffffffffc02067c0 <commands+0x8d8>
ffffffffc020121c:	00005617          	auipc	a2,0x5
ffffffffc0201220:	4f460613          	addi	a2,a2,1268 # ffffffffc0206710 <commands+0x828>
ffffffffc0201224:	0db00593          	li	a1,219
ffffffffc0201228:	00005517          	auipc	a0,0x5
ffffffffc020122c:	50050513          	addi	a0,a0,1280 # ffffffffc0206728 <commands+0x840>
ffffffffc0201230:	a62ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p0) == 0 && page_ref(p1) == 0 && page_ref(p2) == 0);
ffffffffc0201234:	00005697          	auipc	a3,0x5
ffffffffc0201238:	5b468693          	addi	a3,a3,1460 # ffffffffc02067e8 <commands+0x900>
ffffffffc020123c:	00005617          	auipc	a2,0x5
ffffffffc0201240:	4d460613          	addi	a2,a2,1236 # ffffffffc0206710 <commands+0x828>
ffffffffc0201244:	0dc00593          	li	a1,220
ffffffffc0201248:	00005517          	auipc	a0,0x5
ffffffffc020124c:	4e050513          	addi	a0,a0,1248 # ffffffffc0206728 <commands+0x840>
ffffffffc0201250:	a42ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page2pa(p0) < npage * PGSIZE);
ffffffffc0201254:	00005697          	auipc	a3,0x5
ffffffffc0201258:	5d468693          	addi	a3,a3,1492 # ffffffffc0206828 <commands+0x940>
ffffffffc020125c:	00005617          	auipc	a2,0x5
ffffffffc0201260:	4b460613          	addi	a2,a2,1204 # ffffffffc0206710 <commands+0x828>
ffffffffc0201264:	0de00593          	li	a1,222
ffffffffc0201268:	00005517          	auipc	a0,0x5
ffffffffc020126c:	4c050513          	addi	a0,a0,1216 # ffffffffc0206728 <commands+0x840>
ffffffffc0201270:	a22ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(!list_empty(&free_list));
ffffffffc0201274:	00005697          	auipc	a3,0x5
ffffffffc0201278:	63c68693          	addi	a3,a3,1596 # ffffffffc02068b0 <commands+0x9c8>
ffffffffc020127c:	00005617          	auipc	a2,0x5
ffffffffc0201280:	49460613          	addi	a2,a2,1172 # ffffffffc0206710 <commands+0x828>
ffffffffc0201284:	0f700593          	li	a1,247
ffffffffc0201288:	00005517          	auipc	a0,0x5
ffffffffc020128c:	4a050513          	addi	a0,a0,1184 # ffffffffc0206728 <commands+0x840>
ffffffffc0201290:	a02ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p0 = alloc_page()) != NULL);
ffffffffc0201294:	00005697          	auipc	a3,0x5
ffffffffc0201298:	4cc68693          	addi	a3,a3,1228 # ffffffffc0206760 <commands+0x878>
ffffffffc020129c:	00005617          	auipc	a2,0x5
ffffffffc02012a0:	47460613          	addi	a2,a2,1140 # ffffffffc0206710 <commands+0x828>
ffffffffc02012a4:	0f000593          	li	a1,240
ffffffffc02012a8:	00005517          	auipc	a0,0x5
ffffffffc02012ac:	48050513          	addi	a0,a0,1152 # ffffffffc0206728 <commands+0x840>
ffffffffc02012b0:	9e2ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(nr_free == 3);
ffffffffc02012b4:	00005697          	auipc	a3,0x5
ffffffffc02012b8:	5ec68693          	addi	a3,a3,1516 # ffffffffc02068a0 <commands+0x9b8>
ffffffffc02012bc:	00005617          	auipc	a2,0x5
ffffffffc02012c0:	45460613          	addi	a2,a2,1108 # ffffffffc0206710 <commands+0x828>
ffffffffc02012c4:	0ee00593          	li	a1,238
ffffffffc02012c8:	00005517          	auipc	a0,0x5
ffffffffc02012cc:	46050513          	addi	a0,a0,1120 # ffffffffc0206728 <commands+0x840>
ffffffffc02012d0:	9c2ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(alloc_page() == NULL);
ffffffffc02012d4:	00005697          	auipc	a3,0x5
ffffffffc02012d8:	5b468693          	addi	a3,a3,1460 # ffffffffc0206888 <commands+0x9a0>
ffffffffc02012dc:	00005617          	auipc	a2,0x5
ffffffffc02012e0:	43460613          	addi	a2,a2,1076 # ffffffffc0206710 <commands+0x828>
ffffffffc02012e4:	0e900593          	li	a1,233
ffffffffc02012e8:	00005517          	auipc	a0,0x5
ffffffffc02012ec:	44050513          	addi	a0,a0,1088 # ffffffffc0206728 <commands+0x840>
ffffffffc02012f0:	9a2ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page2pa(p2) < npage * PGSIZE);
ffffffffc02012f4:	00005697          	auipc	a3,0x5
ffffffffc02012f8:	57468693          	addi	a3,a3,1396 # ffffffffc0206868 <commands+0x980>
ffffffffc02012fc:	00005617          	auipc	a2,0x5
ffffffffc0201300:	41460613          	addi	a2,a2,1044 # ffffffffc0206710 <commands+0x828>
ffffffffc0201304:	0e000593          	li	a1,224
ffffffffc0201308:	00005517          	auipc	a0,0x5
ffffffffc020130c:	42050513          	addi	a0,a0,1056 # ffffffffc0206728 <commands+0x840>
ffffffffc0201310:	982ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(p0 != NULL);
ffffffffc0201314:	00005697          	auipc	a3,0x5
ffffffffc0201318:	5e468693          	addi	a3,a3,1508 # ffffffffc02068f8 <commands+0xa10>
ffffffffc020131c:	00005617          	auipc	a2,0x5
ffffffffc0201320:	3f460613          	addi	a2,a2,1012 # ffffffffc0206710 <commands+0x828>
ffffffffc0201324:	11800593          	li	a1,280
ffffffffc0201328:	00005517          	auipc	a0,0x5
ffffffffc020132c:	40050513          	addi	a0,a0,1024 # ffffffffc0206728 <commands+0x840>
ffffffffc0201330:	962ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(nr_free == 0);
ffffffffc0201334:	00005697          	auipc	a3,0x5
ffffffffc0201338:	5b468693          	addi	a3,a3,1460 # ffffffffc02068e8 <commands+0xa00>
ffffffffc020133c:	00005617          	auipc	a2,0x5
ffffffffc0201340:	3d460613          	addi	a2,a2,980 # ffffffffc0206710 <commands+0x828>
ffffffffc0201344:	0fd00593          	li	a1,253
ffffffffc0201348:	00005517          	auipc	a0,0x5
ffffffffc020134c:	3e050513          	addi	a0,a0,992 # ffffffffc0206728 <commands+0x840>
ffffffffc0201350:	942ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201354:	00005697          	auipc	a3,0x5
ffffffffc0201358:	53468693          	addi	a3,a3,1332 # ffffffffc0206888 <commands+0x9a0>
ffffffffc020135c:	00005617          	auipc	a2,0x5
ffffffffc0201360:	3b460613          	addi	a2,a2,948 # ffffffffc0206710 <commands+0x828>
ffffffffc0201364:	0fb00593          	li	a1,251
ffffffffc0201368:	00005517          	auipc	a0,0x5
ffffffffc020136c:	3c050513          	addi	a0,a0,960 # ffffffffc0206728 <commands+0x840>
ffffffffc0201370:	922ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p = alloc_page()) == p0);
ffffffffc0201374:	00005697          	auipc	a3,0x5
ffffffffc0201378:	55468693          	addi	a3,a3,1364 # ffffffffc02068c8 <commands+0x9e0>
ffffffffc020137c:	00005617          	auipc	a2,0x5
ffffffffc0201380:	39460613          	addi	a2,a2,916 # ffffffffc0206710 <commands+0x828>
ffffffffc0201384:	0fa00593          	li	a1,250
ffffffffc0201388:	00005517          	auipc	a0,0x5
ffffffffc020138c:	3a050513          	addi	a0,a0,928 # ffffffffc0206728 <commands+0x840>
ffffffffc0201390:	902ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p0 = alloc_page()) != NULL);
ffffffffc0201394:	00005697          	auipc	a3,0x5
ffffffffc0201398:	3cc68693          	addi	a3,a3,972 # ffffffffc0206760 <commands+0x878>
ffffffffc020139c:	00005617          	auipc	a2,0x5
ffffffffc02013a0:	37460613          	addi	a2,a2,884 # ffffffffc0206710 <commands+0x828>
ffffffffc02013a4:	0d700593          	li	a1,215
ffffffffc02013a8:	00005517          	auipc	a0,0x5
ffffffffc02013ac:	38050513          	addi	a0,a0,896 # ffffffffc0206728 <commands+0x840>
ffffffffc02013b0:	8e2ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(alloc_page() == NULL);
ffffffffc02013b4:	00005697          	auipc	a3,0x5
ffffffffc02013b8:	4d468693          	addi	a3,a3,1236 # ffffffffc0206888 <commands+0x9a0>
ffffffffc02013bc:	00005617          	auipc	a2,0x5
ffffffffc02013c0:	35460613          	addi	a2,a2,852 # ffffffffc0206710 <commands+0x828>
ffffffffc02013c4:	0f400593          	li	a1,244
ffffffffc02013c8:	00005517          	auipc	a0,0x5
ffffffffc02013cc:	36050513          	addi	a0,a0,864 # ffffffffc0206728 <commands+0x840>
ffffffffc02013d0:	8c2ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p2 = alloc_page()) != NULL);
ffffffffc02013d4:	00005697          	auipc	a3,0x5
ffffffffc02013d8:	3cc68693          	addi	a3,a3,972 # ffffffffc02067a0 <commands+0x8b8>
ffffffffc02013dc:	00005617          	auipc	a2,0x5
ffffffffc02013e0:	33460613          	addi	a2,a2,820 # ffffffffc0206710 <commands+0x828>
ffffffffc02013e4:	0f200593          	li	a1,242
ffffffffc02013e8:	00005517          	auipc	a0,0x5
ffffffffc02013ec:	34050513          	addi	a0,a0,832 # ffffffffc0206728 <commands+0x840>
ffffffffc02013f0:	8a2ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p1 = alloc_page()) != NULL);
ffffffffc02013f4:	00005697          	auipc	a3,0x5
ffffffffc02013f8:	38c68693          	addi	a3,a3,908 # ffffffffc0206780 <commands+0x898>
ffffffffc02013fc:	00005617          	auipc	a2,0x5
ffffffffc0201400:	31460613          	addi	a2,a2,788 # ffffffffc0206710 <commands+0x828>
ffffffffc0201404:	0f100593          	li	a1,241
ffffffffc0201408:	00005517          	auipc	a0,0x5
ffffffffc020140c:	32050513          	addi	a0,a0,800 # ffffffffc0206728 <commands+0x840>
ffffffffc0201410:	882ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p2 = alloc_page()) != NULL);
ffffffffc0201414:	00005697          	auipc	a3,0x5
ffffffffc0201418:	38c68693          	addi	a3,a3,908 # ffffffffc02067a0 <commands+0x8b8>
ffffffffc020141c:	00005617          	auipc	a2,0x5
ffffffffc0201420:	2f460613          	addi	a2,a2,756 # ffffffffc0206710 <commands+0x828>
ffffffffc0201424:	0d900593          	li	a1,217
ffffffffc0201428:	00005517          	auipc	a0,0x5
ffffffffc020142c:	30050513          	addi	a0,a0,768 # ffffffffc0206728 <commands+0x840>
ffffffffc0201430:	862ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(count == 0);
ffffffffc0201434:	00005697          	auipc	a3,0x5
ffffffffc0201438:	61468693          	addi	a3,a3,1556 # ffffffffc0206a48 <commands+0xb60>
ffffffffc020143c:	00005617          	auipc	a2,0x5
ffffffffc0201440:	2d460613          	addi	a2,a2,724 # ffffffffc0206710 <commands+0x828>
ffffffffc0201444:	14600593          	li	a1,326
ffffffffc0201448:	00005517          	auipc	a0,0x5
ffffffffc020144c:	2e050513          	addi	a0,a0,736 # ffffffffc0206728 <commands+0x840>
ffffffffc0201450:	842ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(nr_free == 0);
ffffffffc0201454:	00005697          	auipc	a3,0x5
ffffffffc0201458:	49468693          	addi	a3,a3,1172 # ffffffffc02068e8 <commands+0xa00>
ffffffffc020145c:	00005617          	auipc	a2,0x5
ffffffffc0201460:	2b460613          	addi	a2,a2,692 # ffffffffc0206710 <commands+0x828>
ffffffffc0201464:	13a00593          	li	a1,314
ffffffffc0201468:	00005517          	auipc	a0,0x5
ffffffffc020146c:	2c050513          	addi	a0,a0,704 # ffffffffc0206728 <commands+0x840>
ffffffffc0201470:	822ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201474:	00005697          	auipc	a3,0x5
ffffffffc0201478:	41468693          	addi	a3,a3,1044 # ffffffffc0206888 <commands+0x9a0>
ffffffffc020147c:	00005617          	auipc	a2,0x5
ffffffffc0201480:	29460613          	addi	a2,a2,660 # ffffffffc0206710 <commands+0x828>
ffffffffc0201484:	13800593          	li	a1,312
ffffffffc0201488:	00005517          	auipc	a0,0x5
ffffffffc020148c:	2a050513          	addi	a0,a0,672 # ffffffffc0206728 <commands+0x840>
ffffffffc0201490:	802ff0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page2pa(p1) < npage * PGSIZE);
ffffffffc0201494:	00005697          	auipc	a3,0x5
ffffffffc0201498:	3b468693          	addi	a3,a3,948 # ffffffffc0206848 <commands+0x960>
ffffffffc020149c:	00005617          	auipc	a2,0x5
ffffffffc02014a0:	27460613          	addi	a2,a2,628 # ffffffffc0206710 <commands+0x828>
ffffffffc02014a4:	0df00593          	li	a1,223
ffffffffc02014a8:	00005517          	auipc	a0,0x5
ffffffffc02014ac:	28050513          	addi	a0,a0,640 # ffffffffc0206728 <commands+0x840>
ffffffffc02014b0:	fe3fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p0 = alloc_pages(2)) == p2 + 1);
ffffffffc02014b4:	00005697          	auipc	a3,0x5
ffffffffc02014b8:	55468693          	addi	a3,a3,1364 # ffffffffc0206a08 <commands+0xb20>
ffffffffc02014bc:	00005617          	auipc	a2,0x5
ffffffffc02014c0:	25460613          	addi	a2,a2,596 # ffffffffc0206710 <commands+0x828>
ffffffffc02014c4:	13200593          	li	a1,306
ffffffffc02014c8:	00005517          	auipc	a0,0x5
ffffffffc02014cc:	26050513          	addi	a0,a0,608 # ffffffffc0206728 <commands+0x840>
ffffffffc02014d0:	fc3fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p0 = alloc_page()) == p2 - 1);
ffffffffc02014d4:	00005697          	auipc	a3,0x5
ffffffffc02014d8:	51468693          	addi	a3,a3,1300 # ffffffffc02069e8 <commands+0xb00>
ffffffffc02014dc:	00005617          	auipc	a2,0x5
ffffffffc02014e0:	23460613          	addi	a2,a2,564 # ffffffffc0206710 <commands+0x828>
ffffffffc02014e4:	13000593          	li	a1,304
ffffffffc02014e8:	00005517          	auipc	a0,0x5
ffffffffc02014ec:	24050513          	addi	a0,a0,576 # ffffffffc0206728 <commands+0x840>
ffffffffc02014f0:	fa3fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(PageProperty(p1) && p1->property == 3);
ffffffffc02014f4:	00005697          	auipc	a3,0x5
ffffffffc02014f8:	4cc68693          	addi	a3,a3,1228 # ffffffffc02069c0 <commands+0xad8>
ffffffffc02014fc:	00005617          	auipc	a2,0x5
ffffffffc0201500:	21460613          	addi	a2,a2,532 # ffffffffc0206710 <commands+0x828>
ffffffffc0201504:	12e00593          	li	a1,302
ffffffffc0201508:	00005517          	auipc	a0,0x5
ffffffffc020150c:	22050513          	addi	a0,a0,544 # ffffffffc0206728 <commands+0x840>
ffffffffc0201510:	f83fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(PageProperty(p0) && p0->property == 1);
ffffffffc0201514:	00005697          	auipc	a3,0x5
ffffffffc0201518:	48468693          	addi	a3,a3,1156 # ffffffffc0206998 <commands+0xab0>
ffffffffc020151c:	00005617          	auipc	a2,0x5
ffffffffc0201520:	1f460613          	addi	a2,a2,500 # ffffffffc0206710 <commands+0x828>
ffffffffc0201524:	12d00593          	li	a1,301
ffffffffc0201528:	00005517          	auipc	a0,0x5
ffffffffc020152c:	20050513          	addi	a0,a0,512 # ffffffffc0206728 <commands+0x840>
ffffffffc0201530:	f63fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(p0 + 2 == p1);
ffffffffc0201534:	00005697          	auipc	a3,0x5
ffffffffc0201538:	45468693          	addi	a3,a3,1108 # ffffffffc0206988 <commands+0xaa0>
ffffffffc020153c:	00005617          	auipc	a2,0x5
ffffffffc0201540:	1d460613          	addi	a2,a2,468 # ffffffffc0206710 <commands+0x828>
ffffffffc0201544:	12800593          	li	a1,296
ffffffffc0201548:	00005517          	auipc	a0,0x5
ffffffffc020154c:	1e050513          	addi	a0,a0,480 # ffffffffc0206728 <commands+0x840>
ffffffffc0201550:	f43fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201554:	00005697          	auipc	a3,0x5
ffffffffc0201558:	33468693          	addi	a3,a3,820 # ffffffffc0206888 <commands+0x9a0>
ffffffffc020155c:	00005617          	auipc	a2,0x5
ffffffffc0201560:	1b460613          	addi	a2,a2,436 # ffffffffc0206710 <commands+0x828>
ffffffffc0201564:	12700593          	li	a1,295
ffffffffc0201568:	00005517          	auipc	a0,0x5
ffffffffc020156c:	1c050513          	addi	a0,a0,448 # ffffffffc0206728 <commands+0x840>
ffffffffc0201570:	f23fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p1 = alloc_pages(3)) != NULL);
ffffffffc0201574:	00005697          	auipc	a3,0x5
ffffffffc0201578:	3f468693          	addi	a3,a3,1012 # ffffffffc0206968 <commands+0xa80>
ffffffffc020157c:	00005617          	auipc	a2,0x5
ffffffffc0201580:	19460613          	addi	a2,a2,404 # ffffffffc0206710 <commands+0x828>
ffffffffc0201584:	12600593          	li	a1,294
ffffffffc0201588:	00005517          	auipc	a0,0x5
ffffffffc020158c:	1a050513          	addi	a0,a0,416 # ffffffffc0206728 <commands+0x840>
ffffffffc0201590:	f03fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(PageProperty(p0 + 2) && p0[2].property == 3);
ffffffffc0201594:	00005697          	auipc	a3,0x5
ffffffffc0201598:	3a468693          	addi	a3,a3,932 # ffffffffc0206938 <commands+0xa50>
ffffffffc020159c:	00005617          	auipc	a2,0x5
ffffffffc02015a0:	17460613          	addi	a2,a2,372 # ffffffffc0206710 <commands+0x828>
ffffffffc02015a4:	12500593          	li	a1,293
ffffffffc02015a8:	00005517          	auipc	a0,0x5
ffffffffc02015ac:	18050513          	addi	a0,a0,384 # ffffffffc0206728 <commands+0x840>
ffffffffc02015b0:	ee3fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(alloc_pages(4) == NULL);
ffffffffc02015b4:	00005697          	auipc	a3,0x5
ffffffffc02015b8:	36c68693          	addi	a3,a3,876 # ffffffffc0206920 <commands+0xa38>
ffffffffc02015bc:	00005617          	auipc	a2,0x5
ffffffffc02015c0:	15460613          	addi	a2,a2,340 # ffffffffc0206710 <commands+0x828>
ffffffffc02015c4:	12400593          	li	a1,292
ffffffffc02015c8:	00005517          	auipc	a0,0x5
ffffffffc02015cc:	16050513          	addi	a0,a0,352 # ffffffffc0206728 <commands+0x840>
ffffffffc02015d0:	ec3fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(alloc_page() == NULL);
ffffffffc02015d4:	00005697          	auipc	a3,0x5
ffffffffc02015d8:	2b468693          	addi	a3,a3,692 # ffffffffc0206888 <commands+0x9a0>
ffffffffc02015dc:	00005617          	auipc	a2,0x5
ffffffffc02015e0:	13460613          	addi	a2,a2,308 # ffffffffc0206710 <commands+0x828>
ffffffffc02015e4:	11e00593          	li	a1,286
ffffffffc02015e8:	00005517          	auipc	a0,0x5
ffffffffc02015ec:	14050513          	addi	a0,a0,320 # ffffffffc0206728 <commands+0x840>
ffffffffc02015f0:	ea3fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(!PageProperty(p0));
ffffffffc02015f4:	00005697          	auipc	a3,0x5
ffffffffc02015f8:	31468693          	addi	a3,a3,788 # ffffffffc0206908 <commands+0xa20>
ffffffffc02015fc:	00005617          	auipc	a2,0x5
ffffffffc0201600:	11460613          	addi	a2,a2,276 # ffffffffc0206710 <commands+0x828>
ffffffffc0201604:	11900593          	li	a1,281
ffffffffc0201608:	00005517          	auipc	a0,0x5
ffffffffc020160c:	12050513          	addi	a0,a0,288 # ffffffffc0206728 <commands+0x840>
ffffffffc0201610:	e83fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p0 = alloc_pages(5)) != NULL);
ffffffffc0201614:	00005697          	auipc	a3,0x5
ffffffffc0201618:	41468693          	addi	a3,a3,1044 # ffffffffc0206a28 <commands+0xb40>
ffffffffc020161c:	00005617          	auipc	a2,0x5
ffffffffc0201620:	0f460613          	addi	a2,a2,244 # ffffffffc0206710 <commands+0x828>
ffffffffc0201624:	13700593          	li	a1,311
ffffffffc0201628:	00005517          	auipc	a0,0x5
ffffffffc020162c:	10050513          	addi	a0,a0,256 # ffffffffc0206728 <commands+0x840>
ffffffffc0201630:	e63fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(total == 0);
ffffffffc0201634:	00005697          	auipc	a3,0x5
ffffffffc0201638:	42468693          	addi	a3,a3,1060 # ffffffffc0206a58 <commands+0xb70>
ffffffffc020163c:	00005617          	auipc	a2,0x5
ffffffffc0201640:	0d460613          	addi	a2,a2,212 # ffffffffc0206710 <commands+0x828>
ffffffffc0201644:	14700593          	li	a1,327
ffffffffc0201648:	00005517          	auipc	a0,0x5
ffffffffc020164c:	0e050513          	addi	a0,a0,224 # ffffffffc0206728 <commands+0x840>
ffffffffc0201650:	e43fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(total == nr_free_pages());
ffffffffc0201654:	00005697          	auipc	a3,0x5
ffffffffc0201658:	0ec68693          	addi	a3,a3,236 # ffffffffc0206740 <commands+0x858>
ffffffffc020165c:	00005617          	auipc	a2,0x5
ffffffffc0201660:	0b460613          	addi	a2,a2,180 # ffffffffc0206710 <commands+0x828>
ffffffffc0201664:	11300593          	li	a1,275
ffffffffc0201668:	00005517          	auipc	a0,0x5
ffffffffc020166c:	0c050513          	addi	a0,a0,192 # ffffffffc0206728 <commands+0x840>
ffffffffc0201670:	e23fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((p1 = alloc_page()) != NULL);
ffffffffc0201674:	00005697          	auipc	a3,0x5
ffffffffc0201678:	10c68693          	addi	a3,a3,268 # ffffffffc0206780 <commands+0x898>
ffffffffc020167c:	00005617          	auipc	a2,0x5
ffffffffc0201680:	09460613          	addi	a2,a2,148 # ffffffffc0206710 <commands+0x828>
ffffffffc0201684:	0d800593          	li	a1,216
ffffffffc0201688:	00005517          	auipc	a0,0x5
ffffffffc020168c:	0a050513          	addi	a0,a0,160 # ffffffffc0206728 <commands+0x840>
ffffffffc0201690:	e03fe0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0201694 <default_free_pages>:
{
ffffffffc0201694:	1141                	addi	sp,sp,-16
ffffffffc0201696:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc0201698:	14058463          	beqz	a1,ffffffffc02017e0 <default_free_pages+0x14c>
    for (; p != base + n; p++)
ffffffffc020169c:	00659693          	slli	a3,a1,0x6
ffffffffc02016a0:	96aa                	add	a3,a3,a0
ffffffffc02016a2:	87aa                	mv	a5,a0
ffffffffc02016a4:	02d50263          	beq	a0,a3,ffffffffc02016c8 <default_free_pages+0x34>
ffffffffc02016a8:	6798                	ld	a4,8(a5)
ffffffffc02016aa:	8b05                	andi	a4,a4,1
        assert(!PageReserved(p) && !PageProperty(p));
ffffffffc02016ac:	10071a63          	bnez	a4,ffffffffc02017c0 <default_free_pages+0x12c>
ffffffffc02016b0:	6798                	ld	a4,8(a5)
ffffffffc02016b2:	8b09                	andi	a4,a4,2
ffffffffc02016b4:	10071663          	bnez	a4,ffffffffc02017c0 <default_free_pages+0x12c>
        p->flags = 0;
ffffffffc02016b8:	0007b423          	sd	zero,8(a5)
}

static inline void
set_page_ref(struct Page *page, int val)
{
    page->ref = val;
ffffffffc02016bc:	0007a023          	sw	zero,0(a5)
    for (; p != base + n; p++)
ffffffffc02016c0:	04078793          	addi	a5,a5,64
ffffffffc02016c4:	fed792e3          	bne	a5,a3,ffffffffc02016a8 <default_free_pages+0x14>
    base->property = n;
ffffffffc02016c8:	2581                	sext.w	a1,a1
ffffffffc02016ca:	c90c                	sw	a1,16(a0)
    SetPageProperty(base);
ffffffffc02016cc:	00850893          	addi	a7,a0,8
    __op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc02016d0:	4789                	li	a5,2
ffffffffc02016d2:	40f8b02f          	amoor.d	zero,a5,(a7)
    nr_free += n;
ffffffffc02016d6:	000c1697          	auipc	a3,0xc1
ffffffffc02016da:	37268693          	addi	a3,a3,882 # ffffffffc02c2a48 <free_area>
ffffffffc02016de:	4a98                	lw	a4,16(a3)
    return list->next == list;
ffffffffc02016e0:	669c                	ld	a5,8(a3)
        list_add(&free_list, &(base->page_link));
ffffffffc02016e2:	01850613          	addi	a2,a0,24
    nr_free += n;
ffffffffc02016e6:	9db9                	addw	a1,a1,a4
ffffffffc02016e8:	ca8c                	sw	a1,16(a3)
    if (list_empty(&free_list))
ffffffffc02016ea:	0ad78463          	beq	a5,a3,ffffffffc0201792 <default_free_pages+0xfe>
            struct Page *page = le2page(le, page_link);
ffffffffc02016ee:	fe878713          	addi	a4,a5,-24
ffffffffc02016f2:	0006b803          	ld	a6,0(a3)
    if (list_empty(&free_list))
ffffffffc02016f6:	4581                	li	a1,0
            if (base < page)
ffffffffc02016f8:	00e56a63          	bltu	a0,a4,ffffffffc020170c <default_free_pages+0x78>
    return listelm->next;
ffffffffc02016fc:	6798                	ld	a4,8(a5)
            else if (list_next(le) == &free_list)
ffffffffc02016fe:	04d70c63          	beq	a4,a3,ffffffffc0201756 <default_free_pages+0xc2>
    for (; p != base + n; p++)
ffffffffc0201702:	87ba                	mv	a5,a4
            struct Page *page = le2page(le, page_link);
ffffffffc0201704:	fe878713          	addi	a4,a5,-24
            if (base < page)
ffffffffc0201708:	fee57ae3          	bgeu	a0,a4,ffffffffc02016fc <default_free_pages+0x68>
ffffffffc020170c:	c199                	beqz	a1,ffffffffc0201712 <default_free_pages+0x7e>
ffffffffc020170e:	0106b023          	sd	a6,0(a3)
    __list_add(elm, listelm->prev, listelm);
ffffffffc0201712:	6398                	ld	a4,0(a5)
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 * */
static inline void
__list_add(list_entry_t *elm, list_entry_t *prev, list_entry_t *next) {
    prev->next = next->prev = elm;
ffffffffc0201714:	e390                	sd	a2,0(a5)
ffffffffc0201716:	e710                	sd	a2,8(a4)
    elm->next = next;
ffffffffc0201718:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc020171a:	ed18                	sd	a4,24(a0)
    if (le != &free_list)
ffffffffc020171c:	00d70d63          	beq	a4,a3,ffffffffc0201736 <default_free_pages+0xa2>
        if (p + p->property == base)
ffffffffc0201720:	ff872583          	lw	a1,-8(a4)
        p = le2page(le, page_link);
ffffffffc0201724:	fe870613          	addi	a2,a4,-24
        if (p + p->property == base)
ffffffffc0201728:	02059813          	slli	a6,a1,0x20
ffffffffc020172c:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201730:	97b2                	add	a5,a5,a2
ffffffffc0201732:	02f50c63          	beq	a0,a5,ffffffffc020176a <default_free_pages+0xd6>
    return listelm->next;
ffffffffc0201736:	711c                	ld	a5,32(a0)
    if (le != &free_list)
ffffffffc0201738:	00d78c63          	beq	a5,a3,ffffffffc0201750 <default_free_pages+0xbc>
        if (base + base->property == p)
ffffffffc020173c:	4910                	lw	a2,16(a0)
        p = le2page(le, page_link);
ffffffffc020173e:	fe878693          	addi	a3,a5,-24
        if (base + base->property == p)
ffffffffc0201742:	02061593          	slli	a1,a2,0x20
ffffffffc0201746:	01a5d713          	srli	a4,a1,0x1a
ffffffffc020174a:	972a                	add	a4,a4,a0
ffffffffc020174c:	04e68a63          	beq	a3,a4,ffffffffc02017a0 <default_free_pages+0x10c>
}
ffffffffc0201750:	60a2                	ld	ra,8(sp)
ffffffffc0201752:	0141                	addi	sp,sp,16
ffffffffc0201754:	8082                	ret
    prev->next = next->prev = elm;
ffffffffc0201756:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc0201758:	f114                	sd	a3,32(a0)
    return listelm->next;
ffffffffc020175a:	6798                	ld	a4,8(a5)
    elm->prev = prev;
ffffffffc020175c:	ed1c                	sd	a5,24(a0)
        while ((le = list_next(le)) != &free_list)
ffffffffc020175e:	02d70763          	beq	a4,a3,ffffffffc020178c <default_free_pages+0xf8>
    prev->next = next->prev = elm;
ffffffffc0201762:	8832                	mv	a6,a2
ffffffffc0201764:	4585                	li	a1,1
    for (; p != base + n; p++)
ffffffffc0201766:	87ba                	mv	a5,a4
ffffffffc0201768:	bf71                	j	ffffffffc0201704 <default_free_pages+0x70>
            p->property += base->property;
ffffffffc020176a:	491c                	lw	a5,16(a0)
ffffffffc020176c:	9dbd                	addw	a1,a1,a5
ffffffffc020176e:	feb72c23          	sw	a1,-8(a4)
    __op_bit(and, __NOT, nr, ((volatile unsigned long *)addr));
ffffffffc0201772:	57f5                	li	a5,-3
ffffffffc0201774:	60f8b02f          	amoand.d	zero,a5,(a7)
    __list_del(listelm->prev, listelm->next);
ffffffffc0201778:	01853803          	ld	a6,24(a0)
ffffffffc020177c:	710c                	ld	a1,32(a0)
            base = p;
ffffffffc020177e:	8532                	mv	a0,a2
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 * */
static inline void
__list_del(list_entry_t *prev, list_entry_t *next) {
    prev->next = next;
ffffffffc0201780:	00b83423          	sd	a1,8(a6)
    return listelm->next;
ffffffffc0201784:	671c                	ld	a5,8(a4)
    next->prev = prev;
ffffffffc0201786:	0105b023          	sd	a6,0(a1)
ffffffffc020178a:	b77d                	j	ffffffffc0201738 <default_free_pages+0xa4>
ffffffffc020178c:	e290                	sd	a2,0(a3)
        while ((le = list_next(le)) != &free_list)
ffffffffc020178e:	873e                	mv	a4,a5
ffffffffc0201790:	bf41                	j	ffffffffc0201720 <default_free_pages+0x8c>
}
ffffffffc0201792:	60a2                	ld	ra,8(sp)
    prev->next = next->prev = elm;
ffffffffc0201794:	e390                	sd	a2,0(a5)
ffffffffc0201796:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc0201798:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc020179a:	ed1c                	sd	a5,24(a0)
ffffffffc020179c:	0141                	addi	sp,sp,16
ffffffffc020179e:	8082                	ret
            base->property += p->property;
ffffffffc02017a0:	ff87a703          	lw	a4,-8(a5)
ffffffffc02017a4:	ff078693          	addi	a3,a5,-16
ffffffffc02017a8:	9e39                	addw	a2,a2,a4
ffffffffc02017aa:	c910                	sw	a2,16(a0)
ffffffffc02017ac:	5775                	li	a4,-3
ffffffffc02017ae:	60e6b02f          	amoand.d	zero,a4,(a3)
    __list_del(listelm->prev, listelm->next);
ffffffffc02017b2:	6398                	ld	a4,0(a5)
ffffffffc02017b4:	679c                	ld	a5,8(a5)
}
ffffffffc02017b6:	60a2                	ld	ra,8(sp)
    prev->next = next;
ffffffffc02017b8:	e71c                	sd	a5,8(a4)
    next->prev = prev;
ffffffffc02017ba:	e398                	sd	a4,0(a5)
ffffffffc02017bc:	0141                	addi	sp,sp,16
ffffffffc02017be:	8082                	ret
        assert(!PageReserved(p) && !PageProperty(p));
ffffffffc02017c0:	00005697          	auipc	a3,0x5
ffffffffc02017c4:	2b068693          	addi	a3,a3,688 # ffffffffc0206a70 <commands+0xb88>
ffffffffc02017c8:	00005617          	auipc	a2,0x5
ffffffffc02017cc:	f4860613          	addi	a2,a2,-184 # ffffffffc0206710 <commands+0x828>
ffffffffc02017d0:	09400593          	li	a1,148
ffffffffc02017d4:	00005517          	auipc	a0,0x5
ffffffffc02017d8:	f5450513          	addi	a0,a0,-172 # ffffffffc0206728 <commands+0x840>
ffffffffc02017dc:	cb7fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(n > 0);
ffffffffc02017e0:	00005697          	auipc	a3,0x5
ffffffffc02017e4:	28868693          	addi	a3,a3,648 # ffffffffc0206a68 <commands+0xb80>
ffffffffc02017e8:	00005617          	auipc	a2,0x5
ffffffffc02017ec:	f2860613          	addi	a2,a2,-216 # ffffffffc0206710 <commands+0x828>
ffffffffc02017f0:	09000593          	li	a1,144
ffffffffc02017f4:	00005517          	auipc	a0,0x5
ffffffffc02017f8:	f3450513          	addi	a0,a0,-204 # ffffffffc0206728 <commands+0x840>
ffffffffc02017fc:	c97fe0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0201800 <default_alloc_pages>:
    assert(n > 0);
ffffffffc0201800:	c941                	beqz	a0,ffffffffc0201890 <default_alloc_pages+0x90>
    if (n > nr_free)
ffffffffc0201802:	000c1597          	auipc	a1,0xc1
ffffffffc0201806:	24658593          	addi	a1,a1,582 # ffffffffc02c2a48 <free_area>
ffffffffc020180a:	0105a803          	lw	a6,16(a1)
ffffffffc020180e:	872a                	mv	a4,a0
ffffffffc0201810:	02081793          	slli	a5,a6,0x20
ffffffffc0201814:	9381                	srli	a5,a5,0x20
ffffffffc0201816:	00a7ee63          	bltu	a5,a0,ffffffffc0201832 <default_alloc_pages+0x32>
    list_entry_t *le = &free_list;
ffffffffc020181a:	87ae                	mv	a5,a1
ffffffffc020181c:	a801                	j	ffffffffc020182c <default_alloc_pages+0x2c>
        if (p->property >= n)
ffffffffc020181e:	ff87a683          	lw	a3,-8(a5)
ffffffffc0201822:	02069613          	slli	a2,a3,0x20
ffffffffc0201826:	9201                	srli	a2,a2,0x20
ffffffffc0201828:	00e67763          	bgeu	a2,a4,ffffffffc0201836 <default_alloc_pages+0x36>
    return listelm->next;
ffffffffc020182c:	679c                	ld	a5,8(a5)
    while ((le = list_next(le)) != &free_list)
ffffffffc020182e:	feb798e3          	bne	a5,a1,ffffffffc020181e <default_alloc_pages+0x1e>
        return NULL;
ffffffffc0201832:	4501                	li	a0,0
}
ffffffffc0201834:	8082                	ret
    return listelm->prev;
ffffffffc0201836:	0007b883          	ld	a7,0(a5)
    __list_del(listelm->prev, listelm->next);
ffffffffc020183a:	0087b303          	ld	t1,8(a5)
        struct Page *p = le2page(le, page_link);
ffffffffc020183e:	fe878513          	addi	a0,a5,-24
            p->property = page->property - n;
ffffffffc0201842:	00070e1b          	sext.w	t3,a4
    prev->next = next;
ffffffffc0201846:	0068b423          	sd	t1,8(a7)
    next->prev = prev;
ffffffffc020184a:	01133023          	sd	a7,0(t1)
        if (page->property > n)
ffffffffc020184e:	02c77863          	bgeu	a4,a2,ffffffffc020187e <default_alloc_pages+0x7e>
            struct Page *p = page + n;
ffffffffc0201852:	071a                	slli	a4,a4,0x6
ffffffffc0201854:	972a                	add	a4,a4,a0
            p->property = page->property - n;
ffffffffc0201856:	41c686bb          	subw	a3,a3,t3
ffffffffc020185a:	cb14                	sw	a3,16(a4)
    __op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc020185c:	00870613          	addi	a2,a4,8
ffffffffc0201860:	4689                	li	a3,2
ffffffffc0201862:	40d6302f          	amoor.d	zero,a3,(a2)
    __list_add(elm, listelm, listelm->next);
ffffffffc0201866:	0088b683          	ld	a3,8(a7)
            list_add(prev, &(p->page_link));
ffffffffc020186a:	01870613          	addi	a2,a4,24
        nr_free -= n;
ffffffffc020186e:	0105a803          	lw	a6,16(a1)
    prev->next = next->prev = elm;
ffffffffc0201872:	e290                	sd	a2,0(a3)
ffffffffc0201874:	00c8b423          	sd	a2,8(a7)
    elm->next = next;
ffffffffc0201878:	f314                	sd	a3,32(a4)
    elm->prev = prev;
ffffffffc020187a:	01173c23          	sd	a7,24(a4)
ffffffffc020187e:	41c8083b          	subw	a6,a6,t3
ffffffffc0201882:	0105a823          	sw	a6,16(a1)
    __op_bit(and, __NOT, nr, ((volatile unsigned long *)addr));
ffffffffc0201886:	5775                	li	a4,-3
ffffffffc0201888:	17c1                	addi	a5,a5,-16
ffffffffc020188a:	60e7b02f          	amoand.d	zero,a4,(a5)
}
ffffffffc020188e:	8082                	ret
{
ffffffffc0201890:	1141                	addi	sp,sp,-16
    assert(n > 0);
ffffffffc0201892:	00005697          	auipc	a3,0x5
ffffffffc0201896:	1d668693          	addi	a3,a3,470 # ffffffffc0206a68 <commands+0xb80>
ffffffffc020189a:	00005617          	auipc	a2,0x5
ffffffffc020189e:	e7660613          	addi	a2,a2,-394 # ffffffffc0206710 <commands+0x828>
ffffffffc02018a2:	06c00593          	li	a1,108
ffffffffc02018a6:	00005517          	auipc	a0,0x5
ffffffffc02018aa:	e8250513          	addi	a0,a0,-382 # ffffffffc0206728 <commands+0x840>
{
ffffffffc02018ae:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc02018b0:	be3fe0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02018b4 <default_init_memmap>:
{
ffffffffc02018b4:	1141                	addi	sp,sp,-16
ffffffffc02018b6:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc02018b8:	c5f1                	beqz	a1,ffffffffc0201984 <default_init_memmap+0xd0>
    for (; p != base + n; p++)
ffffffffc02018ba:	00659693          	slli	a3,a1,0x6
ffffffffc02018be:	96aa                	add	a3,a3,a0
ffffffffc02018c0:	87aa                	mv	a5,a0
ffffffffc02018c2:	00d50f63          	beq	a0,a3,ffffffffc02018e0 <default_init_memmap+0x2c>
    return (((*(volatile unsigned long *)addr) >> nr) & 1);
ffffffffc02018c6:	6798                	ld	a4,8(a5)
ffffffffc02018c8:	8b05                	andi	a4,a4,1
        assert(PageReserved(p));
ffffffffc02018ca:	cf49                	beqz	a4,ffffffffc0201964 <default_init_memmap+0xb0>
        p->flags = p->property = 0;
ffffffffc02018cc:	0007a823          	sw	zero,16(a5)
ffffffffc02018d0:	0007b423          	sd	zero,8(a5)
ffffffffc02018d4:	0007a023          	sw	zero,0(a5)
    for (; p != base + n; p++)
ffffffffc02018d8:	04078793          	addi	a5,a5,64
ffffffffc02018dc:	fed795e3          	bne	a5,a3,ffffffffc02018c6 <default_init_memmap+0x12>
    base->property = n;
ffffffffc02018e0:	2581                	sext.w	a1,a1
ffffffffc02018e2:	c90c                	sw	a1,16(a0)
    __op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc02018e4:	4789                	li	a5,2
ffffffffc02018e6:	00850713          	addi	a4,a0,8
ffffffffc02018ea:	40f7302f          	amoor.d	zero,a5,(a4)
    nr_free += n;
ffffffffc02018ee:	000c1697          	auipc	a3,0xc1
ffffffffc02018f2:	15a68693          	addi	a3,a3,346 # ffffffffc02c2a48 <free_area>
ffffffffc02018f6:	4a98                	lw	a4,16(a3)
    return list->next == list;
ffffffffc02018f8:	669c                	ld	a5,8(a3)
        list_add(&free_list, &(base->page_link));
ffffffffc02018fa:	01850613          	addi	a2,a0,24
    nr_free += n;
ffffffffc02018fe:	9db9                	addw	a1,a1,a4
ffffffffc0201900:	ca8c                	sw	a1,16(a3)
    if (list_empty(&free_list))
ffffffffc0201902:	04d78a63          	beq	a5,a3,ffffffffc0201956 <default_init_memmap+0xa2>
            struct Page *page = le2page(le, page_link);
ffffffffc0201906:	fe878713          	addi	a4,a5,-24
ffffffffc020190a:	0006b803          	ld	a6,0(a3)
    if (list_empty(&free_list))
ffffffffc020190e:	4581                	li	a1,0
            if (base < page)
ffffffffc0201910:	00e56a63          	bltu	a0,a4,ffffffffc0201924 <default_init_memmap+0x70>
    return listelm->next;
ffffffffc0201914:	6798                	ld	a4,8(a5)
            else if (list_next(le) == &free_list)
ffffffffc0201916:	02d70263          	beq	a4,a3,ffffffffc020193a <default_init_memmap+0x86>
    for (; p != base + n; p++)
ffffffffc020191a:	87ba                	mv	a5,a4
            struct Page *page = le2page(le, page_link);
ffffffffc020191c:	fe878713          	addi	a4,a5,-24
            if (base < page)
ffffffffc0201920:	fee57ae3          	bgeu	a0,a4,ffffffffc0201914 <default_init_memmap+0x60>
ffffffffc0201924:	c199                	beqz	a1,ffffffffc020192a <default_init_memmap+0x76>
ffffffffc0201926:	0106b023          	sd	a6,0(a3)
    __list_add(elm, listelm->prev, listelm);
ffffffffc020192a:	6398                	ld	a4,0(a5)
}
ffffffffc020192c:	60a2                	ld	ra,8(sp)
    prev->next = next->prev = elm;
ffffffffc020192e:	e390                	sd	a2,0(a5)
ffffffffc0201930:	e710                	sd	a2,8(a4)
    elm->next = next;
ffffffffc0201932:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc0201934:	ed18                	sd	a4,24(a0)
ffffffffc0201936:	0141                	addi	sp,sp,16
ffffffffc0201938:	8082                	ret
    prev->next = next->prev = elm;
ffffffffc020193a:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc020193c:	f114                	sd	a3,32(a0)
    return listelm->next;
ffffffffc020193e:	6798                	ld	a4,8(a5)
    elm->prev = prev;
ffffffffc0201940:	ed1c                	sd	a5,24(a0)
        while ((le = list_next(le)) != &free_list)
ffffffffc0201942:	00d70663          	beq	a4,a3,ffffffffc020194e <default_init_memmap+0x9a>
    prev->next = next->prev = elm;
ffffffffc0201946:	8832                	mv	a6,a2
ffffffffc0201948:	4585                	li	a1,1
    for (; p != base + n; p++)
ffffffffc020194a:	87ba                	mv	a5,a4
ffffffffc020194c:	bfc1                	j	ffffffffc020191c <default_init_memmap+0x68>
}
ffffffffc020194e:	60a2                	ld	ra,8(sp)
ffffffffc0201950:	e290                	sd	a2,0(a3)
ffffffffc0201952:	0141                	addi	sp,sp,16
ffffffffc0201954:	8082                	ret
ffffffffc0201956:	60a2                	ld	ra,8(sp)
ffffffffc0201958:	e390                	sd	a2,0(a5)
ffffffffc020195a:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc020195c:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc020195e:	ed1c                	sd	a5,24(a0)
ffffffffc0201960:	0141                	addi	sp,sp,16
ffffffffc0201962:	8082                	ret
        assert(PageReserved(p));
ffffffffc0201964:	00005697          	auipc	a3,0x5
ffffffffc0201968:	13468693          	addi	a3,a3,308 # ffffffffc0206a98 <commands+0xbb0>
ffffffffc020196c:	00005617          	auipc	a2,0x5
ffffffffc0201970:	da460613          	addi	a2,a2,-604 # ffffffffc0206710 <commands+0x828>
ffffffffc0201974:	04b00593          	li	a1,75
ffffffffc0201978:	00005517          	auipc	a0,0x5
ffffffffc020197c:	db050513          	addi	a0,a0,-592 # ffffffffc0206728 <commands+0x840>
ffffffffc0201980:	b13fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(n > 0);
ffffffffc0201984:	00005697          	auipc	a3,0x5
ffffffffc0201988:	0e468693          	addi	a3,a3,228 # ffffffffc0206a68 <commands+0xb80>
ffffffffc020198c:	00005617          	auipc	a2,0x5
ffffffffc0201990:	d8460613          	addi	a2,a2,-636 # ffffffffc0206710 <commands+0x828>
ffffffffc0201994:	04700593          	li	a1,71
ffffffffc0201998:	00005517          	auipc	a0,0x5
ffffffffc020199c:	d9050513          	addi	a0,a0,-624 # ffffffffc0206728 <commands+0x840>
ffffffffc02019a0:	af3fe0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02019a4 <slob_free>:
static void slob_free(void *block, int size)
{
	slob_t *cur, *b = (slob_t *)block;
	unsigned long flags;

	if (!block)
ffffffffc02019a4:	c94d                	beqz	a0,ffffffffc0201a56 <slob_free+0xb2>
{
ffffffffc02019a6:	1141                	addi	sp,sp,-16
ffffffffc02019a8:	e022                	sd	s0,0(sp)
ffffffffc02019aa:	e406                	sd	ra,8(sp)
ffffffffc02019ac:	842a                	mv	s0,a0
		return;

	if (size)
ffffffffc02019ae:	e9c1                	bnez	a1,ffffffffc0201a3e <slob_free+0x9a>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02019b0:	100027f3          	csrr	a5,sstatus
ffffffffc02019b4:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc02019b6:	4501                	li	a0,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02019b8:	ebd9                	bnez	a5,ffffffffc0201a4e <slob_free+0xaa>
		b->units = SLOB_UNITS(size);

	/* Find reinsertion point */
	spin_lock_irqsave(&slob_lock, flags);
	for (cur = slobfree; !(b > cur && b < cur->next); cur = cur->next)
ffffffffc02019ba:	000c1617          	auipc	a2,0xc1
ffffffffc02019be:	c7e60613          	addi	a2,a2,-898 # ffffffffc02c2638 <slobfree>
ffffffffc02019c2:	621c                	ld	a5,0(a2)
		if (cur >= cur->next && (b > cur || b < cur->next))
ffffffffc02019c4:	873e                	mv	a4,a5
	for (cur = slobfree; !(b > cur && b < cur->next); cur = cur->next)
ffffffffc02019c6:	679c                	ld	a5,8(a5)
ffffffffc02019c8:	02877a63          	bgeu	a4,s0,ffffffffc02019fc <slob_free+0x58>
ffffffffc02019cc:	00f46463          	bltu	s0,a5,ffffffffc02019d4 <slob_free+0x30>
		if (cur >= cur->next && (b > cur || b < cur->next))
ffffffffc02019d0:	fef76ae3          	bltu	a4,a5,ffffffffc02019c4 <slob_free+0x20>
			break;

	if (b + b->units == cur->next)
ffffffffc02019d4:	400c                	lw	a1,0(s0)
ffffffffc02019d6:	00459693          	slli	a3,a1,0x4
ffffffffc02019da:	96a2                	add	a3,a3,s0
ffffffffc02019dc:	02d78a63          	beq	a5,a3,ffffffffc0201a10 <slob_free+0x6c>
		b->next = cur->next->next;
	}
	else
		b->next = cur->next;

	if (cur + cur->units == b)
ffffffffc02019e0:	4314                	lw	a3,0(a4)
		b->next = cur->next;
ffffffffc02019e2:	e41c                	sd	a5,8(s0)
	if (cur + cur->units == b)
ffffffffc02019e4:	00469793          	slli	a5,a3,0x4
ffffffffc02019e8:	97ba                	add	a5,a5,a4
ffffffffc02019ea:	02f40e63          	beq	s0,a5,ffffffffc0201a26 <slob_free+0x82>
	{
		cur->units += b->units;
		cur->next = b->next;
	}
	else
		cur->next = b;
ffffffffc02019ee:	e700                	sd	s0,8(a4)

	slobfree = cur;
ffffffffc02019f0:	e218                	sd	a4,0(a2)
    if (flag)
ffffffffc02019f2:	e129                	bnez	a0,ffffffffc0201a34 <slob_free+0x90>

	spin_unlock_irqrestore(&slob_lock, flags);
}
ffffffffc02019f4:	60a2                	ld	ra,8(sp)
ffffffffc02019f6:	6402                	ld	s0,0(sp)
ffffffffc02019f8:	0141                	addi	sp,sp,16
ffffffffc02019fa:	8082                	ret
		if (cur >= cur->next && (b > cur || b < cur->next))
ffffffffc02019fc:	fcf764e3          	bltu	a4,a5,ffffffffc02019c4 <slob_free+0x20>
ffffffffc0201a00:	fcf472e3          	bgeu	s0,a5,ffffffffc02019c4 <slob_free+0x20>
	if (b + b->units == cur->next)
ffffffffc0201a04:	400c                	lw	a1,0(s0)
ffffffffc0201a06:	00459693          	slli	a3,a1,0x4
ffffffffc0201a0a:	96a2                	add	a3,a3,s0
ffffffffc0201a0c:	fcd79ae3          	bne	a5,a3,ffffffffc02019e0 <slob_free+0x3c>
		b->units += cur->next->units;
ffffffffc0201a10:	4394                	lw	a3,0(a5)
		b->next = cur->next->next;
ffffffffc0201a12:	679c                	ld	a5,8(a5)
		b->units += cur->next->units;
ffffffffc0201a14:	9db5                	addw	a1,a1,a3
ffffffffc0201a16:	c00c                	sw	a1,0(s0)
	if (cur + cur->units == b)
ffffffffc0201a18:	4314                	lw	a3,0(a4)
		b->next = cur->next->next;
ffffffffc0201a1a:	e41c                	sd	a5,8(s0)
	if (cur + cur->units == b)
ffffffffc0201a1c:	00469793          	slli	a5,a3,0x4
ffffffffc0201a20:	97ba                	add	a5,a5,a4
ffffffffc0201a22:	fcf416e3          	bne	s0,a5,ffffffffc02019ee <slob_free+0x4a>
		cur->units += b->units;
ffffffffc0201a26:	401c                	lw	a5,0(s0)
		cur->next = b->next;
ffffffffc0201a28:	640c                	ld	a1,8(s0)
	slobfree = cur;
ffffffffc0201a2a:	e218                	sd	a4,0(a2)
		cur->units += b->units;
ffffffffc0201a2c:	9ebd                	addw	a3,a3,a5
ffffffffc0201a2e:	c314                	sw	a3,0(a4)
		cur->next = b->next;
ffffffffc0201a30:	e70c                	sd	a1,8(a4)
ffffffffc0201a32:	d169                	beqz	a0,ffffffffc02019f4 <slob_free+0x50>
}
ffffffffc0201a34:	6402                	ld	s0,0(sp)
ffffffffc0201a36:	60a2                	ld	ra,8(sp)
ffffffffc0201a38:	0141                	addi	sp,sp,16
        intr_enable();
ffffffffc0201a3a:	f6ffe06f          	j	ffffffffc02009a8 <intr_enable>
		b->units = SLOB_UNITS(size);
ffffffffc0201a3e:	25bd                	addiw	a1,a1,15
ffffffffc0201a40:	8191                	srli	a1,a1,0x4
ffffffffc0201a42:	c10c                	sw	a1,0(a0)
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201a44:	100027f3          	csrr	a5,sstatus
ffffffffc0201a48:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc0201a4a:	4501                	li	a0,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201a4c:	d7bd                	beqz	a5,ffffffffc02019ba <slob_free+0x16>
        intr_disable();
ffffffffc0201a4e:	f61fe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        return 1;
ffffffffc0201a52:	4505                	li	a0,1
ffffffffc0201a54:	b79d                	j	ffffffffc02019ba <slob_free+0x16>
ffffffffc0201a56:	8082                	ret

ffffffffc0201a58 <__slob_get_free_pages.constprop.0>:
	struct Page *page = alloc_pages(1 << order);
ffffffffc0201a58:	4785                	li	a5,1
static void *__slob_get_free_pages(gfp_t gfp, int order)
ffffffffc0201a5a:	1141                	addi	sp,sp,-16
	struct Page *page = alloc_pages(1 << order);
ffffffffc0201a5c:	00a7953b          	sllw	a0,a5,a0
static void *__slob_get_free_pages(gfp_t gfp, int order)
ffffffffc0201a60:	e406                	sd	ra,8(sp)
	struct Page *page = alloc_pages(1 << order);
ffffffffc0201a62:	352000ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
	if (!page)
ffffffffc0201a66:	c91d                	beqz	a0,ffffffffc0201a9c <__slob_get_free_pages.constprop.0+0x44>
    return page - pages + nbase;
ffffffffc0201a68:	000c5697          	auipc	a3,0xc5
ffffffffc0201a6c:	0786b683          	ld	a3,120(a3) # ffffffffc02c6ae0 <pages>
ffffffffc0201a70:	8d15                	sub	a0,a0,a3
ffffffffc0201a72:	8519                	srai	a0,a0,0x6
ffffffffc0201a74:	00007697          	auipc	a3,0x7
ffffffffc0201a78:	aac6b683          	ld	a3,-1364(a3) # ffffffffc0208520 <nbase>
ffffffffc0201a7c:	9536                	add	a0,a0,a3
    return KADDR(page2pa(page));
ffffffffc0201a7e:	00c51793          	slli	a5,a0,0xc
ffffffffc0201a82:	83b1                	srli	a5,a5,0xc
ffffffffc0201a84:	000c5717          	auipc	a4,0xc5
ffffffffc0201a88:	05473703          	ld	a4,84(a4) # ffffffffc02c6ad8 <npage>
    return page2ppn(page) << PGSHIFT;
ffffffffc0201a8c:	0532                	slli	a0,a0,0xc
    return KADDR(page2pa(page));
ffffffffc0201a8e:	00e7fa63          	bgeu	a5,a4,ffffffffc0201aa2 <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201a92:	000c5697          	auipc	a3,0xc5
ffffffffc0201a96:	05e6b683          	ld	a3,94(a3) # ffffffffc02c6af0 <va_pa_offset>
ffffffffc0201a9a:	9536                	add	a0,a0,a3
}
ffffffffc0201a9c:	60a2                	ld	ra,8(sp)
ffffffffc0201a9e:	0141                	addi	sp,sp,16
ffffffffc0201aa0:	8082                	ret
ffffffffc0201aa2:	86aa                	mv	a3,a0
ffffffffc0201aa4:	00005617          	auipc	a2,0x5
ffffffffc0201aa8:	05460613          	addi	a2,a2,84 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc0201aac:	07100593          	li	a1,113
ffffffffc0201ab0:	00005517          	auipc	a0,0x5
ffffffffc0201ab4:	07050513          	addi	a0,a0,112 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc0201ab8:	9dbfe0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0201abc <slob_alloc.constprop.0>:
static void *slob_alloc(size_t size, gfp_t gfp, int align)
ffffffffc0201abc:	1101                	addi	sp,sp,-32
ffffffffc0201abe:	ec06                	sd	ra,24(sp)
ffffffffc0201ac0:	e822                	sd	s0,16(sp)
ffffffffc0201ac2:	e426                	sd	s1,8(sp)
ffffffffc0201ac4:	e04a                	sd	s2,0(sp)
	assert((size + SLOB_UNIT) < PAGE_SIZE);
ffffffffc0201ac6:	01050713          	addi	a4,a0,16
ffffffffc0201aca:	6785                	lui	a5,0x1
ffffffffc0201acc:	0cf77363          	bgeu	a4,a5,ffffffffc0201b92 <slob_alloc.constprop.0+0xd6>
	int delta = 0, units = SLOB_UNITS(size);
ffffffffc0201ad0:	00f50493          	addi	s1,a0,15
ffffffffc0201ad4:	8091                	srli	s1,s1,0x4
ffffffffc0201ad6:	2481                	sext.w	s1,s1
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201ad8:	10002673          	csrr	a2,sstatus
ffffffffc0201adc:	8a09                	andi	a2,a2,2
ffffffffc0201ade:	e25d                	bnez	a2,ffffffffc0201b84 <slob_alloc.constprop.0+0xc8>
	prev = slobfree;
ffffffffc0201ae0:	000c1917          	auipc	s2,0xc1
ffffffffc0201ae4:	b5890913          	addi	s2,s2,-1192 # ffffffffc02c2638 <slobfree>
ffffffffc0201ae8:	00093683          	ld	a3,0(s2)
	for (cur = prev->next;; prev = cur, cur = cur->next)
ffffffffc0201aec:	669c                	ld	a5,8(a3)
		if (cur->units >= units + delta)
ffffffffc0201aee:	4398                	lw	a4,0(a5)
ffffffffc0201af0:	08975e63          	bge	a4,s1,ffffffffc0201b8c <slob_alloc.constprop.0+0xd0>
		if (cur == slobfree)
ffffffffc0201af4:	00f68b63          	beq	a3,a5,ffffffffc0201b0a <slob_alloc.constprop.0+0x4e>
	for (cur = prev->next;; prev = cur, cur = cur->next)
ffffffffc0201af8:	6780                	ld	s0,8(a5)
		if (cur->units >= units + delta)
ffffffffc0201afa:	4018                	lw	a4,0(s0)
ffffffffc0201afc:	02975a63          	bge	a4,s1,ffffffffc0201b30 <slob_alloc.constprop.0+0x74>
		if (cur == slobfree)
ffffffffc0201b00:	00093683          	ld	a3,0(s2)
ffffffffc0201b04:	87a2                	mv	a5,s0
ffffffffc0201b06:	fef699e3          	bne	a3,a5,ffffffffc0201af8 <slob_alloc.constprop.0+0x3c>
    if (flag)
ffffffffc0201b0a:	ee31                	bnez	a2,ffffffffc0201b66 <slob_alloc.constprop.0+0xaa>
			cur = (slob_t *)__slob_get_free_page(gfp);
ffffffffc0201b0c:	4501                	li	a0,0
ffffffffc0201b0e:	f4bff0ef          	jal	ra,ffffffffc0201a58 <__slob_get_free_pages.constprop.0>
ffffffffc0201b12:	842a                	mv	s0,a0
			if (!cur)
ffffffffc0201b14:	cd05                	beqz	a0,ffffffffc0201b4c <slob_alloc.constprop.0+0x90>
			slob_free(cur, PAGE_SIZE);
ffffffffc0201b16:	6585                	lui	a1,0x1
ffffffffc0201b18:	e8dff0ef          	jal	ra,ffffffffc02019a4 <slob_free>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201b1c:	10002673          	csrr	a2,sstatus
ffffffffc0201b20:	8a09                	andi	a2,a2,2
ffffffffc0201b22:	ee05                	bnez	a2,ffffffffc0201b5a <slob_alloc.constprop.0+0x9e>
			cur = slobfree;
ffffffffc0201b24:	00093783          	ld	a5,0(s2)
	for (cur = prev->next;; prev = cur, cur = cur->next)
ffffffffc0201b28:	6780                	ld	s0,8(a5)
		if (cur->units >= units + delta)
ffffffffc0201b2a:	4018                	lw	a4,0(s0)
ffffffffc0201b2c:	fc974ae3          	blt	a4,s1,ffffffffc0201b00 <slob_alloc.constprop.0+0x44>
			if (cur->units == units)	/* exact fit? */
ffffffffc0201b30:	04e48763          	beq	s1,a4,ffffffffc0201b7e <slob_alloc.constprop.0+0xc2>
				prev->next = cur + units;
ffffffffc0201b34:	00449693          	slli	a3,s1,0x4
ffffffffc0201b38:	96a2                	add	a3,a3,s0
ffffffffc0201b3a:	e794                	sd	a3,8(a5)
				prev->next->next = cur->next;
ffffffffc0201b3c:	640c                	ld	a1,8(s0)
				prev->next->units = cur->units - units;
ffffffffc0201b3e:	9f05                	subw	a4,a4,s1
ffffffffc0201b40:	c298                	sw	a4,0(a3)
				prev->next->next = cur->next;
ffffffffc0201b42:	e68c                	sd	a1,8(a3)
				cur->units = units;
ffffffffc0201b44:	c004                	sw	s1,0(s0)
			slobfree = prev;
ffffffffc0201b46:	00f93023          	sd	a5,0(s2)
    if (flag)
ffffffffc0201b4a:	e20d                	bnez	a2,ffffffffc0201b6c <slob_alloc.constprop.0+0xb0>
}
ffffffffc0201b4c:	60e2                	ld	ra,24(sp)
ffffffffc0201b4e:	8522                	mv	a0,s0
ffffffffc0201b50:	6442                	ld	s0,16(sp)
ffffffffc0201b52:	64a2                	ld	s1,8(sp)
ffffffffc0201b54:	6902                	ld	s2,0(sp)
ffffffffc0201b56:	6105                	addi	sp,sp,32
ffffffffc0201b58:	8082                	ret
        intr_disable();
ffffffffc0201b5a:	e55fe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
			cur = slobfree;
ffffffffc0201b5e:	00093783          	ld	a5,0(s2)
        return 1;
ffffffffc0201b62:	4605                	li	a2,1
ffffffffc0201b64:	b7d1                	j	ffffffffc0201b28 <slob_alloc.constprop.0+0x6c>
        intr_enable();
ffffffffc0201b66:	e43fe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0201b6a:	b74d                	j	ffffffffc0201b0c <slob_alloc.constprop.0+0x50>
ffffffffc0201b6c:	e3dfe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
}
ffffffffc0201b70:	60e2                	ld	ra,24(sp)
ffffffffc0201b72:	8522                	mv	a0,s0
ffffffffc0201b74:	6442                	ld	s0,16(sp)
ffffffffc0201b76:	64a2                	ld	s1,8(sp)
ffffffffc0201b78:	6902                	ld	s2,0(sp)
ffffffffc0201b7a:	6105                	addi	sp,sp,32
ffffffffc0201b7c:	8082                	ret
				prev->next = cur->next; /* unlink */
ffffffffc0201b7e:	6418                	ld	a4,8(s0)
ffffffffc0201b80:	e798                	sd	a4,8(a5)
ffffffffc0201b82:	b7d1                	j	ffffffffc0201b46 <slob_alloc.constprop.0+0x8a>
        intr_disable();
ffffffffc0201b84:	e2bfe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        return 1;
ffffffffc0201b88:	4605                	li	a2,1
ffffffffc0201b8a:	bf99                	j	ffffffffc0201ae0 <slob_alloc.constprop.0+0x24>
		if (cur->units >= units + delta)
ffffffffc0201b8c:	843e                	mv	s0,a5
ffffffffc0201b8e:	87b6                	mv	a5,a3
ffffffffc0201b90:	b745                	j	ffffffffc0201b30 <slob_alloc.constprop.0+0x74>
	assert((size + SLOB_UNIT) < PAGE_SIZE);
ffffffffc0201b92:	00005697          	auipc	a3,0x5
ffffffffc0201b96:	f9e68693          	addi	a3,a3,-98 # ffffffffc0206b30 <default_pmm_manager+0x70>
ffffffffc0201b9a:	00005617          	auipc	a2,0x5
ffffffffc0201b9e:	b7660613          	addi	a2,a2,-1162 # ffffffffc0206710 <commands+0x828>
ffffffffc0201ba2:	06300593          	li	a1,99
ffffffffc0201ba6:	00005517          	auipc	a0,0x5
ffffffffc0201baa:	faa50513          	addi	a0,a0,-86 # ffffffffc0206b50 <default_pmm_manager+0x90>
ffffffffc0201bae:	8e5fe0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0201bb2 <kmalloc_init>:
	cprintf("use SLOB allocator\n");
}

inline void
kmalloc_init(void)
{
ffffffffc0201bb2:	1141                	addi	sp,sp,-16
	cprintf("use SLOB allocator\n");
ffffffffc0201bb4:	00005517          	auipc	a0,0x5
ffffffffc0201bb8:	fb450513          	addi	a0,a0,-76 # ffffffffc0206b68 <default_pmm_manager+0xa8>
{
ffffffffc0201bbc:	e406                	sd	ra,8(sp)
	cprintf("use SLOB allocator\n");
ffffffffc0201bbe:	ddafe0ef          	jal	ra,ffffffffc0200198 <cprintf>
	slob_init();
	cprintf("kmalloc_init() succeeded!\n");
}
ffffffffc0201bc2:	60a2                	ld	ra,8(sp)
	cprintf("kmalloc_init() succeeded!\n");
ffffffffc0201bc4:	00005517          	auipc	a0,0x5
ffffffffc0201bc8:	fbc50513          	addi	a0,a0,-68 # ffffffffc0206b80 <default_pmm_manager+0xc0>
}
ffffffffc0201bcc:	0141                	addi	sp,sp,16
	cprintf("kmalloc_init() succeeded!\n");
ffffffffc0201bce:	dcafe06f          	j	ffffffffc0200198 <cprintf>

ffffffffc0201bd2 <kallocated>:

size_t
kallocated(void)
{
	return slob_allocated();
}
ffffffffc0201bd2:	4501                	li	a0,0
ffffffffc0201bd4:	8082                	ret

ffffffffc0201bd6 <kmalloc>:
	return 0;
}

void *
kmalloc(size_t size)
{
ffffffffc0201bd6:	1101                	addi	sp,sp,-32
ffffffffc0201bd8:	e04a                	sd	s2,0(sp)
	if (size < PAGE_SIZE - SLOB_UNIT)
ffffffffc0201bda:	6905                	lui	s2,0x1
{
ffffffffc0201bdc:	e822                	sd	s0,16(sp)
ffffffffc0201bde:	ec06                	sd	ra,24(sp)
ffffffffc0201be0:	e426                	sd	s1,8(sp)
	if (size < PAGE_SIZE - SLOB_UNIT)
ffffffffc0201be2:	fef90793          	addi	a5,s2,-17 # fef <_binary_obj___user_faultread_out_size-0x8f41>
{
ffffffffc0201be6:	842a                	mv	s0,a0
	if (size < PAGE_SIZE - SLOB_UNIT)
ffffffffc0201be8:	04a7f963          	bgeu	a5,a0,ffffffffc0201c3a <kmalloc+0x64>
	bb = slob_alloc(sizeof(bigblock_t), gfp, 0);
ffffffffc0201bec:	4561                	li	a0,24
ffffffffc0201bee:	ecfff0ef          	jal	ra,ffffffffc0201abc <slob_alloc.constprop.0>
ffffffffc0201bf2:	84aa                	mv	s1,a0
	if (!bb)
ffffffffc0201bf4:	c929                	beqz	a0,ffffffffc0201c46 <kmalloc+0x70>
	bb->order = find_order(size);
ffffffffc0201bf6:	0004079b          	sext.w	a5,s0
	int order = 0;
ffffffffc0201bfa:	4501                	li	a0,0
	for (; size > 4096; size >>= 1)
ffffffffc0201bfc:	00f95763          	bge	s2,a5,ffffffffc0201c0a <kmalloc+0x34>
ffffffffc0201c00:	6705                	lui	a4,0x1
ffffffffc0201c02:	8785                	srai	a5,a5,0x1
		order++;
ffffffffc0201c04:	2505                	addiw	a0,a0,1
	for (; size > 4096; size >>= 1)
ffffffffc0201c06:	fef74ee3          	blt	a4,a5,ffffffffc0201c02 <kmalloc+0x2c>
	bb->order = find_order(size);
ffffffffc0201c0a:	c088                	sw	a0,0(s1)
	bb->pages = (void *)__slob_get_free_pages(gfp, bb->order);
ffffffffc0201c0c:	e4dff0ef          	jal	ra,ffffffffc0201a58 <__slob_get_free_pages.constprop.0>
ffffffffc0201c10:	e488                	sd	a0,8(s1)
ffffffffc0201c12:	842a                	mv	s0,a0
	if (bb->pages)
ffffffffc0201c14:	c525                	beqz	a0,ffffffffc0201c7c <kmalloc+0xa6>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201c16:	100027f3          	csrr	a5,sstatus
ffffffffc0201c1a:	8b89                	andi	a5,a5,2
ffffffffc0201c1c:	ef8d                	bnez	a5,ffffffffc0201c56 <kmalloc+0x80>
		bb->next = bigblocks;
ffffffffc0201c1e:	000c5797          	auipc	a5,0xc5
ffffffffc0201c22:	ea278793          	addi	a5,a5,-350 # ffffffffc02c6ac0 <bigblocks>
ffffffffc0201c26:	6398                	ld	a4,0(a5)
		bigblocks = bb;
ffffffffc0201c28:	e384                	sd	s1,0(a5)
		bb->next = bigblocks;
ffffffffc0201c2a:	e898                	sd	a4,16(s1)
	return __kmalloc(size, 0);
}
ffffffffc0201c2c:	60e2                	ld	ra,24(sp)
ffffffffc0201c2e:	8522                	mv	a0,s0
ffffffffc0201c30:	6442                	ld	s0,16(sp)
ffffffffc0201c32:	64a2                	ld	s1,8(sp)
ffffffffc0201c34:	6902                	ld	s2,0(sp)
ffffffffc0201c36:	6105                	addi	sp,sp,32
ffffffffc0201c38:	8082                	ret
		m = slob_alloc(size + SLOB_UNIT, gfp, 0);
ffffffffc0201c3a:	0541                	addi	a0,a0,16
ffffffffc0201c3c:	e81ff0ef          	jal	ra,ffffffffc0201abc <slob_alloc.constprop.0>
		return m ? (void *)(m + 1) : 0;
ffffffffc0201c40:	01050413          	addi	s0,a0,16
ffffffffc0201c44:	f565                	bnez	a0,ffffffffc0201c2c <kmalloc+0x56>
ffffffffc0201c46:	4401                	li	s0,0
}
ffffffffc0201c48:	60e2                	ld	ra,24(sp)
ffffffffc0201c4a:	8522                	mv	a0,s0
ffffffffc0201c4c:	6442                	ld	s0,16(sp)
ffffffffc0201c4e:	64a2                	ld	s1,8(sp)
ffffffffc0201c50:	6902                	ld	s2,0(sp)
ffffffffc0201c52:	6105                	addi	sp,sp,32
ffffffffc0201c54:	8082                	ret
        intr_disable();
ffffffffc0201c56:	d59fe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
		bb->next = bigblocks;
ffffffffc0201c5a:	000c5797          	auipc	a5,0xc5
ffffffffc0201c5e:	e6678793          	addi	a5,a5,-410 # ffffffffc02c6ac0 <bigblocks>
ffffffffc0201c62:	6398                	ld	a4,0(a5)
		bigblocks = bb;
ffffffffc0201c64:	e384                	sd	s1,0(a5)
		bb->next = bigblocks;
ffffffffc0201c66:	e898                	sd	a4,16(s1)
        intr_enable();
ffffffffc0201c68:	d41fe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
		return bb->pages;
ffffffffc0201c6c:	6480                	ld	s0,8(s1)
}
ffffffffc0201c6e:	60e2                	ld	ra,24(sp)
ffffffffc0201c70:	64a2                	ld	s1,8(sp)
ffffffffc0201c72:	8522                	mv	a0,s0
ffffffffc0201c74:	6442                	ld	s0,16(sp)
ffffffffc0201c76:	6902                	ld	s2,0(sp)
ffffffffc0201c78:	6105                	addi	sp,sp,32
ffffffffc0201c7a:	8082                	ret
	slob_free(bb, sizeof(bigblock_t));
ffffffffc0201c7c:	45e1                	li	a1,24
ffffffffc0201c7e:	8526                	mv	a0,s1
ffffffffc0201c80:	d25ff0ef          	jal	ra,ffffffffc02019a4 <slob_free>
	return __kmalloc(size, 0);
ffffffffc0201c84:	b765                	j	ffffffffc0201c2c <kmalloc+0x56>

ffffffffc0201c86 <kfree>:
void kfree(void *block)
{
	bigblock_t *bb, **last = &bigblocks;
	unsigned long flags;

	if (!block)
ffffffffc0201c86:	c169                	beqz	a0,ffffffffc0201d48 <kfree+0xc2>
{
ffffffffc0201c88:	1101                	addi	sp,sp,-32
ffffffffc0201c8a:	e822                	sd	s0,16(sp)
ffffffffc0201c8c:	ec06                	sd	ra,24(sp)
ffffffffc0201c8e:	e426                	sd	s1,8(sp)
		return;

	if (!((unsigned long)block & (PAGE_SIZE - 1)))
ffffffffc0201c90:	03451793          	slli	a5,a0,0x34
ffffffffc0201c94:	842a                	mv	s0,a0
ffffffffc0201c96:	e3d9                	bnez	a5,ffffffffc0201d1c <kfree+0x96>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201c98:	100027f3          	csrr	a5,sstatus
ffffffffc0201c9c:	8b89                	andi	a5,a5,2
ffffffffc0201c9e:	e7d9                	bnez	a5,ffffffffc0201d2c <kfree+0xa6>
	{
		/* might be on the big block list */
		spin_lock_irqsave(&block_lock, flags);
		for (bb = bigblocks; bb; last = &bb->next, bb = bb->next)
ffffffffc0201ca0:	000c5797          	auipc	a5,0xc5
ffffffffc0201ca4:	e207b783          	ld	a5,-480(a5) # ffffffffc02c6ac0 <bigblocks>
    return 0;
ffffffffc0201ca8:	4601                	li	a2,0
ffffffffc0201caa:	cbad                	beqz	a5,ffffffffc0201d1c <kfree+0x96>
	bigblock_t *bb, **last = &bigblocks;
ffffffffc0201cac:	000c5697          	auipc	a3,0xc5
ffffffffc0201cb0:	e1468693          	addi	a3,a3,-492 # ffffffffc02c6ac0 <bigblocks>
ffffffffc0201cb4:	a021                	j	ffffffffc0201cbc <kfree+0x36>
		for (bb = bigblocks; bb; last = &bb->next, bb = bb->next)
ffffffffc0201cb6:	01048693          	addi	a3,s1,16
ffffffffc0201cba:	c3a5                	beqz	a5,ffffffffc0201d1a <kfree+0x94>
		{
			if (bb->pages == block)
ffffffffc0201cbc:	6798                	ld	a4,8(a5)
ffffffffc0201cbe:	84be                	mv	s1,a5
			{
				*last = bb->next;
ffffffffc0201cc0:	6b9c                	ld	a5,16(a5)
			if (bb->pages == block)
ffffffffc0201cc2:	fe871ae3          	bne	a4,s0,ffffffffc0201cb6 <kfree+0x30>
				*last = bb->next;
ffffffffc0201cc6:	e29c                	sd	a5,0(a3)
    if (flag)
ffffffffc0201cc8:	ee2d                	bnez	a2,ffffffffc0201d42 <kfree+0xbc>
    return pa2page(PADDR(kva));
ffffffffc0201cca:	c02007b7          	lui	a5,0xc0200
				spin_unlock_irqrestore(&block_lock, flags);
				__slob_free_pages((unsigned long)block, bb->order);
ffffffffc0201cce:	4098                	lw	a4,0(s1)
ffffffffc0201cd0:	08f46963          	bltu	s0,a5,ffffffffc0201d62 <kfree+0xdc>
ffffffffc0201cd4:	000c5697          	auipc	a3,0xc5
ffffffffc0201cd8:	e1c6b683          	ld	a3,-484(a3) # ffffffffc02c6af0 <va_pa_offset>
ffffffffc0201cdc:	8c15                	sub	s0,s0,a3
    if (PPN(pa) >= npage)
ffffffffc0201cde:	8031                	srli	s0,s0,0xc
ffffffffc0201ce0:	000c5797          	auipc	a5,0xc5
ffffffffc0201ce4:	df87b783          	ld	a5,-520(a5) # ffffffffc02c6ad8 <npage>
ffffffffc0201ce8:	06f47163          	bgeu	s0,a5,ffffffffc0201d4a <kfree+0xc4>
    return &pages[PPN(pa) - nbase];
ffffffffc0201cec:	00007517          	auipc	a0,0x7
ffffffffc0201cf0:	83453503          	ld	a0,-1996(a0) # ffffffffc0208520 <nbase>
ffffffffc0201cf4:	8c09                	sub	s0,s0,a0
ffffffffc0201cf6:	041a                	slli	s0,s0,0x6
	free_pages(kva2page(kva), 1 << order);
ffffffffc0201cf8:	000c5517          	auipc	a0,0xc5
ffffffffc0201cfc:	de853503          	ld	a0,-536(a0) # ffffffffc02c6ae0 <pages>
ffffffffc0201d00:	4585                	li	a1,1
ffffffffc0201d02:	9522                	add	a0,a0,s0
ffffffffc0201d04:	00e595bb          	sllw	a1,a1,a4
ffffffffc0201d08:	0ea000ef          	jal	ra,ffffffffc0201df2 <free_pages>
		spin_unlock_irqrestore(&block_lock, flags);
	}

	slob_free((slob_t *)block - 1, 0);
	return;
}
ffffffffc0201d0c:	6442                	ld	s0,16(sp)
ffffffffc0201d0e:	60e2                	ld	ra,24(sp)
				slob_free(bb, sizeof(bigblock_t));
ffffffffc0201d10:	8526                	mv	a0,s1
}
ffffffffc0201d12:	64a2                	ld	s1,8(sp)
				slob_free(bb, sizeof(bigblock_t));
ffffffffc0201d14:	45e1                	li	a1,24
}
ffffffffc0201d16:	6105                	addi	sp,sp,32
	slob_free((slob_t *)block - 1, 0);
ffffffffc0201d18:	b171                	j	ffffffffc02019a4 <slob_free>
ffffffffc0201d1a:	e20d                	bnez	a2,ffffffffc0201d3c <kfree+0xb6>
ffffffffc0201d1c:	ff040513          	addi	a0,s0,-16
}
ffffffffc0201d20:	6442                	ld	s0,16(sp)
ffffffffc0201d22:	60e2                	ld	ra,24(sp)
ffffffffc0201d24:	64a2                	ld	s1,8(sp)
	slob_free((slob_t *)block - 1, 0);
ffffffffc0201d26:	4581                	li	a1,0
}
ffffffffc0201d28:	6105                	addi	sp,sp,32
	slob_free((slob_t *)block - 1, 0);
ffffffffc0201d2a:	b9ad                	j	ffffffffc02019a4 <slob_free>
        intr_disable();
ffffffffc0201d2c:	c83fe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
		for (bb = bigblocks; bb; last = &bb->next, bb = bb->next)
ffffffffc0201d30:	000c5797          	auipc	a5,0xc5
ffffffffc0201d34:	d907b783          	ld	a5,-624(a5) # ffffffffc02c6ac0 <bigblocks>
        return 1;
ffffffffc0201d38:	4605                	li	a2,1
ffffffffc0201d3a:	fbad                	bnez	a5,ffffffffc0201cac <kfree+0x26>
        intr_enable();
ffffffffc0201d3c:	c6dfe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0201d40:	bff1                	j	ffffffffc0201d1c <kfree+0x96>
ffffffffc0201d42:	c67fe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0201d46:	b751                	j	ffffffffc0201cca <kfree+0x44>
ffffffffc0201d48:	8082                	ret
        panic("pa2page called with invalid pa");
ffffffffc0201d4a:	00005617          	auipc	a2,0x5
ffffffffc0201d4e:	e7e60613          	addi	a2,a2,-386 # ffffffffc0206bc8 <default_pmm_manager+0x108>
ffffffffc0201d52:	06900593          	li	a1,105
ffffffffc0201d56:	00005517          	auipc	a0,0x5
ffffffffc0201d5a:	dca50513          	addi	a0,a0,-566 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc0201d5e:	f34fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    return pa2page(PADDR(kva));
ffffffffc0201d62:	86a2                	mv	a3,s0
ffffffffc0201d64:	00005617          	auipc	a2,0x5
ffffffffc0201d68:	e3c60613          	addi	a2,a2,-452 # ffffffffc0206ba0 <default_pmm_manager+0xe0>
ffffffffc0201d6c:	07700593          	li	a1,119
ffffffffc0201d70:	00005517          	auipc	a0,0x5
ffffffffc0201d74:	db050513          	addi	a0,a0,-592 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc0201d78:	f1afe0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0201d7c <pa2page.part.0>:
pa2page(uintptr_t pa)
ffffffffc0201d7c:	1141                	addi	sp,sp,-16
        panic("pa2page called with invalid pa");
ffffffffc0201d7e:	00005617          	auipc	a2,0x5
ffffffffc0201d82:	e4a60613          	addi	a2,a2,-438 # ffffffffc0206bc8 <default_pmm_manager+0x108>
ffffffffc0201d86:	06900593          	li	a1,105
ffffffffc0201d8a:	00005517          	auipc	a0,0x5
ffffffffc0201d8e:	d9650513          	addi	a0,a0,-618 # ffffffffc0206b20 <default_pmm_manager+0x60>
pa2page(uintptr_t pa)
ffffffffc0201d92:	e406                	sd	ra,8(sp)
        panic("pa2page called with invalid pa");
ffffffffc0201d94:	efefe0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0201d98 <pte2page.part.0>:
pte2page(pte_t pte)
ffffffffc0201d98:	1141                	addi	sp,sp,-16
        panic("pte2page called with invalid pte");
ffffffffc0201d9a:	00005617          	auipc	a2,0x5
ffffffffc0201d9e:	e4e60613          	addi	a2,a2,-434 # ffffffffc0206be8 <default_pmm_manager+0x128>
ffffffffc0201da2:	07f00593          	li	a1,127
ffffffffc0201da6:	00005517          	auipc	a0,0x5
ffffffffc0201daa:	d7a50513          	addi	a0,a0,-646 # ffffffffc0206b20 <default_pmm_manager+0x60>
pte2page(pte_t pte)
ffffffffc0201dae:	e406                	sd	ra,8(sp)
        panic("pte2page called with invalid pte");
ffffffffc0201db0:	ee2fe0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0201db4 <alloc_pages>:
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201db4:	100027f3          	csrr	a5,sstatus
ffffffffc0201db8:	8b89                	andi	a5,a5,2
ffffffffc0201dba:	e799                	bnez	a5,ffffffffc0201dc8 <alloc_pages+0x14>
{
    struct Page *page = NULL;
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        page = pmm_manager->alloc_pages(n);
ffffffffc0201dbc:	000c5797          	auipc	a5,0xc5
ffffffffc0201dc0:	d2c7b783          	ld	a5,-724(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0201dc4:	6f9c                	ld	a5,24(a5)
ffffffffc0201dc6:	8782                	jr	a5
{
ffffffffc0201dc8:	1141                	addi	sp,sp,-16
ffffffffc0201dca:	e406                	sd	ra,8(sp)
ffffffffc0201dcc:	e022                	sd	s0,0(sp)
ffffffffc0201dce:	842a                	mv	s0,a0
        intr_disable();
ffffffffc0201dd0:	bdffe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc0201dd4:	000c5797          	auipc	a5,0xc5
ffffffffc0201dd8:	d147b783          	ld	a5,-748(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0201ddc:	6f9c                	ld	a5,24(a5)
ffffffffc0201dde:	8522                	mv	a0,s0
ffffffffc0201de0:	9782                	jalr	a5
ffffffffc0201de2:	842a                	mv	s0,a0
        intr_enable();
ffffffffc0201de4:	bc5fe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
    }
    local_intr_restore(intr_flag);
    return page;
}
ffffffffc0201de8:	60a2                	ld	ra,8(sp)
ffffffffc0201dea:	8522                	mv	a0,s0
ffffffffc0201dec:	6402                	ld	s0,0(sp)
ffffffffc0201dee:	0141                	addi	sp,sp,16
ffffffffc0201df0:	8082                	ret

ffffffffc0201df2 <free_pages>:
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201df2:	100027f3          	csrr	a5,sstatus
ffffffffc0201df6:	8b89                	andi	a5,a5,2
ffffffffc0201df8:	e799                	bnez	a5,ffffffffc0201e06 <free_pages+0x14>
void free_pages(struct Page *base, size_t n)
{
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        pmm_manager->free_pages(base, n);
ffffffffc0201dfa:	000c5797          	auipc	a5,0xc5
ffffffffc0201dfe:	cee7b783          	ld	a5,-786(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0201e02:	739c                	ld	a5,32(a5)
ffffffffc0201e04:	8782                	jr	a5
{
ffffffffc0201e06:	1101                	addi	sp,sp,-32
ffffffffc0201e08:	ec06                	sd	ra,24(sp)
ffffffffc0201e0a:	e822                	sd	s0,16(sp)
ffffffffc0201e0c:	e426                	sd	s1,8(sp)
ffffffffc0201e0e:	842a                	mv	s0,a0
ffffffffc0201e10:	84ae                	mv	s1,a1
        intr_disable();
ffffffffc0201e12:	b9dfe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc0201e16:	000c5797          	auipc	a5,0xc5
ffffffffc0201e1a:	cd27b783          	ld	a5,-814(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0201e1e:	739c                	ld	a5,32(a5)
ffffffffc0201e20:	85a6                	mv	a1,s1
ffffffffc0201e22:	8522                	mv	a0,s0
ffffffffc0201e24:	9782                	jalr	a5
    }
    local_intr_restore(intr_flag);
}
ffffffffc0201e26:	6442                	ld	s0,16(sp)
ffffffffc0201e28:	60e2                	ld	ra,24(sp)
ffffffffc0201e2a:	64a2                	ld	s1,8(sp)
ffffffffc0201e2c:	6105                	addi	sp,sp,32
        intr_enable();
ffffffffc0201e2e:	b7bfe06f          	j	ffffffffc02009a8 <intr_enable>

ffffffffc0201e32 <nr_free_pages>:
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201e32:	100027f3          	csrr	a5,sstatus
ffffffffc0201e36:	8b89                	andi	a5,a5,2
ffffffffc0201e38:	e799                	bnez	a5,ffffffffc0201e46 <nr_free_pages+0x14>
{
    size_t ret;
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        ret = pmm_manager->nr_free_pages();
ffffffffc0201e3a:	000c5797          	auipc	a5,0xc5
ffffffffc0201e3e:	cae7b783          	ld	a5,-850(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0201e42:	779c                	ld	a5,40(a5)
ffffffffc0201e44:	8782                	jr	a5
{
ffffffffc0201e46:	1141                	addi	sp,sp,-16
ffffffffc0201e48:	e406                	sd	ra,8(sp)
ffffffffc0201e4a:	e022                	sd	s0,0(sp)
        intr_disable();
ffffffffc0201e4c:	b63fe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        ret = pmm_manager->nr_free_pages();
ffffffffc0201e50:	000c5797          	auipc	a5,0xc5
ffffffffc0201e54:	c987b783          	ld	a5,-872(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0201e58:	779c                	ld	a5,40(a5)
ffffffffc0201e5a:	9782                	jalr	a5
ffffffffc0201e5c:	842a                	mv	s0,a0
        intr_enable();
ffffffffc0201e5e:	b4bfe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
    }
    local_intr_restore(intr_flag);
    return ret;
}
ffffffffc0201e62:	60a2                	ld	ra,8(sp)
ffffffffc0201e64:	8522                	mv	a0,s0
ffffffffc0201e66:	6402                	ld	s0,0(sp)
ffffffffc0201e68:	0141                	addi	sp,sp,16
ffffffffc0201e6a:	8082                	ret

ffffffffc0201e6c <get_pte>:
//  la:     the linear address need to map
//  create: a logical value to decide if alloc a page for PT
// return vaule: the kernel virtual address of this pte
pte_t *get_pte(pde_t *pgdir, uintptr_t la, bool create)
{
    pde_t *pdep1 = &pgdir[PDX1(la)];
ffffffffc0201e6c:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0201e70:	1ff7f793          	andi	a5,a5,511
{
ffffffffc0201e74:	7139                	addi	sp,sp,-64
    pde_t *pdep1 = &pgdir[PDX1(la)];
ffffffffc0201e76:	078e                	slli	a5,a5,0x3
{
ffffffffc0201e78:	f426                	sd	s1,40(sp)
    pde_t *pdep1 = &pgdir[PDX1(la)];
ffffffffc0201e7a:	00f504b3          	add	s1,a0,a5
    if (!(*pdep1 & PTE_V))
ffffffffc0201e7e:	6094                	ld	a3,0(s1)
{
ffffffffc0201e80:	f04a                	sd	s2,32(sp)
ffffffffc0201e82:	ec4e                	sd	s3,24(sp)
ffffffffc0201e84:	e852                	sd	s4,16(sp)
ffffffffc0201e86:	fc06                	sd	ra,56(sp)
ffffffffc0201e88:	f822                	sd	s0,48(sp)
ffffffffc0201e8a:	e456                	sd	s5,8(sp)
ffffffffc0201e8c:	e05a                	sd	s6,0(sp)
    if (!(*pdep1 & PTE_V))
ffffffffc0201e8e:	0016f793          	andi	a5,a3,1
{
ffffffffc0201e92:	892e                	mv	s2,a1
ffffffffc0201e94:	8a32                	mv	s4,a2
ffffffffc0201e96:	000c5997          	auipc	s3,0xc5
ffffffffc0201e9a:	c4298993          	addi	s3,s3,-958 # ffffffffc02c6ad8 <npage>
    if (!(*pdep1 & PTE_V))
ffffffffc0201e9e:	efbd                	bnez	a5,ffffffffc0201f1c <get_pte+0xb0>
    {
        struct Page *page;
        if (!create || (page = alloc_page()) == NULL)
ffffffffc0201ea0:	14060c63          	beqz	a2,ffffffffc0201ff8 <get_pte+0x18c>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0201ea4:	100027f3          	csrr	a5,sstatus
ffffffffc0201ea8:	8b89                	andi	a5,a5,2
ffffffffc0201eaa:	14079963          	bnez	a5,ffffffffc0201ffc <get_pte+0x190>
        page = pmm_manager->alloc_pages(n);
ffffffffc0201eae:	000c5797          	auipc	a5,0xc5
ffffffffc0201eb2:	c3a7b783          	ld	a5,-966(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0201eb6:	6f9c                	ld	a5,24(a5)
ffffffffc0201eb8:	4505                	li	a0,1
ffffffffc0201eba:	9782                	jalr	a5
ffffffffc0201ebc:	842a                	mv	s0,a0
        if (!create || (page = alloc_page()) == NULL)
ffffffffc0201ebe:	12040d63          	beqz	s0,ffffffffc0201ff8 <get_pte+0x18c>
    return page - pages + nbase;
ffffffffc0201ec2:	000c5b17          	auipc	s6,0xc5
ffffffffc0201ec6:	c1eb0b13          	addi	s6,s6,-994 # ffffffffc02c6ae0 <pages>
ffffffffc0201eca:	000b3503          	ld	a0,0(s6)
ffffffffc0201ece:	00080ab7          	lui	s5,0x80
        {
            return NULL;
        }
        set_page_ref(page, 1);
        uintptr_t pa = page2pa(page);
        memset(KADDR(pa), 0, PGSIZE);
ffffffffc0201ed2:	000c5997          	auipc	s3,0xc5
ffffffffc0201ed6:	c0698993          	addi	s3,s3,-1018 # ffffffffc02c6ad8 <npage>
ffffffffc0201eda:	40a40533          	sub	a0,s0,a0
ffffffffc0201ede:	8519                	srai	a0,a0,0x6
ffffffffc0201ee0:	9556                	add	a0,a0,s5
ffffffffc0201ee2:	0009b703          	ld	a4,0(s3)
ffffffffc0201ee6:	00c51793          	slli	a5,a0,0xc
    page->ref = val;
ffffffffc0201eea:	4685                	li	a3,1
ffffffffc0201eec:	c014                	sw	a3,0(s0)
ffffffffc0201eee:	83b1                	srli	a5,a5,0xc
    return page2ppn(page) << PGSHIFT;
ffffffffc0201ef0:	0532                	slli	a0,a0,0xc
ffffffffc0201ef2:	16e7f763          	bgeu	a5,a4,ffffffffc0202060 <get_pte+0x1f4>
ffffffffc0201ef6:	000c5797          	auipc	a5,0xc5
ffffffffc0201efa:	bfa7b783          	ld	a5,-1030(a5) # ffffffffc02c6af0 <va_pa_offset>
ffffffffc0201efe:	6605                	lui	a2,0x1
ffffffffc0201f00:	4581                	li	a1,0
ffffffffc0201f02:	953e                	add	a0,a0,a5
ffffffffc0201f04:	54f030ef          	jal	ra,ffffffffc0205c52 <memset>
    return page - pages + nbase;
ffffffffc0201f08:	000b3683          	ld	a3,0(s6)
ffffffffc0201f0c:	40d406b3          	sub	a3,s0,a3
ffffffffc0201f10:	8699                	srai	a3,a3,0x6
ffffffffc0201f12:	96d6                	add	a3,a3,s5
}

// construct PTE from a page and permission bits
static inline pte_t pte_create(uintptr_t ppn, int type)
{
    return (ppn << PTE_PPN_SHIFT) | PTE_V | type;
ffffffffc0201f14:	06aa                	slli	a3,a3,0xa
ffffffffc0201f16:	0116e693          	ori	a3,a3,17
        *pdep1 = pte_create(page2ppn(page), PTE_U | PTE_V);
ffffffffc0201f1a:	e094                	sd	a3,0(s1)
    }

    pde_t *pdep0 = &((pde_t *)KADDR(PDE_ADDR(*pdep1)))[PDX0(la)];
ffffffffc0201f1c:	77fd                	lui	a5,0xfffff
ffffffffc0201f1e:	068a                	slli	a3,a3,0x2
ffffffffc0201f20:	0009b703          	ld	a4,0(s3)
ffffffffc0201f24:	8efd                	and	a3,a3,a5
ffffffffc0201f26:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201f2a:	10e7ff63          	bgeu	a5,a4,ffffffffc0202048 <get_pte+0x1dc>
ffffffffc0201f2e:	000c5a97          	auipc	s5,0xc5
ffffffffc0201f32:	bc2a8a93          	addi	s5,s5,-1086 # ffffffffc02c6af0 <va_pa_offset>
ffffffffc0201f36:	000ab403          	ld	s0,0(s5)
ffffffffc0201f3a:	01595793          	srli	a5,s2,0x15
ffffffffc0201f3e:	1ff7f793          	andi	a5,a5,511
ffffffffc0201f42:	96a2                	add	a3,a3,s0
ffffffffc0201f44:	00379413          	slli	s0,a5,0x3
ffffffffc0201f48:	9436                	add	s0,s0,a3
    if (!(*pdep0 & PTE_V))
ffffffffc0201f4a:	6014                	ld	a3,0(s0)
ffffffffc0201f4c:	0016f793          	andi	a5,a3,1
ffffffffc0201f50:	ebad                	bnez	a5,ffffffffc0201fc2 <get_pte+0x156>
    {
        struct Page *page;
        if (!create || (page = alloc_page()) == NULL)
ffffffffc0201f52:	0a0a0363          	beqz	s4,ffffffffc0201ff8 <get_pte+0x18c>
ffffffffc0201f56:	100027f3          	csrr	a5,sstatus
ffffffffc0201f5a:	8b89                	andi	a5,a5,2
ffffffffc0201f5c:	efcd                	bnez	a5,ffffffffc0202016 <get_pte+0x1aa>
        page = pmm_manager->alloc_pages(n);
ffffffffc0201f5e:	000c5797          	auipc	a5,0xc5
ffffffffc0201f62:	b8a7b783          	ld	a5,-1142(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0201f66:	6f9c                	ld	a5,24(a5)
ffffffffc0201f68:	4505                	li	a0,1
ffffffffc0201f6a:	9782                	jalr	a5
ffffffffc0201f6c:	84aa                	mv	s1,a0
        if (!create || (page = alloc_page()) == NULL)
ffffffffc0201f6e:	c4c9                	beqz	s1,ffffffffc0201ff8 <get_pte+0x18c>
    return page - pages + nbase;
ffffffffc0201f70:	000c5b17          	auipc	s6,0xc5
ffffffffc0201f74:	b70b0b13          	addi	s6,s6,-1168 # ffffffffc02c6ae0 <pages>
ffffffffc0201f78:	000b3503          	ld	a0,0(s6)
ffffffffc0201f7c:	00080a37          	lui	s4,0x80
        {
            return NULL;
        }
        set_page_ref(page, 1);
        uintptr_t pa = page2pa(page);
        memset(KADDR(pa), 0, PGSIZE);
ffffffffc0201f80:	0009b703          	ld	a4,0(s3)
ffffffffc0201f84:	40a48533          	sub	a0,s1,a0
ffffffffc0201f88:	8519                	srai	a0,a0,0x6
ffffffffc0201f8a:	9552                	add	a0,a0,s4
ffffffffc0201f8c:	00c51793          	slli	a5,a0,0xc
    page->ref = val;
ffffffffc0201f90:	4685                	li	a3,1
ffffffffc0201f92:	c094                	sw	a3,0(s1)
ffffffffc0201f94:	83b1                	srli	a5,a5,0xc
    return page2ppn(page) << PGSHIFT;
ffffffffc0201f96:	0532                	slli	a0,a0,0xc
ffffffffc0201f98:	0ee7f163          	bgeu	a5,a4,ffffffffc020207a <get_pte+0x20e>
ffffffffc0201f9c:	000ab783          	ld	a5,0(s5)
ffffffffc0201fa0:	6605                	lui	a2,0x1
ffffffffc0201fa2:	4581                	li	a1,0
ffffffffc0201fa4:	953e                	add	a0,a0,a5
ffffffffc0201fa6:	4ad030ef          	jal	ra,ffffffffc0205c52 <memset>
    return page - pages + nbase;
ffffffffc0201faa:	000b3683          	ld	a3,0(s6)
ffffffffc0201fae:	40d486b3          	sub	a3,s1,a3
ffffffffc0201fb2:	8699                	srai	a3,a3,0x6
ffffffffc0201fb4:	96d2                	add	a3,a3,s4
    return (ppn << PTE_PPN_SHIFT) | PTE_V | type;
ffffffffc0201fb6:	06aa                	slli	a3,a3,0xa
ffffffffc0201fb8:	0116e693          	ori	a3,a3,17
        *pdep0 = pte_create(page2ppn(page), PTE_U | PTE_V);
ffffffffc0201fbc:	e014                	sd	a3,0(s0)
    }
    return &((pte_t *)KADDR(PDE_ADDR(*pdep0)))[PTX(la)];
ffffffffc0201fbe:	0009b703          	ld	a4,0(s3)
ffffffffc0201fc2:	068a                	slli	a3,a3,0x2
ffffffffc0201fc4:	757d                	lui	a0,0xfffff
ffffffffc0201fc6:	8ee9                	and	a3,a3,a0
ffffffffc0201fc8:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201fcc:	06e7f263          	bgeu	a5,a4,ffffffffc0202030 <get_pte+0x1c4>
ffffffffc0201fd0:	000ab503          	ld	a0,0(s5)
ffffffffc0201fd4:	00c95913          	srli	s2,s2,0xc
ffffffffc0201fd8:	1ff97913          	andi	s2,s2,511
ffffffffc0201fdc:	96aa                	add	a3,a3,a0
ffffffffc0201fde:	00391513          	slli	a0,s2,0x3
ffffffffc0201fe2:	9536                	add	a0,a0,a3
}
ffffffffc0201fe4:	70e2                	ld	ra,56(sp)
ffffffffc0201fe6:	7442                	ld	s0,48(sp)
ffffffffc0201fe8:	74a2                	ld	s1,40(sp)
ffffffffc0201fea:	7902                	ld	s2,32(sp)
ffffffffc0201fec:	69e2                	ld	s3,24(sp)
ffffffffc0201fee:	6a42                	ld	s4,16(sp)
ffffffffc0201ff0:	6aa2                	ld	s5,8(sp)
ffffffffc0201ff2:	6b02                	ld	s6,0(sp)
ffffffffc0201ff4:	6121                	addi	sp,sp,64
ffffffffc0201ff6:	8082                	ret
            return NULL;
ffffffffc0201ff8:	4501                	li	a0,0
ffffffffc0201ffa:	b7ed                	j	ffffffffc0201fe4 <get_pte+0x178>
        intr_disable();
ffffffffc0201ffc:	9b3fe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc0202000:	000c5797          	auipc	a5,0xc5
ffffffffc0202004:	ae87b783          	ld	a5,-1304(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0202008:	6f9c                	ld	a5,24(a5)
ffffffffc020200a:	4505                	li	a0,1
ffffffffc020200c:	9782                	jalr	a5
ffffffffc020200e:	842a                	mv	s0,a0
        intr_enable();
ffffffffc0202010:	999fe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202014:	b56d                	j	ffffffffc0201ebe <get_pte+0x52>
        intr_disable();
ffffffffc0202016:	999fe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc020201a:	000c5797          	auipc	a5,0xc5
ffffffffc020201e:	ace7b783          	ld	a5,-1330(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0202022:	6f9c                	ld	a5,24(a5)
ffffffffc0202024:	4505                	li	a0,1
ffffffffc0202026:	9782                	jalr	a5
ffffffffc0202028:	84aa                	mv	s1,a0
        intr_enable();
ffffffffc020202a:	97ffe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc020202e:	b781                	j	ffffffffc0201f6e <get_pte+0x102>
    return &((pte_t *)KADDR(PDE_ADDR(*pdep0)))[PTX(la)];
ffffffffc0202030:	00005617          	auipc	a2,0x5
ffffffffc0202034:	ac860613          	addi	a2,a2,-1336 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc0202038:	0fa00593          	li	a1,250
ffffffffc020203c:	00005517          	auipc	a0,0x5
ffffffffc0202040:	bd450513          	addi	a0,a0,-1068 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202044:	c4efe0ef          	jal	ra,ffffffffc0200492 <__panic>
    pde_t *pdep0 = &((pde_t *)KADDR(PDE_ADDR(*pdep1)))[PDX0(la)];
ffffffffc0202048:	00005617          	auipc	a2,0x5
ffffffffc020204c:	ab060613          	addi	a2,a2,-1360 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc0202050:	0ed00593          	li	a1,237
ffffffffc0202054:	00005517          	auipc	a0,0x5
ffffffffc0202058:	bbc50513          	addi	a0,a0,-1092 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020205c:	c36fe0ef          	jal	ra,ffffffffc0200492 <__panic>
        memset(KADDR(pa), 0, PGSIZE);
ffffffffc0202060:	86aa                	mv	a3,a0
ffffffffc0202062:	00005617          	auipc	a2,0x5
ffffffffc0202066:	a9660613          	addi	a2,a2,-1386 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc020206a:	0e900593          	li	a1,233
ffffffffc020206e:	00005517          	auipc	a0,0x5
ffffffffc0202072:	ba250513          	addi	a0,a0,-1118 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202076:	c1cfe0ef          	jal	ra,ffffffffc0200492 <__panic>
        memset(KADDR(pa), 0, PGSIZE);
ffffffffc020207a:	86aa                	mv	a3,a0
ffffffffc020207c:	00005617          	auipc	a2,0x5
ffffffffc0202080:	a7c60613          	addi	a2,a2,-1412 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc0202084:	0f700593          	li	a1,247
ffffffffc0202088:	00005517          	auipc	a0,0x5
ffffffffc020208c:	b8850513          	addi	a0,a0,-1144 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202090:	c02fe0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0202094 <get_page>:

// get_page - get related Page struct for linear address la using PDT pgdir
struct Page *get_page(pde_t *pgdir, uintptr_t la, pte_t **ptep_store)
{
ffffffffc0202094:	1141                	addi	sp,sp,-16
ffffffffc0202096:	e022                	sd	s0,0(sp)
ffffffffc0202098:	8432                	mv	s0,a2
    pte_t *ptep = get_pte(pgdir, la, 0);
ffffffffc020209a:	4601                	li	a2,0
{
ffffffffc020209c:	e406                	sd	ra,8(sp)
    pte_t *ptep = get_pte(pgdir, la, 0);
ffffffffc020209e:	dcfff0ef          	jal	ra,ffffffffc0201e6c <get_pte>
    if (ptep_store != NULL)
ffffffffc02020a2:	c011                	beqz	s0,ffffffffc02020a6 <get_page+0x12>
    {
        *ptep_store = ptep;
ffffffffc02020a4:	e008                	sd	a0,0(s0)
    }
    if (ptep != NULL && *ptep & PTE_V)
ffffffffc02020a6:	c511                	beqz	a0,ffffffffc02020b2 <get_page+0x1e>
ffffffffc02020a8:	611c                	ld	a5,0(a0)
    {
        return pte2page(*ptep);
    }
    return NULL;
ffffffffc02020aa:	4501                	li	a0,0
    if (ptep != NULL && *ptep & PTE_V)
ffffffffc02020ac:	0017f713          	andi	a4,a5,1
ffffffffc02020b0:	e709                	bnez	a4,ffffffffc02020ba <get_page+0x26>
}
ffffffffc02020b2:	60a2                	ld	ra,8(sp)
ffffffffc02020b4:	6402                	ld	s0,0(sp)
ffffffffc02020b6:	0141                	addi	sp,sp,16
ffffffffc02020b8:	8082                	ret
    return pa2page(PTE_ADDR(pte));
ffffffffc02020ba:	078a                	slli	a5,a5,0x2
ffffffffc02020bc:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc02020be:	000c5717          	auipc	a4,0xc5
ffffffffc02020c2:	a1a73703          	ld	a4,-1510(a4) # ffffffffc02c6ad8 <npage>
ffffffffc02020c6:	00e7ff63          	bgeu	a5,a4,ffffffffc02020e4 <get_page+0x50>
ffffffffc02020ca:	60a2                	ld	ra,8(sp)
ffffffffc02020cc:	6402                	ld	s0,0(sp)
    return &pages[PPN(pa) - nbase];
ffffffffc02020ce:	fff80537          	lui	a0,0xfff80
ffffffffc02020d2:	97aa                	add	a5,a5,a0
ffffffffc02020d4:	079a                	slli	a5,a5,0x6
ffffffffc02020d6:	000c5517          	auipc	a0,0xc5
ffffffffc02020da:	a0a53503          	ld	a0,-1526(a0) # ffffffffc02c6ae0 <pages>
ffffffffc02020de:	953e                	add	a0,a0,a5
ffffffffc02020e0:	0141                	addi	sp,sp,16
ffffffffc02020e2:	8082                	ret
ffffffffc02020e4:	c99ff0ef          	jal	ra,ffffffffc0201d7c <pa2page.part.0>

ffffffffc02020e8 <unmap_range>:
        tlb_invalidate(pgdir, la); //(6) flush tlb
    }
}

void unmap_range(pde_t *pgdir, uintptr_t start, uintptr_t end)
{
ffffffffc02020e8:	7159                	addi	sp,sp,-112
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc02020ea:	00c5e7b3          	or	a5,a1,a2
{
ffffffffc02020ee:	f486                	sd	ra,104(sp)
ffffffffc02020f0:	f0a2                	sd	s0,96(sp)
ffffffffc02020f2:	eca6                	sd	s1,88(sp)
ffffffffc02020f4:	e8ca                	sd	s2,80(sp)
ffffffffc02020f6:	e4ce                	sd	s3,72(sp)
ffffffffc02020f8:	e0d2                	sd	s4,64(sp)
ffffffffc02020fa:	fc56                	sd	s5,56(sp)
ffffffffc02020fc:	f85a                	sd	s6,48(sp)
ffffffffc02020fe:	f45e                	sd	s7,40(sp)
ffffffffc0202100:	f062                	sd	s8,32(sp)
ffffffffc0202102:	ec66                	sd	s9,24(sp)
ffffffffc0202104:	e86a                	sd	s10,16(sp)
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc0202106:	17d2                	slli	a5,a5,0x34
ffffffffc0202108:	e3ed                	bnez	a5,ffffffffc02021ea <unmap_range+0x102>
    assert(USER_ACCESS(start, end));
ffffffffc020210a:	002007b7          	lui	a5,0x200
ffffffffc020210e:	842e                	mv	s0,a1
ffffffffc0202110:	0ef5ed63          	bltu	a1,a5,ffffffffc020220a <unmap_range+0x122>
ffffffffc0202114:	8932                	mv	s2,a2
ffffffffc0202116:	0ec5fa63          	bgeu	a1,a2,ffffffffc020220a <unmap_range+0x122>
ffffffffc020211a:	4785                	li	a5,1
ffffffffc020211c:	07fe                	slli	a5,a5,0x1f
ffffffffc020211e:	0ec7e663          	bltu	a5,a2,ffffffffc020220a <unmap_range+0x122>
ffffffffc0202122:	89aa                	mv	s3,a0
        }
        if (*ptep != 0)
        {
            page_remove_pte(pgdir, start, ptep);
        }
        start += PGSIZE;
ffffffffc0202124:	6a05                	lui	s4,0x1
    if (PPN(pa) >= npage)
ffffffffc0202126:	000c5c97          	auipc	s9,0xc5
ffffffffc020212a:	9b2c8c93          	addi	s9,s9,-1614 # ffffffffc02c6ad8 <npage>
    return &pages[PPN(pa) - nbase];
ffffffffc020212e:	000c5c17          	auipc	s8,0xc5
ffffffffc0202132:	9b2c0c13          	addi	s8,s8,-1614 # ffffffffc02c6ae0 <pages>
ffffffffc0202136:	fff80bb7          	lui	s7,0xfff80
        pmm_manager->free_pages(base, n);
ffffffffc020213a:	000c5d17          	auipc	s10,0xc5
ffffffffc020213e:	9aed0d13          	addi	s10,s10,-1618 # ffffffffc02c6ae8 <pmm_manager>
            start = ROUNDDOWN(start + PTSIZE, PTSIZE);
ffffffffc0202142:	00200b37          	lui	s6,0x200
ffffffffc0202146:	ffe00ab7          	lui	s5,0xffe00
        pte_t *ptep = get_pte(pgdir, start, 0);
ffffffffc020214a:	4601                	li	a2,0
ffffffffc020214c:	85a2                	mv	a1,s0
ffffffffc020214e:	854e                	mv	a0,s3
ffffffffc0202150:	d1dff0ef          	jal	ra,ffffffffc0201e6c <get_pte>
ffffffffc0202154:	84aa                	mv	s1,a0
        if (ptep == NULL)
ffffffffc0202156:	cd29                	beqz	a0,ffffffffc02021b0 <unmap_range+0xc8>
        if (*ptep != 0)
ffffffffc0202158:	611c                	ld	a5,0(a0)
ffffffffc020215a:	e395                	bnez	a5,ffffffffc020217e <unmap_range+0x96>
        start += PGSIZE;
ffffffffc020215c:	9452                	add	s0,s0,s4
    } while (start != 0 && start < end);
ffffffffc020215e:	ff2466e3          	bltu	s0,s2,ffffffffc020214a <unmap_range+0x62>
}
ffffffffc0202162:	70a6                	ld	ra,104(sp)
ffffffffc0202164:	7406                	ld	s0,96(sp)
ffffffffc0202166:	64e6                	ld	s1,88(sp)
ffffffffc0202168:	6946                	ld	s2,80(sp)
ffffffffc020216a:	69a6                	ld	s3,72(sp)
ffffffffc020216c:	6a06                	ld	s4,64(sp)
ffffffffc020216e:	7ae2                	ld	s5,56(sp)
ffffffffc0202170:	7b42                	ld	s6,48(sp)
ffffffffc0202172:	7ba2                	ld	s7,40(sp)
ffffffffc0202174:	7c02                	ld	s8,32(sp)
ffffffffc0202176:	6ce2                	ld	s9,24(sp)
ffffffffc0202178:	6d42                	ld	s10,16(sp)
ffffffffc020217a:	6165                	addi	sp,sp,112
ffffffffc020217c:	8082                	ret
    if (*ptep & PTE_V)
ffffffffc020217e:	0017f713          	andi	a4,a5,1
ffffffffc0202182:	df69                	beqz	a4,ffffffffc020215c <unmap_range+0x74>
    if (PPN(pa) >= npage)
ffffffffc0202184:	000cb703          	ld	a4,0(s9)
    return pa2page(PTE_ADDR(pte));
ffffffffc0202188:	078a                	slli	a5,a5,0x2
ffffffffc020218a:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc020218c:	08e7ff63          	bgeu	a5,a4,ffffffffc020222a <unmap_range+0x142>
    return &pages[PPN(pa) - nbase];
ffffffffc0202190:	000c3503          	ld	a0,0(s8)
ffffffffc0202194:	97de                	add	a5,a5,s7
ffffffffc0202196:	079a                	slli	a5,a5,0x6
ffffffffc0202198:	953e                	add	a0,a0,a5
    page->ref -= 1;
ffffffffc020219a:	411c                	lw	a5,0(a0)
ffffffffc020219c:	fff7871b          	addiw	a4,a5,-1
ffffffffc02021a0:	c118                	sw	a4,0(a0)
        if (page_ref(page) ==
ffffffffc02021a2:	cf11                	beqz	a4,ffffffffc02021be <unmap_range+0xd6>
        *ptep = 0;                 //(5) clear second page table entry
ffffffffc02021a4:	0004b023          	sd	zero,0(s1)

// invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
void tlb_invalidate(pde_t *pgdir, uintptr_t la)
{
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc02021a8:	12040073          	sfence.vma	s0
        start += PGSIZE;
ffffffffc02021ac:	9452                	add	s0,s0,s4
    } while (start != 0 && start < end);
ffffffffc02021ae:	bf45                	j	ffffffffc020215e <unmap_range+0x76>
            start = ROUNDDOWN(start + PTSIZE, PTSIZE);
ffffffffc02021b0:	945a                	add	s0,s0,s6
ffffffffc02021b2:	01547433          	and	s0,s0,s5
    } while (start != 0 && start < end);
ffffffffc02021b6:	d455                	beqz	s0,ffffffffc0202162 <unmap_range+0x7a>
ffffffffc02021b8:	f92469e3          	bltu	s0,s2,ffffffffc020214a <unmap_range+0x62>
ffffffffc02021bc:	b75d                	j	ffffffffc0202162 <unmap_range+0x7a>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02021be:	100027f3          	csrr	a5,sstatus
ffffffffc02021c2:	8b89                	andi	a5,a5,2
ffffffffc02021c4:	e799                	bnez	a5,ffffffffc02021d2 <unmap_range+0xea>
        pmm_manager->free_pages(base, n);
ffffffffc02021c6:	000d3783          	ld	a5,0(s10)
ffffffffc02021ca:	4585                	li	a1,1
ffffffffc02021cc:	739c                	ld	a5,32(a5)
ffffffffc02021ce:	9782                	jalr	a5
    if (flag)
ffffffffc02021d0:	bfd1                	j	ffffffffc02021a4 <unmap_range+0xbc>
ffffffffc02021d2:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc02021d4:	fdafe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc02021d8:	000d3783          	ld	a5,0(s10)
ffffffffc02021dc:	6522                	ld	a0,8(sp)
ffffffffc02021de:	4585                	li	a1,1
ffffffffc02021e0:	739c                	ld	a5,32(a5)
ffffffffc02021e2:	9782                	jalr	a5
        intr_enable();
ffffffffc02021e4:	fc4fe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc02021e8:	bf75                	j	ffffffffc02021a4 <unmap_range+0xbc>
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc02021ea:	00005697          	auipc	a3,0x5
ffffffffc02021ee:	a3668693          	addi	a3,a3,-1482 # ffffffffc0206c20 <default_pmm_manager+0x160>
ffffffffc02021f2:	00004617          	auipc	a2,0x4
ffffffffc02021f6:	51e60613          	addi	a2,a2,1310 # ffffffffc0206710 <commands+0x828>
ffffffffc02021fa:	12200593          	li	a1,290
ffffffffc02021fe:	00005517          	auipc	a0,0x5
ffffffffc0202202:	a1250513          	addi	a0,a0,-1518 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202206:	a8cfe0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(USER_ACCESS(start, end));
ffffffffc020220a:	00005697          	auipc	a3,0x5
ffffffffc020220e:	a4668693          	addi	a3,a3,-1466 # ffffffffc0206c50 <default_pmm_manager+0x190>
ffffffffc0202212:	00004617          	auipc	a2,0x4
ffffffffc0202216:	4fe60613          	addi	a2,a2,1278 # ffffffffc0206710 <commands+0x828>
ffffffffc020221a:	12300593          	li	a1,291
ffffffffc020221e:	00005517          	auipc	a0,0x5
ffffffffc0202222:	9f250513          	addi	a0,a0,-1550 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202226:	a6cfe0ef          	jal	ra,ffffffffc0200492 <__panic>
ffffffffc020222a:	b53ff0ef          	jal	ra,ffffffffc0201d7c <pa2page.part.0>

ffffffffc020222e <exit_range>:
{
ffffffffc020222e:	7119                	addi	sp,sp,-128
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc0202230:	00c5e7b3          	or	a5,a1,a2
{
ffffffffc0202234:	fc86                	sd	ra,120(sp)
ffffffffc0202236:	f8a2                	sd	s0,112(sp)
ffffffffc0202238:	f4a6                	sd	s1,104(sp)
ffffffffc020223a:	f0ca                	sd	s2,96(sp)
ffffffffc020223c:	ecce                	sd	s3,88(sp)
ffffffffc020223e:	e8d2                	sd	s4,80(sp)
ffffffffc0202240:	e4d6                	sd	s5,72(sp)
ffffffffc0202242:	e0da                	sd	s6,64(sp)
ffffffffc0202244:	fc5e                	sd	s7,56(sp)
ffffffffc0202246:	f862                	sd	s8,48(sp)
ffffffffc0202248:	f466                	sd	s9,40(sp)
ffffffffc020224a:	f06a                	sd	s10,32(sp)
ffffffffc020224c:	ec6e                	sd	s11,24(sp)
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc020224e:	17d2                	slli	a5,a5,0x34
ffffffffc0202250:	20079a63          	bnez	a5,ffffffffc0202464 <exit_range+0x236>
    assert(USER_ACCESS(start, end));
ffffffffc0202254:	002007b7          	lui	a5,0x200
ffffffffc0202258:	24f5e463          	bltu	a1,a5,ffffffffc02024a0 <exit_range+0x272>
ffffffffc020225c:	8ab2                	mv	s5,a2
ffffffffc020225e:	24c5f163          	bgeu	a1,a2,ffffffffc02024a0 <exit_range+0x272>
ffffffffc0202262:	4785                	li	a5,1
ffffffffc0202264:	07fe                	slli	a5,a5,0x1f
ffffffffc0202266:	22c7ed63          	bltu	a5,a2,ffffffffc02024a0 <exit_range+0x272>
    d1start = ROUNDDOWN(start, PDSIZE);
ffffffffc020226a:	c00009b7          	lui	s3,0xc0000
ffffffffc020226e:	0135f9b3          	and	s3,a1,s3
    d0start = ROUNDDOWN(start, PTSIZE);
ffffffffc0202272:	ffe00937          	lui	s2,0xffe00
ffffffffc0202276:	400007b7          	lui	a5,0x40000
    return KADDR(page2pa(page));
ffffffffc020227a:	5cfd                	li	s9,-1
ffffffffc020227c:	8c2a                	mv	s8,a0
ffffffffc020227e:	0125f933          	and	s2,a1,s2
ffffffffc0202282:	99be                	add	s3,s3,a5
    if (PPN(pa) >= npage)
ffffffffc0202284:	000c5d17          	auipc	s10,0xc5
ffffffffc0202288:	854d0d13          	addi	s10,s10,-1964 # ffffffffc02c6ad8 <npage>
    return KADDR(page2pa(page));
ffffffffc020228c:	00ccdc93          	srli	s9,s9,0xc
    return &pages[PPN(pa) - nbase];
ffffffffc0202290:	000c5717          	auipc	a4,0xc5
ffffffffc0202294:	85070713          	addi	a4,a4,-1968 # ffffffffc02c6ae0 <pages>
        pmm_manager->free_pages(base, n);
ffffffffc0202298:	000c5d97          	auipc	s11,0xc5
ffffffffc020229c:	850d8d93          	addi	s11,s11,-1968 # ffffffffc02c6ae8 <pmm_manager>
        pde1 = pgdir[PDX1(d1start)];
ffffffffc02022a0:	c0000437          	lui	s0,0xc0000
ffffffffc02022a4:	944e                	add	s0,s0,s3
ffffffffc02022a6:	8079                	srli	s0,s0,0x1e
ffffffffc02022a8:	1ff47413          	andi	s0,s0,511
ffffffffc02022ac:	040e                	slli	s0,s0,0x3
ffffffffc02022ae:	9462                	add	s0,s0,s8
ffffffffc02022b0:	00043a03          	ld	s4,0(s0) # ffffffffc0000000 <_binary_obj___user_matrix_out_size+0xffffffffbfff3900>
        if (pde1 & PTE_V)
ffffffffc02022b4:	001a7793          	andi	a5,s4,1
ffffffffc02022b8:	eb99                	bnez	a5,ffffffffc02022ce <exit_range+0xa0>
    } while (d1start != 0 && d1start < end);
ffffffffc02022ba:	12098463          	beqz	s3,ffffffffc02023e2 <exit_range+0x1b4>
ffffffffc02022be:	400007b7          	lui	a5,0x40000
ffffffffc02022c2:	97ce                	add	a5,a5,s3
ffffffffc02022c4:	894e                	mv	s2,s3
ffffffffc02022c6:	1159fe63          	bgeu	s3,s5,ffffffffc02023e2 <exit_range+0x1b4>
ffffffffc02022ca:	89be                	mv	s3,a5
ffffffffc02022cc:	bfd1                	j	ffffffffc02022a0 <exit_range+0x72>
    if (PPN(pa) >= npage)
ffffffffc02022ce:	000d3783          	ld	a5,0(s10)
    return pa2page(PDE_ADDR(pde));
ffffffffc02022d2:	0a0a                	slli	s4,s4,0x2
ffffffffc02022d4:	00ca5a13          	srli	s4,s4,0xc
    if (PPN(pa) >= npage)
ffffffffc02022d8:	1cfa7263          	bgeu	s4,a5,ffffffffc020249c <exit_range+0x26e>
    return &pages[PPN(pa) - nbase];
ffffffffc02022dc:	fff80637          	lui	a2,0xfff80
ffffffffc02022e0:	9652                	add	a2,a2,s4
    return page - pages + nbase;
ffffffffc02022e2:	000806b7          	lui	a3,0x80
ffffffffc02022e6:	96b2                	add	a3,a3,a2
    return KADDR(page2pa(page));
ffffffffc02022e8:	0196f5b3          	and	a1,a3,s9
    return &pages[PPN(pa) - nbase];
ffffffffc02022ec:	061a                	slli	a2,a2,0x6
    return page2ppn(page) << PGSHIFT;
ffffffffc02022ee:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc02022f0:	18f5fa63          	bgeu	a1,a5,ffffffffc0202484 <exit_range+0x256>
ffffffffc02022f4:	000c4817          	auipc	a6,0xc4
ffffffffc02022f8:	7fc80813          	addi	a6,a6,2044 # ffffffffc02c6af0 <va_pa_offset>
ffffffffc02022fc:	00083b03          	ld	s6,0(a6)
            free_pd0 = 1;
ffffffffc0202300:	4b85                	li	s7,1
    return &pages[PPN(pa) - nbase];
ffffffffc0202302:	fff80e37          	lui	t3,0xfff80
    return KADDR(page2pa(page));
ffffffffc0202306:	9b36                	add	s6,s6,a3
    return page - pages + nbase;
ffffffffc0202308:	00080337          	lui	t1,0x80
ffffffffc020230c:	6885                	lui	a7,0x1
ffffffffc020230e:	a819                	j	ffffffffc0202324 <exit_range+0xf6>
                    free_pd0 = 0;
ffffffffc0202310:	4b81                	li	s7,0
                d0start += PTSIZE;
ffffffffc0202312:	002007b7          	lui	a5,0x200
ffffffffc0202316:	993e                	add	s2,s2,a5
            } while (d0start != 0 && d0start < d1start + PDSIZE && d0start < end);
ffffffffc0202318:	08090c63          	beqz	s2,ffffffffc02023b0 <exit_range+0x182>
ffffffffc020231c:	09397a63          	bgeu	s2,s3,ffffffffc02023b0 <exit_range+0x182>
ffffffffc0202320:	0f597063          	bgeu	s2,s5,ffffffffc0202400 <exit_range+0x1d2>
                pde0 = pd0[PDX0(d0start)];
ffffffffc0202324:	01595493          	srli	s1,s2,0x15
ffffffffc0202328:	1ff4f493          	andi	s1,s1,511
ffffffffc020232c:	048e                	slli	s1,s1,0x3
ffffffffc020232e:	94da                	add	s1,s1,s6
ffffffffc0202330:	609c                	ld	a5,0(s1)
                if (pde0 & PTE_V)
ffffffffc0202332:	0017f693          	andi	a3,a5,1
ffffffffc0202336:	dee9                	beqz	a3,ffffffffc0202310 <exit_range+0xe2>
    if (PPN(pa) >= npage)
ffffffffc0202338:	000d3583          	ld	a1,0(s10)
    return pa2page(PDE_ADDR(pde));
ffffffffc020233c:	078a                	slli	a5,a5,0x2
ffffffffc020233e:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0202340:	14b7fe63          	bgeu	a5,a1,ffffffffc020249c <exit_range+0x26e>
    return &pages[PPN(pa) - nbase];
ffffffffc0202344:	97f2                	add	a5,a5,t3
    return page - pages + nbase;
ffffffffc0202346:	006786b3          	add	a3,a5,t1
    return KADDR(page2pa(page));
ffffffffc020234a:	0196feb3          	and	t4,a3,s9
    return &pages[PPN(pa) - nbase];
ffffffffc020234e:	00679513          	slli	a0,a5,0x6
    return page2ppn(page) << PGSHIFT;
ffffffffc0202352:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0202354:	12bef863          	bgeu	t4,a1,ffffffffc0202484 <exit_range+0x256>
ffffffffc0202358:	00083783          	ld	a5,0(a6)
ffffffffc020235c:	96be                	add	a3,a3,a5
                    for (int i = 0; i < NPTEENTRY; i++)
ffffffffc020235e:	011685b3          	add	a1,a3,a7
                        if (pt[i] & PTE_V)
ffffffffc0202362:	629c                	ld	a5,0(a3)
ffffffffc0202364:	8b85                	andi	a5,a5,1
ffffffffc0202366:	f7d5                	bnez	a5,ffffffffc0202312 <exit_range+0xe4>
                    for (int i = 0; i < NPTEENTRY; i++)
ffffffffc0202368:	06a1                	addi	a3,a3,8
ffffffffc020236a:	fed59ce3          	bne	a1,a3,ffffffffc0202362 <exit_range+0x134>
    return &pages[PPN(pa) - nbase];
ffffffffc020236e:	631c                	ld	a5,0(a4)
ffffffffc0202370:	953e                	add	a0,a0,a5
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0202372:	100027f3          	csrr	a5,sstatus
ffffffffc0202376:	8b89                	andi	a5,a5,2
ffffffffc0202378:	e7d9                	bnez	a5,ffffffffc0202406 <exit_range+0x1d8>
        pmm_manager->free_pages(base, n);
ffffffffc020237a:	000db783          	ld	a5,0(s11)
ffffffffc020237e:	4585                	li	a1,1
ffffffffc0202380:	e032                	sd	a2,0(sp)
ffffffffc0202382:	739c                	ld	a5,32(a5)
ffffffffc0202384:	9782                	jalr	a5
    if (flag)
ffffffffc0202386:	6602                	ld	a2,0(sp)
ffffffffc0202388:	000c4817          	auipc	a6,0xc4
ffffffffc020238c:	76880813          	addi	a6,a6,1896 # ffffffffc02c6af0 <va_pa_offset>
ffffffffc0202390:	fff80e37          	lui	t3,0xfff80
ffffffffc0202394:	00080337          	lui	t1,0x80
ffffffffc0202398:	6885                	lui	a7,0x1
ffffffffc020239a:	000c4717          	auipc	a4,0xc4
ffffffffc020239e:	74670713          	addi	a4,a4,1862 # ffffffffc02c6ae0 <pages>
                        pd0[PDX0(d0start)] = 0;
ffffffffc02023a2:	0004b023          	sd	zero,0(s1)
                d0start += PTSIZE;
ffffffffc02023a6:	002007b7          	lui	a5,0x200
ffffffffc02023aa:	993e                	add	s2,s2,a5
            } while (d0start != 0 && d0start < d1start + PDSIZE && d0start < end);
ffffffffc02023ac:	f60918e3          	bnez	s2,ffffffffc020231c <exit_range+0xee>
            if (free_pd0)
ffffffffc02023b0:	f00b85e3          	beqz	s7,ffffffffc02022ba <exit_range+0x8c>
    if (PPN(pa) >= npage)
ffffffffc02023b4:	000d3783          	ld	a5,0(s10)
ffffffffc02023b8:	0efa7263          	bgeu	s4,a5,ffffffffc020249c <exit_range+0x26e>
    return &pages[PPN(pa) - nbase];
ffffffffc02023bc:	6308                	ld	a0,0(a4)
ffffffffc02023be:	9532                	add	a0,a0,a2
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02023c0:	100027f3          	csrr	a5,sstatus
ffffffffc02023c4:	8b89                	andi	a5,a5,2
ffffffffc02023c6:	efad                	bnez	a5,ffffffffc0202440 <exit_range+0x212>
        pmm_manager->free_pages(base, n);
ffffffffc02023c8:	000db783          	ld	a5,0(s11)
ffffffffc02023cc:	4585                	li	a1,1
ffffffffc02023ce:	739c                	ld	a5,32(a5)
ffffffffc02023d0:	9782                	jalr	a5
ffffffffc02023d2:	000c4717          	auipc	a4,0xc4
ffffffffc02023d6:	70e70713          	addi	a4,a4,1806 # ffffffffc02c6ae0 <pages>
                pgdir[PDX1(d1start)] = 0;
ffffffffc02023da:	00043023          	sd	zero,0(s0)
    } while (d1start != 0 && d1start < end);
ffffffffc02023de:	ee0990e3          	bnez	s3,ffffffffc02022be <exit_range+0x90>
}
ffffffffc02023e2:	70e6                	ld	ra,120(sp)
ffffffffc02023e4:	7446                	ld	s0,112(sp)
ffffffffc02023e6:	74a6                	ld	s1,104(sp)
ffffffffc02023e8:	7906                	ld	s2,96(sp)
ffffffffc02023ea:	69e6                	ld	s3,88(sp)
ffffffffc02023ec:	6a46                	ld	s4,80(sp)
ffffffffc02023ee:	6aa6                	ld	s5,72(sp)
ffffffffc02023f0:	6b06                	ld	s6,64(sp)
ffffffffc02023f2:	7be2                	ld	s7,56(sp)
ffffffffc02023f4:	7c42                	ld	s8,48(sp)
ffffffffc02023f6:	7ca2                	ld	s9,40(sp)
ffffffffc02023f8:	7d02                	ld	s10,32(sp)
ffffffffc02023fa:	6de2                	ld	s11,24(sp)
ffffffffc02023fc:	6109                	addi	sp,sp,128
ffffffffc02023fe:	8082                	ret
            if (free_pd0)
ffffffffc0202400:	ea0b8fe3          	beqz	s7,ffffffffc02022be <exit_range+0x90>
ffffffffc0202404:	bf45                	j	ffffffffc02023b4 <exit_range+0x186>
ffffffffc0202406:	e032                	sd	a2,0(sp)
        intr_disable();
ffffffffc0202408:	e42a                	sd	a0,8(sp)
ffffffffc020240a:	da4fe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc020240e:	000db783          	ld	a5,0(s11)
ffffffffc0202412:	6522                	ld	a0,8(sp)
ffffffffc0202414:	4585                	li	a1,1
ffffffffc0202416:	739c                	ld	a5,32(a5)
ffffffffc0202418:	9782                	jalr	a5
        intr_enable();
ffffffffc020241a:	d8efe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc020241e:	6602                	ld	a2,0(sp)
ffffffffc0202420:	000c4717          	auipc	a4,0xc4
ffffffffc0202424:	6c070713          	addi	a4,a4,1728 # ffffffffc02c6ae0 <pages>
ffffffffc0202428:	6885                	lui	a7,0x1
ffffffffc020242a:	00080337          	lui	t1,0x80
ffffffffc020242e:	fff80e37          	lui	t3,0xfff80
ffffffffc0202432:	000c4817          	auipc	a6,0xc4
ffffffffc0202436:	6be80813          	addi	a6,a6,1726 # ffffffffc02c6af0 <va_pa_offset>
                        pd0[PDX0(d0start)] = 0;
ffffffffc020243a:	0004b023          	sd	zero,0(s1)
ffffffffc020243e:	b7a5                	j	ffffffffc02023a6 <exit_range+0x178>
ffffffffc0202440:	e02a                	sd	a0,0(sp)
        intr_disable();
ffffffffc0202442:	d6cfe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc0202446:	000db783          	ld	a5,0(s11)
ffffffffc020244a:	6502                	ld	a0,0(sp)
ffffffffc020244c:	4585                	li	a1,1
ffffffffc020244e:	739c                	ld	a5,32(a5)
ffffffffc0202450:	9782                	jalr	a5
        intr_enable();
ffffffffc0202452:	d56fe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202456:	000c4717          	auipc	a4,0xc4
ffffffffc020245a:	68a70713          	addi	a4,a4,1674 # ffffffffc02c6ae0 <pages>
                pgdir[PDX1(d1start)] = 0;
ffffffffc020245e:	00043023          	sd	zero,0(s0)
ffffffffc0202462:	bfb5                	j	ffffffffc02023de <exit_range+0x1b0>
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc0202464:	00004697          	auipc	a3,0x4
ffffffffc0202468:	7bc68693          	addi	a3,a3,1980 # ffffffffc0206c20 <default_pmm_manager+0x160>
ffffffffc020246c:	00004617          	auipc	a2,0x4
ffffffffc0202470:	2a460613          	addi	a2,a2,676 # ffffffffc0206710 <commands+0x828>
ffffffffc0202474:	13700593          	li	a1,311
ffffffffc0202478:	00004517          	auipc	a0,0x4
ffffffffc020247c:	79850513          	addi	a0,a0,1944 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202480:	812fe0ef          	jal	ra,ffffffffc0200492 <__panic>
    return KADDR(page2pa(page));
ffffffffc0202484:	00004617          	auipc	a2,0x4
ffffffffc0202488:	67460613          	addi	a2,a2,1652 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc020248c:	07100593          	li	a1,113
ffffffffc0202490:	00004517          	auipc	a0,0x4
ffffffffc0202494:	69050513          	addi	a0,a0,1680 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc0202498:	ffbfd0ef          	jal	ra,ffffffffc0200492 <__panic>
ffffffffc020249c:	8e1ff0ef          	jal	ra,ffffffffc0201d7c <pa2page.part.0>
    assert(USER_ACCESS(start, end));
ffffffffc02024a0:	00004697          	auipc	a3,0x4
ffffffffc02024a4:	7b068693          	addi	a3,a3,1968 # ffffffffc0206c50 <default_pmm_manager+0x190>
ffffffffc02024a8:	00004617          	auipc	a2,0x4
ffffffffc02024ac:	26860613          	addi	a2,a2,616 # ffffffffc0206710 <commands+0x828>
ffffffffc02024b0:	13800593          	li	a1,312
ffffffffc02024b4:	00004517          	auipc	a0,0x4
ffffffffc02024b8:	75c50513          	addi	a0,a0,1884 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc02024bc:	fd7fd0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02024c0 <page_remove>:
{
ffffffffc02024c0:	7179                	addi	sp,sp,-48
    pte_t *ptep = get_pte(pgdir, la, 0);
ffffffffc02024c2:	4601                	li	a2,0
{
ffffffffc02024c4:	ec26                	sd	s1,24(sp)
ffffffffc02024c6:	f406                	sd	ra,40(sp)
ffffffffc02024c8:	f022                	sd	s0,32(sp)
ffffffffc02024ca:	84ae                	mv	s1,a1
    pte_t *ptep = get_pte(pgdir, la, 0);
ffffffffc02024cc:	9a1ff0ef          	jal	ra,ffffffffc0201e6c <get_pte>
    if (ptep != NULL)
ffffffffc02024d0:	c511                	beqz	a0,ffffffffc02024dc <page_remove+0x1c>
    if (*ptep & PTE_V)
ffffffffc02024d2:	611c                	ld	a5,0(a0)
ffffffffc02024d4:	842a                	mv	s0,a0
ffffffffc02024d6:	0017f713          	andi	a4,a5,1
ffffffffc02024da:	e711                	bnez	a4,ffffffffc02024e6 <page_remove+0x26>
}
ffffffffc02024dc:	70a2                	ld	ra,40(sp)
ffffffffc02024de:	7402                	ld	s0,32(sp)
ffffffffc02024e0:	64e2                	ld	s1,24(sp)
ffffffffc02024e2:	6145                	addi	sp,sp,48
ffffffffc02024e4:	8082                	ret
    return pa2page(PTE_ADDR(pte));
ffffffffc02024e6:	078a                	slli	a5,a5,0x2
ffffffffc02024e8:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc02024ea:	000c4717          	auipc	a4,0xc4
ffffffffc02024ee:	5ee73703          	ld	a4,1518(a4) # ffffffffc02c6ad8 <npage>
ffffffffc02024f2:	06e7f363          	bgeu	a5,a4,ffffffffc0202558 <page_remove+0x98>
    return &pages[PPN(pa) - nbase];
ffffffffc02024f6:	fff80537          	lui	a0,0xfff80
ffffffffc02024fa:	97aa                	add	a5,a5,a0
ffffffffc02024fc:	079a                	slli	a5,a5,0x6
ffffffffc02024fe:	000c4517          	auipc	a0,0xc4
ffffffffc0202502:	5e253503          	ld	a0,1506(a0) # ffffffffc02c6ae0 <pages>
ffffffffc0202506:	953e                	add	a0,a0,a5
    page->ref -= 1;
ffffffffc0202508:	411c                	lw	a5,0(a0)
ffffffffc020250a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020250e:	c118                	sw	a4,0(a0)
        if (page_ref(page) ==
ffffffffc0202510:	cb11                	beqz	a4,ffffffffc0202524 <page_remove+0x64>
        *ptep = 0;                 //(5) clear second page table entry
ffffffffc0202512:	00043023          	sd	zero,0(s0)
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc0202516:	12048073          	sfence.vma	s1
}
ffffffffc020251a:	70a2                	ld	ra,40(sp)
ffffffffc020251c:	7402                	ld	s0,32(sp)
ffffffffc020251e:	64e2                	ld	s1,24(sp)
ffffffffc0202520:	6145                	addi	sp,sp,48
ffffffffc0202522:	8082                	ret
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0202524:	100027f3          	csrr	a5,sstatus
ffffffffc0202528:	8b89                	andi	a5,a5,2
ffffffffc020252a:	eb89                	bnez	a5,ffffffffc020253c <page_remove+0x7c>
        pmm_manager->free_pages(base, n);
ffffffffc020252c:	000c4797          	auipc	a5,0xc4
ffffffffc0202530:	5bc7b783          	ld	a5,1468(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0202534:	739c                	ld	a5,32(a5)
ffffffffc0202536:	4585                	li	a1,1
ffffffffc0202538:	9782                	jalr	a5
    if (flag)
ffffffffc020253a:	bfe1                	j	ffffffffc0202512 <page_remove+0x52>
        intr_disable();
ffffffffc020253c:	e42a                	sd	a0,8(sp)
ffffffffc020253e:	c70fe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc0202542:	000c4797          	auipc	a5,0xc4
ffffffffc0202546:	5a67b783          	ld	a5,1446(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc020254a:	739c                	ld	a5,32(a5)
ffffffffc020254c:	6522                	ld	a0,8(sp)
ffffffffc020254e:	4585                	li	a1,1
ffffffffc0202550:	9782                	jalr	a5
        intr_enable();
ffffffffc0202552:	c56fe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202556:	bf75                	j	ffffffffc0202512 <page_remove+0x52>
ffffffffc0202558:	825ff0ef          	jal	ra,ffffffffc0201d7c <pa2page.part.0>

ffffffffc020255c <page_insert>:
{
ffffffffc020255c:	7139                	addi	sp,sp,-64
ffffffffc020255e:	e852                	sd	s4,16(sp)
ffffffffc0202560:	8a32                	mv	s4,a2
ffffffffc0202562:	f822                	sd	s0,48(sp)
    pte_t *ptep = get_pte(pgdir, la, 1);
ffffffffc0202564:	4605                	li	a2,1
{
ffffffffc0202566:	842e                	mv	s0,a1
    pte_t *ptep = get_pte(pgdir, la, 1);
ffffffffc0202568:	85d2                	mv	a1,s4
{
ffffffffc020256a:	f426                	sd	s1,40(sp)
ffffffffc020256c:	fc06                	sd	ra,56(sp)
ffffffffc020256e:	f04a                	sd	s2,32(sp)
ffffffffc0202570:	ec4e                	sd	s3,24(sp)
ffffffffc0202572:	e456                	sd	s5,8(sp)
ffffffffc0202574:	84b6                	mv	s1,a3
    pte_t *ptep = get_pte(pgdir, la, 1);
ffffffffc0202576:	8f7ff0ef          	jal	ra,ffffffffc0201e6c <get_pte>
    if (ptep == NULL)
ffffffffc020257a:	c961                	beqz	a0,ffffffffc020264a <page_insert+0xee>
    page->ref += 1;
ffffffffc020257c:	4014                	lw	a3,0(s0)
    if (*ptep & PTE_V)
ffffffffc020257e:	611c                	ld	a5,0(a0)
ffffffffc0202580:	89aa                	mv	s3,a0
ffffffffc0202582:	0016871b          	addiw	a4,a3,1
ffffffffc0202586:	c018                	sw	a4,0(s0)
ffffffffc0202588:	0017f713          	andi	a4,a5,1
ffffffffc020258c:	ef05                	bnez	a4,ffffffffc02025c4 <page_insert+0x68>
    return page - pages + nbase;
ffffffffc020258e:	000c4717          	auipc	a4,0xc4
ffffffffc0202592:	55273703          	ld	a4,1362(a4) # ffffffffc02c6ae0 <pages>
ffffffffc0202596:	8c19                	sub	s0,s0,a4
ffffffffc0202598:	000807b7          	lui	a5,0x80
ffffffffc020259c:	8419                	srai	s0,s0,0x6
ffffffffc020259e:	943e                	add	s0,s0,a5
    return (ppn << PTE_PPN_SHIFT) | PTE_V | type;
ffffffffc02025a0:	042a                	slli	s0,s0,0xa
ffffffffc02025a2:	8cc1                	or	s1,s1,s0
ffffffffc02025a4:	0014e493          	ori	s1,s1,1
    *ptep = pte_create(page2ppn(page), PTE_V | perm);
ffffffffc02025a8:	0099b023          	sd	s1,0(s3) # ffffffffc0000000 <_binary_obj___user_matrix_out_size+0xffffffffbfff3900>
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc02025ac:	120a0073          	sfence.vma	s4
    return 0;
ffffffffc02025b0:	4501                	li	a0,0
}
ffffffffc02025b2:	70e2                	ld	ra,56(sp)
ffffffffc02025b4:	7442                	ld	s0,48(sp)
ffffffffc02025b6:	74a2                	ld	s1,40(sp)
ffffffffc02025b8:	7902                	ld	s2,32(sp)
ffffffffc02025ba:	69e2                	ld	s3,24(sp)
ffffffffc02025bc:	6a42                	ld	s4,16(sp)
ffffffffc02025be:	6aa2                	ld	s5,8(sp)
ffffffffc02025c0:	6121                	addi	sp,sp,64
ffffffffc02025c2:	8082                	ret
    return pa2page(PTE_ADDR(pte));
ffffffffc02025c4:	078a                	slli	a5,a5,0x2
ffffffffc02025c6:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc02025c8:	000c4717          	auipc	a4,0xc4
ffffffffc02025cc:	51073703          	ld	a4,1296(a4) # ffffffffc02c6ad8 <npage>
ffffffffc02025d0:	06e7ff63          	bgeu	a5,a4,ffffffffc020264e <page_insert+0xf2>
    return &pages[PPN(pa) - nbase];
ffffffffc02025d4:	000c4a97          	auipc	s5,0xc4
ffffffffc02025d8:	50ca8a93          	addi	s5,s5,1292 # ffffffffc02c6ae0 <pages>
ffffffffc02025dc:	000ab703          	ld	a4,0(s5)
ffffffffc02025e0:	fff80937          	lui	s2,0xfff80
ffffffffc02025e4:	993e                	add	s2,s2,a5
ffffffffc02025e6:	091a                	slli	s2,s2,0x6
ffffffffc02025e8:	993a                	add	s2,s2,a4
        if (p == page)
ffffffffc02025ea:	01240c63          	beq	s0,s2,ffffffffc0202602 <page_insert+0xa6>
    page->ref -= 1;
ffffffffc02025ee:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fcb94d8>
ffffffffc02025f2:	fff7869b          	addiw	a3,a5,-1
ffffffffc02025f6:	00d92023          	sw	a3,0(s2)
        if (page_ref(page) ==
ffffffffc02025fa:	c691                	beqz	a3,ffffffffc0202606 <page_insert+0xaa>
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc02025fc:	120a0073          	sfence.vma	s4
}
ffffffffc0202600:	bf59                	j	ffffffffc0202596 <page_insert+0x3a>
ffffffffc0202602:	c014                	sw	a3,0(s0)
    return page->ref;
ffffffffc0202604:	bf49                	j	ffffffffc0202596 <page_insert+0x3a>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0202606:	100027f3          	csrr	a5,sstatus
ffffffffc020260a:	8b89                	andi	a5,a5,2
ffffffffc020260c:	ef91                	bnez	a5,ffffffffc0202628 <page_insert+0xcc>
        pmm_manager->free_pages(base, n);
ffffffffc020260e:	000c4797          	auipc	a5,0xc4
ffffffffc0202612:	4da7b783          	ld	a5,1242(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0202616:	739c                	ld	a5,32(a5)
ffffffffc0202618:	4585                	li	a1,1
ffffffffc020261a:	854a                	mv	a0,s2
ffffffffc020261c:	9782                	jalr	a5
    return page - pages + nbase;
ffffffffc020261e:	000ab703          	ld	a4,0(s5)
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc0202622:	120a0073          	sfence.vma	s4
ffffffffc0202626:	bf85                	j	ffffffffc0202596 <page_insert+0x3a>
        intr_disable();
ffffffffc0202628:	b86fe0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc020262c:	000c4797          	auipc	a5,0xc4
ffffffffc0202630:	4bc7b783          	ld	a5,1212(a5) # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0202634:	739c                	ld	a5,32(a5)
ffffffffc0202636:	4585                	li	a1,1
ffffffffc0202638:	854a                	mv	a0,s2
ffffffffc020263a:	9782                	jalr	a5
        intr_enable();
ffffffffc020263c:	b6cfe0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202640:	000ab703          	ld	a4,0(s5)
    asm volatile("sfence.vma %0" : : "r"(la));
ffffffffc0202644:	120a0073          	sfence.vma	s4
ffffffffc0202648:	b7b9                	j	ffffffffc0202596 <page_insert+0x3a>
        return -E_NO_MEM;
ffffffffc020264a:	5571                	li	a0,-4
ffffffffc020264c:	b79d                	j	ffffffffc02025b2 <page_insert+0x56>
ffffffffc020264e:	f2eff0ef          	jal	ra,ffffffffc0201d7c <pa2page.part.0>

ffffffffc0202652 <pmm_init>:
    pmm_manager = &default_pmm_manager;
ffffffffc0202652:	00004797          	auipc	a5,0x4
ffffffffc0202656:	46e78793          	addi	a5,a5,1134 # ffffffffc0206ac0 <default_pmm_manager>
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc020265a:	638c                	ld	a1,0(a5)
{
ffffffffc020265c:	7159                	addi	sp,sp,-112
ffffffffc020265e:	f85a                	sd	s6,48(sp)
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc0202660:	00004517          	auipc	a0,0x4
ffffffffc0202664:	60850513          	addi	a0,a0,1544 # ffffffffc0206c68 <default_pmm_manager+0x1a8>
    pmm_manager = &default_pmm_manager;
ffffffffc0202668:	000c4b17          	auipc	s6,0xc4
ffffffffc020266c:	480b0b13          	addi	s6,s6,1152 # ffffffffc02c6ae8 <pmm_manager>
{
ffffffffc0202670:	f486                	sd	ra,104(sp)
ffffffffc0202672:	e8ca                	sd	s2,80(sp)
ffffffffc0202674:	e4ce                	sd	s3,72(sp)
ffffffffc0202676:	f0a2                	sd	s0,96(sp)
ffffffffc0202678:	eca6                	sd	s1,88(sp)
ffffffffc020267a:	e0d2                	sd	s4,64(sp)
ffffffffc020267c:	fc56                	sd	s5,56(sp)
ffffffffc020267e:	f45e                	sd	s7,40(sp)
ffffffffc0202680:	f062                	sd	s8,32(sp)
ffffffffc0202682:	ec66                	sd	s9,24(sp)
    pmm_manager = &default_pmm_manager;
ffffffffc0202684:	00fb3023          	sd	a5,0(s6)
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc0202688:	b11fd0ef          	jal	ra,ffffffffc0200198 <cprintf>
    pmm_manager->init();
ffffffffc020268c:	000b3783          	ld	a5,0(s6)
    va_pa_offset = PHYSICAL_MEMORY_OFFSET;
ffffffffc0202690:	000c4997          	auipc	s3,0xc4
ffffffffc0202694:	46098993          	addi	s3,s3,1120 # ffffffffc02c6af0 <va_pa_offset>
    pmm_manager->init();
ffffffffc0202698:	679c                	ld	a5,8(a5)
ffffffffc020269a:	9782                	jalr	a5
    va_pa_offset = PHYSICAL_MEMORY_OFFSET;
ffffffffc020269c:	57f5                	li	a5,-3
ffffffffc020269e:	07fa                	slli	a5,a5,0x1e
ffffffffc02026a0:	00f9b023          	sd	a5,0(s3)
    uint64_t mem_begin = get_memory_base();
ffffffffc02026a4:	af0fe0ef          	jal	ra,ffffffffc0200994 <get_memory_base>
ffffffffc02026a8:	892a                	mv	s2,a0
    uint64_t mem_size = get_memory_size();
ffffffffc02026aa:	af4fe0ef          	jal	ra,ffffffffc020099e <get_memory_size>
    if (mem_size == 0)
ffffffffc02026ae:	200505e3          	beqz	a0,ffffffffc02030b8 <pmm_init+0xa66>
    uint64_t mem_end = mem_begin + mem_size;
ffffffffc02026b2:	84aa                	mv	s1,a0
    cprintf("physcial memory map:\n");
ffffffffc02026b4:	00004517          	auipc	a0,0x4
ffffffffc02026b8:	5ec50513          	addi	a0,a0,1516 # ffffffffc0206ca0 <default_pmm_manager+0x1e0>
ffffffffc02026bc:	addfd0ef          	jal	ra,ffffffffc0200198 <cprintf>
    uint64_t mem_end = mem_begin + mem_size;
ffffffffc02026c0:	00990433          	add	s0,s2,s1
    cprintf("  memory: 0x%08lx, [0x%08lx, 0x%08lx].\n", mem_size, mem_begin,
ffffffffc02026c4:	fff40693          	addi	a3,s0,-1
ffffffffc02026c8:	864a                	mv	a2,s2
ffffffffc02026ca:	85a6                	mv	a1,s1
ffffffffc02026cc:	00004517          	auipc	a0,0x4
ffffffffc02026d0:	5ec50513          	addi	a0,a0,1516 # ffffffffc0206cb8 <default_pmm_manager+0x1f8>
ffffffffc02026d4:	ac5fd0ef          	jal	ra,ffffffffc0200198 <cprintf>
    npage = maxpa / PGSIZE;
ffffffffc02026d8:	c8000737          	lui	a4,0xc8000
ffffffffc02026dc:	87a2                	mv	a5,s0
ffffffffc02026de:	54876163          	bltu	a4,s0,ffffffffc0202c20 <pmm_init+0x5ce>
ffffffffc02026e2:	757d                	lui	a0,0xfffff
ffffffffc02026e4:	000c5617          	auipc	a2,0xc5
ffffffffc02026e8:	44360613          	addi	a2,a2,1091 # ffffffffc02c7b27 <end+0xfff>
ffffffffc02026ec:	8e69                	and	a2,a2,a0
ffffffffc02026ee:	000c4497          	auipc	s1,0xc4
ffffffffc02026f2:	3ea48493          	addi	s1,s1,1002 # ffffffffc02c6ad8 <npage>
ffffffffc02026f6:	00c7d513          	srli	a0,a5,0xc
    pages = (struct Page *)ROUNDUP((void *)end, PGSIZE);
ffffffffc02026fa:	000c4b97          	auipc	s7,0xc4
ffffffffc02026fe:	3e6b8b93          	addi	s7,s7,998 # ffffffffc02c6ae0 <pages>
    npage = maxpa / PGSIZE;
ffffffffc0202702:	e088                	sd	a0,0(s1)
    pages = (struct Page *)ROUNDUP((void *)end, PGSIZE);
ffffffffc0202704:	00cbb023          	sd	a2,0(s7)
    for (size_t i = 0; i < npage - nbase; i++)
ffffffffc0202708:	000807b7          	lui	a5,0x80
    pages = (struct Page *)ROUNDUP((void *)end, PGSIZE);
ffffffffc020270c:	86b2                	mv	a3,a2
    for (size_t i = 0; i < npage - nbase; i++)
ffffffffc020270e:	02f50863          	beq	a0,a5,ffffffffc020273e <pmm_init+0xec>
ffffffffc0202712:	4781                	li	a5,0
ffffffffc0202714:	4585                	li	a1,1
ffffffffc0202716:	fff806b7          	lui	a3,0xfff80
        SetPageReserved(pages + i);
ffffffffc020271a:	00679513          	slli	a0,a5,0x6
ffffffffc020271e:	9532                	add	a0,a0,a2
ffffffffc0202720:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd384e0>
ffffffffc0202724:	40b7302f          	amoor.d	zero,a1,(a4)
    for (size_t i = 0; i < npage - nbase; i++)
ffffffffc0202728:	6088                	ld	a0,0(s1)
ffffffffc020272a:	0785                	addi	a5,a5,1
        SetPageReserved(pages + i);
ffffffffc020272c:	000bb603          	ld	a2,0(s7)
    for (size_t i = 0; i < npage - nbase; i++)
ffffffffc0202730:	00d50733          	add	a4,a0,a3
ffffffffc0202734:	fee7e3e3          	bltu	a5,a4,ffffffffc020271a <pmm_init+0xc8>
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc0202738:	071a                	slli	a4,a4,0x6
ffffffffc020273a:	00e606b3          	add	a3,a2,a4
ffffffffc020273e:	c02007b7          	lui	a5,0xc0200
ffffffffc0202742:	2ef6ece3          	bltu	a3,a5,ffffffffc020323a <pmm_init+0xbe8>
ffffffffc0202746:	0009b583          	ld	a1,0(s3)
    mem_end = ROUNDDOWN(mem_end, PGSIZE);
ffffffffc020274a:	77fd                	lui	a5,0xfffff
ffffffffc020274c:	8c7d                	and	s0,s0,a5
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc020274e:	8e8d                	sub	a3,a3,a1
    if (freemem < mem_end)
ffffffffc0202750:	5086eb63          	bltu	a3,s0,ffffffffc0202c66 <pmm_init+0x614>
    cprintf("vapaofset is %llu\n", va_pa_offset);
ffffffffc0202754:	00004517          	auipc	a0,0x4
ffffffffc0202758:	58c50513          	addi	a0,a0,1420 # ffffffffc0206ce0 <default_pmm_manager+0x220>
ffffffffc020275c:	a3dfd0ef          	jal	ra,ffffffffc0200198 <cprintf>
    return page;
}

static void check_alloc_page(void)
{
    pmm_manager->check();
ffffffffc0202760:	000b3783          	ld	a5,0(s6)
    boot_pgdir_va = (pte_t *)boot_page_table_sv39;
ffffffffc0202764:	000c4917          	auipc	s2,0xc4
ffffffffc0202768:	36c90913          	addi	s2,s2,876 # ffffffffc02c6ad0 <boot_pgdir_va>
    pmm_manager->check();
ffffffffc020276c:	7b9c                	ld	a5,48(a5)
ffffffffc020276e:	9782                	jalr	a5
    cprintf("check_alloc_page() succeeded!\n");
ffffffffc0202770:	00004517          	auipc	a0,0x4
ffffffffc0202774:	58850513          	addi	a0,a0,1416 # ffffffffc0206cf8 <default_pmm_manager+0x238>
ffffffffc0202778:	a21fd0ef          	jal	ra,ffffffffc0200198 <cprintf>
    boot_pgdir_va = (pte_t *)boot_page_table_sv39;
ffffffffc020277c:	00009697          	auipc	a3,0x9
ffffffffc0202780:	88468693          	addi	a3,a3,-1916 # ffffffffc020b000 <boot_page_table_sv39>
ffffffffc0202784:	00d93023          	sd	a3,0(s2)
    boot_pgdir_pa = PADDR(boot_pgdir_va);
ffffffffc0202788:	c02007b7          	lui	a5,0xc0200
ffffffffc020278c:	28f6ebe3          	bltu	a3,a5,ffffffffc0203222 <pmm_init+0xbd0>
ffffffffc0202790:	0009b783          	ld	a5,0(s3)
ffffffffc0202794:	8e9d                	sub	a3,a3,a5
ffffffffc0202796:	000c4797          	auipc	a5,0xc4
ffffffffc020279a:	32d7b923          	sd	a3,818(a5) # ffffffffc02c6ac8 <boot_pgdir_pa>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc020279e:	100027f3          	csrr	a5,sstatus
ffffffffc02027a2:	8b89                	andi	a5,a5,2
ffffffffc02027a4:	4a079763          	bnez	a5,ffffffffc0202c52 <pmm_init+0x600>
        ret = pmm_manager->nr_free_pages();
ffffffffc02027a8:	000b3783          	ld	a5,0(s6)
ffffffffc02027ac:	779c                	ld	a5,40(a5)
ffffffffc02027ae:	9782                	jalr	a5
ffffffffc02027b0:	842a                	mv	s0,a0
    // so npage is always larger than KMEMSIZE / PGSIZE
    size_t nr_free_store;

    nr_free_store = nr_free_pages();

    assert(npage <= KERNTOP / PGSIZE);
ffffffffc02027b2:	6098                	ld	a4,0(s1)
ffffffffc02027b4:	c80007b7          	lui	a5,0xc8000
ffffffffc02027b8:	83b1                	srli	a5,a5,0xc
ffffffffc02027ba:	66e7e363          	bltu	a5,a4,ffffffffc0202e20 <pmm_init+0x7ce>
    assert(boot_pgdir_va != NULL && (uint32_t)PGOFF(boot_pgdir_va) == 0);
ffffffffc02027be:	00093503          	ld	a0,0(s2)
ffffffffc02027c2:	62050f63          	beqz	a0,ffffffffc0202e00 <pmm_init+0x7ae>
ffffffffc02027c6:	03451793          	slli	a5,a0,0x34
ffffffffc02027ca:	62079b63          	bnez	a5,ffffffffc0202e00 <pmm_init+0x7ae>
    assert(get_page(boot_pgdir_va, 0x0, NULL) == NULL);
ffffffffc02027ce:	4601                	li	a2,0
ffffffffc02027d0:	4581                	li	a1,0
ffffffffc02027d2:	8c3ff0ef          	jal	ra,ffffffffc0202094 <get_page>
ffffffffc02027d6:	60051563          	bnez	a0,ffffffffc0202de0 <pmm_init+0x78e>
ffffffffc02027da:	100027f3          	csrr	a5,sstatus
ffffffffc02027de:	8b89                	andi	a5,a5,2
ffffffffc02027e0:	44079e63          	bnez	a5,ffffffffc0202c3c <pmm_init+0x5ea>
        page = pmm_manager->alloc_pages(n);
ffffffffc02027e4:	000b3783          	ld	a5,0(s6)
ffffffffc02027e8:	4505                	li	a0,1
ffffffffc02027ea:	6f9c                	ld	a5,24(a5)
ffffffffc02027ec:	9782                	jalr	a5
ffffffffc02027ee:	8a2a                	mv	s4,a0

    struct Page *p1, *p2;
    p1 = alloc_page();
    assert(page_insert(boot_pgdir_va, p1, 0x0, 0) == 0);
ffffffffc02027f0:	00093503          	ld	a0,0(s2)
ffffffffc02027f4:	4681                	li	a3,0
ffffffffc02027f6:	4601                	li	a2,0
ffffffffc02027f8:	85d2                	mv	a1,s4
ffffffffc02027fa:	d63ff0ef          	jal	ra,ffffffffc020255c <page_insert>
ffffffffc02027fe:	26051ae3          	bnez	a0,ffffffffc0203272 <pmm_init+0xc20>

    pte_t *ptep;
    assert((ptep = get_pte(boot_pgdir_va, 0x0, 0)) != NULL);
ffffffffc0202802:	00093503          	ld	a0,0(s2)
ffffffffc0202806:	4601                	li	a2,0
ffffffffc0202808:	4581                	li	a1,0
ffffffffc020280a:	e62ff0ef          	jal	ra,ffffffffc0201e6c <get_pte>
ffffffffc020280e:	240502e3          	beqz	a0,ffffffffc0203252 <pmm_init+0xc00>
    assert(pte2page(*ptep) == p1);
ffffffffc0202812:	611c                	ld	a5,0(a0)
    if (!(pte & PTE_V))
ffffffffc0202814:	0017f713          	andi	a4,a5,1
ffffffffc0202818:	5a070263          	beqz	a4,ffffffffc0202dbc <pmm_init+0x76a>
    if (PPN(pa) >= npage)
ffffffffc020281c:	6098                	ld	a4,0(s1)
    return pa2page(PTE_ADDR(pte));
ffffffffc020281e:	078a                	slli	a5,a5,0x2
ffffffffc0202820:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0202822:	58e7fb63          	bgeu	a5,a4,ffffffffc0202db8 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc0202826:	000bb683          	ld	a3,0(s7)
ffffffffc020282a:	fff80637          	lui	a2,0xfff80
ffffffffc020282e:	97b2                	add	a5,a5,a2
ffffffffc0202830:	079a                	slli	a5,a5,0x6
ffffffffc0202832:	97b6                	add	a5,a5,a3
ffffffffc0202834:	14fa17e3          	bne	s4,a5,ffffffffc0203182 <pmm_init+0xb30>
    assert(page_ref(p1) == 1);
ffffffffc0202838:	000a2683          	lw	a3,0(s4) # 1000 <_binary_obj___user_faultread_out_size-0x8f30>
ffffffffc020283c:	4785                	li	a5,1
ffffffffc020283e:	12f692e3          	bne	a3,a5,ffffffffc0203162 <pmm_init+0xb10>

    ptep = (pte_t *)KADDR(PDE_ADDR(boot_pgdir_va[0]));
ffffffffc0202842:	00093503          	ld	a0,0(s2)
ffffffffc0202846:	77fd                	lui	a5,0xfffff
ffffffffc0202848:	6114                	ld	a3,0(a0)
ffffffffc020284a:	068a                	slli	a3,a3,0x2
ffffffffc020284c:	8efd                	and	a3,a3,a5
ffffffffc020284e:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202852:	0ee67ce3          	bgeu	a2,a4,ffffffffc020314a <pmm_init+0xaf8>
ffffffffc0202856:	0009bc03          	ld	s8,0(s3)
    ptep = (pte_t *)KADDR(PDE_ADDR(ptep[0])) + 1;
ffffffffc020285a:	96e2                	add	a3,a3,s8
ffffffffc020285c:	0006ba83          	ld	s5,0(a3)
ffffffffc0202860:	0a8a                	slli	s5,s5,0x2
ffffffffc0202862:	00fafab3          	and	s5,s5,a5
ffffffffc0202866:	00cad793          	srli	a5,s5,0xc
ffffffffc020286a:	0ce7f3e3          	bgeu	a5,a4,ffffffffc0203130 <pmm_init+0xade>
    assert(get_pte(boot_pgdir_va, PGSIZE, 0) == ptep);
ffffffffc020286e:	4601                	li	a2,0
ffffffffc0202870:	6585                	lui	a1,0x1
    ptep = (pte_t *)KADDR(PDE_ADDR(ptep[0])) + 1;
ffffffffc0202872:	9ae2                	add	s5,s5,s8
    assert(get_pte(boot_pgdir_va, PGSIZE, 0) == ptep);
ffffffffc0202874:	df8ff0ef          	jal	ra,ffffffffc0201e6c <get_pte>
    ptep = (pte_t *)KADDR(PDE_ADDR(ptep[0])) + 1;
ffffffffc0202878:	0aa1                	addi	s5,s5,8
    assert(get_pte(boot_pgdir_va, PGSIZE, 0) == ptep);
ffffffffc020287a:	55551363          	bne	a0,s5,ffffffffc0202dc0 <pmm_init+0x76e>
ffffffffc020287e:	100027f3          	csrr	a5,sstatus
ffffffffc0202882:	8b89                	andi	a5,a5,2
ffffffffc0202884:	3a079163          	bnez	a5,ffffffffc0202c26 <pmm_init+0x5d4>
        page = pmm_manager->alloc_pages(n);
ffffffffc0202888:	000b3783          	ld	a5,0(s6)
ffffffffc020288c:	4505                	li	a0,1
ffffffffc020288e:	6f9c                	ld	a5,24(a5)
ffffffffc0202890:	9782                	jalr	a5
ffffffffc0202892:	8c2a                	mv	s8,a0

    p2 = alloc_page();
    assert(page_insert(boot_pgdir_va, p2, PGSIZE, PTE_U | PTE_W) == 0);
ffffffffc0202894:	00093503          	ld	a0,0(s2)
ffffffffc0202898:	46d1                	li	a3,20
ffffffffc020289a:	6605                	lui	a2,0x1
ffffffffc020289c:	85e2                	mv	a1,s8
ffffffffc020289e:	cbfff0ef          	jal	ra,ffffffffc020255c <page_insert>
ffffffffc02028a2:	060517e3          	bnez	a0,ffffffffc0203110 <pmm_init+0xabe>
    assert((ptep = get_pte(boot_pgdir_va, PGSIZE, 0)) != NULL);
ffffffffc02028a6:	00093503          	ld	a0,0(s2)
ffffffffc02028aa:	4601                	li	a2,0
ffffffffc02028ac:	6585                	lui	a1,0x1
ffffffffc02028ae:	dbeff0ef          	jal	ra,ffffffffc0201e6c <get_pte>
ffffffffc02028b2:	02050fe3          	beqz	a0,ffffffffc02030f0 <pmm_init+0xa9e>
    assert(*ptep & PTE_U);
ffffffffc02028b6:	611c                	ld	a5,0(a0)
ffffffffc02028b8:	0107f713          	andi	a4,a5,16
ffffffffc02028bc:	7c070e63          	beqz	a4,ffffffffc0203098 <pmm_init+0xa46>
    assert(*ptep & PTE_W);
ffffffffc02028c0:	8b91                	andi	a5,a5,4
ffffffffc02028c2:	7a078b63          	beqz	a5,ffffffffc0203078 <pmm_init+0xa26>
    assert(boot_pgdir_va[0] & PTE_U);
ffffffffc02028c6:	00093503          	ld	a0,0(s2)
ffffffffc02028ca:	611c                	ld	a5,0(a0)
ffffffffc02028cc:	8bc1                	andi	a5,a5,16
ffffffffc02028ce:	78078563          	beqz	a5,ffffffffc0203058 <pmm_init+0xa06>
    assert(page_ref(p2) == 1);
ffffffffc02028d2:	000c2703          	lw	a4,0(s8)
ffffffffc02028d6:	4785                	li	a5,1
ffffffffc02028d8:	76f71063          	bne	a4,a5,ffffffffc0203038 <pmm_init+0x9e6>

    assert(page_insert(boot_pgdir_va, p1, PGSIZE, 0) == 0);
ffffffffc02028dc:	4681                	li	a3,0
ffffffffc02028de:	6605                	lui	a2,0x1
ffffffffc02028e0:	85d2                	mv	a1,s4
ffffffffc02028e2:	c7bff0ef          	jal	ra,ffffffffc020255c <page_insert>
ffffffffc02028e6:	72051963          	bnez	a0,ffffffffc0203018 <pmm_init+0x9c6>
    assert(page_ref(p1) == 2);
ffffffffc02028ea:	000a2703          	lw	a4,0(s4)
ffffffffc02028ee:	4789                	li	a5,2
ffffffffc02028f0:	70f71463          	bne	a4,a5,ffffffffc0202ff8 <pmm_init+0x9a6>
    assert(page_ref(p2) == 0);
ffffffffc02028f4:	000c2783          	lw	a5,0(s8)
ffffffffc02028f8:	6e079063          	bnez	a5,ffffffffc0202fd8 <pmm_init+0x986>
    assert((ptep = get_pte(boot_pgdir_va, PGSIZE, 0)) != NULL);
ffffffffc02028fc:	00093503          	ld	a0,0(s2)
ffffffffc0202900:	4601                	li	a2,0
ffffffffc0202902:	6585                	lui	a1,0x1
ffffffffc0202904:	d68ff0ef          	jal	ra,ffffffffc0201e6c <get_pte>
ffffffffc0202908:	6a050863          	beqz	a0,ffffffffc0202fb8 <pmm_init+0x966>
    assert(pte2page(*ptep) == p1);
ffffffffc020290c:	6118                	ld	a4,0(a0)
    if (!(pte & PTE_V))
ffffffffc020290e:	00177793          	andi	a5,a4,1
ffffffffc0202912:	4a078563          	beqz	a5,ffffffffc0202dbc <pmm_init+0x76a>
    if (PPN(pa) >= npage)
ffffffffc0202916:	6094                	ld	a3,0(s1)
    return pa2page(PTE_ADDR(pte));
ffffffffc0202918:	00271793          	slli	a5,a4,0x2
ffffffffc020291c:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc020291e:	48d7fd63          	bgeu	a5,a3,ffffffffc0202db8 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc0202922:	000bb683          	ld	a3,0(s7)
ffffffffc0202926:	fff80ab7          	lui	s5,0xfff80
ffffffffc020292a:	97d6                	add	a5,a5,s5
ffffffffc020292c:	079a                	slli	a5,a5,0x6
ffffffffc020292e:	97b6                	add	a5,a5,a3
ffffffffc0202930:	66fa1463          	bne	s4,a5,ffffffffc0202f98 <pmm_init+0x946>
    assert((*ptep & PTE_U) == 0);
ffffffffc0202934:	8b41                	andi	a4,a4,16
ffffffffc0202936:	64071163          	bnez	a4,ffffffffc0202f78 <pmm_init+0x926>

    page_remove(boot_pgdir_va, 0x0);
ffffffffc020293a:	00093503          	ld	a0,0(s2)
ffffffffc020293e:	4581                	li	a1,0
ffffffffc0202940:	b81ff0ef          	jal	ra,ffffffffc02024c0 <page_remove>
    assert(page_ref(p1) == 1);
ffffffffc0202944:	000a2c83          	lw	s9,0(s4)
ffffffffc0202948:	4785                	li	a5,1
ffffffffc020294a:	60fc9763          	bne	s9,a5,ffffffffc0202f58 <pmm_init+0x906>
    assert(page_ref(p2) == 0);
ffffffffc020294e:	000c2783          	lw	a5,0(s8)
ffffffffc0202952:	5e079363          	bnez	a5,ffffffffc0202f38 <pmm_init+0x8e6>

    page_remove(boot_pgdir_va, PGSIZE);
ffffffffc0202956:	00093503          	ld	a0,0(s2)
ffffffffc020295a:	6585                	lui	a1,0x1
ffffffffc020295c:	b65ff0ef          	jal	ra,ffffffffc02024c0 <page_remove>
    assert(page_ref(p1) == 0);
ffffffffc0202960:	000a2783          	lw	a5,0(s4)
ffffffffc0202964:	52079a63          	bnez	a5,ffffffffc0202e98 <pmm_init+0x846>
    assert(page_ref(p2) == 0);
ffffffffc0202968:	000c2783          	lw	a5,0(s8)
ffffffffc020296c:	50079663          	bnez	a5,ffffffffc0202e78 <pmm_init+0x826>

    assert(page_ref(pde2page(boot_pgdir_va[0])) == 1);
ffffffffc0202970:	00093a03          	ld	s4,0(s2)
    if (PPN(pa) >= npage)
ffffffffc0202974:	608c                	ld	a1,0(s1)
    return pa2page(PDE_ADDR(pde));
ffffffffc0202976:	000a3683          	ld	a3,0(s4)
ffffffffc020297a:	068a                	slli	a3,a3,0x2
ffffffffc020297c:	82b1                	srli	a3,a3,0xc
    if (PPN(pa) >= npage)
ffffffffc020297e:	42b6fd63          	bgeu	a3,a1,ffffffffc0202db8 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc0202982:	000bb503          	ld	a0,0(s7)
ffffffffc0202986:	96d6                	add	a3,a3,s5
ffffffffc0202988:	069a                	slli	a3,a3,0x6
    return page->ref;
ffffffffc020298a:	00d507b3          	add	a5,a0,a3
ffffffffc020298e:	439c                	lw	a5,0(a5)
ffffffffc0202990:	4d979463          	bne	a5,s9,ffffffffc0202e58 <pmm_init+0x806>
    return page - pages + nbase;
ffffffffc0202994:	8699                	srai	a3,a3,0x6
ffffffffc0202996:	00080637          	lui	a2,0x80
ffffffffc020299a:	96b2                	add	a3,a3,a2
    return KADDR(page2pa(page));
ffffffffc020299c:	00c69713          	slli	a4,a3,0xc
ffffffffc02029a0:	8331                	srli	a4,a4,0xc
    return page2ppn(page) << PGSHIFT;
ffffffffc02029a2:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc02029a4:	48b77e63          	bgeu	a4,a1,ffffffffc0202e40 <pmm_init+0x7ee>

    pde_t *pd1 = boot_pgdir_va, *pd0 = page2kva(pde2page(boot_pgdir_va[0]));
    free_page(pde2page(pd0[0]));
ffffffffc02029a8:	0009b703          	ld	a4,0(s3)
ffffffffc02029ac:	96ba                	add	a3,a3,a4
    return pa2page(PDE_ADDR(pde));
ffffffffc02029ae:	629c                	ld	a5,0(a3)
ffffffffc02029b0:	078a                	slli	a5,a5,0x2
ffffffffc02029b2:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc02029b4:	40b7f263          	bgeu	a5,a1,ffffffffc0202db8 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc02029b8:	8f91                	sub	a5,a5,a2
ffffffffc02029ba:	079a                	slli	a5,a5,0x6
ffffffffc02029bc:	953e                	add	a0,a0,a5
ffffffffc02029be:	100027f3          	csrr	a5,sstatus
ffffffffc02029c2:	8b89                	andi	a5,a5,2
ffffffffc02029c4:	30079963          	bnez	a5,ffffffffc0202cd6 <pmm_init+0x684>
        pmm_manager->free_pages(base, n);
ffffffffc02029c8:	000b3783          	ld	a5,0(s6)
ffffffffc02029cc:	4585                	li	a1,1
ffffffffc02029ce:	739c                	ld	a5,32(a5)
ffffffffc02029d0:	9782                	jalr	a5
    return pa2page(PDE_ADDR(pde));
ffffffffc02029d2:	000a3783          	ld	a5,0(s4)
    if (PPN(pa) >= npage)
ffffffffc02029d6:	6098                	ld	a4,0(s1)
    return pa2page(PDE_ADDR(pde));
ffffffffc02029d8:	078a                	slli	a5,a5,0x2
ffffffffc02029da:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc02029dc:	3ce7fe63          	bgeu	a5,a4,ffffffffc0202db8 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc02029e0:	000bb503          	ld	a0,0(s7)
ffffffffc02029e4:	fff80737          	lui	a4,0xfff80
ffffffffc02029e8:	97ba                	add	a5,a5,a4
ffffffffc02029ea:	079a                	slli	a5,a5,0x6
ffffffffc02029ec:	953e                	add	a0,a0,a5
ffffffffc02029ee:	100027f3          	csrr	a5,sstatus
ffffffffc02029f2:	8b89                	andi	a5,a5,2
ffffffffc02029f4:	2c079563          	bnez	a5,ffffffffc0202cbe <pmm_init+0x66c>
ffffffffc02029f8:	000b3783          	ld	a5,0(s6)
ffffffffc02029fc:	4585                	li	a1,1
ffffffffc02029fe:	739c                	ld	a5,32(a5)
ffffffffc0202a00:	9782                	jalr	a5
    free_page(pde2page(pd1[0]));
    boot_pgdir_va[0] = 0;
ffffffffc0202a02:	00093783          	ld	a5,0(s2)
ffffffffc0202a06:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd384d8>
    asm volatile("sfence.vma");
ffffffffc0202a0a:	12000073          	sfence.vma
ffffffffc0202a0e:	100027f3          	csrr	a5,sstatus
ffffffffc0202a12:	8b89                	andi	a5,a5,2
ffffffffc0202a14:	28079b63          	bnez	a5,ffffffffc0202caa <pmm_init+0x658>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202a18:	000b3783          	ld	a5,0(s6)
ffffffffc0202a1c:	779c                	ld	a5,40(a5)
ffffffffc0202a1e:	9782                	jalr	a5
ffffffffc0202a20:	8a2a                	mv	s4,a0
    flush_tlb();

    assert(nr_free_store == nr_free_pages());
ffffffffc0202a22:	4b441b63          	bne	s0,s4,ffffffffc0202ed8 <pmm_init+0x886>

    cprintf("check_pgdir() succeeded!\n");
ffffffffc0202a26:	00004517          	auipc	a0,0x4
ffffffffc0202a2a:	5fa50513          	addi	a0,a0,1530 # ffffffffc0207020 <default_pmm_manager+0x560>
ffffffffc0202a2e:	f6afd0ef          	jal	ra,ffffffffc0200198 <cprintf>
ffffffffc0202a32:	100027f3          	csrr	a5,sstatus
ffffffffc0202a36:	8b89                	andi	a5,a5,2
ffffffffc0202a38:	24079f63          	bnez	a5,ffffffffc0202c96 <pmm_init+0x644>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202a3c:	000b3783          	ld	a5,0(s6)
ffffffffc0202a40:	779c                	ld	a5,40(a5)
ffffffffc0202a42:	9782                	jalr	a5
ffffffffc0202a44:	8c2a                	mv	s8,a0
    pte_t *ptep;
    int i;

    nr_free_store = nr_free_pages();

    for (i = ROUNDDOWN(KERNBASE, PGSIZE); i < npage * PGSIZE; i += PGSIZE)
ffffffffc0202a46:	6098                	ld	a4,0(s1)
ffffffffc0202a48:	c0200437          	lui	s0,0xc0200
    {
        assert((ptep = get_pte(boot_pgdir_va, (uintptr_t)KADDR(i), 0)) != NULL);
        assert(PTE_ADDR(*ptep) == i);
ffffffffc0202a4c:	7afd                	lui	s5,0xfffff
    for (i = ROUNDDOWN(KERNBASE, PGSIZE); i < npage * PGSIZE; i += PGSIZE)
ffffffffc0202a4e:	00c71793          	slli	a5,a4,0xc
ffffffffc0202a52:	6a05                	lui	s4,0x1
ffffffffc0202a54:	02f47c63          	bgeu	s0,a5,ffffffffc0202a8c <pmm_init+0x43a>
        assert((ptep = get_pte(boot_pgdir_va, (uintptr_t)KADDR(i), 0)) != NULL);
ffffffffc0202a58:	00c45793          	srli	a5,s0,0xc
ffffffffc0202a5c:	00093503          	ld	a0,0(s2)
ffffffffc0202a60:	2ee7ff63          	bgeu	a5,a4,ffffffffc0202d5e <pmm_init+0x70c>
ffffffffc0202a64:	0009b583          	ld	a1,0(s3)
ffffffffc0202a68:	4601                	li	a2,0
ffffffffc0202a6a:	95a2                	add	a1,a1,s0
ffffffffc0202a6c:	c00ff0ef          	jal	ra,ffffffffc0201e6c <get_pte>
ffffffffc0202a70:	32050463          	beqz	a0,ffffffffc0202d98 <pmm_init+0x746>
        assert(PTE_ADDR(*ptep) == i);
ffffffffc0202a74:	611c                	ld	a5,0(a0)
ffffffffc0202a76:	078a                	slli	a5,a5,0x2
ffffffffc0202a78:	0157f7b3          	and	a5,a5,s5
ffffffffc0202a7c:	2e879e63          	bne	a5,s0,ffffffffc0202d78 <pmm_init+0x726>
    for (i = ROUNDDOWN(KERNBASE, PGSIZE); i < npage * PGSIZE; i += PGSIZE)
ffffffffc0202a80:	6098                	ld	a4,0(s1)
ffffffffc0202a82:	9452                	add	s0,s0,s4
ffffffffc0202a84:	00c71793          	slli	a5,a4,0xc
ffffffffc0202a88:	fcf468e3          	bltu	s0,a5,ffffffffc0202a58 <pmm_init+0x406>
    }

    assert(boot_pgdir_va[0] == 0);
ffffffffc0202a8c:	00093783          	ld	a5,0(s2)
ffffffffc0202a90:	639c                	ld	a5,0(a5)
ffffffffc0202a92:	42079363          	bnez	a5,ffffffffc0202eb8 <pmm_init+0x866>
ffffffffc0202a96:	100027f3          	csrr	a5,sstatus
ffffffffc0202a9a:	8b89                	andi	a5,a5,2
ffffffffc0202a9c:	24079963          	bnez	a5,ffffffffc0202cee <pmm_init+0x69c>
        page = pmm_manager->alloc_pages(n);
ffffffffc0202aa0:	000b3783          	ld	a5,0(s6)
ffffffffc0202aa4:	4505                	li	a0,1
ffffffffc0202aa6:	6f9c                	ld	a5,24(a5)
ffffffffc0202aa8:	9782                	jalr	a5
ffffffffc0202aaa:	8a2a                	mv	s4,a0

    struct Page *p;
    p = alloc_page();
    assert(page_insert(boot_pgdir_va, p, 0x100, PTE_W | PTE_R) == 0);
ffffffffc0202aac:	00093503          	ld	a0,0(s2)
ffffffffc0202ab0:	4699                	li	a3,6
ffffffffc0202ab2:	10000613          	li	a2,256
ffffffffc0202ab6:	85d2                	mv	a1,s4
ffffffffc0202ab8:	aa5ff0ef          	jal	ra,ffffffffc020255c <page_insert>
ffffffffc0202abc:	44051e63          	bnez	a0,ffffffffc0202f18 <pmm_init+0x8c6>
    assert(page_ref(p) == 1);
ffffffffc0202ac0:	000a2703          	lw	a4,0(s4) # 1000 <_binary_obj___user_faultread_out_size-0x8f30>
ffffffffc0202ac4:	4785                	li	a5,1
ffffffffc0202ac6:	42f71963          	bne	a4,a5,ffffffffc0202ef8 <pmm_init+0x8a6>
    assert(page_insert(boot_pgdir_va, p, 0x100 + PGSIZE, PTE_W | PTE_R) == 0);
ffffffffc0202aca:	00093503          	ld	a0,0(s2)
ffffffffc0202ace:	6405                	lui	s0,0x1
ffffffffc0202ad0:	4699                	li	a3,6
ffffffffc0202ad2:	10040613          	addi	a2,s0,256 # 1100 <_binary_obj___user_faultread_out_size-0x8e30>
ffffffffc0202ad6:	85d2                	mv	a1,s4
ffffffffc0202ad8:	a85ff0ef          	jal	ra,ffffffffc020255c <page_insert>
ffffffffc0202adc:	72051363          	bnez	a0,ffffffffc0203202 <pmm_init+0xbb0>
    assert(page_ref(p) == 2);
ffffffffc0202ae0:	000a2703          	lw	a4,0(s4)
ffffffffc0202ae4:	4789                	li	a5,2
ffffffffc0202ae6:	6ef71e63          	bne	a4,a5,ffffffffc02031e2 <pmm_init+0xb90>

    const char *str = "ucore: Hello world!!";
    strcpy((void *)0x100, str);
ffffffffc0202aea:	00004597          	auipc	a1,0x4
ffffffffc0202aee:	67e58593          	addi	a1,a1,1662 # ffffffffc0207168 <default_pmm_manager+0x6a8>
ffffffffc0202af2:	10000513          	li	a0,256
ffffffffc0202af6:	0f0030ef          	jal	ra,ffffffffc0205be6 <strcpy>
    assert(strcmp((void *)0x100, (void *)(0x100 + PGSIZE)) == 0);
ffffffffc0202afa:	10040593          	addi	a1,s0,256
ffffffffc0202afe:	10000513          	li	a0,256
ffffffffc0202b02:	0f6030ef          	jal	ra,ffffffffc0205bf8 <strcmp>
ffffffffc0202b06:	6a051e63          	bnez	a0,ffffffffc02031c2 <pmm_init+0xb70>
    return page - pages + nbase;
ffffffffc0202b0a:	000bb683          	ld	a3,0(s7)
ffffffffc0202b0e:	00080737          	lui	a4,0x80
    return KADDR(page2pa(page));
ffffffffc0202b12:	547d                	li	s0,-1
    return page - pages + nbase;
ffffffffc0202b14:	40da06b3          	sub	a3,s4,a3
ffffffffc0202b18:	8699                	srai	a3,a3,0x6
    return KADDR(page2pa(page));
ffffffffc0202b1a:	609c                	ld	a5,0(s1)
    return page - pages + nbase;
ffffffffc0202b1c:	96ba                	add	a3,a3,a4
    return KADDR(page2pa(page));
ffffffffc0202b1e:	8031                	srli	s0,s0,0xc
ffffffffc0202b20:	0086f733          	and	a4,a3,s0
    return page2ppn(page) << PGSHIFT;
ffffffffc0202b24:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0202b26:	30f77d63          	bgeu	a4,a5,ffffffffc0202e40 <pmm_init+0x7ee>

    *(char *)(page2kva(p) + 0x100) = '\0';
ffffffffc0202b2a:	0009b783          	ld	a5,0(s3)
    assert(strlen((const char *)0x100) == 0);
ffffffffc0202b2e:	10000513          	li	a0,256
    *(char *)(page2kva(p) + 0x100) = '\0';
ffffffffc0202b32:	96be                	add	a3,a3,a5
ffffffffc0202b34:	10068023          	sb	zero,256(a3)
    assert(strlen((const char *)0x100) == 0);
ffffffffc0202b38:	078030ef          	jal	ra,ffffffffc0205bb0 <strlen>
ffffffffc0202b3c:	66051363          	bnez	a0,ffffffffc02031a2 <pmm_init+0xb50>

    pde_t *pd1 = boot_pgdir_va, *pd0 = page2kva(pde2page(boot_pgdir_va[0]));
ffffffffc0202b40:	00093a83          	ld	s5,0(s2)
    if (PPN(pa) >= npage)
ffffffffc0202b44:	609c                	ld	a5,0(s1)
    return pa2page(PDE_ADDR(pde));
ffffffffc0202b46:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd384d8>
ffffffffc0202b4a:	068a                	slli	a3,a3,0x2
ffffffffc0202b4c:	82b1                	srli	a3,a3,0xc
    if (PPN(pa) >= npage)
ffffffffc0202b4e:	26f6f563          	bgeu	a3,a5,ffffffffc0202db8 <pmm_init+0x766>
    return KADDR(page2pa(page));
ffffffffc0202b52:	8c75                	and	s0,s0,a3
    return page2ppn(page) << PGSHIFT;
ffffffffc0202b54:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0202b56:	2ef47563          	bgeu	s0,a5,ffffffffc0202e40 <pmm_init+0x7ee>
ffffffffc0202b5a:	0009b403          	ld	s0,0(s3)
ffffffffc0202b5e:	9436                	add	s0,s0,a3
ffffffffc0202b60:	100027f3          	csrr	a5,sstatus
ffffffffc0202b64:	8b89                	andi	a5,a5,2
ffffffffc0202b66:	1e079163          	bnez	a5,ffffffffc0202d48 <pmm_init+0x6f6>
        pmm_manager->free_pages(base, n);
ffffffffc0202b6a:	000b3783          	ld	a5,0(s6)
ffffffffc0202b6e:	4585                	li	a1,1
ffffffffc0202b70:	8552                	mv	a0,s4
ffffffffc0202b72:	739c                	ld	a5,32(a5)
ffffffffc0202b74:	9782                	jalr	a5
    return pa2page(PDE_ADDR(pde));
ffffffffc0202b76:	601c                	ld	a5,0(s0)
    if (PPN(pa) >= npage)
ffffffffc0202b78:	6098                	ld	a4,0(s1)
    return pa2page(PDE_ADDR(pde));
ffffffffc0202b7a:	078a                	slli	a5,a5,0x2
ffffffffc0202b7c:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0202b7e:	22e7fd63          	bgeu	a5,a4,ffffffffc0202db8 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc0202b82:	000bb503          	ld	a0,0(s7)
ffffffffc0202b86:	fff80737          	lui	a4,0xfff80
ffffffffc0202b8a:	97ba                	add	a5,a5,a4
ffffffffc0202b8c:	079a                	slli	a5,a5,0x6
ffffffffc0202b8e:	953e                	add	a0,a0,a5
ffffffffc0202b90:	100027f3          	csrr	a5,sstatus
ffffffffc0202b94:	8b89                	andi	a5,a5,2
ffffffffc0202b96:	18079d63          	bnez	a5,ffffffffc0202d30 <pmm_init+0x6de>
ffffffffc0202b9a:	000b3783          	ld	a5,0(s6)
ffffffffc0202b9e:	4585                	li	a1,1
ffffffffc0202ba0:	739c                	ld	a5,32(a5)
ffffffffc0202ba2:	9782                	jalr	a5
    return pa2page(PDE_ADDR(pde));
ffffffffc0202ba4:	000ab783          	ld	a5,0(s5)
    if (PPN(pa) >= npage)
ffffffffc0202ba8:	6098                	ld	a4,0(s1)
    return pa2page(PDE_ADDR(pde));
ffffffffc0202baa:	078a                	slli	a5,a5,0x2
ffffffffc0202bac:	83b1                	srli	a5,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0202bae:	20e7f563          	bgeu	a5,a4,ffffffffc0202db8 <pmm_init+0x766>
    return &pages[PPN(pa) - nbase];
ffffffffc0202bb2:	000bb503          	ld	a0,0(s7)
ffffffffc0202bb6:	fff80737          	lui	a4,0xfff80
ffffffffc0202bba:	97ba                	add	a5,a5,a4
ffffffffc0202bbc:	079a                	slli	a5,a5,0x6
ffffffffc0202bbe:	953e                	add	a0,a0,a5
ffffffffc0202bc0:	100027f3          	csrr	a5,sstatus
ffffffffc0202bc4:	8b89                	andi	a5,a5,2
ffffffffc0202bc6:	14079963          	bnez	a5,ffffffffc0202d18 <pmm_init+0x6c6>
ffffffffc0202bca:	000b3783          	ld	a5,0(s6)
ffffffffc0202bce:	4585                	li	a1,1
ffffffffc0202bd0:	739c                	ld	a5,32(a5)
ffffffffc0202bd2:	9782                	jalr	a5
    free_page(p);
    free_page(pde2page(pd0[0]));
    free_page(pde2page(pd1[0]));
    boot_pgdir_va[0] = 0;
ffffffffc0202bd4:	00093783          	ld	a5,0(s2)
ffffffffc0202bd8:	0007b023          	sd	zero,0(a5)
    asm volatile("sfence.vma");
ffffffffc0202bdc:	12000073          	sfence.vma
ffffffffc0202be0:	100027f3          	csrr	a5,sstatus
ffffffffc0202be4:	8b89                	andi	a5,a5,2
ffffffffc0202be6:	10079f63          	bnez	a5,ffffffffc0202d04 <pmm_init+0x6b2>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202bea:	000b3783          	ld	a5,0(s6)
ffffffffc0202bee:	779c                	ld	a5,40(a5)
ffffffffc0202bf0:	9782                	jalr	a5
ffffffffc0202bf2:	842a                	mv	s0,a0
    flush_tlb();

    assert(nr_free_store == nr_free_pages());
ffffffffc0202bf4:	4c8c1e63          	bne	s8,s0,ffffffffc02030d0 <pmm_init+0xa7e>

    cprintf("check_boot_pgdir() succeeded!\n");
ffffffffc0202bf8:	00004517          	auipc	a0,0x4
ffffffffc0202bfc:	5e850513          	addi	a0,a0,1512 # ffffffffc02071e0 <default_pmm_manager+0x720>
ffffffffc0202c00:	d98fd0ef          	jal	ra,ffffffffc0200198 <cprintf>
}
ffffffffc0202c04:	7406                	ld	s0,96(sp)
ffffffffc0202c06:	70a6                	ld	ra,104(sp)
ffffffffc0202c08:	64e6                	ld	s1,88(sp)
ffffffffc0202c0a:	6946                	ld	s2,80(sp)
ffffffffc0202c0c:	69a6                	ld	s3,72(sp)
ffffffffc0202c0e:	6a06                	ld	s4,64(sp)
ffffffffc0202c10:	7ae2                	ld	s5,56(sp)
ffffffffc0202c12:	7b42                	ld	s6,48(sp)
ffffffffc0202c14:	7ba2                	ld	s7,40(sp)
ffffffffc0202c16:	7c02                	ld	s8,32(sp)
ffffffffc0202c18:	6ce2                	ld	s9,24(sp)
ffffffffc0202c1a:	6165                	addi	sp,sp,112
    kmalloc_init();
ffffffffc0202c1c:	f97fe06f          	j	ffffffffc0201bb2 <kmalloc_init>
    npage = maxpa / PGSIZE;
ffffffffc0202c20:	c80007b7          	lui	a5,0xc8000
ffffffffc0202c24:	bc7d                	j	ffffffffc02026e2 <pmm_init+0x90>
        intr_disable();
ffffffffc0202c26:	d89fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc0202c2a:	000b3783          	ld	a5,0(s6)
ffffffffc0202c2e:	4505                	li	a0,1
ffffffffc0202c30:	6f9c                	ld	a5,24(a5)
ffffffffc0202c32:	9782                	jalr	a5
ffffffffc0202c34:	8c2a                	mv	s8,a0
        intr_enable();
ffffffffc0202c36:	d73fd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202c3a:	b9a9                	j	ffffffffc0202894 <pmm_init+0x242>
        intr_disable();
ffffffffc0202c3c:	d73fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc0202c40:	000b3783          	ld	a5,0(s6)
ffffffffc0202c44:	4505                	li	a0,1
ffffffffc0202c46:	6f9c                	ld	a5,24(a5)
ffffffffc0202c48:	9782                	jalr	a5
ffffffffc0202c4a:	8a2a                	mv	s4,a0
        intr_enable();
ffffffffc0202c4c:	d5dfd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202c50:	b645                	j	ffffffffc02027f0 <pmm_init+0x19e>
        intr_disable();
ffffffffc0202c52:	d5dfd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202c56:	000b3783          	ld	a5,0(s6)
ffffffffc0202c5a:	779c                	ld	a5,40(a5)
ffffffffc0202c5c:	9782                	jalr	a5
ffffffffc0202c5e:	842a                	mv	s0,a0
        intr_enable();
ffffffffc0202c60:	d49fd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202c64:	b6b9                	j	ffffffffc02027b2 <pmm_init+0x160>
    mem_begin = ROUNDUP(freemem, PGSIZE);
ffffffffc0202c66:	6705                	lui	a4,0x1
ffffffffc0202c68:	177d                	addi	a4,a4,-1
ffffffffc0202c6a:	96ba                	add	a3,a3,a4
ffffffffc0202c6c:	8ff5                	and	a5,a5,a3
    if (PPN(pa) >= npage)
ffffffffc0202c6e:	00c7d713          	srli	a4,a5,0xc
ffffffffc0202c72:	14a77363          	bgeu	a4,a0,ffffffffc0202db8 <pmm_init+0x766>
    pmm_manager->init_memmap(base, n);
ffffffffc0202c76:	000b3683          	ld	a3,0(s6)
    return &pages[PPN(pa) - nbase];
ffffffffc0202c7a:	fff80537          	lui	a0,0xfff80
ffffffffc0202c7e:	972a                	add	a4,a4,a0
ffffffffc0202c80:	6a94                	ld	a3,16(a3)
        init_memmap(pa2page(mem_begin), (mem_end - mem_begin) / PGSIZE);
ffffffffc0202c82:	8c1d                	sub	s0,s0,a5
ffffffffc0202c84:	00671513          	slli	a0,a4,0x6
    pmm_manager->init_memmap(base, n);
ffffffffc0202c88:	00c45593          	srli	a1,s0,0xc
ffffffffc0202c8c:	9532                	add	a0,a0,a2
ffffffffc0202c8e:	9682                	jalr	a3
    cprintf("vapaofset is %llu\n", va_pa_offset);
ffffffffc0202c90:	0009b583          	ld	a1,0(s3)
}
ffffffffc0202c94:	b4c1                	j	ffffffffc0202754 <pmm_init+0x102>
        intr_disable();
ffffffffc0202c96:	d19fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202c9a:	000b3783          	ld	a5,0(s6)
ffffffffc0202c9e:	779c                	ld	a5,40(a5)
ffffffffc0202ca0:	9782                	jalr	a5
ffffffffc0202ca2:	8c2a                	mv	s8,a0
        intr_enable();
ffffffffc0202ca4:	d05fd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202ca8:	bb79                	j	ffffffffc0202a46 <pmm_init+0x3f4>
        intr_disable();
ffffffffc0202caa:	d05fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc0202cae:	000b3783          	ld	a5,0(s6)
ffffffffc0202cb2:	779c                	ld	a5,40(a5)
ffffffffc0202cb4:	9782                	jalr	a5
ffffffffc0202cb6:	8a2a                	mv	s4,a0
        intr_enable();
ffffffffc0202cb8:	cf1fd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202cbc:	b39d                	j	ffffffffc0202a22 <pmm_init+0x3d0>
ffffffffc0202cbe:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc0202cc0:	ceffd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc0202cc4:	000b3783          	ld	a5,0(s6)
ffffffffc0202cc8:	6522                	ld	a0,8(sp)
ffffffffc0202cca:	4585                	li	a1,1
ffffffffc0202ccc:	739c                	ld	a5,32(a5)
ffffffffc0202cce:	9782                	jalr	a5
        intr_enable();
ffffffffc0202cd0:	cd9fd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202cd4:	b33d                	j	ffffffffc0202a02 <pmm_init+0x3b0>
ffffffffc0202cd6:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc0202cd8:	cd7fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc0202cdc:	000b3783          	ld	a5,0(s6)
ffffffffc0202ce0:	6522                	ld	a0,8(sp)
ffffffffc0202ce2:	4585                	li	a1,1
ffffffffc0202ce4:	739c                	ld	a5,32(a5)
ffffffffc0202ce6:	9782                	jalr	a5
        intr_enable();
ffffffffc0202ce8:	cc1fd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202cec:	b1dd                	j	ffffffffc02029d2 <pmm_init+0x380>
        intr_disable();
ffffffffc0202cee:	cc1fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc0202cf2:	000b3783          	ld	a5,0(s6)
ffffffffc0202cf6:	4505                	li	a0,1
ffffffffc0202cf8:	6f9c                	ld	a5,24(a5)
ffffffffc0202cfa:	9782                	jalr	a5
ffffffffc0202cfc:	8a2a                	mv	s4,a0
        intr_enable();
ffffffffc0202cfe:	cabfd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202d02:	b36d                	j	ffffffffc0202aac <pmm_init+0x45a>
        intr_disable();
ffffffffc0202d04:	cabfd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        ret = pmm_manager->nr_free_pages();
ffffffffc0202d08:	000b3783          	ld	a5,0(s6)
ffffffffc0202d0c:	779c                	ld	a5,40(a5)
ffffffffc0202d0e:	9782                	jalr	a5
ffffffffc0202d10:	842a                	mv	s0,a0
        intr_enable();
ffffffffc0202d12:	c97fd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202d16:	bdf9                	j	ffffffffc0202bf4 <pmm_init+0x5a2>
ffffffffc0202d18:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc0202d1a:	c95fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc0202d1e:	000b3783          	ld	a5,0(s6)
ffffffffc0202d22:	6522                	ld	a0,8(sp)
ffffffffc0202d24:	4585                	li	a1,1
ffffffffc0202d26:	739c                	ld	a5,32(a5)
ffffffffc0202d28:	9782                	jalr	a5
        intr_enable();
ffffffffc0202d2a:	c7ffd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202d2e:	b55d                	j	ffffffffc0202bd4 <pmm_init+0x582>
ffffffffc0202d30:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc0202d32:	c7dfd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc0202d36:	000b3783          	ld	a5,0(s6)
ffffffffc0202d3a:	6522                	ld	a0,8(sp)
ffffffffc0202d3c:	4585                	li	a1,1
ffffffffc0202d3e:	739c                	ld	a5,32(a5)
ffffffffc0202d40:	9782                	jalr	a5
        intr_enable();
ffffffffc0202d42:	c67fd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202d46:	bdb9                	j	ffffffffc0202ba4 <pmm_init+0x552>
        intr_disable();
ffffffffc0202d48:	c67fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc0202d4c:	000b3783          	ld	a5,0(s6)
ffffffffc0202d50:	4585                	li	a1,1
ffffffffc0202d52:	8552                	mv	a0,s4
ffffffffc0202d54:	739c                	ld	a5,32(a5)
ffffffffc0202d56:	9782                	jalr	a5
        intr_enable();
ffffffffc0202d58:	c51fd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0202d5c:	bd29                	j	ffffffffc0202b76 <pmm_init+0x524>
        assert((ptep = get_pte(boot_pgdir_va, (uintptr_t)KADDR(i), 0)) != NULL);
ffffffffc0202d5e:	86a2                	mv	a3,s0
ffffffffc0202d60:	00004617          	auipc	a2,0x4
ffffffffc0202d64:	d9860613          	addi	a2,a2,-616 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc0202d68:	25100593          	li	a1,593
ffffffffc0202d6c:	00004517          	auipc	a0,0x4
ffffffffc0202d70:	ea450513          	addi	a0,a0,-348 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202d74:	f1efd0ef          	jal	ra,ffffffffc0200492 <__panic>
        assert(PTE_ADDR(*ptep) == i);
ffffffffc0202d78:	00004697          	auipc	a3,0x4
ffffffffc0202d7c:	30868693          	addi	a3,a3,776 # ffffffffc0207080 <default_pmm_manager+0x5c0>
ffffffffc0202d80:	00004617          	auipc	a2,0x4
ffffffffc0202d84:	99060613          	addi	a2,a2,-1648 # ffffffffc0206710 <commands+0x828>
ffffffffc0202d88:	25200593          	li	a1,594
ffffffffc0202d8c:	00004517          	auipc	a0,0x4
ffffffffc0202d90:	e8450513          	addi	a0,a0,-380 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202d94:	efefd0ef          	jal	ra,ffffffffc0200492 <__panic>
        assert((ptep = get_pte(boot_pgdir_va, (uintptr_t)KADDR(i), 0)) != NULL);
ffffffffc0202d98:	00004697          	auipc	a3,0x4
ffffffffc0202d9c:	2a868693          	addi	a3,a3,680 # ffffffffc0207040 <default_pmm_manager+0x580>
ffffffffc0202da0:	00004617          	auipc	a2,0x4
ffffffffc0202da4:	97060613          	addi	a2,a2,-1680 # ffffffffc0206710 <commands+0x828>
ffffffffc0202da8:	25100593          	li	a1,593
ffffffffc0202dac:	00004517          	auipc	a0,0x4
ffffffffc0202db0:	e6450513          	addi	a0,a0,-412 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202db4:	edefd0ef          	jal	ra,ffffffffc0200492 <__panic>
ffffffffc0202db8:	fc5fe0ef          	jal	ra,ffffffffc0201d7c <pa2page.part.0>
ffffffffc0202dbc:	fddfe0ef          	jal	ra,ffffffffc0201d98 <pte2page.part.0>
    assert(get_pte(boot_pgdir_va, PGSIZE, 0) == ptep);
ffffffffc0202dc0:	00004697          	auipc	a3,0x4
ffffffffc0202dc4:	07868693          	addi	a3,a3,120 # ffffffffc0206e38 <default_pmm_manager+0x378>
ffffffffc0202dc8:	00004617          	auipc	a2,0x4
ffffffffc0202dcc:	94860613          	addi	a2,a2,-1720 # ffffffffc0206710 <commands+0x828>
ffffffffc0202dd0:	22100593          	li	a1,545
ffffffffc0202dd4:	00004517          	auipc	a0,0x4
ffffffffc0202dd8:	e3c50513          	addi	a0,a0,-452 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202ddc:	eb6fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(get_page(boot_pgdir_va, 0x0, NULL) == NULL);
ffffffffc0202de0:	00004697          	auipc	a3,0x4
ffffffffc0202de4:	f9868693          	addi	a3,a3,-104 # ffffffffc0206d78 <default_pmm_manager+0x2b8>
ffffffffc0202de8:	00004617          	auipc	a2,0x4
ffffffffc0202dec:	92860613          	addi	a2,a2,-1752 # ffffffffc0206710 <commands+0x828>
ffffffffc0202df0:	21400593          	li	a1,532
ffffffffc0202df4:	00004517          	auipc	a0,0x4
ffffffffc0202df8:	e1c50513          	addi	a0,a0,-484 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202dfc:	e96fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(boot_pgdir_va != NULL && (uint32_t)PGOFF(boot_pgdir_va) == 0);
ffffffffc0202e00:	00004697          	auipc	a3,0x4
ffffffffc0202e04:	f3868693          	addi	a3,a3,-200 # ffffffffc0206d38 <default_pmm_manager+0x278>
ffffffffc0202e08:	00004617          	auipc	a2,0x4
ffffffffc0202e0c:	90860613          	addi	a2,a2,-1784 # ffffffffc0206710 <commands+0x828>
ffffffffc0202e10:	21300593          	li	a1,531
ffffffffc0202e14:	00004517          	auipc	a0,0x4
ffffffffc0202e18:	dfc50513          	addi	a0,a0,-516 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202e1c:	e76fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(npage <= KERNTOP / PGSIZE);
ffffffffc0202e20:	00004697          	auipc	a3,0x4
ffffffffc0202e24:	ef868693          	addi	a3,a3,-264 # ffffffffc0206d18 <default_pmm_manager+0x258>
ffffffffc0202e28:	00004617          	auipc	a2,0x4
ffffffffc0202e2c:	8e860613          	addi	a2,a2,-1816 # ffffffffc0206710 <commands+0x828>
ffffffffc0202e30:	21200593          	li	a1,530
ffffffffc0202e34:	00004517          	auipc	a0,0x4
ffffffffc0202e38:	ddc50513          	addi	a0,a0,-548 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202e3c:	e56fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    return KADDR(page2pa(page));
ffffffffc0202e40:	00004617          	auipc	a2,0x4
ffffffffc0202e44:	cb860613          	addi	a2,a2,-840 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc0202e48:	07100593          	li	a1,113
ffffffffc0202e4c:	00004517          	auipc	a0,0x4
ffffffffc0202e50:	cd450513          	addi	a0,a0,-812 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc0202e54:	e3efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(pde2page(boot_pgdir_va[0])) == 1);
ffffffffc0202e58:	00004697          	auipc	a3,0x4
ffffffffc0202e5c:	17068693          	addi	a3,a3,368 # ffffffffc0206fc8 <default_pmm_manager+0x508>
ffffffffc0202e60:	00004617          	auipc	a2,0x4
ffffffffc0202e64:	8b060613          	addi	a2,a2,-1872 # ffffffffc0206710 <commands+0x828>
ffffffffc0202e68:	23a00593          	li	a1,570
ffffffffc0202e6c:	00004517          	auipc	a0,0x4
ffffffffc0202e70:	da450513          	addi	a0,a0,-604 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202e74:	e1efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p2) == 0);
ffffffffc0202e78:	00004697          	auipc	a3,0x4
ffffffffc0202e7c:	10868693          	addi	a3,a3,264 # ffffffffc0206f80 <default_pmm_manager+0x4c0>
ffffffffc0202e80:	00004617          	auipc	a2,0x4
ffffffffc0202e84:	89060613          	addi	a2,a2,-1904 # ffffffffc0206710 <commands+0x828>
ffffffffc0202e88:	23800593          	li	a1,568
ffffffffc0202e8c:	00004517          	auipc	a0,0x4
ffffffffc0202e90:	d8450513          	addi	a0,a0,-636 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202e94:	dfefd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p1) == 0);
ffffffffc0202e98:	00004697          	auipc	a3,0x4
ffffffffc0202e9c:	11868693          	addi	a3,a3,280 # ffffffffc0206fb0 <default_pmm_manager+0x4f0>
ffffffffc0202ea0:	00004617          	auipc	a2,0x4
ffffffffc0202ea4:	87060613          	addi	a2,a2,-1936 # ffffffffc0206710 <commands+0x828>
ffffffffc0202ea8:	23700593          	li	a1,567
ffffffffc0202eac:	00004517          	auipc	a0,0x4
ffffffffc0202eb0:	d6450513          	addi	a0,a0,-668 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202eb4:	ddefd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(boot_pgdir_va[0] == 0);
ffffffffc0202eb8:	00004697          	auipc	a3,0x4
ffffffffc0202ebc:	1e068693          	addi	a3,a3,480 # ffffffffc0207098 <default_pmm_manager+0x5d8>
ffffffffc0202ec0:	00004617          	auipc	a2,0x4
ffffffffc0202ec4:	85060613          	addi	a2,a2,-1968 # ffffffffc0206710 <commands+0x828>
ffffffffc0202ec8:	25500593          	li	a1,597
ffffffffc0202ecc:	00004517          	auipc	a0,0x4
ffffffffc0202ed0:	d4450513          	addi	a0,a0,-700 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202ed4:	dbefd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(nr_free_store == nr_free_pages());
ffffffffc0202ed8:	00004697          	auipc	a3,0x4
ffffffffc0202edc:	12068693          	addi	a3,a3,288 # ffffffffc0206ff8 <default_pmm_manager+0x538>
ffffffffc0202ee0:	00004617          	auipc	a2,0x4
ffffffffc0202ee4:	83060613          	addi	a2,a2,-2000 # ffffffffc0206710 <commands+0x828>
ffffffffc0202ee8:	24200593          	li	a1,578
ffffffffc0202eec:	00004517          	auipc	a0,0x4
ffffffffc0202ef0:	d2450513          	addi	a0,a0,-732 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202ef4:	d9efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p) == 1);
ffffffffc0202ef8:	00004697          	auipc	a3,0x4
ffffffffc0202efc:	1f868693          	addi	a3,a3,504 # ffffffffc02070f0 <default_pmm_manager+0x630>
ffffffffc0202f00:	00004617          	auipc	a2,0x4
ffffffffc0202f04:	81060613          	addi	a2,a2,-2032 # ffffffffc0206710 <commands+0x828>
ffffffffc0202f08:	25a00593          	li	a1,602
ffffffffc0202f0c:	00004517          	auipc	a0,0x4
ffffffffc0202f10:	d0450513          	addi	a0,a0,-764 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202f14:	d7efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_insert(boot_pgdir_va, p, 0x100, PTE_W | PTE_R) == 0);
ffffffffc0202f18:	00004697          	auipc	a3,0x4
ffffffffc0202f1c:	19868693          	addi	a3,a3,408 # ffffffffc02070b0 <default_pmm_manager+0x5f0>
ffffffffc0202f20:	00003617          	auipc	a2,0x3
ffffffffc0202f24:	7f060613          	addi	a2,a2,2032 # ffffffffc0206710 <commands+0x828>
ffffffffc0202f28:	25900593          	li	a1,601
ffffffffc0202f2c:	00004517          	auipc	a0,0x4
ffffffffc0202f30:	ce450513          	addi	a0,a0,-796 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202f34:	d5efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p2) == 0);
ffffffffc0202f38:	00004697          	auipc	a3,0x4
ffffffffc0202f3c:	04868693          	addi	a3,a3,72 # ffffffffc0206f80 <default_pmm_manager+0x4c0>
ffffffffc0202f40:	00003617          	auipc	a2,0x3
ffffffffc0202f44:	7d060613          	addi	a2,a2,2000 # ffffffffc0206710 <commands+0x828>
ffffffffc0202f48:	23400593          	li	a1,564
ffffffffc0202f4c:	00004517          	auipc	a0,0x4
ffffffffc0202f50:	cc450513          	addi	a0,a0,-828 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202f54:	d3efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p1) == 1);
ffffffffc0202f58:	00004697          	auipc	a3,0x4
ffffffffc0202f5c:	ec868693          	addi	a3,a3,-312 # ffffffffc0206e20 <default_pmm_manager+0x360>
ffffffffc0202f60:	00003617          	auipc	a2,0x3
ffffffffc0202f64:	7b060613          	addi	a2,a2,1968 # ffffffffc0206710 <commands+0x828>
ffffffffc0202f68:	23300593          	li	a1,563
ffffffffc0202f6c:	00004517          	auipc	a0,0x4
ffffffffc0202f70:	ca450513          	addi	a0,a0,-860 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202f74:	d1efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((*ptep & PTE_U) == 0);
ffffffffc0202f78:	00004697          	auipc	a3,0x4
ffffffffc0202f7c:	02068693          	addi	a3,a3,32 # ffffffffc0206f98 <default_pmm_manager+0x4d8>
ffffffffc0202f80:	00003617          	auipc	a2,0x3
ffffffffc0202f84:	79060613          	addi	a2,a2,1936 # ffffffffc0206710 <commands+0x828>
ffffffffc0202f88:	23000593          	li	a1,560
ffffffffc0202f8c:	00004517          	auipc	a0,0x4
ffffffffc0202f90:	c8450513          	addi	a0,a0,-892 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202f94:	cfefd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(pte2page(*ptep) == p1);
ffffffffc0202f98:	00004697          	auipc	a3,0x4
ffffffffc0202f9c:	e7068693          	addi	a3,a3,-400 # ffffffffc0206e08 <default_pmm_manager+0x348>
ffffffffc0202fa0:	00003617          	auipc	a2,0x3
ffffffffc0202fa4:	77060613          	addi	a2,a2,1904 # ffffffffc0206710 <commands+0x828>
ffffffffc0202fa8:	22f00593          	li	a1,559
ffffffffc0202fac:	00004517          	auipc	a0,0x4
ffffffffc0202fb0:	c6450513          	addi	a0,a0,-924 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202fb4:	cdefd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((ptep = get_pte(boot_pgdir_va, PGSIZE, 0)) != NULL);
ffffffffc0202fb8:	00004697          	auipc	a3,0x4
ffffffffc0202fbc:	ef068693          	addi	a3,a3,-272 # ffffffffc0206ea8 <default_pmm_manager+0x3e8>
ffffffffc0202fc0:	00003617          	auipc	a2,0x3
ffffffffc0202fc4:	75060613          	addi	a2,a2,1872 # ffffffffc0206710 <commands+0x828>
ffffffffc0202fc8:	22e00593          	li	a1,558
ffffffffc0202fcc:	00004517          	auipc	a0,0x4
ffffffffc0202fd0:	c4450513          	addi	a0,a0,-956 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202fd4:	cbefd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p2) == 0);
ffffffffc0202fd8:	00004697          	auipc	a3,0x4
ffffffffc0202fdc:	fa868693          	addi	a3,a3,-88 # ffffffffc0206f80 <default_pmm_manager+0x4c0>
ffffffffc0202fe0:	00003617          	auipc	a2,0x3
ffffffffc0202fe4:	73060613          	addi	a2,a2,1840 # ffffffffc0206710 <commands+0x828>
ffffffffc0202fe8:	22d00593          	li	a1,557
ffffffffc0202fec:	00004517          	auipc	a0,0x4
ffffffffc0202ff0:	c2450513          	addi	a0,a0,-988 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0202ff4:	c9efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p1) == 2);
ffffffffc0202ff8:	00004697          	auipc	a3,0x4
ffffffffc0202ffc:	f7068693          	addi	a3,a3,-144 # ffffffffc0206f68 <default_pmm_manager+0x4a8>
ffffffffc0203000:	00003617          	auipc	a2,0x3
ffffffffc0203004:	71060613          	addi	a2,a2,1808 # ffffffffc0206710 <commands+0x828>
ffffffffc0203008:	22c00593          	li	a1,556
ffffffffc020300c:	00004517          	auipc	a0,0x4
ffffffffc0203010:	c0450513          	addi	a0,a0,-1020 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0203014:	c7efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_insert(boot_pgdir_va, p1, PGSIZE, 0) == 0);
ffffffffc0203018:	00004697          	auipc	a3,0x4
ffffffffc020301c:	f2068693          	addi	a3,a3,-224 # ffffffffc0206f38 <default_pmm_manager+0x478>
ffffffffc0203020:	00003617          	auipc	a2,0x3
ffffffffc0203024:	6f060613          	addi	a2,a2,1776 # ffffffffc0206710 <commands+0x828>
ffffffffc0203028:	22b00593          	li	a1,555
ffffffffc020302c:	00004517          	auipc	a0,0x4
ffffffffc0203030:	be450513          	addi	a0,a0,-1052 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0203034:	c5efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p2) == 1);
ffffffffc0203038:	00004697          	auipc	a3,0x4
ffffffffc020303c:	ee868693          	addi	a3,a3,-280 # ffffffffc0206f20 <default_pmm_manager+0x460>
ffffffffc0203040:	00003617          	auipc	a2,0x3
ffffffffc0203044:	6d060613          	addi	a2,a2,1744 # ffffffffc0206710 <commands+0x828>
ffffffffc0203048:	22900593          	li	a1,553
ffffffffc020304c:	00004517          	auipc	a0,0x4
ffffffffc0203050:	bc450513          	addi	a0,a0,-1084 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0203054:	c3efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(boot_pgdir_va[0] & PTE_U);
ffffffffc0203058:	00004697          	auipc	a3,0x4
ffffffffc020305c:	ea868693          	addi	a3,a3,-344 # ffffffffc0206f00 <default_pmm_manager+0x440>
ffffffffc0203060:	00003617          	auipc	a2,0x3
ffffffffc0203064:	6b060613          	addi	a2,a2,1712 # ffffffffc0206710 <commands+0x828>
ffffffffc0203068:	22800593          	li	a1,552
ffffffffc020306c:	00004517          	auipc	a0,0x4
ffffffffc0203070:	ba450513          	addi	a0,a0,-1116 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0203074:	c1efd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(*ptep & PTE_W);
ffffffffc0203078:	00004697          	auipc	a3,0x4
ffffffffc020307c:	e7868693          	addi	a3,a3,-392 # ffffffffc0206ef0 <default_pmm_manager+0x430>
ffffffffc0203080:	00003617          	auipc	a2,0x3
ffffffffc0203084:	69060613          	addi	a2,a2,1680 # ffffffffc0206710 <commands+0x828>
ffffffffc0203088:	22700593          	li	a1,551
ffffffffc020308c:	00004517          	auipc	a0,0x4
ffffffffc0203090:	b8450513          	addi	a0,a0,-1148 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0203094:	bfefd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(*ptep & PTE_U);
ffffffffc0203098:	00004697          	auipc	a3,0x4
ffffffffc020309c:	e4868693          	addi	a3,a3,-440 # ffffffffc0206ee0 <default_pmm_manager+0x420>
ffffffffc02030a0:	00003617          	auipc	a2,0x3
ffffffffc02030a4:	67060613          	addi	a2,a2,1648 # ffffffffc0206710 <commands+0x828>
ffffffffc02030a8:	22600593          	li	a1,550
ffffffffc02030ac:	00004517          	auipc	a0,0x4
ffffffffc02030b0:	b6450513          	addi	a0,a0,-1180 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc02030b4:	bdefd0ef          	jal	ra,ffffffffc0200492 <__panic>
        panic("DTB memory info not available");
ffffffffc02030b8:	00004617          	auipc	a2,0x4
ffffffffc02030bc:	bc860613          	addi	a2,a2,-1080 # ffffffffc0206c80 <default_pmm_manager+0x1c0>
ffffffffc02030c0:	06500593          	li	a1,101
ffffffffc02030c4:	00004517          	auipc	a0,0x4
ffffffffc02030c8:	b4c50513          	addi	a0,a0,-1204 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc02030cc:	bc6fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(nr_free_store == nr_free_pages());
ffffffffc02030d0:	00004697          	auipc	a3,0x4
ffffffffc02030d4:	f2868693          	addi	a3,a3,-216 # ffffffffc0206ff8 <default_pmm_manager+0x538>
ffffffffc02030d8:	00003617          	auipc	a2,0x3
ffffffffc02030dc:	63860613          	addi	a2,a2,1592 # ffffffffc0206710 <commands+0x828>
ffffffffc02030e0:	26c00593          	li	a1,620
ffffffffc02030e4:	00004517          	auipc	a0,0x4
ffffffffc02030e8:	b2c50513          	addi	a0,a0,-1236 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc02030ec:	ba6fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((ptep = get_pte(boot_pgdir_va, PGSIZE, 0)) != NULL);
ffffffffc02030f0:	00004697          	auipc	a3,0x4
ffffffffc02030f4:	db868693          	addi	a3,a3,-584 # ffffffffc0206ea8 <default_pmm_manager+0x3e8>
ffffffffc02030f8:	00003617          	auipc	a2,0x3
ffffffffc02030fc:	61860613          	addi	a2,a2,1560 # ffffffffc0206710 <commands+0x828>
ffffffffc0203100:	22500593          	li	a1,549
ffffffffc0203104:	00004517          	auipc	a0,0x4
ffffffffc0203108:	b0c50513          	addi	a0,a0,-1268 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020310c:	b86fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_insert(boot_pgdir_va, p2, PGSIZE, PTE_U | PTE_W) == 0);
ffffffffc0203110:	00004697          	auipc	a3,0x4
ffffffffc0203114:	d5868693          	addi	a3,a3,-680 # ffffffffc0206e68 <default_pmm_manager+0x3a8>
ffffffffc0203118:	00003617          	auipc	a2,0x3
ffffffffc020311c:	5f860613          	addi	a2,a2,1528 # ffffffffc0206710 <commands+0x828>
ffffffffc0203120:	22400593          	li	a1,548
ffffffffc0203124:	00004517          	auipc	a0,0x4
ffffffffc0203128:	aec50513          	addi	a0,a0,-1300 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020312c:	b66fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    ptep = (pte_t *)KADDR(PDE_ADDR(ptep[0])) + 1;
ffffffffc0203130:	86d6                	mv	a3,s5
ffffffffc0203132:	00004617          	auipc	a2,0x4
ffffffffc0203136:	9c660613          	addi	a2,a2,-1594 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc020313a:	22000593          	li	a1,544
ffffffffc020313e:	00004517          	auipc	a0,0x4
ffffffffc0203142:	ad250513          	addi	a0,a0,-1326 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0203146:	b4cfd0ef          	jal	ra,ffffffffc0200492 <__panic>
    ptep = (pte_t *)KADDR(PDE_ADDR(boot_pgdir_va[0]));
ffffffffc020314a:	00004617          	auipc	a2,0x4
ffffffffc020314e:	9ae60613          	addi	a2,a2,-1618 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc0203152:	21f00593          	li	a1,543
ffffffffc0203156:	00004517          	auipc	a0,0x4
ffffffffc020315a:	aba50513          	addi	a0,a0,-1350 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020315e:	b34fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p1) == 1);
ffffffffc0203162:	00004697          	auipc	a3,0x4
ffffffffc0203166:	cbe68693          	addi	a3,a3,-834 # ffffffffc0206e20 <default_pmm_manager+0x360>
ffffffffc020316a:	00003617          	auipc	a2,0x3
ffffffffc020316e:	5a660613          	addi	a2,a2,1446 # ffffffffc0206710 <commands+0x828>
ffffffffc0203172:	21d00593          	li	a1,541
ffffffffc0203176:	00004517          	auipc	a0,0x4
ffffffffc020317a:	a9a50513          	addi	a0,a0,-1382 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020317e:	b14fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(pte2page(*ptep) == p1);
ffffffffc0203182:	00004697          	auipc	a3,0x4
ffffffffc0203186:	c8668693          	addi	a3,a3,-890 # ffffffffc0206e08 <default_pmm_manager+0x348>
ffffffffc020318a:	00003617          	auipc	a2,0x3
ffffffffc020318e:	58660613          	addi	a2,a2,1414 # ffffffffc0206710 <commands+0x828>
ffffffffc0203192:	21c00593          	li	a1,540
ffffffffc0203196:	00004517          	auipc	a0,0x4
ffffffffc020319a:	a7a50513          	addi	a0,a0,-1414 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020319e:	af4fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(strlen((const char *)0x100) == 0);
ffffffffc02031a2:	00004697          	auipc	a3,0x4
ffffffffc02031a6:	01668693          	addi	a3,a3,22 # ffffffffc02071b8 <default_pmm_manager+0x6f8>
ffffffffc02031aa:	00003617          	auipc	a2,0x3
ffffffffc02031ae:	56660613          	addi	a2,a2,1382 # ffffffffc0206710 <commands+0x828>
ffffffffc02031b2:	26300593          	li	a1,611
ffffffffc02031b6:	00004517          	auipc	a0,0x4
ffffffffc02031ba:	a5a50513          	addi	a0,a0,-1446 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc02031be:	ad4fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(strcmp((void *)0x100, (void *)(0x100 + PGSIZE)) == 0);
ffffffffc02031c2:	00004697          	auipc	a3,0x4
ffffffffc02031c6:	fbe68693          	addi	a3,a3,-66 # ffffffffc0207180 <default_pmm_manager+0x6c0>
ffffffffc02031ca:	00003617          	auipc	a2,0x3
ffffffffc02031ce:	54660613          	addi	a2,a2,1350 # ffffffffc0206710 <commands+0x828>
ffffffffc02031d2:	26000593          	li	a1,608
ffffffffc02031d6:	00004517          	auipc	a0,0x4
ffffffffc02031da:	a3a50513          	addi	a0,a0,-1478 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc02031de:	ab4fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_ref(p) == 2);
ffffffffc02031e2:	00004697          	auipc	a3,0x4
ffffffffc02031e6:	f6e68693          	addi	a3,a3,-146 # ffffffffc0207150 <default_pmm_manager+0x690>
ffffffffc02031ea:	00003617          	auipc	a2,0x3
ffffffffc02031ee:	52660613          	addi	a2,a2,1318 # ffffffffc0206710 <commands+0x828>
ffffffffc02031f2:	25c00593          	li	a1,604
ffffffffc02031f6:	00004517          	auipc	a0,0x4
ffffffffc02031fa:	a1a50513          	addi	a0,a0,-1510 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc02031fe:	a94fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_insert(boot_pgdir_va, p, 0x100 + PGSIZE, PTE_W | PTE_R) == 0);
ffffffffc0203202:	00004697          	auipc	a3,0x4
ffffffffc0203206:	f0668693          	addi	a3,a3,-250 # ffffffffc0207108 <default_pmm_manager+0x648>
ffffffffc020320a:	00003617          	auipc	a2,0x3
ffffffffc020320e:	50660613          	addi	a2,a2,1286 # ffffffffc0206710 <commands+0x828>
ffffffffc0203212:	25b00593          	li	a1,603
ffffffffc0203216:	00004517          	auipc	a0,0x4
ffffffffc020321a:	9fa50513          	addi	a0,a0,-1542 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020321e:	a74fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    boot_pgdir_pa = PADDR(boot_pgdir_va);
ffffffffc0203222:	00004617          	auipc	a2,0x4
ffffffffc0203226:	97e60613          	addi	a2,a2,-1666 # ffffffffc0206ba0 <default_pmm_manager+0xe0>
ffffffffc020322a:	0c900593          	li	a1,201
ffffffffc020322e:	00004517          	auipc	a0,0x4
ffffffffc0203232:	9e250513          	addi	a0,a0,-1566 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc0203236:	a5cfd0ef          	jal	ra,ffffffffc0200492 <__panic>
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc020323a:	00004617          	auipc	a2,0x4
ffffffffc020323e:	96660613          	addi	a2,a2,-1690 # ffffffffc0206ba0 <default_pmm_manager+0xe0>
ffffffffc0203242:	08100593          	li	a1,129
ffffffffc0203246:	00004517          	auipc	a0,0x4
ffffffffc020324a:	9ca50513          	addi	a0,a0,-1590 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020324e:	a44fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert((ptep = get_pte(boot_pgdir_va, 0x0, 0)) != NULL);
ffffffffc0203252:	00004697          	auipc	a3,0x4
ffffffffc0203256:	b8668693          	addi	a3,a3,-1146 # ffffffffc0206dd8 <default_pmm_manager+0x318>
ffffffffc020325a:	00003617          	auipc	a2,0x3
ffffffffc020325e:	4b660613          	addi	a2,a2,1206 # ffffffffc0206710 <commands+0x828>
ffffffffc0203262:	21b00593          	li	a1,539
ffffffffc0203266:	00004517          	auipc	a0,0x4
ffffffffc020326a:	9aa50513          	addi	a0,a0,-1622 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020326e:	a24fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(page_insert(boot_pgdir_va, p1, 0x0, 0) == 0);
ffffffffc0203272:	00004697          	auipc	a3,0x4
ffffffffc0203276:	b3668693          	addi	a3,a3,-1226 # ffffffffc0206da8 <default_pmm_manager+0x2e8>
ffffffffc020327a:	00003617          	auipc	a2,0x3
ffffffffc020327e:	49660613          	addi	a2,a2,1174 # ffffffffc0206710 <commands+0x828>
ffffffffc0203282:	21800593          	li	a1,536
ffffffffc0203286:	00004517          	auipc	a0,0x4
ffffffffc020328a:	98a50513          	addi	a0,a0,-1654 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020328e:	a04fd0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0203292 <copy_range>:
{
ffffffffc0203292:	7159                	addi	sp,sp,-112
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc0203294:	00d667b3          	or	a5,a2,a3
{
ffffffffc0203298:	f486                	sd	ra,104(sp)
ffffffffc020329a:	f0a2                	sd	s0,96(sp)
ffffffffc020329c:	eca6                	sd	s1,88(sp)
ffffffffc020329e:	e8ca                	sd	s2,80(sp)
ffffffffc02032a0:	e4ce                	sd	s3,72(sp)
ffffffffc02032a2:	e0d2                	sd	s4,64(sp)
ffffffffc02032a4:	fc56                	sd	s5,56(sp)
ffffffffc02032a6:	f85a                	sd	s6,48(sp)
ffffffffc02032a8:	f45e                	sd	s7,40(sp)
ffffffffc02032aa:	f062                	sd	s8,32(sp)
ffffffffc02032ac:	ec66                	sd	s9,24(sp)
ffffffffc02032ae:	e86a                	sd	s10,16(sp)
ffffffffc02032b0:	e46e                	sd	s11,8(sp)
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc02032b2:	17d2                	slli	a5,a5,0x34
ffffffffc02032b4:	20079f63          	bnez	a5,ffffffffc02034d2 <copy_range+0x240>
    assert(USER_ACCESS(start, end));
ffffffffc02032b8:	002007b7          	lui	a5,0x200
ffffffffc02032bc:	8432                	mv	s0,a2
ffffffffc02032be:	1af66263          	bltu	a2,a5,ffffffffc0203462 <copy_range+0x1d0>
ffffffffc02032c2:	8936                	mv	s2,a3
ffffffffc02032c4:	18d67f63          	bgeu	a2,a3,ffffffffc0203462 <copy_range+0x1d0>
ffffffffc02032c8:	4785                	li	a5,1
ffffffffc02032ca:	07fe                	slli	a5,a5,0x1f
ffffffffc02032cc:	18d7eb63          	bltu	a5,a3,ffffffffc0203462 <copy_range+0x1d0>
ffffffffc02032d0:	5b7d                	li	s6,-1
ffffffffc02032d2:	8aaa                	mv	s5,a0
ffffffffc02032d4:	89ae                	mv	s3,a1
        start += PGSIZE;
ffffffffc02032d6:	6a05                	lui	s4,0x1
    if (PPN(pa) >= npage)
ffffffffc02032d8:	000c4c17          	auipc	s8,0xc4
ffffffffc02032dc:	800c0c13          	addi	s8,s8,-2048 # ffffffffc02c6ad8 <npage>
    return &pages[PPN(pa) - nbase];
ffffffffc02032e0:	000c4b97          	auipc	s7,0xc4
ffffffffc02032e4:	800b8b93          	addi	s7,s7,-2048 # ffffffffc02c6ae0 <pages>
    return KADDR(page2pa(page));
ffffffffc02032e8:	00cb5b13          	srli	s6,s6,0xc
        page = pmm_manager->alloc_pages(n);
ffffffffc02032ec:	000c3c97          	auipc	s9,0xc3
ffffffffc02032f0:	7fcc8c93          	addi	s9,s9,2044 # ffffffffc02c6ae8 <pmm_manager>
        pte_t *ptep = get_pte(from, start, 0), *nptep;
ffffffffc02032f4:	4601                	li	a2,0
ffffffffc02032f6:	85a2                	mv	a1,s0
ffffffffc02032f8:	854e                	mv	a0,s3
ffffffffc02032fa:	b73fe0ef          	jal	ra,ffffffffc0201e6c <get_pte>
ffffffffc02032fe:	84aa                	mv	s1,a0
        if (ptep == NULL)
ffffffffc0203300:	0e050c63          	beqz	a0,ffffffffc02033f8 <copy_range+0x166>
        if (*ptep & PTE_V)
ffffffffc0203304:	611c                	ld	a5,0(a0)
ffffffffc0203306:	8b85                	andi	a5,a5,1
ffffffffc0203308:	e785                	bnez	a5,ffffffffc0203330 <copy_range+0x9e>
        start += PGSIZE;
ffffffffc020330a:	9452                	add	s0,s0,s4
    } while (start != 0 && start < end);
ffffffffc020330c:	ff2464e3          	bltu	s0,s2,ffffffffc02032f4 <copy_range+0x62>
    return 0;
ffffffffc0203310:	4501                	li	a0,0
}
ffffffffc0203312:	70a6                	ld	ra,104(sp)
ffffffffc0203314:	7406                	ld	s0,96(sp)
ffffffffc0203316:	64e6                	ld	s1,88(sp)
ffffffffc0203318:	6946                	ld	s2,80(sp)
ffffffffc020331a:	69a6                	ld	s3,72(sp)
ffffffffc020331c:	6a06                	ld	s4,64(sp)
ffffffffc020331e:	7ae2                	ld	s5,56(sp)
ffffffffc0203320:	7b42                	ld	s6,48(sp)
ffffffffc0203322:	7ba2                	ld	s7,40(sp)
ffffffffc0203324:	7c02                	ld	s8,32(sp)
ffffffffc0203326:	6ce2                	ld	s9,24(sp)
ffffffffc0203328:	6d42                	ld	s10,16(sp)
ffffffffc020332a:	6da2                	ld	s11,8(sp)
ffffffffc020332c:	6165                	addi	sp,sp,112
ffffffffc020332e:	8082                	ret
            if ((nptep = get_pte(to, start, 1)) == NULL)
ffffffffc0203330:	4605                	li	a2,1
ffffffffc0203332:	85a2                	mv	a1,s0
ffffffffc0203334:	8556                	mv	a0,s5
ffffffffc0203336:	b37fe0ef          	jal	ra,ffffffffc0201e6c <get_pte>
ffffffffc020333a:	c56d                	beqz	a0,ffffffffc0203424 <copy_range+0x192>
            uint32_t perm = (*ptep & PTE_USER);
ffffffffc020333c:	609c                	ld	a5,0(s1)
    if (!(pte & PTE_V))
ffffffffc020333e:	0017f713          	andi	a4,a5,1
ffffffffc0203342:	01f7f493          	andi	s1,a5,31
ffffffffc0203346:	16070a63          	beqz	a4,ffffffffc02034ba <copy_range+0x228>
    if (PPN(pa) >= npage)
ffffffffc020334a:	000c3683          	ld	a3,0(s8)
    return pa2page(PTE_ADDR(pte));
ffffffffc020334e:	078a                	slli	a5,a5,0x2
ffffffffc0203350:	00c7d713          	srli	a4,a5,0xc
    if (PPN(pa) >= npage)
ffffffffc0203354:	14d77763          	bgeu	a4,a3,ffffffffc02034a2 <copy_range+0x210>
    return &pages[PPN(pa) - nbase];
ffffffffc0203358:	000bb783          	ld	a5,0(s7)
ffffffffc020335c:	fff806b7          	lui	a3,0xfff80
ffffffffc0203360:	9736                	add	a4,a4,a3
ffffffffc0203362:	071a                	slli	a4,a4,0x6
ffffffffc0203364:	00e78db3          	add	s11,a5,a4
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203368:	10002773          	csrr	a4,sstatus
ffffffffc020336c:	8b09                	andi	a4,a4,2
ffffffffc020336e:	e345                	bnez	a4,ffffffffc020340e <copy_range+0x17c>
        page = pmm_manager->alloc_pages(n);
ffffffffc0203370:	000cb703          	ld	a4,0(s9)
ffffffffc0203374:	4505                	li	a0,1
ffffffffc0203376:	6f18                	ld	a4,24(a4)
ffffffffc0203378:	9702                	jalr	a4
ffffffffc020337a:	8d2a                	mv	s10,a0
            assert(page != NULL);
ffffffffc020337c:	0c0d8363          	beqz	s11,ffffffffc0203442 <copy_range+0x1b0>
            assert(npage != NULL);
ffffffffc0203380:	100d0163          	beqz	s10,ffffffffc0203482 <copy_range+0x1f0>
    return page - pages + nbase;
ffffffffc0203384:	000bb703          	ld	a4,0(s7)
ffffffffc0203388:	000805b7          	lui	a1,0x80
    return KADDR(page2pa(page));
ffffffffc020338c:	000c3603          	ld	a2,0(s8)
    return page - pages + nbase;
ffffffffc0203390:	40ed86b3          	sub	a3,s11,a4
ffffffffc0203394:	8699                	srai	a3,a3,0x6
ffffffffc0203396:	96ae                	add	a3,a3,a1
    return KADDR(page2pa(page));
ffffffffc0203398:	0166f7b3          	and	a5,a3,s6
    return page2ppn(page) << PGSHIFT;
ffffffffc020339c:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc020339e:	08c7f663          	bgeu	a5,a2,ffffffffc020342a <copy_range+0x198>
    return page - pages + nbase;
ffffffffc02033a2:	40ed07b3          	sub	a5,s10,a4
    return KADDR(page2pa(page));
ffffffffc02033a6:	000c3717          	auipc	a4,0xc3
ffffffffc02033aa:	74a70713          	addi	a4,a4,1866 # ffffffffc02c6af0 <va_pa_offset>
ffffffffc02033ae:	6308                	ld	a0,0(a4)
    return page - pages + nbase;
ffffffffc02033b0:	8799                	srai	a5,a5,0x6
ffffffffc02033b2:	97ae                	add	a5,a5,a1
    return KADDR(page2pa(page));
ffffffffc02033b4:	0167f733          	and	a4,a5,s6
ffffffffc02033b8:	00a685b3          	add	a1,a3,a0
    return page2ppn(page) << PGSHIFT;
ffffffffc02033bc:	07b2                	slli	a5,a5,0xc
    return KADDR(page2pa(page));
ffffffffc02033be:	06c77563          	bgeu	a4,a2,ffffffffc0203428 <copy_range+0x196>
            memcpy(dst_kvaddr, src_kvaddr, PGSIZE);
ffffffffc02033c2:	6605                	lui	a2,0x1
ffffffffc02033c4:	953e                	add	a0,a0,a5
ffffffffc02033c6:	09f020ef          	jal	ra,ffffffffc0205c64 <memcpy>
            ret = page_insert(to, npage, start, perm);
ffffffffc02033ca:	86a6                	mv	a3,s1
ffffffffc02033cc:	8622                	mv	a2,s0
ffffffffc02033ce:	85ea                	mv	a1,s10
ffffffffc02033d0:	8556                	mv	a0,s5
ffffffffc02033d2:	98aff0ef          	jal	ra,ffffffffc020255c <page_insert>
            assert(ret == 0);
ffffffffc02033d6:	d915                	beqz	a0,ffffffffc020330a <copy_range+0x78>
ffffffffc02033d8:	00004697          	auipc	a3,0x4
ffffffffc02033dc:	e4868693          	addi	a3,a3,-440 # ffffffffc0207220 <default_pmm_manager+0x760>
ffffffffc02033e0:	00003617          	auipc	a2,0x3
ffffffffc02033e4:	33060613          	addi	a2,a2,816 # ffffffffc0206710 <commands+0x828>
ffffffffc02033e8:	1b000593          	li	a1,432
ffffffffc02033ec:	00004517          	auipc	a0,0x4
ffffffffc02033f0:	82450513          	addi	a0,a0,-2012 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc02033f4:	89efd0ef          	jal	ra,ffffffffc0200492 <__panic>
            start = ROUNDDOWN(start + PTSIZE, PTSIZE);
ffffffffc02033f8:	00200637          	lui	a2,0x200
ffffffffc02033fc:	9432                	add	s0,s0,a2
ffffffffc02033fe:	ffe00637          	lui	a2,0xffe00
ffffffffc0203402:	8c71                	and	s0,s0,a2
    } while (start != 0 && start < end);
ffffffffc0203404:	f00406e3          	beqz	s0,ffffffffc0203310 <copy_range+0x7e>
ffffffffc0203408:	ef2466e3          	bltu	s0,s2,ffffffffc02032f4 <copy_range+0x62>
ffffffffc020340c:	b711                	j	ffffffffc0203310 <copy_range+0x7e>
        intr_disable();
ffffffffc020340e:	da0fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc0203412:	000cb703          	ld	a4,0(s9)
ffffffffc0203416:	4505                	li	a0,1
ffffffffc0203418:	6f18                	ld	a4,24(a4)
ffffffffc020341a:	9702                	jalr	a4
ffffffffc020341c:	8d2a                	mv	s10,a0
        intr_enable();
ffffffffc020341e:	d8afd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0203422:	bfa9                	j	ffffffffc020337c <copy_range+0xea>
                return -E_NO_MEM;
ffffffffc0203424:	5571                	li	a0,-4
ffffffffc0203426:	b5f5                	j	ffffffffc0203312 <copy_range+0x80>
ffffffffc0203428:	86be                	mv	a3,a5
ffffffffc020342a:	00003617          	auipc	a2,0x3
ffffffffc020342e:	6ce60613          	addi	a2,a2,1742 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc0203432:	07100593          	li	a1,113
ffffffffc0203436:	00003517          	auipc	a0,0x3
ffffffffc020343a:	6ea50513          	addi	a0,a0,1770 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc020343e:	854fd0ef          	jal	ra,ffffffffc0200492 <__panic>
            assert(page != NULL);
ffffffffc0203442:	00004697          	auipc	a3,0x4
ffffffffc0203446:	dbe68693          	addi	a3,a3,-578 # ffffffffc0207200 <default_pmm_manager+0x740>
ffffffffc020344a:	00003617          	auipc	a2,0x3
ffffffffc020344e:	2c660613          	addi	a2,a2,710 # ffffffffc0206710 <commands+0x828>
ffffffffc0203452:	19600593          	li	a1,406
ffffffffc0203456:	00003517          	auipc	a0,0x3
ffffffffc020345a:	7ba50513          	addi	a0,a0,1978 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020345e:	834fd0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(USER_ACCESS(start, end));
ffffffffc0203462:	00003697          	auipc	a3,0x3
ffffffffc0203466:	7ee68693          	addi	a3,a3,2030 # ffffffffc0206c50 <default_pmm_manager+0x190>
ffffffffc020346a:	00003617          	auipc	a2,0x3
ffffffffc020346e:	2a660613          	addi	a2,a2,678 # ffffffffc0206710 <commands+0x828>
ffffffffc0203472:	17e00593          	li	a1,382
ffffffffc0203476:	00003517          	auipc	a0,0x3
ffffffffc020347a:	79a50513          	addi	a0,a0,1946 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020347e:	814fd0ef          	jal	ra,ffffffffc0200492 <__panic>
            assert(npage != NULL);
ffffffffc0203482:	00004697          	auipc	a3,0x4
ffffffffc0203486:	d8e68693          	addi	a3,a3,-626 # ffffffffc0207210 <default_pmm_manager+0x750>
ffffffffc020348a:	00003617          	auipc	a2,0x3
ffffffffc020348e:	28660613          	addi	a2,a2,646 # ffffffffc0206710 <commands+0x828>
ffffffffc0203492:	19700593          	li	a1,407
ffffffffc0203496:	00003517          	auipc	a0,0x3
ffffffffc020349a:	77a50513          	addi	a0,a0,1914 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc020349e:	ff5fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        panic("pa2page called with invalid pa");
ffffffffc02034a2:	00003617          	auipc	a2,0x3
ffffffffc02034a6:	72660613          	addi	a2,a2,1830 # ffffffffc0206bc8 <default_pmm_manager+0x108>
ffffffffc02034aa:	06900593          	li	a1,105
ffffffffc02034ae:	00003517          	auipc	a0,0x3
ffffffffc02034b2:	67250513          	addi	a0,a0,1650 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc02034b6:	fddfc0ef          	jal	ra,ffffffffc0200492 <__panic>
        panic("pte2page called with invalid pte");
ffffffffc02034ba:	00003617          	auipc	a2,0x3
ffffffffc02034be:	72e60613          	addi	a2,a2,1838 # ffffffffc0206be8 <default_pmm_manager+0x128>
ffffffffc02034c2:	07f00593          	li	a1,127
ffffffffc02034c6:	00003517          	auipc	a0,0x3
ffffffffc02034ca:	65a50513          	addi	a0,a0,1626 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc02034ce:	fc5fc0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(start % PGSIZE == 0 && end % PGSIZE == 0);
ffffffffc02034d2:	00003697          	auipc	a3,0x3
ffffffffc02034d6:	74e68693          	addi	a3,a3,1870 # ffffffffc0206c20 <default_pmm_manager+0x160>
ffffffffc02034da:	00003617          	auipc	a2,0x3
ffffffffc02034de:	23660613          	addi	a2,a2,566 # ffffffffc0206710 <commands+0x828>
ffffffffc02034e2:	17d00593          	li	a1,381
ffffffffc02034e6:	00003517          	auipc	a0,0x3
ffffffffc02034ea:	72a50513          	addi	a0,a0,1834 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc02034ee:	fa5fc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02034f2 <pgdir_alloc_page>:
{
ffffffffc02034f2:	7179                	addi	sp,sp,-48
ffffffffc02034f4:	ec26                	sd	s1,24(sp)
ffffffffc02034f6:	e84a                	sd	s2,16(sp)
ffffffffc02034f8:	e052                	sd	s4,0(sp)
ffffffffc02034fa:	f406                	sd	ra,40(sp)
ffffffffc02034fc:	f022                	sd	s0,32(sp)
ffffffffc02034fe:	e44e                	sd	s3,8(sp)
ffffffffc0203500:	8a2a                	mv	s4,a0
ffffffffc0203502:	84ae                	mv	s1,a1
ffffffffc0203504:	8932                	mv	s2,a2
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203506:	100027f3          	csrr	a5,sstatus
ffffffffc020350a:	8b89                	andi	a5,a5,2
        page = pmm_manager->alloc_pages(n);
ffffffffc020350c:	000c3997          	auipc	s3,0xc3
ffffffffc0203510:	5dc98993          	addi	s3,s3,1500 # ffffffffc02c6ae8 <pmm_manager>
ffffffffc0203514:	ef8d                	bnez	a5,ffffffffc020354e <pgdir_alloc_page+0x5c>
ffffffffc0203516:	0009b783          	ld	a5,0(s3)
ffffffffc020351a:	4505                	li	a0,1
ffffffffc020351c:	6f9c                	ld	a5,24(a5)
ffffffffc020351e:	9782                	jalr	a5
ffffffffc0203520:	842a                	mv	s0,a0
    if (page != NULL)
ffffffffc0203522:	cc09                	beqz	s0,ffffffffc020353c <pgdir_alloc_page+0x4a>
        if (page_insert(pgdir, page, la, perm) != 0)
ffffffffc0203524:	86ca                	mv	a3,s2
ffffffffc0203526:	8626                	mv	a2,s1
ffffffffc0203528:	85a2                	mv	a1,s0
ffffffffc020352a:	8552                	mv	a0,s4
ffffffffc020352c:	830ff0ef          	jal	ra,ffffffffc020255c <page_insert>
ffffffffc0203530:	e915                	bnez	a0,ffffffffc0203564 <pgdir_alloc_page+0x72>
        assert(page_ref(page) == 1);
ffffffffc0203532:	4018                	lw	a4,0(s0)
        page->pra_vaddr = la;
ffffffffc0203534:	fc04                	sd	s1,56(s0)
        assert(page_ref(page) == 1);
ffffffffc0203536:	4785                	li	a5,1
ffffffffc0203538:	04f71e63          	bne	a4,a5,ffffffffc0203594 <pgdir_alloc_page+0xa2>
}
ffffffffc020353c:	70a2                	ld	ra,40(sp)
ffffffffc020353e:	8522                	mv	a0,s0
ffffffffc0203540:	7402                	ld	s0,32(sp)
ffffffffc0203542:	64e2                	ld	s1,24(sp)
ffffffffc0203544:	6942                	ld	s2,16(sp)
ffffffffc0203546:	69a2                	ld	s3,8(sp)
ffffffffc0203548:	6a02                	ld	s4,0(sp)
ffffffffc020354a:	6145                	addi	sp,sp,48
ffffffffc020354c:	8082                	ret
        intr_disable();
ffffffffc020354e:	c60fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc0203552:	0009b783          	ld	a5,0(s3)
ffffffffc0203556:	4505                	li	a0,1
ffffffffc0203558:	6f9c                	ld	a5,24(a5)
ffffffffc020355a:	9782                	jalr	a5
ffffffffc020355c:	842a                	mv	s0,a0
        intr_enable();
ffffffffc020355e:	c4afd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0203562:	b7c1                	j	ffffffffc0203522 <pgdir_alloc_page+0x30>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203564:	100027f3          	csrr	a5,sstatus
ffffffffc0203568:	8b89                	andi	a5,a5,2
ffffffffc020356a:	eb89                	bnez	a5,ffffffffc020357c <pgdir_alloc_page+0x8a>
        pmm_manager->free_pages(base, n);
ffffffffc020356c:	0009b783          	ld	a5,0(s3)
ffffffffc0203570:	8522                	mv	a0,s0
ffffffffc0203572:	4585                	li	a1,1
ffffffffc0203574:	739c                	ld	a5,32(a5)
            return NULL;
ffffffffc0203576:	4401                	li	s0,0
        pmm_manager->free_pages(base, n);
ffffffffc0203578:	9782                	jalr	a5
    if (flag)
ffffffffc020357a:	b7c9                	j	ffffffffc020353c <pgdir_alloc_page+0x4a>
        intr_disable();
ffffffffc020357c:	c32fd0ef          	jal	ra,ffffffffc02009ae <intr_disable>
ffffffffc0203580:	0009b783          	ld	a5,0(s3)
ffffffffc0203584:	8522                	mv	a0,s0
ffffffffc0203586:	4585                	li	a1,1
ffffffffc0203588:	739c                	ld	a5,32(a5)
            return NULL;
ffffffffc020358a:	4401                	li	s0,0
        pmm_manager->free_pages(base, n);
ffffffffc020358c:	9782                	jalr	a5
        intr_enable();
ffffffffc020358e:	c1afd0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0203592:	b76d                	j	ffffffffc020353c <pgdir_alloc_page+0x4a>
        assert(page_ref(page) == 1);
ffffffffc0203594:	00004697          	auipc	a3,0x4
ffffffffc0203598:	c9c68693          	addi	a3,a3,-868 # ffffffffc0207230 <default_pmm_manager+0x770>
ffffffffc020359c:	00003617          	auipc	a2,0x3
ffffffffc02035a0:	17460613          	addi	a2,a2,372 # ffffffffc0206710 <commands+0x828>
ffffffffc02035a4:	1f900593          	li	a1,505
ffffffffc02035a8:	00003517          	auipc	a0,0x3
ffffffffc02035ac:	66850513          	addi	a0,a0,1640 # ffffffffc0206c10 <default_pmm_manager+0x150>
ffffffffc02035b0:	ee3fc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02035b4 <check_vma_overlap.part.0>:
    return vma;
}

// check_vma_overlap - check if vma1 overlaps vma2 ?
static inline void
check_vma_overlap(struct vma_struct *prev, struct vma_struct *next)
ffffffffc02035b4:	1141                	addi	sp,sp,-16
{
    assert(prev->vm_start < prev->vm_end);
    assert(prev->vm_end <= next->vm_start);
    assert(next->vm_start < next->vm_end);
ffffffffc02035b6:	00004697          	auipc	a3,0x4
ffffffffc02035ba:	c9268693          	addi	a3,a3,-878 # ffffffffc0207248 <default_pmm_manager+0x788>
ffffffffc02035be:	00003617          	auipc	a2,0x3
ffffffffc02035c2:	15260613          	addi	a2,a2,338 # ffffffffc0206710 <commands+0x828>
ffffffffc02035c6:	07400593          	li	a1,116
ffffffffc02035ca:	00004517          	auipc	a0,0x4
ffffffffc02035ce:	c9e50513          	addi	a0,a0,-866 # ffffffffc0207268 <default_pmm_manager+0x7a8>
check_vma_overlap(struct vma_struct *prev, struct vma_struct *next)
ffffffffc02035d2:	e406                	sd	ra,8(sp)
    assert(next->vm_start < next->vm_end);
ffffffffc02035d4:	ebffc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02035d8 <mm_create>:
{
ffffffffc02035d8:	1141                	addi	sp,sp,-16
    struct mm_struct *mm = kmalloc(sizeof(struct mm_struct));
ffffffffc02035da:	04000513          	li	a0,64
{
ffffffffc02035de:	e406                	sd	ra,8(sp)
    struct mm_struct *mm = kmalloc(sizeof(struct mm_struct));
ffffffffc02035e0:	df6fe0ef          	jal	ra,ffffffffc0201bd6 <kmalloc>
    if (mm != NULL)
ffffffffc02035e4:	cd19                	beqz	a0,ffffffffc0203602 <mm_create+0x2a>
    elm->prev = elm->next = elm;
ffffffffc02035e6:	e508                	sd	a0,8(a0)
ffffffffc02035e8:	e108                	sd	a0,0(a0)
        mm->mmap_cache = NULL;
ffffffffc02035ea:	00053823          	sd	zero,16(a0)
        mm->pgdir = NULL;
ffffffffc02035ee:	00053c23          	sd	zero,24(a0)
        mm->map_count = 0;
ffffffffc02035f2:	02052023          	sw	zero,32(a0)
        mm->sm_priv = NULL;
ffffffffc02035f6:	02053423          	sd	zero,40(a0)
}

static inline void
set_mm_count(struct mm_struct *mm, int val)
{
    mm->mm_count = val;
ffffffffc02035fa:	02052823          	sw	zero,48(a0)
typedef volatile bool lock_t;

static inline void
lock_init(lock_t *lock)
{
    *lock = 0;
ffffffffc02035fe:	02053c23          	sd	zero,56(a0)
}
ffffffffc0203602:	60a2                	ld	ra,8(sp)
ffffffffc0203604:	0141                	addi	sp,sp,16
ffffffffc0203606:	8082                	ret

ffffffffc0203608 <find_vma>:
{
ffffffffc0203608:	86aa                	mv	a3,a0
    if (mm != NULL)
ffffffffc020360a:	c505                	beqz	a0,ffffffffc0203632 <find_vma+0x2a>
        vma = mm->mmap_cache;
ffffffffc020360c:	6908                	ld	a0,16(a0)
        if (!(vma != NULL && vma->vm_start <= addr && vma->vm_end > addr))
ffffffffc020360e:	c501                	beqz	a0,ffffffffc0203616 <find_vma+0xe>
ffffffffc0203610:	651c                	ld	a5,8(a0)
ffffffffc0203612:	02f5f263          	bgeu	a1,a5,ffffffffc0203636 <find_vma+0x2e>
    return listelm->next;
ffffffffc0203616:	669c                	ld	a5,8(a3)
            while ((le = list_next(le)) != list)
ffffffffc0203618:	00f68d63          	beq	a3,a5,ffffffffc0203632 <find_vma+0x2a>
                if (vma->vm_start <= addr && addr < vma->vm_end)
ffffffffc020361c:	fe87b703          	ld	a4,-24(a5) # 1fffe8 <_binary_obj___user_matrix_out_size+0x1f38e8>
ffffffffc0203620:	00e5e663          	bltu	a1,a4,ffffffffc020362c <find_vma+0x24>
ffffffffc0203624:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203628:	00e5ec63          	bltu	a1,a4,ffffffffc0203640 <find_vma+0x38>
ffffffffc020362c:	679c                	ld	a5,8(a5)
            while ((le = list_next(le)) != list)
ffffffffc020362e:	fef697e3          	bne	a3,a5,ffffffffc020361c <find_vma+0x14>
    struct vma_struct *vma = NULL;
ffffffffc0203632:	4501                	li	a0,0
}
ffffffffc0203634:	8082                	ret
        if (!(vma != NULL && vma->vm_start <= addr && vma->vm_end > addr))
ffffffffc0203636:	691c                	ld	a5,16(a0)
ffffffffc0203638:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0203616 <find_vma+0xe>
            mm->mmap_cache = vma;
ffffffffc020363c:	ea88                	sd	a0,16(a3)
ffffffffc020363e:	8082                	ret
                vma = le2vma(le, list_link);
ffffffffc0203640:	fe078513          	addi	a0,a5,-32
            mm->mmap_cache = vma;
ffffffffc0203644:	ea88                	sd	a0,16(a3)
ffffffffc0203646:	8082                	ret

ffffffffc0203648 <insert_vma_struct>:
}

// insert_vma_struct -insert vma in mm's list link
void insert_vma_struct(struct mm_struct *mm, struct vma_struct *vma)
{
    assert(vma->vm_start < vma->vm_end);
ffffffffc0203648:	6590                	ld	a2,8(a1)
ffffffffc020364a:	0105b803          	ld	a6,16(a1) # 80010 <_binary_obj___user_matrix_out_size+0x73910>
{
ffffffffc020364e:	1141                	addi	sp,sp,-16
ffffffffc0203650:	e406                	sd	ra,8(sp)
ffffffffc0203652:	87aa                	mv	a5,a0
    assert(vma->vm_start < vma->vm_end);
ffffffffc0203654:	01066763          	bltu	a2,a6,ffffffffc0203662 <insert_vma_struct+0x1a>
ffffffffc0203658:	a085                	j	ffffffffc02036b8 <insert_vma_struct+0x70>

    list_entry_t *le = list;
    while ((le = list_next(le)) != list)
    {
        struct vma_struct *mmap_prev = le2vma(le, list_link);
        if (mmap_prev->vm_start > vma->vm_start)
ffffffffc020365a:	fe87b703          	ld	a4,-24(a5)
ffffffffc020365e:	04e66863          	bltu	a2,a4,ffffffffc02036ae <insert_vma_struct+0x66>
ffffffffc0203662:	86be                	mv	a3,a5
ffffffffc0203664:	679c                	ld	a5,8(a5)
    while ((le = list_next(le)) != list)
ffffffffc0203666:	fef51ae3          	bne	a0,a5,ffffffffc020365a <insert_vma_struct+0x12>
    }

    le_next = list_next(le_prev);

    /* check overlap */
    if (le_prev != list)
ffffffffc020366a:	02a68463          	beq	a3,a0,ffffffffc0203692 <insert_vma_struct+0x4a>
    {
        check_vma_overlap(le2vma(le_prev, list_link), vma);
ffffffffc020366e:	ff06b703          	ld	a4,-16(a3)
    assert(prev->vm_start < prev->vm_end);
ffffffffc0203672:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203676:	08e8f163          	bgeu	a7,a4,ffffffffc02036f8 <insert_vma_struct+0xb0>
    assert(prev->vm_end <= next->vm_start);
ffffffffc020367a:	04e66f63          	bltu	a2,a4,ffffffffc02036d8 <insert_vma_struct+0x90>
    }
    if (le_next != list)
ffffffffc020367e:	00f50a63          	beq	a0,a5,ffffffffc0203692 <insert_vma_struct+0x4a>
        if (mmap_prev->vm_start > vma->vm_start)
ffffffffc0203682:	fe87b703          	ld	a4,-24(a5)
    assert(prev->vm_end <= next->vm_start);
ffffffffc0203686:	05076963          	bltu	a4,a6,ffffffffc02036d8 <insert_vma_struct+0x90>
    assert(next->vm_start < next->vm_end);
ffffffffc020368a:	ff07b603          	ld	a2,-16(a5)
ffffffffc020368e:	02c77363          	bgeu	a4,a2,ffffffffc02036b4 <insert_vma_struct+0x6c>
    }

    vma->vm_mm = mm;
    list_add_after(le_prev, &(vma->list_link));

    mm->map_count++;
ffffffffc0203692:	5118                	lw	a4,32(a0)
    vma->vm_mm = mm;
ffffffffc0203694:	e188                	sd	a0,0(a1)
    list_add_after(le_prev, &(vma->list_link));
ffffffffc0203696:	02058613          	addi	a2,a1,32
    prev->next = next->prev = elm;
ffffffffc020369a:	e390                	sd	a2,0(a5)
ffffffffc020369c:	e690                	sd	a2,8(a3)
}
ffffffffc020369e:	60a2                	ld	ra,8(sp)
    elm->next = next;
ffffffffc02036a0:	f59c                	sd	a5,40(a1)
    elm->prev = prev;
ffffffffc02036a2:	f194                	sd	a3,32(a1)
    mm->map_count++;
ffffffffc02036a4:	0017079b          	addiw	a5,a4,1
ffffffffc02036a8:	d11c                	sw	a5,32(a0)
}
ffffffffc02036aa:	0141                	addi	sp,sp,16
ffffffffc02036ac:	8082                	ret
    if (le_prev != list)
ffffffffc02036ae:	fca690e3          	bne	a3,a0,ffffffffc020366e <insert_vma_struct+0x26>
ffffffffc02036b2:	bfd1                	j	ffffffffc0203686 <insert_vma_struct+0x3e>
ffffffffc02036b4:	f01ff0ef          	jal	ra,ffffffffc02035b4 <check_vma_overlap.part.0>
    assert(vma->vm_start < vma->vm_end);
ffffffffc02036b8:	00004697          	auipc	a3,0x4
ffffffffc02036bc:	bc068693          	addi	a3,a3,-1088 # ffffffffc0207278 <default_pmm_manager+0x7b8>
ffffffffc02036c0:	00003617          	auipc	a2,0x3
ffffffffc02036c4:	05060613          	addi	a2,a2,80 # ffffffffc0206710 <commands+0x828>
ffffffffc02036c8:	07a00593          	li	a1,122
ffffffffc02036cc:	00004517          	auipc	a0,0x4
ffffffffc02036d0:	b9c50513          	addi	a0,a0,-1124 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc02036d4:	dbffc0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(prev->vm_end <= next->vm_start);
ffffffffc02036d8:	00004697          	auipc	a3,0x4
ffffffffc02036dc:	be068693          	addi	a3,a3,-1056 # ffffffffc02072b8 <default_pmm_manager+0x7f8>
ffffffffc02036e0:	00003617          	auipc	a2,0x3
ffffffffc02036e4:	03060613          	addi	a2,a2,48 # ffffffffc0206710 <commands+0x828>
ffffffffc02036e8:	07300593          	li	a1,115
ffffffffc02036ec:	00004517          	auipc	a0,0x4
ffffffffc02036f0:	b7c50513          	addi	a0,a0,-1156 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc02036f4:	d9ffc0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(prev->vm_start < prev->vm_end);
ffffffffc02036f8:	00004697          	auipc	a3,0x4
ffffffffc02036fc:	ba068693          	addi	a3,a3,-1120 # ffffffffc0207298 <default_pmm_manager+0x7d8>
ffffffffc0203700:	00003617          	auipc	a2,0x3
ffffffffc0203704:	01060613          	addi	a2,a2,16 # ffffffffc0206710 <commands+0x828>
ffffffffc0203708:	07200593          	li	a1,114
ffffffffc020370c:	00004517          	auipc	a0,0x4
ffffffffc0203710:	b5c50513          	addi	a0,a0,-1188 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203714:	d7ffc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0203718 <mm_destroy>:

// mm_destroy - free mm and mm internal fields
void mm_destroy(struct mm_struct *mm)
{
    assert(mm_count(mm) == 0);
ffffffffc0203718:	591c                	lw	a5,48(a0)
{
ffffffffc020371a:	1141                	addi	sp,sp,-16
ffffffffc020371c:	e406                	sd	ra,8(sp)
ffffffffc020371e:	e022                	sd	s0,0(sp)
    assert(mm_count(mm) == 0);
ffffffffc0203720:	e78d                	bnez	a5,ffffffffc020374a <mm_destroy+0x32>
ffffffffc0203722:	842a                	mv	s0,a0
    return listelm->next;
ffffffffc0203724:	6508                	ld	a0,8(a0)

    list_entry_t *list = &(mm->mmap_list), *le;
    while ((le = list_next(list)) != list)
ffffffffc0203726:	00a40c63          	beq	s0,a0,ffffffffc020373e <mm_destroy+0x26>
    __list_del(listelm->prev, listelm->next);
ffffffffc020372a:	6118                	ld	a4,0(a0)
ffffffffc020372c:	651c                	ld	a5,8(a0)
    {
        list_del(le);
        kfree(le2vma(le, list_link)); // kfree vma
ffffffffc020372e:	1501                	addi	a0,a0,-32
    prev->next = next;
ffffffffc0203730:	e71c                	sd	a5,8(a4)
    next->prev = prev;
ffffffffc0203732:	e398                	sd	a4,0(a5)
ffffffffc0203734:	d52fe0ef          	jal	ra,ffffffffc0201c86 <kfree>
    return listelm->next;
ffffffffc0203738:	6408                	ld	a0,8(s0)
    while ((le = list_next(list)) != list)
ffffffffc020373a:	fea418e3          	bne	s0,a0,ffffffffc020372a <mm_destroy+0x12>
    }
    kfree(mm); // kfree mm
ffffffffc020373e:	8522                	mv	a0,s0
    mm = NULL;
}
ffffffffc0203740:	6402                	ld	s0,0(sp)
ffffffffc0203742:	60a2                	ld	ra,8(sp)
ffffffffc0203744:	0141                	addi	sp,sp,16
    kfree(mm); // kfree mm
ffffffffc0203746:	d40fe06f          	j	ffffffffc0201c86 <kfree>
    assert(mm_count(mm) == 0);
ffffffffc020374a:	00004697          	auipc	a3,0x4
ffffffffc020374e:	b8e68693          	addi	a3,a3,-1138 # ffffffffc02072d8 <default_pmm_manager+0x818>
ffffffffc0203752:	00003617          	auipc	a2,0x3
ffffffffc0203756:	fbe60613          	addi	a2,a2,-66 # ffffffffc0206710 <commands+0x828>
ffffffffc020375a:	09e00593          	li	a1,158
ffffffffc020375e:	00004517          	auipc	a0,0x4
ffffffffc0203762:	b0a50513          	addi	a0,a0,-1270 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203766:	d2dfc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc020376a <mm_map>:

int mm_map(struct mm_struct *mm, uintptr_t addr, size_t len, uint32_t vm_flags,
           struct vma_struct **vma_store)
{
ffffffffc020376a:	7139                	addi	sp,sp,-64
ffffffffc020376c:	f822                	sd	s0,48(sp)
    uintptr_t start = ROUNDDOWN(addr, PGSIZE), end = ROUNDUP(addr + len, PGSIZE);
ffffffffc020376e:	6405                	lui	s0,0x1
ffffffffc0203770:	147d                	addi	s0,s0,-1
ffffffffc0203772:	77fd                	lui	a5,0xfffff
ffffffffc0203774:	9622                	add	a2,a2,s0
ffffffffc0203776:	962e                	add	a2,a2,a1
{
ffffffffc0203778:	f426                	sd	s1,40(sp)
ffffffffc020377a:	fc06                	sd	ra,56(sp)
    uintptr_t start = ROUNDDOWN(addr, PGSIZE), end = ROUNDUP(addr + len, PGSIZE);
ffffffffc020377c:	00f5f4b3          	and	s1,a1,a5
{
ffffffffc0203780:	f04a                	sd	s2,32(sp)
ffffffffc0203782:	ec4e                	sd	s3,24(sp)
ffffffffc0203784:	e852                	sd	s4,16(sp)
ffffffffc0203786:	e456                	sd	s5,8(sp)
    if (!USER_ACCESS(start, end))
ffffffffc0203788:	002005b7          	lui	a1,0x200
ffffffffc020378c:	00f67433          	and	s0,a2,a5
ffffffffc0203790:	06b4e363          	bltu	s1,a1,ffffffffc02037f6 <mm_map+0x8c>
ffffffffc0203794:	0684f163          	bgeu	s1,s0,ffffffffc02037f6 <mm_map+0x8c>
ffffffffc0203798:	4785                	li	a5,1
ffffffffc020379a:	07fe                	slli	a5,a5,0x1f
ffffffffc020379c:	0487ed63          	bltu	a5,s0,ffffffffc02037f6 <mm_map+0x8c>
ffffffffc02037a0:	89aa                	mv	s3,a0
    {
        return -E_INVAL;
    }

    assert(mm != NULL);
ffffffffc02037a2:	cd21                	beqz	a0,ffffffffc02037fa <mm_map+0x90>

    int ret = -E_INVAL;

    struct vma_struct *vma;
    if ((vma = find_vma(mm, start)) != NULL && end > vma->vm_start)
ffffffffc02037a4:	85a6                	mv	a1,s1
ffffffffc02037a6:	8ab6                	mv	s5,a3
ffffffffc02037a8:	8a3a                	mv	s4,a4
ffffffffc02037aa:	e5fff0ef          	jal	ra,ffffffffc0203608 <find_vma>
ffffffffc02037ae:	c501                	beqz	a0,ffffffffc02037b6 <mm_map+0x4c>
ffffffffc02037b0:	651c                	ld	a5,8(a0)
ffffffffc02037b2:	0487e263          	bltu	a5,s0,ffffffffc02037f6 <mm_map+0x8c>
    struct vma_struct *vma = kmalloc(sizeof(struct vma_struct));
ffffffffc02037b6:	03000513          	li	a0,48
ffffffffc02037ba:	c1cfe0ef          	jal	ra,ffffffffc0201bd6 <kmalloc>
ffffffffc02037be:	892a                	mv	s2,a0
    {
        goto out;
    }
    ret = -E_NO_MEM;
ffffffffc02037c0:	5571                	li	a0,-4
    if (vma != NULL)
ffffffffc02037c2:	02090163          	beqz	s2,ffffffffc02037e4 <mm_map+0x7a>

    if ((vma = vma_create(start, end, vm_flags)) == NULL)
    {
        goto out;
    }
    insert_vma_struct(mm, vma);
ffffffffc02037c6:	854e                	mv	a0,s3
        vma->vm_start = vm_start;
ffffffffc02037c8:	00993423          	sd	s1,8(s2)
        vma->vm_end = vm_end;
ffffffffc02037cc:	00893823          	sd	s0,16(s2)
        vma->vm_flags = vm_flags;
ffffffffc02037d0:	01592c23          	sw	s5,24(s2)
    insert_vma_struct(mm, vma);
ffffffffc02037d4:	85ca                	mv	a1,s2
ffffffffc02037d6:	e73ff0ef          	jal	ra,ffffffffc0203648 <insert_vma_struct>
    if (vma_store != NULL)
    {
        *vma_store = vma;
    }
    ret = 0;
ffffffffc02037da:	4501                	li	a0,0
    if (vma_store != NULL)
ffffffffc02037dc:	000a0463          	beqz	s4,ffffffffc02037e4 <mm_map+0x7a>
        *vma_store = vma;
ffffffffc02037e0:	012a3023          	sd	s2,0(s4) # 1000 <_binary_obj___user_faultread_out_size-0x8f30>

out:
    return ret;
}
ffffffffc02037e4:	70e2                	ld	ra,56(sp)
ffffffffc02037e6:	7442                	ld	s0,48(sp)
ffffffffc02037e8:	74a2                	ld	s1,40(sp)
ffffffffc02037ea:	7902                	ld	s2,32(sp)
ffffffffc02037ec:	69e2                	ld	s3,24(sp)
ffffffffc02037ee:	6a42                	ld	s4,16(sp)
ffffffffc02037f0:	6aa2                	ld	s5,8(sp)
ffffffffc02037f2:	6121                	addi	sp,sp,64
ffffffffc02037f4:	8082                	ret
        return -E_INVAL;
ffffffffc02037f6:	5575                	li	a0,-3
ffffffffc02037f8:	b7f5                	j	ffffffffc02037e4 <mm_map+0x7a>
    assert(mm != NULL);
ffffffffc02037fa:	00004697          	auipc	a3,0x4
ffffffffc02037fe:	af668693          	addi	a3,a3,-1290 # ffffffffc02072f0 <default_pmm_manager+0x830>
ffffffffc0203802:	00003617          	auipc	a2,0x3
ffffffffc0203806:	f0e60613          	addi	a2,a2,-242 # ffffffffc0206710 <commands+0x828>
ffffffffc020380a:	0b300593          	li	a1,179
ffffffffc020380e:	00004517          	auipc	a0,0x4
ffffffffc0203812:	a5a50513          	addi	a0,a0,-1446 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203816:	c7dfc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc020381a <dup_mmap>:

int dup_mmap(struct mm_struct *to, struct mm_struct *from)
{
ffffffffc020381a:	7139                	addi	sp,sp,-64
ffffffffc020381c:	fc06                	sd	ra,56(sp)
ffffffffc020381e:	f822                	sd	s0,48(sp)
ffffffffc0203820:	f426                	sd	s1,40(sp)
ffffffffc0203822:	f04a                	sd	s2,32(sp)
ffffffffc0203824:	ec4e                	sd	s3,24(sp)
ffffffffc0203826:	e852                	sd	s4,16(sp)
ffffffffc0203828:	e456                	sd	s5,8(sp)
    assert(to != NULL && from != NULL);
ffffffffc020382a:	c52d                	beqz	a0,ffffffffc0203894 <dup_mmap+0x7a>
ffffffffc020382c:	892a                	mv	s2,a0
ffffffffc020382e:	84ae                	mv	s1,a1
    list_entry_t *list = &(from->mmap_list), *le = list;
ffffffffc0203830:	842e                	mv	s0,a1
    assert(to != NULL && from != NULL);
ffffffffc0203832:	e595                	bnez	a1,ffffffffc020385e <dup_mmap+0x44>
ffffffffc0203834:	a085                	j	ffffffffc0203894 <dup_mmap+0x7a>
        if (nvma == NULL)
        {
            return -E_NO_MEM;
        }

        insert_vma_struct(to, nvma);
ffffffffc0203836:	854a                	mv	a0,s2
        vma->vm_start = vm_start;
ffffffffc0203838:	0155b423          	sd	s5,8(a1) # 200008 <_binary_obj___user_matrix_out_size+0x1f3908>
        vma->vm_end = vm_end;
ffffffffc020383c:	0145b823          	sd	s4,16(a1)
        vma->vm_flags = vm_flags;
ffffffffc0203840:	0135ac23          	sw	s3,24(a1)
        insert_vma_struct(to, nvma);
ffffffffc0203844:	e05ff0ef          	jal	ra,ffffffffc0203648 <insert_vma_struct>

        bool share = 0;
        if (copy_range(to->pgdir, from->pgdir, vma->vm_start, vma->vm_end, share) != 0)
ffffffffc0203848:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_obj___user_faultread_out_size-0x8f40>
ffffffffc020384c:	fe843603          	ld	a2,-24(s0)
ffffffffc0203850:	6c8c                	ld	a1,24(s1)
ffffffffc0203852:	01893503          	ld	a0,24(s2)
ffffffffc0203856:	4701                	li	a4,0
ffffffffc0203858:	a3bff0ef          	jal	ra,ffffffffc0203292 <copy_range>
ffffffffc020385c:	e105                	bnez	a0,ffffffffc020387c <dup_mmap+0x62>
    return listelm->prev;
ffffffffc020385e:	6000                	ld	s0,0(s0)
    while ((le = list_prev(le)) != list)
ffffffffc0203860:	02848863          	beq	s1,s0,ffffffffc0203890 <dup_mmap+0x76>
    struct vma_struct *vma = kmalloc(sizeof(struct vma_struct));
ffffffffc0203864:	03000513          	li	a0,48
        nvma = vma_create(vma->vm_start, vma->vm_end, vma->vm_flags);
ffffffffc0203868:	fe843a83          	ld	s5,-24(s0)
ffffffffc020386c:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203870:	ff842983          	lw	s3,-8(s0)
    struct vma_struct *vma = kmalloc(sizeof(struct vma_struct));
ffffffffc0203874:	b62fe0ef          	jal	ra,ffffffffc0201bd6 <kmalloc>
ffffffffc0203878:	85aa                	mv	a1,a0
    if (vma != NULL)
ffffffffc020387a:	fd55                	bnez	a0,ffffffffc0203836 <dup_mmap+0x1c>
            return -E_NO_MEM;
ffffffffc020387c:	5571                	li	a0,-4
        {
            return -E_NO_MEM;
        }
    }
    return 0;
}
ffffffffc020387e:	70e2                	ld	ra,56(sp)
ffffffffc0203880:	7442                	ld	s0,48(sp)
ffffffffc0203882:	74a2                	ld	s1,40(sp)
ffffffffc0203884:	7902                	ld	s2,32(sp)
ffffffffc0203886:	69e2                	ld	s3,24(sp)
ffffffffc0203888:	6a42                	ld	s4,16(sp)
ffffffffc020388a:	6aa2                	ld	s5,8(sp)
ffffffffc020388c:	6121                	addi	sp,sp,64
ffffffffc020388e:	8082                	ret
    return 0;
ffffffffc0203890:	4501                	li	a0,0
ffffffffc0203892:	b7f5                	j	ffffffffc020387e <dup_mmap+0x64>
    assert(to != NULL && from != NULL);
ffffffffc0203894:	00004697          	auipc	a3,0x4
ffffffffc0203898:	a6c68693          	addi	a3,a3,-1428 # ffffffffc0207300 <default_pmm_manager+0x840>
ffffffffc020389c:	00003617          	auipc	a2,0x3
ffffffffc02038a0:	e7460613          	addi	a2,a2,-396 # ffffffffc0206710 <commands+0x828>
ffffffffc02038a4:	0cf00593          	li	a1,207
ffffffffc02038a8:	00004517          	auipc	a0,0x4
ffffffffc02038ac:	9c050513          	addi	a0,a0,-1600 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc02038b0:	be3fc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02038b4 <exit_mmap>:

void exit_mmap(struct mm_struct *mm)
{
ffffffffc02038b4:	1101                	addi	sp,sp,-32
ffffffffc02038b6:	ec06                	sd	ra,24(sp)
ffffffffc02038b8:	e822                	sd	s0,16(sp)
ffffffffc02038ba:	e426                	sd	s1,8(sp)
ffffffffc02038bc:	e04a                	sd	s2,0(sp)
    assert(mm != NULL && mm_count(mm) == 0);
ffffffffc02038be:	c531                	beqz	a0,ffffffffc020390a <exit_mmap+0x56>
ffffffffc02038c0:	591c                	lw	a5,48(a0)
ffffffffc02038c2:	84aa                	mv	s1,a0
ffffffffc02038c4:	e3b9                	bnez	a5,ffffffffc020390a <exit_mmap+0x56>
    return listelm->next;
ffffffffc02038c6:	6500                	ld	s0,8(a0)
    pde_t *pgdir = mm->pgdir;
ffffffffc02038c8:	01853903          	ld	s2,24(a0)
    list_entry_t *list = &(mm->mmap_list), *le = list;
    while ((le = list_next(le)) != list)
ffffffffc02038cc:	02850663          	beq	a0,s0,ffffffffc02038f8 <exit_mmap+0x44>
    {
        struct vma_struct *vma = le2vma(le, list_link);
        unmap_range(pgdir, vma->vm_start, vma->vm_end);
ffffffffc02038d0:	ff043603          	ld	a2,-16(s0)
ffffffffc02038d4:	fe843583          	ld	a1,-24(s0)
ffffffffc02038d8:	854a                	mv	a0,s2
ffffffffc02038da:	80ffe0ef          	jal	ra,ffffffffc02020e8 <unmap_range>
ffffffffc02038de:	6400                	ld	s0,8(s0)
    while ((le = list_next(le)) != list)
ffffffffc02038e0:	fe8498e3          	bne	s1,s0,ffffffffc02038d0 <exit_mmap+0x1c>
ffffffffc02038e4:	6400                	ld	s0,8(s0)
    }
    while ((le = list_next(le)) != list)
ffffffffc02038e6:	00848c63          	beq	s1,s0,ffffffffc02038fe <exit_mmap+0x4a>
    {
        struct vma_struct *vma = le2vma(le, list_link);
        exit_range(pgdir, vma->vm_start, vma->vm_end);
ffffffffc02038ea:	ff043603          	ld	a2,-16(s0)
ffffffffc02038ee:	fe843583          	ld	a1,-24(s0)
ffffffffc02038f2:	854a                	mv	a0,s2
ffffffffc02038f4:	93bfe0ef          	jal	ra,ffffffffc020222e <exit_range>
ffffffffc02038f8:	6400                	ld	s0,8(s0)
    while ((le = list_next(le)) != list)
ffffffffc02038fa:	fe8498e3          	bne	s1,s0,ffffffffc02038ea <exit_mmap+0x36>
    }
}
ffffffffc02038fe:	60e2                	ld	ra,24(sp)
ffffffffc0203900:	6442                	ld	s0,16(sp)
ffffffffc0203902:	64a2                	ld	s1,8(sp)
ffffffffc0203904:	6902                	ld	s2,0(sp)
ffffffffc0203906:	6105                	addi	sp,sp,32
ffffffffc0203908:	8082                	ret
    assert(mm != NULL && mm_count(mm) == 0);
ffffffffc020390a:	00004697          	auipc	a3,0x4
ffffffffc020390e:	a1668693          	addi	a3,a3,-1514 # ffffffffc0207320 <default_pmm_manager+0x860>
ffffffffc0203912:	00003617          	auipc	a2,0x3
ffffffffc0203916:	dfe60613          	addi	a2,a2,-514 # ffffffffc0206710 <commands+0x828>
ffffffffc020391a:	0e800593          	li	a1,232
ffffffffc020391e:	00004517          	auipc	a0,0x4
ffffffffc0203922:	94a50513          	addi	a0,a0,-1718 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203926:	b6dfc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc020392a <vmm_init>:
}

// vmm_init - initialize virtual memory management
//          - now just call check_vmm to check correctness of vmm
void vmm_init(void)
{
ffffffffc020392a:	7139                	addi	sp,sp,-64
    struct mm_struct *mm = kmalloc(sizeof(struct mm_struct));
ffffffffc020392c:	04000513          	li	a0,64
{
ffffffffc0203930:	fc06                	sd	ra,56(sp)
ffffffffc0203932:	f822                	sd	s0,48(sp)
ffffffffc0203934:	f426                	sd	s1,40(sp)
ffffffffc0203936:	f04a                	sd	s2,32(sp)
ffffffffc0203938:	ec4e                	sd	s3,24(sp)
ffffffffc020393a:	e852                	sd	s4,16(sp)
ffffffffc020393c:	e456                	sd	s5,8(sp)
    struct mm_struct *mm = kmalloc(sizeof(struct mm_struct));
ffffffffc020393e:	a98fe0ef          	jal	ra,ffffffffc0201bd6 <kmalloc>
    if (mm != NULL)
ffffffffc0203942:	2e050663          	beqz	a0,ffffffffc0203c2e <vmm_init+0x304>
ffffffffc0203946:	84aa                	mv	s1,a0
    elm->prev = elm->next = elm;
ffffffffc0203948:	e508                	sd	a0,8(a0)
ffffffffc020394a:	e108                	sd	a0,0(a0)
        mm->mmap_cache = NULL;
ffffffffc020394c:	00053823          	sd	zero,16(a0)
        mm->pgdir = NULL;
ffffffffc0203950:	00053c23          	sd	zero,24(a0)
        mm->map_count = 0;
ffffffffc0203954:	02052023          	sw	zero,32(a0)
        mm->sm_priv = NULL;
ffffffffc0203958:	02053423          	sd	zero,40(a0)
ffffffffc020395c:	02052823          	sw	zero,48(a0)
ffffffffc0203960:	02053c23          	sd	zero,56(a0)
ffffffffc0203964:	03200413          	li	s0,50
ffffffffc0203968:	a811                	j	ffffffffc020397c <vmm_init+0x52>
        vma->vm_start = vm_start;
ffffffffc020396a:	e500                	sd	s0,8(a0)
        vma->vm_end = vm_end;
ffffffffc020396c:	e91c                	sd	a5,16(a0)
        vma->vm_flags = vm_flags;
ffffffffc020396e:	00052c23          	sw	zero,24(a0)
    assert(mm != NULL);

    int step1 = 10, step2 = step1 * 10;

    int i;
    for (i = step1; i >= 1; i--)
ffffffffc0203972:	146d                	addi	s0,s0,-5
    {
        struct vma_struct *vma = vma_create(i * 5, i * 5 + 2, 0);
        assert(vma != NULL);
        insert_vma_struct(mm, vma);
ffffffffc0203974:	8526                	mv	a0,s1
ffffffffc0203976:	cd3ff0ef          	jal	ra,ffffffffc0203648 <insert_vma_struct>
    for (i = step1; i >= 1; i--)
ffffffffc020397a:	c80d                	beqz	s0,ffffffffc02039ac <vmm_init+0x82>
    struct vma_struct *vma = kmalloc(sizeof(struct vma_struct));
ffffffffc020397c:	03000513          	li	a0,48
ffffffffc0203980:	a56fe0ef          	jal	ra,ffffffffc0201bd6 <kmalloc>
ffffffffc0203984:	85aa                	mv	a1,a0
ffffffffc0203986:	00240793          	addi	a5,s0,2
    if (vma != NULL)
ffffffffc020398a:	f165                	bnez	a0,ffffffffc020396a <vmm_init+0x40>
        assert(vma != NULL);
ffffffffc020398c:	00004697          	auipc	a3,0x4
ffffffffc0203990:	b2c68693          	addi	a3,a3,-1236 # ffffffffc02074b8 <default_pmm_manager+0x9f8>
ffffffffc0203994:	00003617          	auipc	a2,0x3
ffffffffc0203998:	d7c60613          	addi	a2,a2,-644 # ffffffffc0206710 <commands+0x828>
ffffffffc020399c:	12c00593          	li	a1,300
ffffffffc02039a0:	00004517          	auipc	a0,0x4
ffffffffc02039a4:	8c850513          	addi	a0,a0,-1848 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc02039a8:	aebfc0ef          	jal	ra,ffffffffc0200492 <__panic>
ffffffffc02039ac:	03700413          	li	s0,55
    }

    for (i = step1 + 1; i <= step2; i++)
ffffffffc02039b0:	1f900913          	li	s2,505
ffffffffc02039b4:	a819                	j	ffffffffc02039ca <vmm_init+0xa0>
        vma->vm_start = vm_start;
ffffffffc02039b6:	e500                	sd	s0,8(a0)
        vma->vm_end = vm_end;
ffffffffc02039b8:	e91c                	sd	a5,16(a0)
        vma->vm_flags = vm_flags;
ffffffffc02039ba:	00052c23          	sw	zero,24(a0)
    for (i = step1 + 1; i <= step2; i++)
ffffffffc02039be:	0415                	addi	s0,s0,5
    {
        struct vma_struct *vma = vma_create(i * 5, i * 5 + 2, 0);
        assert(vma != NULL);
        insert_vma_struct(mm, vma);
ffffffffc02039c0:	8526                	mv	a0,s1
ffffffffc02039c2:	c87ff0ef          	jal	ra,ffffffffc0203648 <insert_vma_struct>
    for (i = step1 + 1; i <= step2; i++)
ffffffffc02039c6:	03240a63          	beq	s0,s2,ffffffffc02039fa <vmm_init+0xd0>
    struct vma_struct *vma = kmalloc(sizeof(struct vma_struct));
ffffffffc02039ca:	03000513          	li	a0,48
ffffffffc02039ce:	a08fe0ef          	jal	ra,ffffffffc0201bd6 <kmalloc>
ffffffffc02039d2:	85aa                	mv	a1,a0
ffffffffc02039d4:	00240793          	addi	a5,s0,2
    if (vma != NULL)
ffffffffc02039d8:	fd79                	bnez	a0,ffffffffc02039b6 <vmm_init+0x8c>
        assert(vma != NULL);
ffffffffc02039da:	00004697          	auipc	a3,0x4
ffffffffc02039de:	ade68693          	addi	a3,a3,-1314 # ffffffffc02074b8 <default_pmm_manager+0x9f8>
ffffffffc02039e2:	00003617          	auipc	a2,0x3
ffffffffc02039e6:	d2e60613          	addi	a2,a2,-722 # ffffffffc0206710 <commands+0x828>
ffffffffc02039ea:	13300593          	li	a1,307
ffffffffc02039ee:	00004517          	auipc	a0,0x4
ffffffffc02039f2:	87a50513          	addi	a0,a0,-1926 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc02039f6:	a9dfc0ef          	jal	ra,ffffffffc0200492 <__panic>
    return listelm->next;
ffffffffc02039fa:	649c                	ld	a5,8(s1)
ffffffffc02039fc:	471d                	li	a4,7
    }

    list_entry_t *le = list_next(&(mm->mmap_list));

    for (i = 1; i <= step2; i++)
ffffffffc02039fe:	1fb00593          	li	a1,507
    {
        assert(le != &(mm->mmap_list));
ffffffffc0203a02:	16f48663          	beq	s1,a5,ffffffffc0203b6e <vmm_init+0x244>
        struct vma_struct *mmap = le2vma(le, list_link);
        assert(mmap->vm_start == i * 5 && mmap->vm_end == i * 5 + 2);
ffffffffc0203a06:	fe87b603          	ld	a2,-24(a5) # ffffffffffffefe8 <end+0x3fd384c0>
ffffffffc0203a0a:	ffe70693          	addi	a3,a4,-2
ffffffffc0203a0e:	10d61063          	bne	a2,a3,ffffffffc0203b0e <vmm_init+0x1e4>
ffffffffc0203a12:	ff07b683          	ld	a3,-16(a5)
ffffffffc0203a16:	0ed71c63          	bne	a4,a3,ffffffffc0203b0e <vmm_init+0x1e4>
    for (i = 1; i <= step2; i++)
ffffffffc0203a1a:	0715                	addi	a4,a4,5
ffffffffc0203a1c:	679c                	ld	a5,8(a5)
ffffffffc0203a1e:	feb712e3          	bne	a4,a1,ffffffffc0203a02 <vmm_init+0xd8>
ffffffffc0203a22:	4a1d                	li	s4,7
ffffffffc0203a24:	4415                	li	s0,5
        le = list_next(le);
    }

    for (i = 5; i <= 5 * step2; i += 5)
ffffffffc0203a26:	1f900a93          	li	s5,505
    {
        struct vma_struct *vma1 = find_vma(mm, i);
ffffffffc0203a2a:	85a2                	mv	a1,s0
ffffffffc0203a2c:	8526                	mv	a0,s1
ffffffffc0203a2e:	bdbff0ef          	jal	ra,ffffffffc0203608 <find_vma>
ffffffffc0203a32:	892a                	mv	s2,a0
        assert(vma1 != NULL);
ffffffffc0203a34:	16050d63          	beqz	a0,ffffffffc0203bae <vmm_init+0x284>
        struct vma_struct *vma2 = find_vma(mm, i + 1);
ffffffffc0203a38:	00140593          	addi	a1,s0,1
ffffffffc0203a3c:	8526                	mv	a0,s1
ffffffffc0203a3e:	bcbff0ef          	jal	ra,ffffffffc0203608 <find_vma>
ffffffffc0203a42:	89aa                	mv	s3,a0
        assert(vma2 != NULL);
ffffffffc0203a44:	14050563          	beqz	a0,ffffffffc0203b8e <vmm_init+0x264>
        struct vma_struct *vma3 = find_vma(mm, i + 2);
ffffffffc0203a48:	85d2                	mv	a1,s4
ffffffffc0203a4a:	8526                	mv	a0,s1
ffffffffc0203a4c:	bbdff0ef          	jal	ra,ffffffffc0203608 <find_vma>
        assert(vma3 == NULL);
ffffffffc0203a50:	16051f63          	bnez	a0,ffffffffc0203bce <vmm_init+0x2a4>
        struct vma_struct *vma4 = find_vma(mm, i + 3);
ffffffffc0203a54:	00340593          	addi	a1,s0,3
ffffffffc0203a58:	8526                	mv	a0,s1
ffffffffc0203a5a:	bafff0ef          	jal	ra,ffffffffc0203608 <find_vma>
        assert(vma4 == NULL);
ffffffffc0203a5e:	1a051863          	bnez	a0,ffffffffc0203c0e <vmm_init+0x2e4>
        struct vma_struct *vma5 = find_vma(mm, i + 4);
ffffffffc0203a62:	00440593          	addi	a1,s0,4
ffffffffc0203a66:	8526                	mv	a0,s1
ffffffffc0203a68:	ba1ff0ef          	jal	ra,ffffffffc0203608 <find_vma>
        assert(vma5 == NULL);
ffffffffc0203a6c:	18051163          	bnez	a0,ffffffffc0203bee <vmm_init+0x2c4>

        assert(vma1->vm_start == i && vma1->vm_end == i + 2);
ffffffffc0203a70:	00893783          	ld	a5,8(s2)
ffffffffc0203a74:	0a879d63          	bne	a5,s0,ffffffffc0203b2e <vmm_init+0x204>
ffffffffc0203a78:	01093783          	ld	a5,16(s2)
ffffffffc0203a7c:	0b479963          	bne	a5,s4,ffffffffc0203b2e <vmm_init+0x204>
        assert(vma2->vm_start == i && vma2->vm_end == i + 2);
ffffffffc0203a80:	0089b783          	ld	a5,8(s3)
ffffffffc0203a84:	0c879563          	bne	a5,s0,ffffffffc0203b4e <vmm_init+0x224>
ffffffffc0203a88:	0109b783          	ld	a5,16(s3)
ffffffffc0203a8c:	0d479163          	bne	a5,s4,ffffffffc0203b4e <vmm_init+0x224>
    for (i = 5; i <= 5 * step2; i += 5)
ffffffffc0203a90:	0415                	addi	s0,s0,5
ffffffffc0203a92:	0a15                	addi	s4,s4,5
ffffffffc0203a94:	f9541be3          	bne	s0,s5,ffffffffc0203a2a <vmm_init+0x100>
ffffffffc0203a98:	4411                	li	s0,4
    }

    for (i = 4; i >= 0; i--)
ffffffffc0203a9a:	597d                	li	s2,-1
    {
        struct vma_struct *vma_below_5 = find_vma(mm, i);
ffffffffc0203a9c:	85a2                	mv	a1,s0
ffffffffc0203a9e:	8526                	mv	a0,s1
ffffffffc0203aa0:	b69ff0ef          	jal	ra,ffffffffc0203608 <find_vma>
ffffffffc0203aa4:	0004059b          	sext.w	a1,s0
        if (vma_below_5 != NULL)
ffffffffc0203aa8:	c90d                	beqz	a0,ffffffffc0203ada <vmm_init+0x1b0>
        {
            cprintf("vma_below_5: i %x, start %x, end %x\n", i, vma_below_5->vm_start, vma_below_5->vm_end);
ffffffffc0203aaa:	6914                	ld	a3,16(a0)
ffffffffc0203aac:	6510                	ld	a2,8(a0)
ffffffffc0203aae:	00004517          	auipc	a0,0x4
ffffffffc0203ab2:	99250513          	addi	a0,a0,-1646 # ffffffffc0207440 <default_pmm_manager+0x980>
ffffffffc0203ab6:	ee2fc0ef          	jal	ra,ffffffffc0200198 <cprintf>
        }
        assert(vma_below_5 == NULL);
ffffffffc0203aba:	00004697          	auipc	a3,0x4
ffffffffc0203abe:	9ae68693          	addi	a3,a3,-1618 # ffffffffc0207468 <default_pmm_manager+0x9a8>
ffffffffc0203ac2:	00003617          	auipc	a2,0x3
ffffffffc0203ac6:	c4e60613          	addi	a2,a2,-946 # ffffffffc0206710 <commands+0x828>
ffffffffc0203aca:	15900593          	li	a1,345
ffffffffc0203ace:	00003517          	auipc	a0,0x3
ffffffffc0203ad2:	79a50513          	addi	a0,a0,1946 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203ad6:	9bdfc0ef          	jal	ra,ffffffffc0200492 <__panic>
    for (i = 4; i >= 0; i--)
ffffffffc0203ada:	147d                	addi	s0,s0,-1
ffffffffc0203adc:	fd2410e3          	bne	s0,s2,ffffffffc0203a9c <vmm_init+0x172>
    }

    mm_destroy(mm);
ffffffffc0203ae0:	8526                	mv	a0,s1
ffffffffc0203ae2:	c37ff0ef          	jal	ra,ffffffffc0203718 <mm_destroy>

    cprintf("check_vma_struct() succeeded!\n");
ffffffffc0203ae6:	00004517          	auipc	a0,0x4
ffffffffc0203aea:	99a50513          	addi	a0,a0,-1638 # ffffffffc0207480 <default_pmm_manager+0x9c0>
ffffffffc0203aee:	eaafc0ef          	jal	ra,ffffffffc0200198 <cprintf>
}
ffffffffc0203af2:	7442                	ld	s0,48(sp)
ffffffffc0203af4:	70e2                	ld	ra,56(sp)
ffffffffc0203af6:	74a2                	ld	s1,40(sp)
ffffffffc0203af8:	7902                	ld	s2,32(sp)
ffffffffc0203afa:	69e2                	ld	s3,24(sp)
ffffffffc0203afc:	6a42                	ld	s4,16(sp)
ffffffffc0203afe:	6aa2                	ld	s5,8(sp)
    cprintf("check_vmm() succeeded.\n");
ffffffffc0203b00:	00004517          	auipc	a0,0x4
ffffffffc0203b04:	9a050513          	addi	a0,a0,-1632 # ffffffffc02074a0 <default_pmm_manager+0x9e0>
}
ffffffffc0203b08:	6121                	addi	sp,sp,64
    cprintf("check_vmm() succeeded.\n");
ffffffffc0203b0a:	e8efc06f          	j	ffffffffc0200198 <cprintf>
        assert(mmap->vm_start == i * 5 && mmap->vm_end == i * 5 + 2);
ffffffffc0203b0e:	00004697          	auipc	a3,0x4
ffffffffc0203b12:	84a68693          	addi	a3,a3,-1974 # ffffffffc0207358 <default_pmm_manager+0x898>
ffffffffc0203b16:	00003617          	auipc	a2,0x3
ffffffffc0203b1a:	bfa60613          	addi	a2,a2,-1030 # ffffffffc0206710 <commands+0x828>
ffffffffc0203b1e:	13d00593          	li	a1,317
ffffffffc0203b22:	00003517          	auipc	a0,0x3
ffffffffc0203b26:	74650513          	addi	a0,a0,1862 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203b2a:	969fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        assert(vma1->vm_start == i && vma1->vm_end == i + 2);
ffffffffc0203b2e:	00004697          	auipc	a3,0x4
ffffffffc0203b32:	8b268693          	addi	a3,a3,-1870 # ffffffffc02073e0 <default_pmm_manager+0x920>
ffffffffc0203b36:	00003617          	auipc	a2,0x3
ffffffffc0203b3a:	bda60613          	addi	a2,a2,-1062 # ffffffffc0206710 <commands+0x828>
ffffffffc0203b3e:	14e00593          	li	a1,334
ffffffffc0203b42:	00003517          	auipc	a0,0x3
ffffffffc0203b46:	72650513          	addi	a0,a0,1830 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203b4a:	949fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        assert(vma2->vm_start == i && vma2->vm_end == i + 2);
ffffffffc0203b4e:	00004697          	auipc	a3,0x4
ffffffffc0203b52:	8c268693          	addi	a3,a3,-1854 # ffffffffc0207410 <default_pmm_manager+0x950>
ffffffffc0203b56:	00003617          	auipc	a2,0x3
ffffffffc0203b5a:	bba60613          	addi	a2,a2,-1094 # ffffffffc0206710 <commands+0x828>
ffffffffc0203b5e:	14f00593          	li	a1,335
ffffffffc0203b62:	00003517          	auipc	a0,0x3
ffffffffc0203b66:	70650513          	addi	a0,a0,1798 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203b6a:	929fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        assert(le != &(mm->mmap_list));
ffffffffc0203b6e:	00003697          	auipc	a3,0x3
ffffffffc0203b72:	7d268693          	addi	a3,a3,2002 # ffffffffc0207340 <default_pmm_manager+0x880>
ffffffffc0203b76:	00003617          	auipc	a2,0x3
ffffffffc0203b7a:	b9a60613          	addi	a2,a2,-1126 # ffffffffc0206710 <commands+0x828>
ffffffffc0203b7e:	13b00593          	li	a1,315
ffffffffc0203b82:	00003517          	auipc	a0,0x3
ffffffffc0203b86:	6e650513          	addi	a0,a0,1766 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203b8a:	909fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        assert(vma2 != NULL);
ffffffffc0203b8e:	00004697          	auipc	a3,0x4
ffffffffc0203b92:	81268693          	addi	a3,a3,-2030 # ffffffffc02073a0 <default_pmm_manager+0x8e0>
ffffffffc0203b96:	00003617          	auipc	a2,0x3
ffffffffc0203b9a:	b7a60613          	addi	a2,a2,-1158 # ffffffffc0206710 <commands+0x828>
ffffffffc0203b9e:	14600593          	li	a1,326
ffffffffc0203ba2:	00003517          	auipc	a0,0x3
ffffffffc0203ba6:	6c650513          	addi	a0,a0,1734 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203baa:	8e9fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        assert(vma1 != NULL);
ffffffffc0203bae:	00003697          	auipc	a3,0x3
ffffffffc0203bb2:	7e268693          	addi	a3,a3,2018 # ffffffffc0207390 <default_pmm_manager+0x8d0>
ffffffffc0203bb6:	00003617          	auipc	a2,0x3
ffffffffc0203bba:	b5a60613          	addi	a2,a2,-1190 # ffffffffc0206710 <commands+0x828>
ffffffffc0203bbe:	14400593          	li	a1,324
ffffffffc0203bc2:	00003517          	auipc	a0,0x3
ffffffffc0203bc6:	6a650513          	addi	a0,a0,1702 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203bca:	8c9fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        assert(vma3 == NULL);
ffffffffc0203bce:	00003697          	auipc	a3,0x3
ffffffffc0203bd2:	7e268693          	addi	a3,a3,2018 # ffffffffc02073b0 <default_pmm_manager+0x8f0>
ffffffffc0203bd6:	00003617          	auipc	a2,0x3
ffffffffc0203bda:	b3a60613          	addi	a2,a2,-1222 # ffffffffc0206710 <commands+0x828>
ffffffffc0203bde:	14800593          	li	a1,328
ffffffffc0203be2:	00003517          	auipc	a0,0x3
ffffffffc0203be6:	68650513          	addi	a0,a0,1670 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203bea:	8a9fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        assert(vma5 == NULL);
ffffffffc0203bee:	00003697          	auipc	a3,0x3
ffffffffc0203bf2:	7e268693          	addi	a3,a3,2018 # ffffffffc02073d0 <default_pmm_manager+0x910>
ffffffffc0203bf6:	00003617          	auipc	a2,0x3
ffffffffc0203bfa:	b1a60613          	addi	a2,a2,-1254 # ffffffffc0206710 <commands+0x828>
ffffffffc0203bfe:	14c00593          	li	a1,332
ffffffffc0203c02:	00003517          	auipc	a0,0x3
ffffffffc0203c06:	66650513          	addi	a0,a0,1638 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203c0a:	889fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        assert(vma4 == NULL);
ffffffffc0203c0e:	00003697          	auipc	a3,0x3
ffffffffc0203c12:	7b268693          	addi	a3,a3,1970 # ffffffffc02073c0 <default_pmm_manager+0x900>
ffffffffc0203c16:	00003617          	auipc	a2,0x3
ffffffffc0203c1a:	afa60613          	addi	a2,a2,-1286 # ffffffffc0206710 <commands+0x828>
ffffffffc0203c1e:	14a00593          	li	a1,330
ffffffffc0203c22:	00003517          	auipc	a0,0x3
ffffffffc0203c26:	64650513          	addi	a0,a0,1606 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203c2a:	869fc0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(mm != NULL);
ffffffffc0203c2e:	00003697          	auipc	a3,0x3
ffffffffc0203c32:	6c268693          	addi	a3,a3,1730 # ffffffffc02072f0 <default_pmm_manager+0x830>
ffffffffc0203c36:	00003617          	auipc	a2,0x3
ffffffffc0203c3a:	ada60613          	addi	a2,a2,-1318 # ffffffffc0206710 <commands+0x828>
ffffffffc0203c3e:	12400593          	li	a1,292
ffffffffc0203c42:	00003517          	auipc	a0,0x3
ffffffffc0203c46:	62650513          	addi	a0,a0,1574 # ffffffffc0207268 <default_pmm_manager+0x7a8>
ffffffffc0203c4a:	849fc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0203c4e <user_mem_check>:
}
bool user_mem_check(struct mm_struct *mm, uintptr_t addr, size_t len, bool write)
{
ffffffffc0203c4e:	7179                	addi	sp,sp,-48
ffffffffc0203c50:	f022                	sd	s0,32(sp)
ffffffffc0203c52:	f406                	sd	ra,40(sp)
ffffffffc0203c54:	ec26                	sd	s1,24(sp)
ffffffffc0203c56:	e84a                	sd	s2,16(sp)
ffffffffc0203c58:	e44e                	sd	s3,8(sp)
ffffffffc0203c5a:	e052                	sd	s4,0(sp)
ffffffffc0203c5c:	842e                	mv	s0,a1
    if (mm != NULL)
ffffffffc0203c5e:	c135                	beqz	a0,ffffffffc0203cc2 <user_mem_check+0x74>
    {
        if (!USER_ACCESS(addr, addr + len))
ffffffffc0203c60:	002007b7          	lui	a5,0x200
ffffffffc0203c64:	04f5e663          	bltu	a1,a5,ffffffffc0203cb0 <user_mem_check+0x62>
ffffffffc0203c68:	00c584b3          	add	s1,a1,a2
ffffffffc0203c6c:	0495f263          	bgeu	a1,s1,ffffffffc0203cb0 <user_mem_check+0x62>
ffffffffc0203c70:	4785                	li	a5,1
ffffffffc0203c72:	07fe                	slli	a5,a5,0x1f
ffffffffc0203c74:	0297ee63          	bltu	a5,s1,ffffffffc0203cb0 <user_mem_check+0x62>
ffffffffc0203c78:	892a                	mv	s2,a0
ffffffffc0203c7a:	89b6                	mv	s3,a3
            {
                return 0;
            }
            if (write && (vma->vm_flags & VM_STACK))
            {
                if (start < vma->vm_start + PGSIZE)
ffffffffc0203c7c:	6a05                	lui	s4,0x1
ffffffffc0203c7e:	a821                	j	ffffffffc0203c96 <user_mem_check+0x48>
            if (!(vma->vm_flags & ((write) ? VM_WRITE : VM_READ)))
ffffffffc0203c80:	0027f693          	andi	a3,a5,2
                if (start < vma->vm_start + PGSIZE)
ffffffffc0203c84:	9752                	add	a4,a4,s4
            if (write && (vma->vm_flags & VM_STACK))
ffffffffc0203c86:	8ba1                	andi	a5,a5,8
            if (!(vma->vm_flags & ((write) ? VM_WRITE : VM_READ)))
ffffffffc0203c88:	c685                	beqz	a3,ffffffffc0203cb0 <user_mem_check+0x62>
            if (write && (vma->vm_flags & VM_STACK))
ffffffffc0203c8a:	c399                	beqz	a5,ffffffffc0203c90 <user_mem_check+0x42>
                if (start < vma->vm_start + PGSIZE)
ffffffffc0203c8c:	02e46263          	bltu	s0,a4,ffffffffc0203cb0 <user_mem_check+0x62>
                { // check stack start & size
                    return 0;
                }
            }
            start = vma->vm_end;
ffffffffc0203c90:	6900                	ld	s0,16(a0)
        while (start < end)
ffffffffc0203c92:	04947663          	bgeu	s0,s1,ffffffffc0203cde <user_mem_check+0x90>
            if ((vma = find_vma(mm, start)) == NULL || start < vma->vm_start)
ffffffffc0203c96:	85a2                	mv	a1,s0
ffffffffc0203c98:	854a                	mv	a0,s2
ffffffffc0203c9a:	96fff0ef          	jal	ra,ffffffffc0203608 <find_vma>
ffffffffc0203c9e:	c909                	beqz	a0,ffffffffc0203cb0 <user_mem_check+0x62>
ffffffffc0203ca0:	6518                	ld	a4,8(a0)
ffffffffc0203ca2:	00e46763          	bltu	s0,a4,ffffffffc0203cb0 <user_mem_check+0x62>
            if (!(vma->vm_flags & ((write) ? VM_WRITE : VM_READ)))
ffffffffc0203ca6:	4d1c                	lw	a5,24(a0)
ffffffffc0203ca8:	fc099ce3          	bnez	s3,ffffffffc0203c80 <user_mem_check+0x32>
ffffffffc0203cac:	8b85                	andi	a5,a5,1
ffffffffc0203cae:	f3ed                	bnez	a5,ffffffffc0203c90 <user_mem_check+0x42>
            return 0;
ffffffffc0203cb0:	4501                	li	a0,0
        }
        return 1;
    }
    return KERN_ACCESS(addr, addr + len);
}
ffffffffc0203cb2:	70a2                	ld	ra,40(sp)
ffffffffc0203cb4:	7402                	ld	s0,32(sp)
ffffffffc0203cb6:	64e2                	ld	s1,24(sp)
ffffffffc0203cb8:	6942                	ld	s2,16(sp)
ffffffffc0203cba:	69a2                	ld	s3,8(sp)
ffffffffc0203cbc:	6a02                	ld	s4,0(sp)
ffffffffc0203cbe:	6145                	addi	sp,sp,48
ffffffffc0203cc0:	8082                	ret
    return KERN_ACCESS(addr, addr + len);
ffffffffc0203cc2:	c02007b7          	lui	a5,0xc0200
ffffffffc0203cc6:	4501                	li	a0,0
ffffffffc0203cc8:	fef5e5e3          	bltu	a1,a5,ffffffffc0203cb2 <user_mem_check+0x64>
ffffffffc0203ccc:	962e                	add	a2,a2,a1
ffffffffc0203cce:	fec5f2e3          	bgeu	a1,a2,ffffffffc0203cb2 <user_mem_check+0x64>
ffffffffc0203cd2:	c8000537          	lui	a0,0xc8000
ffffffffc0203cd6:	0505                	addi	a0,a0,1
ffffffffc0203cd8:	00a63533          	sltu	a0,a2,a0
ffffffffc0203cdc:	bfd9                	j	ffffffffc0203cb2 <user_mem_check+0x64>
        return 1;
ffffffffc0203cde:	4505                	li	a0,1
ffffffffc0203ce0:	bfc9                	j	ffffffffc0203cb2 <user_mem_check+0x64>

ffffffffc0203ce2 <kernel_thread_entry>:
.text
.globl kernel_thread_entry
kernel_thread_entry:        # void kernel_thread(void)
	move a0, s1
ffffffffc0203ce2:	8526                	mv	a0,s1
	jalr s0
ffffffffc0203ce4:	9402                	jalr	s0

	jal do_exit
ffffffffc0203ce6:	5de000ef          	jal	ra,ffffffffc02042c4 <do_exit>

ffffffffc0203cea <alloc_proc>:
void switch_to(struct context *from, struct context *to);

// alloc_proc - alloc a proc_struct and init all fields of proc_struct
static struct proc_struct *
alloc_proc(void)
{
ffffffffc0203cea:	1141                	addi	sp,sp,-16
    struct proc_struct *proc = kmalloc(sizeof(struct proc_struct));
ffffffffc0203cec:	14800513          	li	a0,328
{
ffffffffc0203cf0:	e022                	sd	s0,0(sp)
ffffffffc0203cf2:	e406                	sd	ra,8(sp)
    struct proc_struct *proc = kmalloc(sizeof(struct proc_struct));
ffffffffc0203cf4:	ee3fd0ef          	jal	ra,ffffffffc0201bd6 <kmalloc>
ffffffffc0203cf8:	842a                	mv	s0,a0
    if (proc != NULL)
ffffffffc0203cfa:	cd35                	beqz	a0,ffffffffc0203d76 <alloc_proc+0x8c>
         *       struct trapframe *tf;                       // Trap frame for current interrupt
         *       uintptr_t pgdir;                            // the base addr of Page Directroy Table(PDT)
         *       uint32_t flags;                             // Process flag
         *       char name[PROC_NAME_LEN + 1];               // Process name
         */
        proc->state = PROC_UNINIT;                          // 设置进程状态为未初始化
ffffffffc0203cfc:	57fd                	li	a5,-1
ffffffffc0203cfe:	1782                	slli	a5,a5,0x20
ffffffffc0203d00:	e11c                	sd	a5,0(a0)
        proc->runs = 0;                                     // 运行次数初始化为0
        proc->kstack = 0;                                   // 内核栈地址初始化为0
        proc->need_resched = 0;                             // 不需要调度
        proc->parent = NULL;                                // 父进程指针初始化为NULL
        proc->mm = NULL;                                    // 内存管理结构初始化为NULL
        memset(&(proc->context), 0, sizeof(struct context));// 初始化上下文为0
ffffffffc0203d02:	07000613          	li	a2,112
ffffffffc0203d06:	4581                	li	a1,0
        proc->runs = 0;                                     // 运行次数初始化为0
ffffffffc0203d08:	00052423          	sw	zero,8(a0) # ffffffffc8000008 <end+0x7d394e0>
        proc->kstack = 0;                                   // 内核栈地址初始化为0
ffffffffc0203d0c:	00053823          	sd	zero,16(a0)
        proc->need_resched = 0;                             // 不需要调度
ffffffffc0203d10:	00053c23          	sd	zero,24(a0)
        proc->parent = NULL;                                // 父进程指针初始化为NULL
ffffffffc0203d14:	02053023          	sd	zero,32(a0)
        proc->mm = NULL;                                    // 内存管理结构初始化为NULL
ffffffffc0203d18:	02053423          	sd	zero,40(a0)
        memset(&(proc->context), 0, sizeof(struct context));// 初始化上下文为0
ffffffffc0203d1c:	03050513          	addi	a0,a0,48
ffffffffc0203d20:	733010ef          	jal	ra,ffffffffc0205c52 <memset>
        proc->tf = NULL;                                    // 中断帧指针初始化为NULL
        proc->pgdir = boot_pgdir_pa;                        // 页目录表基址设置为内核页目录表
ffffffffc0203d24:	000c3797          	auipc	a5,0xc3
ffffffffc0203d28:	da47b783          	ld	a5,-604(a5) # ffffffffc02c6ac8 <boot_pgdir_pa>
        proc->flags = 0;                                    // 进程标志初始化为0
        memset(proc->name, 0, PROC_NAME_LEN + 1);           // 进程名初始化为空字符串
ffffffffc0203d2c:	4641                	li	a2,16
ffffffffc0203d2e:	4581                	li	a1,0
        proc->pgdir = boot_pgdir_pa;                        // 页目录表基址设置为内核页目录表
ffffffffc0203d30:	f45c                	sd	a5,168(s0)
        proc->tf = NULL;                                    // 中断帧指针初始化为NULL
ffffffffc0203d32:	0a043023          	sd	zero,160(s0)
        proc->flags = 0;                                    // 进程标志初始化为0
ffffffffc0203d36:	0a042823          	sw	zero,176(s0)
        memset(proc->name, 0, PROC_NAME_LEN + 1);           // 进程名初始化为空字符串
ffffffffc0203d3a:	0b440513          	addi	a0,s0,180
ffffffffc0203d3e:	715010ef          	jal	ra,ffffffffc0205c52 <memset>
         *       skew_heap_entry_t lab6_run_pool;            // entry in the run pool (lab6 stride)
         *       uint32_t lab6_stride;                       // stride value (lab6 stride)
         *       uint32_t lab6_priority;                     // priority value (lab6 stride)
         */
        proc->rq = NULL;                                    // 运行队列指针初始化为NULL
        list_init(&(proc->run_link));                       // 初始化运行队列链表节点
ffffffffc0203d42:	11040793          	addi	a5,s0,272
        proc->wait_state = 0;                               // 等待状态初始化为0
ffffffffc0203d46:	0e042623          	sw	zero,236(s0)
        proc->cptr = proc->yptr = proc->optr = NULL;        // 进程关系指针初始化为NULL
ffffffffc0203d4a:	10043023          	sd	zero,256(s0)
ffffffffc0203d4e:	0e043c23          	sd	zero,248(s0)
ffffffffc0203d52:	0e043823          	sd	zero,240(s0)
        proc->rq = NULL;                                    // 运行队列指针初始化为NULL
ffffffffc0203d56:	10043423          	sd	zero,264(s0)
    elm->prev = elm->next = elm;
ffffffffc0203d5a:	10f43c23          	sd	a5,280(s0)
ffffffffc0203d5e:	10f43823          	sd	a5,272(s0)
        proc->time_slice = 0;                               // 时间片初始化为0
ffffffffc0203d62:	12042023          	sw	zero,288(s0)
        // skew_heap_entry_t 初始化（假设为0或使用特定初始化）
        memset(&(proc->lab6_run_pool), 0, sizeof(skew_heap_entry_t)); // 运行池条目初始化为0
ffffffffc0203d66:	4661                	li	a2,24
ffffffffc0203d68:	4581                	li	a1,0
ffffffffc0203d6a:	12840513          	addi	a0,s0,296
ffffffffc0203d6e:	6e5010ef          	jal	ra,ffffffffc0205c52 <memset>
        proc->lab6_stride = 0;                              // 步长值初始化为0
ffffffffc0203d72:	14043023          	sd	zero,320(s0)
        proc->lab6_priority = 0;                            // 优先级初始化为0
    }
    return proc;
}
ffffffffc0203d76:	60a2                	ld	ra,8(sp)
ffffffffc0203d78:	8522                	mv	a0,s0
ffffffffc0203d7a:	6402                	ld	s0,0(sp)
ffffffffc0203d7c:	0141                	addi	sp,sp,16
ffffffffc0203d7e:	8082                	ret

ffffffffc0203d80 <forkret>:
// NOTE: the addr of forkret is setted in copy_thread function
//       after switch_to, the current proc will execute here.
static void
forkret(void)
{
    forkrets(current->tf);
ffffffffc0203d80:	000c3797          	auipc	a5,0xc3
ffffffffc0203d84:	d787b783          	ld	a5,-648(a5) # ffffffffc02c6af8 <current>
ffffffffc0203d88:	73c8                	ld	a0,160(a5)
ffffffffc0203d8a:	968fd06f          	j	ffffffffc0200ef2 <forkrets>

ffffffffc0203d8e <put_pgdir>:
    return pa2page(PADDR(kva));
ffffffffc0203d8e:	6d14                	ld	a3,24(a0)
}

// put_pgdir - free the memory space of PDT
static void
put_pgdir(struct mm_struct *mm)
{
ffffffffc0203d90:	1141                	addi	sp,sp,-16
ffffffffc0203d92:	e406                	sd	ra,8(sp)
ffffffffc0203d94:	c02007b7          	lui	a5,0xc0200
ffffffffc0203d98:	02f6ee63          	bltu	a3,a5,ffffffffc0203dd4 <put_pgdir+0x46>
ffffffffc0203d9c:	000c3517          	auipc	a0,0xc3
ffffffffc0203da0:	d5453503          	ld	a0,-684(a0) # ffffffffc02c6af0 <va_pa_offset>
ffffffffc0203da4:	8e89                	sub	a3,a3,a0
    if (PPN(pa) >= npage)
ffffffffc0203da6:	82b1                	srli	a3,a3,0xc
ffffffffc0203da8:	000c3797          	auipc	a5,0xc3
ffffffffc0203dac:	d307b783          	ld	a5,-720(a5) # ffffffffc02c6ad8 <npage>
ffffffffc0203db0:	02f6fe63          	bgeu	a3,a5,ffffffffc0203dec <put_pgdir+0x5e>
    return &pages[PPN(pa) - nbase];
ffffffffc0203db4:	00004517          	auipc	a0,0x4
ffffffffc0203db8:	76c53503          	ld	a0,1900(a0) # ffffffffc0208520 <nbase>
    free_page(kva2page(mm->pgdir));
}
ffffffffc0203dbc:	60a2                	ld	ra,8(sp)
ffffffffc0203dbe:	8e89                	sub	a3,a3,a0
ffffffffc0203dc0:	069a                	slli	a3,a3,0x6
    free_page(kva2page(mm->pgdir));
ffffffffc0203dc2:	000c3517          	auipc	a0,0xc3
ffffffffc0203dc6:	d1e53503          	ld	a0,-738(a0) # ffffffffc02c6ae0 <pages>
ffffffffc0203dca:	4585                	li	a1,1
ffffffffc0203dcc:	9536                	add	a0,a0,a3
}
ffffffffc0203dce:	0141                	addi	sp,sp,16
    free_page(kva2page(mm->pgdir));
ffffffffc0203dd0:	822fe06f          	j	ffffffffc0201df2 <free_pages>
    return pa2page(PADDR(kva));
ffffffffc0203dd4:	00003617          	auipc	a2,0x3
ffffffffc0203dd8:	dcc60613          	addi	a2,a2,-564 # ffffffffc0206ba0 <default_pmm_manager+0xe0>
ffffffffc0203ddc:	07700593          	li	a1,119
ffffffffc0203de0:	00003517          	auipc	a0,0x3
ffffffffc0203de4:	d4050513          	addi	a0,a0,-704 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc0203de8:	eaafc0ef          	jal	ra,ffffffffc0200492 <__panic>
        panic("pa2page called with invalid pa");
ffffffffc0203dec:	00003617          	auipc	a2,0x3
ffffffffc0203df0:	ddc60613          	addi	a2,a2,-548 # ffffffffc0206bc8 <default_pmm_manager+0x108>
ffffffffc0203df4:	06900593          	li	a1,105
ffffffffc0203df8:	00003517          	auipc	a0,0x3
ffffffffc0203dfc:	d2850513          	addi	a0,a0,-728 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc0203e00:	e92fc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0203e04 <proc_run>:
{
ffffffffc0203e04:	7179                	addi	sp,sp,-48
ffffffffc0203e06:	ec4a                	sd	s2,24(sp)
    if (proc != current)
ffffffffc0203e08:	000c3917          	auipc	s2,0xc3
ffffffffc0203e0c:	cf090913          	addi	s2,s2,-784 # ffffffffc02c6af8 <current>
{
ffffffffc0203e10:	f026                	sd	s1,32(sp)
    if (proc != current)
ffffffffc0203e12:	00093483          	ld	s1,0(s2)
{
ffffffffc0203e16:	f406                	sd	ra,40(sp)
ffffffffc0203e18:	e84e                	sd	s3,16(sp)
    if (proc != current)
ffffffffc0203e1a:	02a48863          	beq	s1,a0,ffffffffc0203e4a <proc_run+0x46>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203e1e:	100027f3          	csrr	a5,sstatus
ffffffffc0203e22:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc0203e24:	4981                	li	s3,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203e26:	ef9d                	bnez	a5,ffffffffc0203e64 <proc_run+0x60>
#define barrier() __asm__ __volatile__("fence" ::: "memory")

static inline void
lsatp(unsigned long pgdir)
{
  write_csr(satp, 0x8000000000000000 | (pgdir >> RISCV_PGSHIFT));
ffffffffc0203e28:	755c                	ld	a5,168(a0)
ffffffffc0203e2a:	577d                	li	a4,-1
ffffffffc0203e2c:	177e                	slli	a4,a4,0x3f
ffffffffc0203e2e:	83b1                	srli	a5,a5,0xc
            current = proc;                         // 切换当前进程为要运行的进程
ffffffffc0203e30:	00a93023          	sd	a0,0(s2)
ffffffffc0203e34:	8fd9                	or	a5,a5,a4
ffffffffc0203e36:	18079073          	csrw	satp,a5
            switch_to(&(prev->context), &(next->context)); // 实现上下文切换
ffffffffc0203e3a:	03050593          	addi	a1,a0,48
ffffffffc0203e3e:	03048513          	addi	a0,s1,48
ffffffffc0203e42:	122010ef          	jal	ra,ffffffffc0204f64 <switch_to>
    if (flag)
ffffffffc0203e46:	00099863          	bnez	s3,ffffffffc0203e56 <proc_run+0x52>
}
ffffffffc0203e4a:	70a2                	ld	ra,40(sp)
ffffffffc0203e4c:	7482                	ld	s1,32(sp)
ffffffffc0203e4e:	6962                	ld	s2,24(sp)
ffffffffc0203e50:	69c2                	ld	s3,16(sp)
ffffffffc0203e52:	6145                	addi	sp,sp,48
ffffffffc0203e54:	8082                	ret
ffffffffc0203e56:	70a2                	ld	ra,40(sp)
ffffffffc0203e58:	7482                	ld	s1,32(sp)
ffffffffc0203e5a:	6962                	ld	s2,24(sp)
ffffffffc0203e5c:	69c2                	ld	s3,16(sp)
ffffffffc0203e5e:	6145                	addi	sp,sp,48
        intr_enable();
ffffffffc0203e60:	b49fc06f          	j	ffffffffc02009a8 <intr_enable>
ffffffffc0203e64:	e42a                	sd	a0,8(sp)
        intr_disable();
ffffffffc0203e66:	b49fc0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        return 1;
ffffffffc0203e6a:	6522                	ld	a0,8(sp)
ffffffffc0203e6c:	4985                	li	s3,1
ffffffffc0203e6e:	bf6d                	j	ffffffffc0203e28 <proc_run+0x24>

ffffffffc0203e70 <do_fork>:
 * @clone_flags: used to guide how to clone the child process
 * @stack:       the parent's user stack pointer. if stack==0, It means to fork a kernel thread.
 * @tf:          the trapframe info, which will be copied to child process's proc->tf
 */
int do_fork(uint32_t clone_flags, uintptr_t stack, struct trapframe *tf)
{
ffffffffc0203e70:	7119                	addi	sp,sp,-128
ffffffffc0203e72:	f0ca                	sd	s2,96(sp)
    int ret = -E_NO_FREE_PROC;
    struct proc_struct *proc;
    if (nr_process >= MAX_PROCESS)
ffffffffc0203e74:	000c3917          	auipc	s2,0xc3
ffffffffc0203e78:	c9c90913          	addi	s2,s2,-868 # ffffffffc02c6b10 <nr_process>
ffffffffc0203e7c:	00092703          	lw	a4,0(s2)
{
ffffffffc0203e80:	fc86                	sd	ra,120(sp)
ffffffffc0203e82:	f8a2                	sd	s0,112(sp)
ffffffffc0203e84:	f4a6                	sd	s1,104(sp)
ffffffffc0203e86:	ecce                	sd	s3,88(sp)
ffffffffc0203e88:	e8d2                	sd	s4,80(sp)
ffffffffc0203e8a:	e4d6                	sd	s5,72(sp)
ffffffffc0203e8c:	e0da                	sd	s6,64(sp)
ffffffffc0203e8e:	fc5e                	sd	s7,56(sp)
ffffffffc0203e90:	f862                	sd	s8,48(sp)
ffffffffc0203e92:	f466                	sd	s9,40(sp)
ffffffffc0203e94:	f06a                	sd	s10,32(sp)
ffffffffc0203e96:	ec6e                	sd	s11,24(sp)
    if (nr_process >= MAX_PROCESS)
ffffffffc0203e98:	6785                	lui	a5,0x1
ffffffffc0203e9a:	32f75b63          	bge	a4,a5,ffffffffc02041d0 <do_fork+0x360>
ffffffffc0203e9e:	8a2a                	mv	s4,a0
ffffffffc0203ea0:	89ae                	mv	s3,a1
ffffffffc0203ea2:	8432                	mv	s0,a2
     *    -------------------
     *    update step 1: set child proc's parent to current process, make sure current process's wait_state is 0
     *    update step 5: insert proc_struct into hash_list && proc_list, set the relation links of process
     */
    // 1. 调用 alloc_proc 分配一个进程控制块
    if ((proc = alloc_proc()) == NULL) {
ffffffffc0203ea4:	e47ff0ef          	jal	ra,ffffffffc0203cea <alloc_proc>
ffffffffc0203ea8:	84aa                	mv	s1,a0
ffffffffc0203eaa:	30050463          	beqz	a0,ffffffffc02041b2 <do_fork+0x342>
        goto fork_out;
    }
    proc->parent = current;
ffffffffc0203eae:	000c3c17          	auipc	s8,0xc3
ffffffffc0203eb2:	c4ac0c13          	addi	s8,s8,-950 # ffffffffc02c6af8 <current>
ffffffffc0203eb6:	000c3783          	ld	a5,0(s8)
    assert(current->wait_state == 0);
ffffffffc0203eba:	0ec7a703          	lw	a4,236(a5) # 10ec <_binary_obj___user_faultread_out_size-0x8e44>
    proc->parent = current;
ffffffffc0203ebe:	f11c                	sd	a5,32(a0)
    assert(current->wait_state == 0);
ffffffffc0203ec0:	30071d63          	bnez	a4,ffffffffc02041da <do_fork+0x36a>
    struct Page *page = alloc_pages(KSTACKPAGE);
ffffffffc0203ec4:	4509                	li	a0,2
ffffffffc0203ec6:	eeffd0ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
    if (page != NULL)
ffffffffc0203eca:	2e050163          	beqz	a0,ffffffffc02041ac <do_fork+0x33c>
    return page - pages + nbase;
ffffffffc0203ece:	000c3a97          	auipc	s5,0xc3
ffffffffc0203ed2:	c12a8a93          	addi	s5,s5,-1006 # ffffffffc02c6ae0 <pages>
ffffffffc0203ed6:	000ab683          	ld	a3,0(s5)
ffffffffc0203eda:	00004b17          	auipc	s6,0x4
ffffffffc0203ede:	646b0b13          	addi	s6,s6,1606 # ffffffffc0208520 <nbase>
ffffffffc0203ee2:	000b3783          	ld	a5,0(s6)
ffffffffc0203ee6:	40d506b3          	sub	a3,a0,a3
    return KADDR(page2pa(page));
ffffffffc0203eea:	000c3b97          	auipc	s7,0xc3
ffffffffc0203eee:	beeb8b93          	addi	s7,s7,-1042 # ffffffffc02c6ad8 <npage>
    return page - pages + nbase;
ffffffffc0203ef2:	8699                	srai	a3,a3,0x6
    return KADDR(page2pa(page));
ffffffffc0203ef4:	5dfd                	li	s11,-1
ffffffffc0203ef6:	000bb703          	ld	a4,0(s7)
    return page - pages + nbase;
ffffffffc0203efa:	96be                	add	a3,a3,a5
    return KADDR(page2pa(page));
ffffffffc0203efc:	00cddd93          	srli	s11,s11,0xc
ffffffffc0203f00:	01b6f633          	and	a2,a3,s11
    return page2ppn(page) << PGSHIFT;
ffffffffc0203f04:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0203f06:	2ee67a63          	bgeu	a2,a4,ffffffffc02041fa <do_fork+0x38a>
    struct mm_struct *mm, *oldmm = current->mm;
ffffffffc0203f0a:	000c3603          	ld	a2,0(s8)
ffffffffc0203f0e:	000c3c17          	auipc	s8,0xc3
ffffffffc0203f12:	be2c0c13          	addi	s8,s8,-1054 # ffffffffc02c6af0 <va_pa_offset>
ffffffffc0203f16:	000c3703          	ld	a4,0(s8)
ffffffffc0203f1a:	02863d03          	ld	s10,40(a2)
ffffffffc0203f1e:	e43e                	sd	a5,8(sp)
ffffffffc0203f20:	96ba                	add	a3,a3,a4
        proc->kstack = (uintptr_t)page2kva(page);
ffffffffc0203f22:	e894                	sd	a3,16(s1)
    if (oldmm == NULL)
ffffffffc0203f24:	020d0863          	beqz	s10,ffffffffc0203f54 <do_fork+0xe4>
    if (clone_flags & CLONE_VM)
ffffffffc0203f28:	100a7a13          	andi	s4,s4,256
ffffffffc0203f2c:	1c0a0163          	beqz	s4,ffffffffc02040ee <do_fork+0x27e>
}

static inline int
mm_count_inc(struct mm_struct *mm)
{
    mm->mm_count += 1;
ffffffffc0203f30:	030d2703          	lw	a4,48(s10)
    proc->pgdir = PADDR(mm->pgdir);
ffffffffc0203f34:	018d3783          	ld	a5,24(s10)
ffffffffc0203f38:	c02006b7          	lui	a3,0xc0200
ffffffffc0203f3c:	2705                	addiw	a4,a4,1
ffffffffc0203f3e:	02ed2823          	sw	a4,48(s10)
    proc->mm = mm;
ffffffffc0203f42:	03a4b423          	sd	s10,40(s1)
    proc->pgdir = PADDR(mm->pgdir);
ffffffffc0203f46:	2ed7e263          	bltu	a5,a3,ffffffffc020422a <do_fork+0x3ba>
ffffffffc0203f4a:	000c3703          	ld	a4,0(s8)
    proc->tf = (struct trapframe *)(proc->kstack + KSTACKSIZE) - 1;
ffffffffc0203f4e:	6894                	ld	a3,16(s1)
    proc->pgdir = PADDR(mm->pgdir);
ffffffffc0203f50:	8f99                	sub	a5,a5,a4
ffffffffc0203f52:	f4dc                	sd	a5,168(s1)
    proc->tf = (struct trapframe *)(proc->kstack + KSTACKSIZE) - 1;
ffffffffc0203f54:	6789                	lui	a5,0x2
ffffffffc0203f56:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_obj___user_faultread_out_size-0x8050>
ffffffffc0203f5a:	96be                	add	a3,a3,a5
    *(proc->tf) = *tf;
ffffffffc0203f5c:	8622                	mv	a2,s0
    proc->tf = (struct trapframe *)(proc->kstack + KSTACKSIZE) - 1;
ffffffffc0203f5e:	f0d4                	sd	a3,160(s1)
    *(proc->tf) = *tf;
ffffffffc0203f60:	87b6                	mv	a5,a3
ffffffffc0203f62:	12040893          	addi	a7,s0,288
ffffffffc0203f66:	00063803          	ld	a6,0(a2)
ffffffffc0203f6a:	6608                	ld	a0,8(a2)
ffffffffc0203f6c:	6a0c                	ld	a1,16(a2)
ffffffffc0203f6e:	6e18                	ld	a4,24(a2)
ffffffffc0203f70:	0107b023          	sd	a6,0(a5)
ffffffffc0203f74:	e788                	sd	a0,8(a5)
ffffffffc0203f76:	eb8c                	sd	a1,16(a5)
ffffffffc0203f78:	ef98                	sd	a4,24(a5)
ffffffffc0203f7a:	02060613          	addi	a2,a2,32
ffffffffc0203f7e:	02078793          	addi	a5,a5,32
ffffffffc0203f82:	ff1612e3          	bne	a2,a7,ffffffffc0203f66 <do_fork+0xf6>
    proc->tf->gpr.a0 = 0;
ffffffffc0203f86:	0406b823          	sd	zero,80(a3) # ffffffffc0200050 <kern_init+0x6>
    proc->tf->gpr.sp = (esp == 0) ? (uintptr_t)proc->tf : esp;
ffffffffc0203f8a:	12098f63          	beqz	s3,ffffffffc02040c8 <do_fork+0x258>
ffffffffc0203f8e:	0136b823          	sd	s3,16(a3)
    proc->context.ra = (uintptr_t)forkret;
ffffffffc0203f92:	00000797          	auipc	a5,0x0
ffffffffc0203f96:	dee78793          	addi	a5,a5,-530 # ffffffffc0203d80 <forkret>
ffffffffc0203f9a:	f89c                	sd	a5,48(s1)
    proc->context.sp = (uintptr_t)(proc->tf);
ffffffffc0203f9c:	fc94                	sd	a3,56(s1)
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203f9e:	100027f3          	csrr	a5,sstatus
ffffffffc0203fa2:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc0203fa4:	4981                	li	s3,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0203fa6:	14079063          	bnez	a5,ffffffffc02040e6 <do_fork+0x276>
    if (++last_pid >= MAX_PID)
ffffffffc0203faa:	000be817          	auipc	a6,0xbe
ffffffffc0203fae:	69680813          	addi	a6,a6,1686 # ffffffffc02c2640 <last_pid.1>
ffffffffc0203fb2:	00082783          	lw	a5,0(a6)
ffffffffc0203fb6:	6709                	lui	a4,0x2
ffffffffc0203fb8:	0017851b          	addiw	a0,a5,1
ffffffffc0203fbc:	00a82023          	sw	a0,0(a6)
ffffffffc0203fc0:	08e55d63          	bge	a0,a4,ffffffffc020405a <do_fork+0x1ea>
    if (last_pid >= next_safe)
ffffffffc0203fc4:	000be317          	auipc	t1,0xbe
ffffffffc0203fc8:	68030313          	addi	t1,t1,1664 # ffffffffc02c2644 <next_safe.0>
ffffffffc0203fcc:	00032783          	lw	a5,0(t1)
ffffffffc0203fd0:	000c3417          	auipc	s0,0xc3
ffffffffc0203fd4:	a9040413          	addi	s0,s0,-1392 # ffffffffc02c6a60 <proc_list>
ffffffffc0203fd8:	08f55963          	bge	a0,a5,ffffffffc020406a <do_fork+0x1fa>

    // 5. 将新进程添加到进程列表和哈希表中，并设置进程关系
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        proc->pid = get_pid();
ffffffffc0203fdc:	c0c8                	sw	a0,4(s1)
    list_add(hash_list + pid_hashfn(proc->pid), &(proc->hash_link));
ffffffffc0203fde:	45a9                	li	a1,10
ffffffffc0203fe0:	2501                	sext.w	a0,a0
ffffffffc0203fe2:	7ca010ef          	jal	ra,ffffffffc02057ac <hash32>
ffffffffc0203fe6:	02051793          	slli	a5,a0,0x20
ffffffffc0203fea:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0203fee:	000bf797          	auipc	a5,0xbf
ffffffffc0203ff2:	a7278793          	addi	a5,a5,-1422 # ffffffffc02c2a60 <hash_list>
ffffffffc0203ff6:	953e                	add	a0,a0,a5
    __list_add(elm, listelm, listelm->next);
ffffffffc0203ff8:	650c                	ld	a1,8(a0)
    if ((proc->optr = proc->parent->cptr) != NULL)
ffffffffc0203ffa:	7094                	ld	a3,32(s1)
    list_add(hash_list + pid_hashfn(proc->pid), &(proc->hash_link));
ffffffffc0203ffc:	0d848793          	addi	a5,s1,216
    prev->next = next->prev = elm;
ffffffffc0204000:	e19c                	sd	a5,0(a1)
    __list_add(elm, listelm, listelm->next);
ffffffffc0204002:	6410                	ld	a2,8(s0)
    prev->next = next->prev = elm;
ffffffffc0204004:	e51c                	sd	a5,8(a0)
    if ((proc->optr = proc->parent->cptr) != NULL)
ffffffffc0204006:	7af8                	ld	a4,240(a3)
    list_add(&proc_list, &(proc->list_link));
ffffffffc0204008:	0c848793          	addi	a5,s1,200
    elm->next = next;
ffffffffc020400c:	f0ec                	sd	a1,224(s1)
    elm->prev = prev;
ffffffffc020400e:	ece8                	sd	a0,216(s1)
    prev->next = next->prev = elm;
ffffffffc0204010:	e21c                	sd	a5,0(a2)
ffffffffc0204012:	e41c                	sd	a5,8(s0)
    elm->next = next;
ffffffffc0204014:	e8f0                	sd	a2,208(s1)
    elm->prev = prev;
ffffffffc0204016:	e4e0                	sd	s0,200(s1)
    proc->yptr = NULL;
ffffffffc0204018:	0e04bc23          	sd	zero,248(s1)
    if ((proc->optr = proc->parent->cptr) != NULL)
ffffffffc020401c:	10e4b023          	sd	a4,256(s1)
ffffffffc0204020:	c311                	beqz	a4,ffffffffc0204024 <do_fork+0x1b4>
        proc->optr->yptr = proc;
ffffffffc0204022:	ff64                	sd	s1,248(a4)
    nr_process++;
ffffffffc0204024:	00092783          	lw	a5,0(s2)
    proc->parent->cptr = proc;
ffffffffc0204028:	fae4                	sd	s1,240(a3)
    nr_process++;
ffffffffc020402a:	2785                	addiw	a5,a5,1
ffffffffc020402c:	00f92023          	sw	a5,0(s2)
    if (flag)
ffffffffc0204030:	18099363          	bnez	s3,ffffffffc02041b6 <do_fork+0x346>
        set_links(proc);  // LAB5: 使用set_links代替手动list_add
    }
    local_intr_restore(intr_flag);

    // 6. 调用 wakeup_proc 使新进程处于就绪状态
    wakeup_proc(proc);
ffffffffc0204034:	8526                	mv	a0,s1
ffffffffc0204036:	504010ef          	jal	ra,ffffffffc020553a <wakeup_proc>

    // 7. 返回新进程的 PID
    ret = proc->pid;
ffffffffc020403a:	40c8                	lw	a0,4(s1)
bad_fork_cleanup_kstack:
    put_kstack(proc);
bad_fork_cleanup_proc:
    kfree(proc);
    goto fork_out;
}
ffffffffc020403c:	70e6                	ld	ra,120(sp)
ffffffffc020403e:	7446                	ld	s0,112(sp)
ffffffffc0204040:	74a6                	ld	s1,104(sp)
ffffffffc0204042:	7906                	ld	s2,96(sp)
ffffffffc0204044:	69e6                	ld	s3,88(sp)
ffffffffc0204046:	6a46                	ld	s4,80(sp)
ffffffffc0204048:	6aa6                	ld	s5,72(sp)
ffffffffc020404a:	6b06                	ld	s6,64(sp)
ffffffffc020404c:	7be2                	ld	s7,56(sp)
ffffffffc020404e:	7c42                	ld	s8,48(sp)
ffffffffc0204050:	7ca2                	ld	s9,40(sp)
ffffffffc0204052:	7d02                	ld	s10,32(sp)
ffffffffc0204054:	6de2                	ld	s11,24(sp)
ffffffffc0204056:	6109                	addi	sp,sp,128
ffffffffc0204058:	8082                	ret
        last_pid = 1;
ffffffffc020405a:	4785                	li	a5,1
ffffffffc020405c:	00f82023          	sw	a5,0(a6)
        goto inside;
ffffffffc0204060:	4505                	li	a0,1
ffffffffc0204062:	000be317          	auipc	t1,0xbe
ffffffffc0204066:	5e230313          	addi	t1,t1,1506 # ffffffffc02c2644 <next_safe.0>
    return listelm->next;
ffffffffc020406a:	000c3417          	auipc	s0,0xc3
ffffffffc020406e:	9f640413          	addi	s0,s0,-1546 # ffffffffc02c6a60 <proc_list>
ffffffffc0204072:	00843e03          	ld	t3,8(s0)
        next_safe = MAX_PID;
ffffffffc0204076:	6789                	lui	a5,0x2
ffffffffc0204078:	00f32023          	sw	a5,0(t1)
ffffffffc020407c:	86aa                	mv	a3,a0
ffffffffc020407e:	4581                	li	a1,0
        while ((le = list_next(le)) != list)
ffffffffc0204080:	6e89                	lui	t4,0x2
ffffffffc0204082:	148e0263          	beq	t3,s0,ffffffffc02041c6 <do_fork+0x356>
ffffffffc0204086:	88ae                	mv	a7,a1
ffffffffc0204088:	87f2                	mv	a5,t3
ffffffffc020408a:	6609                	lui	a2,0x2
ffffffffc020408c:	a811                	j	ffffffffc02040a0 <do_fork+0x230>
            else if (proc->pid > last_pid && next_safe > proc->pid)
ffffffffc020408e:	00e6d663          	bge	a3,a4,ffffffffc020409a <do_fork+0x22a>
ffffffffc0204092:	00c75463          	bge	a4,a2,ffffffffc020409a <do_fork+0x22a>
ffffffffc0204096:	863a                	mv	a2,a4
ffffffffc0204098:	4885                	li	a7,1
ffffffffc020409a:	679c                	ld	a5,8(a5)
        while ((le = list_next(le)) != list)
ffffffffc020409c:	00878d63          	beq	a5,s0,ffffffffc02040b6 <do_fork+0x246>
            if (proc->pid == last_pid)
ffffffffc02040a0:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_obj___user_faultread_out_size-0x7ff4>
ffffffffc02040a4:	fed715e3          	bne	a4,a3,ffffffffc020408e <do_fork+0x21e>
                if (++last_pid >= next_safe)
ffffffffc02040a8:	2685                	addiw	a3,a3,1
ffffffffc02040aa:	10c6d963          	bge	a3,a2,ffffffffc02041bc <do_fork+0x34c>
ffffffffc02040ae:	679c                	ld	a5,8(a5)
ffffffffc02040b0:	4585                	li	a1,1
        while ((le = list_next(le)) != list)
ffffffffc02040b2:	fe8797e3          	bne	a5,s0,ffffffffc02040a0 <do_fork+0x230>
ffffffffc02040b6:	c581                	beqz	a1,ffffffffc02040be <do_fork+0x24e>
ffffffffc02040b8:	00d82023          	sw	a3,0(a6)
ffffffffc02040bc:	8536                	mv	a0,a3
ffffffffc02040be:	f0088fe3          	beqz	a7,ffffffffc0203fdc <do_fork+0x16c>
ffffffffc02040c2:	00c32023          	sw	a2,0(t1)
ffffffffc02040c6:	bf19                	j	ffffffffc0203fdc <do_fork+0x16c>
    proc->tf->gpr.sp = (esp == 0) ? (uintptr_t)proc->tf : esp;
ffffffffc02040c8:	89b6                	mv	s3,a3
ffffffffc02040ca:	0136b823          	sd	s3,16(a3)
    proc->context.ra = (uintptr_t)forkret;
ffffffffc02040ce:	00000797          	auipc	a5,0x0
ffffffffc02040d2:	cb278793          	addi	a5,a5,-846 # ffffffffc0203d80 <forkret>
ffffffffc02040d6:	f89c                	sd	a5,48(s1)
    proc->context.sp = (uintptr_t)(proc->tf);
ffffffffc02040d8:	fc94                	sd	a3,56(s1)
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02040da:	100027f3          	csrr	a5,sstatus
ffffffffc02040de:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc02040e0:	4981                	li	s3,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02040e2:	ec0784e3          	beqz	a5,ffffffffc0203faa <do_fork+0x13a>
        intr_disable();
ffffffffc02040e6:	8c9fc0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        return 1;
ffffffffc02040ea:	4985                	li	s3,1
ffffffffc02040ec:	bd7d                	j	ffffffffc0203faa <do_fork+0x13a>
    if ((mm = mm_create()) == NULL)
ffffffffc02040ee:	ceaff0ef          	jal	ra,ffffffffc02035d8 <mm_create>
ffffffffc02040f2:	8caa                	mv	s9,a0
ffffffffc02040f4:	c541                	beqz	a0,ffffffffc020417c <do_fork+0x30c>
    if ((page = alloc_page()) == NULL)
ffffffffc02040f6:	4505                	li	a0,1
ffffffffc02040f8:	cbdfd0ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc02040fc:	cd2d                	beqz	a0,ffffffffc0204176 <do_fork+0x306>
    return page - pages + nbase;
ffffffffc02040fe:	000ab683          	ld	a3,0(s5)
ffffffffc0204102:	67a2                	ld	a5,8(sp)
    return KADDR(page2pa(page));
ffffffffc0204104:	000bb703          	ld	a4,0(s7)
    return page - pages + nbase;
ffffffffc0204108:	40d506b3          	sub	a3,a0,a3
ffffffffc020410c:	8699                	srai	a3,a3,0x6
ffffffffc020410e:	96be                	add	a3,a3,a5
    return KADDR(page2pa(page));
ffffffffc0204110:	01b6fdb3          	and	s11,a3,s11
    return page2ppn(page) << PGSHIFT;
ffffffffc0204114:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0204116:	0eedf263          	bgeu	s11,a4,ffffffffc02041fa <do_fork+0x38a>
ffffffffc020411a:	000c3a03          	ld	s4,0(s8)
    memcpy(pgdir, boot_pgdir_va, PGSIZE);
ffffffffc020411e:	6605                	lui	a2,0x1
ffffffffc0204120:	000c3597          	auipc	a1,0xc3
ffffffffc0204124:	9b05b583          	ld	a1,-1616(a1) # ffffffffc02c6ad0 <boot_pgdir_va>
ffffffffc0204128:	9a36                	add	s4,s4,a3
ffffffffc020412a:	8552                	mv	a0,s4
ffffffffc020412c:	339010ef          	jal	ra,ffffffffc0205c64 <memcpy>
static inline void
lock_mm(struct mm_struct *mm)
{
    if (mm != NULL)
    {
        lock(&(mm->mm_lock));
ffffffffc0204130:	038d0d93          	addi	s11,s10,56
    mm->pgdir = pgdir;
ffffffffc0204134:	014cbc23          	sd	s4,24(s9)
 * test_and_set_bit - Atomically set a bit and return its old value
 * @nr:     the bit to set
 * @addr:   the address to count from
 * */
static inline bool test_and_set_bit(int nr, volatile void *addr) {
    return __test_and_op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc0204138:	4785                	li	a5,1
ffffffffc020413a:	40fdb7af          	amoor.d	a5,a5,(s11)
}

static inline void
lock(lock_t *lock)
{
    while (!try_lock(lock))
ffffffffc020413e:	8b85                	andi	a5,a5,1
ffffffffc0204140:	4a05                	li	s4,1
ffffffffc0204142:	c799                	beqz	a5,ffffffffc0204150 <do_fork+0x2e0>
    {
        schedule();
ffffffffc0204144:	4a8010ef          	jal	ra,ffffffffc02055ec <schedule>
ffffffffc0204148:	414db7af          	amoor.d	a5,s4,(s11)
    while (!try_lock(lock))
ffffffffc020414c:	8b85                	andi	a5,a5,1
ffffffffc020414e:	fbfd                	bnez	a5,ffffffffc0204144 <do_fork+0x2d4>
        ret = dup_mmap(mm, oldmm);
ffffffffc0204150:	85ea                	mv	a1,s10
ffffffffc0204152:	8566                	mv	a0,s9
ffffffffc0204154:	ec6ff0ef          	jal	ra,ffffffffc020381a <dup_mmap>
 * test_and_clear_bit - Atomically clear a bit and return its old value
 * @nr:     the bit to clear
 * @addr:   the address to count from
 * */
static inline bool test_and_clear_bit(int nr, volatile void *addr) {
    return __test_and_op_bit(and, __NOT, nr, ((volatile unsigned long *)addr));
ffffffffc0204158:	57f9                	li	a5,-2
ffffffffc020415a:	60fdb7af          	amoand.d	a5,a5,(s11)
ffffffffc020415e:	8b85                	andi	a5,a5,1
}

static inline void
unlock(lock_t *lock)
{
    if (!test_and_clear_bit(0, lock))
ffffffffc0204160:	0e078e63          	beqz	a5,ffffffffc020425c <do_fork+0x3ec>
good_mm:
ffffffffc0204164:	8d66                	mv	s10,s9
    if (ret != 0)
ffffffffc0204166:	dc0505e3          	beqz	a0,ffffffffc0203f30 <do_fork+0xc0>
    exit_mmap(mm);
ffffffffc020416a:	8566                	mv	a0,s9
ffffffffc020416c:	f48ff0ef          	jal	ra,ffffffffc02038b4 <exit_mmap>
    put_pgdir(mm);
ffffffffc0204170:	8566                	mv	a0,s9
ffffffffc0204172:	c1dff0ef          	jal	ra,ffffffffc0203d8e <put_pgdir>
    mm_destroy(mm);
ffffffffc0204176:	8566                	mv	a0,s9
ffffffffc0204178:	da0ff0ef          	jal	ra,ffffffffc0203718 <mm_destroy>
    free_pages(kva2page((void *)(proc->kstack)), KSTACKPAGE);
ffffffffc020417c:	6894                	ld	a3,16(s1)
    return pa2page(PADDR(kva));
ffffffffc020417e:	c02007b7          	lui	a5,0xc0200
ffffffffc0204182:	0cf6e163          	bltu	a3,a5,ffffffffc0204244 <do_fork+0x3d4>
ffffffffc0204186:	000c3783          	ld	a5,0(s8)
    if (PPN(pa) >= npage)
ffffffffc020418a:	000bb703          	ld	a4,0(s7)
    return pa2page(PADDR(kva));
ffffffffc020418e:	40f687b3          	sub	a5,a3,a5
    if (PPN(pa) >= npage)
ffffffffc0204192:	83b1                	srli	a5,a5,0xc
ffffffffc0204194:	06e7ff63          	bgeu	a5,a4,ffffffffc0204212 <do_fork+0x3a2>
    return &pages[PPN(pa) - nbase];
ffffffffc0204198:	000b3703          	ld	a4,0(s6)
ffffffffc020419c:	000ab503          	ld	a0,0(s5)
ffffffffc02041a0:	4589                	li	a1,2
ffffffffc02041a2:	8f99                	sub	a5,a5,a4
ffffffffc02041a4:	079a                	slli	a5,a5,0x6
ffffffffc02041a6:	953e                	add	a0,a0,a5
ffffffffc02041a8:	c4bfd0ef          	jal	ra,ffffffffc0201df2 <free_pages>
    kfree(proc);
ffffffffc02041ac:	8526                	mv	a0,s1
ffffffffc02041ae:	ad9fd0ef          	jal	ra,ffffffffc0201c86 <kfree>
    ret = -E_NO_MEM;
ffffffffc02041b2:	5571                	li	a0,-4
    return ret;
ffffffffc02041b4:	b561                	j	ffffffffc020403c <do_fork+0x1cc>
        intr_enable();
ffffffffc02041b6:	ff2fc0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc02041ba:	bdad                	j	ffffffffc0204034 <do_fork+0x1c4>
                    if (last_pid >= MAX_PID)
ffffffffc02041bc:	01d6c363          	blt	a3,t4,ffffffffc02041c2 <do_fork+0x352>
                        last_pid = 1;
ffffffffc02041c0:	4685                	li	a3,1
                    goto repeat;
ffffffffc02041c2:	4585                	li	a1,1
ffffffffc02041c4:	bd7d                	j	ffffffffc0204082 <do_fork+0x212>
ffffffffc02041c6:	c599                	beqz	a1,ffffffffc02041d4 <do_fork+0x364>
ffffffffc02041c8:	00d82023          	sw	a3,0(a6)
    return last_pid;
ffffffffc02041cc:	8536                	mv	a0,a3
ffffffffc02041ce:	b539                	j	ffffffffc0203fdc <do_fork+0x16c>
    int ret = -E_NO_FREE_PROC;
ffffffffc02041d0:	556d                	li	a0,-5
ffffffffc02041d2:	b5ad                	j	ffffffffc020403c <do_fork+0x1cc>
    return last_pid;
ffffffffc02041d4:	00082503          	lw	a0,0(a6)
ffffffffc02041d8:	b511                	j	ffffffffc0203fdc <do_fork+0x16c>
    assert(current->wait_state == 0);
ffffffffc02041da:	00003697          	auipc	a3,0x3
ffffffffc02041de:	2ee68693          	addi	a3,a3,750 # ffffffffc02074c8 <default_pmm_manager+0xa08>
ffffffffc02041e2:	00002617          	auipc	a2,0x2
ffffffffc02041e6:	52e60613          	addi	a2,a2,1326 # ffffffffc0206710 <commands+0x828>
ffffffffc02041ea:	1e800593          	li	a1,488
ffffffffc02041ee:	00003517          	auipc	a0,0x3
ffffffffc02041f2:	2fa50513          	addi	a0,a0,762 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc02041f6:	a9cfc0ef          	jal	ra,ffffffffc0200492 <__panic>
    return KADDR(page2pa(page));
ffffffffc02041fa:	00003617          	auipc	a2,0x3
ffffffffc02041fe:	8fe60613          	addi	a2,a2,-1794 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc0204202:	07100593          	li	a1,113
ffffffffc0204206:	00003517          	auipc	a0,0x3
ffffffffc020420a:	91a50513          	addi	a0,a0,-1766 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc020420e:	a84fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        panic("pa2page called with invalid pa");
ffffffffc0204212:	00003617          	auipc	a2,0x3
ffffffffc0204216:	9b660613          	addi	a2,a2,-1610 # ffffffffc0206bc8 <default_pmm_manager+0x108>
ffffffffc020421a:	06900593          	li	a1,105
ffffffffc020421e:	00003517          	auipc	a0,0x3
ffffffffc0204222:	90250513          	addi	a0,a0,-1790 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc0204226:	a6cfc0ef          	jal	ra,ffffffffc0200492 <__panic>
    proc->pgdir = PADDR(mm->pgdir);
ffffffffc020422a:	86be                	mv	a3,a5
ffffffffc020422c:	00003617          	auipc	a2,0x3
ffffffffc0204230:	97460613          	addi	a2,a2,-1676 # ffffffffc0206ba0 <default_pmm_manager+0xe0>
ffffffffc0204234:	19900593          	li	a1,409
ffffffffc0204238:	00003517          	auipc	a0,0x3
ffffffffc020423c:	2b050513          	addi	a0,a0,688 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204240:	a52fc0ef          	jal	ra,ffffffffc0200492 <__panic>
    return pa2page(PADDR(kva));
ffffffffc0204244:	00003617          	auipc	a2,0x3
ffffffffc0204248:	95c60613          	addi	a2,a2,-1700 # ffffffffc0206ba0 <default_pmm_manager+0xe0>
ffffffffc020424c:	07700593          	li	a1,119
ffffffffc0204250:	00003517          	auipc	a0,0x3
ffffffffc0204254:	8d050513          	addi	a0,a0,-1840 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc0204258:	a3afc0ef          	jal	ra,ffffffffc0200492 <__panic>
    {
        panic("Unlock failed.\n");
ffffffffc020425c:	00003617          	auipc	a2,0x3
ffffffffc0204260:	2a460613          	addi	a2,a2,676 # ffffffffc0207500 <default_pmm_manager+0xa40>
ffffffffc0204264:	04000593          	li	a1,64
ffffffffc0204268:	00003517          	auipc	a0,0x3
ffffffffc020426c:	2a850513          	addi	a0,a0,680 # ffffffffc0207510 <default_pmm_manager+0xa50>
ffffffffc0204270:	a22fc0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0204274 <kernel_thread>:
{
ffffffffc0204274:	7129                	addi	sp,sp,-320
ffffffffc0204276:	fa22                	sd	s0,304(sp)
ffffffffc0204278:	f626                	sd	s1,296(sp)
ffffffffc020427a:	f24a                	sd	s2,288(sp)
ffffffffc020427c:	84ae                	mv	s1,a1
ffffffffc020427e:	892a                	mv	s2,a0
ffffffffc0204280:	8432                	mv	s0,a2
    memset(&tf, 0, sizeof(struct trapframe));
ffffffffc0204282:	4581                	li	a1,0
ffffffffc0204284:	12000613          	li	a2,288
ffffffffc0204288:	850a                	mv	a0,sp
{
ffffffffc020428a:	fe06                	sd	ra,312(sp)
    memset(&tf, 0, sizeof(struct trapframe));
ffffffffc020428c:	1c7010ef          	jal	ra,ffffffffc0205c52 <memset>
    tf.gpr.s0 = (uintptr_t)fn;
ffffffffc0204290:	e0ca                	sd	s2,64(sp)
    tf.gpr.s1 = (uintptr_t)arg;
ffffffffc0204292:	e4a6                	sd	s1,72(sp)
    tf.status = (read_csr(sstatus) | SSTATUS_SPP | SSTATUS_SPIE) & ~SSTATUS_SIE;
ffffffffc0204294:	100027f3          	csrr	a5,sstatus
ffffffffc0204298:	edd7f793          	andi	a5,a5,-291
ffffffffc020429c:	1207e793          	ori	a5,a5,288
ffffffffc02042a0:	e23e                	sd	a5,256(sp)
    return do_fork(clone_flags | CLONE_VM, 0, &tf);
ffffffffc02042a2:	860a                	mv	a2,sp
ffffffffc02042a4:	10046513          	ori	a0,s0,256
    tf.epc = (uintptr_t)kernel_thread_entry;
ffffffffc02042a8:	00000797          	auipc	a5,0x0
ffffffffc02042ac:	a3a78793          	addi	a5,a5,-1478 # ffffffffc0203ce2 <kernel_thread_entry>
    return do_fork(clone_flags | CLONE_VM, 0, &tf);
ffffffffc02042b0:	4581                	li	a1,0
    tf.epc = (uintptr_t)kernel_thread_entry;
ffffffffc02042b2:	e63e                	sd	a5,264(sp)
    return do_fork(clone_flags | CLONE_VM, 0, &tf);
ffffffffc02042b4:	bbdff0ef          	jal	ra,ffffffffc0203e70 <do_fork>
}
ffffffffc02042b8:	70f2                	ld	ra,312(sp)
ffffffffc02042ba:	7452                	ld	s0,304(sp)
ffffffffc02042bc:	74b2                	ld	s1,296(sp)
ffffffffc02042be:	7912                	ld	s2,288(sp)
ffffffffc02042c0:	6131                	addi	sp,sp,320
ffffffffc02042c2:	8082                	ret

ffffffffc02042c4 <do_exit>:
// do_exit - called by sys_exit
//   1. call exit_mmap & put_pgdir & mm_destroy to free the almost all memory space of process
//   2. set process' state as PROC_ZOMBIE, then call wakeup_proc(parent) to ask parent reclaim itself.
//   3. call scheduler to switch to other process
int do_exit(int error_code)
{
ffffffffc02042c4:	7179                	addi	sp,sp,-48
ffffffffc02042c6:	f022                	sd	s0,32(sp)
    if (current == idleproc)
ffffffffc02042c8:	000c3417          	auipc	s0,0xc3
ffffffffc02042cc:	83040413          	addi	s0,s0,-2000 # ffffffffc02c6af8 <current>
ffffffffc02042d0:	601c                	ld	a5,0(s0)
{
ffffffffc02042d2:	f406                	sd	ra,40(sp)
ffffffffc02042d4:	ec26                	sd	s1,24(sp)
ffffffffc02042d6:	e84a                	sd	s2,16(sp)
ffffffffc02042d8:	e44e                	sd	s3,8(sp)
ffffffffc02042da:	e052                	sd	s4,0(sp)
    if (current == idleproc)
ffffffffc02042dc:	000c3717          	auipc	a4,0xc3
ffffffffc02042e0:	82473703          	ld	a4,-2012(a4) # ffffffffc02c6b00 <idleproc>
ffffffffc02042e4:	0ce78c63          	beq	a5,a4,ffffffffc02043bc <do_exit+0xf8>
    {
        panic("idleproc exit.\n");
    }
    if (current == initproc)
ffffffffc02042e8:	000c3497          	auipc	s1,0xc3
ffffffffc02042ec:	82048493          	addi	s1,s1,-2016 # ffffffffc02c6b08 <initproc>
ffffffffc02042f0:	6098                	ld	a4,0(s1)
ffffffffc02042f2:	0ee78b63          	beq	a5,a4,ffffffffc02043e8 <do_exit+0x124>
    {
        panic("initproc exit.\n");
    }
    struct mm_struct *mm = current->mm;
ffffffffc02042f6:	0287b983          	ld	s3,40(a5)
ffffffffc02042fa:	892a                	mv	s2,a0
    if (mm != NULL)
ffffffffc02042fc:	02098663          	beqz	s3,ffffffffc0204328 <do_exit+0x64>
ffffffffc0204300:	000c2797          	auipc	a5,0xc2
ffffffffc0204304:	7c87b783          	ld	a5,1992(a5) # ffffffffc02c6ac8 <boot_pgdir_pa>
ffffffffc0204308:	577d                	li	a4,-1
ffffffffc020430a:	177e                	slli	a4,a4,0x3f
ffffffffc020430c:	83b1                	srli	a5,a5,0xc
ffffffffc020430e:	8fd9                	or	a5,a5,a4
ffffffffc0204310:	18079073          	csrw	satp,a5
    mm->mm_count -= 1;
ffffffffc0204314:	0309a783          	lw	a5,48(s3)
ffffffffc0204318:	fff7871b          	addiw	a4,a5,-1
ffffffffc020431c:	02e9a823          	sw	a4,48(s3)
    {
        lsatp(boot_pgdir_pa);
        if (mm_count_dec(mm) == 0)
ffffffffc0204320:	cb55                	beqz	a4,ffffffffc02043d4 <do_exit+0x110>
        {
            exit_mmap(mm);
            put_pgdir(mm);
            mm_destroy(mm);
        }
        current->mm = NULL;
ffffffffc0204322:	601c                	ld	a5,0(s0)
ffffffffc0204324:	0207b423          	sd	zero,40(a5)
    }
    current->state = PROC_ZOMBIE;
ffffffffc0204328:	601c                	ld	a5,0(s0)
ffffffffc020432a:	470d                	li	a4,3
ffffffffc020432c:	c398                	sw	a4,0(a5)
    current->exit_code = error_code;
ffffffffc020432e:	0f27a423          	sw	s2,232(a5)
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0204332:	100027f3          	csrr	a5,sstatus
ffffffffc0204336:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc0204338:	4a01                	li	s4,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc020433a:	e3f9                	bnez	a5,ffffffffc0204400 <do_exit+0x13c>
    bool intr_flag;
    struct proc_struct *proc;
    local_intr_save(intr_flag);
    {
        proc = current->parent;
ffffffffc020433c:	6018                	ld	a4,0(s0)
        if (proc->wait_state == WT_CHILD)
ffffffffc020433e:	800007b7          	lui	a5,0x80000
ffffffffc0204342:	0785                	addi	a5,a5,1
        proc = current->parent;
ffffffffc0204344:	7308                	ld	a0,32(a4)
        if (proc->wait_state == WT_CHILD)
ffffffffc0204346:	0ec52703          	lw	a4,236(a0)
ffffffffc020434a:	0af70f63          	beq	a4,a5,ffffffffc0204408 <do_exit+0x144>
        {
            wakeup_proc(proc);
        }
        while (current->cptr != NULL)
ffffffffc020434e:	6018                	ld	a4,0(s0)
ffffffffc0204350:	7b7c                	ld	a5,240(a4)
ffffffffc0204352:	c3a1                	beqz	a5,ffffffffc0204392 <do_exit+0xce>
            }
            proc->parent = initproc;
            initproc->cptr = proc;
            if (proc->state == PROC_ZOMBIE)
            {
                if (initproc->wait_state == WT_CHILD)
ffffffffc0204354:	800009b7          	lui	s3,0x80000
            if (proc->state == PROC_ZOMBIE)
ffffffffc0204358:	490d                	li	s2,3
                if (initproc->wait_state == WT_CHILD)
ffffffffc020435a:	0985                	addi	s3,s3,1
ffffffffc020435c:	a021                	j	ffffffffc0204364 <do_exit+0xa0>
        while (current->cptr != NULL)
ffffffffc020435e:	6018                	ld	a4,0(s0)
ffffffffc0204360:	7b7c                	ld	a5,240(a4)
ffffffffc0204362:	cb85                	beqz	a5,ffffffffc0204392 <do_exit+0xce>
            current->cptr = proc->optr;
ffffffffc0204364:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_obj___user_matrix_out_size+0xffffffff7fff3a00>
            if ((proc->optr = initproc->cptr) != NULL)
ffffffffc0204368:	6088                	ld	a0,0(s1)
            current->cptr = proc->optr;
ffffffffc020436a:	fb74                	sd	a3,240(a4)
            if ((proc->optr = initproc->cptr) != NULL)
ffffffffc020436c:	7978                	ld	a4,240(a0)
            proc->yptr = NULL;
ffffffffc020436e:	0e07bc23          	sd	zero,248(a5)
            if ((proc->optr = initproc->cptr) != NULL)
ffffffffc0204372:	10e7b023          	sd	a4,256(a5)
ffffffffc0204376:	c311                	beqz	a4,ffffffffc020437a <do_exit+0xb6>
                initproc->cptr->yptr = proc;
ffffffffc0204378:	ff7c                	sd	a5,248(a4)
            if (proc->state == PROC_ZOMBIE)
ffffffffc020437a:	4398                	lw	a4,0(a5)
            proc->parent = initproc;
ffffffffc020437c:	f388                	sd	a0,32(a5)
            initproc->cptr = proc;
ffffffffc020437e:	f97c                	sd	a5,240(a0)
            if (proc->state == PROC_ZOMBIE)
ffffffffc0204380:	fd271fe3          	bne	a4,s2,ffffffffc020435e <do_exit+0x9a>
                if (initproc->wait_state == WT_CHILD)
ffffffffc0204384:	0ec52783          	lw	a5,236(a0)
ffffffffc0204388:	fd379be3          	bne	a5,s3,ffffffffc020435e <do_exit+0x9a>
                {
                    wakeup_proc(initproc);
ffffffffc020438c:	1ae010ef          	jal	ra,ffffffffc020553a <wakeup_proc>
ffffffffc0204390:	b7f9                	j	ffffffffc020435e <do_exit+0x9a>
    if (flag)
ffffffffc0204392:	020a1263          	bnez	s4,ffffffffc02043b6 <do_exit+0xf2>
                }
            }
        }
    }
    local_intr_restore(intr_flag);
    schedule();
ffffffffc0204396:	256010ef          	jal	ra,ffffffffc02055ec <schedule>
    panic("do_exit will not return!! %d.\n", current->pid);
ffffffffc020439a:	601c                	ld	a5,0(s0)
ffffffffc020439c:	00003617          	auipc	a2,0x3
ffffffffc02043a0:	1ac60613          	addi	a2,a2,428 # ffffffffc0207548 <default_pmm_manager+0xa88>
ffffffffc02043a4:	24d00593          	li	a1,589
ffffffffc02043a8:	43d4                	lw	a3,4(a5)
ffffffffc02043aa:	00003517          	auipc	a0,0x3
ffffffffc02043ae:	13e50513          	addi	a0,a0,318 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc02043b2:	8e0fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        intr_enable();
ffffffffc02043b6:	df2fc0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc02043ba:	bff1                	j	ffffffffc0204396 <do_exit+0xd2>
        panic("idleproc exit.\n");
ffffffffc02043bc:	00003617          	auipc	a2,0x3
ffffffffc02043c0:	16c60613          	addi	a2,a2,364 # ffffffffc0207528 <default_pmm_manager+0xa68>
ffffffffc02043c4:	21900593          	li	a1,537
ffffffffc02043c8:	00003517          	auipc	a0,0x3
ffffffffc02043cc:	12050513          	addi	a0,a0,288 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc02043d0:	8c2fc0ef          	jal	ra,ffffffffc0200492 <__panic>
            exit_mmap(mm);
ffffffffc02043d4:	854e                	mv	a0,s3
ffffffffc02043d6:	cdeff0ef          	jal	ra,ffffffffc02038b4 <exit_mmap>
            put_pgdir(mm);
ffffffffc02043da:	854e                	mv	a0,s3
ffffffffc02043dc:	9b3ff0ef          	jal	ra,ffffffffc0203d8e <put_pgdir>
            mm_destroy(mm);
ffffffffc02043e0:	854e                	mv	a0,s3
ffffffffc02043e2:	b36ff0ef          	jal	ra,ffffffffc0203718 <mm_destroy>
ffffffffc02043e6:	bf35                	j	ffffffffc0204322 <do_exit+0x5e>
        panic("initproc exit.\n");
ffffffffc02043e8:	00003617          	auipc	a2,0x3
ffffffffc02043ec:	15060613          	addi	a2,a2,336 # ffffffffc0207538 <default_pmm_manager+0xa78>
ffffffffc02043f0:	21d00593          	li	a1,541
ffffffffc02043f4:	00003517          	auipc	a0,0x3
ffffffffc02043f8:	0f450513          	addi	a0,a0,244 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc02043fc:	896fc0ef          	jal	ra,ffffffffc0200492 <__panic>
        intr_disable();
ffffffffc0204400:	daefc0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        return 1;
ffffffffc0204404:	4a05                	li	s4,1
ffffffffc0204406:	bf1d                	j	ffffffffc020433c <do_exit+0x78>
            wakeup_proc(proc);
ffffffffc0204408:	132010ef          	jal	ra,ffffffffc020553a <wakeup_proc>
ffffffffc020440c:	b789                	j	ffffffffc020434e <do_exit+0x8a>

ffffffffc020440e <do_wait.part.0>:
}

// do_wait - wait one OR any children with PROC_ZOMBIE state, and free memory space of kernel stack
//         - proc struct of this child.
// NOTE: only after do_wait function, all resources of the child proces are free.
int do_wait(int pid, int *code_store)
ffffffffc020440e:	715d                	addi	sp,sp,-80
ffffffffc0204410:	f84a                	sd	s2,48(sp)
ffffffffc0204412:	f44e                	sd	s3,40(sp)
        }
    }
    if (haskid)
    {
        current->state = PROC_SLEEPING;
        current->wait_state = WT_CHILD;
ffffffffc0204414:	80000937          	lui	s2,0x80000
    if (0 < pid && pid < MAX_PID)
ffffffffc0204418:	6989                	lui	s3,0x2
int do_wait(int pid, int *code_store)
ffffffffc020441a:	fc26                	sd	s1,56(sp)
ffffffffc020441c:	f052                	sd	s4,32(sp)
ffffffffc020441e:	ec56                	sd	s5,24(sp)
ffffffffc0204420:	e85a                	sd	s6,16(sp)
ffffffffc0204422:	e45e                	sd	s7,8(sp)
ffffffffc0204424:	e486                	sd	ra,72(sp)
ffffffffc0204426:	e0a2                	sd	s0,64(sp)
ffffffffc0204428:	84aa                	mv	s1,a0
ffffffffc020442a:	8a2e                	mv	s4,a1
        proc = current->cptr;
ffffffffc020442c:	000c2b97          	auipc	s7,0xc2
ffffffffc0204430:	6ccb8b93          	addi	s7,s7,1740 # ffffffffc02c6af8 <current>
    if (0 < pid && pid < MAX_PID)
ffffffffc0204434:	00050b1b          	sext.w	s6,a0
ffffffffc0204438:	fff50a9b          	addiw	s5,a0,-1
ffffffffc020443c:	19f9                	addi	s3,s3,-2
        current->wait_state = WT_CHILD;
ffffffffc020443e:	0905                	addi	s2,s2,1
    if (pid != 0)
ffffffffc0204440:	ccbd                	beqz	s1,ffffffffc02044be <do_wait.part.0+0xb0>
    if (0 < pid && pid < MAX_PID)
ffffffffc0204442:	0359e863          	bltu	s3,s5,ffffffffc0204472 <do_wait.part.0+0x64>
        list_entry_t *list = hash_list + pid_hashfn(pid), *le = list;
ffffffffc0204446:	45a9                	li	a1,10
ffffffffc0204448:	855a                	mv	a0,s6
ffffffffc020444a:	362010ef          	jal	ra,ffffffffc02057ac <hash32>
ffffffffc020444e:	02051793          	slli	a5,a0,0x20
ffffffffc0204452:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0204456:	000be797          	auipc	a5,0xbe
ffffffffc020445a:	60a78793          	addi	a5,a5,1546 # ffffffffc02c2a60 <hash_list>
ffffffffc020445e:	953e                	add	a0,a0,a5
ffffffffc0204460:	842a                	mv	s0,a0
        while ((le = list_next(le)) != list)
ffffffffc0204462:	a029                	j	ffffffffc020446c <do_wait.part.0+0x5e>
            if (proc->pid == pid)
ffffffffc0204464:	f2c42783          	lw	a5,-212(s0)
ffffffffc0204468:	02978163          	beq	a5,s1,ffffffffc020448a <do_wait.part.0+0x7c>
ffffffffc020446c:	6400                	ld	s0,8(s0)
        while ((le = list_next(le)) != list)
ffffffffc020446e:	fe851be3          	bne	a0,s0,ffffffffc0204464 <do_wait.part.0+0x56>
        {
            do_exit(-E_KILLED);
        }
        goto repeat;
    }
    return -E_BAD_PROC;
ffffffffc0204472:	5579                	li	a0,-2
    }
    local_intr_restore(intr_flag);
    put_kstack(proc);
    kfree(proc);
    return 0;
}
ffffffffc0204474:	60a6                	ld	ra,72(sp)
ffffffffc0204476:	6406                	ld	s0,64(sp)
ffffffffc0204478:	74e2                	ld	s1,56(sp)
ffffffffc020447a:	7942                	ld	s2,48(sp)
ffffffffc020447c:	79a2                	ld	s3,40(sp)
ffffffffc020447e:	7a02                	ld	s4,32(sp)
ffffffffc0204480:	6ae2                	ld	s5,24(sp)
ffffffffc0204482:	6b42                	ld	s6,16(sp)
ffffffffc0204484:	6ba2                	ld	s7,8(sp)
ffffffffc0204486:	6161                	addi	sp,sp,80
ffffffffc0204488:	8082                	ret
        if (proc != NULL && proc->parent == current)
ffffffffc020448a:	000bb683          	ld	a3,0(s7)
ffffffffc020448e:	f4843783          	ld	a5,-184(s0)
ffffffffc0204492:	fed790e3          	bne	a5,a3,ffffffffc0204472 <do_wait.part.0+0x64>
            if (proc->state == PROC_ZOMBIE)
ffffffffc0204496:	f2842703          	lw	a4,-216(s0)
ffffffffc020449a:	478d                	li	a5,3
ffffffffc020449c:	0ef70b63          	beq	a4,a5,ffffffffc0204592 <do_wait.part.0+0x184>
        current->state = PROC_SLEEPING;
ffffffffc02044a0:	4785                	li	a5,1
ffffffffc02044a2:	c29c                	sw	a5,0(a3)
        current->wait_state = WT_CHILD;
ffffffffc02044a4:	0f26a623          	sw	s2,236(a3)
        schedule();
ffffffffc02044a8:	144010ef          	jal	ra,ffffffffc02055ec <schedule>
        if (current->flags & PF_EXITING)
ffffffffc02044ac:	000bb783          	ld	a5,0(s7)
ffffffffc02044b0:	0b07a783          	lw	a5,176(a5)
ffffffffc02044b4:	8b85                	andi	a5,a5,1
ffffffffc02044b6:	d7c9                	beqz	a5,ffffffffc0204440 <do_wait.part.0+0x32>
            do_exit(-E_KILLED);
ffffffffc02044b8:	555d                	li	a0,-9
ffffffffc02044ba:	e0bff0ef          	jal	ra,ffffffffc02042c4 <do_exit>
        proc = current->cptr;
ffffffffc02044be:	000bb683          	ld	a3,0(s7)
ffffffffc02044c2:	7ae0                	ld	s0,240(a3)
        for (; proc != NULL; proc = proc->optr)
ffffffffc02044c4:	d45d                	beqz	s0,ffffffffc0204472 <do_wait.part.0+0x64>
            if (proc->state == PROC_ZOMBIE)
ffffffffc02044c6:	470d                	li	a4,3
ffffffffc02044c8:	a021                	j	ffffffffc02044d0 <do_wait.part.0+0xc2>
        for (; proc != NULL; proc = proc->optr)
ffffffffc02044ca:	10043403          	ld	s0,256(s0)
ffffffffc02044ce:	d869                	beqz	s0,ffffffffc02044a0 <do_wait.part.0+0x92>
            if (proc->state == PROC_ZOMBIE)
ffffffffc02044d0:	401c                	lw	a5,0(s0)
ffffffffc02044d2:	fee79ce3          	bne	a5,a4,ffffffffc02044ca <do_wait.part.0+0xbc>
    if (proc == idleproc || proc == initproc)
ffffffffc02044d6:	000c2797          	auipc	a5,0xc2
ffffffffc02044da:	62a7b783          	ld	a5,1578(a5) # ffffffffc02c6b00 <idleproc>
ffffffffc02044de:	0c878963          	beq	a5,s0,ffffffffc02045b0 <do_wait.part.0+0x1a2>
ffffffffc02044e2:	000c2797          	auipc	a5,0xc2
ffffffffc02044e6:	6267b783          	ld	a5,1574(a5) # ffffffffc02c6b08 <initproc>
ffffffffc02044ea:	0cf40363          	beq	s0,a5,ffffffffc02045b0 <do_wait.part.0+0x1a2>
    if (code_store != NULL)
ffffffffc02044ee:	000a0663          	beqz	s4,ffffffffc02044fa <do_wait.part.0+0xec>
        *code_store = proc->exit_code;
ffffffffc02044f2:	0e842783          	lw	a5,232(s0)
ffffffffc02044f6:	00fa2023          	sw	a5,0(s4) # 1000 <_binary_obj___user_faultread_out_size-0x8f30>
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02044fa:	100027f3          	csrr	a5,sstatus
ffffffffc02044fe:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc0204500:	4581                	li	a1,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0204502:	e7c1                	bnez	a5,ffffffffc020458a <do_wait.part.0+0x17c>
    __list_del(listelm->prev, listelm->next);
ffffffffc0204504:	6c70                	ld	a2,216(s0)
ffffffffc0204506:	7074                	ld	a3,224(s0)
    if (proc->optr != NULL)
ffffffffc0204508:	10043703          	ld	a4,256(s0)
        proc->optr->yptr = proc->yptr;
ffffffffc020450c:	7c7c                	ld	a5,248(s0)
    prev->next = next;
ffffffffc020450e:	e614                	sd	a3,8(a2)
    next->prev = prev;
ffffffffc0204510:	e290                	sd	a2,0(a3)
    __list_del(listelm->prev, listelm->next);
ffffffffc0204512:	6470                	ld	a2,200(s0)
ffffffffc0204514:	6874                	ld	a3,208(s0)
    prev->next = next;
ffffffffc0204516:	e614                	sd	a3,8(a2)
    next->prev = prev;
ffffffffc0204518:	e290                	sd	a2,0(a3)
    if (proc->optr != NULL)
ffffffffc020451a:	c319                	beqz	a4,ffffffffc0204520 <do_wait.part.0+0x112>
        proc->optr->yptr = proc->yptr;
ffffffffc020451c:	ff7c                	sd	a5,248(a4)
    if (proc->yptr != NULL)
ffffffffc020451e:	7c7c                	ld	a5,248(s0)
ffffffffc0204520:	c3b5                	beqz	a5,ffffffffc0204584 <do_wait.part.0+0x176>
        proc->yptr->optr = proc->optr;
ffffffffc0204522:	10e7b023          	sd	a4,256(a5)
    nr_process--;
ffffffffc0204526:	000c2717          	auipc	a4,0xc2
ffffffffc020452a:	5ea70713          	addi	a4,a4,1514 # ffffffffc02c6b10 <nr_process>
ffffffffc020452e:	431c                	lw	a5,0(a4)
ffffffffc0204530:	37fd                	addiw	a5,a5,-1
ffffffffc0204532:	c31c                	sw	a5,0(a4)
    if (flag)
ffffffffc0204534:	e5a9                	bnez	a1,ffffffffc020457e <do_wait.part.0+0x170>
    free_pages(kva2page((void *)(proc->kstack)), KSTACKPAGE);
ffffffffc0204536:	6814                	ld	a3,16(s0)
ffffffffc0204538:	c02007b7          	lui	a5,0xc0200
ffffffffc020453c:	04f6ee63          	bltu	a3,a5,ffffffffc0204598 <do_wait.part.0+0x18a>
ffffffffc0204540:	000c2797          	auipc	a5,0xc2
ffffffffc0204544:	5b07b783          	ld	a5,1456(a5) # ffffffffc02c6af0 <va_pa_offset>
ffffffffc0204548:	8e9d                	sub	a3,a3,a5
    if (PPN(pa) >= npage)
ffffffffc020454a:	82b1                	srli	a3,a3,0xc
ffffffffc020454c:	000c2797          	auipc	a5,0xc2
ffffffffc0204550:	58c7b783          	ld	a5,1420(a5) # ffffffffc02c6ad8 <npage>
ffffffffc0204554:	06f6fa63          	bgeu	a3,a5,ffffffffc02045c8 <do_wait.part.0+0x1ba>
    return &pages[PPN(pa) - nbase];
ffffffffc0204558:	00004517          	auipc	a0,0x4
ffffffffc020455c:	fc853503          	ld	a0,-56(a0) # ffffffffc0208520 <nbase>
ffffffffc0204560:	8e89                	sub	a3,a3,a0
ffffffffc0204562:	069a                	slli	a3,a3,0x6
ffffffffc0204564:	000c2517          	auipc	a0,0xc2
ffffffffc0204568:	57c53503          	ld	a0,1404(a0) # ffffffffc02c6ae0 <pages>
ffffffffc020456c:	9536                	add	a0,a0,a3
ffffffffc020456e:	4589                	li	a1,2
ffffffffc0204570:	883fd0ef          	jal	ra,ffffffffc0201df2 <free_pages>
    kfree(proc);
ffffffffc0204574:	8522                	mv	a0,s0
ffffffffc0204576:	f10fd0ef          	jal	ra,ffffffffc0201c86 <kfree>
    return 0;
ffffffffc020457a:	4501                	li	a0,0
ffffffffc020457c:	bde5                	j	ffffffffc0204474 <do_wait.part.0+0x66>
        intr_enable();
ffffffffc020457e:	c2afc0ef          	jal	ra,ffffffffc02009a8 <intr_enable>
ffffffffc0204582:	bf55                	j	ffffffffc0204536 <do_wait.part.0+0x128>
        proc->parent->cptr = proc->optr;
ffffffffc0204584:	701c                	ld	a5,32(s0)
ffffffffc0204586:	fbf8                	sd	a4,240(a5)
ffffffffc0204588:	bf79                	j	ffffffffc0204526 <do_wait.part.0+0x118>
        intr_disable();
ffffffffc020458a:	c24fc0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        return 1;
ffffffffc020458e:	4585                	li	a1,1
ffffffffc0204590:	bf95                	j	ffffffffc0204504 <do_wait.part.0+0xf6>
            struct proc_struct *proc = le2proc(le, hash_link);
ffffffffc0204592:	f2840413          	addi	s0,s0,-216
ffffffffc0204596:	b781                	j	ffffffffc02044d6 <do_wait.part.0+0xc8>
    return pa2page(PADDR(kva));
ffffffffc0204598:	00002617          	auipc	a2,0x2
ffffffffc020459c:	60860613          	addi	a2,a2,1544 # ffffffffc0206ba0 <default_pmm_manager+0xe0>
ffffffffc02045a0:	07700593          	li	a1,119
ffffffffc02045a4:	00002517          	auipc	a0,0x2
ffffffffc02045a8:	57c50513          	addi	a0,a0,1404 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc02045ac:	ee7fb0ef          	jal	ra,ffffffffc0200492 <__panic>
        panic("wait idleproc or initproc.\n");
ffffffffc02045b0:	00003617          	auipc	a2,0x3
ffffffffc02045b4:	fb860613          	addi	a2,a2,-72 # ffffffffc0207568 <default_pmm_manager+0xaa8>
ffffffffc02045b8:	36f00593          	li	a1,879
ffffffffc02045bc:	00003517          	auipc	a0,0x3
ffffffffc02045c0:	f2c50513          	addi	a0,a0,-212 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc02045c4:	ecffb0ef          	jal	ra,ffffffffc0200492 <__panic>
        panic("pa2page called with invalid pa");
ffffffffc02045c8:	00002617          	auipc	a2,0x2
ffffffffc02045cc:	60060613          	addi	a2,a2,1536 # ffffffffc0206bc8 <default_pmm_manager+0x108>
ffffffffc02045d0:	06900593          	li	a1,105
ffffffffc02045d4:	00002517          	auipc	a0,0x2
ffffffffc02045d8:	54c50513          	addi	a0,a0,1356 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc02045dc:	eb7fb0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02045e0 <init_main>:
}

// init_main - the second kernel thread used to create user_main kernel threads
static int
init_main(void *arg)
{
ffffffffc02045e0:	1141                	addi	sp,sp,-16
ffffffffc02045e2:	e406                	sd	ra,8(sp)
    size_t nr_free_pages_store = nr_free_pages();
ffffffffc02045e4:	84ffd0ef          	jal	ra,ffffffffc0201e32 <nr_free_pages>
    size_t kernel_allocated_store = kallocated();
ffffffffc02045e8:	deafd0ef          	jal	ra,ffffffffc0201bd2 <kallocated>

    int pid = kernel_thread(user_main, NULL, 0);
ffffffffc02045ec:	4601                	li	a2,0
ffffffffc02045ee:	4581                	li	a1,0
ffffffffc02045f0:	00000517          	auipc	a0,0x0
ffffffffc02045f4:	62850513          	addi	a0,a0,1576 # ffffffffc0204c18 <user_main>
ffffffffc02045f8:	c7dff0ef          	jal	ra,ffffffffc0204274 <kernel_thread>
    if (pid <= 0)
ffffffffc02045fc:	00a04563          	bgtz	a0,ffffffffc0204606 <init_main+0x26>
ffffffffc0204600:	a071                	j	ffffffffc020468c <init_main+0xac>
        panic("create user_main failed.\n");
    }

    while (do_wait(0, NULL) == 0)
    {
        schedule();
ffffffffc0204602:	7eb000ef          	jal	ra,ffffffffc02055ec <schedule>
    if (code_store != NULL)
ffffffffc0204606:	4581                	li	a1,0
ffffffffc0204608:	4501                	li	a0,0
ffffffffc020460a:	e05ff0ef          	jal	ra,ffffffffc020440e <do_wait.part.0>
    while (do_wait(0, NULL) == 0)
ffffffffc020460e:	d975                	beqz	a0,ffffffffc0204602 <init_main+0x22>
    }

    cprintf("all user-mode processes have quit.\n");
ffffffffc0204610:	00003517          	auipc	a0,0x3
ffffffffc0204614:	f9850513          	addi	a0,a0,-104 # ffffffffc02075a8 <default_pmm_manager+0xae8>
ffffffffc0204618:	b81fb0ef          	jal	ra,ffffffffc0200198 <cprintf>
    assert(initproc->cptr == NULL && initproc->yptr == NULL && initproc->optr == NULL);
ffffffffc020461c:	000c2797          	auipc	a5,0xc2
ffffffffc0204620:	4ec7b783          	ld	a5,1260(a5) # ffffffffc02c6b08 <initproc>
ffffffffc0204624:	7bf8                	ld	a4,240(a5)
ffffffffc0204626:	e339                	bnez	a4,ffffffffc020466c <init_main+0x8c>
ffffffffc0204628:	7ff8                	ld	a4,248(a5)
ffffffffc020462a:	e329                	bnez	a4,ffffffffc020466c <init_main+0x8c>
ffffffffc020462c:	1007b703          	ld	a4,256(a5)
ffffffffc0204630:	ef15                	bnez	a4,ffffffffc020466c <init_main+0x8c>
    assert(nr_process == 2);
ffffffffc0204632:	000c2697          	auipc	a3,0xc2
ffffffffc0204636:	4de6a683          	lw	a3,1246(a3) # ffffffffc02c6b10 <nr_process>
ffffffffc020463a:	4709                	li	a4,2
ffffffffc020463c:	0ae69463          	bne	a3,a4,ffffffffc02046e4 <init_main+0x104>
    return listelm->next;
ffffffffc0204640:	000c2697          	auipc	a3,0xc2
ffffffffc0204644:	42068693          	addi	a3,a3,1056 # ffffffffc02c6a60 <proc_list>
    assert(list_next(&proc_list) == &(initproc->list_link));
ffffffffc0204648:	6698                	ld	a4,8(a3)
ffffffffc020464a:	0c878793          	addi	a5,a5,200
ffffffffc020464e:	06f71b63          	bne	a4,a5,ffffffffc02046c4 <init_main+0xe4>
    assert(list_prev(&proc_list) == &(initproc->list_link));
ffffffffc0204652:	629c                	ld	a5,0(a3)
ffffffffc0204654:	04f71863          	bne	a4,a5,ffffffffc02046a4 <init_main+0xc4>

    cprintf("init check memory pass.\n");
ffffffffc0204658:	00003517          	auipc	a0,0x3
ffffffffc020465c:	03850513          	addi	a0,a0,56 # ffffffffc0207690 <default_pmm_manager+0xbd0>
ffffffffc0204660:	b39fb0ef          	jal	ra,ffffffffc0200198 <cprintf>
    return 0;
}
ffffffffc0204664:	60a2                	ld	ra,8(sp)
ffffffffc0204666:	4501                	li	a0,0
ffffffffc0204668:	0141                	addi	sp,sp,16
ffffffffc020466a:	8082                	ret
    assert(initproc->cptr == NULL && initproc->yptr == NULL && initproc->optr == NULL);
ffffffffc020466c:	00003697          	auipc	a3,0x3
ffffffffc0204670:	f6468693          	addi	a3,a3,-156 # ffffffffc02075d0 <default_pmm_manager+0xb10>
ffffffffc0204674:	00002617          	auipc	a2,0x2
ffffffffc0204678:	09c60613          	addi	a2,a2,156 # ffffffffc0206710 <commands+0x828>
ffffffffc020467c:	3db00593          	li	a1,987
ffffffffc0204680:	00003517          	auipc	a0,0x3
ffffffffc0204684:	e6850513          	addi	a0,a0,-408 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204688:	e0bfb0ef          	jal	ra,ffffffffc0200492 <__panic>
        panic("create user_main failed.\n");
ffffffffc020468c:	00003617          	auipc	a2,0x3
ffffffffc0204690:	efc60613          	addi	a2,a2,-260 # ffffffffc0207588 <default_pmm_manager+0xac8>
ffffffffc0204694:	3d200593          	li	a1,978
ffffffffc0204698:	00003517          	auipc	a0,0x3
ffffffffc020469c:	e5050513          	addi	a0,a0,-432 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc02046a0:	df3fb0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(list_prev(&proc_list) == &(initproc->list_link));
ffffffffc02046a4:	00003697          	auipc	a3,0x3
ffffffffc02046a8:	fbc68693          	addi	a3,a3,-68 # ffffffffc0207660 <default_pmm_manager+0xba0>
ffffffffc02046ac:	00002617          	auipc	a2,0x2
ffffffffc02046b0:	06460613          	addi	a2,a2,100 # ffffffffc0206710 <commands+0x828>
ffffffffc02046b4:	3de00593          	li	a1,990
ffffffffc02046b8:	00003517          	auipc	a0,0x3
ffffffffc02046bc:	e3050513          	addi	a0,a0,-464 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc02046c0:	dd3fb0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(list_next(&proc_list) == &(initproc->list_link));
ffffffffc02046c4:	00003697          	auipc	a3,0x3
ffffffffc02046c8:	f6c68693          	addi	a3,a3,-148 # ffffffffc0207630 <default_pmm_manager+0xb70>
ffffffffc02046cc:	00002617          	auipc	a2,0x2
ffffffffc02046d0:	04460613          	addi	a2,a2,68 # ffffffffc0206710 <commands+0x828>
ffffffffc02046d4:	3dd00593          	li	a1,989
ffffffffc02046d8:	00003517          	auipc	a0,0x3
ffffffffc02046dc:	e1050513          	addi	a0,a0,-496 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc02046e0:	db3fb0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(nr_process == 2);
ffffffffc02046e4:	00003697          	auipc	a3,0x3
ffffffffc02046e8:	f3c68693          	addi	a3,a3,-196 # ffffffffc0207620 <default_pmm_manager+0xb60>
ffffffffc02046ec:	00002617          	auipc	a2,0x2
ffffffffc02046f0:	02460613          	addi	a2,a2,36 # ffffffffc0206710 <commands+0x828>
ffffffffc02046f4:	3dc00593          	li	a1,988
ffffffffc02046f8:	00003517          	auipc	a0,0x3
ffffffffc02046fc:	df050513          	addi	a0,a0,-528 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204700:	d93fb0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0204704 <do_execve>:
{
ffffffffc0204704:	7171                	addi	sp,sp,-176
ffffffffc0204706:	e4ee                	sd	s11,72(sp)
    struct mm_struct *mm = current->mm;
ffffffffc0204708:	000c2d97          	auipc	s11,0xc2
ffffffffc020470c:	3f0d8d93          	addi	s11,s11,1008 # ffffffffc02c6af8 <current>
ffffffffc0204710:	000db783          	ld	a5,0(s11)
{
ffffffffc0204714:	e54e                	sd	s3,136(sp)
ffffffffc0204716:	ed26                	sd	s1,152(sp)
    struct mm_struct *mm = current->mm;
ffffffffc0204718:	0287b983          	ld	s3,40(a5)
{
ffffffffc020471c:	e94a                	sd	s2,144(sp)
ffffffffc020471e:	f4de                	sd	s7,104(sp)
ffffffffc0204720:	892a                	mv	s2,a0
ffffffffc0204722:	8bb2                	mv	s7,a2
ffffffffc0204724:	84ae                	mv	s1,a1
    if (!user_mem_check(mm, (uintptr_t)name, len, 0))
ffffffffc0204726:	862e                	mv	a2,a1
ffffffffc0204728:	4681                	li	a3,0
ffffffffc020472a:	85aa                	mv	a1,a0
ffffffffc020472c:	854e                	mv	a0,s3
{
ffffffffc020472e:	f506                	sd	ra,168(sp)
ffffffffc0204730:	f122                	sd	s0,160(sp)
ffffffffc0204732:	e152                	sd	s4,128(sp)
ffffffffc0204734:	fcd6                	sd	s5,120(sp)
ffffffffc0204736:	f8da                	sd	s6,112(sp)
ffffffffc0204738:	f0e2                	sd	s8,96(sp)
ffffffffc020473a:	ece6                	sd	s9,88(sp)
ffffffffc020473c:	e8ea                	sd	s10,80(sp)
ffffffffc020473e:	f05e                	sd	s7,32(sp)
    if (!user_mem_check(mm, (uintptr_t)name, len, 0))
ffffffffc0204740:	d0eff0ef          	jal	ra,ffffffffc0203c4e <user_mem_check>
ffffffffc0204744:	40050a63          	beqz	a0,ffffffffc0204b58 <do_execve+0x454>
    memset(local_name, 0, sizeof(local_name));
ffffffffc0204748:	4641                	li	a2,16
ffffffffc020474a:	4581                	li	a1,0
ffffffffc020474c:	1808                	addi	a0,sp,48
ffffffffc020474e:	504010ef          	jal	ra,ffffffffc0205c52 <memset>
    memcpy(local_name, name, len);
ffffffffc0204752:	47bd                	li	a5,15
ffffffffc0204754:	8626                	mv	a2,s1
ffffffffc0204756:	1e97e263          	bltu	a5,s1,ffffffffc020493a <do_execve+0x236>
ffffffffc020475a:	85ca                	mv	a1,s2
ffffffffc020475c:	1808                	addi	a0,sp,48
ffffffffc020475e:	506010ef          	jal	ra,ffffffffc0205c64 <memcpy>
    if (mm != NULL)
ffffffffc0204762:	1e098363          	beqz	s3,ffffffffc0204948 <do_execve+0x244>
        cputs("mm != NULL");
ffffffffc0204766:	00003517          	auipc	a0,0x3
ffffffffc020476a:	b8a50513          	addi	a0,a0,-1142 # ffffffffc02072f0 <default_pmm_manager+0x830>
ffffffffc020476e:	a63fb0ef          	jal	ra,ffffffffc02001d0 <cputs>
ffffffffc0204772:	000c2797          	auipc	a5,0xc2
ffffffffc0204776:	3567b783          	ld	a5,854(a5) # ffffffffc02c6ac8 <boot_pgdir_pa>
ffffffffc020477a:	577d                	li	a4,-1
ffffffffc020477c:	177e                	slli	a4,a4,0x3f
ffffffffc020477e:	83b1                	srli	a5,a5,0xc
ffffffffc0204780:	8fd9                	or	a5,a5,a4
ffffffffc0204782:	18079073          	csrw	satp,a5
ffffffffc0204786:	0309a783          	lw	a5,48(s3) # 2030 <_binary_obj___user_faultread_out_size-0x7f00>
ffffffffc020478a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020478e:	02e9a823          	sw	a4,48(s3)
        if (mm_count_dec(mm) == 0)
ffffffffc0204792:	2c070463          	beqz	a4,ffffffffc0204a5a <do_execve+0x356>
        current->mm = NULL;
ffffffffc0204796:	000db783          	ld	a5,0(s11)
ffffffffc020479a:	0207b423          	sd	zero,40(a5)
    if ((mm = mm_create()) == NULL)
ffffffffc020479e:	e3bfe0ef          	jal	ra,ffffffffc02035d8 <mm_create>
ffffffffc02047a2:	84aa                	mv	s1,a0
ffffffffc02047a4:	1c050d63          	beqz	a0,ffffffffc020497e <do_execve+0x27a>
    if ((page = alloc_page()) == NULL)
ffffffffc02047a8:	4505                	li	a0,1
ffffffffc02047aa:	e0afd0ef          	jal	ra,ffffffffc0201db4 <alloc_pages>
ffffffffc02047ae:	3a050963          	beqz	a0,ffffffffc0204b60 <do_execve+0x45c>
    return page - pages + nbase;
ffffffffc02047b2:	000c2c97          	auipc	s9,0xc2
ffffffffc02047b6:	32ec8c93          	addi	s9,s9,814 # ffffffffc02c6ae0 <pages>
ffffffffc02047ba:	000cb683          	ld	a3,0(s9)
    return KADDR(page2pa(page));
ffffffffc02047be:	000c2c17          	auipc	s8,0xc2
ffffffffc02047c2:	31ac0c13          	addi	s8,s8,794 # ffffffffc02c6ad8 <npage>
    return page - pages + nbase;
ffffffffc02047c6:	00004717          	auipc	a4,0x4
ffffffffc02047ca:	d5a73703          	ld	a4,-678(a4) # ffffffffc0208520 <nbase>
ffffffffc02047ce:	40d506b3          	sub	a3,a0,a3
ffffffffc02047d2:	8699                	srai	a3,a3,0x6
    return KADDR(page2pa(page));
ffffffffc02047d4:	5afd                	li	s5,-1
ffffffffc02047d6:	000c3783          	ld	a5,0(s8)
    return page - pages + nbase;
ffffffffc02047da:	96ba                	add	a3,a3,a4
ffffffffc02047dc:	e83a                	sd	a4,16(sp)
    return KADDR(page2pa(page));
ffffffffc02047de:	00cad713          	srli	a4,s5,0xc
ffffffffc02047e2:	ec3a                	sd	a4,24(sp)
ffffffffc02047e4:	8f75                	and	a4,a4,a3
    return page2ppn(page) << PGSHIFT;
ffffffffc02047e6:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc02047e8:	38f77063          	bgeu	a4,a5,ffffffffc0204b68 <do_execve+0x464>
ffffffffc02047ec:	000c2b17          	auipc	s6,0xc2
ffffffffc02047f0:	304b0b13          	addi	s6,s6,772 # ffffffffc02c6af0 <va_pa_offset>
ffffffffc02047f4:	000b3903          	ld	s2,0(s6)
    memcpy(pgdir, boot_pgdir_va, PGSIZE);
ffffffffc02047f8:	6605                	lui	a2,0x1
ffffffffc02047fa:	000c2597          	auipc	a1,0xc2
ffffffffc02047fe:	2d65b583          	ld	a1,726(a1) # ffffffffc02c6ad0 <boot_pgdir_va>
ffffffffc0204802:	9936                	add	s2,s2,a3
ffffffffc0204804:	854a                	mv	a0,s2
ffffffffc0204806:	45e010ef          	jal	ra,ffffffffc0205c64 <memcpy>
    if (elf->e_magic != ELF_MAGIC)
ffffffffc020480a:	7782                	ld	a5,32(sp)
ffffffffc020480c:	4398                	lw	a4,0(a5)
ffffffffc020480e:	464c47b7          	lui	a5,0x464c4
    mm->pgdir = pgdir;
ffffffffc0204812:	0124bc23          	sd	s2,24(s1)
    if (elf->e_magic != ELF_MAGIC)
ffffffffc0204816:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_obj___user_matrix_out_size+0x464b7e7f>
ffffffffc020481a:	14f71863          	bne	a4,a5,ffffffffc020496a <do_execve+0x266>
    struct proghdr *ph_end = ph + elf->e_phnum;
ffffffffc020481e:	7682                	ld	a3,32(sp)
ffffffffc0204820:	0386d703          	lhu	a4,56(a3)
    struct proghdr *ph = (struct proghdr *)(binary + elf->e_phoff);
ffffffffc0204824:	0206b983          	ld	s3,32(a3)
    struct proghdr *ph_end = ph + elf->e_phnum;
ffffffffc0204828:	00371793          	slli	a5,a4,0x3
ffffffffc020482c:	8f99                	sub	a5,a5,a4
    struct proghdr *ph = (struct proghdr *)(binary + elf->e_phoff);
ffffffffc020482e:	99b6                	add	s3,s3,a3
    struct proghdr *ph_end = ph + elf->e_phnum;
ffffffffc0204830:	078e                	slli	a5,a5,0x3
ffffffffc0204832:	97ce                	add	a5,a5,s3
ffffffffc0204834:	f43e                	sd	a5,40(sp)
    for (; ph < ph_end; ph++)
ffffffffc0204836:	00f9fc63          	bgeu	s3,a5,ffffffffc020484e <do_execve+0x14a>
        if (ph->p_type != ELF_PT_LOAD)
ffffffffc020483a:	0009a783          	lw	a5,0(s3)
ffffffffc020483e:	4705                	li	a4,1
ffffffffc0204840:	14e78163          	beq	a5,a4,ffffffffc0204982 <do_execve+0x27e>
    for (; ph < ph_end; ph++)
ffffffffc0204844:	77a2                	ld	a5,40(sp)
ffffffffc0204846:	03898993          	addi	s3,s3,56
ffffffffc020484a:	fef9e8e3          	bltu	s3,a5,ffffffffc020483a <do_execve+0x136>
    if ((ret = mm_map(mm, USTACKTOP - USTACKSIZE, USTACKSIZE, vm_flags, NULL)) != 0)
ffffffffc020484e:	4701                	li	a4,0
ffffffffc0204850:	46ad                	li	a3,11
ffffffffc0204852:	00100637          	lui	a2,0x100
ffffffffc0204856:	7ff005b7          	lui	a1,0x7ff00
ffffffffc020485a:	8526                	mv	a0,s1
ffffffffc020485c:	f0ffe0ef          	jal	ra,ffffffffc020376a <mm_map>
ffffffffc0204860:	8a2a                	mv	s4,a0
ffffffffc0204862:	1e051263          	bnez	a0,ffffffffc0204a46 <do_execve+0x342>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - PGSIZE, PTE_USER) != NULL);
ffffffffc0204866:	6c88                	ld	a0,24(s1)
ffffffffc0204868:	467d                	li	a2,31
ffffffffc020486a:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc020486e:	c85fe0ef          	jal	ra,ffffffffc02034f2 <pgdir_alloc_page>
ffffffffc0204872:	38050363          	beqz	a0,ffffffffc0204bf8 <do_execve+0x4f4>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 2 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204876:	6c88                	ld	a0,24(s1)
ffffffffc0204878:	467d                	li	a2,31
ffffffffc020487a:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc020487e:	c75fe0ef          	jal	ra,ffffffffc02034f2 <pgdir_alloc_page>
ffffffffc0204882:	34050b63          	beqz	a0,ffffffffc0204bd8 <do_execve+0x4d4>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 3 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204886:	6c88                	ld	a0,24(s1)
ffffffffc0204888:	467d                	li	a2,31
ffffffffc020488a:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc020488e:	c65fe0ef          	jal	ra,ffffffffc02034f2 <pgdir_alloc_page>
ffffffffc0204892:	32050363          	beqz	a0,ffffffffc0204bb8 <do_execve+0x4b4>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 4 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204896:	6c88                	ld	a0,24(s1)
ffffffffc0204898:	467d                	li	a2,31
ffffffffc020489a:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc020489e:	c55fe0ef          	jal	ra,ffffffffc02034f2 <pgdir_alloc_page>
ffffffffc02048a2:	2e050b63          	beqz	a0,ffffffffc0204b98 <do_execve+0x494>
    mm->mm_count += 1;
ffffffffc02048a6:	589c                	lw	a5,48(s1)
    current->mm = mm;
ffffffffc02048a8:	000db603          	ld	a2,0(s11)
    current->pgdir = PADDR(mm->pgdir);
ffffffffc02048ac:	6c94                	ld	a3,24(s1)
ffffffffc02048ae:	2785                	addiw	a5,a5,1
ffffffffc02048b0:	d89c                	sw	a5,48(s1)
    current->mm = mm;
ffffffffc02048b2:	f604                	sd	s1,40(a2)
    current->pgdir = PADDR(mm->pgdir);
ffffffffc02048b4:	c02007b7          	lui	a5,0xc0200
ffffffffc02048b8:	2cf6e463          	bltu	a3,a5,ffffffffc0204b80 <do_execve+0x47c>
ffffffffc02048bc:	000b3783          	ld	a5,0(s6)
ffffffffc02048c0:	577d                	li	a4,-1
ffffffffc02048c2:	177e                	slli	a4,a4,0x3f
ffffffffc02048c4:	8e9d                	sub	a3,a3,a5
ffffffffc02048c6:	00c6d793          	srli	a5,a3,0xc
ffffffffc02048ca:	f654                	sd	a3,168(a2)
ffffffffc02048cc:	8fd9                	or	a5,a5,a4
ffffffffc02048ce:	18079073          	csrw	satp,a5
    struct trapframe *tf = current->tf;
ffffffffc02048d2:	7240                	ld	s0,160(a2)
    memset(tf, 0, sizeof(struct trapframe));
ffffffffc02048d4:	4581                	li	a1,0
ffffffffc02048d6:	12000613          	li	a2,288
ffffffffc02048da:	8522                	mv	a0,s0
    uintptr_t sstatus = tf->status;
ffffffffc02048dc:	10043483          	ld	s1,256(s0)
    memset(tf, 0, sizeof(struct trapframe));
ffffffffc02048e0:	372010ef          	jal	ra,ffffffffc0205c52 <memset>
    tf->epc = elf->e_entry;
ffffffffc02048e4:	7782                	ld	a5,32(sp)
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc02048e6:	000db903          	ld	s2,0(s11)
    tf->status = (sstatus & ~SSTATUS_SPP) | SSTATUS_SPIE;
ffffffffc02048ea:	edf4f493          	andi	s1,s1,-289
    tf->epc = elf->e_entry;
ffffffffc02048ee:	6f98                	ld	a4,24(a5)
    tf->gpr.sp = USTACKTOP;
ffffffffc02048f0:	4785                	li	a5,1
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc02048f2:	0b490913          	addi	s2,s2,180 # ffffffff800000b4 <_binary_obj___user_matrix_out_size+0xffffffff7fff39b4>
    tf->gpr.sp = USTACKTOP;
ffffffffc02048f6:	07fe                	slli	a5,a5,0x1f
    tf->status = (sstatus & ~SSTATUS_SPP) | SSTATUS_SPIE;
ffffffffc02048f8:	0204e493          	ori	s1,s1,32
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc02048fc:	4641                	li	a2,16
ffffffffc02048fe:	4581                	li	a1,0
    tf->gpr.sp = USTACKTOP;
ffffffffc0204900:	e81c                	sd	a5,16(s0)
    tf->epc = elf->e_entry;
ffffffffc0204902:	10e43423          	sd	a4,264(s0)
    tf->status = (sstatus & ~SSTATUS_SPP) | SSTATUS_SPIE;
ffffffffc0204906:	10943023          	sd	s1,256(s0)
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc020490a:	854a                	mv	a0,s2
ffffffffc020490c:	346010ef          	jal	ra,ffffffffc0205c52 <memset>
    return memcpy(proc->name, name, PROC_NAME_LEN);
ffffffffc0204910:	463d                	li	a2,15
ffffffffc0204912:	180c                	addi	a1,sp,48
ffffffffc0204914:	854a                	mv	a0,s2
ffffffffc0204916:	34e010ef          	jal	ra,ffffffffc0205c64 <memcpy>
}
ffffffffc020491a:	70aa                	ld	ra,168(sp)
ffffffffc020491c:	740a                	ld	s0,160(sp)
ffffffffc020491e:	64ea                	ld	s1,152(sp)
ffffffffc0204920:	694a                	ld	s2,144(sp)
ffffffffc0204922:	69aa                	ld	s3,136(sp)
ffffffffc0204924:	7ae6                	ld	s5,120(sp)
ffffffffc0204926:	7b46                	ld	s6,112(sp)
ffffffffc0204928:	7ba6                	ld	s7,104(sp)
ffffffffc020492a:	7c06                	ld	s8,96(sp)
ffffffffc020492c:	6ce6                	ld	s9,88(sp)
ffffffffc020492e:	6d46                	ld	s10,80(sp)
ffffffffc0204930:	6da6                	ld	s11,72(sp)
ffffffffc0204932:	8552                	mv	a0,s4
ffffffffc0204934:	6a0a                	ld	s4,128(sp)
ffffffffc0204936:	614d                	addi	sp,sp,176
ffffffffc0204938:	8082                	ret
    memcpy(local_name, name, len);
ffffffffc020493a:	463d                	li	a2,15
ffffffffc020493c:	85ca                	mv	a1,s2
ffffffffc020493e:	1808                	addi	a0,sp,48
ffffffffc0204940:	324010ef          	jal	ra,ffffffffc0205c64 <memcpy>
    if (mm != NULL)
ffffffffc0204944:	e20991e3          	bnez	s3,ffffffffc0204766 <do_execve+0x62>
    if (current->mm != NULL)
ffffffffc0204948:	000db783          	ld	a5,0(s11)
ffffffffc020494c:	779c                	ld	a5,40(a5)
ffffffffc020494e:	e40788e3          	beqz	a5,ffffffffc020479e <do_execve+0x9a>
        panic("load_icode: current->mm must be empty.\n");
ffffffffc0204952:	00003617          	auipc	a2,0x3
ffffffffc0204956:	d5e60613          	addi	a2,a2,-674 # ffffffffc02076b0 <default_pmm_manager+0xbf0>
ffffffffc020495a:	25900593          	li	a1,601
ffffffffc020495e:	00003517          	auipc	a0,0x3
ffffffffc0204962:	b8a50513          	addi	a0,a0,-1142 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204966:	b2dfb0ef          	jal	ra,ffffffffc0200492 <__panic>
    put_pgdir(mm);
ffffffffc020496a:	8526                	mv	a0,s1
ffffffffc020496c:	c22ff0ef          	jal	ra,ffffffffc0203d8e <put_pgdir>
    mm_destroy(mm);
ffffffffc0204970:	8526                	mv	a0,s1
ffffffffc0204972:	da7fe0ef          	jal	ra,ffffffffc0203718 <mm_destroy>
        ret = -E_INVAL_ELF;
ffffffffc0204976:	5a61                	li	s4,-8
    do_exit(ret);
ffffffffc0204978:	8552                	mv	a0,s4
ffffffffc020497a:	94bff0ef          	jal	ra,ffffffffc02042c4 <do_exit>
    int ret = -E_NO_MEM;
ffffffffc020497e:	5a71                	li	s4,-4
ffffffffc0204980:	bfe5                	j	ffffffffc0204978 <do_execve+0x274>
        if (ph->p_filesz > ph->p_memsz)
ffffffffc0204982:	0289b603          	ld	a2,40(s3)
ffffffffc0204986:	0209b783          	ld	a5,32(s3)
ffffffffc020498a:	1cf66d63          	bltu	a2,a5,ffffffffc0204b64 <do_execve+0x460>
        if (ph->p_flags & ELF_PF_X)
ffffffffc020498e:	0049a783          	lw	a5,4(s3)
ffffffffc0204992:	0017f693          	andi	a3,a5,1
ffffffffc0204996:	c291                	beqz	a3,ffffffffc020499a <do_execve+0x296>
            vm_flags |= VM_EXEC;
ffffffffc0204998:	4691                	li	a3,4
        if (ph->p_flags & ELF_PF_W)
ffffffffc020499a:	0027f713          	andi	a4,a5,2
        if (ph->p_flags & ELF_PF_R)
ffffffffc020499e:	8b91                	andi	a5,a5,4
        if (ph->p_flags & ELF_PF_W)
ffffffffc02049a0:	e779                	bnez	a4,ffffffffc0204a6e <do_execve+0x36a>
        vm_flags = 0, perm = PTE_U | PTE_V;
ffffffffc02049a2:	4d45                	li	s10,17
        if (ph->p_flags & ELF_PF_R)
ffffffffc02049a4:	c781                	beqz	a5,ffffffffc02049ac <do_execve+0x2a8>
            vm_flags |= VM_READ;
ffffffffc02049a6:	0016e693          	ori	a3,a3,1
            perm |= PTE_R;
ffffffffc02049aa:	4d4d                	li	s10,19
        if (vm_flags & VM_WRITE)
ffffffffc02049ac:	0026f793          	andi	a5,a3,2
ffffffffc02049b0:	e3f1                	bnez	a5,ffffffffc0204a74 <do_execve+0x370>
        if (vm_flags & VM_EXEC)
ffffffffc02049b2:	0046f793          	andi	a5,a3,4
ffffffffc02049b6:	c399                	beqz	a5,ffffffffc02049bc <do_execve+0x2b8>
            perm |= PTE_X;
ffffffffc02049b8:	008d6d13          	ori	s10,s10,8
        if ((ret = mm_map(mm, ph->p_va, ph->p_memsz, vm_flags, NULL)) != 0)
ffffffffc02049bc:	0109b583          	ld	a1,16(s3)
ffffffffc02049c0:	4701                	li	a4,0
ffffffffc02049c2:	8526                	mv	a0,s1
ffffffffc02049c4:	da7fe0ef          	jal	ra,ffffffffc020376a <mm_map>
ffffffffc02049c8:	8a2a                	mv	s4,a0
ffffffffc02049ca:	ed35                	bnez	a0,ffffffffc0204a46 <do_execve+0x342>
        uintptr_t start = ph->p_va, end, la = ROUNDDOWN(start, PGSIZE);
ffffffffc02049cc:	0109bb83          	ld	s7,16(s3)
ffffffffc02049d0:	77fd                	lui	a5,0xfffff
        end = ph->p_va + ph->p_filesz;
ffffffffc02049d2:	0209ba03          	ld	s4,32(s3)
        unsigned char *from = binary + ph->p_offset;
ffffffffc02049d6:	0089b903          	ld	s2,8(s3)
        uintptr_t start = ph->p_va, end, la = ROUNDDOWN(start, PGSIZE);
ffffffffc02049da:	00fbfab3          	and	s5,s7,a5
        unsigned char *from = binary + ph->p_offset;
ffffffffc02049de:	7782                	ld	a5,32(sp)
        end = ph->p_va + ph->p_filesz;
ffffffffc02049e0:	9a5e                	add	s4,s4,s7
        unsigned char *from = binary + ph->p_offset;
ffffffffc02049e2:	993e                	add	s2,s2,a5
        while (start < end)
ffffffffc02049e4:	054be963          	bltu	s7,s4,ffffffffc0204a36 <do_execve+0x332>
ffffffffc02049e8:	aa95                	j	ffffffffc0204b5c <do_execve+0x458>
            off = start - la, size = PGSIZE - off, la += PGSIZE;
ffffffffc02049ea:	6785                	lui	a5,0x1
ffffffffc02049ec:	415b8533          	sub	a0,s7,s5
ffffffffc02049f0:	9abe                	add	s5,s5,a5
ffffffffc02049f2:	417a8633          	sub	a2,s5,s7
            if (end < la)
ffffffffc02049f6:	015a7463          	bgeu	s4,s5,ffffffffc02049fe <do_execve+0x2fa>
                size -= la - end;
ffffffffc02049fa:	417a0633          	sub	a2,s4,s7
    return page - pages + nbase;
ffffffffc02049fe:	000cb683          	ld	a3,0(s9)
ffffffffc0204a02:	67c2                	ld	a5,16(sp)
    return KADDR(page2pa(page));
ffffffffc0204a04:	000c3583          	ld	a1,0(s8)
    return page - pages + nbase;
ffffffffc0204a08:	40d406b3          	sub	a3,s0,a3
ffffffffc0204a0c:	8699                	srai	a3,a3,0x6
ffffffffc0204a0e:	96be                	add	a3,a3,a5
    return KADDR(page2pa(page));
ffffffffc0204a10:	67e2                	ld	a5,24(sp)
ffffffffc0204a12:	00f6f833          	and	a6,a3,a5
    return page2ppn(page) << PGSHIFT;
ffffffffc0204a16:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0204a18:	14b87863          	bgeu	a6,a1,ffffffffc0204b68 <do_execve+0x464>
ffffffffc0204a1c:	000b3803          	ld	a6,0(s6)
            memcpy(page2kva(page) + off, from, size);
ffffffffc0204a20:	85ca                	mv	a1,s2
            start += size, from += size;
ffffffffc0204a22:	9bb2                	add	s7,s7,a2
ffffffffc0204a24:	96c2                	add	a3,a3,a6
            memcpy(page2kva(page) + off, from, size);
ffffffffc0204a26:	9536                	add	a0,a0,a3
            start += size, from += size;
ffffffffc0204a28:	e432                	sd	a2,8(sp)
            memcpy(page2kva(page) + off, from, size);
ffffffffc0204a2a:	23a010ef          	jal	ra,ffffffffc0205c64 <memcpy>
            start += size, from += size;
ffffffffc0204a2e:	6622                	ld	a2,8(sp)
ffffffffc0204a30:	9932                	add	s2,s2,a2
        while (start < end)
ffffffffc0204a32:	054bf363          	bgeu	s7,s4,ffffffffc0204a78 <do_execve+0x374>
            if ((page = pgdir_alloc_page(mm->pgdir, la, perm)) == NULL)
ffffffffc0204a36:	6c88                	ld	a0,24(s1)
ffffffffc0204a38:	866a                	mv	a2,s10
ffffffffc0204a3a:	85d6                	mv	a1,s5
ffffffffc0204a3c:	ab7fe0ef          	jal	ra,ffffffffc02034f2 <pgdir_alloc_page>
ffffffffc0204a40:	842a                	mv	s0,a0
ffffffffc0204a42:	f545                	bnez	a0,ffffffffc02049ea <do_execve+0x2e6>
        ret = -E_NO_MEM;
ffffffffc0204a44:	5a71                	li	s4,-4
    exit_mmap(mm);
ffffffffc0204a46:	8526                	mv	a0,s1
ffffffffc0204a48:	e6dfe0ef          	jal	ra,ffffffffc02038b4 <exit_mmap>
    put_pgdir(mm);
ffffffffc0204a4c:	8526                	mv	a0,s1
ffffffffc0204a4e:	b40ff0ef          	jal	ra,ffffffffc0203d8e <put_pgdir>
    mm_destroy(mm);
ffffffffc0204a52:	8526                	mv	a0,s1
ffffffffc0204a54:	cc5fe0ef          	jal	ra,ffffffffc0203718 <mm_destroy>
    return ret;
ffffffffc0204a58:	b705                	j	ffffffffc0204978 <do_execve+0x274>
            exit_mmap(mm);
ffffffffc0204a5a:	854e                	mv	a0,s3
ffffffffc0204a5c:	e59fe0ef          	jal	ra,ffffffffc02038b4 <exit_mmap>
            put_pgdir(mm);
ffffffffc0204a60:	854e                	mv	a0,s3
ffffffffc0204a62:	b2cff0ef          	jal	ra,ffffffffc0203d8e <put_pgdir>
            mm_destroy(mm);
ffffffffc0204a66:	854e                	mv	a0,s3
ffffffffc0204a68:	cb1fe0ef          	jal	ra,ffffffffc0203718 <mm_destroy>
ffffffffc0204a6c:	b32d                	j	ffffffffc0204796 <do_execve+0x92>
            vm_flags |= VM_WRITE;
ffffffffc0204a6e:	0026e693          	ori	a3,a3,2
        if (ph->p_flags & ELF_PF_R)
ffffffffc0204a72:	fb95                	bnez	a5,ffffffffc02049a6 <do_execve+0x2a2>
            perm |= (PTE_W | PTE_R);
ffffffffc0204a74:	4d5d                	li	s10,23
ffffffffc0204a76:	bf35                	j	ffffffffc02049b2 <do_execve+0x2ae>
        end = ph->p_va + ph->p_memsz;
ffffffffc0204a78:	0109b683          	ld	a3,16(s3)
ffffffffc0204a7c:	0289b903          	ld	s2,40(s3)
ffffffffc0204a80:	9936                	add	s2,s2,a3
        if (start < la)
ffffffffc0204a82:	075bfd63          	bgeu	s7,s5,ffffffffc0204afc <do_execve+0x3f8>
            if (start == end)
ffffffffc0204a86:	db790fe3          	beq	s2,s7,ffffffffc0204844 <do_execve+0x140>
            off = start + PGSIZE - la, size = PGSIZE - off;
ffffffffc0204a8a:	6785                	lui	a5,0x1
ffffffffc0204a8c:	00fb8533          	add	a0,s7,a5
ffffffffc0204a90:	41550533          	sub	a0,a0,s5
                size -= la - end;
ffffffffc0204a94:	41790a33          	sub	s4,s2,s7
            if (end < la)
ffffffffc0204a98:	0b597d63          	bgeu	s2,s5,ffffffffc0204b52 <do_execve+0x44e>
    return page - pages + nbase;
ffffffffc0204a9c:	000cb683          	ld	a3,0(s9)
ffffffffc0204aa0:	67c2                	ld	a5,16(sp)
    return KADDR(page2pa(page));
ffffffffc0204aa2:	000c3603          	ld	a2,0(s8)
    return page - pages + nbase;
ffffffffc0204aa6:	40d406b3          	sub	a3,s0,a3
ffffffffc0204aaa:	8699                	srai	a3,a3,0x6
ffffffffc0204aac:	96be                	add	a3,a3,a5
    return KADDR(page2pa(page));
ffffffffc0204aae:	67e2                	ld	a5,24(sp)
ffffffffc0204ab0:	00f6f5b3          	and	a1,a3,a5
    return page2ppn(page) << PGSHIFT;
ffffffffc0204ab4:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0204ab6:	0ac5f963          	bgeu	a1,a2,ffffffffc0204b68 <do_execve+0x464>
ffffffffc0204aba:	000b3803          	ld	a6,0(s6)
            memset(page2kva(page) + off, 0, size);
ffffffffc0204abe:	8652                	mv	a2,s4
ffffffffc0204ac0:	4581                	li	a1,0
ffffffffc0204ac2:	96c2                	add	a3,a3,a6
ffffffffc0204ac4:	9536                	add	a0,a0,a3
ffffffffc0204ac6:	18c010ef          	jal	ra,ffffffffc0205c52 <memset>
            start += size;
ffffffffc0204aca:	017a0733          	add	a4,s4,s7
            assert((end < la && start == end) || (end >= la && start == la));
ffffffffc0204ace:	03597463          	bgeu	s2,s5,ffffffffc0204af6 <do_execve+0x3f2>
ffffffffc0204ad2:	d6e909e3          	beq	s2,a4,ffffffffc0204844 <do_execve+0x140>
ffffffffc0204ad6:	00003697          	auipc	a3,0x3
ffffffffc0204ada:	c0268693          	addi	a3,a3,-1022 # ffffffffc02076d8 <default_pmm_manager+0xc18>
ffffffffc0204ade:	00002617          	auipc	a2,0x2
ffffffffc0204ae2:	c3260613          	addi	a2,a2,-974 # ffffffffc0206710 <commands+0x828>
ffffffffc0204ae6:	2c200593          	li	a1,706
ffffffffc0204aea:	00003517          	auipc	a0,0x3
ffffffffc0204aee:	9fe50513          	addi	a0,a0,-1538 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204af2:	9a1fb0ef          	jal	ra,ffffffffc0200492 <__panic>
ffffffffc0204af6:	ff5710e3          	bne	a4,s5,ffffffffc0204ad6 <do_execve+0x3d2>
ffffffffc0204afa:	8bd6                	mv	s7,s5
        while (start < end)
ffffffffc0204afc:	d52bf4e3          	bgeu	s7,s2,ffffffffc0204844 <do_execve+0x140>
            if ((page = pgdir_alloc_page(mm->pgdir, la, perm)) == NULL)
ffffffffc0204b00:	6c88                	ld	a0,24(s1)
ffffffffc0204b02:	866a                	mv	a2,s10
ffffffffc0204b04:	85d6                	mv	a1,s5
ffffffffc0204b06:	9edfe0ef          	jal	ra,ffffffffc02034f2 <pgdir_alloc_page>
ffffffffc0204b0a:	842a                	mv	s0,a0
ffffffffc0204b0c:	dd05                	beqz	a0,ffffffffc0204a44 <do_execve+0x340>
            off = start - la, size = PGSIZE - off, la += PGSIZE;
ffffffffc0204b0e:	6785                	lui	a5,0x1
ffffffffc0204b10:	415b8533          	sub	a0,s7,s5
ffffffffc0204b14:	9abe                	add	s5,s5,a5
ffffffffc0204b16:	417a8633          	sub	a2,s5,s7
            if (end < la)
ffffffffc0204b1a:	01597463          	bgeu	s2,s5,ffffffffc0204b22 <do_execve+0x41e>
                size -= la - end;
ffffffffc0204b1e:	41790633          	sub	a2,s2,s7
    return page - pages + nbase;
ffffffffc0204b22:	000cb683          	ld	a3,0(s9)
ffffffffc0204b26:	67c2                	ld	a5,16(sp)
    return KADDR(page2pa(page));
ffffffffc0204b28:	000c3583          	ld	a1,0(s8)
    return page - pages + nbase;
ffffffffc0204b2c:	40d406b3          	sub	a3,s0,a3
ffffffffc0204b30:	8699                	srai	a3,a3,0x6
ffffffffc0204b32:	96be                	add	a3,a3,a5
    return KADDR(page2pa(page));
ffffffffc0204b34:	67e2                	ld	a5,24(sp)
ffffffffc0204b36:	00f6f833          	and	a6,a3,a5
    return page2ppn(page) << PGSHIFT;
ffffffffc0204b3a:	06b2                	slli	a3,a3,0xc
    return KADDR(page2pa(page));
ffffffffc0204b3c:	02b87663          	bgeu	a6,a1,ffffffffc0204b68 <do_execve+0x464>
ffffffffc0204b40:	000b3803          	ld	a6,0(s6)
            memset(page2kva(page) + off, 0, size);
ffffffffc0204b44:	4581                	li	a1,0
            start += size;
ffffffffc0204b46:	9bb2                	add	s7,s7,a2
ffffffffc0204b48:	96c2                	add	a3,a3,a6
            memset(page2kva(page) + off, 0, size);
ffffffffc0204b4a:	9536                	add	a0,a0,a3
ffffffffc0204b4c:	106010ef          	jal	ra,ffffffffc0205c52 <memset>
ffffffffc0204b50:	b775                	j	ffffffffc0204afc <do_execve+0x3f8>
            off = start + PGSIZE - la, size = PGSIZE - off;
ffffffffc0204b52:	417a8a33          	sub	s4,s5,s7
ffffffffc0204b56:	b799                	j	ffffffffc0204a9c <do_execve+0x398>
        return -E_INVAL;
ffffffffc0204b58:	5a75                	li	s4,-3
ffffffffc0204b5a:	b3c1                	j	ffffffffc020491a <do_execve+0x216>
        while (start < end)
ffffffffc0204b5c:	86de                	mv	a3,s7
ffffffffc0204b5e:	bf39                	j	ffffffffc0204a7c <do_execve+0x378>
    int ret = -E_NO_MEM;
ffffffffc0204b60:	5a71                	li	s4,-4
ffffffffc0204b62:	bdc5                	j	ffffffffc0204a52 <do_execve+0x34e>
            ret = -E_INVAL_ELF;
ffffffffc0204b64:	5a61                	li	s4,-8
ffffffffc0204b66:	b5c5                	j	ffffffffc0204a46 <do_execve+0x342>
ffffffffc0204b68:	00002617          	auipc	a2,0x2
ffffffffc0204b6c:	f9060613          	addi	a2,a2,-112 # ffffffffc0206af8 <default_pmm_manager+0x38>
ffffffffc0204b70:	07100593          	li	a1,113
ffffffffc0204b74:	00002517          	auipc	a0,0x2
ffffffffc0204b78:	fac50513          	addi	a0,a0,-84 # ffffffffc0206b20 <default_pmm_manager+0x60>
ffffffffc0204b7c:	917fb0ef          	jal	ra,ffffffffc0200492 <__panic>
    current->pgdir = PADDR(mm->pgdir);
ffffffffc0204b80:	00002617          	auipc	a2,0x2
ffffffffc0204b84:	02060613          	addi	a2,a2,32 # ffffffffc0206ba0 <default_pmm_manager+0xe0>
ffffffffc0204b88:	2e100593          	li	a1,737
ffffffffc0204b8c:	00003517          	auipc	a0,0x3
ffffffffc0204b90:	95c50513          	addi	a0,a0,-1700 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204b94:	8fffb0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 4 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204b98:	00003697          	auipc	a3,0x3
ffffffffc0204b9c:	c5868693          	addi	a3,a3,-936 # ffffffffc02077f0 <default_pmm_manager+0xd30>
ffffffffc0204ba0:	00002617          	auipc	a2,0x2
ffffffffc0204ba4:	b7060613          	addi	a2,a2,-1168 # ffffffffc0206710 <commands+0x828>
ffffffffc0204ba8:	2dc00593          	li	a1,732
ffffffffc0204bac:	00003517          	auipc	a0,0x3
ffffffffc0204bb0:	93c50513          	addi	a0,a0,-1732 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204bb4:	8dffb0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 3 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204bb8:	00003697          	auipc	a3,0x3
ffffffffc0204bbc:	bf068693          	addi	a3,a3,-1040 # ffffffffc02077a8 <default_pmm_manager+0xce8>
ffffffffc0204bc0:	00002617          	auipc	a2,0x2
ffffffffc0204bc4:	b5060613          	addi	a2,a2,-1200 # ffffffffc0206710 <commands+0x828>
ffffffffc0204bc8:	2db00593          	li	a1,731
ffffffffc0204bcc:	00003517          	auipc	a0,0x3
ffffffffc0204bd0:	91c50513          	addi	a0,a0,-1764 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204bd4:	8bffb0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - 2 * PGSIZE, PTE_USER) != NULL);
ffffffffc0204bd8:	00003697          	auipc	a3,0x3
ffffffffc0204bdc:	b8868693          	addi	a3,a3,-1144 # ffffffffc0207760 <default_pmm_manager+0xca0>
ffffffffc0204be0:	00002617          	auipc	a2,0x2
ffffffffc0204be4:	b3060613          	addi	a2,a2,-1232 # ffffffffc0206710 <commands+0x828>
ffffffffc0204be8:	2da00593          	li	a1,730
ffffffffc0204bec:	00003517          	auipc	a0,0x3
ffffffffc0204bf0:	8fc50513          	addi	a0,a0,-1796 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204bf4:	89ffb0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - PGSIZE, PTE_USER) != NULL);
ffffffffc0204bf8:	00003697          	auipc	a3,0x3
ffffffffc0204bfc:	b2068693          	addi	a3,a3,-1248 # ffffffffc0207718 <default_pmm_manager+0xc58>
ffffffffc0204c00:	00002617          	auipc	a2,0x2
ffffffffc0204c04:	b1060613          	addi	a2,a2,-1264 # ffffffffc0206710 <commands+0x828>
ffffffffc0204c08:	2d900593          	li	a1,729
ffffffffc0204c0c:	00003517          	auipc	a0,0x3
ffffffffc0204c10:	8dc50513          	addi	a0,a0,-1828 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204c14:	87ffb0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0204c18 <user_main>:
{
ffffffffc0204c18:	1101                	addi	sp,sp,-32
ffffffffc0204c1a:	e04a                	sd	s2,0(sp)
    KERNEL_EXECVE2(TEST, TESTSTART, TESTSIZE);
ffffffffc0204c1c:	000c2917          	auipc	s2,0xc2
ffffffffc0204c20:	edc90913          	addi	s2,s2,-292 # ffffffffc02c6af8 <current>
ffffffffc0204c24:	00093783          	ld	a5,0(s2)
ffffffffc0204c28:	00003617          	auipc	a2,0x3
ffffffffc0204c2c:	c1060613          	addi	a2,a2,-1008 # ffffffffc0207838 <default_pmm_manager+0xd78>
ffffffffc0204c30:	00003517          	auipc	a0,0x3
ffffffffc0204c34:	c1850513          	addi	a0,a0,-1000 # ffffffffc0207848 <default_pmm_manager+0xd88>
ffffffffc0204c38:	43cc                	lw	a1,4(a5)
{
ffffffffc0204c3a:	ec06                	sd	ra,24(sp)
ffffffffc0204c3c:	e822                	sd	s0,16(sp)
ffffffffc0204c3e:	e426                	sd	s1,8(sp)
    KERNEL_EXECVE2(TEST, TESTSTART, TESTSIZE);
ffffffffc0204c40:	d58fb0ef          	jal	ra,ffffffffc0200198 <cprintf>
    size_t len = strlen(name);
ffffffffc0204c44:	00003517          	auipc	a0,0x3
ffffffffc0204c48:	bf450513          	addi	a0,a0,-1036 # ffffffffc0207838 <default_pmm_manager+0xd78>
ffffffffc0204c4c:	765000ef          	jal	ra,ffffffffc0205bb0 <strlen>
    struct trapframe *old_tf = current->tf;
ffffffffc0204c50:	00093783          	ld	a5,0(s2)
    size_t len = strlen(name);
ffffffffc0204c54:	84aa                	mv	s1,a0
    memcpy(new_tf, old_tf, sizeof(struct trapframe));
ffffffffc0204c56:	12000613          	li	a2,288
    struct trapframe *new_tf = (struct trapframe *)(current->kstack + KSTACKSIZE - sizeof(struct trapframe));
ffffffffc0204c5a:	6b80                	ld	s0,16(a5)
    memcpy(new_tf, old_tf, sizeof(struct trapframe));
ffffffffc0204c5c:	73cc                	ld	a1,160(a5)
    struct trapframe *new_tf = (struct trapframe *)(current->kstack + KSTACKSIZE - sizeof(struct trapframe));
ffffffffc0204c5e:	6789                	lui	a5,0x2
ffffffffc0204c60:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_obj___user_faultread_out_size-0x8050>
ffffffffc0204c64:	943e                	add	s0,s0,a5
    memcpy(new_tf, old_tf, sizeof(struct trapframe));
ffffffffc0204c66:	8522                	mv	a0,s0
ffffffffc0204c68:	7fd000ef          	jal	ra,ffffffffc0205c64 <memcpy>
    current->tf = new_tf;
ffffffffc0204c6c:	00093783          	ld	a5,0(s2)
    ret = do_execve(name, len, binary, size);
ffffffffc0204c70:	3fe07697          	auipc	a3,0x3fe07
ffffffffc0204c74:	ac068693          	addi	a3,a3,-1344 # b730 <_binary_obj___user_priority_out_size>
ffffffffc0204c78:	0007d617          	auipc	a2,0x7d
ffffffffc0204c7c:	01860613          	addi	a2,a2,24 # ffffffffc0281c90 <_binary_obj___user_priority_out_start>
    current->tf = new_tf;
ffffffffc0204c80:	f3c0                	sd	s0,160(a5)
    ret = do_execve(name, len, binary, size);
ffffffffc0204c82:	85a6                	mv	a1,s1
ffffffffc0204c84:	00003517          	auipc	a0,0x3
ffffffffc0204c88:	bb450513          	addi	a0,a0,-1100 # ffffffffc0207838 <default_pmm_manager+0xd78>
ffffffffc0204c8c:	a79ff0ef          	jal	ra,ffffffffc0204704 <do_execve>
    asm volatile(
ffffffffc0204c90:	8122                	mv	sp,s0
ffffffffc0204c92:	a06fc06f          	j	ffffffffc0200e98 <__trapret>
    panic("user_main execve failed.\n");
ffffffffc0204c96:	00003617          	auipc	a2,0x3
ffffffffc0204c9a:	bda60613          	addi	a2,a2,-1062 # ffffffffc0207870 <default_pmm_manager+0xdb0>
ffffffffc0204c9e:	3c500593          	li	a1,965
ffffffffc0204ca2:	00003517          	auipc	a0,0x3
ffffffffc0204ca6:	84650513          	addi	a0,a0,-1978 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204caa:	fe8fb0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0204cae <do_yield>:
    current->need_resched = 1;
ffffffffc0204cae:	000c2797          	auipc	a5,0xc2
ffffffffc0204cb2:	e4a7b783          	ld	a5,-438(a5) # ffffffffc02c6af8 <current>
ffffffffc0204cb6:	4705                	li	a4,1
ffffffffc0204cb8:	ef98                	sd	a4,24(a5)
}
ffffffffc0204cba:	4501                	li	a0,0
ffffffffc0204cbc:	8082                	ret

ffffffffc0204cbe <do_wait>:
{
ffffffffc0204cbe:	1101                	addi	sp,sp,-32
ffffffffc0204cc0:	e822                	sd	s0,16(sp)
ffffffffc0204cc2:	e426                	sd	s1,8(sp)
ffffffffc0204cc4:	ec06                	sd	ra,24(sp)
ffffffffc0204cc6:	842e                	mv	s0,a1
ffffffffc0204cc8:	84aa                	mv	s1,a0
    if (code_store != NULL)
ffffffffc0204cca:	c999                	beqz	a1,ffffffffc0204ce0 <do_wait+0x22>
    struct mm_struct *mm = current->mm;
ffffffffc0204ccc:	000c2797          	auipc	a5,0xc2
ffffffffc0204cd0:	e2c7b783          	ld	a5,-468(a5) # ffffffffc02c6af8 <current>
        if (!user_mem_check(mm, (uintptr_t)code_store, sizeof(int), 1))
ffffffffc0204cd4:	7788                	ld	a0,40(a5)
ffffffffc0204cd6:	4685                	li	a3,1
ffffffffc0204cd8:	4611                	li	a2,4
ffffffffc0204cda:	f75fe0ef          	jal	ra,ffffffffc0203c4e <user_mem_check>
ffffffffc0204cde:	c909                	beqz	a0,ffffffffc0204cf0 <do_wait+0x32>
ffffffffc0204ce0:	85a2                	mv	a1,s0
}
ffffffffc0204ce2:	6442                	ld	s0,16(sp)
ffffffffc0204ce4:	60e2                	ld	ra,24(sp)
ffffffffc0204ce6:	8526                	mv	a0,s1
ffffffffc0204ce8:	64a2                	ld	s1,8(sp)
ffffffffc0204cea:	6105                	addi	sp,sp,32
ffffffffc0204cec:	f22ff06f          	j	ffffffffc020440e <do_wait.part.0>
ffffffffc0204cf0:	60e2                	ld	ra,24(sp)
ffffffffc0204cf2:	6442                	ld	s0,16(sp)
ffffffffc0204cf4:	64a2                	ld	s1,8(sp)
ffffffffc0204cf6:	5575                	li	a0,-3
ffffffffc0204cf8:	6105                	addi	sp,sp,32
ffffffffc0204cfa:	8082                	ret

ffffffffc0204cfc <do_kill>:
{
ffffffffc0204cfc:	1141                	addi	sp,sp,-16
    if (0 < pid && pid < MAX_PID)
ffffffffc0204cfe:	6789                	lui	a5,0x2
{
ffffffffc0204d00:	e406                	sd	ra,8(sp)
ffffffffc0204d02:	e022                	sd	s0,0(sp)
    if (0 < pid && pid < MAX_PID)
ffffffffc0204d04:	fff5071b          	addiw	a4,a0,-1
ffffffffc0204d08:	17f9                	addi	a5,a5,-2
ffffffffc0204d0a:	02e7e963          	bltu	a5,a4,ffffffffc0204d3c <do_kill+0x40>
        list_entry_t *list = hash_list + pid_hashfn(pid), *le = list;
ffffffffc0204d0e:	842a                	mv	s0,a0
ffffffffc0204d10:	45a9                	li	a1,10
ffffffffc0204d12:	2501                	sext.w	a0,a0
ffffffffc0204d14:	299000ef          	jal	ra,ffffffffc02057ac <hash32>
ffffffffc0204d18:	02051793          	slli	a5,a0,0x20
ffffffffc0204d1c:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0204d20:	000be797          	auipc	a5,0xbe
ffffffffc0204d24:	d4078793          	addi	a5,a5,-704 # ffffffffc02c2a60 <hash_list>
ffffffffc0204d28:	953e                	add	a0,a0,a5
ffffffffc0204d2a:	87aa                	mv	a5,a0
        while ((le = list_next(le)) != list)
ffffffffc0204d2c:	a029                	j	ffffffffc0204d36 <do_kill+0x3a>
            if (proc->pid == pid)
ffffffffc0204d2e:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0204d32:	00870b63          	beq	a4,s0,ffffffffc0204d48 <do_kill+0x4c>
ffffffffc0204d36:	679c                	ld	a5,8(a5)
        while ((le = list_next(le)) != list)
ffffffffc0204d38:	fef51be3          	bne	a0,a5,ffffffffc0204d2e <do_kill+0x32>
    return -E_INVAL;
ffffffffc0204d3c:	5475                	li	s0,-3
}
ffffffffc0204d3e:	60a2                	ld	ra,8(sp)
ffffffffc0204d40:	8522                	mv	a0,s0
ffffffffc0204d42:	6402                	ld	s0,0(sp)
ffffffffc0204d44:	0141                	addi	sp,sp,16
ffffffffc0204d46:	8082                	ret
        if (!(proc->flags & PF_EXITING))
ffffffffc0204d48:	fd87a703          	lw	a4,-40(a5)
ffffffffc0204d4c:	00177693          	andi	a3,a4,1
ffffffffc0204d50:	e295                	bnez	a3,ffffffffc0204d74 <do_kill+0x78>
            if (proc->wait_state & WT_INTERRUPTED)
ffffffffc0204d52:	4bd4                	lw	a3,20(a5)
            proc->flags |= PF_EXITING;
ffffffffc0204d54:	00176713          	ori	a4,a4,1
ffffffffc0204d58:	fce7ac23          	sw	a4,-40(a5)
            return 0;
ffffffffc0204d5c:	4401                	li	s0,0
            if (proc->wait_state & WT_INTERRUPTED)
ffffffffc0204d5e:	fe06d0e3          	bgez	a3,ffffffffc0204d3e <do_kill+0x42>
                wakeup_proc(proc);
ffffffffc0204d62:	f2878513          	addi	a0,a5,-216
ffffffffc0204d66:	7d4000ef          	jal	ra,ffffffffc020553a <wakeup_proc>
}
ffffffffc0204d6a:	60a2                	ld	ra,8(sp)
ffffffffc0204d6c:	8522                	mv	a0,s0
ffffffffc0204d6e:	6402                	ld	s0,0(sp)
ffffffffc0204d70:	0141                	addi	sp,sp,16
ffffffffc0204d72:	8082                	ret
        return -E_KILLED;
ffffffffc0204d74:	545d                	li	s0,-9
ffffffffc0204d76:	b7e1                	j	ffffffffc0204d3e <do_kill+0x42>

ffffffffc0204d78 <proc_init>:

// proc_init - set up the first kernel thread idleproc "idle" by itself and
//           - create the second kernel thread init_main
void proc_init(void)
{
ffffffffc0204d78:	1101                	addi	sp,sp,-32
ffffffffc0204d7a:	e426                	sd	s1,8(sp)
    elm->prev = elm->next = elm;
ffffffffc0204d7c:	000c2797          	auipc	a5,0xc2
ffffffffc0204d80:	ce478793          	addi	a5,a5,-796 # ffffffffc02c6a60 <proc_list>
ffffffffc0204d84:	ec06                	sd	ra,24(sp)
ffffffffc0204d86:	e822                	sd	s0,16(sp)
ffffffffc0204d88:	e04a                	sd	s2,0(sp)
ffffffffc0204d8a:	000be497          	auipc	s1,0xbe
ffffffffc0204d8e:	cd648493          	addi	s1,s1,-810 # ffffffffc02c2a60 <hash_list>
ffffffffc0204d92:	e79c                	sd	a5,8(a5)
ffffffffc0204d94:	e39c                	sd	a5,0(a5)
    int i;

    list_init(&proc_list);
    for (i = 0; i < HASH_LIST_SIZE; i++)
ffffffffc0204d96:	000c2717          	auipc	a4,0xc2
ffffffffc0204d9a:	cca70713          	addi	a4,a4,-822 # ffffffffc02c6a60 <proc_list>
ffffffffc0204d9e:	87a6                	mv	a5,s1
ffffffffc0204da0:	e79c                	sd	a5,8(a5)
ffffffffc0204da2:	e39c                	sd	a5,0(a5)
ffffffffc0204da4:	07c1                	addi	a5,a5,16
ffffffffc0204da6:	fef71de3          	bne	a4,a5,ffffffffc0204da0 <proc_init+0x28>
    {
        list_init(hash_list + i);
    }

    if ((idleproc = alloc_proc()) == NULL)
ffffffffc0204daa:	f41fe0ef          	jal	ra,ffffffffc0203cea <alloc_proc>
ffffffffc0204dae:	000c2917          	auipc	s2,0xc2
ffffffffc0204db2:	d5290913          	addi	s2,s2,-686 # ffffffffc02c6b00 <idleproc>
ffffffffc0204db6:	00a93023          	sd	a0,0(s2)
ffffffffc0204dba:	0e050f63          	beqz	a0,ffffffffc0204eb8 <proc_init+0x140>
    {
        panic("cannot alloc idleproc.\n");
    }

    idleproc->pid = 0;
    idleproc->state = PROC_RUNNABLE;
ffffffffc0204dbe:	4789                	li	a5,2
ffffffffc0204dc0:	e11c                	sd	a5,0(a0)
    idleproc->kstack = (uintptr_t)bootstack;
ffffffffc0204dc2:	00004797          	auipc	a5,0x4
ffffffffc0204dc6:	23e78793          	addi	a5,a5,574 # ffffffffc0209000 <bootstack>
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204dca:	0b450413          	addi	s0,a0,180
    idleproc->kstack = (uintptr_t)bootstack;
ffffffffc0204dce:	e91c                	sd	a5,16(a0)
    idleproc->need_resched = 1;
ffffffffc0204dd0:	4785                	li	a5,1
ffffffffc0204dd2:	ed1c                	sd	a5,24(a0)
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204dd4:	4641                	li	a2,16
ffffffffc0204dd6:	4581                	li	a1,0
ffffffffc0204dd8:	8522                	mv	a0,s0
ffffffffc0204dda:	679000ef          	jal	ra,ffffffffc0205c52 <memset>
    return memcpy(proc->name, name, PROC_NAME_LEN);
ffffffffc0204dde:	463d                	li	a2,15
ffffffffc0204de0:	00003597          	auipc	a1,0x3
ffffffffc0204de4:	ac858593          	addi	a1,a1,-1336 # ffffffffc02078a8 <default_pmm_manager+0xde8>
ffffffffc0204de8:	8522                	mv	a0,s0
ffffffffc0204dea:	67b000ef          	jal	ra,ffffffffc0205c64 <memcpy>
    set_proc_name(idleproc, "idle");
    nr_process++;
ffffffffc0204dee:	000c2717          	auipc	a4,0xc2
ffffffffc0204df2:	d2270713          	addi	a4,a4,-734 # ffffffffc02c6b10 <nr_process>
ffffffffc0204df6:	431c                	lw	a5,0(a4)

    current = idleproc;
ffffffffc0204df8:	00093683          	ld	a3,0(s2)

    int pid = kernel_thread(init_main, NULL, 0);
ffffffffc0204dfc:	4601                	li	a2,0
    nr_process++;
ffffffffc0204dfe:	2785                	addiw	a5,a5,1
    int pid = kernel_thread(init_main, NULL, 0);
ffffffffc0204e00:	4581                	li	a1,0
ffffffffc0204e02:	fffff517          	auipc	a0,0xfffff
ffffffffc0204e06:	7de50513          	addi	a0,a0,2014 # ffffffffc02045e0 <init_main>
    nr_process++;
ffffffffc0204e0a:	c31c                	sw	a5,0(a4)
    current = idleproc;
ffffffffc0204e0c:	000c2797          	auipc	a5,0xc2
ffffffffc0204e10:	ced7b623          	sd	a3,-788(a5) # ffffffffc02c6af8 <current>
    int pid = kernel_thread(init_main, NULL, 0);
ffffffffc0204e14:	c60ff0ef          	jal	ra,ffffffffc0204274 <kernel_thread>
ffffffffc0204e18:	842a                	mv	s0,a0
    if (pid <= 0)
ffffffffc0204e1a:	08a05363          	blez	a0,ffffffffc0204ea0 <proc_init+0x128>
    if (0 < pid && pid < MAX_PID)
ffffffffc0204e1e:	6789                	lui	a5,0x2
ffffffffc0204e20:	fff5071b          	addiw	a4,a0,-1
ffffffffc0204e24:	17f9                	addi	a5,a5,-2
ffffffffc0204e26:	2501                	sext.w	a0,a0
ffffffffc0204e28:	02e7e363          	bltu	a5,a4,ffffffffc0204e4e <proc_init+0xd6>
        list_entry_t *list = hash_list + pid_hashfn(pid), *le = list;
ffffffffc0204e2c:	45a9                	li	a1,10
ffffffffc0204e2e:	17f000ef          	jal	ra,ffffffffc02057ac <hash32>
ffffffffc0204e32:	02051793          	slli	a5,a0,0x20
ffffffffc0204e36:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0204e3a:	96a6                	add	a3,a3,s1
ffffffffc0204e3c:	87b6                	mv	a5,a3
        while ((le = list_next(le)) != list)
ffffffffc0204e3e:	a029                	j	ffffffffc0204e48 <proc_init+0xd0>
            if (proc->pid == pid)
ffffffffc0204e40:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_obj___user_faultread_out_size-0x8004>
ffffffffc0204e44:	04870b63          	beq	a4,s0,ffffffffc0204e9a <proc_init+0x122>
    return listelm->next;
ffffffffc0204e48:	679c                	ld	a5,8(a5)
        while ((le = list_next(le)) != list)
ffffffffc0204e4a:	fef69be3          	bne	a3,a5,ffffffffc0204e40 <proc_init+0xc8>
    return NULL;
ffffffffc0204e4e:	4781                	li	a5,0
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204e50:	0b478493          	addi	s1,a5,180
ffffffffc0204e54:	4641                	li	a2,16
ffffffffc0204e56:	4581                	li	a1,0
    {
        panic("create init_main failed.\n");
    }

    initproc = find_proc(pid);
ffffffffc0204e58:	000c2417          	auipc	s0,0xc2
ffffffffc0204e5c:	cb040413          	addi	s0,s0,-848 # ffffffffc02c6b08 <initproc>
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204e60:	8526                	mv	a0,s1
    initproc = find_proc(pid);
ffffffffc0204e62:	e01c                	sd	a5,0(s0)
    memset(proc->name, 0, sizeof(proc->name));
ffffffffc0204e64:	5ef000ef          	jal	ra,ffffffffc0205c52 <memset>
    return memcpy(proc->name, name, PROC_NAME_LEN);
ffffffffc0204e68:	463d                	li	a2,15
ffffffffc0204e6a:	00003597          	auipc	a1,0x3
ffffffffc0204e6e:	a6658593          	addi	a1,a1,-1434 # ffffffffc02078d0 <default_pmm_manager+0xe10>
ffffffffc0204e72:	8526                	mv	a0,s1
ffffffffc0204e74:	5f1000ef          	jal	ra,ffffffffc0205c64 <memcpy>
    set_proc_name(initproc, "init");

    assert(idleproc != NULL && idleproc->pid == 0);
ffffffffc0204e78:	00093783          	ld	a5,0(s2)
ffffffffc0204e7c:	cbb5                	beqz	a5,ffffffffc0204ef0 <proc_init+0x178>
ffffffffc0204e7e:	43dc                	lw	a5,4(a5)
ffffffffc0204e80:	eba5                	bnez	a5,ffffffffc0204ef0 <proc_init+0x178>
    assert(initproc != NULL && initproc->pid == 1);
ffffffffc0204e82:	601c                	ld	a5,0(s0)
ffffffffc0204e84:	c7b1                	beqz	a5,ffffffffc0204ed0 <proc_init+0x158>
ffffffffc0204e86:	43d8                	lw	a4,4(a5)
ffffffffc0204e88:	4785                	li	a5,1
ffffffffc0204e8a:	04f71363          	bne	a4,a5,ffffffffc0204ed0 <proc_init+0x158>
}
ffffffffc0204e8e:	60e2                	ld	ra,24(sp)
ffffffffc0204e90:	6442                	ld	s0,16(sp)
ffffffffc0204e92:	64a2                	ld	s1,8(sp)
ffffffffc0204e94:	6902                	ld	s2,0(sp)
ffffffffc0204e96:	6105                	addi	sp,sp,32
ffffffffc0204e98:	8082                	ret
            struct proc_struct *proc = le2proc(le, hash_link);
ffffffffc0204e9a:	f2878793          	addi	a5,a5,-216
ffffffffc0204e9e:	bf4d                	j	ffffffffc0204e50 <proc_init+0xd8>
        panic("create init_main failed.\n");
ffffffffc0204ea0:	00003617          	auipc	a2,0x3
ffffffffc0204ea4:	a1060613          	addi	a2,a2,-1520 # ffffffffc02078b0 <default_pmm_manager+0xdf0>
ffffffffc0204ea8:	40100593          	li	a1,1025
ffffffffc0204eac:	00002517          	auipc	a0,0x2
ffffffffc0204eb0:	63c50513          	addi	a0,a0,1596 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204eb4:	ddefb0ef          	jal	ra,ffffffffc0200492 <__panic>
        panic("cannot alloc idleproc.\n");
ffffffffc0204eb8:	00003617          	auipc	a2,0x3
ffffffffc0204ebc:	9d860613          	addi	a2,a2,-1576 # ffffffffc0207890 <default_pmm_manager+0xdd0>
ffffffffc0204ec0:	3f200593          	li	a1,1010
ffffffffc0204ec4:	00002517          	auipc	a0,0x2
ffffffffc0204ec8:	62450513          	addi	a0,a0,1572 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204ecc:	dc6fb0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(initproc != NULL && initproc->pid == 1);
ffffffffc0204ed0:	00003697          	auipc	a3,0x3
ffffffffc0204ed4:	a3068693          	addi	a3,a3,-1488 # ffffffffc0207900 <default_pmm_manager+0xe40>
ffffffffc0204ed8:	00002617          	auipc	a2,0x2
ffffffffc0204edc:	83860613          	addi	a2,a2,-1992 # ffffffffc0206710 <commands+0x828>
ffffffffc0204ee0:	40800593          	li	a1,1032
ffffffffc0204ee4:	00002517          	auipc	a0,0x2
ffffffffc0204ee8:	60450513          	addi	a0,a0,1540 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204eec:	da6fb0ef          	jal	ra,ffffffffc0200492 <__panic>
    assert(idleproc != NULL && idleproc->pid == 0);
ffffffffc0204ef0:	00003697          	auipc	a3,0x3
ffffffffc0204ef4:	9e868693          	addi	a3,a3,-1560 # ffffffffc02078d8 <default_pmm_manager+0xe18>
ffffffffc0204ef8:	00002617          	auipc	a2,0x2
ffffffffc0204efc:	81860613          	addi	a2,a2,-2024 # ffffffffc0206710 <commands+0x828>
ffffffffc0204f00:	40700593          	li	a1,1031
ffffffffc0204f04:	00002517          	auipc	a0,0x2
ffffffffc0204f08:	5e450513          	addi	a0,a0,1508 # ffffffffc02074e8 <default_pmm_manager+0xa28>
ffffffffc0204f0c:	d86fb0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc0204f10 <cpu_idle>:

// cpu_idle - at the end of kern_init, the first kernel thread idleproc will do below works
void cpu_idle(void)
{
ffffffffc0204f10:	1141                	addi	sp,sp,-16
ffffffffc0204f12:	e022                	sd	s0,0(sp)
ffffffffc0204f14:	e406                	sd	ra,8(sp)
ffffffffc0204f16:	000c2417          	auipc	s0,0xc2
ffffffffc0204f1a:	be240413          	addi	s0,s0,-1054 # ffffffffc02c6af8 <current>
    while (1)
    {
        if (current->need_resched)
ffffffffc0204f1e:	6018                	ld	a4,0(s0)
ffffffffc0204f20:	6f1c                	ld	a5,24(a4)
ffffffffc0204f22:	dffd                	beqz	a5,ffffffffc0204f20 <cpu_idle+0x10>
        {
            schedule();
ffffffffc0204f24:	6c8000ef          	jal	ra,ffffffffc02055ec <schedule>
ffffffffc0204f28:	bfdd                	j	ffffffffc0204f1e <cpu_idle+0xe>

ffffffffc0204f2a <lab6_set_priority>:
        }
    }
}
// FOR LAB6, set the process's priority (bigger value will get more CPU time)
void lab6_set_priority(uint32_t priority)
{
ffffffffc0204f2a:	1141                	addi	sp,sp,-16
ffffffffc0204f2c:	e022                	sd	s0,0(sp)
    cprintf("set priority to %d\n", priority);
ffffffffc0204f2e:	85aa                	mv	a1,a0
{
ffffffffc0204f30:	842a                	mv	s0,a0
    cprintf("set priority to %d\n", priority);
ffffffffc0204f32:	00003517          	auipc	a0,0x3
ffffffffc0204f36:	9f650513          	addi	a0,a0,-1546 # ffffffffc0207928 <default_pmm_manager+0xe68>
{
ffffffffc0204f3a:	e406                	sd	ra,8(sp)
    cprintf("set priority to %d\n", priority);
ffffffffc0204f3c:	a5cfb0ef          	jal	ra,ffffffffc0200198 <cprintf>
    if (priority == 0)
        current->lab6_priority = 1;
ffffffffc0204f40:	000c2797          	auipc	a5,0xc2
ffffffffc0204f44:	bb87b783          	ld	a5,-1096(a5) # ffffffffc02c6af8 <current>
    if (priority == 0)
ffffffffc0204f48:	e801                	bnez	s0,ffffffffc0204f58 <lab6_set_priority+0x2e>
    else
        current->lab6_priority = priority;
}
ffffffffc0204f4a:	60a2                	ld	ra,8(sp)
ffffffffc0204f4c:	6402                	ld	s0,0(sp)
        current->lab6_priority = 1;
ffffffffc0204f4e:	4705                	li	a4,1
ffffffffc0204f50:	14e7a223          	sw	a4,324(a5)
}
ffffffffc0204f54:	0141                	addi	sp,sp,16
ffffffffc0204f56:	8082                	ret
ffffffffc0204f58:	60a2                	ld	ra,8(sp)
        current->lab6_priority = priority;
ffffffffc0204f5a:	1487a223          	sw	s0,324(a5)
}
ffffffffc0204f5e:	6402                	ld	s0,0(sp)
ffffffffc0204f60:	0141                	addi	sp,sp,16
ffffffffc0204f62:	8082                	ret

ffffffffc0204f64 <switch_to>:
.text
# void switch_to(struct proc_struct* from, struct proc_struct* to)
.globl switch_to
switch_to:
    # save from's registers
    STORE ra, 0*REGBYTES(a0)
ffffffffc0204f64:	00153023          	sd	ra,0(a0)
    STORE sp, 1*REGBYTES(a0)
ffffffffc0204f68:	00253423          	sd	sp,8(a0)
    STORE s0, 2*REGBYTES(a0)
ffffffffc0204f6c:	e900                	sd	s0,16(a0)
    STORE s1, 3*REGBYTES(a0)
ffffffffc0204f6e:	ed04                	sd	s1,24(a0)
    STORE s2, 4*REGBYTES(a0)
ffffffffc0204f70:	03253023          	sd	s2,32(a0)
    STORE s3, 5*REGBYTES(a0)
ffffffffc0204f74:	03353423          	sd	s3,40(a0)
    STORE s4, 6*REGBYTES(a0)
ffffffffc0204f78:	03453823          	sd	s4,48(a0)
    STORE s5, 7*REGBYTES(a0)
ffffffffc0204f7c:	03553c23          	sd	s5,56(a0)
    STORE s6, 8*REGBYTES(a0)
ffffffffc0204f80:	05653023          	sd	s6,64(a0)
    STORE s7, 9*REGBYTES(a0)
ffffffffc0204f84:	05753423          	sd	s7,72(a0)
    STORE s8, 10*REGBYTES(a0)
ffffffffc0204f88:	05853823          	sd	s8,80(a0)
    STORE s9, 11*REGBYTES(a0)
ffffffffc0204f8c:	05953c23          	sd	s9,88(a0)
    STORE s10, 12*REGBYTES(a0)
ffffffffc0204f90:	07a53023          	sd	s10,96(a0)
    STORE s11, 13*REGBYTES(a0)
ffffffffc0204f94:	07b53423          	sd	s11,104(a0)

    # restore to's registers
    LOAD ra, 0*REGBYTES(a1)
ffffffffc0204f98:	0005b083          	ld	ra,0(a1)
    LOAD sp, 1*REGBYTES(a1)
ffffffffc0204f9c:	0085b103          	ld	sp,8(a1)
    LOAD s0, 2*REGBYTES(a1)
ffffffffc0204fa0:	6980                	ld	s0,16(a1)
    LOAD s1, 3*REGBYTES(a1)
ffffffffc0204fa2:	6d84                	ld	s1,24(a1)
    LOAD s2, 4*REGBYTES(a1)
ffffffffc0204fa4:	0205b903          	ld	s2,32(a1)
    LOAD s3, 5*REGBYTES(a1)
ffffffffc0204fa8:	0285b983          	ld	s3,40(a1)
    LOAD s4, 6*REGBYTES(a1)
ffffffffc0204fac:	0305ba03          	ld	s4,48(a1)
    LOAD s5, 7*REGBYTES(a1)
ffffffffc0204fb0:	0385ba83          	ld	s5,56(a1)
    LOAD s6, 8*REGBYTES(a1)
ffffffffc0204fb4:	0405bb03          	ld	s6,64(a1)
    LOAD s7, 9*REGBYTES(a1)
ffffffffc0204fb8:	0485bb83          	ld	s7,72(a1)
    LOAD s8, 10*REGBYTES(a1)
ffffffffc0204fbc:	0505bc03          	ld	s8,80(a1)
    LOAD s9, 11*REGBYTES(a1)
ffffffffc0204fc0:	0585bc83          	ld	s9,88(a1)
    LOAD s10, 12*REGBYTES(a1)
ffffffffc0204fc4:	0605bd03          	ld	s10,96(a1)
    LOAD s11, 13*REGBYTES(a1)
ffffffffc0204fc8:	0685bd83          	ld	s11,104(a1)

    ret
ffffffffc0204fcc:	8082                	ret

ffffffffc0204fce <stride_init>:
    elm->prev = elm->next = elm;
ffffffffc0204fce:	e508                	sd	a0,8(a0)
ffffffffc0204fd0:	e108                	sd	a0,0(a0)
      * (1) init the ready process list: rq->run_list
      * (2) init the run pool: rq->lab6_run_pool
      * (3) set number of process: rq->proc_num to 0
      */
     list_init(&(rq->run_list));
     rq->lab6_run_pool = NULL;
ffffffffc0204fd2:	00053c23          	sd	zero,24(a0)
     rq->proc_num = 0;
ffffffffc0204fd6:	00052823          	sw	zero,16(a0)
}
ffffffffc0204fda:	8082                	ret

ffffffffc0204fdc <stride_pick_next>:
             (1.1) If using skew_heap, we can use le2proc get the p from rq->lab6_run_pol
             (1.2) If using list, we have to search list to find the p with minimum stride value
      * (2) update p;s stride value: p->lab6_stride
      * (3) return p
      */
     if (rq->lab6_run_pool == NULL) {
ffffffffc0204fdc:	6d1c                	ld	a5,24(a0)
ffffffffc0204fde:	c395                	beqz	a5,ffffffffc0205002 <stride_pick_next+0x26>
          return NULL;
     }
     struct proc_struct *p = le2proc(rq->lab6_run_pool, lab6_run_pool);
     if (p->lab6_priority == 0) {
ffffffffc0204fe0:	4fd0                	lw	a2,28(a5)
          p->lab6_stride += BIG_STRIDE;
ffffffffc0204fe2:	80000737          	lui	a4,0x80000
ffffffffc0204fe6:	4f94                	lw	a3,24(a5)
     struct proc_struct *p = le2proc(rq->lab6_run_pool, lab6_run_pool);
ffffffffc0204fe8:	ed878513          	addi	a0,a5,-296
          p->lab6_stride += BIG_STRIDE;
ffffffffc0204fec:	fff74713          	not	a4,a4
     if (p->lab6_priority == 0) {
ffffffffc0204ff0:	e601                	bnez	a2,ffffffffc0204ff8 <stride_pick_next+0x1c>
     } else {
          p->lab6_stride += BIG_STRIDE / p->lab6_priority;
ffffffffc0204ff2:	9f35                	addw	a4,a4,a3
ffffffffc0204ff4:	cf98                	sw	a4,24(a5)
ffffffffc0204ff6:	8082                	ret
ffffffffc0204ff8:	02c7573b          	divuw	a4,a4,a2
ffffffffc0204ffc:	9f35                	addw	a4,a4,a3
ffffffffc0204ffe:	cf98                	sw	a4,24(a5)
ffffffffc0205000:	8082                	ret
          return NULL;
ffffffffc0205002:	4501                	li	a0,0
     }
     return p;
}
ffffffffc0205004:	8082                	ret

ffffffffc0205006 <stride_proc_tick>:
 */
static void
stride_proc_tick(struct run_queue *rq, struct proc_struct *proc)
{
     /* LAB6 CHALLENGE 1: YOUR CODE */
     if (proc->time_slice > 0) {
ffffffffc0205006:	1205a783          	lw	a5,288(a1)
ffffffffc020500a:	00f05563          	blez	a5,ffffffffc0205014 <stride_proc_tick+0xe>
          proc->time_slice--;
ffffffffc020500e:	37fd                	addiw	a5,a5,-1
ffffffffc0205010:	12f5a023          	sw	a5,288(a1)
     }
     if (proc->time_slice == 0) {
ffffffffc0205014:	e399                	bnez	a5,ffffffffc020501a <stride_proc_tick+0x14>
          proc->need_resched = 1;
ffffffffc0205016:	4785                	li	a5,1
ffffffffc0205018:	ed9c                	sd	a5,24(a1)
     }
}
ffffffffc020501a:	8082                	ret

ffffffffc020501c <skew_heap_merge.constprop.0>:
{
     a->left = a->right = a->parent = NULL;
}

static inline skew_heap_entry_t *
skew_heap_merge(skew_heap_entry_t *a, skew_heap_entry_t *b,
ffffffffc020501c:	7139                	addi	sp,sp,-64
ffffffffc020501e:	f822                	sd	s0,48(sp)
ffffffffc0205020:	fc06                	sd	ra,56(sp)
ffffffffc0205022:	f426                	sd	s1,40(sp)
ffffffffc0205024:	f04a                	sd	s2,32(sp)
ffffffffc0205026:	ec4e                	sd	s3,24(sp)
ffffffffc0205028:	e852                	sd	s4,16(sp)
ffffffffc020502a:	e456                	sd	s5,8(sp)
ffffffffc020502c:	e05a                	sd	s6,0(sp)
ffffffffc020502e:	842e                	mv	s0,a1
                compare_f comp)
{
     if (a == NULL) return b;
ffffffffc0205030:	c925                	beqz	a0,ffffffffc02050a0 <skew_heap_merge.constprop.0+0x84>
ffffffffc0205032:	84aa                	mv	s1,a0
     else if (b == NULL) return a;
ffffffffc0205034:	c1ed                	beqz	a1,ffffffffc0205116 <skew_heap_merge.constprop.0+0xfa>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc0205036:	4d1c                	lw	a5,24(a0)
ffffffffc0205038:	4d98                	lw	a4,24(a1)
     else if (c == 0)
ffffffffc020503a:	40e786bb          	subw	a3,a5,a4
ffffffffc020503e:	0606cc63          	bltz	a3,ffffffffc02050b6 <skew_heap_merge.constprop.0+0x9a>
          return a;
     }
     else
     {
          r = b->left;
          l = skew_heap_merge(a, b->right, comp);
ffffffffc0205042:	0105b903          	ld	s2,16(a1)
          r = b->left;
ffffffffc0205046:	0085ba03          	ld	s4,8(a1)
     else if (b == NULL) return a;
ffffffffc020504a:	04090763          	beqz	s2,ffffffffc0205098 <skew_heap_merge.constprop.0+0x7c>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc020504e:	01892703          	lw	a4,24(s2)
     else if (c == 0)
ffffffffc0205052:	40e786bb          	subw	a3,a5,a4
ffffffffc0205056:	0c06c263          	bltz	a3,ffffffffc020511a <skew_heap_merge.constprop.0+0xfe>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc020505a:	01093983          	ld	s3,16(s2)
          r = b->left;
ffffffffc020505e:	00893a83          	ld	s5,8(s2)
     else if (b == NULL) return a;
ffffffffc0205062:	10098c63          	beqz	s3,ffffffffc020517a <skew_heap_merge.constprop.0+0x15e>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc0205066:	0189a703          	lw	a4,24(s3)
     else if (c == 0)
ffffffffc020506a:	9f99                	subw	a5,a5,a4
ffffffffc020506c:	1407c863          	bltz	a5,ffffffffc02051bc <skew_heap_merge.constprop.0+0x1a0>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc0205070:	0109b583          	ld	a1,16(s3)
          r = b->left;
ffffffffc0205074:	0089b483          	ld	s1,8(s3)
          l = skew_heap_merge(a, b->right, comp);
ffffffffc0205078:	fa5ff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          
          b->left = l;
ffffffffc020507c:	00a9b423          	sd	a0,8(s3)
          b->right = r;
ffffffffc0205080:	0099b823          	sd	s1,16(s3)
          if (l) l->parent = b;
ffffffffc0205084:	c119                	beqz	a0,ffffffffc020508a <skew_heap_merge.constprop.0+0x6e>
ffffffffc0205086:	01353023          	sd	s3,0(a0)
          b->left = l;
ffffffffc020508a:	01393423          	sd	s3,8(s2)
          b->right = r;
ffffffffc020508e:	01593823          	sd	s5,16(s2)
          if (l) l->parent = b;
ffffffffc0205092:	0129b023          	sd	s2,0(s3)
ffffffffc0205096:	84ca                	mv	s1,s2
          b->left = l;
ffffffffc0205098:	e404                	sd	s1,8(s0)
          b->right = r;
ffffffffc020509a:	01443823          	sd	s4,16(s0)
          if (l) l->parent = b;
ffffffffc020509e:	e080                	sd	s0,0(s1)
ffffffffc02050a0:	8522                	mv	a0,s0

          return b;
     }
}
ffffffffc02050a2:	70e2                	ld	ra,56(sp)
ffffffffc02050a4:	7442                	ld	s0,48(sp)
ffffffffc02050a6:	74a2                	ld	s1,40(sp)
ffffffffc02050a8:	7902                	ld	s2,32(sp)
ffffffffc02050aa:	69e2                	ld	s3,24(sp)
ffffffffc02050ac:	6a42                	ld	s4,16(sp)
ffffffffc02050ae:	6aa2                	ld	s5,8(sp)
ffffffffc02050b0:	6b02                	ld	s6,0(sp)
ffffffffc02050b2:	6121                	addi	sp,sp,64
ffffffffc02050b4:	8082                	ret
          l = skew_heap_merge(a->right, b, comp);
ffffffffc02050b6:	01053903          	ld	s2,16(a0)
          r = a->left;
ffffffffc02050ba:	00853a03          	ld	s4,8(a0)
     if (a == NULL) return b;
ffffffffc02050be:	04090863          	beqz	s2,ffffffffc020510e <skew_heap_merge.constprop.0+0xf2>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc02050c2:	01892783          	lw	a5,24(s2)
     else if (c == 0)
ffffffffc02050c6:	40e7873b          	subw	a4,a5,a4
ffffffffc02050ca:	08074963          	bltz	a4,ffffffffc020515c <skew_heap_merge.constprop.0+0x140>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc02050ce:	0105b983          	ld	s3,16(a1)
          r = b->left;
ffffffffc02050d2:	0085ba83          	ld	s5,8(a1)
     else if (b == NULL) return a;
ffffffffc02050d6:	02098663          	beqz	s3,ffffffffc0205102 <skew_heap_merge.constprop.0+0xe6>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc02050da:	0189a703          	lw	a4,24(s3)
     else if (c == 0)
ffffffffc02050de:	9f99                	subw	a5,a5,a4
ffffffffc02050e0:	0a07cf63          	bltz	a5,ffffffffc020519e <skew_heap_merge.constprop.0+0x182>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc02050e4:	0109b583          	ld	a1,16(s3)
          r = b->left;
ffffffffc02050e8:	0089bb03          	ld	s6,8(s3)
          l = skew_heap_merge(a, b->right, comp);
ffffffffc02050ec:	854a                	mv	a0,s2
ffffffffc02050ee:	f2fff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          b->left = l;
ffffffffc02050f2:	00a9b423          	sd	a0,8(s3)
          b->right = r;
ffffffffc02050f6:	0169b823          	sd	s6,16(s3)
          if (l) l->parent = b;
ffffffffc02050fa:	894e                	mv	s2,s3
ffffffffc02050fc:	c119                	beqz	a0,ffffffffc0205102 <skew_heap_merge.constprop.0+0xe6>
ffffffffc02050fe:	01253023          	sd	s2,0(a0)
          b->left = l;
ffffffffc0205102:	01243423          	sd	s2,8(s0)
          b->right = r;
ffffffffc0205106:	01543823          	sd	s5,16(s0)
          if (l) l->parent = b;
ffffffffc020510a:	00893023          	sd	s0,0(s2)
          a->left = l;
ffffffffc020510e:	e480                	sd	s0,8(s1)
          a->right = r;
ffffffffc0205110:	0144b823          	sd	s4,16(s1)
          if (l) l->parent = a;
ffffffffc0205114:	e004                	sd	s1,0(s0)
ffffffffc0205116:	8526                	mv	a0,s1
ffffffffc0205118:	b769                	j	ffffffffc02050a2 <skew_heap_merge.constprop.0+0x86>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc020511a:	01053983          	ld	s3,16(a0)
          r = a->left;
ffffffffc020511e:	00853a83          	ld	s5,8(a0)
     if (a == NULL) return b;
ffffffffc0205122:	02098663          	beqz	s3,ffffffffc020514e <skew_heap_merge.constprop.0+0x132>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc0205126:	0189a783          	lw	a5,24(s3)
     else if (c == 0)
ffffffffc020512a:	40e7873b          	subw	a4,a5,a4
ffffffffc020512e:	04074863          	bltz	a4,ffffffffc020517e <skew_heap_merge.constprop.0+0x162>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc0205132:	01093583          	ld	a1,16(s2)
          r = b->left;
ffffffffc0205136:	00893b03          	ld	s6,8(s2)
          l = skew_heap_merge(a, b->right, comp);
ffffffffc020513a:	854e                	mv	a0,s3
ffffffffc020513c:	ee1ff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          b->left = l;
ffffffffc0205140:	00a93423          	sd	a0,8(s2)
          b->right = r;
ffffffffc0205144:	01693823          	sd	s6,16(s2)
          if (l) l->parent = b;
ffffffffc0205148:	c119                	beqz	a0,ffffffffc020514e <skew_heap_merge.constprop.0+0x132>
ffffffffc020514a:	01253023          	sd	s2,0(a0)
          a->left = l;
ffffffffc020514e:	0124b423          	sd	s2,8(s1)
          a->right = r;
ffffffffc0205152:	0154b823          	sd	s5,16(s1)
          if (l) l->parent = a;
ffffffffc0205156:	00993023          	sd	s1,0(s2)
ffffffffc020515a:	bf3d                	j	ffffffffc0205098 <skew_heap_merge.constprop.0+0x7c>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc020515c:	01093503          	ld	a0,16(s2)
          r = a->left;
ffffffffc0205160:	00893983          	ld	s3,8(s2)
          l = skew_heap_merge(a->right, b, comp);
ffffffffc0205164:	844a                	mv	s0,s2
ffffffffc0205166:	eb7ff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          a->left = l;
ffffffffc020516a:	00a93423          	sd	a0,8(s2)
          a->right = r;
ffffffffc020516e:	01393823          	sd	s3,16(s2)
          if (l) l->parent = a;
ffffffffc0205172:	dd51                	beqz	a0,ffffffffc020510e <skew_heap_merge.constprop.0+0xf2>
ffffffffc0205174:	01253023          	sd	s2,0(a0)
ffffffffc0205178:	bf59                	j	ffffffffc020510e <skew_heap_merge.constprop.0+0xf2>
          if (l) l->parent = b;
ffffffffc020517a:	89a6                	mv	s3,s1
ffffffffc020517c:	b739                	j	ffffffffc020508a <skew_heap_merge.constprop.0+0x6e>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc020517e:	0109b503          	ld	a0,16(s3)
          r = a->left;
ffffffffc0205182:	0089bb03          	ld	s6,8(s3)
          l = skew_heap_merge(a->right, b, comp);
ffffffffc0205186:	85ca                	mv	a1,s2
ffffffffc0205188:	e95ff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          a->left = l;
ffffffffc020518c:	00a9b423          	sd	a0,8(s3)
          a->right = r;
ffffffffc0205190:	0169b823          	sd	s6,16(s3)
          if (l) l->parent = a;
ffffffffc0205194:	894e                	mv	s2,s3
ffffffffc0205196:	dd45                	beqz	a0,ffffffffc020514e <skew_heap_merge.constprop.0+0x132>
          if (l) l->parent = b;
ffffffffc0205198:	01253023          	sd	s2,0(a0)
ffffffffc020519c:	bf4d                	j	ffffffffc020514e <skew_heap_merge.constprop.0+0x132>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc020519e:	01093503          	ld	a0,16(s2)
          r = a->left;
ffffffffc02051a2:	00893b03          	ld	s6,8(s2)
          l = skew_heap_merge(a->right, b, comp);
ffffffffc02051a6:	85ce                	mv	a1,s3
ffffffffc02051a8:	e75ff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          a->left = l;
ffffffffc02051ac:	00a93423          	sd	a0,8(s2)
          a->right = r;
ffffffffc02051b0:	01693823          	sd	s6,16(s2)
          if (l) l->parent = a;
ffffffffc02051b4:	d539                	beqz	a0,ffffffffc0205102 <skew_heap_merge.constprop.0+0xe6>
          if (l) l->parent = b;
ffffffffc02051b6:	01253023          	sd	s2,0(a0)
ffffffffc02051ba:	b7a1                	j	ffffffffc0205102 <skew_heap_merge.constprop.0+0xe6>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc02051bc:	6908                	ld	a0,16(a0)
          r = a->left;
ffffffffc02051be:	0084bb03          	ld	s6,8(s1)
          l = skew_heap_merge(a->right, b, comp);
ffffffffc02051c2:	85ce                	mv	a1,s3
ffffffffc02051c4:	e59ff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          a->left = l;
ffffffffc02051c8:	e488                	sd	a0,8(s1)
          a->right = r;
ffffffffc02051ca:	0164b823          	sd	s6,16(s1)
          if (l) l->parent = a;
ffffffffc02051ce:	d555                	beqz	a0,ffffffffc020517a <skew_heap_merge.constprop.0+0x15e>
ffffffffc02051d0:	e104                	sd	s1,0(a0)
ffffffffc02051d2:	89a6                	mv	s3,s1
ffffffffc02051d4:	bd5d                	j	ffffffffc020508a <skew_heap_merge.constprop.0+0x6e>

ffffffffc02051d6 <stride_enqueue>:
{
ffffffffc02051d6:	7139                	addi	sp,sp,-64
ffffffffc02051d8:	f04a                	sd	s2,32(sp)
     rq->lab6_run_pool = skew_heap_insert(rq->lab6_run_pool, &(proc->lab6_run_pool), proc_stride_comp_f);
ffffffffc02051da:	01853903          	ld	s2,24(a0)
{
ffffffffc02051de:	f822                	sd	s0,48(sp)
ffffffffc02051e0:	f426                	sd	s1,40(sp)
ffffffffc02051e2:	fc06                	sd	ra,56(sp)
ffffffffc02051e4:	ec4e                	sd	s3,24(sp)
ffffffffc02051e6:	e852                	sd	s4,16(sp)
ffffffffc02051e8:	e456                	sd	s5,8(sp)
     a->left = a->right = a->parent = NULL;
ffffffffc02051ea:	1205b423          	sd	zero,296(a1)
ffffffffc02051ee:	1205bc23          	sd	zero,312(a1)
ffffffffc02051f2:	1205b823          	sd	zero,304(a1)
ffffffffc02051f6:	842e                	mv	s0,a1
ffffffffc02051f8:	84aa                	mv	s1,a0
     rq->lab6_run_pool = skew_heap_insert(rq->lab6_run_pool, &(proc->lab6_run_pool), proc_stride_comp_f);
ffffffffc02051fa:	12858593          	addi	a1,a1,296
     if (a == NULL) return b;
ffffffffc02051fe:	00090d63          	beqz	s2,ffffffffc0205218 <stride_enqueue+0x42>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc0205202:	14042703          	lw	a4,320(s0)
ffffffffc0205206:	01892783          	lw	a5,24(s2)
     else if (c == 0)
ffffffffc020520a:	9f99                	subw	a5,a5,a4
ffffffffc020520c:	0207cd63          	bltz	a5,ffffffffc0205246 <stride_enqueue+0x70>
          b->left = l;
ffffffffc0205210:	13243823          	sd	s2,304(s0)
          if (l) l->parent = b;
ffffffffc0205214:	00b93023          	sd	a1,0(s2)
     if (proc->time_slice == 0 || proc->time_slice > rq->max_time_slice) {
ffffffffc0205218:	12042783          	lw	a5,288(s0)
     rq->lab6_run_pool = skew_heap_insert(rq->lab6_run_pool, &(proc->lab6_run_pool), proc_stride_comp_f);
ffffffffc020521c:	ec8c                	sd	a1,24(s1)
     if (proc->time_slice == 0 || proc->time_slice > rq->max_time_slice) {
ffffffffc020521e:	48d8                	lw	a4,20(s1)
ffffffffc0205220:	c399                	beqz	a5,ffffffffc0205226 <stride_enqueue+0x50>
ffffffffc0205222:	00f75463          	bge	a4,a5,ffffffffc020522a <stride_enqueue+0x54>
          proc->time_slice = rq->max_time_slice;
ffffffffc0205226:	12e42023          	sw	a4,288(s0)
     rq->proc_num++;
ffffffffc020522a:	489c                	lw	a5,16(s1)
}
ffffffffc020522c:	70e2                	ld	ra,56(sp)
     proc->rq = rq;
ffffffffc020522e:	10943423          	sd	s1,264(s0)
}
ffffffffc0205232:	7442                	ld	s0,48(sp)
     rq->proc_num++;
ffffffffc0205234:	2785                	addiw	a5,a5,1
ffffffffc0205236:	c89c                	sw	a5,16(s1)
}
ffffffffc0205238:	7902                	ld	s2,32(sp)
ffffffffc020523a:	74a2                	ld	s1,40(sp)
ffffffffc020523c:	69e2                	ld	s3,24(sp)
ffffffffc020523e:	6a42                	ld	s4,16(sp)
ffffffffc0205240:	6aa2                	ld	s5,8(sp)
ffffffffc0205242:	6121                	addi	sp,sp,64
ffffffffc0205244:	8082                	ret
          l = skew_heap_merge(a->right, b, comp);
ffffffffc0205246:	01093983          	ld	s3,16(s2)
          r = a->left;
ffffffffc020524a:	00893a03          	ld	s4,8(s2)
     if (a == NULL) return b;
ffffffffc020524e:	00098c63          	beqz	s3,ffffffffc0205266 <stride_enqueue+0x90>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc0205252:	0189a783          	lw	a5,24(s3)
     else if (c == 0)
ffffffffc0205256:	40e7873b          	subw	a4,a5,a4
ffffffffc020525a:	00074e63          	bltz	a4,ffffffffc0205276 <stride_enqueue+0xa0>
          b->left = l;
ffffffffc020525e:	13343823          	sd	s3,304(s0)
          if (l) l->parent = b;
ffffffffc0205262:	00b9b023          	sd	a1,0(s3)
          a->left = l;
ffffffffc0205266:	00b93423          	sd	a1,8(s2)
          a->right = r;
ffffffffc020526a:	01493823          	sd	s4,16(s2)
          if (l) l->parent = a;
ffffffffc020526e:	0125b023          	sd	s2,0(a1)
ffffffffc0205272:	85ca                	mv	a1,s2
ffffffffc0205274:	b755                	j	ffffffffc0205218 <stride_enqueue+0x42>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc0205276:	0109b503          	ld	a0,16(s3)
          r = a->left;
ffffffffc020527a:	0089ba83          	ld	s5,8(s3)
          l = skew_heap_merge(a->right, b, comp);
ffffffffc020527e:	d9fff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          a->left = l;
ffffffffc0205282:	00a9b423          	sd	a0,8(s3)
          a->right = r;
ffffffffc0205286:	0159b823          	sd	s5,16(s3)
          if (l) l->parent = a;
ffffffffc020528a:	85ce                	mv	a1,s3
ffffffffc020528c:	dd69                	beqz	a0,ffffffffc0205266 <stride_enqueue+0x90>
ffffffffc020528e:	01353023          	sd	s3,0(a0)
ffffffffc0205292:	bfd1                	j	ffffffffc0205266 <stride_enqueue+0x90>

ffffffffc0205294 <stride_dequeue>:
{
ffffffffc0205294:	711d                	addi	sp,sp,-96
ffffffffc0205296:	e0ca                	sd	s2,64(sp)
static inline skew_heap_entry_t *
skew_heap_remove(skew_heap_entry_t *a, skew_heap_entry_t *b,
                 compare_f comp)
{
     skew_heap_entry_t *p   = b->parent;
     skew_heap_entry_t *rep = skew_heap_merge(b->left, b->right, comp);
ffffffffc0205298:	1305b903          	ld	s2,304(a1)
ffffffffc020529c:	e8a2                	sd	s0,80(sp)
ffffffffc020529e:	e4a6                	sd	s1,72(sp)
ffffffffc02052a0:	fc4e                	sd	s3,56(sp)
ffffffffc02052a2:	f456                	sd	s5,40(sp)
ffffffffc02052a4:	f05a                	sd	s6,32(sp)
ffffffffc02052a6:	ec86                	sd	ra,88(sp)
ffffffffc02052a8:	f852                	sd	s4,48(sp)
ffffffffc02052aa:	ec5e                	sd	s7,24(sp)
ffffffffc02052ac:	e862                	sd	s8,16(sp)
ffffffffc02052ae:	e466                	sd	s9,8(sp)
ffffffffc02052b0:	e06a                	sd	s10,0(sp)
     rq->lab6_run_pool = skew_heap_remove(rq->lab6_run_pool, &(proc->lab6_run_pool), proc_stride_comp_f);
ffffffffc02052b2:	01853b03          	ld	s6,24(a0)
     skew_heap_entry_t *p   = b->parent;
ffffffffc02052b6:	1285b983          	ld	s3,296(a1)
     skew_heap_entry_t *rep = skew_heap_merge(b->left, b->right, comp);
ffffffffc02052ba:	1385b483          	ld	s1,312(a1)
{
ffffffffc02052be:	842e                	mv	s0,a1
ffffffffc02052c0:	8aaa                	mv	s5,a0
     if (a == NULL) return b;
ffffffffc02052c2:	12090563          	beqz	s2,ffffffffc02053ec <stride_dequeue+0x158>
     else if (b == NULL) return a;
ffffffffc02052c6:	12048b63          	beqz	s1,ffffffffc02053fc <stride_dequeue+0x168>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc02052ca:	01892783          	lw	a5,24(s2)
ffffffffc02052ce:	4c98                	lw	a4,24(s1)
     else if (c == 0)
ffffffffc02052d0:	40e786bb          	subw	a3,a5,a4
ffffffffc02052d4:	0a06c663          	bltz	a3,ffffffffc0205380 <stride_dequeue+0xec>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc02052d8:	0104ba03          	ld	s4,16(s1)
          r = b->left;
ffffffffc02052dc:	0084bc03          	ld	s8,8(s1)
     else if (b == NULL) return a;
ffffffffc02052e0:	040a0963          	beqz	s4,ffffffffc0205332 <stride_dequeue+0x9e>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc02052e4:	018a2703          	lw	a4,24(s4)
     else if (c == 0)
ffffffffc02052e8:	40e786bb          	subw	a3,a5,a4
ffffffffc02052ec:	1006cc63          	bltz	a3,ffffffffc0205404 <stride_dequeue+0x170>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc02052f0:	010a3b83          	ld	s7,16(s4)
          r = b->left;
ffffffffc02052f4:	008a3c83          	ld	s9,8(s4)
     else if (b == NULL) return a;
ffffffffc02052f8:	020b8663          	beqz	s7,ffffffffc0205324 <stride_dequeue+0x90>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc02052fc:	018ba703          	lw	a4,24(s7)
     else if (c == 0)
ffffffffc0205300:	9f99                	subw	a5,a5,a4
ffffffffc0205302:	1a07c163          	bltz	a5,ffffffffc02054a4 <stride_dequeue+0x210>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc0205306:	010bb583          	ld	a1,16(s7)
          r = b->left;
ffffffffc020530a:	008bbd03          	ld	s10,8(s7)
          l = skew_heap_merge(a, b->right, comp);
ffffffffc020530e:	854a                	mv	a0,s2
ffffffffc0205310:	d0dff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          b->left = l;
ffffffffc0205314:	00abb423          	sd	a0,8(s7)
          b->right = r;
ffffffffc0205318:	01abb823          	sd	s10,16(s7)
          if (l) l->parent = b;
ffffffffc020531c:	895e                	mv	s2,s7
ffffffffc020531e:	c119                	beqz	a0,ffffffffc0205324 <stride_dequeue+0x90>
ffffffffc0205320:	01253023          	sd	s2,0(a0)
          b->left = l;
ffffffffc0205324:	012a3423          	sd	s2,8(s4)
          b->right = r;
ffffffffc0205328:	019a3823          	sd	s9,16(s4)
          if (l) l->parent = b;
ffffffffc020532c:	01493023          	sd	s4,0(s2)
ffffffffc0205330:	8952                	mv	s2,s4
          b->left = l;
ffffffffc0205332:	0124b423          	sd	s2,8(s1)
          b->right = r;
ffffffffc0205336:	0184b823          	sd	s8,16(s1)
          if (l) l->parent = b;
ffffffffc020533a:	00993023          	sd	s1,0(s2)
     if (rep) rep->parent = p;
ffffffffc020533e:	0134b023          	sd	s3,0(s1)
     
     if (p)
ffffffffc0205342:	0a098863          	beqz	s3,ffffffffc02053f2 <stride_dequeue+0x15e>
     {
          if (p->left == b)
ffffffffc0205346:	0089b783          	ld	a5,8(s3)
     rq->lab6_run_pool = skew_heap_remove(rq->lab6_run_pool, &(proc->lab6_run_pool), proc_stride_comp_f);
ffffffffc020534a:	12840413          	addi	s0,s0,296
ffffffffc020534e:	0a878463          	beq	a5,s0,ffffffffc02053f6 <stride_dequeue+0x162>
               p->left = rep;
          else p->right = rep;
ffffffffc0205352:	0099b823          	sd	s1,16(s3)
     rq->proc_num--;
ffffffffc0205356:	010aa783          	lw	a5,16(s5)
}
ffffffffc020535a:	60e6                	ld	ra,88(sp)
ffffffffc020535c:	6446                	ld	s0,80(sp)
     rq->proc_num--;
ffffffffc020535e:	37fd                	addiw	a5,a5,-1
     rq->lab6_run_pool = skew_heap_remove(rq->lab6_run_pool, &(proc->lab6_run_pool), proc_stride_comp_f);
ffffffffc0205360:	016abc23          	sd	s6,24(s5)
     rq->proc_num--;
ffffffffc0205364:	00faa823          	sw	a5,16(s5)
}
ffffffffc0205368:	64a6                	ld	s1,72(sp)
ffffffffc020536a:	6906                	ld	s2,64(sp)
ffffffffc020536c:	79e2                	ld	s3,56(sp)
ffffffffc020536e:	7a42                	ld	s4,48(sp)
ffffffffc0205370:	7aa2                	ld	s5,40(sp)
ffffffffc0205372:	7b02                	ld	s6,32(sp)
ffffffffc0205374:	6be2                	ld	s7,24(sp)
ffffffffc0205376:	6c42                	ld	s8,16(sp)
ffffffffc0205378:	6ca2                	ld	s9,8(sp)
ffffffffc020537a:	6d02                	ld	s10,0(sp)
ffffffffc020537c:	6125                	addi	sp,sp,96
ffffffffc020537e:	8082                	ret
          l = skew_heap_merge(a->right, b, comp);
ffffffffc0205380:	01093a03          	ld	s4,16(s2)
          r = a->left;
ffffffffc0205384:	00893c03          	ld	s8,8(s2)
     if (a == NULL) return b;
ffffffffc0205388:	040a0863          	beqz	s4,ffffffffc02053d8 <stride_dequeue+0x144>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc020538c:	018a2783          	lw	a5,24(s4)
     else if (c == 0)
ffffffffc0205390:	40e7873b          	subw	a4,a5,a4
ffffffffc0205394:	0a074963          	bltz	a4,ffffffffc0205446 <stride_dequeue+0x1b2>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc0205398:	0104bb83          	ld	s7,16(s1)
          r = b->left;
ffffffffc020539c:	0084bc83          	ld	s9,8(s1)
     else if (b == NULL) return a;
ffffffffc02053a0:	020b8663          	beqz	s7,ffffffffc02053cc <stride_dequeue+0x138>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc02053a4:	018ba703          	lw	a4,24(s7)
     else if (c == 0)
ffffffffc02053a8:	9f99                	subw	a5,a5,a4
ffffffffc02053aa:	0c07ce63          	bltz	a5,ffffffffc0205486 <stride_dequeue+0x1f2>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc02053ae:	010bb583          	ld	a1,16(s7)
          r = b->left;
ffffffffc02053b2:	008bbd03          	ld	s10,8(s7)
          l = skew_heap_merge(a, b->right, comp);
ffffffffc02053b6:	8552                	mv	a0,s4
ffffffffc02053b8:	c65ff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          b->left = l;
ffffffffc02053bc:	00abb423          	sd	a0,8(s7)
          b->right = r;
ffffffffc02053c0:	01abb823          	sd	s10,16(s7)
          if (l) l->parent = b;
ffffffffc02053c4:	8a5e                	mv	s4,s7
ffffffffc02053c6:	c119                	beqz	a0,ffffffffc02053cc <stride_dequeue+0x138>
ffffffffc02053c8:	01453023          	sd	s4,0(a0)
          b->left = l;
ffffffffc02053cc:	0144b423          	sd	s4,8(s1)
          b->right = r;
ffffffffc02053d0:	0194b823          	sd	s9,16(s1)
          if (l) l->parent = b;
ffffffffc02053d4:	009a3023          	sd	s1,0(s4)
          a->left = l;
ffffffffc02053d8:	00993423          	sd	s1,8(s2)
          a->right = r;
ffffffffc02053dc:	01893823          	sd	s8,16(s2)
          if (l) l->parent = a;
ffffffffc02053e0:	0124b023          	sd	s2,0(s1)
ffffffffc02053e4:	84ca                	mv	s1,s2
     if (rep) rep->parent = p;
ffffffffc02053e6:	0134b023          	sd	s3,0(s1)
ffffffffc02053ea:	bfa1                	j	ffffffffc0205342 <stride_dequeue+0xae>
ffffffffc02053ec:	f8a9                	bnez	s1,ffffffffc020533e <stride_dequeue+0xaa>
     if (p)
ffffffffc02053ee:	f4099ce3          	bnez	s3,ffffffffc0205346 <stride_dequeue+0xb2>
ffffffffc02053f2:	8b26                	mv	s6,s1
ffffffffc02053f4:	b78d                	j	ffffffffc0205356 <stride_dequeue+0xc2>
               p->left = rep;
ffffffffc02053f6:	0099b423          	sd	s1,8(s3)
ffffffffc02053fa:	bfb1                	j	ffffffffc0205356 <stride_dequeue+0xc2>
ffffffffc02053fc:	84ca                	mv	s1,s2
     if (rep) rep->parent = p;
ffffffffc02053fe:	0134b023          	sd	s3,0(s1)
ffffffffc0205402:	b781                	j	ffffffffc0205342 <stride_dequeue+0xae>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc0205404:	01093b83          	ld	s7,16(s2)
          r = a->left;
ffffffffc0205408:	00893c83          	ld	s9,8(s2)
     if (a == NULL) return b;
ffffffffc020540c:	020b8663          	beqz	s7,ffffffffc0205438 <stride_dequeue+0x1a4>
     int32_t c = p->lab6_stride - q->lab6_stride;
ffffffffc0205410:	018ba783          	lw	a5,24(s7)
     else if (c == 0)
ffffffffc0205414:	40e7873b          	subw	a4,a5,a4
ffffffffc0205418:	04074763          	bltz	a4,ffffffffc0205466 <stride_dequeue+0x1d2>
          l = skew_heap_merge(a, b->right, comp);
ffffffffc020541c:	010a3583          	ld	a1,16(s4)
          r = b->left;
ffffffffc0205420:	008a3d03          	ld	s10,8(s4)
          l = skew_heap_merge(a, b->right, comp);
ffffffffc0205424:	855e                	mv	a0,s7
ffffffffc0205426:	bf7ff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          b->left = l;
ffffffffc020542a:	00aa3423          	sd	a0,8(s4)
          b->right = r;
ffffffffc020542e:	01aa3823          	sd	s10,16(s4)
          if (l) l->parent = b;
ffffffffc0205432:	c119                	beqz	a0,ffffffffc0205438 <stride_dequeue+0x1a4>
ffffffffc0205434:	01453023          	sd	s4,0(a0)
          a->left = l;
ffffffffc0205438:	01493423          	sd	s4,8(s2)
          a->right = r;
ffffffffc020543c:	01993823          	sd	s9,16(s2)
          if (l) l->parent = a;
ffffffffc0205440:	012a3023          	sd	s2,0(s4)
ffffffffc0205444:	b5fd                	j	ffffffffc0205332 <stride_dequeue+0x9e>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc0205446:	010a3503          	ld	a0,16(s4)
          r = a->left;
ffffffffc020544a:	008a3b83          	ld	s7,8(s4)
          l = skew_heap_merge(a->right, b, comp);
ffffffffc020544e:	85a6                	mv	a1,s1
ffffffffc0205450:	bcdff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          a->left = l;
ffffffffc0205454:	00aa3423          	sd	a0,8(s4)
          a->right = r;
ffffffffc0205458:	017a3823          	sd	s7,16(s4)
          if (l) l->parent = a;
ffffffffc020545c:	84d2                	mv	s1,s4
ffffffffc020545e:	dd2d                	beqz	a0,ffffffffc02053d8 <stride_dequeue+0x144>
ffffffffc0205460:	01453023          	sd	s4,0(a0)
ffffffffc0205464:	bf95                	j	ffffffffc02053d8 <stride_dequeue+0x144>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc0205466:	010bb503          	ld	a0,16(s7)
          r = a->left;
ffffffffc020546a:	008bbd03          	ld	s10,8(s7)
          l = skew_heap_merge(a->right, b, comp);
ffffffffc020546e:	85d2                	mv	a1,s4
ffffffffc0205470:	badff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          a->left = l;
ffffffffc0205474:	00abb423          	sd	a0,8(s7)
          a->right = r;
ffffffffc0205478:	01abb823          	sd	s10,16(s7)
          if (l) l->parent = a;
ffffffffc020547c:	8a5e                	mv	s4,s7
ffffffffc020547e:	dd4d                	beqz	a0,ffffffffc0205438 <stride_dequeue+0x1a4>
          if (l) l->parent = b;
ffffffffc0205480:	01453023          	sd	s4,0(a0)
ffffffffc0205484:	bf55                	j	ffffffffc0205438 <stride_dequeue+0x1a4>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc0205486:	010a3503          	ld	a0,16(s4)
          r = a->left;
ffffffffc020548a:	008a3d03          	ld	s10,8(s4)
          l = skew_heap_merge(a->right, b, comp);
ffffffffc020548e:	85de                	mv	a1,s7
ffffffffc0205490:	b8dff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          a->left = l;
ffffffffc0205494:	00aa3423          	sd	a0,8(s4)
          a->right = r;
ffffffffc0205498:	01aa3823          	sd	s10,16(s4)
          if (l) l->parent = a;
ffffffffc020549c:	d905                	beqz	a0,ffffffffc02053cc <stride_dequeue+0x138>
          if (l) l->parent = b;
ffffffffc020549e:	01453023          	sd	s4,0(a0)
ffffffffc02054a2:	b72d                	j	ffffffffc02053cc <stride_dequeue+0x138>
          l = skew_heap_merge(a->right, b, comp);
ffffffffc02054a4:	01093503          	ld	a0,16(s2)
          r = a->left;
ffffffffc02054a8:	00893d03          	ld	s10,8(s2)
          l = skew_heap_merge(a->right, b, comp);
ffffffffc02054ac:	85de                	mv	a1,s7
ffffffffc02054ae:	b6fff0ef          	jal	ra,ffffffffc020501c <skew_heap_merge.constprop.0>
          a->left = l;
ffffffffc02054b2:	00a93423          	sd	a0,8(s2)
          a->right = r;
ffffffffc02054b6:	01a93823          	sd	s10,16(s2)
          if (l) l->parent = a;
ffffffffc02054ba:	e60513e3          	bnez	a0,ffffffffc0205320 <stride_dequeue+0x8c>
ffffffffc02054be:	b59d                	j	ffffffffc0205324 <stride_dequeue+0x90>

ffffffffc02054c0 <sched_class_proc_tick>:
    return sched_class->pick_next(rq);
}

void sched_class_proc_tick(struct proc_struct *proc)
{
    if (proc != idleproc)
ffffffffc02054c0:	000c1797          	auipc	a5,0xc1
ffffffffc02054c4:	6407b783          	ld	a5,1600(a5) # ffffffffc02c6b00 <idleproc>
{
ffffffffc02054c8:	85aa                	mv	a1,a0
    if (proc != idleproc)
ffffffffc02054ca:	00a78c63          	beq	a5,a0,ffffffffc02054e2 <sched_class_proc_tick+0x22>
    {
        sched_class->proc_tick(rq, proc);
ffffffffc02054ce:	000c1797          	auipc	a5,0xc1
ffffffffc02054d2:	6527b783          	ld	a5,1618(a5) # ffffffffc02c6b20 <sched_class>
ffffffffc02054d6:	779c                	ld	a5,40(a5)
ffffffffc02054d8:	000c1517          	auipc	a0,0xc1
ffffffffc02054dc:	64053503          	ld	a0,1600(a0) # ffffffffc02c6b18 <rq>
ffffffffc02054e0:	8782                	jr	a5
    }
    else
    {
        proc->need_resched = 1;
ffffffffc02054e2:	4705                	li	a4,1
ffffffffc02054e4:	ef98                	sd	a4,24(a5)
    }
}
ffffffffc02054e6:	8082                	ret

ffffffffc02054e8 <sched_init>:

static struct run_queue __rq;

void sched_init(void)
{
ffffffffc02054e8:	1141                	addi	sp,sp,-16
    list_init(&timer_list);

    sched_class = &stride_sched_class;
ffffffffc02054ea:	000bd717          	auipc	a4,0xbd
ffffffffc02054ee:	11e70713          	addi	a4,a4,286 # ffffffffc02c2608 <stride_sched_class>
{
ffffffffc02054f2:	e022                	sd	s0,0(sp)
ffffffffc02054f4:	e406                	sd	ra,8(sp)
ffffffffc02054f6:	000c1797          	auipc	a5,0xc1
ffffffffc02054fa:	59a78793          	addi	a5,a5,1434 # ffffffffc02c6a90 <timer_list>

    rq = &__rq;
    rq->max_time_slice = MAX_TIME_SLICE;
    sched_class->init(rq);
ffffffffc02054fe:	6714                	ld	a3,8(a4)
    rq = &__rq;
ffffffffc0205500:	000c1517          	auipc	a0,0xc1
ffffffffc0205504:	57050513          	addi	a0,a0,1392 # ffffffffc02c6a70 <__rq>
ffffffffc0205508:	e79c                	sd	a5,8(a5)
ffffffffc020550a:	e39c                	sd	a5,0(a5)
    rq->max_time_slice = MAX_TIME_SLICE;
ffffffffc020550c:	4795                	li	a5,5
ffffffffc020550e:	c95c                	sw	a5,20(a0)
    sched_class = &stride_sched_class;
ffffffffc0205510:	000c1417          	auipc	s0,0xc1
ffffffffc0205514:	61040413          	addi	s0,s0,1552 # ffffffffc02c6b20 <sched_class>
    rq = &__rq;
ffffffffc0205518:	000c1797          	auipc	a5,0xc1
ffffffffc020551c:	60a7b023          	sd	a0,1536(a5) # ffffffffc02c6b18 <rq>
    sched_class = &stride_sched_class;
ffffffffc0205520:	e018                	sd	a4,0(s0)
    sched_class->init(rq);
ffffffffc0205522:	9682                	jalr	a3

    cprintf("sched class: %s\n", sched_class->name);
ffffffffc0205524:	601c                	ld	a5,0(s0)
}
ffffffffc0205526:	6402                	ld	s0,0(sp)
ffffffffc0205528:	60a2                	ld	ra,8(sp)
    cprintf("sched class: %s\n", sched_class->name);
ffffffffc020552a:	638c                	ld	a1,0(a5)
ffffffffc020552c:	00002517          	auipc	a0,0x2
ffffffffc0205530:	42c50513          	addi	a0,a0,1068 # ffffffffc0207958 <default_pmm_manager+0xe98>
}
ffffffffc0205534:	0141                	addi	sp,sp,16
    cprintf("sched class: %s\n", sched_class->name);
ffffffffc0205536:	c63fa06f          	j	ffffffffc0200198 <cprintf>

ffffffffc020553a <wakeup_proc>:

void wakeup_proc(struct proc_struct *proc)
{
    assert(proc->state != PROC_ZOMBIE);
ffffffffc020553a:	4118                	lw	a4,0(a0)
{
ffffffffc020553c:	1101                	addi	sp,sp,-32
ffffffffc020553e:	ec06                	sd	ra,24(sp)
ffffffffc0205540:	e822                	sd	s0,16(sp)
ffffffffc0205542:	e426                	sd	s1,8(sp)
    assert(proc->state != PROC_ZOMBIE);
ffffffffc0205544:	478d                	li	a5,3
ffffffffc0205546:	08f70363          	beq	a4,a5,ffffffffc02055cc <wakeup_proc+0x92>
ffffffffc020554a:	842a                	mv	s0,a0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc020554c:	100027f3          	csrr	a5,sstatus
ffffffffc0205550:	8b89                	andi	a5,a5,2
    return 0;
ffffffffc0205552:	4481                	li	s1,0
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc0205554:	e7bd                	bnez	a5,ffffffffc02055c2 <wakeup_proc+0x88>
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        if (proc->state != PROC_RUNNABLE)
ffffffffc0205556:	4789                	li	a5,2
ffffffffc0205558:	04f70863          	beq	a4,a5,ffffffffc02055a8 <wakeup_proc+0x6e>
        {
            proc->state = PROC_RUNNABLE;
ffffffffc020555c:	c01c                	sw	a5,0(s0)
            proc->wait_state = 0;
ffffffffc020555e:	0e042623          	sw	zero,236(s0)
            if (proc != current)
ffffffffc0205562:	000c1797          	auipc	a5,0xc1
ffffffffc0205566:	5967b783          	ld	a5,1430(a5) # ffffffffc02c6af8 <current>
ffffffffc020556a:	02878363          	beq	a5,s0,ffffffffc0205590 <wakeup_proc+0x56>
    if (proc != idleproc)
ffffffffc020556e:	000c1797          	auipc	a5,0xc1
ffffffffc0205572:	5927b783          	ld	a5,1426(a5) # ffffffffc02c6b00 <idleproc>
ffffffffc0205576:	00f40d63          	beq	s0,a5,ffffffffc0205590 <wakeup_proc+0x56>
        sched_class->enqueue(rq, proc);
ffffffffc020557a:	000c1797          	auipc	a5,0xc1
ffffffffc020557e:	5a67b783          	ld	a5,1446(a5) # ffffffffc02c6b20 <sched_class>
ffffffffc0205582:	6b9c                	ld	a5,16(a5)
ffffffffc0205584:	85a2                	mv	a1,s0
ffffffffc0205586:	000c1517          	auipc	a0,0xc1
ffffffffc020558a:	59253503          	ld	a0,1426(a0) # ffffffffc02c6b18 <rq>
ffffffffc020558e:	9782                	jalr	a5
    if (flag)
ffffffffc0205590:	e491                	bnez	s1,ffffffffc020559c <wakeup_proc+0x62>
        {
            warn("wakeup runnable process.\n");
        }
    }
    local_intr_restore(intr_flag);
}
ffffffffc0205592:	60e2                	ld	ra,24(sp)
ffffffffc0205594:	6442                	ld	s0,16(sp)
ffffffffc0205596:	64a2                	ld	s1,8(sp)
ffffffffc0205598:	6105                	addi	sp,sp,32
ffffffffc020559a:	8082                	ret
ffffffffc020559c:	6442                	ld	s0,16(sp)
ffffffffc020559e:	60e2                	ld	ra,24(sp)
ffffffffc02055a0:	64a2                	ld	s1,8(sp)
ffffffffc02055a2:	6105                	addi	sp,sp,32
        intr_enable();
ffffffffc02055a4:	c04fb06f          	j	ffffffffc02009a8 <intr_enable>
            warn("wakeup runnable process.\n");
ffffffffc02055a8:	00002617          	auipc	a2,0x2
ffffffffc02055ac:	40060613          	addi	a2,a2,1024 # ffffffffc02079a8 <default_pmm_manager+0xee8>
ffffffffc02055b0:	05100593          	li	a1,81
ffffffffc02055b4:	00002517          	auipc	a0,0x2
ffffffffc02055b8:	3dc50513          	addi	a0,a0,988 # ffffffffc0207990 <default_pmm_manager+0xed0>
ffffffffc02055bc:	f3ffa0ef          	jal	ra,ffffffffc02004fa <__warn>
ffffffffc02055c0:	bfc1                	j	ffffffffc0205590 <wakeup_proc+0x56>
        intr_disable();
ffffffffc02055c2:	becfb0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        if (proc->state != PROC_RUNNABLE)
ffffffffc02055c6:	4018                	lw	a4,0(s0)
        return 1;
ffffffffc02055c8:	4485                	li	s1,1
ffffffffc02055ca:	b771                	j	ffffffffc0205556 <wakeup_proc+0x1c>
    assert(proc->state != PROC_ZOMBIE);
ffffffffc02055cc:	00002697          	auipc	a3,0x2
ffffffffc02055d0:	3a468693          	addi	a3,a3,932 # ffffffffc0207970 <default_pmm_manager+0xeb0>
ffffffffc02055d4:	00001617          	auipc	a2,0x1
ffffffffc02055d8:	13c60613          	addi	a2,a2,316 # ffffffffc0206710 <commands+0x828>
ffffffffc02055dc:	04200593          	li	a1,66
ffffffffc02055e0:	00002517          	auipc	a0,0x2
ffffffffc02055e4:	3b050513          	addi	a0,a0,944 # ffffffffc0207990 <default_pmm_manager+0xed0>
ffffffffc02055e8:	eabfa0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02055ec <schedule>:

void schedule(void)
{
ffffffffc02055ec:	7179                	addi	sp,sp,-48
ffffffffc02055ee:	f406                	sd	ra,40(sp)
ffffffffc02055f0:	f022                	sd	s0,32(sp)
ffffffffc02055f2:	ec26                	sd	s1,24(sp)
ffffffffc02055f4:	e84a                	sd	s2,16(sp)
ffffffffc02055f6:	e44e                	sd	s3,8(sp)
ffffffffc02055f8:	e052                	sd	s4,0(sp)
    if (read_csr(sstatus) & SSTATUS_SIE)
ffffffffc02055fa:	100027f3          	csrr	a5,sstatus
ffffffffc02055fe:	8b89                	andi	a5,a5,2
ffffffffc0205600:	4a01                	li	s4,0
ffffffffc0205602:	e3cd                	bnez	a5,ffffffffc02056a4 <schedule+0xb8>
    bool intr_flag;
    struct proc_struct *next;
    local_intr_save(intr_flag);
    {
        current->need_resched = 0;
ffffffffc0205604:	000c1497          	auipc	s1,0xc1
ffffffffc0205608:	4f448493          	addi	s1,s1,1268 # ffffffffc02c6af8 <current>
ffffffffc020560c:	608c                	ld	a1,0(s1)
        sched_class->enqueue(rq, proc);
ffffffffc020560e:	000c1997          	auipc	s3,0xc1
ffffffffc0205612:	51298993          	addi	s3,s3,1298 # ffffffffc02c6b20 <sched_class>
ffffffffc0205616:	000c1917          	auipc	s2,0xc1
ffffffffc020561a:	50290913          	addi	s2,s2,1282 # ffffffffc02c6b18 <rq>
        if (current->state == PROC_RUNNABLE)
ffffffffc020561e:	4194                	lw	a3,0(a1)
        current->need_resched = 0;
ffffffffc0205620:	0005bc23          	sd	zero,24(a1)
        if (current->state == PROC_RUNNABLE)
ffffffffc0205624:	4709                	li	a4,2
        sched_class->enqueue(rq, proc);
ffffffffc0205626:	0009b783          	ld	a5,0(s3)
ffffffffc020562a:	00093503          	ld	a0,0(s2)
        if (current->state == PROC_RUNNABLE)
ffffffffc020562e:	04e68e63          	beq	a3,a4,ffffffffc020568a <schedule+0x9e>
    return sched_class->pick_next(rq);
ffffffffc0205632:	739c                	ld	a5,32(a5)
ffffffffc0205634:	9782                	jalr	a5
ffffffffc0205636:	842a                	mv	s0,a0
        {
            sched_class_enqueue(current);
        }
        if ((next = sched_class_pick_next()) != NULL)
ffffffffc0205638:	c521                	beqz	a0,ffffffffc0205680 <schedule+0x94>
    sched_class->dequeue(rq, proc);
ffffffffc020563a:	0009b783          	ld	a5,0(s3)
ffffffffc020563e:	00093503          	ld	a0,0(s2)
ffffffffc0205642:	85a2                	mv	a1,s0
ffffffffc0205644:	6f9c                	ld	a5,24(a5)
ffffffffc0205646:	9782                	jalr	a5
        }
        if (next == NULL)
        {
            next = idleproc;
        }
        next->runs++;
ffffffffc0205648:	441c                	lw	a5,8(s0)
        if (next != current)
ffffffffc020564a:	6098                	ld	a4,0(s1)
        next->runs++;
ffffffffc020564c:	2785                	addiw	a5,a5,1
ffffffffc020564e:	c41c                	sw	a5,8(s0)
        if (next != current)
ffffffffc0205650:	00870563          	beq	a4,s0,ffffffffc020565a <schedule+0x6e>
        {
            proc_run(next);
ffffffffc0205654:	8522                	mv	a0,s0
ffffffffc0205656:	faefe0ef          	jal	ra,ffffffffc0203e04 <proc_run>
    if (flag)
ffffffffc020565a:	000a1a63          	bnez	s4,ffffffffc020566e <schedule+0x82>
        }
    }
    local_intr_restore(intr_flag);
}
ffffffffc020565e:	70a2                	ld	ra,40(sp)
ffffffffc0205660:	7402                	ld	s0,32(sp)
ffffffffc0205662:	64e2                	ld	s1,24(sp)
ffffffffc0205664:	6942                	ld	s2,16(sp)
ffffffffc0205666:	69a2                	ld	s3,8(sp)
ffffffffc0205668:	6a02                	ld	s4,0(sp)
ffffffffc020566a:	6145                	addi	sp,sp,48
ffffffffc020566c:	8082                	ret
ffffffffc020566e:	7402                	ld	s0,32(sp)
ffffffffc0205670:	70a2                	ld	ra,40(sp)
ffffffffc0205672:	64e2                	ld	s1,24(sp)
ffffffffc0205674:	6942                	ld	s2,16(sp)
ffffffffc0205676:	69a2                	ld	s3,8(sp)
ffffffffc0205678:	6a02                	ld	s4,0(sp)
ffffffffc020567a:	6145                	addi	sp,sp,48
        intr_enable();
ffffffffc020567c:	b2cfb06f          	j	ffffffffc02009a8 <intr_enable>
            next = idleproc;
ffffffffc0205680:	000c1417          	auipc	s0,0xc1
ffffffffc0205684:	48043403          	ld	s0,1152(s0) # ffffffffc02c6b00 <idleproc>
ffffffffc0205688:	b7c1                	j	ffffffffc0205648 <schedule+0x5c>
    if (proc != idleproc)
ffffffffc020568a:	000c1717          	auipc	a4,0xc1
ffffffffc020568e:	47673703          	ld	a4,1142(a4) # ffffffffc02c6b00 <idleproc>
ffffffffc0205692:	fae580e3          	beq	a1,a4,ffffffffc0205632 <schedule+0x46>
        sched_class->enqueue(rq, proc);
ffffffffc0205696:	6b9c                	ld	a5,16(a5)
ffffffffc0205698:	9782                	jalr	a5
    return sched_class->pick_next(rq);
ffffffffc020569a:	0009b783          	ld	a5,0(s3)
ffffffffc020569e:	00093503          	ld	a0,0(s2)
ffffffffc02056a2:	bf41                	j	ffffffffc0205632 <schedule+0x46>
        intr_disable();
ffffffffc02056a4:	b0afb0ef          	jal	ra,ffffffffc02009ae <intr_disable>
        return 1;
ffffffffc02056a8:	4a05                	li	s4,1
ffffffffc02056aa:	bfa9                	j	ffffffffc0205604 <schedule+0x18>

ffffffffc02056ac <sys_getpid>:
    return do_kill(pid);
}

static int
sys_getpid(uint64_t arg[]) {
    return current->pid;
ffffffffc02056ac:	000c1797          	auipc	a5,0xc1
ffffffffc02056b0:	44c7b783          	ld	a5,1100(a5) # ffffffffc02c6af8 <current>
}
ffffffffc02056b4:	43c8                	lw	a0,4(a5)
ffffffffc02056b6:	8082                	ret

ffffffffc02056b8 <sys_pgdir>:

static int
sys_pgdir(uint64_t arg[]) {
    //print_pgdir();
    return 0;
}
ffffffffc02056b8:	4501                	li	a0,0
ffffffffc02056ba:	8082                	ret

ffffffffc02056bc <sys_gettime>:
static int sys_gettime(uint64_t arg[]){
    return (int)ticks*10;
ffffffffc02056bc:	000c1797          	auipc	a5,0xc1
ffffffffc02056c0:	3ec7b783          	ld	a5,1004(a5) # ffffffffc02c6aa8 <ticks>
ffffffffc02056c4:	0027951b          	slliw	a0,a5,0x2
ffffffffc02056c8:	9d3d                	addw	a0,a0,a5
}
ffffffffc02056ca:	0015151b          	slliw	a0,a0,0x1
ffffffffc02056ce:	8082                	ret

ffffffffc02056d0 <sys_lab6_set_priority>:
static int sys_lab6_set_priority(uint64_t arg[]){
    uint64_t priority = (uint64_t)arg[0];
    lab6_set_priority(priority);
ffffffffc02056d0:	4108                	lw	a0,0(a0)
static int sys_lab6_set_priority(uint64_t arg[]){
ffffffffc02056d2:	1141                	addi	sp,sp,-16
ffffffffc02056d4:	e406                	sd	ra,8(sp)
    lab6_set_priority(priority);
ffffffffc02056d6:	855ff0ef          	jal	ra,ffffffffc0204f2a <lab6_set_priority>
    return 0;
}
ffffffffc02056da:	60a2                	ld	ra,8(sp)
ffffffffc02056dc:	4501                	li	a0,0
ffffffffc02056de:	0141                	addi	sp,sp,16
ffffffffc02056e0:	8082                	ret

ffffffffc02056e2 <sys_putc>:
    cputchar(c);
ffffffffc02056e2:	4108                	lw	a0,0(a0)
sys_putc(uint64_t arg[]) {
ffffffffc02056e4:	1141                	addi	sp,sp,-16
ffffffffc02056e6:	e406                	sd	ra,8(sp)
    cputchar(c);
ffffffffc02056e8:	ae7fa0ef          	jal	ra,ffffffffc02001ce <cputchar>
}
ffffffffc02056ec:	60a2                	ld	ra,8(sp)
ffffffffc02056ee:	4501                	li	a0,0
ffffffffc02056f0:	0141                	addi	sp,sp,16
ffffffffc02056f2:	8082                	ret

ffffffffc02056f4 <sys_kill>:
    return do_kill(pid);
ffffffffc02056f4:	4108                	lw	a0,0(a0)
ffffffffc02056f6:	e06ff06f          	j	ffffffffc0204cfc <do_kill>

ffffffffc02056fa <sys_yield>:
    return do_yield();
ffffffffc02056fa:	db4ff06f          	j	ffffffffc0204cae <do_yield>

ffffffffc02056fe <sys_exec>:
    return do_execve(name, len, binary, size);
ffffffffc02056fe:	6d14                	ld	a3,24(a0)
ffffffffc0205700:	6910                	ld	a2,16(a0)
ffffffffc0205702:	650c                	ld	a1,8(a0)
ffffffffc0205704:	6108                	ld	a0,0(a0)
ffffffffc0205706:	ffffe06f          	j	ffffffffc0204704 <do_execve>

ffffffffc020570a <sys_wait>:
    return do_wait(pid, store);
ffffffffc020570a:	650c                	ld	a1,8(a0)
ffffffffc020570c:	4108                	lw	a0,0(a0)
ffffffffc020570e:	db0ff06f          	j	ffffffffc0204cbe <do_wait>

ffffffffc0205712 <sys_fork>:
    struct trapframe *tf = current->tf;
ffffffffc0205712:	000c1797          	auipc	a5,0xc1
ffffffffc0205716:	3e67b783          	ld	a5,998(a5) # ffffffffc02c6af8 <current>
ffffffffc020571a:	73d0                	ld	a2,160(a5)
    return do_fork(0, stack, tf);
ffffffffc020571c:	4501                	li	a0,0
ffffffffc020571e:	6a0c                	ld	a1,16(a2)
ffffffffc0205720:	f50fe06f          	j	ffffffffc0203e70 <do_fork>

ffffffffc0205724 <sys_exit>:
    return do_exit(error_code);
ffffffffc0205724:	4108                	lw	a0,0(a0)
ffffffffc0205726:	b9ffe06f          	j	ffffffffc02042c4 <do_exit>

ffffffffc020572a <syscall>:
};

#define NUM_SYSCALLS        ((sizeof(syscalls)) / (sizeof(syscalls[0])))

void
syscall(void) {
ffffffffc020572a:	715d                	addi	sp,sp,-80
ffffffffc020572c:	fc26                	sd	s1,56(sp)
    struct trapframe *tf = current->tf;
ffffffffc020572e:	000c1497          	auipc	s1,0xc1
ffffffffc0205732:	3ca48493          	addi	s1,s1,970 # ffffffffc02c6af8 <current>
ffffffffc0205736:	6098                	ld	a4,0(s1)
syscall(void) {
ffffffffc0205738:	e0a2                	sd	s0,64(sp)
ffffffffc020573a:	f84a                	sd	s2,48(sp)
    struct trapframe *tf = current->tf;
ffffffffc020573c:	7340                	ld	s0,160(a4)
syscall(void) {
ffffffffc020573e:	e486                	sd	ra,72(sp)
    uint64_t arg[5];
    int num = tf->gpr.a0;
    if (num >= 0 && num < NUM_SYSCALLS) {
ffffffffc0205740:	0ff00793          	li	a5,255
    int num = tf->gpr.a0;
ffffffffc0205744:	05042903          	lw	s2,80(s0)
    if (num >= 0 && num < NUM_SYSCALLS) {
ffffffffc0205748:	0327ee63          	bltu	a5,s2,ffffffffc0205784 <syscall+0x5a>
        if (syscalls[num] != NULL) {
ffffffffc020574c:	00391713          	slli	a4,s2,0x3
ffffffffc0205750:	00002797          	auipc	a5,0x2
ffffffffc0205754:	2c078793          	addi	a5,a5,704 # ffffffffc0207a10 <syscalls>
ffffffffc0205758:	97ba                	add	a5,a5,a4
ffffffffc020575a:	639c                	ld	a5,0(a5)
ffffffffc020575c:	c785                	beqz	a5,ffffffffc0205784 <syscall+0x5a>
            arg[0] = tf->gpr.a1;
ffffffffc020575e:	6c28                	ld	a0,88(s0)
            arg[1] = tf->gpr.a2;
ffffffffc0205760:	702c                	ld	a1,96(s0)
            arg[2] = tf->gpr.a3;
ffffffffc0205762:	7430                	ld	a2,104(s0)
            arg[3] = tf->gpr.a4;
ffffffffc0205764:	7834                	ld	a3,112(s0)
            arg[4] = tf->gpr.a5;
ffffffffc0205766:	7c38                	ld	a4,120(s0)
            arg[0] = tf->gpr.a1;
ffffffffc0205768:	e42a                	sd	a0,8(sp)
            arg[1] = tf->gpr.a2;
ffffffffc020576a:	e82e                	sd	a1,16(sp)
            arg[2] = tf->gpr.a3;
ffffffffc020576c:	ec32                	sd	a2,24(sp)
            arg[3] = tf->gpr.a4;
ffffffffc020576e:	f036                	sd	a3,32(sp)
            arg[4] = tf->gpr.a5;
ffffffffc0205770:	f43a                	sd	a4,40(sp)
            tf->gpr.a0 = syscalls[num](arg);
ffffffffc0205772:	0028                	addi	a0,sp,8
ffffffffc0205774:	9782                	jalr	a5
        }
    }
    print_trapframe(tf);
    panic("undefined syscall %d, pid = %d, name = %s.\n",
            num, current->pid, current->name);
}
ffffffffc0205776:	60a6                	ld	ra,72(sp)
            tf->gpr.a0 = syscalls[num](arg);
ffffffffc0205778:	e828                	sd	a0,80(s0)
}
ffffffffc020577a:	6406                	ld	s0,64(sp)
ffffffffc020577c:	74e2                	ld	s1,56(sp)
ffffffffc020577e:	7942                	ld	s2,48(sp)
ffffffffc0205780:	6161                	addi	sp,sp,80
ffffffffc0205782:	8082                	ret
    print_trapframe(tf);
ffffffffc0205784:	8522                	mv	a0,s0
ffffffffc0205786:	c18fb0ef          	jal	ra,ffffffffc0200b9e <print_trapframe>
    panic("undefined syscall %d, pid = %d, name = %s.\n",
ffffffffc020578a:	609c                	ld	a5,0(s1)
ffffffffc020578c:	86ca                	mv	a3,s2
ffffffffc020578e:	00002617          	auipc	a2,0x2
ffffffffc0205792:	23a60613          	addi	a2,a2,570 # ffffffffc02079c8 <default_pmm_manager+0xf08>
ffffffffc0205796:	43d8                	lw	a4,4(a5)
ffffffffc0205798:	06c00593          	li	a1,108
ffffffffc020579c:	0b478793          	addi	a5,a5,180
ffffffffc02057a0:	00002517          	auipc	a0,0x2
ffffffffc02057a4:	25850513          	addi	a0,a0,600 # ffffffffc02079f8 <default_pmm_manager+0xf38>
ffffffffc02057a8:	cebfa0ef          	jal	ra,ffffffffc0200492 <__panic>

ffffffffc02057ac <hash32>:
 *
 * High bits are more random, so we use them.
 * */
uint32_t
hash32(uint32_t val, unsigned int bits) {
    uint32_t hash = val * GOLDEN_RATIO_PRIME_32;
ffffffffc02057ac:	9e3707b7          	lui	a5,0x9e370
ffffffffc02057b0:	2785                	addiw	a5,a5,1
ffffffffc02057b2:	02a7853b          	mulw	a0,a5,a0
    return (hash >> (32 - bits));
ffffffffc02057b6:	02000793          	li	a5,32
ffffffffc02057ba:	9f8d                	subw	a5,a5,a1
}
ffffffffc02057bc:	00f5553b          	srlw	a0,a0,a5
ffffffffc02057c0:	8082                	ret

ffffffffc02057c2 <printnum>:
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
    unsigned long long result = num;
    unsigned mod = do_div(result, base);
ffffffffc02057c2:	02069813          	slli	a6,a3,0x20
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc02057c6:	7179                	addi	sp,sp,-48
    unsigned mod = do_div(result, base);
ffffffffc02057c8:	02085813          	srli	a6,a6,0x20
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc02057cc:	e052                	sd	s4,0(sp)
    unsigned mod = do_div(result, base);
ffffffffc02057ce:	03067a33          	remu	s4,a2,a6
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc02057d2:	f022                	sd	s0,32(sp)
ffffffffc02057d4:	ec26                	sd	s1,24(sp)
ffffffffc02057d6:	e84a                	sd	s2,16(sp)
ffffffffc02057d8:	f406                	sd	ra,40(sp)
ffffffffc02057da:	e44e                	sd	s3,8(sp)
ffffffffc02057dc:	84aa                	mv	s1,a0
ffffffffc02057de:	892e                	mv	s2,a1
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
ffffffffc02057e0:	fff7041b          	addiw	s0,a4,-1
    unsigned mod = do_div(result, base);
ffffffffc02057e4:	2a01                	sext.w	s4,s4
    if (num >= base) {
ffffffffc02057e6:	03067e63          	bgeu	a2,a6,ffffffffc0205822 <printnum+0x60>
ffffffffc02057ea:	89be                	mv	s3,a5
        while (-- width > 0)
ffffffffc02057ec:	00805763          	blez	s0,ffffffffc02057fa <printnum+0x38>
ffffffffc02057f0:	347d                	addiw	s0,s0,-1
            putch(padc, putdat);
ffffffffc02057f2:	85ca                	mv	a1,s2
ffffffffc02057f4:	854e                	mv	a0,s3
ffffffffc02057f6:	9482                	jalr	s1
        while (-- width > 0)
ffffffffc02057f8:	fc65                	bnez	s0,ffffffffc02057f0 <printnum+0x2e>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
ffffffffc02057fa:	1a02                	slli	s4,s4,0x20
ffffffffc02057fc:	00003797          	auipc	a5,0x3
ffffffffc0205800:	a1478793          	addi	a5,a5,-1516 # ffffffffc0208210 <syscalls+0x800>
ffffffffc0205804:	020a5a13          	srli	s4,s4,0x20
ffffffffc0205808:	9a3e                	add	s4,s4,a5
    // Crashes if num >= base. No idea what going on here
    // Here is a quick fix
    // update: Stack grows downward and destory the SBI
    // sbi_console_putchar("0123456789abcdef"[mod]);
    // (*(int *)putdat)++;
}
ffffffffc020580a:	7402                	ld	s0,32(sp)
    putch("0123456789abcdef"[mod], putdat);
ffffffffc020580c:	000a4503          	lbu	a0,0(s4)
}
ffffffffc0205810:	70a2                	ld	ra,40(sp)
ffffffffc0205812:	69a2                	ld	s3,8(sp)
ffffffffc0205814:	6a02                	ld	s4,0(sp)
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0205816:	85ca                	mv	a1,s2
ffffffffc0205818:	87a6                	mv	a5,s1
}
ffffffffc020581a:	6942                	ld	s2,16(sp)
ffffffffc020581c:	64e2                	ld	s1,24(sp)
ffffffffc020581e:	6145                	addi	sp,sp,48
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0205820:	8782                	jr	a5
        printnum(putch, putdat, result, base, width - 1, padc);
ffffffffc0205822:	03065633          	divu	a2,a2,a6
ffffffffc0205826:	8722                	mv	a4,s0
ffffffffc0205828:	f9bff0ef          	jal	ra,ffffffffc02057c2 <printnum>
ffffffffc020582c:	b7f9                	j	ffffffffc02057fa <printnum+0x38>

ffffffffc020582e <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
ffffffffc020582e:	7119                	addi	sp,sp,-128
ffffffffc0205830:	f4a6                	sd	s1,104(sp)
ffffffffc0205832:	f0ca                	sd	s2,96(sp)
ffffffffc0205834:	ecce                	sd	s3,88(sp)
ffffffffc0205836:	e8d2                	sd	s4,80(sp)
ffffffffc0205838:	e4d6                	sd	s5,72(sp)
ffffffffc020583a:	e0da                	sd	s6,64(sp)
ffffffffc020583c:	fc5e                	sd	s7,56(sp)
ffffffffc020583e:	f06a                	sd	s10,32(sp)
ffffffffc0205840:	fc86                	sd	ra,120(sp)
ffffffffc0205842:	f8a2                	sd	s0,112(sp)
ffffffffc0205844:	f862                	sd	s8,48(sp)
ffffffffc0205846:	f466                	sd	s9,40(sp)
ffffffffc0205848:	ec6e                	sd	s11,24(sp)
ffffffffc020584a:	892a                	mv	s2,a0
ffffffffc020584c:	84ae                	mv	s1,a1
ffffffffc020584e:	8d32                	mv	s10,a2
ffffffffc0205850:	8a36                	mv	s4,a3
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc0205852:	02500993          	li	s3,37
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
        width = precision = -1;
ffffffffc0205856:	5b7d                	li	s6,-1
ffffffffc0205858:	00003a97          	auipc	s5,0x3
ffffffffc020585c:	9e4a8a93          	addi	s5,s5,-1564 # ffffffffc020823c <syscalls+0x82c>
        case 'e':
            err = va_arg(ap, int);
            if (err < 0) {
                err = -err;
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc0205860:	00003b97          	auipc	s7,0x3
ffffffffc0205864:	bf8b8b93          	addi	s7,s7,-1032 # ffffffffc0208458 <error_string>
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc0205868:	000d4503          	lbu	a0,0(s10)
ffffffffc020586c:	001d0413          	addi	s0,s10,1
ffffffffc0205870:	01350a63          	beq	a0,s3,ffffffffc0205884 <vprintfmt+0x56>
            if (ch == '\0') {
ffffffffc0205874:	c121                	beqz	a0,ffffffffc02058b4 <vprintfmt+0x86>
            putch(ch, putdat);
ffffffffc0205876:	85a6                	mv	a1,s1
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc0205878:	0405                	addi	s0,s0,1
            putch(ch, putdat);
ffffffffc020587a:	9902                	jalr	s2
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc020587c:	fff44503          	lbu	a0,-1(s0)
ffffffffc0205880:	ff351ae3          	bne	a0,s3,ffffffffc0205874 <vprintfmt+0x46>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0205884:	00044603          	lbu	a2,0(s0)
        char padc = ' ';
ffffffffc0205888:	02000793          	li	a5,32
        lflag = altflag = 0;
ffffffffc020588c:	4c81                	li	s9,0
ffffffffc020588e:	4881                	li	a7,0
        width = precision = -1;
ffffffffc0205890:	5c7d                	li	s8,-1
ffffffffc0205892:	5dfd                	li	s11,-1
ffffffffc0205894:	05500513          	li	a0,85
                if (ch < '0' || ch > '9') {
ffffffffc0205898:	4825                	li	a6,9
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc020589a:	fdd6059b          	addiw	a1,a2,-35
ffffffffc020589e:	0ff5f593          	zext.b	a1,a1
ffffffffc02058a2:	00140d13          	addi	s10,s0,1
ffffffffc02058a6:	04b56263          	bltu	a0,a1,ffffffffc02058ea <vprintfmt+0xbc>
ffffffffc02058aa:	058a                	slli	a1,a1,0x2
ffffffffc02058ac:	95d6                	add	a1,a1,s5
ffffffffc02058ae:	4194                	lw	a3,0(a1)
ffffffffc02058b0:	96d6                	add	a3,a3,s5
ffffffffc02058b2:	8682                	jr	a3
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
ffffffffc02058b4:	70e6                	ld	ra,120(sp)
ffffffffc02058b6:	7446                	ld	s0,112(sp)
ffffffffc02058b8:	74a6                	ld	s1,104(sp)
ffffffffc02058ba:	7906                	ld	s2,96(sp)
ffffffffc02058bc:	69e6                	ld	s3,88(sp)
ffffffffc02058be:	6a46                	ld	s4,80(sp)
ffffffffc02058c0:	6aa6                	ld	s5,72(sp)
ffffffffc02058c2:	6b06                	ld	s6,64(sp)
ffffffffc02058c4:	7be2                	ld	s7,56(sp)
ffffffffc02058c6:	7c42                	ld	s8,48(sp)
ffffffffc02058c8:	7ca2                	ld	s9,40(sp)
ffffffffc02058ca:	7d02                	ld	s10,32(sp)
ffffffffc02058cc:	6de2                	ld	s11,24(sp)
ffffffffc02058ce:	6109                	addi	sp,sp,128
ffffffffc02058d0:	8082                	ret
            padc = '0';
ffffffffc02058d2:	87b2                	mv	a5,a2
            goto reswitch;
ffffffffc02058d4:	00144603          	lbu	a2,1(s0)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02058d8:	846a                	mv	s0,s10
ffffffffc02058da:	00140d13          	addi	s10,s0,1
ffffffffc02058de:	fdd6059b          	addiw	a1,a2,-35
ffffffffc02058e2:	0ff5f593          	zext.b	a1,a1
ffffffffc02058e6:	fcb572e3          	bgeu	a0,a1,ffffffffc02058aa <vprintfmt+0x7c>
            putch('%', putdat);
ffffffffc02058ea:	85a6                	mv	a1,s1
ffffffffc02058ec:	02500513          	li	a0,37
ffffffffc02058f0:	9902                	jalr	s2
            for (fmt --; fmt[-1] != '%'; fmt --)
ffffffffc02058f2:	fff44783          	lbu	a5,-1(s0)
ffffffffc02058f6:	8d22                	mv	s10,s0
ffffffffc02058f8:	f73788e3          	beq	a5,s3,ffffffffc0205868 <vprintfmt+0x3a>
ffffffffc02058fc:	ffed4783          	lbu	a5,-2(s10)
ffffffffc0205900:	1d7d                	addi	s10,s10,-1
ffffffffc0205902:	ff379de3          	bne	a5,s3,ffffffffc02058fc <vprintfmt+0xce>
ffffffffc0205906:	b78d                	j	ffffffffc0205868 <vprintfmt+0x3a>
                precision = precision * 10 + ch - '0';
ffffffffc0205908:	fd060c1b          	addiw	s8,a2,-48
                ch = *fmt;
ffffffffc020590c:	00144603          	lbu	a2,1(s0)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0205910:	846a                	mv	s0,s10
                if (ch < '0' || ch > '9') {
ffffffffc0205912:	fd06069b          	addiw	a3,a2,-48
                ch = *fmt;
ffffffffc0205916:	0006059b          	sext.w	a1,a2
                if (ch < '0' || ch > '9') {
ffffffffc020591a:	02d86463          	bltu	a6,a3,ffffffffc0205942 <vprintfmt+0x114>
                ch = *fmt;
ffffffffc020591e:	00144603          	lbu	a2,1(s0)
                precision = precision * 10 + ch - '0';
ffffffffc0205922:	002c169b          	slliw	a3,s8,0x2
ffffffffc0205926:	0186873b          	addw	a4,a3,s8
ffffffffc020592a:	0017171b          	slliw	a4,a4,0x1
ffffffffc020592e:	9f2d                	addw	a4,a4,a1
                if (ch < '0' || ch > '9') {
ffffffffc0205930:	fd06069b          	addiw	a3,a2,-48
            for (precision = 0; ; ++ fmt) {
ffffffffc0205934:	0405                	addi	s0,s0,1
                precision = precision * 10 + ch - '0';
ffffffffc0205936:	fd070c1b          	addiw	s8,a4,-48
                ch = *fmt;
ffffffffc020593a:	0006059b          	sext.w	a1,a2
                if (ch < '0' || ch > '9') {
ffffffffc020593e:	fed870e3          	bgeu	a6,a3,ffffffffc020591e <vprintfmt+0xf0>
            if (width < 0)
ffffffffc0205942:	f40ddce3          	bgez	s11,ffffffffc020589a <vprintfmt+0x6c>
                width = precision, precision = -1;
ffffffffc0205946:	8de2                	mv	s11,s8
ffffffffc0205948:	5c7d                	li	s8,-1
ffffffffc020594a:	bf81                	j	ffffffffc020589a <vprintfmt+0x6c>
            if (width < 0)
ffffffffc020594c:	fffdc693          	not	a3,s11
ffffffffc0205950:	96fd                	srai	a3,a3,0x3f
ffffffffc0205952:	00ddfdb3          	and	s11,s11,a3
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0205956:	00144603          	lbu	a2,1(s0)
ffffffffc020595a:	2d81                	sext.w	s11,s11
ffffffffc020595c:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc020595e:	bf35                	j	ffffffffc020589a <vprintfmt+0x6c>
            precision = va_arg(ap, int);
ffffffffc0205960:	000a2c03          	lw	s8,0(s4)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0205964:	00144603          	lbu	a2,1(s0)
            precision = va_arg(ap, int);
ffffffffc0205968:	0a21                	addi	s4,s4,8
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc020596a:	846a                	mv	s0,s10
            goto process_precision;
ffffffffc020596c:	bfd9                	j	ffffffffc0205942 <vprintfmt+0x114>
    if (lflag >= 2) {
ffffffffc020596e:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc0205970:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc0205974:	01174463          	blt	a4,a7,ffffffffc020597c <vprintfmt+0x14e>
    else if (lflag) {
ffffffffc0205978:	1a088e63          	beqz	a7,ffffffffc0205b34 <vprintfmt+0x306>
        return va_arg(*ap, unsigned long);
ffffffffc020597c:	000a3603          	ld	a2,0(s4)
ffffffffc0205980:	46c1                	li	a3,16
ffffffffc0205982:	8a2e                	mv	s4,a1
            printnum(putch, putdat, num, base, width, padc);
ffffffffc0205984:	2781                	sext.w	a5,a5
ffffffffc0205986:	876e                	mv	a4,s11
ffffffffc0205988:	85a6                	mv	a1,s1
ffffffffc020598a:	854a                	mv	a0,s2
ffffffffc020598c:	e37ff0ef          	jal	ra,ffffffffc02057c2 <printnum>
            break;
ffffffffc0205990:	bde1                	j	ffffffffc0205868 <vprintfmt+0x3a>
            putch(va_arg(ap, int), putdat);
ffffffffc0205992:	000a2503          	lw	a0,0(s4)
ffffffffc0205996:	85a6                	mv	a1,s1
ffffffffc0205998:	0a21                	addi	s4,s4,8
ffffffffc020599a:	9902                	jalr	s2
            break;
ffffffffc020599c:	b5f1                	j	ffffffffc0205868 <vprintfmt+0x3a>
    if (lflag >= 2) {
ffffffffc020599e:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc02059a0:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc02059a4:	01174463          	blt	a4,a7,ffffffffc02059ac <vprintfmt+0x17e>
    else if (lflag) {
ffffffffc02059a8:	18088163          	beqz	a7,ffffffffc0205b2a <vprintfmt+0x2fc>
        return va_arg(*ap, unsigned long);
ffffffffc02059ac:	000a3603          	ld	a2,0(s4)
ffffffffc02059b0:	46a9                	li	a3,10
ffffffffc02059b2:	8a2e                	mv	s4,a1
ffffffffc02059b4:	bfc1                	j	ffffffffc0205984 <vprintfmt+0x156>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02059b6:	00144603          	lbu	a2,1(s0)
            altflag = 1;
ffffffffc02059ba:	4c85                	li	s9,1
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02059bc:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc02059be:	bdf1                	j	ffffffffc020589a <vprintfmt+0x6c>
            putch(ch, putdat);
ffffffffc02059c0:	85a6                	mv	a1,s1
ffffffffc02059c2:	02500513          	li	a0,37
ffffffffc02059c6:	9902                	jalr	s2
            break;
ffffffffc02059c8:	b545                	j	ffffffffc0205868 <vprintfmt+0x3a>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02059ca:	00144603          	lbu	a2,1(s0)
            lflag ++;
ffffffffc02059ce:	2885                	addiw	a7,a7,1
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02059d0:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc02059d2:	b5e1                	j	ffffffffc020589a <vprintfmt+0x6c>
    if (lflag >= 2) {
ffffffffc02059d4:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc02059d6:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc02059da:	01174463          	blt	a4,a7,ffffffffc02059e2 <vprintfmt+0x1b4>
    else if (lflag) {
ffffffffc02059de:	14088163          	beqz	a7,ffffffffc0205b20 <vprintfmt+0x2f2>
        return va_arg(*ap, unsigned long);
ffffffffc02059e2:	000a3603          	ld	a2,0(s4)
ffffffffc02059e6:	46a1                	li	a3,8
ffffffffc02059e8:	8a2e                	mv	s4,a1
ffffffffc02059ea:	bf69                	j	ffffffffc0205984 <vprintfmt+0x156>
            putch('0', putdat);
ffffffffc02059ec:	03000513          	li	a0,48
ffffffffc02059f0:	85a6                	mv	a1,s1
ffffffffc02059f2:	e03e                	sd	a5,0(sp)
ffffffffc02059f4:	9902                	jalr	s2
            putch('x', putdat);
ffffffffc02059f6:	85a6                	mv	a1,s1
ffffffffc02059f8:	07800513          	li	a0,120
ffffffffc02059fc:	9902                	jalr	s2
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
ffffffffc02059fe:	0a21                	addi	s4,s4,8
            goto number;
ffffffffc0205a00:	6782                	ld	a5,0(sp)
ffffffffc0205a02:	46c1                	li	a3,16
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
ffffffffc0205a04:	ff8a3603          	ld	a2,-8(s4)
            goto number;
ffffffffc0205a08:	bfb5                	j	ffffffffc0205984 <vprintfmt+0x156>
            if ((p = va_arg(ap, char *)) == NULL) {
ffffffffc0205a0a:	000a3403          	ld	s0,0(s4)
ffffffffc0205a0e:	008a0713          	addi	a4,s4,8
ffffffffc0205a12:	e03a                	sd	a4,0(sp)
ffffffffc0205a14:	14040263          	beqz	s0,ffffffffc0205b58 <vprintfmt+0x32a>
            if (width > 0 && padc != '-') {
ffffffffc0205a18:	0fb05763          	blez	s11,ffffffffc0205b06 <vprintfmt+0x2d8>
ffffffffc0205a1c:	02d00693          	li	a3,45
ffffffffc0205a20:	0cd79163          	bne	a5,a3,ffffffffc0205ae2 <vprintfmt+0x2b4>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0205a24:	00044783          	lbu	a5,0(s0)
ffffffffc0205a28:	0007851b          	sext.w	a0,a5
ffffffffc0205a2c:	cf85                	beqz	a5,ffffffffc0205a64 <vprintfmt+0x236>
ffffffffc0205a2e:	00140a13          	addi	s4,s0,1
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0205a32:	05e00413          	li	s0,94
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0205a36:	000c4563          	bltz	s8,ffffffffc0205a40 <vprintfmt+0x212>
ffffffffc0205a3a:	3c7d                	addiw	s8,s8,-1
ffffffffc0205a3c:	036c0263          	beq	s8,s6,ffffffffc0205a60 <vprintfmt+0x232>
                    putch('?', putdat);
ffffffffc0205a40:	85a6                	mv	a1,s1
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0205a42:	0e0c8e63          	beqz	s9,ffffffffc0205b3e <vprintfmt+0x310>
ffffffffc0205a46:	3781                	addiw	a5,a5,-32
ffffffffc0205a48:	0ef47b63          	bgeu	s0,a5,ffffffffc0205b3e <vprintfmt+0x310>
                    putch('?', putdat);
ffffffffc0205a4c:	03f00513          	li	a0,63
ffffffffc0205a50:	9902                	jalr	s2
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0205a52:	000a4783          	lbu	a5,0(s4)
ffffffffc0205a56:	3dfd                	addiw	s11,s11,-1
ffffffffc0205a58:	0a05                	addi	s4,s4,1
ffffffffc0205a5a:	0007851b          	sext.w	a0,a5
ffffffffc0205a5e:	ffe1                	bnez	a5,ffffffffc0205a36 <vprintfmt+0x208>
            for (; width > 0; width --) {
ffffffffc0205a60:	01b05963          	blez	s11,ffffffffc0205a72 <vprintfmt+0x244>
ffffffffc0205a64:	3dfd                	addiw	s11,s11,-1
                putch(' ', putdat);
ffffffffc0205a66:	85a6                	mv	a1,s1
ffffffffc0205a68:	02000513          	li	a0,32
ffffffffc0205a6c:	9902                	jalr	s2
            for (; width > 0; width --) {
ffffffffc0205a6e:	fe0d9be3          	bnez	s11,ffffffffc0205a64 <vprintfmt+0x236>
            if ((p = va_arg(ap, char *)) == NULL) {
ffffffffc0205a72:	6a02                	ld	s4,0(sp)
ffffffffc0205a74:	bbd5                	j	ffffffffc0205868 <vprintfmt+0x3a>
    if (lflag >= 2) {
ffffffffc0205a76:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc0205a78:	008a0c93          	addi	s9,s4,8
    if (lflag >= 2) {
ffffffffc0205a7c:	01174463          	blt	a4,a7,ffffffffc0205a84 <vprintfmt+0x256>
    else if (lflag) {
ffffffffc0205a80:	08088d63          	beqz	a7,ffffffffc0205b1a <vprintfmt+0x2ec>
        return va_arg(*ap, long);
ffffffffc0205a84:	000a3403          	ld	s0,0(s4)
            if ((long long)num < 0) {
ffffffffc0205a88:	0a044d63          	bltz	s0,ffffffffc0205b42 <vprintfmt+0x314>
            num = getint(&ap, lflag);
ffffffffc0205a8c:	8622                	mv	a2,s0
ffffffffc0205a8e:	8a66                	mv	s4,s9
ffffffffc0205a90:	46a9                	li	a3,10
ffffffffc0205a92:	bdcd                	j	ffffffffc0205984 <vprintfmt+0x156>
            err = va_arg(ap, int);
ffffffffc0205a94:	000a2783          	lw	a5,0(s4)
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc0205a98:	4761                	li	a4,24
            err = va_arg(ap, int);
ffffffffc0205a9a:	0a21                	addi	s4,s4,8
            if (err < 0) {
ffffffffc0205a9c:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0205aa0:	8fb5                	xor	a5,a5,a3
ffffffffc0205aa2:	40d786bb          	subw	a3,a5,a3
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc0205aa6:	02d74163          	blt	a4,a3,ffffffffc0205ac8 <vprintfmt+0x29a>
ffffffffc0205aaa:	00369793          	slli	a5,a3,0x3
ffffffffc0205aae:	97de                	add	a5,a5,s7
ffffffffc0205ab0:	639c                	ld	a5,0(a5)
ffffffffc0205ab2:	cb99                	beqz	a5,ffffffffc0205ac8 <vprintfmt+0x29a>
                printfmt(putch, putdat, "%s", p);
ffffffffc0205ab4:	86be                	mv	a3,a5
ffffffffc0205ab6:	00000617          	auipc	a2,0x0
ffffffffc0205aba:	1f260613          	addi	a2,a2,498 # ffffffffc0205ca8 <etext+0x2c>
ffffffffc0205abe:	85a6                	mv	a1,s1
ffffffffc0205ac0:	854a                	mv	a0,s2
ffffffffc0205ac2:	0ce000ef          	jal	ra,ffffffffc0205b90 <printfmt>
ffffffffc0205ac6:	b34d                	j	ffffffffc0205868 <vprintfmt+0x3a>
                printfmt(putch, putdat, "error %d", err);
ffffffffc0205ac8:	00002617          	auipc	a2,0x2
ffffffffc0205acc:	76860613          	addi	a2,a2,1896 # ffffffffc0208230 <syscalls+0x820>
ffffffffc0205ad0:	85a6                	mv	a1,s1
ffffffffc0205ad2:	854a                	mv	a0,s2
ffffffffc0205ad4:	0bc000ef          	jal	ra,ffffffffc0205b90 <printfmt>
ffffffffc0205ad8:	bb41                	j	ffffffffc0205868 <vprintfmt+0x3a>
                p = "(null)";
ffffffffc0205ada:	00002417          	auipc	s0,0x2
ffffffffc0205ade:	74e40413          	addi	s0,s0,1870 # ffffffffc0208228 <syscalls+0x818>
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc0205ae2:	85e2                	mv	a1,s8
ffffffffc0205ae4:	8522                	mv	a0,s0
ffffffffc0205ae6:	e43e                	sd	a5,8(sp)
ffffffffc0205ae8:	0e2000ef          	jal	ra,ffffffffc0205bca <strnlen>
ffffffffc0205aec:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0205af0:	01b05b63          	blez	s11,ffffffffc0205b06 <vprintfmt+0x2d8>
                    putch(padc, putdat);
ffffffffc0205af4:	67a2                	ld	a5,8(sp)
ffffffffc0205af6:	00078a1b          	sext.w	s4,a5
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc0205afa:	3dfd                	addiw	s11,s11,-1
                    putch(padc, putdat);
ffffffffc0205afc:	85a6                	mv	a1,s1
ffffffffc0205afe:	8552                	mv	a0,s4
ffffffffc0205b00:	9902                	jalr	s2
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc0205b02:	fe0d9ce3          	bnez	s11,ffffffffc0205afa <vprintfmt+0x2cc>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0205b06:	00044783          	lbu	a5,0(s0)
ffffffffc0205b0a:	00140a13          	addi	s4,s0,1
ffffffffc0205b0e:	0007851b          	sext.w	a0,a5
ffffffffc0205b12:	d3a5                	beqz	a5,ffffffffc0205a72 <vprintfmt+0x244>
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0205b14:	05e00413          	li	s0,94
ffffffffc0205b18:	bf39                	j	ffffffffc0205a36 <vprintfmt+0x208>
        return va_arg(*ap, int);
ffffffffc0205b1a:	000a2403          	lw	s0,0(s4)
ffffffffc0205b1e:	b7ad                	j	ffffffffc0205a88 <vprintfmt+0x25a>
        return va_arg(*ap, unsigned int);
ffffffffc0205b20:	000a6603          	lwu	a2,0(s4)
ffffffffc0205b24:	46a1                	li	a3,8
ffffffffc0205b26:	8a2e                	mv	s4,a1
ffffffffc0205b28:	bdb1                	j	ffffffffc0205984 <vprintfmt+0x156>
ffffffffc0205b2a:	000a6603          	lwu	a2,0(s4)
ffffffffc0205b2e:	46a9                	li	a3,10
ffffffffc0205b30:	8a2e                	mv	s4,a1
ffffffffc0205b32:	bd89                	j	ffffffffc0205984 <vprintfmt+0x156>
ffffffffc0205b34:	000a6603          	lwu	a2,0(s4)
ffffffffc0205b38:	46c1                	li	a3,16
ffffffffc0205b3a:	8a2e                	mv	s4,a1
ffffffffc0205b3c:	b5a1                	j	ffffffffc0205984 <vprintfmt+0x156>
                    putch(ch, putdat);
ffffffffc0205b3e:	9902                	jalr	s2
ffffffffc0205b40:	bf09                	j	ffffffffc0205a52 <vprintfmt+0x224>
                putch('-', putdat);
ffffffffc0205b42:	85a6                	mv	a1,s1
ffffffffc0205b44:	02d00513          	li	a0,45
ffffffffc0205b48:	e03e                	sd	a5,0(sp)
ffffffffc0205b4a:	9902                	jalr	s2
                num = -(long long)num;
ffffffffc0205b4c:	6782                	ld	a5,0(sp)
ffffffffc0205b4e:	8a66                	mv	s4,s9
ffffffffc0205b50:	40800633          	neg	a2,s0
ffffffffc0205b54:	46a9                	li	a3,10
ffffffffc0205b56:	b53d                	j	ffffffffc0205984 <vprintfmt+0x156>
            if (width > 0 && padc != '-') {
ffffffffc0205b58:	03b05163          	blez	s11,ffffffffc0205b7a <vprintfmt+0x34c>
ffffffffc0205b5c:	02d00693          	li	a3,45
ffffffffc0205b60:	f6d79de3          	bne	a5,a3,ffffffffc0205ada <vprintfmt+0x2ac>
                p = "(null)";
ffffffffc0205b64:	00002417          	auipc	s0,0x2
ffffffffc0205b68:	6c440413          	addi	s0,s0,1732 # ffffffffc0208228 <syscalls+0x818>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0205b6c:	02800793          	li	a5,40
ffffffffc0205b70:	02800513          	li	a0,40
ffffffffc0205b74:	00140a13          	addi	s4,s0,1
ffffffffc0205b78:	bd6d                	j	ffffffffc0205a32 <vprintfmt+0x204>
ffffffffc0205b7a:	00002a17          	auipc	s4,0x2
ffffffffc0205b7e:	6afa0a13          	addi	s4,s4,1711 # ffffffffc0208229 <syscalls+0x819>
ffffffffc0205b82:	02800513          	li	a0,40
ffffffffc0205b86:	02800793          	li	a5,40
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0205b8a:	05e00413          	li	s0,94
ffffffffc0205b8e:	b565                	j	ffffffffc0205a36 <vprintfmt+0x208>

ffffffffc0205b90 <printfmt>:
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc0205b90:	715d                	addi	sp,sp,-80
    va_start(ap, fmt);
ffffffffc0205b92:	02810313          	addi	t1,sp,40
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc0205b96:	f436                	sd	a3,40(sp)
    vprintfmt(putch, putdat, fmt, ap);
ffffffffc0205b98:	869a                	mv	a3,t1
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc0205b9a:	ec06                	sd	ra,24(sp)
ffffffffc0205b9c:	f83a                	sd	a4,48(sp)
ffffffffc0205b9e:	fc3e                	sd	a5,56(sp)
ffffffffc0205ba0:	e0c2                	sd	a6,64(sp)
ffffffffc0205ba2:	e4c6                	sd	a7,72(sp)
    va_start(ap, fmt);
ffffffffc0205ba4:	e41a                	sd	t1,8(sp)
    vprintfmt(putch, putdat, fmt, ap);
ffffffffc0205ba6:	c89ff0ef          	jal	ra,ffffffffc020582e <vprintfmt>
}
ffffffffc0205baa:	60e2                	ld	ra,24(sp)
ffffffffc0205bac:	6161                	addi	sp,sp,80
ffffffffc0205bae:	8082                	ret

ffffffffc0205bb0 <strlen>:
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
ffffffffc0205bb0:	00054783          	lbu	a5,0(a0)
strlen(const char *s) {
ffffffffc0205bb4:	872a                	mv	a4,a0
    size_t cnt = 0;
ffffffffc0205bb6:	4501                	li	a0,0
    while (*s ++ != '\0') {
ffffffffc0205bb8:	cb81                	beqz	a5,ffffffffc0205bc8 <strlen+0x18>
        cnt ++;
ffffffffc0205bba:	0505                	addi	a0,a0,1
    while (*s ++ != '\0') {
ffffffffc0205bbc:	00a707b3          	add	a5,a4,a0
ffffffffc0205bc0:	0007c783          	lbu	a5,0(a5)
ffffffffc0205bc4:	fbfd                	bnez	a5,ffffffffc0205bba <strlen+0xa>
ffffffffc0205bc6:	8082                	ret
    }
    return cnt;
}
ffffffffc0205bc8:	8082                	ret

ffffffffc0205bca <strnlen>:
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
ffffffffc0205bca:	4781                	li	a5,0
    while (cnt < len && *s ++ != '\0') {
ffffffffc0205bcc:	e589                	bnez	a1,ffffffffc0205bd6 <strnlen+0xc>
ffffffffc0205bce:	a811                	j	ffffffffc0205be2 <strnlen+0x18>
        cnt ++;
ffffffffc0205bd0:	0785                	addi	a5,a5,1
    while (cnt < len && *s ++ != '\0') {
ffffffffc0205bd2:	00f58863          	beq	a1,a5,ffffffffc0205be2 <strnlen+0x18>
ffffffffc0205bd6:	00f50733          	add	a4,a0,a5
ffffffffc0205bda:	00074703          	lbu	a4,0(a4)
ffffffffc0205bde:	fb6d                	bnez	a4,ffffffffc0205bd0 <strnlen+0x6>
ffffffffc0205be0:	85be                	mv	a1,a5
    }
    return cnt;
}
ffffffffc0205be2:	852e                	mv	a0,a1
ffffffffc0205be4:	8082                	ret

ffffffffc0205be6 <strcpy>:
char *
strcpy(char *dst, const char *src) {
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
#else
    char *p = dst;
ffffffffc0205be6:	87aa                	mv	a5,a0
    while ((*p ++ = *src ++) != '\0')
ffffffffc0205be8:	0005c703          	lbu	a4,0(a1)
ffffffffc0205bec:	0785                	addi	a5,a5,1
ffffffffc0205bee:	0585                	addi	a1,a1,1
ffffffffc0205bf0:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0205bf4:	fb75                	bnez	a4,ffffffffc0205be8 <strcpy+0x2>
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
ffffffffc0205bf6:	8082                	ret

ffffffffc0205bf8 <strcmp>:
int
strcmp(const char *s1, const char *s2) {
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
#else
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc0205bf8:	00054783          	lbu	a5,0(a0)
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0205bfc:	0005c703          	lbu	a4,0(a1)
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc0205c00:	cb89                	beqz	a5,ffffffffc0205c12 <strcmp+0x1a>
        s1 ++, s2 ++;
ffffffffc0205c02:	0505                	addi	a0,a0,1
ffffffffc0205c04:	0585                	addi	a1,a1,1
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc0205c06:	fee789e3          	beq	a5,a4,ffffffffc0205bf8 <strcmp>
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0205c0a:	0007851b          	sext.w	a0,a5
#endif /* __HAVE_ARCH_STRCMP */
}
ffffffffc0205c0e:	9d19                	subw	a0,a0,a4
ffffffffc0205c10:	8082                	ret
ffffffffc0205c12:	4501                	li	a0,0
ffffffffc0205c14:	bfed                	j	ffffffffc0205c0e <strcmp+0x16>

ffffffffc0205c16 <strncmp>:
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc0205c16:	c20d                	beqz	a2,ffffffffc0205c38 <strncmp+0x22>
ffffffffc0205c18:	962e                	add	a2,a2,a1
ffffffffc0205c1a:	a031                	j	ffffffffc0205c26 <strncmp+0x10>
        n --, s1 ++, s2 ++;
ffffffffc0205c1c:	0505                	addi	a0,a0,1
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc0205c1e:	00e79a63          	bne	a5,a4,ffffffffc0205c32 <strncmp+0x1c>
ffffffffc0205c22:	00b60b63          	beq	a2,a1,ffffffffc0205c38 <strncmp+0x22>
ffffffffc0205c26:	00054783          	lbu	a5,0(a0)
        n --, s1 ++, s2 ++;
ffffffffc0205c2a:	0585                	addi	a1,a1,1
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc0205c2c:	fff5c703          	lbu	a4,-1(a1)
ffffffffc0205c30:	f7f5                	bnez	a5,ffffffffc0205c1c <strncmp+0x6>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0205c32:	40e7853b          	subw	a0,a5,a4
}
ffffffffc0205c36:	8082                	ret
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0205c38:	4501                	li	a0,0
ffffffffc0205c3a:	8082                	ret

ffffffffc0205c3c <strchr>:
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
ffffffffc0205c3c:	00054783          	lbu	a5,0(a0)
ffffffffc0205c40:	c799                	beqz	a5,ffffffffc0205c4e <strchr+0x12>
        if (*s == c) {
ffffffffc0205c42:	00f58763          	beq	a1,a5,ffffffffc0205c50 <strchr+0x14>
    while (*s != '\0') {
ffffffffc0205c46:	00154783          	lbu	a5,1(a0)
            return (char *)s;
        }
        s ++;
ffffffffc0205c4a:	0505                	addi	a0,a0,1
    while (*s != '\0') {
ffffffffc0205c4c:	fbfd                	bnez	a5,ffffffffc0205c42 <strchr+0x6>
    }
    return NULL;
ffffffffc0205c4e:	4501                	li	a0,0
}
ffffffffc0205c50:	8082                	ret

ffffffffc0205c52 <memset>:
memset(void *s, char c, size_t n) {
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
#else
    char *p = s;
    while (n -- > 0) {
ffffffffc0205c52:	ca01                	beqz	a2,ffffffffc0205c62 <memset+0x10>
ffffffffc0205c54:	962a                	add	a2,a2,a0
    char *p = s;
ffffffffc0205c56:	87aa                	mv	a5,a0
        *p ++ = c;
ffffffffc0205c58:	0785                	addi	a5,a5,1
ffffffffc0205c5a:	feb78fa3          	sb	a1,-1(a5)
    while (n -- > 0) {
ffffffffc0205c5e:	fec79de3          	bne	a5,a2,ffffffffc0205c58 <memset+0x6>
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
ffffffffc0205c62:	8082                	ret

ffffffffc0205c64 <memcpy>:
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
#else
    const char *s = src;
    char *d = dst;
    while (n -- > 0) {
ffffffffc0205c64:	ca19                	beqz	a2,ffffffffc0205c7a <memcpy+0x16>
ffffffffc0205c66:	962e                	add	a2,a2,a1
    char *d = dst;
ffffffffc0205c68:	87aa                	mv	a5,a0
        *d ++ = *s ++;
ffffffffc0205c6a:	0005c703          	lbu	a4,0(a1)
ffffffffc0205c6e:	0585                	addi	a1,a1,1
ffffffffc0205c70:	0785                	addi	a5,a5,1
ffffffffc0205c72:	fee78fa3          	sb	a4,-1(a5)
    while (n -- > 0) {
ffffffffc0205c76:	fec59ae3          	bne	a1,a2,ffffffffc0205c6a <memcpy+0x6>
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
ffffffffc0205c7a:	8082                	ret
