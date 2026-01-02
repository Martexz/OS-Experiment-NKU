
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	00014297          	auipc	t0,0x14
ffffffffc0200004:	00028293          	mv	t0,t0
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc0214000 <boot_hartid>
ffffffffc020000c:	00014297          	auipc	t0,0x14
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc0214008 <boot_dtb>
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)
ffffffffc0200018:	c02132b7          	lui	t0,0xc0213
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
ffffffffc0200034:	18029073          	csrw	satp,t0
ffffffffc0200038:	12000073          	sfence.vma
ffffffffc020003c:	c0213137          	lui	sp,0xc0213
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
ffffffffc0200044:	04a28293          	addi	t0,t0,74 # ffffffffc020004a <kern_init>
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <kern_init>:
ffffffffc020004a:	00091517          	auipc	a0,0x91
ffffffffc020004e:	01650513          	addi	a0,a0,22 # ffffffffc0291060 <buf>
ffffffffc0200052:	00097617          	auipc	a2,0x97
ffffffffc0200056:	8be60613          	addi	a2,a2,-1858 # ffffffffc0296910 <end>
ffffffffc020005a:	1141                	addi	sp,sp,-16
ffffffffc020005c:	8e09                	sub	a2,a2,a0
ffffffffc020005e:	4581                	li	a1,0
ffffffffc0200060:	e406                	sd	ra,8(sp)
ffffffffc0200062:	3b40b0ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0200066:	52c000ef          	jal	ra,ffffffffc0200592 <cons_init>
ffffffffc020006a:	0000b597          	auipc	a1,0xb
ffffffffc020006e:	41658593          	addi	a1,a1,1046 # ffffffffc020b480 <etext>
ffffffffc0200072:	0000b517          	auipc	a0,0xb
ffffffffc0200076:	42e50513          	addi	a0,a0,1070 # ffffffffc020b4a0 <etext+0x20>
ffffffffc020007a:	12c000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ae000ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc0200082:	62a000ef          	jal	ra,ffffffffc02006ac <dtb_init>
ffffffffc0200086:	409020ef          	jal	ra,ffffffffc0202c8e <pmm_init>
ffffffffc020008a:	3ef000ef          	jal	ra,ffffffffc0200c78 <pic_init>
ffffffffc020008e:	515000ef          	jal	ra,ffffffffc0200da2 <idt_init>
ffffffffc0200092:	635030ef          	jal	ra,ffffffffc0203ec6 <vmm_init>
ffffffffc0200096:	10e070ef          	jal	ra,ffffffffc02071a4 <sched_init>
ffffffffc020009a:	515060ef          	jal	ra,ffffffffc0206dae <proc_init>
ffffffffc020009e:	1bf000ef          	jal	ra,ffffffffc0200a5c <ide_init>
ffffffffc02000a2:	066050ef          	jal	ra,ffffffffc0205108 <fs_init>
ffffffffc02000a6:	4a4000ef          	jal	ra,ffffffffc020054a <clock_init>
ffffffffc02000aa:	3c3000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02000ae:	6cd060ef          	jal	ra,ffffffffc0206f7a <cpu_idle>

ffffffffc02000b2 <readline>:
ffffffffc02000b2:	715d                	addi	sp,sp,-80
ffffffffc02000b4:	e486                	sd	ra,72(sp)
ffffffffc02000b6:	e0a6                	sd	s1,64(sp)
ffffffffc02000b8:	fc4a                	sd	s2,56(sp)
ffffffffc02000ba:	f84e                	sd	s3,48(sp)
ffffffffc02000bc:	f452                	sd	s4,40(sp)
ffffffffc02000be:	f056                	sd	s5,32(sp)
ffffffffc02000c0:	ec5a                	sd	s6,24(sp)
ffffffffc02000c2:	e85e                	sd	s7,16(sp)
ffffffffc02000c4:	c901                	beqz	a0,ffffffffc02000d4 <readline+0x22>
ffffffffc02000c6:	85aa                	mv	a1,a0
ffffffffc02000c8:	0000b517          	auipc	a0,0xb
ffffffffc02000cc:	3e050513          	addi	a0,a0,992 # ffffffffc020b4a8 <etext+0x28>
ffffffffc02000d0:	0d6000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02000d4:	4481                	li	s1,0
ffffffffc02000d6:	497d                	li	s2,31
ffffffffc02000d8:	49a1                	li	s3,8
ffffffffc02000da:	4aa9                	li	s5,10
ffffffffc02000dc:	4b35                	li	s6,13
ffffffffc02000de:	00091b97          	auipc	s7,0x91
ffffffffc02000e2:	f82b8b93          	addi	s7,s7,-126 # ffffffffc0291060 <buf>
ffffffffc02000e6:	3fe00a13          	li	s4,1022
ffffffffc02000ea:	0fa000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000ee:	00054a63          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc02000f2:	00a95a63          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc02000f6:	029a5263          	bge	s4,s1,ffffffffc020011a <readline+0x68>
ffffffffc02000fa:	0ea000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000fe:	fe055ae3          	bgez	a0,ffffffffc02000f2 <readline+0x40>
ffffffffc0200102:	4501                	li	a0,0
ffffffffc0200104:	a091                	j	ffffffffc0200148 <readline+0x96>
ffffffffc0200106:	03351463          	bne	a0,s3,ffffffffc020012e <readline+0x7c>
ffffffffc020010a:	e8a9                	bnez	s1,ffffffffc020015c <readline+0xaa>
ffffffffc020010c:	0d8000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc0200110:	fe0549e3          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc0200114:	fea959e3          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc0200118:	4481                	li	s1,0
ffffffffc020011a:	e42a                	sd	a0,8(sp)
ffffffffc020011c:	0c6000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200120:	6522                	ld	a0,8(sp)
ffffffffc0200122:	009b87b3          	add	a5,s7,s1
ffffffffc0200126:	2485                	addiw	s1,s1,1
ffffffffc0200128:	00a78023          	sb	a0,0(a5)
ffffffffc020012c:	bf7d                	j	ffffffffc02000ea <readline+0x38>
ffffffffc020012e:	01550463          	beq	a0,s5,ffffffffc0200136 <readline+0x84>
ffffffffc0200132:	fb651ce3          	bne	a0,s6,ffffffffc02000ea <readline+0x38>
ffffffffc0200136:	0ac000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc020013a:	00091517          	auipc	a0,0x91
ffffffffc020013e:	f2650513          	addi	a0,a0,-218 # ffffffffc0291060 <buf>
ffffffffc0200142:	94aa                	add	s1,s1,a0
ffffffffc0200144:	00048023          	sb	zero,0(s1)
ffffffffc0200148:	60a6                	ld	ra,72(sp)
ffffffffc020014a:	6486                	ld	s1,64(sp)
ffffffffc020014c:	7962                	ld	s2,56(sp)
ffffffffc020014e:	79c2                	ld	s3,48(sp)
ffffffffc0200150:	7a22                	ld	s4,40(sp)
ffffffffc0200152:	7a82                	ld	s5,32(sp)
ffffffffc0200154:	6b62                	ld	s6,24(sp)
ffffffffc0200156:	6bc2                	ld	s7,16(sp)
ffffffffc0200158:	6161                	addi	sp,sp,80
ffffffffc020015a:	8082                	ret
ffffffffc020015c:	4521                	li	a0,8
ffffffffc020015e:	084000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200162:	34fd                	addiw	s1,s1,-1
ffffffffc0200164:	b759                	j	ffffffffc02000ea <readline+0x38>

ffffffffc0200166 <cputch>:
ffffffffc0200166:	1141                	addi	sp,sp,-16
ffffffffc0200168:	e022                	sd	s0,0(sp)
ffffffffc020016a:	e406                	sd	ra,8(sp)
ffffffffc020016c:	842e                	mv	s0,a1
ffffffffc020016e:	432000ef          	jal	ra,ffffffffc02005a0 <cons_putc>
ffffffffc0200172:	401c                	lw	a5,0(s0)
ffffffffc0200174:	60a2                	ld	ra,8(sp)
ffffffffc0200176:	2785                	addiw	a5,a5,1
ffffffffc0200178:	c01c                	sw	a5,0(s0)
ffffffffc020017a:	6402                	ld	s0,0(sp)
ffffffffc020017c:	0141                	addi	sp,sp,16
ffffffffc020017e:	8082                	ret

ffffffffc0200180 <vcprintf>:
ffffffffc0200180:	1101                	addi	sp,sp,-32
ffffffffc0200182:	872e                	mv	a4,a1
ffffffffc0200184:	75dd                	lui	a1,0xffff7
ffffffffc0200186:	86aa                	mv	a3,a0
ffffffffc0200188:	0070                	addi	a2,sp,12
ffffffffc020018a:	00000517          	auipc	a0,0x0
ffffffffc020018e:	fdc50513          	addi	a0,a0,-36 # ffffffffc0200166 <cputch>
ffffffffc0200192:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0200196:	ec06                	sd	ra,24(sp)
ffffffffc0200198:	c602                	sw	zero,12(sp)
ffffffffc020019a:	5ef0a0ef          	jal	ra,ffffffffc020af88 <vprintfmt>
ffffffffc020019e:	60e2                	ld	ra,24(sp)
ffffffffc02001a0:	4532                	lw	a0,12(sp)
ffffffffc02001a2:	6105                	addi	sp,sp,32
ffffffffc02001a4:	8082                	ret

ffffffffc02001a6 <cprintf>:
ffffffffc02001a6:	711d                	addi	sp,sp,-96
ffffffffc02001a8:	02810313          	addi	t1,sp,40 # ffffffffc0213028 <boot_page_table_sv39+0x28>
ffffffffc02001ac:	8e2a                	mv	t3,a0
ffffffffc02001ae:	f42e                	sd	a1,40(sp)
ffffffffc02001b0:	75dd                	lui	a1,0xffff7
ffffffffc02001b2:	f832                	sd	a2,48(sp)
ffffffffc02001b4:	fc36                	sd	a3,56(sp)
ffffffffc02001b6:	e0ba                	sd	a4,64(sp)
ffffffffc02001b8:	00000517          	auipc	a0,0x0
ffffffffc02001bc:	fae50513          	addi	a0,a0,-82 # ffffffffc0200166 <cputch>
ffffffffc02001c0:	0050                	addi	a2,sp,4
ffffffffc02001c2:	871a                	mv	a4,t1
ffffffffc02001c4:	86f2                	mv	a3,t3
ffffffffc02001c6:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02001ca:	ec06                	sd	ra,24(sp)
ffffffffc02001cc:	e4be                	sd	a5,72(sp)
ffffffffc02001ce:	e8c2                	sd	a6,80(sp)
ffffffffc02001d0:	ecc6                	sd	a7,88(sp)
ffffffffc02001d2:	e41a                	sd	t1,8(sp)
ffffffffc02001d4:	c202                	sw	zero,4(sp)
ffffffffc02001d6:	5b30a0ef          	jal	ra,ffffffffc020af88 <vprintfmt>
ffffffffc02001da:	60e2                	ld	ra,24(sp)
ffffffffc02001dc:	4512                	lw	a0,4(sp)
ffffffffc02001de:	6125                	addi	sp,sp,96
ffffffffc02001e0:	8082                	ret

ffffffffc02001e2 <cputchar>:
ffffffffc02001e2:	ae7d                	j	ffffffffc02005a0 <cons_putc>

ffffffffc02001e4 <getchar>:
ffffffffc02001e4:	1141                	addi	sp,sp,-16
ffffffffc02001e6:	e406                	sd	ra,8(sp)
ffffffffc02001e8:	40c000ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc02001ec:	dd75                	beqz	a0,ffffffffc02001e8 <getchar+0x4>
ffffffffc02001ee:	60a2                	ld	ra,8(sp)
ffffffffc02001f0:	0141                	addi	sp,sp,16
ffffffffc02001f2:	8082                	ret

ffffffffc02001f4 <strdup>:
ffffffffc02001f4:	1101                	addi	sp,sp,-32
ffffffffc02001f6:	ec06                	sd	ra,24(sp)
ffffffffc02001f8:	e822                	sd	s0,16(sp)
ffffffffc02001fa:	e426                	sd	s1,8(sp)
ffffffffc02001fc:	e04a                	sd	s2,0(sp)
ffffffffc02001fe:	892a                	mv	s2,a0
ffffffffc0200200:	1740b0ef          	jal	ra,ffffffffc020b374 <strlen>
ffffffffc0200204:	842a                	mv	s0,a0
ffffffffc0200206:	0505                	addi	a0,a0,1
ffffffffc0200208:	587010ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020020c:	84aa                	mv	s1,a0
ffffffffc020020e:	c901                	beqz	a0,ffffffffc020021e <strdup+0x2a>
ffffffffc0200210:	8622                	mv	a2,s0
ffffffffc0200212:	85ca                	mv	a1,s2
ffffffffc0200214:	9426                	add	s0,s0,s1
ffffffffc0200216:	2520b0ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc020021a:	00040023          	sb	zero,0(s0)
ffffffffc020021e:	60e2                	ld	ra,24(sp)
ffffffffc0200220:	6442                	ld	s0,16(sp)
ffffffffc0200222:	6902                	ld	s2,0(sp)
ffffffffc0200224:	8526                	mv	a0,s1
ffffffffc0200226:	64a2                	ld	s1,8(sp)
ffffffffc0200228:	6105                	addi	sp,sp,32
ffffffffc020022a:	8082                	ret

ffffffffc020022c <print_kerninfo>:
ffffffffc020022c:	1141                	addi	sp,sp,-16
ffffffffc020022e:	0000b517          	auipc	a0,0xb
ffffffffc0200232:	28250513          	addi	a0,a0,642 # ffffffffc020b4b0 <etext+0x30>
ffffffffc0200236:	e406                	sd	ra,8(sp)
ffffffffc0200238:	f6fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020023c:	00000597          	auipc	a1,0x0
ffffffffc0200240:	e0e58593          	addi	a1,a1,-498 # ffffffffc020004a <kern_init>
ffffffffc0200244:	0000b517          	auipc	a0,0xb
ffffffffc0200248:	28c50513          	addi	a0,a0,652 # ffffffffc020b4d0 <etext+0x50>
ffffffffc020024c:	f5bff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200250:	0000b597          	auipc	a1,0xb
ffffffffc0200254:	23058593          	addi	a1,a1,560 # ffffffffc020b480 <etext>
ffffffffc0200258:	0000b517          	auipc	a0,0xb
ffffffffc020025c:	29850513          	addi	a0,a0,664 # ffffffffc020b4f0 <etext+0x70>
ffffffffc0200260:	f47ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200264:	00091597          	auipc	a1,0x91
ffffffffc0200268:	dfc58593          	addi	a1,a1,-516 # ffffffffc0291060 <buf>
ffffffffc020026c:	0000b517          	auipc	a0,0xb
ffffffffc0200270:	2a450513          	addi	a0,a0,676 # ffffffffc020b510 <etext+0x90>
ffffffffc0200274:	f33ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200278:	00096597          	auipc	a1,0x96
ffffffffc020027c:	69858593          	addi	a1,a1,1688 # ffffffffc0296910 <end>
ffffffffc0200280:	0000b517          	auipc	a0,0xb
ffffffffc0200284:	2b050513          	addi	a0,a0,688 # ffffffffc020b530 <etext+0xb0>
ffffffffc0200288:	f1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020028c:	00097597          	auipc	a1,0x97
ffffffffc0200290:	a8358593          	addi	a1,a1,-1405 # ffffffffc0296d0f <end+0x3ff>
ffffffffc0200294:	00000797          	auipc	a5,0x0
ffffffffc0200298:	db678793          	addi	a5,a5,-586 # ffffffffc020004a <kern_init>
ffffffffc020029c:	40f587b3          	sub	a5,a1,a5
ffffffffc02002a0:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02002a4:	60a2                	ld	ra,8(sp)
ffffffffc02002a6:	3ff5f593          	andi	a1,a1,1023
ffffffffc02002aa:	95be                	add	a1,a1,a5
ffffffffc02002ac:	85a9                	srai	a1,a1,0xa
ffffffffc02002ae:	0000b517          	auipc	a0,0xb
ffffffffc02002b2:	2a250513          	addi	a0,a0,674 # ffffffffc020b550 <etext+0xd0>
ffffffffc02002b6:	0141                	addi	sp,sp,16
ffffffffc02002b8:	b5fd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002ba <print_stackframe>:
ffffffffc02002ba:	1141                	addi	sp,sp,-16
ffffffffc02002bc:	0000b617          	auipc	a2,0xb
ffffffffc02002c0:	2c460613          	addi	a2,a2,708 # ffffffffc020b580 <etext+0x100>
ffffffffc02002c4:	04e00593          	li	a1,78
ffffffffc02002c8:	0000b517          	auipc	a0,0xb
ffffffffc02002cc:	2d050513          	addi	a0,a0,720 # ffffffffc020b598 <etext+0x118>
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	1cc000ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02002d6 <mon_help>:
ffffffffc02002d6:	1141                	addi	sp,sp,-16
ffffffffc02002d8:	0000b617          	auipc	a2,0xb
ffffffffc02002dc:	2d860613          	addi	a2,a2,728 # ffffffffc020b5b0 <etext+0x130>
ffffffffc02002e0:	0000b597          	auipc	a1,0xb
ffffffffc02002e4:	2f058593          	addi	a1,a1,752 # ffffffffc020b5d0 <etext+0x150>
ffffffffc02002e8:	0000b517          	auipc	a0,0xb
ffffffffc02002ec:	2f050513          	addi	a0,a0,752 # ffffffffc020b5d8 <etext+0x158>
ffffffffc02002f0:	e406                	sd	ra,8(sp)
ffffffffc02002f2:	eb5ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02002f6:	0000b617          	auipc	a2,0xb
ffffffffc02002fa:	2f260613          	addi	a2,a2,754 # ffffffffc020b5e8 <etext+0x168>
ffffffffc02002fe:	0000b597          	auipc	a1,0xb
ffffffffc0200302:	31258593          	addi	a1,a1,786 # ffffffffc020b610 <etext+0x190>
ffffffffc0200306:	0000b517          	auipc	a0,0xb
ffffffffc020030a:	2d250513          	addi	a0,a0,722 # ffffffffc020b5d8 <etext+0x158>
ffffffffc020030e:	e99ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200312:	0000b617          	auipc	a2,0xb
ffffffffc0200316:	30e60613          	addi	a2,a2,782 # ffffffffc020b620 <etext+0x1a0>
ffffffffc020031a:	0000b597          	auipc	a1,0xb
ffffffffc020031e:	32658593          	addi	a1,a1,806 # ffffffffc020b640 <etext+0x1c0>
ffffffffc0200322:	0000b517          	auipc	a0,0xb
ffffffffc0200326:	2b650513          	addi	a0,a0,694 # ffffffffc020b5d8 <etext+0x158>
ffffffffc020032a:	e7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020032e:	60a2                	ld	ra,8(sp)
ffffffffc0200330:	4501                	li	a0,0
ffffffffc0200332:	0141                	addi	sp,sp,16
ffffffffc0200334:	8082                	ret

ffffffffc0200336 <mon_kerninfo>:
ffffffffc0200336:	1141                	addi	sp,sp,-16
ffffffffc0200338:	e406                	sd	ra,8(sp)
ffffffffc020033a:	ef3ff0ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc020033e:	60a2                	ld	ra,8(sp)
ffffffffc0200340:	4501                	li	a0,0
ffffffffc0200342:	0141                	addi	sp,sp,16
ffffffffc0200344:	8082                	ret

ffffffffc0200346 <mon_backtrace>:
ffffffffc0200346:	1141                	addi	sp,sp,-16
ffffffffc0200348:	e406                	sd	ra,8(sp)
ffffffffc020034a:	f71ff0ef          	jal	ra,ffffffffc02002ba <print_stackframe>
ffffffffc020034e:	60a2                	ld	ra,8(sp)
ffffffffc0200350:	4501                	li	a0,0
ffffffffc0200352:	0141                	addi	sp,sp,16
ffffffffc0200354:	8082                	ret

ffffffffc0200356 <kmonitor>:
ffffffffc0200356:	7115                	addi	sp,sp,-224
ffffffffc0200358:	ed5e                	sd	s7,152(sp)
ffffffffc020035a:	8baa                	mv	s7,a0
ffffffffc020035c:	0000b517          	auipc	a0,0xb
ffffffffc0200360:	2f450513          	addi	a0,a0,756 # ffffffffc020b650 <etext+0x1d0>
ffffffffc0200364:	ed86                	sd	ra,216(sp)
ffffffffc0200366:	e9a2                	sd	s0,208(sp)
ffffffffc0200368:	e5a6                	sd	s1,200(sp)
ffffffffc020036a:	e1ca                	sd	s2,192(sp)
ffffffffc020036c:	fd4e                	sd	s3,184(sp)
ffffffffc020036e:	f952                	sd	s4,176(sp)
ffffffffc0200370:	f556                	sd	s5,168(sp)
ffffffffc0200372:	f15a                	sd	s6,160(sp)
ffffffffc0200374:	e962                	sd	s8,144(sp)
ffffffffc0200376:	e566                	sd	s9,136(sp)
ffffffffc0200378:	e16a                	sd	s10,128(sp)
ffffffffc020037a:	e2dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020037e:	0000b517          	auipc	a0,0xb
ffffffffc0200382:	2fa50513          	addi	a0,a0,762 # ffffffffc020b678 <etext+0x1f8>
ffffffffc0200386:	e21ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020038a:	000b8563          	beqz	s7,ffffffffc0200394 <kmonitor+0x3e>
ffffffffc020038e:	855e                	mv	a0,s7
ffffffffc0200390:	3fb000ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0200394:	0000bc17          	auipc	s8,0xb
ffffffffc0200398:	354c0c13          	addi	s8,s8,852 # ffffffffc020b6e8 <commands>
ffffffffc020039c:	0000b917          	auipc	s2,0xb
ffffffffc02003a0:	30490913          	addi	s2,s2,772 # ffffffffc020b6a0 <etext+0x220>
ffffffffc02003a4:	0000b497          	auipc	s1,0xb
ffffffffc02003a8:	30448493          	addi	s1,s1,772 # ffffffffc020b6a8 <etext+0x228>
ffffffffc02003ac:	49bd                	li	s3,15
ffffffffc02003ae:	0000bb17          	auipc	s6,0xb
ffffffffc02003b2:	302b0b13          	addi	s6,s6,770 # ffffffffc020b6b0 <etext+0x230>
ffffffffc02003b6:	0000ba17          	auipc	s4,0xb
ffffffffc02003ba:	21aa0a13          	addi	s4,s4,538 # ffffffffc020b5d0 <etext+0x150>
ffffffffc02003be:	4a8d                	li	s5,3
ffffffffc02003c0:	854a                	mv	a0,s2
ffffffffc02003c2:	cf1ff0ef          	jal	ra,ffffffffc02000b2 <readline>
ffffffffc02003c6:	842a                	mv	s0,a0
ffffffffc02003c8:	dd65                	beqz	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003ca:	00054583          	lbu	a1,0(a0)
ffffffffc02003ce:	4c81                	li	s9,0
ffffffffc02003d0:	e1bd                	bnez	a1,ffffffffc0200436 <kmonitor+0xe0>
ffffffffc02003d2:	fe0c87e3          	beqz	s9,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003d6:	6582                	ld	a1,0(sp)
ffffffffc02003d8:	0000bd17          	auipc	s10,0xb
ffffffffc02003dc:	310d0d13          	addi	s10,s10,784 # ffffffffc020b6e8 <commands>
ffffffffc02003e0:	8552                	mv	a0,s4
ffffffffc02003e2:	4401                	li	s0,0
ffffffffc02003e4:	0d61                	addi	s10,s10,24
ffffffffc02003e6:	7d70a0ef          	jal	ra,ffffffffc020b3bc <strcmp>
ffffffffc02003ea:	c919                	beqz	a0,ffffffffc0200400 <kmonitor+0xaa>
ffffffffc02003ec:	2405                	addiw	s0,s0,1
ffffffffc02003ee:	0b540063          	beq	s0,s5,ffffffffc020048e <kmonitor+0x138>
ffffffffc02003f2:	000d3503          	ld	a0,0(s10)
ffffffffc02003f6:	6582                	ld	a1,0(sp)
ffffffffc02003f8:	0d61                	addi	s10,s10,24
ffffffffc02003fa:	7c30a0ef          	jal	ra,ffffffffc020b3bc <strcmp>
ffffffffc02003fe:	f57d                	bnez	a0,ffffffffc02003ec <kmonitor+0x96>
ffffffffc0200400:	00141793          	slli	a5,s0,0x1
ffffffffc0200404:	97a2                	add	a5,a5,s0
ffffffffc0200406:	078e                	slli	a5,a5,0x3
ffffffffc0200408:	97e2                	add	a5,a5,s8
ffffffffc020040a:	6b9c                	ld	a5,16(a5)
ffffffffc020040c:	865e                	mv	a2,s7
ffffffffc020040e:	002c                	addi	a1,sp,8
ffffffffc0200410:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200414:	9782                	jalr	a5
ffffffffc0200416:	fa0555e3          	bgez	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc020041a:	60ee                	ld	ra,216(sp)
ffffffffc020041c:	644e                	ld	s0,208(sp)
ffffffffc020041e:	64ae                	ld	s1,200(sp)
ffffffffc0200420:	690e                	ld	s2,192(sp)
ffffffffc0200422:	79ea                	ld	s3,184(sp)
ffffffffc0200424:	7a4a                	ld	s4,176(sp)
ffffffffc0200426:	7aaa                	ld	s5,168(sp)
ffffffffc0200428:	7b0a                	ld	s6,160(sp)
ffffffffc020042a:	6bea                	ld	s7,152(sp)
ffffffffc020042c:	6c4a                	ld	s8,144(sp)
ffffffffc020042e:	6caa                	ld	s9,136(sp)
ffffffffc0200430:	6d0a                	ld	s10,128(sp)
ffffffffc0200432:	612d                	addi	sp,sp,224
ffffffffc0200434:	8082                	ret
ffffffffc0200436:	8526                	mv	a0,s1
ffffffffc0200438:	7c90a0ef          	jal	ra,ffffffffc020b400 <strchr>
ffffffffc020043c:	c901                	beqz	a0,ffffffffc020044c <kmonitor+0xf6>
ffffffffc020043e:	00144583          	lbu	a1,1(s0)
ffffffffc0200442:	00040023          	sb	zero,0(s0)
ffffffffc0200446:	0405                	addi	s0,s0,1
ffffffffc0200448:	d5c9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc020044a:	b7f5                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc020044c:	00044783          	lbu	a5,0(s0)
ffffffffc0200450:	d3c9                	beqz	a5,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200452:	033c8963          	beq	s9,s3,ffffffffc0200484 <kmonitor+0x12e>
ffffffffc0200456:	003c9793          	slli	a5,s9,0x3
ffffffffc020045a:	0118                	addi	a4,sp,128
ffffffffc020045c:	97ba                	add	a5,a5,a4
ffffffffc020045e:	f887b023          	sd	s0,-128(a5)
ffffffffc0200462:	00044583          	lbu	a1,0(s0)
ffffffffc0200466:	2c85                	addiw	s9,s9,1
ffffffffc0200468:	e591                	bnez	a1,ffffffffc0200474 <kmonitor+0x11e>
ffffffffc020046a:	b7b5                	j	ffffffffc02003d6 <kmonitor+0x80>
ffffffffc020046c:	00144583          	lbu	a1,1(s0)
ffffffffc0200470:	0405                	addi	s0,s0,1
ffffffffc0200472:	d1a5                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200474:	8526                	mv	a0,s1
ffffffffc0200476:	78b0a0ef          	jal	ra,ffffffffc020b400 <strchr>
ffffffffc020047a:	d96d                	beqz	a0,ffffffffc020046c <kmonitor+0x116>
ffffffffc020047c:	00044583          	lbu	a1,0(s0)
ffffffffc0200480:	d9a9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200482:	bf55                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc0200484:	45c1                	li	a1,16
ffffffffc0200486:	855a                	mv	a0,s6
ffffffffc0200488:	d1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020048c:	b7e9                	j	ffffffffc0200456 <kmonitor+0x100>
ffffffffc020048e:	6582                	ld	a1,0(sp)
ffffffffc0200490:	0000b517          	auipc	a0,0xb
ffffffffc0200494:	24050513          	addi	a0,a0,576 # ffffffffc020b6d0 <etext+0x250>
ffffffffc0200498:	d0fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020049c:	b715                	j	ffffffffc02003c0 <kmonitor+0x6a>

ffffffffc020049e <__panic>:
ffffffffc020049e:	00096317          	auipc	t1,0x96
ffffffffc02004a2:	3ca30313          	addi	t1,t1,970 # ffffffffc0296868 <is_panic>
ffffffffc02004a6:	00033e03          	ld	t3,0(t1)
ffffffffc02004aa:	715d                	addi	sp,sp,-80
ffffffffc02004ac:	ec06                	sd	ra,24(sp)
ffffffffc02004ae:	e822                	sd	s0,16(sp)
ffffffffc02004b0:	f436                	sd	a3,40(sp)
ffffffffc02004b2:	f83a                	sd	a4,48(sp)
ffffffffc02004b4:	fc3e                	sd	a5,56(sp)
ffffffffc02004b6:	e0c2                	sd	a6,64(sp)
ffffffffc02004b8:	e4c6                	sd	a7,72(sp)
ffffffffc02004ba:	020e1a63          	bnez	t3,ffffffffc02004ee <__panic+0x50>
ffffffffc02004be:	4785                	li	a5,1
ffffffffc02004c0:	00f33023          	sd	a5,0(t1)
ffffffffc02004c4:	8432                	mv	s0,a2
ffffffffc02004c6:	103c                	addi	a5,sp,40
ffffffffc02004c8:	862e                	mv	a2,a1
ffffffffc02004ca:	85aa                	mv	a1,a0
ffffffffc02004cc:	0000b517          	auipc	a0,0xb
ffffffffc02004d0:	26450513          	addi	a0,a0,612 # ffffffffc020b730 <commands+0x48>
ffffffffc02004d4:	e43e                	sd	a5,8(sp)
ffffffffc02004d6:	cd1ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004da:	65a2                	ld	a1,8(sp)
ffffffffc02004dc:	8522                	mv	a0,s0
ffffffffc02004de:	ca3ff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc02004e2:	0000c517          	auipc	a0,0xc
ffffffffc02004e6:	52e50513          	addi	a0,a0,1326 # ffffffffc020ca10 <default_pmm_manager+0x630>
ffffffffc02004ea:	cbdff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004ee:	4501                	li	a0,0
ffffffffc02004f0:	4581                	li	a1,0
ffffffffc02004f2:	4601                	li	a2,0
ffffffffc02004f4:	48a1                	li	a7,8
ffffffffc02004f6:	00000073          	ecall
ffffffffc02004fa:	778000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02004fe:	4501                	li	a0,0
ffffffffc0200500:	e57ff0ef          	jal	ra,ffffffffc0200356 <kmonitor>
ffffffffc0200504:	bfed                	j	ffffffffc02004fe <__panic+0x60>

ffffffffc0200506 <__warn>:
ffffffffc0200506:	715d                	addi	sp,sp,-80
ffffffffc0200508:	832e                	mv	t1,a1
ffffffffc020050a:	e822                	sd	s0,16(sp)
ffffffffc020050c:	85aa                	mv	a1,a0
ffffffffc020050e:	8432                	mv	s0,a2
ffffffffc0200510:	fc3e                	sd	a5,56(sp)
ffffffffc0200512:	861a                	mv	a2,t1
ffffffffc0200514:	103c                	addi	a5,sp,40
ffffffffc0200516:	0000b517          	auipc	a0,0xb
ffffffffc020051a:	23a50513          	addi	a0,a0,570 # ffffffffc020b750 <commands+0x68>
ffffffffc020051e:	ec06                	sd	ra,24(sp)
ffffffffc0200520:	f436                	sd	a3,40(sp)
ffffffffc0200522:	f83a                	sd	a4,48(sp)
ffffffffc0200524:	e0c2                	sd	a6,64(sp)
ffffffffc0200526:	e4c6                	sd	a7,72(sp)
ffffffffc0200528:	e43e                	sd	a5,8(sp)
ffffffffc020052a:	c7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020052e:	65a2                	ld	a1,8(sp)
ffffffffc0200530:	8522                	mv	a0,s0
ffffffffc0200532:	c4fff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc0200536:	0000c517          	auipc	a0,0xc
ffffffffc020053a:	4da50513          	addi	a0,a0,1242 # ffffffffc020ca10 <default_pmm_manager+0x630>
ffffffffc020053e:	c69ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200542:	60e2                	ld	ra,24(sp)
ffffffffc0200544:	6442                	ld	s0,16(sp)
ffffffffc0200546:	6161                	addi	sp,sp,80
ffffffffc0200548:	8082                	ret

ffffffffc020054a <clock_init>:
ffffffffc020054a:	02000793          	li	a5,32
ffffffffc020054e:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200552:	c0102573          	rdtime	a0
ffffffffc0200556:	67e1                	lui	a5,0x18
ffffffffc0200558:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc020055c:	953e                	add	a0,a0,a5
ffffffffc020055e:	4581                	li	a1,0
ffffffffc0200560:	4601                	li	a2,0
ffffffffc0200562:	4881                	li	a7,0
ffffffffc0200564:	00000073          	ecall
ffffffffc0200568:	0000b517          	auipc	a0,0xb
ffffffffc020056c:	20850513          	addi	a0,a0,520 # ffffffffc020b770 <commands+0x88>
ffffffffc0200570:	00096797          	auipc	a5,0x96
ffffffffc0200574:	3007b023          	sd	zero,768(a5) # ffffffffc0296870 <ticks>
ffffffffc0200578:	b13d                	j	ffffffffc02001a6 <cprintf>

ffffffffc020057a <clock_set_next_event>:
ffffffffc020057a:	c0102573          	rdtime	a0
ffffffffc020057e:	67e1                	lui	a5,0x18
ffffffffc0200580:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc0200584:	953e                	add	a0,a0,a5
ffffffffc0200586:	4581                	li	a1,0
ffffffffc0200588:	4601                	li	a2,0
ffffffffc020058a:	4881                	li	a7,0
ffffffffc020058c:	00000073          	ecall
ffffffffc0200590:	8082                	ret

ffffffffc0200592 <cons_init>:
ffffffffc0200592:	4501                	li	a0,0
ffffffffc0200594:	4581                	li	a1,0
ffffffffc0200596:	4601                	li	a2,0
ffffffffc0200598:	4889                	li	a7,2
ffffffffc020059a:	00000073          	ecall
ffffffffc020059e:	8082                	ret

ffffffffc02005a0 <cons_putc>:
ffffffffc02005a0:	1101                	addi	sp,sp,-32
ffffffffc02005a2:	ec06                	sd	ra,24(sp)
ffffffffc02005a4:	100027f3          	csrr	a5,sstatus
ffffffffc02005a8:	8b89                	andi	a5,a5,2
ffffffffc02005aa:	4701                	li	a4,0
ffffffffc02005ac:	ef95                	bnez	a5,ffffffffc02005e8 <cons_putc+0x48>
ffffffffc02005ae:	47a1                	li	a5,8
ffffffffc02005b0:	00f50b63          	beq	a0,a5,ffffffffc02005c6 <cons_putc+0x26>
ffffffffc02005b4:	4581                	li	a1,0
ffffffffc02005b6:	4601                	li	a2,0
ffffffffc02005b8:	4885                	li	a7,1
ffffffffc02005ba:	00000073          	ecall
ffffffffc02005be:	e315                	bnez	a4,ffffffffc02005e2 <cons_putc+0x42>
ffffffffc02005c0:	60e2                	ld	ra,24(sp)
ffffffffc02005c2:	6105                	addi	sp,sp,32
ffffffffc02005c4:	8082                	ret
ffffffffc02005c6:	4521                	li	a0,8
ffffffffc02005c8:	4581                	li	a1,0
ffffffffc02005ca:	4601                	li	a2,0
ffffffffc02005cc:	4885                	li	a7,1
ffffffffc02005ce:	00000073          	ecall
ffffffffc02005d2:	02000513          	li	a0,32
ffffffffc02005d6:	00000073          	ecall
ffffffffc02005da:	4521                	li	a0,8
ffffffffc02005dc:	00000073          	ecall
ffffffffc02005e0:	d365                	beqz	a4,ffffffffc02005c0 <cons_putc+0x20>
ffffffffc02005e2:	60e2                	ld	ra,24(sp)
ffffffffc02005e4:	6105                	addi	sp,sp,32
ffffffffc02005e6:	a559                	j	ffffffffc0200c6c <intr_enable>
ffffffffc02005e8:	e42a                	sd	a0,8(sp)
ffffffffc02005ea:	688000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02005ee:	6522                	ld	a0,8(sp)
ffffffffc02005f0:	4705                	li	a4,1
ffffffffc02005f2:	bf75                	j	ffffffffc02005ae <cons_putc+0xe>

ffffffffc02005f4 <cons_getc>:
ffffffffc02005f4:	1101                	addi	sp,sp,-32
ffffffffc02005f6:	ec06                	sd	ra,24(sp)
ffffffffc02005f8:	100027f3          	csrr	a5,sstatus
ffffffffc02005fc:	8b89                	andi	a5,a5,2
ffffffffc02005fe:	4801                	li	a6,0
ffffffffc0200600:	e3d5                	bnez	a5,ffffffffc02006a4 <cons_getc+0xb0>
ffffffffc0200602:	00091697          	auipc	a3,0x91
ffffffffc0200606:	e5e68693          	addi	a3,a3,-418 # ffffffffc0291460 <cons>
ffffffffc020060a:	07f00713          	li	a4,127
ffffffffc020060e:	20000313          	li	t1,512
ffffffffc0200612:	a021                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200614:	0ff57513          	zext.b	a0,a0
ffffffffc0200618:	ef91                	bnez	a5,ffffffffc0200634 <cons_getc+0x40>
ffffffffc020061a:	4501                	li	a0,0
ffffffffc020061c:	4581                	li	a1,0
ffffffffc020061e:	4601                	li	a2,0
ffffffffc0200620:	4889                	li	a7,2
ffffffffc0200622:	00000073          	ecall
ffffffffc0200626:	0005079b          	sext.w	a5,a0
ffffffffc020062a:	0207c763          	bltz	a5,ffffffffc0200658 <cons_getc+0x64>
ffffffffc020062e:	fee793e3          	bne	a5,a4,ffffffffc0200614 <cons_getc+0x20>
ffffffffc0200632:	4521                	li	a0,8
ffffffffc0200634:	2046a783          	lw	a5,516(a3)
ffffffffc0200638:	02079613          	slli	a2,a5,0x20
ffffffffc020063c:	9201                	srli	a2,a2,0x20
ffffffffc020063e:	2785                	addiw	a5,a5,1
ffffffffc0200640:	9636                	add	a2,a2,a3
ffffffffc0200642:	20f6a223          	sw	a5,516(a3)
ffffffffc0200646:	00a60023          	sb	a0,0(a2)
ffffffffc020064a:	fc6798e3          	bne	a5,t1,ffffffffc020061a <cons_getc+0x26>
ffffffffc020064e:	00091797          	auipc	a5,0x91
ffffffffc0200652:	0007ab23          	sw	zero,22(a5) # ffffffffc0291664 <cons+0x204>
ffffffffc0200656:	b7d1                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200658:	2006a783          	lw	a5,512(a3)
ffffffffc020065c:	2046a703          	lw	a4,516(a3)
ffffffffc0200660:	4501                	li	a0,0
ffffffffc0200662:	00f70f63          	beq	a4,a5,ffffffffc0200680 <cons_getc+0x8c>
ffffffffc0200666:	0017861b          	addiw	a2,a5,1
ffffffffc020066a:	1782                	slli	a5,a5,0x20
ffffffffc020066c:	9381                	srli	a5,a5,0x20
ffffffffc020066e:	97b6                	add	a5,a5,a3
ffffffffc0200670:	20c6a023          	sw	a2,512(a3)
ffffffffc0200674:	20000713          	li	a4,512
ffffffffc0200678:	0007c503          	lbu	a0,0(a5)
ffffffffc020067c:	00e60763          	beq	a2,a4,ffffffffc020068a <cons_getc+0x96>
ffffffffc0200680:	00081b63          	bnez	a6,ffffffffc0200696 <cons_getc+0xa2>
ffffffffc0200684:	60e2                	ld	ra,24(sp)
ffffffffc0200686:	6105                	addi	sp,sp,32
ffffffffc0200688:	8082                	ret
ffffffffc020068a:	00091797          	auipc	a5,0x91
ffffffffc020068e:	fc07ab23          	sw	zero,-42(a5) # ffffffffc0291660 <cons+0x200>
ffffffffc0200692:	fe0809e3          	beqz	a6,ffffffffc0200684 <cons_getc+0x90>
ffffffffc0200696:	e42a                	sd	a0,8(sp)
ffffffffc0200698:	5d4000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020069c:	60e2                	ld	ra,24(sp)
ffffffffc020069e:	6522                	ld	a0,8(sp)
ffffffffc02006a0:	6105                	addi	sp,sp,32
ffffffffc02006a2:	8082                	ret
ffffffffc02006a4:	5ce000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02006a8:	4805                	li	a6,1
ffffffffc02006aa:	bfa1                	j	ffffffffc0200602 <cons_getc+0xe>

ffffffffc02006ac <dtb_init>:
ffffffffc02006ac:	7119                	addi	sp,sp,-128
ffffffffc02006ae:	0000b517          	auipc	a0,0xb
ffffffffc02006b2:	0e250513          	addi	a0,a0,226 # ffffffffc020b790 <commands+0xa8>
ffffffffc02006b6:	fc86                	sd	ra,120(sp)
ffffffffc02006b8:	f8a2                	sd	s0,112(sp)
ffffffffc02006ba:	e8d2                	sd	s4,80(sp)
ffffffffc02006bc:	f4a6                	sd	s1,104(sp)
ffffffffc02006be:	f0ca                	sd	s2,96(sp)
ffffffffc02006c0:	ecce                	sd	s3,88(sp)
ffffffffc02006c2:	e4d6                	sd	s5,72(sp)
ffffffffc02006c4:	e0da                	sd	s6,64(sp)
ffffffffc02006c6:	fc5e                	sd	s7,56(sp)
ffffffffc02006c8:	f862                	sd	s8,48(sp)
ffffffffc02006ca:	f466                	sd	s9,40(sp)
ffffffffc02006cc:	f06a                	sd	s10,32(sp)
ffffffffc02006ce:	ec6e                	sd	s11,24(sp)
ffffffffc02006d0:	ad7ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006d4:	00014597          	auipc	a1,0x14
ffffffffc02006d8:	92c5b583          	ld	a1,-1748(a1) # ffffffffc0214000 <boot_hartid>
ffffffffc02006dc:	0000b517          	auipc	a0,0xb
ffffffffc02006e0:	0c450513          	addi	a0,a0,196 # ffffffffc020b7a0 <commands+0xb8>
ffffffffc02006e4:	ac3ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006e8:	00014417          	auipc	s0,0x14
ffffffffc02006ec:	92040413          	addi	s0,s0,-1760 # ffffffffc0214008 <boot_dtb>
ffffffffc02006f0:	600c                	ld	a1,0(s0)
ffffffffc02006f2:	0000b517          	auipc	a0,0xb
ffffffffc02006f6:	0be50513          	addi	a0,a0,190 # ffffffffc020b7b0 <commands+0xc8>
ffffffffc02006fa:	aadff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006fe:	00043a03          	ld	s4,0(s0)
ffffffffc0200702:	0000b517          	auipc	a0,0xb
ffffffffc0200706:	0c650513          	addi	a0,a0,198 # ffffffffc020b7c8 <commands+0xe0>
ffffffffc020070a:	120a0463          	beqz	s4,ffffffffc0200832 <dtb_init+0x186>
ffffffffc020070e:	57f5                	li	a5,-3
ffffffffc0200710:	07fa                	slli	a5,a5,0x1e
ffffffffc0200712:	00fa0733          	add	a4,s4,a5
ffffffffc0200716:	431c                	lw	a5,0(a4)
ffffffffc0200718:	00ff0637          	lui	a2,0xff0
ffffffffc020071c:	6b41                	lui	s6,0x10
ffffffffc020071e:	0087d59b          	srliw	a1,a5,0x8
ffffffffc0200722:	0187969b          	slliw	a3,a5,0x18
ffffffffc0200726:	0187d51b          	srliw	a0,a5,0x18
ffffffffc020072a:	0105959b          	slliw	a1,a1,0x10
ffffffffc020072e:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200732:	8df1                	and	a1,a1,a2
ffffffffc0200734:	8ec9                	or	a3,a3,a0
ffffffffc0200736:	0087979b          	slliw	a5,a5,0x8
ffffffffc020073a:	1b7d                	addi	s6,s6,-1
ffffffffc020073c:	0167f7b3          	and	a5,a5,s6
ffffffffc0200740:	8dd5                	or	a1,a1,a3
ffffffffc0200742:	8ddd                	or	a1,a1,a5
ffffffffc0200744:	d00e07b7          	lui	a5,0xd00e0
ffffffffc0200748:	2581                	sext.w	a1,a1
ffffffffc020074a:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfe495dd>
ffffffffc020074e:	10f59163          	bne	a1,a5,ffffffffc0200850 <dtb_init+0x1a4>
ffffffffc0200752:	471c                	lw	a5,8(a4)
ffffffffc0200754:	4754                	lw	a3,12(a4)
ffffffffc0200756:	4c81                	li	s9,0
ffffffffc0200758:	0087d59b          	srliw	a1,a5,0x8
ffffffffc020075c:	0086d51b          	srliw	a0,a3,0x8
ffffffffc0200760:	0186941b          	slliw	s0,a3,0x18
ffffffffc0200764:	0186d89b          	srliw	a7,a3,0x18
ffffffffc0200768:	01879a1b          	slliw	s4,a5,0x18
ffffffffc020076c:	0187d81b          	srliw	a6,a5,0x18
ffffffffc0200770:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200774:	0106d69b          	srliw	a3,a3,0x10
ffffffffc0200778:	0105959b          	slliw	a1,a1,0x10
ffffffffc020077c:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200780:	8d71                	and	a0,a0,a2
ffffffffc0200782:	01146433          	or	s0,s0,a7
ffffffffc0200786:	0086969b          	slliw	a3,a3,0x8
ffffffffc020078a:	010a6a33          	or	s4,s4,a6
ffffffffc020078e:	8e6d                	and	a2,a2,a1
ffffffffc0200790:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200794:	8c49                	or	s0,s0,a0
ffffffffc0200796:	0166f6b3          	and	a3,a3,s6
ffffffffc020079a:	00ca6a33          	or	s4,s4,a2
ffffffffc020079e:	0167f7b3          	and	a5,a5,s6
ffffffffc02007a2:	8c55                	or	s0,s0,a3
ffffffffc02007a4:	00fa6a33          	or	s4,s4,a5
ffffffffc02007a8:	1402                	slli	s0,s0,0x20
ffffffffc02007aa:	1a02                	slli	s4,s4,0x20
ffffffffc02007ac:	9001                	srli	s0,s0,0x20
ffffffffc02007ae:	020a5a13          	srli	s4,s4,0x20
ffffffffc02007b2:	943a                	add	s0,s0,a4
ffffffffc02007b4:	9a3a                	add	s4,s4,a4
ffffffffc02007b6:	00ff0c37          	lui	s8,0xff0
ffffffffc02007ba:	4b8d                	li	s7,3
ffffffffc02007bc:	0000b917          	auipc	s2,0xb
ffffffffc02007c0:	05c90913          	addi	s2,s2,92 # ffffffffc020b818 <commands+0x130>
ffffffffc02007c4:	49bd                	li	s3,15
ffffffffc02007c6:	4d91                	li	s11,4
ffffffffc02007c8:	4d05                	li	s10,1
ffffffffc02007ca:	0000b497          	auipc	s1,0xb
ffffffffc02007ce:	04648493          	addi	s1,s1,70 # ffffffffc020b810 <commands+0x128>
ffffffffc02007d2:	000a2703          	lw	a4,0(s4)
ffffffffc02007d6:	004a0a93          	addi	s5,s4,4
ffffffffc02007da:	0087569b          	srliw	a3,a4,0x8
ffffffffc02007de:	0187179b          	slliw	a5,a4,0x18
ffffffffc02007e2:	0187561b          	srliw	a2,a4,0x18
ffffffffc02007e6:	0106969b          	slliw	a3,a3,0x10
ffffffffc02007ea:	0107571b          	srliw	a4,a4,0x10
ffffffffc02007ee:	8fd1                	or	a5,a5,a2
ffffffffc02007f0:	0186f6b3          	and	a3,a3,s8
ffffffffc02007f4:	0087171b          	slliw	a4,a4,0x8
ffffffffc02007f8:	8fd5                	or	a5,a5,a3
ffffffffc02007fa:	00eb7733          	and	a4,s6,a4
ffffffffc02007fe:	8fd9                	or	a5,a5,a4
ffffffffc0200800:	2781                	sext.w	a5,a5
ffffffffc0200802:	09778c63          	beq	a5,s7,ffffffffc020089a <dtb_init+0x1ee>
ffffffffc0200806:	00fbea63          	bltu	s7,a5,ffffffffc020081a <dtb_init+0x16e>
ffffffffc020080a:	07a78663          	beq	a5,s10,ffffffffc0200876 <dtb_init+0x1ca>
ffffffffc020080e:	4709                	li	a4,2
ffffffffc0200810:	00e79763          	bne	a5,a4,ffffffffc020081e <dtb_init+0x172>
ffffffffc0200814:	4c81                	li	s9,0
ffffffffc0200816:	8a56                	mv	s4,s5
ffffffffc0200818:	bf6d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020081a:	ffb78ee3          	beq	a5,s11,ffffffffc0200816 <dtb_init+0x16a>
ffffffffc020081e:	0000b517          	auipc	a0,0xb
ffffffffc0200822:	07250513          	addi	a0,a0,114 # ffffffffc020b890 <commands+0x1a8>
ffffffffc0200826:	981ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020082a:	0000b517          	auipc	a0,0xb
ffffffffc020082e:	09e50513          	addi	a0,a0,158 # ffffffffc020b8c8 <commands+0x1e0>
ffffffffc0200832:	7446                	ld	s0,112(sp)
ffffffffc0200834:	70e6                	ld	ra,120(sp)
ffffffffc0200836:	74a6                	ld	s1,104(sp)
ffffffffc0200838:	7906                	ld	s2,96(sp)
ffffffffc020083a:	69e6                	ld	s3,88(sp)
ffffffffc020083c:	6a46                	ld	s4,80(sp)
ffffffffc020083e:	6aa6                	ld	s5,72(sp)
ffffffffc0200840:	6b06                	ld	s6,64(sp)
ffffffffc0200842:	7be2                	ld	s7,56(sp)
ffffffffc0200844:	7c42                	ld	s8,48(sp)
ffffffffc0200846:	7ca2                	ld	s9,40(sp)
ffffffffc0200848:	7d02                	ld	s10,32(sp)
ffffffffc020084a:	6de2                	ld	s11,24(sp)
ffffffffc020084c:	6109                	addi	sp,sp,128
ffffffffc020084e:	baa1                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200850:	7446                	ld	s0,112(sp)
ffffffffc0200852:	70e6                	ld	ra,120(sp)
ffffffffc0200854:	74a6                	ld	s1,104(sp)
ffffffffc0200856:	7906                	ld	s2,96(sp)
ffffffffc0200858:	69e6                	ld	s3,88(sp)
ffffffffc020085a:	6a46                	ld	s4,80(sp)
ffffffffc020085c:	6aa6                	ld	s5,72(sp)
ffffffffc020085e:	6b06                	ld	s6,64(sp)
ffffffffc0200860:	7be2                	ld	s7,56(sp)
ffffffffc0200862:	7c42                	ld	s8,48(sp)
ffffffffc0200864:	7ca2                	ld	s9,40(sp)
ffffffffc0200866:	7d02                	ld	s10,32(sp)
ffffffffc0200868:	6de2                	ld	s11,24(sp)
ffffffffc020086a:	0000b517          	auipc	a0,0xb
ffffffffc020086e:	f7e50513          	addi	a0,a0,-130 # ffffffffc020b7e8 <commands+0x100>
ffffffffc0200872:	6109                	addi	sp,sp,128
ffffffffc0200874:	ba0d                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200876:	8556                	mv	a0,s5
ffffffffc0200878:	2fd0a0ef          	jal	ra,ffffffffc020b374 <strlen>
ffffffffc020087c:	8a2a                	mv	s4,a0
ffffffffc020087e:	4619                	li	a2,6
ffffffffc0200880:	85a6                	mv	a1,s1
ffffffffc0200882:	8556                	mv	a0,s5
ffffffffc0200884:	2a01                	sext.w	s4,s4
ffffffffc0200886:	3550a0ef          	jal	ra,ffffffffc020b3da <strncmp>
ffffffffc020088a:	e111                	bnez	a0,ffffffffc020088e <dtb_init+0x1e2>
ffffffffc020088c:	4c85                	li	s9,1
ffffffffc020088e:	0a91                	addi	s5,s5,4
ffffffffc0200890:	9ad2                	add	s5,s5,s4
ffffffffc0200892:	ffcafa93          	andi	s5,s5,-4
ffffffffc0200896:	8a56                	mv	s4,s5
ffffffffc0200898:	bf2d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020089a:	004a2783          	lw	a5,4(s4)
ffffffffc020089e:	00ca0693          	addi	a3,s4,12
ffffffffc02008a2:	0087d71b          	srliw	a4,a5,0x8
ffffffffc02008a6:	01879a9b          	slliw	s5,a5,0x18
ffffffffc02008aa:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008ae:	0107171b          	slliw	a4,a4,0x10
ffffffffc02008b2:	0107d79b          	srliw	a5,a5,0x10
ffffffffc02008b6:	00caeab3          	or	s5,s5,a2
ffffffffc02008ba:	01877733          	and	a4,a4,s8
ffffffffc02008be:	0087979b          	slliw	a5,a5,0x8
ffffffffc02008c2:	00eaeab3          	or	s5,s5,a4
ffffffffc02008c6:	00fb77b3          	and	a5,s6,a5
ffffffffc02008ca:	00faeab3          	or	s5,s5,a5
ffffffffc02008ce:	2a81                	sext.w	s5,s5
ffffffffc02008d0:	000c9c63          	bnez	s9,ffffffffc02008e8 <dtb_init+0x23c>
ffffffffc02008d4:	1a82                	slli	s5,s5,0x20
ffffffffc02008d6:	00368793          	addi	a5,a3,3
ffffffffc02008da:	020ada93          	srli	s5,s5,0x20
ffffffffc02008de:	9abe                	add	s5,s5,a5
ffffffffc02008e0:	ffcafa93          	andi	s5,s5,-4
ffffffffc02008e4:	8a56                	mv	s4,s5
ffffffffc02008e6:	b5f5                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc02008e8:	008a2783          	lw	a5,8(s4)
ffffffffc02008ec:	85ca                	mv	a1,s2
ffffffffc02008ee:	e436                	sd	a3,8(sp)
ffffffffc02008f0:	0087d51b          	srliw	a0,a5,0x8
ffffffffc02008f4:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008f8:	0187971b          	slliw	a4,a5,0x18
ffffffffc02008fc:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200900:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200904:	8f51                	or	a4,a4,a2
ffffffffc0200906:	01857533          	and	a0,a0,s8
ffffffffc020090a:	0087979b          	slliw	a5,a5,0x8
ffffffffc020090e:	8d59                	or	a0,a0,a4
ffffffffc0200910:	00fb77b3          	and	a5,s6,a5
ffffffffc0200914:	8d5d                	or	a0,a0,a5
ffffffffc0200916:	1502                	slli	a0,a0,0x20
ffffffffc0200918:	9101                	srli	a0,a0,0x20
ffffffffc020091a:	9522                	add	a0,a0,s0
ffffffffc020091c:	2a10a0ef          	jal	ra,ffffffffc020b3bc <strcmp>
ffffffffc0200920:	66a2                	ld	a3,8(sp)
ffffffffc0200922:	f94d                	bnez	a0,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200924:	fb59f8e3          	bgeu	s3,s5,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200928:	00ca3783          	ld	a5,12(s4)
ffffffffc020092c:	014a3703          	ld	a4,20(s4)
ffffffffc0200930:	0000b517          	auipc	a0,0xb
ffffffffc0200934:	ef050513          	addi	a0,a0,-272 # ffffffffc020b820 <commands+0x138>
ffffffffc0200938:	4207d613          	srai	a2,a5,0x20
ffffffffc020093c:	0087d31b          	srliw	t1,a5,0x8
ffffffffc0200940:	42075593          	srai	a1,a4,0x20
ffffffffc0200944:	0187de1b          	srliw	t3,a5,0x18
ffffffffc0200948:	0186581b          	srliw	a6,a2,0x18
ffffffffc020094c:	0187941b          	slliw	s0,a5,0x18
ffffffffc0200950:	0107d89b          	srliw	a7,a5,0x10
ffffffffc0200954:	0187d693          	srli	a3,a5,0x18
ffffffffc0200958:	01861f1b          	slliw	t5,a2,0x18
ffffffffc020095c:	0087579b          	srliw	a5,a4,0x8
ffffffffc0200960:	0103131b          	slliw	t1,t1,0x10
ffffffffc0200964:	0106561b          	srliw	a2,a2,0x10
ffffffffc0200968:	010f6f33          	or	t5,t5,a6
ffffffffc020096c:	0187529b          	srliw	t0,a4,0x18
ffffffffc0200970:	0185df9b          	srliw	t6,a1,0x18
ffffffffc0200974:	01837333          	and	t1,t1,s8
ffffffffc0200978:	01c46433          	or	s0,s0,t3
ffffffffc020097c:	0186f6b3          	and	a3,a3,s8
ffffffffc0200980:	01859e1b          	slliw	t3,a1,0x18
ffffffffc0200984:	01871e9b          	slliw	t4,a4,0x18
ffffffffc0200988:	0107581b          	srliw	a6,a4,0x10
ffffffffc020098c:	0086161b          	slliw	a2,a2,0x8
ffffffffc0200990:	8361                	srli	a4,a4,0x18
ffffffffc0200992:	0107979b          	slliw	a5,a5,0x10
ffffffffc0200996:	0105d59b          	srliw	a1,a1,0x10
ffffffffc020099a:	01e6e6b3          	or	a3,a3,t5
ffffffffc020099e:	00cb7633          	and	a2,s6,a2
ffffffffc02009a2:	0088181b          	slliw	a6,a6,0x8
ffffffffc02009a6:	0085959b          	slliw	a1,a1,0x8
ffffffffc02009aa:	00646433          	or	s0,s0,t1
ffffffffc02009ae:	0187f7b3          	and	a5,a5,s8
ffffffffc02009b2:	01fe6333          	or	t1,t3,t6
ffffffffc02009b6:	01877c33          	and	s8,a4,s8
ffffffffc02009ba:	0088989b          	slliw	a7,a7,0x8
ffffffffc02009be:	011b78b3          	and	a7,s6,a7
ffffffffc02009c2:	005eeeb3          	or	t4,t4,t0
ffffffffc02009c6:	00c6e733          	or	a4,a3,a2
ffffffffc02009ca:	006c6c33          	or	s8,s8,t1
ffffffffc02009ce:	010b76b3          	and	a3,s6,a6
ffffffffc02009d2:	00bb7b33          	and	s6,s6,a1
ffffffffc02009d6:	01d7e7b3          	or	a5,a5,t4
ffffffffc02009da:	016c6b33          	or	s6,s8,s6
ffffffffc02009de:	01146433          	or	s0,s0,a7
ffffffffc02009e2:	8fd5                	or	a5,a5,a3
ffffffffc02009e4:	1702                	slli	a4,a4,0x20
ffffffffc02009e6:	1b02                	slli	s6,s6,0x20
ffffffffc02009e8:	1782                	slli	a5,a5,0x20
ffffffffc02009ea:	9301                	srli	a4,a4,0x20
ffffffffc02009ec:	1402                	slli	s0,s0,0x20
ffffffffc02009ee:	020b5b13          	srli	s6,s6,0x20
ffffffffc02009f2:	0167eb33          	or	s6,a5,s6
ffffffffc02009f6:	8c59                	or	s0,s0,a4
ffffffffc02009f8:	faeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02009fc:	85a2                	mv	a1,s0
ffffffffc02009fe:	0000b517          	auipc	a0,0xb
ffffffffc0200a02:	e4250513          	addi	a0,a0,-446 # ffffffffc020b840 <commands+0x158>
ffffffffc0200a06:	fa0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a0a:	014b5613          	srli	a2,s6,0x14
ffffffffc0200a0e:	85da                	mv	a1,s6
ffffffffc0200a10:	0000b517          	auipc	a0,0xb
ffffffffc0200a14:	e4850513          	addi	a0,a0,-440 # ffffffffc020b858 <commands+0x170>
ffffffffc0200a18:	f8eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a1c:	008b05b3          	add	a1,s6,s0
ffffffffc0200a20:	15fd                	addi	a1,a1,-1
ffffffffc0200a22:	0000b517          	auipc	a0,0xb
ffffffffc0200a26:	e5650513          	addi	a0,a0,-426 # ffffffffc020b878 <commands+0x190>
ffffffffc0200a2a:	f7cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a2e:	0000b517          	auipc	a0,0xb
ffffffffc0200a32:	e9a50513          	addi	a0,a0,-358 # ffffffffc020b8c8 <commands+0x1e0>
ffffffffc0200a36:	00096797          	auipc	a5,0x96
ffffffffc0200a3a:	e487b123          	sd	s0,-446(a5) # ffffffffc0296878 <memory_base>
ffffffffc0200a3e:	00096797          	auipc	a5,0x96
ffffffffc0200a42:	e567b123          	sd	s6,-446(a5) # ffffffffc0296880 <memory_size>
ffffffffc0200a46:	b3f5                	j	ffffffffc0200832 <dtb_init+0x186>

ffffffffc0200a48 <get_memory_base>:
ffffffffc0200a48:	00096517          	auipc	a0,0x96
ffffffffc0200a4c:	e3053503          	ld	a0,-464(a0) # ffffffffc0296878 <memory_base>
ffffffffc0200a50:	8082                	ret

ffffffffc0200a52 <get_memory_size>:
ffffffffc0200a52:	00096517          	auipc	a0,0x96
ffffffffc0200a56:	e2e53503          	ld	a0,-466(a0) # ffffffffc0296880 <memory_size>
ffffffffc0200a5a:	8082                	ret

ffffffffc0200a5c <ide_init>:
ffffffffc0200a5c:	1141                	addi	sp,sp,-16
ffffffffc0200a5e:	00091597          	auipc	a1,0x91
ffffffffc0200a62:	c5a58593          	addi	a1,a1,-934 # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a66:	4505                	li	a0,1
ffffffffc0200a68:	e022                	sd	s0,0(sp)
ffffffffc0200a6a:	00091797          	auipc	a5,0x91
ffffffffc0200a6e:	be07af23          	sw	zero,-1026(a5) # ffffffffc0291668 <ide_devices>
ffffffffc0200a72:	00091797          	auipc	a5,0x91
ffffffffc0200a76:	c407a323          	sw	zero,-954(a5) # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a7a:	00091797          	auipc	a5,0x91
ffffffffc0200a7e:	c807a723          	sw	zero,-882(a5) # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200a82:	00091797          	auipc	a5,0x91
ffffffffc0200a86:	cc07ab23          	sw	zero,-810(a5) # ffffffffc0291758 <ide_devices+0xf0>
ffffffffc0200a8a:	e406                	sd	ra,8(sp)
ffffffffc0200a8c:	00091417          	auipc	s0,0x91
ffffffffc0200a90:	bdc40413          	addi	s0,s0,-1060 # ffffffffc0291668 <ide_devices>
ffffffffc0200a94:	23a000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200a98:	483c                	lw	a5,80(s0)
ffffffffc0200a9a:	cf99                	beqz	a5,ffffffffc0200ab8 <ide_init+0x5c>
ffffffffc0200a9c:	00091597          	auipc	a1,0x91
ffffffffc0200aa0:	c6c58593          	addi	a1,a1,-916 # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200aa4:	4509                	li	a0,2
ffffffffc0200aa6:	228000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200aaa:	0a042783          	lw	a5,160(s0)
ffffffffc0200aae:	c785                	beqz	a5,ffffffffc0200ad6 <ide_init+0x7a>
ffffffffc0200ab0:	60a2                	ld	ra,8(sp)
ffffffffc0200ab2:	6402                	ld	s0,0(sp)
ffffffffc0200ab4:	0141                	addi	sp,sp,16
ffffffffc0200ab6:	8082                	ret
ffffffffc0200ab8:	0000b697          	auipc	a3,0xb
ffffffffc0200abc:	e2868693          	addi	a3,a3,-472 # ffffffffc020b8e0 <commands+0x1f8>
ffffffffc0200ac0:	0000b617          	auipc	a2,0xb
ffffffffc0200ac4:	e3860613          	addi	a2,a2,-456 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0200ac8:	45c5                	li	a1,17
ffffffffc0200aca:	0000b517          	auipc	a0,0xb
ffffffffc0200ace:	e4650513          	addi	a0,a0,-442 # ffffffffc020b910 <commands+0x228>
ffffffffc0200ad2:	9cdff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200ad6:	0000b697          	auipc	a3,0xb
ffffffffc0200ada:	e5268693          	addi	a3,a3,-430 # ffffffffc020b928 <commands+0x240>
ffffffffc0200ade:	0000b617          	auipc	a2,0xb
ffffffffc0200ae2:	e1a60613          	addi	a2,a2,-486 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0200ae6:	45d1                	li	a1,20
ffffffffc0200ae8:	0000b517          	auipc	a0,0xb
ffffffffc0200aec:	e2850513          	addi	a0,a0,-472 # ffffffffc020b910 <commands+0x228>
ffffffffc0200af0:	9afff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200af4 <ide_device_valid>:
ffffffffc0200af4:	478d                	li	a5,3
ffffffffc0200af6:	00a7ef63          	bltu	a5,a0,ffffffffc0200b14 <ide_device_valid+0x20>
ffffffffc0200afa:	00251793          	slli	a5,a0,0x2
ffffffffc0200afe:	953e                	add	a0,a0,a5
ffffffffc0200b00:	0512                	slli	a0,a0,0x4
ffffffffc0200b02:	00091797          	auipc	a5,0x91
ffffffffc0200b06:	b6678793          	addi	a5,a5,-1178 # ffffffffc0291668 <ide_devices>
ffffffffc0200b0a:	953e                	add	a0,a0,a5
ffffffffc0200b0c:	4108                	lw	a0,0(a0)
ffffffffc0200b0e:	00a03533          	snez	a0,a0
ffffffffc0200b12:	8082                	ret
ffffffffc0200b14:	4501                	li	a0,0
ffffffffc0200b16:	8082                	ret

ffffffffc0200b18 <ide_device_size>:
ffffffffc0200b18:	478d                	li	a5,3
ffffffffc0200b1a:	02a7e163          	bltu	a5,a0,ffffffffc0200b3c <ide_device_size+0x24>
ffffffffc0200b1e:	00251793          	slli	a5,a0,0x2
ffffffffc0200b22:	953e                	add	a0,a0,a5
ffffffffc0200b24:	0512                	slli	a0,a0,0x4
ffffffffc0200b26:	00091797          	auipc	a5,0x91
ffffffffc0200b2a:	b4278793          	addi	a5,a5,-1214 # ffffffffc0291668 <ide_devices>
ffffffffc0200b2e:	97aa                	add	a5,a5,a0
ffffffffc0200b30:	4398                	lw	a4,0(a5)
ffffffffc0200b32:	4501                	li	a0,0
ffffffffc0200b34:	c709                	beqz	a4,ffffffffc0200b3e <ide_device_size+0x26>
ffffffffc0200b36:	0087e503          	lwu	a0,8(a5)
ffffffffc0200b3a:	8082                	ret
ffffffffc0200b3c:	4501                	li	a0,0
ffffffffc0200b3e:	8082                	ret

ffffffffc0200b40 <ide_read_secs>:
ffffffffc0200b40:	1141                	addi	sp,sp,-16
ffffffffc0200b42:	e406                	sd	ra,8(sp)
ffffffffc0200b44:	08000793          	li	a5,128
ffffffffc0200b48:	04d7e763          	bltu	a5,a3,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b4c:	478d                	li	a5,3
ffffffffc0200b4e:	0005081b          	sext.w	a6,a0
ffffffffc0200b52:	04a7e263          	bltu	a5,a0,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b56:	00281793          	slli	a5,a6,0x2
ffffffffc0200b5a:	97c2                	add	a5,a5,a6
ffffffffc0200b5c:	0792                	slli	a5,a5,0x4
ffffffffc0200b5e:	00091817          	auipc	a6,0x91
ffffffffc0200b62:	b0a80813          	addi	a6,a6,-1270 # ffffffffc0291668 <ide_devices>
ffffffffc0200b66:	97c2                	add	a5,a5,a6
ffffffffc0200b68:	0007a883          	lw	a7,0(a5)
ffffffffc0200b6c:	02088563          	beqz	a7,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b70:	100008b7          	lui	a7,0x10000
ffffffffc0200b74:	0515f163          	bgeu	a1,a7,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b78:	1582                	slli	a1,a1,0x20
ffffffffc0200b7a:	9181                	srli	a1,a1,0x20
ffffffffc0200b7c:	00d58733          	add	a4,a1,a3
ffffffffc0200b80:	02e8eb63          	bltu	a7,a4,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b84:	00251713          	slli	a4,a0,0x2
ffffffffc0200b88:	60a2                	ld	ra,8(sp)
ffffffffc0200b8a:	63bc                	ld	a5,64(a5)
ffffffffc0200b8c:	953a                	add	a0,a0,a4
ffffffffc0200b8e:	0512                	slli	a0,a0,0x4
ffffffffc0200b90:	9542                	add	a0,a0,a6
ffffffffc0200b92:	0141                	addi	sp,sp,16
ffffffffc0200b94:	8782                	jr	a5
ffffffffc0200b96:	0000b697          	auipc	a3,0xb
ffffffffc0200b9a:	daa68693          	addi	a3,a3,-598 # ffffffffc020b940 <commands+0x258>
ffffffffc0200b9e:	0000b617          	auipc	a2,0xb
ffffffffc0200ba2:	d5a60613          	addi	a2,a2,-678 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0200ba6:	02200593          	li	a1,34
ffffffffc0200baa:	0000b517          	auipc	a0,0xb
ffffffffc0200bae:	d6650513          	addi	a0,a0,-666 # ffffffffc020b910 <commands+0x228>
ffffffffc0200bb2:	8edff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200bb6:	0000b697          	auipc	a3,0xb
ffffffffc0200bba:	db268693          	addi	a3,a3,-590 # ffffffffc020b968 <commands+0x280>
ffffffffc0200bbe:	0000b617          	auipc	a2,0xb
ffffffffc0200bc2:	d3a60613          	addi	a2,a2,-710 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0200bc6:	02300593          	li	a1,35
ffffffffc0200bca:	0000b517          	auipc	a0,0xb
ffffffffc0200bce:	d4650513          	addi	a0,a0,-698 # ffffffffc020b910 <commands+0x228>
ffffffffc0200bd2:	8cdff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200bd6 <ide_write_secs>:
ffffffffc0200bd6:	1141                	addi	sp,sp,-16
ffffffffc0200bd8:	e406                	sd	ra,8(sp)
ffffffffc0200bda:	08000793          	li	a5,128
ffffffffc0200bde:	04d7e763          	bltu	a5,a3,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200be2:	478d                	li	a5,3
ffffffffc0200be4:	0005081b          	sext.w	a6,a0
ffffffffc0200be8:	04a7e263          	bltu	a5,a0,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200bec:	00281793          	slli	a5,a6,0x2
ffffffffc0200bf0:	97c2                	add	a5,a5,a6
ffffffffc0200bf2:	0792                	slli	a5,a5,0x4
ffffffffc0200bf4:	00091817          	auipc	a6,0x91
ffffffffc0200bf8:	a7480813          	addi	a6,a6,-1420 # ffffffffc0291668 <ide_devices>
ffffffffc0200bfc:	97c2                	add	a5,a5,a6
ffffffffc0200bfe:	0007a883          	lw	a7,0(a5)
ffffffffc0200c02:	02088563          	beqz	a7,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200c06:	100008b7          	lui	a7,0x10000
ffffffffc0200c0a:	0515f163          	bgeu	a1,a7,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c0e:	1582                	slli	a1,a1,0x20
ffffffffc0200c10:	9181                	srli	a1,a1,0x20
ffffffffc0200c12:	00d58733          	add	a4,a1,a3
ffffffffc0200c16:	02e8eb63          	bltu	a7,a4,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c1a:	00251713          	slli	a4,a0,0x2
ffffffffc0200c1e:	60a2                	ld	ra,8(sp)
ffffffffc0200c20:	67bc                	ld	a5,72(a5)
ffffffffc0200c22:	953a                	add	a0,a0,a4
ffffffffc0200c24:	0512                	slli	a0,a0,0x4
ffffffffc0200c26:	9542                	add	a0,a0,a6
ffffffffc0200c28:	0141                	addi	sp,sp,16
ffffffffc0200c2a:	8782                	jr	a5
ffffffffc0200c2c:	0000b697          	auipc	a3,0xb
ffffffffc0200c30:	d1468693          	addi	a3,a3,-748 # ffffffffc020b940 <commands+0x258>
ffffffffc0200c34:	0000b617          	auipc	a2,0xb
ffffffffc0200c38:	cc460613          	addi	a2,a2,-828 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0200c3c:	02900593          	li	a1,41
ffffffffc0200c40:	0000b517          	auipc	a0,0xb
ffffffffc0200c44:	cd050513          	addi	a0,a0,-816 # ffffffffc020b910 <commands+0x228>
ffffffffc0200c48:	857ff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200c4c:	0000b697          	auipc	a3,0xb
ffffffffc0200c50:	d1c68693          	addi	a3,a3,-740 # ffffffffc020b968 <commands+0x280>
ffffffffc0200c54:	0000b617          	auipc	a2,0xb
ffffffffc0200c58:	ca460613          	addi	a2,a2,-860 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0200c5c:	02a00593          	li	a1,42
ffffffffc0200c60:	0000b517          	auipc	a0,0xb
ffffffffc0200c64:	cb050513          	addi	a0,a0,-848 # ffffffffc020b910 <commands+0x228>
ffffffffc0200c68:	837ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200c6c <intr_enable>:
ffffffffc0200c6c:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200c70:	8082                	ret

ffffffffc0200c72 <intr_disable>:
ffffffffc0200c72:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200c76:	8082                	ret

ffffffffc0200c78 <pic_init>:
ffffffffc0200c78:	8082                	ret

ffffffffc0200c7a <ramdisk_write>:
ffffffffc0200c7a:	00856703          	lwu	a4,8(a0)
ffffffffc0200c7e:	1141                	addi	sp,sp,-16
ffffffffc0200c80:	e406                	sd	ra,8(sp)
ffffffffc0200c82:	8f0d                	sub	a4,a4,a1
ffffffffc0200c84:	87ae                	mv	a5,a1
ffffffffc0200c86:	85b2                	mv	a1,a2
ffffffffc0200c88:	00e6f363          	bgeu	a3,a4,ffffffffc0200c8e <ramdisk_write+0x14>
ffffffffc0200c8c:	8736                	mv	a4,a3
ffffffffc0200c8e:	6908                	ld	a0,16(a0)
ffffffffc0200c90:	07a6                	slli	a5,a5,0x9
ffffffffc0200c92:	00971613          	slli	a2,a4,0x9
ffffffffc0200c96:	953e                	add	a0,a0,a5
ffffffffc0200c98:	7d00a0ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc0200c9c:	60a2                	ld	ra,8(sp)
ffffffffc0200c9e:	4501                	li	a0,0
ffffffffc0200ca0:	0141                	addi	sp,sp,16
ffffffffc0200ca2:	8082                	ret

ffffffffc0200ca4 <ramdisk_read>:
ffffffffc0200ca4:	00856783          	lwu	a5,8(a0)
ffffffffc0200ca8:	1141                	addi	sp,sp,-16
ffffffffc0200caa:	e406                	sd	ra,8(sp)
ffffffffc0200cac:	8f8d                	sub	a5,a5,a1
ffffffffc0200cae:	872a                	mv	a4,a0
ffffffffc0200cb0:	8532                	mv	a0,a2
ffffffffc0200cb2:	00f6f363          	bgeu	a3,a5,ffffffffc0200cb8 <ramdisk_read+0x14>
ffffffffc0200cb6:	87b6                	mv	a5,a3
ffffffffc0200cb8:	6b18                	ld	a4,16(a4)
ffffffffc0200cba:	05a6                	slli	a1,a1,0x9
ffffffffc0200cbc:	00979613          	slli	a2,a5,0x9
ffffffffc0200cc0:	95ba                	add	a1,a1,a4
ffffffffc0200cc2:	7a60a0ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc0200cc6:	60a2                	ld	ra,8(sp)
ffffffffc0200cc8:	4501                	li	a0,0
ffffffffc0200cca:	0141                	addi	sp,sp,16
ffffffffc0200ccc:	8082                	ret

ffffffffc0200cce <ramdisk_init>:
ffffffffc0200cce:	1101                	addi	sp,sp,-32
ffffffffc0200cd0:	e822                	sd	s0,16(sp)
ffffffffc0200cd2:	842e                	mv	s0,a1
ffffffffc0200cd4:	e426                	sd	s1,8(sp)
ffffffffc0200cd6:	05000613          	li	a2,80
ffffffffc0200cda:	84aa                	mv	s1,a0
ffffffffc0200cdc:	4581                	li	a1,0
ffffffffc0200cde:	8522                	mv	a0,s0
ffffffffc0200ce0:	ec06                	sd	ra,24(sp)
ffffffffc0200ce2:	e04a                	sd	s2,0(sp)
ffffffffc0200ce4:	7320a0ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0200ce8:	4785                	li	a5,1
ffffffffc0200cea:	06f48b63          	beq	s1,a5,ffffffffc0200d60 <ramdisk_init+0x92>
ffffffffc0200cee:	4789                	li	a5,2
ffffffffc0200cf0:	00090617          	auipc	a2,0x90
ffffffffc0200cf4:	32060613          	addi	a2,a2,800 # ffffffffc0291010 <arena>
ffffffffc0200cf8:	0001b917          	auipc	s2,0x1b
ffffffffc0200cfc:	01890913          	addi	s2,s2,24 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d00:	08f49563          	bne	s1,a5,ffffffffc0200d8a <ramdisk_init+0xbc>
ffffffffc0200d04:	06c90863          	beq	s2,a2,ffffffffc0200d74 <ramdisk_init+0xa6>
ffffffffc0200d08:	412604b3          	sub	s1,a2,s2
ffffffffc0200d0c:	86a6                	mv	a3,s1
ffffffffc0200d0e:	85ca                	mv	a1,s2
ffffffffc0200d10:	167d                	addi	a2,a2,-1
ffffffffc0200d12:	0000b517          	auipc	a0,0xb
ffffffffc0200d16:	cae50513          	addi	a0,a0,-850 # ffffffffc020b9c0 <commands+0x2d8>
ffffffffc0200d1a:	c8cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200d1e:	57fd                	li	a5,-1
ffffffffc0200d20:	1782                	slli	a5,a5,0x20
ffffffffc0200d22:	0785                	addi	a5,a5,1
ffffffffc0200d24:	0094d49b          	srliw	s1,s1,0x9
ffffffffc0200d28:	e01c                	sd	a5,0(s0)
ffffffffc0200d2a:	c404                	sw	s1,8(s0)
ffffffffc0200d2c:	01243823          	sd	s2,16(s0)
ffffffffc0200d30:	02040513          	addi	a0,s0,32
ffffffffc0200d34:	0000b597          	auipc	a1,0xb
ffffffffc0200d38:	ce458593          	addi	a1,a1,-796 # ffffffffc020ba18 <commands+0x330>
ffffffffc0200d3c:	66e0a0ef          	jal	ra,ffffffffc020b3aa <strcpy>
ffffffffc0200d40:	00000797          	auipc	a5,0x0
ffffffffc0200d44:	f6478793          	addi	a5,a5,-156 # ffffffffc0200ca4 <ramdisk_read>
ffffffffc0200d48:	e03c                	sd	a5,64(s0)
ffffffffc0200d4a:	00000797          	auipc	a5,0x0
ffffffffc0200d4e:	f3078793          	addi	a5,a5,-208 # ffffffffc0200c7a <ramdisk_write>
ffffffffc0200d52:	60e2                	ld	ra,24(sp)
ffffffffc0200d54:	e43c                	sd	a5,72(s0)
ffffffffc0200d56:	6442                	ld	s0,16(sp)
ffffffffc0200d58:	64a2                	ld	s1,8(sp)
ffffffffc0200d5a:	6902                	ld	s2,0(sp)
ffffffffc0200d5c:	6105                	addi	sp,sp,32
ffffffffc0200d5e:	8082                	ret
ffffffffc0200d60:	0001b617          	auipc	a2,0x1b
ffffffffc0200d64:	fb060613          	addi	a2,a2,-80 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d68:	00013917          	auipc	s2,0x13
ffffffffc0200d6c:	2a890913          	addi	s2,s2,680 # ffffffffc0214010 <_binary_bin_swap_img_start>
ffffffffc0200d70:	f8c91ce3          	bne	s2,a2,ffffffffc0200d08 <ramdisk_init+0x3a>
ffffffffc0200d74:	6442                	ld	s0,16(sp)
ffffffffc0200d76:	60e2                	ld	ra,24(sp)
ffffffffc0200d78:	64a2                	ld	s1,8(sp)
ffffffffc0200d7a:	6902                	ld	s2,0(sp)
ffffffffc0200d7c:	0000b517          	auipc	a0,0xb
ffffffffc0200d80:	c2c50513          	addi	a0,a0,-980 # ffffffffc020b9a8 <commands+0x2c0>
ffffffffc0200d84:	6105                	addi	sp,sp,32
ffffffffc0200d86:	c20ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200d8a:	0000b617          	auipc	a2,0xb
ffffffffc0200d8e:	c5e60613          	addi	a2,a2,-930 # ffffffffc020b9e8 <commands+0x300>
ffffffffc0200d92:	03200593          	li	a1,50
ffffffffc0200d96:	0000b517          	auipc	a0,0xb
ffffffffc0200d9a:	c6a50513          	addi	a0,a0,-918 # ffffffffc020ba00 <commands+0x318>
ffffffffc0200d9e:	f00ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200da2 <idt_init>:
ffffffffc0200da2:	14005073          	csrwi	sscratch,0
ffffffffc0200da6:	00000797          	auipc	a5,0x0
ffffffffc0200daa:	43a78793          	addi	a5,a5,1082 # ffffffffc02011e0 <__alltraps>
ffffffffc0200dae:	10579073          	csrw	stvec,a5
ffffffffc0200db2:	000407b7          	lui	a5,0x40
ffffffffc0200db6:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200dba:	8082                	ret

ffffffffc0200dbc <print_regs>:
ffffffffc0200dbc:	610c                	ld	a1,0(a0)
ffffffffc0200dbe:	1141                	addi	sp,sp,-16
ffffffffc0200dc0:	e022                	sd	s0,0(sp)
ffffffffc0200dc2:	842a                	mv	s0,a0
ffffffffc0200dc4:	0000b517          	auipc	a0,0xb
ffffffffc0200dc8:	c6450513          	addi	a0,a0,-924 # ffffffffc020ba28 <commands+0x340>
ffffffffc0200dcc:	e406                	sd	ra,8(sp)
ffffffffc0200dce:	bd8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dd2:	640c                	ld	a1,8(s0)
ffffffffc0200dd4:	0000b517          	auipc	a0,0xb
ffffffffc0200dd8:	c6c50513          	addi	a0,a0,-916 # ffffffffc020ba40 <commands+0x358>
ffffffffc0200ddc:	bcaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200de0:	680c                	ld	a1,16(s0)
ffffffffc0200de2:	0000b517          	auipc	a0,0xb
ffffffffc0200de6:	c7650513          	addi	a0,a0,-906 # ffffffffc020ba58 <commands+0x370>
ffffffffc0200dea:	bbcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dee:	6c0c                	ld	a1,24(s0)
ffffffffc0200df0:	0000b517          	auipc	a0,0xb
ffffffffc0200df4:	c8050513          	addi	a0,a0,-896 # ffffffffc020ba70 <commands+0x388>
ffffffffc0200df8:	baeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dfc:	700c                	ld	a1,32(s0)
ffffffffc0200dfe:	0000b517          	auipc	a0,0xb
ffffffffc0200e02:	c8a50513          	addi	a0,a0,-886 # ffffffffc020ba88 <commands+0x3a0>
ffffffffc0200e06:	ba0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e0a:	740c                	ld	a1,40(s0)
ffffffffc0200e0c:	0000b517          	auipc	a0,0xb
ffffffffc0200e10:	c9450513          	addi	a0,a0,-876 # ffffffffc020baa0 <commands+0x3b8>
ffffffffc0200e14:	b92ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e18:	780c                	ld	a1,48(s0)
ffffffffc0200e1a:	0000b517          	auipc	a0,0xb
ffffffffc0200e1e:	c9e50513          	addi	a0,a0,-866 # ffffffffc020bab8 <commands+0x3d0>
ffffffffc0200e22:	b84ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e26:	7c0c                	ld	a1,56(s0)
ffffffffc0200e28:	0000b517          	auipc	a0,0xb
ffffffffc0200e2c:	ca850513          	addi	a0,a0,-856 # ffffffffc020bad0 <commands+0x3e8>
ffffffffc0200e30:	b76ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e34:	602c                	ld	a1,64(s0)
ffffffffc0200e36:	0000b517          	auipc	a0,0xb
ffffffffc0200e3a:	cb250513          	addi	a0,a0,-846 # ffffffffc020bae8 <commands+0x400>
ffffffffc0200e3e:	b68ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e42:	642c                	ld	a1,72(s0)
ffffffffc0200e44:	0000b517          	auipc	a0,0xb
ffffffffc0200e48:	cbc50513          	addi	a0,a0,-836 # ffffffffc020bb00 <commands+0x418>
ffffffffc0200e4c:	b5aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e50:	682c                	ld	a1,80(s0)
ffffffffc0200e52:	0000b517          	auipc	a0,0xb
ffffffffc0200e56:	cc650513          	addi	a0,a0,-826 # ffffffffc020bb18 <commands+0x430>
ffffffffc0200e5a:	b4cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e5e:	6c2c                	ld	a1,88(s0)
ffffffffc0200e60:	0000b517          	auipc	a0,0xb
ffffffffc0200e64:	cd050513          	addi	a0,a0,-816 # ffffffffc020bb30 <commands+0x448>
ffffffffc0200e68:	b3eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e6c:	702c                	ld	a1,96(s0)
ffffffffc0200e6e:	0000b517          	auipc	a0,0xb
ffffffffc0200e72:	cda50513          	addi	a0,a0,-806 # ffffffffc020bb48 <commands+0x460>
ffffffffc0200e76:	b30ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e7a:	742c                	ld	a1,104(s0)
ffffffffc0200e7c:	0000b517          	auipc	a0,0xb
ffffffffc0200e80:	ce450513          	addi	a0,a0,-796 # ffffffffc020bb60 <commands+0x478>
ffffffffc0200e84:	b22ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e88:	782c                	ld	a1,112(s0)
ffffffffc0200e8a:	0000b517          	auipc	a0,0xb
ffffffffc0200e8e:	cee50513          	addi	a0,a0,-786 # ffffffffc020bb78 <commands+0x490>
ffffffffc0200e92:	b14ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e96:	7c2c                	ld	a1,120(s0)
ffffffffc0200e98:	0000b517          	auipc	a0,0xb
ffffffffc0200e9c:	cf850513          	addi	a0,a0,-776 # ffffffffc020bb90 <commands+0x4a8>
ffffffffc0200ea0:	b06ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ea4:	604c                	ld	a1,128(s0)
ffffffffc0200ea6:	0000b517          	auipc	a0,0xb
ffffffffc0200eaa:	d0250513          	addi	a0,a0,-766 # ffffffffc020bba8 <commands+0x4c0>
ffffffffc0200eae:	af8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eb2:	644c                	ld	a1,136(s0)
ffffffffc0200eb4:	0000b517          	auipc	a0,0xb
ffffffffc0200eb8:	d0c50513          	addi	a0,a0,-756 # ffffffffc020bbc0 <commands+0x4d8>
ffffffffc0200ebc:	aeaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ec0:	684c                	ld	a1,144(s0)
ffffffffc0200ec2:	0000b517          	auipc	a0,0xb
ffffffffc0200ec6:	d1650513          	addi	a0,a0,-746 # ffffffffc020bbd8 <commands+0x4f0>
ffffffffc0200eca:	adcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ece:	6c4c                	ld	a1,152(s0)
ffffffffc0200ed0:	0000b517          	auipc	a0,0xb
ffffffffc0200ed4:	d2050513          	addi	a0,a0,-736 # ffffffffc020bbf0 <commands+0x508>
ffffffffc0200ed8:	aceff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200edc:	704c                	ld	a1,160(s0)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	d2a50513          	addi	a0,a0,-726 # ffffffffc020bc08 <commands+0x520>
ffffffffc0200ee6:	ac0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eea:	744c                	ld	a1,168(s0)
ffffffffc0200eec:	0000b517          	auipc	a0,0xb
ffffffffc0200ef0:	d3450513          	addi	a0,a0,-716 # ffffffffc020bc20 <commands+0x538>
ffffffffc0200ef4:	ab2ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ef8:	784c                	ld	a1,176(s0)
ffffffffc0200efa:	0000b517          	auipc	a0,0xb
ffffffffc0200efe:	d3e50513          	addi	a0,a0,-706 # ffffffffc020bc38 <commands+0x550>
ffffffffc0200f02:	aa4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f06:	7c4c                	ld	a1,184(s0)
ffffffffc0200f08:	0000b517          	auipc	a0,0xb
ffffffffc0200f0c:	d4850513          	addi	a0,a0,-696 # ffffffffc020bc50 <commands+0x568>
ffffffffc0200f10:	a96ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f14:	606c                	ld	a1,192(s0)
ffffffffc0200f16:	0000b517          	auipc	a0,0xb
ffffffffc0200f1a:	d5250513          	addi	a0,a0,-686 # ffffffffc020bc68 <commands+0x580>
ffffffffc0200f1e:	a88ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f22:	646c                	ld	a1,200(s0)
ffffffffc0200f24:	0000b517          	auipc	a0,0xb
ffffffffc0200f28:	d5c50513          	addi	a0,a0,-676 # ffffffffc020bc80 <commands+0x598>
ffffffffc0200f2c:	a7aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f30:	686c                	ld	a1,208(s0)
ffffffffc0200f32:	0000b517          	auipc	a0,0xb
ffffffffc0200f36:	d6650513          	addi	a0,a0,-666 # ffffffffc020bc98 <commands+0x5b0>
ffffffffc0200f3a:	a6cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f3e:	6c6c                	ld	a1,216(s0)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	d7050513          	addi	a0,a0,-656 # ffffffffc020bcb0 <commands+0x5c8>
ffffffffc0200f48:	a5eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f4c:	706c                	ld	a1,224(s0)
ffffffffc0200f4e:	0000b517          	auipc	a0,0xb
ffffffffc0200f52:	d7a50513          	addi	a0,a0,-646 # ffffffffc020bcc8 <commands+0x5e0>
ffffffffc0200f56:	a50ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f5a:	746c                	ld	a1,232(s0)
ffffffffc0200f5c:	0000b517          	auipc	a0,0xb
ffffffffc0200f60:	d8450513          	addi	a0,a0,-636 # ffffffffc020bce0 <commands+0x5f8>
ffffffffc0200f64:	a42ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f68:	786c                	ld	a1,240(s0)
ffffffffc0200f6a:	0000b517          	auipc	a0,0xb
ffffffffc0200f6e:	d8e50513          	addi	a0,a0,-626 # ffffffffc020bcf8 <commands+0x610>
ffffffffc0200f72:	a34ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f76:	7c6c                	ld	a1,248(s0)
ffffffffc0200f78:	6402                	ld	s0,0(sp)
ffffffffc0200f7a:	60a2                	ld	ra,8(sp)
ffffffffc0200f7c:	0000b517          	auipc	a0,0xb
ffffffffc0200f80:	d9450513          	addi	a0,a0,-620 # ffffffffc020bd10 <commands+0x628>
ffffffffc0200f84:	0141                	addi	sp,sp,16
ffffffffc0200f86:	a20ff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f8a <print_trapframe>:
ffffffffc0200f8a:	1141                	addi	sp,sp,-16
ffffffffc0200f8c:	e022                	sd	s0,0(sp)
ffffffffc0200f8e:	85aa                	mv	a1,a0
ffffffffc0200f90:	842a                	mv	s0,a0
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	d9650513          	addi	a0,a0,-618 # ffffffffc020bd28 <commands+0x640>
ffffffffc0200f9a:	e406                	sd	ra,8(sp)
ffffffffc0200f9c:	a0aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fa0:	8522                	mv	a0,s0
ffffffffc0200fa2:	e1bff0ef          	jal	ra,ffffffffc0200dbc <print_regs>
ffffffffc0200fa6:	10043583          	ld	a1,256(s0)
ffffffffc0200faa:	0000b517          	auipc	a0,0xb
ffffffffc0200fae:	d9650513          	addi	a0,a0,-618 # ffffffffc020bd40 <commands+0x658>
ffffffffc0200fb2:	9f4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fb6:	10843583          	ld	a1,264(s0)
ffffffffc0200fba:	0000b517          	auipc	a0,0xb
ffffffffc0200fbe:	d9e50513          	addi	a0,a0,-610 # ffffffffc020bd58 <commands+0x670>
ffffffffc0200fc2:	9e4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fc6:	11043583          	ld	a1,272(s0)
ffffffffc0200fca:	0000b517          	auipc	a0,0xb
ffffffffc0200fce:	da650513          	addi	a0,a0,-602 # ffffffffc020bd70 <commands+0x688>
ffffffffc0200fd2:	9d4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fd6:	11843583          	ld	a1,280(s0)
ffffffffc0200fda:	6402                	ld	s0,0(sp)
ffffffffc0200fdc:	60a2                	ld	ra,8(sp)
ffffffffc0200fde:	0000b517          	auipc	a0,0xb
ffffffffc0200fe2:	da250513          	addi	a0,a0,-606 # ffffffffc020bd80 <commands+0x698>
ffffffffc0200fe6:	0141                	addi	sp,sp,16
ffffffffc0200fe8:	9beff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200fec <interrupt_handler>:
ffffffffc0200fec:	11853783          	ld	a5,280(a0)
ffffffffc0200ff0:	472d                	li	a4,11
ffffffffc0200ff2:	0786                	slli	a5,a5,0x1
ffffffffc0200ff4:	8385                	srli	a5,a5,0x1
ffffffffc0200ff6:	06f76c63          	bltu	a4,a5,ffffffffc020106e <interrupt_handler+0x82>
ffffffffc0200ffa:	0000b717          	auipc	a4,0xb
ffffffffc0200ffe:	e3e70713          	addi	a4,a4,-450 # ffffffffc020be38 <commands+0x750>
ffffffffc0201002:	078a                	slli	a5,a5,0x2
ffffffffc0201004:	97ba                	add	a5,a5,a4
ffffffffc0201006:	439c                	lw	a5,0(a5)
ffffffffc0201008:	97ba                	add	a5,a5,a4
ffffffffc020100a:	8782                	jr	a5
ffffffffc020100c:	0000b517          	auipc	a0,0xb
ffffffffc0201010:	dec50513          	addi	a0,a0,-532 # ffffffffc020bdf8 <commands+0x710>
ffffffffc0201014:	992ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201018:	0000b517          	auipc	a0,0xb
ffffffffc020101c:	dc050513          	addi	a0,a0,-576 # ffffffffc020bdd8 <commands+0x6f0>
ffffffffc0201020:	986ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201024:	0000b517          	auipc	a0,0xb
ffffffffc0201028:	d7450513          	addi	a0,a0,-652 # ffffffffc020bd98 <commands+0x6b0>
ffffffffc020102c:	97aff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	d8850513          	addi	a0,a0,-632 # ffffffffc020bdb8 <commands+0x6d0>
ffffffffc0201038:	96eff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103c:	1141                	addi	sp,sp,-16
ffffffffc020103e:	e406                	sd	ra,8(sp)
ffffffffc0201040:	d3aff0ef          	jal	ra,ffffffffc020057a <clock_set_next_event>
ffffffffc0201044:	00096717          	auipc	a4,0x96
ffffffffc0201048:	82c70713          	addi	a4,a4,-2004 # ffffffffc0296870 <ticks>
ffffffffc020104c:	631c                	ld	a5,0(a4)
ffffffffc020104e:	0785                	addi	a5,a5,1
ffffffffc0201050:	e31c                	sd	a5,0(a4)
ffffffffc0201052:	462060ef          	jal	ra,ffffffffc02074b4 <run_timer_list>
ffffffffc0201056:	d9eff0ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020105a:	60a2                	ld	ra,8(sp)
ffffffffc020105c:	0141                	addi	sp,sp,16
ffffffffc020105e:	3270706f          	j	ffffffffc0208b84 <dev_stdin_write>
ffffffffc0201062:	0000b517          	auipc	a0,0xb
ffffffffc0201066:	db650513          	addi	a0,a0,-586 # ffffffffc020be18 <commands+0x730>
ffffffffc020106a:	93cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020106e:	bf31                	j	ffffffffc0200f8a <print_trapframe>

ffffffffc0201070 <exception_handler>:
ffffffffc0201070:	11853783          	ld	a5,280(a0)
ffffffffc0201074:	1141                	addi	sp,sp,-16
ffffffffc0201076:	e022                	sd	s0,0(sp)
ffffffffc0201078:	e406                	sd	ra,8(sp)
ffffffffc020107a:	473d                	li	a4,15
ffffffffc020107c:	842a                	mv	s0,a0
ffffffffc020107e:	0af76b63          	bltu	a4,a5,ffffffffc0201134 <exception_handler+0xc4>
ffffffffc0201082:	0000b717          	auipc	a4,0xb
ffffffffc0201086:	f7670713          	addi	a4,a4,-138 # ffffffffc020bff8 <commands+0x910>
ffffffffc020108a:	078a                	slli	a5,a5,0x2
ffffffffc020108c:	97ba                	add	a5,a5,a4
ffffffffc020108e:	439c                	lw	a5,0(a5)
ffffffffc0201090:	97ba                	add	a5,a5,a4
ffffffffc0201092:	8782                	jr	a5
ffffffffc0201094:	0000b517          	auipc	a0,0xb
ffffffffc0201098:	ebc50513          	addi	a0,a0,-324 # ffffffffc020bf50 <commands+0x868>
ffffffffc020109c:	90aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010a0:	10843783          	ld	a5,264(s0)
ffffffffc02010a4:	60a2                	ld	ra,8(sp)
ffffffffc02010a6:	0791                	addi	a5,a5,4
ffffffffc02010a8:	10f43423          	sd	a5,264(s0)
ffffffffc02010ac:	6402                	ld	s0,0(sp)
ffffffffc02010ae:	0141                	addi	sp,sp,16
ffffffffc02010b0:	61a0606f          	j	ffffffffc02076ca <syscall>
ffffffffc02010b4:	0000b517          	auipc	a0,0xb
ffffffffc02010b8:	ebc50513          	addi	a0,a0,-324 # ffffffffc020bf70 <commands+0x888>
ffffffffc02010bc:	6402                	ld	s0,0(sp)
ffffffffc02010be:	60a2                	ld	ra,8(sp)
ffffffffc02010c0:	0141                	addi	sp,sp,16
ffffffffc02010c2:	8e4ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010c6:	0000b517          	auipc	a0,0xb
ffffffffc02010ca:	eca50513          	addi	a0,a0,-310 # ffffffffc020bf90 <commands+0x8a8>
ffffffffc02010ce:	b7fd                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010d0:	0000b517          	auipc	a0,0xb
ffffffffc02010d4:	ee050513          	addi	a0,a0,-288 # ffffffffc020bfb0 <commands+0x8c8>
ffffffffc02010d8:	b7d5                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010da:	0000b517          	auipc	a0,0xb
ffffffffc02010de:	eee50513          	addi	a0,a0,-274 # ffffffffc020bfc8 <commands+0x8e0>
ffffffffc02010e2:	bfe9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010e4:	0000b517          	auipc	a0,0xb
ffffffffc02010e8:	efc50513          	addi	a0,a0,-260 # ffffffffc020bfe0 <commands+0x8f8>
ffffffffc02010ec:	bfc1                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010ee:	0000b517          	auipc	a0,0xb
ffffffffc02010f2:	d7a50513          	addi	a0,a0,-646 # ffffffffc020be68 <commands+0x780>
ffffffffc02010f6:	b7d9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010f8:	0000b517          	auipc	a0,0xb
ffffffffc02010fc:	d9050513          	addi	a0,a0,-624 # ffffffffc020be88 <commands+0x7a0>
ffffffffc0201100:	bf75                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201102:	0000b517          	auipc	a0,0xb
ffffffffc0201106:	da650513          	addi	a0,a0,-602 # ffffffffc020bea8 <commands+0x7c0>
ffffffffc020110a:	bf4d                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020110c:	0000b517          	auipc	a0,0xb
ffffffffc0201110:	db450513          	addi	a0,a0,-588 # ffffffffc020bec0 <commands+0x7d8>
ffffffffc0201114:	b765                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201116:	0000b517          	auipc	a0,0xb
ffffffffc020111a:	dba50513          	addi	a0,a0,-582 # ffffffffc020bed0 <commands+0x7e8>
ffffffffc020111e:	bf79                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201120:	0000b517          	auipc	a0,0xb
ffffffffc0201124:	dd050513          	addi	a0,a0,-560 # ffffffffc020bef0 <commands+0x808>
ffffffffc0201128:	bf51                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020112a:	0000b517          	auipc	a0,0xb
ffffffffc020112e:	e0e50513          	addi	a0,a0,-498 # ffffffffc020bf38 <commands+0x850>
ffffffffc0201132:	b769                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201134:	8522                	mv	a0,s0
ffffffffc0201136:	6402                	ld	s0,0(sp)
ffffffffc0201138:	60a2                	ld	ra,8(sp)
ffffffffc020113a:	0141                	addi	sp,sp,16
ffffffffc020113c:	b5b9                	j	ffffffffc0200f8a <print_trapframe>
ffffffffc020113e:	0000b617          	auipc	a2,0xb
ffffffffc0201142:	dca60613          	addi	a2,a2,-566 # ffffffffc020bf08 <commands+0x820>
ffffffffc0201146:	0b100593          	li	a1,177
ffffffffc020114a:	0000b517          	auipc	a0,0xb
ffffffffc020114e:	dd650513          	addi	a0,a0,-554 # ffffffffc020bf20 <commands+0x838>
ffffffffc0201152:	b4cff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201156 <trap>:
ffffffffc0201156:	1101                	addi	sp,sp,-32
ffffffffc0201158:	e822                	sd	s0,16(sp)
ffffffffc020115a:	00095417          	auipc	s0,0x95
ffffffffc020115e:	76640413          	addi	s0,s0,1894 # ffffffffc02968c0 <current>
ffffffffc0201162:	6018                	ld	a4,0(s0)
ffffffffc0201164:	ec06                	sd	ra,24(sp)
ffffffffc0201166:	e426                	sd	s1,8(sp)
ffffffffc0201168:	e04a                	sd	s2,0(sp)
ffffffffc020116a:	11853683          	ld	a3,280(a0)
ffffffffc020116e:	cf1d                	beqz	a4,ffffffffc02011ac <trap+0x56>
ffffffffc0201170:	10053483          	ld	s1,256(a0)
ffffffffc0201174:	0a073903          	ld	s2,160(a4)
ffffffffc0201178:	f348                	sd	a0,160(a4)
ffffffffc020117a:	1004f493          	andi	s1,s1,256
ffffffffc020117e:	0206c463          	bltz	a3,ffffffffc02011a6 <trap+0x50>
ffffffffc0201182:	eefff0ef          	jal	ra,ffffffffc0201070 <exception_handler>
ffffffffc0201186:	601c                	ld	a5,0(s0)
ffffffffc0201188:	0b27b023          	sd	s2,160(a5) # 400a0 <_binary_bin_swap_img_size+0x383a0>
ffffffffc020118c:	e499                	bnez	s1,ffffffffc020119a <trap+0x44>
ffffffffc020118e:	0b07a703          	lw	a4,176(a5)
ffffffffc0201192:	8b05                	andi	a4,a4,1
ffffffffc0201194:	e329                	bnez	a4,ffffffffc02011d6 <trap+0x80>
ffffffffc0201196:	6f9c                	ld	a5,24(a5)
ffffffffc0201198:	eb85                	bnez	a5,ffffffffc02011c8 <trap+0x72>
ffffffffc020119a:	60e2                	ld	ra,24(sp)
ffffffffc020119c:	6442                	ld	s0,16(sp)
ffffffffc020119e:	64a2                	ld	s1,8(sp)
ffffffffc02011a0:	6902                	ld	s2,0(sp)
ffffffffc02011a2:	6105                	addi	sp,sp,32
ffffffffc02011a4:	8082                	ret
ffffffffc02011a6:	e47ff0ef          	jal	ra,ffffffffc0200fec <interrupt_handler>
ffffffffc02011aa:	bff1                	j	ffffffffc0201186 <trap+0x30>
ffffffffc02011ac:	0006c863          	bltz	a3,ffffffffc02011bc <trap+0x66>
ffffffffc02011b0:	6442                	ld	s0,16(sp)
ffffffffc02011b2:	60e2                	ld	ra,24(sp)
ffffffffc02011b4:	64a2                	ld	s1,8(sp)
ffffffffc02011b6:	6902                	ld	s2,0(sp)
ffffffffc02011b8:	6105                	addi	sp,sp,32
ffffffffc02011ba:	bd5d                	j	ffffffffc0201070 <exception_handler>
ffffffffc02011bc:	6442                	ld	s0,16(sp)
ffffffffc02011be:	60e2                	ld	ra,24(sp)
ffffffffc02011c0:	64a2                	ld	s1,8(sp)
ffffffffc02011c2:	6902                	ld	s2,0(sp)
ffffffffc02011c4:	6105                	addi	sp,sp,32
ffffffffc02011c6:	b51d                	j	ffffffffc0200fec <interrupt_handler>
ffffffffc02011c8:	6442                	ld	s0,16(sp)
ffffffffc02011ca:	60e2                	ld	ra,24(sp)
ffffffffc02011cc:	64a2                	ld	s1,8(sp)
ffffffffc02011ce:	6902                	ld	s2,0(sp)
ffffffffc02011d0:	6105                	addi	sp,sp,32
ffffffffc02011d2:	0d60606f          	j	ffffffffc02072a8 <schedule>
ffffffffc02011d6:	555d                	li	a0,-9
ffffffffc02011d8:	5dd040ef          	jal	ra,ffffffffc0205fb4 <do_exit>
ffffffffc02011dc:	601c                	ld	a5,0(s0)
ffffffffc02011de:	bf65                	j	ffffffffc0201196 <trap+0x40>

ffffffffc02011e0 <__alltraps>:
ffffffffc02011e0:	14011173          	csrrw	sp,sscratch,sp
ffffffffc02011e4:	00011463          	bnez	sp,ffffffffc02011ec <__alltraps+0xc>
ffffffffc02011e8:	14002173          	csrr	sp,sscratch
ffffffffc02011ec:	712d                	addi	sp,sp,-288
ffffffffc02011ee:	e002                	sd	zero,0(sp)
ffffffffc02011f0:	e406                	sd	ra,8(sp)
ffffffffc02011f2:	ec0e                	sd	gp,24(sp)
ffffffffc02011f4:	f012                	sd	tp,32(sp)
ffffffffc02011f6:	f416                	sd	t0,40(sp)
ffffffffc02011f8:	f81a                	sd	t1,48(sp)
ffffffffc02011fa:	fc1e                	sd	t2,56(sp)
ffffffffc02011fc:	e0a2                	sd	s0,64(sp)
ffffffffc02011fe:	e4a6                	sd	s1,72(sp)
ffffffffc0201200:	e8aa                	sd	a0,80(sp)
ffffffffc0201202:	ecae                	sd	a1,88(sp)
ffffffffc0201204:	f0b2                	sd	a2,96(sp)
ffffffffc0201206:	f4b6                	sd	a3,104(sp)
ffffffffc0201208:	f8ba                	sd	a4,112(sp)
ffffffffc020120a:	fcbe                	sd	a5,120(sp)
ffffffffc020120c:	e142                	sd	a6,128(sp)
ffffffffc020120e:	e546                	sd	a7,136(sp)
ffffffffc0201210:	e94a                	sd	s2,144(sp)
ffffffffc0201212:	ed4e                	sd	s3,152(sp)
ffffffffc0201214:	f152                	sd	s4,160(sp)
ffffffffc0201216:	f556                	sd	s5,168(sp)
ffffffffc0201218:	f95a                	sd	s6,176(sp)
ffffffffc020121a:	fd5e                	sd	s7,184(sp)
ffffffffc020121c:	e1e2                	sd	s8,192(sp)
ffffffffc020121e:	e5e6                	sd	s9,200(sp)
ffffffffc0201220:	e9ea                	sd	s10,208(sp)
ffffffffc0201222:	edee                	sd	s11,216(sp)
ffffffffc0201224:	f1f2                	sd	t3,224(sp)
ffffffffc0201226:	f5f6                	sd	t4,232(sp)
ffffffffc0201228:	f9fa                	sd	t5,240(sp)
ffffffffc020122a:	fdfe                	sd	t6,248(sp)
ffffffffc020122c:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0201230:	100024f3          	csrr	s1,sstatus
ffffffffc0201234:	14102973          	csrr	s2,sepc
ffffffffc0201238:	143029f3          	csrr	s3,stval
ffffffffc020123c:	14202a73          	csrr	s4,scause
ffffffffc0201240:	e822                	sd	s0,16(sp)
ffffffffc0201242:	e226                	sd	s1,256(sp)
ffffffffc0201244:	e64a                	sd	s2,264(sp)
ffffffffc0201246:	ea4e                	sd	s3,272(sp)
ffffffffc0201248:	ee52                	sd	s4,280(sp)
ffffffffc020124a:	850a                	mv	a0,sp
ffffffffc020124c:	f0bff0ef          	jal	ra,ffffffffc0201156 <trap>

ffffffffc0201250 <__trapret>:
ffffffffc0201250:	6492                	ld	s1,256(sp)
ffffffffc0201252:	6932                	ld	s2,264(sp)
ffffffffc0201254:	1004f413          	andi	s0,s1,256
ffffffffc0201258:	e401                	bnez	s0,ffffffffc0201260 <__trapret+0x10>
ffffffffc020125a:	1200                	addi	s0,sp,288
ffffffffc020125c:	14041073          	csrw	sscratch,s0
ffffffffc0201260:	10049073          	csrw	sstatus,s1
ffffffffc0201264:	14191073          	csrw	sepc,s2
ffffffffc0201268:	60a2                	ld	ra,8(sp)
ffffffffc020126a:	61e2                	ld	gp,24(sp)
ffffffffc020126c:	7202                	ld	tp,32(sp)
ffffffffc020126e:	72a2                	ld	t0,40(sp)
ffffffffc0201270:	7342                	ld	t1,48(sp)
ffffffffc0201272:	73e2                	ld	t2,56(sp)
ffffffffc0201274:	6406                	ld	s0,64(sp)
ffffffffc0201276:	64a6                	ld	s1,72(sp)
ffffffffc0201278:	6546                	ld	a0,80(sp)
ffffffffc020127a:	65e6                	ld	a1,88(sp)
ffffffffc020127c:	7606                	ld	a2,96(sp)
ffffffffc020127e:	76a6                	ld	a3,104(sp)
ffffffffc0201280:	7746                	ld	a4,112(sp)
ffffffffc0201282:	77e6                	ld	a5,120(sp)
ffffffffc0201284:	680a                	ld	a6,128(sp)
ffffffffc0201286:	68aa                	ld	a7,136(sp)
ffffffffc0201288:	694a                	ld	s2,144(sp)
ffffffffc020128a:	69ea                	ld	s3,152(sp)
ffffffffc020128c:	7a0a                	ld	s4,160(sp)
ffffffffc020128e:	7aaa                	ld	s5,168(sp)
ffffffffc0201290:	7b4a                	ld	s6,176(sp)
ffffffffc0201292:	7bea                	ld	s7,184(sp)
ffffffffc0201294:	6c0e                	ld	s8,192(sp)
ffffffffc0201296:	6cae                	ld	s9,200(sp)
ffffffffc0201298:	6d4e                	ld	s10,208(sp)
ffffffffc020129a:	6dee                	ld	s11,216(sp)
ffffffffc020129c:	7e0e                	ld	t3,224(sp)
ffffffffc020129e:	7eae                	ld	t4,232(sp)
ffffffffc02012a0:	7f4e                	ld	t5,240(sp)
ffffffffc02012a2:	7fee                	ld	t6,248(sp)
ffffffffc02012a4:	6142                	ld	sp,16(sp)
ffffffffc02012a6:	10200073          	sret

ffffffffc02012aa <forkrets>:
ffffffffc02012aa:	812a                	mv	sp,a0
ffffffffc02012ac:	b755                	j	ffffffffc0201250 <__trapret>

ffffffffc02012ae <default_init>:
ffffffffc02012ae:	00090797          	auipc	a5,0x90
ffffffffc02012b2:	4fa78793          	addi	a5,a5,1274 # ffffffffc02917a8 <free_area>
ffffffffc02012b6:	e79c                	sd	a5,8(a5)
ffffffffc02012b8:	e39c                	sd	a5,0(a5)
ffffffffc02012ba:	0007a823          	sw	zero,16(a5)
ffffffffc02012be:	8082                	ret

ffffffffc02012c0 <default_nr_free_pages>:
ffffffffc02012c0:	00090517          	auipc	a0,0x90
ffffffffc02012c4:	4f856503          	lwu	a0,1272(a0) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02012c8:	8082                	ret

ffffffffc02012ca <default_check>:
ffffffffc02012ca:	715d                	addi	sp,sp,-80
ffffffffc02012cc:	e0a2                	sd	s0,64(sp)
ffffffffc02012ce:	00090417          	auipc	s0,0x90
ffffffffc02012d2:	4da40413          	addi	s0,s0,1242 # ffffffffc02917a8 <free_area>
ffffffffc02012d6:	641c                	ld	a5,8(s0)
ffffffffc02012d8:	e486                	sd	ra,72(sp)
ffffffffc02012da:	fc26                	sd	s1,56(sp)
ffffffffc02012dc:	f84a                	sd	s2,48(sp)
ffffffffc02012de:	f44e                	sd	s3,40(sp)
ffffffffc02012e0:	f052                	sd	s4,32(sp)
ffffffffc02012e2:	ec56                	sd	s5,24(sp)
ffffffffc02012e4:	e85a                	sd	s6,16(sp)
ffffffffc02012e6:	e45e                	sd	s7,8(sp)
ffffffffc02012e8:	e062                	sd	s8,0(sp)
ffffffffc02012ea:	2a878d63          	beq	a5,s0,ffffffffc02015a4 <default_check+0x2da>
ffffffffc02012ee:	4481                	li	s1,0
ffffffffc02012f0:	4901                	li	s2,0
ffffffffc02012f2:	ff07b703          	ld	a4,-16(a5)
ffffffffc02012f6:	8b09                	andi	a4,a4,2
ffffffffc02012f8:	2a070a63          	beqz	a4,ffffffffc02015ac <default_check+0x2e2>
ffffffffc02012fc:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201300:	679c                	ld	a5,8(a5)
ffffffffc0201302:	2905                	addiw	s2,s2,1
ffffffffc0201304:	9cb9                	addw	s1,s1,a4
ffffffffc0201306:	fe8796e3          	bne	a5,s0,ffffffffc02012f2 <default_check+0x28>
ffffffffc020130a:	89a6                	mv	s3,s1
ffffffffc020130c:	6df000ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc0201310:	6f351e63          	bne	a0,s3,ffffffffc0201a0c <default_check+0x742>
ffffffffc0201314:	4505                	li	a0,1
ffffffffc0201316:	657000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020131a:	8aaa                	mv	s5,a0
ffffffffc020131c:	42050863          	beqz	a0,ffffffffc020174c <default_check+0x482>
ffffffffc0201320:	4505                	li	a0,1
ffffffffc0201322:	64b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201326:	89aa                	mv	s3,a0
ffffffffc0201328:	70050263          	beqz	a0,ffffffffc0201a2c <default_check+0x762>
ffffffffc020132c:	4505                	li	a0,1
ffffffffc020132e:	63f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201332:	8a2a                	mv	s4,a0
ffffffffc0201334:	48050c63          	beqz	a0,ffffffffc02017cc <default_check+0x502>
ffffffffc0201338:	293a8a63          	beq	s5,s3,ffffffffc02015cc <default_check+0x302>
ffffffffc020133c:	28aa8863          	beq	s5,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201340:	28a98663          	beq	s3,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201344:	000aa783          	lw	a5,0(s5)
ffffffffc0201348:	2a079263          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020134c:	0009a783          	lw	a5,0(s3)
ffffffffc0201350:	28079e63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc0201354:	411c                	lw	a5,0(a0)
ffffffffc0201356:	28079b63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020135a:	00095797          	auipc	a5,0x95
ffffffffc020135e:	54e7b783          	ld	a5,1358(a5) # ffffffffc02968a8 <pages>
ffffffffc0201362:	40fa8733          	sub	a4,s5,a5
ffffffffc0201366:	0000e617          	auipc	a2,0xe
ffffffffc020136a:	3f263603          	ld	a2,1010(a2) # ffffffffc020f758 <nbase>
ffffffffc020136e:	8719                	srai	a4,a4,0x6
ffffffffc0201370:	9732                	add	a4,a4,a2
ffffffffc0201372:	00095697          	auipc	a3,0x95
ffffffffc0201376:	52e6b683          	ld	a3,1326(a3) # ffffffffc02968a0 <npage>
ffffffffc020137a:	06b2                	slli	a3,a3,0xc
ffffffffc020137c:	0732                	slli	a4,a4,0xc
ffffffffc020137e:	28d77763          	bgeu	a4,a3,ffffffffc020160c <default_check+0x342>
ffffffffc0201382:	40f98733          	sub	a4,s3,a5
ffffffffc0201386:	8719                	srai	a4,a4,0x6
ffffffffc0201388:	9732                	add	a4,a4,a2
ffffffffc020138a:	0732                	slli	a4,a4,0xc
ffffffffc020138c:	4cd77063          	bgeu	a4,a3,ffffffffc020184c <default_check+0x582>
ffffffffc0201390:	40f507b3          	sub	a5,a0,a5
ffffffffc0201394:	8799                	srai	a5,a5,0x6
ffffffffc0201396:	97b2                	add	a5,a5,a2
ffffffffc0201398:	07b2                	slli	a5,a5,0xc
ffffffffc020139a:	30d7f963          	bgeu	a5,a3,ffffffffc02016ac <default_check+0x3e2>
ffffffffc020139e:	4505                	li	a0,1
ffffffffc02013a0:	00043c03          	ld	s8,0(s0)
ffffffffc02013a4:	00843b83          	ld	s7,8(s0)
ffffffffc02013a8:	01042b03          	lw	s6,16(s0)
ffffffffc02013ac:	e400                	sd	s0,8(s0)
ffffffffc02013ae:	e000                	sd	s0,0(s0)
ffffffffc02013b0:	00090797          	auipc	a5,0x90
ffffffffc02013b4:	4007a423          	sw	zero,1032(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02013b8:	5b5000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013bc:	2c051863          	bnez	a0,ffffffffc020168c <default_check+0x3c2>
ffffffffc02013c0:	4585                	li	a1,1
ffffffffc02013c2:	8556                	mv	a0,s5
ffffffffc02013c4:	5e7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013c8:	4585                	li	a1,1
ffffffffc02013ca:	854e                	mv	a0,s3
ffffffffc02013cc:	5df000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d0:	4585                	li	a1,1
ffffffffc02013d2:	8552                	mv	a0,s4
ffffffffc02013d4:	5d7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d8:	4818                	lw	a4,16(s0)
ffffffffc02013da:	478d                	li	a5,3
ffffffffc02013dc:	28f71863          	bne	a4,a5,ffffffffc020166c <default_check+0x3a2>
ffffffffc02013e0:	4505                	li	a0,1
ffffffffc02013e2:	58b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013e6:	89aa                	mv	s3,a0
ffffffffc02013e8:	26050263          	beqz	a0,ffffffffc020164c <default_check+0x382>
ffffffffc02013ec:	4505                	li	a0,1
ffffffffc02013ee:	57f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013f2:	8aaa                	mv	s5,a0
ffffffffc02013f4:	3a050c63          	beqz	a0,ffffffffc02017ac <default_check+0x4e2>
ffffffffc02013f8:	4505                	li	a0,1
ffffffffc02013fa:	573000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013fe:	8a2a                	mv	s4,a0
ffffffffc0201400:	38050663          	beqz	a0,ffffffffc020178c <default_check+0x4c2>
ffffffffc0201404:	4505                	li	a0,1
ffffffffc0201406:	567000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020140a:	36051163          	bnez	a0,ffffffffc020176c <default_check+0x4a2>
ffffffffc020140e:	4585                	li	a1,1
ffffffffc0201410:	854e                	mv	a0,s3
ffffffffc0201412:	599000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201416:	641c                	ld	a5,8(s0)
ffffffffc0201418:	20878a63          	beq	a5,s0,ffffffffc020162c <default_check+0x362>
ffffffffc020141c:	4505                	li	a0,1
ffffffffc020141e:	54f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201422:	30a99563          	bne	s3,a0,ffffffffc020172c <default_check+0x462>
ffffffffc0201426:	4505                	li	a0,1
ffffffffc0201428:	545000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020142c:	2e051063          	bnez	a0,ffffffffc020170c <default_check+0x442>
ffffffffc0201430:	481c                	lw	a5,16(s0)
ffffffffc0201432:	2a079d63          	bnez	a5,ffffffffc02016ec <default_check+0x422>
ffffffffc0201436:	854e                	mv	a0,s3
ffffffffc0201438:	4585                	li	a1,1
ffffffffc020143a:	01843023          	sd	s8,0(s0)
ffffffffc020143e:	01743423          	sd	s7,8(s0)
ffffffffc0201442:	01642823          	sw	s6,16(s0)
ffffffffc0201446:	565000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020144a:	4585                	li	a1,1
ffffffffc020144c:	8556                	mv	a0,s5
ffffffffc020144e:	55d000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201452:	4585                	li	a1,1
ffffffffc0201454:	8552                	mv	a0,s4
ffffffffc0201456:	555000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020145a:	4515                	li	a0,5
ffffffffc020145c:	511000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201460:	89aa                	mv	s3,a0
ffffffffc0201462:	26050563          	beqz	a0,ffffffffc02016cc <default_check+0x402>
ffffffffc0201466:	651c                	ld	a5,8(a0)
ffffffffc0201468:	8385                	srli	a5,a5,0x1
ffffffffc020146a:	8b85                	andi	a5,a5,1
ffffffffc020146c:	54079063          	bnez	a5,ffffffffc02019ac <default_check+0x6e2>
ffffffffc0201470:	4505                	li	a0,1
ffffffffc0201472:	00043b03          	ld	s6,0(s0)
ffffffffc0201476:	00843a83          	ld	s5,8(s0)
ffffffffc020147a:	e000                	sd	s0,0(s0)
ffffffffc020147c:	e400                	sd	s0,8(s0)
ffffffffc020147e:	4ef000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201482:	50051563          	bnez	a0,ffffffffc020198c <default_check+0x6c2>
ffffffffc0201486:	08098a13          	addi	s4,s3,128
ffffffffc020148a:	8552                	mv	a0,s4
ffffffffc020148c:	458d                	li	a1,3
ffffffffc020148e:	01042b83          	lw	s7,16(s0)
ffffffffc0201492:	00090797          	auipc	a5,0x90
ffffffffc0201496:	3207a323          	sw	zero,806(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc020149a:	511000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020149e:	4511                	li	a0,4
ffffffffc02014a0:	4cd000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014a4:	4c051463          	bnez	a0,ffffffffc020196c <default_check+0x6a2>
ffffffffc02014a8:	0889b783          	ld	a5,136(s3)
ffffffffc02014ac:	8385                	srli	a5,a5,0x1
ffffffffc02014ae:	8b85                	andi	a5,a5,1
ffffffffc02014b0:	48078e63          	beqz	a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014b4:	0909a703          	lw	a4,144(s3)
ffffffffc02014b8:	478d                	li	a5,3
ffffffffc02014ba:	48f71963          	bne	a4,a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014be:	450d                	li	a0,3
ffffffffc02014c0:	4ad000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014c4:	8c2a                	mv	s8,a0
ffffffffc02014c6:	46050363          	beqz	a0,ffffffffc020192c <default_check+0x662>
ffffffffc02014ca:	4505                	li	a0,1
ffffffffc02014cc:	4a1000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014d0:	42051e63          	bnez	a0,ffffffffc020190c <default_check+0x642>
ffffffffc02014d4:	418a1c63          	bne	s4,s8,ffffffffc02018ec <default_check+0x622>
ffffffffc02014d8:	4585                	li	a1,1
ffffffffc02014da:	854e                	mv	a0,s3
ffffffffc02014dc:	4cf000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e0:	458d                	li	a1,3
ffffffffc02014e2:	8552                	mv	a0,s4
ffffffffc02014e4:	4c7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e8:	0089b783          	ld	a5,8(s3)
ffffffffc02014ec:	04098c13          	addi	s8,s3,64
ffffffffc02014f0:	8385                	srli	a5,a5,0x1
ffffffffc02014f2:	8b85                	andi	a5,a5,1
ffffffffc02014f4:	3c078c63          	beqz	a5,ffffffffc02018cc <default_check+0x602>
ffffffffc02014f8:	0109a703          	lw	a4,16(s3)
ffffffffc02014fc:	4785                	li	a5,1
ffffffffc02014fe:	3cf71763          	bne	a4,a5,ffffffffc02018cc <default_check+0x602>
ffffffffc0201502:	008a3783          	ld	a5,8(s4)
ffffffffc0201506:	8385                	srli	a5,a5,0x1
ffffffffc0201508:	8b85                	andi	a5,a5,1
ffffffffc020150a:	3a078163          	beqz	a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc020150e:	010a2703          	lw	a4,16(s4)
ffffffffc0201512:	478d                	li	a5,3
ffffffffc0201514:	38f71c63          	bne	a4,a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc0201518:	4505                	li	a0,1
ffffffffc020151a:	453000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020151e:	36a99763          	bne	s3,a0,ffffffffc020188c <default_check+0x5c2>
ffffffffc0201522:	4585                	li	a1,1
ffffffffc0201524:	487000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201528:	4509                	li	a0,2
ffffffffc020152a:	443000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020152e:	32aa1f63          	bne	s4,a0,ffffffffc020186c <default_check+0x5a2>
ffffffffc0201532:	4589                	li	a1,2
ffffffffc0201534:	477000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201538:	4585                	li	a1,1
ffffffffc020153a:	8562                	mv	a0,s8
ffffffffc020153c:	46f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201540:	4515                	li	a0,5
ffffffffc0201542:	42b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201546:	89aa                	mv	s3,a0
ffffffffc0201548:	48050263          	beqz	a0,ffffffffc02019cc <default_check+0x702>
ffffffffc020154c:	4505                	li	a0,1
ffffffffc020154e:	41f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201552:	2c051d63          	bnez	a0,ffffffffc020182c <default_check+0x562>
ffffffffc0201556:	481c                	lw	a5,16(s0)
ffffffffc0201558:	2a079a63          	bnez	a5,ffffffffc020180c <default_check+0x542>
ffffffffc020155c:	4595                	li	a1,5
ffffffffc020155e:	854e                	mv	a0,s3
ffffffffc0201560:	01742823          	sw	s7,16(s0)
ffffffffc0201564:	01643023          	sd	s6,0(s0)
ffffffffc0201568:	01543423          	sd	s5,8(s0)
ffffffffc020156c:	43f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201570:	641c                	ld	a5,8(s0)
ffffffffc0201572:	00878963          	beq	a5,s0,ffffffffc0201584 <default_check+0x2ba>
ffffffffc0201576:	ff87a703          	lw	a4,-8(a5)
ffffffffc020157a:	679c                	ld	a5,8(a5)
ffffffffc020157c:	397d                	addiw	s2,s2,-1
ffffffffc020157e:	9c99                	subw	s1,s1,a4
ffffffffc0201580:	fe879be3          	bne	a5,s0,ffffffffc0201576 <default_check+0x2ac>
ffffffffc0201584:	26091463          	bnez	s2,ffffffffc02017ec <default_check+0x522>
ffffffffc0201588:	46049263          	bnez	s1,ffffffffc02019ec <default_check+0x722>
ffffffffc020158c:	60a6                	ld	ra,72(sp)
ffffffffc020158e:	6406                	ld	s0,64(sp)
ffffffffc0201590:	74e2                	ld	s1,56(sp)
ffffffffc0201592:	7942                	ld	s2,48(sp)
ffffffffc0201594:	79a2                	ld	s3,40(sp)
ffffffffc0201596:	7a02                	ld	s4,32(sp)
ffffffffc0201598:	6ae2                	ld	s5,24(sp)
ffffffffc020159a:	6b42                	ld	s6,16(sp)
ffffffffc020159c:	6ba2                	ld	s7,8(sp)
ffffffffc020159e:	6c02                	ld	s8,0(sp)
ffffffffc02015a0:	6161                	addi	sp,sp,80
ffffffffc02015a2:	8082                	ret
ffffffffc02015a4:	4981                	li	s3,0
ffffffffc02015a6:	4481                	li	s1,0
ffffffffc02015a8:	4901                	li	s2,0
ffffffffc02015aa:	b38d                	j	ffffffffc020130c <default_check+0x42>
ffffffffc02015ac:	0000b697          	auipc	a3,0xb
ffffffffc02015b0:	a8c68693          	addi	a3,a3,-1396 # ffffffffc020c038 <commands+0x950>
ffffffffc02015b4:	0000a617          	auipc	a2,0xa
ffffffffc02015b8:	34460613          	addi	a2,a2,836 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02015bc:	0ef00593          	li	a1,239
ffffffffc02015c0:	0000b517          	auipc	a0,0xb
ffffffffc02015c4:	a8850513          	addi	a0,a0,-1400 # ffffffffc020c048 <commands+0x960>
ffffffffc02015c8:	ed7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015cc:	0000b697          	auipc	a3,0xb
ffffffffc02015d0:	b1468693          	addi	a3,a3,-1260 # ffffffffc020c0e0 <commands+0x9f8>
ffffffffc02015d4:	0000a617          	auipc	a2,0xa
ffffffffc02015d8:	32460613          	addi	a2,a2,804 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02015dc:	0bc00593          	li	a1,188
ffffffffc02015e0:	0000b517          	auipc	a0,0xb
ffffffffc02015e4:	a6850513          	addi	a0,a0,-1432 # ffffffffc020c048 <commands+0x960>
ffffffffc02015e8:	eb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015ec:	0000b697          	auipc	a3,0xb
ffffffffc02015f0:	b1c68693          	addi	a3,a3,-1252 # ffffffffc020c108 <commands+0xa20>
ffffffffc02015f4:	0000a617          	auipc	a2,0xa
ffffffffc02015f8:	30460613          	addi	a2,a2,772 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02015fc:	0bd00593          	li	a1,189
ffffffffc0201600:	0000b517          	auipc	a0,0xb
ffffffffc0201604:	a4850513          	addi	a0,a0,-1464 # ffffffffc020c048 <commands+0x960>
ffffffffc0201608:	e97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020160c:	0000b697          	auipc	a3,0xb
ffffffffc0201610:	b3c68693          	addi	a3,a3,-1220 # ffffffffc020c148 <commands+0xa60>
ffffffffc0201614:	0000a617          	auipc	a2,0xa
ffffffffc0201618:	2e460613          	addi	a2,a2,740 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020161c:	0bf00593          	li	a1,191
ffffffffc0201620:	0000b517          	auipc	a0,0xb
ffffffffc0201624:	a2850513          	addi	a0,a0,-1496 # ffffffffc020c048 <commands+0x960>
ffffffffc0201628:	e77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020162c:	0000b697          	auipc	a3,0xb
ffffffffc0201630:	ba468693          	addi	a3,a3,-1116 # ffffffffc020c1d0 <commands+0xae8>
ffffffffc0201634:	0000a617          	auipc	a2,0xa
ffffffffc0201638:	2c460613          	addi	a2,a2,708 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020163c:	0d800593          	li	a1,216
ffffffffc0201640:	0000b517          	auipc	a0,0xb
ffffffffc0201644:	a0850513          	addi	a0,a0,-1528 # ffffffffc020c048 <commands+0x960>
ffffffffc0201648:	e57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020164c:	0000b697          	auipc	a3,0xb
ffffffffc0201650:	a3468693          	addi	a3,a3,-1484 # ffffffffc020c080 <commands+0x998>
ffffffffc0201654:	0000a617          	auipc	a2,0xa
ffffffffc0201658:	2a460613          	addi	a2,a2,676 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020165c:	0d100593          	li	a1,209
ffffffffc0201660:	0000b517          	auipc	a0,0xb
ffffffffc0201664:	9e850513          	addi	a0,a0,-1560 # ffffffffc020c048 <commands+0x960>
ffffffffc0201668:	e37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020166c:	0000b697          	auipc	a3,0xb
ffffffffc0201670:	b5468693          	addi	a3,a3,-1196 # ffffffffc020c1c0 <commands+0xad8>
ffffffffc0201674:	0000a617          	auipc	a2,0xa
ffffffffc0201678:	28460613          	addi	a2,a2,644 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020167c:	0cf00593          	li	a1,207
ffffffffc0201680:	0000b517          	auipc	a0,0xb
ffffffffc0201684:	9c850513          	addi	a0,a0,-1592 # ffffffffc020c048 <commands+0x960>
ffffffffc0201688:	e17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020168c:	0000b697          	auipc	a3,0xb
ffffffffc0201690:	b1c68693          	addi	a3,a3,-1252 # ffffffffc020c1a8 <commands+0xac0>
ffffffffc0201694:	0000a617          	auipc	a2,0xa
ffffffffc0201698:	26460613          	addi	a2,a2,612 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020169c:	0ca00593          	li	a1,202
ffffffffc02016a0:	0000b517          	auipc	a0,0xb
ffffffffc02016a4:	9a850513          	addi	a0,a0,-1624 # ffffffffc020c048 <commands+0x960>
ffffffffc02016a8:	df7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ac:	0000b697          	auipc	a3,0xb
ffffffffc02016b0:	adc68693          	addi	a3,a3,-1316 # ffffffffc020c188 <commands+0xaa0>
ffffffffc02016b4:	0000a617          	auipc	a2,0xa
ffffffffc02016b8:	24460613          	addi	a2,a2,580 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02016bc:	0c100593          	li	a1,193
ffffffffc02016c0:	0000b517          	auipc	a0,0xb
ffffffffc02016c4:	98850513          	addi	a0,a0,-1656 # ffffffffc020c048 <commands+0x960>
ffffffffc02016c8:	dd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016cc:	0000b697          	auipc	a3,0xb
ffffffffc02016d0:	b4c68693          	addi	a3,a3,-1204 # ffffffffc020c218 <commands+0xb30>
ffffffffc02016d4:	0000a617          	auipc	a2,0xa
ffffffffc02016d8:	22460613          	addi	a2,a2,548 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02016dc:	0f700593          	li	a1,247
ffffffffc02016e0:	0000b517          	auipc	a0,0xb
ffffffffc02016e4:	96850513          	addi	a0,a0,-1688 # ffffffffc020c048 <commands+0x960>
ffffffffc02016e8:	db7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ec:	0000b697          	auipc	a3,0xb
ffffffffc02016f0:	b1c68693          	addi	a3,a3,-1252 # ffffffffc020c208 <commands+0xb20>
ffffffffc02016f4:	0000a617          	auipc	a2,0xa
ffffffffc02016f8:	20460613          	addi	a2,a2,516 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02016fc:	0de00593          	li	a1,222
ffffffffc0201700:	0000b517          	auipc	a0,0xb
ffffffffc0201704:	94850513          	addi	a0,a0,-1720 # ffffffffc020c048 <commands+0x960>
ffffffffc0201708:	d97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020170c:	0000b697          	auipc	a3,0xb
ffffffffc0201710:	a9c68693          	addi	a3,a3,-1380 # ffffffffc020c1a8 <commands+0xac0>
ffffffffc0201714:	0000a617          	auipc	a2,0xa
ffffffffc0201718:	1e460613          	addi	a2,a2,484 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020171c:	0dc00593          	li	a1,220
ffffffffc0201720:	0000b517          	auipc	a0,0xb
ffffffffc0201724:	92850513          	addi	a0,a0,-1752 # ffffffffc020c048 <commands+0x960>
ffffffffc0201728:	d77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020172c:	0000b697          	auipc	a3,0xb
ffffffffc0201730:	abc68693          	addi	a3,a3,-1348 # ffffffffc020c1e8 <commands+0xb00>
ffffffffc0201734:	0000a617          	auipc	a2,0xa
ffffffffc0201738:	1c460613          	addi	a2,a2,452 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020173c:	0db00593          	li	a1,219
ffffffffc0201740:	0000b517          	auipc	a0,0xb
ffffffffc0201744:	90850513          	addi	a0,a0,-1784 # ffffffffc020c048 <commands+0x960>
ffffffffc0201748:	d57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020174c:	0000b697          	auipc	a3,0xb
ffffffffc0201750:	93468693          	addi	a3,a3,-1740 # ffffffffc020c080 <commands+0x998>
ffffffffc0201754:	0000a617          	auipc	a2,0xa
ffffffffc0201758:	1a460613          	addi	a2,a2,420 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020175c:	0b800593          	li	a1,184
ffffffffc0201760:	0000b517          	auipc	a0,0xb
ffffffffc0201764:	8e850513          	addi	a0,a0,-1816 # ffffffffc020c048 <commands+0x960>
ffffffffc0201768:	d37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020176c:	0000b697          	auipc	a3,0xb
ffffffffc0201770:	a3c68693          	addi	a3,a3,-1476 # ffffffffc020c1a8 <commands+0xac0>
ffffffffc0201774:	0000a617          	auipc	a2,0xa
ffffffffc0201778:	18460613          	addi	a2,a2,388 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020177c:	0d500593          	li	a1,213
ffffffffc0201780:	0000b517          	auipc	a0,0xb
ffffffffc0201784:	8c850513          	addi	a0,a0,-1848 # ffffffffc020c048 <commands+0x960>
ffffffffc0201788:	d17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020178c:	0000b697          	auipc	a3,0xb
ffffffffc0201790:	93468693          	addi	a3,a3,-1740 # ffffffffc020c0c0 <commands+0x9d8>
ffffffffc0201794:	0000a617          	auipc	a2,0xa
ffffffffc0201798:	16460613          	addi	a2,a2,356 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020179c:	0d300593          	li	a1,211
ffffffffc02017a0:	0000b517          	auipc	a0,0xb
ffffffffc02017a4:	8a850513          	addi	a0,a0,-1880 # ffffffffc020c048 <commands+0x960>
ffffffffc02017a8:	cf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ac:	0000b697          	auipc	a3,0xb
ffffffffc02017b0:	8f468693          	addi	a3,a3,-1804 # ffffffffc020c0a0 <commands+0x9b8>
ffffffffc02017b4:	0000a617          	auipc	a2,0xa
ffffffffc02017b8:	14460613          	addi	a2,a2,324 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02017bc:	0d200593          	li	a1,210
ffffffffc02017c0:	0000b517          	auipc	a0,0xb
ffffffffc02017c4:	88850513          	addi	a0,a0,-1912 # ffffffffc020c048 <commands+0x960>
ffffffffc02017c8:	cd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017cc:	0000b697          	auipc	a3,0xb
ffffffffc02017d0:	8f468693          	addi	a3,a3,-1804 # ffffffffc020c0c0 <commands+0x9d8>
ffffffffc02017d4:	0000a617          	auipc	a2,0xa
ffffffffc02017d8:	12460613          	addi	a2,a2,292 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02017dc:	0ba00593          	li	a1,186
ffffffffc02017e0:	0000b517          	auipc	a0,0xb
ffffffffc02017e4:	86850513          	addi	a0,a0,-1944 # ffffffffc020c048 <commands+0x960>
ffffffffc02017e8:	cb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ec:	0000b697          	auipc	a3,0xb
ffffffffc02017f0:	b7c68693          	addi	a3,a3,-1156 # ffffffffc020c368 <commands+0xc80>
ffffffffc02017f4:	0000a617          	auipc	a2,0xa
ffffffffc02017f8:	10460613          	addi	a2,a2,260 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02017fc:	12400593          	li	a1,292
ffffffffc0201800:	0000b517          	auipc	a0,0xb
ffffffffc0201804:	84850513          	addi	a0,a0,-1976 # ffffffffc020c048 <commands+0x960>
ffffffffc0201808:	c97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020180c:	0000b697          	auipc	a3,0xb
ffffffffc0201810:	9fc68693          	addi	a3,a3,-1540 # ffffffffc020c208 <commands+0xb20>
ffffffffc0201814:	0000a617          	auipc	a2,0xa
ffffffffc0201818:	0e460613          	addi	a2,a2,228 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020181c:	11900593          	li	a1,281
ffffffffc0201820:	0000b517          	auipc	a0,0xb
ffffffffc0201824:	82850513          	addi	a0,a0,-2008 # ffffffffc020c048 <commands+0x960>
ffffffffc0201828:	c77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020182c:	0000b697          	auipc	a3,0xb
ffffffffc0201830:	97c68693          	addi	a3,a3,-1668 # ffffffffc020c1a8 <commands+0xac0>
ffffffffc0201834:	0000a617          	auipc	a2,0xa
ffffffffc0201838:	0c460613          	addi	a2,a2,196 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020183c:	11700593          	li	a1,279
ffffffffc0201840:	0000b517          	auipc	a0,0xb
ffffffffc0201844:	80850513          	addi	a0,a0,-2040 # ffffffffc020c048 <commands+0x960>
ffffffffc0201848:	c57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020184c:	0000b697          	auipc	a3,0xb
ffffffffc0201850:	91c68693          	addi	a3,a3,-1764 # ffffffffc020c168 <commands+0xa80>
ffffffffc0201854:	0000a617          	auipc	a2,0xa
ffffffffc0201858:	0a460613          	addi	a2,a2,164 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020185c:	0c000593          	li	a1,192
ffffffffc0201860:	0000a517          	auipc	a0,0xa
ffffffffc0201864:	7e850513          	addi	a0,a0,2024 # ffffffffc020c048 <commands+0x960>
ffffffffc0201868:	c37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020186c:	0000b697          	auipc	a3,0xb
ffffffffc0201870:	abc68693          	addi	a3,a3,-1348 # ffffffffc020c328 <commands+0xc40>
ffffffffc0201874:	0000a617          	auipc	a2,0xa
ffffffffc0201878:	08460613          	addi	a2,a2,132 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020187c:	11100593          	li	a1,273
ffffffffc0201880:	0000a517          	auipc	a0,0xa
ffffffffc0201884:	7c850513          	addi	a0,a0,1992 # ffffffffc020c048 <commands+0x960>
ffffffffc0201888:	c17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020188c:	0000b697          	auipc	a3,0xb
ffffffffc0201890:	a7c68693          	addi	a3,a3,-1412 # ffffffffc020c308 <commands+0xc20>
ffffffffc0201894:	0000a617          	auipc	a2,0xa
ffffffffc0201898:	06460613          	addi	a2,a2,100 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020189c:	10f00593          	li	a1,271
ffffffffc02018a0:	0000a517          	auipc	a0,0xa
ffffffffc02018a4:	7a850513          	addi	a0,a0,1960 # ffffffffc020c048 <commands+0x960>
ffffffffc02018a8:	bf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ac:	0000b697          	auipc	a3,0xb
ffffffffc02018b0:	a3468693          	addi	a3,a3,-1484 # ffffffffc020c2e0 <commands+0xbf8>
ffffffffc02018b4:	0000a617          	auipc	a2,0xa
ffffffffc02018b8:	04460613          	addi	a2,a2,68 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02018bc:	10d00593          	li	a1,269
ffffffffc02018c0:	0000a517          	auipc	a0,0xa
ffffffffc02018c4:	78850513          	addi	a0,a0,1928 # ffffffffc020c048 <commands+0x960>
ffffffffc02018c8:	bd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018cc:	0000b697          	auipc	a3,0xb
ffffffffc02018d0:	9ec68693          	addi	a3,a3,-1556 # ffffffffc020c2b8 <commands+0xbd0>
ffffffffc02018d4:	0000a617          	auipc	a2,0xa
ffffffffc02018d8:	02460613          	addi	a2,a2,36 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02018dc:	10c00593          	li	a1,268
ffffffffc02018e0:	0000a517          	auipc	a0,0xa
ffffffffc02018e4:	76850513          	addi	a0,a0,1896 # ffffffffc020c048 <commands+0x960>
ffffffffc02018e8:	bb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ec:	0000b697          	auipc	a3,0xb
ffffffffc02018f0:	9bc68693          	addi	a3,a3,-1604 # ffffffffc020c2a8 <commands+0xbc0>
ffffffffc02018f4:	0000a617          	auipc	a2,0xa
ffffffffc02018f8:	00460613          	addi	a2,a2,4 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02018fc:	10700593          	li	a1,263
ffffffffc0201900:	0000a517          	auipc	a0,0xa
ffffffffc0201904:	74850513          	addi	a0,a0,1864 # ffffffffc020c048 <commands+0x960>
ffffffffc0201908:	b97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020190c:	0000b697          	auipc	a3,0xb
ffffffffc0201910:	89c68693          	addi	a3,a3,-1892 # ffffffffc020c1a8 <commands+0xac0>
ffffffffc0201914:	0000a617          	auipc	a2,0xa
ffffffffc0201918:	fe460613          	addi	a2,a2,-28 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020191c:	10600593          	li	a1,262
ffffffffc0201920:	0000a517          	auipc	a0,0xa
ffffffffc0201924:	72850513          	addi	a0,a0,1832 # ffffffffc020c048 <commands+0x960>
ffffffffc0201928:	b77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020192c:	0000b697          	auipc	a3,0xb
ffffffffc0201930:	95c68693          	addi	a3,a3,-1700 # ffffffffc020c288 <commands+0xba0>
ffffffffc0201934:	0000a617          	auipc	a2,0xa
ffffffffc0201938:	fc460613          	addi	a2,a2,-60 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020193c:	10500593          	li	a1,261
ffffffffc0201940:	0000a517          	auipc	a0,0xa
ffffffffc0201944:	70850513          	addi	a0,a0,1800 # ffffffffc020c048 <commands+0x960>
ffffffffc0201948:	b57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020194c:	0000b697          	auipc	a3,0xb
ffffffffc0201950:	90c68693          	addi	a3,a3,-1780 # ffffffffc020c258 <commands+0xb70>
ffffffffc0201954:	0000a617          	auipc	a2,0xa
ffffffffc0201958:	fa460613          	addi	a2,a2,-92 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020195c:	10400593          	li	a1,260
ffffffffc0201960:	0000a517          	auipc	a0,0xa
ffffffffc0201964:	6e850513          	addi	a0,a0,1768 # ffffffffc020c048 <commands+0x960>
ffffffffc0201968:	b37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020196c:	0000b697          	auipc	a3,0xb
ffffffffc0201970:	8d468693          	addi	a3,a3,-1836 # ffffffffc020c240 <commands+0xb58>
ffffffffc0201974:	0000a617          	auipc	a2,0xa
ffffffffc0201978:	f8460613          	addi	a2,a2,-124 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020197c:	10300593          	li	a1,259
ffffffffc0201980:	0000a517          	auipc	a0,0xa
ffffffffc0201984:	6c850513          	addi	a0,a0,1736 # ffffffffc020c048 <commands+0x960>
ffffffffc0201988:	b17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020198c:	0000b697          	auipc	a3,0xb
ffffffffc0201990:	81c68693          	addi	a3,a3,-2020 # ffffffffc020c1a8 <commands+0xac0>
ffffffffc0201994:	0000a617          	auipc	a2,0xa
ffffffffc0201998:	f6460613          	addi	a2,a2,-156 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020199c:	0fd00593          	li	a1,253
ffffffffc02019a0:	0000a517          	auipc	a0,0xa
ffffffffc02019a4:	6a850513          	addi	a0,a0,1704 # ffffffffc020c048 <commands+0x960>
ffffffffc02019a8:	af7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ac:	0000b697          	auipc	a3,0xb
ffffffffc02019b0:	87c68693          	addi	a3,a3,-1924 # ffffffffc020c228 <commands+0xb40>
ffffffffc02019b4:	0000a617          	auipc	a2,0xa
ffffffffc02019b8:	f4460613          	addi	a2,a2,-188 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02019bc:	0f800593          	li	a1,248
ffffffffc02019c0:	0000a517          	auipc	a0,0xa
ffffffffc02019c4:	68850513          	addi	a0,a0,1672 # ffffffffc020c048 <commands+0x960>
ffffffffc02019c8:	ad7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019cc:	0000b697          	auipc	a3,0xb
ffffffffc02019d0:	97c68693          	addi	a3,a3,-1668 # ffffffffc020c348 <commands+0xc60>
ffffffffc02019d4:	0000a617          	auipc	a2,0xa
ffffffffc02019d8:	f2460613          	addi	a2,a2,-220 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02019dc:	11600593          	li	a1,278
ffffffffc02019e0:	0000a517          	auipc	a0,0xa
ffffffffc02019e4:	66850513          	addi	a0,a0,1640 # ffffffffc020c048 <commands+0x960>
ffffffffc02019e8:	ab7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ec:	0000b697          	auipc	a3,0xb
ffffffffc02019f0:	98c68693          	addi	a3,a3,-1652 # ffffffffc020c378 <commands+0xc90>
ffffffffc02019f4:	0000a617          	auipc	a2,0xa
ffffffffc02019f8:	f0460613          	addi	a2,a2,-252 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02019fc:	12500593          	li	a1,293
ffffffffc0201a00:	0000a517          	auipc	a0,0xa
ffffffffc0201a04:	64850513          	addi	a0,a0,1608 # ffffffffc020c048 <commands+0x960>
ffffffffc0201a08:	a97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a0c:	0000a697          	auipc	a3,0xa
ffffffffc0201a10:	65468693          	addi	a3,a3,1620 # ffffffffc020c060 <commands+0x978>
ffffffffc0201a14:	0000a617          	auipc	a2,0xa
ffffffffc0201a18:	ee460613          	addi	a2,a2,-284 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0201a1c:	0f200593          	li	a1,242
ffffffffc0201a20:	0000a517          	auipc	a0,0xa
ffffffffc0201a24:	62850513          	addi	a0,a0,1576 # ffffffffc020c048 <commands+0x960>
ffffffffc0201a28:	a77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a2c:	0000a697          	auipc	a3,0xa
ffffffffc0201a30:	67468693          	addi	a3,a3,1652 # ffffffffc020c0a0 <commands+0x9b8>
ffffffffc0201a34:	0000a617          	auipc	a2,0xa
ffffffffc0201a38:	ec460613          	addi	a2,a2,-316 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0201a3c:	0b900593          	li	a1,185
ffffffffc0201a40:	0000a517          	auipc	a0,0xa
ffffffffc0201a44:	60850513          	addi	a0,a0,1544 # ffffffffc020c048 <commands+0x960>
ffffffffc0201a48:	a57fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201a4c <default_free_pages>:
ffffffffc0201a4c:	1141                	addi	sp,sp,-16
ffffffffc0201a4e:	e406                	sd	ra,8(sp)
ffffffffc0201a50:	14058463          	beqz	a1,ffffffffc0201b98 <default_free_pages+0x14c>
ffffffffc0201a54:	00659693          	slli	a3,a1,0x6
ffffffffc0201a58:	96aa                	add	a3,a3,a0
ffffffffc0201a5a:	87aa                	mv	a5,a0
ffffffffc0201a5c:	02d50263          	beq	a0,a3,ffffffffc0201a80 <default_free_pages+0x34>
ffffffffc0201a60:	6798                	ld	a4,8(a5)
ffffffffc0201a62:	8b05                	andi	a4,a4,1
ffffffffc0201a64:	10071a63          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a68:	6798                	ld	a4,8(a5)
ffffffffc0201a6a:	8b09                	andi	a4,a4,2
ffffffffc0201a6c:	10071663          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a70:	0007b423          	sd	zero,8(a5)
ffffffffc0201a74:	0007a023          	sw	zero,0(a5)
ffffffffc0201a78:	04078793          	addi	a5,a5,64
ffffffffc0201a7c:	fed792e3          	bne	a5,a3,ffffffffc0201a60 <default_free_pages+0x14>
ffffffffc0201a80:	2581                	sext.w	a1,a1
ffffffffc0201a82:	c90c                	sw	a1,16(a0)
ffffffffc0201a84:	00850893          	addi	a7,a0,8
ffffffffc0201a88:	4789                	li	a5,2
ffffffffc0201a8a:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201a8e:	00090697          	auipc	a3,0x90
ffffffffc0201a92:	d1a68693          	addi	a3,a3,-742 # ffffffffc02917a8 <free_area>
ffffffffc0201a96:	4a98                	lw	a4,16(a3)
ffffffffc0201a98:	669c                	ld	a5,8(a3)
ffffffffc0201a9a:	01850613          	addi	a2,a0,24
ffffffffc0201a9e:	9db9                	addw	a1,a1,a4
ffffffffc0201aa0:	ca8c                	sw	a1,16(a3)
ffffffffc0201aa2:	0ad78463          	beq	a5,a3,ffffffffc0201b4a <default_free_pages+0xfe>
ffffffffc0201aa6:	fe878713          	addi	a4,a5,-24
ffffffffc0201aaa:	0006b803          	ld	a6,0(a3)
ffffffffc0201aae:	4581                	li	a1,0
ffffffffc0201ab0:	00e56a63          	bltu	a0,a4,ffffffffc0201ac4 <default_free_pages+0x78>
ffffffffc0201ab4:	6798                	ld	a4,8(a5)
ffffffffc0201ab6:	04d70c63          	beq	a4,a3,ffffffffc0201b0e <default_free_pages+0xc2>
ffffffffc0201aba:	87ba                	mv	a5,a4
ffffffffc0201abc:	fe878713          	addi	a4,a5,-24
ffffffffc0201ac0:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ab4 <default_free_pages+0x68>
ffffffffc0201ac4:	c199                	beqz	a1,ffffffffc0201aca <default_free_pages+0x7e>
ffffffffc0201ac6:	0106b023          	sd	a6,0(a3)
ffffffffc0201aca:	6398                	ld	a4,0(a5)
ffffffffc0201acc:	e390                	sd	a2,0(a5)
ffffffffc0201ace:	e710                	sd	a2,8(a4)
ffffffffc0201ad0:	f11c                	sd	a5,32(a0)
ffffffffc0201ad2:	ed18                	sd	a4,24(a0)
ffffffffc0201ad4:	00d70d63          	beq	a4,a3,ffffffffc0201aee <default_free_pages+0xa2>
ffffffffc0201ad8:	ff872583          	lw	a1,-8(a4)
ffffffffc0201adc:	fe870613          	addi	a2,a4,-24
ffffffffc0201ae0:	02059813          	slli	a6,a1,0x20
ffffffffc0201ae4:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201ae8:	97b2                	add	a5,a5,a2
ffffffffc0201aea:	02f50c63          	beq	a0,a5,ffffffffc0201b22 <default_free_pages+0xd6>
ffffffffc0201aee:	711c                	ld	a5,32(a0)
ffffffffc0201af0:	00d78c63          	beq	a5,a3,ffffffffc0201b08 <default_free_pages+0xbc>
ffffffffc0201af4:	4910                	lw	a2,16(a0)
ffffffffc0201af6:	fe878693          	addi	a3,a5,-24
ffffffffc0201afa:	02061593          	slli	a1,a2,0x20
ffffffffc0201afe:	01a5d713          	srli	a4,a1,0x1a
ffffffffc0201b02:	972a                	add	a4,a4,a0
ffffffffc0201b04:	04e68a63          	beq	a3,a4,ffffffffc0201b58 <default_free_pages+0x10c>
ffffffffc0201b08:	60a2                	ld	ra,8(sp)
ffffffffc0201b0a:	0141                	addi	sp,sp,16
ffffffffc0201b0c:	8082                	ret
ffffffffc0201b0e:	e790                	sd	a2,8(a5)
ffffffffc0201b10:	f114                	sd	a3,32(a0)
ffffffffc0201b12:	6798                	ld	a4,8(a5)
ffffffffc0201b14:	ed1c                	sd	a5,24(a0)
ffffffffc0201b16:	02d70763          	beq	a4,a3,ffffffffc0201b44 <default_free_pages+0xf8>
ffffffffc0201b1a:	8832                	mv	a6,a2
ffffffffc0201b1c:	4585                	li	a1,1
ffffffffc0201b1e:	87ba                	mv	a5,a4
ffffffffc0201b20:	bf71                	j	ffffffffc0201abc <default_free_pages+0x70>
ffffffffc0201b22:	491c                	lw	a5,16(a0)
ffffffffc0201b24:	9dbd                	addw	a1,a1,a5
ffffffffc0201b26:	feb72c23          	sw	a1,-8(a4)
ffffffffc0201b2a:	57f5                	li	a5,-3
ffffffffc0201b2c:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201b30:	01853803          	ld	a6,24(a0)
ffffffffc0201b34:	710c                	ld	a1,32(a0)
ffffffffc0201b36:	8532                	mv	a0,a2
ffffffffc0201b38:	00b83423          	sd	a1,8(a6)
ffffffffc0201b3c:	671c                	ld	a5,8(a4)
ffffffffc0201b3e:	0105b023          	sd	a6,0(a1)
ffffffffc0201b42:	b77d                	j	ffffffffc0201af0 <default_free_pages+0xa4>
ffffffffc0201b44:	e290                	sd	a2,0(a3)
ffffffffc0201b46:	873e                	mv	a4,a5
ffffffffc0201b48:	bf41                	j	ffffffffc0201ad8 <default_free_pages+0x8c>
ffffffffc0201b4a:	60a2                	ld	ra,8(sp)
ffffffffc0201b4c:	e390                	sd	a2,0(a5)
ffffffffc0201b4e:	e790                	sd	a2,8(a5)
ffffffffc0201b50:	f11c                	sd	a5,32(a0)
ffffffffc0201b52:	ed1c                	sd	a5,24(a0)
ffffffffc0201b54:	0141                	addi	sp,sp,16
ffffffffc0201b56:	8082                	ret
ffffffffc0201b58:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201b5c:	ff078693          	addi	a3,a5,-16
ffffffffc0201b60:	9e39                	addw	a2,a2,a4
ffffffffc0201b62:	c910                	sw	a2,16(a0)
ffffffffc0201b64:	5775                	li	a4,-3
ffffffffc0201b66:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc0201b6a:	6398                	ld	a4,0(a5)
ffffffffc0201b6c:	679c                	ld	a5,8(a5)
ffffffffc0201b6e:	60a2                	ld	ra,8(sp)
ffffffffc0201b70:	e71c                	sd	a5,8(a4)
ffffffffc0201b72:	e398                	sd	a4,0(a5)
ffffffffc0201b74:	0141                	addi	sp,sp,16
ffffffffc0201b76:	8082                	ret
ffffffffc0201b78:	0000b697          	auipc	a3,0xb
ffffffffc0201b7c:	81868693          	addi	a3,a3,-2024 # ffffffffc020c390 <commands+0xca8>
ffffffffc0201b80:	0000a617          	auipc	a2,0xa
ffffffffc0201b84:	d7860613          	addi	a2,a2,-648 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0201b88:	08200593          	li	a1,130
ffffffffc0201b8c:	0000a517          	auipc	a0,0xa
ffffffffc0201b90:	4bc50513          	addi	a0,a0,1212 # ffffffffc020c048 <commands+0x960>
ffffffffc0201b94:	90bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201b98:	0000a697          	auipc	a3,0xa
ffffffffc0201b9c:	7f068693          	addi	a3,a3,2032 # ffffffffc020c388 <commands+0xca0>
ffffffffc0201ba0:	0000a617          	auipc	a2,0xa
ffffffffc0201ba4:	d5860613          	addi	a2,a2,-680 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0201ba8:	07f00593          	li	a1,127
ffffffffc0201bac:	0000a517          	auipc	a0,0xa
ffffffffc0201bb0:	49c50513          	addi	a0,a0,1180 # ffffffffc020c048 <commands+0x960>
ffffffffc0201bb4:	8ebfe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201bb8 <default_alloc_pages>:
ffffffffc0201bb8:	c941                	beqz	a0,ffffffffc0201c48 <default_alloc_pages+0x90>
ffffffffc0201bba:	00090597          	auipc	a1,0x90
ffffffffc0201bbe:	bee58593          	addi	a1,a1,-1042 # ffffffffc02917a8 <free_area>
ffffffffc0201bc2:	0105a803          	lw	a6,16(a1)
ffffffffc0201bc6:	872a                	mv	a4,a0
ffffffffc0201bc8:	02081793          	slli	a5,a6,0x20
ffffffffc0201bcc:	9381                	srli	a5,a5,0x20
ffffffffc0201bce:	00a7ee63          	bltu	a5,a0,ffffffffc0201bea <default_alloc_pages+0x32>
ffffffffc0201bd2:	87ae                	mv	a5,a1
ffffffffc0201bd4:	a801                	j	ffffffffc0201be4 <default_alloc_pages+0x2c>
ffffffffc0201bd6:	ff87a683          	lw	a3,-8(a5)
ffffffffc0201bda:	02069613          	slli	a2,a3,0x20
ffffffffc0201bde:	9201                	srli	a2,a2,0x20
ffffffffc0201be0:	00e67763          	bgeu	a2,a4,ffffffffc0201bee <default_alloc_pages+0x36>
ffffffffc0201be4:	679c                	ld	a5,8(a5)
ffffffffc0201be6:	feb798e3          	bne	a5,a1,ffffffffc0201bd6 <default_alloc_pages+0x1e>
ffffffffc0201bea:	4501                	li	a0,0
ffffffffc0201bec:	8082                	ret
ffffffffc0201bee:	0007b883          	ld	a7,0(a5)
ffffffffc0201bf2:	0087b303          	ld	t1,8(a5)
ffffffffc0201bf6:	fe878513          	addi	a0,a5,-24
ffffffffc0201bfa:	00070e1b          	sext.w	t3,a4
ffffffffc0201bfe:	0068b423          	sd	t1,8(a7) # 10000008 <_binary_bin_sfs_img_size+0xff8ad08>
ffffffffc0201c02:	01133023          	sd	a7,0(t1)
ffffffffc0201c06:	02c77863          	bgeu	a4,a2,ffffffffc0201c36 <default_alloc_pages+0x7e>
ffffffffc0201c0a:	071a                	slli	a4,a4,0x6
ffffffffc0201c0c:	972a                	add	a4,a4,a0
ffffffffc0201c0e:	41c686bb          	subw	a3,a3,t3
ffffffffc0201c12:	cb14                	sw	a3,16(a4)
ffffffffc0201c14:	00870613          	addi	a2,a4,8
ffffffffc0201c18:	4689                	li	a3,2
ffffffffc0201c1a:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0201c1e:	0088b683          	ld	a3,8(a7)
ffffffffc0201c22:	01870613          	addi	a2,a4,24
ffffffffc0201c26:	0105a803          	lw	a6,16(a1)
ffffffffc0201c2a:	e290                	sd	a2,0(a3)
ffffffffc0201c2c:	00c8b423          	sd	a2,8(a7)
ffffffffc0201c30:	f314                	sd	a3,32(a4)
ffffffffc0201c32:	01173c23          	sd	a7,24(a4)
ffffffffc0201c36:	41c8083b          	subw	a6,a6,t3
ffffffffc0201c3a:	0105a823          	sw	a6,16(a1)
ffffffffc0201c3e:	5775                	li	a4,-3
ffffffffc0201c40:	17c1                	addi	a5,a5,-16
ffffffffc0201c42:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201c46:	8082                	ret
ffffffffc0201c48:	1141                	addi	sp,sp,-16
ffffffffc0201c4a:	0000a697          	auipc	a3,0xa
ffffffffc0201c4e:	73e68693          	addi	a3,a3,1854 # ffffffffc020c388 <commands+0xca0>
ffffffffc0201c52:	0000a617          	auipc	a2,0xa
ffffffffc0201c56:	ca660613          	addi	a2,a2,-858 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0201c5a:	06100593          	li	a1,97
ffffffffc0201c5e:	0000a517          	auipc	a0,0xa
ffffffffc0201c62:	3ea50513          	addi	a0,a0,1002 # ffffffffc020c048 <commands+0x960>
ffffffffc0201c66:	e406                	sd	ra,8(sp)
ffffffffc0201c68:	837fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201c6c <default_init_memmap>:
ffffffffc0201c6c:	1141                	addi	sp,sp,-16
ffffffffc0201c6e:	e406                	sd	ra,8(sp)
ffffffffc0201c70:	c5f1                	beqz	a1,ffffffffc0201d3c <default_init_memmap+0xd0>
ffffffffc0201c72:	00659693          	slli	a3,a1,0x6
ffffffffc0201c76:	96aa                	add	a3,a3,a0
ffffffffc0201c78:	87aa                	mv	a5,a0
ffffffffc0201c7a:	00d50f63          	beq	a0,a3,ffffffffc0201c98 <default_init_memmap+0x2c>
ffffffffc0201c7e:	6798                	ld	a4,8(a5)
ffffffffc0201c80:	8b05                	andi	a4,a4,1
ffffffffc0201c82:	cf49                	beqz	a4,ffffffffc0201d1c <default_init_memmap+0xb0>
ffffffffc0201c84:	0007a823          	sw	zero,16(a5)
ffffffffc0201c88:	0007b423          	sd	zero,8(a5)
ffffffffc0201c8c:	0007a023          	sw	zero,0(a5)
ffffffffc0201c90:	04078793          	addi	a5,a5,64
ffffffffc0201c94:	fed795e3          	bne	a5,a3,ffffffffc0201c7e <default_init_memmap+0x12>
ffffffffc0201c98:	2581                	sext.w	a1,a1
ffffffffc0201c9a:	c90c                	sw	a1,16(a0)
ffffffffc0201c9c:	4789                	li	a5,2
ffffffffc0201c9e:	00850713          	addi	a4,a0,8
ffffffffc0201ca2:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0201ca6:	00090697          	auipc	a3,0x90
ffffffffc0201caa:	b0268693          	addi	a3,a3,-1278 # ffffffffc02917a8 <free_area>
ffffffffc0201cae:	4a98                	lw	a4,16(a3)
ffffffffc0201cb0:	669c                	ld	a5,8(a3)
ffffffffc0201cb2:	01850613          	addi	a2,a0,24
ffffffffc0201cb6:	9db9                	addw	a1,a1,a4
ffffffffc0201cb8:	ca8c                	sw	a1,16(a3)
ffffffffc0201cba:	04d78a63          	beq	a5,a3,ffffffffc0201d0e <default_init_memmap+0xa2>
ffffffffc0201cbe:	fe878713          	addi	a4,a5,-24
ffffffffc0201cc2:	0006b803          	ld	a6,0(a3)
ffffffffc0201cc6:	4581                	li	a1,0
ffffffffc0201cc8:	00e56a63          	bltu	a0,a4,ffffffffc0201cdc <default_init_memmap+0x70>
ffffffffc0201ccc:	6798                	ld	a4,8(a5)
ffffffffc0201cce:	02d70263          	beq	a4,a3,ffffffffc0201cf2 <default_init_memmap+0x86>
ffffffffc0201cd2:	87ba                	mv	a5,a4
ffffffffc0201cd4:	fe878713          	addi	a4,a5,-24
ffffffffc0201cd8:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ccc <default_init_memmap+0x60>
ffffffffc0201cdc:	c199                	beqz	a1,ffffffffc0201ce2 <default_init_memmap+0x76>
ffffffffc0201cde:	0106b023          	sd	a6,0(a3)
ffffffffc0201ce2:	6398                	ld	a4,0(a5)
ffffffffc0201ce4:	60a2                	ld	ra,8(sp)
ffffffffc0201ce6:	e390                	sd	a2,0(a5)
ffffffffc0201ce8:	e710                	sd	a2,8(a4)
ffffffffc0201cea:	f11c                	sd	a5,32(a0)
ffffffffc0201cec:	ed18                	sd	a4,24(a0)
ffffffffc0201cee:	0141                	addi	sp,sp,16
ffffffffc0201cf0:	8082                	ret
ffffffffc0201cf2:	e790                	sd	a2,8(a5)
ffffffffc0201cf4:	f114                	sd	a3,32(a0)
ffffffffc0201cf6:	6798                	ld	a4,8(a5)
ffffffffc0201cf8:	ed1c                	sd	a5,24(a0)
ffffffffc0201cfa:	00d70663          	beq	a4,a3,ffffffffc0201d06 <default_init_memmap+0x9a>
ffffffffc0201cfe:	8832                	mv	a6,a2
ffffffffc0201d00:	4585                	li	a1,1
ffffffffc0201d02:	87ba                	mv	a5,a4
ffffffffc0201d04:	bfc1                	j	ffffffffc0201cd4 <default_init_memmap+0x68>
ffffffffc0201d06:	60a2                	ld	ra,8(sp)
ffffffffc0201d08:	e290                	sd	a2,0(a3)
ffffffffc0201d0a:	0141                	addi	sp,sp,16
ffffffffc0201d0c:	8082                	ret
ffffffffc0201d0e:	60a2                	ld	ra,8(sp)
ffffffffc0201d10:	e390                	sd	a2,0(a5)
ffffffffc0201d12:	e790                	sd	a2,8(a5)
ffffffffc0201d14:	f11c                	sd	a5,32(a0)
ffffffffc0201d16:	ed1c                	sd	a5,24(a0)
ffffffffc0201d18:	0141                	addi	sp,sp,16
ffffffffc0201d1a:	8082                	ret
ffffffffc0201d1c:	0000a697          	auipc	a3,0xa
ffffffffc0201d20:	69c68693          	addi	a3,a3,1692 # ffffffffc020c3b8 <commands+0xcd0>
ffffffffc0201d24:	0000a617          	auipc	a2,0xa
ffffffffc0201d28:	bd460613          	addi	a2,a2,-1068 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0201d2c:	04800593          	li	a1,72
ffffffffc0201d30:	0000a517          	auipc	a0,0xa
ffffffffc0201d34:	31850513          	addi	a0,a0,792 # ffffffffc020c048 <commands+0x960>
ffffffffc0201d38:	f66fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201d3c:	0000a697          	auipc	a3,0xa
ffffffffc0201d40:	64c68693          	addi	a3,a3,1612 # ffffffffc020c388 <commands+0xca0>
ffffffffc0201d44:	0000a617          	auipc	a2,0xa
ffffffffc0201d48:	bb460613          	addi	a2,a2,-1100 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0201d4c:	04500593          	li	a1,69
ffffffffc0201d50:	0000a517          	auipc	a0,0xa
ffffffffc0201d54:	2f850513          	addi	a0,a0,760 # ffffffffc020c048 <commands+0x960>
ffffffffc0201d58:	f46fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201d5c <slob_free>:
ffffffffc0201d5c:	c94d                	beqz	a0,ffffffffc0201e0e <slob_free+0xb2>
ffffffffc0201d5e:	1141                	addi	sp,sp,-16
ffffffffc0201d60:	e022                	sd	s0,0(sp)
ffffffffc0201d62:	e406                	sd	ra,8(sp)
ffffffffc0201d64:	842a                	mv	s0,a0
ffffffffc0201d66:	e9c1                	bnez	a1,ffffffffc0201df6 <slob_free+0x9a>
ffffffffc0201d68:	100027f3          	csrr	a5,sstatus
ffffffffc0201d6c:	8b89                	andi	a5,a5,2
ffffffffc0201d6e:	4501                	li	a0,0
ffffffffc0201d70:	ebd9                	bnez	a5,ffffffffc0201e06 <slob_free+0xaa>
ffffffffc0201d72:	0008f617          	auipc	a2,0x8f
ffffffffc0201d76:	2de60613          	addi	a2,a2,734 # ffffffffc0291050 <slobfree>
ffffffffc0201d7a:	621c                	ld	a5,0(a2)
ffffffffc0201d7c:	873e                	mv	a4,a5
ffffffffc0201d7e:	679c                	ld	a5,8(a5)
ffffffffc0201d80:	02877a63          	bgeu	a4,s0,ffffffffc0201db4 <slob_free+0x58>
ffffffffc0201d84:	00f46463          	bltu	s0,a5,ffffffffc0201d8c <slob_free+0x30>
ffffffffc0201d88:	fef76ae3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201d8c:	400c                	lw	a1,0(s0)
ffffffffc0201d8e:	00459693          	slli	a3,a1,0x4
ffffffffc0201d92:	96a2                	add	a3,a3,s0
ffffffffc0201d94:	02d78a63          	beq	a5,a3,ffffffffc0201dc8 <slob_free+0x6c>
ffffffffc0201d98:	4314                	lw	a3,0(a4)
ffffffffc0201d9a:	e41c                	sd	a5,8(s0)
ffffffffc0201d9c:	00469793          	slli	a5,a3,0x4
ffffffffc0201da0:	97ba                	add	a5,a5,a4
ffffffffc0201da2:	02f40e63          	beq	s0,a5,ffffffffc0201dde <slob_free+0x82>
ffffffffc0201da6:	e700                	sd	s0,8(a4)
ffffffffc0201da8:	e218                	sd	a4,0(a2)
ffffffffc0201daa:	e129                	bnez	a0,ffffffffc0201dec <slob_free+0x90>
ffffffffc0201dac:	60a2                	ld	ra,8(sp)
ffffffffc0201dae:	6402                	ld	s0,0(sp)
ffffffffc0201db0:	0141                	addi	sp,sp,16
ffffffffc0201db2:	8082                	ret
ffffffffc0201db4:	fcf764e3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201db8:	fcf472e3          	bgeu	s0,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201dbc:	400c                	lw	a1,0(s0)
ffffffffc0201dbe:	00459693          	slli	a3,a1,0x4
ffffffffc0201dc2:	96a2                	add	a3,a3,s0
ffffffffc0201dc4:	fcd79ae3          	bne	a5,a3,ffffffffc0201d98 <slob_free+0x3c>
ffffffffc0201dc8:	4394                	lw	a3,0(a5)
ffffffffc0201dca:	679c                	ld	a5,8(a5)
ffffffffc0201dcc:	9db5                	addw	a1,a1,a3
ffffffffc0201dce:	c00c                	sw	a1,0(s0)
ffffffffc0201dd0:	4314                	lw	a3,0(a4)
ffffffffc0201dd2:	e41c                	sd	a5,8(s0)
ffffffffc0201dd4:	00469793          	slli	a5,a3,0x4
ffffffffc0201dd8:	97ba                	add	a5,a5,a4
ffffffffc0201dda:	fcf416e3          	bne	s0,a5,ffffffffc0201da6 <slob_free+0x4a>
ffffffffc0201dde:	401c                	lw	a5,0(s0)
ffffffffc0201de0:	640c                	ld	a1,8(s0)
ffffffffc0201de2:	e218                	sd	a4,0(a2)
ffffffffc0201de4:	9ebd                	addw	a3,a3,a5
ffffffffc0201de6:	c314                	sw	a3,0(a4)
ffffffffc0201de8:	e70c                	sd	a1,8(a4)
ffffffffc0201dea:	d169                	beqz	a0,ffffffffc0201dac <slob_free+0x50>
ffffffffc0201dec:	6402                	ld	s0,0(sp)
ffffffffc0201dee:	60a2                	ld	ra,8(sp)
ffffffffc0201df0:	0141                	addi	sp,sp,16
ffffffffc0201df2:	e7bfe06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0201df6:	25bd                	addiw	a1,a1,15
ffffffffc0201df8:	8191                	srli	a1,a1,0x4
ffffffffc0201dfa:	c10c                	sw	a1,0(a0)
ffffffffc0201dfc:	100027f3          	csrr	a5,sstatus
ffffffffc0201e00:	8b89                	andi	a5,a5,2
ffffffffc0201e02:	4501                	li	a0,0
ffffffffc0201e04:	d7bd                	beqz	a5,ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e06:	e6dfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201e0a:	4505                	li	a0,1
ffffffffc0201e0c:	b79d                	j	ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e0e:	8082                	ret

ffffffffc0201e10 <__slob_get_free_pages.constprop.0>:
ffffffffc0201e10:	4785                	li	a5,1
ffffffffc0201e12:	1141                	addi	sp,sp,-16
ffffffffc0201e14:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201e18:	e406                	sd	ra,8(sp)
ffffffffc0201e1a:	352000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201e1e:	c91d                	beqz	a0,ffffffffc0201e54 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc0201e20:	00095697          	auipc	a3,0x95
ffffffffc0201e24:	a886b683          	ld	a3,-1400(a3) # ffffffffc02968a8 <pages>
ffffffffc0201e28:	8d15                	sub	a0,a0,a3
ffffffffc0201e2a:	8519                	srai	a0,a0,0x6
ffffffffc0201e2c:	0000e697          	auipc	a3,0xe
ffffffffc0201e30:	92c6b683          	ld	a3,-1748(a3) # ffffffffc020f758 <nbase>
ffffffffc0201e34:	9536                	add	a0,a0,a3
ffffffffc0201e36:	00c51793          	slli	a5,a0,0xc
ffffffffc0201e3a:	83b1                	srli	a5,a5,0xc
ffffffffc0201e3c:	00095717          	auipc	a4,0x95
ffffffffc0201e40:	a6473703          	ld	a4,-1436(a4) # ffffffffc02968a0 <npage>
ffffffffc0201e44:	0532                	slli	a0,a0,0xc
ffffffffc0201e46:	00e7fa63          	bgeu	a5,a4,ffffffffc0201e5a <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201e4a:	00095697          	auipc	a3,0x95
ffffffffc0201e4e:	a6e6b683          	ld	a3,-1426(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0201e52:	9536                	add	a0,a0,a3
ffffffffc0201e54:	60a2                	ld	ra,8(sp)
ffffffffc0201e56:	0141                	addi	sp,sp,16
ffffffffc0201e58:	8082                	ret
ffffffffc0201e5a:	86aa                	mv	a3,a0
ffffffffc0201e5c:	0000a617          	auipc	a2,0xa
ffffffffc0201e60:	5bc60613          	addi	a2,a2,1468 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc0201e64:	07100593          	li	a1,113
ffffffffc0201e68:	0000a517          	auipc	a0,0xa
ffffffffc0201e6c:	5d850513          	addi	a0,a0,1496 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0201e70:	e2efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201e74 <slob_alloc.constprop.0>:
ffffffffc0201e74:	1101                	addi	sp,sp,-32
ffffffffc0201e76:	ec06                	sd	ra,24(sp)
ffffffffc0201e78:	e822                	sd	s0,16(sp)
ffffffffc0201e7a:	e426                	sd	s1,8(sp)
ffffffffc0201e7c:	e04a                	sd	s2,0(sp)
ffffffffc0201e7e:	01050713          	addi	a4,a0,16
ffffffffc0201e82:	6785                	lui	a5,0x1
ffffffffc0201e84:	0cf77363          	bgeu	a4,a5,ffffffffc0201f4a <slob_alloc.constprop.0+0xd6>
ffffffffc0201e88:	00f50493          	addi	s1,a0,15
ffffffffc0201e8c:	8091                	srli	s1,s1,0x4
ffffffffc0201e8e:	2481                	sext.w	s1,s1
ffffffffc0201e90:	10002673          	csrr	a2,sstatus
ffffffffc0201e94:	8a09                	andi	a2,a2,2
ffffffffc0201e96:	e25d                	bnez	a2,ffffffffc0201f3c <slob_alloc.constprop.0+0xc8>
ffffffffc0201e98:	0008f917          	auipc	s2,0x8f
ffffffffc0201e9c:	1b890913          	addi	s2,s2,440 # ffffffffc0291050 <slobfree>
ffffffffc0201ea0:	00093683          	ld	a3,0(s2)
ffffffffc0201ea4:	669c                	ld	a5,8(a3)
ffffffffc0201ea6:	4398                	lw	a4,0(a5)
ffffffffc0201ea8:	08975e63          	bge	a4,s1,ffffffffc0201f44 <slob_alloc.constprop.0+0xd0>
ffffffffc0201eac:	00f68b63          	beq	a3,a5,ffffffffc0201ec2 <slob_alloc.constprop.0+0x4e>
ffffffffc0201eb0:	6780                	ld	s0,8(a5)
ffffffffc0201eb2:	4018                	lw	a4,0(s0)
ffffffffc0201eb4:	02975a63          	bge	a4,s1,ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201eb8:	00093683          	ld	a3,0(s2)
ffffffffc0201ebc:	87a2                	mv	a5,s0
ffffffffc0201ebe:	fef699e3          	bne	a3,a5,ffffffffc0201eb0 <slob_alloc.constprop.0+0x3c>
ffffffffc0201ec2:	ee31                	bnez	a2,ffffffffc0201f1e <slob_alloc.constprop.0+0xaa>
ffffffffc0201ec4:	4501                	li	a0,0
ffffffffc0201ec6:	f4bff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201eca:	842a                	mv	s0,a0
ffffffffc0201ecc:	cd05                	beqz	a0,ffffffffc0201f04 <slob_alloc.constprop.0+0x90>
ffffffffc0201ece:	6585                	lui	a1,0x1
ffffffffc0201ed0:	e8dff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc0201ed4:	10002673          	csrr	a2,sstatus
ffffffffc0201ed8:	8a09                	andi	a2,a2,2
ffffffffc0201eda:	ee05                	bnez	a2,ffffffffc0201f12 <slob_alloc.constprop.0+0x9e>
ffffffffc0201edc:	00093783          	ld	a5,0(s2)
ffffffffc0201ee0:	6780                	ld	s0,8(a5)
ffffffffc0201ee2:	4018                	lw	a4,0(s0)
ffffffffc0201ee4:	fc974ae3          	blt	a4,s1,ffffffffc0201eb8 <slob_alloc.constprop.0+0x44>
ffffffffc0201ee8:	04e48763          	beq	s1,a4,ffffffffc0201f36 <slob_alloc.constprop.0+0xc2>
ffffffffc0201eec:	00449693          	slli	a3,s1,0x4
ffffffffc0201ef0:	96a2                	add	a3,a3,s0
ffffffffc0201ef2:	e794                	sd	a3,8(a5)
ffffffffc0201ef4:	640c                	ld	a1,8(s0)
ffffffffc0201ef6:	9f05                	subw	a4,a4,s1
ffffffffc0201ef8:	c298                	sw	a4,0(a3)
ffffffffc0201efa:	e68c                	sd	a1,8(a3)
ffffffffc0201efc:	c004                	sw	s1,0(s0)
ffffffffc0201efe:	00f93023          	sd	a5,0(s2)
ffffffffc0201f02:	e20d                	bnez	a2,ffffffffc0201f24 <slob_alloc.constprop.0+0xb0>
ffffffffc0201f04:	60e2                	ld	ra,24(sp)
ffffffffc0201f06:	8522                	mv	a0,s0
ffffffffc0201f08:	6442                	ld	s0,16(sp)
ffffffffc0201f0a:	64a2                	ld	s1,8(sp)
ffffffffc0201f0c:	6902                	ld	s2,0(sp)
ffffffffc0201f0e:	6105                	addi	sp,sp,32
ffffffffc0201f10:	8082                	ret
ffffffffc0201f12:	d61fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f16:	00093783          	ld	a5,0(s2)
ffffffffc0201f1a:	4605                	li	a2,1
ffffffffc0201f1c:	b7d1                	j	ffffffffc0201ee0 <slob_alloc.constprop.0+0x6c>
ffffffffc0201f1e:	d4ffe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f22:	b74d                	j	ffffffffc0201ec4 <slob_alloc.constprop.0+0x50>
ffffffffc0201f24:	d49fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f28:	60e2                	ld	ra,24(sp)
ffffffffc0201f2a:	8522                	mv	a0,s0
ffffffffc0201f2c:	6442                	ld	s0,16(sp)
ffffffffc0201f2e:	64a2                	ld	s1,8(sp)
ffffffffc0201f30:	6902                	ld	s2,0(sp)
ffffffffc0201f32:	6105                	addi	sp,sp,32
ffffffffc0201f34:	8082                	ret
ffffffffc0201f36:	6418                	ld	a4,8(s0)
ffffffffc0201f38:	e798                	sd	a4,8(a5)
ffffffffc0201f3a:	b7d1                	j	ffffffffc0201efe <slob_alloc.constprop.0+0x8a>
ffffffffc0201f3c:	d37fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f40:	4605                	li	a2,1
ffffffffc0201f42:	bf99                	j	ffffffffc0201e98 <slob_alloc.constprop.0+0x24>
ffffffffc0201f44:	843e                	mv	s0,a5
ffffffffc0201f46:	87b6                	mv	a5,a3
ffffffffc0201f48:	b745                	j	ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201f4a:	0000a697          	auipc	a3,0xa
ffffffffc0201f4e:	50668693          	addi	a3,a3,1286 # ffffffffc020c450 <default_pmm_manager+0x70>
ffffffffc0201f52:	0000a617          	auipc	a2,0xa
ffffffffc0201f56:	9a660613          	addi	a2,a2,-1626 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0201f5a:	06300593          	li	a1,99
ffffffffc0201f5e:	0000a517          	auipc	a0,0xa
ffffffffc0201f62:	51250513          	addi	a0,a0,1298 # ffffffffc020c470 <default_pmm_manager+0x90>
ffffffffc0201f66:	d38fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201f6a <kmalloc_init>:
ffffffffc0201f6a:	1141                	addi	sp,sp,-16
ffffffffc0201f6c:	0000a517          	auipc	a0,0xa
ffffffffc0201f70:	51c50513          	addi	a0,a0,1308 # ffffffffc020c488 <default_pmm_manager+0xa8>
ffffffffc0201f74:	e406                	sd	ra,8(sp)
ffffffffc0201f76:	a30fe0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201f7a:	60a2                	ld	ra,8(sp)
ffffffffc0201f7c:	0000a517          	auipc	a0,0xa
ffffffffc0201f80:	52450513          	addi	a0,a0,1316 # ffffffffc020c4a0 <default_pmm_manager+0xc0>
ffffffffc0201f84:	0141                	addi	sp,sp,16
ffffffffc0201f86:	a20fe06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0201f8a <kallocated>:
ffffffffc0201f8a:	4501                	li	a0,0
ffffffffc0201f8c:	8082                	ret

ffffffffc0201f8e <kmalloc>:
ffffffffc0201f8e:	1101                	addi	sp,sp,-32
ffffffffc0201f90:	e04a                	sd	s2,0(sp)
ffffffffc0201f92:	6905                	lui	s2,0x1
ffffffffc0201f94:	e822                	sd	s0,16(sp)
ffffffffc0201f96:	ec06                	sd	ra,24(sp)
ffffffffc0201f98:	e426                	sd	s1,8(sp)
ffffffffc0201f9a:	fef90793          	addi	a5,s2,-17 # fef <_binary_bin_swap_img_size-0x6d11>
ffffffffc0201f9e:	842a                	mv	s0,a0
ffffffffc0201fa0:	04a7f963          	bgeu	a5,a0,ffffffffc0201ff2 <kmalloc+0x64>
ffffffffc0201fa4:	4561                	li	a0,24
ffffffffc0201fa6:	ecfff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201faa:	84aa                	mv	s1,a0
ffffffffc0201fac:	c929                	beqz	a0,ffffffffc0201ffe <kmalloc+0x70>
ffffffffc0201fae:	0004079b          	sext.w	a5,s0
ffffffffc0201fb2:	4501                	li	a0,0
ffffffffc0201fb4:	00f95763          	bge	s2,a5,ffffffffc0201fc2 <kmalloc+0x34>
ffffffffc0201fb8:	6705                	lui	a4,0x1
ffffffffc0201fba:	8785                	srai	a5,a5,0x1
ffffffffc0201fbc:	2505                	addiw	a0,a0,1
ffffffffc0201fbe:	fef74ee3          	blt	a4,a5,ffffffffc0201fba <kmalloc+0x2c>
ffffffffc0201fc2:	c088                	sw	a0,0(s1)
ffffffffc0201fc4:	e4dff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201fc8:	e488                	sd	a0,8(s1)
ffffffffc0201fca:	842a                	mv	s0,a0
ffffffffc0201fcc:	c525                	beqz	a0,ffffffffc0202034 <kmalloc+0xa6>
ffffffffc0201fce:	100027f3          	csrr	a5,sstatus
ffffffffc0201fd2:	8b89                	andi	a5,a5,2
ffffffffc0201fd4:	ef8d                	bnez	a5,ffffffffc020200e <kmalloc+0x80>
ffffffffc0201fd6:	00095797          	auipc	a5,0x95
ffffffffc0201fda:	8b278793          	addi	a5,a5,-1870 # ffffffffc0296888 <bigblocks>
ffffffffc0201fde:	6398                	ld	a4,0(a5)
ffffffffc0201fe0:	e384                	sd	s1,0(a5)
ffffffffc0201fe2:	e898                	sd	a4,16(s1)
ffffffffc0201fe4:	60e2                	ld	ra,24(sp)
ffffffffc0201fe6:	8522                	mv	a0,s0
ffffffffc0201fe8:	6442                	ld	s0,16(sp)
ffffffffc0201fea:	64a2                	ld	s1,8(sp)
ffffffffc0201fec:	6902                	ld	s2,0(sp)
ffffffffc0201fee:	6105                	addi	sp,sp,32
ffffffffc0201ff0:	8082                	ret
ffffffffc0201ff2:	0541                	addi	a0,a0,16
ffffffffc0201ff4:	e81ff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201ff8:	01050413          	addi	s0,a0,16
ffffffffc0201ffc:	f565                	bnez	a0,ffffffffc0201fe4 <kmalloc+0x56>
ffffffffc0201ffe:	4401                	li	s0,0
ffffffffc0202000:	60e2                	ld	ra,24(sp)
ffffffffc0202002:	8522                	mv	a0,s0
ffffffffc0202004:	6442                	ld	s0,16(sp)
ffffffffc0202006:	64a2                	ld	s1,8(sp)
ffffffffc0202008:	6902                	ld	s2,0(sp)
ffffffffc020200a:	6105                	addi	sp,sp,32
ffffffffc020200c:	8082                	ret
ffffffffc020200e:	c65fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202012:	00095797          	auipc	a5,0x95
ffffffffc0202016:	87678793          	addi	a5,a5,-1930 # ffffffffc0296888 <bigblocks>
ffffffffc020201a:	6398                	ld	a4,0(a5)
ffffffffc020201c:	e384                	sd	s1,0(a5)
ffffffffc020201e:	e898                	sd	a4,16(s1)
ffffffffc0202020:	c4dfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202024:	6480                	ld	s0,8(s1)
ffffffffc0202026:	60e2                	ld	ra,24(sp)
ffffffffc0202028:	64a2                	ld	s1,8(sp)
ffffffffc020202a:	8522                	mv	a0,s0
ffffffffc020202c:	6442                	ld	s0,16(sp)
ffffffffc020202e:	6902                	ld	s2,0(sp)
ffffffffc0202030:	6105                	addi	sp,sp,32
ffffffffc0202032:	8082                	ret
ffffffffc0202034:	45e1                	li	a1,24
ffffffffc0202036:	8526                	mv	a0,s1
ffffffffc0202038:	d25ff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc020203c:	b765                	j	ffffffffc0201fe4 <kmalloc+0x56>

ffffffffc020203e <kfree>:
ffffffffc020203e:	c169                	beqz	a0,ffffffffc0202100 <kfree+0xc2>
ffffffffc0202040:	1101                	addi	sp,sp,-32
ffffffffc0202042:	e822                	sd	s0,16(sp)
ffffffffc0202044:	ec06                	sd	ra,24(sp)
ffffffffc0202046:	e426                	sd	s1,8(sp)
ffffffffc0202048:	03451793          	slli	a5,a0,0x34
ffffffffc020204c:	842a                	mv	s0,a0
ffffffffc020204e:	e3d9                	bnez	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202050:	100027f3          	csrr	a5,sstatus
ffffffffc0202054:	8b89                	andi	a5,a5,2
ffffffffc0202056:	e7d9                	bnez	a5,ffffffffc02020e4 <kfree+0xa6>
ffffffffc0202058:	00095797          	auipc	a5,0x95
ffffffffc020205c:	8307b783          	ld	a5,-2000(a5) # ffffffffc0296888 <bigblocks>
ffffffffc0202060:	4601                	li	a2,0
ffffffffc0202062:	cbad                	beqz	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202064:	00095697          	auipc	a3,0x95
ffffffffc0202068:	82468693          	addi	a3,a3,-2012 # ffffffffc0296888 <bigblocks>
ffffffffc020206c:	a021                	j	ffffffffc0202074 <kfree+0x36>
ffffffffc020206e:	01048693          	addi	a3,s1,16
ffffffffc0202072:	c3a5                	beqz	a5,ffffffffc02020d2 <kfree+0x94>
ffffffffc0202074:	6798                	ld	a4,8(a5)
ffffffffc0202076:	84be                	mv	s1,a5
ffffffffc0202078:	6b9c                	ld	a5,16(a5)
ffffffffc020207a:	fe871ae3          	bne	a4,s0,ffffffffc020206e <kfree+0x30>
ffffffffc020207e:	e29c                	sd	a5,0(a3)
ffffffffc0202080:	ee2d                	bnez	a2,ffffffffc02020fa <kfree+0xbc>
ffffffffc0202082:	c02007b7          	lui	a5,0xc0200
ffffffffc0202086:	4098                	lw	a4,0(s1)
ffffffffc0202088:	08f46963          	bltu	s0,a5,ffffffffc020211a <kfree+0xdc>
ffffffffc020208c:	00095697          	auipc	a3,0x95
ffffffffc0202090:	82c6b683          	ld	a3,-2004(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202094:	8c15                	sub	s0,s0,a3
ffffffffc0202096:	8031                	srli	s0,s0,0xc
ffffffffc0202098:	00095797          	auipc	a5,0x95
ffffffffc020209c:	8087b783          	ld	a5,-2040(a5) # ffffffffc02968a0 <npage>
ffffffffc02020a0:	06f47163          	bgeu	s0,a5,ffffffffc0202102 <kfree+0xc4>
ffffffffc02020a4:	0000d517          	auipc	a0,0xd
ffffffffc02020a8:	6b453503          	ld	a0,1716(a0) # ffffffffc020f758 <nbase>
ffffffffc02020ac:	8c09                	sub	s0,s0,a0
ffffffffc02020ae:	041a                	slli	s0,s0,0x6
ffffffffc02020b0:	00094517          	auipc	a0,0x94
ffffffffc02020b4:	7f853503          	ld	a0,2040(a0) # ffffffffc02968a8 <pages>
ffffffffc02020b8:	4585                	li	a1,1
ffffffffc02020ba:	9522                	add	a0,a0,s0
ffffffffc02020bc:	00e595bb          	sllw	a1,a1,a4
ffffffffc02020c0:	0ea000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02020c4:	6442                	ld	s0,16(sp)
ffffffffc02020c6:	60e2                	ld	ra,24(sp)
ffffffffc02020c8:	8526                	mv	a0,s1
ffffffffc02020ca:	64a2                	ld	s1,8(sp)
ffffffffc02020cc:	45e1                	li	a1,24
ffffffffc02020ce:	6105                	addi	sp,sp,32
ffffffffc02020d0:	b171                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020d2:	e20d                	bnez	a2,ffffffffc02020f4 <kfree+0xb6>
ffffffffc02020d4:	ff040513          	addi	a0,s0,-16
ffffffffc02020d8:	6442                	ld	s0,16(sp)
ffffffffc02020da:	60e2                	ld	ra,24(sp)
ffffffffc02020dc:	64a2                	ld	s1,8(sp)
ffffffffc02020de:	4581                	li	a1,0
ffffffffc02020e0:	6105                	addi	sp,sp,32
ffffffffc02020e2:	b9ad                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020e4:	b8ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02020e8:	00094797          	auipc	a5,0x94
ffffffffc02020ec:	7a07b783          	ld	a5,1952(a5) # ffffffffc0296888 <bigblocks>
ffffffffc02020f0:	4605                	li	a2,1
ffffffffc02020f2:	fbad                	bnez	a5,ffffffffc0202064 <kfree+0x26>
ffffffffc02020f4:	b79fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020f8:	bff1                	j	ffffffffc02020d4 <kfree+0x96>
ffffffffc02020fa:	b73fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020fe:	b751                	j	ffffffffc0202082 <kfree+0x44>
ffffffffc0202100:	8082                	ret
ffffffffc0202102:	0000a617          	auipc	a2,0xa
ffffffffc0202106:	3e660613          	addi	a2,a2,998 # ffffffffc020c4e8 <default_pmm_manager+0x108>
ffffffffc020210a:	06900593          	li	a1,105
ffffffffc020210e:	0000a517          	auipc	a0,0xa
ffffffffc0202112:	33250513          	addi	a0,a0,818 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0202116:	b88fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020211a:	86a2                	mv	a3,s0
ffffffffc020211c:	0000a617          	auipc	a2,0xa
ffffffffc0202120:	3a460613          	addi	a2,a2,932 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc0202124:	07700593          	li	a1,119
ffffffffc0202128:	0000a517          	auipc	a0,0xa
ffffffffc020212c:	31850513          	addi	a0,a0,792 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0202130:	b6efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202134 <pa2page.part.0>:
ffffffffc0202134:	1141                	addi	sp,sp,-16
ffffffffc0202136:	0000a617          	auipc	a2,0xa
ffffffffc020213a:	3b260613          	addi	a2,a2,946 # ffffffffc020c4e8 <default_pmm_manager+0x108>
ffffffffc020213e:	06900593          	li	a1,105
ffffffffc0202142:	0000a517          	auipc	a0,0xa
ffffffffc0202146:	2fe50513          	addi	a0,a0,766 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc020214a:	e406                	sd	ra,8(sp)
ffffffffc020214c:	b52fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202150 <pte2page.part.0>:
ffffffffc0202150:	1141                	addi	sp,sp,-16
ffffffffc0202152:	0000a617          	auipc	a2,0xa
ffffffffc0202156:	3b660613          	addi	a2,a2,950 # ffffffffc020c508 <default_pmm_manager+0x128>
ffffffffc020215a:	07f00593          	li	a1,127
ffffffffc020215e:	0000a517          	auipc	a0,0xa
ffffffffc0202162:	2e250513          	addi	a0,a0,738 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0202166:	e406                	sd	ra,8(sp)
ffffffffc0202168:	b36fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020216c <alloc_pages>:
ffffffffc020216c:	100027f3          	csrr	a5,sstatus
ffffffffc0202170:	8b89                	andi	a5,a5,2
ffffffffc0202172:	e799                	bnez	a5,ffffffffc0202180 <alloc_pages+0x14>
ffffffffc0202174:	00094797          	auipc	a5,0x94
ffffffffc0202178:	73c7b783          	ld	a5,1852(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020217c:	6f9c                	ld	a5,24(a5)
ffffffffc020217e:	8782                	jr	a5
ffffffffc0202180:	1141                	addi	sp,sp,-16
ffffffffc0202182:	e406                	sd	ra,8(sp)
ffffffffc0202184:	e022                	sd	s0,0(sp)
ffffffffc0202186:	842a                	mv	s0,a0
ffffffffc0202188:	aebfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020218c:	00094797          	auipc	a5,0x94
ffffffffc0202190:	7247b783          	ld	a5,1828(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202194:	6f9c                	ld	a5,24(a5)
ffffffffc0202196:	8522                	mv	a0,s0
ffffffffc0202198:	9782                	jalr	a5
ffffffffc020219a:	842a                	mv	s0,a0
ffffffffc020219c:	ad1fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02021a0:	60a2                	ld	ra,8(sp)
ffffffffc02021a2:	8522                	mv	a0,s0
ffffffffc02021a4:	6402                	ld	s0,0(sp)
ffffffffc02021a6:	0141                	addi	sp,sp,16
ffffffffc02021a8:	8082                	ret

ffffffffc02021aa <free_pages>:
ffffffffc02021aa:	100027f3          	csrr	a5,sstatus
ffffffffc02021ae:	8b89                	andi	a5,a5,2
ffffffffc02021b0:	e799                	bnez	a5,ffffffffc02021be <free_pages+0x14>
ffffffffc02021b2:	00094797          	auipc	a5,0x94
ffffffffc02021b6:	6fe7b783          	ld	a5,1790(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021ba:	739c                	ld	a5,32(a5)
ffffffffc02021bc:	8782                	jr	a5
ffffffffc02021be:	1101                	addi	sp,sp,-32
ffffffffc02021c0:	ec06                	sd	ra,24(sp)
ffffffffc02021c2:	e822                	sd	s0,16(sp)
ffffffffc02021c4:	e426                	sd	s1,8(sp)
ffffffffc02021c6:	842a                	mv	s0,a0
ffffffffc02021c8:	84ae                	mv	s1,a1
ffffffffc02021ca:	aa9fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02021ce:	00094797          	auipc	a5,0x94
ffffffffc02021d2:	6e27b783          	ld	a5,1762(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021d6:	739c                	ld	a5,32(a5)
ffffffffc02021d8:	85a6                	mv	a1,s1
ffffffffc02021da:	8522                	mv	a0,s0
ffffffffc02021dc:	9782                	jalr	a5
ffffffffc02021de:	6442                	ld	s0,16(sp)
ffffffffc02021e0:	60e2                	ld	ra,24(sp)
ffffffffc02021e2:	64a2                	ld	s1,8(sp)
ffffffffc02021e4:	6105                	addi	sp,sp,32
ffffffffc02021e6:	a87fe06f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02021ea <nr_free_pages>:
ffffffffc02021ea:	100027f3          	csrr	a5,sstatus
ffffffffc02021ee:	8b89                	andi	a5,a5,2
ffffffffc02021f0:	e799                	bnez	a5,ffffffffc02021fe <nr_free_pages+0x14>
ffffffffc02021f2:	00094797          	auipc	a5,0x94
ffffffffc02021f6:	6be7b783          	ld	a5,1726(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021fa:	779c                	ld	a5,40(a5)
ffffffffc02021fc:	8782                	jr	a5
ffffffffc02021fe:	1141                	addi	sp,sp,-16
ffffffffc0202200:	e406                	sd	ra,8(sp)
ffffffffc0202202:	e022                	sd	s0,0(sp)
ffffffffc0202204:	a6ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202208:	00094797          	auipc	a5,0x94
ffffffffc020220c:	6a87b783          	ld	a5,1704(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202210:	779c                	ld	a5,40(a5)
ffffffffc0202212:	9782                	jalr	a5
ffffffffc0202214:	842a                	mv	s0,a0
ffffffffc0202216:	a57fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020221a:	60a2                	ld	ra,8(sp)
ffffffffc020221c:	8522                	mv	a0,s0
ffffffffc020221e:	6402                	ld	s0,0(sp)
ffffffffc0202220:	0141                	addi	sp,sp,16
ffffffffc0202222:	8082                	ret

ffffffffc0202224 <get_pte>:
ffffffffc0202224:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0202228:	1ff7f793          	andi	a5,a5,511
ffffffffc020222c:	7139                	addi	sp,sp,-64
ffffffffc020222e:	078e                	slli	a5,a5,0x3
ffffffffc0202230:	f426                	sd	s1,40(sp)
ffffffffc0202232:	00f504b3          	add	s1,a0,a5
ffffffffc0202236:	6094                	ld	a3,0(s1)
ffffffffc0202238:	f04a                	sd	s2,32(sp)
ffffffffc020223a:	ec4e                	sd	s3,24(sp)
ffffffffc020223c:	e852                	sd	s4,16(sp)
ffffffffc020223e:	fc06                	sd	ra,56(sp)
ffffffffc0202240:	f822                	sd	s0,48(sp)
ffffffffc0202242:	e456                	sd	s5,8(sp)
ffffffffc0202244:	e05a                	sd	s6,0(sp)
ffffffffc0202246:	0016f793          	andi	a5,a3,1
ffffffffc020224a:	892e                	mv	s2,a1
ffffffffc020224c:	8a32                	mv	s4,a2
ffffffffc020224e:	00094997          	auipc	s3,0x94
ffffffffc0202252:	65298993          	addi	s3,s3,1618 # ffffffffc02968a0 <npage>
ffffffffc0202256:	efbd                	bnez	a5,ffffffffc02022d4 <get_pte+0xb0>
ffffffffc0202258:	14060c63          	beqz	a2,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020225c:	100027f3          	csrr	a5,sstatus
ffffffffc0202260:	8b89                	andi	a5,a5,2
ffffffffc0202262:	14079963          	bnez	a5,ffffffffc02023b4 <get_pte+0x190>
ffffffffc0202266:	00094797          	auipc	a5,0x94
ffffffffc020226a:	64a7b783          	ld	a5,1610(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020226e:	6f9c                	ld	a5,24(a5)
ffffffffc0202270:	4505                	li	a0,1
ffffffffc0202272:	9782                	jalr	a5
ffffffffc0202274:	842a                	mv	s0,a0
ffffffffc0202276:	12040d63          	beqz	s0,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020227a:	00094b17          	auipc	s6,0x94
ffffffffc020227e:	62eb0b13          	addi	s6,s6,1582 # ffffffffc02968a8 <pages>
ffffffffc0202282:	000b3503          	ld	a0,0(s6)
ffffffffc0202286:	00080ab7          	lui	s5,0x80
ffffffffc020228a:	00094997          	auipc	s3,0x94
ffffffffc020228e:	61698993          	addi	s3,s3,1558 # ffffffffc02968a0 <npage>
ffffffffc0202292:	40a40533          	sub	a0,s0,a0
ffffffffc0202296:	8519                	srai	a0,a0,0x6
ffffffffc0202298:	9556                	add	a0,a0,s5
ffffffffc020229a:	0009b703          	ld	a4,0(s3)
ffffffffc020229e:	00c51793          	slli	a5,a0,0xc
ffffffffc02022a2:	4685                	li	a3,1
ffffffffc02022a4:	c014                	sw	a3,0(s0)
ffffffffc02022a6:	83b1                	srli	a5,a5,0xc
ffffffffc02022a8:	0532                	slli	a0,a0,0xc
ffffffffc02022aa:	16e7f763          	bgeu	a5,a4,ffffffffc0202418 <get_pte+0x1f4>
ffffffffc02022ae:	00094797          	auipc	a5,0x94
ffffffffc02022b2:	60a7b783          	ld	a5,1546(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022b6:	6605                	lui	a2,0x1
ffffffffc02022b8:	4581                	li	a1,0
ffffffffc02022ba:	953e                	add	a0,a0,a5
ffffffffc02022bc:	15a090ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc02022c0:	000b3683          	ld	a3,0(s6)
ffffffffc02022c4:	40d406b3          	sub	a3,s0,a3
ffffffffc02022c8:	8699                	srai	a3,a3,0x6
ffffffffc02022ca:	96d6                	add	a3,a3,s5
ffffffffc02022cc:	06aa                	slli	a3,a3,0xa
ffffffffc02022ce:	0116e693          	ori	a3,a3,17
ffffffffc02022d2:	e094                	sd	a3,0(s1)
ffffffffc02022d4:	77fd                	lui	a5,0xfffff
ffffffffc02022d6:	068a                	slli	a3,a3,0x2
ffffffffc02022d8:	0009b703          	ld	a4,0(s3)
ffffffffc02022dc:	8efd                	and	a3,a3,a5
ffffffffc02022de:	00c6d793          	srli	a5,a3,0xc
ffffffffc02022e2:	10e7ff63          	bgeu	a5,a4,ffffffffc0202400 <get_pte+0x1dc>
ffffffffc02022e6:	00094a97          	auipc	s5,0x94
ffffffffc02022ea:	5d2a8a93          	addi	s5,s5,1490 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022ee:	000ab403          	ld	s0,0(s5)
ffffffffc02022f2:	01595793          	srli	a5,s2,0x15
ffffffffc02022f6:	1ff7f793          	andi	a5,a5,511
ffffffffc02022fa:	96a2                	add	a3,a3,s0
ffffffffc02022fc:	00379413          	slli	s0,a5,0x3
ffffffffc0202300:	9436                	add	s0,s0,a3
ffffffffc0202302:	6014                	ld	a3,0(s0)
ffffffffc0202304:	0016f793          	andi	a5,a3,1
ffffffffc0202308:	ebad                	bnez	a5,ffffffffc020237a <get_pte+0x156>
ffffffffc020230a:	0a0a0363          	beqz	s4,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020230e:	100027f3          	csrr	a5,sstatus
ffffffffc0202312:	8b89                	andi	a5,a5,2
ffffffffc0202314:	efcd                	bnez	a5,ffffffffc02023ce <get_pte+0x1aa>
ffffffffc0202316:	00094797          	auipc	a5,0x94
ffffffffc020231a:	59a7b783          	ld	a5,1434(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020231e:	6f9c                	ld	a5,24(a5)
ffffffffc0202320:	4505                	li	a0,1
ffffffffc0202322:	9782                	jalr	a5
ffffffffc0202324:	84aa                	mv	s1,a0
ffffffffc0202326:	c4c9                	beqz	s1,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc0202328:	00094b17          	auipc	s6,0x94
ffffffffc020232c:	580b0b13          	addi	s6,s6,1408 # ffffffffc02968a8 <pages>
ffffffffc0202330:	000b3503          	ld	a0,0(s6)
ffffffffc0202334:	00080a37          	lui	s4,0x80
ffffffffc0202338:	0009b703          	ld	a4,0(s3)
ffffffffc020233c:	40a48533          	sub	a0,s1,a0
ffffffffc0202340:	8519                	srai	a0,a0,0x6
ffffffffc0202342:	9552                	add	a0,a0,s4
ffffffffc0202344:	00c51793          	slli	a5,a0,0xc
ffffffffc0202348:	4685                	li	a3,1
ffffffffc020234a:	c094                	sw	a3,0(s1)
ffffffffc020234c:	83b1                	srli	a5,a5,0xc
ffffffffc020234e:	0532                	slli	a0,a0,0xc
ffffffffc0202350:	0ee7f163          	bgeu	a5,a4,ffffffffc0202432 <get_pte+0x20e>
ffffffffc0202354:	000ab783          	ld	a5,0(s5)
ffffffffc0202358:	6605                	lui	a2,0x1
ffffffffc020235a:	4581                	li	a1,0
ffffffffc020235c:	953e                	add	a0,a0,a5
ffffffffc020235e:	0b8090ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0202362:	000b3683          	ld	a3,0(s6)
ffffffffc0202366:	40d486b3          	sub	a3,s1,a3
ffffffffc020236a:	8699                	srai	a3,a3,0x6
ffffffffc020236c:	96d2                	add	a3,a3,s4
ffffffffc020236e:	06aa                	slli	a3,a3,0xa
ffffffffc0202370:	0116e693          	ori	a3,a3,17
ffffffffc0202374:	e014                	sd	a3,0(s0)
ffffffffc0202376:	0009b703          	ld	a4,0(s3)
ffffffffc020237a:	068a                	slli	a3,a3,0x2
ffffffffc020237c:	757d                	lui	a0,0xfffff
ffffffffc020237e:	8ee9                	and	a3,a3,a0
ffffffffc0202380:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202384:	06e7f263          	bgeu	a5,a4,ffffffffc02023e8 <get_pte+0x1c4>
ffffffffc0202388:	000ab503          	ld	a0,0(s5)
ffffffffc020238c:	00c95913          	srli	s2,s2,0xc
ffffffffc0202390:	1ff97913          	andi	s2,s2,511
ffffffffc0202394:	96aa                	add	a3,a3,a0
ffffffffc0202396:	00391513          	slli	a0,s2,0x3
ffffffffc020239a:	9536                	add	a0,a0,a3
ffffffffc020239c:	70e2                	ld	ra,56(sp)
ffffffffc020239e:	7442                	ld	s0,48(sp)
ffffffffc02023a0:	74a2                	ld	s1,40(sp)
ffffffffc02023a2:	7902                	ld	s2,32(sp)
ffffffffc02023a4:	69e2                	ld	s3,24(sp)
ffffffffc02023a6:	6a42                	ld	s4,16(sp)
ffffffffc02023a8:	6aa2                	ld	s5,8(sp)
ffffffffc02023aa:	6b02                	ld	s6,0(sp)
ffffffffc02023ac:	6121                	addi	sp,sp,64
ffffffffc02023ae:	8082                	ret
ffffffffc02023b0:	4501                	li	a0,0
ffffffffc02023b2:	b7ed                	j	ffffffffc020239c <get_pte+0x178>
ffffffffc02023b4:	8bffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023b8:	00094797          	auipc	a5,0x94
ffffffffc02023bc:	4f87b783          	ld	a5,1272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023c0:	6f9c                	ld	a5,24(a5)
ffffffffc02023c2:	4505                	li	a0,1
ffffffffc02023c4:	9782                	jalr	a5
ffffffffc02023c6:	842a                	mv	s0,a0
ffffffffc02023c8:	8a5fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023cc:	b56d                	j	ffffffffc0202276 <get_pte+0x52>
ffffffffc02023ce:	8a5fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023d2:	00094797          	auipc	a5,0x94
ffffffffc02023d6:	4de7b783          	ld	a5,1246(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023da:	6f9c                	ld	a5,24(a5)
ffffffffc02023dc:	4505                	li	a0,1
ffffffffc02023de:	9782                	jalr	a5
ffffffffc02023e0:	84aa                	mv	s1,a0
ffffffffc02023e2:	88bfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023e6:	b781                	j	ffffffffc0202326 <get_pte+0x102>
ffffffffc02023e8:	0000a617          	auipc	a2,0xa
ffffffffc02023ec:	03060613          	addi	a2,a2,48 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc02023f0:	13200593          	li	a1,306
ffffffffc02023f4:	0000a517          	auipc	a0,0xa
ffffffffc02023f8:	13c50513          	addi	a0,a0,316 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02023fc:	8a2fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202400:	0000a617          	auipc	a2,0xa
ffffffffc0202404:	01860613          	addi	a2,a2,24 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc0202408:	12500593          	li	a1,293
ffffffffc020240c:	0000a517          	auipc	a0,0xa
ffffffffc0202410:	12450513          	addi	a0,a0,292 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0202414:	88afe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202418:	86aa                	mv	a3,a0
ffffffffc020241a:	0000a617          	auipc	a2,0xa
ffffffffc020241e:	ffe60613          	addi	a2,a2,-2 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc0202422:	12100593          	li	a1,289
ffffffffc0202426:	0000a517          	auipc	a0,0xa
ffffffffc020242a:	10a50513          	addi	a0,a0,266 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020242e:	870fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202432:	86aa                	mv	a3,a0
ffffffffc0202434:	0000a617          	auipc	a2,0xa
ffffffffc0202438:	fe460613          	addi	a2,a2,-28 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc020243c:	12f00593          	li	a1,303
ffffffffc0202440:	0000a517          	auipc	a0,0xa
ffffffffc0202444:	0f050513          	addi	a0,a0,240 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0202448:	856fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020244c <boot_map_segment>:
ffffffffc020244c:	6785                	lui	a5,0x1
ffffffffc020244e:	7139                	addi	sp,sp,-64
ffffffffc0202450:	00d5c833          	xor	a6,a1,a3
ffffffffc0202454:	17fd                	addi	a5,a5,-1
ffffffffc0202456:	fc06                	sd	ra,56(sp)
ffffffffc0202458:	f822                	sd	s0,48(sp)
ffffffffc020245a:	f426                	sd	s1,40(sp)
ffffffffc020245c:	f04a                	sd	s2,32(sp)
ffffffffc020245e:	ec4e                	sd	s3,24(sp)
ffffffffc0202460:	e852                	sd	s4,16(sp)
ffffffffc0202462:	e456                	sd	s5,8(sp)
ffffffffc0202464:	00f87833          	and	a6,a6,a5
ffffffffc0202468:	08081563          	bnez	a6,ffffffffc02024f2 <boot_map_segment+0xa6>
ffffffffc020246c:	00f5f4b3          	and	s1,a1,a5
ffffffffc0202470:	963e                	add	a2,a2,a5
ffffffffc0202472:	94b2                	add	s1,s1,a2
ffffffffc0202474:	797d                	lui	s2,0xfffff
ffffffffc0202476:	80b1                	srli	s1,s1,0xc
ffffffffc0202478:	0125f5b3          	and	a1,a1,s2
ffffffffc020247c:	0126f6b3          	and	a3,a3,s2
ffffffffc0202480:	c0a1                	beqz	s1,ffffffffc02024c0 <boot_map_segment+0x74>
ffffffffc0202482:	00176713          	ori	a4,a4,1
ffffffffc0202486:	04b2                	slli	s1,s1,0xc
ffffffffc0202488:	02071993          	slli	s3,a4,0x20
ffffffffc020248c:	8a2a                	mv	s4,a0
ffffffffc020248e:	842e                	mv	s0,a1
ffffffffc0202490:	94ae                	add	s1,s1,a1
ffffffffc0202492:	40b68933          	sub	s2,a3,a1
ffffffffc0202496:	0209d993          	srli	s3,s3,0x20
ffffffffc020249a:	6a85                	lui	s5,0x1
ffffffffc020249c:	4605                	li	a2,1
ffffffffc020249e:	85a2                	mv	a1,s0
ffffffffc02024a0:	8552                	mv	a0,s4
ffffffffc02024a2:	d83ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02024a6:	008907b3          	add	a5,s2,s0
ffffffffc02024aa:	c505                	beqz	a0,ffffffffc02024d2 <boot_map_segment+0x86>
ffffffffc02024ac:	83b1                	srli	a5,a5,0xc
ffffffffc02024ae:	07aa                	slli	a5,a5,0xa
ffffffffc02024b0:	0137e7b3          	or	a5,a5,s3
ffffffffc02024b4:	0017e793          	ori	a5,a5,1
ffffffffc02024b8:	e11c                	sd	a5,0(a0)
ffffffffc02024ba:	9456                	add	s0,s0,s5
ffffffffc02024bc:	fe8490e3          	bne	s1,s0,ffffffffc020249c <boot_map_segment+0x50>
ffffffffc02024c0:	70e2                	ld	ra,56(sp)
ffffffffc02024c2:	7442                	ld	s0,48(sp)
ffffffffc02024c4:	74a2                	ld	s1,40(sp)
ffffffffc02024c6:	7902                	ld	s2,32(sp)
ffffffffc02024c8:	69e2                	ld	s3,24(sp)
ffffffffc02024ca:	6a42                	ld	s4,16(sp)
ffffffffc02024cc:	6aa2                	ld	s5,8(sp)
ffffffffc02024ce:	6121                	addi	sp,sp,64
ffffffffc02024d0:	8082                	ret
ffffffffc02024d2:	0000a697          	auipc	a3,0xa
ffffffffc02024d6:	08668693          	addi	a3,a3,134 # ffffffffc020c558 <default_pmm_manager+0x178>
ffffffffc02024da:	00009617          	auipc	a2,0x9
ffffffffc02024de:	41e60613          	addi	a2,a2,1054 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02024e2:	09c00593          	li	a1,156
ffffffffc02024e6:	0000a517          	auipc	a0,0xa
ffffffffc02024ea:	04a50513          	addi	a0,a0,74 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02024ee:	fb1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024f2:	0000a697          	auipc	a3,0xa
ffffffffc02024f6:	04e68693          	addi	a3,a3,78 # ffffffffc020c540 <default_pmm_manager+0x160>
ffffffffc02024fa:	00009617          	auipc	a2,0x9
ffffffffc02024fe:	3fe60613          	addi	a2,a2,1022 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0202502:	09500593          	li	a1,149
ffffffffc0202506:	0000a517          	auipc	a0,0xa
ffffffffc020250a:	02a50513          	addi	a0,a0,42 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020250e:	f91fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202512 <get_page>:
ffffffffc0202512:	1141                	addi	sp,sp,-16
ffffffffc0202514:	e022                	sd	s0,0(sp)
ffffffffc0202516:	8432                	mv	s0,a2
ffffffffc0202518:	4601                	li	a2,0
ffffffffc020251a:	e406                	sd	ra,8(sp)
ffffffffc020251c:	d09ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202520:	c011                	beqz	s0,ffffffffc0202524 <get_page+0x12>
ffffffffc0202522:	e008                	sd	a0,0(s0)
ffffffffc0202524:	c511                	beqz	a0,ffffffffc0202530 <get_page+0x1e>
ffffffffc0202526:	611c                	ld	a5,0(a0)
ffffffffc0202528:	4501                	li	a0,0
ffffffffc020252a:	0017f713          	andi	a4,a5,1
ffffffffc020252e:	e709                	bnez	a4,ffffffffc0202538 <get_page+0x26>
ffffffffc0202530:	60a2                	ld	ra,8(sp)
ffffffffc0202532:	6402                	ld	s0,0(sp)
ffffffffc0202534:	0141                	addi	sp,sp,16
ffffffffc0202536:	8082                	ret
ffffffffc0202538:	078a                	slli	a5,a5,0x2
ffffffffc020253a:	83b1                	srli	a5,a5,0xc
ffffffffc020253c:	00094717          	auipc	a4,0x94
ffffffffc0202540:	36473703          	ld	a4,868(a4) # ffffffffc02968a0 <npage>
ffffffffc0202544:	00e7ff63          	bgeu	a5,a4,ffffffffc0202562 <get_page+0x50>
ffffffffc0202548:	60a2                	ld	ra,8(sp)
ffffffffc020254a:	6402                	ld	s0,0(sp)
ffffffffc020254c:	fff80537          	lui	a0,0xfff80
ffffffffc0202550:	97aa                	add	a5,a5,a0
ffffffffc0202552:	079a                	slli	a5,a5,0x6
ffffffffc0202554:	00094517          	auipc	a0,0x94
ffffffffc0202558:	35453503          	ld	a0,852(a0) # ffffffffc02968a8 <pages>
ffffffffc020255c:	953e                	add	a0,a0,a5
ffffffffc020255e:	0141                	addi	sp,sp,16
ffffffffc0202560:	8082                	ret
ffffffffc0202562:	bd3ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202566 <unmap_range>:
ffffffffc0202566:	7159                	addi	sp,sp,-112
ffffffffc0202568:	00c5e7b3          	or	a5,a1,a2
ffffffffc020256c:	f486                	sd	ra,104(sp)
ffffffffc020256e:	f0a2                	sd	s0,96(sp)
ffffffffc0202570:	eca6                	sd	s1,88(sp)
ffffffffc0202572:	e8ca                	sd	s2,80(sp)
ffffffffc0202574:	e4ce                	sd	s3,72(sp)
ffffffffc0202576:	e0d2                	sd	s4,64(sp)
ffffffffc0202578:	fc56                	sd	s5,56(sp)
ffffffffc020257a:	f85a                	sd	s6,48(sp)
ffffffffc020257c:	f45e                	sd	s7,40(sp)
ffffffffc020257e:	f062                	sd	s8,32(sp)
ffffffffc0202580:	ec66                	sd	s9,24(sp)
ffffffffc0202582:	e86a                	sd	s10,16(sp)
ffffffffc0202584:	17d2                	slli	a5,a5,0x34
ffffffffc0202586:	e3ed                	bnez	a5,ffffffffc0202668 <unmap_range+0x102>
ffffffffc0202588:	002007b7          	lui	a5,0x200
ffffffffc020258c:	842e                	mv	s0,a1
ffffffffc020258e:	0ef5ed63          	bltu	a1,a5,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202592:	8932                	mv	s2,a2
ffffffffc0202594:	0ec5fa63          	bgeu	a1,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202598:	4785                	li	a5,1
ffffffffc020259a:	07fe                	slli	a5,a5,0x1f
ffffffffc020259c:	0ec7e663          	bltu	a5,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc02025a0:	89aa                	mv	s3,a0
ffffffffc02025a2:	6a05                	lui	s4,0x1
ffffffffc02025a4:	00094c97          	auipc	s9,0x94
ffffffffc02025a8:	2fcc8c93          	addi	s9,s9,764 # ffffffffc02968a0 <npage>
ffffffffc02025ac:	00094c17          	auipc	s8,0x94
ffffffffc02025b0:	2fcc0c13          	addi	s8,s8,764 # ffffffffc02968a8 <pages>
ffffffffc02025b4:	fff80bb7          	lui	s7,0xfff80
ffffffffc02025b8:	00094d17          	auipc	s10,0x94
ffffffffc02025bc:	2f8d0d13          	addi	s10,s10,760 # ffffffffc02968b0 <pmm_manager>
ffffffffc02025c0:	00200b37          	lui	s6,0x200
ffffffffc02025c4:	ffe00ab7          	lui	s5,0xffe00
ffffffffc02025c8:	4601                	li	a2,0
ffffffffc02025ca:	85a2                	mv	a1,s0
ffffffffc02025cc:	854e                	mv	a0,s3
ffffffffc02025ce:	c57ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02025d2:	84aa                	mv	s1,a0
ffffffffc02025d4:	cd29                	beqz	a0,ffffffffc020262e <unmap_range+0xc8>
ffffffffc02025d6:	611c                	ld	a5,0(a0)
ffffffffc02025d8:	e395                	bnez	a5,ffffffffc02025fc <unmap_range+0x96>
ffffffffc02025da:	9452                	add	s0,s0,s4
ffffffffc02025dc:	ff2466e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc02025e0:	70a6                	ld	ra,104(sp)
ffffffffc02025e2:	7406                	ld	s0,96(sp)
ffffffffc02025e4:	64e6                	ld	s1,88(sp)
ffffffffc02025e6:	6946                	ld	s2,80(sp)
ffffffffc02025e8:	69a6                	ld	s3,72(sp)
ffffffffc02025ea:	6a06                	ld	s4,64(sp)
ffffffffc02025ec:	7ae2                	ld	s5,56(sp)
ffffffffc02025ee:	7b42                	ld	s6,48(sp)
ffffffffc02025f0:	7ba2                	ld	s7,40(sp)
ffffffffc02025f2:	7c02                	ld	s8,32(sp)
ffffffffc02025f4:	6ce2                	ld	s9,24(sp)
ffffffffc02025f6:	6d42                	ld	s10,16(sp)
ffffffffc02025f8:	6165                	addi	sp,sp,112
ffffffffc02025fa:	8082                	ret
ffffffffc02025fc:	0017f713          	andi	a4,a5,1
ffffffffc0202600:	df69                	beqz	a4,ffffffffc02025da <unmap_range+0x74>
ffffffffc0202602:	000cb703          	ld	a4,0(s9)
ffffffffc0202606:	078a                	slli	a5,a5,0x2
ffffffffc0202608:	83b1                	srli	a5,a5,0xc
ffffffffc020260a:	08e7ff63          	bgeu	a5,a4,ffffffffc02026a8 <unmap_range+0x142>
ffffffffc020260e:	000c3503          	ld	a0,0(s8)
ffffffffc0202612:	97de                	add	a5,a5,s7
ffffffffc0202614:	079a                	slli	a5,a5,0x6
ffffffffc0202616:	953e                	add	a0,a0,a5
ffffffffc0202618:	411c                	lw	a5,0(a0)
ffffffffc020261a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020261e:	c118                	sw	a4,0(a0)
ffffffffc0202620:	cf11                	beqz	a4,ffffffffc020263c <unmap_range+0xd6>
ffffffffc0202622:	0004b023          	sd	zero,0(s1)
ffffffffc0202626:	12040073          	sfence.vma	s0
ffffffffc020262a:	9452                	add	s0,s0,s4
ffffffffc020262c:	bf45                	j	ffffffffc02025dc <unmap_range+0x76>
ffffffffc020262e:	945a                	add	s0,s0,s6
ffffffffc0202630:	01547433          	and	s0,s0,s5
ffffffffc0202634:	d455                	beqz	s0,ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc0202636:	f92469e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc020263a:	b75d                	j	ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc020263c:	100027f3          	csrr	a5,sstatus
ffffffffc0202640:	8b89                	andi	a5,a5,2
ffffffffc0202642:	e799                	bnez	a5,ffffffffc0202650 <unmap_range+0xea>
ffffffffc0202644:	000d3783          	ld	a5,0(s10)
ffffffffc0202648:	4585                	li	a1,1
ffffffffc020264a:	739c                	ld	a5,32(a5)
ffffffffc020264c:	9782                	jalr	a5
ffffffffc020264e:	bfd1                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202650:	e42a                	sd	a0,8(sp)
ffffffffc0202652:	e20fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202656:	000d3783          	ld	a5,0(s10)
ffffffffc020265a:	6522                	ld	a0,8(sp)
ffffffffc020265c:	4585                	li	a1,1
ffffffffc020265e:	739c                	ld	a5,32(a5)
ffffffffc0202660:	9782                	jalr	a5
ffffffffc0202662:	e0afe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202666:	bf75                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202668:	0000a697          	auipc	a3,0xa
ffffffffc020266c:	f0068693          	addi	a3,a3,-256 # ffffffffc020c568 <default_pmm_manager+0x188>
ffffffffc0202670:	00009617          	auipc	a2,0x9
ffffffffc0202674:	28860613          	addi	a2,a2,648 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0202678:	15a00593          	li	a1,346
ffffffffc020267c:	0000a517          	auipc	a0,0xa
ffffffffc0202680:	eb450513          	addi	a0,a0,-332 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0202684:	e1bfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202688:	0000a697          	auipc	a3,0xa
ffffffffc020268c:	f1068693          	addi	a3,a3,-240 # ffffffffc020c598 <default_pmm_manager+0x1b8>
ffffffffc0202690:	00009617          	auipc	a2,0x9
ffffffffc0202694:	26860613          	addi	a2,a2,616 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0202698:	15b00593          	li	a1,347
ffffffffc020269c:	0000a517          	auipc	a0,0xa
ffffffffc02026a0:	e9450513          	addi	a0,a0,-364 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02026a4:	dfbfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02026a8:	a8dff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02026ac <exit_range>:
ffffffffc02026ac:	7119                	addi	sp,sp,-128
ffffffffc02026ae:	00c5e7b3          	or	a5,a1,a2
ffffffffc02026b2:	fc86                	sd	ra,120(sp)
ffffffffc02026b4:	f8a2                	sd	s0,112(sp)
ffffffffc02026b6:	f4a6                	sd	s1,104(sp)
ffffffffc02026b8:	f0ca                	sd	s2,96(sp)
ffffffffc02026ba:	ecce                	sd	s3,88(sp)
ffffffffc02026bc:	e8d2                	sd	s4,80(sp)
ffffffffc02026be:	e4d6                	sd	s5,72(sp)
ffffffffc02026c0:	e0da                	sd	s6,64(sp)
ffffffffc02026c2:	fc5e                	sd	s7,56(sp)
ffffffffc02026c4:	f862                	sd	s8,48(sp)
ffffffffc02026c6:	f466                	sd	s9,40(sp)
ffffffffc02026c8:	f06a                	sd	s10,32(sp)
ffffffffc02026ca:	ec6e                	sd	s11,24(sp)
ffffffffc02026cc:	17d2                	slli	a5,a5,0x34
ffffffffc02026ce:	20079a63          	bnez	a5,ffffffffc02028e2 <exit_range+0x236>
ffffffffc02026d2:	002007b7          	lui	a5,0x200
ffffffffc02026d6:	24f5e463          	bltu	a1,a5,ffffffffc020291e <exit_range+0x272>
ffffffffc02026da:	8ab2                	mv	s5,a2
ffffffffc02026dc:	24c5f163          	bgeu	a1,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e0:	4785                	li	a5,1
ffffffffc02026e2:	07fe                	slli	a5,a5,0x1f
ffffffffc02026e4:	22c7ed63          	bltu	a5,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e8:	c00009b7          	lui	s3,0xc0000
ffffffffc02026ec:	0135f9b3          	and	s3,a1,s3
ffffffffc02026f0:	ffe00937          	lui	s2,0xffe00
ffffffffc02026f4:	400007b7          	lui	a5,0x40000
ffffffffc02026f8:	5cfd                	li	s9,-1
ffffffffc02026fa:	8c2a                	mv	s8,a0
ffffffffc02026fc:	0125f933          	and	s2,a1,s2
ffffffffc0202700:	99be                	add	s3,s3,a5
ffffffffc0202702:	00094d17          	auipc	s10,0x94
ffffffffc0202706:	19ed0d13          	addi	s10,s10,414 # ffffffffc02968a0 <npage>
ffffffffc020270a:	00ccdc93          	srli	s9,s9,0xc
ffffffffc020270e:	00094717          	auipc	a4,0x94
ffffffffc0202712:	19a70713          	addi	a4,a4,410 # ffffffffc02968a8 <pages>
ffffffffc0202716:	00094d97          	auipc	s11,0x94
ffffffffc020271a:	19ad8d93          	addi	s11,s11,410 # ffffffffc02968b0 <pmm_manager>
ffffffffc020271e:	c0000437          	lui	s0,0xc0000
ffffffffc0202722:	944e                	add	s0,s0,s3
ffffffffc0202724:	8079                	srli	s0,s0,0x1e
ffffffffc0202726:	1ff47413          	andi	s0,s0,511
ffffffffc020272a:	040e                	slli	s0,s0,0x3
ffffffffc020272c:	9462                	add	s0,s0,s8
ffffffffc020272e:	00043a03          	ld	s4,0(s0) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202732:	001a7793          	andi	a5,s4,1
ffffffffc0202736:	eb99                	bnez	a5,ffffffffc020274c <exit_range+0xa0>
ffffffffc0202738:	12098463          	beqz	s3,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc020273c:	400007b7          	lui	a5,0x40000
ffffffffc0202740:	97ce                	add	a5,a5,s3
ffffffffc0202742:	894e                	mv	s2,s3
ffffffffc0202744:	1159fe63          	bgeu	s3,s5,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc0202748:	89be                	mv	s3,a5
ffffffffc020274a:	bfd1                	j	ffffffffc020271e <exit_range+0x72>
ffffffffc020274c:	000d3783          	ld	a5,0(s10)
ffffffffc0202750:	0a0a                	slli	s4,s4,0x2
ffffffffc0202752:	00ca5a13          	srli	s4,s4,0xc
ffffffffc0202756:	1cfa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020275a:	fff80637          	lui	a2,0xfff80
ffffffffc020275e:	9652                	add	a2,a2,s4
ffffffffc0202760:	000806b7          	lui	a3,0x80
ffffffffc0202764:	96b2                	add	a3,a3,a2
ffffffffc0202766:	0196f5b3          	and	a1,a3,s9
ffffffffc020276a:	061a                	slli	a2,a2,0x6
ffffffffc020276c:	06b2                	slli	a3,a3,0xc
ffffffffc020276e:	18f5fa63          	bgeu	a1,a5,ffffffffc0202902 <exit_range+0x256>
ffffffffc0202772:	00094817          	auipc	a6,0x94
ffffffffc0202776:	14680813          	addi	a6,a6,326 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020277a:	00083b03          	ld	s6,0(a6)
ffffffffc020277e:	4b85                	li	s7,1
ffffffffc0202780:	fff80e37          	lui	t3,0xfff80
ffffffffc0202784:	9b36                	add	s6,s6,a3
ffffffffc0202786:	00080337          	lui	t1,0x80
ffffffffc020278a:	6885                	lui	a7,0x1
ffffffffc020278c:	a819                	j	ffffffffc02027a2 <exit_range+0xf6>
ffffffffc020278e:	4b81                	li	s7,0
ffffffffc0202790:	002007b7          	lui	a5,0x200
ffffffffc0202794:	993e                	add	s2,s2,a5
ffffffffc0202796:	08090c63          	beqz	s2,ffffffffc020282e <exit_range+0x182>
ffffffffc020279a:	09397a63          	bgeu	s2,s3,ffffffffc020282e <exit_range+0x182>
ffffffffc020279e:	0f597063          	bgeu	s2,s5,ffffffffc020287e <exit_range+0x1d2>
ffffffffc02027a2:	01595493          	srli	s1,s2,0x15
ffffffffc02027a6:	1ff4f493          	andi	s1,s1,511
ffffffffc02027aa:	048e                	slli	s1,s1,0x3
ffffffffc02027ac:	94da                	add	s1,s1,s6
ffffffffc02027ae:	609c                	ld	a5,0(s1)
ffffffffc02027b0:	0017f693          	andi	a3,a5,1
ffffffffc02027b4:	dee9                	beqz	a3,ffffffffc020278e <exit_range+0xe2>
ffffffffc02027b6:	000d3583          	ld	a1,0(s10)
ffffffffc02027ba:	078a                	slli	a5,a5,0x2
ffffffffc02027bc:	83b1                	srli	a5,a5,0xc
ffffffffc02027be:	14b7fe63          	bgeu	a5,a1,ffffffffc020291a <exit_range+0x26e>
ffffffffc02027c2:	97f2                	add	a5,a5,t3
ffffffffc02027c4:	006786b3          	add	a3,a5,t1
ffffffffc02027c8:	0196feb3          	and	t4,a3,s9
ffffffffc02027cc:	00679513          	slli	a0,a5,0x6
ffffffffc02027d0:	06b2                	slli	a3,a3,0xc
ffffffffc02027d2:	12bef863          	bgeu	t4,a1,ffffffffc0202902 <exit_range+0x256>
ffffffffc02027d6:	00083783          	ld	a5,0(a6)
ffffffffc02027da:	96be                	add	a3,a3,a5
ffffffffc02027dc:	011685b3          	add	a1,a3,a7
ffffffffc02027e0:	629c                	ld	a5,0(a3)
ffffffffc02027e2:	8b85                	andi	a5,a5,1
ffffffffc02027e4:	f7d5                	bnez	a5,ffffffffc0202790 <exit_range+0xe4>
ffffffffc02027e6:	06a1                	addi	a3,a3,8
ffffffffc02027e8:	fed59ce3          	bne	a1,a3,ffffffffc02027e0 <exit_range+0x134>
ffffffffc02027ec:	631c                	ld	a5,0(a4)
ffffffffc02027ee:	953e                	add	a0,a0,a5
ffffffffc02027f0:	100027f3          	csrr	a5,sstatus
ffffffffc02027f4:	8b89                	andi	a5,a5,2
ffffffffc02027f6:	e7d9                	bnez	a5,ffffffffc0202884 <exit_range+0x1d8>
ffffffffc02027f8:	000db783          	ld	a5,0(s11)
ffffffffc02027fc:	4585                	li	a1,1
ffffffffc02027fe:	e032                	sd	a2,0(sp)
ffffffffc0202800:	739c                	ld	a5,32(a5)
ffffffffc0202802:	9782                	jalr	a5
ffffffffc0202804:	6602                	ld	a2,0(sp)
ffffffffc0202806:	00094817          	auipc	a6,0x94
ffffffffc020280a:	0b280813          	addi	a6,a6,178 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020280e:	fff80e37          	lui	t3,0xfff80
ffffffffc0202812:	00080337          	lui	t1,0x80
ffffffffc0202816:	6885                	lui	a7,0x1
ffffffffc0202818:	00094717          	auipc	a4,0x94
ffffffffc020281c:	09070713          	addi	a4,a4,144 # ffffffffc02968a8 <pages>
ffffffffc0202820:	0004b023          	sd	zero,0(s1)
ffffffffc0202824:	002007b7          	lui	a5,0x200
ffffffffc0202828:	993e                	add	s2,s2,a5
ffffffffc020282a:	f60918e3          	bnez	s2,ffffffffc020279a <exit_range+0xee>
ffffffffc020282e:	f00b85e3          	beqz	s7,ffffffffc0202738 <exit_range+0x8c>
ffffffffc0202832:	000d3783          	ld	a5,0(s10)
ffffffffc0202836:	0efa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020283a:	6308                	ld	a0,0(a4)
ffffffffc020283c:	9532                	add	a0,a0,a2
ffffffffc020283e:	100027f3          	csrr	a5,sstatus
ffffffffc0202842:	8b89                	andi	a5,a5,2
ffffffffc0202844:	efad                	bnez	a5,ffffffffc02028be <exit_range+0x212>
ffffffffc0202846:	000db783          	ld	a5,0(s11)
ffffffffc020284a:	4585                	li	a1,1
ffffffffc020284c:	739c                	ld	a5,32(a5)
ffffffffc020284e:	9782                	jalr	a5
ffffffffc0202850:	00094717          	auipc	a4,0x94
ffffffffc0202854:	05870713          	addi	a4,a4,88 # ffffffffc02968a8 <pages>
ffffffffc0202858:	00043023          	sd	zero,0(s0)
ffffffffc020285c:	ee0990e3          	bnez	s3,ffffffffc020273c <exit_range+0x90>
ffffffffc0202860:	70e6                	ld	ra,120(sp)
ffffffffc0202862:	7446                	ld	s0,112(sp)
ffffffffc0202864:	74a6                	ld	s1,104(sp)
ffffffffc0202866:	7906                	ld	s2,96(sp)
ffffffffc0202868:	69e6                	ld	s3,88(sp)
ffffffffc020286a:	6a46                	ld	s4,80(sp)
ffffffffc020286c:	6aa6                	ld	s5,72(sp)
ffffffffc020286e:	6b06                	ld	s6,64(sp)
ffffffffc0202870:	7be2                	ld	s7,56(sp)
ffffffffc0202872:	7c42                	ld	s8,48(sp)
ffffffffc0202874:	7ca2                	ld	s9,40(sp)
ffffffffc0202876:	7d02                	ld	s10,32(sp)
ffffffffc0202878:	6de2                	ld	s11,24(sp)
ffffffffc020287a:	6109                	addi	sp,sp,128
ffffffffc020287c:	8082                	ret
ffffffffc020287e:	ea0b8fe3          	beqz	s7,ffffffffc020273c <exit_range+0x90>
ffffffffc0202882:	bf45                	j	ffffffffc0202832 <exit_range+0x186>
ffffffffc0202884:	e032                	sd	a2,0(sp)
ffffffffc0202886:	e42a                	sd	a0,8(sp)
ffffffffc0202888:	beafe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020288c:	000db783          	ld	a5,0(s11)
ffffffffc0202890:	6522                	ld	a0,8(sp)
ffffffffc0202892:	4585                	li	a1,1
ffffffffc0202894:	739c                	ld	a5,32(a5)
ffffffffc0202896:	9782                	jalr	a5
ffffffffc0202898:	bd4fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020289c:	6602                	ld	a2,0(sp)
ffffffffc020289e:	00094717          	auipc	a4,0x94
ffffffffc02028a2:	00a70713          	addi	a4,a4,10 # ffffffffc02968a8 <pages>
ffffffffc02028a6:	6885                	lui	a7,0x1
ffffffffc02028a8:	00080337          	lui	t1,0x80
ffffffffc02028ac:	fff80e37          	lui	t3,0xfff80
ffffffffc02028b0:	00094817          	auipc	a6,0x94
ffffffffc02028b4:	00880813          	addi	a6,a6,8 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02028b8:	0004b023          	sd	zero,0(s1)
ffffffffc02028bc:	b7a5                	j	ffffffffc0202824 <exit_range+0x178>
ffffffffc02028be:	e02a                	sd	a0,0(sp)
ffffffffc02028c0:	bb2fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02028c4:	000db783          	ld	a5,0(s11)
ffffffffc02028c8:	6502                	ld	a0,0(sp)
ffffffffc02028ca:	4585                	li	a1,1
ffffffffc02028cc:	739c                	ld	a5,32(a5)
ffffffffc02028ce:	9782                	jalr	a5
ffffffffc02028d0:	b9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02028d4:	00094717          	auipc	a4,0x94
ffffffffc02028d8:	fd470713          	addi	a4,a4,-44 # ffffffffc02968a8 <pages>
ffffffffc02028dc:	00043023          	sd	zero,0(s0)
ffffffffc02028e0:	bfb5                	j	ffffffffc020285c <exit_range+0x1b0>
ffffffffc02028e2:	0000a697          	auipc	a3,0xa
ffffffffc02028e6:	c8668693          	addi	a3,a3,-890 # ffffffffc020c568 <default_pmm_manager+0x188>
ffffffffc02028ea:	00009617          	auipc	a2,0x9
ffffffffc02028ee:	00e60613          	addi	a2,a2,14 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02028f2:	16f00593          	li	a1,367
ffffffffc02028f6:	0000a517          	auipc	a0,0xa
ffffffffc02028fa:	c3a50513          	addi	a0,a0,-966 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02028fe:	ba1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202902:	0000a617          	auipc	a2,0xa
ffffffffc0202906:	b1660613          	addi	a2,a2,-1258 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc020290a:	07100593          	li	a1,113
ffffffffc020290e:	0000a517          	auipc	a0,0xa
ffffffffc0202912:	b3250513          	addi	a0,a0,-1230 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0202916:	b89fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020291a:	81bff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc020291e:	0000a697          	auipc	a3,0xa
ffffffffc0202922:	c7a68693          	addi	a3,a3,-902 # ffffffffc020c598 <default_pmm_manager+0x1b8>
ffffffffc0202926:	00009617          	auipc	a2,0x9
ffffffffc020292a:	fd260613          	addi	a2,a2,-46 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020292e:	17000593          	li	a1,368
ffffffffc0202932:	0000a517          	auipc	a0,0xa
ffffffffc0202936:	bfe50513          	addi	a0,a0,-1026 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020293a:	b65fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020293e <copy_range>:
ffffffffc020293e:	7119                	addi	sp,sp,-128
ffffffffc0202940:	00d667b3          	or	a5,a2,a3
ffffffffc0202944:	fc86                	sd	ra,120(sp)
ffffffffc0202946:	f8a2                	sd	s0,112(sp)
ffffffffc0202948:	f4a6                	sd	s1,104(sp)
ffffffffc020294a:	f0ca                	sd	s2,96(sp)
ffffffffc020294c:	ecce                	sd	s3,88(sp)
ffffffffc020294e:	e8d2                	sd	s4,80(sp)
ffffffffc0202950:	e4d6                	sd	s5,72(sp)
ffffffffc0202952:	e0da                	sd	s6,64(sp)
ffffffffc0202954:	fc5e                	sd	s7,56(sp)
ffffffffc0202956:	f862                	sd	s8,48(sp)
ffffffffc0202958:	f466                	sd	s9,40(sp)
ffffffffc020295a:	f06a                	sd	s10,32(sp)
ffffffffc020295c:	ec6e                	sd	s11,24(sp)
ffffffffc020295e:	17d2                	slli	a5,a5,0x34
ffffffffc0202960:	16079e63          	bnez	a5,ffffffffc0202adc <copy_range+0x19e>
ffffffffc0202964:	002007b7          	lui	a5,0x200
ffffffffc0202968:	8db2                	mv	s11,a2
ffffffffc020296a:	12f66d63          	bltu	a2,a5,ffffffffc0202aa4 <copy_range+0x166>
ffffffffc020296e:	84b6                	mv	s1,a3
ffffffffc0202970:	12d67a63          	bgeu	a2,a3,ffffffffc0202aa4 <copy_range+0x166>
ffffffffc0202974:	4785                	li	a5,1
ffffffffc0202976:	07fe                	slli	a5,a5,0x1f
ffffffffc0202978:	12d7e663          	bltu	a5,a3,ffffffffc0202aa4 <copy_range+0x166>
ffffffffc020297c:	8a2a                	mv	s4,a0
ffffffffc020297e:	892e                	mv	s2,a1
ffffffffc0202980:	6985                	lui	s3,0x1
ffffffffc0202982:	00094c17          	auipc	s8,0x94
ffffffffc0202986:	f1ec0c13          	addi	s8,s8,-226 # ffffffffc02968a0 <npage>
ffffffffc020298a:	00094b97          	auipc	s7,0x94
ffffffffc020298e:	f1eb8b93          	addi	s7,s7,-226 # ffffffffc02968a8 <pages>
ffffffffc0202992:	fff80b37          	lui	s6,0xfff80
ffffffffc0202996:	00094a97          	auipc	s5,0x94
ffffffffc020299a:	f1aa8a93          	addi	s5,s5,-230 # ffffffffc02968b0 <pmm_manager>
ffffffffc020299e:	00200d37          	lui	s10,0x200
ffffffffc02029a2:	ffe00cb7          	lui	s9,0xffe00
ffffffffc02029a6:	4601                	li	a2,0
ffffffffc02029a8:	85ee                	mv	a1,s11
ffffffffc02029aa:	854a                	mv	a0,s2
ffffffffc02029ac:	879ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02029b0:	842a                	mv	s0,a0
ffffffffc02029b2:	c559                	beqz	a0,ffffffffc0202a40 <copy_range+0x102>
ffffffffc02029b4:	611c                	ld	a5,0(a0)
ffffffffc02029b6:	8b85                	andi	a5,a5,1
ffffffffc02029b8:	e785                	bnez	a5,ffffffffc02029e0 <copy_range+0xa2>
ffffffffc02029ba:	9dce                	add	s11,s11,s3
ffffffffc02029bc:	fe9de5e3          	bltu	s11,s1,ffffffffc02029a6 <copy_range+0x68>
ffffffffc02029c0:	4501                	li	a0,0
ffffffffc02029c2:	70e6                	ld	ra,120(sp)
ffffffffc02029c4:	7446                	ld	s0,112(sp)
ffffffffc02029c6:	74a6                	ld	s1,104(sp)
ffffffffc02029c8:	7906                	ld	s2,96(sp)
ffffffffc02029ca:	69e6                	ld	s3,88(sp)
ffffffffc02029cc:	6a46                	ld	s4,80(sp)
ffffffffc02029ce:	6aa6                	ld	s5,72(sp)
ffffffffc02029d0:	6b06                	ld	s6,64(sp)
ffffffffc02029d2:	7be2                	ld	s7,56(sp)
ffffffffc02029d4:	7c42                	ld	s8,48(sp)
ffffffffc02029d6:	7ca2                	ld	s9,40(sp)
ffffffffc02029d8:	7d02                	ld	s10,32(sp)
ffffffffc02029da:	6de2                	ld	s11,24(sp)
ffffffffc02029dc:	6109                	addi	sp,sp,128
ffffffffc02029de:	8082                	ret
ffffffffc02029e0:	4605                	li	a2,1
ffffffffc02029e2:	85ee                	mv	a1,s11
ffffffffc02029e4:	8552                	mv	a0,s4
ffffffffc02029e6:	83fff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02029ea:	cd3d                	beqz	a0,ffffffffc0202a68 <copy_range+0x12a>
ffffffffc02029ec:	601c                	ld	a5,0(s0)
ffffffffc02029ee:	0017f713          	andi	a4,a5,1
ffffffffc02029f2:	cb69                	beqz	a4,ffffffffc0202ac4 <copy_range+0x186>
ffffffffc02029f4:	000c3703          	ld	a4,0(s8)
ffffffffc02029f8:	078a                	slli	a5,a5,0x2
ffffffffc02029fa:	83b1                	srli	a5,a5,0xc
ffffffffc02029fc:	08e7f863          	bgeu	a5,a4,ffffffffc0202a8c <copy_range+0x14e>
ffffffffc0202a00:	000bb403          	ld	s0,0(s7)
ffffffffc0202a04:	97da                	add	a5,a5,s6
ffffffffc0202a06:	079a                	slli	a5,a5,0x6
ffffffffc0202a08:	943e                	add	s0,s0,a5
ffffffffc0202a0a:	100027f3          	csrr	a5,sstatus
ffffffffc0202a0e:	8b89                	andi	a5,a5,2
ffffffffc0202a10:	e3a1                	bnez	a5,ffffffffc0202a50 <copy_range+0x112>
ffffffffc0202a12:	000ab783          	ld	a5,0(s5)
ffffffffc0202a16:	4505                	li	a0,1
ffffffffc0202a18:	6f9c                	ld	a5,24(a5)
ffffffffc0202a1a:	9782                	jalr	a5
ffffffffc0202a1c:	c821                	beqz	s0,ffffffffc0202a6c <copy_range+0x12e>
ffffffffc0202a1e:	fd51                	bnez	a0,ffffffffc02029ba <copy_range+0x7c>
ffffffffc0202a20:	0000a697          	auipc	a3,0xa
ffffffffc0202a24:	ba068693          	addi	a3,a3,-1120 # ffffffffc020c5c0 <default_pmm_manager+0x1e0>
ffffffffc0202a28:	00009617          	auipc	a2,0x9
ffffffffc0202a2c:	ed060613          	addi	a2,a2,-304 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0202a30:	1cf00593          	li	a1,463
ffffffffc0202a34:	0000a517          	auipc	a0,0xa
ffffffffc0202a38:	afc50513          	addi	a0,a0,-1284 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0202a3c:	a63fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202a40:	9dea                	add	s11,s11,s10
ffffffffc0202a42:	019dfdb3          	and	s11,s11,s9
ffffffffc0202a46:	f60d8de3          	beqz	s11,ffffffffc02029c0 <copy_range+0x82>
ffffffffc0202a4a:	f49deee3          	bltu	s11,s1,ffffffffc02029a6 <copy_range+0x68>
ffffffffc0202a4e:	bf8d                	j	ffffffffc02029c0 <copy_range+0x82>
ffffffffc0202a50:	a22fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202a54:	000ab783          	ld	a5,0(s5)
ffffffffc0202a58:	4505                	li	a0,1
ffffffffc0202a5a:	6f9c                	ld	a5,24(a5)
ffffffffc0202a5c:	9782                	jalr	a5
ffffffffc0202a5e:	e42a                	sd	a0,8(sp)
ffffffffc0202a60:	a0cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202a64:	6522                	ld	a0,8(sp)
ffffffffc0202a66:	bf5d                	j	ffffffffc0202a1c <copy_range+0xde>
ffffffffc0202a68:	5571                	li	a0,-4
ffffffffc0202a6a:	bfa1                	j	ffffffffc02029c2 <copy_range+0x84>
ffffffffc0202a6c:	0000a697          	auipc	a3,0xa
ffffffffc0202a70:	b4468693          	addi	a3,a3,-1212 # ffffffffc020c5b0 <default_pmm_manager+0x1d0>
ffffffffc0202a74:	00009617          	auipc	a2,0x9
ffffffffc0202a78:	e8460613          	addi	a2,a2,-380 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0202a7c:	1ce00593          	li	a1,462
ffffffffc0202a80:	0000a517          	auipc	a0,0xa
ffffffffc0202a84:	ab050513          	addi	a0,a0,-1360 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0202a88:	a17fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202a8c:	0000a617          	auipc	a2,0xa
ffffffffc0202a90:	a5c60613          	addi	a2,a2,-1444 # ffffffffc020c4e8 <default_pmm_manager+0x108>
ffffffffc0202a94:	06900593          	li	a1,105
ffffffffc0202a98:	0000a517          	auipc	a0,0xa
ffffffffc0202a9c:	9a850513          	addi	a0,a0,-1624 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0202aa0:	9fffd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202aa4:	0000a697          	auipc	a3,0xa
ffffffffc0202aa8:	af468693          	addi	a3,a3,-1292 # ffffffffc020c598 <default_pmm_manager+0x1b8>
ffffffffc0202aac:	00009617          	auipc	a2,0x9
ffffffffc0202ab0:	e4c60613          	addi	a2,a2,-436 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0202ab4:	1b600593          	li	a1,438
ffffffffc0202ab8:	0000a517          	auipc	a0,0xa
ffffffffc0202abc:	a7850513          	addi	a0,a0,-1416 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0202ac0:	9dffd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202ac4:	0000a617          	auipc	a2,0xa
ffffffffc0202ac8:	a4460613          	addi	a2,a2,-1468 # ffffffffc020c508 <default_pmm_manager+0x128>
ffffffffc0202acc:	07f00593          	li	a1,127
ffffffffc0202ad0:	0000a517          	auipc	a0,0xa
ffffffffc0202ad4:	97050513          	addi	a0,a0,-1680 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0202ad8:	9c7fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202adc:	0000a697          	auipc	a3,0xa
ffffffffc0202ae0:	a8c68693          	addi	a3,a3,-1396 # ffffffffc020c568 <default_pmm_manager+0x188>
ffffffffc0202ae4:	00009617          	auipc	a2,0x9
ffffffffc0202ae8:	e1460613          	addi	a2,a2,-492 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0202aec:	1b500593          	li	a1,437
ffffffffc0202af0:	0000a517          	auipc	a0,0xa
ffffffffc0202af4:	a4050513          	addi	a0,a0,-1472 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0202af8:	9a7fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202afc <page_remove>:
ffffffffc0202afc:	7179                	addi	sp,sp,-48
ffffffffc0202afe:	4601                	li	a2,0
ffffffffc0202b00:	ec26                	sd	s1,24(sp)
ffffffffc0202b02:	f406                	sd	ra,40(sp)
ffffffffc0202b04:	f022                	sd	s0,32(sp)
ffffffffc0202b06:	84ae                	mv	s1,a1
ffffffffc0202b08:	f1cff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202b0c:	c511                	beqz	a0,ffffffffc0202b18 <page_remove+0x1c>
ffffffffc0202b0e:	611c                	ld	a5,0(a0)
ffffffffc0202b10:	842a                	mv	s0,a0
ffffffffc0202b12:	0017f713          	andi	a4,a5,1
ffffffffc0202b16:	e711                	bnez	a4,ffffffffc0202b22 <page_remove+0x26>
ffffffffc0202b18:	70a2                	ld	ra,40(sp)
ffffffffc0202b1a:	7402                	ld	s0,32(sp)
ffffffffc0202b1c:	64e2                	ld	s1,24(sp)
ffffffffc0202b1e:	6145                	addi	sp,sp,48
ffffffffc0202b20:	8082                	ret
ffffffffc0202b22:	078a                	slli	a5,a5,0x2
ffffffffc0202b24:	83b1                	srli	a5,a5,0xc
ffffffffc0202b26:	00094717          	auipc	a4,0x94
ffffffffc0202b2a:	d7a73703          	ld	a4,-646(a4) # ffffffffc02968a0 <npage>
ffffffffc0202b2e:	06e7f363          	bgeu	a5,a4,ffffffffc0202b94 <page_remove+0x98>
ffffffffc0202b32:	fff80537          	lui	a0,0xfff80
ffffffffc0202b36:	97aa                	add	a5,a5,a0
ffffffffc0202b38:	079a                	slli	a5,a5,0x6
ffffffffc0202b3a:	00094517          	auipc	a0,0x94
ffffffffc0202b3e:	d6e53503          	ld	a0,-658(a0) # ffffffffc02968a8 <pages>
ffffffffc0202b42:	953e                	add	a0,a0,a5
ffffffffc0202b44:	411c                	lw	a5,0(a0)
ffffffffc0202b46:	fff7871b          	addiw	a4,a5,-1
ffffffffc0202b4a:	c118                	sw	a4,0(a0)
ffffffffc0202b4c:	cb11                	beqz	a4,ffffffffc0202b60 <page_remove+0x64>
ffffffffc0202b4e:	00043023          	sd	zero,0(s0)
ffffffffc0202b52:	12048073          	sfence.vma	s1
ffffffffc0202b56:	70a2                	ld	ra,40(sp)
ffffffffc0202b58:	7402                	ld	s0,32(sp)
ffffffffc0202b5a:	64e2                	ld	s1,24(sp)
ffffffffc0202b5c:	6145                	addi	sp,sp,48
ffffffffc0202b5e:	8082                	ret
ffffffffc0202b60:	100027f3          	csrr	a5,sstatus
ffffffffc0202b64:	8b89                	andi	a5,a5,2
ffffffffc0202b66:	eb89                	bnez	a5,ffffffffc0202b78 <page_remove+0x7c>
ffffffffc0202b68:	00094797          	auipc	a5,0x94
ffffffffc0202b6c:	d487b783          	ld	a5,-696(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202b70:	739c                	ld	a5,32(a5)
ffffffffc0202b72:	4585                	li	a1,1
ffffffffc0202b74:	9782                	jalr	a5
ffffffffc0202b76:	bfe1                	j	ffffffffc0202b4e <page_remove+0x52>
ffffffffc0202b78:	e42a                	sd	a0,8(sp)
ffffffffc0202b7a:	8f8fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202b7e:	00094797          	auipc	a5,0x94
ffffffffc0202b82:	d327b783          	ld	a5,-718(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202b86:	739c                	ld	a5,32(a5)
ffffffffc0202b88:	6522                	ld	a0,8(sp)
ffffffffc0202b8a:	4585                	li	a1,1
ffffffffc0202b8c:	9782                	jalr	a5
ffffffffc0202b8e:	8defe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202b92:	bf75                	j	ffffffffc0202b4e <page_remove+0x52>
ffffffffc0202b94:	da0ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202b98 <page_insert>:
ffffffffc0202b98:	7139                	addi	sp,sp,-64
ffffffffc0202b9a:	e852                	sd	s4,16(sp)
ffffffffc0202b9c:	8a32                	mv	s4,a2
ffffffffc0202b9e:	f822                	sd	s0,48(sp)
ffffffffc0202ba0:	4605                	li	a2,1
ffffffffc0202ba2:	842e                	mv	s0,a1
ffffffffc0202ba4:	85d2                	mv	a1,s4
ffffffffc0202ba6:	f426                	sd	s1,40(sp)
ffffffffc0202ba8:	fc06                	sd	ra,56(sp)
ffffffffc0202baa:	f04a                	sd	s2,32(sp)
ffffffffc0202bac:	ec4e                	sd	s3,24(sp)
ffffffffc0202bae:	e456                	sd	s5,8(sp)
ffffffffc0202bb0:	84b6                	mv	s1,a3
ffffffffc0202bb2:	e72ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202bb6:	c961                	beqz	a0,ffffffffc0202c86 <page_insert+0xee>
ffffffffc0202bb8:	4014                	lw	a3,0(s0)
ffffffffc0202bba:	611c                	ld	a5,0(a0)
ffffffffc0202bbc:	89aa                	mv	s3,a0
ffffffffc0202bbe:	0016871b          	addiw	a4,a3,1
ffffffffc0202bc2:	c018                	sw	a4,0(s0)
ffffffffc0202bc4:	0017f713          	andi	a4,a5,1
ffffffffc0202bc8:	ef05                	bnez	a4,ffffffffc0202c00 <page_insert+0x68>
ffffffffc0202bca:	00094717          	auipc	a4,0x94
ffffffffc0202bce:	cde73703          	ld	a4,-802(a4) # ffffffffc02968a8 <pages>
ffffffffc0202bd2:	8c19                	sub	s0,s0,a4
ffffffffc0202bd4:	000807b7          	lui	a5,0x80
ffffffffc0202bd8:	8419                	srai	s0,s0,0x6
ffffffffc0202bda:	943e                	add	s0,s0,a5
ffffffffc0202bdc:	042a                	slli	s0,s0,0xa
ffffffffc0202bde:	8cc1                	or	s1,s1,s0
ffffffffc0202be0:	0014e493          	ori	s1,s1,1
ffffffffc0202be4:	0099b023          	sd	s1,0(s3) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202be8:	120a0073          	sfence.vma	s4
ffffffffc0202bec:	4501                	li	a0,0
ffffffffc0202bee:	70e2                	ld	ra,56(sp)
ffffffffc0202bf0:	7442                	ld	s0,48(sp)
ffffffffc0202bf2:	74a2                	ld	s1,40(sp)
ffffffffc0202bf4:	7902                	ld	s2,32(sp)
ffffffffc0202bf6:	69e2                	ld	s3,24(sp)
ffffffffc0202bf8:	6a42                	ld	s4,16(sp)
ffffffffc0202bfa:	6aa2                	ld	s5,8(sp)
ffffffffc0202bfc:	6121                	addi	sp,sp,64
ffffffffc0202bfe:	8082                	ret
ffffffffc0202c00:	078a                	slli	a5,a5,0x2
ffffffffc0202c02:	83b1                	srli	a5,a5,0xc
ffffffffc0202c04:	00094717          	auipc	a4,0x94
ffffffffc0202c08:	c9c73703          	ld	a4,-868(a4) # ffffffffc02968a0 <npage>
ffffffffc0202c0c:	06e7ff63          	bgeu	a5,a4,ffffffffc0202c8a <page_insert+0xf2>
ffffffffc0202c10:	00094a97          	auipc	s5,0x94
ffffffffc0202c14:	c98a8a93          	addi	s5,s5,-872 # ffffffffc02968a8 <pages>
ffffffffc0202c18:	000ab703          	ld	a4,0(s5)
ffffffffc0202c1c:	fff80937          	lui	s2,0xfff80
ffffffffc0202c20:	993e                	add	s2,s2,a5
ffffffffc0202c22:	091a                	slli	s2,s2,0x6
ffffffffc0202c24:	993a                	add	s2,s2,a4
ffffffffc0202c26:	01240c63          	beq	s0,s2,ffffffffc0202c3e <page_insert+0xa6>
ffffffffc0202c2a:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202c2e:	fff7869b          	addiw	a3,a5,-1
ffffffffc0202c32:	00d92023          	sw	a3,0(s2)
ffffffffc0202c36:	c691                	beqz	a3,ffffffffc0202c42 <page_insert+0xaa>
ffffffffc0202c38:	120a0073          	sfence.vma	s4
ffffffffc0202c3c:	bf59                	j	ffffffffc0202bd2 <page_insert+0x3a>
ffffffffc0202c3e:	c014                	sw	a3,0(s0)
ffffffffc0202c40:	bf49                	j	ffffffffc0202bd2 <page_insert+0x3a>
ffffffffc0202c42:	100027f3          	csrr	a5,sstatus
ffffffffc0202c46:	8b89                	andi	a5,a5,2
ffffffffc0202c48:	ef91                	bnez	a5,ffffffffc0202c64 <page_insert+0xcc>
ffffffffc0202c4a:	00094797          	auipc	a5,0x94
ffffffffc0202c4e:	c667b783          	ld	a5,-922(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202c52:	739c                	ld	a5,32(a5)
ffffffffc0202c54:	4585                	li	a1,1
ffffffffc0202c56:	854a                	mv	a0,s2
ffffffffc0202c58:	9782                	jalr	a5
ffffffffc0202c5a:	000ab703          	ld	a4,0(s5)
ffffffffc0202c5e:	120a0073          	sfence.vma	s4
ffffffffc0202c62:	bf85                	j	ffffffffc0202bd2 <page_insert+0x3a>
ffffffffc0202c64:	80efe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202c68:	00094797          	auipc	a5,0x94
ffffffffc0202c6c:	c487b783          	ld	a5,-952(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202c70:	739c                	ld	a5,32(a5)
ffffffffc0202c72:	4585                	li	a1,1
ffffffffc0202c74:	854a                	mv	a0,s2
ffffffffc0202c76:	9782                	jalr	a5
ffffffffc0202c78:	ff5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202c7c:	000ab703          	ld	a4,0(s5)
ffffffffc0202c80:	120a0073          	sfence.vma	s4
ffffffffc0202c84:	b7b9                	j	ffffffffc0202bd2 <page_insert+0x3a>
ffffffffc0202c86:	5571                	li	a0,-4
ffffffffc0202c88:	b79d                	j	ffffffffc0202bee <page_insert+0x56>
ffffffffc0202c8a:	caaff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202c8e <pmm_init>:
ffffffffc0202c8e:	00009797          	auipc	a5,0x9
ffffffffc0202c92:	75278793          	addi	a5,a5,1874 # ffffffffc020c3e0 <default_pmm_manager>
ffffffffc0202c96:	638c                	ld	a1,0(a5)
ffffffffc0202c98:	7159                	addi	sp,sp,-112
ffffffffc0202c9a:	f85a                	sd	s6,48(sp)
ffffffffc0202c9c:	0000a517          	auipc	a0,0xa
ffffffffc0202ca0:	93450513          	addi	a0,a0,-1740 # ffffffffc020c5d0 <default_pmm_manager+0x1f0>
ffffffffc0202ca4:	00094b17          	auipc	s6,0x94
ffffffffc0202ca8:	c0cb0b13          	addi	s6,s6,-1012 # ffffffffc02968b0 <pmm_manager>
ffffffffc0202cac:	f486                	sd	ra,104(sp)
ffffffffc0202cae:	e8ca                	sd	s2,80(sp)
ffffffffc0202cb0:	e4ce                	sd	s3,72(sp)
ffffffffc0202cb2:	f0a2                	sd	s0,96(sp)
ffffffffc0202cb4:	eca6                	sd	s1,88(sp)
ffffffffc0202cb6:	e0d2                	sd	s4,64(sp)
ffffffffc0202cb8:	fc56                	sd	s5,56(sp)
ffffffffc0202cba:	f45e                	sd	s7,40(sp)
ffffffffc0202cbc:	f062                	sd	s8,32(sp)
ffffffffc0202cbe:	ec66                	sd	s9,24(sp)
ffffffffc0202cc0:	00fb3023          	sd	a5,0(s6)
ffffffffc0202cc4:	ce2fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202cc8:	000b3783          	ld	a5,0(s6)
ffffffffc0202ccc:	00094997          	auipc	s3,0x94
ffffffffc0202cd0:	bec98993          	addi	s3,s3,-1044 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202cd4:	679c                	ld	a5,8(a5)
ffffffffc0202cd6:	9782                	jalr	a5
ffffffffc0202cd8:	57f5                	li	a5,-3
ffffffffc0202cda:	07fa                	slli	a5,a5,0x1e
ffffffffc0202cdc:	00f9b023          	sd	a5,0(s3)
ffffffffc0202ce0:	d69fd0ef          	jal	ra,ffffffffc0200a48 <get_memory_base>
ffffffffc0202ce4:	892a                	mv	s2,a0
ffffffffc0202ce6:	d6dfd0ef          	jal	ra,ffffffffc0200a52 <get_memory_size>
ffffffffc0202cea:	280502e3          	beqz	a0,ffffffffc020376e <pmm_init+0xae0>
ffffffffc0202cee:	84aa                	mv	s1,a0
ffffffffc0202cf0:	0000a517          	auipc	a0,0xa
ffffffffc0202cf4:	91850513          	addi	a0,a0,-1768 # ffffffffc020c608 <default_pmm_manager+0x228>
ffffffffc0202cf8:	caefd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202cfc:	00990433          	add	s0,s2,s1
ffffffffc0202d00:	fff40693          	addi	a3,s0,-1
ffffffffc0202d04:	864a                	mv	a2,s2
ffffffffc0202d06:	85a6                	mv	a1,s1
ffffffffc0202d08:	0000a517          	auipc	a0,0xa
ffffffffc0202d0c:	91850513          	addi	a0,a0,-1768 # ffffffffc020c620 <default_pmm_manager+0x240>
ffffffffc0202d10:	c96fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202d14:	c8000737          	lui	a4,0xc8000
ffffffffc0202d18:	87a2                	mv	a5,s0
ffffffffc0202d1a:	5e876e63          	bltu	a4,s0,ffffffffc0203316 <pmm_init+0x688>
ffffffffc0202d1e:	757d                	lui	a0,0xfffff
ffffffffc0202d20:	00095617          	auipc	a2,0x95
ffffffffc0202d24:	bef60613          	addi	a2,a2,-1041 # ffffffffc029790f <end+0xfff>
ffffffffc0202d28:	8e69                	and	a2,a2,a0
ffffffffc0202d2a:	00094497          	auipc	s1,0x94
ffffffffc0202d2e:	b7648493          	addi	s1,s1,-1162 # ffffffffc02968a0 <npage>
ffffffffc0202d32:	00c7d513          	srli	a0,a5,0xc
ffffffffc0202d36:	00094b97          	auipc	s7,0x94
ffffffffc0202d3a:	b72b8b93          	addi	s7,s7,-1166 # ffffffffc02968a8 <pages>
ffffffffc0202d3e:	e088                	sd	a0,0(s1)
ffffffffc0202d40:	00cbb023          	sd	a2,0(s7)
ffffffffc0202d44:	000807b7          	lui	a5,0x80
ffffffffc0202d48:	86b2                	mv	a3,a2
ffffffffc0202d4a:	02f50863          	beq	a0,a5,ffffffffc0202d7a <pmm_init+0xec>
ffffffffc0202d4e:	4781                	li	a5,0
ffffffffc0202d50:	4585                	li	a1,1
ffffffffc0202d52:	fff806b7          	lui	a3,0xfff80
ffffffffc0202d56:	00679513          	slli	a0,a5,0x6
ffffffffc0202d5a:	9532                	add	a0,a0,a2
ffffffffc0202d5c:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd686f8>
ffffffffc0202d60:	40b7302f          	amoor.d	zero,a1,(a4)
ffffffffc0202d64:	6088                	ld	a0,0(s1)
ffffffffc0202d66:	0785                	addi	a5,a5,1
ffffffffc0202d68:	000bb603          	ld	a2,0(s7)
ffffffffc0202d6c:	00d50733          	add	a4,a0,a3
ffffffffc0202d70:	fee7e3e3          	bltu	a5,a4,ffffffffc0202d56 <pmm_init+0xc8>
ffffffffc0202d74:	071a                	slli	a4,a4,0x6
ffffffffc0202d76:	00e606b3          	add	a3,a2,a4
ffffffffc0202d7a:	c02007b7          	lui	a5,0xc0200
ffffffffc0202d7e:	3af6eae3          	bltu	a3,a5,ffffffffc0203932 <pmm_init+0xca4>
ffffffffc0202d82:	0009b583          	ld	a1,0(s3)
ffffffffc0202d86:	77fd                	lui	a5,0xfffff
ffffffffc0202d88:	8c7d                	and	s0,s0,a5
ffffffffc0202d8a:	8e8d                	sub	a3,a3,a1
ffffffffc0202d8c:	5e86e363          	bltu	a3,s0,ffffffffc0203372 <pmm_init+0x6e4>
ffffffffc0202d90:	0000a517          	auipc	a0,0xa
ffffffffc0202d94:	8b850513          	addi	a0,a0,-1864 # ffffffffc020c648 <default_pmm_manager+0x268>
ffffffffc0202d98:	c0efd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202d9c:	000b3783          	ld	a5,0(s6)
ffffffffc0202da0:	7b9c                	ld	a5,48(a5)
ffffffffc0202da2:	9782                	jalr	a5
ffffffffc0202da4:	0000a517          	auipc	a0,0xa
ffffffffc0202da8:	8bc50513          	addi	a0,a0,-1860 # ffffffffc020c660 <default_pmm_manager+0x280>
ffffffffc0202dac:	bfafd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202db0:	100027f3          	csrr	a5,sstatus
ffffffffc0202db4:	8b89                	andi	a5,a5,2
ffffffffc0202db6:	5a079363          	bnez	a5,ffffffffc020335c <pmm_init+0x6ce>
ffffffffc0202dba:	000b3783          	ld	a5,0(s6)
ffffffffc0202dbe:	4505                	li	a0,1
ffffffffc0202dc0:	6f9c                	ld	a5,24(a5)
ffffffffc0202dc2:	9782                	jalr	a5
ffffffffc0202dc4:	842a                	mv	s0,a0
ffffffffc0202dc6:	180408e3          	beqz	s0,ffffffffc0203756 <pmm_init+0xac8>
ffffffffc0202dca:	000bb683          	ld	a3,0(s7)
ffffffffc0202dce:	5a7d                	li	s4,-1
ffffffffc0202dd0:	6098                	ld	a4,0(s1)
ffffffffc0202dd2:	40d406b3          	sub	a3,s0,a3
ffffffffc0202dd6:	8699                	srai	a3,a3,0x6
ffffffffc0202dd8:	00080437          	lui	s0,0x80
ffffffffc0202ddc:	96a2                	add	a3,a3,s0
ffffffffc0202dde:	00ca5793          	srli	a5,s4,0xc
ffffffffc0202de2:	8ff5                	and	a5,a5,a3
ffffffffc0202de4:	06b2                	slli	a3,a3,0xc
ffffffffc0202de6:	30e7fde3          	bgeu	a5,a4,ffffffffc0203900 <pmm_init+0xc72>
ffffffffc0202dea:	0009b403          	ld	s0,0(s3)
ffffffffc0202dee:	6605                	lui	a2,0x1
ffffffffc0202df0:	4581                	li	a1,0
ffffffffc0202df2:	9436                	add	s0,s0,a3
ffffffffc0202df4:	8522                	mv	a0,s0
ffffffffc0202df6:	620080ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0202dfa:	0009b683          	ld	a3,0(s3)
ffffffffc0202dfe:	77fd                	lui	a5,0xfffff
ffffffffc0202e00:	00009917          	auipc	s2,0x9
ffffffffc0202e04:	67f90913          	addi	s2,s2,1663 # ffffffffc020c47f <default_pmm_manager+0x9f>
ffffffffc0202e08:	00f97933          	and	s2,s2,a5
ffffffffc0202e0c:	c0200ab7          	lui	s5,0xc0200
ffffffffc0202e10:	3fe00637          	lui	a2,0x3fe00
ffffffffc0202e14:	964a                	add	a2,a2,s2
ffffffffc0202e16:	4729                	li	a4,10
ffffffffc0202e18:	40da86b3          	sub	a3,s5,a3
ffffffffc0202e1c:	c02005b7          	lui	a1,0xc0200
ffffffffc0202e20:	8522                	mv	a0,s0
ffffffffc0202e22:	e2aff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202e26:	c8000637          	lui	a2,0xc8000
ffffffffc0202e2a:	41260633          	sub	a2,a2,s2
ffffffffc0202e2e:	3f596ce3          	bltu	s2,s5,ffffffffc0203a26 <pmm_init+0xd98>
ffffffffc0202e32:	0009b683          	ld	a3,0(s3)
ffffffffc0202e36:	85ca                	mv	a1,s2
ffffffffc0202e38:	4719                	li	a4,6
ffffffffc0202e3a:	40d906b3          	sub	a3,s2,a3
ffffffffc0202e3e:	8522                	mv	a0,s0
ffffffffc0202e40:	00094917          	auipc	s2,0x94
ffffffffc0202e44:	a5890913          	addi	s2,s2,-1448 # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0202e48:	e04ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202e4c:	00893023          	sd	s0,0(s2)
ffffffffc0202e50:	2d5464e3          	bltu	s0,s5,ffffffffc0203918 <pmm_init+0xc8a>
ffffffffc0202e54:	0009b783          	ld	a5,0(s3)
ffffffffc0202e58:	1a7e                	slli	s4,s4,0x3f
ffffffffc0202e5a:	8c1d                	sub	s0,s0,a5
ffffffffc0202e5c:	00c45793          	srli	a5,s0,0xc
ffffffffc0202e60:	00094717          	auipc	a4,0x94
ffffffffc0202e64:	a2873823          	sd	s0,-1488(a4) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0202e68:	0147ea33          	or	s4,a5,s4
ffffffffc0202e6c:	180a1073          	csrw	satp,s4
ffffffffc0202e70:	12000073          	sfence.vma
ffffffffc0202e74:	0000a517          	auipc	a0,0xa
ffffffffc0202e78:	82c50513          	addi	a0,a0,-2004 # ffffffffc020c6a0 <default_pmm_manager+0x2c0>
ffffffffc0202e7c:	b2afd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202e80:	0000e717          	auipc	a4,0xe
ffffffffc0202e84:	18070713          	addi	a4,a4,384 # ffffffffc0211000 <bootstack>
ffffffffc0202e88:	0000e797          	auipc	a5,0xe
ffffffffc0202e8c:	17878793          	addi	a5,a5,376 # ffffffffc0211000 <bootstack>
ffffffffc0202e90:	5cf70d63          	beq	a4,a5,ffffffffc020346a <pmm_init+0x7dc>
ffffffffc0202e94:	100027f3          	csrr	a5,sstatus
ffffffffc0202e98:	8b89                	andi	a5,a5,2
ffffffffc0202e9a:	4a079763          	bnez	a5,ffffffffc0203348 <pmm_init+0x6ba>
ffffffffc0202e9e:	000b3783          	ld	a5,0(s6)
ffffffffc0202ea2:	779c                	ld	a5,40(a5)
ffffffffc0202ea4:	9782                	jalr	a5
ffffffffc0202ea6:	842a                	mv	s0,a0
ffffffffc0202ea8:	6098                	ld	a4,0(s1)
ffffffffc0202eaa:	c80007b7          	lui	a5,0xc8000
ffffffffc0202eae:	83b1                	srli	a5,a5,0xc
ffffffffc0202eb0:	08e7e3e3          	bltu	a5,a4,ffffffffc0203736 <pmm_init+0xaa8>
ffffffffc0202eb4:	00093503          	ld	a0,0(s2)
ffffffffc0202eb8:	04050fe3          	beqz	a0,ffffffffc0203716 <pmm_init+0xa88>
ffffffffc0202ebc:	03451793          	slli	a5,a0,0x34
ffffffffc0202ec0:	04079be3          	bnez	a5,ffffffffc0203716 <pmm_init+0xa88>
ffffffffc0202ec4:	4601                	li	a2,0
ffffffffc0202ec6:	4581                	li	a1,0
ffffffffc0202ec8:	e4aff0ef          	jal	ra,ffffffffc0202512 <get_page>
ffffffffc0202ecc:	2e0511e3          	bnez	a0,ffffffffc02039ae <pmm_init+0xd20>
ffffffffc0202ed0:	100027f3          	csrr	a5,sstatus
ffffffffc0202ed4:	8b89                	andi	a5,a5,2
ffffffffc0202ed6:	44079e63          	bnez	a5,ffffffffc0203332 <pmm_init+0x6a4>
ffffffffc0202eda:	000b3783          	ld	a5,0(s6)
ffffffffc0202ede:	4505                	li	a0,1
ffffffffc0202ee0:	6f9c                	ld	a5,24(a5)
ffffffffc0202ee2:	9782                	jalr	a5
ffffffffc0202ee4:	8a2a                	mv	s4,a0
ffffffffc0202ee6:	00093503          	ld	a0,0(s2)
ffffffffc0202eea:	4681                	li	a3,0
ffffffffc0202eec:	4601                	li	a2,0
ffffffffc0202eee:	85d2                	mv	a1,s4
ffffffffc0202ef0:	ca9ff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc0202ef4:	26051be3          	bnez	a0,ffffffffc020396a <pmm_init+0xcdc>
ffffffffc0202ef8:	00093503          	ld	a0,0(s2)
ffffffffc0202efc:	4601                	li	a2,0
ffffffffc0202efe:	4581                	li	a1,0
ffffffffc0202f00:	b24ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202f04:	280505e3          	beqz	a0,ffffffffc020398e <pmm_init+0xd00>
ffffffffc0202f08:	611c                	ld	a5,0(a0)
ffffffffc0202f0a:	0017f713          	andi	a4,a5,1
ffffffffc0202f0e:	26070ee3          	beqz	a4,ffffffffc020398a <pmm_init+0xcfc>
ffffffffc0202f12:	6098                	ld	a4,0(s1)
ffffffffc0202f14:	078a                	slli	a5,a5,0x2
ffffffffc0202f16:	83b1                	srli	a5,a5,0xc
ffffffffc0202f18:	62e7f363          	bgeu	a5,a4,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0202f1c:	000bb683          	ld	a3,0(s7)
ffffffffc0202f20:	fff80637          	lui	a2,0xfff80
ffffffffc0202f24:	97b2                	add	a5,a5,a2
ffffffffc0202f26:	079a                	slli	a5,a5,0x6
ffffffffc0202f28:	97b6                	add	a5,a5,a3
ffffffffc0202f2a:	2afa12e3          	bne	s4,a5,ffffffffc02039ce <pmm_init+0xd40>
ffffffffc0202f2e:	000a2683          	lw	a3,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202f32:	4785                	li	a5,1
ffffffffc0202f34:	2cf699e3          	bne	a3,a5,ffffffffc0203a06 <pmm_init+0xd78>
ffffffffc0202f38:	00093503          	ld	a0,0(s2)
ffffffffc0202f3c:	77fd                	lui	a5,0xfffff
ffffffffc0202f3e:	6114                	ld	a3,0(a0)
ffffffffc0202f40:	068a                	slli	a3,a3,0x2
ffffffffc0202f42:	8efd                	and	a3,a3,a5
ffffffffc0202f44:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202f48:	2ae673e3          	bgeu	a2,a4,ffffffffc02039ee <pmm_init+0xd60>
ffffffffc0202f4c:	0009bc03          	ld	s8,0(s3)
ffffffffc0202f50:	96e2                	add	a3,a3,s8
ffffffffc0202f52:	0006ba83          	ld	s5,0(a3) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202f56:	0a8a                	slli	s5,s5,0x2
ffffffffc0202f58:	00fafab3          	and	s5,s5,a5
ffffffffc0202f5c:	00cad793          	srli	a5,s5,0xc
ffffffffc0202f60:	06e7f3e3          	bgeu	a5,a4,ffffffffc02037c6 <pmm_init+0xb38>
ffffffffc0202f64:	4601                	li	a2,0
ffffffffc0202f66:	6585                	lui	a1,0x1
ffffffffc0202f68:	9ae2                	add	s5,s5,s8
ffffffffc0202f6a:	abaff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202f6e:	0aa1                	addi	s5,s5,8
ffffffffc0202f70:	03551be3          	bne	a0,s5,ffffffffc02037a6 <pmm_init+0xb18>
ffffffffc0202f74:	100027f3          	csrr	a5,sstatus
ffffffffc0202f78:	8b89                	andi	a5,a5,2
ffffffffc0202f7a:	3a079163          	bnez	a5,ffffffffc020331c <pmm_init+0x68e>
ffffffffc0202f7e:	000b3783          	ld	a5,0(s6)
ffffffffc0202f82:	4505                	li	a0,1
ffffffffc0202f84:	6f9c                	ld	a5,24(a5)
ffffffffc0202f86:	9782                	jalr	a5
ffffffffc0202f88:	8c2a                	mv	s8,a0
ffffffffc0202f8a:	00093503          	ld	a0,0(s2)
ffffffffc0202f8e:	46d1                	li	a3,20
ffffffffc0202f90:	6605                	lui	a2,0x1
ffffffffc0202f92:	85e2                	mv	a1,s8
ffffffffc0202f94:	c05ff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc0202f98:	1a0519e3          	bnez	a0,ffffffffc020394a <pmm_init+0xcbc>
ffffffffc0202f9c:	00093503          	ld	a0,0(s2)
ffffffffc0202fa0:	4601                	li	a2,0
ffffffffc0202fa2:	6585                	lui	a1,0x1
ffffffffc0202fa4:	a80ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202fa8:	10050ce3          	beqz	a0,ffffffffc02038c0 <pmm_init+0xc32>
ffffffffc0202fac:	611c                	ld	a5,0(a0)
ffffffffc0202fae:	0107f713          	andi	a4,a5,16
ffffffffc0202fb2:	0e0707e3          	beqz	a4,ffffffffc02038a0 <pmm_init+0xc12>
ffffffffc0202fb6:	8b91                	andi	a5,a5,4
ffffffffc0202fb8:	0c0784e3          	beqz	a5,ffffffffc0203880 <pmm_init+0xbf2>
ffffffffc0202fbc:	00093503          	ld	a0,0(s2)
ffffffffc0202fc0:	611c                	ld	a5,0(a0)
ffffffffc0202fc2:	8bc1                	andi	a5,a5,16
ffffffffc0202fc4:	08078ee3          	beqz	a5,ffffffffc0203860 <pmm_init+0xbd2>
ffffffffc0202fc8:	000c2703          	lw	a4,0(s8)
ffffffffc0202fcc:	4785                	li	a5,1
ffffffffc0202fce:	06f719e3          	bne	a4,a5,ffffffffc0203840 <pmm_init+0xbb2>
ffffffffc0202fd2:	4681                	li	a3,0
ffffffffc0202fd4:	6605                	lui	a2,0x1
ffffffffc0202fd6:	85d2                	mv	a1,s4
ffffffffc0202fd8:	bc1ff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc0202fdc:	040512e3          	bnez	a0,ffffffffc0203820 <pmm_init+0xb92>
ffffffffc0202fe0:	000a2703          	lw	a4,0(s4)
ffffffffc0202fe4:	4789                	li	a5,2
ffffffffc0202fe6:	00f71de3          	bne	a4,a5,ffffffffc0203800 <pmm_init+0xb72>
ffffffffc0202fea:	000c2783          	lw	a5,0(s8)
ffffffffc0202fee:	7e079963          	bnez	a5,ffffffffc02037e0 <pmm_init+0xb52>
ffffffffc0202ff2:	00093503          	ld	a0,0(s2)
ffffffffc0202ff6:	4601                	li	a2,0
ffffffffc0202ff8:	6585                	lui	a1,0x1
ffffffffc0202ffa:	a2aff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202ffe:	54050263          	beqz	a0,ffffffffc0203542 <pmm_init+0x8b4>
ffffffffc0203002:	6118                	ld	a4,0(a0)
ffffffffc0203004:	00177793          	andi	a5,a4,1
ffffffffc0203008:	180781e3          	beqz	a5,ffffffffc020398a <pmm_init+0xcfc>
ffffffffc020300c:	6094                	ld	a3,0(s1)
ffffffffc020300e:	00271793          	slli	a5,a4,0x2
ffffffffc0203012:	83b1                	srli	a5,a5,0xc
ffffffffc0203014:	52d7f563          	bgeu	a5,a3,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0203018:	000bb683          	ld	a3,0(s7)
ffffffffc020301c:	fff80ab7          	lui	s5,0xfff80
ffffffffc0203020:	97d6                	add	a5,a5,s5
ffffffffc0203022:	079a                	slli	a5,a5,0x6
ffffffffc0203024:	97b6                	add	a5,a5,a3
ffffffffc0203026:	58fa1e63          	bne	s4,a5,ffffffffc02035c2 <pmm_init+0x934>
ffffffffc020302a:	8b41                	andi	a4,a4,16
ffffffffc020302c:	56071b63          	bnez	a4,ffffffffc02035a2 <pmm_init+0x914>
ffffffffc0203030:	00093503          	ld	a0,0(s2)
ffffffffc0203034:	4581                	li	a1,0
ffffffffc0203036:	ac7ff0ef          	jal	ra,ffffffffc0202afc <page_remove>
ffffffffc020303a:	000a2c83          	lw	s9,0(s4)
ffffffffc020303e:	4785                	li	a5,1
ffffffffc0203040:	5cfc9163          	bne	s9,a5,ffffffffc0203602 <pmm_init+0x974>
ffffffffc0203044:	000c2783          	lw	a5,0(s8)
ffffffffc0203048:	58079d63          	bnez	a5,ffffffffc02035e2 <pmm_init+0x954>
ffffffffc020304c:	00093503          	ld	a0,0(s2)
ffffffffc0203050:	6585                	lui	a1,0x1
ffffffffc0203052:	aabff0ef          	jal	ra,ffffffffc0202afc <page_remove>
ffffffffc0203056:	000a2783          	lw	a5,0(s4)
ffffffffc020305a:	200793e3          	bnez	a5,ffffffffc0203a60 <pmm_init+0xdd2>
ffffffffc020305e:	000c2783          	lw	a5,0(s8)
ffffffffc0203062:	1c079fe3          	bnez	a5,ffffffffc0203a40 <pmm_init+0xdb2>
ffffffffc0203066:	00093a03          	ld	s4,0(s2)
ffffffffc020306a:	608c                	ld	a1,0(s1)
ffffffffc020306c:	000a3683          	ld	a3,0(s4)
ffffffffc0203070:	068a                	slli	a3,a3,0x2
ffffffffc0203072:	82b1                	srli	a3,a3,0xc
ffffffffc0203074:	4cb6f563          	bgeu	a3,a1,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0203078:	000bb503          	ld	a0,0(s7)
ffffffffc020307c:	96d6                	add	a3,a3,s5
ffffffffc020307e:	069a                	slli	a3,a3,0x6
ffffffffc0203080:	00d507b3          	add	a5,a0,a3
ffffffffc0203084:	439c                	lw	a5,0(a5)
ffffffffc0203086:	4f979e63          	bne	a5,s9,ffffffffc0203582 <pmm_init+0x8f4>
ffffffffc020308a:	8699                	srai	a3,a3,0x6
ffffffffc020308c:	00080637          	lui	a2,0x80
ffffffffc0203090:	96b2                	add	a3,a3,a2
ffffffffc0203092:	00c69713          	slli	a4,a3,0xc
ffffffffc0203096:	8331                	srli	a4,a4,0xc
ffffffffc0203098:	06b2                	slli	a3,a3,0xc
ffffffffc020309a:	06b773e3          	bgeu	a4,a1,ffffffffc0203900 <pmm_init+0xc72>
ffffffffc020309e:	0009b703          	ld	a4,0(s3)
ffffffffc02030a2:	96ba                	add	a3,a3,a4
ffffffffc02030a4:	629c                	ld	a5,0(a3)
ffffffffc02030a6:	078a                	slli	a5,a5,0x2
ffffffffc02030a8:	83b1                	srli	a5,a5,0xc
ffffffffc02030aa:	48b7fa63          	bgeu	a5,a1,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc02030ae:	8f91                	sub	a5,a5,a2
ffffffffc02030b0:	079a                	slli	a5,a5,0x6
ffffffffc02030b2:	953e                	add	a0,a0,a5
ffffffffc02030b4:	100027f3          	csrr	a5,sstatus
ffffffffc02030b8:	8b89                	andi	a5,a5,2
ffffffffc02030ba:	32079463          	bnez	a5,ffffffffc02033e2 <pmm_init+0x754>
ffffffffc02030be:	000b3783          	ld	a5,0(s6)
ffffffffc02030c2:	4585                	li	a1,1
ffffffffc02030c4:	739c                	ld	a5,32(a5)
ffffffffc02030c6:	9782                	jalr	a5
ffffffffc02030c8:	000a3783          	ld	a5,0(s4)
ffffffffc02030cc:	6098                	ld	a4,0(s1)
ffffffffc02030ce:	078a                	slli	a5,a5,0x2
ffffffffc02030d0:	83b1                	srli	a5,a5,0xc
ffffffffc02030d2:	46e7f663          	bgeu	a5,a4,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc02030d6:	000bb503          	ld	a0,0(s7)
ffffffffc02030da:	fff80737          	lui	a4,0xfff80
ffffffffc02030de:	97ba                	add	a5,a5,a4
ffffffffc02030e0:	079a                	slli	a5,a5,0x6
ffffffffc02030e2:	953e                	add	a0,a0,a5
ffffffffc02030e4:	100027f3          	csrr	a5,sstatus
ffffffffc02030e8:	8b89                	andi	a5,a5,2
ffffffffc02030ea:	2e079063          	bnez	a5,ffffffffc02033ca <pmm_init+0x73c>
ffffffffc02030ee:	000b3783          	ld	a5,0(s6)
ffffffffc02030f2:	4585                	li	a1,1
ffffffffc02030f4:	739c                	ld	a5,32(a5)
ffffffffc02030f6:	9782                	jalr	a5
ffffffffc02030f8:	00093783          	ld	a5,0(s2)
ffffffffc02030fc:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0203100:	12000073          	sfence.vma
ffffffffc0203104:	100027f3          	csrr	a5,sstatus
ffffffffc0203108:	8b89                	andi	a5,a5,2
ffffffffc020310a:	2a079663          	bnez	a5,ffffffffc02033b6 <pmm_init+0x728>
ffffffffc020310e:	000b3783          	ld	a5,0(s6)
ffffffffc0203112:	779c                	ld	a5,40(a5)
ffffffffc0203114:	9782                	jalr	a5
ffffffffc0203116:	8a2a                	mv	s4,a0
ffffffffc0203118:	7d441463          	bne	s0,s4,ffffffffc02038e0 <pmm_init+0xc52>
ffffffffc020311c:	0000a517          	auipc	a0,0xa
ffffffffc0203120:	8dc50513          	addi	a0,a0,-1828 # ffffffffc020c9f8 <default_pmm_manager+0x618>
ffffffffc0203124:	882fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0203128:	100027f3          	csrr	a5,sstatus
ffffffffc020312c:	8b89                	andi	a5,a5,2
ffffffffc020312e:	26079a63          	bnez	a5,ffffffffc02033a2 <pmm_init+0x714>
ffffffffc0203132:	000b3783          	ld	a5,0(s6)
ffffffffc0203136:	779c                	ld	a5,40(a5)
ffffffffc0203138:	9782                	jalr	a5
ffffffffc020313a:	8c2a                	mv	s8,a0
ffffffffc020313c:	6098                	ld	a4,0(s1)
ffffffffc020313e:	c0200437          	lui	s0,0xc0200
ffffffffc0203142:	7afd                	lui	s5,0xfffff
ffffffffc0203144:	00c71793          	slli	a5,a4,0xc
ffffffffc0203148:	6a05                	lui	s4,0x1
ffffffffc020314a:	02f47c63          	bgeu	s0,a5,ffffffffc0203182 <pmm_init+0x4f4>
ffffffffc020314e:	00c45793          	srli	a5,s0,0xc
ffffffffc0203152:	00093503          	ld	a0,0(s2)
ffffffffc0203156:	3ae7f763          	bgeu	a5,a4,ffffffffc0203504 <pmm_init+0x876>
ffffffffc020315a:	0009b583          	ld	a1,0(s3)
ffffffffc020315e:	4601                	li	a2,0
ffffffffc0203160:	95a2                	add	a1,a1,s0
ffffffffc0203162:	8c2ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0203166:	36050f63          	beqz	a0,ffffffffc02034e4 <pmm_init+0x856>
ffffffffc020316a:	611c                	ld	a5,0(a0)
ffffffffc020316c:	078a                	slli	a5,a5,0x2
ffffffffc020316e:	0157f7b3          	and	a5,a5,s5
ffffffffc0203172:	3a879663          	bne	a5,s0,ffffffffc020351e <pmm_init+0x890>
ffffffffc0203176:	6098                	ld	a4,0(s1)
ffffffffc0203178:	9452                	add	s0,s0,s4
ffffffffc020317a:	00c71793          	slli	a5,a4,0xc
ffffffffc020317e:	fcf468e3          	bltu	s0,a5,ffffffffc020314e <pmm_init+0x4c0>
ffffffffc0203182:	00093783          	ld	a5,0(s2)
ffffffffc0203186:	639c                	ld	a5,0(a5)
ffffffffc0203188:	48079d63          	bnez	a5,ffffffffc0203622 <pmm_init+0x994>
ffffffffc020318c:	100027f3          	csrr	a5,sstatus
ffffffffc0203190:	8b89                	andi	a5,a5,2
ffffffffc0203192:	26079463          	bnez	a5,ffffffffc02033fa <pmm_init+0x76c>
ffffffffc0203196:	000b3783          	ld	a5,0(s6)
ffffffffc020319a:	4505                	li	a0,1
ffffffffc020319c:	6f9c                	ld	a5,24(a5)
ffffffffc020319e:	9782                	jalr	a5
ffffffffc02031a0:	8a2a                	mv	s4,a0
ffffffffc02031a2:	00093503          	ld	a0,0(s2)
ffffffffc02031a6:	4699                	li	a3,6
ffffffffc02031a8:	10000613          	li	a2,256
ffffffffc02031ac:	85d2                	mv	a1,s4
ffffffffc02031ae:	9ebff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc02031b2:	4a051863          	bnez	a0,ffffffffc0203662 <pmm_init+0x9d4>
ffffffffc02031b6:	000a2703          	lw	a4,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc02031ba:	4785                	li	a5,1
ffffffffc02031bc:	48f71363          	bne	a4,a5,ffffffffc0203642 <pmm_init+0x9b4>
ffffffffc02031c0:	00093503          	ld	a0,0(s2)
ffffffffc02031c4:	6405                	lui	s0,0x1
ffffffffc02031c6:	4699                	li	a3,6
ffffffffc02031c8:	10040613          	addi	a2,s0,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc02031cc:	85d2                	mv	a1,s4
ffffffffc02031ce:	9cbff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc02031d2:	38051863          	bnez	a0,ffffffffc0203562 <pmm_init+0x8d4>
ffffffffc02031d6:	000a2703          	lw	a4,0(s4)
ffffffffc02031da:	4789                	li	a5,2
ffffffffc02031dc:	4ef71363          	bne	a4,a5,ffffffffc02036c2 <pmm_init+0xa34>
ffffffffc02031e0:	0000a597          	auipc	a1,0xa
ffffffffc02031e4:	96058593          	addi	a1,a1,-1696 # ffffffffc020cb40 <default_pmm_manager+0x760>
ffffffffc02031e8:	10000513          	li	a0,256
ffffffffc02031ec:	1be080ef          	jal	ra,ffffffffc020b3aa <strcpy>
ffffffffc02031f0:	10040593          	addi	a1,s0,256
ffffffffc02031f4:	10000513          	li	a0,256
ffffffffc02031f8:	1c4080ef          	jal	ra,ffffffffc020b3bc <strcmp>
ffffffffc02031fc:	4a051363          	bnez	a0,ffffffffc02036a2 <pmm_init+0xa14>
ffffffffc0203200:	000bb683          	ld	a3,0(s7)
ffffffffc0203204:	00080737          	lui	a4,0x80
ffffffffc0203208:	547d                	li	s0,-1
ffffffffc020320a:	40da06b3          	sub	a3,s4,a3
ffffffffc020320e:	8699                	srai	a3,a3,0x6
ffffffffc0203210:	609c                	ld	a5,0(s1)
ffffffffc0203212:	96ba                	add	a3,a3,a4
ffffffffc0203214:	8031                	srli	s0,s0,0xc
ffffffffc0203216:	0086f733          	and	a4,a3,s0
ffffffffc020321a:	06b2                	slli	a3,a3,0xc
ffffffffc020321c:	6ef77263          	bgeu	a4,a5,ffffffffc0203900 <pmm_init+0xc72>
ffffffffc0203220:	0009b783          	ld	a5,0(s3)
ffffffffc0203224:	10000513          	li	a0,256
ffffffffc0203228:	96be                	add	a3,a3,a5
ffffffffc020322a:	10068023          	sb	zero,256(a3)
ffffffffc020322e:	146080ef          	jal	ra,ffffffffc020b374 <strlen>
ffffffffc0203232:	44051863          	bnez	a0,ffffffffc0203682 <pmm_init+0x9f4>
ffffffffc0203236:	00093a83          	ld	s5,0(s2)
ffffffffc020323a:	609c                	ld	a5,0(s1)
ffffffffc020323c:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0203240:	068a                	slli	a3,a3,0x2
ffffffffc0203242:	82b1                	srli	a3,a3,0xc
ffffffffc0203244:	2ef6fd63          	bgeu	a3,a5,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0203248:	8c75                	and	s0,s0,a3
ffffffffc020324a:	06b2                	slli	a3,a3,0xc
ffffffffc020324c:	6af47a63          	bgeu	s0,a5,ffffffffc0203900 <pmm_init+0xc72>
ffffffffc0203250:	0009b403          	ld	s0,0(s3)
ffffffffc0203254:	9436                	add	s0,s0,a3
ffffffffc0203256:	100027f3          	csrr	a5,sstatus
ffffffffc020325a:	8b89                	andi	a5,a5,2
ffffffffc020325c:	1e079c63          	bnez	a5,ffffffffc0203454 <pmm_init+0x7c6>
ffffffffc0203260:	000b3783          	ld	a5,0(s6)
ffffffffc0203264:	4585                	li	a1,1
ffffffffc0203266:	8552                	mv	a0,s4
ffffffffc0203268:	739c                	ld	a5,32(a5)
ffffffffc020326a:	9782                	jalr	a5
ffffffffc020326c:	601c                	ld	a5,0(s0)
ffffffffc020326e:	6098                	ld	a4,0(s1)
ffffffffc0203270:	078a                	slli	a5,a5,0x2
ffffffffc0203272:	83b1                	srli	a5,a5,0xc
ffffffffc0203274:	2ce7f563          	bgeu	a5,a4,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0203278:	000bb503          	ld	a0,0(s7)
ffffffffc020327c:	fff80737          	lui	a4,0xfff80
ffffffffc0203280:	97ba                	add	a5,a5,a4
ffffffffc0203282:	079a                	slli	a5,a5,0x6
ffffffffc0203284:	953e                	add	a0,a0,a5
ffffffffc0203286:	100027f3          	csrr	a5,sstatus
ffffffffc020328a:	8b89                	andi	a5,a5,2
ffffffffc020328c:	1a079863          	bnez	a5,ffffffffc020343c <pmm_init+0x7ae>
ffffffffc0203290:	000b3783          	ld	a5,0(s6)
ffffffffc0203294:	4585                	li	a1,1
ffffffffc0203296:	739c                	ld	a5,32(a5)
ffffffffc0203298:	9782                	jalr	a5
ffffffffc020329a:	000ab783          	ld	a5,0(s5)
ffffffffc020329e:	6098                	ld	a4,0(s1)
ffffffffc02032a0:	078a                	slli	a5,a5,0x2
ffffffffc02032a2:	83b1                	srli	a5,a5,0xc
ffffffffc02032a4:	28e7fd63          	bgeu	a5,a4,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc02032a8:	000bb503          	ld	a0,0(s7)
ffffffffc02032ac:	fff80737          	lui	a4,0xfff80
ffffffffc02032b0:	97ba                	add	a5,a5,a4
ffffffffc02032b2:	079a                	slli	a5,a5,0x6
ffffffffc02032b4:	953e                	add	a0,a0,a5
ffffffffc02032b6:	100027f3          	csrr	a5,sstatus
ffffffffc02032ba:	8b89                	andi	a5,a5,2
ffffffffc02032bc:	16079463          	bnez	a5,ffffffffc0203424 <pmm_init+0x796>
ffffffffc02032c0:	000b3783          	ld	a5,0(s6)
ffffffffc02032c4:	4585                	li	a1,1
ffffffffc02032c6:	739c                	ld	a5,32(a5)
ffffffffc02032c8:	9782                	jalr	a5
ffffffffc02032ca:	00093783          	ld	a5,0(s2)
ffffffffc02032ce:	0007b023          	sd	zero,0(a5)
ffffffffc02032d2:	12000073          	sfence.vma
ffffffffc02032d6:	100027f3          	csrr	a5,sstatus
ffffffffc02032da:	8b89                	andi	a5,a5,2
ffffffffc02032dc:	12079a63          	bnez	a5,ffffffffc0203410 <pmm_init+0x782>
ffffffffc02032e0:	000b3783          	ld	a5,0(s6)
ffffffffc02032e4:	779c                	ld	a5,40(a5)
ffffffffc02032e6:	9782                	jalr	a5
ffffffffc02032e8:	842a                	mv	s0,a0
ffffffffc02032ea:	488c1e63          	bne	s8,s0,ffffffffc0203786 <pmm_init+0xaf8>
ffffffffc02032ee:	0000a517          	auipc	a0,0xa
ffffffffc02032f2:	8ca50513          	addi	a0,a0,-1846 # ffffffffc020cbb8 <default_pmm_manager+0x7d8>
ffffffffc02032f6:	eb1fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02032fa:	7406                	ld	s0,96(sp)
ffffffffc02032fc:	70a6                	ld	ra,104(sp)
ffffffffc02032fe:	64e6                	ld	s1,88(sp)
ffffffffc0203300:	6946                	ld	s2,80(sp)
ffffffffc0203302:	69a6                	ld	s3,72(sp)
ffffffffc0203304:	6a06                	ld	s4,64(sp)
ffffffffc0203306:	7ae2                	ld	s5,56(sp)
ffffffffc0203308:	7b42                	ld	s6,48(sp)
ffffffffc020330a:	7ba2                	ld	s7,40(sp)
ffffffffc020330c:	7c02                	ld	s8,32(sp)
ffffffffc020330e:	6ce2                	ld	s9,24(sp)
ffffffffc0203310:	6165                	addi	sp,sp,112
ffffffffc0203312:	c59fe06f          	j	ffffffffc0201f6a <kmalloc_init>
ffffffffc0203316:	c80007b7          	lui	a5,0xc8000
ffffffffc020331a:	b411                	j	ffffffffc0202d1e <pmm_init+0x90>
ffffffffc020331c:	957fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203320:	000b3783          	ld	a5,0(s6)
ffffffffc0203324:	4505                	li	a0,1
ffffffffc0203326:	6f9c                	ld	a5,24(a5)
ffffffffc0203328:	9782                	jalr	a5
ffffffffc020332a:	8c2a                	mv	s8,a0
ffffffffc020332c:	941fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203330:	b9a9                	j	ffffffffc0202f8a <pmm_init+0x2fc>
ffffffffc0203332:	941fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203336:	000b3783          	ld	a5,0(s6)
ffffffffc020333a:	4505                	li	a0,1
ffffffffc020333c:	6f9c                	ld	a5,24(a5)
ffffffffc020333e:	9782                	jalr	a5
ffffffffc0203340:	8a2a                	mv	s4,a0
ffffffffc0203342:	92bfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203346:	b645                	j	ffffffffc0202ee6 <pmm_init+0x258>
ffffffffc0203348:	92bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020334c:	000b3783          	ld	a5,0(s6)
ffffffffc0203350:	779c                	ld	a5,40(a5)
ffffffffc0203352:	9782                	jalr	a5
ffffffffc0203354:	842a                	mv	s0,a0
ffffffffc0203356:	917fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020335a:	b6b9                	j	ffffffffc0202ea8 <pmm_init+0x21a>
ffffffffc020335c:	917fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203360:	000b3783          	ld	a5,0(s6)
ffffffffc0203364:	4505                	li	a0,1
ffffffffc0203366:	6f9c                	ld	a5,24(a5)
ffffffffc0203368:	9782                	jalr	a5
ffffffffc020336a:	842a                	mv	s0,a0
ffffffffc020336c:	901fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203370:	bc99                	j	ffffffffc0202dc6 <pmm_init+0x138>
ffffffffc0203372:	6705                	lui	a4,0x1
ffffffffc0203374:	177d                	addi	a4,a4,-1
ffffffffc0203376:	96ba                	add	a3,a3,a4
ffffffffc0203378:	8ff5                	and	a5,a5,a3
ffffffffc020337a:	00c7d713          	srli	a4,a5,0xc
ffffffffc020337e:	1ca77063          	bgeu	a4,a0,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0203382:	000b3683          	ld	a3,0(s6)
ffffffffc0203386:	fff80537          	lui	a0,0xfff80
ffffffffc020338a:	972a                	add	a4,a4,a0
ffffffffc020338c:	6a94                	ld	a3,16(a3)
ffffffffc020338e:	8c1d                	sub	s0,s0,a5
ffffffffc0203390:	00671513          	slli	a0,a4,0x6
ffffffffc0203394:	00c45593          	srli	a1,s0,0xc
ffffffffc0203398:	9532                	add	a0,a0,a2
ffffffffc020339a:	9682                	jalr	a3
ffffffffc020339c:	0009b583          	ld	a1,0(s3)
ffffffffc02033a0:	bac5                	j	ffffffffc0202d90 <pmm_init+0x102>
ffffffffc02033a2:	8d1fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02033a6:	000b3783          	ld	a5,0(s6)
ffffffffc02033aa:	779c                	ld	a5,40(a5)
ffffffffc02033ac:	9782                	jalr	a5
ffffffffc02033ae:	8c2a                	mv	s8,a0
ffffffffc02033b0:	8bdfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02033b4:	b361                	j	ffffffffc020313c <pmm_init+0x4ae>
ffffffffc02033b6:	8bdfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02033ba:	000b3783          	ld	a5,0(s6)
ffffffffc02033be:	779c                	ld	a5,40(a5)
ffffffffc02033c0:	9782                	jalr	a5
ffffffffc02033c2:	8a2a                	mv	s4,a0
ffffffffc02033c4:	8a9fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02033c8:	bb81                	j	ffffffffc0203118 <pmm_init+0x48a>
ffffffffc02033ca:	e42a                	sd	a0,8(sp)
ffffffffc02033cc:	8a7fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02033d0:	000b3783          	ld	a5,0(s6)
ffffffffc02033d4:	6522                	ld	a0,8(sp)
ffffffffc02033d6:	4585                	li	a1,1
ffffffffc02033d8:	739c                	ld	a5,32(a5)
ffffffffc02033da:	9782                	jalr	a5
ffffffffc02033dc:	891fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02033e0:	bb21                	j	ffffffffc02030f8 <pmm_init+0x46a>
ffffffffc02033e2:	e42a                	sd	a0,8(sp)
ffffffffc02033e4:	88ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02033e8:	000b3783          	ld	a5,0(s6)
ffffffffc02033ec:	6522                	ld	a0,8(sp)
ffffffffc02033ee:	4585                	li	a1,1
ffffffffc02033f0:	739c                	ld	a5,32(a5)
ffffffffc02033f2:	9782                	jalr	a5
ffffffffc02033f4:	879fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02033f8:	b9c1                	j	ffffffffc02030c8 <pmm_init+0x43a>
ffffffffc02033fa:	879fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02033fe:	000b3783          	ld	a5,0(s6)
ffffffffc0203402:	4505                	li	a0,1
ffffffffc0203404:	6f9c                	ld	a5,24(a5)
ffffffffc0203406:	9782                	jalr	a5
ffffffffc0203408:	8a2a                	mv	s4,a0
ffffffffc020340a:	863fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020340e:	bb51                	j	ffffffffc02031a2 <pmm_init+0x514>
ffffffffc0203410:	863fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203414:	000b3783          	ld	a5,0(s6)
ffffffffc0203418:	779c                	ld	a5,40(a5)
ffffffffc020341a:	9782                	jalr	a5
ffffffffc020341c:	842a                	mv	s0,a0
ffffffffc020341e:	84ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203422:	b5e1                	j	ffffffffc02032ea <pmm_init+0x65c>
ffffffffc0203424:	e42a                	sd	a0,8(sp)
ffffffffc0203426:	84dfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020342a:	000b3783          	ld	a5,0(s6)
ffffffffc020342e:	6522                	ld	a0,8(sp)
ffffffffc0203430:	4585                	li	a1,1
ffffffffc0203432:	739c                	ld	a5,32(a5)
ffffffffc0203434:	9782                	jalr	a5
ffffffffc0203436:	837fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020343a:	bd41                	j	ffffffffc02032ca <pmm_init+0x63c>
ffffffffc020343c:	e42a                	sd	a0,8(sp)
ffffffffc020343e:	835fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203442:	000b3783          	ld	a5,0(s6)
ffffffffc0203446:	6522                	ld	a0,8(sp)
ffffffffc0203448:	4585                	li	a1,1
ffffffffc020344a:	739c                	ld	a5,32(a5)
ffffffffc020344c:	9782                	jalr	a5
ffffffffc020344e:	81ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203452:	b5a1                	j	ffffffffc020329a <pmm_init+0x60c>
ffffffffc0203454:	81ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203458:	000b3783          	ld	a5,0(s6)
ffffffffc020345c:	4585                	li	a1,1
ffffffffc020345e:	8552                	mv	a0,s4
ffffffffc0203460:	739c                	ld	a5,32(a5)
ffffffffc0203462:	9782                	jalr	a5
ffffffffc0203464:	809fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203468:	b511                	j	ffffffffc020326c <pmm_init+0x5de>
ffffffffc020346a:	00010417          	auipc	s0,0x10
ffffffffc020346e:	b9640413          	addi	s0,s0,-1130 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc0203472:	00010797          	auipc	a5,0x10
ffffffffc0203476:	b8e78793          	addi	a5,a5,-1138 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc020347a:	a0f41de3          	bne	s0,a5,ffffffffc0202e94 <pmm_init+0x206>
ffffffffc020347e:	4581                	li	a1,0
ffffffffc0203480:	6605                	lui	a2,0x1
ffffffffc0203482:	8522                	mv	a0,s0
ffffffffc0203484:	793070ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0203488:	0000d597          	auipc	a1,0xd
ffffffffc020348c:	b7858593          	addi	a1,a1,-1160 # ffffffffc0210000 <bootstackguard>
ffffffffc0203490:	0000e797          	auipc	a5,0xe
ffffffffc0203494:	b60787a3          	sb	zero,-1169(a5) # ffffffffc0210fff <bootstackguard+0xfff>
ffffffffc0203498:	0000d797          	auipc	a5,0xd
ffffffffc020349c:	b6078423          	sb	zero,-1176(a5) # ffffffffc0210000 <bootstackguard>
ffffffffc02034a0:	00093503          	ld	a0,0(s2)
ffffffffc02034a4:	2555ec63          	bltu	a1,s5,ffffffffc02036fc <pmm_init+0xa6e>
ffffffffc02034a8:	0009b683          	ld	a3,0(s3)
ffffffffc02034ac:	4701                	li	a4,0
ffffffffc02034ae:	6605                	lui	a2,0x1
ffffffffc02034b0:	40d586b3          	sub	a3,a1,a3
ffffffffc02034b4:	f99fe0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc02034b8:	00093503          	ld	a0,0(s2)
ffffffffc02034bc:	23546363          	bltu	s0,s5,ffffffffc02036e2 <pmm_init+0xa54>
ffffffffc02034c0:	0009b683          	ld	a3,0(s3)
ffffffffc02034c4:	4701                	li	a4,0
ffffffffc02034c6:	6605                	lui	a2,0x1
ffffffffc02034c8:	40d406b3          	sub	a3,s0,a3
ffffffffc02034cc:	85a2                	mv	a1,s0
ffffffffc02034ce:	f7ffe0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc02034d2:	12000073          	sfence.vma
ffffffffc02034d6:	00009517          	auipc	a0,0x9
ffffffffc02034da:	1f250513          	addi	a0,a0,498 # ffffffffc020c6c8 <default_pmm_manager+0x2e8>
ffffffffc02034de:	cc9fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02034e2:	ba4d                	j	ffffffffc0202e94 <pmm_init+0x206>
ffffffffc02034e4:	00009697          	auipc	a3,0x9
ffffffffc02034e8:	53468693          	addi	a3,a3,1332 # ffffffffc020ca18 <default_pmm_manager+0x638>
ffffffffc02034ec:	00008617          	auipc	a2,0x8
ffffffffc02034f0:	40c60613          	addi	a2,a2,1036 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02034f4:	28500593          	li	a1,645
ffffffffc02034f8:	00009517          	auipc	a0,0x9
ffffffffc02034fc:	03850513          	addi	a0,a0,56 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203500:	f9ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203504:	86a2                	mv	a3,s0
ffffffffc0203506:	00009617          	auipc	a2,0x9
ffffffffc020350a:	f1260613          	addi	a2,a2,-238 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc020350e:	28500593          	li	a1,645
ffffffffc0203512:	00009517          	auipc	a0,0x9
ffffffffc0203516:	01e50513          	addi	a0,a0,30 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020351a:	f85fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020351e:	00009697          	auipc	a3,0x9
ffffffffc0203522:	53a68693          	addi	a3,a3,1338 # ffffffffc020ca58 <default_pmm_manager+0x678>
ffffffffc0203526:	00008617          	auipc	a2,0x8
ffffffffc020352a:	3d260613          	addi	a2,a2,978 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020352e:	28600593          	li	a1,646
ffffffffc0203532:	00009517          	auipc	a0,0x9
ffffffffc0203536:	ffe50513          	addi	a0,a0,-2 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020353a:	f65fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020353e:	bf7fe0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc0203542:	00009697          	auipc	a3,0x9
ffffffffc0203546:	33e68693          	addi	a3,a3,830 # ffffffffc020c880 <default_pmm_manager+0x4a0>
ffffffffc020354a:	00008617          	auipc	a2,0x8
ffffffffc020354e:	3ae60613          	addi	a2,a2,942 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203552:	26200593          	li	a1,610
ffffffffc0203556:	00009517          	auipc	a0,0x9
ffffffffc020355a:	fda50513          	addi	a0,a0,-38 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020355e:	f41fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203562:	00009697          	auipc	a3,0x9
ffffffffc0203566:	57e68693          	addi	a3,a3,1406 # ffffffffc020cae0 <default_pmm_manager+0x700>
ffffffffc020356a:	00008617          	auipc	a2,0x8
ffffffffc020356e:	38e60613          	addi	a2,a2,910 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203572:	28f00593          	li	a1,655
ffffffffc0203576:	00009517          	auipc	a0,0x9
ffffffffc020357a:	fba50513          	addi	a0,a0,-70 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020357e:	f21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203582:	00009697          	auipc	a3,0x9
ffffffffc0203586:	41e68693          	addi	a3,a3,1054 # ffffffffc020c9a0 <default_pmm_manager+0x5c0>
ffffffffc020358a:	00008617          	auipc	a2,0x8
ffffffffc020358e:	36e60613          	addi	a2,a2,878 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203592:	26e00593          	li	a1,622
ffffffffc0203596:	00009517          	auipc	a0,0x9
ffffffffc020359a:	f9a50513          	addi	a0,a0,-102 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020359e:	f01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035a2:	00009697          	auipc	a3,0x9
ffffffffc02035a6:	3ce68693          	addi	a3,a3,974 # ffffffffc020c970 <default_pmm_manager+0x590>
ffffffffc02035aa:	00008617          	auipc	a2,0x8
ffffffffc02035ae:	34e60613          	addi	a2,a2,846 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02035b2:	26400593          	li	a1,612
ffffffffc02035b6:	00009517          	auipc	a0,0x9
ffffffffc02035ba:	f7a50513          	addi	a0,a0,-134 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02035be:	ee1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035c2:	00009697          	auipc	a3,0x9
ffffffffc02035c6:	21e68693          	addi	a3,a3,542 # ffffffffc020c7e0 <default_pmm_manager+0x400>
ffffffffc02035ca:	00008617          	auipc	a2,0x8
ffffffffc02035ce:	32e60613          	addi	a2,a2,814 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02035d2:	26300593          	li	a1,611
ffffffffc02035d6:	00009517          	auipc	a0,0x9
ffffffffc02035da:	f5a50513          	addi	a0,a0,-166 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02035de:	ec1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035e2:	00009697          	auipc	a3,0x9
ffffffffc02035e6:	37668693          	addi	a3,a3,886 # ffffffffc020c958 <default_pmm_manager+0x578>
ffffffffc02035ea:	00008617          	auipc	a2,0x8
ffffffffc02035ee:	30e60613          	addi	a2,a2,782 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02035f2:	26800593          	li	a1,616
ffffffffc02035f6:	00009517          	auipc	a0,0x9
ffffffffc02035fa:	f3a50513          	addi	a0,a0,-198 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02035fe:	ea1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203602:	00009697          	auipc	a3,0x9
ffffffffc0203606:	1f668693          	addi	a3,a3,502 # ffffffffc020c7f8 <default_pmm_manager+0x418>
ffffffffc020360a:	00008617          	auipc	a2,0x8
ffffffffc020360e:	2ee60613          	addi	a2,a2,750 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203612:	26700593          	li	a1,615
ffffffffc0203616:	00009517          	auipc	a0,0x9
ffffffffc020361a:	f1a50513          	addi	a0,a0,-230 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020361e:	e81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203622:	00009697          	auipc	a3,0x9
ffffffffc0203626:	44e68693          	addi	a3,a3,1102 # ffffffffc020ca70 <default_pmm_manager+0x690>
ffffffffc020362a:	00008617          	auipc	a2,0x8
ffffffffc020362e:	2ce60613          	addi	a2,a2,718 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203632:	28900593          	li	a1,649
ffffffffc0203636:	00009517          	auipc	a0,0x9
ffffffffc020363a:	efa50513          	addi	a0,a0,-262 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020363e:	e61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203642:	00009697          	auipc	a3,0x9
ffffffffc0203646:	48668693          	addi	a3,a3,1158 # ffffffffc020cac8 <default_pmm_manager+0x6e8>
ffffffffc020364a:	00008617          	auipc	a2,0x8
ffffffffc020364e:	2ae60613          	addi	a2,a2,686 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203652:	28e00593          	li	a1,654
ffffffffc0203656:	00009517          	auipc	a0,0x9
ffffffffc020365a:	eda50513          	addi	a0,a0,-294 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020365e:	e41fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203662:	00009697          	auipc	a3,0x9
ffffffffc0203666:	42668693          	addi	a3,a3,1062 # ffffffffc020ca88 <default_pmm_manager+0x6a8>
ffffffffc020366a:	00008617          	auipc	a2,0x8
ffffffffc020366e:	28e60613          	addi	a2,a2,654 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203672:	28d00593          	li	a1,653
ffffffffc0203676:	00009517          	auipc	a0,0x9
ffffffffc020367a:	eba50513          	addi	a0,a0,-326 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020367e:	e21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203682:	00009697          	auipc	a3,0x9
ffffffffc0203686:	50e68693          	addi	a3,a3,1294 # ffffffffc020cb90 <default_pmm_manager+0x7b0>
ffffffffc020368a:	00008617          	auipc	a2,0x8
ffffffffc020368e:	26e60613          	addi	a2,a2,622 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203692:	29700593          	li	a1,663
ffffffffc0203696:	00009517          	auipc	a0,0x9
ffffffffc020369a:	e9a50513          	addi	a0,a0,-358 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020369e:	e01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036a2:	00009697          	auipc	a3,0x9
ffffffffc02036a6:	4b668693          	addi	a3,a3,1206 # ffffffffc020cb58 <default_pmm_manager+0x778>
ffffffffc02036aa:	00008617          	auipc	a2,0x8
ffffffffc02036ae:	24e60613          	addi	a2,a2,590 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02036b2:	29400593          	li	a1,660
ffffffffc02036b6:	00009517          	auipc	a0,0x9
ffffffffc02036ba:	e7a50513          	addi	a0,a0,-390 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02036be:	de1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036c2:	00009697          	auipc	a3,0x9
ffffffffc02036c6:	46668693          	addi	a3,a3,1126 # ffffffffc020cb28 <default_pmm_manager+0x748>
ffffffffc02036ca:	00008617          	auipc	a2,0x8
ffffffffc02036ce:	22e60613          	addi	a2,a2,558 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02036d2:	29000593          	li	a1,656
ffffffffc02036d6:	00009517          	auipc	a0,0x9
ffffffffc02036da:	e5a50513          	addi	a0,a0,-422 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02036de:	dc1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036e2:	86a2                	mv	a3,s0
ffffffffc02036e4:	00009617          	auipc	a2,0x9
ffffffffc02036e8:	ddc60613          	addi	a2,a2,-548 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc02036ec:	0dc00593          	li	a1,220
ffffffffc02036f0:	00009517          	auipc	a0,0x9
ffffffffc02036f4:	e4050513          	addi	a0,a0,-448 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02036f8:	da7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036fc:	86ae                	mv	a3,a1
ffffffffc02036fe:	00009617          	auipc	a2,0x9
ffffffffc0203702:	dc260613          	addi	a2,a2,-574 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc0203706:	0db00593          	li	a1,219
ffffffffc020370a:	00009517          	auipc	a0,0x9
ffffffffc020370e:	e2650513          	addi	a0,a0,-474 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203712:	d8dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203716:	00009697          	auipc	a3,0x9
ffffffffc020371a:	ffa68693          	addi	a3,a3,-6 # ffffffffc020c710 <default_pmm_manager+0x330>
ffffffffc020371e:	00008617          	auipc	a2,0x8
ffffffffc0203722:	1da60613          	addi	a2,a2,474 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203726:	24700593          	li	a1,583
ffffffffc020372a:	00009517          	auipc	a0,0x9
ffffffffc020372e:	e0650513          	addi	a0,a0,-506 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203732:	d6dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203736:	00009697          	auipc	a3,0x9
ffffffffc020373a:	fba68693          	addi	a3,a3,-70 # ffffffffc020c6f0 <default_pmm_manager+0x310>
ffffffffc020373e:	00008617          	auipc	a2,0x8
ffffffffc0203742:	1ba60613          	addi	a2,a2,442 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203746:	24600593          	li	a1,582
ffffffffc020374a:	00009517          	auipc	a0,0x9
ffffffffc020374e:	de650513          	addi	a0,a0,-538 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203752:	d4dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203756:	00009617          	auipc	a2,0x9
ffffffffc020375a:	f2a60613          	addi	a2,a2,-214 # ffffffffc020c680 <default_pmm_manager+0x2a0>
ffffffffc020375e:	0aa00593          	li	a1,170
ffffffffc0203762:	00009517          	auipc	a0,0x9
ffffffffc0203766:	dce50513          	addi	a0,a0,-562 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020376a:	d35fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020376e:	00009617          	auipc	a2,0x9
ffffffffc0203772:	e7a60613          	addi	a2,a2,-390 # ffffffffc020c5e8 <default_pmm_manager+0x208>
ffffffffc0203776:	06500593          	li	a1,101
ffffffffc020377a:	00009517          	auipc	a0,0x9
ffffffffc020377e:	db650513          	addi	a0,a0,-586 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203782:	d1dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203786:	00009697          	auipc	a3,0x9
ffffffffc020378a:	24a68693          	addi	a3,a3,586 # ffffffffc020c9d0 <default_pmm_manager+0x5f0>
ffffffffc020378e:	00008617          	auipc	a2,0x8
ffffffffc0203792:	16a60613          	addi	a2,a2,362 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203796:	2a000593          	li	a1,672
ffffffffc020379a:	00009517          	auipc	a0,0x9
ffffffffc020379e:	d9650513          	addi	a0,a0,-618 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02037a2:	cfdfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037a6:	00009697          	auipc	a3,0x9
ffffffffc02037aa:	06a68693          	addi	a3,a3,106 # ffffffffc020c810 <default_pmm_manager+0x430>
ffffffffc02037ae:	00008617          	auipc	a2,0x8
ffffffffc02037b2:	14a60613          	addi	a2,a2,330 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02037b6:	25500593          	li	a1,597
ffffffffc02037ba:	00009517          	auipc	a0,0x9
ffffffffc02037be:	d7650513          	addi	a0,a0,-650 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02037c2:	cddfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037c6:	86d6                	mv	a3,s5
ffffffffc02037c8:	00009617          	auipc	a2,0x9
ffffffffc02037cc:	c5060613          	addi	a2,a2,-944 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc02037d0:	25400593          	li	a1,596
ffffffffc02037d4:	00009517          	auipc	a0,0x9
ffffffffc02037d8:	d5c50513          	addi	a0,a0,-676 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02037dc:	cc3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037e0:	00009697          	auipc	a3,0x9
ffffffffc02037e4:	17868693          	addi	a3,a3,376 # ffffffffc020c958 <default_pmm_manager+0x578>
ffffffffc02037e8:	00008617          	auipc	a2,0x8
ffffffffc02037ec:	11060613          	addi	a2,a2,272 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02037f0:	26100593          	li	a1,609
ffffffffc02037f4:	00009517          	auipc	a0,0x9
ffffffffc02037f8:	d3c50513          	addi	a0,a0,-708 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02037fc:	ca3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203800:	00009697          	auipc	a3,0x9
ffffffffc0203804:	14068693          	addi	a3,a3,320 # ffffffffc020c940 <default_pmm_manager+0x560>
ffffffffc0203808:	00008617          	auipc	a2,0x8
ffffffffc020380c:	0f060613          	addi	a2,a2,240 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203810:	26000593          	li	a1,608
ffffffffc0203814:	00009517          	auipc	a0,0x9
ffffffffc0203818:	d1c50513          	addi	a0,a0,-740 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020381c:	c83fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203820:	00009697          	auipc	a3,0x9
ffffffffc0203824:	0f068693          	addi	a3,a3,240 # ffffffffc020c910 <default_pmm_manager+0x530>
ffffffffc0203828:	00008617          	auipc	a2,0x8
ffffffffc020382c:	0d060613          	addi	a2,a2,208 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203830:	25f00593          	li	a1,607
ffffffffc0203834:	00009517          	auipc	a0,0x9
ffffffffc0203838:	cfc50513          	addi	a0,a0,-772 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020383c:	c63fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203840:	00009697          	auipc	a3,0x9
ffffffffc0203844:	0b868693          	addi	a3,a3,184 # ffffffffc020c8f8 <default_pmm_manager+0x518>
ffffffffc0203848:	00008617          	auipc	a2,0x8
ffffffffc020384c:	0b060613          	addi	a2,a2,176 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203850:	25d00593          	li	a1,605
ffffffffc0203854:	00009517          	auipc	a0,0x9
ffffffffc0203858:	cdc50513          	addi	a0,a0,-804 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020385c:	c43fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203860:	00009697          	auipc	a3,0x9
ffffffffc0203864:	07868693          	addi	a3,a3,120 # ffffffffc020c8d8 <default_pmm_manager+0x4f8>
ffffffffc0203868:	00008617          	auipc	a2,0x8
ffffffffc020386c:	09060613          	addi	a2,a2,144 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203870:	25c00593          	li	a1,604
ffffffffc0203874:	00009517          	auipc	a0,0x9
ffffffffc0203878:	cbc50513          	addi	a0,a0,-836 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020387c:	c23fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203880:	00009697          	auipc	a3,0x9
ffffffffc0203884:	04868693          	addi	a3,a3,72 # ffffffffc020c8c8 <default_pmm_manager+0x4e8>
ffffffffc0203888:	00008617          	auipc	a2,0x8
ffffffffc020388c:	07060613          	addi	a2,a2,112 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203890:	25b00593          	li	a1,603
ffffffffc0203894:	00009517          	auipc	a0,0x9
ffffffffc0203898:	c9c50513          	addi	a0,a0,-868 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020389c:	c03fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038a0:	00009697          	auipc	a3,0x9
ffffffffc02038a4:	01868693          	addi	a3,a3,24 # ffffffffc020c8b8 <default_pmm_manager+0x4d8>
ffffffffc02038a8:	00008617          	auipc	a2,0x8
ffffffffc02038ac:	05060613          	addi	a2,a2,80 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02038b0:	25a00593          	li	a1,602
ffffffffc02038b4:	00009517          	auipc	a0,0x9
ffffffffc02038b8:	c7c50513          	addi	a0,a0,-900 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02038bc:	be3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038c0:	00009697          	auipc	a3,0x9
ffffffffc02038c4:	fc068693          	addi	a3,a3,-64 # ffffffffc020c880 <default_pmm_manager+0x4a0>
ffffffffc02038c8:	00008617          	auipc	a2,0x8
ffffffffc02038cc:	03060613          	addi	a2,a2,48 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02038d0:	25900593          	li	a1,601
ffffffffc02038d4:	00009517          	auipc	a0,0x9
ffffffffc02038d8:	c5c50513          	addi	a0,a0,-932 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02038dc:	bc3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038e0:	00009697          	auipc	a3,0x9
ffffffffc02038e4:	0f068693          	addi	a3,a3,240 # ffffffffc020c9d0 <default_pmm_manager+0x5f0>
ffffffffc02038e8:	00008617          	auipc	a2,0x8
ffffffffc02038ec:	01060613          	addi	a2,a2,16 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02038f0:	27600593          	li	a1,630
ffffffffc02038f4:	00009517          	auipc	a0,0x9
ffffffffc02038f8:	c3c50513          	addi	a0,a0,-964 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02038fc:	ba3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203900:	00009617          	auipc	a2,0x9
ffffffffc0203904:	b1860613          	addi	a2,a2,-1256 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc0203908:	07100593          	li	a1,113
ffffffffc020390c:	00009517          	auipc	a0,0x9
ffffffffc0203910:	b3450513          	addi	a0,a0,-1228 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0203914:	b8bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203918:	86a2                	mv	a3,s0
ffffffffc020391a:	00009617          	auipc	a2,0x9
ffffffffc020391e:	ba660613          	addi	a2,a2,-1114 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc0203922:	0ca00593          	li	a1,202
ffffffffc0203926:	00009517          	auipc	a0,0x9
ffffffffc020392a:	c0a50513          	addi	a0,a0,-1014 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc020392e:	b71fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203932:	00009617          	auipc	a2,0x9
ffffffffc0203936:	b8e60613          	addi	a2,a2,-1138 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc020393a:	08100593          	li	a1,129
ffffffffc020393e:	00009517          	auipc	a0,0x9
ffffffffc0203942:	bf250513          	addi	a0,a0,-1038 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203946:	b59fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020394a:	00009697          	auipc	a3,0x9
ffffffffc020394e:	ef668693          	addi	a3,a3,-266 # ffffffffc020c840 <default_pmm_manager+0x460>
ffffffffc0203952:	00008617          	auipc	a2,0x8
ffffffffc0203956:	fa660613          	addi	a2,a2,-90 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020395a:	25800593          	li	a1,600
ffffffffc020395e:	00009517          	auipc	a0,0x9
ffffffffc0203962:	bd250513          	addi	a0,a0,-1070 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203966:	b39fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020396a:	00009697          	auipc	a3,0x9
ffffffffc020396e:	e1668693          	addi	a3,a3,-490 # ffffffffc020c780 <default_pmm_manager+0x3a0>
ffffffffc0203972:	00008617          	auipc	a2,0x8
ffffffffc0203976:	f8660613          	addi	a2,a2,-122 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020397a:	24c00593          	li	a1,588
ffffffffc020397e:	00009517          	auipc	a0,0x9
ffffffffc0203982:	bb250513          	addi	a0,a0,-1102 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203986:	b19fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020398a:	fc6fe0ef          	jal	ra,ffffffffc0202150 <pte2page.part.0>
ffffffffc020398e:	00009697          	auipc	a3,0x9
ffffffffc0203992:	e2268693          	addi	a3,a3,-478 # ffffffffc020c7b0 <default_pmm_manager+0x3d0>
ffffffffc0203996:	00008617          	auipc	a2,0x8
ffffffffc020399a:	f6260613          	addi	a2,a2,-158 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020399e:	24f00593          	li	a1,591
ffffffffc02039a2:	00009517          	auipc	a0,0x9
ffffffffc02039a6:	b8e50513          	addi	a0,a0,-1138 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02039aa:	af5fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02039ae:	00009697          	auipc	a3,0x9
ffffffffc02039b2:	da268693          	addi	a3,a3,-606 # ffffffffc020c750 <default_pmm_manager+0x370>
ffffffffc02039b6:	00008617          	auipc	a2,0x8
ffffffffc02039ba:	f4260613          	addi	a2,a2,-190 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02039be:	24800593          	li	a1,584
ffffffffc02039c2:	00009517          	auipc	a0,0x9
ffffffffc02039c6:	b6e50513          	addi	a0,a0,-1170 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02039ca:	ad5fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02039ce:	00009697          	auipc	a3,0x9
ffffffffc02039d2:	e1268693          	addi	a3,a3,-494 # ffffffffc020c7e0 <default_pmm_manager+0x400>
ffffffffc02039d6:	00008617          	auipc	a2,0x8
ffffffffc02039da:	f2260613          	addi	a2,a2,-222 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02039de:	25000593          	li	a1,592
ffffffffc02039e2:	00009517          	auipc	a0,0x9
ffffffffc02039e6:	b4e50513          	addi	a0,a0,-1202 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc02039ea:	ab5fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02039ee:	00009617          	auipc	a2,0x9
ffffffffc02039f2:	a2a60613          	addi	a2,a2,-1494 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc02039f6:	25300593          	li	a1,595
ffffffffc02039fa:	00009517          	auipc	a0,0x9
ffffffffc02039fe:	b3650513          	addi	a0,a0,-1226 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203a02:	a9dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a06:	00009697          	auipc	a3,0x9
ffffffffc0203a0a:	df268693          	addi	a3,a3,-526 # ffffffffc020c7f8 <default_pmm_manager+0x418>
ffffffffc0203a0e:	00008617          	auipc	a2,0x8
ffffffffc0203a12:	eea60613          	addi	a2,a2,-278 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203a16:	25100593          	li	a1,593
ffffffffc0203a1a:	00009517          	auipc	a0,0x9
ffffffffc0203a1e:	b1650513          	addi	a0,a0,-1258 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203a22:	a7dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a26:	86ca                	mv	a3,s2
ffffffffc0203a28:	00009617          	auipc	a2,0x9
ffffffffc0203a2c:	a9860613          	addi	a2,a2,-1384 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc0203a30:	0c600593          	li	a1,198
ffffffffc0203a34:	00009517          	auipc	a0,0x9
ffffffffc0203a38:	afc50513          	addi	a0,a0,-1284 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203a3c:	a63fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a40:	00009697          	auipc	a3,0x9
ffffffffc0203a44:	f1868693          	addi	a3,a3,-232 # ffffffffc020c958 <default_pmm_manager+0x578>
ffffffffc0203a48:	00008617          	auipc	a2,0x8
ffffffffc0203a4c:	eb060613          	addi	a2,a2,-336 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203a50:	26c00593          	li	a1,620
ffffffffc0203a54:	00009517          	auipc	a0,0x9
ffffffffc0203a58:	adc50513          	addi	a0,a0,-1316 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203a5c:	a43fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a60:	00009697          	auipc	a3,0x9
ffffffffc0203a64:	f2868693          	addi	a3,a3,-216 # ffffffffc020c988 <default_pmm_manager+0x5a8>
ffffffffc0203a68:	00008617          	auipc	a2,0x8
ffffffffc0203a6c:	e9060613          	addi	a2,a2,-368 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203a70:	26b00593          	li	a1,619
ffffffffc0203a74:	00009517          	auipc	a0,0x9
ffffffffc0203a78:	abc50513          	addi	a0,a0,-1348 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203a7c:	a23fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203a80 <pgdir_alloc_page>:
ffffffffc0203a80:	7179                	addi	sp,sp,-48
ffffffffc0203a82:	ec26                	sd	s1,24(sp)
ffffffffc0203a84:	e84a                	sd	s2,16(sp)
ffffffffc0203a86:	e052                	sd	s4,0(sp)
ffffffffc0203a88:	f406                	sd	ra,40(sp)
ffffffffc0203a8a:	f022                	sd	s0,32(sp)
ffffffffc0203a8c:	e44e                	sd	s3,8(sp)
ffffffffc0203a8e:	8a2a                	mv	s4,a0
ffffffffc0203a90:	84ae                	mv	s1,a1
ffffffffc0203a92:	8932                	mv	s2,a2
ffffffffc0203a94:	100027f3          	csrr	a5,sstatus
ffffffffc0203a98:	8b89                	andi	a5,a5,2
ffffffffc0203a9a:	00093997          	auipc	s3,0x93
ffffffffc0203a9e:	e1698993          	addi	s3,s3,-490 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203aa2:	ef8d                	bnez	a5,ffffffffc0203adc <pgdir_alloc_page+0x5c>
ffffffffc0203aa4:	0009b783          	ld	a5,0(s3)
ffffffffc0203aa8:	4505                	li	a0,1
ffffffffc0203aaa:	6f9c                	ld	a5,24(a5)
ffffffffc0203aac:	9782                	jalr	a5
ffffffffc0203aae:	842a                	mv	s0,a0
ffffffffc0203ab0:	cc09                	beqz	s0,ffffffffc0203aca <pgdir_alloc_page+0x4a>
ffffffffc0203ab2:	86ca                	mv	a3,s2
ffffffffc0203ab4:	8626                	mv	a2,s1
ffffffffc0203ab6:	85a2                	mv	a1,s0
ffffffffc0203ab8:	8552                	mv	a0,s4
ffffffffc0203aba:	8deff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc0203abe:	e915                	bnez	a0,ffffffffc0203af2 <pgdir_alloc_page+0x72>
ffffffffc0203ac0:	4018                	lw	a4,0(s0)
ffffffffc0203ac2:	fc04                	sd	s1,56(s0)
ffffffffc0203ac4:	4785                	li	a5,1
ffffffffc0203ac6:	04f71e63          	bne	a4,a5,ffffffffc0203b22 <pgdir_alloc_page+0xa2>
ffffffffc0203aca:	70a2                	ld	ra,40(sp)
ffffffffc0203acc:	8522                	mv	a0,s0
ffffffffc0203ace:	7402                	ld	s0,32(sp)
ffffffffc0203ad0:	64e2                	ld	s1,24(sp)
ffffffffc0203ad2:	6942                	ld	s2,16(sp)
ffffffffc0203ad4:	69a2                	ld	s3,8(sp)
ffffffffc0203ad6:	6a02                	ld	s4,0(sp)
ffffffffc0203ad8:	6145                	addi	sp,sp,48
ffffffffc0203ada:	8082                	ret
ffffffffc0203adc:	996fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203ae0:	0009b783          	ld	a5,0(s3)
ffffffffc0203ae4:	4505                	li	a0,1
ffffffffc0203ae6:	6f9c                	ld	a5,24(a5)
ffffffffc0203ae8:	9782                	jalr	a5
ffffffffc0203aea:	842a                	mv	s0,a0
ffffffffc0203aec:	980fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203af0:	b7c1                	j	ffffffffc0203ab0 <pgdir_alloc_page+0x30>
ffffffffc0203af2:	100027f3          	csrr	a5,sstatus
ffffffffc0203af6:	8b89                	andi	a5,a5,2
ffffffffc0203af8:	eb89                	bnez	a5,ffffffffc0203b0a <pgdir_alloc_page+0x8a>
ffffffffc0203afa:	0009b783          	ld	a5,0(s3)
ffffffffc0203afe:	8522                	mv	a0,s0
ffffffffc0203b00:	4585                	li	a1,1
ffffffffc0203b02:	739c                	ld	a5,32(a5)
ffffffffc0203b04:	4401                	li	s0,0
ffffffffc0203b06:	9782                	jalr	a5
ffffffffc0203b08:	b7c9                	j	ffffffffc0203aca <pgdir_alloc_page+0x4a>
ffffffffc0203b0a:	968fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203b0e:	0009b783          	ld	a5,0(s3)
ffffffffc0203b12:	8522                	mv	a0,s0
ffffffffc0203b14:	4585                	li	a1,1
ffffffffc0203b16:	739c                	ld	a5,32(a5)
ffffffffc0203b18:	4401                	li	s0,0
ffffffffc0203b1a:	9782                	jalr	a5
ffffffffc0203b1c:	950fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203b20:	b76d                	j	ffffffffc0203aca <pgdir_alloc_page+0x4a>
ffffffffc0203b22:	00009697          	auipc	a3,0x9
ffffffffc0203b26:	0b668693          	addi	a3,a3,182 # ffffffffc020cbd8 <default_pmm_manager+0x7f8>
ffffffffc0203b2a:	00008617          	auipc	a2,0x8
ffffffffc0203b2e:	dce60613          	addi	a2,a2,-562 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203b32:	22d00593          	li	a1,557
ffffffffc0203b36:	00009517          	auipc	a0,0x9
ffffffffc0203b3a:	9fa50513          	addi	a0,a0,-1542 # ffffffffc020c530 <default_pmm_manager+0x150>
ffffffffc0203b3e:	961fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203b42 <check_vma_overlap.part.0>:
ffffffffc0203b42:	1141                	addi	sp,sp,-16
ffffffffc0203b44:	00009697          	auipc	a3,0x9
ffffffffc0203b48:	0ac68693          	addi	a3,a3,172 # ffffffffc020cbf0 <default_pmm_manager+0x810>
ffffffffc0203b4c:	00008617          	auipc	a2,0x8
ffffffffc0203b50:	dac60613          	addi	a2,a2,-596 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203b54:	07400593          	li	a1,116
ffffffffc0203b58:	00009517          	auipc	a0,0x9
ffffffffc0203b5c:	0b850513          	addi	a0,a0,184 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0203b60:	e406                	sd	ra,8(sp)
ffffffffc0203b62:	93dfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203b66 <mm_create>:
ffffffffc0203b66:	1141                	addi	sp,sp,-16
ffffffffc0203b68:	05800513          	li	a0,88
ffffffffc0203b6c:	e022                	sd	s0,0(sp)
ffffffffc0203b6e:	e406                	sd	ra,8(sp)
ffffffffc0203b70:	c1efe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203b74:	842a                	mv	s0,a0
ffffffffc0203b76:	c115                	beqz	a0,ffffffffc0203b9a <mm_create+0x34>
ffffffffc0203b78:	e408                	sd	a0,8(s0)
ffffffffc0203b7a:	e008                	sd	a0,0(s0)
ffffffffc0203b7c:	00053823          	sd	zero,16(a0)
ffffffffc0203b80:	00053c23          	sd	zero,24(a0)
ffffffffc0203b84:	02052023          	sw	zero,32(a0)
ffffffffc0203b88:	02053423          	sd	zero,40(a0)
ffffffffc0203b8c:	02052823          	sw	zero,48(a0)
ffffffffc0203b90:	4585                	li	a1,1
ffffffffc0203b92:	03850513          	addi	a0,a0,56
ffffffffc0203b96:	123000ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc0203b9a:	60a2                	ld	ra,8(sp)
ffffffffc0203b9c:	8522                	mv	a0,s0
ffffffffc0203b9e:	6402                	ld	s0,0(sp)
ffffffffc0203ba0:	0141                	addi	sp,sp,16
ffffffffc0203ba2:	8082                	ret

ffffffffc0203ba4 <find_vma>:
ffffffffc0203ba4:	86aa                	mv	a3,a0
ffffffffc0203ba6:	c505                	beqz	a0,ffffffffc0203bce <find_vma+0x2a>
ffffffffc0203ba8:	6908                	ld	a0,16(a0)
ffffffffc0203baa:	c501                	beqz	a0,ffffffffc0203bb2 <find_vma+0xe>
ffffffffc0203bac:	651c                	ld	a5,8(a0)
ffffffffc0203bae:	02f5f263          	bgeu	a1,a5,ffffffffc0203bd2 <find_vma+0x2e>
ffffffffc0203bb2:	669c                	ld	a5,8(a3)
ffffffffc0203bb4:	00f68d63          	beq	a3,a5,ffffffffc0203bce <find_vma+0x2a>
ffffffffc0203bb8:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203bbc:	00e5e663          	bltu	a1,a4,ffffffffc0203bc8 <find_vma+0x24>
ffffffffc0203bc0:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203bc4:	00e5ec63          	bltu	a1,a4,ffffffffc0203bdc <find_vma+0x38>
ffffffffc0203bc8:	679c                	ld	a5,8(a5)
ffffffffc0203bca:	fef697e3          	bne	a3,a5,ffffffffc0203bb8 <find_vma+0x14>
ffffffffc0203bce:	4501                	li	a0,0
ffffffffc0203bd0:	8082                	ret
ffffffffc0203bd2:	691c                	ld	a5,16(a0)
ffffffffc0203bd4:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0203bb2 <find_vma+0xe>
ffffffffc0203bd8:	ea88                	sd	a0,16(a3)
ffffffffc0203bda:	8082                	ret
ffffffffc0203bdc:	fe078513          	addi	a0,a5,-32
ffffffffc0203be0:	ea88                	sd	a0,16(a3)
ffffffffc0203be2:	8082                	ret

ffffffffc0203be4 <insert_vma_struct>:
ffffffffc0203be4:	6590                	ld	a2,8(a1)
ffffffffc0203be6:	0105b803          	ld	a6,16(a1)
ffffffffc0203bea:	1141                	addi	sp,sp,-16
ffffffffc0203bec:	e406                	sd	ra,8(sp)
ffffffffc0203bee:	87aa                	mv	a5,a0
ffffffffc0203bf0:	01066763          	bltu	a2,a6,ffffffffc0203bfe <insert_vma_struct+0x1a>
ffffffffc0203bf4:	a085                	j	ffffffffc0203c54 <insert_vma_struct+0x70>
ffffffffc0203bf6:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203bfa:	04e66863          	bltu	a2,a4,ffffffffc0203c4a <insert_vma_struct+0x66>
ffffffffc0203bfe:	86be                	mv	a3,a5
ffffffffc0203c00:	679c                	ld	a5,8(a5)
ffffffffc0203c02:	fef51ae3          	bne	a0,a5,ffffffffc0203bf6 <insert_vma_struct+0x12>
ffffffffc0203c06:	02a68463          	beq	a3,a0,ffffffffc0203c2e <insert_vma_struct+0x4a>
ffffffffc0203c0a:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203c0e:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203c12:	08e8f163          	bgeu	a7,a4,ffffffffc0203c94 <insert_vma_struct+0xb0>
ffffffffc0203c16:	04e66f63          	bltu	a2,a4,ffffffffc0203c74 <insert_vma_struct+0x90>
ffffffffc0203c1a:	00f50a63          	beq	a0,a5,ffffffffc0203c2e <insert_vma_struct+0x4a>
ffffffffc0203c1e:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203c22:	05076963          	bltu	a4,a6,ffffffffc0203c74 <insert_vma_struct+0x90>
ffffffffc0203c26:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203c2a:	02c77363          	bgeu	a4,a2,ffffffffc0203c50 <insert_vma_struct+0x6c>
ffffffffc0203c2e:	5118                	lw	a4,32(a0)
ffffffffc0203c30:	e188                	sd	a0,0(a1)
ffffffffc0203c32:	02058613          	addi	a2,a1,32
ffffffffc0203c36:	e390                	sd	a2,0(a5)
ffffffffc0203c38:	e690                	sd	a2,8(a3)
ffffffffc0203c3a:	60a2                	ld	ra,8(sp)
ffffffffc0203c3c:	f59c                	sd	a5,40(a1)
ffffffffc0203c3e:	f194                	sd	a3,32(a1)
ffffffffc0203c40:	0017079b          	addiw	a5,a4,1
ffffffffc0203c44:	d11c                	sw	a5,32(a0)
ffffffffc0203c46:	0141                	addi	sp,sp,16
ffffffffc0203c48:	8082                	ret
ffffffffc0203c4a:	fca690e3          	bne	a3,a0,ffffffffc0203c0a <insert_vma_struct+0x26>
ffffffffc0203c4e:	bfd1                	j	ffffffffc0203c22 <insert_vma_struct+0x3e>
ffffffffc0203c50:	ef3ff0ef          	jal	ra,ffffffffc0203b42 <check_vma_overlap.part.0>
ffffffffc0203c54:	00009697          	auipc	a3,0x9
ffffffffc0203c58:	fcc68693          	addi	a3,a3,-52 # ffffffffc020cc20 <default_pmm_manager+0x840>
ffffffffc0203c5c:	00008617          	auipc	a2,0x8
ffffffffc0203c60:	c9c60613          	addi	a2,a2,-868 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203c64:	07a00593          	li	a1,122
ffffffffc0203c68:	00009517          	auipc	a0,0x9
ffffffffc0203c6c:	fa850513          	addi	a0,a0,-88 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0203c70:	82ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203c74:	00009697          	auipc	a3,0x9
ffffffffc0203c78:	fec68693          	addi	a3,a3,-20 # ffffffffc020cc60 <default_pmm_manager+0x880>
ffffffffc0203c7c:	00008617          	auipc	a2,0x8
ffffffffc0203c80:	c7c60613          	addi	a2,a2,-900 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203c84:	07300593          	li	a1,115
ffffffffc0203c88:	00009517          	auipc	a0,0x9
ffffffffc0203c8c:	f8850513          	addi	a0,a0,-120 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0203c90:	80ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203c94:	00009697          	auipc	a3,0x9
ffffffffc0203c98:	fac68693          	addi	a3,a3,-84 # ffffffffc020cc40 <default_pmm_manager+0x860>
ffffffffc0203c9c:	00008617          	auipc	a2,0x8
ffffffffc0203ca0:	c5c60613          	addi	a2,a2,-932 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203ca4:	07200593          	li	a1,114
ffffffffc0203ca8:	00009517          	auipc	a0,0x9
ffffffffc0203cac:	f6850513          	addi	a0,a0,-152 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0203cb0:	feefc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203cb4 <mm_destroy>:
ffffffffc0203cb4:	591c                	lw	a5,48(a0)
ffffffffc0203cb6:	1141                	addi	sp,sp,-16
ffffffffc0203cb8:	e406                	sd	ra,8(sp)
ffffffffc0203cba:	e022                	sd	s0,0(sp)
ffffffffc0203cbc:	e78d                	bnez	a5,ffffffffc0203ce6 <mm_destroy+0x32>
ffffffffc0203cbe:	842a                	mv	s0,a0
ffffffffc0203cc0:	6508                	ld	a0,8(a0)
ffffffffc0203cc2:	00a40c63          	beq	s0,a0,ffffffffc0203cda <mm_destroy+0x26>
ffffffffc0203cc6:	6118                	ld	a4,0(a0)
ffffffffc0203cc8:	651c                	ld	a5,8(a0)
ffffffffc0203cca:	1501                	addi	a0,a0,-32
ffffffffc0203ccc:	e71c                	sd	a5,8(a4)
ffffffffc0203cce:	e398                	sd	a4,0(a5)
ffffffffc0203cd0:	b6efe0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0203cd4:	6408                	ld	a0,8(s0)
ffffffffc0203cd6:	fea418e3          	bne	s0,a0,ffffffffc0203cc6 <mm_destroy+0x12>
ffffffffc0203cda:	8522                	mv	a0,s0
ffffffffc0203cdc:	6402                	ld	s0,0(sp)
ffffffffc0203cde:	60a2                	ld	ra,8(sp)
ffffffffc0203ce0:	0141                	addi	sp,sp,16
ffffffffc0203ce2:	b5cfe06f          	j	ffffffffc020203e <kfree>
ffffffffc0203ce6:	00009697          	auipc	a3,0x9
ffffffffc0203cea:	f9a68693          	addi	a3,a3,-102 # ffffffffc020cc80 <default_pmm_manager+0x8a0>
ffffffffc0203cee:	00008617          	auipc	a2,0x8
ffffffffc0203cf2:	c0a60613          	addi	a2,a2,-1014 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203cf6:	09e00593          	li	a1,158
ffffffffc0203cfa:	00009517          	auipc	a0,0x9
ffffffffc0203cfe:	f1650513          	addi	a0,a0,-234 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0203d02:	f9cfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203d06 <mm_map>:
ffffffffc0203d06:	7139                	addi	sp,sp,-64
ffffffffc0203d08:	f822                	sd	s0,48(sp)
ffffffffc0203d0a:	6405                	lui	s0,0x1
ffffffffc0203d0c:	147d                	addi	s0,s0,-1
ffffffffc0203d0e:	77fd                	lui	a5,0xfffff
ffffffffc0203d10:	9622                	add	a2,a2,s0
ffffffffc0203d12:	962e                	add	a2,a2,a1
ffffffffc0203d14:	f426                	sd	s1,40(sp)
ffffffffc0203d16:	fc06                	sd	ra,56(sp)
ffffffffc0203d18:	00f5f4b3          	and	s1,a1,a5
ffffffffc0203d1c:	f04a                	sd	s2,32(sp)
ffffffffc0203d1e:	ec4e                	sd	s3,24(sp)
ffffffffc0203d20:	e852                	sd	s4,16(sp)
ffffffffc0203d22:	e456                	sd	s5,8(sp)
ffffffffc0203d24:	002005b7          	lui	a1,0x200
ffffffffc0203d28:	00f67433          	and	s0,a2,a5
ffffffffc0203d2c:	06b4e363          	bltu	s1,a1,ffffffffc0203d92 <mm_map+0x8c>
ffffffffc0203d30:	0684f163          	bgeu	s1,s0,ffffffffc0203d92 <mm_map+0x8c>
ffffffffc0203d34:	4785                	li	a5,1
ffffffffc0203d36:	07fe                	slli	a5,a5,0x1f
ffffffffc0203d38:	0487ed63          	bltu	a5,s0,ffffffffc0203d92 <mm_map+0x8c>
ffffffffc0203d3c:	89aa                	mv	s3,a0
ffffffffc0203d3e:	cd21                	beqz	a0,ffffffffc0203d96 <mm_map+0x90>
ffffffffc0203d40:	85a6                	mv	a1,s1
ffffffffc0203d42:	8ab6                	mv	s5,a3
ffffffffc0203d44:	8a3a                	mv	s4,a4
ffffffffc0203d46:	e5fff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0203d4a:	c501                	beqz	a0,ffffffffc0203d52 <mm_map+0x4c>
ffffffffc0203d4c:	651c                	ld	a5,8(a0)
ffffffffc0203d4e:	0487e263          	bltu	a5,s0,ffffffffc0203d92 <mm_map+0x8c>
ffffffffc0203d52:	03000513          	li	a0,48
ffffffffc0203d56:	a38fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203d5a:	892a                	mv	s2,a0
ffffffffc0203d5c:	5571                	li	a0,-4
ffffffffc0203d5e:	02090163          	beqz	s2,ffffffffc0203d80 <mm_map+0x7a>
ffffffffc0203d62:	854e                	mv	a0,s3
ffffffffc0203d64:	00993423          	sd	s1,8(s2)
ffffffffc0203d68:	00893823          	sd	s0,16(s2)
ffffffffc0203d6c:	01592c23          	sw	s5,24(s2)
ffffffffc0203d70:	85ca                	mv	a1,s2
ffffffffc0203d72:	e73ff0ef          	jal	ra,ffffffffc0203be4 <insert_vma_struct>
ffffffffc0203d76:	4501                	li	a0,0
ffffffffc0203d78:	000a0463          	beqz	s4,ffffffffc0203d80 <mm_map+0x7a>
ffffffffc0203d7c:	012a3023          	sd	s2,0(s4)
ffffffffc0203d80:	70e2                	ld	ra,56(sp)
ffffffffc0203d82:	7442                	ld	s0,48(sp)
ffffffffc0203d84:	74a2                	ld	s1,40(sp)
ffffffffc0203d86:	7902                	ld	s2,32(sp)
ffffffffc0203d88:	69e2                	ld	s3,24(sp)
ffffffffc0203d8a:	6a42                	ld	s4,16(sp)
ffffffffc0203d8c:	6aa2                	ld	s5,8(sp)
ffffffffc0203d8e:	6121                	addi	sp,sp,64
ffffffffc0203d90:	8082                	ret
ffffffffc0203d92:	5575                	li	a0,-3
ffffffffc0203d94:	b7f5                	j	ffffffffc0203d80 <mm_map+0x7a>
ffffffffc0203d96:	00009697          	auipc	a3,0x9
ffffffffc0203d9a:	f0268693          	addi	a3,a3,-254 # ffffffffc020cc98 <default_pmm_manager+0x8b8>
ffffffffc0203d9e:	00008617          	auipc	a2,0x8
ffffffffc0203da2:	b5a60613          	addi	a2,a2,-1190 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203da6:	0b300593          	li	a1,179
ffffffffc0203daa:	00009517          	auipc	a0,0x9
ffffffffc0203dae:	e6650513          	addi	a0,a0,-410 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0203db2:	eecfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203db6 <dup_mmap>:
ffffffffc0203db6:	7139                	addi	sp,sp,-64
ffffffffc0203db8:	fc06                	sd	ra,56(sp)
ffffffffc0203dba:	f822                	sd	s0,48(sp)
ffffffffc0203dbc:	f426                	sd	s1,40(sp)
ffffffffc0203dbe:	f04a                	sd	s2,32(sp)
ffffffffc0203dc0:	ec4e                	sd	s3,24(sp)
ffffffffc0203dc2:	e852                	sd	s4,16(sp)
ffffffffc0203dc4:	e456                	sd	s5,8(sp)
ffffffffc0203dc6:	c52d                	beqz	a0,ffffffffc0203e30 <dup_mmap+0x7a>
ffffffffc0203dc8:	892a                	mv	s2,a0
ffffffffc0203dca:	84ae                	mv	s1,a1
ffffffffc0203dcc:	842e                	mv	s0,a1
ffffffffc0203dce:	e595                	bnez	a1,ffffffffc0203dfa <dup_mmap+0x44>
ffffffffc0203dd0:	a085                	j	ffffffffc0203e30 <dup_mmap+0x7a>
ffffffffc0203dd2:	854a                	mv	a0,s2
ffffffffc0203dd4:	0155b423          	sd	s5,8(a1) # 200008 <_binary_bin_sfs_img_size+0x18ad08>
ffffffffc0203dd8:	0145b823          	sd	s4,16(a1)
ffffffffc0203ddc:	0135ac23          	sw	s3,24(a1)
ffffffffc0203de0:	e05ff0ef          	jal	ra,ffffffffc0203be4 <insert_vma_struct>
ffffffffc0203de4:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_bin_swap_img_size-0x6d10>
ffffffffc0203de8:	fe843603          	ld	a2,-24(s0)
ffffffffc0203dec:	6c8c                	ld	a1,24(s1)
ffffffffc0203dee:	01893503          	ld	a0,24(s2)
ffffffffc0203df2:	4701                	li	a4,0
ffffffffc0203df4:	b4bfe0ef          	jal	ra,ffffffffc020293e <copy_range>
ffffffffc0203df8:	e105                	bnez	a0,ffffffffc0203e18 <dup_mmap+0x62>
ffffffffc0203dfa:	6000                	ld	s0,0(s0)
ffffffffc0203dfc:	02848863          	beq	s1,s0,ffffffffc0203e2c <dup_mmap+0x76>
ffffffffc0203e00:	03000513          	li	a0,48
ffffffffc0203e04:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203e08:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203e0c:	ff842983          	lw	s3,-8(s0)
ffffffffc0203e10:	97efe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203e14:	85aa                	mv	a1,a0
ffffffffc0203e16:	fd55                	bnez	a0,ffffffffc0203dd2 <dup_mmap+0x1c>
ffffffffc0203e18:	5571                	li	a0,-4
ffffffffc0203e1a:	70e2                	ld	ra,56(sp)
ffffffffc0203e1c:	7442                	ld	s0,48(sp)
ffffffffc0203e1e:	74a2                	ld	s1,40(sp)
ffffffffc0203e20:	7902                	ld	s2,32(sp)
ffffffffc0203e22:	69e2                	ld	s3,24(sp)
ffffffffc0203e24:	6a42                	ld	s4,16(sp)
ffffffffc0203e26:	6aa2                	ld	s5,8(sp)
ffffffffc0203e28:	6121                	addi	sp,sp,64
ffffffffc0203e2a:	8082                	ret
ffffffffc0203e2c:	4501                	li	a0,0
ffffffffc0203e2e:	b7f5                	j	ffffffffc0203e1a <dup_mmap+0x64>
ffffffffc0203e30:	00009697          	auipc	a3,0x9
ffffffffc0203e34:	e7868693          	addi	a3,a3,-392 # ffffffffc020cca8 <default_pmm_manager+0x8c8>
ffffffffc0203e38:	00008617          	auipc	a2,0x8
ffffffffc0203e3c:	ac060613          	addi	a2,a2,-1344 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203e40:	0cf00593          	li	a1,207
ffffffffc0203e44:	00009517          	auipc	a0,0x9
ffffffffc0203e48:	dcc50513          	addi	a0,a0,-564 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0203e4c:	e52fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203e50 <exit_mmap>:
ffffffffc0203e50:	1101                	addi	sp,sp,-32
ffffffffc0203e52:	ec06                	sd	ra,24(sp)
ffffffffc0203e54:	e822                	sd	s0,16(sp)
ffffffffc0203e56:	e426                	sd	s1,8(sp)
ffffffffc0203e58:	e04a                	sd	s2,0(sp)
ffffffffc0203e5a:	c531                	beqz	a0,ffffffffc0203ea6 <exit_mmap+0x56>
ffffffffc0203e5c:	591c                	lw	a5,48(a0)
ffffffffc0203e5e:	84aa                	mv	s1,a0
ffffffffc0203e60:	e3b9                	bnez	a5,ffffffffc0203ea6 <exit_mmap+0x56>
ffffffffc0203e62:	6500                	ld	s0,8(a0)
ffffffffc0203e64:	01853903          	ld	s2,24(a0)
ffffffffc0203e68:	02850663          	beq	a0,s0,ffffffffc0203e94 <exit_mmap+0x44>
ffffffffc0203e6c:	ff043603          	ld	a2,-16(s0)
ffffffffc0203e70:	fe843583          	ld	a1,-24(s0)
ffffffffc0203e74:	854a                	mv	a0,s2
ffffffffc0203e76:	ef0fe0ef          	jal	ra,ffffffffc0202566 <unmap_range>
ffffffffc0203e7a:	6400                	ld	s0,8(s0)
ffffffffc0203e7c:	fe8498e3          	bne	s1,s0,ffffffffc0203e6c <exit_mmap+0x1c>
ffffffffc0203e80:	6400                	ld	s0,8(s0)
ffffffffc0203e82:	00848c63          	beq	s1,s0,ffffffffc0203e9a <exit_mmap+0x4a>
ffffffffc0203e86:	ff043603          	ld	a2,-16(s0)
ffffffffc0203e8a:	fe843583          	ld	a1,-24(s0)
ffffffffc0203e8e:	854a                	mv	a0,s2
ffffffffc0203e90:	81dfe0ef          	jal	ra,ffffffffc02026ac <exit_range>
ffffffffc0203e94:	6400                	ld	s0,8(s0)
ffffffffc0203e96:	fe8498e3          	bne	s1,s0,ffffffffc0203e86 <exit_mmap+0x36>
ffffffffc0203e9a:	60e2                	ld	ra,24(sp)
ffffffffc0203e9c:	6442                	ld	s0,16(sp)
ffffffffc0203e9e:	64a2                	ld	s1,8(sp)
ffffffffc0203ea0:	6902                	ld	s2,0(sp)
ffffffffc0203ea2:	6105                	addi	sp,sp,32
ffffffffc0203ea4:	8082                	ret
ffffffffc0203ea6:	00009697          	auipc	a3,0x9
ffffffffc0203eaa:	e2268693          	addi	a3,a3,-478 # ffffffffc020ccc8 <default_pmm_manager+0x8e8>
ffffffffc0203eae:	00008617          	auipc	a2,0x8
ffffffffc0203eb2:	a4a60613          	addi	a2,a2,-1462 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203eb6:	0e800593          	li	a1,232
ffffffffc0203eba:	00009517          	auipc	a0,0x9
ffffffffc0203ebe:	d5650513          	addi	a0,a0,-682 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0203ec2:	ddcfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203ec6 <vmm_init>:
ffffffffc0203ec6:	7139                	addi	sp,sp,-64
ffffffffc0203ec8:	05800513          	li	a0,88
ffffffffc0203ecc:	fc06                	sd	ra,56(sp)
ffffffffc0203ece:	f822                	sd	s0,48(sp)
ffffffffc0203ed0:	f426                	sd	s1,40(sp)
ffffffffc0203ed2:	f04a                	sd	s2,32(sp)
ffffffffc0203ed4:	ec4e                	sd	s3,24(sp)
ffffffffc0203ed6:	e852                	sd	s4,16(sp)
ffffffffc0203ed8:	e456                	sd	s5,8(sp)
ffffffffc0203eda:	8b4fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203ede:	2e050963          	beqz	a0,ffffffffc02041d0 <vmm_init+0x30a>
ffffffffc0203ee2:	e508                	sd	a0,8(a0)
ffffffffc0203ee4:	e108                	sd	a0,0(a0)
ffffffffc0203ee6:	00053823          	sd	zero,16(a0)
ffffffffc0203eea:	00053c23          	sd	zero,24(a0)
ffffffffc0203eee:	02052023          	sw	zero,32(a0)
ffffffffc0203ef2:	02053423          	sd	zero,40(a0)
ffffffffc0203ef6:	02052823          	sw	zero,48(a0)
ffffffffc0203efa:	84aa                	mv	s1,a0
ffffffffc0203efc:	4585                	li	a1,1
ffffffffc0203efe:	03850513          	addi	a0,a0,56
ffffffffc0203f02:	5b6000ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc0203f06:	03200413          	li	s0,50
ffffffffc0203f0a:	a811                	j	ffffffffc0203f1e <vmm_init+0x58>
ffffffffc0203f0c:	e500                	sd	s0,8(a0)
ffffffffc0203f0e:	e91c                	sd	a5,16(a0)
ffffffffc0203f10:	00052c23          	sw	zero,24(a0)
ffffffffc0203f14:	146d                	addi	s0,s0,-5
ffffffffc0203f16:	8526                	mv	a0,s1
ffffffffc0203f18:	ccdff0ef          	jal	ra,ffffffffc0203be4 <insert_vma_struct>
ffffffffc0203f1c:	c80d                	beqz	s0,ffffffffc0203f4e <vmm_init+0x88>
ffffffffc0203f1e:	03000513          	li	a0,48
ffffffffc0203f22:	86cfe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203f26:	85aa                	mv	a1,a0
ffffffffc0203f28:	00240793          	addi	a5,s0,2
ffffffffc0203f2c:	f165                	bnez	a0,ffffffffc0203f0c <vmm_init+0x46>
ffffffffc0203f2e:	00009697          	auipc	a3,0x9
ffffffffc0203f32:	f3268693          	addi	a3,a3,-206 # ffffffffc020ce60 <default_pmm_manager+0xa80>
ffffffffc0203f36:	00008617          	auipc	a2,0x8
ffffffffc0203f3a:	9c260613          	addi	a2,a2,-1598 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203f3e:	12c00593          	li	a1,300
ffffffffc0203f42:	00009517          	auipc	a0,0x9
ffffffffc0203f46:	cce50513          	addi	a0,a0,-818 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0203f4a:	d54fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203f4e:	03700413          	li	s0,55
ffffffffc0203f52:	1f900913          	li	s2,505
ffffffffc0203f56:	a819                	j	ffffffffc0203f6c <vmm_init+0xa6>
ffffffffc0203f58:	e500                	sd	s0,8(a0)
ffffffffc0203f5a:	e91c                	sd	a5,16(a0)
ffffffffc0203f5c:	00052c23          	sw	zero,24(a0)
ffffffffc0203f60:	0415                	addi	s0,s0,5
ffffffffc0203f62:	8526                	mv	a0,s1
ffffffffc0203f64:	c81ff0ef          	jal	ra,ffffffffc0203be4 <insert_vma_struct>
ffffffffc0203f68:	03240a63          	beq	s0,s2,ffffffffc0203f9c <vmm_init+0xd6>
ffffffffc0203f6c:	03000513          	li	a0,48
ffffffffc0203f70:	81efe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203f74:	85aa                	mv	a1,a0
ffffffffc0203f76:	00240793          	addi	a5,s0,2
ffffffffc0203f7a:	fd79                	bnez	a0,ffffffffc0203f58 <vmm_init+0x92>
ffffffffc0203f7c:	00009697          	auipc	a3,0x9
ffffffffc0203f80:	ee468693          	addi	a3,a3,-284 # ffffffffc020ce60 <default_pmm_manager+0xa80>
ffffffffc0203f84:	00008617          	auipc	a2,0x8
ffffffffc0203f88:	97460613          	addi	a2,a2,-1676 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0203f8c:	13300593          	li	a1,307
ffffffffc0203f90:	00009517          	auipc	a0,0x9
ffffffffc0203f94:	c8050513          	addi	a0,a0,-896 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0203f98:	d06fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203f9c:	649c                	ld	a5,8(s1)
ffffffffc0203f9e:	471d                	li	a4,7
ffffffffc0203fa0:	1fb00593          	li	a1,507
ffffffffc0203fa4:	16f48663          	beq	s1,a5,ffffffffc0204110 <vmm_init+0x24a>
ffffffffc0203fa8:	fe87b603          	ld	a2,-24(a5) # ffffffffffffefe8 <end+0x3fd686d8>
ffffffffc0203fac:	ffe70693          	addi	a3,a4,-2 # ffe <_binary_bin_swap_img_size-0x6d02>
ffffffffc0203fb0:	10d61063          	bne	a2,a3,ffffffffc02040b0 <vmm_init+0x1ea>
ffffffffc0203fb4:	ff07b683          	ld	a3,-16(a5)
ffffffffc0203fb8:	0ed71c63          	bne	a4,a3,ffffffffc02040b0 <vmm_init+0x1ea>
ffffffffc0203fbc:	0715                	addi	a4,a4,5
ffffffffc0203fbe:	679c                	ld	a5,8(a5)
ffffffffc0203fc0:	feb712e3          	bne	a4,a1,ffffffffc0203fa4 <vmm_init+0xde>
ffffffffc0203fc4:	4a1d                	li	s4,7
ffffffffc0203fc6:	4415                	li	s0,5
ffffffffc0203fc8:	1f900a93          	li	s5,505
ffffffffc0203fcc:	85a2                	mv	a1,s0
ffffffffc0203fce:	8526                	mv	a0,s1
ffffffffc0203fd0:	bd5ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0203fd4:	892a                	mv	s2,a0
ffffffffc0203fd6:	16050d63          	beqz	a0,ffffffffc0204150 <vmm_init+0x28a>
ffffffffc0203fda:	00140593          	addi	a1,s0,1
ffffffffc0203fde:	8526                	mv	a0,s1
ffffffffc0203fe0:	bc5ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0203fe4:	89aa                	mv	s3,a0
ffffffffc0203fe6:	14050563          	beqz	a0,ffffffffc0204130 <vmm_init+0x26a>
ffffffffc0203fea:	85d2                	mv	a1,s4
ffffffffc0203fec:	8526                	mv	a0,s1
ffffffffc0203fee:	bb7ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0203ff2:	16051f63          	bnez	a0,ffffffffc0204170 <vmm_init+0x2aa>
ffffffffc0203ff6:	00340593          	addi	a1,s0,3
ffffffffc0203ffa:	8526                	mv	a0,s1
ffffffffc0203ffc:	ba9ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0204000:	1a051863          	bnez	a0,ffffffffc02041b0 <vmm_init+0x2ea>
ffffffffc0204004:	00440593          	addi	a1,s0,4
ffffffffc0204008:	8526                	mv	a0,s1
ffffffffc020400a:	b9bff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc020400e:	18051163          	bnez	a0,ffffffffc0204190 <vmm_init+0x2ca>
ffffffffc0204012:	00893783          	ld	a5,8(s2)
ffffffffc0204016:	0a879d63          	bne	a5,s0,ffffffffc02040d0 <vmm_init+0x20a>
ffffffffc020401a:	01093783          	ld	a5,16(s2)
ffffffffc020401e:	0b479963          	bne	a5,s4,ffffffffc02040d0 <vmm_init+0x20a>
ffffffffc0204022:	0089b783          	ld	a5,8(s3)
ffffffffc0204026:	0c879563          	bne	a5,s0,ffffffffc02040f0 <vmm_init+0x22a>
ffffffffc020402a:	0109b783          	ld	a5,16(s3)
ffffffffc020402e:	0d479163          	bne	a5,s4,ffffffffc02040f0 <vmm_init+0x22a>
ffffffffc0204032:	0415                	addi	s0,s0,5
ffffffffc0204034:	0a15                	addi	s4,s4,5
ffffffffc0204036:	f9541be3          	bne	s0,s5,ffffffffc0203fcc <vmm_init+0x106>
ffffffffc020403a:	4411                	li	s0,4
ffffffffc020403c:	597d                	li	s2,-1
ffffffffc020403e:	85a2                	mv	a1,s0
ffffffffc0204040:	8526                	mv	a0,s1
ffffffffc0204042:	b63ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0204046:	0004059b          	sext.w	a1,s0
ffffffffc020404a:	c90d                	beqz	a0,ffffffffc020407c <vmm_init+0x1b6>
ffffffffc020404c:	6914                	ld	a3,16(a0)
ffffffffc020404e:	6510                	ld	a2,8(a0)
ffffffffc0204050:	00009517          	auipc	a0,0x9
ffffffffc0204054:	d9850513          	addi	a0,a0,-616 # ffffffffc020cde8 <default_pmm_manager+0xa08>
ffffffffc0204058:	94efc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020405c:	00009697          	auipc	a3,0x9
ffffffffc0204060:	db468693          	addi	a3,a3,-588 # ffffffffc020ce10 <default_pmm_manager+0xa30>
ffffffffc0204064:	00008617          	auipc	a2,0x8
ffffffffc0204068:	89460613          	addi	a2,a2,-1900 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020406c:	15900593          	li	a1,345
ffffffffc0204070:	00009517          	auipc	a0,0x9
ffffffffc0204074:	ba050513          	addi	a0,a0,-1120 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc0204078:	c26fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020407c:	147d                	addi	s0,s0,-1
ffffffffc020407e:	fd2410e3          	bne	s0,s2,ffffffffc020403e <vmm_init+0x178>
ffffffffc0204082:	8526                	mv	a0,s1
ffffffffc0204084:	c31ff0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0204088:	00009517          	auipc	a0,0x9
ffffffffc020408c:	da050513          	addi	a0,a0,-608 # ffffffffc020ce28 <default_pmm_manager+0xa48>
ffffffffc0204090:	916fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0204094:	7442                	ld	s0,48(sp)
ffffffffc0204096:	70e2                	ld	ra,56(sp)
ffffffffc0204098:	74a2                	ld	s1,40(sp)
ffffffffc020409a:	7902                	ld	s2,32(sp)
ffffffffc020409c:	69e2                	ld	s3,24(sp)
ffffffffc020409e:	6a42                	ld	s4,16(sp)
ffffffffc02040a0:	6aa2                	ld	s5,8(sp)
ffffffffc02040a2:	00009517          	auipc	a0,0x9
ffffffffc02040a6:	da650513          	addi	a0,a0,-602 # ffffffffc020ce48 <default_pmm_manager+0xa68>
ffffffffc02040aa:	6121                	addi	sp,sp,64
ffffffffc02040ac:	8fafc06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02040b0:	00009697          	auipc	a3,0x9
ffffffffc02040b4:	c5068693          	addi	a3,a3,-944 # ffffffffc020cd00 <default_pmm_manager+0x920>
ffffffffc02040b8:	00008617          	auipc	a2,0x8
ffffffffc02040bc:	84060613          	addi	a2,a2,-1984 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02040c0:	13d00593          	li	a1,317
ffffffffc02040c4:	00009517          	auipc	a0,0x9
ffffffffc02040c8:	b4c50513          	addi	a0,a0,-1204 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc02040cc:	bd2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02040d0:	00009697          	auipc	a3,0x9
ffffffffc02040d4:	cb868693          	addi	a3,a3,-840 # ffffffffc020cd88 <default_pmm_manager+0x9a8>
ffffffffc02040d8:	00008617          	auipc	a2,0x8
ffffffffc02040dc:	82060613          	addi	a2,a2,-2016 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02040e0:	14e00593          	li	a1,334
ffffffffc02040e4:	00009517          	auipc	a0,0x9
ffffffffc02040e8:	b2c50513          	addi	a0,a0,-1236 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc02040ec:	bb2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02040f0:	00009697          	auipc	a3,0x9
ffffffffc02040f4:	cc868693          	addi	a3,a3,-824 # ffffffffc020cdb8 <default_pmm_manager+0x9d8>
ffffffffc02040f8:	00008617          	auipc	a2,0x8
ffffffffc02040fc:	80060613          	addi	a2,a2,-2048 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204100:	14f00593          	li	a1,335
ffffffffc0204104:	00009517          	auipc	a0,0x9
ffffffffc0204108:	b0c50513          	addi	a0,a0,-1268 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc020410c:	b92fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204110:	00009697          	auipc	a3,0x9
ffffffffc0204114:	bd868693          	addi	a3,a3,-1064 # ffffffffc020cce8 <default_pmm_manager+0x908>
ffffffffc0204118:	00007617          	auipc	a2,0x7
ffffffffc020411c:	7e060613          	addi	a2,a2,2016 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204120:	13b00593          	li	a1,315
ffffffffc0204124:	00009517          	auipc	a0,0x9
ffffffffc0204128:	aec50513          	addi	a0,a0,-1300 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc020412c:	b72fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204130:	00009697          	auipc	a3,0x9
ffffffffc0204134:	c1868693          	addi	a3,a3,-1000 # ffffffffc020cd48 <default_pmm_manager+0x968>
ffffffffc0204138:	00007617          	auipc	a2,0x7
ffffffffc020413c:	7c060613          	addi	a2,a2,1984 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204140:	14600593          	li	a1,326
ffffffffc0204144:	00009517          	auipc	a0,0x9
ffffffffc0204148:	acc50513          	addi	a0,a0,-1332 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc020414c:	b52fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204150:	00009697          	auipc	a3,0x9
ffffffffc0204154:	be868693          	addi	a3,a3,-1048 # ffffffffc020cd38 <default_pmm_manager+0x958>
ffffffffc0204158:	00007617          	auipc	a2,0x7
ffffffffc020415c:	7a060613          	addi	a2,a2,1952 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204160:	14400593          	li	a1,324
ffffffffc0204164:	00009517          	auipc	a0,0x9
ffffffffc0204168:	aac50513          	addi	a0,a0,-1364 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc020416c:	b32fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204170:	00009697          	auipc	a3,0x9
ffffffffc0204174:	be868693          	addi	a3,a3,-1048 # ffffffffc020cd58 <default_pmm_manager+0x978>
ffffffffc0204178:	00007617          	auipc	a2,0x7
ffffffffc020417c:	78060613          	addi	a2,a2,1920 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204180:	14800593          	li	a1,328
ffffffffc0204184:	00009517          	auipc	a0,0x9
ffffffffc0204188:	a8c50513          	addi	a0,a0,-1396 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc020418c:	b12fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204190:	00009697          	auipc	a3,0x9
ffffffffc0204194:	be868693          	addi	a3,a3,-1048 # ffffffffc020cd78 <default_pmm_manager+0x998>
ffffffffc0204198:	00007617          	auipc	a2,0x7
ffffffffc020419c:	76060613          	addi	a2,a2,1888 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02041a0:	14c00593          	li	a1,332
ffffffffc02041a4:	00009517          	auipc	a0,0x9
ffffffffc02041a8:	a6c50513          	addi	a0,a0,-1428 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc02041ac:	af2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041b0:	00009697          	auipc	a3,0x9
ffffffffc02041b4:	bb868693          	addi	a3,a3,-1096 # ffffffffc020cd68 <default_pmm_manager+0x988>
ffffffffc02041b8:	00007617          	auipc	a2,0x7
ffffffffc02041bc:	74060613          	addi	a2,a2,1856 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02041c0:	14a00593          	li	a1,330
ffffffffc02041c4:	00009517          	auipc	a0,0x9
ffffffffc02041c8:	a4c50513          	addi	a0,a0,-1460 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc02041cc:	ad2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041d0:	00009697          	auipc	a3,0x9
ffffffffc02041d4:	ac868693          	addi	a3,a3,-1336 # ffffffffc020cc98 <default_pmm_manager+0x8b8>
ffffffffc02041d8:	00007617          	auipc	a2,0x7
ffffffffc02041dc:	72060613          	addi	a2,a2,1824 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02041e0:	12400593          	li	a1,292
ffffffffc02041e4:	00009517          	auipc	a0,0x9
ffffffffc02041e8:	a2c50513          	addi	a0,a0,-1492 # ffffffffc020cc10 <default_pmm_manager+0x830>
ffffffffc02041ec:	ab2fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02041f0 <user_mem_check>:
ffffffffc02041f0:	7179                	addi	sp,sp,-48
ffffffffc02041f2:	f022                	sd	s0,32(sp)
ffffffffc02041f4:	f406                	sd	ra,40(sp)
ffffffffc02041f6:	ec26                	sd	s1,24(sp)
ffffffffc02041f8:	e84a                	sd	s2,16(sp)
ffffffffc02041fa:	e44e                	sd	s3,8(sp)
ffffffffc02041fc:	e052                	sd	s4,0(sp)
ffffffffc02041fe:	842e                	mv	s0,a1
ffffffffc0204200:	c135                	beqz	a0,ffffffffc0204264 <user_mem_check+0x74>
ffffffffc0204202:	002007b7          	lui	a5,0x200
ffffffffc0204206:	04f5e663          	bltu	a1,a5,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc020420a:	00c584b3          	add	s1,a1,a2
ffffffffc020420e:	0495f263          	bgeu	a1,s1,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc0204212:	4785                	li	a5,1
ffffffffc0204214:	07fe                	slli	a5,a5,0x1f
ffffffffc0204216:	0297ee63          	bltu	a5,s1,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc020421a:	892a                	mv	s2,a0
ffffffffc020421c:	89b6                	mv	s3,a3
ffffffffc020421e:	6a05                	lui	s4,0x1
ffffffffc0204220:	a821                	j	ffffffffc0204238 <user_mem_check+0x48>
ffffffffc0204222:	0027f693          	andi	a3,a5,2
ffffffffc0204226:	9752                	add	a4,a4,s4
ffffffffc0204228:	8ba1                	andi	a5,a5,8
ffffffffc020422a:	c685                	beqz	a3,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc020422c:	c399                	beqz	a5,ffffffffc0204232 <user_mem_check+0x42>
ffffffffc020422e:	02e46263          	bltu	s0,a4,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc0204232:	6900                	ld	s0,16(a0)
ffffffffc0204234:	04947663          	bgeu	s0,s1,ffffffffc0204280 <user_mem_check+0x90>
ffffffffc0204238:	85a2                	mv	a1,s0
ffffffffc020423a:	854a                	mv	a0,s2
ffffffffc020423c:	969ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0204240:	c909                	beqz	a0,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc0204242:	6518                	ld	a4,8(a0)
ffffffffc0204244:	00e46763          	bltu	s0,a4,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc0204248:	4d1c                	lw	a5,24(a0)
ffffffffc020424a:	fc099ce3          	bnez	s3,ffffffffc0204222 <user_mem_check+0x32>
ffffffffc020424e:	8b85                	andi	a5,a5,1
ffffffffc0204250:	f3ed                	bnez	a5,ffffffffc0204232 <user_mem_check+0x42>
ffffffffc0204252:	4501                	li	a0,0
ffffffffc0204254:	70a2                	ld	ra,40(sp)
ffffffffc0204256:	7402                	ld	s0,32(sp)
ffffffffc0204258:	64e2                	ld	s1,24(sp)
ffffffffc020425a:	6942                	ld	s2,16(sp)
ffffffffc020425c:	69a2                	ld	s3,8(sp)
ffffffffc020425e:	6a02                	ld	s4,0(sp)
ffffffffc0204260:	6145                	addi	sp,sp,48
ffffffffc0204262:	8082                	ret
ffffffffc0204264:	c02007b7          	lui	a5,0xc0200
ffffffffc0204268:	4501                	li	a0,0
ffffffffc020426a:	fef5e5e3          	bltu	a1,a5,ffffffffc0204254 <user_mem_check+0x64>
ffffffffc020426e:	962e                	add	a2,a2,a1
ffffffffc0204270:	fec5f2e3          	bgeu	a1,a2,ffffffffc0204254 <user_mem_check+0x64>
ffffffffc0204274:	c8000537          	lui	a0,0xc8000
ffffffffc0204278:	0505                	addi	a0,a0,1
ffffffffc020427a:	00a63533          	sltu	a0,a2,a0
ffffffffc020427e:	bfd9                	j	ffffffffc0204254 <user_mem_check+0x64>
ffffffffc0204280:	4505                	li	a0,1
ffffffffc0204282:	bfc9                	j	ffffffffc0204254 <user_mem_check+0x64>

ffffffffc0204284 <copy_from_user>:
ffffffffc0204284:	1101                	addi	sp,sp,-32
ffffffffc0204286:	e822                	sd	s0,16(sp)
ffffffffc0204288:	e426                	sd	s1,8(sp)
ffffffffc020428a:	8432                	mv	s0,a2
ffffffffc020428c:	84b6                	mv	s1,a3
ffffffffc020428e:	e04a                	sd	s2,0(sp)
ffffffffc0204290:	86ba                	mv	a3,a4
ffffffffc0204292:	892e                	mv	s2,a1
ffffffffc0204294:	8626                	mv	a2,s1
ffffffffc0204296:	85a2                	mv	a1,s0
ffffffffc0204298:	ec06                	sd	ra,24(sp)
ffffffffc020429a:	f57ff0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc020429e:	c519                	beqz	a0,ffffffffc02042ac <copy_from_user+0x28>
ffffffffc02042a0:	8626                	mv	a2,s1
ffffffffc02042a2:	85a2                	mv	a1,s0
ffffffffc02042a4:	854a                	mv	a0,s2
ffffffffc02042a6:	1c2070ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc02042aa:	4505                	li	a0,1
ffffffffc02042ac:	60e2                	ld	ra,24(sp)
ffffffffc02042ae:	6442                	ld	s0,16(sp)
ffffffffc02042b0:	64a2                	ld	s1,8(sp)
ffffffffc02042b2:	6902                	ld	s2,0(sp)
ffffffffc02042b4:	6105                	addi	sp,sp,32
ffffffffc02042b6:	8082                	ret

ffffffffc02042b8 <copy_to_user>:
ffffffffc02042b8:	1101                	addi	sp,sp,-32
ffffffffc02042ba:	e822                	sd	s0,16(sp)
ffffffffc02042bc:	8436                	mv	s0,a3
ffffffffc02042be:	e04a                	sd	s2,0(sp)
ffffffffc02042c0:	4685                	li	a3,1
ffffffffc02042c2:	8932                	mv	s2,a2
ffffffffc02042c4:	8622                	mv	a2,s0
ffffffffc02042c6:	e426                	sd	s1,8(sp)
ffffffffc02042c8:	ec06                	sd	ra,24(sp)
ffffffffc02042ca:	84ae                	mv	s1,a1
ffffffffc02042cc:	f25ff0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc02042d0:	c519                	beqz	a0,ffffffffc02042de <copy_to_user+0x26>
ffffffffc02042d2:	8622                	mv	a2,s0
ffffffffc02042d4:	85ca                	mv	a1,s2
ffffffffc02042d6:	8526                	mv	a0,s1
ffffffffc02042d8:	190070ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc02042dc:	4505                	li	a0,1
ffffffffc02042de:	60e2                	ld	ra,24(sp)
ffffffffc02042e0:	6442                	ld	s0,16(sp)
ffffffffc02042e2:	64a2                	ld	s1,8(sp)
ffffffffc02042e4:	6902                	ld	s2,0(sp)
ffffffffc02042e6:	6105                	addi	sp,sp,32
ffffffffc02042e8:	8082                	ret

ffffffffc02042ea <copy_string>:
ffffffffc02042ea:	7139                	addi	sp,sp,-64
ffffffffc02042ec:	ec4e                	sd	s3,24(sp)
ffffffffc02042ee:	6985                	lui	s3,0x1
ffffffffc02042f0:	99b2                	add	s3,s3,a2
ffffffffc02042f2:	77fd                	lui	a5,0xfffff
ffffffffc02042f4:	00f9f9b3          	and	s3,s3,a5
ffffffffc02042f8:	f426                	sd	s1,40(sp)
ffffffffc02042fa:	f04a                	sd	s2,32(sp)
ffffffffc02042fc:	e852                	sd	s4,16(sp)
ffffffffc02042fe:	e456                	sd	s5,8(sp)
ffffffffc0204300:	fc06                	sd	ra,56(sp)
ffffffffc0204302:	f822                	sd	s0,48(sp)
ffffffffc0204304:	84b2                	mv	s1,a2
ffffffffc0204306:	8aaa                	mv	s5,a0
ffffffffc0204308:	8a2e                	mv	s4,a1
ffffffffc020430a:	8936                	mv	s2,a3
ffffffffc020430c:	40c989b3          	sub	s3,s3,a2
ffffffffc0204310:	a015                	j	ffffffffc0204334 <copy_string+0x4a>
ffffffffc0204312:	07c070ef          	jal	ra,ffffffffc020b38e <strnlen>
ffffffffc0204316:	87aa                	mv	a5,a0
ffffffffc0204318:	85a6                	mv	a1,s1
ffffffffc020431a:	8552                	mv	a0,s4
ffffffffc020431c:	8622                	mv	a2,s0
ffffffffc020431e:	0487e363          	bltu	a5,s0,ffffffffc0204364 <copy_string+0x7a>
ffffffffc0204322:	0329f763          	bgeu	s3,s2,ffffffffc0204350 <copy_string+0x66>
ffffffffc0204326:	142070ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc020432a:	9a22                	add	s4,s4,s0
ffffffffc020432c:	94a2                	add	s1,s1,s0
ffffffffc020432e:	40890933          	sub	s2,s2,s0
ffffffffc0204332:	6985                	lui	s3,0x1
ffffffffc0204334:	4681                	li	a3,0
ffffffffc0204336:	85a6                	mv	a1,s1
ffffffffc0204338:	8556                	mv	a0,s5
ffffffffc020433a:	844a                	mv	s0,s2
ffffffffc020433c:	0129f363          	bgeu	s3,s2,ffffffffc0204342 <copy_string+0x58>
ffffffffc0204340:	844e                	mv	s0,s3
ffffffffc0204342:	8622                	mv	a2,s0
ffffffffc0204344:	eadff0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc0204348:	87aa                	mv	a5,a0
ffffffffc020434a:	85a2                	mv	a1,s0
ffffffffc020434c:	8526                	mv	a0,s1
ffffffffc020434e:	f3f1                	bnez	a5,ffffffffc0204312 <copy_string+0x28>
ffffffffc0204350:	4501                	li	a0,0
ffffffffc0204352:	70e2                	ld	ra,56(sp)
ffffffffc0204354:	7442                	ld	s0,48(sp)
ffffffffc0204356:	74a2                	ld	s1,40(sp)
ffffffffc0204358:	7902                	ld	s2,32(sp)
ffffffffc020435a:	69e2                	ld	s3,24(sp)
ffffffffc020435c:	6a42                	ld	s4,16(sp)
ffffffffc020435e:	6aa2                	ld	s5,8(sp)
ffffffffc0204360:	6121                	addi	sp,sp,64
ffffffffc0204362:	8082                	ret
ffffffffc0204364:	00178613          	addi	a2,a5,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc0204368:	100070ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc020436c:	4505                	li	a0,1
ffffffffc020436e:	b7d5                	j	ffffffffc0204352 <copy_string+0x68>

ffffffffc0204370 <__down.constprop.0>:
ffffffffc0204370:	715d                	addi	sp,sp,-80
ffffffffc0204372:	e0a2                	sd	s0,64(sp)
ffffffffc0204374:	e486                	sd	ra,72(sp)
ffffffffc0204376:	fc26                	sd	s1,56(sp)
ffffffffc0204378:	842a                	mv	s0,a0
ffffffffc020437a:	100027f3          	csrr	a5,sstatus
ffffffffc020437e:	8b89                	andi	a5,a5,2
ffffffffc0204380:	ebb1                	bnez	a5,ffffffffc02043d4 <__down.constprop.0+0x64>
ffffffffc0204382:	411c                	lw	a5,0(a0)
ffffffffc0204384:	00f05a63          	blez	a5,ffffffffc0204398 <__down.constprop.0+0x28>
ffffffffc0204388:	37fd                	addiw	a5,a5,-1
ffffffffc020438a:	c11c                	sw	a5,0(a0)
ffffffffc020438c:	4501                	li	a0,0
ffffffffc020438e:	60a6                	ld	ra,72(sp)
ffffffffc0204390:	6406                	ld	s0,64(sp)
ffffffffc0204392:	74e2                	ld	s1,56(sp)
ffffffffc0204394:	6161                	addi	sp,sp,80
ffffffffc0204396:	8082                	ret
ffffffffc0204398:	00850413          	addi	s0,a0,8 # ffffffffc8000008 <end+0x7d696f8>
ffffffffc020439c:	0024                	addi	s1,sp,8
ffffffffc020439e:	10000613          	li	a2,256
ffffffffc02043a2:	85a6                	mv	a1,s1
ffffffffc02043a4:	8522                	mv	a0,s0
ffffffffc02043a6:	2d8000ef          	jal	ra,ffffffffc020467e <wait_current_set>
ffffffffc02043aa:	6ff020ef          	jal	ra,ffffffffc02072a8 <schedule>
ffffffffc02043ae:	100027f3          	csrr	a5,sstatus
ffffffffc02043b2:	8b89                	andi	a5,a5,2
ffffffffc02043b4:	efb9                	bnez	a5,ffffffffc0204412 <__down.constprop.0+0xa2>
ffffffffc02043b6:	8526                	mv	a0,s1
ffffffffc02043b8:	19c000ef          	jal	ra,ffffffffc0204554 <wait_in_queue>
ffffffffc02043bc:	e531                	bnez	a0,ffffffffc0204408 <__down.constprop.0+0x98>
ffffffffc02043be:	4542                	lw	a0,16(sp)
ffffffffc02043c0:	10000793          	li	a5,256
ffffffffc02043c4:	fcf515e3          	bne	a0,a5,ffffffffc020438e <__down.constprop.0+0x1e>
ffffffffc02043c8:	60a6                	ld	ra,72(sp)
ffffffffc02043ca:	6406                	ld	s0,64(sp)
ffffffffc02043cc:	74e2                	ld	s1,56(sp)
ffffffffc02043ce:	4501                	li	a0,0
ffffffffc02043d0:	6161                	addi	sp,sp,80
ffffffffc02043d2:	8082                	ret
ffffffffc02043d4:	89ffc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02043d8:	401c                	lw	a5,0(s0)
ffffffffc02043da:	00f05c63          	blez	a5,ffffffffc02043f2 <__down.constprop.0+0x82>
ffffffffc02043de:	37fd                	addiw	a5,a5,-1
ffffffffc02043e0:	c01c                	sw	a5,0(s0)
ffffffffc02043e2:	88bfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02043e6:	60a6                	ld	ra,72(sp)
ffffffffc02043e8:	6406                	ld	s0,64(sp)
ffffffffc02043ea:	74e2                	ld	s1,56(sp)
ffffffffc02043ec:	4501                	li	a0,0
ffffffffc02043ee:	6161                	addi	sp,sp,80
ffffffffc02043f0:	8082                	ret
ffffffffc02043f2:	0421                	addi	s0,s0,8
ffffffffc02043f4:	0024                	addi	s1,sp,8
ffffffffc02043f6:	10000613          	li	a2,256
ffffffffc02043fa:	85a6                	mv	a1,s1
ffffffffc02043fc:	8522                	mv	a0,s0
ffffffffc02043fe:	280000ef          	jal	ra,ffffffffc020467e <wait_current_set>
ffffffffc0204402:	86bfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204406:	b755                	j	ffffffffc02043aa <__down.constprop.0+0x3a>
ffffffffc0204408:	85a6                	mv	a1,s1
ffffffffc020440a:	8522                	mv	a0,s0
ffffffffc020440c:	0ee000ef          	jal	ra,ffffffffc02044fa <wait_queue_del>
ffffffffc0204410:	b77d                	j	ffffffffc02043be <__down.constprop.0+0x4e>
ffffffffc0204412:	861fc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204416:	8526                	mv	a0,s1
ffffffffc0204418:	13c000ef          	jal	ra,ffffffffc0204554 <wait_in_queue>
ffffffffc020441c:	e501                	bnez	a0,ffffffffc0204424 <__down.constprop.0+0xb4>
ffffffffc020441e:	84ffc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204422:	bf71                	j	ffffffffc02043be <__down.constprop.0+0x4e>
ffffffffc0204424:	85a6                	mv	a1,s1
ffffffffc0204426:	8522                	mv	a0,s0
ffffffffc0204428:	0d2000ef          	jal	ra,ffffffffc02044fa <wait_queue_del>
ffffffffc020442c:	bfcd                	j	ffffffffc020441e <__down.constprop.0+0xae>

ffffffffc020442e <__up.constprop.0>:
ffffffffc020442e:	1101                	addi	sp,sp,-32
ffffffffc0204430:	e822                	sd	s0,16(sp)
ffffffffc0204432:	ec06                	sd	ra,24(sp)
ffffffffc0204434:	e426                	sd	s1,8(sp)
ffffffffc0204436:	e04a                	sd	s2,0(sp)
ffffffffc0204438:	842a                	mv	s0,a0
ffffffffc020443a:	100027f3          	csrr	a5,sstatus
ffffffffc020443e:	8b89                	andi	a5,a5,2
ffffffffc0204440:	4901                	li	s2,0
ffffffffc0204442:	eba1                	bnez	a5,ffffffffc0204492 <__up.constprop.0+0x64>
ffffffffc0204444:	00840493          	addi	s1,s0,8
ffffffffc0204448:	8526                	mv	a0,s1
ffffffffc020444a:	0ee000ef          	jal	ra,ffffffffc0204538 <wait_queue_first>
ffffffffc020444e:	85aa                	mv	a1,a0
ffffffffc0204450:	cd0d                	beqz	a0,ffffffffc020448a <__up.constprop.0+0x5c>
ffffffffc0204452:	6118                	ld	a4,0(a0)
ffffffffc0204454:	10000793          	li	a5,256
ffffffffc0204458:	0ec72703          	lw	a4,236(a4)
ffffffffc020445c:	02f71f63          	bne	a4,a5,ffffffffc020449a <__up.constprop.0+0x6c>
ffffffffc0204460:	4685                	li	a3,1
ffffffffc0204462:	10000613          	li	a2,256
ffffffffc0204466:	8526                	mv	a0,s1
ffffffffc0204468:	0fa000ef          	jal	ra,ffffffffc0204562 <wakeup_wait>
ffffffffc020446c:	00091863          	bnez	s2,ffffffffc020447c <__up.constprop.0+0x4e>
ffffffffc0204470:	60e2                	ld	ra,24(sp)
ffffffffc0204472:	6442                	ld	s0,16(sp)
ffffffffc0204474:	64a2                	ld	s1,8(sp)
ffffffffc0204476:	6902                	ld	s2,0(sp)
ffffffffc0204478:	6105                	addi	sp,sp,32
ffffffffc020447a:	8082                	ret
ffffffffc020447c:	6442                	ld	s0,16(sp)
ffffffffc020447e:	60e2                	ld	ra,24(sp)
ffffffffc0204480:	64a2                	ld	s1,8(sp)
ffffffffc0204482:	6902                	ld	s2,0(sp)
ffffffffc0204484:	6105                	addi	sp,sp,32
ffffffffc0204486:	fe6fc06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020448a:	401c                	lw	a5,0(s0)
ffffffffc020448c:	2785                	addiw	a5,a5,1
ffffffffc020448e:	c01c                	sw	a5,0(s0)
ffffffffc0204490:	bff1                	j	ffffffffc020446c <__up.constprop.0+0x3e>
ffffffffc0204492:	fe0fc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204496:	4905                	li	s2,1
ffffffffc0204498:	b775                	j	ffffffffc0204444 <__up.constprop.0+0x16>
ffffffffc020449a:	00009697          	auipc	a3,0x9
ffffffffc020449e:	9d668693          	addi	a3,a3,-1578 # ffffffffc020ce70 <default_pmm_manager+0xa90>
ffffffffc02044a2:	00007617          	auipc	a2,0x7
ffffffffc02044a6:	45660613          	addi	a2,a2,1110 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02044aa:	45e5                	li	a1,25
ffffffffc02044ac:	00009517          	auipc	a0,0x9
ffffffffc02044b0:	9ec50513          	addi	a0,a0,-1556 # ffffffffc020ce98 <default_pmm_manager+0xab8>
ffffffffc02044b4:	febfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02044b8 <sem_init>:
ffffffffc02044b8:	c10c                	sw	a1,0(a0)
ffffffffc02044ba:	0521                	addi	a0,a0,8
ffffffffc02044bc:	a825                	j	ffffffffc02044f4 <wait_queue_init>

ffffffffc02044be <up>:
ffffffffc02044be:	f71ff06f          	j	ffffffffc020442e <__up.constprop.0>

ffffffffc02044c2 <down>:
ffffffffc02044c2:	1141                	addi	sp,sp,-16
ffffffffc02044c4:	e406                	sd	ra,8(sp)
ffffffffc02044c6:	eabff0ef          	jal	ra,ffffffffc0204370 <__down.constprop.0>
ffffffffc02044ca:	2501                	sext.w	a0,a0
ffffffffc02044cc:	e501                	bnez	a0,ffffffffc02044d4 <down+0x12>
ffffffffc02044ce:	60a2                	ld	ra,8(sp)
ffffffffc02044d0:	0141                	addi	sp,sp,16
ffffffffc02044d2:	8082                	ret
ffffffffc02044d4:	00009697          	auipc	a3,0x9
ffffffffc02044d8:	9d468693          	addi	a3,a3,-1580 # ffffffffc020cea8 <default_pmm_manager+0xac8>
ffffffffc02044dc:	00007617          	auipc	a2,0x7
ffffffffc02044e0:	41c60613          	addi	a2,a2,1052 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02044e4:	04000593          	li	a1,64
ffffffffc02044e8:	00009517          	auipc	a0,0x9
ffffffffc02044ec:	9b050513          	addi	a0,a0,-1616 # ffffffffc020ce98 <default_pmm_manager+0xab8>
ffffffffc02044f0:	faffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02044f4 <wait_queue_init>:
ffffffffc02044f4:	e508                	sd	a0,8(a0)
ffffffffc02044f6:	e108                	sd	a0,0(a0)
ffffffffc02044f8:	8082                	ret

ffffffffc02044fa <wait_queue_del>:
ffffffffc02044fa:	7198                	ld	a4,32(a1)
ffffffffc02044fc:	01858793          	addi	a5,a1,24
ffffffffc0204500:	00e78b63          	beq	a5,a4,ffffffffc0204516 <wait_queue_del+0x1c>
ffffffffc0204504:	6994                	ld	a3,16(a1)
ffffffffc0204506:	00a69863          	bne	a3,a0,ffffffffc0204516 <wait_queue_del+0x1c>
ffffffffc020450a:	6d94                	ld	a3,24(a1)
ffffffffc020450c:	e698                	sd	a4,8(a3)
ffffffffc020450e:	e314                	sd	a3,0(a4)
ffffffffc0204510:	f19c                	sd	a5,32(a1)
ffffffffc0204512:	ed9c                	sd	a5,24(a1)
ffffffffc0204514:	8082                	ret
ffffffffc0204516:	1141                	addi	sp,sp,-16
ffffffffc0204518:	00009697          	auipc	a3,0x9
ffffffffc020451c:	9f068693          	addi	a3,a3,-1552 # ffffffffc020cf08 <default_pmm_manager+0xb28>
ffffffffc0204520:	00007617          	auipc	a2,0x7
ffffffffc0204524:	3d860613          	addi	a2,a2,984 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204528:	45f1                	li	a1,28
ffffffffc020452a:	00009517          	auipc	a0,0x9
ffffffffc020452e:	9c650513          	addi	a0,a0,-1594 # ffffffffc020cef0 <default_pmm_manager+0xb10>
ffffffffc0204532:	e406                	sd	ra,8(sp)
ffffffffc0204534:	f6bfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204538 <wait_queue_first>:
ffffffffc0204538:	651c                	ld	a5,8(a0)
ffffffffc020453a:	00f50563          	beq	a0,a5,ffffffffc0204544 <wait_queue_first+0xc>
ffffffffc020453e:	fe878513          	addi	a0,a5,-24
ffffffffc0204542:	8082                	ret
ffffffffc0204544:	4501                	li	a0,0
ffffffffc0204546:	8082                	ret

ffffffffc0204548 <wait_queue_empty>:
ffffffffc0204548:	651c                	ld	a5,8(a0)
ffffffffc020454a:	40a78533          	sub	a0,a5,a0
ffffffffc020454e:	00153513          	seqz	a0,a0
ffffffffc0204552:	8082                	ret

ffffffffc0204554 <wait_in_queue>:
ffffffffc0204554:	711c                	ld	a5,32(a0)
ffffffffc0204556:	0561                	addi	a0,a0,24
ffffffffc0204558:	40a78533          	sub	a0,a5,a0
ffffffffc020455c:	00a03533          	snez	a0,a0
ffffffffc0204560:	8082                	ret

ffffffffc0204562 <wakeup_wait>:
ffffffffc0204562:	e689                	bnez	a3,ffffffffc020456c <wakeup_wait+0xa>
ffffffffc0204564:	6188                	ld	a0,0(a1)
ffffffffc0204566:	c590                	sw	a2,8(a1)
ffffffffc0204568:	48f0206f          	j	ffffffffc02071f6 <wakeup_proc>
ffffffffc020456c:	7198                	ld	a4,32(a1)
ffffffffc020456e:	01858793          	addi	a5,a1,24
ffffffffc0204572:	00e78e63          	beq	a5,a4,ffffffffc020458e <wakeup_wait+0x2c>
ffffffffc0204576:	6994                	ld	a3,16(a1)
ffffffffc0204578:	00d51b63          	bne	a0,a3,ffffffffc020458e <wakeup_wait+0x2c>
ffffffffc020457c:	6d94                	ld	a3,24(a1)
ffffffffc020457e:	6188                	ld	a0,0(a1)
ffffffffc0204580:	e698                	sd	a4,8(a3)
ffffffffc0204582:	e314                	sd	a3,0(a4)
ffffffffc0204584:	f19c                	sd	a5,32(a1)
ffffffffc0204586:	ed9c                	sd	a5,24(a1)
ffffffffc0204588:	c590                	sw	a2,8(a1)
ffffffffc020458a:	46d0206f          	j	ffffffffc02071f6 <wakeup_proc>
ffffffffc020458e:	1141                	addi	sp,sp,-16
ffffffffc0204590:	00009697          	auipc	a3,0x9
ffffffffc0204594:	97868693          	addi	a3,a3,-1672 # ffffffffc020cf08 <default_pmm_manager+0xb28>
ffffffffc0204598:	00007617          	auipc	a2,0x7
ffffffffc020459c:	36060613          	addi	a2,a2,864 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02045a0:	45f1                	li	a1,28
ffffffffc02045a2:	00009517          	auipc	a0,0x9
ffffffffc02045a6:	94e50513          	addi	a0,a0,-1714 # ffffffffc020cef0 <default_pmm_manager+0xb10>
ffffffffc02045aa:	e406                	sd	ra,8(sp)
ffffffffc02045ac:	ef3fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02045b0 <wakeup_queue>:
ffffffffc02045b0:	651c                	ld	a5,8(a0)
ffffffffc02045b2:	0ca78563          	beq	a5,a0,ffffffffc020467c <wakeup_queue+0xcc>
ffffffffc02045b6:	1101                	addi	sp,sp,-32
ffffffffc02045b8:	e822                	sd	s0,16(sp)
ffffffffc02045ba:	e426                	sd	s1,8(sp)
ffffffffc02045bc:	e04a                	sd	s2,0(sp)
ffffffffc02045be:	ec06                	sd	ra,24(sp)
ffffffffc02045c0:	84aa                	mv	s1,a0
ffffffffc02045c2:	892e                	mv	s2,a1
ffffffffc02045c4:	fe878413          	addi	s0,a5,-24
ffffffffc02045c8:	e23d                	bnez	a2,ffffffffc020462e <wakeup_queue+0x7e>
ffffffffc02045ca:	6008                	ld	a0,0(s0)
ffffffffc02045cc:	01242423          	sw	s2,8(s0)
ffffffffc02045d0:	427020ef          	jal	ra,ffffffffc02071f6 <wakeup_proc>
ffffffffc02045d4:	701c                	ld	a5,32(s0)
ffffffffc02045d6:	01840713          	addi	a4,s0,24
ffffffffc02045da:	02e78463          	beq	a5,a4,ffffffffc0204602 <wakeup_queue+0x52>
ffffffffc02045de:	6818                	ld	a4,16(s0)
ffffffffc02045e0:	02e49163          	bne	s1,a4,ffffffffc0204602 <wakeup_queue+0x52>
ffffffffc02045e4:	02f48f63          	beq	s1,a5,ffffffffc0204622 <wakeup_queue+0x72>
ffffffffc02045e8:	fe87b503          	ld	a0,-24(a5)
ffffffffc02045ec:	ff27a823          	sw	s2,-16(a5)
ffffffffc02045f0:	fe878413          	addi	s0,a5,-24
ffffffffc02045f4:	403020ef          	jal	ra,ffffffffc02071f6 <wakeup_proc>
ffffffffc02045f8:	701c                	ld	a5,32(s0)
ffffffffc02045fa:	01840713          	addi	a4,s0,24
ffffffffc02045fe:	fee790e3          	bne	a5,a4,ffffffffc02045de <wakeup_queue+0x2e>
ffffffffc0204602:	00009697          	auipc	a3,0x9
ffffffffc0204606:	90668693          	addi	a3,a3,-1786 # ffffffffc020cf08 <default_pmm_manager+0xb28>
ffffffffc020460a:	00007617          	auipc	a2,0x7
ffffffffc020460e:	2ee60613          	addi	a2,a2,750 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204612:	02200593          	li	a1,34
ffffffffc0204616:	00009517          	auipc	a0,0x9
ffffffffc020461a:	8da50513          	addi	a0,a0,-1830 # ffffffffc020cef0 <default_pmm_manager+0xb10>
ffffffffc020461e:	e81fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204622:	60e2                	ld	ra,24(sp)
ffffffffc0204624:	6442                	ld	s0,16(sp)
ffffffffc0204626:	64a2                	ld	s1,8(sp)
ffffffffc0204628:	6902                	ld	s2,0(sp)
ffffffffc020462a:	6105                	addi	sp,sp,32
ffffffffc020462c:	8082                	ret
ffffffffc020462e:	6798                	ld	a4,8(a5)
ffffffffc0204630:	02f70763          	beq	a4,a5,ffffffffc020465e <wakeup_queue+0xae>
ffffffffc0204634:	6814                	ld	a3,16(s0)
ffffffffc0204636:	02d49463          	bne	s1,a3,ffffffffc020465e <wakeup_queue+0xae>
ffffffffc020463a:	6c14                	ld	a3,24(s0)
ffffffffc020463c:	6008                	ld	a0,0(s0)
ffffffffc020463e:	e698                	sd	a4,8(a3)
ffffffffc0204640:	e314                	sd	a3,0(a4)
ffffffffc0204642:	f01c                	sd	a5,32(s0)
ffffffffc0204644:	ec1c                	sd	a5,24(s0)
ffffffffc0204646:	01242423          	sw	s2,8(s0)
ffffffffc020464a:	3ad020ef          	jal	ra,ffffffffc02071f6 <wakeup_proc>
ffffffffc020464e:	6480                	ld	s0,8(s1)
ffffffffc0204650:	fc8489e3          	beq	s1,s0,ffffffffc0204622 <wakeup_queue+0x72>
ffffffffc0204654:	6418                	ld	a4,8(s0)
ffffffffc0204656:	87a2                	mv	a5,s0
ffffffffc0204658:	1421                	addi	s0,s0,-24
ffffffffc020465a:	fce79de3          	bne	a5,a4,ffffffffc0204634 <wakeup_queue+0x84>
ffffffffc020465e:	00009697          	auipc	a3,0x9
ffffffffc0204662:	8aa68693          	addi	a3,a3,-1878 # ffffffffc020cf08 <default_pmm_manager+0xb28>
ffffffffc0204666:	00007617          	auipc	a2,0x7
ffffffffc020466a:	29260613          	addi	a2,a2,658 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020466e:	45f1                	li	a1,28
ffffffffc0204670:	00009517          	auipc	a0,0x9
ffffffffc0204674:	88050513          	addi	a0,a0,-1920 # ffffffffc020cef0 <default_pmm_manager+0xb10>
ffffffffc0204678:	e27fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020467c:	8082                	ret

ffffffffc020467e <wait_current_set>:
ffffffffc020467e:	00092797          	auipc	a5,0x92
ffffffffc0204682:	2427b783          	ld	a5,578(a5) # ffffffffc02968c0 <current>
ffffffffc0204686:	c39d                	beqz	a5,ffffffffc02046ac <wait_current_set+0x2e>
ffffffffc0204688:	01858713          	addi	a4,a1,24
ffffffffc020468c:	800006b7          	lui	a3,0x80000
ffffffffc0204690:	ed98                	sd	a4,24(a1)
ffffffffc0204692:	e19c                	sd	a5,0(a1)
ffffffffc0204694:	c594                	sw	a3,8(a1)
ffffffffc0204696:	4685                	li	a3,1
ffffffffc0204698:	c394                	sw	a3,0(a5)
ffffffffc020469a:	0ec7a623          	sw	a2,236(a5)
ffffffffc020469e:	611c                	ld	a5,0(a0)
ffffffffc02046a0:	e988                	sd	a0,16(a1)
ffffffffc02046a2:	e118                	sd	a4,0(a0)
ffffffffc02046a4:	e798                	sd	a4,8(a5)
ffffffffc02046a6:	f188                	sd	a0,32(a1)
ffffffffc02046a8:	ed9c                	sd	a5,24(a1)
ffffffffc02046aa:	8082                	ret
ffffffffc02046ac:	1141                	addi	sp,sp,-16
ffffffffc02046ae:	00009697          	auipc	a3,0x9
ffffffffc02046b2:	89a68693          	addi	a3,a3,-1894 # ffffffffc020cf48 <default_pmm_manager+0xb68>
ffffffffc02046b6:	00007617          	auipc	a2,0x7
ffffffffc02046ba:	24260613          	addi	a2,a2,578 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02046be:	07400593          	li	a1,116
ffffffffc02046c2:	00009517          	auipc	a0,0x9
ffffffffc02046c6:	82e50513          	addi	a0,a0,-2002 # ffffffffc020cef0 <default_pmm_manager+0xb10>
ffffffffc02046ca:	e406                	sd	ra,8(sp)
ffffffffc02046cc:	dd3fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02046d0 <get_fd_array.part.0>:
ffffffffc02046d0:	1141                	addi	sp,sp,-16
ffffffffc02046d2:	00009697          	auipc	a3,0x9
ffffffffc02046d6:	88668693          	addi	a3,a3,-1914 # ffffffffc020cf58 <default_pmm_manager+0xb78>
ffffffffc02046da:	00007617          	auipc	a2,0x7
ffffffffc02046de:	21e60613          	addi	a2,a2,542 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02046e2:	45d1                	li	a1,20
ffffffffc02046e4:	00009517          	auipc	a0,0x9
ffffffffc02046e8:	8a450513          	addi	a0,a0,-1884 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc02046ec:	e406                	sd	ra,8(sp)
ffffffffc02046ee:	db1fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02046f2 <fd_array_alloc>:
ffffffffc02046f2:	00092797          	auipc	a5,0x92
ffffffffc02046f6:	1ce7b783          	ld	a5,462(a5) # ffffffffc02968c0 <current>
ffffffffc02046fa:	1487b783          	ld	a5,328(a5)
ffffffffc02046fe:	1141                	addi	sp,sp,-16
ffffffffc0204700:	e406                	sd	ra,8(sp)
ffffffffc0204702:	c3a5                	beqz	a5,ffffffffc0204762 <fd_array_alloc+0x70>
ffffffffc0204704:	4b98                	lw	a4,16(a5)
ffffffffc0204706:	04e05e63          	blez	a4,ffffffffc0204762 <fd_array_alloc+0x70>
ffffffffc020470a:	775d                	lui	a4,0xffff7
ffffffffc020470c:	ad970713          	addi	a4,a4,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204710:	679c                	ld	a5,8(a5)
ffffffffc0204712:	02e50863          	beq	a0,a4,ffffffffc0204742 <fd_array_alloc+0x50>
ffffffffc0204716:	04700713          	li	a4,71
ffffffffc020471a:	04a76263          	bltu	a4,a0,ffffffffc020475e <fd_array_alloc+0x6c>
ffffffffc020471e:	00351713          	slli	a4,a0,0x3
ffffffffc0204722:	40a70533          	sub	a0,a4,a0
ffffffffc0204726:	050e                	slli	a0,a0,0x3
ffffffffc0204728:	97aa                	add	a5,a5,a0
ffffffffc020472a:	4398                	lw	a4,0(a5)
ffffffffc020472c:	e71d                	bnez	a4,ffffffffc020475a <fd_array_alloc+0x68>
ffffffffc020472e:	5b88                	lw	a0,48(a5)
ffffffffc0204730:	e91d                	bnez	a0,ffffffffc0204766 <fd_array_alloc+0x74>
ffffffffc0204732:	4705                	li	a4,1
ffffffffc0204734:	c398                	sw	a4,0(a5)
ffffffffc0204736:	0207b423          	sd	zero,40(a5)
ffffffffc020473a:	e19c                	sd	a5,0(a1)
ffffffffc020473c:	60a2                	ld	ra,8(sp)
ffffffffc020473e:	0141                	addi	sp,sp,16
ffffffffc0204740:	8082                	ret
ffffffffc0204742:	6685                	lui	a3,0x1
ffffffffc0204744:	fc068693          	addi	a3,a3,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0204748:	96be                	add	a3,a3,a5
ffffffffc020474a:	4398                	lw	a4,0(a5)
ffffffffc020474c:	d36d                	beqz	a4,ffffffffc020472e <fd_array_alloc+0x3c>
ffffffffc020474e:	03878793          	addi	a5,a5,56
ffffffffc0204752:	fef69ce3          	bne	a3,a5,ffffffffc020474a <fd_array_alloc+0x58>
ffffffffc0204756:	5529                	li	a0,-22
ffffffffc0204758:	b7d5                	j	ffffffffc020473c <fd_array_alloc+0x4a>
ffffffffc020475a:	5545                	li	a0,-15
ffffffffc020475c:	b7c5                	j	ffffffffc020473c <fd_array_alloc+0x4a>
ffffffffc020475e:	5575                	li	a0,-3
ffffffffc0204760:	bff1                	j	ffffffffc020473c <fd_array_alloc+0x4a>
ffffffffc0204762:	f6fff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>
ffffffffc0204766:	00009697          	auipc	a3,0x9
ffffffffc020476a:	83268693          	addi	a3,a3,-1998 # ffffffffc020cf98 <default_pmm_manager+0xbb8>
ffffffffc020476e:	00007617          	auipc	a2,0x7
ffffffffc0204772:	18a60613          	addi	a2,a2,394 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204776:	03b00593          	li	a1,59
ffffffffc020477a:	00009517          	auipc	a0,0x9
ffffffffc020477e:	80e50513          	addi	a0,a0,-2034 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204782:	d1dfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204786 <fd_array_free>:
ffffffffc0204786:	411c                	lw	a5,0(a0)
ffffffffc0204788:	1141                	addi	sp,sp,-16
ffffffffc020478a:	e022                	sd	s0,0(sp)
ffffffffc020478c:	e406                	sd	ra,8(sp)
ffffffffc020478e:	4705                	li	a4,1
ffffffffc0204790:	842a                	mv	s0,a0
ffffffffc0204792:	04e78063          	beq	a5,a4,ffffffffc02047d2 <fd_array_free+0x4c>
ffffffffc0204796:	470d                	li	a4,3
ffffffffc0204798:	04e79563          	bne	a5,a4,ffffffffc02047e2 <fd_array_free+0x5c>
ffffffffc020479c:	591c                	lw	a5,48(a0)
ffffffffc020479e:	c38d                	beqz	a5,ffffffffc02047c0 <fd_array_free+0x3a>
ffffffffc02047a0:	00008697          	auipc	a3,0x8
ffffffffc02047a4:	7f868693          	addi	a3,a3,2040 # ffffffffc020cf98 <default_pmm_manager+0xbb8>
ffffffffc02047a8:	00007617          	auipc	a2,0x7
ffffffffc02047ac:	15060613          	addi	a2,a2,336 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02047b0:	04500593          	li	a1,69
ffffffffc02047b4:	00008517          	auipc	a0,0x8
ffffffffc02047b8:	7d450513          	addi	a0,a0,2004 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc02047bc:	ce3fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02047c0:	7408                	ld	a0,40(s0)
ffffffffc02047c2:	0ab030ef          	jal	ra,ffffffffc020806c <vfs_close>
ffffffffc02047c6:	60a2                	ld	ra,8(sp)
ffffffffc02047c8:	00042023          	sw	zero,0(s0)
ffffffffc02047cc:	6402                	ld	s0,0(sp)
ffffffffc02047ce:	0141                	addi	sp,sp,16
ffffffffc02047d0:	8082                	ret
ffffffffc02047d2:	591c                	lw	a5,48(a0)
ffffffffc02047d4:	f7f1                	bnez	a5,ffffffffc02047a0 <fd_array_free+0x1a>
ffffffffc02047d6:	60a2                	ld	ra,8(sp)
ffffffffc02047d8:	00042023          	sw	zero,0(s0)
ffffffffc02047dc:	6402                	ld	s0,0(sp)
ffffffffc02047de:	0141                	addi	sp,sp,16
ffffffffc02047e0:	8082                	ret
ffffffffc02047e2:	00008697          	auipc	a3,0x8
ffffffffc02047e6:	7ee68693          	addi	a3,a3,2030 # ffffffffc020cfd0 <default_pmm_manager+0xbf0>
ffffffffc02047ea:	00007617          	auipc	a2,0x7
ffffffffc02047ee:	10e60613          	addi	a2,a2,270 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02047f2:	04400593          	li	a1,68
ffffffffc02047f6:	00008517          	auipc	a0,0x8
ffffffffc02047fa:	79250513          	addi	a0,a0,1938 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc02047fe:	ca1fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204802 <fd_array_release>:
ffffffffc0204802:	4118                	lw	a4,0(a0)
ffffffffc0204804:	1141                	addi	sp,sp,-16
ffffffffc0204806:	e406                	sd	ra,8(sp)
ffffffffc0204808:	4685                	li	a3,1
ffffffffc020480a:	3779                	addiw	a4,a4,-2
ffffffffc020480c:	04e6e063          	bltu	a3,a4,ffffffffc020484c <fd_array_release+0x4a>
ffffffffc0204810:	5918                	lw	a4,48(a0)
ffffffffc0204812:	00e05d63          	blez	a4,ffffffffc020482c <fd_array_release+0x2a>
ffffffffc0204816:	fff7069b          	addiw	a3,a4,-1
ffffffffc020481a:	d914                	sw	a3,48(a0)
ffffffffc020481c:	c681                	beqz	a3,ffffffffc0204824 <fd_array_release+0x22>
ffffffffc020481e:	60a2                	ld	ra,8(sp)
ffffffffc0204820:	0141                	addi	sp,sp,16
ffffffffc0204822:	8082                	ret
ffffffffc0204824:	60a2                	ld	ra,8(sp)
ffffffffc0204826:	0141                	addi	sp,sp,16
ffffffffc0204828:	f5fff06f          	j	ffffffffc0204786 <fd_array_free>
ffffffffc020482c:	00009697          	auipc	a3,0x9
ffffffffc0204830:	81468693          	addi	a3,a3,-2028 # ffffffffc020d040 <default_pmm_manager+0xc60>
ffffffffc0204834:	00007617          	auipc	a2,0x7
ffffffffc0204838:	0c460613          	addi	a2,a2,196 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020483c:	05600593          	li	a1,86
ffffffffc0204840:	00008517          	auipc	a0,0x8
ffffffffc0204844:	74850513          	addi	a0,a0,1864 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204848:	c57fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020484c:	00008697          	auipc	a3,0x8
ffffffffc0204850:	7bc68693          	addi	a3,a3,1980 # ffffffffc020d008 <default_pmm_manager+0xc28>
ffffffffc0204854:	00007617          	auipc	a2,0x7
ffffffffc0204858:	0a460613          	addi	a2,a2,164 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020485c:	05500593          	li	a1,85
ffffffffc0204860:	00008517          	auipc	a0,0x8
ffffffffc0204864:	72850513          	addi	a0,a0,1832 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204868:	c37fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020486c <fd_array_open.part.0>:
ffffffffc020486c:	1141                	addi	sp,sp,-16
ffffffffc020486e:	00008697          	auipc	a3,0x8
ffffffffc0204872:	7ea68693          	addi	a3,a3,2026 # ffffffffc020d058 <default_pmm_manager+0xc78>
ffffffffc0204876:	00007617          	auipc	a2,0x7
ffffffffc020487a:	08260613          	addi	a2,a2,130 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020487e:	05f00593          	li	a1,95
ffffffffc0204882:	00008517          	auipc	a0,0x8
ffffffffc0204886:	70650513          	addi	a0,a0,1798 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc020488a:	e406                	sd	ra,8(sp)
ffffffffc020488c:	c13fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204890 <fd_array_init>:
ffffffffc0204890:	4781                	li	a5,0
ffffffffc0204892:	04800713          	li	a4,72
ffffffffc0204896:	cd1c                	sw	a5,24(a0)
ffffffffc0204898:	02052823          	sw	zero,48(a0)
ffffffffc020489c:	00052023          	sw	zero,0(a0)
ffffffffc02048a0:	2785                	addiw	a5,a5,1
ffffffffc02048a2:	03850513          	addi	a0,a0,56
ffffffffc02048a6:	fee798e3          	bne	a5,a4,ffffffffc0204896 <fd_array_init+0x6>
ffffffffc02048aa:	8082                	ret

ffffffffc02048ac <fd_array_close>:
ffffffffc02048ac:	4118                	lw	a4,0(a0)
ffffffffc02048ae:	1141                	addi	sp,sp,-16
ffffffffc02048b0:	e406                	sd	ra,8(sp)
ffffffffc02048b2:	e022                	sd	s0,0(sp)
ffffffffc02048b4:	4789                	li	a5,2
ffffffffc02048b6:	04f71a63          	bne	a4,a5,ffffffffc020490a <fd_array_close+0x5e>
ffffffffc02048ba:	591c                	lw	a5,48(a0)
ffffffffc02048bc:	842a                	mv	s0,a0
ffffffffc02048be:	02f05663          	blez	a5,ffffffffc02048ea <fd_array_close+0x3e>
ffffffffc02048c2:	37fd                	addiw	a5,a5,-1
ffffffffc02048c4:	470d                	li	a4,3
ffffffffc02048c6:	c118                	sw	a4,0(a0)
ffffffffc02048c8:	d91c                	sw	a5,48(a0)
ffffffffc02048ca:	0007871b          	sext.w	a4,a5
ffffffffc02048ce:	c709                	beqz	a4,ffffffffc02048d8 <fd_array_close+0x2c>
ffffffffc02048d0:	60a2                	ld	ra,8(sp)
ffffffffc02048d2:	6402                	ld	s0,0(sp)
ffffffffc02048d4:	0141                	addi	sp,sp,16
ffffffffc02048d6:	8082                	ret
ffffffffc02048d8:	7508                	ld	a0,40(a0)
ffffffffc02048da:	792030ef          	jal	ra,ffffffffc020806c <vfs_close>
ffffffffc02048de:	60a2                	ld	ra,8(sp)
ffffffffc02048e0:	00042023          	sw	zero,0(s0)
ffffffffc02048e4:	6402                	ld	s0,0(sp)
ffffffffc02048e6:	0141                	addi	sp,sp,16
ffffffffc02048e8:	8082                	ret
ffffffffc02048ea:	00008697          	auipc	a3,0x8
ffffffffc02048ee:	75668693          	addi	a3,a3,1878 # ffffffffc020d040 <default_pmm_manager+0xc60>
ffffffffc02048f2:	00007617          	auipc	a2,0x7
ffffffffc02048f6:	00660613          	addi	a2,a2,6 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02048fa:	06800593          	li	a1,104
ffffffffc02048fe:	00008517          	auipc	a0,0x8
ffffffffc0204902:	68a50513          	addi	a0,a0,1674 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204906:	b99fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020490a:	00008697          	auipc	a3,0x8
ffffffffc020490e:	6a668693          	addi	a3,a3,1702 # ffffffffc020cfb0 <default_pmm_manager+0xbd0>
ffffffffc0204912:	00007617          	auipc	a2,0x7
ffffffffc0204916:	fe660613          	addi	a2,a2,-26 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020491a:	06700593          	li	a1,103
ffffffffc020491e:	00008517          	auipc	a0,0x8
ffffffffc0204922:	66a50513          	addi	a0,a0,1642 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204926:	b79fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020492a <fd_array_dup>:
ffffffffc020492a:	7179                	addi	sp,sp,-48
ffffffffc020492c:	e84a                	sd	s2,16(sp)
ffffffffc020492e:	00052903          	lw	s2,0(a0)
ffffffffc0204932:	f406                	sd	ra,40(sp)
ffffffffc0204934:	f022                	sd	s0,32(sp)
ffffffffc0204936:	ec26                	sd	s1,24(sp)
ffffffffc0204938:	e44e                	sd	s3,8(sp)
ffffffffc020493a:	4785                	li	a5,1
ffffffffc020493c:	04f91663          	bne	s2,a5,ffffffffc0204988 <fd_array_dup+0x5e>
ffffffffc0204940:	0005a983          	lw	s3,0(a1)
ffffffffc0204944:	4789                	li	a5,2
ffffffffc0204946:	04f99163          	bne	s3,a5,ffffffffc0204988 <fd_array_dup+0x5e>
ffffffffc020494a:	7584                	ld	s1,40(a1)
ffffffffc020494c:	699c                	ld	a5,16(a1)
ffffffffc020494e:	7194                	ld	a3,32(a1)
ffffffffc0204950:	6598                	ld	a4,8(a1)
ffffffffc0204952:	842a                	mv	s0,a0
ffffffffc0204954:	e91c                	sd	a5,16(a0)
ffffffffc0204956:	f114                	sd	a3,32(a0)
ffffffffc0204958:	e518                	sd	a4,8(a0)
ffffffffc020495a:	8526                	mv	a0,s1
ffffffffc020495c:	66f020ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc0204960:	8526                	mv	a0,s1
ffffffffc0204962:	675020ef          	jal	ra,ffffffffc02077d6 <inode_open_inc>
ffffffffc0204966:	401c                	lw	a5,0(s0)
ffffffffc0204968:	f404                	sd	s1,40(s0)
ffffffffc020496a:	03279f63          	bne	a5,s2,ffffffffc02049a8 <fd_array_dup+0x7e>
ffffffffc020496e:	cc8d                	beqz	s1,ffffffffc02049a8 <fd_array_dup+0x7e>
ffffffffc0204970:	581c                	lw	a5,48(s0)
ffffffffc0204972:	01342023          	sw	s3,0(s0)
ffffffffc0204976:	70a2                	ld	ra,40(sp)
ffffffffc0204978:	2785                	addiw	a5,a5,1
ffffffffc020497a:	d81c                	sw	a5,48(s0)
ffffffffc020497c:	7402                	ld	s0,32(sp)
ffffffffc020497e:	64e2                	ld	s1,24(sp)
ffffffffc0204980:	6942                	ld	s2,16(sp)
ffffffffc0204982:	69a2                	ld	s3,8(sp)
ffffffffc0204984:	6145                	addi	sp,sp,48
ffffffffc0204986:	8082                	ret
ffffffffc0204988:	00008697          	auipc	a3,0x8
ffffffffc020498c:	70068693          	addi	a3,a3,1792 # ffffffffc020d088 <default_pmm_manager+0xca8>
ffffffffc0204990:	00007617          	auipc	a2,0x7
ffffffffc0204994:	f6860613          	addi	a2,a2,-152 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204998:	07300593          	li	a1,115
ffffffffc020499c:	00008517          	auipc	a0,0x8
ffffffffc02049a0:	5ec50513          	addi	a0,a0,1516 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc02049a4:	afbfb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02049a8:	ec5ff0ef          	jal	ra,ffffffffc020486c <fd_array_open.part.0>

ffffffffc02049ac <file_testfd>:
ffffffffc02049ac:	04700793          	li	a5,71
ffffffffc02049b0:	04a7e263          	bltu	a5,a0,ffffffffc02049f4 <file_testfd+0x48>
ffffffffc02049b4:	00092797          	auipc	a5,0x92
ffffffffc02049b8:	f0c7b783          	ld	a5,-244(a5) # ffffffffc02968c0 <current>
ffffffffc02049bc:	1487b783          	ld	a5,328(a5)
ffffffffc02049c0:	cf85                	beqz	a5,ffffffffc02049f8 <file_testfd+0x4c>
ffffffffc02049c2:	4b98                	lw	a4,16(a5)
ffffffffc02049c4:	02e05a63          	blez	a4,ffffffffc02049f8 <file_testfd+0x4c>
ffffffffc02049c8:	6798                	ld	a4,8(a5)
ffffffffc02049ca:	00351793          	slli	a5,a0,0x3
ffffffffc02049ce:	8f89                	sub	a5,a5,a0
ffffffffc02049d0:	078e                	slli	a5,a5,0x3
ffffffffc02049d2:	97ba                	add	a5,a5,a4
ffffffffc02049d4:	4394                	lw	a3,0(a5)
ffffffffc02049d6:	4709                	li	a4,2
ffffffffc02049d8:	00e69e63          	bne	a3,a4,ffffffffc02049f4 <file_testfd+0x48>
ffffffffc02049dc:	4f98                	lw	a4,24(a5)
ffffffffc02049de:	00a71b63          	bne	a4,a0,ffffffffc02049f4 <file_testfd+0x48>
ffffffffc02049e2:	c199                	beqz	a1,ffffffffc02049e8 <file_testfd+0x3c>
ffffffffc02049e4:	6788                	ld	a0,8(a5)
ffffffffc02049e6:	c901                	beqz	a0,ffffffffc02049f6 <file_testfd+0x4a>
ffffffffc02049e8:	4505                	li	a0,1
ffffffffc02049ea:	c611                	beqz	a2,ffffffffc02049f6 <file_testfd+0x4a>
ffffffffc02049ec:	6b88                	ld	a0,16(a5)
ffffffffc02049ee:	00a03533          	snez	a0,a0
ffffffffc02049f2:	8082                	ret
ffffffffc02049f4:	4501                	li	a0,0
ffffffffc02049f6:	8082                	ret
ffffffffc02049f8:	1141                	addi	sp,sp,-16
ffffffffc02049fa:	e406                	sd	ra,8(sp)
ffffffffc02049fc:	cd5ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0204a00 <file_open>:
ffffffffc0204a00:	711d                	addi	sp,sp,-96
ffffffffc0204a02:	ec86                	sd	ra,88(sp)
ffffffffc0204a04:	e8a2                	sd	s0,80(sp)
ffffffffc0204a06:	e4a6                	sd	s1,72(sp)
ffffffffc0204a08:	e0ca                	sd	s2,64(sp)
ffffffffc0204a0a:	fc4e                	sd	s3,56(sp)
ffffffffc0204a0c:	f852                	sd	s4,48(sp)
ffffffffc0204a0e:	0035f793          	andi	a5,a1,3
ffffffffc0204a12:	470d                	li	a4,3
ffffffffc0204a14:	0ce78163          	beq	a5,a4,ffffffffc0204ad6 <file_open+0xd6>
ffffffffc0204a18:	078e                	slli	a5,a5,0x3
ffffffffc0204a1a:	00009717          	auipc	a4,0x9
ffffffffc0204a1e:	8de70713          	addi	a4,a4,-1826 # ffffffffc020d2f8 <CSWTCH.79>
ffffffffc0204a22:	892a                	mv	s2,a0
ffffffffc0204a24:	00009697          	auipc	a3,0x9
ffffffffc0204a28:	8bc68693          	addi	a3,a3,-1860 # ffffffffc020d2e0 <CSWTCH.78>
ffffffffc0204a2c:	755d                	lui	a0,0xffff7
ffffffffc0204a2e:	96be                	add	a3,a3,a5
ffffffffc0204a30:	84ae                	mv	s1,a1
ffffffffc0204a32:	97ba                	add	a5,a5,a4
ffffffffc0204a34:	858a                	mv	a1,sp
ffffffffc0204a36:	ad950513          	addi	a0,a0,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204a3a:	0006ba03          	ld	s4,0(a3)
ffffffffc0204a3e:	0007b983          	ld	s3,0(a5)
ffffffffc0204a42:	cb1ff0ef          	jal	ra,ffffffffc02046f2 <fd_array_alloc>
ffffffffc0204a46:	842a                	mv	s0,a0
ffffffffc0204a48:	c911                	beqz	a0,ffffffffc0204a5c <file_open+0x5c>
ffffffffc0204a4a:	60e6                	ld	ra,88(sp)
ffffffffc0204a4c:	8522                	mv	a0,s0
ffffffffc0204a4e:	6446                	ld	s0,80(sp)
ffffffffc0204a50:	64a6                	ld	s1,72(sp)
ffffffffc0204a52:	6906                	ld	s2,64(sp)
ffffffffc0204a54:	79e2                	ld	s3,56(sp)
ffffffffc0204a56:	7a42                	ld	s4,48(sp)
ffffffffc0204a58:	6125                	addi	sp,sp,96
ffffffffc0204a5a:	8082                	ret
ffffffffc0204a5c:	0030                	addi	a2,sp,8
ffffffffc0204a5e:	85a6                	mv	a1,s1
ffffffffc0204a60:	854a                	mv	a0,s2
ffffffffc0204a62:	464030ef          	jal	ra,ffffffffc0207ec6 <vfs_open>
ffffffffc0204a66:	842a                	mv	s0,a0
ffffffffc0204a68:	e13d                	bnez	a0,ffffffffc0204ace <file_open+0xce>
ffffffffc0204a6a:	6782                	ld	a5,0(sp)
ffffffffc0204a6c:	0204f493          	andi	s1,s1,32
ffffffffc0204a70:	6422                	ld	s0,8(sp)
ffffffffc0204a72:	0207b023          	sd	zero,32(a5)
ffffffffc0204a76:	c885                	beqz	s1,ffffffffc0204aa6 <file_open+0xa6>
ffffffffc0204a78:	c03d                	beqz	s0,ffffffffc0204ade <file_open+0xde>
ffffffffc0204a7a:	783c                	ld	a5,112(s0)
ffffffffc0204a7c:	c3ad                	beqz	a5,ffffffffc0204ade <file_open+0xde>
ffffffffc0204a7e:	779c                	ld	a5,40(a5)
ffffffffc0204a80:	cfb9                	beqz	a5,ffffffffc0204ade <file_open+0xde>
ffffffffc0204a82:	8522                	mv	a0,s0
ffffffffc0204a84:	00008597          	auipc	a1,0x8
ffffffffc0204a88:	68c58593          	addi	a1,a1,1676 # ffffffffc020d110 <default_pmm_manager+0xd30>
ffffffffc0204a8c:	557020ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0204a90:	783c                	ld	a5,112(s0)
ffffffffc0204a92:	6522                	ld	a0,8(sp)
ffffffffc0204a94:	080c                	addi	a1,sp,16
ffffffffc0204a96:	779c                	ld	a5,40(a5)
ffffffffc0204a98:	9782                	jalr	a5
ffffffffc0204a9a:	842a                	mv	s0,a0
ffffffffc0204a9c:	e515                	bnez	a0,ffffffffc0204ac8 <file_open+0xc8>
ffffffffc0204a9e:	6782                	ld	a5,0(sp)
ffffffffc0204aa0:	7722                	ld	a4,40(sp)
ffffffffc0204aa2:	6422                	ld	s0,8(sp)
ffffffffc0204aa4:	f398                	sd	a4,32(a5)
ffffffffc0204aa6:	4394                	lw	a3,0(a5)
ffffffffc0204aa8:	f780                	sd	s0,40(a5)
ffffffffc0204aaa:	0147b423          	sd	s4,8(a5)
ffffffffc0204aae:	0137b823          	sd	s3,16(a5)
ffffffffc0204ab2:	4705                	li	a4,1
ffffffffc0204ab4:	02e69363          	bne	a3,a4,ffffffffc0204ada <file_open+0xda>
ffffffffc0204ab8:	c00d                	beqz	s0,ffffffffc0204ada <file_open+0xda>
ffffffffc0204aba:	5b98                	lw	a4,48(a5)
ffffffffc0204abc:	4689                	li	a3,2
ffffffffc0204abe:	4f80                	lw	s0,24(a5)
ffffffffc0204ac0:	2705                	addiw	a4,a4,1
ffffffffc0204ac2:	c394                	sw	a3,0(a5)
ffffffffc0204ac4:	db98                	sw	a4,48(a5)
ffffffffc0204ac6:	b751                	j	ffffffffc0204a4a <file_open+0x4a>
ffffffffc0204ac8:	6522                	ld	a0,8(sp)
ffffffffc0204aca:	5a2030ef          	jal	ra,ffffffffc020806c <vfs_close>
ffffffffc0204ace:	6502                	ld	a0,0(sp)
ffffffffc0204ad0:	cb7ff0ef          	jal	ra,ffffffffc0204786 <fd_array_free>
ffffffffc0204ad4:	bf9d                	j	ffffffffc0204a4a <file_open+0x4a>
ffffffffc0204ad6:	5475                	li	s0,-3
ffffffffc0204ad8:	bf8d                	j	ffffffffc0204a4a <file_open+0x4a>
ffffffffc0204ada:	d93ff0ef          	jal	ra,ffffffffc020486c <fd_array_open.part.0>
ffffffffc0204ade:	00008697          	auipc	a3,0x8
ffffffffc0204ae2:	5e268693          	addi	a3,a3,1506 # ffffffffc020d0c0 <default_pmm_manager+0xce0>
ffffffffc0204ae6:	00007617          	auipc	a2,0x7
ffffffffc0204aea:	e1260613          	addi	a2,a2,-494 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204aee:	0b500593          	li	a1,181
ffffffffc0204af2:	00008517          	auipc	a0,0x8
ffffffffc0204af6:	49650513          	addi	a0,a0,1174 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204afa:	9a5fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204afe <file_close>:
ffffffffc0204afe:	04700713          	li	a4,71
ffffffffc0204b02:	04a76563          	bltu	a4,a0,ffffffffc0204b4c <file_close+0x4e>
ffffffffc0204b06:	00092717          	auipc	a4,0x92
ffffffffc0204b0a:	dba73703          	ld	a4,-582(a4) # ffffffffc02968c0 <current>
ffffffffc0204b0e:	14873703          	ld	a4,328(a4)
ffffffffc0204b12:	1141                	addi	sp,sp,-16
ffffffffc0204b14:	e406                	sd	ra,8(sp)
ffffffffc0204b16:	cf0d                	beqz	a4,ffffffffc0204b50 <file_close+0x52>
ffffffffc0204b18:	4b14                	lw	a3,16(a4)
ffffffffc0204b1a:	02d05b63          	blez	a3,ffffffffc0204b50 <file_close+0x52>
ffffffffc0204b1e:	6718                	ld	a4,8(a4)
ffffffffc0204b20:	87aa                	mv	a5,a0
ffffffffc0204b22:	050e                	slli	a0,a0,0x3
ffffffffc0204b24:	8d1d                	sub	a0,a0,a5
ffffffffc0204b26:	050e                	slli	a0,a0,0x3
ffffffffc0204b28:	953a                	add	a0,a0,a4
ffffffffc0204b2a:	4114                	lw	a3,0(a0)
ffffffffc0204b2c:	4709                	li	a4,2
ffffffffc0204b2e:	00e69b63          	bne	a3,a4,ffffffffc0204b44 <file_close+0x46>
ffffffffc0204b32:	4d18                	lw	a4,24(a0)
ffffffffc0204b34:	00f71863          	bne	a4,a5,ffffffffc0204b44 <file_close+0x46>
ffffffffc0204b38:	d75ff0ef          	jal	ra,ffffffffc02048ac <fd_array_close>
ffffffffc0204b3c:	60a2                	ld	ra,8(sp)
ffffffffc0204b3e:	4501                	li	a0,0
ffffffffc0204b40:	0141                	addi	sp,sp,16
ffffffffc0204b42:	8082                	ret
ffffffffc0204b44:	60a2                	ld	ra,8(sp)
ffffffffc0204b46:	5575                	li	a0,-3
ffffffffc0204b48:	0141                	addi	sp,sp,16
ffffffffc0204b4a:	8082                	ret
ffffffffc0204b4c:	5575                	li	a0,-3
ffffffffc0204b4e:	8082                	ret
ffffffffc0204b50:	b81ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0204b54 <file_read>:
ffffffffc0204b54:	715d                	addi	sp,sp,-80
ffffffffc0204b56:	e486                	sd	ra,72(sp)
ffffffffc0204b58:	e0a2                	sd	s0,64(sp)
ffffffffc0204b5a:	fc26                	sd	s1,56(sp)
ffffffffc0204b5c:	f84a                	sd	s2,48(sp)
ffffffffc0204b5e:	f44e                	sd	s3,40(sp)
ffffffffc0204b60:	f052                	sd	s4,32(sp)
ffffffffc0204b62:	0006b023          	sd	zero,0(a3)
ffffffffc0204b66:	04700793          	li	a5,71
ffffffffc0204b6a:	0aa7e463          	bltu	a5,a0,ffffffffc0204c12 <file_read+0xbe>
ffffffffc0204b6e:	00092797          	auipc	a5,0x92
ffffffffc0204b72:	d527b783          	ld	a5,-686(a5) # ffffffffc02968c0 <current>
ffffffffc0204b76:	1487b783          	ld	a5,328(a5)
ffffffffc0204b7a:	cfd1                	beqz	a5,ffffffffc0204c16 <file_read+0xc2>
ffffffffc0204b7c:	4b98                	lw	a4,16(a5)
ffffffffc0204b7e:	08e05c63          	blez	a4,ffffffffc0204c16 <file_read+0xc2>
ffffffffc0204b82:	6780                	ld	s0,8(a5)
ffffffffc0204b84:	00351793          	slli	a5,a0,0x3
ffffffffc0204b88:	8f89                	sub	a5,a5,a0
ffffffffc0204b8a:	078e                	slli	a5,a5,0x3
ffffffffc0204b8c:	943e                	add	s0,s0,a5
ffffffffc0204b8e:	00042983          	lw	s3,0(s0)
ffffffffc0204b92:	4789                	li	a5,2
ffffffffc0204b94:	06f99f63          	bne	s3,a5,ffffffffc0204c12 <file_read+0xbe>
ffffffffc0204b98:	4c1c                	lw	a5,24(s0)
ffffffffc0204b9a:	06a79c63          	bne	a5,a0,ffffffffc0204c12 <file_read+0xbe>
ffffffffc0204b9e:	641c                	ld	a5,8(s0)
ffffffffc0204ba0:	cbad                	beqz	a5,ffffffffc0204c12 <file_read+0xbe>
ffffffffc0204ba2:	581c                	lw	a5,48(s0)
ffffffffc0204ba4:	8a36                	mv	s4,a3
ffffffffc0204ba6:	7014                	ld	a3,32(s0)
ffffffffc0204ba8:	2785                	addiw	a5,a5,1
ffffffffc0204baa:	850a                	mv	a0,sp
ffffffffc0204bac:	d81c                	sw	a5,48(s0)
ffffffffc0204bae:	792000ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc0204bb2:	02843903          	ld	s2,40(s0)
ffffffffc0204bb6:	84aa                	mv	s1,a0
ffffffffc0204bb8:	06090163          	beqz	s2,ffffffffc0204c1a <file_read+0xc6>
ffffffffc0204bbc:	07093783          	ld	a5,112(s2)
ffffffffc0204bc0:	cfa9                	beqz	a5,ffffffffc0204c1a <file_read+0xc6>
ffffffffc0204bc2:	6f9c                	ld	a5,24(a5)
ffffffffc0204bc4:	cbb9                	beqz	a5,ffffffffc0204c1a <file_read+0xc6>
ffffffffc0204bc6:	00008597          	auipc	a1,0x8
ffffffffc0204bca:	5a258593          	addi	a1,a1,1442 # ffffffffc020d168 <default_pmm_manager+0xd88>
ffffffffc0204bce:	854a                	mv	a0,s2
ffffffffc0204bd0:	413020ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0204bd4:	07093783          	ld	a5,112(s2)
ffffffffc0204bd8:	7408                	ld	a0,40(s0)
ffffffffc0204bda:	85a6                	mv	a1,s1
ffffffffc0204bdc:	6f9c                	ld	a5,24(a5)
ffffffffc0204bde:	9782                	jalr	a5
ffffffffc0204be0:	689c                	ld	a5,16(s1)
ffffffffc0204be2:	6c94                	ld	a3,24(s1)
ffffffffc0204be4:	4018                	lw	a4,0(s0)
ffffffffc0204be6:	84aa                	mv	s1,a0
ffffffffc0204be8:	8f95                	sub	a5,a5,a3
ffffffffc0204bea:	03370063          	beq	a4,s3,ffffffffc0204c0a <file_read+0xb6>
ffffffffc0204bee:	00fa3023          	sd	a5,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0204bf2:	8522                	mv	a0,s0
ffffffffc0204bf4:	c0fff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc0204bf8:	60a6                	ld	ra,72(sp)
ffffffffc0204bfa:	6406                	ld	s0,64(sp)
ffffffffc0204bfc:	7942                	ld	s2,48(sp)
ffffffffc0204bfe:	79a2                	ld	s3,40(sp)
ffffffffc0204c00:	7a02                	ld	s4,32(sp)
ffffffffc0204c02:	8526                	mv	a0,s1
ffffffffc0204c04:	74e2                	ld	s1,56(sp)
ffffffffc0204c06:	6161                	addi	sp,sp,80
ffffffffc0204c08:	8082                	ret
ffffffffc0204c0a:	7018                	ld	a4,32(s0)
ffffffffc0204c0c:	973e                	add	a4,a4,a5
ffffffffc0204c0e:	f018                	sd	a4,32(s0)
ffffffffc0204c10:	bff9                	j	ffffffffc0204bee <file_read+0x9a>
ffffffffc0204c12:	54f5                	li	s1,-3
ffffffffc0204c14:	b7d5                	j	ffffffffc0204bf8 <file_read+0xa4>
ffffffffc0204c16:	abbff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>
ffffffffc0204c1a:	00008697          	auipc	a3,0x8
ffffffffc0204c1e:	4fe68693          	addi	a3,a3,1278 # ffffffffc020d118 <default_pmm_manager+0xd38>
ffffffffc0204c22:	00007617          	auipc	a2,0x7
ffffffffc0204c26:	cd660613          	addi	a2,a2,-810 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204c2a:	0de00593          	li	a1,222
ffffffffc0204c2e:	00008517          	auipc	a0,0x8
ffffffffc0204c32:	35a50513          	addi	a0,a0,858 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204c36:	869fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204c3a <file_write>:
ffffffffc0204c3a:	715d                	addi	sp,sp,-80
ffffffffc0204c3c:	e486                	sd	ra,72(sp)
ffffffffc0204c3e:	e0a2                	sd	s0,64(sp)
ffffffffc0204c40:	fc26                	sd	s1,56(sp)
ffffffffc0204c42:	f84a                	sd	s2,48(sp)
ffffffffc0204c44:	f44e                	sd	s3,40(sp)
ffffffffc0204c46:	f052                	sd	s4,32(sp)
ffffffffc0204c48:	0006b023          	sd	zero,0(a3)
ffffffffc0204c4c:	04700793          	li	a5,71
ffffffffc0204c50:	0aa7e463          	bltu	a5,a0,ffffffffc0204cf8 <file_write+0xbe>
ffffffffc0204c54:	00092797          	auipc	a5,0x92
ffffffffc0204c58:	c6c7b783          	ld	a5,-916(a5) # ffffffffc02968c0 <current>
ffffffffc0204c5c:	1487b783          	ld	a5,328(a5)
ffffffffc0204c60:	cfd1                	beqz	a5,ffffffffc0204cfc <file_write+0xc2>
ffffffffc0204c62:	4b98                	lw	a4,16(a5)
ffffffffc0204c64:	08e05c63          	blez	a4,ffffffffc0204cfc <file_write+0xc2>
ffffffffc0204c68:	6780                	ld	s0,8(a5)
ffffffffc0204c6a:	00351793          	slli	a5,a0,0x3
ffffffffc0204c6e:	8f89                	sub	a5,a5,a0
ffffffffc0204c70:	078e                	slli	a5,a5,0x3
ffffffffc0204c72:	943e                	add	s0,s0,a5
ffffffffc0204c74:	00042983          	lw	s3,0(s0)
ffffffffc0204c78:	4789                	li	a5,2
ffffffffc0204c7a:	06f99f63          	bne	s3,a5,ffffffffc0204cf8 <file_write+0xbe>
ffffffffc0204c7e:	4c1c                	lw	a5,24(s0)
ffffffffc0204c80:	06a79c63          	bne	a5,a0,ffffffffc0204cf8 <file_write+0xbe>
ffffffffc0204c84:	681c                	ld	a5,16(s0)
ffffffffc0204c86:	cbad                	beqz	a5,ffffffffc0204cf8 <file_write+0xbe>
ffffffffc0204c88:	581c                	lw	a5,48(s0)
ffffffffc0204c8a:	8a36                	mv	s4,a3
ffffffffc0204c8c:	7014                	ld	a3,32(s0)
ffffffffc0204c8e:	2785                	addiw	a5,a5,1
ffffffffc0204c90:	850a                	mv	a0,sp
ffffffffc0204c92:	d81c                	sw	a5,48(s0)
ffffffffc0204c94:	6ac000ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc0204c98:	02843903          	ld	s2,40(s0)
ffffffffc0204c9c:	84aa                	mv	s1,a0
ffffffffc0204c9e:	06090163          	beqz	s2,ffffffffc0204d00 <file_write+0xc6>
ffffffffc0204ca2:	07093783          	ld	a5,112(s2)
ffffffffc0204ca6:	cfa9                	beqz	a5,ffffffffc0204d00 <file_write+0xc6>
ffffffffc0204ca8:	739c                	ld	a5,32(a5)
ffffffffc0204caa:	cbb9                	beqz	a5,ffffffffc0204d00 <file_write+0xc6>
ffffffffc0204cac:	00008597          	auipc	a1,0x8
ffffffffc0204cb0:	51458593          	addi	a1,a1,1300 # ffffffffc020d1c0 <default_pmm_manager+0xde0>
ffffffffc0204cb4:	854a                	mv	a0,s2
ffffffffc0204cb6:	32d020ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0204cba:	07093783          	ld	a5,112(s2)
ffffffffc0204cbe:	7408                	ld	a0,40(s0)
ffffffffc0204cc0:	85a6                	mv	a1,s1
ffffffffc0204cc2:	739c                	ld	a5,32(a5)
ffffffffc0204cc4:	9782                	jalr	a5
ffffffffc0204cc6:	689c                	ld	a5,16(s1)
ffffffffc0204cc8:	6c94                	ld	a3,24(s1)
ffffffffc0204cca:	4018                	lw	a4,0(s0)
ffffffffc0204ccc:	84aa                	mv	s1,a0
ffffffffc0204cce:	8f95                	sub	a5,a5,a3
ffffffffc0204cd0:	03370063          	beq	a4,s3,ffffffffc0204cf0 <file_write+0xb6>
ffffffffc0204cd4:	00fa3023          	sd	a5,0(s4)
ffffffffc0204cd8:	8522                	mv	a0,s0
ffffffffc0204cda:	b29ff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc0204cde:	60a6                	ld	ra,72(sp)
ffffffffc0204ce0:	6406                	ld	s0,64(sp)
ffffffffc0204ce2:	7942                	ld	s2,48(sp)
ffffffffc0204ce4:	79a2                	ld	s3,40(sp)
ffffffffc0204ce6:	7a02                	ld	s4,32(sp)
ffffffffc0204ce8:	8526                	mv	a0,s1
ffffffffc0204cea:	74e2                	ld	s1,56(sp)
ffffffffc0204cec:	6161                	addi	sp,sp,80
ffffffffc0204cee:	8082                	ret
ffffffffc0204cf0:	7018                	ld	a4,32(s0)
ffffffffc0204cf2:	973e                	add	a4,a4,a5
ffffffffc0204cf4:	f018                	sd	a4,32(s0)
ffffffffc0204cf6:	bff9                	j	ffffffffc0204cd4 <file_write+0x9a>
ffffffffc0204cf8:	54f5                	li	s1,-3
ffffffffc0204cfa:	b7d5                	j	ffffffffc0204cde <file_write+0xa4>
ffffffffc0204cfc:	9d5ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>
ffffffffc0204d00:	00008697          	auipc	a3,0x8
ffffffffc0204d04:	47068693          	addi	a3,a3,1136 # ffffffffc020d170 <default_pmm_manager+0xd90>
ffffffffc0204d08:	00007617          	auipc	a2,0x7
ffffffffc0204d0c:	bf060613          	addi	a2,a2,-1040 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204d10:	0f800593          	li	a1,248
ffffffffc0204d14:	00008517          	auipc	a0,0x8
ffffffffc0204d18:	27450513          	addi	a0,a0,628 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204d1c:	f82fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204d20 <file_seek>:
ffffffffc0204d20:	7139                	addi	sp,sp,-64
ffffffffc0204d22:	fc06                	sd	ra,56(sp)
ffffffffc0204d24:	f822                	sd	s0,48(sp)
ffffffffc0204d26:	f426                	sd	s1,40(sp)
ffffffffc0204d28:	f04a                	sd	s2,32(sp)
ffffffffc0204d2a:	04700793          	li	a5,71
ffffffffc0204d2e:	08a7e863          	bltu	a5,a0,ffffffffc0204dbe <file_seek+0x9e>
ffffffffc0204d32:	00092797          	auipc	a5,0x92
ffffffffc0204d36:	b8e7b783          	ld	a5,-1138(a5) # ffffffffc02968c0 <current>
ffffffffc0204d3a:	1487b783          	ld	a5,328(a5)
ffffffffc0204d3e:	cfdd                	beqz	a5,ffffffffc0204dfc <file_seek+0xdc>
ffffffffc0204d40:	4b98                	lw	a4,16(a5)
ffffffffc0204d42:	0ae05d63          	blez	a4,ffffffffc0204dfc <file_seek+0xdc>
ffffffffc0204d46:	6780                	ld	s0,8(a5)
ffffffffc0204d48:	00351793          	slli	a5,a0,0x3
ffffffffc0204d4c:	8f89                	sub	a5,a5,a0
ffffffffc0204d4e:	078e                	slli	a5,a5,0x3
ffffffffc0204d50:	943e                	add	s0,s0,a5
ffffffffc0204d52:	4018                	lw	a4,0(s0)
ffffffffc0204d54:	4789                	li	a5,2
ffffffffc0204d56:	06f71463          	bne	a4,a5,ffffffffc0204dbe <file_seek+0x9e>
ffffffffc0204d5a:	4c1c                	lw	a5,24(s0)
ffffffffc0204d5c:	06a79163          	bne	a5,a0,ffffffffc0204dbe <file_seek+0x9e>
ffffffffc0204d60:	581c                	lw	a5,48(s0)
ffffffffc0204d62:	4685                	li	a3,1
ffffffffc0204d64:	892e                	mv	s2,a1
ffffffffc0204d66:	2785                	addiw	a5,a5,1
ffffffffc0204d68:	d81c                	sw	a5,48(s0)
ffffffffc0204d6a:	02d60063          	beq	a2,a3,ffffffffc0204d8a <file_seek+0x6a>
ffffffffc0204d6e:	06e60063          	beq	a2,a4,ffffffffc0204dce <file_seek+0xae>
ffffffffc0204d72:	54f5                	li	s1,-3
ffffffffc0204d74:	ce11                	beqz	a2,ffffffffc0204d90 <file_seek+0x70>
ffffffffc0204d76:	8522                	mv	a0,s0
ffffffffc0204d78:	a8bff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc0204d7c:	70e2                	ld	ra,56(sp)
ffffffffc0204d7e:	7442                	ld	s0,48(sp)
ffffffffc0204d80:	7902                	ld	s2,32(sp)
ffffffffc0204d82:	8526                	mv	a0,s1
ffffffffc0204d84:	74a2                	ld	s1,40(sp)
ffffffffc0204d86:	6121                	addi	sp,sp,64
ffffffffc0204d88:	8082                	ret
ffffffffc0204d8a:	701c                	ld	a5,32(s0)
ffffffffc0204d8c:	00f58933          	add	s2,a1,a5
ffffffffc0204d90:	7404                	ld	s1,40(s0)
ffffffffc0204d92:	c4bd                	beqz	s1,ffffffffc0204e00 <file_seek+0xe0>
ffffffffc0204d94:	78bc                	ld	a5,112(s1)
ffffffffc0204d96:	c7ad                	beqz	a5,ffffffffc0204e00 <file_seek+0xe0>
ffffffffc0204d98:	6fbc                	ld	a5,88(a5)
ffffffffc0204d9a:	c3bd                	beqz	a5,ffffffffc0204e00 <file_seek+0xe0>
ffffffffc0204d9c:	8526                	mv	a0,s1
ffffffffc0204d9e:	00008597          	auipc	a1,0x8
ffffffffc0204da2:	47a58593          	addi	a1,a1,1146 # ffffffffc020d218 <default_pmm_manager+0xe38>
ffffffffc0204da6:	23d020ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0204daa:	78bc                	ld	a5,112(s1)
ffffffffc0204dac:	7408                	ld	a0,40(s0)
ffffffffc0204dae:	85ca                	mv	a1,s2
ffffffffc0204db0:	6fbc                	ld	a5,88(a5)
ffffffffc0204db2:	9782                	jalr	a5
ffffffffc0204db4:	84aa                	mv	s1,a0
ffffffffc0204db6:	f161                	bnez	a0,ffffffffc0204d76 <file_seek+0x56>
ffffffffc0204db8:	03243023          	sd	s2,32(s0)
ffffffffc0204dbc:	bf6d                	j	ffffffffc0204d76 <file_seek+0x56>
ffffffffc0204dbe:	70e2                	ld	ra,56(sp)
ffffffffc0204dc0:	7442                	ld	s0,48(sp)
ffffffffc0204dc2:	54f5                	li	s1,-3
ffffffffc0204dc4:	7902                	ld	s2,32(sp)
ffffffffc0204dc6:	8526                	mv	a0,s1
ffffffffc0204dc8:	74a2                	ld	s1,40(sp)
ffffffffc0204dca:	6121                	addi	sp,sp,64
ffffffffc0204dcc:	8082                	ret
ffffffffc0204dce:	7404                	ld	s1,40(s0)
ffffffffc0204dd0:	c8a1                	beqz	s1,ffffffffc0204e20 <file_seek+0x100>
ffffffffc0204dd2:	78bc                	ld	a5,112(s1)
ffffffffc0204dd4:	c7b1                	beqz	a5,ffffffffc0204e20 <file_seek+0x100>
ffffffffc0204dd6:	779c                	ld	a5,40(a5)
ffffffffc0204dd8:	c7a1                	beqz	a5,ffffffffc0204e20 <file_seek+0x100>
ffffffffc0204dda:	8526                	mv	a0,s1
ffffffffc0204ddc:	00008597          	auipc	a1,0x8
ffffffffc0204de0:	33458593          	addi	a1,a1,820 # ffffffffc020d110 <default_pmm_manager+0xd30>
ffffffffc0204de4:	1ff020ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0204de8:	78bc                	ld	a5,112(s1)
ffffffffc0204dea:	7408                	ld	a0,40(s0)
ffffffffc0204dec:	858a                	mv	a1,sp
ffffffffc0204dee:	779c                	ld	a5,40(a5)
ffffffffc0204df0:	9782                	jalr	a5
ffffffffc0204df2:	84aa                	mv	s1,a0
ffffffffc0204df4:	f149                	bnez	a0,ffffffffc0204d76 <file_seek+0x56>
ffffffffc0204df6:	67e2                	ld	a5,24(sp)
ffffffffc0204df8:	993e                	add	s2,s2,a5
ffffffffc0204dfa:	bf59                	j	ffffffffc0204d90 <file_seek+0x70>
ffffffffc0204dfc:	8d5ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>
ffffffffc0204e00:	00008697          	auipc	a3,0x8
ffffffffc0204e04:	3c868693          	addi	a3,a3,968 # ffffffffc020d1c8 <default_pmm_manager+0xde8>
ffffffffc0204e08:	00007617          	auipc	a2,0x7
ffffffffc0204e0c:	af060613          	addi	a2,a2,-1296 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204e10:	11a00593          	li	a1,282
ffffffffc0204e14:	00008517          	auipc	a0,0x8
ffffffffc0204e18:	17450513          	addi	a0,a0,372 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204e1c:	e82fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204e20:	00008697          	auipc	a3,0x8
ffffffffc0204e24:	2a068693          	addi	a3,a3,672 # ffffffffc020d0c0 <default_pmm_manager+0xce0>
ffffffffc0204e28:	00007617          	auipc	a2,0x7
ffffffffc0204e2c:	ad060613          	addi	a2,a2,-1328 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204e30:	11200593          	li	a1,274
ffffffffc0204e34:	00008517          	auipc	a0,0x8
ffffffffc0204e38:	15450513          	addi	a0,a0,340 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204e3c:	e62fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204e40 <file_fstat>:
ffffffffc0204e40:	1101                	addi	sp,sp,-32
ffffffffc0204e42:	ec06                	sd	ra,24(sp)
ffffffffc0204e44:	e822                	sd	s0,16(sp)
ffffffffc0204e46:	e426                	sd	s1,8(sp)
ffffffffc0204e48:	e04a                	sd	s2,0(sp)
ffffffffc0204e4a:	04700793          	li	a5,71
ffffffffc0204e4e:	06a7ef63          	bltu	a5,a0,ffffffffc0204ecc <file_fstat+0x8c>
ffffffffc0204e52:	00092797          	auipc	a5,0x92
ffffffffc0204e56:	a6e7b783          	ld	a5,-1426(a5) # ffffffffc02968c0 <current>
ffffffffc0204e5a:	1487b783          	ld	a5,328(a5)
ffffffffc0204e5e:	cfd9                	beqz	a5,ffffffffc0204efc <file_fstat+0xbc>
ffffffffc0204e60:	4b98                	lw	a4,16(a5)
ffffffffc0204e62:	08e05d63          	blez	a4,ffffffffc0204efc <file_fstat+0xbc>
ffffffffc0204e66:	6780                	ld	s0,8(a5)
ffffffffc0204e68:	00351793          	slli	a5,a0,0x3
ffffffffc0204e6c:	8f89                	sub	a5,a5,a0
ffffffffc0204e6e:	078e                	slli	a5,a5,0x3
ffffffffc0204e70:	943e                	add	s0,s0,a5
ffffffffc0204e72:	4018                	lw	a4,0(s0)
ffffffffc0204e74:	4789                	li	a5,2
ffffffffc0204e76:	04f71b63          	bne	a4,a5,ffffffffc0204ecc <file_fstat+0x8c>
ffffffffc0204e7a:	4c1c                	lw	a5,24(s0)
ffffffffc0204e7c:	04a79863          	bne	a5,a0,ffffffffc0204ecc <file_fstat+0x8c>
ffffffffc0204e80:	581c                	lw	a5,48(s0)
ffffffffc0204e82:	02843903          	ld	s2,40(s0)
ffffffffc0204e86:	2785                	addiw	a5,a5,1
ffffffffc0204e88:	d81c                	sw	a5,48(s0)
ffffffffc0204e8a:	04090963          	beqz	s2,ffffffffc0204edc <file_fstat+0x9c>
ffffffffc0204e8e:	07093783          	ld	a5,112(s2)
ffffffffc0204e92:	c7a9                	beqz	a5,ffffffffc0204edc <file_fstat+0x9c>
ffffffffc0204e94:	779c                	ld	a5,40(a5)
ffffffffc0204e96:	c3b9                	beqz	a5,ffffffffc0204edc <file_fstat+0x9c>
ffffffffc0204e98:	84ae                	mv	s1,a1
ffffffffc0204e9a:	854a                	mv	a0,s2
ffffffffc0204e9c:	00008597          	auipc	a1,0x8
ffffffffc0204ea0:	27458593          	addi	a1,a1,628 # ffffffffc020d110 <default_pmm_manager+0xd30>
ffffffffc0204ea4:	13f020ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0204ea8:	07093783          	ld	a5,112(s2)
ffffffffc0204eac:	7408                	ld	a0,40(s0)
ffffffffc0204eae:	85a6                	mv	a1,s1
ffffffffc0204eb0:	779c                	ld	a5,40(a5)
ffffffffc0204eb2:	9782                	jalr	a5
ffffffffc0204eb4:	87aa                	mv	a5,a0
ffffffffc0204eb6:	8522                	mv	a0,s0
ffffffffc0204eb8:	843e                	mv	s0,a5
ffffffffc0204eba:	949ff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc0204ebe:	60e2                	ld	ra,24(sp)
ffffffffc0204ec0:	8522                	mv	a0,s0
ffffffffc0204ec2:	6442                	ld	s0,16(sp)
ffffffffc0204ec4:	64a2                	ld	s1,8(sp)
ffffffffc0204ec6:	6902                	ld	s2,0(sp)
ffffffffc0204ec8:	6105                	addi	sp,sp,32
ffffffffc0204eca:	8082                	ret
ffffffffc0204ecc:	5475                	li	s0,-3
ffffffffc0204ece:	60e2                	ld	ra,24(sp)
ffffffffc0204ed0:	8522                	mv	a0,s0
ffffffffc0204ed2:	6442                	ld	s0,16(sp)
ffffffffc0204ed4:	64a2                	ld	s1,8(sp)
ffffffffc0204ed6:	6902                	ld	s2,0(sp)
ffffffffc0204ed8:	6105                	addi	sp,sp,32
ffffffffc0204eda:	8082                	ret
ffffffffc0204edc:	00008697          	auipc	a3,0x8
ffffffffc0204ee0:	1e468693          	addi	a3,a3,484 # ffffffffc020d0c0 <default_pmm_manager+0xce0>
ffffffffc0204ee4:	00007617          	auipc	a2,0x7
ffffffffc0204ee8:	a1460613          	addi	a2,a2,-1516 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204eec:	12c00593          	li	a1,300
ffffffffc0204ef0:	00008517          	auipc	a0,0x8
ffffffffc0204ef4:	09850513          	addi	a0,a0,152 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204ef8:	da6fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204efc:	fd4ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0204f00 <file_fsync>:
ffffffffc0204f00:	1101                	addi	sp,sp,-32
ffffffffc0204f02:	ec06                	sd	ra,24(sp)
ffffffffc0204f04:	e822                	sd	s0,16(sp)
ffffffffc0204f06:	e426                	sd	s1,8(sp)
ffffffffc0204f08:	04700793          	li	a5,71
ffffffffc0204f0c:	06a7e863          	bltu	a5,a0,ffffffffc0204f7c <file_fsync+0x7c>
ffffffffc0204f10:	00092797          	auipc	a5,0x92
ffffffffc0204f14:	9b07b783          	ld	a5,-1616(a5) # ffffffffc02968c0 <current>
ffffffffc0204f18:	1487b783          	ld	a5,328(a5)
ffffffffc0204f1c:	c7d9                	beqz	a5,ffffffffc0204faa <file_fsync+0xaa>
ffffffffc0204f1e:	4b98                	lw	a4,16(a5)
ffffffffc0204f20:	08e05563          	blez	a4,ffffffffc0204faa <file_fsync+0xaa>
ffffffffc0204f24:	6780                	ld	s0,8(a5)
ffffffffc0204f26:	00351793          	slli	a5,a0,0x3
ffffffffc0204f2a:	8f89                	sub	a5,a5,a0
ffffffffc0204f2c:	078e                	slli	a5,a5,0x3
ffffffffc0204f2e:	943e                	add	s0,s0,a5
ffffffffc0204f30:	4018                	lw	a4,0(s0)
ffffffffc0204f32:	4789                	li	a5,2
ffffffffc0204f34:	04f71463          	bne	a4,a5,ffffffffc0204f7c <file_fsync+0x7c>
ffffffffc0204f38:	4c1c                	lw	a5,24(s0)
ffffffffc0204f3a:	04a79163          	bne	a5,a0,ffffffffc0204f7c <file_fsync+0x7c>
ffffffffc0204f3e:	581c                	lw	a5,48(s0)
ffffffffc0204f40:	7404                	ld	s1,40(s0)
ffffffffc0204f42:	2785                	addiw	a5,a5,1
ffffffffc0204f44:	d81c                	sw	a5,48(s0)
ffffffffc0204f46:	c0b1                	beqz	s1,ffffffffc0204f8a <file_fsync+0x8a>
ffffffffc0204f48:	78bc                	ld	a5,112(s1)
ffffffffc0204f4a:	c3a1                	beqz	a5,ffffffffc0204f8a <file_fsync+0x8a>
ffffffffc0204f4c:	7b9c                	ld	a5,48(a5)
ffffffffc0204f4e:	cf95                	beqz	a5,ffffffffc0204f8a <file_fsync+0x8a>
ffffffffc0204f50:	00008597          	auipc	a1,0x8
ffffffffc0204f54:	32058593          	addi	a1,a1,800 # ffffffffc020d270 <default_pmm_manager+0xe90>
ffffffffc0204f58:	8526                	mv	a0,s1
ffffffffc0204f5a:	089020ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0204f5e:	78bc                	ld	a5,112(s1)
ffffffffc0204f60:	7408                	ld	a0,40(s0)
ffffffffc0204f62:	7b9c                	ld	a5,48(a5)
ffffffffc0204f64:	9782                	jalr	a5
ffffffffc0204f66:	87aa                	mv	a5,a0
ffffffffc0204f68:	8522                	mv	a0,s0
ffffffffc0204f6a:	843e                	mv	s0,a5
ffffffffc0204f6c:	897ff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc0204f70:	60e2                	ld	ra,24(sp)
ffffffffc0204f72:	8522                	mv	a0,s0
ffffffffc0204f74:	6442                	ld	s0,16(sp)
ffffffffc0204f76:	64a2                	ld	s1,8(sp)
ffffffffc0204f78:	6105                	addi	sp,sp,32
ffffffffc0204f7a:	8082                	ret
ffffffffc0204f7c:	5475                	li	s0,-3
ffffffffc0204f7e:	60e2                	ld	ra,24(sp)
ffffffffc0204f80:	8522                	mv	a0,s0
ffffffffc0204f82:	6442                	ld	s0,16(sp)
ffffffffc0204f84:	64a2                	ld	s1,8(sp)
ffffffffc0204f86:	6105                	addi	sp,sp,32
ffffffffc0204f88:	8082                	ret
ffffffffc0204f8a:	00008697          	auipc	a3,0x8
ffffffffc0204f8e:	29668693          	addi	a3,a3,662 # ffffffffc020d220 <default_pmm_manager+0xe40>
ffffffffc0204f92:	00007617          	auipc	a2,0x7
ffffffffc0204f96:	96660613          	addi	a2,a2,-1690 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0204f9a:	13a00593          	li	a1,314
ffffffffc0204f9e:	00008517          	auipc	a0,0x8
ffffffffc0204fa2:	fea50513          	addi	a0,a0,-22 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc0204fa6:	cf8fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204faa:	f26ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0204fae <file_getdirentry>:
ffffffffc0204fae:	715d                	addi	sp,sp,-80
ffffffffc0204fb0:	e486                	sd	ra,72(sp)
ffffffffc0204fb2:	e0a2                	sd	s0,64(sp)
ffffffffc0204fb4:	fc26                	sd	s1,56(sp)
ffffffffc0204fb6:	f84a                	sd	s2,48(sp)
ffffffffc0204fb8:	f44e                	sd	s3,40(sp)
ffffffffc0204fba:	04700793          	li	a5,71
ffffffffc0204fbe:	0aa7e063          	bltu	a5,a0,ffffffffc020505e <file_getdirentry+0xb0>
ffffffffc0204fc2:	00092797          	auipc	a5,0x92
ffffffffc0204fc6:	8fe7b783          	ld	a5,-1794(a5) # ffffffffc02968c0 <current>
ffffffffc0204fca:	1487b783          	ld	a5,328(a5)
ffffffffc0204fce:	c3e9                	beqz	a5,ffffffffc0205090 <file_getdirentry+0xe2>
ffffffffc0204fd0:	4b98                	lw	a4,16(a5)
ffffffffc0204fd2:	0ae05f63          	blez	a4,ffffffffc0205090 <file_getdirentry+0xe2>
ffffffffc0204fd6:	6780                	ld	s0,8(a5)
ffffffffc0204fd8:	00351793          	slli	a5,a0,0x3
ffffffffc0204fdc:	8f89                	sub	a5,a5,a0
ffffffffc0204fde:	078e                	slli	a5,a5,0x3
ffffffffc0204fe0:	943e                	add	s0,s0,a5
ffffffffc0204fe2:	4018                	lw	a4,0(s0)
ffffffffc0204fe4:	4789                	li	a5,2
ffffffffc0204fe6:	06f71c63          	bne	a4,a5,ffffffffc020505e <file_getdirentry+0xb0>
ffffffffc0204fea:	4c1c                	lw	a5,24(s0)
ffffffffc0204fec:	06a79963          	bne	a5,a0,ffffffffc020505e <file_getdirentry+0xb0>
ffffffffc0204ff0:	581c                	lw	a5,48(s0)
ffffffffc0204ff2:	6194                	ld	a3,0(a1)
ffffffffc0204ff4:	84ae                	mv	s1,a1
ffffffffc0204ff6:	2785                	addiw	a5,a5,1
ffffffffc0204ff8:	10000613          	li	a2,256
ffffffffc0204ffc:	d81c                	sw	a5,48(s0)
ffffffffc0204ffe:	05a1                	addi	a1,a1,8
ffffffffc0205000:	850a                	mv	a0,sp
ffffffffc0205002:	33e000ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc0205006:	02843983          	ld	s3,40(s0)
ffffffffc020500a:	892a                	mv	s2,a0
ffffffffc020500c:	06098263          	beqz	s3,ffffffffc0205070 <file_getdirentry+0xc2>
ffffffffc0205010:	0709b783          	ld	a5,112(s3) # 1070 <_binary_bin_swap_img_size-0x6c90>
ffffffffc0205014:	cfb1                	beqz	a5,ffffffffc0205070 <file_getdirentry+0xc2>
ffffffffc0205016:	63bc                	ld	a5,64(a5)
ffffffffc0205018:	cfa1                	beqz	a5,ffffffffc0205070 <file_getdirentry+0xc2>
ffffffffc020501a:	854e                	mv	a0,s3
ffffffffc020501c:	00008597          	auipc	a1,0x8
ffffffffc0205020:	2b458593          	addi	a1,a1,692 # ffffffffc020d2d0 <default_pmm_manager+0xef0>
ffffffffc0205024:	7be020ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0205028:	0709b783          	ld	a5,112(s3)
ffffffffc020502c:	7408                	ld	a0,40(s0)
ffffffffc020502e:	85ca                	mv	a1,s2
ffffffffc0205030:	63bc                	ld	a5,64(a5)
ffffffffc0205032:	9782                	jalr	a5
ffffffffc0205034:	89aa                	mv	s3,a0
ffffffffc0205036:	e909                	bnez	a0,ffffffffc0205048 <file_getdirentry+0x9a>
ffffffffc0205038:	609c                	ld	a5,0(s1)
ffffffffc020503a:	01093683          	ld	a3,16(s2)
ffffffffc020503e:	01893703          	ld	a4,24(s2)
ffffffffc0205042:	97b6                	add	a5,a5,a3
ffffffffc0205044:	8f99                	sub	a5,a5,a4
ffffffffc0205046:	e09c                	sd	a5,0(s1)
ffffffffc0205048:	8522                	mv	a0,s0
ffffffffc020504a:	fb8ff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc020504e:	60a6                	ld	ra,72(sp)
ffffffffc0205050:	6406                	ld	s0,64(sp)
ffffffffc0205052:	74e2                	ld	s1,56(sp)
ffffffffc0205054:	7942                	ld	s2,48(sp)
ffffffffc0205056:	854e                	mv	a0,s3
ffffffffc0205058:	79a2                	ld	s3,40(sp)
ffffffffc020505a:	6161                	addi	sp,sp,80
ffffffffc020505c:	8082                	ret
ffffffffc020505e:	60a6                	ld	ra,72(sp)
ffffffffc0205060:	6406                	ld	s0,64(sp)
ffffffffc0205062:	59f5                	li	s3,-3
ffffffffc0205064:	74e2                	ld	s1,56(sp)
ffffffffc0205066:	7942                	ld	s2,48(sp)
ffffffffc0205068:	854e                	mv	a0,s3
ffffffffc020506a:	79a2                	ld	s3,40(sp)
ffffffffc020506c:	6161                	addi	sp,sp,80
ffffffffc020506e:	8082                	ret
ffffffffc0205070:	00008697          	auipc	a3,0x8
ffffffffc0205074:	20868693          	addi	a3,a3,520 # ffffffffc020d278 <default_pmm_manager+0xe98>
ffffffffc0205078:	00007617          	auipc	a2,0x7
ffffffffc020507c:	88060613          	addi	a2,a2,-1920 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0205080:	14a00593          	li	a1,330
ffffffffc0205084:	00008517          	auipc	a0,0x8
ffffffffc0205088:	f0450513          	addi	a0,a0,-252 # ffffffffc020cf88 <default_pmm_manager+0xba8>
ffffffffc020508c:	c12fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205090:	e40ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0205094 <file_dup>:
ffffffffc0205094:	04700713          	li	a4,71
ffffffffc0205098:	06a76463          	bltu	a4,a0,ffffffffc0205100 <file_dup+0x6c>
ffffffffc020509c:	00092717          	auipc	a4,0x92
ffffffffc02050a0:	82473703          	ld	a4,-2012(a4) # ffffffffc02968c0 <current>
ffffffffc02050a4:	14873703          	ld	a4,328(a4)
ffffffffc02050a8:	1101                	addi	sp,sp,-32
ffffffffc02050aa:	ec06                	sd	ra,24(sp)
ffffffffc02050ac:	e822                	sd	s0,16(sp)
ffffffffc02050ae:	cb39                	beqz	a4,ffffffffc0205104 <file_dup+0x70>
ffffffffc02050b0:	4b14                	lw	a3,16(a4)
ffffffffc02050b2:	04d05963          	blez	a3,ffffffffc0205104 <file_dup+0x70>
ffffffffc02050b6:	6700                	ld	s0,8(a4)
ffffffffc02050b8:	00351713          	slli	a4,a0,0x3
ffffffffc02050bc:	8f09                	sub	a4,a4,a0
ffffffffc02050be:	070e                	slli	a4,a4,0x3
ffffffffc02050c0:	943a                	add	s0,s0,a4
ffffffffc02050c2:	4014                	lw	a3,0(s0)
ffffffffc02050c4:	4709                	li	a4,2
ffffffffc02050c6:	02e69863          	bne	a3,a4,ffffffffc02050f6 <file_dup+0x62>
ffffffffc02050ca:	4c18                	lw	a4,24(s0)
ffffffffc02050cc:	02a71563          	bne	a4,a0,ffffffffc02050f6 <file_dup+0x62>
ffffffffc02050d0:	852e                	mv	a0,a1
ffffffffc02050d2:	002c                	addi	a1,sp,8
ffffffffc02050d4:	e1eff0ef          	jal	ra,ffffffffc02046f2 <fd_array_alloc>
ffffffffc02050d8:	c509                	beqz	a0,ffffffffc02050e2 <file_dup+0x4e>
ffffffffc02050da:	60e2                	ld	ra,24(sp)
ffffffffc02050dc:	6442                	ld	s0,16(sp)
ffffffffc02050de:	6105                	addi	sp,sp,32
ffffffffc02050e0:	8082                	ret
ffffffffc02050e2:	6522                	ld	a0,8(sp)
ffffffffc02050e4:	85a2                	mv	a1,s0
ffffffffc02050e6:	845ff0ef          	jal	ra,ffffffffc020492a <fd_array_dup>
ffffffffc02050ea:	67a2                	ld	a5,8(sp)
ffffffffc02050ec:	60e2                	ld	ra,24(sp)
ffffffffc02050ee:	6442                	ld	s0,16(sp)
ffffffffc02050f0:	4f88                	lw	a0,24(a5)
ffffffffc02050f2:	6105                	addi	sp,sp,32
ffffffffc02050f4:	8082                	ret
ffffffffc02050f6:	60e2                	ld	ra,24(sp)
ffffffffc02050f8:	6442                	ld	s0,16(sp)
ffffffffc02050fa:	5575                	li	a0,-3
ffffffffc02050fc:	6105                	addi	sp,sp,32
ffffffffc02050fe:	8082                	ret
ffffffffc0205100:	5575                	li	a0,-3
ffffffffc0205102:	8082                	ret
ffffffffc0205104:	dccff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0205108 <fs_init>:
ffffffffc0205108:	1141                	addi	sp,sp,-16
ffffffffc020510a:	e406                	sd	ra,8(sp)
ffffffffc020510c:	0f5020ef          	jal	ra,ffffffffc0207a00 <vfs_init>
ffffffffc0205110:	5cc030ef          	jal	ra,ffffffffc02086dc <dev_init>
ffffffffc0205114:	60a2                	ld	ra,8(sp)
ffffffffc0205116:	0141                	addi	sp,sp,16
ffffffffc0205118:	71d0306f          	j	ffffffffc0209034 <sfs_init>

ffffffffc020511c <fs_cleanup>:
ffffffffc020511c:	3370206f          	j	ffffffffc0207c52 <vfs_cleanup>

ffffffffc0205120 <lock_files>:
ffffffffc0205120:	0561                	addi	a0,a0,24
ffffffffc0205122:	ba0ff06f          	j	ffffffffc02044c2 <down>

ffffffffc0205126 <unlock_files>:
ffffffffc0205126:	0561                	addi	a0,a0,24
ffffffffc0205128:	b96ff06f          	j	ffffffffc02044be <up>

ffffffffc020512c <files_create>:
ffffffffc020512c:	1141                	addi	sp,sp,-16
ffffffffc020512e:	6505                	lui	a0,0x1
ffffffffc0205130:	e022                	sd	s0,0(sp)
ffffffffc0205132:	e406                	sd	ra,8(sp)
ffffffffc0205134:	e5bfc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205138:	842a                	mv	s0,a0
ffffffffc020513a:	cd19                	beqz	a0,ffffffffc0205158 <files_create+0x2c>
ffffffffc020513c:	03050793          	addi	a5,a0,48 # 1030 <_binary_bin_swap_img_size-0x6cd0>
ffffffffc0205140:	00043023          	sd	zero,0(s0)
ffffffffc0205144:	0561                	addi	a0,a0,24
ffffffffc0205146:	e41c                	sd	a5,8(s0)
ffffffffc0205148:	00042823          	sw	zero,16(s0)
ffffffffc020514c:	4585                	li	a1,1
ffffffffc020514e:	b6aff0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc0205152:	6408                	ld	a0,8(s0)
ffffffffc0205154:	f3cff0ef          	jal	ra,ffffffffc0204890 <fd_array_init>
ffffffffc0205158:	60a2                	ld	ra,8(sp)
ffffffffc020515a:	8522                	mv	a0,s0
ffffffffc020515c:	6402                	ld	s0,0(sp)
ffffffffc020515e:	0141                	addi	sp,sp,16
ffffffffc0205160:	8082                	ret

ffffffffc0205162 <files_destroy>:
ffffffffc0205162:	7179                	addi	sp,sp,-48
ffffffffc0205164:	f406                	sd	ra,40(sp)
ffffffffc0205166:	f022                	sd	s0,32(sp)
ffffffffc0205168:	ec26                	sd	s1,24(sp)
ffffffffc020516a:	e84a                	sd	s2,16(sp)
ffffffffc020516c:	e44e                	sd	s3,8(sp)
ffffffffc020516e:	c52d                	beqz	a0,ffffffffc02051d8 <files_destroy+0x76>
ffffffffc0205170:	491c                	lw	a5,16(a0)
ffffffffc0205172:	89aa                	mv	s3,a0
ffffffffc0205174:	e3b5                	bnez	a5,ffffffffc02051d8 <files_destroy+0x76>
ffffffffc0205176:	6108                	ld	a0,0(a0)
ffffffffc0205178:	c119                	beqz	a0,ffffffffc020517e <files_destroy+0x1c>
ffffffffc020517a:	71e020ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc020517e:	0089b403          	ld	s0,8(s3)
ffffffffc0205182:	6485                	lui	s1,0x1
ffffffffc0205184:	fc048493          	addi	s1,s1,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205188:	94a2                	add	s1,s1,s0
ffffffffc020518a:	4909                	li	s2,2
ffffffffc020518c:	401c                	lw	a5,0(s0)
ffffffffc020518e:	03278063          	beq	a5,s2,ffffffffc02051ae <files_destroy+0x4c>
ffffffffc0205192:	e39d                	bnez	a5,ffffffffc02051b8 <files_destroy+0x56>
ffffffffc0205194:	03840413          	addi	s0,s0,56
ffffffffc0205198:	fe849ae3          	bne	s1,s0,ffffffffc020518c <files_destroy+0x2a>
ffffffffc020519c:	7402                	ld	s0,32(sp)
ffffffffc020519e:	70a2                	ld	ra,40(sp)
ffffffffc02051a0:	64e2                	ld	s1,24(sp)
ffffffffc02051a2:	6942                	ld	s2,16(sp)
ffffffffc02051a4:	854e                	mv	a0,s3
ffffffffc02051a6:	69a2                	ld	s3,8(sp)
ffffffffc02051a8:	6145                	addi	sp,sp,48
ffffffffc02051aa:	e95fc06f          	j	ffffffffc020203e <kfree>
ffffffffc02051ae:	8522                	mv	a0,s0
ffffffffc02051b0:	efcff0ef          	jal	ra,ffffffffc02048ac <fd_array_close>
ffffffffc02051b4:	401c                	lw	a5,0(s0)
ffffffffc02051b6:	bff1                	j	ffffffffc0205192 <files_destroy+0x30>
ffffffffc02051b8:	00008697          	auipc	a3,0x8
ffffffffc02051bc:	19868693          	addi	a3,a3,408 # ffffffffc020d350 <CSWTCH.79+0x58>
ffffffffc02051c0:	00006617          	auipc	a2,0x6
ffffffffc02051c4:	73860613          	addi	a2,a2,1848 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02051c8:	03d00593          	li	a1,61
ffffffffc02051cc:	00008517          	auipc	a0,0x8
ffffffffc02051d0:	17450513          	addi	a0,a0,372 # ffffffffc020d340 <CSWTCH.79+0x48>
ffffffffc02051d4:	acafb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02051d8:	00008697          	auipc	a3,0x8
ffffffffc02051dc:	13868693          	addi	a3,a3,312 # ffffffffc020d310 <CSWTCH.79+0x18>
ffffffffc02051e0:	00006617          	auipc	a2,0x6
ffffffffc02051e4:	71860613          	addi	a2,a2,1816 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02051e8:	03300593          	li	a1,51
ffffffffc02051ec:	00008517          	auipc	a0,0x8
ffffffffc02051f0:	15450513          	addi	a0,a0,340 # ffffffffc020d340 <CSWTCH.79+0x48>
ffffffffc02051f4:	aaafb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02051f8 <files_closeall>:
ffffffffc02051f8:	1101                	addi	sp,sp,-32
ffffffffc02051fa:	ec06                	sd	ra,24(sp)
ffffffffc02051fc:	e822                	sd	s0,16(sp)
ffffffffc02051fe:	e426                	sd	s1,8(sp)
ffffffffc0205200:	e04a                	sd	s2,0(sp)
ffffffffc0205202:	c129                	beqz	a0,ffffffffc0205244 <files_closeall+0x4c>
ffffffffc0205204:	491c                	lw	a5,16(a0)
ffffffffc0205206:	02f05f63          	blez	a5,ffffffffc0205244 <files_closeall+0x4c>
ffffffffc020520a:	6504                	ld	s1,8(a0)
ffffffffc020520c:	6785                	lui	a5,0x1
ffffffffc020520e:	fc078793          	addi	a5,a5,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205212:	07048413          	addi	s0,s1,112
ffffffffc0205216:	4909                	li	s2,2
ffffffffc0205218:	94be                	add	s1,s1,a5
ffffffffc020521a:	a029                	j	ffffffffc0205224 <files_closeall+0x2c>
ffffffffc020521c:	03840413          	addi	s0,s0,56
ffffffffc0205220:	00848c63          	beq	s1,s0,ffffffffc0205238 <files_closeall+0x40>
ffffffffc0205224:	401c                	lw	a5,0(s0)
ffffffffc0205226:	ff279be3          	bne	a5,s2,ffffffffc020521c <files_closeall+0x24>
ffffffffc020522a:	8522                	mv	a0,s0
ffffffffc020522c:	03840413          	addi	s0,s0,56
ffffffffc0205230:	e7cff0ef          	jal	ra,ffffffffc02048ac <fd_array_close>
ffffffffc0205234:	fe8498e3          	bne	s1,s0,ffffffffc0205224 <files_closeall+0x2c>
ffffffffc0205238:	60e2                	ld	ra,24(sp)
ffffffffc020523a:	6442                	ld	s0,16(sp)
ffffffffc020523c:	64a2                	ld	s1,8(sp)
ffffffffc020523e:	6902                	ld	s2,0(sp)
ffffffffc0205240:	6105                	addi	sp,sp,32
ffffffffc0205242:	8082                	ret
ffffffffc0205244:	00008697          	auipc	a3,0x8
ffffffffc0205248:	d1468693          	addi	a3,a3,-748 # ffffffffc020cf58 <default_pmm_manager+0xb78>
ffffffffc020524c:	00006617          	auipc	a2,0x6
ffffffffc0205250:	6ac60613          	addi	a2,a2,1708 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0205254:	04500593          	li	a1,69
ffffffffc0205258:	00008517          	auipc	a0,0x8
ffffffffc020525c:	0e850513          	addi	a0,a0,232 # ffffffffc020d340 <CSWTCH.79+0x48>
ffffffffc0205260:	a3efb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205264 <dup_files>:
ffffffffc0205264:	7179                	addi	sp,sp,-48
ffffffffc0205266:	f406                	sd	ra,40(sp)
ffffffffc0205268:	f022                	sd	s0,32(sp)
ffffffffc020526a:	ec26                	sd	s1,24(sp)
ffffffffc020526c:	e84a                	sd	s2,16(sp)
ffffffffc020526e:	e44e                	sd	s3,8(sp)
ffffffffc0205270:	e052                	sd	s4,0(sp)
ffffffffc0205272:	c52d                	beqz	a0,ffffffffc02052dc <dup_files+0x78>
ffffffffc0205274:	842e                	mv	s0,a1
ffffffffc0205276:	c1bd                	beqz	a1,ffffffffc02052dc <dup_files+0x78>
ffffffffc0205278:	491c                	lw	a5,16(a0)
ffffffffc020527a:	84aa                	mv	s1,a0
ffffffffc020527c:	e3c1                	bnez	a5,ffffffffc02052fc <dup_files+0x98>
ffffffffc020527e:	499c                	lw	a5,16(a1)
ffffffffc0205280:	06f05e63          	blez	a5,ffffffffc02052fc <dup_files+0x98>
ffffffffc0205284:	6188                	ld	a0,0(a1)
ffffffffc0205286:	e088                	sd	a0,0(s1)
ffffffffc0205288:	c119                	beqz	a0,ffffffffc020528e <dup_files+0x2a>
ffffffffc020528a:	540020ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc020528e:	6400                	ld	s0,8(s0)
ffffffffc0205290:	6905                	lui	s2,0x1
ffffffffc0205292:	fc090913          	addi	s2,s2,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205296:	6484                	ld	s1,8(s1)
ffffffffc0205298:	9922                	add	s2,s2,s0
ffffffffc020529a:	4989                	li	s3,2
ffffffffc020529c:	4a05                	li	s4,1
ffffffffc020529e:	a039                	j	ffffffffc02052ac <dup_files+0x48>
ffffffffc02052a0:	03840413          	addi	s0,s0,56
ffffffffc02052a4:	03848493          	addi	s1,s1,56
ffffffffc02052a8:	02890163          	beq	s2,s0,ffffffffc02052ca <dup_files+0x66>
ffffffffc02052ac:	401c                	lw	a5,0(s0)
ffffffffc02052ae:	ff3799e3          	bne	a5,s3,ffffffffc02052a0 <dup_files+0x3c>
ffffffffc02052b2:	0144a023          	sw	s4,0(s1)
ffffffffc02052b6:	85a2                	mv	a1,s0
ffffffffc02052b8:	8526                	mv	a0,s1
ffffffffc02052ba:	03840413          	addi	s0,s0,56
ffffffffc02052be:	e6cff0ef          	jal	ra,ffffffffc020492a <fd_array_dup>
ffffffffc02052c2:	03848493          	addi	s1,s1,56
ffffffffc02052c6:	fe8913e3          	bne	s2,s0,ffffffffc02052ac <dup_files+0x48>
ffffffffc02052ca:	70a2                	ld	ra,40(sp)
ffffffffc02052cc:	7402                	ld	s0,32(sp)
ffffffffc02052ce:	64e2                	ld	s1,24(sp)
ffffffffc02052d0:	6942                	ld	s2,16(sp)
ffffffffc02052d2:	69a2                	ld	s3,8(sp)
ffffffffc02052d4:	6a02                	ld	s4,0(sp)
ffffffffc02052d6:	4501                	li	a0,0
ffffffffc02052d8:	6145                	addi	sp,sp,48
ffffffffc02052da:	8082                	ret
ffffffffc02052dc:	00008697          	auipc	a3,0x8
ffffffffc02052e0:	9cc68693          	addi	a3,a3,-1588 # ffffffffc020cca8 <default_pmm_manager+0x8c8>
ffffffffc02052e4:	00006617          	auipc	a2,0x6
ffffffffc02052e8:	61460613          	addi	a2,a2,1556 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02052ec:	05300593          	li	a1,83
ffffffffc02052f0:	00008517          	auipc	a0,0x8
ffffffffc02052f4:	05050513          	addi	a0,a0,80 # ffffffffc020d340 <CSWTCH.79+0x48>
ffffffffc02052f8:	9a6fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02052fc:	00008697          	auipc	a3,0x8
ffffffffc0205300:	06c68693          	addi	a3,a3,108 # ffffffffc020d368 <CSWTCH.79+0x70>
ffffffffc0205304:	00006617          	auipc	a2,0x6
ffffffffc0205308:	5f460613          	addi	a2,a2,1524 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020530c:	05400593          	li	a1,84
ffffffffc0205310:	00008517          	auipc	a0,0x8
ffffffffc0205314:	03050513          	addi	a0,a0,48 # ffffffffc020d340 <CSWTCH.79+0x48>
ffffffffc0205318:	986fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020531c <iobuf_skip.part.0>:
ffffffffc020531c:	1141                	addi	sp,sp,-16
ffffffffc020531e:	00008697          	auipc	a3,0x8
ffffffffc0205322:	07a68693          	addi	a3,a3,122 # ffffffffc020d398 <CSWTCH.79+0xa0>
ffffffffc0205326:	00006617          	auipc	a2,0x6
ffffffffc020532a:	5d260613          	addi	a2,a2,1490 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020532e:	04a00593          	li	a1,74
ffffffffc0205332:	00008517          	auipc	a0,0x8
ffffffffc0205336:	07e50513          	addi	a0,a0,126 # ffffffffc020d3b0 <CSWTCH.79+0xb8>
ffffffffc020533a:	e406                	sd	ra,8(sp)
ffffffffc020533c:	962fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205340 <iobuf_init>:
ffffffffc0205340:	e10c                	sd	a1,0(a0)
ffffffffc0205342:	e514                	sd	a3,8(a0)
ffffffffc0205344:	ed10                	sd	a2,24(a0)
ffffffffc0205346:	e910                	sd	a2,16(a0)
ffffffffc0205348:	8082                	ret

ffffffffc020534a <iobuf_move>:
ffffffffc020534a:	7179                	addi	sp,sp,-48
ffffffffc020534c:	ec26                	sd	s1,24(sp)
ffffffffc020534e:	6d04                	ld	s1,24(a0)
ffffffffc0205350:	f022                	sd	s0,32(sp)
ffffffffc0205352:	e84a                	sd	s2,16(sp)
ffffffffc0205354:	e44e                	sd	s3,8(sp)
ffffffffc0205356:	f406                	sd	ra,40(sp)
ffffffffc0205358:	842a                	mv	s0,a0
ffffffffc020535a:	8932                	mv	s2,a2
ffffffffc020535c:	852e                	mv	a0,a1
ffffffffc020535e:	89ba                	mv	s3,a4
ffffffffc0205360:	00967363          	bgeu	a2,s1,ffffffffc0205366 <iobuf_move+0x1c>
ffffffffc0205364:	84b2                	mv	s1,a2
ffffffffc0205366:	c495                	beqz	s1,ffffffffc0205392 <iobuf_move+0x48>
ffffffffc0205368:	600c                	ld	a1,0(s0)
ffffffffc020536a:	c681                	beqz	a3,ffffffffc0205372 <iobuf_move+0x28>
ffffffffc020536c:	87ae                	mv	a5,a1
ffffffffc020536e:	85aa                	mv	a1,a0
ffffffffc0205370:	853e                	mv	a0,a5
ffffffffc0205372:	8626                	mv	a2,s1
ffffffffc0205374:	0b4060ef          	jal	ra,ffffffffc020b428 <memmove>
ffffffffc0205378:	6c1c                	ld	a5,24(s0)
ffffffffc020537a:	0297ea63          	bltu	a5,s1,ffffffffc02053ae <iobuf_move+0x64>
ffffffffc020537e:	6014                	ld	a3,0(s0)
ffffffffc0205380:	6418                	ld	a4,8(s0)
ffffffffc0205382:	8f85                	sub	a5,a5,s1
ffffffffc0205384:	96a6                	add	a3,a3,s1
ffffffffc0205386:	9726                	add	a4,a4,s1
ffffffffc0205388:	e014                	sd	a3,0(s0)
ffffffffc020538a:	e418                	sd	a4,8(s0)
ffffffffc020538c:	ec1c                	sd	a5,24(s0)
ffffffffc020538e:	40990933          	sub	s2,s2,s1
ffffffffc0205392:	00098463          	beqz	s3,ffffffffc020539a <iobuf_move+0x50>
ffffffffc0205396:	0099b023          	sd	s1,0(s3)
ffffffffc020539a:	4501                	li	a0,0
ffffffffc020539c:	00091b63          	bnez	s2,ffffffffc02053b2 <iobuf_move+0x68>
ffffffffc02053a0:	70a2                	ld	ra,40(sp)
ffffffffc02053a2:	7402                	ld	s0,32(sp)
ffffffffc02053a4:	64e2                	ld	s1,24(sp)
ffffffffc02053a6:	6942                	ld	s2,16(sp)
ffffffffc02053a8:	69a2                	ld	s3,8(sp)
ffffffffc02053aa:	6145                	addi	sp,sp,48
ffffffffc02053ac:	8082                	ret
ffffffffc02053ae:	f6fff0ef          	jal	ra,ffffffffc020531c <iobuf_skip.part.0>
ffffffffc02053b2:	5571                	li	a0,-4
ffffffffc02053b4:	b7f5                	j	ffffffffc02053a0 <iobuf_move+0x56>

ffffffffc02053b6 <iobuf_skip>:
ffffffffc02053b6:	6d1c                	ld	a5,24(a0)
ffffffffc02053b8:	00b7eb63          	bltu	a5,a1,ffffffffc02053ce <iobuf_skip+0x18>
ffffffffc02053bc:	6114                	ld	a3,0(a0)
ffffffffc02053be:	6518                	ld	a4,8(a0)
ffffffffc02053c0:	8f8d                	sub	a5,a5,a1
ffffffffc02053c2:	96ae                	add	a3,a3,a1
ffffffffc02053c4:	95ba                	add	a1,a1,a4
ffffffffc02053c6:	e114                	sd	a3,0(a0)
ffffffffc02053c8:	e50c                	sd	a1,8(a0)
ffffffffc02053ca:	ed1c                	sd	a5,24(a0)
ffffffffc02053cc:	8082                	ret
ffffffffc02053ce:	1141                	addi	sp,sp,-16
ffffffffc02053d0:	e406                	sd	ra,8(sp)
ffffffffc02053d2:	f4bff0ef          	jal	ra,ffffffffc020531c <iobuf_skip.part.0>

ffffffffc02053d6 <copy_path>:
ffffffffc02053d6:	7139                	addi	sp,sp,-64
ffffffffc02053d8:	f04a                	sd	s2,32(sp)
ffffffffc02053da:	00091917          	auipc	s2,0x91
ffffffffc02053de:	4e690913          	addi	s2,s2,1254 # ffffffffc02968c0 <current>
ffffffffc02053e2:	00093703          	ld	a4,0(s2)
ffffffffc02053e6:	ec4e                	sd	s3,24(sp)
ffffffffc02053e8:	89aa                	mv	s3,a0
ffffffffc02053ea:	6505                	lui	a0,0x1
ffffffffc02053ec:	f426                	sd	s1,40(sp)
ffffffffc02053ee:	e852                	sd	s4,16(sp)
ffffffffc02053f0:	fc06                	sd	ra,56(sp)
ffffffffc02053f2:	f822                	sd	s0,48(sp)
ffffffffc02053f4:	e456                	sd	s5,8(sp)
ffffffffc02053f6:	02873a03          	ld	s4,40(a4)
ffffffffc02053fa:	84ae                	mv	s1,a1
ffffffffc02053fc:	b93fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205400:	c141                	beqz	a0,ffffffffc0205480 <copy_path+0xaa>
ffffffffc0205402:	842a                	mv	s0,a0
ffffffffc0205404:	040a0563          	beqz	s4,ffffffffc020544e <copy_path+0x78>
ffffffffc0205408:	038a0a93          	addi	s5,s4,56
ffffffffc020540c:	8556                	mv	a0,s5
ffffffffc020540e:	8b4ff0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205412:	00093783          	ld	a5,0(s2)
ffffffffc0205416:	cba1                	beqz	a5,ffffffffc0205466 <copy_path+0x90>
ffffffffc0205418:	43dc                	lw	a5,4(a5)
ffffffffc020541a:	6685                	lui	a3,0x1
ffffffffc020541c:	8626                	mv	a2,s1
ffffffffc020541e:	04fa2823          	sw	a5,80(s4)
ffffffffc0205422:	85a2                	mv	a1,s0
ffffffffc0205424:	8552                	mv	a0,s4
ffffffffc0205426:	ec5fe0ef          	jal	ra,ffffffffc02042ea <copy_string>
ffffffffc020542a:	c529                	beqz	a0,ffffffffc0205474 <copy_path+0x9e>
ffffffffc020542c:	8556                	mv	a0,s5
ffffffffc020542e:	890ff0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205432:	040a2823          	sw	zero,80(s4)
ffffffffc0205436:	0089b023          	sd	s0,0(s3)
ffffffffc020543a:	4501                	li	a0,0
ffffffffc020543c:	70e2                	ld	ra,56(sp)
ffffffffc020543e:	7442                	ld	s0,48(sp)
ffffffffc0205440:	74a2                	ld	s1,40(sp)
ffffffffc0205442:	7902                	ld	s2,32(sp)
ffffffffc0205444:	69e2                	ld	s3,24(sp)
ffffffffc0205446:	6a42                	ld	s4,16(sp)
ffffffffc0205448:	6aa2                	ld	s5,8(sp)
ffffffffc020544a:	6121                	addi	sp,sp,64
ffffffffc020544c:	8082                	ret
ffffffffc020544e:	85aa                	mv	a1,a0
ffffffffc0205450:	6685                	lui	a3,0x1
ffffffffc0205452:	8626                	mv	a2,s1
ffffffffc0205454:	4501                	li	a0,0
ffffffffc0205456:	e95fe0ef          	jal	ra,ffffffffc02042ea <copy_string>
ffffffffc020545a:	fd71                	bnez	a0,ffffffffc0205436 <copy_path+0x60>
ffffffffc020545c:	8522                	mv	a0,s0
ffffffffc020545e:	be1fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205462:	5575                	li	a0,-3
ffffffffc0205464:	bfe1                	j	ffffffffc020543c <copy_path+0x66>
ffffffffc0205466:	6685                	lui	a3,0x1
ffffffffc0205468:	8626                	mv	a2,s1
ffffffffc020546a:	85a2                	mv	a1,s0
ffffffffc020546c:	8552                	mv	a0,s4
ffffffffc020546e:	e7dfe0ef          	jal	ra,ffffffffc02042ea <copy_string>
ffffffffc0205472:	fd4d                	bnez	a0,ffffffffc020542c <copy_path+0x56>
ffffffffc0205474:	8556                	mv	a0,s5
ffffffffc0205476:	848ff0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020547a:	040a2823          	sw	zero,80(s4)
ffffffffc020547e:	bff9                	j	ffffffffc020545c <copy_path+0x86>
ffffffffc0205480:	5571                	li	a0,-4
ffffffffc0205482:	bf6d                	j	ffffffffc020543c <copy_path+0x66>

ffffffffc0205484 <sysfile_open>:
ffffffffc0205484:	7179                	addi	sp,sp,-48
ffffffffc0205486:	872a                	mv	a4,a0
ffffffffc0205488:	ec26                	sd	s1,24(sp)
ffffffffc020548a:	0028                	addi	a0,sp,8
ffffffffc020548c:	84ae                	mv	s1,a1
ffffffffc020548e:	85ba                	mv	a1,a4
ffffffffc0205490:	f022                	sd	s0,32(sp)
ffffffffc0205492:	f406                	sd	ra,40(sp)
ffffffffc0205494:	f43ff0ef          	jal	ra,ffffffffc02053d6 <copy_path>
ffffffffc0205498:	842a                	mv	s0,a0
ffffffffc020549a:	e909                	bnez	a0,ffffffffc02054ac <sysfile_open+0x28>
ffffffffc020549c:	6522                	ld	a0,8(sp)
ffffffffc020549e:	85a6                	mv	a1,s1
ffffffffc02054a0:	d60ff0ef          	jal	ra,ffffffffc0204a00 <file_open>
ffffffffc02054a4:	842a                	mv	s0,a0
ffffffffc02054a6:	6522                	ld	a0,8(sp)
ffffffffc02054a8:	b97fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02054ac:	70a2                	ld	ra,40(sp)
ffffffffc02054ae:	8522                	mv	a0,s0
ffffffffc02054b0:	7402                	ld	s0,32(sp)
ffffffffc02054b2:	64e2                	ld	s1,24(sp)
ffffffffc02054b4:	6145                	addi	sp,sp,48
ffffffffc02054b6:	8082                	ret

ffffffffc02054b8 <sysfile_close>:
ffffffffc02054b8:	e46ff06f          	j	ffffffffc0204afe <file_close>

ffffffffc02054bc <sysfile_read>:
ffffffffc02054bc:	7159                	addi	sp,sp,-112
ffffffffc02054be:	f0a2                	sd	s0,96(sp)
ffffffffc02054c0:	f486                	sd	ra,104(sp)
ffffffffc02054c2:	eca6                	sd	s1,88(sp)
ffffffffc02054c4:	e8ca                	sd	s2,80(sp)
ffffffffc02054c6:	e4ce                	sd	s3,72(sp)
ffffffffc02054c8:	e0d2                	sd	s4,64(sp)
ffffffffc02054ca:	fc56                	sd	s5,56(sp)
ffffffffc02054cc:	f85a                	sd	s6,48(sp)
ffffffffc02054ce:	f45e                	sd	s7,40(sp)
ffffffffc02054d0:	f062                	sd	s8,32(sp)
ffffffffc02054d2:	ec66                	sd	s9,24(sp)
ffffffffc02054d4:	4401                	li	s0,0
ffffffffc02054d6:	ee19                	bnez	a2,ffffffffc02054f4 <sysfile_read+0x38>
ffffffffc02054d8:	70a6                	ld	ra,104(sp)
ffffffffc02054da:	8522                	mv	a0,s0
ffffffffc02054dc:	7406                	ld	s0,96(sp)
ffffffffc02054de:	64e6                	ld	s1,88(sp)
ffffffffc02054e0:	6946                	ld	s2,80(sp)
ffffffffc02054e2:	69a6                	ld	s3,72(sp)
ffffffffc02054e4:	6a06                	ld	s4,64(sp)
ffffffffc02054e6:	7ae2                	ld	s5,56(sp)
ffffffffc02054e8:	7b42                	ld	s6,48(sp)
ffffffffc02054ea:	7ba2                	ld	s7,40(sp)
ffffffffc02054ec:	7c02                	ld	s8,32(sp)
ffffffffc02054ee:	6ce2                	ld	s9,24(sp)
ffffffffc02054f0:	6165                	addi	sp,sp,112
ffffffffc02054f2:	8082                	ret
ffffffffc02054f4:	00091c97          	auipc	s9,0x91
ffffffffc02054f8:	3ccc8c93          	addi	s9,s9,972 # ffffffffc02968c0 <current>
ffffffffc02054fc:	000cb783          	ld	a5,0(s9)
ffffffffc0205500:	84b2                	mv	s1,a2
ffffffffc0205502:	8b2e                	mv	s6,a1
ffffffffc0205504:	4601                	li	a2,0
ffffffffc0205506:	4585                	li	a1,1
ffffffffc0205508:	0287b903          	ld	s2,40(a5)
ffffffffc020550c:	8aaa                	mv	s5,a0
ffffffffc020550e:	c9eff0ef          	jal	ra,ffffffffc02049ac <file_testfd>
ffffffffc0205512:	c959                	beqz	a0,ffffffffc02055a8 <sysfile_read+0xec>
ffffffffc0205514:	6505                	lui	a0,0x1
ffffffffc0205516:	a79fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020551a:	89aa                	mv	s3,a0
ffffffffc020551c:	c941                	beqz	a0,ffffffffc02055ac <sysfile_read+0xf0>
ffffffffc020551e:	4b81                	li	s7,0
ffffffffc0205520:	6a05                	lui	s4,0x1
ffffffffc0205522:	03890c13          	addi	s8,s2,56
ffffffffc0205526:	0744ec63          	bltu	s1,s4,ffffffffc020559e <sysfile_read+0xe2>
ffffffffc020552a:	e452                	sd	s4,8(sp)
ffffffffc020552c:	6605                	lui	a2,0x1
ffffffffc020552e:	0034                	addi	a3,sp,8
ffffffffc0205530:	85ce                	mv	a1,s3
ffffffffc0205532:	8556                	mv	a0,s5
ffffffffc0205534:	e20ff0ef          	jal	ra,ffffffffc0204b54 <file_read>
ffffffffc0205538:	66a2                	ld	a3,8(sp)
ffffffffc020553a:	842a                	mv	s0,a0
ffffffffc020553c:	ca9d                	beqz	a3,ffffffffc0205572 <sysfile_read+0xb6>
ffffffffc020553e:	00090c63          	beqz	s2,ffffffffc0205556 <sysfile_read+0x9a>
ffffffffc0205542:	8562                	mv	a0,s8
ffffffffc0205544:	f7ffe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205548:	000cb783          	ld	a5,0(s9)
ffffffffc020554c:	cfa1                	beqz	a5,ffffffffc02055a4 <sysfile_read+0xe8>
ffffffffc020554e:	43dc                	lw	a5,4(a5)
ffffffffc0205550:	66a2                	ld	a3,8(sp)
ffffffffc0205552:	04f92823          	sw	a5,80(s2)
ffffffffc0205556:	864e                	mv	a2,s3
ffffffffc0205558:	85da                	mv	a1,s6
ffffffffc020555a:	854a                	mv	a0,s2
ffffffffc020555c:	d5dfe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc0205560:	c50d                	beqz	a0,ffffffffc020558a <sysfile_read+0xce>
ffffffffc0205562:	67a2                	ld	a5,8(sp)
ffffffffc0205564:	04f4e663          	bltu	s1,a5,ffffffffc02055b0 <sysfile_read+0xf4>
ffffffffc0205568:	9b3e                	add	s6,s6,a5
ffffffffc020556a:	8c9d                	sub	s1,s1,a5
ffffffffc020556c:	9bbe                	add	s7,s7,a5
ffffffffc020556e:	02091263          	bnez	s2,ffffffffc0205592 <sysfile_read+0xd6>
ffffffffc0205572:	e401                	bnez	s0,ffffffffc020557a <sysfile_read+0xbe>
ffffffffc0205574:	67a2                	ld	a5,8(sp)
ffffffffc0205576:	c391                	beqz	a5,ffffffffc020557a <sysfile_read+0xbe>
ffffffffc0205578:	f4dd                	bnez	s1,ffffffffc0205526 <sysfile_read+0x6a>
ffffffffc020557a:	854e                	mv	a0,s3
ffffffffc020557c:	ac3fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205580:	f40b8ce3          	beqz	s7,ffffffffc02054d8 <sysfile_read+0x1c>
ffffffffc0205584:	000b841b          	sext.w	s0,s7
ffffffffc0205588:	bf81                	j	ffffffffc02054d8 <sysfile_read+0x1c>
ffffffffc020558a:	e011                	bnez	s0,ffffffffc020558e <sysfile_read+0xd2>
ffffffffc020558c:	5475                	li	s0,-3
ffffffffc020558e:	fe0906e3          	beqz	s2,ffffffffc020557a <sysfile_read+0xbe>
ffffffffc0205592:	8562                	mv	a0,s8
ffffffffc0205594:	f2bfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205598:	04092823          	sw	zero,80(s2)
ffffffffc020559c:	bfd9                	j	ffffffffc0205572 <sysfile_read+0xb6>
ffffffffc020559e:	e426                	sd	s1,8(sp)
ffffffffc02055a0:	8626                	mv	a2,s1
ffffffffc02055a2:	b771                	j	ffffffffc020552e <sysfile_read+0x72>
ffffffffc02055a4:	66a2                	ld	a3,8(sp)
ffffffffc02055a6:	bf45                	j	ffffffffc0205556 <sysfile_read+0x9a>
ffffffffc02055a8:	5475                	li	s0,-3
ffffffffc02055aa:	b73d                	j	ffffffffc02054d8 <sysfile_read+0x1c>
ffffffffc02055ac:	5471                	li	s0,-4
ffffffffc02055ae:	b72d                	j	ffffffffc02054d8 <sysfile_read+0x1c>
ffffffffc02055b0:	00008697          	auipc	a3,0x8
ffffffffc02055b4:	e1068693          	addi	a3,a3,-496 # ffffffffc020d3c0 <CSWTCH.79+0xc8>
ffffffffc02055b8:	00006617          	auipc	a2,0x6
ffffffffc02055bc:	34060613          	addi	a2,a2,832 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02055c0:	05500593          	li	a1,85
ffffffffc02055c4:	00008517          	auipc	a0,0x8
ffffffffc02055c8:	e0c50513          	addi	a0,a0,-500 # ffffffffc020d3d0 <CSWTCH.79+0xd8>
ffffffffc02055cc:	ed3fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02055d0 <sysfile_write>:
ffffffffc02055d0:	7159                	addi	sp,sp,-112
ffffffffc02055d2:	e8ca                	sd	s2,80(sp)
ffffffffc02055d4:	f486                	sd	ra,104(sp)
ffffffffc02055d6:	f0a2                	sd	s0,96(sp)
ffffffffc02055d8:	eca6                	sd	s1,88(sp)
ffffffffc02055da:	e4ce                	sd	s3,72(sp)
ffffffffc02055dc:	e0d2                	sd	s4,64(sp)
ffffffffc02055de:	fc56                	sd	s5,56(sp)
ffffffffc02055e0:	f85a                	sd	s6,48(sp)
ffffffffc02055e2:	f45e                	sd	s7,40(sp)
ffffffffc02055e4:	f062                	sd	s8,32(sp)
ffffffffc02055e6:	ec66                	sd	s9,24(sp)
ffffffffc02055e8:	4901                	li	s2,0
ffffffffc02055ea:	ee19                	bnez	a2,ffffffffc0205608 <sysfile_write+0x38>
ffffffffc02055ec:	70a6                	ld	ra,104(sp)
ffffffffc02055ee:	7406                	ld	s0,96(sp)
ffffffffc02055f0:	64e6                	ld	s1,88(sp)
ffffffffc02055f2:	69a6                	ld	s3,72(sp)
ffffffffc02055f4:	6a06                	ld	s4,64(sp)
ffffffffc02055f6:	7ae2                	ld	s5,56(sp)
ffffffffc02055f8:	7b42                	ld	s6,48(sp)
ffffffffc02055fa:	7ba2                	ld	s7,40(sp)
ffffffffc02055fc:	7c02                	ld	s8,32(sp)
ffffffffc02055fe:	6ce2                	ld	s9,24(sp)
ffffffffc0205600:	854a                	mv	a0,s2
ffffffffc0205602:	6946                	ld	s2,80(sp)
ffffffffc0205604:	6165                	addi	sp,sp,112
ffffffffc0205606:	8082                	ret
ffffffffc0205608:	00091c17          	auipc	s8,0x91
ffffffffc020560c:	2b8c0c13          	addi	s8,s8,696 # ffffffffc02968c0 <current>
ffffffffc0205610:	000c3783          	ld	a5,0(s8)
ffffffffc0205614:	8432                	mv	s0,a2
ffffffffc0205616:	89ae                	mv	s3,a1
ffffffffc0205618:	4605                	li	a2,1
ffffffffc020561a:	4581                	li	a1,0
ffffffffc020561c:	7784                	ld	s1,40(a5)
ffffffffc020561e:	8baa                	mv	s7,a0
ffffffffc0205620:	b8cff0ef          	jal	ra,ffffffffc02049ac <file_testfd>
ffffffffc0205624:	cd59                	beqz	a0,ffffffffc02056c2 <sysfile_write+0xf2>
ffffffffc0205626:	6505                	lui	a0,0x1
ffffffffc0205628:	967fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020562c:	8a2a                	mv	s4,a0
ffffffffc020562e:	cd41                	beqz	a0,ffffffffc02056c6 <sysfile_write+0xf6>
ffffffffc0205630:	4c81                	li	s9,0
ffffffffc0205632:	6a85                	lui	s5,0x1
ffffffffc0205634:	03848b13          	addi	s6,s1,56
ffffffffc0205638:	05546a63          	bltu	s0,s5,ffffffffc020568c <sysfile_write+0xbc>
ffffffffc020563c:	e456                	sd	s5,8(sp)
ffffffffc020563e:	c8a9                	beqz	s1,ffffffffc0205690 <sysfile_write+0xc0>
ffffffffc0205640:	855a                	mv	a0,s6
ffffffffc0205642:	e81fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205646:	000c3783          	ld	a5,0(s8)
ffffffffc020564a:	c399                	beqz	a5,ffffffffc0205650 <sysfile_write+0x80>
ffffffffc020564c:	43dc                	lw	a5,4(a5)
ffffffffc020564e:	c8bc                	sw	a5,80(s1)
ffffffffc0205650:	66a2                	ld	a3,8(sp)
ffffffffc0205652:	4701                	li	a4,0
ffffffffc0205654:	864e                	mv	a2,s3
ffffffffc0205656:	85d2                	mv	a1,s4
ffffffffc0205658:	8526                	mv	a0,s1
ffffffffc020565a:	c2bfe0ef          	jal	ra,ffffffffc0204284 <copy_from_user>
ffffffffc020565e:	c139                	beqz	a0,ffffffffc02056a4 <sysfile_write+0xd4>
ffffffffc0205660:	855a                	mv	a0,s6
ffffffffc0205662:	e5dfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205666:	0404a823          	sw	zero,80(s1)
ffffffffc020566a:	6622                	ld	a2,8(sp)
ffffffffc020566c:	0034                	addi	a3,sp,8
ffffffffc020566e:	85d2                	mv	a1,s4
ffffffffc0205670:	855e                	mv	a0,s7
ffffffffc0205672:	dc8ff0ef          	jal	ra,ffffffffc0204c3a <file_write>
ffffffffc0205676:	67a2                	ld	a5,8(sp)
ffffffffc0205678:	892a                	mv	s2,a0
ffffffffc020567a:	ef85                	bnez	a5,ffffffffc02056b2 <sysfile_write+0xe2>
ffffffffc020567c:	8552                	mv	a0,s4
ffffffffc020567e:	9c1fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205682:	f60c85e3          	beqz	s9,ffffffffc02055ec <sysfile_write+0x1c>
ffffffffc0205686:	000c891b          	sext.w	s2,s9
ffffffffc020568a:	b78d                	j	ffffffffc02055ec <sysfile_write+0x1c>
ffffffffc020568c:	e422                	sd	s0,8(sp)
ffffffffc020568e:	f8cd                	bnez	s1,ffffffffc0205640 <sysfile_write+0x70>
ffffffffc0205690:	66a2                	ld	a3,8(sp)
ffffffffc0205692:	4701                	li	a4,0
ffffffffc0205694:	864e                	mv	a2,s3
ffffffffc0205696:	85d2                	mv	a1,s4
ffffffffc0205698:	4501                	li	a0,0
ffffffffc020569a:	bebfe0ef          	jal	ra,ffffffffc0204284 <copy_from_user>
ffffffffc020569e:	f571                	bnez	a0,ffffffffc020566a <sysfile_write+0x9a>
ffffffffc02056a0:	5975                	li	s2,-3
ffffffffc02056a2:	bfe9                	j	ffffffffc020567c <sysfile_write+0xac>
ffffffffc02056a4:	855a                	mv	a0,s6
ffffffffc02056a6:	e19fe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc02056aa:	5975                	li	s2,-3
ffffffffc02056ac:	0404a823          	sw	zero,80(s1)
ffffffffc02056b0:	b7f1                	j	ffffffffc020567c <sysfile_write+0xac>
ffffffffc02056b2:	00f46c63          	bltu	s0,a5,ffffffffc02056ca <sysfile_write+0xfa>
ffffffffc02056b6:	99be                	add	s3,s3,a5
ffffffffc02056b8:	8c1d                	sub	s0,s0,a5
ffffffffc02056ba:	9cbe                	add	s9,s9,a5
ffffffffc02056bc:	f161                	bnez	a0,ffffffffc020567c <sysfile_write+0xac>
ffffffffc02056be:	fc2d                	bnez	s0,ffffffffc0205638 <sysfile_write+0x68>
ffffffffc02056c0:	bf75                	j	ffffffffc020567c <sysfile_write+0xac>
ffffffffc02056c2:	5975                	li	s2,-3
ffffffffc02056c4:	b725                	j	ffffffffc02055ec <sysfile_write+0x1c>
ffffffffc02056c6:	5971                	li	s2,-4
ffffffffc02056c8:	b715                	j	ffffffffc02055ec <sysfile_write+0x1c>
ffffffffc02056ca:	00008697          	auipc	a3,0x8
ffffffffc02056ce:	cf668693          	addi	a3,a3,-778 # ffffffffc020d3c0 <CSWTCH.79+0xc8>
ffffffffc02056d2:	00006617          	auipc	a2,0x6
ffffffffc02056d6:	22660613          	addi	a2,a2,550 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02056da:	08a00593          	li	a1,138
ffffffffc02056de:	00008517          	auipc	a0,0x8
ffffffffc02056e2:	cf250513          	addi	a0,a0,-782 # ffffffffc020d3d0 <CSWTCH.79+0xd8>
ffffffffc02056e6:	db9fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02056ea <sysfile_seek>:
ffffffffc02056ea:	e36ff06f          	j	ffffffffc0204d20 <file_seek>

ffffffffc02056ee <sysfile_fstat>:
ffffffffc02056ee:	715d                	addi	sp,sp,-80
ffffffffc02056f0:	f44e                	sd	s3,40(sp)
ffffffffc02056f2:	00091997          	auipc	s3,0x91
ffffffffc02056f6:	1ce98993          	addi	s3,s3,462 # ffffffffc02968c0 <current>
ffffffffc02056fa:	0009b703          	ld	a4,0(s3)
ffffffffc02056fe:	fc26                	sd	s1,56(sp)
ffffffffc0205700:	84ae                	mv	s1,a1
ffffffffc0205702:	858a                	mv	a1,sp
ffffffffc0205704:	e0a2                	sd	s0,64(sp)
ffffffffc0205706:	f84a                	sd	s2,48(sp)
ffffffffc0205708:	e486                	sd	ra,72(sp)
ffffffffc020570a:	02873903          	ld	s2,40(a4)
ffffffffc020570e:	f052                	sd	s4,32(sp)
ffffffffc0205710:	f30ff0ef          	jal	ra,ffffffffc0204e40 <file_fstat>
ffffffffc0205714:	842a                	mv	s0,a0
ffffffffc0205716:	e91d                	bnez	a0,ffffffffc020574c <sysfile_fstat+0x5e>
ffffffffc0205718:	04090363          	beqz	s2,ffffffffc020575e <sysfile_fstat+0x70>
ffffffffc020571c:	03890a13          	addi	s4,s2,56
ffffffffc0205720:	8552                	mv	a0,s4
ffffffffc0205722:	da1fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205726:	0009b783          	ld	a5,0(s3)
ffffffffc020572a:	c3b9                	beqz	a5,ffffffffc0205770 <sysfile_fstat+0x82>
ffffffffc020572c:	43dc                	lw	a5,4(a5)
ffffffffc020572e:	02000693          	li	a3,32
ffffffffc0205732:	860a                	mv	a2,sp
ffffffffc0205734:	04f92823          	sw	a5,80(s2)
ffffffffc0205738:	85a6                	mv	a1,s1
ffffffffc020573a:	854a                	mv	a0,s2
ffffffffc020573c:	b7dfe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc0205740:	c121                	beqz	a0,ffffffffc0205780 <sysfile_fstat+0x92>
ffffffffc0205742:	8552                	mv	a0,s4
ffffffffc0205744:	d7bfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205748:	04092823          	sw	zero,80(s2)
ffffffffc020574c:	60a6                	ld	ra,72(sp)
ffffffffc020574e:	8522                	mv	a0,s0
ffffffffc0205750:	6406                	ld	s0,64(sp)
ffffffffc0205752:	74e2                	ld	s1,56(sp)
ffffffffc0205754:	7942                	ld	s2,48(sp)
ffffffffc0205756:	79a2                	ld	s3,40(sp)
ffffffffc0205758:	7a02                	ld	s4,32(sp)
ffffffffc020575a:	6161                	addi	sp,sp,80
ffffffffc020575c:	8082                	ret
ffffffffc020575e:	02000693          	li	a3,32
ffffffffc0205762:	860a                	mv	a2,sp
ffffffffc0205764:	85a6                	mv	a1,s1
ffffffffc0205766:	b53fe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc020576a:	f16d                	bnez	a0,ffffffffc020574c <sysfile_fstat+0x5e>
ffffffffc020576c:	5475                	li	s0,-3
ffffffffc020576e:	bff9                	j	ffffffffc020574c <sysfile_fstat+0x5e>
ffffffffc0205770:	02000693          	li	a3,32
ffffffffc0205774:	860a                	mv	a2,sp
ffffffffc0205776:	85a6                	mv	a1,s1
ffffffffc0205778:	854a                	mv	a0,s2
ffffffffc020577a:	b3ffe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc020577e:	f171                	bnez	a0,ffffffffc0205742 <sysfile_fstat+0x54>
ffffffffc0205780:	8552                	mv	a0,s4
ffffffffc0205782:	d3dfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205786:	5475                	li	s0,-3
ffffffffc0205788:	04092823          	sw	zero,80(s2)
ffffffffc020578c:	b7c1                	j	ffffffffc020574c <sysfile_fstat+0x5e>

ffffffffc020578e <sysfile_fsync>:
ffffffffc020578e:	f72ff06f          	j	ffffffffc0204f00 <file_fsync>

ffffffffc0205792 <sysfile_getcwd>:
ffffffffc0205792:	715d                	addi	sp,sp,-80
ffffffffc0205794:	f44e                	sd	s3,40(sp)
ffffffffc0205796:	00091997          	auipc	s3,0x91
ffffffffc020579a:	12a98993          	addi	s3,s3,298 # ffffffffc02968c0 <current>
ffffffffc020579e:	0009b783          	ld	a5,0(s3)
ffffffffc02057a2:	f84a                	sd	s2,48(sp)
ffffffffc02057a4:	e486                	sd	ra,72(sp)
ffffffffc02057a6:	e0a2                	sd	s0,64(sp)
ffffffffc02057a8:	fc26                	sd	s1,56(sp)
ffffffffc02057aa:	f052                	sd	s4,32(sp)
ffffffffc02057ac:	0287b903          	ld	s2,40(a5)
ffffffffc02057b0:	cda9                	beqz	a1,ffffffffc020580a <sysfile_getcwd+0x78>
ffffffffc02057b2:	842e                	mv	s0,a1
ffffffffc02057b4:	84aa                	mv	s1,a0
ffffffffc02057b6:	04090363          	beqz	s2,ffffffffc02057fc <sysfile_getcwd+0x6a>
ffffffffc02057ba:	03890a13          	addi	s4,s2,56
ffffffffc02057be:	8552                	mv	a0,s4
ffffffffc02057c0:	d03fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc02057c4:	0009b783          	ld	a5,0(s3)
ffffffffc02057c8:	c781                	beqz	a5,ffffffffc02057d0 <sysfile_getcwd+0x3e>
ffffffffc02057ca:	43dc                	lw	a5,4(a5)
ffffffffc02057cc:	04f92823          	sw	a5,80(s2)
ffffffffc02057d0:	4685                	li	a3,1
ffffffffc02057d2:	8622                	mv	a2,s0
ffffffffc02057d4:	85a6                	mv	a1,s1
ffffffffc02057d6:	854a                	mv	a0,s2
ffffffffc02057d8:	a19fe0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc02057dc:	e90d                	bnez	a0,ffffffffc020580e <sysfile_getcwd+0x7c>
ffffffffc02057de:	5475                	li	s0,-3
ffffffffc02057e0:	8552                	mv	a0,s4
ffffffffc02057e2:	cddfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc02057e6:	04092823          	sw	zero,80(s2)
ffffffffc02057ea:	60a6                	ld	ra,72(sp)
ffffffffc02057ec:	8522                	mv	a0,s0
ffffffffc02057ee:	6406                	ld	s0,64(sp)
ffffffffc02057f0:	74e2                	ld	s1,56(sp)
ffffffffc02057f2:	7942                	ld	s2,48(sp)
ffffffffc02057f4:	79a2                	ld	s3,40(sp)
ffffffffc02057f6:	7a02                	ld	s4,32(sp)
ffffffffc02057f8:	6161                	addi	sp,sp,80
ffffffffc02057fa:	8082                	ret
ffffffffc02057fc:	862e                	mv	a2,a1
ffffffffc02057fe:	4685                	li	a3,1
ffffffffc0205800:	85aa                	mv	a1,a0
ffffffffc0205802:	4501                	li	a0,0
ffffffffc0205804:	9edfe0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc0205808:	ed09                	bnez	a0,ffffffffc0205822 <sysfile_getcwd+0x90>
ffffffffc020580a:	5475                	li	s0,-3
ffffffffc020580c:	bff9                	j	ffffffffc02057ea <sysfile_getcwd+0x58>
ffffffffc020580e:	8622                	mv	a2,s0
ffffffffc0205810:	4681                	li	a3,0
ffffffffc0205812:	85a6                	mv	a1,s1
ffffffffc0205814:	850a                	mv	a0,sp
ffffffffc0205816:	b2bff0ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc020581a:	36f020ef          	jal	ra,ffffffffc0208388 <vfs_getcwd>
ffffffffc020581e:	842a                	mv	s0,a0
ffffffffc0205820:	b7c1                	j	ffffffffc02057e0 <sysfile_getcwd+0x4e>
ffffffffc0205822:	8622                	mv	a2,s0
ffffffffc0205824:	4681                	li	a3,0
ffffffffc0205826:	85a6                	mv	a1,s1
ffffffffc0205828:	850a                	mv	a0,sp
ffffffffc020582a:	b17ff0ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc020582e:	35b020ef          	jal	ra,ffffffffc0208388 <vfs_getcwd>
ffffffffc0205832:	842a                	mv	s0,a0
ffffffffc0205834:	bf5d                	j	ffffffffc02057ea <sysfile_getcwd+0x58>

ffffffffc0205836 <sysfile_getdirentry>:
ffffffffc0205836:	7139                	addi	sp,sp,-64
ffffffffc0205838:	e852                	sd	s4,16(sp)
ffffffffc020583a:	00091a17          	auipc	s4,0x91
ffffffffc020583e:	086a0a13          	addi	s4,s4,134 # ffffffffc02968c0 <current>
ffffffffc0205842:	000a3703          	ld	a4,0(s4)
ffffffffc0205846:	ec4e                	sd	s3,24(sp)
ffffffffc0205848:	89aa                	mv	s3,a0
ffffffffc020584a:	10800513          	li	a0,264
ffffffffc020584e:	f426                	sd	s1,40(sp)
ffffffffc0205850:	f04a                	sd	s2,32(sp)
ffffffffc0205852:	fc06                	sd	ra,56(sp)
ffffffffc0205854:	f822                	sd	s0,48(sp)
ffffffffc0205856:	e456                	sd	s5,8(sp)
ffffffffc0205858:	7704                	ld	s1,40(a4)
ffffffffc020585a:	892e                	mv	s2,a1
ffffffffc020585c:	f32fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205860:	c169                	beqz	a0,ffffffffc0205922 <sysfile_getdirentry+0xec>
ffffffffc0205862:	842a                	mv	s0,a0
ffffffffc0205864:	c8c1                	beqz	s1,ffffffffc02058f4 <sysfile_getdirentry+0xbe>
ffffffffc0205866:	03848a93          	addi	s5,s1,56
ffffffffc020586a:	8556                	mv	a0,s5
ffffffffc020586c:	c57fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205870:	000a3783          	ld	a5,0(s4)
ffffffffc0205874:	c399                	beqz	a5,ffffffffc020587a <sysfile_getdirentry+0x44>
ffffffffc0205876:	43dc                	lw	a5,4(a5)
ffffffffc0205878:	c8bc                	sw	a5,80(s1)
ffffffffc020587a:	4705                	li	a4,1
ffffffffc020587c:	46a1                	li	a3,8
ffffffffc020587e:	864a                	mv	a2,s2
ffffffffc0205880:	85a2                	mv	a1,s0
ffffffffc0205882:	8526                	mv	a0,s1
ffffffffc0205884:	a01fe0ef          	jal	ra,ffffffffc0204284 <copy_from_user>
ffffffffc0205888:	e505                	bnez	a0,ffffffffc02058b0 <sysfile_getdirentry+0x7a>
ffffffffc020588a:	8556                	mv	a0,s5
ffffffffc020588c:	c33fe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205890:	59f5                	li	s3,-3
ffffffffc0205892:	0404a823          	sw	zero,80(s1)
ffffffffc0205896:	8522                	mv	a0,s0
ffffffffc0205898:	fa6fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020589c:	70e2                	ld	ra,56(sp)
ffffffffc020589e:	7442                	ld	s0,48(sp)
ffffffffc02058a0:	74a2                	ld	s1,40(sp)
ffffffffc02058a2:	7902                	ld	s2,32(sp)
ffffffffc02058a4:	6a42                	ld	s4,16(sp)
ffffffffc02058a6:	6aa2                	ld	s5,8(sp)
ffffffffc02058a8:	854e                	mv	a0,s3
ffffffffc02058aa:	69e2                	ld	s3,24(sp)
ffffffffc02058ac:	6121                	addi	sp,sp,64
ffffffffc02058ae:	8082                	ret
ffffffffc02058b0:	8556                	mv	a0,s5
ffffffffc02058b2:	c0dfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc02058b6:	854e                	mv	a0,s3
ffffffffc02058b8:	85a2                	mv	a1,s0
ffffffffc02058ba:	0404a823          	sw	zero,80(s1)
ffffffffc02058be:	ef0ff0ef          	jal	ra,ffffffffc0204fae <file_getdirentry>
ffffffffc02058c2:	89aa                	mv	s3,a0
ffffffffc02058c4:	f969                	bnez	a0,ffffffffc0205896 <sysfile_getdirentry+0x60>
ffffffffc02058c6:	8556                	mv	a0,s5
ffffffffc02058c8:	bfbfe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc02058cc:	000a3783          	ld	a5,0(s4)
ffffffffc02058d0:	c399                	beqz	a5,ffffffffc02058d6 <sysfile_getdirentry+0xa0>
ffffffffc02058d2:	43dc                	lw	a5,4(a5)
ffffffffc02058d4:	c8bc                	sw	a5,80(s1)
ffffffffc02058d6:	10800693          	li	a3,264
ffffffffc02058da:	8622                	mv	a2,s0
ffffffffc02058dc:	85ca                	mv	a1,s2
ffffffffc02058de:	8526                	mv	a0,s1
ffffffffc02058e0:	9d9fe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc02058e4:	e111                	bnez	a0,ffffffffc02058e8 <sysfile_getdirentry+0xb2>
ffffffffc02058e6:	59f5                	li	s3,-3
ffffffffc02058e8:	8556                	mv	a0,s5
ffffffffc02058ea:	bd5fe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc02058ee:	0404a823          	sw	zero,80(s1)
ffffffffc02058f2:	b755                	j	ffffffffc0205896 <sysfile_getdirentry+0x60>
ffffffffc02058f4:	85aa                	mv	a1,a0
ffffffffc02058f6:	4705                	li	a4,1
ffffffffc02058f8:	46a1                	li	a3,8
ffffffffc02058fa:	864a                	mv	a2,s2
ffffffffc02058fc:	4501                	li	a0,0
ffffffffc02058fe:	987fe0ef          	jal	ra,ffffffffc0204284 <copy_from_user>
ffffffffc0205902:	cd11                	beqz	a0,ffffffffc020591e <sysfile_getdirentry+0xe8>
ffffffffc0205904:	854e                	mv	a0,s3
ffffffffc0205906:	85a2                	mv	a1,s0
ffffffffc0205908:	ea6ff0ef          	jal	ra,ffffffffc0204fae <file_getdirentry>
ffffffffc020590c:	89aa                	mv	s3,a0
ffffffffc020590e:	f541                	bnez	a0,ffffffffc0205896 <sysfile_getdirentry+0x60>
ffffffffc0205910:	10800693          	li	a3,264
ffffffffc0205914:	8622                	mv	a2,s0
ffffffffc0205916:	85ca                	mv	a1,s2
ffffffffc0205918:	9a1fe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc020591c:	fd2d                	bnez	a0,ffffffffc0205896 <sysfile_getdirentry+0x60>
ffffffffc020591e:	59f5                	li	s3,-3
ffffffffc0205920:	bf9d                	j	ffffffffc0205896 <sysfile_getdirentry+0x60>
ffffffffc0205922:	59f1                	li	s3,-4
ffffffffc0205924:	bfa5                	j	ffffffffc020589c <sysfile_getdirentry+0x66>

ffffffffc0205926 <sysfile_dup>:
ffffffffc0205926:	f6eff06f          	j	ffffffffc0205094 <file_dup>

ffffffffc020592a <kernel_thread_entry>:
ffffffffc020592a:	8526                	mv	a0,s1
ffffffffc020592c:	9402                	jalr	s0
ffffffffc020592e:	686000ef          	jal	ra,ffffffffc0205fb4 <do_exit>

ffffffffc0205932 <alloc_proc>:
ffffffffc0205932:	1141                	addi	sp,sp,-16
ffffffffc0205934:	15000513          	li	a0,336
ffffffffc0205938:	e022                	sd	s0,0(sp)
ffffffffc020593a:	e406                	sd	ra,8(sp)
ffffffffc020593c:	e52fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205940:	842a                	mv	s0,a0
ffffffffc0205942:	c141                	beqz	a0,ffffffffc02059c2 <alloc_proc+0x90>
ffffffffc0205944:	57fd                	li	a5,-1
ffffffffc0205946:	1782                	slli	a5,a5,0x20
ffffffffc0205948:	e11c                	sd	a5,0(a0)
ffffffffc020594a:	07000613          	li	a2,112
ffffffffc020594e:	4581                	li	a1,0
ffffffffc0205950:	00052423          	sw	zero,8(a0)
ffffffffc0205954:	00053823          	sd	zero,16(a0)
ffffffffc0205958:	00053c23          	sd	zero,24(a0)
ffffffffc020595c:	02053023          	sd	zero,32(a0)
ffffffffc0205960:	02053423          	sd	zero,40(a0)
ffffffffc0205964:	03050513          	addi	a0,a0,48
ffffffffc0205968:	2af050ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc020596c:	00091797          	auipc	a5,0x91
ffffffffc0205970:	f247b783          	ld	a5,-220(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0205974:	f45c                	sd	a5,168(s0)
ffffffffc0205976:	0a043023          	sd	zero,160(s0)
ffffffffc020597a:	0a042823          	sw	zero,176(s0)
ffffffffc020597e:	463d                	li	a2,15
ffffffffc0205980:	4581                	li	a1,0
ffffffffc0205982:	0b440513          	addi	a0,s0,180
ffffffffc0205986:	291050ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc020598a:	11040793          	addi	a5,s0,272
ffffffffc020598e:	0e042623          	sw	zero,236(s0)
ffffffffc0205992:	0e043c23          	sd	zero,248(s0)
ffffffffc0205996:	10043023          	sd	zero,256(s0)
ffffffffc020599a:	0e043823          	sd	zero,240(s0)
ffffffffc020599e:	10043423          	sd	zero,264(s0)
ffffffffc02059a2:	10f43c23          	sd	a5,280(s0)
ffffffffc02059a6:	10f43823          	sd	a5,272(s0)
ffffffffc02059aa:	12042023          	sw	zero,288(s0)
ffffffffc02059ae:	12043423          	sd	zero,296(s0)
ffffffffc02059b2:	12043823          	sd	zero,304(s0)
ffffffffc02059b6:	12043c23          	sd	zero,312(s0)
ffffffffc02059ba:	14043023          	sd	zero,320(s0)
ffffffffc02059be:	14043423          	sd	zero,328(s0)
ffffffffc02059c2:	60a2                	ld	ra,8(sp)
ffffffffc02059c4:	8522                	mv	a0,s0
ffffffffc02059c6:	6402                	ld	s0,0(sp)
ffffffffc02059c8:	0141                	addi	sp,sp,16
ffffffffc02059ca:	8082                	ret

ffffffffc02059cc <forkret>:
ffffffffc02059cc:	00091797          	auipc	a5,0x91
ffffffffc02059d0:	ef47b783          	ld	a5,-268(a5) # ffffffffc02968c0 <current>
ffffffffc02059d4:	73c8                	ld	a0,160(a5)
ffffffffc02059d6:	8d5fb06f          	j	ffffffffc02012aa <forkrets>

ffffffffc02059da <put_pgdir.isra.0>:
ffffffffc02059da:	1141                	addi	sp,sp,-16
ffffffffc02059dc:	e406                	sd	ra,8(sp)
ffffffffc02059de:	c02007b7          	lui	a5,0xc0200
ffffffffc02059e2:	02f56e63          	bltu	a0,a5,ffffffffc0205a1e <put_pgdir.isra.0+0x44>
ffffffffc02059e6:	00091697          	auipc	a3,0x91
ffffffffc02059ea:	ed26b683          	ld	a3,-302(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02059ee:	8d15                	sub	a0,a0,a3
ffffffffc02059f0:	8131                	srli	a0,a0,0xc
ffffffffc02059f2:	00091797          	auipc	a5,0x91
ffffffffc02059f6:	eae7b783          	ld	a5,-338(a5) # ffffffffc02968a0 <npage>
ffffffffc02059fa:	02f57f63          	bgeu	a0,a5,ffffffffc0205a38 <put_pgdir.isra.0+0x5e>
ffffffffc02059fe:	0000a697          	auipc	a3,0xa
ffffffffc0205a02:	d5a6b683          	ld	a3,-678(a3) # ffffffffc020f758 <nbase>
ffffffffc0205a06:	60a2                	ld	ra,8(sp)
ffffffffc0205a08:	8d15                	sub	a0,a0,a3
ffffffffc0205a0a:	00091797          	auipc	a5,0x91
ffffffffc0205a0e:	e9e7b783          	ld	a5,-354(a5) # ffffffffc02968a8 <pages>
ffffffffc0205a12:	051a                	slli	a0,a0,0x6
ffffffffc0205a14:	4585                	li	a1,1
ffffffffc0205a16:	953e                	add	a0,a0,a5
ffffffffc0205a18:	0141                	addi	sp,sp,16
ffffffffc0205a1a:	f90fc06f          	j	ffffffffc02021aa <free_pages>
ffffffffc0205a1e:	86aa                	mv	a3,a0
ffffffffc0205a20:	00007617          	auipc	a2,0x7
ffffffffc0205a24:	aa060613          	addi	a2,a2,-1376 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc0205a28:	07700593          	li	a1,119
ffffffffc0205a2c:	00007517          	auipc	a0,0x7
ffffffffc0205a30:	a1450513          	addi	a0,a0,-1516 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0205a34:	a6bfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205a38:	00007617          	auipc	a2,0x7
ffffffffc0205a3c:	ab060613          	addi	a2,a2,-1360 # ffffffffc020c4e8 <default_pmm_manager+0x108>
ffffffffc0205a40:	06900593          	li	a1,105
ffffffffc0205a44:	00007517          	auipc	a0,0x7
ffffffffc0205a48:	9fc50513          	addi	a0,a0,-1540 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0205a4c:	a53fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205a50 <setup_pgdir>:
ffffffffc0205a50:	1101                	addi	sp,sp,-32
ffffffffc0205a52:	e426                	sd	s1,8(sp)
ffffffffc0205a54:	84aa                	mv	s1,a0
ffffffffc0205a56:	4505                	li	a0,1
ffffffffc0205a58:	ec06                	sd	ra,24(sp)
ffffffffc0205a5a:	e822                	sd	s0,16(sp)
ffffffffc0205a5c:	f10fc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205a60:	c939                	beqz	a0,ffffffffc0205ab6 <setup_pgdir+0x66>
ffffffffc0205a62:	00091697          	auipc	a3,0x91
ffffffffc0205a66:	e466b683          	ld	a3,-442(a3) # ffffffffc02968a8 <pages>
ffffffffc0205a6a:	40d506b3          	sub	a3,a0,a3
ffffffffc0205a6e:	8699                	srai	a3,a3,0x6
ffffffffc0205a70:	0000a417          	auipc	s0,0xa
ffffffffc0205a74:	ce843403          	ld	s0,-792(s0) # ffffffffc020f758 <nbase>
ffffffffc0205a78:	96a2                	add	a3,a3,s0
ffffffffc0205a7a:	00c69793          	slli	a5,a3,0xc
ffffffffc0205a7e:	83b1                	srli	a5,a5,0xc
ffffffffc0205a80:	00091717          	auipc	a4,0x91
ffffffffc0205a84:	e2073703          	ld	a4,-480(a4) # ffffffffc02968a0 <npage>
ffffffffc0205a88:	06b2                	slli	a3,a3,0xc
ffffffffc0205a8a:	02e7f863          	bgeu	a5,a4,ffffffffc0205aba <setup_pgdir+0x6a>
ffffffffc0205a8e:	00091417          	auipc	s0,0x91
ffffffffc0205a92:	e2a43403          	ld	s0,-470(s0) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205a96:	9436                	add	s0,s0,a3
ffffffffc0205a98:	6605                	lui	a2,0x1
ffffffffc0205a9a:	00091597          	auipc	a1,0x91
ffffffffc0205a9e:	dfe5b583          	ld	a1,-514(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0205aa2:	8522                	mv	a0,s0
ffffffffc0205aa4:	1c5050ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc0205aa8:	4501                	li	a0,0
ffffffffc0205aaa:	ec80                	sd	s0,24(s1)
ffffffffc0205aac:	60e2                	ld	ra,24(sp)
ffffffffc0205aae:	6442                	ld	s0,16(sp)
ffffffffc0205ab0:	64a2                	ld	s1,8(sp)
ffffffffc0205ab2:	6105                	addi	sp,sp,32
ffffffffc0205ab4:	8082                	ret
ffffffffc0205ab6:	5571                	li	a0,-4
ffffffffc0205ab8:	bfd5                	j	ffffffffc0205aac <setup_pgdir+0x5c>
ffffffffc0205aba:	00007617          	auipc	a2,0x7
ffffffffc0205abe:	95e60613          	addi	a2,a2,-1698 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc0205ac2:	07100593          	li	a1,113
ffffffffc0205ac6:	00007517          	auipc	a0,0x7
ffffffffc0205aca:	97a50513          	addi	a0,a0,-1670 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0205ace:	9d1fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205ad2 <proc_run>:
ffffffffc0205ad2:	7179                	addi	sp,sp,-48
ffffffffc0205ad4:	ec4a                	sd	s2,24(sp)
ffffffffc0205ad6:	00091917          	auipc	s2,0x91
ffffffffc0205ada:	dea90913          	addi	s2,s2,-534 # ffffffffc02968c0 <current>
ffffffffc0205ade:	f026                	sd	s1,32(sp)
ffffffffc0205ae0:	00093483          	ld	s1,0(s2)
ffffffffc0205ae4:	f406                	sd	ra,40(sp)
ffffffffc0205ae6:	e84e                	sd	s3,16(sp)
ffffffffc0205ae8:	02a48a63          	beq	s1,a0,ffffffffc0205b1c <proc_run+0x4a>
ffffffffc0205aec:	100027f3          	csrr	a5,sstatus
ffffffffc0205af0:	8b89                	andi	a5,a5,2
ffffffffc0205af2:	4981                	li	s3,0
ffffffffc0205af4:	e3a9                	bnez	a5,ffffffffc0205b36 <proc_run+0x64>
ffffffffc0205af6:	755c                	ld	a5,168(a0)
ffffffffc0205af8:	577d                	li	a4,-1
ffffffffc0205afa:	177e                	slli	a4,a4,0x3f
ffffffffc0205afc:	83b1                	srli	a5,a5,0xc
ffffffffc0205afe:	00a93023          	sd	a0,0(s2)
ffffffffc0205b02:	8fd9                	or	a5,a5,a4
ffffffffc0205b04:	18079073          	csrw	satp,a5
ffffffffc0205b08:	12000073          	sfence.vma
ffffffffc0205b0c:	03050593          	addi	a1,a0,48
ffffffffc0205b10:	03048513          	addi	a0,s1,48
ffffffffc0205b14:	53e010ef          	jal	ra,ffffffffc0207052 <switch_to>
ffffffffc0205b18:	00099863          	bnez	s3,ffffffffc0205b28 <proc_run+0x56>
ffffffffc0205b1c:	70a2                	ld	ra,40(sp)
ffffffffc0205b1e:	7482                	ld	s1,32(sp)
ffffffffc0205b20:	6962                	ld	s2,24(sp)
ffffffffc0205b22:	69c2                	ld	s3,16(sp)
ffffffffc0205b24:	6145                	addi	sp,sp,48
ffffffffc0205b26:	8082                	ret
ffffffffc0205b28:	70a2                	ld	ra,40(sp)
ffffffffc0205b2a:	7482                	ld	s1,32(sp)
ffffffffc0205b2c:	6962                	ld	s2,24(sp)
ffffffffc0205b2e:	69c2                	ld	s3,16(sp)
ffffffffc0205b30:	6145                	addi	sp,sp,48
ffffffffc0205b32:	93afb06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0205b36:	e42a                	sd	a0,8(sp)
ffffffffc0205b38:	93afb0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205b3c:	6522                	ld	a0,8(sp)
ffffffffc0205b3e:	4985                	li	s3,1
ffffffffc0205b40:	bf5d                	j	ffffffffc0205af6 <proc_run+0x24>

ffffffffc0205b42 <do_fork>:
ffffffffc0205b42:	7159                	addi	sp,sp,-112
ffffffffc0205b44:	e8ca                	sd	s2,80(sp)
ffffffffc0205b46:	00091917          	auipc	s2,0x91
ffffffffc0205b4a:	d9290913          	addi	s2,s2,-622 # ffffffffc02968d8 <nr_process>
ffffffffc0205b4e:	00092783          	lw	a5,0(s2)
ffffffffc0205b52:	e4ce                	sd	s3,72(sp)
ffffffffc0205b54:	f486                	sd	ra,104(sp)
ffffffffc0205b56:	f0a2                	sd	s0,96(sp)
ffffffffc0205b58:	eca6                	sd	s1,88(sp)
ffffffffc0205b5a:	e0d2                	sd	s4,64(sp)
ffffffffc0205b5c:	fc56                	sd	s5,56(sp)
ffffffffc0205b5e:	f85a                	sd	s6,48(sp)
ffffffffc0205b60:	f45e                	sd	s7,40(sp)
ffffffffc0205b62:	f062                	sd	s8,32(sp)
ffffffffc0205b64:	ec66                	sd	s9,24(sp)
ffffffffc0205b66:	e86a                	sd	s10,16(sp)
ffffffffc0205b68:	e46e                	sd	s11,8(sp)
ffffffffc0205b6a:	6985                	lui	s3,0x1
ffffffffc0205b6c:	3337dc63          	bge	a5,s3,ffffffffc0205ea4 <do_fork+0x362>
ffffffffc0205b70:	8a2a                	mv	s4,a0
ffffffffc0205b72:	8aae                	mv	s5,a1
ffffffffc0205b74:	84b2                	mv	s1,a2
ffffffffc0205b76:	dbdff0ef          	jal	ra,ffffffffc0205932 <alloc_proc>
ffffffffc0205b7a:	842a                	mv	s0,a0
ffffffffc0205b7c:	30050d63          	beqz	a0,ffffffffc0205e96 <do_fork+0x354>
ffffffffc0205b80:	00091b17          	auipc	s6,0x91
ffffffffc0205b84:	d40b0b13          	addi	s6,s6,-704 # ffffffffc02968c0 <current>
ffffffffc0205b88:	000b3783          	ld	a5,0(s6)
ffffffffc0205b8c:	0ec7a703          	lw	a4,236(a5)
ffffffffc0205b90:	f11c                	sd	a5,32(a0)
ffffffffc0205b92:	38071d63          	bnez	a4,ffffffffc0205f2c <do_fork+0x3ea>
ffffffffc0205b96:	4509                	li	a0,2
ffffffffc0205b98:	dd4fc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205b9c:	2e050a63          	beqz	a0,ffffffffc0205e90 <do_fork+0x34e>
ffffffffc0205ba0:	00091c17          	auipc	s8,0x91
ffffffffc0205ba4:	d08c0c13          	addi	s8,s8,-760 # ffffffffc02968a8 <pages>
ffffffffc0205ba8:	000c3683          	ld	a3,0(s8)
ffffffffc0205bac:	0000ab97          	auipc	s7,0xa
ffffffffc0205bb0:	bacbbb83          	ld	s7,-1108(s7) # ffffffffc020f758 <nbase>
ffffffffc0205bb4:	00091c97          	auipc	s9,0x91
ffffffffc0205bb8:	cecc8c93          	addi	s9,s9,-788 # ffffffffc02968a0 <npage>
ffffffffc0205bbc:	40d506b3          	sub	a3,a0,a3
ffffffffc0205bc0:	8699                	srai	a3,a3,0x6
ffffffffc0205bc2:	96de                	add	a3,a3,s7
ffffffffc0205bc4:	000cb703          	ld	a4,0(s9)
ffffffffc0205bc8:	00c69793          	slli	a5,a3,0xc
ffffffffc0205bcc:	83b1                	srli	a5,a5,0xc
ffffffffc0205bce:	06b2                	slli	a3,a3,0xc
ffffffffc0205bd0:	2ce7ff63          	bgeu	a5,a4,ffffffffc0205eae <do_fork+0x36c>
ffffffffc0205bd4:	000b3703          	ld	a4,0(s6)
ffffffffc0205bd8:	00091d17          	auipc	s10,0x91
ffffffffc0205bdc:	ce0d0d13          	addi	s10,s10,-800 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205be0:	000d3783          	ld	a5,0(s10)
ffffffffc0205be4:	14873d83          	ld	s11,328(a4)
ffffffffc0205be8:	96be                	add	a3,a3,a5
ffffffffc0205bea:	e814                	sd	a3,16(s0)
ffffffffc0205bec:	2e0d8963          	beqz	s11,ffffffffc0205ede <do_fork+0x39c>
ffffffffc0205bf0:	80098993          	addi	s3,s3,-2048 # 800 <_binary_bin_swap_img_size-0x7500>
ffffffffc0205bf4:	013a79b3          	and	s3,s4,s3
ffffffffc0205bf8:	1e098063          	beqz	s3,ffffffffc0205dd8 <do_fork+0x296>
ffffffffc0205bfc:	010da783          	lw	a5,16(s11)
ffffffffc0205c00:	02873983          	ld	s3,40(a4)
ffffffffc0205c04:	2785                	addiw	a5,a5,1
ffffffffc0205c06:	00fda823          	sw	a5,16(s11)
ffffffffc0205c0a:	15b43423          	sd	s11,328(s0)
ffffffffc0205c0e:	02098763          	beqz	s3,ffffffffc0205c3c <do_fork+0xfa>
ffffffffc0205c12:	100a7a13          	andi	s4,s4,256
ffffffffc0205c16:	1c0a0d63          	beqz	s4,ffffffffc0205df0 <do_fork+0x2ae>
ffffffffc0205c1a:	0309a783          	lw	a5,48(s3)
ffffffffc0205c1e:	0189b683          	ld	a3,24(s3)
ffffffffc0205c22:	c0200737          	lui	a4,0xc0200
ffffffffc0205c26:	2785                	addiw	a5,a5,1
ffffffffc0205c28:	02f9a823          	sw	a5,48(s3)
ffffffffc0205c2c:	03343423          	sd	s3,40(s0)
ffffffffc0205c30:	30e6ee63          	bltu	a3,a4,ffffffffc0205f4c <do_fork+0x40a>
ffffffffc0205c34:	000d3783          	ld	a5,0(s10)
ffffffffc0205c38:	8e9d                	sub	a3,a3,a5
ffffffffc0205c3a:	f454                	sd	a3,168(s0)
ffffffffc0205c3c:	6818                	ld	a4,16(s0)
ffffffffc0205c3e:	6789                	lui	a5,0x2
ffffffffc0205c40:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0205c44:	973e                	add	a4,a4,a5
ffffffffc0205c46:	8626                	mv	a2,s1
ffffffffc0205c48:	f058                	sd	a4,160(s0)
ffffffffc0205c4a:	87ba                	mv	a5,a4
ffffffffc0205c4c:	12048893          	addi	a7,s1,288
ffffffffc0205c50:	00063803          	ld	a6,0(a2)
ffffffffc0205c54:	6608                	ld	a0,8(a2)
ffffffffc0205c56:	6a0c                	ld	a1,16(a2)
ffffffffc0205c58:	6e14                	ld	a3,24(a2)
ffffffffc0205c5a:	0107b023          	sd	a6,0(a5)
ffffffffc0205c5e:	e788                	sd	a0,8(a5)
ffffffffc0205c60:	eb8c                	sd	a1,16(a5)
ffffffffc0205c62:	ef94                	sd	a3,24(a5)
ffffffffc0205c64:	02060613          	addi	a2,a2,32
ffffffffc0205c68:	02078793          	addi	a5,a5,32
ffffffffc0205c6c:	ff1612e3          	bne	a2,a7,ffffffffc0205c50 <do_fork+0x10e>
ffffffffc0205c70:	04073823          	sd	zero,80(a4) # ffffffffc0200050 <kern_init+0x6>
ffffffffc0205c74:	120a8f63          	beqz	s5,ffffffffc0205db2 <do_fork+0x270>
ffffffffc0205c78:	01573823          	sd	s5,16(a4)
ffffffffc0205c7c:	00000797          	auipc	a5,0x0
ffffffffc0205c80:	d5078793          	addi	a5,a5,-688 # ffffffffc02059cc <forkret>
ffffffffc0205c84:	f81c                	sd	a5,48(s0)
ffffffffc0205c86:	fc18                	sd	a4,56(s0)
ffffffffc0205c88:	100027f3          	csrr	a5,sstatus
ffffffffc0205c8c:	8b89                	andi	a5,a5,2
ffffffffc0205c8e:	4981                	li	s3,0
ffffffffc0205c90:	14079063          	bnez	a5,ffffffffc0205dd0 <do_fork+0x28e>
ffffffffc0205c94:	0008b817          	auipc	a6,0x8b
ffffffffc0205c98:	3c480813          	addi	a6,a6,964 # ffffffffc0291058 <last_pid.1>
ffffffffc0205c9c:	00082783          	lw	a5,0(a6)
ffffffffc0205ca0:	6709                	lui	a4,0x2
ffffffffc0205ca2:	0017851b          	addiw	a0,a5,1
ffffffffc0205ca6:	00a82023          	sw	a0,0(a6)
ffffffffc0205caa:	08e55d63          	bge	a0,a4,ffffffffc0205d44 <do_fork+0x202>
ffffffffc0205cae:	0008b317          	auipc	t1,0x8b
ffffffffc0205cb2:	3ae30313          	addi	t1,t1,942 # ffffffffc029105c <next_safe.0>
ffffffffc0205cb6:	00032783          	lw	a5,0(t1)
ffffffffc0205cba:	00090497          	auipc	s1,0x90
ffffffffc0205cbe:	b0648493          	addi	s1,s1,-1274 # ffffffffc02957c0 <proc_list>
ffffffffc0205cc2:	08f55963          	bge	a0,a5,ffffffffc0205d54 <do_fork+0x212>
ffffffffc0205cc6:	c048                	sw	a0,4(s0)
ffffffffc0205cc8:	45a9                	li	a1,10
ffffffffc0205cca:	2501                	sext.w	a0,a0
ffffffffc0205ccc:	216050ef          	jal	ra,ffffffffc020aee2 <hash32>
ffffffffc0205cd0:	02051793          	slli	a5,a0,0x20
ffffffffc0205cd4:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205cd8:	0008c797          	auipc	a5,0x8c
ffffffffc0205cdc:	ae878793          	addi	a5,a5,-1304 # ffffffffc02917c0 <hash_list>
ffffffffc0205ce0:	953e                	add	a0,a0,a5
ffffffffc0205ce2:	650c                	ld	a1,8(a0)
ffffffffc0205ce4:	7014                	ld	a3,32(s0)
ffffffffc0205ce6:	0d840793          	addi	a5,s0,216
ffffffffc0205cea:	e19c                	sd	a5,0(a1)
ffffffffc0205cec:	6490                	ld	a2,8(s1)
ffffffffc0205cee:	e51c                	sd	a5,8(a0)
ffffffffc0205cf0:	7af8                	ld	a4,240(a3)
ffffffffc0205cf2:	0c840793          	addi	a5,s0,200
ffffffffc0205cf6:	f06c                	sd	a1,224(s0)
ffffffffc0205cf8:	ec68                	sd	a0,216(s0)
ffffffffc0205cfa:	e21c                	sd	a5,0(a2)
ffffffffc0205cfc:	e49c                	sd	a5,8(s1)
ffffffffc0205cfe:	e870                	sd	a2,208(s0)
ffffffffc0205d00:	e464                	sd	s1,200(s0)
ffffffffc0205d02:	0e043c23          	sd	zero,248(s0)
ffffffffc0205d06:	10e43023          	sd	a4,256(s0)
ffffffffc0205d0a:	c311                	beqz	a4,ffffffffc0205d0e <do_fork+0x1cc>
ffffffffc0205d0c:	ff60                	sd	s0,248(a4)
ffffffffc0205d0e:	00092783          	lw	a5,0(s2)
ffffffffc0205d12:	fae0                	sd	s0,240(a3)
ffffffffc0205d14:	2785                	addiw	a5,a5,1
ffffffffc0205d16:	00f92023          	sw	a5,0(s2)
ffffffffc0205d1a:	10099063          	bnez	s3,ffffffffc0205e1a <do_fork+0x2d8>
ffffffffc0205d1e:	8522                	mv	a0,s0
ffffffffc0205d20:	4d6010ef          	jal	ra,ffffffffc02071f6 <wakeup_proc>
ffffffffc0205d24:	4048                	lw	a0,4(s0)
ffffffffc0205d26:	70a6                	ld	ra,104(sp)
ffffffffc0205d28:	7406                	ld	s0,96(sp)
ffffffffc0205d2a:	64e6                	ld	s1,88(sp)
ffffffffc0205d2c:	6946                	ld	s2,80(sp)
ffffffffc0205d2e:	69a6                	ld	s3,72(sp)
ffffffffc0205d30:	6a06                	ld	s4,64(sp)
ffffffffc0205d32:	7ae2                	ld	s5,56(sp)
ffffffffc0205d34:	7b42                	ld	s6,48(sp)
ffffffffc0205d36:	7ba2                	ld	s7,40(sp)
ffffffffc0205d38:	7c02                	ld	s8,32(sp)
ffffffffc0205d3a:	6ce2                	ld	s9,24(sp)
ffffffffc0205d3c:	6d42                	ld	s10,16(sp)
ffffffffc0205d3e:	6da2                	ld	s11,8(sp)
ffffffffc0205d40:	6165                	addi	sp,sp,112
ffffffffc0205d42:	8082                	ret
ffffffffc0205d44:	4785                	li	a5,1
ffffffffc0205d46:	00f82023          	sw	a5,0(a6)
ffffffffc0205d4a:	4505                	li	a0,1
ffffffffc0205d4c:	0008b317          	auipc	t1,0x8b
ffffffffc0205d50:	31030313          	addi	t1,t1,784 # ffffffffc029105c <next_safe.0>
ffffffffc0205d54:	00090497          	auipc	s1,0x90
ffffffffc0205d58:	a6c48493          	addi	s1,s1,-1428 # ffffffffc02957c0 <proc_list>
ffffffffc0205d5c:	0084be03          	ld	t3,8(s1)
ffffffffc0205d60:	6789                	lui	a5,0x2
ffffffffc0205d62:	00f32023          	sw	a5,0(t1)
ffffffffc0205d66:	86aa                	mv	a3,a0
ffffffffc0205d68:	4581                	li	a1,0
ffffffffc0205d6a:	6e89                	lui	t4,0x2
ffffffffc0205d6c:	129e0763          	beq	t3,s1,ffffffffc0205e9a <do_fork+0x358>
ffffffffc0205d70:	88ae                	mv	a7,a1
ffffffffc0205d72:	87f2                	mv	a5,t3
ffffffffc0205d74:	6609                	lui	a2,0x2
ffffffffc0205d76:	a811                	j	ffffffffc0205d8a <do_fork+0x248>
ffffffffc0205d78:	00e6d663          	bge	a3,a4,ffffffffc0205d84 <do_fork+0x242>
ffffffffc0205d7c:	00c75463          	bge	a4,a2,ffffffffc0205d84 <do_fork+0x242>
ffffffffc0205d80:	863a                	mv	a2,a4
ffffffffc0205d82:	4885                	li	a7,1
ffffffffc0205d84:	679c                	ld	a5,8(a5)
ffffffffc0205d86:	00978d63          	beq	a5,s1,ffffffffc0205da0 <do_fork+0x25e>
ffffffffc0205d8a:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_bin_swap_img_size-0x5dc4>
ffffffffc0205d8e:	fed715e3          	bne	a4,a3,ffffffffc0205d78 <do_fork+0x236>
ffffffffc0205d92:	2685                	addiw	a3,a3,1
ffffffffc0205d94:	0ac6df63          	bge	a3,a2,ffffffffc0205e52 <do_fork+0x310>
ffffffffc0205d98:	679c                	ld	a5,8(a5)
ffffffffc0205d9a:	4585                	li	a1,1
ffffffffc0205d9c:	fe9797e3          	bne	a5,s1,ffffffffc0205d8a <do_fork+0x248>
ffffffffc0205da0:	c581                	beqz	a1,ffffffffc0205da8 <do_fork+0x266>
ffffffffc0205da2:	00d82023          	sw	a3,0(a6)
ffffffffc0205da6:	8536                	mv	a0,a3
ffffffffc0205da8:	f0088fe3          	beqz	a7,ffffffffc0205cc6 <do_fork+0x184>
ffffffffc0205dac:	00c32023          	sw	a2,0(t1)
ffffffffc0205db0:	bf19                	j	ffffffffc0205cc6 <do_fork+0x184>
ffffffffc0205db2:	8aba                	mv	s5,a4
ffffffffc0205db4:	01573823          	sd	s5,16(a4) # 2010 <_binary_bin_swap_img_size-0x5cf0>
ffffffffc0205db8:	00000797          	auipc	a5,0x0
ffffffffc0205dbc:	c1478793          	addi	a5,a5,-1004 # ffffffffc02059cc <forkret>
ffffffffc0205dc0:	f81c                	sd	a5,48(s0)
ffffffffc0205dc2:	fc18                	sd	a4,56(s0)
ffffffffc0205dc4:	100027f3          	csrr	a5,sstatus
ffffffffc0205dc8:	8b89                	andi	a5,a5,2
ffffffffc0205dca:	4981                	li	s3,0
ffffffffc0205dcc:	ec0784e3          	beqz	a5,ffffffffc0205c94 <do_fork+0x152>
ffffffffc0205dd0:	ea3fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205dd4:	4985                	li	s3,1
ffffffffc0205dd6:	bd7d                	j	ffffffffc0205c94 <do_fork+0x152>
ffffffffc0205dd8:	b54ff0ef          	jal	ra,ffffffffc020512c <files_create>
ffffffffc0205ddc:	89aa                	mv	s3,a0
ffffffffc0205dde:	c151                	beqz	a0,ffffffffc0205e62 <do_fork+0x320>
ffffffffc0205de0:	85ee                	mv	a1,s11
ffffffffc0205de2:	c82ff0ef          	jal	ra,ffffffffc0205264 <dup_files>
ffffffffc0205de6:	e93d                	bnez	a0,ffffffffc0205e5c <do_fork+0x31a>
ffffffffc0205de8:	000b3703          	ld	a4,0(s6)
ffffffffc0205dec:	8dce                	mv	s11,s3
ffffffffc0205dee:	b539                	j	ffffffffc0205bfc <do_fork+0xba>
ffffffffc0205df0:	d77fd0ef          	jal	ra,ffffffffc0203b66 <mm_create>
ffffffffc0205df4:	8a2a                	mv	s4,a0
ffffffffc0205df6:	c519                	beqz	a0,ffffffffc0205e04 <do_fork+0x2c2>
ffffffffc0205df8:	c59ff0ef          	jal	ra,ffffffffc0205a50 <setup_pgdir>
ffffffffc0205dfc:	c115                	beqz	a0,ffffffffc0205e20 <do_fork+0x2de>
ffffffffc0205dfe:	8552                	mv	a0,s4
ffffffffc0205e00:	eb5fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0205e04:	14843503          	ld	a0,328(s0)
ffffffffc0205e08:	cd29                	beqz	a0,ffffffffc0205e62 <do_fork+0x320>
ffffffffc0205e0a:	491c                	lw	a5,16(a0)
ffffffffc0205e0c:	fff7871b          	addiw	a4,a5,-1
ffffffffc0205e10:	c918                	sw	a4,16(a0)
ffffffffc0205e12:	eb21                	bnez	a4,ffffffffc0205e62 <do_fork+0x320>
ffffffffc0205e14:	b4eff0ef          	jal	ra,ffffffffc0205162 <files_destroy>
ffffffffc0205e18:	a0a9                	j	ffffffffc0205e62 <do_fork+0x320>
ffffffffc0205e1a:	e53fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0205e1e:	b701                	j	ffffffffc0205d1e <do_fork+0x1dc>
ffffffffc0205e20:	03898d93          	addi	s11,s3,56
ffffffffc0205e24:	856e                	mv	a0,s11
ffffffffc0205e26:	e9cfe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205e2a:	000b3783          	ld	a5,0(s6)
ffffffffc0205e2e:	c781                	beqz	a5,ffffffffc0205e36 <do_fork+0x2f4>
ffffffffc0205e30:	43dc                	lw	a5,4(a5)
ffffffffc0205e32:	04f9a823          	sw	a5,80(s3)
ffffffffc0205e36:	85ce                	mv	a1,s3
ffffffffc0205e38:	8552                	mv	a0,s4
ffffffffc0205e3a:	f7dfd0ef          	jal	ra,ffffffffc0203db6 <dup_mmap>
ffffffffc0205e3e:	8b2a                	mv	s6,a0
ffffffffc0205e40:	856e                	mv	a0,s11
ffffffffc0205e42:	e7cfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205e46:	0409a823          	sw	zero,80(s3)
ffffffffc0205e4a:	0a0b1a63          	bnez	s6,ffffffffc0205efe <do_fork+0x3bc>
ffffffffc0205e4e:	89d2                	mv	s3,s4
ffffffffc0205e50:	b3e9                	j	ffffffffc0205c1a <do_fork+0xd8>
ffffffffc0205e52:	01d6c363          	blt	a3,t4,ffffffffc0205e58 <do_fork+0x316>
ffffffffc0205e56:	4685                	li	a3,1
ffffffffc0205e58:	4585                	li	a1,1
ffffffffc0205e5a:	bf09                	j	ffffffffc0205d6c <do_fork+0x22a>
ffffffffc0205e5c:	854e                	mv	a0,s3
ffffffffc0205e5e:	b04ff0ef          	jal	ra,ffffffffc0205162 <files_destroy>
ffffffffc0205e62:	6814                	ld	a3,16(s0)
ffffffffc0205e64:	c02007b7          	lui	a5,0xc0200
ffffffffc0205e68:	04f6ef63          	bltu	a3,a5,ffffffffc0205ec6 <do_fork+0x384>
ffffffffc0205e6c:	000d3783          	ld	a5,0(s10)
ffffffffc0205e70:	000cb703          	ld	a4,0(s9)
ffffffffc0205e74:	40f687b3          	sub	a5,a3,a5
ffffffffc0205e78:	83b1                	srli	a5,a5,0xc
ffffffffc0205e7a:	08e7fd63          	bgeu	a5,a4,ffffffffc0205f14 <do_fork+0x3d2>
ffffffffc0205e7e:	000c3503          	ld	a0,0(s8)
ffffffffc0205e82:	417787b3          	sub	a5,a5,s7
ffffffffc0205e86:	079a                	slli	a5,a5,0x6
ffffffffc0205e88:	4589                	li	a1,2
ffffffffc0205e8a:	953e                	add	a0,a0,a5
ffffffffc0205e8c:	b1efc0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0205e90:	8522                	mv	a0,s0
ffffffffc0205e92:	9acfc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205e96:	5571                	li	a0,-4
ffffffffc0205e98:	b579                	j	ffffffffc0205d26 <do_fork+0x1e4>
ffffffffc0205e9a:	c599                	beqz	a1,ffffffffc0205ea8 <do_fork+0x366>
ffffffffc0205e9c:	00d82023          	sw	a3,0(a6)
ffffffffc0205ea0:	8536                	mv	a0,a3
ffffffffc0205ea2:	b515                	j	ffffffffc0205cc6 <do_fork+0x184>
ffffffffc0205ea4:	556d                	li	a0,-5
ffffffffc0205ea6:	b541                	j	ffffffffc0205d26 <do_fork+0x1e4>
ffffffffc0205ea8:	00082503          	lw	a0,0(a6)
ffffffffc0205eac:	bd29                	j	ffffffffc0205cc6 <do_fork+0x184>
ffffffffc0205eae:	00006617          	auipc	a2,0x6
ffffffffc0205eb2:	56a60613          	addi	a2,a2,1386 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc0205eb6:	07100593          	li	a1,113
ffffffffc0205eba:	00006517          	auipc	a0,0x6
ffffffffc0205ebe:	58650513          	addi	a0,a0,1414 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0205ec2:	ddcfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205ec6:	00006617          	auipc	a2,0x6
ffffffffc0205eca:	5fa60613          	addi	a2,a2,1530 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc0205ece:	07700593          	li	a1,119
ffffffffc0205ed2:	00006517          	auipc	a0,0x6
ffffffffc0205ed6:	56e50513          	addi	a0,a0,1390 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0205eda:	dc4fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205ede:	00007697          	auipc	a3,0x7
ffffffffc0205ee2:	54268693          	addi	a3,a3,1346 # ffffffffc020d420 <CSWTCH.79+0x128>
ffffffffc0205ee6:	00006617          	auipc	a2,0x6
ffffffffc0205eea:	a1260613          	addi	a2,a2,-1518 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0205eee:	1cc00593          	li	a1,460
ffffffffc0205ef2:	00007517          	auipc	a0,0x7
ffffffffc0205ef6:	51650513          	addi	a0,a0,1302 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0205efa:	da4fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205efe:	8552                	mv	a0,s4
ffffffffc0205f00:	f51fd0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc0205f04:	018a3503          	ld	a0,24(s4)
ffffffffc0205f08:	ad3ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc0205f0c:	8552                	mv	a0,s4
ffffffffc0205f0e:	da7fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0205f12:	bdcd                	j	ffffffffc0205e04 <do_fork+0x2c2>
ffffffffc0205f14:	00006617          	auipc	a2,0x6
ffffffffc0205f18:	5d460613          	addi	a2,a2,1492 # ffffffffc020c4e8 <default_pmm_manager+0x108>
ffffffffc0205f1c:	06900593          	li	a1,105
ffffffffc0205f20:	00006517          	auipc	a0,0x6
ffffffffc0205f24:	52050513          	addi	a0,a0,1312 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0205f28:	d76fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f2c:	00007697          	auipc	a3,0x7
ffffffffc0205f30:	4bc68693          	addi	a3,a3,1212 # ffffffffc020d3e8 <CSWTCH.79+0xf0>
ffffffffc0205f34:	00006617          	auipc	a2,0x6
ffffffffc0205f38:	9c460613          	addi	a2,a2,-1596 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0205f3c:	22e00593          	li	a1,558
ffffffffc0205f40:	00007517          	auipc	a0,0x7
ffffffffc0205f44:	4c850513          	addi	a0,a0,1224 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0205f48:	d56fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f4c:	00006617          	auipc	a2,0x6
ffffffffc0205f50:	57460613          	addi	a2,a2,1396 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc0205f54:	1ac00593          	li	a1,428
ffffffffc0205f58:	00007517          	auipc	a0,0x7
ffffffffc0205f5c:	4b050513          	addi	a0,a0,1200 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0205f60:	d3efa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205f64 <kernel_thread>:
ffffffffc0205f64:	7129                	addi	sp,sp,-320
ffffffffc0205f66:	fa22                	sd	s0,304(sp)
ffffffffc0205f68:	f626                	sd	s1,296(sp)
ffffffffc0205f6a:	f24a                	sd	s2,288(sp)
ffffffffc0205f6c:	84ae                	mv	s1,a1
ffffffffc0205f6e:	892a                	mv	s2,a0
ffffffffc0205f70:	8432                	mv	s0,a2
ffffffffc0205f72:	4581                	li	a1,0
ffffffffc0205f74:	12000613          	li	a2,288
ffffffffc0205f78:	850a                	mv	a0,sp
ffffffffc0205f7a:	fe06                	sd	ra,312(sp)
ffffffffc0205f7c:	49a050ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0205f80:	e0ca                	sd	s2,64(sp)
ffffffffc0205f82:	e4a6                	sd	s1,72(sp)
ffffffffc0205f84:	100027f3          	csrr	a5,sstatus
ffffffffc0205f88:	edd7f793          	andi	a5,a5,-291
ffffffffc0205f8c:	1207e793          	ori	a5,a5,288
ffffffffc0205f90:	e23e                	sd	a5,256(sp)
ffffffffc0205f92:	860a                	mv	a2,sp
ffffffffc0205f94:	10046513          	ori	a0,s0,256
ffffffffc0205f98:	00000797          	auipc	a5,0x0
ffffffffc0205f9c:	99278793          	addi	a5,a5,-1646 # ffffffffc020592a <kernel_thread_entry>
ffffffffc0205fa0:	4581                	li	a1,0
ffffffffc0205fa2:	e63e                	sd	a5,264(sp)
ffffffffc0205fa4:	b9fff0ef          	jal	ra,ffffffffc0205b42 <do_fork>
ffffffffc0205fa8:	70f2                	ld	ra,312(sp)
ffffffffc0205faa:	7452                	ld	s0,304(sp)
ffffffffc0205fac:	74b2                	ld	s1,296(sp)
ffffffffc0205fae:	7912                	ld	s2,288(sp)
ffffffffc0205fb0:	6131                	addi	sp,sp,320
ffffffffc0205fb2:	8082                	ret

ffffffffc0205fb4 <do_exit>:
ffffffffc0205fb4:	7179                	addi	sp,sp,-48
ffffffffc0205fb6:	f022                	sd	s0,32(sp)
ffffffffc0205fb8:	00091417          	auipc	s0,0x91
ffffffffc0205fbc:	90840413          	addi	s0,s0,-1784 # ffffffffc02968c0 <current>
ffffffffc0205fc0:	601c                	ld	a5,0(s0)
ffffffffc0205fc2:	f406                	sd	ra,40(sp)
ffffffffc0205fc4:	ec26                	sd	s1,24(sp)
ffffffffc0205fc6:	e84a                	sd	s2,16(sp)
ffffffffc0205fc8:	e44e                	sd	s3,8(sp)
ffffffffc0205fca:	e052                	sd	s4,0(sp)
ffffffffc0205fcc:	00091717          	auipc	a4,0x91
ffffffffc0205fd0:	8fc73703          	ld	a4,-1796(a4) # ffffffffc02968c8 <idleproc>
ffffffffc0205fd4:	0ee78763          	beq	a5,a4,ffffffffc02060c2 <do_exit+0x10e>
ffffffffc0205fd8:	00091497          	auipc	s1,0x91
ffffffffc0205fdc:	8f848493          	addi	s1,s1,-1800 # ffffffffc02968d0 <initproc>
ffffffffc0205fe0:	6098                	ld	a4,0(s1)
ffffffffc0205fe2:	10e78763          	beq	a5,a4,ffffffffc02060f0 <do_exit+0x13c>
ffffffffc0205fe6:	0287b983          	ld	s3,40(a5)
ffffffffc0205fea:	892a                	mv	s2,a0
ffffffffc0205fec:	02098e63          	beqz	s3,ffffffffc0206028 <do_exit+0x74>
ffffffffc0205ff0:	00091797          	auipc	a5,0x91
ffffffffc0205ff4:	8a07b783          	ld	a5,-1888(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0205ff8:	577d                	li	a4,-1
ffffffffc0205ffa:	177e                	slli	a4,a4,0x3f
ffffffffc0205ffc:	83b1                	srli	a5,a5,0xc
ffffffffc0205ffe:	8fd9                	or	a5,a5,a4
ffffffffc0206000:	18079073          	csrw	satp,a5
ffffffffc0206004:	0309a783          	lw	a5,48(s3)
ffffffffc0206008:	fff7871b          	addiw	a4,a5,-1
ffffffffc020600c:	02e9a823          	sw	a4,48(s3)
ffffffffc0206010:	c769                	beqz	a4,ffffffffc02060da <do_exit+0x126>
ffffffffc0206012:	601c                	ld	a5,0(s0)
ffffffffc0206014:	1487b503          	ld	a0,328(a5)
ffffffffc0206018:	0207b423          	sd	zero,40(a5)
ffffffffc020601c:	c511                	beqz	a0,ffffffffc0206028 <do_exit+0x74>
ffffffffc020601e:	491c                	lw	a5,16(a0)
ffffffffc0206020:	fff7871b          	addiw	a4,a5,-1
ffffffffc0206024:	c918                	sw	a4,16(a0)
ffffffffc0206026:	cb59                	beqz	a4,ffffffffc02060bc <do_exit+0x108>
ffffffffc0206028:	601c                	ld	a5,0(s0)
ffffffffc020602a:	470d                	li	a4,3
ffffffffc020602c:	c398                	sw	a4,0(a5)
ffffffffc020602e:	0f27a423          	sw	s2,232(a5)
ffffffffc0206032:	100027f3          	csrr	a5,sstatus
ffffffffc0206036:	8b89                	andi	a5,a5,2
ffffffffc0206038:	4a01                	li	s4,0
ffffffffc020603a:	e7f9                	bnez	a5,ffffffffc0206108 <do_exit+0x154>
ffffffffc020603c:	6018                	ld	a4,0(s0)
ffffffffc020603e:	800007b7          	lui	a5,0x80000
ffffffffc0206042:	0785                	addi	a5,a5,1
ffffffffc0206044:	7308                	ld	a0,32(a4)
ffffffffc0206046:	0ec52703          	lw	a4,236(a0)
ffffffffc020604a:	0cf70363          	beq	a4,a5,ffffffffc0206110 <do_exit+0x15c>
ffffffffc020604e:	6018                	ld	a4,0(s0)
ffffffffc0206050:	7b7c                	ld	a5,240(a4)
ffffffffc0206052:	c3a1                	beqz	a5,ffffffffc0206092 <do_exit+0xde>
ffffffffc0206054:	800009b7          	lui	s3,0x80000
ffffffffc0206058:	490d                	li	s2,3
ffffffffc020605a:	0985                	addi	s3,s3,1
ffffffffc020605c:	a021                	j	ffffffffc0206064 <do_exit+0xb0>
ffffffffc020605e:	6018                	ld	a4,0(s0)
ffffffffc0206060:	7b7c                	ld	a5,240(a4)
ffffffffc0206062:	cb85                	beqz	a5,ffffffffc0206092 <do_exit+0xde>
ffffffffc0206064:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_bin_sfs_img_size+0xffffffff7ff8ae00>
ffffffffc0206068:	6088                	ld	a0,0(s1)
ffffffffc020606a:	fb74                	sd	a3,240(a4)
ffffffffc020606c:	7978                	ld	a4,240(a0)
ffffffffc020606e:	0e07bc23          	sd	zero,248(a5)
ffffffffc0206072:	10e7b023          	sd	a4,256(a5)
ffffffffc0206076:	c311                	beqz	a4,ffffffffc020607a <do_exit+0xc6>
ffffffffc0206078:	ff7c                	sd	a5,248(a4)
ffffffffc020607a:	4398                	lw	a4,0(a5)
ffffffffc020607c:	f388                	sd	a0,32(a5)
ffffffffc020607e:	f97c                	sd	a5,240(a0)
ffffffffc0206080:	fd271fe3          	bne	a4,s2,ffffffffc020605e <do_exit+0xaa>
ffffffffc0206084:	0ec52783          	lw	a5,236(a0)
ffffffffc0206088:	fd379be3          	bne	a5,s3,ffffffffc020605e <do_exit+0xaa>
ffffffffc020608c:	16a010ef          	jal	ra,ffffffffc02071f6 <wakeup_proc>
ffffffffc0206090:	b7f9                	j	ffffffffc020605e <do_exit+0xaa>
ffffffffc0206092:	020a1263          	bnez	s4,ffffffffc02060b6 <do_exit+0x102>
ffffffffc0206096:	212010ef          	jal	ra,ffffffffc02072a8 <schedule>
ffffffffc020609a:	601c                	ld	a5,0(s0)
ffffffffc020609c:	00007617          	auipc	a2,0x7
ffffffffc02060a0:	3bc60613          	addi	a2,a2,956 # ffffffffc020d458 <CSWTCH.79+0x160>
ffffffffc02060a4:	29600593          	li	a1,662
ffffffffc02060a8:	43d4                	lw	a3,4(a5)
ffffffffc02060aa:	00007517          	auipc	a0,0x7
ffffffffc02060ae:	35e50513          	addi	a0,a0,862 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc02060b2:	becfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02060b6:	bb7fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02060ba:	bff1                	j	ffffffffc0206096 <do_exit+0xe2>
ffffffffc02060bc:	8a6ff0ef          	jal	ra,ffffffffc0205162 <files_destroy>
ffffffffc02060c0:	b7a5                	j	ffffffffc0206028 <do_exit+0x74>
ffffffffc02060c2:	00007617          	auipc	a2,0x7
ffffffffc02060c6:	37660613          	addi	a2,a2,886 # ffffffffc020d438 <CSWTCH.79+0x140>
ffffffffc02060ca:	26100593          	li	a1,609
ffffffffc02060ce:	00007517          	auipc	a0,0x7
ffffffffc02060d2:	33a50513          	addi	a0,a0,826 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc02060d6:	bc8fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02060da:	854e                	mv	a0,s3
ffffffffc02060dc:	d75fd0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc02060e0:	0189b503          	ld	a0,24(s3) # ffffffff80000018 <_binary_bin_sfs_img_size+0xffffffff7ff8ad18>
ffffffffc02060e4:	8f7ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc02060e8:	854e                	mv	a0,s3
ffffffffc02060ea:	bcbfd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc02060ee:	b715                	j	ffffffffc0206012 <do_exit+0x5e>
ffffffffc02060f0:	00007617          	auipc	a2,0x7
ffffffffc02060f4:	35860613          	addi	a2,a2,856 # ffffffffc020d448 <CSWTCH.79+0x150>
ffffffffc02060f8:	26500593          	li	a1,613
ffffffffc02060fc:	00007517          	auipc	a0,0x7
ffffffffc0206100:	30c50513          	addi	a0,a0,780 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206104:	b9afa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206108:	b6bfa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020610c:	4a05                	li	s4,1
ffffffffc020610e:	b73d                	j	ffffffffc020603c <do_exit+0x88>
ffffffffc0206110:	0e6010ef          	jal	ra,ffffffffc02071f6 <wakeup_proc>
ffffffffc0206114:	bf2d                	j	ffffffffc020604e <do_exit+0x9a>

ffffffffc0206116 <do_wait.part.0>:
ffffffffc0206116:	715d                	addi	sp,sp,-80
ffffffffc0206118:	f84a                	sd	s2,48(sp)
ffffffffc020611a:	f44e                	sd	s3,40(sp)
ffffffffc020611c:	80000937          	lui	s2,0x80000
ffffffffc0206120:	6989                	lui	s3,0x2
ffffffffc0206122:	fc26                	sd	s1,56(sp)
ffffffffc0206124:	f052                	sd	s4,32(sp)
ffffffffc0206126:	ec56                	sd	s5,24(sp)
ffffffffc0206128:	e85a                	sd	s6,16(sp)
ffffffffc020612a:	e45e                	sd	s7,8(sp)
ffffffffc020612c:	e486                	sd	ra,72(sp)
ffffffffc020612e:	e0a2                	sd	s0,64(sp)
ffffffffc0206130:	84aa                	mv	s1,a0
ffffffffc0206132:	8a2e                	mv	s4,a1
ffffffffc0206134:	00090b97          	auipc	s7,0x90
ffffffffc0206138:	78cb8b93          	addi	s7,s7,1932 # ffffffffc02968c0 <current>
ffffffffc020613c:	00050b1b          	sext.w	s6,a0
ffffffffc0206140:	fff50a9b          	addiw	s5,a0,-1
ffffffffc0206144:	19f9                	addi	s3,s3,-2
ffffffffc0206146:	0905                	addi	s2,s2,1
ffffffffc0206148:	ccbd                	beqz	s1,ffffffffc02061c6 <do_wait.part.0+0xb0>
ffffffffc020614a:	0359e863          	bltu	s3,s5,ffffffffc020617a <do_wait.part.0+0x64>
ffffffffc020614e:	45a9                	li	a1,10
ffffffffc0206150:	855a                	mv	a0,s6
ffffffffc0206152:	591040ef          	jal	ra,ffffffffc020aee2 <hash32>
ffffffffc0206156:	02051793          	slli	a5,a0,0x20
ffffffffc020615a:	01c7d513          	srli	a0,a5,0x1c
ffffffffc020615e:	0008b797          	auipc	a5,0x8b
ffffffffc0206162:	66278793          	addi	a5,a5,1634 # ffffffffc02917c0 <hash_list>
ffffffffc0206166:	953e                	add	a0,a0,a5
ffffffffc0206168:	842a                	mv	s0,a0
ffffffffc020616a:	a029                	j	ffffffffc0206174 <do_wait.part.0+0x5e>
ffffffffc020616c:	f2c42783          	lw	a5,-212(s0)
ffffffffc0206170:	02978163          	beq	a5,s1,ffffffffc0206192 <do_wait.part.0+0x7c>
ffffffffc0206174:	6400                	ld	s0,8(s0)
ffffffffc0206176:	fe851be3          	bne	a0,s0,ffffffffc020616c <do_wait.part.0+0x56>
ffffffffc020617a:	5579                	li	a0,-2
ffffffffc020617c:	60a6                	ld	ra,72(sp)
ffffffffc020617e:	6406                	ld	s0,64(sp)
ffffffffc0206180:	74e2                	ld	s1,56(sp)
ffffffffc0206182:	7942                	ld	s2,48(sp)
ffffffffc0206184:	79a2                	ld	s3,40(sp)
ffffffffc0206186:	7a02                	ld	s4,32(sp)
ffffffffc0206188:	6ae2                	ld	s5,24(sp)
ffffffffc020618a:	6b42                	ld	s6,16(sp)
ffffffffc020618c:	6ba2                	ld	s7,8(sp)
ffffffffc020618e:	6161                	addi	sp,sp,80
ffffffffc0206190:	8082                	ret
ffffffffc0206192:	000bb683          	ld	a3,0(s7)
ffffffffc0206196:	f4843783          	ld	a5,-184(s0)
ffffffffc020619a:	fed790e3          	bne	a5,a3,ffffffffc020617a <do_wait.part.0+0x64>
ffffffffc020619e:	f2842703          	lw	a4,-216(s0)
ffffffffc02061a2:	478d                	li	a5,3
ffffffffc02061a4:	0ef70b63          	beq	a4,a5,ffffffffc020629a <do_wait.part.0+0x184>
ffffffffc02061a8:	4785                	li	a5,1
ffffffffc02061aa:	c29c                	sw	a5,0(a3)
ffffffffc02061ac:	0f26a623          	sw	s2,236(a3)
ffffffffc02061b0:	0f8010ef          	jal	ra,ffffffffc02072a8 <schedule>
ffffffffc02061b4:	000bb783          	ld	a5,0(s7)
ffffffffc02061b8:	0b07a783          	lw	a5,176(a5)
ffffffffc02061bc:	8b85                	andi	a5,a5,1
ffffffffc02061be:	d7c9                	beqz	a5,ffffffffc0206148 <do_wait.part.0+0x32>
ffffffffc02061c0:	555d                	li	a0,-9
ffffffffc02061c2:	df3ff0ef          	jal	ra,ffffffffc0205fb4 <do_exit>
ffffffffc02061c6:	000bb683          	ld	a3,0(s7)
ffffffffc02061ca:	7ae0                	ld	s0,240(a3)
ffffffffc02061cc:	d45d                	beqz	s0,ffffffffc020617a <do_wait.part.0+0x64>
ffffffffc02061ce:	470d                	li	a4,3
ffffffffc02061d0:	a021                	j	ffffffffc02061d8 <do_wait.part.0+0xc2>
ffffffffc02061d2:	10043403          	ld	s0,256(s0)
ffffffffc02061d6:	d869                	beqz	s0,ffffffffc02061a8 <do_wait.part.0+0x92>
ffffffffc02061d8:	401c                	lw	a5,0(s0)
ffffffffc02061da:	fee79ce3          	bne	a5,a4,ffffffffc02061d2 <do_wait.part.0+0xbc>
ffffffffc02061de:	00090797          	auipc	a5,0x90
ffffffffc02061e2:	6ea7b783          	ld	a5,1770(a5) # ffffffffc02968c8 <idleproc>
ffffffffc02061e6:	0c878963          	beq	a5,s0,ffffffffc02062b8 <do_wait.part.0+0x1a2>
ffffffffc02061ea:	00090797          	auipc	a5,0x90
ffffffffc02061ee:	6e67b783          	ld	a5,1766(a5) # ffffffffc02968d0 <initproc>
ffffffffc02061f2:	0cf40363          	beq	s0,a5,ffffffffc02062b8 <do_wait.part.0+0x1a2>
ffffffffc02061f6:	000a0663          	beqz	s4,ffffffffc0206202 <do_wait.part.0+0xec>
ffffffffc02061fa:	0e842783          	lw	a5,232(s0)
ffffffffc02061fe:	00fa2023          	sw	a5,0(s4)
ffffffffc0206202:	100027f3          	csrr	a5,sstatus
ffffffffc0206206:	8b89                	andi	a5,a5,2
ffffffffc0206208:	4581                	li	a1,0
ffffffffc020620a:	e7c1                	bnez	a5,ffffffffc0206292 <do_wait.part.0+0x17c>
ffffffffc020620c:	6c70                	ld	a2,216(s0)
ffffffffc020620e:	7074                	ld	a3,224(s0)
ffffffffc0206210:	10043703          	ld	a4,256(s0)
ffffffffc0206214:	7c7c                	ld	a5,248(s0)
ffffffffc0206216:	e614                	sd	a3,8(a2)
ffffffffc0206218:	e290                	sd	a2,0(a3)
ffffffffc020621a:	6470                	ld	a2,200(s0)
ffffffffc020621c:	6874                	ld	a3,208(s0)
ffffffffc020621e:	e614                	sd	a3,8(a2)
ffffffffc0206220:	e290                	sd	a2,0(a3)
ffffffffc0206222:	c319                	beqz	a4,ffffffffc0206228 <do_wait.part.0+0x112>
ffffffffc0206224:	ff7c                	sd	a5,248(a4)
ffffffffc0206226:	7c7c                	ld	a5,248(s0)
ffffffffc0206228:	c3b5                	beqz	a5,ffffffffc020628c <do_wait.part.0+0x176>
ffffffffc020622a:	10e7b023          	sd	a4,256(a5)
ffffffffc020622e:	00090717          	auipc	a4,0x90
ffffffffc0206232:	6aa70713          	addi	a4,a4,1706 # ffffffffc02968d8 <nr_process>
ffffffffc0206236:	431c                	lw	a5,0(a4)
ffffffffc0206238:	37fd                	addiw	a5,a5,-1
ffffffffc020623a:	c31c                	sw	a5,0(a4)
ffffffffc020623c:	e5a9                	bnez	a1,ffffffffc0206286 <do_wait.part.0+0x170>
ffffffffc020623e:	6814                	ld	a3,16(s0)
ffffffffc0206240:	c02007b7          	lui	a5,0xc0200
ffffffffc0206244:	04f6ee63          	bltu	a3,a5,ffffffffc02062a0 <do_wait.part.0+0x18a>
ffffffffc0206248:	00090797          	auipc	a5,0x90
ffffffffc020624c:	6707b783          	ld	a5,1648(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206250:	8e9d                	sub	a3,a3,a5
ffffffffc0206252:	82b1                	srli	a3,a3,0xc
ffffffffc0206254:	00090797          	auipc	a5,0x90
ffffffffc0206258:	64c7b783          	ld	a5,1612(a5) # ffffffffc02968a0 <npage>
ffffffffc020625c:	06f6fa63          	bgeu	a3,a5,ffffffffc02062d0 <do_wait.part.0+0x1ba>
ffffffffc0206260:	00009517          	auipc	a0,0x9
ffffffffc0206264:	4f853503          	ld	a0,1272(a0) # ffffffffc020f758 <nbase>
ffffffffc0206268:	8e89                	sub	a3,a3,a0
ffffffffc020626a:	069a                	slli	a3,a3,0x6
ffffffffc020626c:	00090517          	auipc	a0,0x90
ffffffffc0206270:	63c53503          	ld	a0,1596(a0) # ffffffffc02968a8 <pages>
ffffffffc0206274:	9536                	add	a0,a0,a3
ffffffffc0206276:	4589                	li	a1,2
ffffffffc0206278:	f33fb0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020627c:	8522                	mv	a0,s0
ffffffffc020627e:	dc1fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206282:	4501                	li	a0,0
ffffffffc0206284:	bde5                	j	ffffffffc020617c <do_wait.part.0+0x66>
ffffffffc0206286:	9e7fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020628a:	bf55                	j	ffffffffc020623e <do_wait.part.0+0x128>
ffffffffc020628c:	701c                	ld	a5,32(s0)
ffffffffc020628e:	fbf8                	sd	a4,240(a5)
ffffffffc0206290:	bf79                	j	ffffffffc020622e <do_wait.part.0+0x118>
ffffffffc0206292:	9e1fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0206296:	4585                	li	a1,1
ffffffffc0206298:	bf95                	j	ffffffffc020620c <do_wait.part.0+0xf6>
ffffffffc020629a:	f2840413          	addi	s0,s0,-216
ffffffffc020629e:	b781                	j	ffffffffc02061de <do_wait.part.0+0xc8>
ffffffffc02062a0:	00006617          	auipc	a2,0x6
ffffffffc02062a4:	22060613          	addi	a2,a2,544 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc02062a8:	07700593          	li	a1,119
ffffffffc02062ac:	00006517          	auipc	a0,0x6
ffffffffc02062b0:	19450513          	addi	a0,a0,404 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc02062b4:	9eafa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02062b8:	00007617          	auipc	a2,0x7
ffffffffc02062bc:	1c060613          	addi	a2,a2,448 # ffffffffc020d478 <CSWTCH.79+0x180>
ffffffffc02062c0:	44a00593          	li	a1,1098
ffffffffc02062c4:	00007517          	auipc	a0,0x7
ffffffffc02062c8:	14450513          	addi	a0,a0,324 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc02062cc:	9d2fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02062d0:	00006617          	auipc	a2,0x6
ffffffffc02062d4:	21860613          	addi	a2,a2,536 # ffffffffc020c4e8 <default_pmm_manager+0x108>
ffffffffc02062d8:	06900593          	li	a1,105
ffffffffc02062dc:	00006517          	auipc	a0,0x6
ffffffffc02062e0:	16450513          	addi	a0,a0,356 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc02062e4:	9bafa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02062e8 <init_main>:
ffffffffc02062e8:	1141                	addi	sp,sp,-16
ffffffffc02062ea:	00007517          	auipc	a0,0x7
ffffffffc02062ee:	1ae50513          	addi	a0,a0,430 # ffffffffc020d498 <CSWTCH.79+0x1a0>
ffffffffc02062f2:	e406                	sd	ra,8(sp)
ffffffffc02062f4:	724010ef          	jal	ra,ffffffffc0207a18 <vfs_set_bootfs>
ffffffffc02062f8:	e179                	bnez	a0,ffffffffc02063be <init_main+0xd6>
ffffffffc02062fa:	ef1fb0ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc02062fe:	c8dfb0ef          	jal	ra,ffffffffc0201f8a <kallocated>
ffffffffc0206302:	4601                	li	a2,0
ffffffffc0206304:	4581                	li	a1,0
ffffffffc0206306:	00001517          	auipc	a0,0x1
ffffffffc020630a:	94a50513          	addi	a0,a0,-1718 # ffffffffc0206c50 <user_main>
ffffffffc020630e:	c57ff0ef          	jal	ra,ffffffffc0205f64 <kernel_thread>
ffffffffc0206312:	00a04563          	bgtz	a0,ffffffffc020631c <init_main+0x34>
ffffffffc0206316:	a841                	j	ffffffffc02063a6 <init_main+0xbe>
ffffffffc0206318:	791000ef          	jal	ra,ffffffffc02072a8 <schedule>
ffffffffc020631c:	4581                	li	a1,0
ffffffffc020631e:	4501                	li	a0,0
ffffffffc0206320:	df7ff0ef          	jal	ra,ffffffffc0206116 <do_wait.part.0>
ffffffffc0206324:	d975                	beqz	a0,ffffffffc0206318 <init_main+0x30>
ffffffffc0206326:	df7fe0ef          	jal	ra,ffffffffc020511c <fs_cleanup>
ffffffffc020632a:	00007517          	auipc	a0,0x7
ffffffffc020632e:	1b650513          	addi	a0,a0,438 # ffffffffc020d4e0 <CSWTCH.79+0x1e8>
ffffffffc0206332:	e75f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206336:	00090797          	auipc	a5,0x90
ffffffffc020633a:	59a7b783          	ld	a5,1434(a5) # ffffffffc02968d0 <initproc>
ffffffffc020633e:	7bf8                	ld	a4,240(a5)
ffffffffc0206340:	e339                	bnez	a4,ffffffffc0206386 <init_main+0x9e>
ffffffffc0206342:	7ff8                	ld	a4,248(a5)
ffffffffc0206344:	e329                	bnez	a4,ffffffffc0206386 <init_main+0x9e>
ffffffffc0206346:	1007b703          	ld	a4,256(a5)
ffffffffc020634a:	ef15                	bnez	a4,ffffffffc0206386 <init_main+0x9e>
ffffffffc020634c:	00090697          	auipc	a3,0x90
ffffffffc0206350:	58c6a683          	lw	a3,1420(a3) # ffffffffc02968d8 <nr_process>
ffffffffc0206354:	4709                	li	a4,2
ffffffffc0206356:	0ce69163          	bne	a3,a4,ffffffffc0206418 <init_main+0x130>
ffffffffc020635a:	0008f717          	auipc	a4,0x8f
ffffffffc020635e:	46670713          	addi	a4,a4,1126 # ffffffffc02957c0 <proc_list>
ffffffffc0206362:	6714                	ld	a3,8(a4)
ffffffffc0206364:	0c878793          	addi	a5,a5,200
ffffffffc0206368:	08d79863          	bne	a5,a3,ffffffffc02063f8 <init_main+0x110>
ffffffffc020636c:	6318                	ld	a4,0(a4)
ffffffffc020636e:	06e79563          	bne	a5,a4,ffffffffc02063d8 <init_main+0xf0>
ffffffffc0206372:	00007517          	auipc	a0,0x7
ffffffffc0206376:	25650513          	addi	a0,a0,598 # ffffffffc020d5c8 <CSWTCH.79+0x2d0>
ffffffffc020637a:	e2df90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020637e:	60a2                	ld	ra,8(sp)
ffffffffc0206380:	4501                	li	a0,0
ffffffffc0206382:	0141                	addi	sp,sp,16
ffffffffc0206384:	8082                	ret
ffffffffc0206386:	00007697          	auipc	a3,0x7
ffffffffc020638a:	18268693          	addi	a3,a3,386 # ffffffffc020d508 <CSWTCH.79+0x210>
ffffffffc020638e:	00005617          	auipc	a2,0x5
ffffffffc0206392:	56a60613          	addi	a2,a2,1386 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0206396:	4c000593          	li	a1,1216
ffffffffc020639a:	00007517          	auipc	a0,0x7
ffffffffc020639e:	06e50513          	addi	a0,a0,110 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc02063a2:	8fcfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02063a6:	00007617          	auipc	a2,0x7
ffffffffc02063aa:	11a60613          	addi	a2,a2,282 # ffffffffc020d4c0 <CSWTCH.79+0x1c8>
ffffffffc02063ae:	4b300593          	li	a1,1203
ffffffffc02063b2:	00007517          	auipc	a0,0x7
ffffffffc02063b6:	05650513          	addi	a0,a0,86 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc02063ba:	8e4fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02063be:	86aa                	mv	a3,a0
ffffffffc02063c0:	00007617          	auipc	a2,0x7
ffffffffc02063c4:	0e060613          	addi	a2,a2,224 # ffffffffc020d4a0 <CSWTCH.79+0x1a8>
ffffffffc02063c8:	4ab00593          	li	a1,1195
ffffffffc02063cc:	00007517          	auipc	a0,0x7
ffffffffc02063d0:	03c50513          	addi	a0,a0,60 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc02063d4:	8cafa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02063d8:	00007697          	auipc	a3,0x7
ffffffffc02063dc:	1c068693          	addi	a3,a3,448 # ffffffffc020d598 <CSWTCH.79+0x2a0>
ffffffffc02063e0:	00005617          	auipc	a2,0x5
ffffffffc02063e4:	51860613          	addi	a2,a2,1304 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02063e8:	4c300593          	li	a1,1219
ffffffffc02063ec:	00007517          	auipc	a0,0x7
ffffffffc02063f0:	01c50513          	addi	a0,a0,28 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc02063f4:	8aafa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02063f8:	00007697          	auipc	a3,0x7
ffffffffc02063fc:	17068693          	addi	a3,a3,368 # ffffffffc020d568 <CSWTCH.79+0x270>
ffffffffc0206400:	00005617          	auipc	a2,0x5
ffffffffc0206404:	4f860613          	addi	a2,a2,1272 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0206408:	4c200593          	li	a1,1218
ffffffffc020640c:	00007517          	auipc	a0,0x7
ffffffffc0206410:	ffc50513          	addi	a0,a0,-4 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206414:	88afa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206418:	00007697          	auipc	a3,0x7
ffffffffc020641c:	14068693          	addi	a3,a3,320 # ffffffffc020d558 <CSWTCH.79+0x260>
ffffffffc0206420:	00005617          	auipc	a2,0x5
ffffffffc0206424:	4d860613          	addi	a2,a2,1240 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0206428:	4c100593          	li	a1,1217
ffffffffc020642c:	00007517          	auipc	a0,0x7
ffffffffc0206430:	fdc50513          	addi	a0,a0,-36 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206434:	86afa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206438 <do_execve>:
ffffffffc0206438:	d9010113          	addi	sp,sp,-624
ffffffffc020643c:	25313423          	sd	s3,584(sp)
ffffffffc0206440:	00090997          	auipc	s3,0x90
ffffffffc0206444:	48098993          	addi	s3,s3,1152 # ffffffffc02968c0 <current>
ffffffffc0206448:	0009b683          	ld	a3,0(s3)
ffffffffc020644c:	25413023          	sd	s4,576(sp)
ffffffffc0206450:	fff5871b          	addiw	a4,a1,-1
ffffffffc0206454:	0286ba03          	ld	s4,40(a3)
ffffffffc0206458:	0005869b          	sext.w	a3,a1
ffffffffc020645c:	26113423          	sd	ra,616(sp)
ffffffffc0206460:	26813023          	sd	s0,608(sp)
ffffffffc0206464:	24913c23          	sd	s1,600(sp)
ffffffffc0206468:	25213823          	sd	s2,592(sp)
ffffffffc020646c:	23513c23          	sd	s5,568(sp)
ffffffffc0206470:	23613823          	sd	s6,560(sp)
ffffffffc0206474:	23713423          	sd	s7,552(sp)
ffffffffc0206478:	23813023          	sd	s8,544(sp)
ffffffffc020647c:	21913c23          	sd	s9,536(sp)
ffffffffc0206480:	21a13823          	sd	s10,528(sp)
ffffffffc0206484:	21b13423          	sd	s11,520(sp)
ffffffffc0206488:	c83a                	sw	a4,16(sp)
ffffffffc020648a:	47fd                	li	a5,31
ffffffffc020648c:	ec36                	sd	a3,24(sp)
ffffffffc020648e:	64e7e263          	bltu	a5,a4,ffffffffc0206ad2 <do_execve+0x69a>
ffffffffc0206492:	842e                	mv	s0,a1
ffffffffc0206494:	84aa                	mv	s1,a0
ffffffffc0206496:	8b32                	mv	s6,a2
ffffffffc0206498:	4581                	li	a1,0
ffffffffc020649a:	4641                	li	a2,16
ffffffffc020649c:	18a8                	addi	a0,sp,120
ffffffffc020649e:	779040ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc02064a2:	000a0c63          	beqz	s4,ffffffffc02064ba <do_execve+0x82>
ffffffffc02064a6:	038a0513          	addi	a0,s4,56
ffffffffc02064aa:	818fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc02064ae:	0009b783          	ld	a5,0(s3)
ffffffffc02064b2:	c781                	beqz	a5,ffffffffc02064ba <do_execve+0x82>
ffffffffc02064b4:	43dc                	lw	a5,4(a5)
ffffffffc02064b6:	04fa2823          	sw	a5,80(s4)
ffffffffc02064ba:	1a048d63          	beqz	s1,ffffffffc0206674 <do_execve+0x23c>
ffffffffc02064be:	46c1                	li	a3,16
ffffffffc02064c0:	8626                	mv	a2,s1
ffffffffc02064c2:	18ac                	addi	a1,sp,120
ffffffffc02064c4:	8552                	mv	a0,s4
ffffffffc02064c6:	e25fd0ef          	jal	ra,ffffffffc02042ea <copy_string>
ffffffffc02064ca:	6a050263          	beqz	a0,ffffffffc0206b6e <do_execve+0x736>
ffffffffc02064ce:	00341c93          	slli	s9,s0,0x3
ffffffffc02064d2:	4681                	li	a3,0
ffffffffc02064d4:	8666                	mv	a2,s9
ffffffffc02064d6:	85da                	mv	a1,s6
ffffffffc02064d8:	8552                	mv	a0,s4
ffffffffc02064da:	d17fd0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc02064de:	895a                	mv	s2,s6
ffffffffc02064e0:	68050363          	beqz	a0,ffffffffc0206b66 <do_execve+0x72e>
ffffffffc02064e4:	10010c13          	addi	s8,sp,256
ffffffffc02064e8:	8ae2                	mv	s5,s8
ffffffffc02064ea:	4481                	li	s1,0
ffffffffc02064ec:	6505                	lui	a0,0x1
ffffffffc02064ee:	aa1fb0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02064f2:	8baa                	mv	s7,a0
ffffffffc02064f4:	0e050d63          	beqz	a0,ffffffffc02065ee <do_execve+0x1b6>
ffffffffc02064f8:	00093603          	ld	a2,0(s2) # ffffffff80000000 <_binary_bin_sfs_img_size+0xffffffff7ff8ad00>
ffffffffc02064fc:	85aa                	mv	a1,a0
ffffffffc02064fe:	6685                	lui	a3,0x1
ffffffffc0206500:	8552                	mv	a0,s4
ffffffffc0206502:	de9fd0ef          	jal	ra,ffffffffc02042ea <copy_string>
ffffffffc0206506:	16050263          	beqz	a0,ffffffffc020666a <do_execve+0x232>
ffffffffc020650a:	017ab023          	sd	s7,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020650e:	2485                	addiw	s1,s1,1
ffffffffc0206510:	0aa1                	addi	s5,s5,8
ffffffffc0206512:	0921                	addi	s2,s2,8
ffffffffc0206514:	fc941ce3          	bne	s0,s1,ffffffffc02064ec <do_execve+0xb4>
ffffffffc0206518:	000b3903          	ld	s2,0(s6)
ffffffffc020651c:	080a0c63          	beqz	s4,ffffffffc02065b4 <do_execve+0x17c>
ffffffffc0206520:	038a0513          	addi	a0,s4,56
ffffffffc0206524:	f9bfd0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0206528:	0009b783          	ld	a5,0(s3)
ffffffffc020652c:	040a2823          	sw	zero,80(s4)
ffffffffc0206530:	1487b503          	ld	a0,328(a5)
ffffffffc0206534:	cc5fe0ef          	jal	ra,ffffffffc02051f8 <files_closeall>
ffffffffc0206538:	4581                	li	a1,0
ffffffffc020653a:	854a                	mv	a0,s2
ffffffffc020653c:	f49fe0ef          	jal	ra,ffffffffc0205484 <sysfile_open>
ffffffffc0206540:	8baa                	mv	s7,a0
ffffffffc0206542:	66054863          	bltz	a0,ffffffffc0206bb2 <do_execve+0x77a>
ffffffffc0206546:	00090797          	auipc	a5,0x90
ffffffffc020654a:	34a7b783          	ld	a5,842(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc020654e:	577d                	li	a4,-1
ffffffffc0206550:	177e                	slli	a4,a4,0x3f
ffffffffc0206552:	83b1                	srli	a5,a5,0xc
ffffffffc0206554:	8fd9                	or	a5,a5,a4
ffffffffc0206556:	18079073          	csrw	satp,a5
ffffffffc020655a:	030a2783          	lw	a5,48(s4)
ffffffffc020655e:	fff7871b          	addiw	a4,a5,-1
ffffffffc0206562:	02ea2823          	sw	a4,48(s4)
ffffffffc0206566:	16070363          	beqz	a4,ffffffffc02066cc <do_execve+0x294>
ffffffffc020656a:	0009b783          	ld	a5,0(s3)
ffffffffc020656e:	0207b423          	sd	zero,40(a5)
ffffffffc0206572:	df4fd0ef          	jal	ra,ffffffffc0203b66 <mm_create>
ffffffffc0206576:	8a2a                	mv	s4,a0
ffffffffc0206578:	c901                	beqz	a0,ffffffffc0206588 <do_execve+0x150>
ffffffffc020657a:	cd6ff0ef          	jal	ra,ffffffffc0205a50 <setup_pgdir>
ffffffffc020657e:	10050763          	beqz	a0,ffffffffc020668c <do_execve+0x254>
ffffffffc0206582:	8552                	mv	a0,s4
ffffffffc0206584:	f30fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0206588:	5df1                	li	s11,-4
ffffffffc020658a:	67c2                	ld	a5,16(sp)
ffffffffc020658c:	147d                	addi	s0,s0,-1
ffffffffc020658e:	ff0c0493          	addi	s1,s8,-16
ffffffffc0206592:	02079713          	slli	a4,a5,0x20
ffffffffc0206596:	040e                	slli	s0,s0,0x3
ffffffffc0206598:	94e6                	add	s1,s1,s9
ffffffffc020659a:	01d75793          	srli	a5,a4,0x1d
ffffffffc020659e:	9462                	add	s0,s0,s8
ffffffffc02065a0:	8c9d                	sub	s1,s1,a5
ffffffffc02065a2:	6008                	ld	a0,0(s0)
ffffffffc02065a4:	1461                	addi	s0,s0,-8
ffffffffc02065a6:	a99fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02065aa:	fe941ce3          	bne	s0,s1,ffffffffc02065a2 <do_execve+0x16a>
ffffffffc02065ae:	856e                	mv	a0,s11
ffffffffc02065b0:	a05ff0ef          	jal	ra,ffffffffc0205fb4 <do_exit>
ffffffffc02065b4:	0009b783          	ld	a5,0(s3)
ffffffffc02065b8:	1487b503          	ld	a0,328(a5)
ffffffffc02065bc:	c3dfe0ef          	jal	ra,ffffffffc02051f8 <files_closeall>
ffffffffc02065c0:	4581                	li	a1,0
ffffffffc02065c2:	854a                	mv	a0,s2
ffffffffc02065c4:	ec1fe0ef          	jal	ra,ffffffffc0205484 <sysfile_open>
ffffffffc02065c8:	8baa                	mv	s7,a0
ffffffffc02065ca:	5e054263          	bltz	a0,ffffffffc0206bae <do_execve+0x776>
ffffffffc02065ce:	0009b783          	ld	a5,0(s3)
ffffffffc02065d2:	779c                	ld	a5,40(a5)
ffffffffc02065d4:	dfd9                	beqz	a5,ffffffffc0206572 <do_execve+0x13a>
ffffffffc02065d6:	00007617          	auipc	a2,0x7
ffffffffc02065da:	02260613          	addi	a2,a2,34 # ffffffffc020d5f8 <CSWTCH.79+0x300>
ffffffffc02065de:	2cb00593          	li	a1,715
ffffffffc02065e2:	00007517          	auipc	a0,0x7
ffffffffc02065e6:	e2650513          	addi	a0,a0,-474 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc02065ea:	eb5f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02065ee:	5df1                	li	s11,-4
ffffffffc02065f0:	c49d                	beqz	s1,ffffffffc020661e <do_execve+0x1e6>
ffffffffc02065f2:	00349713          	slli	a4,s1,0x3
ffffffffc02065f6:	fff48413          	addi	s0,s1,-1
ffffffffc02065fa:	ff0c0793          	addi	a5,s8,-16
ffffffffc02065fe:	34fd                	addiw	s1,s1,-1
ffffffffc0206600:	97ba                	add	a5,a5,a4
ffffffffc0206602:	02049713          	slli	a4,s1,0x20
ffffffffc0206606:	040e                	slli	s0,s0,0x3
ffffffffc0206608:	01d75493          	srli	s1,a4,0x1d
ffffffffc020660c:	9462                	add	s0,s0,s8
ffffffffc020660e:	409784b3          	sub	s1,a5,s1
ffffffffc0206612:	6008                	ld	a0,0(s0)
ffffffffc0206614:	1461                	addi	s0,s0,-8
ffffffffc0206616:	a29fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020661a:	fe849ce3          	bne	s1,s0,ffffffffc0206612 <do_execve+0x1da>
ffffffffc020661e:	000a0863          	beqz	s4,ffffffffc020662e <do_execve+0x1f6>
ffffffffc0206622:	038a0513          	addi	a0,s4,56
ffffffffc0206626:	e99fd0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020662a:	040a2823          	sw	zero,80(s4)
ffffffffc020662e:	26813083          	ld	ra,616(sp)
ffffffffc0206632:	26013403          	ld	s0,608(sp)
ffffffffc0206636:	25813483          	ld	s1,600(sp)
ffffffffc020663a:	25013903          	ld	s2,592(sp)
ffffffffc020663e:	24813983          	ld	s3,584(sp)
ffffffffc0206642:	24013a03          	ld	s4,576(sp)
ffffffffc0206646:	23813a83          	ld	s5,568(sp)
ffffffffc020664a:	23013b03          	ld	s6,560(sp)
ffffffffc020664e:	22813b83          	ld	s7,552(sp)
ffffffffc0206652:	22013c03          	ld	s8,544(sp)
ffffffffc0206656:	21813c83          	ld	s9,536(sp)
ffffffffc020665a:	21013d03          	ld	s10,528(sp)
ffffffffc020665e:	856e                	mv	a0,s11
ffffffffc0206660:	20813d83          	ld	s11,520(sp)
ffffffffc0206664:	27010113          	addi	sp,sp,624
ffffffffc0206668:	8082                	ret
ffffffffc020666a:	855e                	mv	a0,s7
ffffffffc020666c:	9d3fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206670:	5df5                	li	s11,-3
ffffffffc0206672:	bfbd                	j	ffffffffc02065f0 <do_execve+0x1b8>
ffffffffc0206674:	0009b783          	ld	a5,0(s3)
ffffffffc0206678:	00007617          	auipc	a2,0x7
ffffffffc020667c:	f7060613          	addi	a2,a2,-144 # ffffffffc020d5e8 <CSWTCH.79+0x2f0>
ffffffffc0206680:	45c1                	li	a1,16
ffffffffc0206682:	43d4                	lw	a3,4(a5)
ffffffffc0206684:	18a8                	addi	a0,sp,120
ffffffffc0206686:	4a1040ef          	jal	ra,ffffffffc020b326 <snprintf>
ffffffffc020668a:	b591                	j	ffffffffc02064ce <do_execve+0x96>
ffffffffc020668c:	4601                	li	a2,0
ffffffffc020668e:	4581                	li	a1,0
ffffffffc0206690:	855e                	mv	a0,s7
ffffffffc0206692:	858ff0ef          	jal	ra,ffffffffc02056ea <sysfile_seek>
ffffffffc0206696:	8daa                	mv	s11,a0
ffffffffc0206698:	c909                	beqz	a0,ffffffffc02066aa <do_execve+0x272>
ffffffffc020669a:	018a3503          	ld	a0,24(s4)
ffffffffc020669e:	b3cff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc02066a2:	8552                	mv	a0,s4
ffffffffc02066a4:	e10fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc02066a8:	b5cd                	j	ffffffffc020658a <do_execve+0x152>
ffffffffc02066aa:	04000613          	li	a2,64
ffffffffc02066ae:	018c                	addi	a1,sp,192
ffffffffc02066b0:	855e                	mv	a0,s7
ffffffffc02066b2:	e0bfe0ef          	jal	ra,ffffffffc02054bc <sysfile_read>
ffffffffc02066b6:	04000793          	li	a5,64
ffffffffc02066ba:	02f50463          	beq	a0,a5,ffffffffc02066e2 <do_execve+0x2aa>
ffffffffc02066be:	87aa                	mv	a5,a0
ffffffffc02066c0:	00054363          	bltz	a0,ffffffffc02066c6 <do_execve+0x28e>
ffffffffc02066c4:	57fd                	li	a5,-1
ffffffffc02066c6:	00078d9b          	sext.w	s11,a5
ffffffffc02066ca:	bfc1                	j	ffffffffc020669a <do_execve+0x262>
ffffffffc02066cc:	8552                	mv	a0,s4
ffffffffc02066ce:	f82fd0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc02066d2:	018a3503          	ld	a0,24(s4)
ffffffffc02066d6:	b04ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc02066da:	8552                	mv	a0,s4
ffffffffc02066dc:	dd8fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc02066e0:	b569                	j	ffffffffc020656a <do_execve+0x132>
ffffffffc02066e2:	470e                	lw	a4,192(sp)
ffffffffc02066e4:	464c47b7          	lui	a5,0x464c4
ffffffffc02066e8:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc02066ec:	32f71163          	bne	a4,a5,ffffffffc0206a0e <do_execve+0x5d6>
ffffffffc02066f0:	0f815783          	lhu	a5,248(sp)
ffffffffc02066f4:	e482                	sd	zero,72(sp)
ffffffffc02066f6:	e882                	sd	zero,80(sp)
ffffffffc02066f8:	18078963          	beqz	a5,ffffffffc020688a <do_execve+0x452>
ffffffffc02066fc:	57fd                	li	a5,-1
ffffffffc02066fe:	83b1                	srli	a5,a5,0xc
ffffffffc0206700:	f83e                	sd	a5,48(sp)
ffffffffc0206702:	fc66                	sd	s9,56(sp)
ffffffffc0206704:	f4a6                	sd	s1,104(sp)
ffffffffc0206706:	f0ee                	sd	s11,96(sp)
ffffffffc0206708:	e0a2                	sd	s0,64(sp)
ffffffffc020670a:	758e                	ld	a1,224(sp)
ffffffffc020670c:	67a6                	ld	a5,72(sp)
ffffffffc020670e:	4601                	li	a2,0
ffffffffc0206710:	855e                	mv	a0,s7
ffffffffc0206712:	95be                	add	a1,a1,a5
ffffffffc0206714:	fd7fe0ef          	jal	ra,ffffffffc02056ea <sysfile_seek>
ffffffffc0206718:	e42a                	sd	a0,8(sp)
ffffffffc020671a:	14051263          	bnez	a0,ffffffffc020685e <do_execve+0x426>
ffffffffc020671e:	03800613          	li	a2,56
ffffffffc0206722:	012c                	addi	a1,sp,136
ffffffffc0206724:	855e                	mv	a0,s7
ffffffffc0206726:	d97fe0ef          	jal	ra,ffffffffc02054bc <sysfile_read>
ffffffffc020672a:	03800793          	li	a5,56
ffffffffc020672e:	12f50b63          	beq	a0,a5,ffffffffc0206864 <do_execve+0x42c>
ffffffffc0206732:	7ce2                	ld	s9,56(sp)
ffffffffc0206734:	6406                	ld	s0,64(sp)
ffffffffc0206736:	892a                	mv	s2,a0
ffffffffc0206738:	00054363          	bltz	a0,ffffffffc020673e <do_execve+0x306>
ffffffffc020673c:	597d                	li	s2,-1
ffffffffc020673e:	0009079b          	sext.w	a5,s2
ffffffffc0206742:	e43e                	sd	a5,8(sp)
ffffffffc0206744:	8552                	mv	a0,s4
ffffffffc0206746:	f0afd0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc020674a:	018a3503          	ld	a0,24(s4)
ffffffffc020674e:	6da2                	ld	s11,8(sp)
ffffffffc0206750:	a8aff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc0206754:	8552                	mv	a0,s4
ffffffffc0206756:	d5efd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc020675a:	bd05                	j	ffffffffc020658a <do_execve+0x152>
ffffffffc020675c:	764a                	ld	a2,176(sp)
ffffffffc020675e:	77aa                	ld	a5,168(sp)
ffffffffc0206760:	42f66663          	bltu	a2,a5,ffffffffc0206b8c <do_execve+0x754>
ffffffffc0206764:	47ba                	lw	a5,140(sp)
ffffffffc0206766:	0017f693          	andi	a3,a5,1
ffffffffc020676a:	c291                	beqz	a3,ffffffffc020676e <do_execve+0x336>
ffffffffc020676c:	4691                	li	a3,4
ffffffffc020676e:	0027f713          	andi	a4,a5,2
ffffffffc0206772:	8b91                	andi	a5,a5,4
ffffffffc0206774:	2a071663          	bnez	a4,ffffffffc0206a20 <do_execve+0x5e8>
ffffffffc0206778:	4745                	li	a4,17
ffffffffc020677a:	ecba                	sd	a4,88(sp)
ffffffffc020677c:	c789                	beqz	a5,ffffffffc0206786 <do_execve+0x34e>
ffffffffc020677e:	47cd                	li	a5,19
ffffffffc0206780:	0016e693          	ori	a3,a3,1
ffffffffc0206784:	ecbe                	sd	a5,88(sp)
ffffffffc0206786:	0026f793          	andi	a5,a3,2
ffffffffc020678a:	28079f63          	bnez	a5,ffffffffc0206a28 <do_execve+0x5f0>
ffffffffc020678e:	0046f793          	andi	a5,a3,4
ffffffffc0206792:	c789                	beqz	a5,ffffffffc020679c <do_execve+0x364>
ffffffffc0206794:	67e6                	ld	a5,88(sp)
ffffffffc0206796:	0087e793          	ori	a5,a5,8
ffffffffc020679a:	ecbe                	sd	a5,88(sp)
ffffffffc020679c:	65ea                	ld	a1,152(sp)
ffffffffc020679e:	4701                	li	a4,0
ffffffffc02067a0:	8552                	mv	a0,s4
ffffffffc02067a2:	d64fd0ef          	jal	ra,ffffffffc0203d06 <mm_map>
ffffffffc02067a6:	e42a                	sd	a0,8(sp)
ffffffffc02067a8:	e95d                	bnez	a0,ffffffffc020685e <do_execve+0x426>
ffffffffc02067aa:	696a                	ld	s2,152(sp)
ffffffffc02067ac:	7caa                	ld	s9,168(sp)
ffffffffc02067ae:	76fd                	lui	a3,0xfffff
ffffffffc02067b0:	6b4a                	ld	s6,144(sp)
ffffffffc02067b2:	9cca                	add	s9,s9,s2
ffffffffc02067b4:	00d97db3          	and	s11,s2,a3
ffffffffc02067b8:	3d997563          	bgeu	s2,s9,ffffffffc0206b82 <do_execve+0x74a>
ffffffffc02067bc:	57f1                	li	a5,-4
ffffffffc02067be:	6ae6                	ld	s5,88(sp)
ffffffffc02067c0:	e43e                	sd	a5,8(sp)
ffffffffc02067c2:	846e                	mv	s0,s11
ffffffffc02067c4:	a01d                	j	ffffffffc02067ea <do_execve+0x3b2>
ffffffffc02067c6:	7702                	ld	a4,32(sp)
ffffffffc02067c8:	77a2                	ld	a5,40(sp)
ffffffffc02067ca:	40890433          	sub	s0,s2,s0
ffffffffc02067ce:	8626                	mv	a2,s1
ffffffffc02067d0:	00f705b3          	add	a1,a4,a5
ffffffffc02067d4:	95a2                	add	a1,a1,s0
ffffffffc02067d6:	855e                	mv	a0,s7
ffffffffc02067d8:	ce5fe0ef          	jal	ra,ffffffffc02054bc <sysfile_read>
ffffffffc02067dc:	f4a49be3          	bne	s1,a0,ffffffffc0206732 <do_execve+0x2fa>
ffffffffc02067e0:	9926                	add	s2,s2,s1
ffffffffc02067e2:	9b26                	add	s6,s6,s1
ffffffffc02067e4:	846e                	mv	s0,s11
ffffffffc02067e6:	2f997863          	bgeu	s2,s9,ffffffffc0206ad6 <do_execve+0x69e>
ffffffffc02067ea:	018a3503          	ld	a0,24(s4)
ffffffffc02067ee:	8656                	mv	a2,s5
ffffffffc02067f0:	85a2                	mv	a1,s0
ffffffffc02067f2:	a8efd0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc02067f6:	8d2a                	mv	s10,a0
ffffffffc02067f8:	2a050b63          	beqz	a0,ffffffffc0206aae <do_execve+0x676>
ffffffffc02067fc:	6785                	lui	a5,0x1
ffffffffc02067fe:	00f40db3          	add	s11,s0,a5
ffffffffc0206802:	412d84b3          	sub	s1,s11,s2
ffffffffc0206806:	01bcf463          	bgeu	s9,s11,ffffffffc020680e <do_execve+0x3d6>
ffffffffc020680a:	412c84b3          	sub	s1,s9,s2
ffffffffc020680e:	00090797          	auipc	a5,0x90
ffffffffc0206812:	09a78793          	addi	a5,a5,154 # ffffffffc02968a8 <pages>
ffffffffc0206816:	638c                	ld	a1,0(a5)
ffffffffc0206818:	00009797          	auipc	a5,0x9
ffffffffc020681c:	f4078793          	addi	a5,a5,-192 # ffffffffc020f758 <nbase>
ffffffffc0206820:	6388                	ld	a0,0(a5)
ffffffffc0206822:	00090797          	auipc	a5,0x90
ffffffffc0206826:	07e78793          	addi	a5,a5,126 # ffffffffc02968a0 <npage>
ffffffffc020682a:	6390                	ld	a2,0(a5)
ffffffffc020682c:	40bd05b3          	sub	a1,s10,a1
ffffffffc0206830:	77c2                	ld	a5,48(sp)
ffffffffc0206832:	8599                	srai	a1,a1,0x6
ffffffffc0206834:	95aa                	add	a1,a1,a0
ffffffffc0206836:	00f5f533          	and	a0,a1,a5
ffffffffc020683a:	00c59793          	slli	a5,a1,0xc
ffffffffc020683e:	f03e                	sd	a5,32(sp)
ffffffffc0206840:	36c57b63          	bgeu	a0,a2,ffffffffc0206bb6 <do_execve+0x77e>
ffffffffc0206844:	00090797          	auipc	a5,0x90
ffffffffc0206848:	07478793          	addi	a5,a5,116 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020684c:	639c                	ld	a5,0(a5)
ffffffffc020684e:	4601                	li	a2,0
ffffffffc0206850:	85da                	mv	a1,s6
ffffffffc0206852:	855e                	mv	a0,s7
ffffffffc0206854:	f43e                	sd	a5,40(sp)
ffffffffc0206856:	e95fe0ef          	jal	ra,ffffffffc02056ea <sysfile_seek>
ffffffffc020685a:	e42a                	sd	a0,8(sp)
ffffffffc020685c:	d52d                	beqz	a0,ffffffffc02067c6 <do_execve+0x38e>
ffffffffc020685e:	7ce2                	ld	s9,56(sp)
ffffffffc0206860:	6406                	ld	s0,64(sp)
ffffffffc0206862:	b5cd                	j	ffffffffc0206744 <do_execve+0x30c>
ffffffffc0206864:	472a                	lw	a4,136(sp)
ffffffffc0206866:	4785                	li	a5,1
ffffffffc0206868:	eef70ae3          	beq	a4,a5,ffffffffc020675c <do_execve+0x324>
ffffffffc020686c:	6746                	ld	a4,80(sp)
ffffffffc020686e:	66a6                	ld	a3,72(sp)
ffffffffc0206870:	0f815783          	lhu	a5,248(sp)
ffffffffc0206874:	2705                	addiw	a4,a4,1
ffffffffc0206876:	03868693          	addi	a3,a3,56 # fffffffffffff038 <end+0x3fd68728>
ffffffffc020687a:	e8ba                	sd	a4,80(sp)
ffffffffc020687c:	e4b6                	sd	a3,72(sp)
ffffffffc020687e:	e8f766e3          	bltu	a4,a5,ffffffffc020670a <do_execve+0x2d2>
ffffffffc0206882:	7ce2                	ld	s9,56(sp)
ffffffffc0206884:	74a6                	ld	s1,104(sp)
ffffffffc0206886:	7d86                	ld	s11,96(sp)
ffffffffc0206888:	6406                	ld	s0,64(sp)
ffffffffc020688a:	4701                	li	a4,0
ffffffffc020688c:	46ad                	li	a3,11
ffffffffc020688e:	00100637          	lui	a2,0x100
ffffffffc0206892:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0206896:	8552                	mv	a0,s4
ffffffffc0206898:	c6efd0ef          	jal	ra,ffffffffc0203d06 <mm_map>
ffffffffc020689c:	e42a                	sd	a0,8(sp)
ffffffffc020689e:	ea0513e3          	bnez	a0,ffffffffc0206744 <do_execve+0x30c>
ffffffffc02068a2:	018a3503          	ld	a0,24(s4)
ffffffffc02068a6:	467d                	li	a2,31
ffffffffc02068a8:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc02068ac:	9d4fd0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc02068b0:	38050063          	beqz	a0,ffffffffc0206c30 <do_execve+0x7f8>
ffffffffc02068b4:	018a3503          	ld	a0,24(s4)
ffffffffc02068b8:	467d                	li	a2,31
ffffffffc02068ba:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc02068be:	9c2fd0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc02068c2:	34050763          	beqz	a0,ffffffffc0206c10 <do_execve+0x7d8>
ffffffffc02068c6:	018a3503          	ld	a0,24(s4)
ffffffffc02068ca:	467d                	li	a2,31
ffffffffc02068cc:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc02068d0:	9b0fd0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc02068d4:	30050e63          	beqz	a0,ffffffffc0206bf0 <do_execve+0x7b8>
ffffffffc02068d8:	018a3503          	ld	a0,24(s4)
ffffffffc02068dc:	467d                	li	a2,31
ffffffffc02068de:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc02068e2:	99efd0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc02068e6:	2e050563          	beqz	a0,ffffffffc0206bd0 <do_execve+0x798>
ffffffffc02068ea:	030a2783          	lw	a5,48(s4)
ffffffffc02068ee:	0009b703          	ld	a4,0(s3)
ffffffffc02068f2:	018a3683          	ld	a3,24(s4)
ffffffffc02068f6:	2785                	addiw	a5,a5,1
ffffffffc02068f8:	02fa2823          	sw	a5,48(s4)
ffffffffc02068fc:	03473423          	sd	s4,40(a4)
ffffffffc0206900:	c02007b7          	lui	a5,0xc0200
ffffffffc0206904:	28f6e963          	bltu	a3,a5,ffffffffc0206b96 <do_execve+0x75e>
ffffffffc0206908:	00090797          	auipc	a5,0x90
ffffffffc020690c:	fb07b783          	ld	a5,-80(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206910:	8e9d                	sub	a3,a3,a5
ffffffffc0206912:	f754                	sd	a3,168(a4)
ffffffffc0206914:	577d                	li	a4,-1
ffffffffc0206916:	00c6d793          	srli	a5,a3,0xc
ffffffffc020691a:	177e                	slli	a4,a4,0x3f
ffffffffc020691c:	8fd9                	or	a5,a5,a4
ffffffffc020691e:	18079073          	csrw	satp,a5
ffffffffc0206922:	6b62                	ld	s6,24(sp)
ffffffffc0206924:	4901                	li	s2,0
ffffffffc0206926:	8ae2                	mv	s5,s8
ffffffffc0206928:	4a01                	li	s4,0
ffffffffc020692a:	000ab503          	ld	a0,0(s5)
ffffffffc020692e:	6585                	lui	a1,0x1
ffffffffc0206930:	2a05                	addiw	s4,s4,1
ffffffffc0206932:	25d040ef          	jal	ra,ffffffffc020b38e <strnlen>
ffffffffc0206936:	00150793          	addi	a5,a0,1
ffffffffc020693a:	0127893b          	addw	s2,a5,s2
ffffffffc020693e:	0aa1                	addi	s5,s5,8
ffffffffc0206940:	ff6a65e3          	bltu	s4,s6,ffffffffc020692a <do_execve+0x4f2>
ffffffffc0206944:	0039579b          	srliw	a5,s2,0x3
ffffffffc0206948:	10000937          	lui	s2,0x10000
ffffffffc020694c:	197d                	addi	s2,s2,-1
ffffffffc020694e:	40f90933          	sub	s2,s2,a5
ffffffffc0206952:	090e                	slli	s2,s2,0x3
ffffffffc0206954:	41990d33          	sub	s10,s2,s9
ffffffffc0206958:	418d07b3          	sub	a5,s10,s8
ffffffffc020695c:	8ae2                	mv	s5,s8
ffffffffc020695e:	4b81                	li	s7,0
ffffffffc0206960:	4b01                	li	s6,0
ffffffffc0206962:	e43e                	sd	a5,8(sp)
ffffffffc0206964:	8a4a                	mv	s4,s2
ffffffffc0206966:	67a2                	ld	a5,8(sp)
ffffffffc0206968:	000ab903          	ld	s2,0(s5)
ffffffffc020696c:	020b1513          	slli	a0,s6,0x20
ffffffffc0206970:	9101                	srli	a0,a0,0x20
ffffffffc0206972:	97d6                	add	a5,a5,s5
ffffffffc0206974:	9552                	add	a0,a0,s4
ffffffffc0206976:	e388                	sd	a0,0(a5)
ffffffffc0206978:	85ca                	mv	a1,s2
ffffffffc020697a:	231040ef          	jal	ra,ffffffffc020b3aa <strcpy>
ffffffffc020697e:	6585                	lui	a1,0x1
ffffffffc0206980:	854a                	mv	a0,s2
ffffffffc0206982:	20d040ef          	jal	ra,ffffffffc020b38e <strnlen>
ffffffffc0206986:	00150793          	addi	a5,a0,1
ffffffffc020698a:	01678b3b          	addw	s6,a5,s6
ffffffffc020698e:	67e2                	ld	a5,24(sp)
ffffffffc0206990:	2b85                	addiw	s7,s7,1
ffffffffc0206992:	0aa1                	addi	s5,s5,8
ffffffffc0206994:	fcfbe9e3          	bltu	s7,a5,ffffffffc0206966 <do_execve+0x52e>
ffffffffc0206998:	0009b783          	ld	a5,0(s3)
ffffffffc020699c:	fe9d2e23          	sw	s1,-4(s10)
ffffffffc02069a0:	12000613          	li	a2,288
ffffffffc02069a4:	73c4                	ld	s1,160(a5)
ffffffffc02069a6:	4581                	li	a1,0
ffffffffc02069a8:	ffcd0a13          	addi	s4,s10,-4
ffffffffc02069ac:	1004b903          	ld	s2,256(s1)
ffffffffc02069b0:	8526                	mv	a0,s1
ffffffffc02069b2:	265040ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc02069b6:	676e                	ld	a4,216(sp)
ffffffffc02069b8:	edf97793          	andi	a5,s2,-289
ffffffffc02069bc:	0207e793          	ori	a5,a5,32
ffffffffc02069c0:	0144b823          	sd	s4,16(s1)
ffffffffc02069c4:	10e4b423          	sd	a4,264(s1)
ffffffffc02069c8:	10f4b023          	sd	a5,256(s1)
ffffffffc02069cc:	67c2                	ld	a5,16(sp)
ffffffffc02069ce:	147d                	addi	s0,s0,-1
ffffffffc02069d0:	ff0c0493          	addi	s1,s8,-16
ffffffffc02069d4:	02079713          	slli	a4,a5,0x20
ffffffffc02069d8:	040e                	slli	s0,s0,0x3
ffffffffc02069da:	94e6                	add	s1,s1,s9
ffffffffc02069dc:	01d75793          	srli	a5,a4,0x1d
ffffffffc02069e0:	9462                	add	s0,s0,s8
ffffffffc02069e2:	8c9d                	sub	s1,s1,a5
ffffffffc02069e4:	6008                	ld	a0,0(s0)
ffffffffc02069e6:	1461                	addi	s0,s0,-8
ffffffffc02069e8:	e56fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02069ec:	fe941ce3          	bne	s0,s1,ffffffffc02069e4 <do_execve+0x5ac>
ffffffffc02069f0:	0009b403          	ld	s0,0(s3)
ffffffffc02069f4:	4641                	li	a2,16
ffffffffc02069f6:	4581                	li	a1,0
ffffffffc02069f8:	0b440413          	addi	s0,s0,180
ffffffffc02069fc:	8522                	mv	a0,s0
ffffffffc02069fe:	219040ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0206a02:	463d                	li	a2,15
ffffffffc0206a04:	18ac                	addi	a1,sp,120
ffffffffc0206a06:	8522                	mv	a0,s0
ffffffffc0206a08:	261040ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc0206a0c:	b10d                	j	ffffffffc020662e <do_execve+0x1f6>
ffffffffc0206a0e:	018a3503          	ld	a0,24(s4)
ffffffffc0206a12:	5de1                	li	s11,-8
ffffffffc0206a14:	fc7fe0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc0206a18:	8552                	mv	a0,s4
ffffffffc0206a1a:	a9afd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0206a1e:	b6b5                	j	ffffffffc020658a <do_execve+0x152>
ffffffffc0206a20:	0026e693          	ori	a3,a3,2
ffffffffc0206a24:	d4079de3          	bnez	a5,ffffffffc020677e <do_execve+0x346>
ffffffffc0206a28:	47dd                	li	a5,23
ffffffffc0206a2a:	ecbe                	sd	a5,88(sp)
ffffffffc0206a2c:	b38d                	j	ffffffffc020678e <do_execve+0x356>
ffffffffc0206a2e:	10879c63          	bne	a5,s0,ffffffffc0206b46 <do_execve+0x70e>
ffffffffc0206a32:	8922                	mv	s2,s0
ffffffffc0206a34:	e2997ce3          	bgeu	s2,s1,ffffffffc020686c <do_execve+0x434>
ffffffffc0206a38:	6de6                	ld	s11,88(sp)
ffffffffc0206a3a:	6c85                	lui	s9,0x1
ffffffffc0206a3c:	00090b17          	auipc	s6,0x90
ffffffffc0206a40:	e64b0b13          	addi	s6,s6,-412 # ffffffffc02968a0 <npage>
ffffffffc0206a44:	00090a97          	auipc	s5,0x90
ffffffffc0206a48:	e74a8a93          	addi	s5,s5,-396 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206a4c:	a889                	j	ffffffffc0206a9e <do_execve+0x666>
ffffffffc0206a4e:	40890533          	sub	a0,s2,s0
ffffffffc0206a52:	9466                	add	s0,s0,s9
ffffffffc0206a54:	41240633          	sub	a2,s0,s2
ffffffffc0206a58:	0084f463          	bgeu	s1,s0,ffffffffc0206a60 <do_execve+0x628>
ffffffffc0206a5c:	41248633          	sub	a2,s1,s2
ffffffffc0206a60:	00090797          	auipc	a5,0x90
ffffffffc0206a64:	e4878793          	addi	a5,a5,-440 # ffffffffc02968a8 <pages>
ffffffffc0206a68:	639c                	ld	a5,0(a5)
ffffffffc0206a6a:	00009717          	auipc	a4,0x9
ffffffffc0206a6e:	cee70713          	addi	a4,a4,-786 # ffffffffc020f758 <nbase>
ffffffffc0206a72:	6314                	ld	a3,0(a4)
ffffffffc0206a74:	40fd07b3          	sub	a5,s10,a5
ffffffffc0206a78:	8799                	srai	a5,a5,0x6
ffffffffc0206a7a:	97b6                	add	a5,a5,a3
ffffffffc0206a7c:	76c2                	ld	a3,48(sp)
ffffffffc0206a7e:	000b3703          	ld	a4,0(s6)
ffffffffc0206a82:	8efd                	and	a3,a3,a5
ffffffffc0206a84:	07b2                	slli	a5,a5,0xc
ffffffffc0206a86:	12e6f863          	bgeu	a3,a4,ffffffffc0206bb6 <do_execve+0x77e>
ffffffffc0206a8a:	000ab703          	ld	a4,0(s5)
ffffffffc0206a8e:	9932                	add	s2,s2,a2
ffffffffc0206a90:	4581                	li	a1,0
ffffffffc0206a92:	97ba                	add	a5,a5,a4
ffffffffc0206a94:	953e                	add	a0,a0,a5
ffffffffc0206a96:	181040ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0206a9a:	dc9979e3          	bgeu	s2,s1,ffffffffc020686c <do_execve+0x434>
ffffffffc0206a9e:	018a3503          	ld	a0,24(s4)
ffffffffc0206aa2:	866e                	mv	a2,s11
ffffffffc0206aa4:	85a2                	mv	a1,s0
ffffffffc0206aa6:	fdbfc0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc0206aaa:	8d2a                	mv	s10,a0
ffffffffc0206aac:	f14d                	bnez	a0,ffffffffc0206a4e <do_execve+0x616>
ffffffffc0206aae:	8552                	mv	a0,s4
ffffffffc0206ab0:	7ce2                	ld	s9,56(sp)
ffffffffc0206ab2:	7d86                	ld	s11,96(sp)
ffffffffc0206ab4:	6406                	ld	s0,64(sp)
ffffffffc0206ab6:	b9afd0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc0206aba:	018a3503          	ld	a0,24(s4)
ffffffffc0206abe:	f1dfe0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc0206ac2:	8552                	mv	a0,s4
ffffffffc0206ac4:	9f0fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0206ac8:	67a2                	ld	a5,8(sp)
ffffffffc0206aca:	f00781e3          	beqz	a5,ffffffffc02069cc <do_execve+0x594>
ffffffffc0206ace:	6da2                	ld	s11,8(sp)
ffffffffc0206ad0:	bc6d                	j	ffffffffc020658a <do_execve+0x152>
ffffffffc0206ad2:	5df5                	li	s11,-3
ffffffffc0206ad4:	bea9                	j	ffffffffc020662e <do_execve+0x1f6>
ffffffffc0206ad6:	64ea                	ld	s1,152(sp)
ffffffffc0206ad8:	76ca                	ld	a3,176(sp)
ffffffffc0206ada:	94b6                	add	s1,s1,a3
ffffffffc0206adc:	f4897ce3          	bgeu	s2,s0,ffffffffc0206a34 <do_execve+0x5fc>
ffffffffc0206ae0:	d92486e3          	beq	s1,s2,ffffffffc020686c <do_execve+0x434>
ffffffffc0206ae4:	6505                	lui	a0,0x1
ffffffffc0206ae6:	954a                	add	a0,a0,s2
ffffffffc0206ae8:	8d01                	sub	a0,a0,s0
ffffffffc0206aea:	41248ab3          	sub	s5,s1,s2
ffffffffc0206aee:	0084e463          	bltu	s1,s0,ffffffffc0206af6 <do_execve+0x6be>
ffffffffc0206af2:	41240ab3          	sub	s5,s0,s2
ffffffffc0206af6:	00090797          	auipc	a5,0x90
ffffffffc0206afa:	db278793          	addi	a5,a5,-590 # ffffffffc02968a8 <pages>
ffffffffc0206afe:	6394                	ld	a3,0(a5)
ffffffffc0206b00:	00009797          	auipc	a5,0x9
ffffffffc0206b04:	c5878793          	addi	a5,a5,-936 # ffffffffc020f758 <nbase>
ffffffffc0206b08:	638c                	ld	a1,0(a5)
ffffffffc0206b0a:	40dd06b3          	sub	a3,s10,a3
ffffffffc0206b0e:	77c2                	ld	a5,48(sp)
ffffffffc0206b10:	8699                	srai	a3,a3,0x6
ffffffffc0206b12:	96ae                	add	a3,a3,a1
ffffffffc0206b14:	00f6f5b3          	and	a1,a3,a5
ffffffffc0206b18:	00090617          	auipc	a2,0x90
ffffffffc0206b1c:	d8863603          	ld	a2,-632(a2) # ffffffffc02968a0 <npage>
ffffffffc0206b20:	06b2                	slli	a3,a3,0xc
ffffffffc0206b22:	08c5fb63          	bgeu	a1,a2,ffffffffc0206bb8 <do_execve+0x780>
ffffffffc0206b26:	00090617          	auipc	a2,0x90
ffffffffc0206b2a:	d9263603          	ld	a2,-622(a2) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206b2e:	96b2                	add	a3,a3,a2
ffffffffc0206b30:	4581                	li	a1,0
ffffffffc0206b32:	8656                	mv	a2,s5
ffffffffc0206b34:	9536                	add	a0,a0,a3
ffffffffc0206b36:	0e1040ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0206b3a:	012a87b3          	add	a5,s5,s2
ffffffffc0206b3e:	ee84f8e3          	bgeu	s1,s0,ffffffffc0206a2e <do_execve+0x5f6>
ffffffffc0206b42:	d2f485e3          	beq	s1,a5,ffffffffc020686c <do_execve+0x434>
ffffffffc0206b46:	00007697          	auipc	a3,0x7
ffffffffc0206b4a:	ada68693          	addi	a3,a3,-1318 # ffffffffc020d620 <CSWTCH.79+0x328>
ffffffffc0206b4e:	00005617          	auipc	a2,0x5
ffffffffc0206b52:	daa60613          	addi	a2,a2,-598 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0206b56:	34000593          	li	a1,832
ffffffffc0206b5a:	00007517          	auipc	a0,0x7
ffffffffc0206b5e:	8ae50513          	addi	a0,a0,-1874 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206b62:	93df90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206b66:	5df5                	li	s11,-3
ffffffffc0206b68:	aa0a1de3          	bnez	s4,ffffffffc0206622 <do_execve+0x1ea>
ffffffffc0206b6c:	b4c9                	j	ffffffffc020662e <do_execve+0x1f6>
ffffffffc0206b6e:	f60a02e3          	beqz	s4,ffffffffc0206ad2 <do_execve+0x69a>
ffffffffc0206b72:	038a0513          	addi	a0,s4,56
ffffffffc0206b76:	949fd0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0206b7a:	5df5                	li	s11,-3
ffffffffc0206b7c:	040a2823          	sw	zero,80(s4)
ffffffffc0206b80:	b47d                	j	ffffffffc020662e <do_execve+0x1f6>
ffffffffc0206b82:	57f1                	li	a5,-4
ffffffffc0206b84:	84ca                	mv	s1,s2
ffffffffc0206b86:	846e                	mv	s0,s11
ffffffffc0206b88:	e43e                	sd	a5,8(sp)
ffffffffc0206b8a:	b7b9                	j	ffffffffc0206ad8 <do_execve+0x6a0>
ffffffffc0206b8c:	57e1                	li	a5,-8
ffffffffc0206b8e:	7ce2                	ld	s9,56(sp)
ffffffffc0206b90:	6406                	ld	s0,64(sp)
ffffffffc0206b92:	e43e                	sd	a5,8(sp)
ffffffffc0206b94:	be45                	j	ffffffffc0206744 <do_execve+0x30c>
ffffffffc0206b96:	00006617          	auipc	a2,0x6
ffffffffc0206b9a:	92a60613          	addi	a2,a2,-1750 # ffffffffc020c4c0 <default_pmm_manager+0xe0>
ffffffffc0206b9e:	35f00593          	li	a1,863
ffffffffc0206ba2:	00007517          	auipc	a0,0x7
ffffffffc0206ba6:	86650513          	addi	a0,a0,-1946 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206baa:	8f5f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206bae:	8daa                	mv	s11,a0
ffffffffc0206bb0:	bae9                	j	ffffffffc020658a <do_execve+0x152>
ffffffffc0206bb2:	8daa                	mv	s11,a0
ffffffffc0206bb4:	bad9                	j	ffffffffc020658a <do_execve+0x152>
ffffffffc0206bb6:	86be                	mv	a3,a5
ffffffffc0206bb8:	00006617          	auipc	a2,0x6
ffffffffc0206bbc:	86060613          	addi	a2,a2,-1952 # ffffffffc020c418 <default_pmm_manager+0x38>
ffffffffc0206bc0:	07100593          	li	a1,113
ffffffffc0206bc4:	00006517          	auipc	a0,0x6
ffffffffc0206bc8:	87c50513          	addi	a0,a0,-1924 # ffffffffc020c440 <default_pmm_manager+0x60>
ffffffffc0206bcc:	8d3f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206bd0:	00007697          	auipc	a3,0x7
ffffffffc0206bd4:	b6868693          	addi	a3,a3,-1176 # ffffffffc020d738 <CSWTCH.79+0x440>
ffffffffc0206bd8:	00005617          	auipc	a2,0x5
ffffffffc0206bdc:	d2060613          	addi	a2,a2,-736 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0206be0:	35a00593          	li	a1,858
ffffffffc0206be4:	00007517          	auipc	a0,0x7
ffffffffc0206be8:	82450513          	addi	a0,a0,-2012 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206bec:	8b3f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206bf0:	00007697          	auipc	a3,0x7
ffffffffc0206bf4:	b0068693          	addi	a3,a3,-1280 # ffffffffc020d6f0 <CSWTCH.79+0x3f8>
ffffffffc0206bf8:	00005617          	auipc	a2,0x5
ffffffffc0206bfc:	d0060613          	addi	a2,a2,-768 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0206c00:	35900593          	li	a1,857
ffffffffc0206c04:	00007517          	auipc	a0,0x7
ffffffffc0206c08:	80450513          	addi	a0,a0,-2044 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206c0c:	893f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c10:	00007697          	auipc	a3,0x7
ffffffffc0206c14:	a9868693          	addi	a3,a3,-1384 # ffffffffc020d6a8 <CSWTCH.79+0x3b0>
ffffffffc0206c18:	00005617          	auipc	a2,0x5
ffffffffc0206c1c:	ce060613          	addi	a2,a2,-800 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0206c20:	35800593          	li	a1,856
ffffffffc0206c24:	00006517          	auipc	a0,0x6
ffffffffc0206c28:	7e450513          	addi	a0,a0,2020 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206c2c:	873f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c30:	00007697          	auipc	a3,0x7
ffffffffc0206c34:	a3068693          	addi	a3,a3,-1488 # ffffffffc020d660 <CSWTCH.79+0x368>
ffffffffc0206c38:	00005617          	auipc	a2,0x5
ffffffffc0206c3c:	cc060613          	addi	a2,a2,-832 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0206c40:	35700593          	li	a1,855
ffffffffc0206c44:	00006517          	auipc	a0,0x6
ffffffffc0206c48:	7c450513          	addi	a0,a0,1988 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206c4c:	853f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206c50 <user_main>:
ffffffffc0206c50:	7179                	addi	sp,sp,-48
ffffffffc0206c52:	e84a                	sd	s2,16(sp)
ffffffffc0206c54:	00090917          	auipc	s2,0x90
ffffffffc0206c58:	c6c90913          	addi	s2,s2,-916 # ffffffffc02968c0 <current>
ffffffffc0206c5c:	00093783          	ld	a5,0(s2)
ffffffffc0206c60:	00007617          	auipc	a2,0x7
ffffffffc0206c64:	b2060613          	addi	a2,a2,-1248 # ffffffffc020d780 <CSWTCH.79+0x488>
ffffffffc0206c68:	00007517          	auipc	a0,0x7
ffffffffc0206c6c:	b2050513          	addi	a0,a0,-1248 # ffffffffc020d788 <CSWTCH.79+0x490>
ffffffffc0206c70:	43cc                	lw	a1,4(a5)
ffffffffc0206c72:	f406                	sd	ra,40(sp)
ffffffffc0206c74:	f022                	sd	s0,32(sp)
ffffffffc0206c76:	ec26                	sd	s1,24(sp)
ffffffffc0206c78:	e032                	sd	a2,0(sp)
ffffffffc0206c7a:	e402                	sd	zero,8(sp)
ffffffffc0206c7c:	d2af90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206c80:	6782                	ld	a5,0(sp)
ffffffffc0206c82:	cfb9                	beqz	a5,ffffffffc0206ce0 <user_main+0x90>
ffffffffc0206c84:	003c                	addi	a5,sp,8
ffffffffc0206c86:	4401                	li	s0,0
ffffffffc0206c88:	6398                	ld	a4,0(a5)
ffffffffc0206c8a:	0405                	addi	s0,s0,1
ffffffffc0206c8c:	07a1                	addi	a5,a5,8
ffffffffc0206c8e:	ff6d                	bnez	a4,ffffffffc0206c88 <user_main+0x38>
ffffffffc0206c90:	00093783          	ld	a5,0(s2)
ffffffffc0206c94:	12000613          	li	a2,288
ffffffffc0206c98:	6b84                	ld	s1,16(a5)
ffffffffc0206c9a:	73cc                	ld	a1,160(a5)
ffffffffc0206c9c:	6789                	lui	a5,0x2
ffffffffc0206c9e:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0206ca2:	94be                	add	s1,s1,a5
ffffffffc0206ca4:	8526                	mv	a0,s1
ffffffffc0206ca6:	7c2040ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc0206caa:	00093783          	ld	a5,0(s2)
ffffffffc0206cae:	860a                	mv	a2,sp
ffffffffc0206cb0:	0004059b          	sext.w	a1,s0
ffffffffc0206cb4:	f3c4                	sd	s1,160(a5)
ffffffffc0206cb6:	00007517          	auipc	a0,0x7
ffffffffc0206cba:	aca50513          	addi	a0,a0,-1334 # ffffffffc020d780 <CSWTCH.79+0x488>
ffffffffc0206cbe:	f7aff0ef          	jal	ra,ffffffffc0206438 <do_execve>
ffffffffc0206cc2:	8126                	mv	sp,s1
ffffffffc0206cc4:	d8cfa06f          	j	ffffffffc0201250 <__trapret>
ffffffffc0206cc8:	00007617          	auipc	a2,0x7
ffffffffc0206ccc:	ae860613          	addi	a2,a2,-1304 # ffffffffc020d7b0 <CSWTCH.79+0x4b8>
ffffffffc0206cd0:	4a100593          	li	a1,1185
ffffffffc0206cd4:	00006517          	auipc	a0,0x6
ffffffffc0206cd8:	73450513          	addi	a0,a0,1844 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206cdc:	fc2f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206ce0:	4401                	li	s0,0
ffffffffc0206ce2:	b77d                	j	ffffffffc0206c90 <user_main+0x40>

ffffffffc0206ce4 <do_yield>:
ffffffffc0206ce4:	00090797          	auipc	a5,0x90
ffffffffc0206ce8:	bdc7b783          	ld	a5,-1060(a5) # ffffffffc02968c0 <current>
ffffffffc0206cec:	4705                	li	a4,1
ffffffffc0206cee:	ef98                	sd	a4,24(a5)
ffffffffc0206cf0:	4501                	li	a0,0
ffffffffc0206cf2:	8082                	ret

ffffffffc0206cf4 <do_wait>:
ffffffffc0206cf4:	1101                	addi	sp,sp,-32
ffffffffc0206cf6:	e822                	sd	s0,16(sp)
ffffffffc0206cf8:	e426                	sd	s1,8(sp)
ffffffffc0206cfa:	ec06                	sd	ra,24(sp)
ffffffffc0206cfc:	842e                	mv	s0,a1
ffffffffc0206cfe:	84aa                	mv	s1,a0
ffffffffc0206d00:	c999                	beqz	a1,ffffffffc0206d16 <do_wait+0x22>
ffffffffc0206d02:	00090797          	auipc	a5,0x90
ffffffffc0206d06:	bbe7b783          	ld	a5,-1090(a5) # ffffffffc02968c0 <current>
ffffffffc0206d0a:	7788                	ld	a0,40(a5)
ffffffffc0206d0c:	4685                	li	a3,1
ffffffffc0206d0e:	4611                	li	a2,4
ffffffffc0206d10:	ce0fd0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc0206d14:	c909                	beqz	a0,ffffffffc0206d26 <do_wait+0x32>
ffffffffc0206d16:	85a2                	mv	a1,s0
ffffffffc0206d18:	6442                	ld	s0,16(sp)
ffffffffc0206d1a:	60e2                	ld	ra,24(sp)
ffffffffc0206d1c:	8526                	mv	a0,s1
ffffffffc0206d1e:	64a2                	ld	s1,8(sp)
ffffffffc0206d20:	6105                	addi	sp,sp,32
ffffffffc0206d22:	bf4ff06f          	j	ffffffffc0206116 <do_wait.part.0>
ffffffffc0206d26:	60e2                	ld	ra,24(sp)
ffffffffc0206d28:	6442                	ld	s0,16(sp)
ffffffffc0206d2a:	64a2                	ld	s1,8(sp)
ffffffffc0206d2c:	5575                	li	a0,-3
ffffffffc0206d2e:	6105                	addi	sp,sp,32
ffffffffc0206d30:	8082                	ret

ffffffffc0206d32 <do_kill>:
ffffffffc0206d32:	1141                	addi	sp,sp,-16
ffffffffc0206d34:	6789                	lui	a5,0x2
ffffffffc0206d36:	e406                	sd	ra,8(sp)
ffffffffc0206d38:	e022                	sd	s0,0(sp)
ffffffffc0206d3a:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206d3e:	17f9                	addi	a5,a5,-2
ffffffffc0206d40:	02e7e963          	bltu	a5,a4,ffffffffc0206d72 <do_kill+0x40>
ffffffffc0206d44:	842a                	mv	s0,a0
ffffffffc0206d46:	45a9                	li	a1,10
ffffffffc0206d48:	2501                	sext.w	a0,a0
ffffffffc0206d4a:	198040ef          	jal	ra,ffffffffc020aee2 <hash32>
ffffffffc0206d4e:	02051793          	slli	a5,a0,0x20
ffffffffc0206d52:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0206d56:	0008b797          	auipc	a5,0x8b
ffffffffc0206d5a:	a6a78793          	addi	a5,a5,-1430 # ffffffffc02917c0 <hash_list>
ffffffffc0206d5e:	953e                	add	a0,a0,a5
ffffffffc0206d60:	87aa                	mv	a5,a0
ffffffffc0206d62:	a029                	j	ffffffffc0206d6c <do_kill+0x3a>
ffffffffc0206d64:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0206d68:	00870b63          	beq	a4,s0,ffffffffc0206d7e <do_kill+0x4c>
ffffffffc0206d6c:	679c                	ld	a5,8(a5)
ffffffffc0206d6e:	fef51be3          	bne	a0,a5,ffffffffc0206d64 <do_kill+0x32>
ffffffffc0206d72:	5475                	li	s0,-3
ffffffffc0206d74:	60a2                	ld	ra,8(sp)
ffffffffc0206d76:	8522                	mv	a0,s0
ffffffffc0206d78:	6402                	ld	s0,0(sp)
ffffffffc0206d7a:	0141                	addi	sp,sp,16
ffffffffc0206d7c:	8082                	ret
ffffffffc0206d7e:	fd87a703          	lw	a4,-40(a5)
ffffffffc0206d82:	00177693          	andi	a3,a4,1
ffffffffc0206d86:	e295                	bnez	a3,ffffffffc0206daa <do_kill+0x78>
ffffffffc0206d88:	4bd4                	lw	a3,20(a5)
ffffffffc0206d8a:	00176713          	ori	a4,a4,1
ffffffffc0206d8e:	fce7ac23          	sw	a4,-40(a5)
ffffffffc0206d92:	4401                	li	s0,0
ffffffffc0206d94:	fe06d0e3          	bgez	a3,ffffffffc0206d74 <do_kill+0x42>
ffffffffc0206d98:	f2878513          	addi	a0,a5,-216
ffffffffc0206d9c:	45a000ef          	jal	ra,ffffffffc02071f6 <wakeup_proc>
ffffffffc0206da0:	60a2                	ld	ra,8(sp)
ffffffffc0206da2:	8522                	mv	a0,s0
ffffffffc0206da4:	6402                	ld	s0,0(sp)
ffffffffc0206da6:	0141                	addi	sp,sp,16
ffffffffc0206da8:	8082                	ret
ffffffffc0206daa:	545d                	li	s0,-9
ffffffffc0206dac:	b7e1                	j	ffffffffc0206d74 <do_kill+0x42>

ffffffffc0206dae <proc_init>:
ffffffffc0206dae:	1101                	addi	sp,sp,-32
ffffffffc0206db0:	e426                	sd	s1,8(sp)
ffffffffc0206db2:	0008f797          	auipc	a5,0x8f
ffffffffc0206db6:	a0e78793          	addi	a5,a5,-1522 # ffffffffc02957c0 <proc_list>
ffffffffc0206dba:	ec06                	sd	ra,24(sp)
ffffffffc0206dbc:	e822                	sd	s0,16(sp)
ffffffffc0206dbe:	e04a                	sd	s2,0(sp)
ffffffffc0206dc0:	0008b497          	auipc	s1,0x8b
ffffffffc0206dc4:	a0048493          	addi	s1,s1,-1536 # ffffffffc02917c0 <hash_list>
ffffffffc0206dc8:	e79c                	sd	a5,8(a5)
ffffffffc0206dca:	e39c                	sd	a5,0(a5)
ffffffffc0206dcc:	0008f717          	auipc	a4,0x8f
ffffffffc0206dd0:	9f470713          	addi	a4,a4,-1548 # ffffffffc02957c0 <proc_list>
ffffffffc0206dd4:	87a6                	mv	a5,s1
ffffffffc0206dd6:	e79c                	sd	a5,8(a5)
ffffffffc0206dd8:	e39c                	sd	a5,0(a5)
ffffffffc0206dda:	07c1                	addi	a5,a5,16
ffffffffc0206ddc:	fef71de3          	bne	a4,a5,ffffffffc0206dd6 <proc_init+0x28>
ffffffffc0206de0:	b53fe0ef          	jal	ra,ffffffffc0205932 <alloc_proc>
ffffffffc0206de4:	00090917          	auipc	s2,0x90
ffffffffc0206de8:	ae490913          	addi	s2,s2,-1308 # ffffffffc02968c8 <idleproc>
ffffffffc0206dec:	00a93023          	sd	a0,0(s2)
ffffffffc0206df0:	842a                	mv	s0,a0
ffffffffc0206df2:	12050863          	beqz	a0,ffffffffc0206f22 <proc_init+0x174>
ffffffffc0206df6:	4789                	li	a5,2
ffffffffc0206df8:	e11c                	sd	a5,0(a0)
ffffffffc0206dfa:	0000a797          	auipc	a5,0xa
ffffffffc0206dfe:	20678793          	addi	a5,a5,518 # ffffffffc0211000 <bootstack>
ffffffffc0206e02:	e91c                	sd	a5,16(a0)
ffffffffc0206e04:	4785                	li	a5,1
ffffffffc0206e06:	ed1c                	sd	a5,24(a0)
ffffffffc0206e08:	b24fe0ef          	jal	ra,ffffffffc020512c <files_create>
ffffffffc0206e0c:	14a43423          	sd	a0,328(s0)
ffffffffc0206e10:	0e050d63          	beqz	a0,ffffffffc0206f0a <proc_init+0x15c>
ffffffffc0206e14:	00093403          	ld	s0,0(s2)
ffffffffc0206e18:	4641                	li	a2,16
ffffffffc0206e1a:	4581                	li	a1,0
ffffffffc0206e1c:	14843703          	ld	a4,328(s0)
ffffffffc0206e20:	0b440413          	addi	s0,s0,180
ffffffffc0206e24:	8522                	mv	a0,s0
ffffffffc0206e26:	4b1c                	lw	a5,16(a4)
ffffffffc0206e28:	2785                	addiw	a5,a5,1
ffffffffc0206e2a:	cb1c                	sw	a5,16(a4)
ffffffffc0206e2c:	5ea040ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0206e30:	463d                	li	a2,15
ffffffffc0206e32:	00007597          	auipc	a1,0x7
ffffffffc0206e36:	9de58593          	addi	a1,a1,-1570 # ffffffffc020d810 <CSWTCH.79+0x518>
ffffffffc0206e3a:	8522                	mv	a0,s0
ffffffffc0206e3c:	62c040ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc0206e40:	00090717          	auipc	a4,0x90
ffffffffc0206e44:	a9870713          	addi	a4,a4,-1384 # ffffffffc02968d8 <nr_process>
ffffffffc0206e48:	431c                	lw	a5,0(a4)
ffffffffc0206e4a:	00093683          	ld	a3,0(s2)
ffffffffc0206e4e:	4601                	li	a2,0
ffffffffc0206e50:	2785                	addiw	a5,a5,1
ffffffffc0206e52:	4581                	li	a1,0
ffffffffc0206e54:	fffff517          	auipc	a0,0xfffff
ffffffffc0206e58:	49450513          	addi	a0,a0,1172 # ffffffffc02062e8 <init_main>
ffffffffc0206e5c:	c31c                	sw	a5,0(a4)
ffffffffc0206e5e:	00090797          	auipc	a5,0x90
ffffffffc0206e62:	a6d7b123          	sd	a3,-1438(a5) # ffffffffc02968c0 <current>
ffffffffc0206e66:	8feff0ef          	jal	ra,ffffffffc0205f64 <kernel_thread>
ffffffffc0206e6a:	842a                	mv	s0,a0
ffffffffc0206e6c:	08a05363          	blez	a0,ffffffffc0206ef2 <proc_init+0x144>
ffffffffc0206e70:	6789                	lui	a5,0x2
ffffffffc0206e72:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206e76:	17f9                	addi	a5,a5,-2
ffffffffc0206e78:	2501                	sext.w	a0,a0
ffffffffc0206e7a:	02e7e363          	bltu	a5,a4,ffffffffc0206ea0 <proc_init+0xf2>
ffffffffc0206e7e:	45a9                	li	a1,10
ffffffffc0206e80:	062040ef          	jal	ra,ffffffffc020aee2 <hash32>
ffffffffc0206e84:	02051793          	slli	a5,a0,0x20
ffffffffc0206e88:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0206e8c:	96a6                	add	a3,a3,s1
ffffffffc0206e8e:	87b6                	mv	a5,a3
ffffffffc0206e90:	a029                	j	ffffffffc0206e9a <proc_init+0xec>
ffffffffc0206e92:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_bin_swap_img_size-0x5dd4>
ffffffffc0206e96:	04870b63          	beq	a4,s0,ffffffffc0206eec <proc_init+0x13e>
ffffffffc0206e9a:	679c                	ld	a5,8(a5)
ffffffffc0206e9c:	fef69be3          	bne	a3,a5,ffffffffc0206e92 <proc_init+0xe4>
ffffffffc0206ea0:	4781                	li	a5,0
ffffffffc0206ea2:	0b478493          	addi	s1,a5,180
ffffffffc0206ea6:	4641                	li	a2,16
ffffffffc0206ea8:	4581                	li	a1,0
ffffffffc0206eaa:	00090417          	auipc	s0,0x90
ffffffffc0206eae:	a2640413          	addi	s0,s0,-1498 # ffffffffc02968d0 <initproc>
ffffffffc0206eb2:	8526                	mv	a0,s1
ffffffffc0206eb4:	e01c                	sd	a5,0(s0)
ffffffffc0206eb6:	560040ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0206eba:	463d                	li	a2,15
ffffffffc0206ebc:	00007597          	auipc	a1,0x7
ffffffffc0206ec0:	97c58593          	addi	a1,a1,-1668 # ffffffffc020d838 <CSWTCH.79+0x540>
ffffffffc0206ec4:	8526                	mv	a0,s1
ffffffffc0206ec6:	5a2040ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc0206eca:	00093783          	ld	a5,0(s2)
ffffffffc0206ece:	c7d1                	beqz	a5,ffffffffc0206f5a <proc_init+0x1ac>
ffffffffc0206ed0:	43dc                	lw	a5,4(a5)
ffffffffc0206ed2:	e7c1                	bnez	a5,ffffffffc0206f5a <proc_init+0x1ac>
ffffffffc0206ed4:	601c                	ld	a5,0(s0)
ffffffffc0206ed6:	c3b5                	beqz	a5,ffffffffc0206f3a <proc_init+0x18c>
ffffffffc0206ed8:	43d8                	lw	a4,4(a5)
ffffffffc0206eda:	4785                	li	a5,1
ffffffffc0206edc:	04f71f63          	bne	a4,a5,ffffffffc0206f3a <proc_init+0x18c>
ffffffffc0206ee0:	60e2                	ld	ra,24(sp)
ffffffffc0206ee2:	6442                	ld	s0,16(sp)
ffffffffc0206ee4:	64a2                	ld	s1,8(sp)
ffffffffc0206ee6:	6902                	ld	s2,0(sp)
ffffffffc0206ee8:	6105                	addi	sp,sp,32
ffffffffc0206eea:	8082                	ret
ffffffffc0206eec:	f2878793          	addi	a5,a5,-216
ffffffffc0206ef0:	bf4d                	j	ffffffffc0206ea2 <proc_init+0xf4>
ffffffffc0206ef2:	00007617          	auipc	a2,0x7
ffffffffc0206ef6:	92660613          	addi	a2,a2,-1754 # ffffffffc020d818 <CSWTCH.79+0x520>
ffffffffc0206efa:	4ed00593          	li	a1,1261
ffffffffc0206efe:	00006517          	auipc	a0,0x6
ffffffffc0206f02:	50a50513          	addi	a0,a0,1290 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206f06:	d98f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f0a:	00007617          	auipc	a2,0x7
ffffffffc0206f0e:	8de60613          	addi	a2,a2,-1826 # ffffffffc020d7e8 <CSWTCH.79+0x4f0>
ffffffffc0206f12:	4e100593          	li	a1,1249
ffffffffc0206f16:	00006517          	auipc	a0,0x6
ffffffffc0206f1a:	4f250513          	addi	a0,a0,1266 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206f1e:	d80f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f22:	00007617          	auipc	a2,0x7
ffffffffc0206f26:	8ae60613          	addi	a2,a2,-1874 # ffffffffc020d7d0 <CSWTCH.79+0x4d8>
ffffffffc0206f2a:	4d700593          	li	a1,1239
ffffffffc0206f2e:	00006517          	auipc	a0,0x6
ffffffffc0206f32:	4da50513          	addi	a0,a0,1242 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206f36:	d68f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f3a:	00007697          	auipc	a3,0x7
ffffffffc0206f3e:	92e68693          	addi	a3,a3,-1746 # ffffffffc020d868 <CSWTCH.79+0x570>
ffffffffc0206f42:	00005617          	auipc	a2,0x5
ffffffffc0206f46:	9b660613          	addi	a2,a2,-1610 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0206f4a:	4f400593          	li	a1,1268
ffffffffc0206f4e:	00006517          	auipc	a0,0x6
ffffffffc0206f52:	4ba50513          	addi	a0,a0,1210 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206f56:	d48f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f5a:	00007697          	auipc	a3,0x7
ffffffffc0206f5e:	8e668693          	addi	a3,a3,-1818 # ffffffffc020d840 <CSWTCH.79+0x548>
ffffffffc0206f62:	00005617          	auipc	a2,0x5
ffffffffc0206f66:	99660613          	addi	a2,a2,-1642 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0206f6a:	4f300593          	li	a1,1267
ffffffffc0206f6e:	00006517          	auipc	a0,0x6
ffffffffc0206f72:	49a50513          	addi	a0,a0,1178 # ffffffffc020d408 <CSWTCH.79+0x110>
ffffffffc0206f76:	d28f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206f7a <cpu_idle>:
ffffffffc0206f7a:	1141                	addi	sp,sp,-16
ffffffffc0206f7c:	e022                	sd	s0,0(sp)
ffffffffc0206f7e:	e406                	sd	ra,8(sp)
ffffffffc0206f80:	00090417          	auipc	s0,0x90
ffffffffc0206f84:	94040413          	addi	s0,s0,-1728 # ffffffffc02968c0 <current>
ffffffffc0206f88:	6018                	ld	a4,0(s0)
ffffffffc0206f8a:	6f1c                	ld	a5,24(a4)
ffffffffc0206f8c:	dffd                	beqz	a5,ffffffffc0206f8a <cpu_idle+0x10>
ffffffffc0206f8e:	31a000ef          	jal	ra,ffffffffc02072a8 <schedule>
ffffffffc0206f92:	bfdd                	j	ffffffffc0206f88 <cpu_idle+0xe>

ffffffffc0206f94 <lab6_set_priority>:
ffffffffc0206f94:	1141                	addi	sp,sp,-16
ffffffffc0206f96:	e022                	sd	s0,0(sp)
ffffffffc0206f98:	85aa                	mv	a1,a0
ffffffffc0206f9a:	842a                	mv	s0,a0
ffffffffc0206f9c:	00007517          	auipc	a0,0x7
ffffffffc0206fa0:	8f450513          	addi	a0,a0,-1804 # ffffffffc020d890 <CSWTCH.79+0x598>
ffffffffc0206fa4:	e406                	sd	ra,8(sp)
ffffffffc0206fa6:	a00f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206faa:	00090797          	auipc	a5,0x90
ffffffffc0206fae:	9167b783          	ld	a5,-1770(a5) # ffffffffc02968c0 <current>
ffffffffc0206fb2:	e801                	bnez	s0,ffffffffc0206fc2 <lab6_set_priority+0x2e>
ffffffffc0206fb4:	60a2                	ld	ra,8(sp)
ffffffffc0206fb6:	6402                	ld	s0,0(sp)
ffffffffc0206fb8:	4705                	li	a4,1
ffffffffc0206fba:	14e7a223          	sw	a4,324(a5)
ffffffffc0206fbe:	0141                	addi	sp,sp,16
ffffffffc0206fc0:	8082                	ret
ffffffffc0206fc2:	60a2                	ld	ra,8(sp)
ffffffffc0206fc4:	1487a223          	sw	s0,324(a5)
ffffffffc0206fc8:	6402                	ld	s0,0(sp)
ffffffffc0206fca:	0141                	addi	sp,sp,16
ffffffffc0206fcc:	8082                	ret

ffffffffc0206fce <do_sleep>:
ffffffffc0206fce:	c539                	beqz	a0,ffffffffc020701c <do_sleep+0x4e>
ffffffffc0206fd0:	7179                	addi	sp,sp,-48
ffffffffc0206fd2:	f022                	sd	s0,32(sp)
ffffffffc0206fd4:	f406                	sd	ra,40(sp)
ffffffffc0206fd6:	842a                	mv	s0,a0
ffffffffc0206fd8:	100027f3          	csrr	a5,sstatus
ffffffffc0206fdc:	8b89                	andi	a5,a5,2
ffffffffc0206fde:	e3a9                	bnez	a5,ffffffffc0207020 <do_sleep+0x52>
ffffffffc0206fe0:	00090797          	auipc	a5,0x90
ffffffffc0206fe4:	8e07b783          	ld	a5,-1824(a5) # ffffffffc02968c0 <current>
ffffffffc0206fe8:	0818                	addi	a4,sp,16
ffffffffc0206fea:	c02a                	sw	a0,0(sp)
ffffffffc0206fec:	ec3a                	sd	a4,24(sp)
ffffffffc0206fee:	e83a                	sd	a4,16(sp)
ffffffffc0206ff0:	e43e                	sd	a5,8(sp)
ffffffffc0206ff2:	4705                	li	a4,1
ffffffffc0206ff4:	c398                	sw	a4,0(a5)
ffffffffc0206ff6:	80000737          	lui	a4,0x80000
ffffffffc0206ffa:	840a                	mv	s0,sp
ffffffffc0206ffc:	0709                	addi	a4,a4,2
ffffffffc0206ffe:	0ee7a623          	sw	a4,236(a5)
ffffffffc0207002:	8522                	mv	a0,s0
ffffffffc0207004:	364000ef          	jal	ra,ffffffffc0207368 <add_timer>
ffffffffc0207008:	2a0000ef          	jal	ra,ffffffffc02072a8 <schedule>
ffffffffc020700c:	8522                	mv	a0,s0
ffffffffc020700e:	422000ef          	jal	ra,ffffffffc0207430 <del_timer>
ffffffffc0207012:	70a2                	ld	ra,40(sp)
ffffffffc0207014:	7402                	ld	s0,32(sp)
ffffffffc0207016:	4501                	li	a0,0
ffffffffc0207018:	6145                	addi	sp,sp,48
ffffffffc020701a:	8082                	ret
ffffffffc020701c:	4501                	li	a0,0
ffffffffc020701e:	8082                	ret
ffffffffc0207020:	c53f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207024:	00090797          	auipc	a5,0x90
ffffffffc0207028:	89c7b783          	ld	a5,-1892(a5) # ffffffffc02968c0 <current>
ffffffffc020702c:	0818                	addi	a4,sp,16
ffffffffc020702e:	c022                	sw	s0,0(sp)
ffffffffc0207030:	e43e                	sd	a5,8(sp)
ffffffffc0207032:	ec3a                	sd	a4,24(sp)
ffffffffc0207034:	e83a                	sd	a4,16(sp)
ffffffffc0207036:	4705                	li	a4,1
ffffffffc0207038:	c398                	sw	a4,0(a5)
ffffffffc020703a:	80000737          	lui	a4,0x80000
ffffffffc020703e:	0709                	addi	a4,a4,2
ffffffffc0207040:	840a                	mv	s0,sp
ffffffffc0207042:	8522                	mv	a0,s0
ffffffffc0207044:	0ee7a623          	sw	a4,236(a5)
ffffffffc0207048:	320000ef          	jal	ra,ffffffffc0207368 <add_timer>
ffffffffc020704c:	c21f90ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0207050:	bf65                	j	ffffffffc0207008 <do_sleep+0x3a>

ffffffffc0207052 <switch_to>:
ffffffffc0207052:	00153023          	sd	ra,0(a0)
ffffffffc0207056:	00253423          	sd	sp,8(a0)
ffffffffc020705a:	e900                	sd	s0,16(a0)
ffffffffc020705c:	ed04                	sd	s1,24(a0)
ffffffffc020705e:	03253023          	sd	s2,32(a0)
ffffffffc0207062:	03353423          	sd	s3,40(a0)
ffffffffc0207066:	03453823          	sd	s4,48(a0)
ffffffffc020706a:	03553c23          	sd	s5,56(a0)
ffffffffc020706e:	05653023          	sd	s6,64(a0)
ffffffffc0207072:	05753423          	sd	s7,72(a0)
ffffffffc0207076:	05853823          	sd	s8,80(a0)
ffffffffc020707a:	05953c23          	sd	s9,88(a0)
ffffffffc020707e:	07a53023          	sd	s10,96(a0)
ffffffffc0207082:	07b53423          	sd	s11,104(a0)
ffffffffc0207086:	0005b083          	ld	ra,0(a1)
ffffffffc020708a:	0085b103          	ld	sp,8(a1)
ffffffffc020708e:	6980                	ld	s0,16(a1)
ffffffffc0207090:	6d84                	ld	s1,24(a1)
ffffffffc0207092:	0205b903          	ld	s2,32(a1)
ffffffffc0207096:	0285b983          	ld	s3,40(a1)
ffffffffc020709a:	0305ba03          	ld	s4,48(a1)
ffffffffc020709e:	0385ba83          	ld	s5,56(a1)
ffffffffc02070a2:	0405bb03          	ld	s6,64(a1)
ffffffffc02070a6:	0485bb83          	ld	s7,72(a1)
ffffffffc02070aa:	0505bc03          	ld	s8,80(a1)
ffffffffc02070ae:	0585bc83          	ld	s9,88(a1)
ffffffffc02070b2:	0605bd03          	ld	s10,96(a1)
ffffffffc02070b6:	0685bd83          	ld	s11,104(a1)
ffffffffc02070ba:	8082                	ret

ffffffffc02070bc <RR_init>:
ffffffffc02070bc:	e508                	sd	a0,8(a0)
ffffffffc02070be:	e108                	sd	a0,0(a0)
ffffffffc02070c0:	00052823          	sw	zero,16(a0)
ffffffffc02070c4:	8082                	ret

ffffffffc02070c6 <RR_pick_next>:
ffffffffc02070c6:	651c                	ld	a5,8(a0)
ffffffffc02070c8:	00f50563          	beq	a0,a5,ffffffffc02070d2 <RR_pick_next+0xc>
ffffffffc02070cc:	ef078513          	addi	a0,a5,-272
ffffffffc02070d0:	8082                	ret
ffffffffc02070d2:	4501                	li	a0,0
ffffffffc02070d4:	8082                	ret

ffffffffc02070d6 <RR_proc_tick>:
ffffffffc02070d6:	1205a783          	lw	a5,288(a1)
ffffffffc02070da:	00f05563          	blez	a5,ffffffffc02070e4 <RR_proc_tick+0xe>
ffffffffc02070de:	37fd                	addiw	a5,a5,-1
ffffffffc02070e0:	12f5a023          	sw	a5,288(a1)
ffffffffc02070e4:	e399                	bnez	a5,ffffffffc02070ea <RR_proc_tick+0x14>
ffffffffc02070e6:	4785                	li	a5,1
ffffffffc02070e8:	ed9c                	sd	a5,24(a1)
ffffffffc02070ea:	8082                	ret

ffffffffc02070ec <RR_dequeue>:
ffffffffc02070ec:	1185b703          	ld	a4,280(a1)
ffffffffc02070f0:	11058793          	addi	a5,a1,272
ffffffffc02070f4:	02e78363          	beq	a5,a4,ffffffffc020711a <RR_dequeue+0x2e>
ffffffffc02070f8:	1085b683          	ld	a3,264(a1)
ffffffffc02070fc:	00a69f63          	bne	a3,a0,ffffffffc020711a <RR_dequeue+0x2e>
ffffffffc0207100:	1105b503          	ld	a0,272(a1)
ffffffffc0207104:	4a90                	lw	a2,16(a3)
ffffffffc0207106:	e518                	sd	a4,8(a0)
ffffffffc0207108:	e308                	sd	a0,0(a4)
ffffffffc020710a:	10f5bc23          	sd	a5,280(a1)
ffffffffc020710e:	10f5b823          	sd	a5,272(a1)
ffffffffc0207112:	fff6079b          	addiw	a5,a2,-1
ffffffffc0207116:	ca9c                	sw	a5,16(a3)
ffffffffc0207118:	8082                	ret
ffffffffc020711a:	1141                	addi	sp,sp,-16
ffffffffc020711c:	00006697          	auipc	a3,0x6
ffffffffc0207120:	78c68693          	addi	a3,a3,1932 # ffffffffc020d8a8 <CSWTCH.79+0x5b0>
ffffffffc0207124:	00004617          	auipc	a2,0x4
ffffffffc0207128:	7d460613          	addi	a2,a2,2004 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020712c:	03c00593          	li	a1,60
ffffffffc0207130:	00006517          	auipc	a0,0x6
ffffffffc0207134:	7b050513          	addi	a0,a0,1968 # ffffffffc020d8e0 <CSWTCH.79+0x5e8>
ffffffffc0207138:	e406                	sd	ra,8(sp)
ffffffffc020713a:	b64f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020713e <RR_enqueue>:
ffffffffc020713e:	1185b703          	ld	a4,280(a1)
ffffffffc0207142:	11058793          	addi	a5,a1,272
ffffffffc0207146:	02e79d63          	bne	a5,a4,ffffffffc0207180 <RR_enqueue+0x42>
ffffffffc020714a:	6118                	ld	a4,0(a0)
ffffffffc020714c:	1205a683          	lw	a3,288(a1)
ffffffffc0207150:	e11c                	sd	a5,0(a0)
ffffffffc0207152:	e71c                	sd	a5,8(a4)
ffffffffc0207154:	10a5bc23          	sd	a0,280(a1)
ffffffffc0207158:	10e5b823          	sd	a4,272(a1)
ffffffffc020715c:	495c                	lw	a5,20(a0)
ffffffffc020715e:	ea89                	bnez	a3,ffffffffc0207170 <RR_enqueue+0x32>
ffffffffc0207160:	12f5a023          	sw	a5,288(a1)
ffffffffc0207164:	491c                	lw	a5,16(a0)
ffffffffc0207166:	10a5b423          	sd	a0,264(a1)
ffffffffc020716a:	2785                	addiw	a5,a5,1
ffffffffc020716c:	c91c                	sw	a5,16(a0)
ffffffffc020716e:	8082                	ret
ffffffffc0207170:	fed7c8e3          	blt	a5,a3,ffffffffc0207160 <RR_enqueue+0x22>
ffffffffc0207174:	491c                	lw	a5,16(a0)
ffffffffc0207176:	10a5b423          	sd	a0,264(a1)
ffffffffc020717a:	2785                	addiw	a5,a5,1
ffffffffc020717c:	c91c                	sw	a5,16(a0)
ffffffffc020717e:	8082                	ret
ffffffffc0207180:	1141                	addi	sp,sp,-16
ffffffffc0207182:	00006697          	auipc	a3,0x6
ffffffffc0207186:	77e68693          	addi	a3,a3,1918 # ffffffffc020d900 <CSWTCH.79+0x608>
ffffffffc020718a:	00004617          	auipc	a2,0x4
ffffffffc020718e:	76e60613          	addi	a2,a2,1902 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207192:	02800593          	li	a1,40
ffffffffc0207196:	00006517          	auipc	a0,0x6
ffffffffc020719a:	74a50513          	addi	a0,a0,1866 # ffffffffc020d8e0 <CSWTCH.79+0x5e8>
ffffffffc020719e:	e406                	sd	ra,8(sp)
ffffffffc02071a0:	afef90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02071a4 <sched_init>:
ffffffffc02071a4:	1141                	addi	sp,sp,-16
ffffffffc02071a6:	0008a717          	auipc	a4,0x8a
ffffffffc02071aa:	e7a70713          	addi	a4,a4,-390 # ffffffffc0291020 <default_sched_class>
ffffffffc02071ae:	e022                	sd	s0,0(sp)
ffffffffc02071b0:	e406                	sd	ra,8(sp)
ffffffffc02071b2:	0008e797          	auipc	a5,0x8e
ffffffffc02071b6:	63e78793          	addi	a5,a5,1598 # ffffffffc02957f0 <timer_list>
ffffffffc02071ba:	6714                	ld	a3,8(a4)
ffffffffc02071bc:	0008e517          	auipc	a0,0x8e
ffffffffc02071c0:	61450513          	addi	a0,a0,1556 # ffffffffc02957d0 <__rq>
ffffffffc02071c4:	e79c                	sd	a5,8(a5)
ffffffffc02071c6:	e39c                	sd	a5,0(a5)
ffffffffc02071c8:	4795                	li	a5,5
ffffffffc02071ca:	c95c                	sw	a5,20(a0)
ffffffffc02071cc:	0008f417          	auipc	s0,0x8f
ffffffffc02071d0:	71c40413          	addi	s0,s0,1820 # ffffffffc02968e8 <sched_class>
ffffffffc02071d4:	0008f797          	auipc	a5,0x8f
ffffffffc02071d8:	70a7b623          	sd	a0,1804(a5) # ffffffffc02968e0 <rq>
ffffffffc02071dc:	e018                	sd	a4,0(s0)
ffffffffc02071de:	9682                	jalr	a3
ffffffffc02071e0:	601c                	ld	a5,0(s0)
ffffffffc02071e2:	6402                	ld	s0,0(sp)
ffffffffc02071e4:	60a2                	ld	ra,8(sp)
ffffffffc02071e6:	638c                	ld	a1,0(a5)
ffffffffc02071e8:	00006517          	auipc	a0,0x6
ffffffffc02071ec:	74850513          	addi	a0,a0,1864 # ffffffffc020d930 <CSWTCH.79+0x638>
ffffffffc02071f0:	0141                	addi	sp,sp,16
ffffffffc02071f2:	fb5f806f          	j	ffffffffc02001a6 <cprintf>

ffffffffc02071f6 <wakeup_proc>:
ffffffffc02071f6:	4118                	lw	a4,0(a0)
ffffffffc02071f8:	1101                	addi	sp,sp,-32
ffffffffc02071fa:	ec06                	sd	ra,24(sp)
ffffffffc02071fc:	e822                	sd	s0,16(sp)
ffffffffc02071fe:	e426                	sd	s1,8(sp)
ffffffffc0207200:	478d                	li	a5,3
ffffffffc0207202:	08f70363          	beq	a4,a5,ffffffffc0207288 <wakeup_proc+0x92>
ffffffffc0207206:	842a                	mv	s0,a0
ffffffffc0207208:	100027f3          	csrr	a5,sstatus
ffffffffc020720c:	8b89                	andi	a5,a5,2
ffffffffc020720e:	4481                	li	s1,0
ffffffffc0207210:	e7bd                	bnez	a5,ffffffffc020727e <wakeup_proc+0x88>
ffffffffc0207212:	4789                	li	a5,2
ffffffffc0207214:	04f70863          	beq	a4,a5,ffffffffc0207264 <wakeup_proc+0x6e>
ffffffffc0207218:	c01c                	sw	a5,0(s0)
ffffffffc020721a:	0e042623          	sw	zero,236(s0)
ffffffffc020721e:	0008f797          	auipc	a5,0x8f
ffffffffc0207222:	6a27b783          	ld	a5,1698(a5) # ffffffffc02968c0 <current>
ffffffffc0207226:	02878363          	beq	a5,s0,ffffffffc020724c <wakeup_proc+0x56>
ffffffffc020722a:	0008f797          	auipc	a5,0x8f
ffffffffc020722e:	69e7b783          	ld	a5,1694(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0207232:	00f40d63          	beq	s0,a5,ffffffffc020724c <wakeup_proc+0x56>
ffffffffc0207236:	0008f797          	auipc	a5,0x8f
ffffffffc020723a:	6b27b783          	ld	a5,1714(a5) # ffffffffc02968e8 <sched_class>
ffffffffc020723e:	6b9c                	ld	a5,16(a5)
ffffffffc0207240:	85a2                	mv	a1,s0
ffffffffc0207242:	0008f517          	auipc	a0,0x8f
ffffffffc0207246:	69e53503          	ld	a0,1694(a0) # ffffffffc02968e0 <rq>
ffffffffc020724a:	9782                	jalr	a5
ffffffffc020724c:	e491                	bnez	s1,ffffffffc0207258 <wakeup_proc+0x62>
ffffffffc020724e:	60e2                	ld	ra,24(sp)
ffffffffc0207250:	6442                	ld	s0,16(sp)
ffffffffc0207252:	64a2                	ld	s1,8(sp)
ffffffffc0207254:	6105                	addi	sp,sp,32
ffffffffc0207256:	8082                	ret
ffffffffc0207258:	6442                	ld	s0,16(sp)
ffffffffc020725a:	60e2                	ld	ra,24(sp)
ffffffffc020725c:	64a2                	ld	s1,8(sp)
ffffffffc020725e:	6105                	addi	sp,sp,32
ffffffffc0207260:	a0df906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207264:	00006617          	auipc	a2,0x6
ffffffffc0207268:	71c60613          	addi	a2,a2,1820 # ffffffffc020d980 <CSWTCH.79+0x688>
ffffffffc020726c:	05200593          	li	a1,82
ffffffffc0207270:	00006517          	auipc	a0,0x6
ffffffffc0207274:	6f850513          	addi	a0,a0,1784 # ffffffffc020d968 <CSWTCH.79+0x670>
ffffffffc0207278:	a8ef90ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc020727c:	bfc1                	j	ffffffffc020724c <wakeup_proc+0x56>
ffffffffc020727e:	9f5f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207282:	4018                	lw	a4,0(s0)
ffffffffc0207284:	4485                	li	s1,1
ffffffffc0207286:	b771                	j	ffffffffc0207212 <wakeup_proc+0x1c>
ffffffffc0207288:	00006697          	auipc	a3,0x6
ffffffffc020728c:	6c068693          	addi	a3,a3,1728 # ffffffffc020d948 <CSWTCH.79+0x650>
ffffffffc0207290:	00004617          	auipc	a2,0x4
ffffffffc0207294:	66860613          	addi	a2,a2,1640 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207298:	04300593          	li	a1,67
ffffffffc020729c:	00006517          	auipc	a0,0x6
ffffffffc02072a0:	6cc50513          	addi	a0,a0,1740 # ffffffffc020d968 <CSWTCH.79+0x670>
ffffffffc02072a4:	9faf90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02072a8 <schedule>:
ffffffffc02072a8:	7179                	addi	sp,sp,-48
ffffffffc02072aa:	f406                	sd	ra,40(sp)
ffffffffc02072ac:	f022                	sd	s0,32(sp)
ffffffffc02072ae:	ec26                	sd	s1,24(sp)
ffffffffc02072b0:	e84a                	sd	s2,16(sp)
ffffffffc02072b2:	e44e                	sd	s3,8(sp)
ffffffffc02072b4:	e052                	sd	s4,0(sp)
ffffffffc02072b6:	100027f3          	csrr	a5,sstatus
ffffffffc02072ba:	8b89                	andi	a5,a5,2
ffffffffc02072bc:	4a01                	li	s4,0
ffffffffc02072be:	e3cd                	bnez	a5,ffffffffc0207360 <schedule+0xb8>
ffffffffc02072c0:	0008f497          	auipc	s1,0x8f
ffffffffc02072c4:	60048493          	addi	s1,s1,1536 # ffffffffc02968c0 <current>
ffffffffc02072c8:	608c                	ld	a1,0(s1)
ffffffffc02072ca:	0008f997          	auipc	s3,0x8f
ffffffffc02072ce:	61e98993          	addi	s3,s3,1566 # ffffffffc02968e8 <sched_class>
ffffffffc02072d2:	0008f917          	auipc	s2,0x8f
ffffffffc02072d6:	60e90913          	addi	s2,s2,1550 # ffffffffc02968e0 <rq>
ffffffffc02072da:	4194                	lw	a3,0(a1)
ffffffffc02072dc:	0005bc23          	sd	zero,24(a1)
ffffffffc02072e0:	4709                	li	a4,2
ffffffffc02072e2:	0009b783          	ld	a5,0(s3)
ffffffffc02072e6:	00093503          	ld	a0,0(s2)
ffffffffc02072ea:	04e68e63          	beq	a3,a4,ffffffffc0207346 <schedule+0x9e>
ffffffffc02072ee:	739c                	ld	a5,32(a5)
ffffffffc02072f0:	9782                	jalr	a5
ffffffffc02072f2:	842a                	mv	s0,a0
ffffffffc02072f4:	c521                	beqz	a0,ffffffffc020733c <schedule+0x94>
ffffffffc02072f6:	0009b783          	ld	a5,0(s3)
ffffffffc02072fa:	00093503          	ld	a0,0(s2)
ffffffffc02072fe:	85a2                	mv	a1,s0
ffffffffc0207300:	6f9c                	ld	a5,24(a5)
ffffffffc0207302:	9782                	jalr	a5
ffffffffc0207304:	441c                	lw	a5,8(s0)
ffffffffc0207306:	6098                	ld	a4,0(s1)
ffffffffc0207308:	2785                	addiw	a5,a5,1
ffffffffc020730a:	c41c                	sw	a5,8(s0)
ffffffffc020730c:	00870563          	beq	a4,s0,ffffffffc0207316 <schedule+0x6e>
ffffffffc0207310:	8522                	mv	a0,s0
ffffffffc0207312:	fc0fe0ef          	jal	ra,ffffffffc0205ad2 <proc_run>
ffffffffc0207316:	000a1a63          	bnez	s4,ffffffffc020732a <schedule+0x82>
ffffffffc020731a:	70a2                	ld	ra,40(sp)
ffffffffc020731c:	7402                	ld	s0,32(sp)
ffffffffc020731e:	64e2                	ld	s1,24(sp)
ffffffffc0207320:	6942                	ld	s2,16(sp)
ffffffffc0207322:	69a2                	ld	s3,8(sp)
ffffffffc0207324:	6a02                	ld	s4,0(sp)
ffffffffc0207326:	6145                	addi	sp,sp,48
ffffffffc0207328:	8082                	ret
ffffffffc020732a:	7402                	ld	s0,32(sp)
ffffffffc020732c:	70a2                	ld	ra,40(sp)
ffffffffc020732e:	64e2                	ld	s1,24(sp)
ffffffffc0207330:	6942                	ld	s2,16(sp)
ffffffffc0207332:	69a2                	ld	s3,8(sp)
ffffffffc0207334:	6a02                	ld	s4,0(sp)
ffffffffc0207336:	6145                	addi	sp,sp,48
ffffffffc0207338:	935f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020733c:	0008f417          	auipc	s0,0x8f
ffffffffc0207340:	58c43403          	ld	s0,1420(s0) # ffffffffc02968c8 <idleproc>
ffffffffc0207344:	b7c1                	j	ffffffffc0207304 <schedule+0x5c>
ffffffffc0207346:	0008f717          	auipc	a4,0x8f
ffffffffc020734a:	58273703          	ld	a4,1410(a4) # ffffffffc02968c8 <idleproc>
ffffffffc020734e:	fae580e3          	beq	a1,a4,ffffffffc02072ee <schedule+0x46>
ffffffffc0207352:	6b9c                	ld	a5,16(a5)
ffffffffc0207354:	9782                	jalr	a5
ffffffffc0207356:	0009b783          	ld	a5,0(s3)
ffffffffc020735a:	00093503          	ld	a0,0(s2)
ffffffffc020735e:	bf41                	j	ffffffffc02072ee <schedule+0x46>
ffffffffc0207360:	913f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207364:	4a05                	li	s4,1
ffffffffc0207366:	bfa9                	j	ffffffffc02072c0 <schedule+0x18>

ffffffffc0207368 <add_timer>:
ffffffffc0207368:	1141                	addi	sp,sp,-16
ffffffffc020736a:	e022                	sd	s0,0(sp)
ffffffffc020736c:	e406                	sd	ra,8(sp)
ffffffffc020736e:	842a                	mv	s0,a0
ffffffffc0207370:	100027f3          	csrr	a5,sstatus
ffffffffc0207374:	8b89                	andi	a5,a5,2
ffffffffc0207376:	4501                	li	a0,0
ffffffffc0207378:	eba5                	bnez	a5,ffffffffc02073e8 <add_timer+0x80>
ffffffffc020737a:	401c                	lw	a5,0(s0)
ffffffffc020737c:	cbb5                	beqz	a5,ffffffffc02073f0 <add_timer+0x88>
ffffffffc020737e:	6418                	ld	a4,8(s0)
ffffffffc0207380:	cb25                	beqz	a4,ffffffffc02073f0 <add_timer+0x88>
ffffffffc0207382:	6c18                	ld	a4,24(s0)
ffffffffc0207384:	01040593          	addi	a1,s0,16
ffffffffc0207388:	08e59463          	bne	a1,a4,ffffffffc0207410 <add_timer+0xa8>
ffffffffc020738c:	0008e617          	auipc	a2,0x8e
ffffffffc0207390:	46460613          	addi	a2,a2,1124 # ffffffffc02957f0 <timer_list>
ffffffffc0207394:	6618                	ld	a4,8(a2)
ffffffffc0207396:	00c71863          	bne	a4,a2,ffffffffc02073a6 <add_timer+0x3e>
ffffffffc020739a:	a80d                	j	ffffffffc02073cc <add_timer+0x64>
ffffffffc020739c:	6718                	ld	a4,8(a4)
ffffffffc020739e:	9f95                	subw	a5,a5,a3
ffffffffc02073a0:	c01c                	sw	a5,0(s0)
ffffffffc02073a2:	02c70563          	beq	a4,a2,ffffffffc02073cc <add_timer+0x64>
ffffffffc02073a6:	ff072683          	lw	a3,-16(a4)
ffffffffc02073aa:	fed7f9e3          	bgeu	a5,a3,ffffffffc020739c <add_timer+0x34>
ffffffffc02073ae:	40f687bb          	subw	a5,a3,a5
ffffffffc02073b2:	fef72823          	sw	a5,-16(a4)
ffffffffc02073b6:	631c                	ld	a5,0(a4)
ffffffffc02073b8:	e30c                	sd	a1,0(a4)
ffffffffc02073ba:	e78c                	sd	a1,8(a5)
ffffffffc02073bc:	ec18                	sd	a4,24(s0)
ffffffffc02073be:	e81c                	sd	a5,16(s0)
ffffffffc02073c0:	c105                	beqz	a0,ffffffffc02073e0 <add_timer+0x78>
ffffffffc02073c2:	6402                	ld	s0,0(sp)
ffffffffc02073c4:	60a2                	ld	ra,8(sp)
ffffffffc02073c6:	0141                	addi	sp,sp,16
ffffffffc02073c8:	8a5f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02073cc:	0008e717          	auipc	a4,0x8e
ffffffffc02073d0:	42470713          	addi	a4,a4,1060 # ffffffffc02957f0 <timer_list>
ffffffffc02073d4:	631c                	ld	a5,0(a4)
ffffffffc02073d6:	e30c                	sd	a1,0(a4)
ffffffffc02073d8:	e78c                	sd	a1,8(a5)
ffffffffc02073da:	ec18                	sd	a4,24(s0)
ffffffffc02073dc:	e81c                	sd	a5,16(s0)
ffffffffc02073de:	f175                	bnez	a0,ffffffffc02073c2 <add_timer+0x5a>
ffffffffc02073e0:	60a2                	ld	ra,8(sp)
ffffffffc02073e2:	6402                	ld	s0,0(sp)
ffffffffc02073e4:	0141                	addi	sp,sp,16
ffffffffc02073e6:	8082                	ret
ffffffffc02073e8:	88bf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02073ec:	4505                	li	a0,1
ffffffffc02073ee:	b771                	j	ffffffffc020737a <add_timer+0x12>
ffffffffc02073f0:	00006697          	auipc	a3,0x6
ffffffffc02073f4:	5b068693          	addi	a3,a3,1456 # ffffffffc020d9a0 <CSWTCH.79+0x6a8>
ffffffffc02073f8:	00004617          	auipc	a2,0x4
ffffffffc02073fc:	50060613          	addi	a2,a2,1280 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207400:	07a00593          	li	a1,122
ffffffffc0207404:	00006517          	auipc	a0,0x6
ffffffffc0207408:	56450513          	addi	a0,a0,1380 # ffffffffc020d968 <CSWTCH.79+0x670>
ffffffffc020740c:	892f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207410:	00006697          	auipc	a3,0x6
ffffffffc0207414:	5c068693          	addi	a3,a3,1472 # ffffffffc020d9d0 <CSWTCH.79+0x6d8>
ffffffffc0207418:	00004617          	auipc	a2,0x4
ffffffffc020741c:	4e060613          	addi	a2,a2,1248 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207420:	07b00593          	li	a1,123
ffffffffc0207424:	00006517          	auipc	a0,0x6
ffffffffc0207428:	54450513          	addi	a0,a0,1348 # ffffffffc020d968 <CSWTCH.79+0x670>
ffffffffc020742c:	872f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207430 <del_timer>:
ffffffffc0207430:	1101                	addi	sp,sp,-32
ffffffffc0207432:	e822                	sd	s0,16(sp)
ffffffffc0207434:	ec06                	sd	ra,24(sp)
ffffffffc0207436:	e426                	sd	s1,8(sp)
ffffffffc0207438:	842a                	mv	s0,a0
ffffffffc020743a:	100027f3          	csrr	a5,sstatus
ffffffffc020743e:	8b89                	andi	a5,a5,2
ffffffffc0207440:	01050493          	addi	s1,a0,16
ffffffffc0207444:	eb9d                	bnez	a5,ffffffffc020747a <del_timer+0x4a>
ffffffffc0207446:	6d1c                	ld	a5,24(a0)
ffffffffc0207448:	02978463          	beq	a5,s1,ffffffffc0207470 <del_timer+0x40>
ffffffffc020744c:	4114                	lw	a3,0(a0)
ffffffffc020744e:	6918                	ld	a4,16(a0)
ffffffffc0207450:	ce81                	beqz	a3,ffffffffc0207468 <del_timer+0x38>
ffffffffc0207452:	0008e617          	auipc	a2,0x8e
ffffffffc0207456:	39e60613          	addi	a2,a2,926 # ffffffffc02957f0 <timer_list>
ffffffffc020745a:	00c78763          	beq	a5,a2,ffffffffc0207468 <del_timer+0x38>
ffffffffc020745e:	ff07a603          	lw	a2,-16(a5)
ffffffffc0207462:	9eb1                	addw	a3,a3,a2
ffffffffc0207464:	fed7a823          	sw	a3,-16(a5)
ffffffffc0207468:	e71c                	sd	a5,8(a4)
ffffffffc020746a:	e398                	sd	a4,0(a5)
ffffffffc020746c:	ec04                	sd	s1,24(s0)
ffffffffc020746e:	e804                	sd	s1,16(s0)
ffffffffc0207470:	60e2                	ld	ra,24(sp)
ffffffffc0207472:	6442                	ld	s0,16(sp)
ffffffffc0207474:	64a2                	ld	s1,8(sp)
ffffffffc0207476:	6105                	addi	sp,sp,32
ffffffffc0207478:	8082                	ret
ffffffffc020747a:	ff8f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020747e:	6c1c                	ld	a5,24(s0)
ffffffffc0207480:	02978463          	beq	a5,s1,ffffffffc02074a8 <del_timer+0x78>
ffffffffc0207484:	4014                	lw	a3,0(s0)
ffffffffc0207486:	6818                	ld	a4,16(s0)
ffffffffc0207488:	ce81                	beqz	a3,ffffffffc02074a0 <del_timer+0x70>
ffffffffc020748a:	0008e617          	auipc	a2,0x8e
ffffffffc020748e:	36660613          	addi	a2,a2,870 # ffffffffc02957f0 <timer_list>
ffffffffc0207492:	00c78763          	beq	a5,a2,ffffffffc02074a0 <del_timer+0x70>
ffffffffc0207496:	ff07a603          	lw	a2,-16(a5)
ffffffffc020749a:	9eb1                	addw	a3,a3,a2
ffffffffc020749c:	fed7a823          	sw	a3,-16(a5)
ffffffffc02074a0:	e71c                	sd	a5,8(a4)
ffffffffc02074a2:	e398                	sd	a4,0(a5)
ffffffffc02074a4:	ec04                	sd	s1,24(s0)
ffffffffc02074a6:	e804                	sd	s1,16(s0)
ffffffffc02074a8:	6442                	ld	s0,16(sp)
ffffffffc02074aa:	60e2                	ld	ra,24(sp)
ffffffffc02074ac:	64a2                	ld	s1,8(sp)
ffffffffc02074ae:	6105                	addi	sp,sp,32
ffffffffc02074b0:	fbcf906f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02074b4 <run_timer_list>:
ffffffffc02074b4:	7139                	addi	sp,sp,-64
ffffffffc02074b6:	fc06                	sd	ra,56(sp)
ffffffffc02074b8:	f822                	sd	s0,48(sp)
ffffffffc02074ba:	f426                	sd	s1,40(sp)
ffffffffc02074bc:	f04a                	sd	s2,32(sp)
ffffffffc02074be:	ec4e                	sd	s3,24(sp)
ffffffffc02074c0:	e852                	sd	s4,16(sp)
ffffffffc02074c2:	e456                	sd	s5,8(sp)
ffffffffc02074c4:	e05a                	sd	s6,0(sp)
ffffffffc02074c6:	100027f3          	csrr	a5,sstatus
ffffffffc02074ca:	8b89                	andi	a5,a5,2
ffffffffc02074cc:	4b01                	li	s6,0
ffffffffc02074ce:	efe9                	bnez	a5,ffffffffc02075a8 <run_timer_list+0xf4>
ffffffffc02074d0:	0008e997          	auipc	s3,0x8e
ffffffffc02074d4:	32098993          	addi	s3,s3,800 # ffffffffc02957f0 <timer_list>
ffffffffc02074d8:	0089b403          	ld	s0,8(s3)
ffffffffc02074dc:	07340a63          	beq	s0,s3,ffffffffc0207550 <run_timer_list+0x9c>
ffffffffc02074e0:	ff042783          	lw	a5,-16(s0)
ffffffffc02074e4:	ff040913          	addi	s2,s0,-16
ffffffffc02074e8:	0e078763          	beqz	a5,ffffffffc02075d6 <run_timer_list+0x122>
ffffffffc02074ec:	fff7871b          	addiw	a4,a5,-1
ffffffffc02074f0:	fee42823          	sw	a4,-16(s0)
ffffffffc02074f4:	ef31                	bnez	a4,ffffffffc0207550 <run_timer_list+0x9c>
ffffffffc02074f6:	00006a97          	auipc	s5,0x6
ffffffffc02074fa:	542a8a93          	addi	s5,s5,1346 # ffffffffc020da38 <CSWTCH.79+0x740>
ffffffffc02074fe:	00006a17          	auipc	s4,0x6
ffffffffc0207502:	46aa0a13          	addi	s4,s4,1130 # ffffffffc020d968 <CSWTCH.79+0x670>
ffffffffc0207506:	a005                	j	ffffffffc0207526 <run_timer_list+0x72>
ffffffffc0207508:	0a07d763          	bgez	a5,ffffffffc02075b6 <run_timer_list+0x102>
ffffffffc020750c:	8526                	mv	a0,s1
ffffffffc020750e:	ce9ff0ef          	jal	ra,ffffffffc02071f6 <wakeup_proc>
ffffffffc0207512:	854a                	mv	a0,s2
ffffffffc0207514:	f1dff0ef          	jal	ra,ffffffffc0207430 <del_timer>
ffffffffc0207518:	03340c63          	beq	s0,s3,ffffffffc0207550 <run_timer_list+0x9c>
ffffffffc020751c:	ff042783          	lw	a5,-16(s0)
ffffffffc0207520:	ff040913          	addi	s2,s0,-16
ffffffffc0207524:	e795                	bnez	a5,ffffffffc0207550 <run_timer_list+0x9c>
ffffffffc0207526:	00893483          	ld	s1,8(s2)
ffffffffc020752a:	6400                	ld	s0,8(s0)
ffffffffc020752c:	0ec4a783          	lw	a5,236(s1)
ffffffffc0207530:	ffe1                	bnez	a5,ffffffffc0207508 <run_timer_list+0x54>
ffffffffc0207532:	40d4                	lw	a3,4(s1)
ffffffffc0207534:	8656                	mv	a2,s5
ffffffffc0207536:	0ba00593          	li	a1,186
ffffffffc020753a:	8552                	mv	a0,s4
ffffffffc020753c:	fcbf80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc0207540:	8526                	mv	a0,s1
ffffffffc0207542:	cb5ff0ef          	jal	ra,ffffffffc02071f6 <wakeup_proc>
ffffffffc0207546:	854a                	mv	a0,s2
ffffffffc0207548:	ee9ff0ef          	jal	ra,ffffffffc0207430 <del_timer>
ffffffffc020754c:	fd3418e3          	bne	s0,s3,ffffffffc020751c <run_timer_list+0x68>
ffffffffc0207550:	0008f597          	auipc	a1,0x8f
ffffffffc0207554:	3705b583          	ld	a1,880(a1) # ffffffffc02968c0 <current>
ffffffffc0207558:	c18d                	beqz	a1,ffffffffc020757a <run_timer_list+0xc6>
ffffffffc020755a:	0008f797          	auipc	a5,0x8f
ffffffffc020755e:	36e7b783          	ld	a5,878(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0207562:	04f58763          	beq	a1,a5,ffffffffc02075b0 <run_timer_list+0xfc>
ffffffffc0207566:	0008f797          	auipc	a5,0x8f
ffffffffc020756a:	3827b783          	ld	a5,898(a5) # ffffffffc02968e8 <sched_class>
ffffffffc020756e:	779c                	ld	a5,40(a5)
ffffffffc0207570:	0008f517          	auipc	a0,0x8f
ffffffffc0207574:	37053503          	ld	a0,880(a0) # ffffffffc02968e0 <rq>
ffffffffc0207578:	9782                	jalr	a5
ffffffffc020757a:	000b1c63          	bnez	s6,ffffffffc0207592 <run_timer_list+0xde>
ffffffffc020757e:	70e2                	ld	ra,56(sp)
ffffffffc0207580:	7442                	ld	s0,48(sp)
ffffffffc0207582:	74a2                	ld	s1,40(sp)
ffffffffc0207584:	7902                	ld	s2,32(sp)
ffffffffc0207586:	69e2                	ld	s3,24(sp)
ffffffffc0207588:	6a42                	ld	s4,16(sp)
ffffffffc020758a:	6aa2                	ld	s5,8(sp)
ffffffffc020758c:	6b02                	ld	s6,0(sp)
ffffffffc020758e:	6121                	addi	sp,sp,64
ffffffffc0207590:	8082                	ret
ffffffffc0207592:	7442                	ld	s0,48(sp)
ffffffffc0207594:	70e2                	ld	ra,56(sp)
ffffffffc0207596:	74a2                	ld	s1,40(sp)
ffffffffc0207598:	7902                	ld	s2,32(sp)
ffffffffc020759a:	69e2                	ld	s3,24(sp)
ffffffffc020759c:	6a42                	ld	s4,16(sp)
ffffffffc020759e:	6aa2                	ld	s5,8(sp)
ffffffffc02075a0:	6b02                	ld	s6,0(sp)
ffffffffc02075a2:	6121                	addi	sp,sp,64
ffffffffc02075a4:	ec8f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02075a8:	ecaf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02075ac:	4b05                	li	s6,1
ffffffffc02075ae:	b70d                	j	ffffffffc02074d0 <run_timer_list+0x1c>
ffffffffc02075b0:	4785                	li	a5,1
ffffffffc02075b2:	ed9c                	sd	a5,24(a1)
ffffffffc02075b4:	b7d9                	j	ffffffffc020757a <run_timer_list+0xc6>
ffffffffc02075b6:	00006697          	auipc	a3,0x6
ffffffffc02075ba:	45a68693          	addi	a3,a3,1114 # ffffffffc020da10 <CSWTCH.79+0x718>
ffffffffc02075be:	00004617          	auipc	a2,0x4
ffffffffc02075c2:	33a60613          	addi	a2,a2,826 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02075c6:	0b600593          	li	a1,182
ffffffffc02075ca:	00006517          	auipc	a0,0x6
ffffffffc02075ce:	39e50513          	addi	a0,a0,926 # ffffffffc020d968 <CSWTCH.79+0x670>
ffffffffc02075d2:	ecdf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02075d6:	00006697          	auipc	a3,0x6
ffffffffc02075da:	42268693          	addi	a3,a3,1058 # ffffffffc020d9f8 <CSWTCH.79+0x700>
ffffffffc02075de:	00004617          	auipc	a2,0x4
ffffffffc02075e2:	31a60613          	addi	a2,a2,794 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02075e6:	0ae00593          	li	a1,174
ffffffffc02075ea:	00006517          	auipc	a0,0x6
ffffffffc02075ee:	37e50513          	addi	a0,a0,894 # ffffffffc020d968 <CSWTCH.79+0x670>
ffffffffc02075f2:	eadf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02075f6 <sys_getpid>:
ffffffffc02075f6:	0008f797          	auipc	a5,0x8f
ffffffffc02075fa:	2ca7b783          	ld	a5,714(a5) # ffffffffc02968c0 <current>
ffffffffc02075fe:	43c8                	lw	a0,4(a5)
ffffffffc0207600:	8082                	ret

ffffffffc0207602 <sys_pgdir>:
ffffffffc0207602:	4501                	li	a0,0
ffffffffc0207604:	8082                	ret

ffffffffc0207606 <sys_gettime>:
ffffffffc0207606:	0008f797          	auipc	a5,0x8f
ffffffffc020760a:	26a7b783          	ld	a5,618(a5) # ffffffffc0296870 <ticks>
ffffffffc020760e:	0027951b          	slliw	a0,a5,0x2
ffffffffc0207612:	9d3d                	addw	a0,a0,a5
ffffffffc0207614:	0015151b          	slliw	a0,a0,0x1
ffffffffc0207618:	8082                	ret

ffffffffc020761a <sys_lab6_set_priority>:
ffffffffc020761a:	4108                	lw	a0,0(a0)
ffffffffc020761c:	1141                	addi	sp,sp,-16
ffffffffc020761e:	e406                	sd	ra,8(sp)
ffffffffc0207620:	975ff0ef          	jal	ra,ffffffffc0206f94 <lab6_set_priority>
ffffffffc0207624:	60a2                	ld	ra,8(sp)
ffffffffc0207626:	4501                	li	a0,0
ffffffffc0207628:	0141                	addi	sp,sp,16
ffffffffc020762a:	8082                	ret

ffffffffc020762c <sys_dup>:
ffffffffc020762c:	450c                	lw	a1,8(a0)
ffffffffc020762e:	4108                	lw	a0,0(a0)
ffffffffc0207630:	af6fe06f          	j	ffffffffc0205926 <sysfile_dup>

ffffffffc0207634 <sys_getdirentry>:
ffffffffc0207634:	650c                	ld	a1,8(a0)
ffffffffc0207636:	4108                	lw	a0,0(a0)
ffffffffc0207638:	9fefe06f          	j	ffffffffc0205836 <sysfile_getdirentry>

ffffffffc020763c <sys_getcwd>:
ffffffffc020763c:	650c                	ld	a1,8(a0)
ffffffffc020763e:	6108                	ld	a0,0(a0)
ffffffffc0207640:	952fe06f          	j	ffffffffc0205792 <sysfile_getcwd>

ffffffffc0207644 <sys_fsync>:
ffffffffc0207644:	4108                	lw	a0,0(a0)
ffffffffc0207646:	948fe06f          	j	ffffffffc020578e <sysfile_fsync>

ffffffffc020764a <sys_fstat>:
ffffffffc020764a:	650c                	ld	a1,8(a0)
ffffffffc020764c:	4108                	lw	a0,0(a0)
ffffffffc020764e:	8a0fe06f          	j	ffffffffc02056ee <sysfile_fstat>

ffffffffc0207652 <sys_seek>:
ffffffffc0207652:	4910                	lw	a2,16(a0)
ffffffffc0207654:	650c                	ld	a1,8(a0)
ffffffffc0207656:	4108                	lw	a0,0(a0)
ffffffffc0207658:	892fe06f          	j	ffffffffc02056ea <sysfile_seek>

ffffffffc020765c <sys_write>:
ffffffffc020765c:	6910                	ld	a2,16(a0)
ffffffffc020765e:	650c                	ld	a1,8(a0)
ffffffffc0207660:	4108                	lw	a0,0(a0)
ffffffffc0207662:	f6ffd06f          	j	ffffffffc02055d0 <sysfile_write>

ffffffffc0207666 <sys_read>:
ffffffffc0207666:	6910                	ld	a2,16(a0)
ffffffffc0207668:	650c                	ld	a1,8(a0)
ffffffffc020766a:	4108                	lw	a0,0(a0)
ffffffffc020766c:	e51fd06f          	j	ffffffffc02054bc <sysfile_read>

ffffffffc0207670 <sys_close>:
ffffffffc0207670:	4108                	lw	a0,0(a0)
ffffffffc0207672:	e47fd06f          	j	ffffffffc02054b8 <sysfile_close>

ffffffffc0207676 <sys_open>:
ffffffffc0207676:	450c                	lw	a1,8(a0)
ffffffffc0207678:	6108                	ld	a0,0(a0)
ffffffffc020767a:	e0bfd06f          	j	ffffffffc0205484 <sysfile_open>

ffffffffc020767e <sys_putc>:
ffffffffc020767e:	4108                	lw	a0,0(a0)
ffffffffc0207680:	1141                	addi	sp,sp,-16
ffffffffc0207682:	e406                	sd	ra,8(sp)
ffffffffc0207684:	b5ff80ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0207688:	60a2                	ld	ra,8(sp)
ffffffffc020768a:	4501                	li	a0,0
ffffffffc020768c:	0141                	addi	sp,sp,16
ffffffffc020768e:	8082                	ret

ffffffffc0207690 <sys_kill>:
ffffffffc0207690:	4108                	lw	a0,0(a0)
ffffffffc0207692:	ea0ff06f          	j	ffffffffc0206d32 <do_kill>

ffffffffc0207696 <sys_sleep>:
ffffffffc0207696:	4108                	lw	a0,0(a0)
ffffffffc0207698:	937ff06f          	j	ffffffffc0206fce <do_sleep>

ffffffffc020769c <sys_yield>:
ffffffffc020769c:	e48ff06f          	j	ffffffffc0206ce4 <do_yield>

ffffffffc02076a0 <sys_exec>:
ffffffffc02076a0:	6910                	ld	a2,16(a0)
ffffffffc02076a2:	450c                	lw	a1,8(a0)
ffffffffc02076a4:	6108                	ld	a0,0(a0)
ffffffffc02076a6:	d93fe06f          	j	ffffffffc0206438 <do_execve>

ffffffffc02076aa <sys_wait>:
ffffffffc02076aa:	650c                	ld	a1,8(a0)
ffffffffc02076ac:	4108                	lw	a0,0(a0)
ffffffffc02076ae:	e46ff06f          	j	ffffffffc0206cf4 <do_wait>

ffffffffc02076b2 <sys_fork>:
ffffffffc02076b2:	0008f797          	auipc	a5,0x8f
ffffffffc02076b6:	20e7b783          	ld	a5,526(a5) # ffffffffc02968c0 <current>
ffffffffc02076ba:	73d0                	ld	a2,160(a5)
ffffffffc02076bc:	4501                	li	a0,0
ffffffffc02076be:	6a0c                	ld	a1,16(a2)
ffffffffc02076c0:	c82fe06f          	j	ffffffffc0205b42 <do_fork>

ffffffffc02076c4 <sys_exit>:
ffffffffc02076c4:	4108                	lw	a0,0(a0)
ffffffffc02076c6:	8effe06f          	j	ffffffffc0205fb4 <do_exit>

ffffffffc02076ca <syscall>:
ffffffffc02076ca:	715d                	addi	sp,sp,-80
ffffffffc02076cc:	fc26                	sd	s1,56(sp)
ffffffffc02076ce:	0008f497          	auipc	s1,0x8f
ffffffffc02076d2:	1f248493          	addi	s1,s1,498 # ffffffffc02968c0 <current>
ffffffffc02076d6:	6098                	ld	a4,0(s1)
ffffffffc02076d8:	e0a2                	sd	s0,64(sp)
ffffffffc02076da:	f84a                	sd	s2,48(sp)
ffffffffc02076dc:	7340                	ld	s0,160(a4)
ffffffffc02076de:	e486                	sd	ra,72(sp)
ffffffffc02076e0:	0ff00793          	li	a5,255
ffffffffc02076e4:	05042903          	lw	s2,80(s0)
ffffffffc02076e8:	0327ee63          	bltu	a5,s2,ffffffffc0207724 <syscall+0x5a>
ffffffffc02076ec:	00391713          	slli	a4,s2,0x3
ffffffffc02076f0:	00006797          	auipc	a5,0x6
ffffffffc02076f4:	3b078793          	addi	a5,a5,944 # ffffffffc020daa0 <syscalls>
ffffffffc02076f8:	97ba                	add	a5,a5,a4
ffffffffc02076fa:	639c                	ld	a5,0(a5)
ffffffffc02076fc:	c785                	beqz	a5,ffffffffc0207724 <syscall+0x5a>
ffffffffc02076fe:	6c28                	ld	a0,88(s0)
ffffffffc0207700:	702c                	ld	a1,96(s0)
ffffffffc0207702:	7430                	ld	a2,104(s0)
ffffffffc0207704:	7834                	ld	a3,112(s0)
ffffffffc0207706:	7c38                	ld	a4,120(s0)
ffffffffc0207708:	e42a                	sd	a0,8(sp)
ffffffffc020770a:	e82e                	sd	a1,16(sp)
ffffffffc020770c:	ec32                	sd	a2,24(sp)
ffffffffc020770e:	f036                	sd	a3,32(sp)
ffffffffc0207710:	f43a                	sd	a4,40(sp)
ffffffffc0207712:	0028                	addi	a0,sp,8
ffffffffc0207714:	9782                	jalr	a5
ffffffffc0207716:	60a6                	ld	ra,72(sp)
ffffffffc0207718:	e828                	sd	a0,80(s0)
ffffffffc020771a:	6406                	ld	s0,64(sp)
ffffffffc020771c:	74e2                	ld	s1,56(sp)
ffffffffc020771e:	7942                	ld	s2,48(sp)
ffffffffc0207720:	6161                	addi	sp,sp,80
ffffffffc0207722:	8082                	ret
ffffffffc0207724:	8522                	mv	a0,s0
ffffffffc0207726:	865f90ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc020772a:	609c                	ld	a5,0(s1)
ffffffffc020772c:	86ca                	mv	a3,s2
ffffffffc020772e:	00006617          	auipc	a2,0x6
ffffffffc0207732:	32a60613          	addi	a2,a2,810 # ffffffffc020da58 <CSWTCH.79+0x760>
ffffffffc0207736:	43d8                	lw	a4,4(a5)
ffffffffc0207738:	0d800593          	li	a1,216
ffffffffc020773c:	0b478793          	addi	a5,a5,180
ffffffffc0207740:	00006517          	auipc	a0,0x6
ffffffffc0207744:	34850513          	addi	a0,a0,840 # ffffffffc020da88 <CSWTCH.79+0x790>
ffffffffc0207748:	d57f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020774c <__alloc_inode>:
ffffffffc020774c:	1141                	addi	sp,sp,-16
ffffffffc020774e:	e022                	sd	s0,0(sp)
ffffffffc0207750:	842a                	mv	s0,a0
ffffffffc0207752:	07800513          	li	a0,120
ffffffffc0207756:	e406                	sd	ra,8(sp)
ffffffffc0207758:	837fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020775c:	c111                	beqz	a0,ffffffffc0207760 <__alloc_inode+0x14>
ffffffffc020775e:	cd20                	sw	s0,88(a0)
ffffffffc0207760:	60a2                	ld	ra,8(sp)
ffffffffc0207762:	6402                	ld	s0,0(sp)
ffffffffc0207764:	0141                	addi	sp,sp,16
ffffffffc0207766:	8082                	ret

ffffffffc0207768 <inode_init>:
ffffffffc0207768:	4785                	li	a5,1
ffffffffc020776a:	06052023          	sw	zero,96(a0)
ffffffffc020776e:	f92c                	sd	a1,112(a0)
ffffffffc0207770:	f530                	sd	a2,104(a0)
ffffffffc0207772:	cd7c                	sw	a5,92(a0)
ffffffffc0207774:	8082                	ret

ffffffffc0207776 <inode_kill>:
ffffffffc0207776:	4d78                	lw	a4,92(a0)
ffffffffc0207778:	1141                	addi	sp,sp,-16
ffffffffc020777a:	e406                	sd	ra,8(sp)
ffffffffc020777c:	e719                	bnez	a4,ffffffffc020778a <inode_kill+0x14>
ffffffffc020777e:	513c                	lw	a5,96(a0)
ffffffffc0207780:	e78d                	bnez	a5,ffffffffc02077aa <inode_kill+0x34>
ffffffffc0207782:	60a2                	ld	ra,8(sp)
ffffffffc0207784:	0141                	addi	sp,sp,16
ffffffffc0207786:	8b9fa06f          	j	ffffffffc020203e <kfree>
ffffffffc020778a:	00007697          	auipc	a3,0x7
ffffffffc020778e:	b1668693          	addi	a3,a3,-1258 # ffffffffc020e2a0 <syscalls+0x800>
ffffffffc0207792:	00004617          	auipc	a2,0x4
ffffffffc0207796:	16660613          	addi	a2,a2,358 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020779a:	02900593          	li	a1,41
ffffffffc020779e:	00007517          	auipc	a0,0x7
ffffffffc02077a2:	b2250513          	addi	a0,a0,-1246 # ffffffffc020e2c0 <syscalls+0x820>
ffffffffc02077a6:	cf9f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02077aa:	00007697          	auipc	a3,0x7
ffffffffc02077ae:	b2e68693          	addi	a3,a3,-1234 # ffffffffc020e2d8 <syscalls+0x838>
ffffffffc02077b2:	00004617          	auipc	a2,0x4
ffffffffc02077b6:	14660613          	addi	a2,a2,326 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02077ba:	02a00593          	li	a1,42
ffffffffc02077be:	00007517          	auipc	a0,0x7
ffffffffc02077c2:	b0250513          	addi	a0,a0,-1278 # ffffffffc020e2c0 <syscalls+0x820>
ffffffffc02077c6:	cd9f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02077ca <inode_ref_inc>:
ffffffffc02077ca:	4d7c                	lw	a5,92(a0)
ffffffffc02077cc:	2785                	addiw	a5,a5,1
ffffffffc02077ce:	cd7c                	sw	a5,92(a0)
ffffffffc02077d0:	0007851b          	sext.w	a0,a5
ffffffffc02077d4:	8082                	ret

ffffffffc02077d6 <inode_open_inc>:
ffffffffc02077d6:	513c                	lw	a5,96(a0)
ffffffffc02077d8:	2785                	addiw	a5,a5,1
ffffffffc02077da:	d13c                	sw	a5,96(a0)
ffffffffc02077dc:	0007851b          	sext.w	a0,a5
ffffffffc02077e0:	8082                	ret

ffffffffc02077e2 <inode_check>:
ffffffffc02077e2:	1141                	addi	sp,sp,-16
ffffffffc02077e4:	e406                	sd	ra,8(sp)
ffffffffc02077e6:	c90d                	beqz	a0,ffffffffc0207818 <inode_check+0x36>
ffffffffc02077e8:	793c                	ld	a5,112(a0)
ffffffffc02077ea:	c79d                	beqz	a5,ffffffffc0207818 <inode_check+0x36>
ffffffffc02077ec:	6398                	ld	a4,0(a5)
ffffffffc02077ee:	4625d7b7          	lui	a5,0x4625d
ffffffffc02077f2:	0786                	slli	a5,a5,0x1
ffffffffc02077f4:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc02077f8:	08f71063          	bne	a4,a5,ffffffffc0207878 <inode_check+0x96>
ffffffffc02077fc:	4d78                	lw	a4,92(a0)
ffffffffc02077fe:	513c                	lw	a5,96(a0)
ffffffffc0207800:	04f74c63          	blt	a4,a5,ffffffffc0207858 <inode_check+0x76>
ffffffffc0207804:	0407ca63          	bltz	a5,ffffffffc0207858 <inode_check+0x76>
ffffffffc0207808:	66c1                	lui	a3,0x10
ffffffffc020780a:	02d75763          	bge	a4,a3,ffffffffc0207838 <inode_check+0x56>
ffffffffc020780e:	02d7d563          	bge	a5,a3,ffffffffc0207838 <inode_check+0x56>
ffffffffc0207812:	60a2                	ld	ra,8(sp)
ffffffffc0207814:	0141                	addi	sp,sp,16
ffffffffc0207816:	8082                	ret
ffffffffc0207818:	00007697          	auipc	a3,0x7
ffffffffc020781c:	ae068693          	addi	a3,a3,-1312 # ffffffffc020e2f8 <syscalls+0x858>
ffffffffc0207820:	00004617          	auipc	a2,0x4
ffffffffc0207824:	0d860613          	addi	a2,a2,216 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207828:	06e00593          	li	a1,110
ffffffffc020782c:	00007517          	auipc	a0,0x7
ffffffffc0207830:	a9450513          	addi	a0,a0,-1388 # ffffffffc020e2c0 <syscalls+0x820>
ffffffffc0207834:	c6bf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207838:	00007697          	auipc	a3,0x7
ffffffffc020783c:	b4068693          	addi	a3,a3,-1216 # ffffffffc020e378 <syscalls+0x8d8>
ffffffffc0207840:	00004617          	auipc	a2,0x4
ffffffffc0207844:	0b860613          	addi	a2,a2,184 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207848:	07200593          	li	a1,114
ffffffffc020784c:	00007517          	auipc	a0,0x7
ffffffffc0207850:	a7450513          	addi	a0,a0,-1420 # ffffffffc020e2c0 <syscalls+0x820>
ffffffffc0207854:	c4bf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207858:	00007697          	auipc	a3,0x7
ffffffffc020785c:	af068693          	addi	a3,a3,-1296 # ffffffffc020e348 <syscalls+0x8a8>
ffffffffc0207860:	00004617          	auipc	a2,0x4
ffffffffc0207864:	09860613          	addi	a2,a2,152 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207868:	07100593          	li	a1,113
ffffffffc020786c:	00007517          	auipc	a0,0x7
ffffffffc0207870:	a5450513          	addi	a0,a0,-1452 # ffffffffc020e2c0 <syscalls+0x820>
ffffffffc0207874:	c2bf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207878:	00007697          	auipc	a3,0x7
ffffffffc020787c:	aa868693          	addi	a3,a3,-1368 # ffffffffc020e320 <syscalls+0x880>
ffffffffc0207880:	00004617          	auipc	a2,0x4
ffffffffc0207884:	07860613          	addi	a2,a2,120 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207888:	06f00593          	li	a1,111
ffffffffc020788c:	00007517          	auipc	a0,0x7
ffffffffc0207890:	a3450513          	addi	a0,a0,-1484 # ffffffffc020e2c0 <syscalls+0x820>
ffffffffc0207894:	c0bf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207898 <inode_ref_dec>:
ffffffffc0207898:	4d7c                	lw	a5,92(a0)
ffffffffc020789a:	1101                	addi	sp,sp,-32
ffffffffc020789c:	ec06                	sd	ra,24(sp)
ffffffffc020789e:	e822                	sd	s0,16(sp)
ffffffffc02078a0:	e426                	sd	s1,8(sp)
ffffffffc02078a2:	e04a                	sd	s2,0(sp)
ffffffffc02078a4:	06f05e63          	blez	a5,ffffffffc0207920 <inode_ref_dec+0x88>
ffffffffc02078a8:	fff7849b          	addiw	s1,a5,-1
ffffffffc02078ac:	cd64                	sw	s1,92(a0)
ffffffffc02078ae:	842a                	mv	s0,a0
ffffffffc02078b0:	e09d                	bnez	s1,ffffffffc02078d6 <inode_ref_dec+0x3e>
ffffffffc02078b2:	793c                	ld	a5,112(a0)
ffffffffc02078b4:	c7b1                	beqz	a5,ffffffffc0207900 <inode_ref_dec+0x68>
ffffffffc02078b6:	0487b903          	ld	s2,72(a5)
ffffffffc02078ba:	04090363          	beqz	s2,ffffffffc0207900 <inode_ref_dec+0x68>
ffffffffc02078be:	00007597          	auipc	a1,0x7
ffffffffc02078c2:	b6a58593          	addi	a1,a1,-1174 # ffffffffc020e428 <syscalls+0x988>
ffffffffc02078c6:	f1dff0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc02078ca:	8522                	mv	a0,s0
ffffffffc02078cc:	9902                	jalr	s2
ffffffffc02078ce:	c501                	beqz	a0,ffffffffc02078d6 <inode_ref_dec+0x3e>
ffffffffc02078d0:	57c5                	li	a5,-15
ffffffffc02078d2:	00f51963          	bne	a0,a5,ffffffffc02078e4 <inode_ref_dec+0x4c>
ffffffffc02078d6:	60e2                	ld	ra,24(sp)
ffffffffc02078d8:	6442                	ld	s0,16(sp)
ffffffffc02078da:	6902                	ld	s2,0(sp)
ffffffffc02078dc:	8526                	mv	a0,s1
ffffffffc02078de:	64a2                	ld	s1,8(sp)
ffffffffc02078e0:	6105                	addi	sp,sp,32
ffffffffc02078e2:	8082                	ret
ffffffffc02078e4:	85aa                	mv	a1,a0
ffffffffc02078e6:	00007517          	auipc	a0,0x7
ffffffffc02078ea:	b4a50513          	addi	a0,a0,-1206 # ffffffffc020e430 <syscalls+0x990>
ffffffffc02078ee:	8b9f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02078f2:	60e2                	ld	ra,24(sp)
ffffffffc02078f4:	6442                	ld	s0,16(sp)
ffffffffc02078f6:	6902                	ld	s2,0(sp)
ffffffffc02078f8:	8526                	mv	a0,s1
ffffffffc02078fa:	64a2                	ld	s1,8(sp)
ffffffffc02078fc:	6105                	addi	sp,sp,32
ffffffffc02078fe:	8082                	ret
ffffffffc0207900:	00007697          	auipc	a3,0x7
ffffffffc0207904:	ad868693          	addi	a3,a3,-1320 # ffffffffc020e3d8 <syscalls+0x938>
ffffffffc0207908:	00004617          	auipc	a2,0x4
ffffffffc020790c:	ff060613          	addi	a2,a2,-16 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207910:	04400593          	li	a1,68
ffffffffc0207914:	00007517          	auipc	a0,0x7
ffffffffc0207918:	9ac50513          	addi	a0,a0,-1620 # ffffffffc020e2c0 <syscalls+0x820>
ffffffffc020791c:	b83f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207920:	00007697          	auipc	a3,0x7
ffffffffc0207924:	a9868693          	addi	a3,a3,-1384 # ffffffffc020e3b8 <syscalls+0x918>
ffffffffc0207928:	00004617          	auipc	a2,0x4
ffffffffc020792c:	fd060613          	addi	a2,a2,-48 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207930:	03f00593          	li	a1,63
ffffffffc0207934:	00007517          	auipc	a0,0x7
ffffffffc0207938:	98c50513          	addi	a0,a0,-1652 # ffffffffc020e2c0 <syscalls+0x820>
ffffffffc020793c:	b63f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207940 <inode_open_dec>:
ffffffffc0207940:	513c                	lw	a5,96(a0)
ffffffffc0207942:	1101                	addi	sp,sp,-32
ffffffffc0207944:	ec06                	sd	ra,24(sp)
ffffffffc0207946:	e822                	sd	s0,16(sp)
ffffffffc0207948:	e426                	sd	s1,8(sp)
ffffffffc020794a:	e04a                	sd	s2,0(sp)
ffffffffc020794c:	06f05b63          	blez	a5,ffffffffc02079c2 <inode_open_dec+0x82>
ffffffffc0207950:	fff7849b          	addiw	s1,a5,-1
ffffffffc0207954:	d124                	sw	s1,96(a0)
ffffffffc0207956:	842a                	mv	s0,a0
ffffffffc0207958:	e085                	bnez	s1,ffffffffc0207978 <inode_open_dec+0x38>
ffffffffc020795a:	793c                	ld	a5,112(a0)
ffffffffc020795c:	c3b9                	beqz	a5,ffffffffc02079a2 <inode_open_dec+0x62>
ffffffffc020795e:	0107b903          	ld	s2,16(a5)
ffffffffc0207962:	04090063          	beqz	s2,ffffffffc02079a2 <inode_open_dec+0x62>
ffffffffc0207966:	00007597          	auipc	a1,0x7
ffffffffc020796a:	b5a58593          	addi	a1,a1,-1190 # ffffffffc020e4c0 <syscalls+0xa20>
ffffffffc020796e:	e75ff0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0207972:	8522                	mv	a0,s0
ffffffffc0207974:	9902                	jalr	s2
ffffffffc0207976:	e901                	bnez	a0,ffffffffc0207986 <inode_open_dec+0x46>
ffffffffc0207978:	60e2                	ld	ra,24(sp)
ffffffffc020797a:	6442                	ld	s0,16(sp)
ffffffffc020797c:	6902                	ld	s2,0(sp)
ffffffffc020797e:	8526                	mv	a0,s1
ffffffffc0207980:	64a2                	ld	s1,8(sp)
ffffffffc0207982:	6105                	addi	sp,sp,32
ffffffffc0207984:	8082                	ret
ffffffffc0207986:	85aa                	mv	a1,a0
ffffffffc0207988:	00007517          	auipc	a0,0x7
ffffffffc020798c:	b4050513          	addi	a0,a0,-1216 # ffffffffc020e4c8 <syscalls+0xa28>
ffffffffc0207990:	817f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207994:	60e2                	ld	ra,24(sp)
ffffffffc0207996:	6442                	ld	s0,16(sp)
ffffffffc0207998:	6902                	ld	s2,0(sp)
ffffffffc020799a:	8526                	mv	a0,s1
ffffffffc020799c:	64a2                	ld	s1,8(sp)
ffffffffc020799e:	6105                	addi	sp,sp,32
ffffffffc02079a0:	8082                	ret
ffffffffc02079a2:	00007697          	auipc	a3,0x7
ffffffffc02079a6:	ace68693          	addi	a3,a3,-1330 # ffffffffc020e470 <syscalls+0x9d0>
ffffffffc02079aa:	00004617          	auipc	a2,0x4
ffffffffc02079ae:	f4e60613          	addi	a2,a2,-178 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02079b2:	06100593          	li	a1,97
ffffffffc02079b6:	00007517          	auipc	a0,0x7
ffffffffc02079ba:	90a50513          	addi	a0,a0,-1782 # ffffffffc020e2c0 <syscalls+0x820>
ffffffffc02079be:	ae1f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02079c2:	00007697          	auipc	a3,0x7
ffffffffc02079c6:	a8e68693          	addi	a3,a3,-1394 # ffffffffc020e450 <syscalls+0x9b0>
ffffffffc02079ca:	00004617          	auipc	a2,0x4
ffffffffc02079ce:	f2e60613          	addi	a2,a2,-210 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02079d2:	05c00593          	li	a1,92
ffffffffc02079d6:	00007517          	auipc	a0,0x7
ffffffffc02079da:	8ea50513          	addi	a0,a0,-1814 # ffffffffc020e2c0 <syscalls+0x820>
ffffffffc02079de:	ac1f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02079e2 <__alloc_fs>:
ffffffffc02079e2:	1141                	addi	sp,sp,-16
ffffffffc02079e4:	e022                	sd	s0,0(sp)
ffffffffc02079e6:	842a                	mv	s0,a0
ffffffffc02079e8:	0d800513          	li	a0,216
ffffffffc02079ec:	e406                	sd	ra,8(sp)
ffffffffc02079ee:	da0fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02079f2:	c119                	beqz	a0,ffffffffc02079f8 <__alloc_fs+0x16>
ffffffffc02079f4:	0a852823          	sw	s0,176(a0)
ffffffffc02079f8:	60a2                	ld	ra,8(sp)
ffffffffc02079fa:	6402                	ld	s0,0(sp)
ffffffffc02079fc:	0141                	addi	sp,sp,16
ffffffffc02079fe:	8082                	ret

ffffffffc0207a00 <vfs_init>:
ffffffffc0207a00:	1141                	addi	sp,sp,-16
ffffffffc0207a02:	4585                	li	a1,1
ffffffffc0207a04:	0008e517          	auipc	a0,0x8e
ffffffffc0207a08:	dfc50513          	addi	a0,a0,-516 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a0c:	e406                	sd	ra,8(sp)
ffffffffc0207a0e:	aabfc0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc0207a12:	60a2                	ld	ra,8(sp)
ffffffffc0207a14:	0141                	addi	sp,sp,16
ffffffffc0207a16:	a40d                	j	ffffffffc0207c38 <vfs_devlist_init>

ffffffffc0207a18 <vfs_set_bootfs>:
ffffffffc0207a18:	7179                	addi	sp,sp,-48
ffffffffc0207a1a:	f022                	sd	s0,32(sp)
ffffffffc0207a1c:	f406                	sd	ra,40(sp)
ffffffffc0207a1e:	ec26                	sd	s1,24(sp)
ffffffffc0207a20:	e402                	sd	zero,8(sp)
ffffffffc0207a22:	842a                	mv	s0,a0
ffffffffc0207a24:	c915                	beqz	a0,ffffffffc0207a58 <vfs_set_bootfs+0x40>
ffffffffc0207a26:	03a00593          	li	a1,58
ffffffffc0207a2a:	1d7030ef          	jal	ra,ffffffffc020b400 <strchr>
ffffffffc0207a2e:	c135                	beqz	a0,ffffffffc0207a92 <vfs_set_bootfs+0x7a>
ffffffffc0207a30:	00154783          	lbu	a5,1(a0)
ffffffffc0207a34:	efb9                	bnez	a5,ffffffffc0207a92 <vfs_set_bootfs+0x7a>
ffffffffc0207a36:	8522                	mv	a0,s0
ffffffffc0207a38:	11f000ef          	jal	ra,ffffffffc0208356 <vfs_chdir>
ffffffffc0207a3c:	842a                	mv	s0,a0
ffffffffc0207a3e:	c519                	beqz	a0,ffffffffc0207a4c <vfs_set_bootfs+0x34>
ffffffffc0207a40:	70a2                	ld	ra,40(sp)
ffffffffc0207a42:	8522                	mv	a0,s0
ffffffffc0207a44:	7402                	ld	s0,32(sp)
ffffffffc0207a46:	64e2                	ld	s1,24(sp)
ffffffffc0207a48:	6145                	addi	sp,sp,48
ffffffffc0207a4a:	8082                	ret
ffffffffc0207a4c:	0028                	addi	a0,sp,8
ffffffffc0207a4e:	013000ef          	jal	ra,ffffffffc0208260 <vfs_get_curdir>
ffffffffc0207a52:	842a                	mv	s0,a0
ffffffffc0207a54:	f575                	bnez	a0,ffffffffc0207a40 <vfs_set_bootfs+0x28>
ffffffffc0207a56:	6422                	ld	s0,8(sp)
ffffffffc0207a58:	0008e517          	auipc	a0,0x8e
ffffffffc0207a5c:	da850513          	addi	a0,a0,-600 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a60:	a63fc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207a64:	0008f797          	auipc	a5,0x8f
ffffffffc0207a68:	e8c78793          	addi	a5,a5,-372 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207a6c:	6384                	ld	s1,0(a5)
ffffffffc0207a6e:	0008e517          	auipc	a0,0x8e
ffffffffc0207a72:	d9250513          	addi	a0,a0,-622 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a76:	e380                	sd	s0,0(a5)
ffffffffc0207a78:	4401                	li	s0,0
ffffffffc0207a7a:	a45fc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207a7e:	d0e9                	beqz	s1,ffffffffc0207a40 <vfs_set_bootfs+0x28>
ffffffffc0207a80:	8526                	mv	a0,s1
ffffffffc0207a82:	e17ff0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc0207a86:	70a2                	ld	ra,40(sp)
ffffffffc0207a88:	8522                	mv	a0,s0
ffffffffc0207a8a:	7402                	ld	s0,32(sp)
ffffffffc0207a8c:	64e2                	ld	s1,24(sp)
ffffffffc0207a8e:	6145                	addi	sp,sp,48
ffffffffc0207a90:	8082                	ret
ffffffffc0207a92:	5475                	li	s0,-3
ffffffffc0207a94:	b775                	j	ffffffffc0207a40 <vfs_set_bootfs+0x28>

ffffffffc0207a96 <vfs_get_bootfs>:
ffffffffc0207a96:	1101                	addi	sp,sp,-32
ffffffffc0207a98:	e426                	sd	s1,8(sp)
ffffffffc0207a9a:	0008f497          	auipc	s1,0x8f
ffffffffc0207a9e:	e5648493          	addi	s1,s1,-426 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207aa2:	609c                	ld	a5,0(s1)
ffffffffc0207aa4:	ec06                	sd	ra,24(sp)
ffffffffc0207aa6:	e822                	sd	s0,16(sp)
ffffffffc0207aa8:	c3a1                	beqz	a5,ffffffffc0207ae8 <vfs_get_bootfs+0x52>
ffffffffc0207aaa:	842a                	mv	s0,a0
ffffffffc0207aac:	0008e517          	auipc	a0,0x8e
ffffffffc0207ab0:	d5450513          	addi	a0,a0,-684 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207ab4:	a0ffc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207ab8:	6084                	ld	s1,0(s1)
ffffffffc0207aba:	c08d                	beqz	s1,ffffffffc0207adc <vfs_get_bootfs+0x46>
ffffffffc0207abc:	8526                	mv	a0,s1
ffffffffc0207abe:	d0dff0ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc0207ac2:	0008e517          	auipc	a0,0x8e
ffffffffc0207ac6:	d3e50513          	addi	a0,a0,-706 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207aca:	9f5fc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207ace:	4501                	li	a0,0
ffffffffc0207ad0:	e004                	sd	s1,0(s0)
ffffffffc0207ad2:	60e2                	ld	ra,24(sp)
ffffffffc0207ad4:	6442                	ld	s0,16(sp)
ffffffffc0207ad6:	64a2                	ld	s1,8(sp)
ffffffffc0207ad8:	6105                	addi	sp,sp,32
ffffffffc0207ada:	8082                	ret
ffffffffc0207adc:	0008e517          	auipc	a0,0x8e
ffffffffc0207ae0:	d2450513          	addi	a0,a0,-732 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207ae4:	9dbfc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207ae8:	5541                	li	a0,-16
ffffffffc0207aea:	b7e5                	j	ffffffffc0207ad2 <vfs_get_bootfs+0x3c>

ffffffffc0207aec <vfs_do_add>:
ffffffffc0207aec:	7139                	addi	sp,sp,-64
ffffffffc0207aee:	fc06                	sd	ra,56(sp)
ffffffffc0207af0:	f822                	sd	s0,48(sp)
ffffffffc0207af2:	f426                	sd	s1,40(sp)
ffffffffc0207af4:	f04a                	sd	s2,32(sp)
ffffffffc0207af6:	ec4e                	sd	s3,24(sp)
ffffffffc0207af8:	e852                	sd	s4,16(sp)
ffffffffc0207afa:	e456                	sd	s5,8(sp)
ffffffffc0207afc:	e05a                	sd	s6,0(sp)
ffffffffc0207afe:	0e050b63          	beqz	a0,ffffffffc0207bf4 <vfs_do_add+0x108>
ffffffffc0207b02:	842a                	mv	s0,a0
ffffffffc0207b04:	8a2e                	mv	s4,a1
ffffffffc0207b06:	8b32                	mv	s6,a2
ffffffffc0207b08:	8ab6                	mv	s5,a3
ffffffffc0207b0a:	c5cd                	beqz	a1,ffffffffc0207bb4 <vfs_do_add+0xc8>
ffffffffc0207b0c:	4db8                	lw	a4,88(a1)
ffffffffc0207b0e:	6785                	lui	a5,0x1
ffffffffc0207b10:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207b14:	0af71163          	bne	a4,a5,ffffffffc0207bb6 <vfs_do_add+0xca>
ffffffffc0207b18:	8522                	mv	a0,s0
ffffffffc0207b1a:	05b030ef          	jal	ra,ffffffffc020b374 <strlen>
ffffffffc0207b1e:	47fd                	li	a5,31
ffffffffc0207b20:	0ca7e663          	bltu	a5,a0,ffffffffc0207bec <vfs_do_add+0x100>
ffffffffc0207b24:	8522                	mv	a0,s0
ffffffffc0207b26:	ecef80ef          	jal	ra,ffffffffc02001f4 <strdup>
ffffffffc0207b2a:	84aa                	mv	s1,a0
ffffffffc0207b2c:	c171                	beqz	a0,ffffffffc0207bf0 <vfs_do_add+0x104>
ffffffffc0207b2e:	03000513          	li	a0,48
ffffffffc0207b32:	c5cfa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207b36:	89aa                	mv	s3,a0
ffffffffc0207b38:	c92d                	beqz	a0,ffffffffc0207baa <vfs_do_add+0xbe>
ffffffffc0207b3a:	0008e517          	auipc	a0,0x8e
ffffffffc0207b3e:	cee50513          	addi	a0,a0,-786 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207b42:	0008e917          	auipc	s2,0x8e
ffffffffc0207b46:	cd690913          	addi	s2,s2,-810 # ffffffffc0295818 <vdev_list>
ffffffffc0207b4a:	979fc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207b4e:	844a                	mv	s0,s2
ffffffffc0207b50:	a039                	j	ffffffffc0207b5e <vfs_do_add+0x72>
ffffffffc0207b52:	fe043503          	ld	a0,-32(s0)
ffffffffc0207b56:	85a6                	mv	a1,s1
ffffffffc0207b58:	065030ef          	jal	ra,ffffffffc020b3bc <strcmp>
ffffffffc0207b5c:	cd2d                	beqz	a0,ffffffffc0207bd6 <vfs_do_add+0xea>
ffffffffc0207b5e:	6400                	ld	s0,8(s0)
ffffffffc0207b60:	ff2419e3          	bne	s0,s2,ffffffffc0207b52 <vfs_do_add+0x66>
ffffffffc0207b64:	6418                	ld	a4,8(s0)
ffffffffc0207b66:	02098793          	addi	a5,s3,32
ffffffffc0207b6a:	0099b023          	sd	s1,0(s3)
ffffffffc0207b6e:	0149b423          	sd	s4,8(s3)
ffffffffc0207b72:	0159bc23          	sd	s5,24(s3)
ffffffffc0207b76:	0169b823          	sd	s6,16(s3)
ffffffffc0207b7a:	e31c                	sd	a5,0(a4)
ffffffffc0207b7c:	0289b023          	sd	s0,32(s3)
ffffffffc0207b80:	02e9b423          	sd	a4,40(s3)
ffffffffc0207b84:	0008e517          	auipc	a0,0x8e
ffffffffc0207b88:	ca450513          	addi	a0,a0,-860 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207b8c:	e41c                	sd	a5,8(s0)
ffffffffc0207b8e:	4401                	li	s0,0
ffffffffc0207b90:	92ffc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207b94:	70e2                	ld	ra,56(sp)
ffffffffc0207b96:	8522                	mv	a0,s0
ffffffffc0207b98:	7442                	ld	s0,48(sp)
ffffffffc0207b9a:	74a2                	ld	s1,40(sp)
ffffffffc0207b9c:	7902                	ld	s2,32(sp)
ffffffffc0207b9e:	69e2                	ld	s3,24(sp)
ffffffffc0207ba0:	6a42                	ld	s4,16(sp)
ffffffffc0207ba2:	6aa2                	ld	s5,8(sp)
ffffffffc0207ba4:	6b02                	ld	s6,0(sp)
ffffffffc0207ba6:	6121                	addi	sp,sp,64
ffffffffc0207ba8:	8082                	ret
ffffffffc0207baa:	5471                	li	s0,-4
ffffffffc0207bac:	8526                	mv	a0,s1
ffffffffc0207bae:	c90fa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207bb2:	b7cd                	j	ffffffffc0207b94 <vfs_do_add+0xa8>
ffffffffc0207bb4:	d2b5                	beqz	a3,ffffffffc0207b18 <vfs_do_add+0x2c>
ffffffffc0207bb6:	00007697          	auipc	a3,0x7
ffffffffc0207bba:	95a68693          	addi	a3,a3,-1702 # ffffffffc020e510 <syscalls+0xa70>
ffffffffc0207bbe:	00004617          	auipc	a2,0x4
ffffffffc0207bc2:	d3a60613          	addi	a2,a2,-710 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207bc6:	08f00593          	li	a1,143
ffffffffc0207bca:	00007517          	auipc	a0,0x7
ffffffffc0207bce:	92e50513          	addi	a0,a0,-1746 # ffffffffc020e4f8 <syscalls+0xa58>
ffffffffc0207bd2:	8cdf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207bd6:	0008e517          	auipc	a0,0x8e
ffffffffc0207bda:	c5250513          	addi	a0,a0,-942 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207bde:	8e1fc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207be2:	854e                	mv	a0,s3
ffffffffc0207be4:	c5afa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207be8:	5425                	li	s0,-23
ffffffffc0207bea:	b7c9                	j	ffffffffc0207bac <vfs_do_add+0xc0>
ffffffffc0207bec:	5451                	li	s0,-12
ffffffffc0207bee:	b75d                	j	ffffffffc0207b94 <vfs_do_add+0xa8>
ffffffffc0207bf0:	5471                	li	s0,-4
ffffffffc0207bf2:	b74d                	j	ffffffffc0207b94 <vfs_do_add+0xa8>
ffffffffc0207bf4:	00007697          	auipc	a3,0x7
ffffffffc0207bf8:	8f468693          	addi	a3,a3,-1804 # ffffffffc020e4e8 <syscalls+0xa48>
ffffffffc0207bfc:	00004617          	auipc	a2,0x4
ffffffffc0207c00:	cfc60613          	addi	a2,a2,-772 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207c04:	08e00593          	li	a1,142
ffffffffc0207c08:	00007517          	auipc	a0,0x7
ffffffffc0207c0c:	8f050513          	addi	a0,a0,-1808 # ffffffffc020e4f8 <syscalls+0xa58>
ffffffffc0207c10:	88ff80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207c14 <find_mount.part.0>:
ffffffffc0207c14:	1141                	addi	sp,sp,-16
ffffffffc0207c16:	00007697          	auipc	a3,0x7
ffffffffc0207c1a:	8d268693          	addi	a3,a3,-1838 # ffffffffc020e4e8 <syscalls+0xa48>
ffffffffc0207c1e:	00004617          	auipc	a2,0x4
ffffffffc0207c22:	cda60613          	addi	a2,a2,-806 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207c26:	0cd00593          	li	a1,205
ffffffffc0207c2a:	00007517          	auipc	a0,0x7
ffffffffc0207c2e:	8ce50513          	addi	a0,a0,-1842 # ffffffffc020e4f8 <syscalls+0xa58>
ffffffffc0207c32:	e406                	sd	ra,8(sp)
ffffffffc0207c34:	86bf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207c38 <vfs_devlist_init>:
ffffffffc0207c38:	0008e797          	auipc	a5,0x8e
ffffffffc0207c3c:	be078793          	addi	a5,a5,-1056 # ffffffffc0295818 <vdev_list>
ffffffffc0207c40:	4585                	li	a1,1
ffffffffc0207c42:	0008e517          	auipc	a0,0x8e
ffffffffc0207c46:	be650513          	addi	a0,a0,-1050 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c4a:	e79c                	sd	a5,8(a5)
ffffffffc0207c4c:	e39c                	sd	a5,0(a5)
ffffffffc0207c4e:	86bfc06f          	j	ffffffffc02044b8 <sem_init>

ffffffffc0207c52 <vfs_cleanup>:
ffffffffc0207c52:	1101                	addi	sp,sp,-32
ffffffffc0207c54:	e426                	sd	s1,8(sp)
ffffffffc0207c56:	0008e497          	auipc	s1,0x8e
ffffffffc0207c5a:	bc248493          	addi	s1,s1,-1086 # ffffffffc0295818 <vdev_list>
ffffffffc0207c5e:	649c                	ld	a5,8(s1)
ffffffffc0207c60:	ec06                	sd	ra,24(sp)
ffffffffc0207c62:	e822                	sd	s0,16(sp)
ffffffffc0207c64:	02978e63          	beq	a5,s1,ffffffffc0207ca0 <vfs_cleanup+0x4e>
ffffffffc0207c68:	0008e517          	auipc	a0,0x8e
ffffffffc0207c6c:	bc050513          	addi	a0,a0,-1088 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c70:	853fc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207c74:	6480                	ld	s0,8(s1)
ffffffffc0207c76:	00940b63          	beq	s0,s1,ffffffffc0207c8c <vfs_cleanup+0x3a>
ffffffffc0207c7a:	ff043783          	ld	a5,-16(s0)
ffffffffc0207c7e:	853e                	mv	a0,a5
ffffffffc0207c80:	c399                	beqz	a5,ffffffffc0207c86 <vfs_cleanup+0x34>
ffffffffc0207c82:	6bfc                	ld	a5,208(a5)
ffffffffc0207c84:	9782                	jalr	a5
ffffffffc0207c86:	6400                	ld	s0,8(s0)
ffffffffc0207c88:	fe9419e3          	bne	s0,s1,ffffffffc0207c7a <vfs_cleanup+0x28>
ffffffffc0207c8c:	6442                	ld	s0,16(sp)
ffffffffc0207c8e:	60e2                	ld	ra,24(sp)
ffffffffc0207c90:	64a2                	ld	s1,8(sp)
ffffffffc0207c92:	0008e517          	auipc	a0,0x8e
ffffffffc0207c96:	b9650513          	addi	a0,a0,-1130 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c9a:	6105                	addi	sp,sp,32
ffffffffc0207c9c:	823fc06f          	j	ffffffffc02044be <up>
ffffffffc0207ca0:	60e2                	ld	ra,24(sp)
ffffffffc0207ca2:	6442                	ld	s0,16(sp)
ffffffffc0207ca4:	64a2                	ld	s1,8(sp)
ffffffffc0207ca6:	6105                	addi	sp,sp,32
ffffffffc0207ca8:	8082                	ret

ffffffffc0207caa <vfs_get_root>:
ffffffffc0207caa:	7179                	addi	sp,sp,-48
ffffffffc0207cac:	f406                	sd	ra,40(sp)
ffffffffc0207cae:	f022                	sd	s0,32(sp)
ffffffffc0207cb0:	ec26                	sd	s1,24(sp)
ffffffffc0207cb2:	e84a                	sd	s2,16(sp)
ffffffffc0207cb4:	e44e                	sd	s3,8(sp)
ffffffffc0207cb6:	e052                	sd	s4,0(sp)
ffffffffc0207cb8:	c541                	beqz	a0,ffffffffc0207d40 <vfs_get_root+0x96>
ffffffffc0207cba:	0008e917          	auipc	s2,0x8e
ffffffffc0207cbe:	b5e90913          	addi	s2,s2,-1186 # ffffffffc0295818 <vdev_list>
ffffffffc0207cc2:	00893783          	ld	a5,8(s2)
ffffffffc0207cc6:	07278b63          	beq	a5,s2,ffffffffc0207d3c <vfs_get_root+0x92>
ffffffffc0207cca:	89aa                	mv	s3,a0
ffffffffc0207ccc:	0008e517          	auipc	a0,0x8e
ffffffffc0207cd0:	b5c50513          	addi	a0,a0,-1188 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207cd4:	8a2e                	mv	s4,a1
ffffffffc0207cd6:	844a                	mv	s0,s2
ffffffffc0207cd8:	feafc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207cdc:	a801                	j	ffffffffc0207cec <vfs_get_root+0x42>
ffffffffc0207cde:	fe043583          	ld	a1,-32(s0)
ffffffffc0207ce2:	854e                	mv	a0,s3
ffffffffc0207ce4:	6d8030ef          	jal	ra,ffffffffc020b3bc <strcmp>
ffffffffc0207ce8:	84aa                	mv	s1,a0
ffffffffc0207cea:	c505                	beqz	a0,ffffffffc0207d12 <vfs_get_root+0x68>
ffffffffc0207cec:	6400                	ld	s0,8(s0)
ffffffffc0207cee:	ff2418e3          	bne	s0,s2,ffffffffc0207cde <vfs_get_root+0x34>
ffffffffc0207cf2:	54cd                	li	s1,-13
ffffffffc0207cf4:	0008e517          	auipc	a0,0x8e
ffffffffc0207cf8:	b3450513          	addi	a0,a0,-1228 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207cfc:	fc2fc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207d00:	70a2                	ld	ra,40(sp)
ffffffffc0207d02:	7402                	ld	s0,32(sp)
ffffffffc0207d04:	6942                	ld	s2,16(sp)
ffffffffc0207d06:	69a2                	ld	s3,8(sp)
ffffffffc0207d08:	6a02                	ld	s4,0(sp)
ffffffffc0207d0a:	8526                	mv	a0,s1
ffffffffc0207d0c:	64e2                	ld	s1,24(sp)
ffffffffc0207d0e:	6145                	addi	sp,sp,48
ffffffffc0207d10:	8082                	ret
ffffffffc0207d12:	ff043503          	ld	a0,-16(s0)
ffffffffc0207d16:	c519                	beqz	a0,ffffffffc0207d24 <vfs_get_root+0x7a>
ffffffffc0207d18:	617c                	ld	a5,192(a0)
ffffffffc0207d1a:	9782                	jalr	a5
ffffffffc0207d1c:	c519                	beqz	a0,ffffffffc0207d2a <vfs_get_root+0x80>
ffffffffc0207d1e:	00aa3023          	sd	a0,0(s4)
ffffffffc0207d22:	bfc9                	j	ffffffffc0207cf4 <vfs_get_root+0x4a>
ffffffffc0207d24:	ff843783          	ld	a5,-8(s0)
ffffffffc0207d28:	c399                	beqz	a5,ffffffffc0207d2e <vfs_get_root+0x84>
ffffffffc0207d2a:	54c9                	li	s1,-14
ffffffffc0207d2c:	b7e1                	j	ffffffffc0207cf4 <vfs_get_root+0x4a>
ffffffffc0207d2e:	fe843503          	ld	a0,-24(s0)
ffffffffc0207d32:	a99ff0ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc0207d36:	fe843503          	ld	a0,-24(s0)
ffffffffc0207d3a:	b7cd                	j	ffffffffc0207d1c <vfs_get_root+0x72>
ffffffffc0207d3c:	54cd                	li	s1,-13
ffffffffc0207d3e:	b7c9                	j	ffffffffc0207d00 <vfs_get_root+0x56>
ffffffffc0207d40:	00006697          	auipc	a3,0x6
ffffffffc0207d44:	7a868693          	addi	a3,a3,1960 # ffffffffc020e4e8 <syscalls+0xa48>
ffffffffc0207d48:	00004617          	auipc	a2,0x4
ffffffffc0207d4c:	bb060613          	addi	a2,a2,-1104 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207d50:	04500593          	li	a1,69
ffffffffc0207d54:	00006517          	auipc	a0,0x6
ffffffffc0207d58:	7a450513          	addi	a0,a0,1956 # ffffffffc020e4f8 <syscalls+0xa58>
ffffffffc0207d5c:	f42f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207d60 <vfs_get_devname>:
ffffffffc0207d60:	0008e697          	auipc	a3,0x8e
ffffffffc0207d64:	ab868693          	addi	a3,a3,-1352 # ffffffffc0295818 <vdev_list>
ffffffffc0207d68:	87b6                	mv	a5,a3
ffffffffc0207d6a:	e511                	bnez	a0,ffffffffc0207d76 <vfs_get_devname+0x16>
ffffffffc0207d6c:	a829                	j	ffffffffc0207d86 <vfs_get_devname+0x26>
ffffffffc0207d6e:	ff07b703          	ld	a4,-16(a5)
ffffffffc0207d72:	00a70763          	beq	a4,a0,ffffffffc0207d80 <vfs_get_devname+0x20>
ffffffffc0207d76:	679c                	ld	a5,8(a5)
ffffffffc0207d78:	fed79be3          	bne	a5,a3,ffffffffc0207d6e <vfs_get_devname+0xe>
ffffffffc0207d7c:	4501                	li	a0,0
ffffffffc0207d7e:	8082                	ret
ffffffffc0207d80:	fe07b503          	ld	a0,-32(a5)
ffffffffc0207d84:	8082                	ret
ffffffffc0207d86:	1141                	addi	sp,sp,-16
ffffffffc0207d88:	00006697          	auipc	a3,0x6
ffffffffc0207d8c:	7e868693          	addi	a3,a3,2024 # ffffffffc020e570 <syscalls+0xad0>
ffffffffc0207d90:	00004617          	auipc	a2,0x4
ffffffffc0207d94:	b6860613          	addi	a2,a2,-1176 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207d98:	06a00593          	li	a1,106
ffffffffc0207d9c:	00006517          	auipc	a0,0x6
ffffffffc0207da0:	75c50513          	addi	a0,a0,1884 # ffffffffc020e4f8 <syscalls+0xa58>
ffffffffc0207da4:	e406                	sd	ra,8(sp)
ffffffffc0207da6:	ef8f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207daa <vfs_add_dev>:
ffffffffc0207daa:	86b2                	mv	a3,a2
ffffffffc0207dac:	4601                	li	a2,0
ffffffffc0207dae:	d3fff06f          	j	ffffffffc0207aec <vfs_do_add>

ffffffffc0207db2 <vfs_mount>:
ffffffffc0207db2:	7179                	addi	sp,sp,-48
ffffffffc0207db4:	e84a                	sd	s2,16(sp)
ffffffffc0207db6:	892a                	mv	s2,a0
ffffffffc0207db8:	0008e517          	auipc	a0,0x8e
ffffffffc0207dbc:	a7050513          	addi	a0,a0,-1424 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207dc0:	e44e                	sd	s3,8(sp)
ffffffffc0207dc2:	f406                	sd	ra,40(sp)
ffffffffc0207dc4:	f022                	sd	s0,32(sp)
ffffffffc0207dc6:	ec26                	sd	s1,24(sp)
ffffffffc0207dc8:	89ae                	mv	s3,a1
ffffffffc0207dca:	ef8fc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207dce:	08090a63          	beqz	s2,ffffffffc0207e62 <vfs_mount+0xb0>
ffffffffc0207dd2:	0008e497          	auipc	s1,0x8e
ffffffffc0207dd6:	a4648493          	addi	s1,s1,-1466 # ffffffffc0295818 <vdev_list>
ffffffffc0207dda:	6480                	ld	s0,8(s1)
ffffffffc0207ddc:	00941663          	bne	s0,s1,ffffffffc0207de8 <vfs_mount+0x36>
ffffffffc0207de0:	a8ad                	j	ffffffffc0207e5a <vfs_mount+0xa8>
ffffffffc0207de2:	6400                	ld	s0,8(s0)
ffffffffc0207de4:	06940b63          	beq	s0,s1,ffffffffc0207e5a <vfs_mount+0xa8>
ffffffffc0207de8:	ff843783          	ld	a5,-8(s0)
ffffffffc0207dec:	dbfd                	beqz	a5,ffffffffc0207de2 <vfs_mount+0x30>
ffffffffc0207dee:	fe043503          	ld	a0,-32(s0)
ffffffffc0207df2:	85ca                	mv	a1,s2
ffffffffc0207df4:	5c8030ef          	jal	ra,ffffffffc020b3bc <strcmp>
ffffffffc0207df8:	f56d                	bnez	a0,ffffffffc0207de2 <vfs_mount+0x30>
ffffffffc0207dfa:	ff043783          	ld	a5,-16(s0)
ffffffffc0207dfe:	e3a5                	bnez	a5,ffffffffc0207e5e <vfs_mount+0xac>
ffffffffc0207e00:	fe043783          	ld	a5,-32(s0)
ffffffffc0207e04:	c3c9                	beqz	a5,ffffffffc0207e86 <vfs_mount+0xd4>
ffffffffc0207e06:	ff843783          	ld	a5,-8(s0)
ffffffffc0207e0a:	cfb5                	beqz	a5,ffffffffc0207e86 <vfs_mount+0xd4>
ffffffffc0207e0c:	fe843503          	ld	a0,-24(s0)
ffffffffc0207e10:	c939                	beqz	a0,ffffffffc0207e66 <vfs_mount+0xb4>
ffffffffc0207e12:	4d38                	lw	a4,88(a0)
ffffffffc0207e14:	6785                	lui	a5,0x1
ffffffffc0207e16:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207e1a:	04f71663          	bne	a4,a5,ffffffffc0207e66 <vfs_mount+0xb4>
ffffffffc0207e1e:	ff040593          	addi	a1,s0,-16
ffffffffc0207e22:	9982                	jalr	s3
ffffffffc0207e24:	84aa                	mv	s1,a0
ffffffffc0207e26:	ed01                	bnez	a0,ffffffffc0207e3e <vfs_mount+0x8c>
ffffffffc0207e28:	ff043783          	ld	a5,-16(s0)
ffffffffc0207e2c:	cfad                	beqz	a5,ffffffffc0207ea6 <vfs_mount+0xf4>
ffffffffc0207e2e:	fe043583          	ld	a1,-32(s0)
ffffffffc0207e32:	00006517          	auipc	a0,0x6
ffffffffc0207e36:	7ce50513          	addi	a0,a0,1998 # ffffffffc020e600 <syscalls+0xb60>
ffffffffc0207e3a:	b6cf80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207e3e:	0008e517          	auipc	a0,0x8e
ffffffffc0207e42:	9ea50513          	addi	a0,a0,-1558 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207e46:	e78fc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207e4a:	70a2                	ld	ra,40(sp)
ffffffffc0207e4c:	7402                	ld	s0,32(sp)
ffffffffc0207e4e:	6942                	ld	s2,16(sp)
ffffffffc0207e50:	69a2                	ld	s3,8(sp)
ffffffffc0207e52:	8526                	mv	a0,s1
ffffffffc0207e54:	64e2                	ld	s1,24(sp)
ffffffffc0207e56:	6145                	addi	sp,sp,48
ffffffffc0207e58:	8082                	ret
ffffffffc0207e5a:	54cd                	li	s1,-13
ffffffffc0207e5c:	b7cd                	j	ffffffffc0207e3e <vfs_mount+0x8c>
ffffffffc0207e5e:	54c5                	li	s1,-15
ffffffffc0207e60:	bff9                	j	ffffffffc0207e3e <vfs_mount+0x8c>
ffffffffc0207e62:	db3ff0ef          	jal	ra,ffffffffc0207c14 <find_mount.part.0>
ffffffffc0207e66:	00006697          	auipc	a3,0x6
ffffffffc0207e6a:	74a68693          	addi	a3,a3,1866 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc0207e6e:	00004617          	auipc	a2,0x4
ffffffffc0207e72:	a8a60613          	addi	a2,a2,-1398 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207e76:	0ed00593          	li	a1,237
ffffffffc0207e7a:	00006517          	auipc	a0,0x6
ffffffffc0207e7e:	67e50513          	addi	a0,a0,1662 # ffffffffc020e4f8 <syscalls+0xa58>
ffffffffc0207e82:	e1cf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207e86:	00006697          	auipc	a3,0x6
ffffffffc0207e8a:	6fa68693          	addi	a3,a3,1786 # ffffffffc020e580 <syscalls+0xae0>
ffffffffc0207e8e:	00004617          	auipc	a2,0x4
ffffffffc0207e92:	a6a60613          	addi	a2,a2,-1430 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207e96:	0eb00593          	li	a1,235
ffffffffc0207e9a:	00006517          	auipc	a0,0x6
ffffffffc0207e9e:	65e50513          	addi	a0,a0,1630 # ffffffffc020e4f8 <syscalls+0xa58>
ffffffffc0207ea2:	dfcf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207ea6:	00006697          	auipc	a3,0x6
ffffffffc0207eaa:	74268693          	addi	a3,a3,1858 # ffffffffc020e5e8 <syscalls+0xb48>
ffffffffc0207eae:	00004617          	auipc	a2,0x4
ffffffffc0207eb2:	a4a60613          	addi	a2,a2,-1462 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207eb6:	0ef00593          	li	a1,239
ffffffffc0207eba:	00006517          	auipc	a0,0x6
ffffffffc0207ebe:	63e50513          	addi	a0,a0,1598 # ffffffffc020e4f8 <syscalls+0xa58>
ffffffffc0207ec2:	ddcf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207ec6 <vfs_open>:
ffffffffc0207ec6:	711d                	addi	sp,sp,-96
ffffffffc0207ec8:	e4a6                	sd	s1,72(sp)
ffffffffc0207eca:	e0ca                	sd	s2,64(sp)
ffffffffc0207ecc:	fc4e                	sd	s3,56(sp)
ffffffffc0207ece:	ec86                	sd	ra,88(sp)
ffffffffc0207ed0:	e8a2                	sd	s0,80(sp)
ffffffffc0207ed2:	f852                	sd	s4,48(sp)
ffffffffc0207ed4:	f456                	sd	s5,40(sp)
ffffffffc0207ed6:	0035f793          	andi	a5,a1,3
ffffffffc0207eda:	84ae                	mv	s1,a1
ffffffffc0207edc:	892a                	mv	s2,a0
ffffffffc0207ede:	89b2                	mv	s3,a2
ffffffffc0207ee0:	0e078663          	beqz	a5,ffffffffc0207fcc <vfs_open+0x106>
ffffffffc0207ee4:	470d                	li	a4,3
ffffffffc0207ee6:	0105fa93          	andi	s5,a1,16
ffffffffc0207eea:	0ce78f63          	beq	a5,a4,ffffffffc0207fc8 <vfs_open+0x102>
ffffffffc0207eee:	002c                	addi	a1,sp,8
ffffffffc0207ef0:	854a                	mv	a0,s2
ffffffffc0207ef2:	2ae000ef          	jal	ra,ffffffffc02081a0 <vfs_lookup>
ffffffffc0207ef6:	842a                	mv	s0,a0
ffffffffc0207ef8:	0044fa13          	andi	s4,s1,4
ffffffffc0207efc:	e159                	bnez	a0,ffffffffc0207f82 <vfs_open+0xbc>
ffffffffc0207efe:	00c4f793          	andi	a5,s1,12
ffffffffc0207f02:	4731                	li	a4,12
ffffffffc0207f04:	0ee78263          	beq	a5,a4,ffffffffc0207fe8 <vfs_open+0x122>
ffffffffc0207f08:	6422                	ld	s0,8(sp)
ffffffffc0207f0a:	12040163          	beqz	s0,ffffffffc020802c <vfs_open+0x166>
ffffffffc0207f0e:	783c                	ld	a5,112(s0)
ffffffffc0207f10:	cff1                	beqz	a5,ffffffffc0207fec <vfs_open+0x126>
ffffffffc0207f12:	679c                	ld	a5,8(a5)
ffffffffc0207f14:	cfe1                	beqz	a5,ffffffffc0207fec <vfs_open+0x126>
ffffffffc0207f16:	8522                	mv	a0,s0
ffffffffc0207f18:	00006597          	auipc	a1,0x6
ffffffffc0207f1c:	7c858593          	addi	a1,a1,1992 # ffffffffc020e6e0 <syscalls+0xc40>
ffffffffc0207f20:	8c3ff0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0207f24:	783c                	ld	a5,112(s0)
ffffffffc0207f26:	6522                	ld	a0,8(sp)
ffffffffc0207f28:	85a6                	mv	a1,s1
ffffffffc0207f2a:	679c                	ld	a5,8(a5)
ffffffffc0207f2c:	9782                	jalr	a5
ffffffffc0207f2e:	842a                	mv	s0,a0
ffffffffc0207f30:	6522                	ld	a0,8(sp)
ffffffffc0207f32:	e845                	bnez	s0,ffffffffc0207fe2 <vfs_open+0x11c>
ffffffffc0207f34:	015a6a33          	or	s4,s4,s5
ffffffffc0207f38:	89fff0ef          	jal	ra,ffffffffc02077d6 <inode_open_inc>
ffffffffc0207f3c:	020a0663          	beqz	s4,ffffffffc0207f68 <vfs_open+0xa2>
ffffffffc0207f40:	64a2                	ld	s1,8(sp)
ffffffffc0207f42:	c4e9                	beqz	s1,ffffffffc020800c <vfs_open+0x146>
ffffffffc0207f44:	78bc                	ld	a5,112(s1)
ffffffffc0207f46:	c3f9                	beqz	a5,ffffffffc020800c <vfs_open+0x146>
ffffffffc0207f48:	73bc                	ld	a5,96(a5)
ffffffffc0207f4a:	c3e9                	beqz	a5,ffffffffc020800c <vfs_open+0x146>
ffffffffc0207f4c:	00006597          	auipc	a1,0x6
ffffffffc0207f50:	7f458593          	addi	a1,a1,2036 # ffffffffc020e740 <syscalls+0xca0>
ffffffffc0207f54:	8526                	mv	a0,s1
ffffffffc0207f56:	88dff0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0207f5a:	78bc                	ld	a5,112(s1)
ffffffffc0207f5c:	6522                	ld	a0,8(sp)
ffffffffc0207f5e:	4581                	li	a1,0
ffffffffc0207f60:	73bc                	ld	a5,96(a5)
ffffffffc0207f62:	9782                	jalr	a5
ffffffffc0207f64:	87aa                	mv	a5,a0
ffffffffc0207f66:	e92d                	bnez	a0,ffffffffc0207fd8 <vfs_open+0x112>
ffffffffc0207f68:	67a2                	ld	a5,8(sp)
ffffffffc0207f6a:	00f9b023          	sd	a5,0(s3)
ffffffffc0207f6e:	60e6                	ld	ra,88(sp)
ffffffffc0207f70:	8522                	mv	a0,s0
ffffffffc0207f72:	6446                	ld	s0,80(sp)
ffffffffc0207f74:	64a6                	ld	s1,72(sp)
ffffffffc0207f76:	6906                	ld	s2,64(sp)
ffffffffc0207f78:	79e2                	ld	s3,56(sp)
ffffffffc0207f7a:	7a42                	ld	s4,48(sp)
ffffffffc0207f7c:	7aa2                	ld	s5,40(sp)
ffffffffc0207f7e:	6125                	addi	sp,sp,96
ffffffffc0207f80:	8082                	ret
ffffffffc0207f82:	57c1                	li	a5,-16
ffffffffc0207f84:	fef515e3          	bne	a0,a5,ffffffffc0207f6e <vfs_open+0xa8>
ffffffffc0207f88:	fe0a03e3          	beqz	s4,ffffffffc0207f6e <vfs_open+0xa8>
ffffffffc0207f8c:	0810                	addi	a2,sp,16
ffffffffc0207f8e:	082c                	addi	a1,sp,24
ffffffffc0207f90:	854a                	mv	a0,s2
ffffffffc0207f92:	2a4000ef          	jal	ra,ffffffffc0208236 <vfs_lookup_parent>
ffffffffc0207f96:	842a                	mv	s0,a0
ffffffffc0207f98:	f979                	bnez	a0,ffffffffc0207f6e <vfs_open+0xa8>
ffffffffc0207f9a:	6462                	ld	s0,24(sp)
ffffffffc0207f9c:	c845                	beqz	s0,ffffffffc020804c <vfs_open+0x186>
ffffffffc0207f9e:	783c                	ld	a5,112(s0)
ffffffffc0207fa0:	c7d5                	beqz	a5,ffffffffc020804c <vfs_open+0x186>
ffffffffc0207fa2:	77bc                	ld	a5,104(a5)
ffffffffc0207fa4:	c7c5                	beqz	a5,ffffffffc020804c <vfs_open+0x186>
ffffffffc0207fa6:	8522                	mv	a0,s0
ffffffffc0207fa8:	00006597          	auipc	a1,0x6
ffffffffc0207fac:	6d058593          	addi	a1,a1,1744 # ffffffffc020e678 <syscalls+0xbd8>
ffffffffc0207fb0:	833ff0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0207fb4:	783c                	ld	a5,112(s0)
ffffffffc0207fb6:	65c2                	ld	a1,16(sp)
ffffffffc0207fb8:	6562                	ld	a0,24(sp)
ffffffffc0207fba:	77bc                	ld	a5,104(a5)
ffffffffc0207fbc:	4034d613          	srai	a2,s1,0x3
ffffffffc0207fc0:	0034                	addi	a3,sp,8
ffffffffc0207fc2:	8a05                	andi	a2,a2,1
ffffffffc0207fc4:	9782                	jalr	a5
ffffffffc0207fc6:	b789                	j	ffffffffc0207f08 <vfs_open+0x42>
ffffffffc0207fc8:	5475                	li	s0,-3
ffffffffc0207fca:	b755                	j	ffffffffc0207f6e <vfs_open+0xa8>
ffffffffc0207fcc:	0105fa93          	andi	s5,a1,16
ffffffffc0207fd0:	5475                	li	s0,-3
ffffffffc0207fd2:	f80a9ee3          	bnez	s5,ffffffffc0207f6e <vfs_open+0xa8>
ffffffffc0207fd6:	bf21                	j	ffffffffc0207eee <vfs_open+0x28>
ffffffffc0207fd8:	6522                	ld	a0,8(sp)
ffffffffc0207fda:	843e                	mv	s0,a5
ffffffffc0207fdc:	965ff0ef          	jal	ra,ffffffffc0207940 <inode_open_dec>
ffffffffc0207fe0:	6522                	ld	a0,8(sp)
ffffffffc0207fe2:	8b7ff0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc0207fe6:	b761                	j	ffffffffc0207f6e <vfs_open+0xa8>
ffffffffc0207fe8:	5425                	li	s0,-23
ffffffffc0207fea:	b751                	j	ffffffffc0207f6e <vfs_open+0xa8>
ffffffffc0207fec:	00006697          	auipc	a3,0x6
ffffffffc0207ff0:	6a468693          	addi	a3,a3,1700 # ffffffffc020e690 <syscalls+0xbf0>
ffffffffc0207ff4:	00004617          	auipc	a2,0x4
ffffffffc0207ff8:	90460613          	addi	a2,a2,-1788 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0207ffc:	03300593          	li	a1,51
ffffffffc0208000:	00006517          	auipc	a0,0x6
ffffffffc0208004:	66050513          	addi	a0,a0,1632 # ffffffffc020e660 <syscalls+0xbc0>
ffffffffc0208008:	c96f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020800c:	00006697          	auipc	a3,0x6
ffffffffc0208010:	6dc68693          	addi	a3,a3,1756 # ffffffffc020e6e8 <syscalls+0xc48>
ffffffffc0208014:	00004617          	auipc	a2,0x4
ffffffffc0208018:	8e460613          	addi	a2,a2,-1820 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020801c:	03a00593          	li	a1,58
ffffffffc0208020:	00006517          	auipc	a0,0x6
ffffffffc0208024:	64050513          	addi	a0,a0,1600 # ffffffffc020e660 <syscalls+0xbc0>
ffffffffc0208028:	c76f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020802c:	00006697          	auipc	a3,0x6
ffffffffc0208030:	65468693          	addi	a3,a3,1620 # ffffffffc020e680 <syscalls+0xbe0>
ffffffffc0208034:	00004617          	auipc	a2,0x4
ffffffffc0208038:	8c460613          	addi	a2,a2,-1852 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020803c:	03100593          	li	a1,49
ffffffffc0208040:	00006517          	auipc	a0,0x6
ffffffffc0208044:	62050513          	addi	a0,a0,1568 # ffffffffc020e660 <syscalls+0xbc0>
ffffffffc0208048:	c56f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020804c:	00006697          	auipc	a3,0x6
ffffffffc0208050:	5c468693          	addi	a3,a3,1476 # ffffffffc020e610 <syscalls+0xb70>
ffffffffc0208054:	00004617          	auipc	a2,0x4
ffffffffc0208058:	8a460613          	addi	a2,a2,-1884 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020805c:	02c00593          	li	a1,44
ffffffffc0208060:	00006517          	auipc	a0,0x6
ffffffffc0208064:	60050513          	addi	a0,a0,1536 # ffffffffc020e660 <syscalls+0xbc0>
ffffffffc0208068:	c36f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020806c <vfs_close>:
ffffffffc020806c:	1141                	addi	sp,sp,-16
ffffffffc020806e:	e406                	sd	ra,8(sp)
ffffffffc0208070:	e022                	sd	s0,0(sp)
ffffffffc0208072:	842a                	mv	s0,a0
ffffffffc0208074:	8cdff0ef          	jal	ra,ffffffffc0207940 <inode_open_dec>
ffffffffc0208078:	8522                	mv	a0,s0
ffffffffc020807a:	81fff0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc020807e:	60a2                	ld	ra,8(sp)
ffffffffc0208080:	6402                	ld	s0,0(sp)
ffffffffc0208082:	4501                	li	a0,0
ffffffffc0208084:	0141                	addi	sp,sp,16
ffffffffc0208086:	8082                	ret

ffffffffc0208088 <get_device>:
ffffffffc0208088:	7179                	addi	sp,sp,-48
ffffffffc020808a:	ec26                	sd	s1,24(sp)
ffffffffc020808c:	e84a                	sd	s2,16(sp)
ffffffffc020808e:	f406                	sd	ra,40(sp)
ffffffffc0208090:	f022                	sd	s0,32(sp)
ffffffffc0208092:	00054303          	lbu	t1,0(a0)
ffffffffc0208096:	892e                	mv	s2,a1
ffffffffc0208098:	84b2                	mv	s1,a2
ffffffffc020809a:	02030463          	beqz	t1,ffffffffc02080c2 <get_device+0x3a>
ffffffffc020809e:	00150413          	addi	s0,a0,1
ffffffffc02080a2:	86a2                	mv	a3,s0
ffffffffc02080a4:	879a                	mv	a5,t1
ffffffffc02080a6:	4701                	li	a4,0
ffffffffc02080a8:	03a00813          	li	a6,58
ffffffffc02080ac:	02f00893          	li	a7,47
ffffffffc02080b0:	03078263          	beq	a5,a6,ffffffffc02080d4 <get_device+0x4c>
ffffffffc02080b4:	05178963          	beq	a5,a7,ffffffffc0208106 <get_device+0x7e>
ffffffffc02080b8:	0006c783          	lbu	a5,0(a3)
ffffffffc02080bc:	2705                	addiw	a4,a4,1
ffffffffc02080be:	0685                	addi	a3,a3,1
ffffffffc02080c0:	fbe5                	bnez	a5,ffffffffc02080b0 <get_device+0x28>
ffffffffc02080c2:	7402                	ld	s0,32(sp)
ffffffffc02080c4:	00a93023          	sd	a0,0(s2)
ffffffffc02080c8:	70a2                	ld	ra,40(sp)
ffffffffc02080ca:	6942                	ld	s2,16(sp)
ffffffffc02080cc:	8526                	mv	a0,s1
ffffffffc02080ce:	64e2                	ld	s1,24(sp)
ffffffffc02080d0:	6145                	addi	sp,sp,48
ffffffffc02080d2:	a279                	j	ffffffffc0208260 <vfs_get_curdir>
ffffffffc02080d4:	cb15                	beqz	a4,ffffffffc0208108 <get_device+0x80>
ffffffffc02080d6:	00e507b3          	add	a5,a0,a4
ffffffffc02080da:	0705                	addi	a4,a4,1
ffffffffc02080dc:	00078023          	sb	zero,0(a5)
ffffffffc02080e0:	972a                	add	a4,a4,a0
ffffffffc02080e2:	02f00613          	li	a2,47
ffffffffc02080e6:	00074783          	lbu	a5,0(a4)
ffffffffc02080ea:	86ba                	mv	a3,a4
ffffffffc02080ec:	0705                	addi	a4,a4,1
ffffffffc02080ee:	fec78ce3          	beq	a5,a2,ffffffffc02080e6 <get_device+0x5e>
ffffffffc02080f2:	7402                	ld	s0,32(sp)
ffffffffc02080f4:	70a2                	ld	ra,40(sp)
ffffffffc02080f6:	00d93023          	sd	a3,0(s2)
ffffffffc02080fa:	85a6                	mv	a1,s1
ffffffffc02080fc:	6942                	ld	s2,16(sp)
ffffffffc02080fe:	64e2                	ld	s1,24(sp)
ffffffffc0208100:	6145                	addi	sp,sp,48
ffffffffc0208102:	ba9ff06f          	j	ffffffffc0207caa <vfs_get_root>
ffffffffc0208106:	ff55                	bnez	a4,ffffffffc02080c2 <get_device+0x3a>
ffffffffc0208108:	02f00793          	li	a5,47
ffffffffc020810c:	04f30563          	beq	t1,a5,ffffffffc0208156 <get_device+0xce>
ffffffffc0208110:	03a00793          	li	a5,58
ffffffffc0208114:	06f31663          	bne	t1,a5,ffffffffc0208180 <get_device+0xf8>
ffffffffc0208118:	0028                	addi	a0,sp,8
ffffffffc020811a:	146000ef          	jal	ra,ffffffffc0208260 <vfs_get_curdir>
ffffffffc020811e:	e515                	bnez	a0,ffffffffc020814a <get_device+0xc2>
ffffffffc0208120:	67a2                	ld	a5,8(sp)
ffffffffc0208122:	77a8                	ld	a0,104(a5)
ffffffffc0208124:	cd15                	beqz	a0,ffffffffc0208160 <get_device+0xd8>
ffffffffc0208126:	617c                	ld	a5,192(a0)
ffffffffc0208128:	9782                	jalr	a5
ffffffffc020812a:	87aa                	mv	a5,a0
ffffffffc020812c:	6522                	ld	a0,8(sp)
ffffffffc020812e:	e09c                	sd	a5,0(s1)
ffffffffc0208130:	f68ff0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc0208134:	02f00713          	li	a4,47
ffffffffc0208138:	a011                	j	ffffffffc020813c <get_device+0xb4>
ffffffffc020813a:	0405                	addi	s0,s0,1
ffffffffc020813c:	00044783          	lbu	a5,0(s0)
ffffffffc0208140:	fee78de3          	beq	a5,a4,ffffffffc020813a <get_device+0xb2>
ffffffffc0208144:	00893023          	sd	s0,0(s2)
ffffffffc0208148:	4501                	li	a0,0
ffffffffc020814a:	70a2                	ld	ra,40(sp)
ffffffffc020814c:	7402                	ld	s0,32(sp)
ffffffffc020814e:	64e2                	ld	s1,24(sp)
ffffffffc0208150:	6942                	ld	s2,16(sp)
ffffffffc0208152:	6145                	addi	sp,sp,48
ffffffffc0208154:	8082                	ret
ffffffffc0208156:	8526                	mv	a0,s1
ffffffffc0208158:	93fff0ef          	jal	ra,ffffffffc0207a96 <vfs_get_bootfs>
ffffffffc020815c:	dd61                	beqz	a0,ffffffffc0208134 <get_device+0xac>
ffffffffc020815e:	b7f5                	j	ffffffffc020814a <get_device+0xc2>
ffffffffc0208160:	00006697          	auipc	a3,0x6
ffffffffc0208164:	61868693          	addi	a3,a3,1560 # ffffffffc020e778 <syscalls+0xcd8>
ffffffffc0208168:	00003617          	auipc	a2,0x3
ffffffffc020816c:	79060613          	addi	a2,a2,1936 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208170:	03900593          	li	a1,57
ffffffffc0208174:	00006517          	auipc	a0,0x6
ffffffffc0208178:	5ec50513          	addi	a0,a0,1516 # ffffffffc020e760 <syscalls+0xcc0>
ffffffffc020817c:	b22f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208180:	00006697          	auipc	a3,0x6
ffffffffc0208184:	5d068693          	addi	a3,a3,1488 # ffffffffc020e750 <syscalls+0xcb0>
ffffffffc0208188:	00003617          	auipc	a2,0x3
ffffffffc020818c:	77060613          	addi	a2,a2,1904 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208190:	03300593          	li	a1,51
ffffffffc0208194:	00006517          	auipc	a0,0x6
ffffffffc0208198:	5cc50513          	addi	a0,a0,1484 # ffffffffc020e760 <syscalls+0xcc0>
ffffffffc020819c:	b02f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02081a0 <vfs_lookup>:
ffffffffc02081a0:	7139                	addi	sp,sp,-64
ffffffffc02081a2:	f426                	sd	s1,40(sp)
ffffffffc02081a4:	0830                	addi	a2,sp,24
ffffffffc02081a6:	84ae                	mv	s1,a1
ffffffffc02081a8:	002c                	addi	a1,sp,8
ffffffffc02081aa:	f822                	sd	s0,48(sp)
ffffffffc02081ac:	fc06                	sd	ra,56(sp)
ffffffffc02081ae:	f04a                	sd	s2,32(sp)
ffffffffc02081b0:	e42a                	sd	a0,8(sp)
ffffffffc02081b2:	ed7ff0ef          	jal	ra,ffffffffc0208088 <get_device>
ffffffffc02081b6:	842a                	mv	s0,a0
ffffffffc02081b8:	ed1d                	bnez	a0,ffffffffc02081f6 <vfs_lookup+0x56>
ffffffffc02081ba:	67a2                	ld	a5,8(sp)
ffffffffc02081bc:	6962                	ld	s2,24(sp)
ffffffffc02081be:	0007c783          	lbu	a5,0(a5)
ffffffffc02081c2:	c3a9                	beqz	a5,ffffffffc0208204 <vfs_lookup+0x64>
ffffffffc02081c4:	04090963          	beqz	s2,ffffffffc0208216 <vfs_lookup+0x76>
ffffffffc02081c8:	07093783          	ld	a5,112(s2)
ffffffffc02081cc:	c7a9                	beqz	a5,ffffffffc0208216 <vfs_lookup+0x76>
ffffffffc02081ce:	7bbc                	ld	a5,112(a5)
ffffffffc02081d0:	c3b9                	beqz	a5,ffffffffc0208216 <vfs_lookup+0x76>
ffffffffc02081d2:	854a                	mv	a0,s2
ffffffffc02081d4:	00006597          	auipc	a1,0x6
ffffffffc02081d8:	60c58593          	addi	a1,a1,1548 # ffffffffc020e7e0 <syscalls+0xd40>
ffffffffc02081dc:	e06ff0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc02081e0:	07093783          	ld	a5,112(s2)
ffffffffc02081e4:	65a2                	ld	a1,8(sp)
ffffffffc02081e6:	6562                	ld	a0,24(sp)
ffffffffc02081e8:	7bbc                	ld	a5,112(a5)
ffffffffc02081ea:	8626                	mv	a2,s1
ffffffffc02081ec:	9782                	jalr	a5
ffffffffc02081ee:	842a                	mv	s0,a0
ffffffffc02081f0:	6562                	ld	a0,24(sp)
ffffffffc02081f2:	ea6ff0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc02081f6:	70e2                	ld	ra,56(sp)
ffffffffc02081f8:	8522                	mv	a0,s0
ffffffffc02081fa:	7442                	ld	s0,48(sp)
ffffffffc02081fc:	74a2                	ld	s1,40(sp)
ffffffffc02081fe:	7902                	ld	s2,32(sp)
ffffffffc0208200:	6121                	addi	sp,sp,64
ffffffffc0208202:	8082                	ret
ffffffffc0208204:	70e2                	ld	ra,56(sp)
ffffffffc0208206:	8522                	mv	a0,s0
ffffffffc0208208:	7442                	ld	s0,48(sp)
ffffffffc020820a:	0124b023          	sd	s2,0(s1)
ffffffffc020820e:	74a2                	ld	s1,40(sp)
ffffffffc0208210:	7902                	ld	s2,32(sp)
ffffffffc0208212:	6121                	addi	sp,sp,64
ffffffffc0208214:	8082                	ret
ffffffffc0208216:	00006697          	auipc	a3,0x6
ffffffffc020821a:	57a68693          	addi	a3,a3,1402 # ffffffffc020e790 <syscalls+0xcf0>
ffffffffc020821e:	00003617          	auipc	a2,0x3
ffffffffc0208222:	6da60613          	addi	a2,a2,1754 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208226:	04f00593          	li	a1,79
ffffffffc020822a:	00006517          	auipc	a0,0x6
ffffffffc020822e:	53650513          	addi	a0,a0,1334 # ffffffffc020e760 <syscalls+0xcc0>
ffffffffc0208232:	a6cf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208236 <vfs_lookup_parent>:
ffffffffc0208236:	7139                	addi	sp,sp,-64
ffffffffc0208238:	f822                	sd	s0,48(sp)
ffffffffc020823a:	f426                	sd	s1,40(sp)
ffffffffc020823c:	842e                	mv	s0,a1
ffffffffc020823e:	84b2                	mv	s1,a2
ffffffffc0208240:	002c                	addi	a1,sp,8
ffffffffc0208242:	0830                	addi	a2,sp,24
ffffffffc0208244:	fc06                	sd	ra,56(sp)
ffffffffc0208246:	e42a                	sd	a0,8(sp)
ffffffffc0208248:	e41ff0ef          	jal	ra,ffffffffc0208088 <get_device>
ffffffffc020824c:	e509                	bnez	a0,ffffffffc0208256 <vfs_lookup_parent+0x20>
ffffffffc020824e:	67a2                	ld	a5,8(sp)
ffffffffc0208250:	e09c                	sd	a5,0(s1)
ffffffffc0208252:	67e2                	ld	a5,24(sp)
ffffffffc0208254:	e01c                	sd	a5,0(s0)
ffffffffc0208256:	70e2                	ld	ra,56(sp)
ffffffffc0208258:	7442                	ld	s0,48(sp)
ffffffffc020825a:	74a2                	ld	s1,40(sp)
ffffffffc020825c:	6121                	addi	sp,sp,64
ffffffffc020825e:	8082                	ret

ffffffffc0208260 <vfs_get_curdir>:
ffffffffc0208260:	0008e797          	auipc	a5,0x8e
ffffffffc0208264:	6607b783          	ld	a5,1632(a5) # ffffffffc02968c0 <current>
ffffffffc0208268:	1487b783          	ld	a5,328(a5)
ffffffffc020826c:	1101                	addi	sp,sp,-32
ffffffffc020826e:	e426                	sd	s1,8(sp)
ffffffffc0208270:	6384                	ld	s1,0(a5)
ffffffffc0208272:	ec06                	sd	ra,24(sp)
ffffffffc0208274:	e822                	sd	s0,16(sp)
ffffffffc0208276:	cc81                	beqz	s1,ffffffffc020828e <vfs_get_curdir+0x2e>
ffffffffc0208278:	842a                	mv	s0,a0
ffffffffc020827a:	8526                	mv	a0,s1
ffffffffc020827c:	d4eff0ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc0208280:	4501                	li	a0,0
ffffffffc0208282:	e004                	sd	s1,0(s0)
ffffffffc0208284:	60e2                	ld	ra,24(sp)
ffffffffc0208286:	6442                	ld	s0,16(sp)
ffffffffc0208288:	64a2                	ld	s1,8(sp)
ffffffffc020828a:	6105                	addi	sp,sp,32
ffffffffc020828c:	8082                	ret
ffffffffc020828e:	5541                	li	a0,-16
ffffffffc0208290:	bfd5                	j	ffffffffc0208284 <vfs_get_curdir+0x24>

ffffffffc0208292 <vfs_set_curdir>:
ffffffffc0208292:	7139                	addi	sp,sp,-64
ffffffffc0208294:	f04a                	sd	s2,32(sp)
ffffffffc0208296:	0008e917          	auipc	s2,0x8e
ffffffffc020829a:	62a90913          	addi	s2,s2,1578 # ffffffffc02968c0 <current>
ffffffffc020829e:	00093783          	ld	a5,0(s2)
ffffffffc02082a2:	f822                	sd	s0,48(sp)
ffffffffc02082a4:	842a                	mv	s0,a0
ffffffffc02082a6:	1487b503          	ld	a0,328(a5)
ffffffffc02082aa:	ec4e                	sd	s3,24(sp)
ffffffffc02082ac:	fc06                	sd	ra,56(sp)
ffffffffc02082ae:	f426                	sd	s1,40(sp)
ffffffffc02082b0:	e71fc0ef          	jal	ra,ffffffffc0205120 <lock_files>
ffffffffc02082b4:	00093783          	ld	a5,0(s2)
ffffffffc02082b8:	1487b503          	ld	a0,328(a5)
ffffffffc02082bc:	00053983          	ld	s3,0(a0)
ffffffffc02082c0:	07340963          	beq	s0,s3,ffffffffc0208332 <vfs_set_curdir+0xa0>
ffffffffc02082c4:	cc39                	beqz	s0,ffffffffc0208322 <vfs_set_curdir+0x90>
ffffffffc02082c6:	783c                	ld	a5,112(s0)
ffffffffc02082c8:	c7bd                	beqz	a5,ffffffffc0208336 <vfs_set_curdir+0xa4>
ffffffffc02082ca:	6bbc                	ld	a5,80(a5)
ffffffffc02082cc:	c7ad                	beqz	a5,ffffffffc0208336 <vfs_set_curdir+0xa4>
ffffffffc02082ce:	00006597          	auipc	a1,0x6
ffffffffc02082d2:	58258593          	addi	a1,a1,1410 # ffffffffc020e850 <syscalls+0xdb0>
ffffffffc02082d6:	8522                	mv	a0,s0
ffffffffc02082d8:	d0aff0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc02082dc:	783c                	ld	a5,112(s0)
ffffffffc02082de:	006c                	addi	a1,sp,12
ffffffffc02082e0:	8522                	mv	a0,s0
ffffffffc02082e2:	6bbc                	ld	a5,80(a5)
ffffffffc02082e4:	9782                	jalr	a5
ffffffffc02082e6:	84aa                	mv	s1,a0
ffffffffc02082e8:	e901                	bnez	a0,ffffffffc02082f8 <vfs_set_curdir+0x66>
ffffffffc02082ea:	47b2                	lw	a5,12(sp)
ffffffffc02082ec:	669d                	lui	a3,0x7
ffffffffc02082ee:	6709                	lui	a4,0x2
ffffffffc02082f0:	8ff5                	and	a5,a5,a3
ffffffffc02082f2:	54b9                	li	s1,-18
ffffffffc02082f4:	02e78063          	beq	a5,a4,ffffffffc0208314 <vfs_set_curdir+0x82>
ffffffffc02082f8:	00093783          	ld	a5,0(s2)
ffffffffc02082fc:	1487b503          	ld	a0,328(a5)
ffffffffc0208300:	e27fc0ef          	jal	ra,ffffffffc0205126 <unlock_files>
ffffffffc0208304:	70e2                	ld	ra,56(sp)
ffffffffc0208306:	7442                	ld	s0,48(sp)
ffffffffc0208308:	7902                	ld	s2,32(sp)
ffffffffc020830a:	69e2                	ld	s3,24(sp)
ffffffffc020830c:	8526                	mv	a0,s1
ffffffffc020830e:	74a2                	ld	s1,40(sp)
ffffffffc0208310:	6121                	addi	sp,sp,64
ffffffffc0208312:	8082                	ret
ffffffffc0208314:	8522                	mv	a0,s0
ffffffffc0208316:	cb4ff0ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc020831a:	00093783          	ld	a5,0(s2)
ffffffffc020831e:	1487b503          	ld	a0,328(a5)
ffffffffc0208322:	e100                	sd	s0,0(a0)
ffffffffc0208324:	4481                	li	s1,0
ffffffffc0208326:	fc098de3          	beqz	s3,ffffffffc0208300 <vfs_set_curdir+0x6e>
ffffffffc020832a:	854e                	mv	a0,s3
ffffffffc020832c:	d6cff0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc0208330:	b7e1                	j	ffffffffc02082f8 <vfs_set_curdir+0x66>
ffffffffc0208332:	4481                	li	s1,0
ffffffffc0208334:	b7f1                	j	ffffffffc0208300 <vfs_set_curdir+0x6e>
ffffffffc0208336:	00006697          	auipc	a3,0x6
ffffffffc020833a:	4b268693          	addi	a3,a3,1202 # ffffffffc020e7e8 <syscalls+0xd48>
ffffffffc020833e:	00003617          	auipc	a2,0x3
ffffffffc0208342:	5ba60613          	addi	a2,a2,1466 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208346:	04300593          	li	a1,67
ffffffffc020834a:	00006517          	auipc	a0,0x6
ffffffffc020834e:	4ee50513          	addi	a0,a0,1262 # ffffffffc020e838 <syscalls+0xd98>
ffffffffc0208352:	94cf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208356 <vfs_chdir>:
ffffffffc0208356:	1101                	addi	sp,sp,-32
ffffffffc0208358:	002c                	addi	a1,sp,8
ffffffffc020835a:	e822                	sd	s0,16(sp)
ffffffffc020835c:	ec06                	sd	ra,24(sp)
ffffffffc020835e:	e43ff0ef          	jal	ra,ffffffffc02081a0 <vfs_lookup>
ffffffffc0208362:	842a                	mv	s0,a0
ffffffffc0208364:	c511                	beqz	a0,ffffffffc0208370 <vfs_chdir+0x1a>
ffffffffc0208366:	60e2                	ld	ra,24(sp)
ffffffffc0208368:	8522                	mv	a0,s0
ffffffffc020836a:	6442                	ld	s0,16(sp)
ffffffffc020836c:	6105                	addi	sp,sp,32
ffffffffc020836e:	8082                	ret
ffffffffc0208370:	6522                	ld	a0,8(sp)
ffffffffc0208372:	f21ff0ef          	jal	ra,ffffffffc0208292 <vfs_set_curdir>
ffffffffc0208376:	842a                	mv	s0,a0
ffffffffc0208378:	6522                	ld	a0,8(sp)
ffffffffc020837a:	d1eff0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc020837e:	60e2                	ld	ra,24(sp)
ffffffffc0208380:	8522                	mv	a0,s0
ffffffffc0208382:	6442                	ld	s0,16(sp)
ffffffffc0208384:	6105                	addi	sp,sp,32
ffffffffc0208386:	8082                	ret

ffffffffc0208388 <vfs_getcwd>:
ffffffffc0208388:	0008e797          	auipc	a5,0x8e
ffffffffc020838c:	5387b783          	ld	a5,1336(a5) # ffffffffc02968c0 <current>
ffffffffc0208390:	1487b783          	ld	a5,328(a5)
ffffffffc0208394:	7179                	addi	sp,sp,-48
ffffffffc0208396:	ec26                	sd	s1,24(sp)
ffffffffc0208398:	6384                	ld	s1,0(a5)
ffffffffc020839a:	f406                	sd	ra,40(sp)
ffffffffc020839c:	f022                	sd	s0,32(sp)
ffffffffc020839e:	e84a                	sd	s2,16(sp)
ffffffffc02083a0:	ccbd                	beqz	s1,ffffffffc020841e <vfs_getcwd+0x96>
ffffffffc02083a2:	892a                	mv	s2,a0
ffffffffc02083a4:	8526                	mv	a0,s1
ffffffffc02083a6:	c24ff0ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc02083aa:	74a8                	ld	a0,104(s1)
ffffffffc02083ac:	c93d                	beqz	a0,ffffffffc0208422 <vfs_getcwd+0x9a>
ffffffffc02083ae:	9b3ff0ef          	jal	ra,ffffffffc0207d60 <vfs_get_devname>
ffffffffc02083b2:	842a                	mv	s0,a0
ffffffffc02083b4:	7c1020ef          	jal	ra,ffffffffc020b374 <strlen>
ffffffffc02083b8:	862a                	mv	a2,a0
ffffffffc02083ba:	85a2                	mv	a1,s0
ffffffffc02083bc:	4701                	li	a4,0
ffffffffc02083be:	4685                	li	a3,1
ffffffffc02083c0:	854a                	mv	a0,s2
ffffffffc02083c2:	f89fc0ef          	jal	ra,ffffffffc020534a <iobuf_move>
ffffffffc02083c6:	842a                	mv	s0,a0
ffffffffc02083c8:	c919                	beqz	a0,ffffffffc02083de <vfs_getcwd+0x56>
ffffffffc02083ca:	8526                	mv	a0,s1
ffffffffc02083cc:	cccff0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc02083d0:	70a2                	ld	ra,40(sp)
ffffffffc02083d2:	8522                	mv	a0,s0
ffffffffc02083d4:	7402                	ld	s0,32(sp)
ffffffffc02083d6:	64e2                	ld	s1,24(sp)
ffffffffc02083d8:	6942                	ld	s2,16(sp)
ffffffffc02083da:	6145                	addi	sp,sp,48
ffffffffc02083dc:	8082                	ret
ffffffffc02083de:	03a00793          	li	a5,58
ffffffffc02083e2:	4701                	li	a4,0
ffffffffc02083e4:	4685                	li	a3,1
ffffffffc02083e6:	4605                	li	a2,1
ffffffffc02083e8:	00f10593          	addi	a1,sp,15
ffffffffc02083ec:	854a                	mv	a0,s2
ffffffffc02083ee:	00f107a3          	sb	a5,15(sp)
ffffffffc02083f2:	f59fc0ef          	jal	ra,ffffffffc020534a <iobuf_move>
ffffffffc02083f6:	842a                	mv	s0,a0
ffffffffc02083f8:	f969                	bnez	a0,ffffffffc02083ca <vfs_getcwd+0x42>
ffffffffc02083fa:	78bc                	ld	a5,112(s1)
ffffffffc02083fc:	c3b9                	beqz	a5,ffffffffc0208442 <vfs_getcwd+0xba>
ffffffffc02083fe:	7f9c                	ld	a5,56(a5)
ffffffffc0208400:	c3a9                	beqz	a5,ffffffffc0208442 <vfs_getcwd+0xba>
ffffffffc0208402:	00006597          	auipc	a1,0x6
ffffffffc0208406:	4ae58593          	addi	a1,a1,1198 # ffffffffc020e8b0 <syscalls+0xe10>
ffffffffc020840a:	8526                	mv	a0,s1
ffffffffc020840c:	bd6ff0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0208410:	78bc                	ld	a5,112(s1)
ffffffffc0208412:	85ca                	mv	a1,s2
ffffffffc0208414:	8526                	mv	a0,s1
ffffffffc0208416:	7f9c                	ld	a5,56(a5)
ffffffffc0208418:	9782                	jalr	a5
ffffffffc020841a:	842a                	mv	s0,a0
ffffffffc020841c:	b77d                	j	ffffffffc02083ca <vfs_getcwd+0x42>
ffffffffc020841e:	5441                	li	s0,-16
ffffffffc0208420:	bf45                	j	ffffffffc02083d0 <vfs_getcwd+0x48>
ffffffffc0208422:	00006697          	auipc	a3,0x6
ffffffffc0208426:	35668693          	addi	a3,a3,854 # ffffffffc020e778 <syscalls+0xcd8>
ffffffffc020842a:	00003617          	auipc	a2,0x3
ffffffffc020842e:	4ce60613          	addi	a2,a2,1230 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208432:	06e00593          	li	a1,110
ffffffffc0208436:	00006517          	auipc	a0,0x6
ffffffffc020843a:	40250513          	addi	a0,a0,1026 # ffffffffc020e838 <syscalls+0xd98>
ffffffffc020843e:	860f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208442:	00006697          	auipc	a3,0x6
ffffffffc0208446:	41668693          	addi	a3,a3,1046 # ffffffffc020e858 <syscalls+0xdb8>
ffffffffc020844a:	00003617          	auipc	a2,0x3
ffffffffc020844e:	4ae60613          	addi	a2,a2,1198 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208452:	07800593          	li	a1,120
ffffffffc0208456:	00006517          	auipc	a0,0x6
ffffffffc020845a:	3e250513          	addi	a0,a0,994 # ffffffffc020e838 <syscalls+0xd98>
ffffffffc020845e:	840f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208462 <dev_lookup>:
ffffffffc0208462:	0005c783          	lbu	a5,0(a1)
ffffffffc0208466:	e385                	bnez	a5,ffffffffc0208486 <dev_lookup+0x24>
ffffffffc0208468:	1101                	addi	sp,sp,-32
ffffffffc020846a:	e822                	sd	s0,16(sp)
ffffffffc020846c:	e426                	sd	s1,8(sp)
ffffffffc020846e:	ec06                	sd	ra,24(sp)
ffffffffc0208470:	84aa                	mv	s1,a0
ffffffffc0208472:	8432                	mv	s0,a2
ffffffffc0208474:	b56ff0ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc0208478:	60e2                	ld	ra,24(sp)
ffffffffc020847a:	e004                	sd	s1,0(s0)
ffffffffc020847c:	6442                	ld	s0,16(sp)
ffffffffc020847e:	64a2                	ld	s1,8(sp)
ffffffffc0208480:	4501                	li	a0,0
ffffffffc0208482:	6105                	addi	sp,sp,32
ffffffffc0208484:	8082                	ret
ffffffffc0208486:	5541                	li	a0,-16
ffffffffc0208488:	8082                	ret

ffffffffc020848a <dev_fstat>:
ffffffffc020848a:	1101                	addi	sp,sp,-32
ffffffffc020848c:	e426                	sd	s1,8(sp)
ffffffffc020848e:	84ae                	mv	s1,a1
ffffffffc0208490:	e822                	sd	s0,16(sp)
ffffffffc0208492:	02000613          	li	a2,32
ffffffffc0208496:	842a                	mv	s0,a0
ffffffffc0208498:	4581                	li	a1,0
ffffffffc020849a:	8526                	mv	a0,s1
ffffffffc020849c:	ec06                	sd	ra,24(sp)
ffffffffc020849e:	779020ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc02084a2:	c429                	beqz	s0,ffffffffc02084ec <dev_fstat+0x62>
ffffffffc02084a4:	783c                	ld	a5,112(s0)
ffffffffc02084a6:	c3b9                	beqz	a5,ffffffffc02084ec <dev_fstat+0x62>
ffffffffc02084a8:	6bbc                	ld	a5,80(a5)
ffffffffc02084aa:	c3a9                	beqz	a5,ffffffffc02084ec <dev_fstat+0x62>
ffffffffc02084ac:	00006597          	auipc	a1,0x6
ffffffffc02084b0:	3a458593          	addi	a1,a1,932 # ffffffffc020e850 <syscalls+0xdb0>
ffffffffc02084b4:	8522                	mv	a0,s0
ffffffffc02084b6:	b2cff0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc02084ba:	783c                	ld	a5,112(s0)
ffffffffc02084bc:	85a6                	mv	a1,s1
ffffffffc02084be:	8522                	mv	a0,s0
ffffffffc02084c0:	6bbc                	ld	a5,80(a5)
ffffffffc02084c2:	9782                	jalr	a5
ffffffffc02084c4:	ed19                	bnez	a0,ffffffffc02084e2 <dev_fstat+0x58>
ffffffffc02084c6:	4c38                	lw	a4,88(s0)
ffffffffc02084c8:	6785                	lui	a5,0x1
ffffffffc02084ca:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02084ce:	02f71f63          	bne	a4,a5,ffffffffc020850c <dev_fstat+0x82>
ffffffffc02084d2:	6018                	ld	a4,0(s0)
ffffffffc02084d4:	641c                	ld	a5,8(s0)
ffffffffc02084d6:	4685                	li	a3,1
ffffffffc02084d8:	e494                	sd	a3,8(s1)
ffffffffc02084da:	02e787b3          	mul	a5,a5,a4
ffffffffc02084de:	e898                	sd	a4,16(s1)
ffffffffc02084e0:	ec9c                	sd	a5,24(s1)
ffffffffc02084e2:	60e2                	ld	ra,24(sp)
ffffffffc02084e4:	6442                	ld	s0,16(sp)
ffffffffc02084e6:	64a2                	ld	s1,8(sp)
ffffffffc02084e8:	6105                	addi	sp,sp,32
ffffffffc02084ea:	8082                	ret
ffffffffc02084ec:	00006697          	auipc	a3,0x6
ffffffffc02084f0:	2fc68693          	addi	a3,a3,764 # ffffffffc020e7e8 <syscalls+0xd48>
ffffffffc02084f4:	00003617          	auipc	a2,0x3
ffffffffc02084f8:	40460613          	addi	a2,a2,1028 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02084fc:	04200593          	li	a1,66
ffffffffc0208500:	00006517          	auipc	a0,0x6
ffffffffc0208504:	3c050513          	addi	a0,a0,960 # ffffffffc020e8c0 <syscalls+0xe20>
ffffffffc0208508:	f97f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020850c:	00006697          	auipc	a3,0x6
ffffffffc0208510:	0a468693          	addi	a3,a3,164 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc0208514:	00003617          	auipc	a2,0x3
ffffffffc0208518:	3e460613          	addi	a2,a2,996 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020851c:	04500593          	li	a1,69
ffffffffc0208520:	00006517          	auipc	a0,0x6
ffffffffc0208524:	3a050513          	addi	a0,a0,928 # ffffffffc020e8c0 <syscalls+0xe20>
ffffffffc0208528:	f77f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020852c <dev_ioctl>:
ffffffffc020852c:	c909                	beqz	a0,ffffffffc020853e <dev_ioctl+0x12>
ffffffffc020852e:	4d34                	lw	a3,88(a0)
ffffffffc0208530:	6705                	lui	a4,0x1
ffffffffc0208532:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208536:	00e69463          	bne	a3,a4,ffffffffc020853e <dev_ioctl+0x12>
ffffffffc020853a:	751c                	ld	a5,40(a0)
ffffffffc020853c:	8782                	jr	a5
ffffffffc020853e:	1141                	addi	sp,sp,-16
ffffffffc0208540:	00006697          	auipc	a3,0x6
ffffffffc0208544:	07068693          	addi	a3,a3,112 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc0208548:	00003617          	auipc	a2,0x3
ffffffffc020854c:	3b060613          	addi	a2,a2,944 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208550:	03500593          	li	a1,53
ffffffffc0208554:	00006517          	auipc	a0,0x6
ffffffffc0208558:	36c50513          	addi	a0,a0,876 # ffffffffc020e8c0 <syscalls+0xe20>
ffffffffc020855c:	e406                	sd	ra,8(sp)
ffffffffc020855e:	f41f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208562 <dev_tryseek>:
ffffffffc0208562:	c51d                	beqz	a0,ffffffffc0208590 <dev_tryseek+0x2e>
ffffffffc0208564:	4d38                	lw	a4,88(a0)
ffffffffc0208566:	6785                	lui	a5,0x1
ffffffffc0208568:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020856c:	02f71263          	bne	a4,a5,ffffffffc0208590 <dev_tryseek+0x2e>
ffffffffc0208570:	611c                	ld	a5,0(a0)
ffffffffc0208572:	cf89                	beqz	a5,ffffffffc020858c <dev_tryseek+0x2a>
ffffffffc0208574:	6518                	ld	a4,8(a0)
ffffffffc0208576:	02e5f6b3          	remu	a3,a1,a4
ffffffffc020857a:	ea89                	bnez	a3,ffffffffc020858c <dev_tryseek+0x2a>
ffffffffc020857c:	0005c863          	bltz	a1,ffffffffc020858c <dev_tryseek+0x2a>
ffffffffc0208580:	02e787b3          	mul	a5,a5,a4
ffffffffc0208584:	00f5f463          	bgeu	a1,a5,ffffffffc020858c <dev_tryseek+0x2a>
ffffffffc0208588:	4501                	li	a0,0
ffffffffc020858a:	8082                	ret
ffffffffc020858c:	5575                	li	a0,-3
ffffffffc020858e:	8082                	ret
ffffffffc0208590:	1141                	addi	sp,sp,-16
ffffffffc0208592:	00006697          	auipc	a3,0x6
ffffffffc0208596:	01e68693          	addi	a3,a3,30 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc020859a:	00003617          	auipc	a2,0x3
ffffffffc020859e:	35e60613          	addi	a2,a2,862 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02085a2:	05f00593          	li	a1,95
ffffffffc02085a6:	00006517          	auipc	a0,0x6
ffffffffc02085aa:	31a50513          	addi	a0,a0,794 # ffffffffc020e8c0 <syscalls+0xe20>
ffffffffc02085ae:	e406                	sd	ra,8(sp)
ffffffffc02085b0:	eeff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02085b4 <dev_gettype>:
ffffffffc02085b4:	c10d                	beqz	a0,ffffffffc02085d6 <dev_gettype+0x22>
ffffffffc02085b6:	4d38                	lw	a4,88(a0)
ffffffffc02085b8:	6785                	lui	a5,0x1
ffffffffc02085ba:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02085be:	00f71c63          	bne	a4,a5,ffffffffc02085d6 <dev_gettype+0x22>
ffffffffc02085c2:	6118                	ld	a4,0(a0)
ffffffffc02085c4:	6795                	lui	a5,0x5
ffffffffc02085c6:	c701                	beqz	a4,ffffffffc02085ce <dev_gettype+0x1a>
ffffffffc02085c8:	c19c                	sw	a5,0(a1)
ffffffffc02085ca:	4501                	li	a0,0
ffffffffc02085cc:	8082                	ret
ffffffffc02085ce:	6791                	lui	a5,0x4
ffffffffc02085d0:	c19c                	sw	a5,0(a1)
ffffffffc02085d2:	4501                	li	a0,0
ffffffffc02085d4:	8082                	ret
ffffffffc02085d6:	1141                	addi	sp,sp,-16
ffffffffc02085d8:	00006697          	auipc	a3,0x6
ffffffffc02085dc:	fd868693          	addi	a3,a3,-40 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc02085e0:	00003617          	auipc	a2,0x3
ffffffffc02085e4:	31860613          	addi	a2,a2,792 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02085e8:	05300593          	li	a1,83
ffffffffc02085ec:	00006517          	auipc	a0,0x6
ffffffffc02085f0:	2d450513          	addi	a0,a0,724 # ffffffffc020e8c0 <syscalls+0xe20>
ffffffffc02085f4:	e406                	sd	ra,8(sp)
ffffffffc02085f6:	ea9f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02085fa <dev_write>:
ffffffffc02085fa:	c911                	beqz	a0,ffffffffc020860e <dev_write+0x14>
ffffffffc02085fc:	4d34                	lw	a3,88(a0)
ffffffffc02085fe:	6705                	lui	a4,0x1
ffffffffc0208600:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208604:	00e69563          	bne	a3,a4,ffffffffc020860e <dev_write+0x14>
ffffffffc0208608:	711c                	ld	a5,32(a0)
ffffffffc020860a:	4605                	li	a2,1
ffffffffc020860c:	8782                	jr	a5
ffffffffc020860e:	1141                	addi	sp,sp,-16
ffffffffc0208610:	00006697          	auipc	a3,0x6
ffffffffc0208614:	fa068693          	addi	a3,a3,-96 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc0208618:	00003617          	auipc	a2,0x3
ffffffffc020861c:	2e060613          	addi	a2,a2,736 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208620:	02c00593          	li	a1,44
ffffffffc0208624:	00006517          	auipc	a0,0x6
ffffffffc0208628:	29c50513          	addi	a0,a0,668 # ffffffffc020e8c0 <syscalls+0xe20>
ffffffffc020862c:	e406                	sd	ra,8(sp)
ffffffffc020862e:	e71f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208632 <dev_read>:
ffffffffc0208632:	c911                	beqz	a0,ffffffffc0208646 <dev_read+0x14>
ffffffffc0208634:	4d34                	lw	a3,88(a0)
ffffffffc0208636:	6705                	lui	a4,0x1
ffffffffc0208638:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020863c:	00e69563          	bne	a3,a4,ffffffffc0208646 <dev_read+0x14>
ffffffffc0208640:	711c                	ld	a5,32(a0)
ffffffffc0208642:	4601                	li	a2,0
ffffffffc0208644:	8782                	jr	a5
ffffffffc0208646:	1141                	addi	sp,sp,-16
ffffffffc0208648:	00006697          	auipc	a3,0x6
ffffffffc020864c:	f6868693          	addi	a3,a3,-152 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc0208650:	00003617          	auipc	a2,0x3
ffffffffc0208654:	2a860613          	addi	a2,a2,680 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208658:	02300593          	li	a1,35
ffffffffc020865c:	00006517          	auipc	a0,0x6
ffffffffc0208660:	26450513          	addi	a0,a0,612 # ffffffffc020e8c0 <syscalls+0xe20>
ffffffffc0208664:	e406                	sd	ra,8(sp)
ffffffffc0208666:	e39f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020866a <dev_close>:
ffffffffc020866a:	c909                	beqz	a0,ffffffffc020867c <dev_close+0x12>
ffffffffc020866c:	4d34                	lw	a3,88(a0)
ffffffffc020866e:	6705                	lui	a4,0x1
ffffffffc0208670:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208674:	00e69463          	bne	a3,a4,ffffffffc020867c <dev_close+0x12>
ffffffffc0208678:	6d1c                	ld	a5,24(a0)
ffffffffc020867a:	8782                	jr	a5
ffffffffc020867c:	1141                	addi	sp,sp,-16
ffffffffc020867e:	00006697          	auipc	a3,0x6
ffffffffc0208682:	f3268693          	addi	a3,a3,-206 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc0208686:	00003617          	auipc	a2,0x3
ffffffffc020868a:	27260613          	addi	a2,a2,626 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020868e:	45e9                	li	a1,26
ffffffffc0208690:	00006517          	auipc	a0,0x6
ffffffffc0208694:	23050513          	addi	a0,a0,560 # ffffffffc020e8c0 <syscalls+0xe20>
ffffffffc0208698:	e406                	sd	ra,8(sp)
ffffffffc020869a:	e05f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020869e <dev_open>:
ffffffffc020869e:	03c5f713          	andi	a4,a1,60
ffffffffc02086a2:	eb11                	bnez	a4,ffffffffc02086b6 <dev_open+0x18>
ffffffffc02086a4:	c919                	beqz	a0,ffffffffc02086ba <dev_open+0x1c>
ffffffffc02086a6:	4d34                	lw	a3,88(a0)
ffffffffc02086a8:	6705                	lui	a4,0x1
ffffffffc02086aa:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02086ae:	00e69663          	bne	a3,a4,ffffffffc02086ba <dev_open+0x1c>
ffffffffc02086b2:	691c                	ld	a5,16(a0)
ffffffffc02086b4:	8782                	jr	a5
ffffffffc02086b6:	5575                	li	a0,-3
ffffffffc02086b8:	8082                	ret
ffffffffc02086ba:	1141                	addi	sp,sp,-16
ffffffffc02086bc:	00006697          	auipc	a3,0x6
ffffffffc02086c0:	ef468693          	addi	a3,a3,-268 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc02086c4:	00003617          	auipc	a2,0x3
ffffffffc02086c8:	23460613          	addi	a2,a2,564 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02086cc:	45c5                	li	a1,17
ffffffffc02086ce:	00006517          	auipc	a0,0x6
ffffffffc02086d2:	1f250513          	addi	a0,a0,498 # ffffffffc020e8c0 <syscalls+0xe20>
ffffffffc02086d6:	e406                	sd	ra,8(sp)
ffffffffc02086d8:	dc7f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02086dc <dev_init>:
ffffffffc02086dc:	1141                	addi	sp,sp,-16
ffffffffc02086de:	e406                	sd	ra,8(sp)
ffffffffc02086e0:	542000ef          	jal	ra,ffffffffc0208c22 <dev_init_stdin>
ffffffffc02086e4:	65a000ef          	jal	ra,ffffffffc0208d3e <dev_init_stdout>
ffffffffc02086e8:	60a2                	ld	ra,8(sp)
ffffffffc02086ea:	0141                	addi	sp,sp,16
ffffffffc02086ec:	a439                	j	ffffffffc02088fa <dev_init_disk0>

ffffffffc02086ee <dev_create_inode>:
ffffffffc02086ee:	6505                	lui	a0,0x1
ffffffffc02086f0:	1141                	addi	sp,sp,-16
ffffffffc02086f2:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02086f6:	e022                	sd	s0,0(sp)
ffffffffc02086f8:	e406                	sd	ra,8(sp)
ffffffffc02086fa:	852ff0ef          	jal	ra,ffffffffc020774c <__alloc_inode>
ffffffffc02086fe:	842a                	mv	s0,a0
ffffffffc0208700:	c901                	beqz	a0,ffffffffc0208710 <dev_create_inode+0x22>
ffffffffc0208702:	4601                	li	a2,0
ffffffffc0208704:	00006597          	auipc	a1,0x6
ffffffffc0208708:	1d458593          	addi	a1,a1,468 # ffffffffc020e8d8 <dev_node_ops>
ffffffffc020870c:	85cff0ef          	jal	ra,ffffffffc0207768 <inode_init>
ffffffffc0208710:	60a2                	ld	ra,8(sp)
ffffffffc0208712:	8522                	mv	a0,s0
ffffffffc0208714:	6402                	ld	s0,0(sp)
ffffffffc0208716:	0141                	addi	sp,sp,16
ffffffffc0208718:	8082                	ret

ffffffffc020871a <disk0_open>:
ffffffffc020871a:	4501                	li	a0,0
ffffffffc020871c:	8082                	ret

ffffffffc020871e <disk0_close>:
ffffffffc020871e:	4501                	li	a0,0
ffffffffc0208720:	8082                	ret

ffffffffc0208722 <disk0_ioctl>:
ffffffffc0208722:	5531                	li	a0,-20
ffffffffc0208724:	8082                	ret

ffffffffc0208726 <disk0_io>:
ffffffffc0208726:	659c                	ld	a5,8(a1)
ffffffffc0208728:	7159                	addi	sp,sp,-112
ffffffffc020872a:	eca6                	sd	s1,88(sp)
ffffffffc020872c:	f45e                	sd	s7,40(sp)
ffffffffc020872e:	6d84                	ld	s1,24(a1)
ffffffffc0208730:	6b85                	lui	s7,0x1
ffffffffc0208732:	1bfd                	addi	s7,s7,-1
ffffffffc0208734:	e4ce                	sd	s3,72(sp)
ffffffffc0208736:	43f7d993          	srai	s3,a5,0x3f
ffffffffc020873a:	0179f9b3          	and	s3,s3,s7
ffffffffc020873e:	99be                	add	s3,s3,a5
ffffffffc0208740:	8fc5                	or	a5,a5,s1
ffffffffc0208742:	f486                	sd	ra,104(sp)
ffffffffc0208744:	f0a2                	sd	s0,96(sp)
ffffffffc0208746:	e8ca                	sd	s2,80(sp)
ffffffffc0208748:	e0d2                	sd	s4,64(sp)
ffffffffc020874a:	fc56                	sd	s5,56(sp)
ffffffffc020874c:	f85a                	sd	s6,48(sp)
ffffffffc020874e:	f062                	sd	s8,32(sp)
ffffffffc0208750:	ec66                	sd	s9,24(sp)
ffffffffc0208752:	e86a                	sd	s10,16(sp)
ffffffffc0208754:	0177f7b3          	and	a5,a5,s7
ffffffffc0208758:	10079d63          	bnez	a5,ffffffffc0208872 <disk0_io+0x14c>
ffffffffc020875c:	40c9d993          	srai	s3,s3,0xc
ffffffffc0208760:	00c4d713          	srli	a4,s1,0xc
ffffffffc0208764:	2981                	sext.w	s3,s3
ffffffffc0208766:	2701                	sext.w	a4,a4
ffffffffc0208768:	00e987bb          	addw	a5,s3,a4
ffffffffc020876c:	6114                	ld	a3,0(a0)
ffffffffc020876e:	1782                	slli	a5,a5,0x20
ffffffffc0208770:	9381                	srli	a5,a5,0x20
ffffffffc0208772:	10f6e063          	bltu	a3,a5,ffffffffc0208872 <disk0_io+0x14c>
ffffffffc0208776:	4501                	li	a0,0
ffffffffc0208778:	ef19                	bnez	a4,ffffffffc0208796 <disk0_io+0x70>
ffffffffc020877a:	70a6                	ld	ra,104(sp)
ffffffffc020877c:	7406                	ld	s0,96(sp)
ffffffffc020877e:	64e6                	ld	s1,88(sp)
ffffffffc0208780:	6946                	ld	s2,80(sp)
ffffffffc0208782:	69a6                	ld	s3,72(sp)
ffffffffc0208784:	6a06                	ld	s4,64(sp)
ffffffffc0208786:	7ae2                	ld	s5,56(sp)
ffffffffc0208788:	7b42                	ld	s6,48(sp)
ffffffffc020878a:	7ba2                	ld	s7,40(sp)
ffffffffc020878c:	7c02                	ld	s8,32(sp)
ffffffffc020878e:	6ce2                	ld	s9,24(sp)
ffffffffc0208790:	6d42                	ld	s10,16(sp)
ffffffffc0208792:	6165                	addi	sp,sp,112
ffffffffc0208794:	8082                	ret
ffffffffc0208796:	0008d517          	auipc	a0,0x8d
ffffffffc020879a:	0aa50513          	addi	a0,a0,170 # ffffffffc0295840 <disk0_sem>
ffffffffc020879e:	8b2e                	mv	s6,a1
ffffffffc02087a0:	8c32                	mv	s8,a2
ffffffffc02087a2:	0008ea97          	auipc	s5,0x8e
ffffffffc02087a6:	156a8a93          	addi	s5,s5,342 # ffffffffc02968f8 <disk0_buffer>
ffffffffc02087aa:	d19fb0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc02087ae:	6c91                	lui	s9,0x4
ffffffffc02087b0:	e4b9                	bnez	s1,ffffffffc02087fe <disk0_io+0xd8>
ffffffffc02087b2:	a845                	j	ffffffffc0208862 <disk0_io+0x13c>
ffffffffc02087b4:	00c4d413          	srli	s0,s1,0xc
ffffffffc02087b8:	0034169b          	slliw	a3,s0,0x3
ffffffffc02087bc:	00068d1b          	sext.w	s10,a3
ffffffffc02087c0:	1682                	slli	a3,a3,0x20
ffffffffc02087c2:	2401                	sext.w	s0,s0
ffffffffc02087c4:	9281                	srli	a3,a3,0x20
ffffffffc02087c6:	8926                	mv	s2,s1
ffffffffc02087c8:	00399a1b          	slliw	s4,s3,0x3
ffffffffc02087cc:	862e                	mv	a2,a1
ffffffffc02087ce:	4509                	li	a0,2
ffffffffc02087d0:	85d2                	mv	a1,s4
ffffffffc02087d2:	b6ef80ef          	jal	ra,ffffffffc0200b40 <ide_read_secs>
ffffffffc02087d6:	e165                	bnez	a0,ffffffffc02088b6 <disk0_io+0x190>
ffffffffc02087d8:	000ab583          	ld	a1,0(s5)
ffffffffc02087dc:	0038                	addi	a4,sp,8
ffffffffc02087de:	4685                	li	a3,1
ffffffffc02087e0:	864a                	mv	a2,s2
ffffffffc02087e2:	855a                	mv	a0,s6
ffffffffc02087e4:	b67fc0ef          	jal	ra,ffffffffc020534a <iobuf_move>
ffffffffc02087e8:	67a2                	ld	a5,8(sp)
ffffffffc02087ea:	09279663          	bne	a5,s2,ffffffffc0208876 <disk0_io+0x150>
ffffffffc02087ee:	017977b3          	and	a5,s2,s7
ffffffffc02087f2:	e3d1                	bnez	a5,ffffffffc0208876 <disk0_io+0x150>
ffffffffc02087f4:	412484b3          	sub	s1,s1,s2
ffffffffc02087f8:	013409bb          	addw	s3,s0,s3
ffffffffc02087fc:	c0bd                	beqz	s1,ffffffffc0208862 <disk0_io+0x13c>
ffffffffc02087fe:	000ab583          	ld	a1,0(s5)
ffffffffc0208802:	000c1b63          	bnez	s8,ffffffffc0208818 <disk0_io+0xf2>
ffffffffc0208806:	fb94e7e3          	bltu	s1,s9,ffffffffc02087b4 <disk0_io+0x8e>
ffffffffc020880a:	02000693          	li	a3,32
ffffffffc020880e:	02000d13          	li	s10,32
ffffffffc0208812:	4411                	li	s0,4
ffffffffc0208814:	6911                	lui	s2,0x4
ffffffffc0208816:	bf4d                	j	ffffffffc02087c8 <disk0_io+0xa2>
ffffffffc0208818:	0038                	addi	a4,sp,8
ffffffffc020881a:	4681                	li	a3,0
ffffffffc020881c:	6611                	lui	a2,0x4
ffffffffc020881e:	855a                	mv	a0,s6
ffffffffc0208820:	b2bfc0ef          	jal	ra,ffffffffc020534a <iobuf_move>
ffffffffc0208824:	6422                	ld	s0,8(sp)
ffffffffc0208826:	c825                	beqz	s0,ffffffffc0208896 <disk0_io+0x170>
ffffffffc0208828:	0684e763          	bltu	s1,s0,ffffffffc0208896 <disk0_io+0x170>
ffffffffc020882c:	017477b3          	and	a5,s0,s7
ffffffffc0208830:	e3bd                	bnez	a5,ffffffffc0208896 <disk0_io+0x170>
ffffffffc0208832:	8031                	srli	s0,s0,0xc
ffffffffc0208834:	0034179b          	slliw	a5,s0,0x3
ffffffffc0208838:	000ab603          	ld	a2,0(s5)
ffffffffc020883c:	0039991b          	slliw	s2,s3,0x3
ffffffffc0208840:	02079693          	slli	a3,a5,0x20
ffffffffc0208844:	9281                	srli	a3,a3,0x20
ffffffffc0208846:	85ca                	mv	a1,s2
ffffffffc0208848:	4509                	li	a0,2
ffffffffc020884a:	2401                	sext.w	s0,s0
ffffffffc020884c:	00078a1b          	sext.w	s4,a5
ffffffffc0208850:	b86f80ef          	jal	ra,ffffffffc0200bd6 <ide_write_secs>
ffffffffc0208854:	e151                	bnez	a0,ffffffffc02088d8 <disk0_io+0x1b2>
ffffffffc0208856:	6922                	ld	s2,8(sp)
ffffffffc0208858:	013409bb          	addw	s3,s0,s3
ffffffffc020885c:	412484b3          	sub	s1,s1,s2
ffffffffc0208860:	fcd9                	bnez	s1,ffffffffc02087fe <disk0_io+0xd8>
ffffffffc0208862:	0008d517          	auipc	a0,0x8d
ffffffffc0208866:	fde50513          	addi	a0,a0,-34 # ffffffffc0295840 <disk0_sem>
ffffffffc020886a:	c55fb0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020886e:	4501                	li	a0,0
ffffffffc0208870:	b729                	j	ffffffffc020877a <disk0_io+0x54>
ffffffffc0208872:	5575                	li	a0,-3
ffffffffc0208874:	b719                	j	ffffffffc020877a <disk0_io+0x54>
ffffffffc0208876:	00006697          	auipc	a3,0x6
ffffffffc020887a:	1da68693          	addi	a3,a3,474 # ffffffffc020ea50 <dev_node_ops+0x178>
ffffffffc020887e:	00003617          	auipc	a2,0x3
ffffffffc0208882:	07a60613          	addi	a2,a2,122 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208886:	06200593          	li	a1,98
ffffffffc020888a:	00006517          	auipc	a0,0x6
ffffffffc020888e:	10e50513          	addi	a0,a0,270 # ffffffffc020e998 <dev_node_ops+0xc0>
ffffffffc0208892:	c0df70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208896:	00006697          	auipc	a3,0x6
ffffffffc020889a:	0c268693          	addi	a3,a3,194 # ffffffffc020e958 <dev_node_ops+0x80>
ffffffffc020889e:	00003617          	auipc	a2,0x3
ffffffffc02088a2:	05a60613          	addi	a2,a2,90 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02088a6:	05700593          	li	a1,87
ffffffffc02088aa:	00006517          	auipc	a0,0x6
ffffffffc02088ae:	0ee50513          	addi	a0,a0,238 # ffffffffc020e998 <dev_node_ops+0xc0>
ffffffffc02088b2:	bedf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02088b6:	88aa                	mv	a7,a0
ffffffffc02088b8:	886a                	mv	a6,s10
ffffffffc02088ba:	87a2                	mv	a5,s0
ffffffffc02088bc:	8752                	mv	a4,s4
ffffffffc02088be:	86ce                	mv	a3,s3
ffffffffc02088c0:	00006617          	auipc	a2,0x6
ffffffffc02088c4:	14860613          	addi	a2,a2,328 # ffffffffc020ea08 <dev_node_ops+0x130>
ffffffffc02088c8:	02d00593          	li	a1,45
ffffffffc02088cc:	00006517          	auipc	a0,0x6
ffffffffc02088d0:	0cc50513          	addi	a0,a0,204 # ffffffffc020e998 <dev_node_ops+0xc0>
ffffffffc02088d4:	bcbf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02088d8:	88aa                	mv	a7,a0
ffffffffc02088da:	8852                	mv	a6,s4
ffffffffc02088dc:	87a2                	mv	a5,s0
ffffffffc02088de:	874a                	mv	a4,s2
ffffffffc02088e0:	86ce                	mv	a3,s3
ffffffffc02088e2:	00006617          	auipc	a2,0x6
ffffffffc02088e6:	0d660613          	addi	a2,a2,214 # ffffffffc020e9b8 <dev_node_ops+0xe0>
ffffffffc02088ea:	03700593          	li	a1,55
ffffffffc02088ee:	00006517          	auipc	a0,0x6
ffffffffc02088f2:	0aa50513          	addi	a0,a0,170 # ffffffffc020e998 <dev_node_ops+0xc0>
ffffffffc02088f6:	ba9f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02088fa <dev_init_disk0>:
ffffffffc02088fa:	1101                	addi	sp,sp,-32
ffffffffc02088fc:	ec06                	sd	ra,24(sp)
ffffffffc02088fe:	e822                	sd	s0,16(sp)
ffffffffc0208900:	e426                	sd	s1,8(sp)
ffffffffc0208902:	dedff0ef          	jal	ra,ffffffffc02086ee <dev_create_inode>
ffffffffc0208906:	c541                	beqz	a0,ffffffffc020898e <dev_init_disk0+0x94>
ffffffffc0208908:	4d38                	lw	a4,88(a0)
ffffffffc020890a:	6485                	lui	s1,0x1
ffffffffc020890c:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208910:	842a                	mv	s0,a0
ffffffffc0208912:	0cf71f63          	bne	a4,a5,ffffffffc02089f0 <dev_init_disk0+0xf6>
ffffffffc0208916:	4509                	li	a0,2
ffffffffc0208918:	9dcf80ef          	jal	ra,ffffffffc0200af4 <ide_device_valid>
ffffffffc020891c:	cd55                	beqz	a0,ffffffffc02089d8 <dev_init_disk0+0xde>
ffffffffc020891e:	4509                	li	a0,2
ffffffffc0208920:	9f8f80ef          	jal	ra,ffffffffc0200b18 <ide_device_size>
ffffffffc0208924:	00355793          	srli	a5,a0,0x3
ffffffffc0208928:	e01c                	sd	a5,0(s0)
ffffffffc020892a:	00000797          	auipc	a5,0x0
ffffffffc020892e:	df078793          	addi	a5,a5,-528 # ffffffffc020871a <disk0_open>
ffffffffc0208932:	e81c                	sd	a5,16(s0)
ffffffffc0208934:	00000797          	auipc	a5,0x0
ffffffffc0208938:	dea78793          	addi	a5,a5,-534 # ffffffffc020871e <disk0_close>
ffffffffc020893c:	ec1c                	sd	a5,24(s0)
ffffffffc020893e:	00000797          	auipc	a5,0x0
ffffffffc0208942:	de878793          	addi	a5,a5,-536 # ffffffffc0208726 <disk0_io>
ffffffffc0208946:	f01c                	sd	a5,32(s0)
ffffffffc0208948:	00000797          	auipc	a5,0x0
ffffffffc020894c:	dda78793          	addi	a5,a5,-550 # ffffffffc0208722 <disk0_ioctl>
ffffffffc0208950:	f41c                	sd	a5,40(s0)
ffffffffc0208952:	4585                	li	a1,1
ffffffffc0208954:	0008d517          	auipc	a0,0x8d
ffffffffc0208958:	eec50513          	addi	a0,a0,-276 # ffffffffc0295840 <disk0_sem>
ffffffffc020895c:	e404                	sd	s1,8(s0)
ffffffffc020895e:	b5bfb0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc0208962:	6511                	lui	a0,0x4
ffffffffc0208964:	e2af90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208968:	0008e797          	auipc	a5,0x8e
ffffffffc020896c:	f8a7b823          	sd	a0,-112(a5) # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208970:	c921                	beqz	a0,ffffffffc02089c0 <dev_init_disk0+0xc6>
ffffffffc0208972:	4605                	li	a2,1
ffffffffc0208974:	85a2                	mv	a1,s0
ffffffffc0208976:	00006517          	auipc	a0,0x6
ffffffffc020897a:	16a50513          	addi	a0,a0,362 # ffffffffc020eae0 <dev_node_ops+0x208>
ffffffffc020897e:	c2cff0ef          	jal	ra,ffffffffc0207daa <vfs_add_dev>
ffffffffc0208982:	e115                	bnez	a0,ffffffffc02089a6 <dev_init_disk0+0xac>
ffffffffc0208984:	60e2                	ld	ra,24(sp)
ffffffffc0208986:	6442                	ld	s0,16(sp)
ffffffffc0208988:	64a2                	ld	s1,8(sp)
ffffffffc020898a:	6105                	addi	sp,sp,32
ffffffffc020898c:	8082                	ret
ffffffffc020898e:	00006617          	auipc	a2,0x6
ffffffffc0208992:	0f260613          	addi	a2,a2,242 # ffffffffc020ea80 <dev_node_ops+0x1a8>
ffffffffc0208996:	08700593          	li	a1,135
ffffffffc020899a:	00006517          	auipc	a0,0x6
ffffffffc020899e:	ffe50513          	addi	a0,a0,-2 # ffffffffc020e998 <dev_node_ops+0xc0>
ffffffffc02089a2:	afdf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02089a6:	86aa                	mv	a3,a0
ffffffffc02089a8:	00006617          	auipc	a2,0x6
ffffffffc02089ac:	14060613          	addi	a2,a2,320 # ffffffffc020eae8 <dev_node_ops+0x210>
ffffffffc02089b0:	08d00593          	li	a1,141
ffffffffc02089b4:	00006517          	auipc	a0,0x6
ffffffffc02089b8:	fe450513          	addi	a0,a0,-28 # ffffffffc020e998 <dev_node_ops+0xc0>
ffffffffc02089bc:	ae3f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02089c0:	00006617          	auipc	a2,0x6
ffffffffc02089c4:	10060613          	addi	a2,a2,256 # ffffffffc020eac0 <dev_node_ops+0x1e8>
ffffffffc02089c8:	07f00593          	li	a1,127
ffffffffc02089cc:	00006517          	auipc	a0,0x6
ffffffffc02089d0:	fcc50513          	addi	a0,a0,-52 # ffffffffc020e998 <dev_node_ops+0xc0>
ffffffffc02089d4:	acbf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02089d8:	00006617          	auipc	a2,0x6
ffffffffc02089dc:	0c860613          	addi	a2,a2,200 # ffffffffc020eaa0 <dev_node_ops+0x1c8>
ffffffffc02089e0:	07300593          	li	a1,115
ffffffffc02089e4:	00006517          	auipc	a0,0x6
ffffffffc02089e8:	fb450513          	addi	a0,a0,-76 # ffffffffc020e998 <dev_node_ops+0xc0>
ffffffffc02089ec:	ab3f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02089f0:	00006697          	auipc	a3,0x6
ffffffffc02089f4:	bc068693          	addi	a3,a3,-1088 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc02089f8:	00003617          	auipc	a2,0x3
ffffffffc02089fc:	f0060613          	addi	a2,a2,-256 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208a00:	08900593          	li	a1,137
ffffffffc0208a04:	00006517          	auipc	a0,0x6
ffffffffc0208a08:	f9450513          	addi	a0,a0,-108 # ffffffffc020e998 <dev_node_ops+0xc0>
ffffffffc0208a0c:	a93f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208a10 <stdin_open>:
ffffffffc0208a10:	4501                	li	a0,0
ffffffffc0208a12:	e191                	bnez	a1,ffffffffc0208a16 <stdin_open+0x6>
ffffffffc0208a14:	8082                	ret
ffffffffc0208a16:	5575                	li	a0,-3
ffffffffc0208a18:	8082                	ret

ffffffffc0208a1a <stdin_close>:
ffffffffc0208a1a:	4501                	li	a0,0
ffffffffc0208a1c:	8082                	ret

ffffffffc0208a1e <stdin_ioctl>:
ffffffffc0208a1e:	5575                	li	a0,-3
ffffffffc0208a20:	8082                	ret

ffffffffc0208a22 <stdin_io>:
ffffffffc0208a22:	7135                	addi	sp,sp,-160
ffffffffc0208a24:	ed06                	sd	ra,152(sp)
ffffffffc0208a26:	e922                	sd	s0,144(sp)
ffffffffc0208a28:	e526                	sd	s1,136(sp)
ffffffffc0208a2a:	e14a                	sd	s2,128(sp)
ffffffffc0208a2c:	fcce                	sd	s3,120(sp)
ffffffffc0208a2e:	f8d2                	sd	s4,112(sp)
ffffffffc0208a30:	f4d6                	sd	s5,104(sp)
ffffffffc0208a32:	f0da                	sd	s6,96(sp)
ffffffffc0208a34:	ecde                	sd	s7,88(sp)
ffffffffc0208a36:	e8e2                	sd	s8,80(sp)
ffffffffc0208a38:	e4e6                	sd	s9,72(sp)
ffffffffc0208a3a:	e0ea                	sd	s10,64(sp)
ffffffffc0208a3c:	fc6e                	sd	s11,56(sp)
ffffffffc0208a3e:	14061163          	bnez	a2,ffffffffc0208b80 <stdin_io+0x15e>
ffffffffc0208a42:	0005bd83          	ld	s11,0(a1)
ffffffffc0208a46:	0185bd03          	ld	s10,24(a1)
ffffffffc0208a4a:	8b2e                	mv	s6,a1
ffffffffc0208a4c:	100027f3          	csrr	a5,sstatus
ffffffffc0208a50:	8b89                	andi	a5,a5,2
ffffffffc0208a52:	10079e63          	bnez	a5,ffffffffc0208b6e <stdin_io+0x14c>
ffffffffc0208a56:	4401                	li	s0,0
ffffffffc0208a58:	100d0963          	beqz	s10,ffffffffc0208b6a <stdin_io+0x148>
ffffffffc0208a5c:	0008e997          	auipc	s3,0x8e
ffffffffc0208a60:	ea498993          	addi	s3,s3,-348 # ffffffffc0296900 <p_rpos>
ffffffffc0208a64:	0009b783          	ld	a5,0(s3)
ffffffffc0208a68:	800004b7          	lui	s1,0x80000
ffffffffc0208a6c:	6c85                	lui	s9,0x1
ffffffffc0208a6e:	4a81                	li	s5,0
ffffffffc0208a70:	0008ea17          	auipc	s4,0x8e
ffffffffc0208a74:	e98a0a13          	addi	s4,s4,-360 # ffffffffc0296908 <p_wpos>
ffffffffc0208a78:	0491                	addi	s1,s1,4
ffffffffc0208a7a:	0008d917          	auipc	s2,0x8d
ffffffffc0208a7e:	dde90913          	addi	s2,s2,-546 # ffffffffc0295858 <__wait_queue>
ffffffffc0208a82:	1cfd                	addi	s9,s9,-1
ffffffffc0208a84:	000a3703          	ld	a4,0(s4)
ffffffffc0208a88:	000a8c1b          	sext.w	s8,s5
ffffffffc0208a8c:	8be2                	mv	s7,s8
ffffffffc0208a8e:	02e7d763          	bge	a5,a4,ffffffffc0208abc <stdin_io+0x9a>
ffffffffc0208a92:	a859                	j	ffffffffc0208b28 <stdin_io+0x106>
ffffffffc0208a94:	815fe0ef          	jal	ra,ffffffffc02072a8 <schedule>
ffffffffc0208a98:	100027f3          	csrr	a5,sstatus
ffffffffc0208a9c:	8b89                	andi	a5,a5,2
ffffffffc0208a9e:	4401                	li	s0,0
ffffffffc0208aa0:	ef8d                	bnez	a5,ffffffffc0208ada <stdin_io+0xb8>
ffffffffc0208aa2:	0028                	addi	a0,sp,8
ffffffffc0208aa4:	ab1fb0ef          	jal	ra,ffffffffc0204554 <wait_in_queue>
ffffffffc0208aa8:	e121                	bnez	a0,ffffffffc0208ae8 <stdin_io+0xc6>
ffffffffc0208aaa:	47c2                	lw	a5,16(sp)
ffffffffc0208aac:	04979563          	bne	a5,s1,ffffffffc0208af6 <stdin_io+0xd4>
ffffffffc0208ab0:	0009b783          	ld	a5,0(s3)
ffffffffc0208ab4:	000a3703          	ld	a4,0(s4)
ffffffffc0208ab8:	06e7c863          	blt	a5,a4,ffffffffc0208b28 <stdin_io+0x106>
ffffffffc0208abc:	8626                	mv	a2,s1
ffffffffc0208abe:	002c                	addi	a1,sp,8
ffffffffc0208ac0:	854a                	mv	a0,s2
ffffffffc0208ac2:	bbdfb0ef          	jal	ra,ffffffffc020467e <wait_current_set>
ffffffffc0208ac6:	d479                	beqz	s0,ffffffffc0208a94 <stdin_io+0x72>
ffffffffc0208ac8:	9a4f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208acc:	fdcfe0ef          	jal	ra,ffffffffc02072a8 <schedule>
ffffffffc0208ad0:	100027f3          	csrr	a5,sstatus
ffffffffc0208ad4:	8b89                	andi	a5,a5,2
ffffffffc0208ad6:	4401                	li	s0,0
ffffffffc0208ad8:	d7e9                	beqz	a5,ffffffffc0208aa2 <stdin_io+0x80>
ffffffffc0208ada:	998f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208ade:	0028                	addi	a0,sp,8
ffffffffc0208ae0:	4405                	li	s0,1
ffffffffc0208ae2:	a73fb0ef          	jal	ra,ffffffffc0204554 <wait_in_queue>
ffffffffc0208ae6:	d171                	beqz	a0,ffffffffc0208aaa <stdin_io+0x88>
ffffffffc0208ae8:	002c                	addi	a1,sp,8
ffffffffc0208aea:	854a                	mv	a0,s2
ffffffffc0208aec:	a0ffb0ef          	jal	ra,ffffffffc02044fa <wait_queue_del>
ffffffffc0208af0:	47c2                	lw	a5,16(sp)
ffffffffc0208af2:	fa978fe3          	beq	a5,s1,ffffffffc0208ab0 <stdin_io+0x8e>
ffffffffc0208af6:	e435                	bnez	s0,ffffffffc0208b62 <stdin_io+0x140>
ffffffffc0208af8:	060b8963          	beqz	s7,ffffffffc0208b6a <stdin_io+0x148>
ffffffffc0208afc:	018b3783          	ld	a5,24(s6)
ffffffffc0208b00:	41578ab3          	sub	s5,a5,s5
ffffffffc0208b04:	015b3c23          	sd	s5,24(s6)
ffffffffc0208b08:	60ea                	ld	ra,152(sp)
ffffffffc0208b0a:	644a                	ld	s0,144(sp)
ffffffffc0208b0c:	64aa                	ld	s1,136(sp)
ffffffffc0208b0e:	690a                	ld	s2,128(sp)
ffffffffc0208b10:	79e6                	ld	s3,120(sp)
ffffffffc0208b12:	7a46                	ld	s4,112(sp)
ffffffffc0208b14:	7aa6                	ld	s5,104(sp)
ffffffffc0208b16:	7b06                	ld	s6,96(sp)
ffffffffc0208b18:	6c46                	ld	s8,80(sp)
ffffffffc0208b1a:	6ca6                	ld	s9,72(sp)
ffffffffc0208b1c:	6d06                	ld	s10,64(sp)
ffffffffc0208b1e:	7de2                	ld	s11,56(sp)
ffffffffc0208b20:	855e                	mv	a0,s7
ffffffffc0208b22:	6be6                	ld	s7,88(sp)
ffffffffc0208b24:	610d                	addi	sp,sp,160
ffffffffc0208b26:	8082                	ret
ffffffffc0208b28:	43f7d713          	srai	a4,a5,0x3f
ffffffffc0208b2c:	03475693          	srli	a3,a4,0x34
ffffffffc0208b30:	00d78733          	add	a4,a5,a3
ffffffffc0208b34:	01977733          	and	a4,a4,s9
ffffffffc0208b38:	8f15                	sub	a4,a4,a3
ffffffffc0208b3a:	0008d697          	auipc	a3,0x8d
ffffffffc0208b3e:	d2e68693          	addi	a3,a3,-722 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208b42:	9736                	add	a4,a4,a3
ffffffffc0208b44:	00074683          	lbu	a3,0(a4)
ffffffffc0208b48:	0785                	addi	a5,a5,1
ffffffffc0208b4a:	015d8733          	add	a4,s11,s5
ffffffffc0208b4e:	00d70023          	sb	a3,0(a4)
ffffffffc0208b52:	00f9b023          	sd	a5,0(s3)
ffffffffc0208b56:	0a85                	addi	s5,s5,1
ffffffffc0208b58:	001c0b9b          	addiw	s7,s8,1
ffffffffc0208b5c:	f3aae4e3          	bltu	s5,s10,ffffffffc0208a84 <stdin_io+0x62>
ffffffffc0208b60:	dc51                	beqz	s0,ffffffffc0208afc <stdin_io+0xda>
ffffffffc0208b62:	90af80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208b66:	f80b9be3          	bnez	s7,ffffffffc0208afc <stdin_io+0xda>
ffffffffc0208b6a:	4b81                	li	s7,0
ffffffffc0208b6c:	bf71                	j	ffffffffc0208b08 <stdin_io+0xe6>
ffffffffc0208b6e:	904f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208b72:	4405                	li	s0,1
ffffffffc0208b74:	ee0d14e3          	bnez	s10,ffffffffc0208a5c <stdin_io+0x3a>
ffffffffc0208b78:	8f4f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208b7c:	4b81                	li	s7,0
ffffffffc0208b7e:	b769                	j	ffffffffc0208b08 <stdin_io+0xe6>
ffffffffc0208b80:	5bf5                	li	s7,-3
ffffffffc0208b82:	b759                	j	ffffffffc0208b08 <stdin_io+0xe6>

ffffffffc0208b84 <dev_stdin_write>:
ffffffffc0208b84:	e111                	bnez	a0,ffffffffc0208b88 <dev_stdin_write+0x4>
ffffffffc0208b86:	8082                	ret
ffffffffc0208b88:	1101                	addi	sp,sp,-32
ffffffffc0208b8a:	e822                	sd	s0,16(sp)
ffffffffc0208b8c:	ec06                	sd	ra,24(sp)
ffffffffc0208b8e:	e426                	sd	s1,8(sp)
ffffffffc0208b90:	842a                	mv	s0,a0
ffffffffc0208b92:	100027f3          	csrr	a5,sstatus
ffffffffc0208b96:	8b89                	andi	a5,a5,2
ffffffffc0208b98:	4481                	li	s1,0
ffffffffc0208b9a:	e3c1                	bnez	a5,ffffffffc0208c1a <dev_stdin_write+0x96>
ffffffffc0208b9c:	0008e597          	auipc	a1,0x8e
ffffffffc0208ba0:	d6c58593          	addi	a1,a1,-660 # ffffffffc0296908 <p_wpos>
ffffffffc0208ba4:	6198                	ld	a4,0(a1)
ffffffffc0208ba6:	6605                	lui	a2,0x1
ffffffffc0208ba8:	fff60513          	addi	a0,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208bac:	43f75693          	srai	a3,a4,0x3f
ffffffffc0208bb0:	92d1                	srli	a3,a3,0x34
ffffffffc0208bb2:	00d707b3          	add	a5,a4,a3
ffffffffc0208bb6:	8fe9                	and	a5,a5,a0
ffffffffc0208bb8:	8f95                	sub	a5,a5,a3
ffffffffc0208bba:	0008d697          	auipc	a3,0x8d
ffffffffc0208bbe:	cae68693          	addi	a3,a3,-850 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208bc2:	97b6                	add	a5,a5,a3
ffffffffc0208bc4:	00878023          	sb	s0,0(a5)
ffffffffc0208bc8:	0008e797          	auipc	a5,0x8e
ffffffffc0208bcc:	d387b783          	ld	a5,-712(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208bd0:	40f707b3          	sub	a5,a4,a5
ffffffffc0208bd4:	00c7d463          	bge	a5,a2,ffffffffc0208bdc <dev_stdin_write+0x58>
ffffffffc0208bd8:	0705                	addi	a4,a4,1
ffffffffc0208bda:	e198                	sd	a4,0(a1)
ffffffffc0208bdc:	0008d517          	auipc	a0,0x8d
ffffffffc0208be0:	c7c50513          	addi	a0,a0,-900 # ffffffffc0295858 <__wait_queue>
ffffffffc0208be4:	965fb0ef          	jal	ra,ffffffffc0204548 <wait_queue_empty>
ffffffffc0208be8:	cd09                	beqz	a0,ffffffffc0208c02 <dev_stdin_write+0x7e>
ffffffffc0208bea:	e491                	bnez	s1,ffffffffc0208bf6 <dev_stdin_write+0x72>
ffffffffc0208bec:	60e2                	ld	ra,24(sp)
ffffffffc0208bee:	6442                	ld	s0,16(sp)
ffffffffc0208bf0:	64a2                	ld	s1,8(sp)
ffffffffc0208bf2:	6105                	addi	sp,sp,32
ffffffffc0208bf4:	8082                	ret
ffffffffc0208bf6:	6442                	ld	s0,16(sp)
ffffffffc0208bf8:	60e2                	ld	ra,24(sp)
ffffffffc0208bfa:	64a2                	ld	s1,8(sp)
ffffffffc0208bfc:	6105                	addi	sp,sp,32
ffffffffc0208bfe:	86ef806f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0208c02:	800005b7          	lui	a1,0x80000
ffffffffc0208c06:	4605                	li	a2,1
ffffffffc0208c08:	0591                	addi	a1,a1,4
ffffffffc0208c0a:	0008d517          	auipc	a0,0x8d
ffffffffc0208c0e:	c4e50513          	addi	a0,a0,-946 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c12:	99ffb0ef          	jal	ra,ffffffffc02045b0 <wakeup_queue>
ffffffffc0208c16:	d8f9                	beqz	s1,ffffffffc0208bec <dev_stdin_write+0x68>
ffffffffc0208c18:	bff9                	j	ffffffffc0208bf6 <dev_stdin_write+0x72>
ffffffffc0208c1a:	858f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208c1e:	4485                	li	s1,1
ffffffffc0208c20:	bfb5                	j	ffffffffc0208b9c <dev_stdin_write+0x18>

ffffffffc0208c22 <dev_init_stdin>:
ffffffffc0208c22:	1141                	addi	sp,sp,-16
ffffffffc0208c24:	e406                	sd	ra,8(sp)
ffffffffc0208c26:	e022                	sd	s0,0(sp)
ffffffffc0208c28:	ac7ff0ef          	jal	ra,ffffffffc02086ee <dev_create_inode>
ffffffffc0208c2c:	c93d                	beqz	a0,ffffffffc0208ca2 <dev_init_stdin+0x80>
ffffffffc0208c2e:	4d38                	lw	a4,88(a0)
ffffffffc0208c30:	6785                	lui	a5,0x1
ffffffffc0208c32:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208c36:	842a                	mv	s0,a0
ffffffffc0208c38:	08f71e63          	bne	a4,a5,ffffffffc0208cd4 <dev_init_stdin+0xb2>
ffffffffc0208c3c:	4785                	li	a5,1
ffffffffc0208c3e:	e41c                	sd	a5,8(s0)
ffffffffc0208c40:	00000797          	auipc	a5,0x0
ffffffffc0208c44:	dd078793          	addi	a5,a5,-560 # ffffffffc0208a10 <stdin_open>
ffffffffc0208c48:	e81c                	sd	a5,16(s0)
ffffffffc0208c4a:	00000797          	auipc	a5,0x0
ffffffffc0208c4e:	dd078793          	addi	a5,a5,-560 # ffffffffc0208a1a <stdin_close>
ffffffffc0208c52:	ec1c                	sd	a5,24(s0)
ffffffffc0208c54:	00000797          	auipc	a5,0x0
ffffffffc0208c58:	dce78793          	addi	a5,a5,-562 # ffffffffc0208a22 <stdin_io>
ffffffffc0208c5c:	f01c                	sd	a5,32(s0)
ffffffffc0208c5e:	00000797          	auipc	a5,0x0
ffffffffc0208c62:	dc078793          	addi	a5,a5,-576 # ffffffffc0208a1e <stdin_ioctl>
ffffffffc0208c66:	f41c                	sd	a5,40(s0)
ffffffffc0208c68:	0008d517          	auipc	a0,0x8d
ffffffffc0208c6c:	bf050513          	addi	a0,a0,-1040 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c70:	00043023          	sd	zero,0(s0)
ffffffffc0208c74:	0008e797          	auipc	a5,0x8e
ffffffffc0208c78:	c807ba23          	sd	zero,-876(a5) # ffffffffc0296908 <p_wpos>
ffffffffc0208c7c:	0008e797          	auipc	a5,0x8e
ffffffffc0208c80:	c807b223          	sd	zero,-892(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208c84:	871fb0ef          	jal	ra,ffffffffc02044f4 <wait_queue_init>
ffffffffc0208c88:	4601                	li	a2,0
ffffffffc0208c8a:	85a2                	mv	a1,s0
ffffffffc0208c8c:	00006517          	auipc	a0,0x6
ffffffffc0208c90:	ebc50513          	addi	a0,a0,-324 # ffffffffc020eb48 <dev_node_ops+0x270>
ffffffffc0208c94:	916ff0ef          	jal	ra,ffffffffc0207daa <vfs_add_dev>
ffffffffc0208c98:	e10d                	bnez	a0,ffffffffc0208cba <dev_init_stdin+0x98>
ffffffffc0208c9a:	60a2                	ld	ra,8(sp)
ffffffffc0208c9c:	6402                	ld	s0,0(sp)
ffffffffc0208c9e:	0141                	addi	sp,sp,16
ffffffffc0208ca0:	8082                	ret
ffffffffc0208ca2:	00006617          	auipc	a2,0x6
ffffffffc0208ca6:	e6660613          	addi	a2,a2,-410 # ffffffffc020eb08 <dev_node_ops+0x230>
ffffffffc0208caa:	07500593          	li	a1,117
ffffffffc0208cae:	00006517          	auipc	a0,0x6
ffffffffc0208cb2:	e7a50513          	addi	a0,a0,-390 # ffffffffc020eb28 <dev_node_ops+0x250>
ffffffffc0208cb6:	fe8f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208cba:	86aa                	mv	a3,a0
ffffffffc0208cbc:	00006617          	auipc	a2,0x6
ffffffffc0208cc0:	e9460613          	addi	a2,a2,-364 # ffffffffc020eb50 <dev_node_ops+0x278>
ffffffffc0208cc4:	07b00593          	li	a1,123
ffffffffc0208cc8:	00006517          	auipc	a0,0x6
ffffffffc0208ccc:	e6050513          	addi	a0,a0,-416 # ffffffffc020eb28 <dev_node_ops+0x250>
ffffffffc0208cd0:	fcef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208cd4:	00006697          	auipc	a3,0x6
ffffffffc0208cd8:	8dc68693          	addi	a3,a3,-1828 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc0208cdc:	00003617          	auipc	a2,0x3
ffffffffc0208ce0:	c1c60613          	addi	a2,a2,-996 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208ce4:	07700593          	li	a1,119
ffffffffc0208ce8:	00006517          	auipc	a0,0x6
ffffffffc0208cec:	e4050513          	addi	a0,a0,-448 # ffffffffc020eb28 <dev_node_ops+0x250>
ffffffffc0208cf0:	faef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208cf4 <stdout_open>:
ffffffffc0208cf4:	4785                	li	a5,1
ffffffffc0208cf6:	4501                	li	a0,0
ffffffffc0208cf8:	00f59363          	bne	a1,a5,ffffffffc0208cfe <stdout_open+0xa>
ffffffffc0208cfc:	8082                	ret
ffffffffc0208cfe:	5575                	li	a0,-3
ffffffffc0208d00:	8082                	ret

ffffffffc0208d02 <stdout_close>:
ffffffffc0208d02:	4501                	li	a0,0
ffffffffc0208d04:	8082                	ret

ffffffffc0208d06 <stdout_ioctl>:
ffffffffc0208d06:	5575                	li	a0,-3
ffffffffc0208d08:	8082                	ret

ffffffffc0208d0a <stdout_io>:
ffffffffc0208d0a:	ca05                	beqz	a2,ffffffffc0208d3a <stdout_io+0x30>
ffffffffc0208d0c:	6d9c                	ld	a5,24(a1)
ffffffffc0208d0e:	1101                	addi	sp,sp,-32
ffffffffc0208d10:	e822                	sd	s0,16(sp)
ffffffffc0208d12:	e426                	sd	s1,8(sp)
ffffffffc0208d14:	ec06                	sd	ra,24(sp)
ffffffffc0208d16:	6180                	ld	s0,0(a1)
ffffffffc0208d18:	84ae                	mv	s1,a1
ffffffffc0208d1a:	cb91                	beqz	a5,ffffffffc0208d2e <stdout_io+0x24>
ffffffffc0208d1c:	00044503          	lbu	a0,0(s0)
ffffffffc0208d20:	0405                	addi	s0,s0,1
ffffffffc0208d22:	cc0f70ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0208d26:	6c9c                	ld	a5,24(s1)
ffffffffc0208d28:	17fd                	addi	a5,a5,-1
ffffffffc0208d2a:	ec9c                	sd	a5,24(s1)
ffffffffc0208d2c:	fbe5                	bnez	a5,ffffffffc0208d1c <stdout_io+0x12>
ffffffffc0208d2e:	60e2                	ld	ra,24(sp)
ffffffffc0208d30:	6442                	ld	s0,16(sp)
ffffffffc0208d32:	64a2                	ld	s1,8(sp)
ffffffffc0208d34:	4501                	li	a0,0
ffffffffc0208d36:	6105                	addi	sp,sp,32
ffffffffc0208d38:	8082                	ret
ffffffffc0208d3a:	5575                	li	a0,-3
ffffffffc0208d3c:	8082                	ret

ffffffffc0208d3e <dev_init_stdout>:
ffffffffc0208d3e:	1141                	addi	sp,sp,-16
ffffffffc0208d40:	e406                	sd	ra,8(sp)
ffffffffc0208d42:	9adff0ef          	jal	ra,ffffffffc02086ee <dev_create_inode>
ffffffffc0208d46:	c939                	beqz	a0,ffffffffc0208d9c <dev_init_stdout+0x5e>
ffffffffc0208d48:	4d38                	lw	a4,88(a0)
ffffffffc0208d4a:	6785                	lui	a5,0x1
ffffffffc0208d4c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208d50:	85aa                	mv	a1,a0
ffffffffc0208d52:	06f71e63          	bne	a4,a5,ffffffffc0208dce <dev_init_stdout+0x90>
ffffffffc0208d56:	4785                	li	a5,1
ffffffffc0208d58:	e51c                	sd	a5,8(a0)
ffffffffc0208d5a:	00000797          	auipc	a5,0x0
ffffffffc0208d5e:	f9a78793          	addi	a5,a5,-102 # ffffffffc0208cf4 <stdout_open>
ffffffffc0208d62:	e91c                	sd	a5,16(a0)
ffffffffc0208d64:	00000797          	auipc	a5,0x0
ffffffffc0208d68:	f9e78793          	addi	a5,a5,-98 # ffffffffc0208d02 <stdout_close>
ffffffffc0208d6c:	ed1c                	sd	a5,24(a0)
ffffffffc0208d6e:	00000797          	auipc	a5,0x0
ffffffffc0208d72:	f9c78793          	addi	a5,a5,-100 # ffffffffc0208d0a <stdout_io>
ffffffffc0208d76:	f11c                	sd	a5,32(a0)
ffffffffc0208d78:	00000797          	auipc	a5,0x0
ffffffffc0208d7c:	f8e78793          	addi	a5,a5,-114 # ffffffffc0208d06 <stdout_ioctl>
ffffffffc0208d80:	00053023          	sd	zero,0(a0)
ffffffffc0208d84:	f51c                	sd	a5,40(a0)
ffffffffc0208d86:	4601                	li	a2,0
ffffffffc0208d88:	00006517          	auipc	a0,0x6
ffffffffc0208d8c:	e2850513          	addi	a0,a0,-472 # ffffffffc020ebb0 <dev_node_ops+0x2d8>
ffffffffc0208d90:	81aff0ef          	jal	ra,ffffffffc0207daa <vfs_add_dev>
ffffffffc0208d94:	e105                	bnez	a0,ffffffffc0208db4 <dev_init_stdout+0x76>
ffffffffc0208d96:	60a2                	ld	ra,8(sp)
ffffffffc0208d98:	0141                	addi	sp,sp,16
ffffffffc0208d9a:	8082                	ret
ffffffffc0208d9c:	00006617          	auipc	a2,0x6
ffffffffc0208da0:	dd460613          	addi	a2,a2,-556 # ffffffffc020eb70 <dev_node_ops+0x298>
ffffffffc0208da4:	03700593          	li	a1,55
ffffffffc0208da8:	00006517          	auipc	a0,0x6
ffffffffc0208dac:	de850513          	addi	a0,a0,-536 # ffffffffc020eb90 <dev_node_ops+0x2b8>
ffffffffc0208db0:	eeef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208db4:	86aa                	mv	a3,a0
ffffffffc0208db6:	00006617          	auipc	a2,0x6
ffffffffc0208dba:	e0260613          	addi	a2,a2,-510 # ffffffffc020ebb8 <dev_node_ops+0x2e0>
ffffffffc0208dbe:	03d00593          	li	a1,61
ffffffffc0208dc2:	00006517          	auipc	a0,0x6
ffffffffc0208dc6:	dce50513          	addi	a0,a0,-562 # ffffffffc020eb90 <dev_node_ops+0x2b8>
ffffffffc0208dca:	ed4f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208dce:	00005697          	auipc	a3,0x5
ffffffffc0208dd2:	7e268693          	addi	a3,a3,2018 # ffffffffc020e5b0 <syscalls+0xb10>
ffffffffc0208dd6:	00003617          	auipc	a2,0x3
ffffffffc0208dda:	b2260613          	addi	a2,a2,-1246 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208dde:	03900593          	li	a1,57
ffffffffc0208de2:	00006517          	auipc	a0,0x6
ffffffffc0208de6:	dae50513          	addi	a0,a0,-594 # ffffffffc020eb90 <dev_node_ops+0x2b8>
ffffffffc0208dea:	eb4f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208dee <bitmap_translate.part.0>:
ffffffffc0208dee:	1141                	addi	sp,sp,-16
ffffffffc0208df0:	00006697          	auipc	a3,0x6
ffffffffc0208df4:	de868693          	addi	a3,a3,-536 # ffffffffc020ebd8 <dev_node_ops+0x300>
ffffffffc0208df8:	00003617          	auipc	a2,0x3
ffffffffc0208dfc:	b0060613          	addi	a2,a2,-1280 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208e00:	04c00593          	li	a1,76
ffffffffc0208e04:	00006517          	auipc	a0,0x6
ffffffffc0208e08:	dec50513          	addi	a0,a0,-532 # ffffffffc020ebf0 <dev_node_ops+0x318>
ffffffffc0208e0c:	e406                	sd	ra,8(sp)
ffffffffc0208e0e:	e90f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208e12 <bitmap_create>:
ffffffffc0208e12:	7139                	addi	sp,sp,-64
ffffffffc0208e14:	fc06                	sd	ra,56(sp)
ffffffffc0208e16:	f822                	sd	s0,48(sp)
ffffffffc0208e18:	f426                	sd	s1,40(sp)
ffffffffc0208e1a:	f04a                	sd	s2,32(sp)
ffffffffc0208e1c:	ec4e                	sd	s3,24(sp)
ffffffffc0208e1e:	e852                	sd	s4,16(sp)
ffffffffc0208e20:	e456                	sd	s5,8(sp)
ffffffffc0208e22:	c14d                	beqz	a0,ffffffffc0208ec4 <bitmap_create+0xb2>
ffffffffc0208e24:	842a                	mv	s0,a0
ffffffffc0208e26:	4541                	li	a0,16
ffffffffc0208e28:	966f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208e2c:	84aa                	mv	s1,a0
ffffffffc0208e2e:	cd25                	beqz	a0,ffffffffc0208ea6 <bitmap_create+0x94>
ffffffffc0208e30:	02041a13          	slli	s4,s0,0x20
ffffffffc0208e34:	020a5a13          	srli	s4,s4,0x20
ffffffffc0208e38:	01fa0793          	addi	a5,s4,31
ffffffffc0208e3c:	0057d993          	srli	s3,a5,0x5
ffffffffc0208e40:	00299a93          	slli	s5,s3,0x2
ffffffffc0208e44:	8556                	mv	a0,s5
ffffffffc0208e46:	894e                	mv	s2,s3
ffffffffc0208e48:	946f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208e4c:	c53d                	beqz	a0,ffffffffc0208eba <bitmap_create+0xa8>
ffffffffc0208e4e:	0134a223          	sw	s3,4(s1) # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208e52:	c080                	sw	s0,0(s1)
ffffffffc0208e54:	8656                	mv	a2,s5
ffffffffc0208e56:	0ff00593          	li	a1,255
ffffffffc0208e5a:	5bc020ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0208e5e:	e488                	sd	a0,8(s1)
ffffffffc0208e60:	0996                	slli	s3,s3,0x5
ffffffffc0208e62:	053a0263          	beq	s4,s3,ffffffffc0208ea6 <bitmap_create+0x94>
ffffffffc0208e66:	fff9079b          	addiw	a5,s2,-1
ffffffffc0208e6a:	0057969b          	slliw	a3,a5,0x5
ffffffffc0208e6e:	0054561b          	srliw	a2,s0,0x5
ffffffffc0208e72:	40d4073b          	subw	a4,s0,a3
ffffffffc0208e76:	0054541b          	srliw	s0,s0,0x5
ffffffffc0208e7a:	08f61463          	bne	a2,a5,ffffffffc0208f02 <bitmap_create+0xf0>
ffffffffc0208e7e:	fff7069b          	addiw	a3,a4,-1
ffffffffc0208e82:	47f9                	li	a5,30
ffffffffc0208e84:	04d7ef63          	bltu	a5,a3,ffffffffc0208ee2 <bitmap_create+0xd0>
ffffffffc0208e88:	1402                	slli	s0,s0,0x20
ffffffffc0208e8a:	8079                	srli	s0,s0,0x1e
ffffffffc0208e8c:	9522                	add	a0,a0,s0
ffffffffc0208e8e:	411c                	lw	a5,0(a0)
ffffffffc0208e90:	4585                	li	a1,1
ffffffffc0208e92:	02000613          	li	a2,32
ffffffffc0208e96:	00e596bb          	sllw	a3,a1,a4
ffffffffc0208e9a:	8fb5                	xor	a5,a5,a3
ffffffffc0208e9c:	2705                	addiw	a4,a4,1
ffffffffc0208e9e:	2781                	sext.w	a5,a5
ffffffffc0208ea0:	fec71be3          	bne	a4,a2,ffffffffc0208e96 <bitmap_create+0x84>
ffffffffc0208ea4:	c11c                	sw	a5,0(a0)
ffffffffc0208ea6:	70e2                	ld	ra,56(sp)
ffffffffc0208ea8:	7442                	ld	s0,48(sp)
ffffffffc0208eaa:	7902                	ld	s2,32(sp)
ffffffffc0208eac:	69e2                	ld	s3,24(sp)
ffffffffc0208eae:	6a42                	ld	s4,16(sp)
ffffffffc0208eb0:	6aa2                	ld	s5,8(sp)
ffffffffc0208eb2:	8526                	mv	a0,s1
ffffffffc0208eb4:	74a2                	ld	s1,40(sp)
ffffffffc0208eb6:	6121                	addi	sp,sp,64
ffffffffc0208eb8:	8082                	ret
ffffffffc0208eba:	8526                	mv	a0,s1
ffffffffc0208ebc:	982f90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208ec0:	4481                	li	s1,0
ffffffffc0208ec2:	b7d5                	j	ffffffffc0208ea6 <bitmap_create+0x94>
ffffffffc0208ec4:	00006697          	auipc	a3,0x6
ffffffffc0208ec8:	d4468693          	addi	a3,a3,-700 # ffffffffc020ec08 <dev_node_ops+0x330>
ffffffffc0208ecc:	00003617          	auipc	a2,0x3
ffffffffc0208ed0:	a2c60613          	addi	a2,a2,-1492 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208ed4:	45d5                	li	a1,21
ffffffffc0208ed6:	00006517          	auipc	a0,0x6
ffffffffc0208eda:	d1a50513          	addi	a0,a0,-742 # ffffffffc020ebf0 <dev_node_ops+0x318>
ffffffffc0208ede:	dc0f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208ee2:	00006697          	auipc	a3,0x6
ffffffffc0208ee6:	d6668693          	addi	a3,a3,-666 # ffffffffc020ec48 <dev_node_ops+0x370>
ffffffffc0208eea:	00003617          	auipc	a2,0x3
ffffffffc0208eee:	a0e60613          	addi	a2,a2,-1522 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208ef2:	02b00593          	li	a1,43
ffffffffc0208ef6:	00006517          	auipc	a0,0x6
ffffffffc0208efa:	cfa50513          	addi	a0,a0,-774 # ffffffffc020ebf0 <dev_node_ops+0x318>
ffffffffc0208efe:	da0f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208f02:	00006697          	auipc	a3,0x6
ffffffffc0208f06:	d2e68693          	addi	a3,a3,-722 # ffffffffc020ec30 <dev_node_ops+0x358>
ffffffffc0208f0a:	00003617          	auipc	a2,0x3
ffffffffc0208f0e:	9ee60613          	addi	a2,a2,-1554 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208f12:	02a00593          	li	a1,42
ffffffffc0208f16:	00006517          	auipc	a0,0x6
ffffffffc0208f1a:	cda50513          	addi	a0,a0,-806 # ffffffffc020ebf0 <dev_node_ops+0x318>
ffffffffc0208f1e:	d80f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208f22 <bitmap_alloc>:
ffffffffc0208f22:	4150                	lw	a2,4(a0)
ffffffffc0208f24:	651c                	ld	a5,8(a0)
ffffffffc0208f26:	c231                	beqz	a2,ffffffffc0208f6a <bitmap_alloc+0x48>
ffffffffc0208f28:	4701                	li	a4,0
ffffffffc0208f2a:	a029                	j	ffffffffc0208f34 <bitmap_alloc+0x12>
ffffffffc0208f2c:	2705                	addiw	a4,a4,1
ffffffffc0208f2e:	0791                	addi	a5,a5,4
ffffffffc0208f30:	02e60d63          	beq	a2,a4,ffffffffc0208f6a <bitmap_alloc+0x48>
ffffffffc0208f34:	4394                	lw	a3,0(a5)
ffffffffc0208f36:	dafd                	beqz	a3,ffffffffc0208f2c <bitmap_alloc+0xa>
ffffffffc0208f38:	4501                	li	a0,0
ffffffffc0208f3a:	4885                	li	a7,1
ffffffffc0208f3c:	8e36                	mv	t3,a3
ffffffffc0208f3e:	02000313          	li	t1,32
ffffffffc0208f42:	a021                	j	ffffffffc0208f4a <bitmap_alloc+0x28>
ffffffffc0208f44:	2505                	addiw	a0,a0,1
ffffffffc0208f46:	02650463          	beq	a0,t1,ffffffffc0208f6e <bitmap_alloc+0x4c>
ffffffffc0208f4a:	00a8983b          	sllw	a6,a7,a0
ffffffffc0208f4e:	0106f633          	and	a2,a3,a6
ffffffffc0208f52:	2601                	sext.w	a2,a2
ffffffffc0208f54:	da65                	beqz	a2,ffffffffc0208f44 <bitmap_alloc+0x22>
ffffffffc0208f56:	010e4833          	xor	a6,t3,a6
ffffffffc0208f5a:	0057171b          	slliw	a4,a4,0x5
ffffffffc0208f5e:	9f29                	addw	a4,a4,a0
ffffffffc0208f60:	0107a023          	sw	a6,0(a5)
ffffffffc0208f64:	c198                	sw	a4,0(a1)
ffffffffc0208f66:	4501                	li	a0,0
ffffffffc0208f68:	8082                	ret
ffffffffc0208f6a:	5571                	li	a0,-4
ffffffffc0208f6c:	8082                	ret
ffffffffc0208f6e:	1141                	addi	sp,sp,-16
ffffffffc0208f70:	00004697          	auipc	a3,0x4
ffffffffc0208f74:	a2868693          	addi	a3,a3,-1496 # ffffffffc020c998 <default_pmm_manager+0x5b8>
ffffffffc0208f78:	00003617          	auipc	a2,0x3
ffffffffc0208f7c:	98060613          	addi	a2,a2,-1664 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208f80:	04300593          	li	a1,67
ffffffffc0208f84:	00006517          	auipc	a0,0x6
ffffffffc0208f88:	c6c50513          	addi	a0,a0,-916 # ffffffffc020ebf0 <dev_node_ops+0x318>
ffffffffc0208f8c:	e406                	sd	ra,8(sp)
ffffffffc0208f8e:	d10f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208f92 <bitmap_test>:
ffffffffc0208f92:	411c                	lw	a5,0(a0)
ffffffffc0208f94:	00f5ff63          	bgeu	a1,a5,ffffffffc0208fb2 <bitmap_test+0x20>
ffffffffc0208f98:	651c                	ld	a5,8(a0)
ffffffffc0208f9a:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0208f9e:	070a                	slli	a4,a4,0x2
ffffffffc0208fa0:	97ba                	add	a5,a5,a4
ffffffffc0208fa2:	4388                	lw	a0,0(a5)
ffffffffc0208fa4:	4785                	li	a5,1
ffffffffc0208fa6:	00b795bb          	sllw	a1,a5,a1
ffffffffc0208faa:	8d6d                	and	a0,a0,a1
ffffffffc0208fac:	1502                	slli	a0,a0,0x20
ffffffffc0208fae:	9101                	srli	a0,a0,0x20
ffffffffc0208fb0:	8082                	ret
ffffffffc0208fb2:	1141                	addi	sp,sp,-16
ffffffffc0208fb4:	e406                	sd	ra,8(sp)
ffffffffc0208fb6:	e39ff0ef          	jal	ra,ffffffffc0208dee <bitmap_translate.part.0>

ffffffffc0208fba <bitmap_free>:
ffffffffc0208fba:	411c                	lw	a5,0(a0)
ffffffffc0208fbc:	1141                	addi	sp,sp,-16
ffffffffc0208fbe:	e406                	sd	ra,8(sp)
ffffffffc0208fc0:	02f5f463          	bgeu	a1,a5,ffffffffc0208fe8 <bitmap_free+0x2e>
ffffffffc0208fc4:	651c                	ld	a5,8(a0)
ffffffffc0208fc6:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0208fca:	070a                	slli	a4,a4,0x2
ffffffffc0208fcc:	97ba                	add	a5,a5,a4
ffffffffc0208fce:	4398                	lw	a4,0(a5)
ffffffffc0208fd0:	4685                	li	a3,1
ffffffffc0208fd2:	00b695bb          	sllw	a1,a3,a1
ffffffffc0208fd6:	00b776b3          	and	a3,a4,a1
ffffffffc0208fda:	2681                	sext.w	a3,a3
ffffffffc0208fdc:	ea81                	bnez	a3,ffffffffc0208fec <bitmap_free+0x32>
ffffffffc0208fde:	60a2                	ld	ra,8(sp)
ffffffffc0208fe0:	8f4d                	or	a4,a4,a1
ffffffffc0208fe2:	c398                	sw	a4,0(a5)
ffffffffc0208fe4:	0141                	addi	sp,sp,16
ffffffffc0208fe6:	8082                	ret
ffffffffc0208fe8:	e07ff0ef          	jal	ra,ffffffffc0208dee <bitmap_translate.part.0>
ffffffffc0208fec:	00006697          	auipc	a3,0x6
ffffffffc0208ff0:	c8468693          	addi	a3,a3,-892 # ffffffffc020ec70 <dev_node_ops+0x398>
ffffffffc0208ff4:	00003617          	auipc	a2,0x3
ffffffffc0208ff8:	90460613          	addi	a2,a2,-1788 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0208ffc:	05f00593          	li	a1,95
ffffffffc0209000:	00006517          	auipc	a0,0x6
ffffffffc0209004:	bf050513          	addi	a0,a0,-1040 # ffffffffc020ebf0 <dev_node_ops+0x318>
ffffffffc0209008:	c96f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020900c <bitmap_destroy>:
ffffffffc020900c:	1141                	addi	sp,sp,-16
ffffffffc020900e:	e022                	sd	s0,0(sp)
ffffffffc0209010:	842a                	mv	s0,a0
ffffffffc0209012:	6508                	ld	a0,8(a0)
ffffffffc0209014:	e406                	sd	ra,8(sp)
ffffffffc0209016:	828f90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020901a:	8522                	mv	a0,s0
ffffffffc020901c:	6402                	ld	s0,0(sp)
ffffffffc020901e:	60a2                	ld	ra,8(sp)
ffffffffc0209020:	0141                	addi	sp,sp,16
ffffffffc0209022:	81cf906f          	j	ffffffffc020203e <kfree>

ffffffffc0209026 <bitmap_getdata>:
ffffffffc0209026:	c589                	beqz	a1,ffffffffc0209030 <bitmap_getdata+0xa>
ffffffffc0209028:	00456783          	lwu	a5,4(a0)
ffffffffc020902c:	078a                	slli	a5,a5,0x2
ffffffffc020902e:	e19c                	sd	a5,0(a1)
ffffffffc0209030:	6508                	ld	a0,8(a0)
ffffffffc0209032:	8082                	ret

ffffffffc0209034 <sfs_init>:
ffffffffc0209034:	1141                	addi	sp,sp,-16
ffffffffc0209036:	00006517          	auipc	a0,0x6
ffffffffc020903a:	aaa50513          	addi	a0,a0,-1366 # ffffffffc020eae0 <dev_node_ops+0x208>
ffffffffc020903e:	e406                	sd	ra,8(sp)
ffffffffc0209040:	554000ef          	jal	ra,ffffffffc0209594 <sfs_mount>
ffffffffc0209044:	e501                	bnez	a0,ffffffffc020904c <sfs_init+0x18>
ffffffffc0209046:	60a2                	ld	ra,8(sp)
ffffffffc0209048:	0141                	addi	sp,sp,16
ffffffffc020904a:	8082                	ret
ffffffffc020904c:	86aa                	mv	a3,a0
ffffffffc020904e:	00006617          	auipc	a2,0x6
ffffffffc0209052:	c3260613          	addi	a2,a2,-974 # ffffffffc020ec80 <dev_node_ops+0x3a8>
ffffffffc0209056:	45c1                	li	a1,16
ffffffffc0209058:	00006517          	auipc	a0,0x6
ffffffffc020905c:	c4850513          	addi	a0,a0,-952 # ffffffffc020eca0 <dev_node_ops+0x3c8>
ffffffffc0209060:	c3ef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209064 <sfs_unmount>:
ffffffffc0209064:	1141                	addi	sp,sp,-16
ffffffffc0209066:	e406                	sd	ra,8(sp)
ffffffffc0209068:	e022                	sd	s0,0(sp)
ffffffffc020906a:	cd1d                	beqz	a0,ffffffffc02090a8 <sfs_unmount+0x44>
ffffffffc020906c:	0b052783          	lw	a5,176(a0)
ffffffffc0209070:	842a                	mv	s0,a0
ffffffffc0209072:	eb9d                	bnez	a5,ffffffffc02090a8 <sfs_unmount+0x44>
ffffffffc0209074:	7158                	ld	a4,160(a0)
ffffffffc0209076:	09850793          	addi	a5,a0,152
ffffffffc020907a:	02f71563          	bne	a4,a5,ffffffffc02090a4 <sfs_unmount+0x40>
ffffffffc020907e:	613c                	ld	a5,64(a0)
ffffffffc0209080:	e7a1                	bnez	a5,ffffffffc02090c8 <sfs_unmount+0x64>
ffffffffc0209082:	7d08                	ld	a0,56(a0)
ffffffffc0209084:	f89ff0ef          	jal	ra,ffffffffc020900c <bitmap_destroy>
ffffffffc0209088:	6428                	ld	a0,72(s0)
ffffffffc020908a:	fb5f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020908e:	7448                	ld	a0,168(s0)
ffffffffc0209090:	faff80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209094:	8522                	mv	a0,s0
ffffffffc0209096:	fa9f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020909a:	4501                	li	a0,0
ffffffffc020909c:	60a2                	ld	ra,8(sp)
ffffffffc020909e:	6402                	ld	s0,0(sp)
ffffffffc02090a0:	0141                	addi	sp,sp,16
ffffffffc02090a2:	8082                	ret
ffffffffc02090a4:	5545                	li	a0,-15
ffffffffc02090a6:	bfdd                	j	ffffffffc020909c <sfs_unmount+0x38>
ffffffffc02090a8:	00006697          	auipc	a3,0x6
ffffffffc02090ac:	c1068693          	addi	a3,a3,-1008 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc02090b0:	00003617          	auipc	a2,0x3
ffffffffc02090b4:	84860613          	addi	a2,a2,-1976 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02090b8:	04100593          	li	a1,65
ffffffffc02090bc:	00006517          	auipc	a0,0x6
ffffffffc02090c0:	c2c50513          	addi	a0,a0,-980 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc02090c4:	bdaf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02090c8:	00006697          	auipc	a3,0x6
ffffffffc02090cc:	c3868693          	addi	a3,a3,-968 # ffffffffc020ed00 <dev_node_ops+0x428>
ffffffffc02090d0:	00003617          	auipc	a2,0x3
ffffffffc02090d4:	82860613          	addi	a2,a2,-2008 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02090d8:	04500593          	li	a1,69
ffffffffc02090dc:	00006517          	auipc	a0,0x6
ffffffffc02090e0:	c0c50513          	addi	a0,a0,-1012 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc02090e4:	bbaf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02090e8 <sfs_cleanup>:
ffffffffc02090e8:	1101                	addi	sp,sp,-32
ffffffffc02090ea:	ec06                	sd	ra,24(sp)
ffffffffc02090ec:	e822                	sd	s0,16(sp)
ffffffffc02090ee:	e426                	sd	s1,8(sp)
ffffffffc02090f0:	e04a                	sd	s2,0(sp)
ffffffffc02090f2:	c525                	beqz	a0,ffffffffc020915a <sfs_cleanup+0x72>
ffffffffc02090f4:	0b052783          	lw	a5,176(a0)
ffffffffc02090f8:	84aa                	mv	s1,a0
ffffffffc02090fa:	e3a5                	bnez	a5,ffffffffc020915a <sfs_cleanup+0x72>
ffffffffc02090fc:	4158                	lw	a4,4(a0)
ffffffffc02090fe:	4514                	lw	a3,8(a0)
ffffffffc0209100:	00c50913          	addi	s2,a0,12
ffffffffc0209104:	85ca                	mv	a1,s2
ffffffffc0209106:	40d7063b          	subw	a2,a4,a3
ffffffffc020910a:	00006517          	auipc	a0,0x6
ffffffffc020910e:	c0e50513          	addi	a0,a0,-1010 # ffffffffc020ed18 <dev_node_ops+0x440>
ffffffffc0209112:	894f70ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209116:	02000413          	li	s0,32
ffffffffc020911a:	a019                	j	ffffffffc0209120 <sfs_cleanup+0x38>
ffffffffc020911c:	347d                	addiw	s0,s0,-1
ffffffffc020911e:	c819                	beqz	s0,ffffffffc0209134 <sfs_cleanup+0x4c>
ffffffffc0209120:	7cdc                	ld	a5,184(s1)
ffffffffc0209122:	8526                	mv	a0,s1
ffffffffc0209124:	9782                	jalr	a5
ffffffffc0209126:	f97d                	bnez	a0,ffffffffc020911c <sfs_cleanup+0x34>
ffffffffc0209128:	60e2                	ld	ra,24(sp)
ffffffffc020912a:	6442                	ld	s0,16(sp)
ffffffffc020912c:	64a2                	ld	s1,8(sp)
ffffffffc020912e:	6902                	ld	s2,0(sp)
ffffffffc0209130:	6105                	addi	sp,sp,32
ffffffffc0209132:	8082                	ret
ffffffffc0209134:	6442                	ld	s0,16(sp)
ffffffffc0209136:	60e2                	ld	ra,24(sp)
ffffffffc0209138:	64a2                	ld	s1,8(sp)
ffffffffc020913a:	86ca                	mv	a3,s2
ffffffffc020913c:	6902                	ld	s2,0(sp)
ffffffffc020913e:	872a                	mv	a4,a0
ffffffffc0209140:	00006617          	auipc	a2,0x6
ffffffffc0209144:	bf860613          	addi	a2,a2,-1032 # ffffffffc020ed38 <dev_node_ops+0x460>
ffffffffc0209148:	05f00593          	li	a1,95
ffffffffc020914c:	00006517          	auipc	a0,0x6
ffffffffc0209150:	b9c50513          	addi	a0,a0,-1124 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc0209154:	6105                	addi	sp,sp,32
ffffffffc0209156:	bb0f706f          	j	ffffffffc0200506 <__warn>
ffffffffc020915a:	00006697          	auipc	a3,0x6
ffffffffc020915e:	b5e68693          	addi	a3,a3,-1186 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc0209162:	00002617          	auipc	a2,0x2
ffffffffc0209166:	79660613          	addi	a2,a2,1942 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020916a:	05400593          	li	a1,84
ffffffffc020916e:	00006517          	auipc	a0,0x6
ffffffffc0209172:	b7a50513          	addi	a0,a0,-1158 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc0209176:	b28f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020917a <sfs_sync>:
ffffffffc020917a:	7179                	addi	sp,sp,-48
ffffffffc020917c:	f406                	sd	ra,40(sp)
ffffffffc020917e:	f022                	sd	s0,32(sp)
ffffffffc0209180:	ec26                	sd	s1,24(sp)
ffffffffc0209182:	e84a                	sd	s2,16(sp)
ffffffffc0209184:	e44e                	sd	s3,8(sp)
ffffffffc0209186:	e052                	sd	s4,0(sp)
ffffffffc0209188:	cd4d                	beqz	a0,ffffffffc0209242 <sfs_sync+0xc8>
ffffffffc020918a:	0b052783          	lw	a5,176(a0)
ffffffffc020918e:	8a2a                	mv	s4,a0
ffffffffc0209190:	ebcd                	bnez	a5,ffffffffc0209242 <sfs_sync+0xc8>
ffffffffc0209192:	531010ef          	jal	ra,ffffffffc020aec2 <lock_sfs_fs>
ffffffffc0209196:	0a0a3403          	ld	s0,160(s4)
ffffffffc020919a:	098a0913          	addi	s2,s4,152
ffffffffc020919e:	02890763          	beq	s2,s0,ffffffffc02091cc <sfs_sync+0x52>
ffffffffc02091a2:	00004997          	auipc	s3,0x4
ffffffffc02091a6:	0ce98993          	addi	s3,s3,206 # ffffffffc020d270 <default_pmm_manager+0xe90>
ffffffffc02091aa:	7c1c                	ld	a5,56(s0)
ffffffffc02091ac:	fc840493          	addi	s1,s0,-56
ffffffffc02091b0:	cbb5                	beqz	a5,ffffffffc0209224 <sfs_sync+0xaa>
ffffffffc02091b2:	7b9c                	ld	a5,48(a5)
ffffffffc02091b4:	cba5                	beqz	a5,ffffffffc0209224 <sfs_sync+0xaa>
ffffffffc02091b6:	85ce                	mv	a1,s3
ffffffffc02091b8:	8526                	mv	a0,s1
ffffffffc02091ba:	e28fe0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc02091be:	7c1c                	ld	a5,56(s0)
ffffffffc02091c0:	8526                	mv	a0,s1
ffffffffc02091c2:	7b9c                	ld	a5,48(a5)
ffffffffc02091c4:	9782                	jalr	a5
ffffffffc02091c6:	6400                	ld	s0,8(s0)
ffffffffc02091c8:	fe8911e3          	bne	s2,s0,ffffffffc02091aa <sfs_sync+0x30>
ffffffffc02091cc:	8552                	mv	a0,s4
ffffffffc02091ce:	505010ef          	jal	ra,ffffffffc020aed2 <unlock_sfs_fs>
ffffffffc02091d2:	040a3783          	ld	a5,64(s4)
ffffffffc02091d6:	4501                	li	a0,0
ffffffffc02091d8:	eb89                	bnez	a5,ffffffffc02091ea <sfs_sync+0x70>
ffffffffc02091da:	70a2                	ld	ra,40(sp)
ffffffffc02091dc:	7402                	ld	s0,32(sp)
ffffffffc02091de:	64e2                	ld	s1,24(sp)
ffffffffc02091e0:	6942                	ld	s2,16(sp)
ffffffffc02091e2:	69a2                	ld	s3,8(sp)
ffffffffc02091e4:	6a02                	ld	s4,0(sp)
ffffffffc02091e6:	6145                	addi	sp,sp,48
ffffffffc02091e8:	8082                	ret
ffffffffc02091ea:	040a3023          	sd	zero,64(s4)
ffffffffc02091ee:	8552                	mv	a0,s4
ffffffffc02091f0:	3b7010ef          	jal	ra,ffffffffc020ada6 <sfs_sync_super>
ffffffffc02091f4:	cd01                	beqz	a0,ffffffffc020920c <sfs_sync+0x92>
ffffffffc02091f6:	70a2                	ld	ra,40(sp)
ffffffffc02091f8:	7402                	ld	s0,32(sp)
ffffffffc02091fa:	4785                	li	a5,1
ffffffffc02091fc:	04fa3023          	sd	a5,64(s4)
ffffffffc0209200:	64e2                	ld	s1,24(sp)
ffffffffc0209202:	6942                	ld	s2,16(sp)
ffffffffc0209204:	69a2                	ld	s3,8(sp)
ffffffffc0209206:	6a02                	ld	s4,0(sp)
ffffffffc0209208:	6145                	addi	sp,sp,48
ffffffffc020920a:	8082                	ret
ffffffffc020920c:	8552                	mv	a0,s4
ffffffffc020920e:	3df010ef          	jal	ra,ffffffffc020adec <sfs_sync_freemap>
ffffffffc0209212:	f175                	bnez	a0,ffffffffc02091f6 <sfs_sync+0x7c>
ffffffffc0209214:	70a2                	ld	ra,40(sp)
ffffffffc0209216:	7402                	ld	s0,32(sp)
ffffffffc0209218:	64e2                	ld	s1,24(sp)
ffffffffc020921a:	6942                	ld	s2,16(sp)
ffffffffc020921c:	69a2                	ld	s3,8(sp)
ffffffffc020921e:	6a02                	ld	s4,0(sp)
ffffffffc0209220:	6145                	addi	sp,sp,48
ffffffffc0209222:	8082                	ret
ffffffffc0209224:	00004697          	auipc	a3,0x4
ffffffffc0209228:	ffc68693          	addi	a3,a3,-4 # ffffffffc020d220 <default_pmm_manager+0xe40>
ffffffffc020922c:	00002617          	auipc	a2,0x2
ffffffffc0209230:	6cc60613          	addi	a2,a2,1740 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209234:	45ed                	li	a1,27
ffffffffc0209236:	00006517          	auipc	a0,0x6
ffffffffc020923a:	ab250513          	addi	a0,a0,-1358 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc020923e:	a60f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209242:	00006697          	auipc	a3,0x6
ffffffffc0209246:	a7668693          	addi	a3,a3,-1418 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc020924a:	00002617          	auipc	a2,0x2
ffffffffc020924e:	6ae60613          	addi	a2,a2,1710 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209252:	45d5                	li	a1,21
ffffffffc0209254:	00006517          	auipc	a0,0x6
ffffffffc0209258:	a9450513          	addi	a0,a0,-1388 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc020925c:	a42f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209260 <sfs_get_root>:
ffffffffc0209260:	1101                	addi	sp,sp,-32
ffffffffc0209262:	ec06                	sd	ra,24(sp)
ffffffffc0209264:	cd09                	beqz	a0,ffffffffc020927e <sfs_get_root+0x1e>
ffffffffc0209266:	0b052783          	lw	a5,176(a0)
ffffffffc020926a:	eb91                	bnez	a5,ffffffffc020927e <sfs_get_root+0x1e>
ffffffffc020926c:	4605                	li	a2,1
ffffffffc020926e:	002c                	addi	a1,sp,8
ffffffffc0209270:	368010ef          	jal	ra,ffffffffc020a5d8 <sfs_load_inode>
ffffffffc0209274:	e50d                	bnez	a0,ffffffffc020929e <sfs_get_root+0x3e>
ffffffffc0209276:	60e2                	ld	ra,24(sp)
ffffffffc0209278:	6522                	ld	a0,8(sp)
ffffffffc020927a:	6105                	addi	sp,sp,32
ffffffffc020927c:	8082                	ret
ffffffffc020927e:	00006697          	auipc	a3,0x6
ffffffffc0209282:	a3a68693          	addi	a3,a3,-1478 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc0209286:	00002617          	auipc	a2,0x2
ffffffffc020928a:	67260613          	addi	a2,a2,1650 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020928e:	03600593          	li	a1,54
ffffffffc0209292:	00006517          	auipc	a0,0x6
ffffffffc0209296:	a5650513          	addi	a0,a0,-1450 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc020929a:	a04f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020929e:	86aa                	mv	a3,a0
ffffffffc02092a0:	00006617          	auipc	a2,0x6
ffffffffc02092a4:	ab860613          	addi	a2,a2,-1352 # ffffffffc020ed58 <dev_node_ops+0x480>
ffffffffc02092a8:	03700593          	li	a1,55
ffffffffc02092ac:	00006517          	auipc	a0,0x6
ffffffffc02092b0:	a3c50513          	addi	a0,a0,-1476 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc02092b4:	9eaf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02092b8 <sfs_do_mount>:
ffffffffc02092b8:	6518                	ld	a4,8(a0)
ffffffffc02092ba:	7171                	addi	sp,sp,-176
ffffffffc02092bc:	f506                	sd	ra,168(sp)
ffffffffc02092be:	f122                	sd	s0,160(sp)
ffffffffc02092c0:	ed26                	sd	s1,152(sp)
ffffffffc02092c2:	e94a                	sd	s2,144(sp)
ffffffffc02092c4:	e54e                	sd	s3,136(sp)
ffffffffc02092c6:	e152                	sd	s4,128(sp)
ffffffffc02092c8:	fcd6                	sd	s5,120(sp)
ffffffffc02092ca:	f8da                	sd	s6,112(sp)
ffffffffc02092cc:	f4de                	sd	s7,104(sp)
ffffffffc02092ce:	f0e2                	sd	s8,96(sp)
ffffffffc02092d0:	ece6                	sd	s9,88(sp)
ffffffffc02092d2:	e8ea                	sd	s10,80(sp)
ffffffffc02092d4:	e4ee                	sd	s11,72(sp)
ffffffffc02092d6:	6785                	lui	a5,0x1
ffffffffc02092d8:	24f71663          	bne	a4,a5,ffffffffc0209524 <sfs_do_mount+0x26c>
ffffffffc02092dc:	892a                	mv	s2,a0
ffffffffc02092de:	4501                	li	a0,0
ffffffffc02092e0:	8aae                	mv	s5,a1
ffffffffc02092e2:	f00fe0ef          	jal	ra,ffffffffc02079e2 <__alloc_fs>
ffffffffc02092e6:	842a                	mv	s0,a0
ffffffffc02092e8:	24050463          	beqz	a0,ffffffffc0209530 <sfs_do_mount+0x278>
ffffffffc02092ec:	0b052b03          	lw	s6,176(a0)
ffffffffc02092f0:	260b1263          	bnez	s6,ffffffffc0209554 <sfs_do_mount+0x29c>
ffffffffc02092f4:	03253823          	sd	s2,48(a0)
ffffffffc02092f8:	6505                	lui	a0,0x1
ffffffffc02092fa:	c95f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02092fe:	e428                	sd	a0,72(s0)
ffffffffc0209300:	84aa                	mv	s1,a0
ffffffffc0209302:	16050363          	beqz	a0,ffffffffc0209468 <sfs_do_mount+0x1b0>
ffffffffc0209306:	85aa                	mv	a1,a0
ffffffffc0209308:	4681                	li	a3,0
ffffffffc020930a:	6605                	lui	a2,0x1
ffffffffc020930c:	1008                	addi	a0,sp,32
ffffffffc020930e:	832fc0ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc0209312:	02093783          	ld	a5,32(s2)
ffffffffc0209316:	85aa                	mv	a1,a0
ffffffffc0209318:	4601                	li	a2,0
ffffffffc020931a:	854a                	mv	a0,s2
ffffffffc020931c:	9782                	jalr	a5
ffffffffc020931e:	8a2a                	mv	s4,a0
ffffffffc0209320:	10051e63          	bnez	a0,ffffffffc020943c <sfs_do_mount+0x184>
ffffffffc0209324:	408c                	lw	a1,0(s1)
ffffffffc0209326:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc020932a:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc020932e:	14c59863          	bne	a1,a2,ffffffffc020947e <sfs_do_mount+0x1c6>
ffffffffc0209332:	40dc                	lw	a5,4(s1)
ffffffffc0209334:	00093603          	ld	a2,0(s2)
ffffffffc0209338:	02079713          	slli	a4,a5,0x20
ffffffffc020933c:	9301                	srli	a4,a4,0x20
ffffffffc020933e:	12e66763          	bltu	a2,a4,ffffffffc020946c <sfs_do_mount+0x1b4>
ffffffffc0209342:	020485a3          	sb	zero,43(s1)
ffffffffc0209346:	0084af03          	lw	t5,8(s1)
ffffffffc020934a:	00c4ae83          	lw	t4,12(s1)
ffffffffc020934e:	0104ae03          	lw	t3,16(s1)
ffffffffc0209352:	0144a303          	lw	t1,20(s1)
ffffffffc0209356:	0184a883          	lw	a7,24(s1)
ffffffffc020935a:	01c4a803          	lw	a6,28(s1)
ffffffffc020935e:	5090                	lw	a2,32(s1)
ffffffffc0209360:	50d4                	lw	a3,36(s1)
ffffffffc0209362:	5498                	lw	a4,40(s1)
ffffffffc0209364:	6511                	lui	a0,0x4
ffffffffc0209366:	c00c                	sw	a1,0(s0)
ffffffffc0209368:	c05c                	sw	a5,4(s0)
ffffffffc020936a:	01e42423          	sw	t5,8(s0)
ffffffffc020936e:	01d42623          	sw	t4,12(s0)
ffffffffc0209372:	01c42823          	sw	t3,16(s0)
ffffffffc0209376:	00642a23          	sw	t1,20(s0)
ffffffffc020937a:	01142c23          	sw	a7,24(s0)
ffffffffc020937e:	01042e23          	sw	a6,28(s0)
ffffffffc0209382:	d010                	sw	a2,32(s0)
ffffffffc0209384:	d054                	sw	a3,36(s0)
ffffffffc0209386:	d418                	sw	a4,40(s0)
ffffffffc0209388:	c07f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020938c:	f448                	sd	a0,168(s0)
ffffffffc020938e:	8c2a                	mv	s8,a0
ffffffffc0209390:	18050c63          	beqz	a0,ffffffffc0209528 <sfs_do_mount+0x270>
ffffffffc0209394:	6711                	lui	a4,0x4
ffffffffc0209396:	87aa                	mv	a5,a0
ffffffffc0209398:	972a                	add	a4,a4,a0
ffffffffc020939a:	e79c                	sd	a5,8(a5)
ffffffffc020939c:	e39c                	sd	a5,0(a5)
ffffffffc020939e:	07c1                	addi	a5,a5,16
ffffffffc02093a0:	fee79de3          	bne	a5,a4,ffffffffc020939a <sfs_do_mount+0xe2>
ffffffffc02093a4:	0044eb83          	lwu	s7,4(s1)
ffffffffc02093a8:	67a1                	lui	a5,0x8
ffffffffc02093aa:	fff78993          	addi	s3,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc02093ae:	9bce                	add	s7,s7,s3
ffffffffc02093b0:	77e1                	lui	a5,0xffff8
ffffffffc02093b2:	00fbfbb3          	and	s7,s7,a5
ffffffffc02093b6:	2b81                	sext.w	s7,s7
ffffffffc02093b8:	855e                	mv	a0,s7
ffffffffc02093ba:	a59ff0ef          	jal	ra,ffffffffc0208e12 <bitmap_create>
ffffffffc02093be:	fc08                	sd	a0,56(s0)
ffffffffc02093c0:	8d2a                	mv	s10,a0
ffffffffc02093c2:	14050f63          	beqz	a0,ffffffffc0209520 <sfs_do_mount+0x268>
ffffffffc02093c6:	0044e783          	lwu	a5,4(s1)
ffffffffc02093ca:	082c                	addi	a1,sp,24
ffffffffc02093cc:	97ce                	add	a5,a5,s3
ffffffffc02093ce:	00f7d713          	srli	a4,a5,0xf
ffffffffc02093d2:	e43a                	sd	a4,8(sp)
ffffffffc02093d4:	40f7d993          	srai	s3,a5,0xf
ffffffffc02093d8:	c4fff0ef          	jal	ra,ffffffffc0209026 <bitmap_getdata>
ffffffffc02093dc:	14050c63          	beqz	a0,ffffffffc0209534 <sfs_do_mount+0x27c>
ffffffffc02093e0:	00c9979b          	slliw	a5,s3,0xc
ffffffffc02093e4:	66e2                	ld	a3,24(sp)
ffffffffc02093e6:	1782                	slli	a5,a5,0x20
ffffffffc02093e8:	9381                	srli	a5,a5,0x20
ffffffffc02093ea:	14d79563          	bne	a5,a3,ffffffffc0209534 <sfs_do_mount+0x27c>
ffffffffc02093ee:	6722                	ld	a4,8(sp)
ffffffffc02093f0:	6d89                	lui	s11,0x2
ffffffffc02093f2:	89aa                	mv	s3,a0
ffffffffc02093f4:	00c71c93          	slli	s9,a4,0xc
ffffffffc02093f8:	9caa                	add	s9,s9,a0
ffffffffc02093fa:	40ad8dbb          	subw	s11,s11,a0
ffffffffc02093fe:	e711                	bnez	a4,ffffffffc020940a <sfs_do_mount+0x152>
ffffffffc0209400:	a079                	j	ffffffffc020948e <sfs_do_mount+0x1d6>
ffffffffc0209402:	6785                	lui	a5,0x1
ffffffffc0209404:	99be                	add	s3,s3,a5
ffffffffc0209406:	093c8463          	beq	s9,s3,ffffffffc020948e <sfs_do_mount+0x1d6>
ffffffffc020940a:	013d86bb          	addw	a3,s11,s3
ffffffffc020940e:	1682                	slli	a3,a3,0x20
ffffffffc0209410:	6605                	lui	a2,0x1
ffffffffc0209412:	85ce                	mv	a1,s3
ffffffffc0209414:	9281                	srli	a3,a3,0x20
ffffffffc0209416:	1008                	addi	a0,sp,32
ffffffffc0209418:	f29fb0ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc020941c:	02093783          	ld	a5,32(s2)
ffffffffc0209420:	85aa                	mv	a1,a0
ffffffffc0209422:	4601                	li	a2,0
ffffffffc0209424:	854a                	mv	a0,s2
ffffffffc0209426:	9782                	jalr	a5
ffffffffc0209428:	dd69                	beqz	a0,ffffffffc0209402 <sfs_do_mount+0x14a>
ffffffffc020942a:	e42a                	sd	a0,8(sp)
ffffffffc020942c:	856a                	mv	a0,s10
ffffffffc020942e:	bdfff0ef          	jal	ra,ffffffffc020900c <bitmap_destroy>
ffffffffc0209432:	67a2                	ld	a5,8(sp)
ffffffffc0209434:	8a3e                	mv	s4,a5
ffffffffc0209436:	8562                	mv	a0,s8
ffffffffc0209438:	c07f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020943c:	8526                	mv	a0,s1
ffffffffc020943e:	c01f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209442:	8522                	mv	a0,s0
ffffffffc0209444:	bfbf80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209448:	70aa                	ld	ra,168(sp)
ffffffffc020944a:	740a                	ld	s0,160(sp)
ffffffffc020944c:	64ea                	ld	s1,152(sp)
ffffffffc020944e:	694a                	ld	s2,144(sp)
ffffffffc0209450:	69aa                	ld	s3,136(sp)
ffffffffc0209452:	7ae6                	ld	s5,120(sp)
ffffffffc0209454:	7b46                	ld	s6,112(sp)
ffffffffc0209456:	7ba6                	ld	s7,104(sp)
ffffffffc0209458:	7c06                	ld	s8,96(sp)
ffffffffc020945a:	6ce6                	ld	s9,88(sp)
ffffffffc020945c:	6d46                	ld	s10,80(sp)
ffffffffc020945e:	6da6                	ld	s11,72(sp)
ffffffffc0209460:	8552                	mv	a0,s4
ffffffffc0209462:	6a0a                	ld	s4,128(sp)
ffffffffc0209464:	614d                	addi	sp,sp,176
ffffffffc0209466:	8082                	ret
ffffffffc0209468:	5a71                	li	s4,-4
ffffffffc020946a:	bfe1                	j	ffffffffc0209442 <sfs_do_mount+0x18a>
ffffffffc020946c:	85be                	mv	a1,a5
ffffffffc020946e:	00006517          	auipc	a0,0x6
ffffffffc0209472:	94250513          	addi	a0,a0,-1726 # ffffffffc020edb0 <dev_node_ops+0x4d8>
ffffffffc0209476:	d31f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020947a:	5a75                	li	s4,-3
ffffffffc020947c:	b7c1                	j	ffffffffc020943c <sfs_do_mount+0x184>
ffffffffc020947e:	00006517          	auipc	a0,0x6
ffffffffc0209482:	8fa50513          	addi	a0,a0,-1798 # ffffffffc020ed78 <dev_node_ops+0x4a0>
ffffffffc0209486:	d21f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020948a:	5a75                	li	s4,-3
ffffffffc020948c:	bf45                	j	ffffffffc020943c <sfs_do_mount+0x184>
ffffffffc020948e:	00442903          	lw	s2,4(s0)
ffffffffc0209492:	4481                	li	s1,0
ffffffffc0209494:	080b8c63          	beqz	s7,ffffffffc020952c <sfs_do_mount+0x274>
ffffffffc0209498:	85a6                	mv	a1,s1
ffffffffc020949a:	856a                	mv	a0,s10
ffffffffc020949c:	af7ff0ef          	jal	ra,ffffffffc0208f92 <bitmap_test>
ffffffffc02094a0:	c111                	beqz	a0,ffffffffc02094a4 <sfs_do_mount+0x1ec>
ffffffffc02094a2:	2b05                	addiw	s6,s6,1
ffffffffc02094a4:	2485                	addiw	s1,s1,1
ffffffffc02094a6:	fe9b99e3          	bne	s7,s1,ffffffffc0209498 <sfs_do_mount+0x1e0>
ffffffffc02094aa:	441c                	lw	a5,8(s0)
ffffffffc02094ac:	0d679463          	bne	a5,s6,ffffffffc0209574 <sfs_do_mount+0x2bc>
ffffffffc02094b0:	4585                	li	a1,1
ffffffffc02094b2:	05040513          	addi	a0,s0,80
ffffffffc02094b6:	04043023          	sd	zero,64(s0)
ffffffffc02094ba:	ffffa0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc02094be:	4585                	li	a1,1
ffffffffc02094c0:	06840513          	addi	a0,s0,104
ffffffffc02094c4:	ff5fa0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc02094c8:	4585                	li	a1,1
ffffffffc02094ca:	08040513          	addi	a0,s0,128
ffffffffc02094ce:	febfa0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc02094d2:	09840793          	addi	a5,s0,152
ffffffffc02094d6:	f05c                	sd	a5,160(s0)
ffffffffc02094d8:	ec5c                	sd	a5,152(s0)
ffffffffc02094da:	874a                	mv	a4,s2
ffffffffc02094dc:	86da                	mv	a3,s6
ffffffffc02094de:	4169063b          	subw	a2,s2,s6
ffffffffc02094e2:	00c40593          	addi	a1,s0,12
ffffffffc02094e6:	00006517          	auipc	a0,0x6
ffffffffc02094ea:	95a50513          	addi	a0,a0,-1702 # ffffffffc020ee40 <dev_node_ops+0x568>
ffffffffc02094ee:	cb9f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02094f2:	00000797          	auipc	a5,0x0
ffffffffc02094f6:	c8878793          	addi	a5,a5,-888 # ffffffffc020917a <sfs_sync>
ffffffffc02094fa:	fc5c                	sd	a5,184(s0)
ffffffffc02094fc:	00000797          	auipc	a5,0x0
ffffffffc0209500:	d6478793          	addi	a5,a5,-668 # ffffffffc0209260 <sfs_get_root>
ffffffffc0209504:	e07c                	sd	a5,192(s0)
ffffffffc0209506:	00000797          	auipc	a5,0x0
ffffffffc020950a:	b5e78793          	addi	a5,a5,-1186 # ffffffffc0209064 <sfs_unmount>
ffffffffc020950e:	e47c                	sd	a5,200(s0)
ffffffffc0209510:	00000797          	auipc	a5,0x0
ffffffffc0209514:	bd878793          	addi	a5,a5,-1064 # ffffffffc02090e8 <sfs_cleanup>
ffffffffc0209518:	e87c                	sd	a5,208(s0)
ffffffffc020951a:	008ab023          	sd	s0,0(s5)
ffffffffc020951e:	b72d                	j	ffffffffc0209448 <sfs_do_mount+0x190>
ffffffffc0209520:	5a71                	li	s4,-4
ffffffffc0209522:	bf11                	j	ffffffffc0209436 <sfs_do_mount+0x17e>
ffffffffc0209524:	5a49                	li	s4,-14
ffffffffc0209526:	b70d                	j	ffffffffc0209448 <sfs_do_mount+0x190>
ffffffffc0209528:	5a71                	li	s4,-4
ffffffffc020952a:	bf09                	j	ffffffffc020943c <sfs_do_mount+0x184>
ffffffffc020952c:	4b01                	li	s6,0
ffffffffc020952e:	bfb5                	j	ffffffffc02094aa <sfs_do_mount+0x1f2>
ffffffffc0209530:	5a71                	li	s4,-4
ffffffffc0209532:	bf19                	j	ffffffffc0209448 <sfs_do_mount+0x190>
ffffffffc0209534:	00006697          	auipc	a3,0x6
ffffffffc0209538:	8ac68693          	addi	a3,a3,-1876 # ffffffffc020ede0 <dev_node_ops+0x508>
ffffffffc020953c:	00002617          	auipc	a2,0x2
ffffffffc0209540:	3bc60613          	addi	a2,a2,956 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209544:	08300593          	li	a1,131
ffffffffc0209548:	00005517          	auipc	a0,0x5
ffffffffc020954c:	7a050513          	addi	a0,a0,1952 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc0209550:	f4ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209554:	00005697          	auipc	a3,0x5
ffffffffc0209558:	76468693          	addi	a3,a3,1892 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc020955c:	00002617          	auipc	a2,0x2
ffffffffc0209560:	39c60613          	addi	a2,a2,924 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209564:	0a300593          	li	a1,163
ffffffffc0209568:	00005517          	auipc	a0,0x5
ffffffffc020956c:	78050513          	addi	a0,a0,1920 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc0209570:	f2ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209574:	00006697          	auipc	a3,0x6
ffffffffc0209578:	89c68693          	addi	a3,a3,-1892 # ffffffffc020ee10 <dev_node_ops+0x538>
ffffffffc020957c:	00002617          	auipc	a2,0x2
ffffffffc0209580:	37c60613          	addi	a2,a2,892 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209584:	0e000593          	li	a1,224
ffffffffc0209588:	00005517          	auipc	a0,0x5
ffffffffc020958c:	76050513          	addi	a0,a0,1888 # ffffffffc020ece8 <dev_node_ops+0x410>
ffffffffc0209590:	f0ff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209594 <sfs_mount>:
ffffffffc0209594:	00000597          	auipc	a1,0x0
ffffffffc0209598:	d2458593          	addi	a1,a1,-732 # ffffffffc02092b8 <sfs_do_mount>
ffffffffc020959c:	817fe06f          	j	ffffffffc0207db2 <vfs_mount>

ffffffffc02095a0 <sfs_opendir>:
ffffffffc02095a0:	0235f593          	andi	a1,a1,35
ffffffffc02095a4:	4501                	li	a0,0
ffffffffc02095a6:	e191                	bnez	a1,ffffffffc02095aa <sfs_opendir+0xa>
ffffffffc02095a8:	8082                	ret
ffffffffc02095aa:	553d                	li	a0,-17
ffffffffc02095ac:	8082                	ret

ffffffffc02095ae <sfs_openfile>:
ffffffffc02095ae:	4501                	li	a0,0
ffffffffc02095b0:	8082                	ret

ffffffffc02095b2 <sfs_gettype>:
ffffffffc02095b2:	1141                	addi	sp,sp,-16
ffffffffc02095b4:	e406                	sd	ra,8(sp)
ffffffffc02095b6:	c939                	beqz	a0,ffffffffc020960c <sfs_gettype+0x5a>
ffffffffc02095b8:	4d34                	lw	a3,88(a0)
ffffffffc02095ba:	6785                	lui	a5,0x1
ffffffffc02095bc:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02095c0:	04e69663          	bne	a3,a4,ffffffffc020960c <sfs_gettype+0x5a>
ffffffffc02095c4:	6114                	ld	a3,0(a0)
ffffffffc02095c6:	4709                	li	a4,2
ffffffffc02095c8:	0046d683          	lhu	a3,4(a3)
ffffffffc02095cc:	02e68a63          	beq	a3,a4,ffffffffc0209600 <sfs_gettype+0x4e>
ffffffffc02095d0:	470d                	li	a4,3
ffffffffc02095d2:	02e68163          	beq	a3,a4,ffffffffc02095f4 <sfs_gettype+0x42>
ffffffffc02095d6:	4705                	li	a4,1
ffffffffc02095d8:	00e68f63          	beq	a3,a4,ffffffffc02095f6 <sfs_gettype+0x44>
ffffffffc02095dc:	00006617          	auipc	a2,0x6
ffffffffc02095e0:	8d460613          	addi	a2,a2,-1836 # ffffffffc020eeb0 <dev_node_ops+0x5d8>
ffffffffc02095e4:	38d00593          	li	a1,909
ffffffffc02095e8:	00006517          	auipc	a0,0x6
ffffffffc02095ec:	8b050513          	addi	a0,a0,-1872 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc02095f0:	eaff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02095f4:	678d                	lui	a5,0x3
ffffffffc02095f6:	60a2                	ld	ra,8(sp)
ffffffffc02095f8:	c19c                	sw	a5,0(a1)
ffffffffc02095fa:	4501                	li	a0,0
ffffffffc02095fc:	0141                	addi	sp,sp,16
ffffffffc02095fe:	8082                	ret
ffffffffc0209600:	60a2                	ld	ra,8(sp)
ffffffffc0209602:	6789                	lui	a5,0x2
ffffffffc0209604:	c19c                	sw	a5,0(a1)
ffffffffc0209606:	4501                	li	a0,0
ffffffffc0209608:	0141                	addi	sp,sp,16
ffffffffc020960a:	8082                	ret
ffffffffc020960c:	00006697          	auipc	a3,0x6
ffffffffc0209610:	85468693          	addi	a3,a3,-1964 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc0209614:	00002617          	auipc	a2,0x2
ffffffffc0209618:	2e460613          	addi	a2,a2,740 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020961c:	38100593          	li	a1,897
ffffffffc0209620:	00006517          	auipc	a0,0x6
ffffffffc0209624:	87850513          	addi	a0,a0,-1928 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209628:	e77f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020962c <sfs_fsync>:
ffffffffc020962c:	7179                	addi	sp,sp,-48
ffffffffc020962e:	ec26                	sd	s1,24(sp)
ffffffffc0209630:	7524                	ld	s1,104(a0)
ffffffffc0209632:	f406                	sd	ra,40(sp)
ffffffffc0209634:	f022                	sd	s0,32(sp)
ffffffffc0209636:	e84a                	sd	s2,16(sp)
ffffffffc0209638:	e44e                	sd	s3,8(sp)
ffffffffc020963a:	c4bd                	beqz	s1,ffffffffc02096a8 <sfs_fsync+0x7c>
ffffffffc020963c:	0b04a783          	lw	a5,176(s1)
ffffffffc0209640:	e7a5                	bnez	a5,ffffffffc02096a8 <sfs_fsync+0x7c>
ffffffffc0209642:	4d38                	lw	a4,88(a0)
ffffffffc0209644:	6785                	lui	a5,0x1
ffffffffc0209646:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020964a:	842a                	mv	s0,a0
ffffffffc020964c:	06f71e63          	bne	a4,a5,ffffffffc02096c8 <sfs_fsync+0x9c>
ffffffffc0209650:	691c                	ld	a5,16(a0)
ffffffffc0209652:	4901                	li	s2,0
ffffffffc0209654:	eb89                	bnez	a5,ffffffffc0209666 <sfs_fsync+0x3a>
ffffffffc0209656:	70a2                	ld	ra,40(sp)
ffffffffc0209658:	7402                	ld	s0,32(sp)
ffffffffc020965a:	64e2                	ld	s1,24(sp)
ffffffffc020965c:	69a2                	ld	s3,8(sp)
ffffffffc020965e:	854a                	mv	a0,s2
ffffffffc0209660:	6942                	ld	s2,16(sp)
ffffffffc0209662:	6145                	addi	sp,sp,48
ffffffffc0209664:	8082                	ret
ffffffffc0209666:	02050993          	addi	s3,a0,32
ffffffffc020966a:	854e                	mv	a0,s3
ffffffffc020966c:	e57fa0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0209670:	681c                	ld	a5,16(s0)
ffffffffc0209672:	ef81                	bnez	a5,ffffffffc020968a <sfs_fsync+0x5e>
ffffffffc0209674:	854e                	mv	a0,s3
ffffffffc0209676:	e49fa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020967a:	70a2                	ld	ra,40(sp)
ffffffffc020967c:	7402                	ld	s0,32(sp)
ffffffffc020967e:	64e2                	ld	s1,24(sp)
ffffffffc0209680:	69a2                	ld	s3,8(sp)
ffffffffc0209682:	854a                	mv	a0,s2
ffffffffc0209684:	6942                	ld	s2,16(sp)
ffffffffc0209686:	6145                	addi	sp,sp,48
ffffffffc0209688:	8082                	ret
ffffffffc020968a:	4414                	lw	a3,8(s0)
ffffffffc020968c:	600c                	ld	a1,0(s0)
ffffffffc020968e:	00043823          	sd	zero,16(s0)
ffffffffc0209692:	4701                	li	a4,0
ffffffffc0209694:	04000613          	li	a2,64
ffffffffc0209698:	8526                	mv	a0,s1
ffffffffc020969a:	678010ef          	jal	ra,ffffffffc020ad12 <sfs_wbuf>
ffffffffc020969e:	892a                	mv	s2,a0
ffffffffc02096a0:	d971                	beqz	a0,ffffffffc0209674 <sfs_fsync+0x48>
ffffffffc02096a2:	4785                	li	a5,1
ffffffffc02096a4:	e81c                	sd	a5,16(s0)
ffffffffc02096a6:	b7f9                	j	ffffffffc0209674 <sfs_fsync+0x48>
ffffffffc02096a8:	00005697          	auipc	a3,0x5
ffffffffc02096ac:	61068693          	addi	a3,a3,1552 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc02096b0:	00002617          	auipc	a2,0x2
ffffffffc02096b4:	24860613          	addi	a2,a2,584 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02096b8:	2c500593          	li	a1,709
ffffffffc02096bc:	00005517          	auipc	a0,0x5
ffffffffc02096c0:	7dc50513          	addi	a0,a0,2012 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc02096c4:	ddbf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02096c8:	00005697          	auipc	a3,0x5
ffffffffc02096cc:	79868693          	addi	a3,a3,1944 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc02096d0:	00002617          	auipc	a2,0x2
ffffffffc02096d4:	22860613          	addi	a2,a2,552 # ffffffffc020b8f8 <commands+0x210>
ffffffffc02096d8:	2c600593          	li	a1,710
ffffffffc02096dc:	00005517          	auipc	a0,0x5
ffffffffc02096e0:	7bc50513          	addi	a0,a0,1980 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc02096e4:	dbbf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02096e8 <sfs_fstat>:
ffffffffc02096e8:	1101                	addi	sp,sp,-32
ffffffffc02096ea:	e426                	sd	s1,8(sp)
ffffffffc02096ec:	84ae                	mv	s1,a1
ffffffffc02096ee:	e822                	sd	s0,16(sp)
ffffffffc02096f0:	02000613          	li	a2,32
ffffffffc02096f4:	842a                	mv	s0,a0
ffffffffc02096f6:	4581                	li	a1,0
ffffffffc02096f8:	8526                	mv	a0,s1
ffffffffc02096fa:	ec06                	sd	ra,24(sp)
ffffffffc02096fc:	51b010ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc0209700:	c439                	beqz	s0,ffffffffc020974e <sfs_fstat+0x66>
ffffffffc0209702:	783c                	ld	a5,112(s0)
ffffffffc0209704:	c7a9                	beqz	a5,ffffffffc020974e <sfs_fstat+0x66>
ffffffffc0209706:	6bbc                	ld	a5,80(a5)
ffffffffc0209708:	c3b9                	beqz	a5,ffffffffc020974e <sfs_fstat+0x66>
ffffffffc020970a:	00005597          	auipc	a1,0x5
ffffffffc020970e:	14658593          	addi	a1,a1,326 # ffffffffc020e850 <syscalls+0xdb0>
ffffffffc0209712:	8522                	mv	a0,s0
ffffffffc0209714:	8cefe0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0209718:	783c                	ld	a5,112(s0)
ffffffffc020971a:	85a6                	mv	a1,s1
ffffffffc020971c:	8522                	mv	a0,s0
ffffffffc020971e:	6bbc                	ld	a5,80(a5)
ffffffffc0209720:	9782                	jalr	a5
ffffffffc0209722:	e10d                	bnez	a0,ffffffffc0209744 <sfs_fstat+0x5c>
ffffffffc0209724:	4c38                	lw	a4,88(s0)
ffffffffc0209726:	6785                	lui	a5,0x1
ffffffffc0209728:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020972c:	04f71163          	bne	a4,a5,ffffffffc020976e <sfs_fstat+0x86>
ffffffffc0209730:	601c                	ld	a5,0(s0)
ffffffffc0209732:	0067d683          	lhu	a3,6(a5)
ffffffffc0209736:	0087e703          	lwu	a4,8(a5)
ffffffffc020973a:	0007e783          	lwu	a5,0(a5)
ffffffffc020973e:	e494                	sd	a3,8(s1)
ffffffffc0209740:	e898                	sd	a4,16(s1)
ffffffffc0209742:	ec9c                	sd	a5,24(s1)
ffffffffc0209744:	60e2                	ld	ra,24(sp)
ffffffffc0209746:	6442                	ld	s0,16(sp)
ffffffffc0209748:	64a2                	ld	s1,8(sp)
ffffffffc020974a:	6105                	addi	sp,sp,32
ffffffffc020974c:	8082                	ret
ffffffffc020974e:	00005697          	auipc	a3,0x5
ffffffffc0209752:	09a68693          	addi	a3,a3,154 # ffffffffc020e7e8 <syscalls+0xd48>
ffffffffc0209756:	00002617          	auipc	a2,0x2
ffffffffc020975a:	1a260613          	addi	a2,a2,418 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020975e:	2b600593          	li	a1,694
ffffffffc0209762:	00005517          	auipc	a0,0x5
ffffffffc0209766:	73650513          	addi	a0,a0,1846 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020976a:	d35f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020976e:	00005697          	auipc	a3,0x5
ffffffffc0209772:	6f268693          	addi	a3,a3,1778 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc0209776:	00002617          	auipc	a2,0x2
ffffffffc020977a:	18260613          	addi	a2,a2,386 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020977e:	2b900593          	li	a1,697
ffffffffc0209782:	00005517          	auipc	a0,0x5
ffffffffc0209786:	71650513          	addi	a0,a0,1814 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020978a:	d15f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020978e <sfs_tryseek>:
ffffffffc020978e:	080007b7          	lui	a5,0x8000
ffffffffc0209792:	04f5fd63          	bgeu	a1,a5,ffffffffc02097ec <sfs_tryseek+0x5e>
ffffffffc0209796:	1101                	addi	sp,sp,-32
ffffffffc0209798:	e822                	sd	s0,16(sp)
ffffffffc020979a:	ec06                	sd	ra,24(sp)
ffffffffc020979c:	e426                	sd	s1,8(sp)
ffffffffc020979e:	842a                	mv	s0,a0
ffffffffc02097a0:	c921                	beqz	a0,ffffffffc02097f0 <sfs_tryseek+0x62>
ffffffffc02097a2:	4d38                	lw	a4,88(a0)
ffffffffc02097a4:	6785                	lui	a5,0x1
ffffffffc02097a6:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02097aa:	04f71363          	bne	a4,a5,ffffffffc02097f0 <sfs_tryseek+0x62>
ffffffffc02097ae:	611c                	ld	a5,0(a0)
ffffffffc02097b0:	84ae                	mv	s1,a1
ffffffffc02097b2:	0007e783          	lwu	a5,0(a5)
ffffffffc02097b6:	02b7d563          	bge	a5,a1,ffffffffc02097e0 <sfs_tryseek+0x52>
ffffffffc02097ba:	793c                	ld	a5,112(a0)
ffffffffc02097bc:	cbb1                	beqz	a5,ffffffffc0209810 <sfs_tryseek+0x82>
ffffffffc02097be:	73bc                	ld	a5,96(a5)
ffffffffc02097c0:	cba1                	beqz	a5,ffffffffc0209810 <sfs_tryseek+0x82>
ffffffffc02097c2:	00005597          	auipc	a1,0x5
ffffffffc02097c6:	f7e58593          	addi	a1,a1,-130 # ffffffffc020e740 <syscalls+0xca0>
ffffffffc02097ca:	818fe0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc02097ce:	783c                	ld	a5,112(s0)
ffffffffc02097d0:	8522                	mv	a0,s0
ffffffffc02097d2:	6442                	ld	s0,16(sp)
ffffffffc02097d4:	60e2                	ld	ra,24(sp)
ffffffffc02097d6:	73bc                	ld	a5,96(a5)
ffffffffc02097d8:	85a6                	mv	a1,s1
ffffffffc02097da:	64a2                	ld	s1,8(sp)
ffffffffc02097dc:	6105                	addi	sp,sp,32
ffffffffc02097de:	8782                	jr	a5
ffffffffc02097e0:	60e2                	ld	ra,24(sp)
ffffffffc02097e2:	6442                	ld	s0,16(sp)
ffffffffc02097e4:	64a2                	ld	s1,8(sp)
ffffffffc02097e6:	4501                	li	a0,0
ffffffffc02097e8:	6105                	addi	sp,sp,32
ffffffffc02097ea:	8082                	ret
ffffffffc02097ec:	5575                	li	a0,-3
ffffffffc02097ee:	8082                	ret
ffffffffc02097f0:	00005697          	auipc	a3,0x5
ffffffffc02097f4:	67068693          	addi	a3,a3,1648 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc02097f8:	00002617          	auipc	a2,0x2
ffffffffc02097fc:	10060613          	addi	a2,a2,256 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209800:	39800593          	li	a1,920
ffffffffc0209804:	00005517          	auipc	a0,0x5
ffffffffc0209808:	69450513          	addi	a0,a0,1684 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020980c:	c93f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209810:	00005697          	auipc	a3,0x5
ffffffffc0209814:	ed868693          	addi	a3,a3,-296 # ffffffffc020e6e8 <syscalls+0xc48>
ffffffffc0209818:	00002617          	auipc	a2,0x2
ffffffffc020981c:	0e060613          	addi	a2,a2,224 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209820:	39a00593          	li	a1,922
ffffffffc0209824:	00005517          	auipc	a0,0x5
ffffffffc0209828:	67450513          	addi	a0,a0,1652 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020982c:	c73f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209830 <sfs_close>:
ffffffffc0209830:	1141                	addi	sp,sp,-16
ffffffffc0209832:	e406                	sd	ra,8(sp)
ffffffffc0209834:	e022                	sd	s0,0(sp)
ffffffffc0209836:	c11d                	beqz	a0,ffffffffc020985c <sfs_close+0x2c>
ffffffffc0209838:	793c                	ld	a5,112(a0)
ffffffffc020983a:	842a                	mv	s0,a0
ffffffffc020983c:	c385                	beqz	a5,ffffffffc020985c <sfs_close+0x2c>
ffffffffc020983e:	7b9c                	ld	a5,48(a5)
ffffffffc0209840:	cf91                	beqz	a5,ffffffffc020985c <sfs_close+0x2c>
ffffffffc0209842:	00004597          	auipc	a1,0x4
ffffffffc0209846:	a2e58593          	addi	a1,a1,-1490 # ffffffffc020d270 <default_pmm_manager+0xe90>
ffffffffc020984a:	f99fd0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc020984e:	783c                	ld	a5,112(s0)
ffffffffc0209850:	8522                	mv	a0,s0
ffffffffc0209852:	6402                	ld	s0,0(sp)
ffffffffc0209854:	60a2                	ld	ra,8(sp)
ffffffffc0209856:	7b9c                	ld	a5,48(a5)
ffffffffc0209858:	0141                	addi	sp,sp,16
ffffffffc020985a:	8782                	jr	a5
ffffffffc020985c:	00004697          	auipc	a3,0x4
ffffffffc0209860:	9c468693          	addi	a3,a3,-1596 # ffffffffc020d220 <default_pmm_manager+0xe40>
ffffffffc0209864:	00002617          	auipc	a2,0x2
ffffffffc0209868:	09460613          	addi	a2,a2,148 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020986c:	21c00593          	li	a1,540
ffffffffc0209870:	00005517          	auipc	a0,0x5
ffffffffc0209874:	62850513          	addi	a0,a0,1576 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209878:	c27f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020987c <sfs_io.part.0>:
ffffffffc020987c:	1141                	addi	sp,sp,-16
ffffffffc020987e:	00005697          	auipc	a3,0x5
ffffffffc0209882:	5e268693          	addi	a3,a3,1506 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc0209886:	00002617          	auipc	a2,0x2
ffffffffc020988a:	07260613          	addi	a2,a2,114 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020988e:	29500593          	li	a1,661
ffffffffc0209892:	00005517          	auipc	a0,0x5
ffffffffc0209896:	60650513          	addi	a0,a0,1542 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020989a:	e406                	sd	ra,8(sp)
ffffffffc020989c:	c03f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02098a0 <sfs_block_free>:
ffffffffc02098a0:	1101                	addi	sp,sp,-32
ffffffffc02098a2:	e426                	sd	s1,8(sp)
ffffffffc02098a4:	ec06                	sd	ra,24(sp)
ffffffffc02098a6:	e822                	sd	s0,16(sp)
ffffffffc02098a8:	4154                	lw	a3,4(a0)
ffffffffc02098aa:	84ae                	mv	s1,a1
ffffffffc02098ac:	c595                	beqz	a1,ffffffffc02098d8 <sfs_block_free+0x38>
ffffffffc02098ae:	02d5f563          	bgeu	a1,a3,ffffffffc02098d8 <sfs_block_free+0x38>
ffffffffc02098b2:	842a                	mv	s0,a0
ffffffffc02098b4:	7d08                	ld	a0,56(a0)
ffffffffc02098b6:	edcff0ef          	jal	ra,ffffffffc0208f92 <bitmap_test>
ffffffffc02098ba:	ed05                	bnez	a0,ffffffffc02098f2 <sfs_block_free+0x52>
ffffffffc02098bc:	7c08                	ld	a0,56(s0)
ffffffffc02098be:	85a6                	mv	a1,s1
ffffffffc02098c0:	efaff0ef          	jal	ra,ffffffffc0208fba <bitmap_free>
ffffffffc02098c4:	441c                	lw	a5,8(s0)
ffffffffc02098c6:	4705                	li	a4,1
ffffffffc02098c8:	60e2                	ld	ra,24(sp)
ffffffffc02098ca:	2785                	addiw	a5,a5,1
ffffffffc02098cc:	e038                	sd	a4,64(s0)
ffffffffc02098ce:	c41c                	sw	a5,8(s0)
ffffffffc02098d0:	6442                	ld	s0,16(sp)
ffffffffc02098d2:	64a2                	ld	s1,8(sp)
ffffffffc02098d4:	6105                	addi	sp,sp,32
ffffffffc02098d6:	8082                	ret
ffffffffc02098d8:	8726                	mv	a4,s1
ffffffffc02098da:	00005617          	auipc	a2,0x5
ffffffffc02098de:	5ee60613          	addi	a2,a2,1518 # ffffffffc020eec8 <dev_node_ops+0x5f0>
ffffffffc02098e2:	05300593          	li	a1,83
ffffffffc02098e6:	00005517          	auipc	a0,0x5
ffffffffc02098ea:	5b250513          	addi	a0,a0,1458 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc02098ee:	bb1f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02098f2:	00005697          	auipc	a3,0x5
ffffffffc02098f6:	60e68693          	addi	a3,a3,1550 # ffffffffc020ef00 <dev_node_ops+0x628>
ffffffffc02098fa:	00002617          	auipc	a2,0x2
ffffffffc02098fe:	ffe60613          	addi	a2,a2,-2 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209902:	06a00593          	li	a1,106
ffffffffc0209906:	00005517          	auipc	a0,0x5
ffffffffc020990a:	59250513          	addi	a0,a0,1426 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020990e:	b91f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209912 <sfs_reclaim>:
ffffffffc0209912:	1101                	addi	sp,sp,-32
ffffffffc0209914:	e426                	sd	s1,8(sp)
ffffffffc0209916:	7524                	ld	s1,104(a0)
ffffffffc0209918:	ec06                	sd	ra,24(sp)
ffffffffc020991a:	e822                	sd	s0,16(sp)
ffffffffc020991c:	e04a                	sd	s2,0(sp)
ffffffffc020991e:	0e048a63          	beqz	s1,ffffffffc0209a12 <sfs_reclaim+0x100>
ffffffffc0209922:	0b04a783          	lw	a5,176(s1)
ffffffffc0209926:	0e079663          	bnez	a5,ffffffffc0209a12 <sfs_reclaim+0x100>
ffffffffc020992a:	4d38                	lw	a4,88(a0)
ffffffffc020992c:	6785                	lui	a5,0x1
ffffffffc020992e:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209932:	842a                	mv	s0,a0
ffffffffc0209934:	10f71f63          	bne	a4,a5,ffffffffc0209a52 <sfs_reclaim+0x140>
ffffffffc0209938:	8526                	mv	a0,s1
ffffffffc020993a:	588010ef          	jal	ra,ffffffffc020aec2 <lock_sfs_fs>
ffffffffc020993e:	4c1c                	lw	a5,24(s0)
ffffffffc0209940:	0ef05963          	blez	a5,ffffffffc0209a32 <sfs_reclaim+0x120>
ffffffffc0209944:	fff7871b          	addiw	a4,a5,-1
ffffffffc0209948:	cc18                	sw	a4,24(s0)
ffffffffc020994a:	eb59                	bnez	a4,ffffffffc02099e0 <sfs_reclaim+0xce>
ffffffffc020994c:	05c42903          	lw	s2,92(s0)
ffffffffc0209950:	08091863          	bnez	s2,ffffffffc02099e0 <sfs_reclaim+0xce>
ffffffffc0209954:	601c                	ld	a5,0(s0)
ffffffffc0209956:	0067d783          	lhu	a5,6(a5)
ffffffffc020995a:	e785                	bnez	a5,ffffffffc0209982 <sfs_reclaim+0x70>
ffffffffc020995c:	783c                	ld	a5,112(s0)
ffffffffc020995e:	10078a63          	beqz	a5,ffffffffc0209a72 <sfs_reclaim+0x160>
ffffffffc0209962:	73bc                	ld	a5,96(a5)
ffffffffc0209964:	10078763          	beqz	a5,ffffffffc0209a72 <sfs_reclaim+0x160>
ffffffffc0209968:	00005597          	auipc	a1,0x5
ffffffffc020996c:	dd858593          	addi	a1,a1,-552 # ffffffffc020e740 <syscalls+0xca0>
ffffffffc0209970:	8522                	mv	a0,s0
ffffffffc0209972:	e71fd0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc0209976:	783c                	ld	a5,112(s0)
ffffffffc0209978:	4581                	li	a1,0
ffffffffc020997a:	8522                	mv	a0,s0
ffffffffc020997c:	73bc                	ld	a5,96(a5)
ffffffffc020997e:	9782                	jalr	a5
ffffffffc0209980:	e559                	bnez	a0,ffffffffc0209a0e <sfs_reclaim+0xfc>
ffffffffc0209982:	681c                	ld	a5,16(s0)
ffffffffc0209984:	c39d                	beqz	a5,ffffffffc02099aa <sfs_reclaim+0x98>
ffffffffc0209986:	783c                	ld	a5,112(s0)
ffffffffc0209988:	10078563          	beqz	a5,ffffffffc0209a92 <sfs_reclaim+0x180>
ffffffffc020998c:	7b9c                	ld	a5,48(a5)
ffffffffc020998e:	10078263          	beqz	a5,ffffffffc0209a92 <sfs_reclaim+0x180>
ffffffffc0209992:	8522                	mv	a0,s0
ffffffffc0209994:	00004597          	auipc	a1,0x4
ffffffffc0209998:	8dc58593          	addi	a1,a1,-1828 # ffffffffc020d270 <default_pmm_manager+0xe90>
ffffffffc020999c:	e47fd0ef          	jal	ra,ffffffffc02077e2 <inode_check>
ffffffffc02099a0:	783c                	ld	a5,112(s0)
ffffffffc02099a2:	8522                	mv	a0,s0
ffffffffc02099a4:	7b9c                	ld	a5,48(a5)
ffffffffc02099a6:	9782                	jalr	a5
ffffffffc02099a8:	e13d                	bnez	a0,ffffffffc0209a0e <sfs_reclaim+0xfc>
ffffffffc02099aa:	7c18                	ld	a4,56(s0)
ffffffffc02099ac:	603c                	ld	a5,64(s0)
ffffffffc02099ae:	8526                	mv	a0,s1
ffffffffc02099b0:	e71c                	sd	a5,8(a4)
ffffffffc02099b2:	e398                	sd	a4,0(a5)
ffffffffc02099b4:	6438                	ld	a4,72(s0)
ffffffffc02099b6:	683c                	ld	a5,80(s0)
ffffffffc02099b8:	e71c                	sd	a5,8(a4)
ffffffffc02099ba:	e398                	sd	a4,0(a5)
ffffffffc02099bc:	516010ef          	jal	ra,ffffffffc020aed2 <unlock_sfs_fs>
ffffffffc02099c0:	6008                	ld	a0,0(s0)
ffffffffc02099c2:	00655783          	lhu	a5,6(a0)
ffffffffc02099c6:	cb85                	beqz	a5,ffffffffc02099f6 <sfs_reclaim+0xe4>
ffffffffc02099c8:	e76f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02099cc:	8522                	mv	a0,s0
ffffffffc02099ce:	da9fd0ef          	jal	ra,ffffffffc0207776 <inode_kill>
ffffffffc02099d2:	60e2                	ld	ra,24(sp)
ffffffffc02099d4:	6442                	ld	s0,16(sp)
ffffffffc02099d6:	64a2                	ld	s1,8(sp)
ffffffffc02099d8:	854a                	mv	a0,s2
ffffffffc02099da:	6902                	ld	s2,0(sp)
ffffffffc02099dc:	6105                	addi	sp,sp,32
ffffffffc02099de:	8082                	ret
ffffffffc02099e0:	5945                	li	s2,-15
ffffffffc02099e2:	8526                	mv	a0,s1
ffffffffc02099e4:	4ee010ef          	jal	ra,ffffffffc020aed2 <unlock_sfs_fs>
ffffffffc02099e8:	60e2                	ld	ra,24(sp)
ffffffffc02099ea:	6442                	ld	s0,16(sp)
ffffffffc02099ec:	64a2                	ld	s1,8(sp)
ffffffffc02099ee:	854a                	mv	a0,s2
ffffffffc02099f0:	6902                	ld	s2,0(sp)
ffffffffc02099f2:	6105                	addi	sp,sp,32
ffffffffc02099f4:	8082                	ret
ffffffffc02099f6:	440c                	lw	a1,8(s0)
ffffffffc02099f8:	8526                	mv	a0,s1
ffffffffc02099fa:	ea7ff0ef          	jal	ra,ffffffffc02098a0 <sfs_block_free>
ffffffffc02099fe:	6008                	ld	a0,0(s0)
ffffffffc0209a00:	5d4c                	lw	a1,60(a0)
ffffffffc0209a02:	d1f9                	beqz	a1,ffffffffc02099c8 <sfs_reclaim+0xb6>
ffffffffc0209a04:	8526                	mv	a0,s1
ffffffffc0209a06:	e9bff0ef          	jal	ra,ffffffffc02098a0 <sfs_block_free>
ffffffffc0209a0a:	6008                	ld	a0,0(s0)
ffffffffc0209a0c:	bf75                	j	ffffffffc02099c8 <sfs_reclaim+0xb6>
ffffffffc0209a0e:	892a                	mv	s2,a0
ffffffffc0209a10:	bfc9                	j	ffffffffc02099e2 <sfs_reclaim+0xd0>
ffffffffc0209a12:	00005697          	auipc	a3,0x5
ffffffffc0209a16:	2a668693          	addi	a3,a3,678 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc0209a1a:	00002617          	auipc	a2,0x2
ffffffffc0209a1e:	ede60613          	addi	a2,a2,-290 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209a22:	35600593          	li	a1,854
ffffffffc0209a26:	00005517          	auipc	a0,0x5
ffffffffc0209a2a:	47250513          	addi	a0,a0,1138 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209a2e:	a71f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a32:	00005697          	auipc	a3,0x5
ffffffffc0209a36:	4ee68693          	addi	a3,a3,1262 # ffffffffc020ef20 <dev_node_ops+0x648>
ffffffffc0209a3a:	00002617          	auipc	a2,0x2
ffffffffc0209a3e:	ebe60613          	addi	a2,a2,-322 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209a42:	35c00593          	li	a1,860
ffffffffc0209a46:	00005517          	auipc	a0,0x5
ffffffffc0209a4a:	45250513          	addi	a0,a0,1106 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209a4e:	a51f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a52:	00005697          	auipc	a3,0x5
ffffffffc0209a56:	40e68693          	addi	a3,a3,1038 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc0209a5a:	00002617          	auipc	a2,0x2
ffffffffc0209a5e:	e9e60613          	addi	a2,a2,-354 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209a62:	35700593          	li	a1,855
ffffffffc0209a66:	00005517          	auipc	a0,0x5
ffffffffc0209a6a:	43250513          	addi	a0,a0,1074 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209a6e:	a31f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a72:	00005697          	auipc	a3,0x5
ffffffffc0209a76:	c7668693          	addi	a3,a3,-906 # ffffffffc020e6e8 <syscalls+0xc48>
ffffffffc0209a7a:	00002617          	auipc	a2,0x2
ffffffffc0209a7e:	e7e60613          	addi	a2,a2,-386 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209a82:	36100593          	li	a1,865
ffffffffc0209a86:	00005517          	auipc	a0,0x5
ffffffffc0209a8a:	41250513          	addi	a0,a0,1042 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209a8e:	a11f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a92:	00003697          	auipc	a3,0x3
ffffffffc0209a96:	78e68693          	addi	a3,a3,1934 # ffffffffc020d220 <default_pmm_manager+0xe40>
ffffffffc0209a9a:	00002617          	auipc	a2,0x2
ffffffffc0209a9e:	e5e60613          	addi	a2,a2,-418 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209aa2:	36600593          	li	a1,870
ffffffffc0209aa6:	00005517          	auipc	a0,0x5
ffffffffc0209aaa:	3f250513          	addi	a0,a0,1010 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209aae:	9f1f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209ab2 <sfs_block_alloc>:
ffffffffc0209ab2:	1101                	addi	sp,sp,-32
ffffffffc0209ab4:	e822                	sd	s0,16(sp)
ffffffffc0209ab6:	842a                	mv	s0,a0
ffffffffc0209ab8:	7d08                	ld	a0,56(a0)
ffffffffc0209aba:	e426                	sd	s1,8(sp)
ffffffffc0209abc:	ec06                	sd	ra,24(sp)
ffffffffc0209abe:	84ae                	mv	s1,a1
ffffffffc0209ac0:	c62ff0ef          	jal	ra,ffffffffc0208f22 <bitmap_alloc>
ffffffffc0209ac4:	e90d                	bnez	a0,ffffffffc0209af6 <sfs_block_alloc+0x44>
ffffffffc0209ac6:	441c                	lw	a5,8(s0)
ffffffffc0209ac8:	cbad                	beqz	a5,ffffffffc0209b3a <sfs_block_alloc+0x88>
ffffffffc0209aca:	37fd                	addiw	a5,a5,-1
ffffffffc0209acc:	c41c                	sw	a5,8(s0)
ffffffffc0209ace:	408c                	lw	a1,0(s1)
ffffffffc0209ad0:	4785                	li	a5,1
ffffffffc0209ad2:	e03c                	sd	a5,64(s0)
ffffffffc0209ad4:	4054                	lw	a3,4(s0)
ffffffffc0209ad6:	c58d                	beqz	a1,ffffffffc0209b00 <sfs_block_alloc+0x4e>
ffffffffc0209ad8:	02d5f463          	bgeu	a1,a3,ffffffffc0209b00 <sfs_block_alloc+0x4e>
ffffffffc0209adc:	7c08                	ld	a0,56(s0)
ffffffffc0209ade:	cb4ff0ef          	jal	ra,ffffffffc0208f92 <bitmap_test>
ffffffffc0209ae2:	ed05                	bnez	a0,ffffffffc0209b1a <sfs_block_alloc+0x68>
ffffffffc0209ae4:	8522                	mv	a0,s0
ffffffffc0209ae6:	6442                	ld	s0,16(sp)
ffffffffc0209ae8:	408c                	lw	a1,0(s1)
ffffffffc0209aea:	60e2                	ld	ra,24(sp)
ffffffffc0209aec:	64a2                	ld	s1,8(sp)
ffffffffc0209aee:	4605                	li	a2,1
ffffffffc0209af0:	6105                	addi	sp,sp,32
ffffffffc0209af2:	3700106f          	j	ffffffffc020ae62 <sfs_clear_block>
ffffffffc0209af6:	60e2                	ld	ra,24(sp)
ffffffffc0209af8:	6442                	ld	s0,16(sp)
ffffffffc0209afa:	64a2                	ld	s1,8(sp)
ffffffffc0209afc:	6105                	addi	sp,sp,32
ffffffffc0209afe:	8082                	ret
ffffffffc0209b00:	872e                	mv	a4,a1
ffffffffc0209b02:	00005617          	auipc	a2,0x5
ffffffffc0209b06:	3c660613          	addi	a2,a2,966 # ffffffffc020eec8 <dev_node_ops+0x5f0>
ffffffffc0209b0a:	05300593          	li	a1,83
ffffffffc0209b0e:	00005517          	auipc	a0,0x5
ffffffffc0209b12:	38a50513          	addi	a0,a0,906 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209b16:	989f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b1a:	00005697          	auipc	a3,0x5
ffffffffc0209b1e:	43e68693          	addi	a3,a3,1086 # ffffffffc020ef58 <dev_node_ops+0x680>
ffffffffc0209b22:	00002617          	auipc	a2,0x2
ffffffffc0209b26:	dd660613          	addi	a2,a2,-554 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209b2a:	06100593          	li	a1,97
ffffffffc0209b2e:	00005517          	auipc	a0,0x5
ffffffffc0209b32:	36a50513          	addi	a0,a0,874 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209b36:	969f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b3a:	00005697          	auipc	a3,0x5
ffffffffc0209b3e:	3fe68693          	addi	a3,a3,1022 # ffffffffc020ef38 <dev_node_ops+0x660>
ffffffffc0209b42:	00002617          	auipc	a2,0x2
ffffffffc0209b46:	db660613          	addi	a2,a2,-586 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209b4a:	05f00593          	li	a1,95
ffffffffc0209b4e:	00005517          	auipc	a0,0x5
ffffffffc0209b52:	34a50513          	addi	a0,a0,842 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209b56:	949f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209b5a <sfs_bmap_load_nolock>:
ffffffffc0209b5a:	7159                	addi	sp,sp,-112
ffffffffc0209b5c:	f85a                	sd	s6,48(sp)
ffffffffc0209b5e:	0005bb03          	ld	s6,0(a1)
ffffffffc0209b62:	f45e                	sd	s7,40(sp)
ffffffffc0209b64:	f486                	sd	ra,104(sp)
ffffffffc0209b66:	008b2b83          	lw	s7,8(s6)
ffffffffc0209b6a:	f0a2                	sd	s0,96(sp)
ffffffffc0209b6c:	eca6                	sd	s1,88(sp)
ffffffffc0209b6e:	e8ca                	sd	s2,80(sp)
ffffffffc0209b70:	e4ce                	sd	s3,72(sp)
ffffffffc0209b72:	e0d2                	sd	s4,64(sp)
ffffffffc0209b74:	fc56                	sd	s5,56(sp)
ffffffffc0209b76:	f062                	sd	s8,32(sp)
ffffffffc0209b78:	ec66                	sd	s9,24(sp)
ffffffffc0209b7a:	18cbe363          	bltu	s7,a2,ffffffffc0209d00 <sfs_bmap_load_nolock+0x1a6>
ffffffffc0209b7e:	47ad                	li	a5,11
ffffffffc0209b80:	8aae                	mv	s5,a1
ffffffffc0209b82:	8432                	mv	s0,a2
ffffffffc0209b84:	84aa                	mv	s1,a0
ffffffffc0209b86:	89b6                	mv	s3,a3
ffffffffc0209b88:	04c7f563          	bgeu	a5,a2,ffffffffc0209bd2 <sfs_bmap_load_nolock+0x78>
ffffffffc0209b8c:	ff46071b          	addiw	a4,a2,-12
ffffffffc0209b90:	0007069b          	sext.w	a3,a4
ffffffffc0209b94:	3ff00793          	li	a5,1023
ffffffffc0209b98:	1ad7e163          	bltu	a5,a3,ffffffffc0209d3a <sfs_bmap_load_nolock+0x1e0>
ffffffffc0209b9c:	03cb2a03          	lw	s4,60(s6)
ffffffffc0209ba0:	02071793          	slli	a5,a4,0x20
ffffffffc0209ba4:	c602                	sw	zero,12(sp)
ffffffffc0209ba6:	c452                	sw	s4,8(sp)
ffffffffc0209ba8:	01e7dc13          	srli	s8,a5,0x1e
ffffffffc0209bac:	0e0a1e63          	bnez	s4,ffffffffc0209ca8 <sfs_bmap_load_nolock+0x14e>
ffffffffc0209bb0:	0acb8663          	beq	s7,a2,ffffffffc0209c5c <sfs_bmap_load_nolock+0x102>
ffffffffc0209bb4:	4a01                	li	s4,0
ffffffffc0209bb6:	40d4                	lw	a3,4(s1)
ffffffffc0209bb8:	8752                	mv	a4,s4
ffffffffc0209bba:	00005617          	auipc	a2,0x5
ffffffffc0209bbe:	30e60613          	addi	a2,a2,782 # ffffffffc020eec8 <dev_node_ops+0x5f0>
ffffffffc0209bc2:	05300593          	li	a1,83
ffffffffc0209bc6:	00005517          	auipc	a0,0x5
ffffffffc0209bca:	2d250513          	addi	a0,a0,722 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209bce:	8d1f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209bd2:	02061793          	slli	a5,a2,0x20
ffffffffc0209bd6:	01e7da13          	srli	s4,a5,0x1e
ffffffffc0209bda:	9a5a                	add	s4,s4,s6
ffffffffc0209bdc:	00ca2583          	lw	a1,12(s4)
ffffffffc0209be0:	c22e                	sw	a1,4(sp)
ffffffffc0209be2:	ed99                	bnez	a1,ffffffffc0209c00 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209be4:	fccb98e3          	bne	s7,a2,ffffffffc0209bb4 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209be8:	004c                	addi	a1,sp,4
ffffffffc0209bea:	ec9ff0ef          	jal	ra,ffffffffc0209ab2 <sfs_block_alloc>
ffffffffc0209bee:	892a                	mv	s2,a0
ffffffffc0209bf0:	e921                	bnez	a0,ffffffffc0209c40 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209bf2:	4592                	lw	a1,4(sp)
ffffffffc0209bf4:	4705                	li	a4,1
ffffffffc0209bf6:	00ba2623          	sw	a1,12(s4)
ffffffffc0209bfa:	00eab823          	sd	a4,16(s5)
ffffffffc0209bfe:	d9dd                	beqz	a1,ffffffffc0209bb4 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209c00:	40d4                	lw	a3,4(s1)
ffffffffc0209c02:	10d5ff63          	bgeu	a1,a3,ffffffffc0209d20 <sfs_bmap_load_nolock+0x1c6>
ffffffffc0209c06:	7c88                	ld	a0,56(s1)
ffffffffc0209c08:	b8aff0ef          	jal	ra,ffffffffc0208f92 <bitmap_test>
ffffffffc0209c0c:	18051363          	bnez	a0,ffffffffc0209d92 <sfs_bmap_load_nolock+0x238>
ffffffffc0209c10:	4a12                	lw	s4,4(sp)
ffffffffc0209c12:	fa0a02e3          	beqz	s4,ffffffffc0209bb6 <sfs_bmap_load_nolock+0x5c>
ffffffffc0209c16:	40dc                	lw	a5,4(s1)
ffffffffc0209c18:	f8fa7fe3          	bgeu	s4,a5,ffffffffc0209bb6 <sfs_bmap_load_nolock+0x5c>
ffffffffc0209c1c:	7c88                	ld	a0,56(s1)
ffffffffc0209c1e:	85d2                	mv	a1,s4
ffffffffc0209c20:	b72ff0ef          	jal	ra,ffffffffc0208f92 <bitmap_test>
ffffffffc0209c24:	12051763          	bnez	a0,ffffffffc0209d52 <sfs_bmap_load_nolock+0x1f8>
ffffffffc0209c28:	008b9763          	bne	s7,s0,ffffffffc0209c36 <sfs_bmap_load_nolock+0xdc>
ffffffffc0209c2c:	008b2783          	lw	a5,8(s6)
ffffffffc0209c30:	2785                	addiw	a5,a5,1
ffffffffc0209c32:	00fb2423          	sw	a5,8(s6)
ffffffffc0209c36:	4901                	li	s2,0
ffffffffc0209c38:	00098463          	beqz	s3,ffffffffc0209c40 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c3c:	0149a023          	sw	s4,0(s3)
ffffffffc0209c40:	70a6                	ld	ra,104(sp)
ffffffffc0209c42:	7406                	ld	s0,96(sp)
ffffffffc0209c44:	64e6                	ld	s1,88(sp)
ffffffffc0209c46:	69a6                	ld	s3,72(sp)
ffffffffc0209c48:	6a06                	ld	s4,64(sp)
ffffffffc0209c4a:	7ae2                	ld	s5,56(sp)
ffffffffc0209c4c:	7b42                	ld	s6,48(sp)
ffffffffc0209c4e:	7ba2                	ld	s7,40(sp)
ffffffffc0209c50:	7c02                	ld	s8,32(sp)
ffffffffc0209c52:	6ce2                	ld	s9,24(sp)
ffffffffc0209c54:	854a                	mv	a0,s2
ffffffffc0209c56:	6946                	ld	s2,80(sp)
ffffffffc0209c58:	6165                	addi	sp,sp,112
ffffffffc0209c5a:	8082                	ret
ffffffffc0209c5c:	002c                	addi	a1,sp,8
ffffffffc0209c5e:	e55ff0ef          	jal	ra,ffffffffc0209ab2 <sfs_block_alloc>
ffffffffc0209c62:	892a                	mv	s2,a0
ffffffffc0209c64:	00c10c93          	addi	s9,sp,12
ffffffffc0209c68:	fd61                	bnez	a0,ffffffffc0209c40 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c6a:	85e6                	mv	a1,s9
ffffffffc0209c6c:	8526                	mv	a0,s1
ffffffffc0209c6e:	e45ff0ef          	jal	ra,ffffffffc0209ab2 <sfs_block_alloc>
ffffffffc0209c72:	892a                	mv	s2,a0
ffffffffc0209c74:	e925                	bnez	a0,ffffffffc0209ce4 <sfs_bmap_load_nolock+0x18a>
ffffffffc0209c76:	46a2                	lw	a3,8(sp)
ffffffffc0209c78:	85e6                	mv	a1,s9
ffffffffc0209c7a:	8762                	mv	a4,s8
ffffffffc0209c7c:	4611                	li	a2,4
ffffffffc0209c7e:	8526                	mv	a0,s1
ffffffffc0209c80:	092010ef          	jal	ra,ffffffffc020ad12 <sfs_wbuf>
ffffffffc0209c84:	45b2                	lw	a1,12(sp)
ffffffffc0209c86:	892a                	mv	s2,a0
ffffffffc0209c88:	e939                	bnez	a0,ffffffffc0209cde <sfs_bmap_load_nolock+0x184>
ffffffffc0209c8a:	03cb2683          	lw	a3,60(s6)
ffffffffc0209c8e:	4722                	lw	a4,8(sp)
ffffffffc0209c90:	c22e                	sw	a1,4(sp)
ffffffffc0209c92:	f6d706e3          	beq	a4,a3,ffffffffc0209bfe <sfs_bmap_load_nolock+0xa4>
ffffffffc0209c96:	eef1                	bnez	a3,ffffffffc0209d72 <sfs_bmap_load_nolock+0x218>
ffffffffc0209c98:	02eb2e23          	sw	a4,60(s6)
ffffffffc0209c9c:	4705                	li	a4,1
ffffffffc0209c9e:	00eab823          	sd	a4,16(s5)
ffffffffc0209ca2:	f00589e3          	beqz	a1,ffffffffc0209bb4 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209ca6:	bfa9                	j	ffffffffc0209c00 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209ca8:	00c10c93          	addi	s9,sp,12
ffffffffc0209cac:	8762                	mv	a4,s8
ffffffffc0209cae:	86d2                	mv	a3,s4
ffffffffc0209cb0:	4611                	li	a2,4
ffffffffc0209cb2:	85e6                	mv	a1,s9
ffffffffc0209cb4:	7df000ef          	jal	ra,ffffffffc020ac92 <sfs_rbuf>
ffffffffc0209cb8:	892a                	mv	s2,a0
ffffffffc0209cba:	f159                	bnez	a0,ffffffffc0209c40 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209cbc:	45b2                	lw	a1,12(sp)
ffffffffc0209cbe:	e995                	bnez	a1,ffffffffc0209cf2 <sfs_bmap_load_nolock+0x198>
ffffffffc0209cc0:	fa8b85e3          	beq	s7,s0,ffffffffc0209c6a <sfs_bmap_load_nolock+0x110>
ffffffffc0209cc4:	03cb2703          	lw	a4,60(s6)
ffffffffc0209cc8:	47a2                	lw	a5,8(sp)
ffffffffc0209cca:	c202                	sw	zero,4(sp)
ffffffffc0209ccc:	eee784e3          	beq	a5,a4,ffffffffc0209bb4 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209cd0:	e34d                	bnez	a4,ffffffffc0209d72 <sfs_bmap_load_nolock+0x218>
ffffffffc0209cd2:	02fb2e23          	sw	a5,60(s6)
ffffffffc0209cd6:	4785                	li	a5,1
ffffffffc0209cd8:	00fab823          	sd	a5,16(s5)
ffffffffc0209cdc:	bde1                	j	ffffffffc0209bb4 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209cde:	8526                	mv	a0,s1
ffffffffc0209ce0:	bc1ff0ef          	jal	ra,ffffffffc02098a0 <sfs_block_free>
ffffffffc0209ce4:	45a2                	lw	a1,8(sp)
ffffffffc0209ce6:	f4ba0de3          	beq	s4,a1,ffffffffc0209c40 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209cea:	8526                	mv	a0,s1
ffffffffc0209cec:	bb5ff0ef          	jal	ra,ffffffffc02098a0 <sfs_block_free>
ffffffffc0209cf0:	bf81                	j	ffffffffc0209c40 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209cf2:	03cb2683          	lw	a3,60(s6)
ffffffffc0209cf6:	4722                	lw	a4,8(sp)
ffffffffc0209cf8:	c22e                	sw	a1,4(sp)
ffffffffc0209cfa:	f8e69ee3          	bne	a3,a4,ffffffffc0209c96 <sfs_bmap_load_nolock+0x13c>
ffffffffc0209cfe:	b709                	j	ffffffffc0209c00 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209d00:	00005697          	auipc	a3,0x5
ffffffffc0209d04:	28068693          	addi	a3,a3,640 # ffffffffc020ef80 <dev_node_ops+0x6a8>
ffffffffc0209d08:	00002617          	auipc	a2,0x2
ffffffffc0209d0c:	bf060613          	addi	a2,a2,-1040 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209d10:	16400593          	li	a1,356
ffffffffc0209d14:	00005517          	auipc	a0,0x5
ffffffffc0209d18:	18450513          	addi	a0,a0,388 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209d1c:	f82f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d20:	872e                	mv	a4,a1
ffffffffc0209d22:	00005617          	auipc	a2,0x5
ffffffffc0209d26:	1a660613          	addi	a2,a2,422 # ffffffffc020eec8 <dev_node_ops+0x5f0>
ffffffffc0209d2a:	05300593          	li	a1,83
ffffffffc0209d2e:	00005517          	auipc	a0,0x5
ffffffffc0209d32:	16a50513          	addi	a0,a0,362 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209d36:	f68f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d3a:	00005617          	auipc	a2,0x5
ffffffffc0209d3e:	27660613          	addi	a2,a2,630 # ffffffffc020efb0 <dev_node_ops+0x6d8>
ffffffffc0209d42:	11e00593          	li	a1,286
ffffffffc0209d46:	00005517          	auipc	a0,0x5
ffffffffc0209d4a:	15250513          	addi	a0,a0,338 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209d4e:	f50f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d52:	00005697          	auipc	a3,0x5
ffffffffc0209d56:	1ae68693          	addi	a3,a3,430 # ffffffffc020ef00 <dev_node_ops+0x628>
ffffffffc0209d5a:	00002617          	auipc	a2,0x2
ffffffffc0209d5e:	b9e60613          	addi	a2,a2,-1122 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209d62:	16b00593          	li	a1,363
ffffffffc0209d66:	00005517          	auipc	a0,0x5
ffffffffc0209d6a:	13250513          	addi	a0,a0,306 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209d6e:	f30f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d72:	00005697          	auipc	a3,0x5
ffffffffc0209d76:	22668693          	addi	a3,a3,550 # ffffffffc020ef98 <dev_node_ops+0x6c0>
ffffffffc0209d7a:	00002617          	auipc	a2,0x2
ffffffffc0209d7e:	b7e60613          	addi	a2,a2,-1154 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209d82:	11800593          	li	a1,280
ffffffffc0209d86:	00005517          	auipc	a0,0x5
ffffffffc0209d8a:	11250513          	addi	a0,a0,274 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209d8e:	f10f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d92:	00005697          	auipc	a3,0x5
ffffffffc0209d96:	24e68693          	addi	a3,a3,590 # ffffffffc020efe0 <dev_node_ops+0x708>
ffffffffc0209d9a:	00002617          	auipc	a2,0x2
ffffffffc0209d9e:	b5e60613          	addi	a2,a2,-1186 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209da2:	12100593          	li	a1,289
ffffffffc0209da6:	00005517          	auipc	a0,0x5
ffffffffc0209daa:	0f250513          	addi	a0,a0,242 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209dae:	ef0f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209db2 <sfs_io_nolock>:
ffffffffc0209db2:	7175                	addi	sp,sp,-144
ffffffffc0209db4:	f4ce                	sd	s3,104(sp)
ffffffffc0209db6:	89ae                	mv	s3,a1
ffffffffc0209db8:	618c                	ld	a1,0(a1)
ffffffffc0209dba:	e506                	sd	ra,136(sp)
ffffffffc0209dbc:	e122                	sd	s0,128(sp)
ffffffffc0209dbe:	0045d883          	lhu	a7,4(a1)
ffffffffc0209dc2:	fca6                	sd	s1,120(sp)
ffffffffc0209dc4:	f8ca                	sd	s2,112(sp)
ffffffffc0209dc6:	f0d2                	sd	s4,96(sp)
ffffffffc0209dc8:	ecd6                	sd	s5,88(sp)
ffffffffc0209dca:	e8da                	sd	s6,80(sp)
ffffffffc0209dcc:	e4de                	sd	s7,72(sp)
ffffffffc0209dce:	e0e2                	sd	s8,64(sp)
ffffffffc0209dd0:	fc66                	sd	s9,56(sp)
ffffffffc0209dd2:	f86a                	sd	s10,48(sp)
ffffffffc0209dd4:	f46e                	sd	s11,40(sp)
ffffffffc0209dd6:	4809                	li	a6,2
ffffffffc0209dd8:	19088863          	beq	a7,a6,ffffffffc0209f68 <sfs_io_nolock+0x1b6>
ffffffffc0209ddc:	6304                	ld	s1,0(a4)
ffffffffc0209dde:	893a                	mv	s2,a4
ffffffffc0209de0:	00093023          	sd	zero,0(s2)
ffffffffc0209de4:	08000737          	lui	a4,0x8000
ffffffffc0209de8:	8436                	mv	s0,a3
ffffffffc0209dea:	8b36                	mv	s6,a3
ffffffffc0209dec:	94b6                	add	s1,s1,a3
ffffffffc0209dee:	16e6fb63          	bgeu	a3,a4,ffffffffc0209f64 <sfs_io_nolock+0x1b2>
ffffffffc0209df2:	16d4c963          	blt	s1,a3,ffffffffc0209f64 <sfs_io_nolock+0x1b2>
ffffffffc0209df6:	8baa                	mv	s7,a0
ffffffffc0209df8:	4501                	li	a0,0
ffffffffc0209dfa:	0a968363          	beq	a3,s1,ffffffffc0209ea0 <sfs_io_nolock+0xee>
ffffffffc0209dfe:	8c32                	mv	s8,a2
ffffffffc0209e00:	00977463          	bgeu	a4,s1,ffffffffc0209e08 <sfs_io_nolock+0x56>
ffffffffc0209e04:	080004b7          	lui	s1,0x8000
ffffffffc0209e08:	cbdd                	beqz	a5,ffffffffc0209ebe <sfs_io_nolock+0x10c>
ffffffffc0209e0a:	00001797          	auipc	a5,0x1
ffffffffc0209e0e:	e2878793          	addi	a5,a5,-472 # ffffffffc020ac32 <sfs_wblock>
ffffffffc0209e12:	e43e                	sd	a5,8(sp)
ffffffffc0209e14:	00001797          	auipc	a5,0x1
ffffffffc0209e18:	efe78793          	addi	a5,a5,-258 # ffffffffc020ad12 <sfs_wbuf>
ffffffffc0209e1c:	e03e                	sd	a5,0(sp)
ffffffffc0209e1e:	6705                	lui	a4,0x1
ffffffffc0209e20:	40c45613          	srai	a2,s0,0xc
ffffffffc0209e24:	40c4da93          	srai	s5,s1,0xc
ffffffffc0209e28:	fff70c93          	addi	s9,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0209e2c:	40ca8a3b          	subw	s4,s5,a2
ffffffffc0209e30:	01947cb3          	and	s9,s0,s9
ffffffffc0209e34:	8ad2                	mv	s5,s4
ffffffffc0209e36:	00060d1b          	sext.w	s10,a2
ffffffffc0209e3a:	8de6                	mv	s11,s9
ffffffffc0209e3c:	020c8b63          	beqz	s9,ffffffffc0209e72 <sfs_io_nolock+0xc0>
ffffffffc0209e40:	40848db3          	sub	s11,s1,s0
ffffffffc0209e44:	080a1f63          	bnez	s4,ffffffffc0209ee2 <sfs_io_nolock+0x130>
ffffffffc0209e48:	0874                	addi	a3,sp,28
ffffffffc0209e4a:	866a                	mv	a2,s10
ffffffffc0209e4c:	85ce                	mv	a1,s3
ffffffffc0209e4e:	855e                	mv	a0,s7
ffffffffc0209e50:	d0bff0ef          	jal	ra,ffffffffc0209b5a <sfs_bmap_load_nolock>
ffffffffc0209e54:	e145                	bnez	a0,ffffffffc0209ef4 <sfs_io_nolock+0x142>
ffffffffc0209e56:	46f2                	lw	a3,28(sp)
ffffffffc0209e58:	6782                	ld	a5,0(sp)
ffffffffc0209e5a:	8766                	mv	a4,s9
ffffffffc0209e5c:	866e                	mv	a2,s11
ffffffffc0209e5e:	85e2                	mv	a1,s8
ffffffffc0209e60:	855e                	mv	a0,s7
ffffffffc0209e62:	9782                	jalr	a5
ffffffffc0209e64:	e941                	bnez	a0,ffffffffc0209ef4 <sfs_io_nolock+0x142>
ffffffffc0209e66:	0c0a0563          	beqz	s4,ffffffffc0209f30 <sfs_io_nolock+0x17e>
ffffffffc0209e6a:	9c6e                	add	s8,s8,s11
ffffffffc0209e6c:	2d05                	addiw	s10,s10,1
ffffffffc0209e6e:	fffa8a1b          	addiw	s4,s5,-1
ffffffffc0209e72:	0c0a1263          	bnez	s4,ffffffffc0209f36 <sfs_io_nolock+0x184>
ffffffffc0209e76:	14d2                	slli	s1,s1,0x34
ffffffffc0209e78:	0344da93          	srli	s5,s1,0x34
ffffffffc0209e7c:	e8d1                	bnez	s1,ffffffffc0209f10 <sfs_io_nolock+0x15e>
ffffffffc0209e7e:	01b40b33          	add	s6,s0,s11
ffffffffc0209e82:	4501                	li	a0,0
ffffffffc0209e84:	0009b783          	ld	a5,0(s3)
ffffffffc0209e88:	01b93023          	sd	s11,0(s2)
ffffffffc0209e8c:	0007e703          	lwu	a4,0(a5)
ffffffffc0209e90:	01677863          	bgeu	a4,s6,ffffffffc0209ea0 <sfs_io_nolock+0xee>
ffffffffc0209e94:	01b4043b          	addw	s0,s0,s11
ffffffffc0209e98:	c380                	sw	s0,0(a5)
ffffffffc0209e9a:	4785                	li	a5,1
ffffffffc0209e9c:	00f9b823          	sd	a5,16(s3)
ffffffffc0209ea0:	60aa                	ld	ra,136(sp)
ffffffffc0209ea2:	640a                	ld	s0,128(sp)
ffffffffc0209ea4:	74e6                	ld	s1,120(sp)
ffffffffc0209ea6:	7946                	ld	s2,112(sp)
ffffffffc0209ea8:	79a6                	ld	s3,104(sp)
ffffffffc0209eaa:	7a06                	ld	s4,96(sp)
ffffffffc0209eac:	6ae6                	ld	s5,88(sp)
ffffffffc0209eae:	6b46                	ld	s6,80(sp)
ffffffffc0209eb0:	6ba6                	ld	s7,72(sp)
ffffffffc0209eb2:	6c06                	ld	s8,64(sp)
ffffffffc0209eb4:	7ce2                	ld	s9,56(sp)
ffffffffc0209eb6:	7d42                	ld	s10,48(sp)
ffffffffc0209eb8:	7da2                	ld	s11,40(sp)
ffffffffc0209eba:	6149                	addi	sp,sp,144
ffffffffc0209ebc:	8082                	ret
ffffffffc0209ebe:	0005e783          	lwu	a5,0(a1)
ffffffffc0209ec2:	4501                	li	a0,0
ffffffffc0209ec4:	fcf45ee3          	bge	s0,a5,ffffffffc0209ea0 <sfs_io_nolock+0xee>
ffffffffc0209ec8:	0297c863          	blt	a5,s1,ffffffffc0209ef8 <sfs_io_nolock+0x146>
ffffffffc0209ecc:	00001797          	auipc	a5,0x1
ffffffffc0209ed0:	d0678793          	addi	a5,a5,-762 # ffffffffc020abd2 <sfs_rblock>
ffffffffc0209ed4:	e43e                	sd	a5,8(sp)
ffffffffc0209ed6:	00001797          	auipc	a5,0x1
ffffffffc0209eda:	dbc78793          	addi	a5,a5,-580 # ffffffffc020ac92 <sfs_rbuf>
ffffffffc0209ede:	e03e                	sd	a5,0(sp)
ffffffffc0209ee0:	bf3d                	j	ffffffffc0209e1e <sfs_io_nolock+0x6c>
ffffffffc0209ee2:	0874                	addi	a3,sp,28
ffffffffc0209ee4:	866a                	mv	a2,s10
ffffffffc0209ee6:	85ce                	mv	a1,s3
ffffffffc0209ee8:	855e                	mv	a0,s7
ffffffffc0209eea:	41970db3          	sub	s11,a4,s9
ffffffffc0209eee:	c6dff0ef          	jal	ra,ffffffffc0209b5a <sfs_bmap_load_nolock>
ffffffffc0209ef2:	d135                	beqz	a0,ffffffffc0209e56 <sfs_io_nolock+0xa4>
ffffffffc0209ef4:	4d81                	li	s11,0
ffffffffc0209ef6:	b779                	j	ffffffffc0209e84 <sfs_io_nolock+0xd2>
ffffffffc0209ef8:	84be                	mv	s1,a5
ffffffffc0209efa:	00001797          	auipc	a5,0x1
ffffffffc0209efe:	cd878793          	addi	a5,a5,-808 # ffffffffc020abd2 <sfs_rblock>
ffffffffc0209f02:	e43e                	sd	a5,8(sp)
ffffffffc0209f04:	00001797          	auipc	a5,0x1
ffffffffc0209f08:	d8e78793          	addi	a5,a5,-626 # ffffffffc020ac92 <sfs_rbuf>
ffffffffc0209f0c:	e03e                	sd	a5,0(sp)
ffffffffc0209f0e:	bf01                	j	ffffffffc0209e1e <sfs_io_nolock+0x6c>
ffffffffc0209f10:	0874                	addi	a3,sp,28
ffffffffc0209f12:	866a                	mv	a2,s10
ffffffffc0209f14:	85ce                	mv	a1,s3
ffffffffc0209f16:	855e                	mv	a0,s7
ffffffffc0209f18:	c43ff0ef          	jal	ra,ffffffffc0209b5a <sfs_bmap_load_nolock>
ffffffffc0209f1c:	e911                	bnez	a0,ffffffffc0209f30 <sfs_io_nolock+0x17e>
ffffffffc0209f1e:	46f2                	lw	a3,28(sp)
ffffffffc0209f20:	6782                	ld	a5,0(sp)
ffffffffc0209f22:	4701                	li	a4,0
ffffffffc0209f24:	8656                	mv	a2,s5
ffffffffc0209f26:	85e2                	mv	a1,s8
ffffffffc0209f28:	855e                	mv	a0,s7
ffffffffc0209f2a:	9782                	jalr	a5
ffffffffc0209f2c:	e111                	bnez	a0,ffffffffc0209f30 <sfs_io_nolock+0x17e>
ffffffffc0209f2e:	9dd6                	add	s11,s11,s5
ffffffffc0209f30:	01b40b33          	add	s6,s0,s11
ffffffffc0209f34:	bf81                	j	ffffffffc0209e84 <sfs_io_nolock+0xd2>
ffffffffc0209f36:	0874                	addi	a3,sp,28
ffffffffc0209f38:	866a                	mv	a2,s10
ffffffffc0209f3a:	85ce                	mv	a1,s3
ffffffffc0209f3c:	855e                	mv	a0,s7
ffffffffc0209f3e:	c1dff0ef          	jal	ra,ffffffffc0209b5a <sfs_bmap_load_nolock>
ffffffffc0209f42:	f57d                	bnez	a0,ffffffffc0209f30 <sfs_io_nolock+0x17e>
ffffffffc0209f44:	4672                	lw	a2,28(sp)
ffffffffc0209f46:	67a2                	ld	a5,8(sp)
ffffffffc0209f48:	86d2                	mv	a3,s4
ffffffffc0209f4a:	85e2                	mv	a1,s8
ffffffffc0209f4c:	855e                	mv	a0,s7
ffffffffc0209f4e:	9782                	jalr	a5
ffffffffc0209f50:	f165                	bnez	a0,ffffffffc0209f30 <sfs_io_nolock+0x17e>
ffffffffc0209f52:	00ca171b          	slliw	a4,s4,0xc
ffffffffc0209f56:	1702                	slli	a4,a4,0x20
ffffffffc0209f58:	9301                	srli	a4,a4,0x20
ffffffffc0209f5a:	9dba                	add	s11,s11,a4
ffffffffc0209f5c:	9c3a                	add	s8,s8,a4
ffffffffc0209f5e:	014d0d3b          	addw	s10,s10,s4
ffffffffc0209f62:	bf11                	j	ffffffffc0209e76 <sfs_io_nolock+0xc4>
ffffffffc0209f64:	5575                	li	a0,-3
ffffffffc0209f66:	bf2d                	j	ffffffffc0209ea0 <sfs_io_nolock+0xee>
ffffffffc0209f68:	00005697          	auipc	a3,0x5
ffffffffc0209f6c:	0a068693          	addi	a3,a3,160 # ffffffffc020f008 <dev_node_ops+0x730>
ffffffffc0209f70:	00002617          	auipc	a2,0x2
ffffffffc0209f74:	98860613          	addi	a2,a2,-1656 # ffffffffc020b8f8 <commands+0x210>
ffffffffc0209f78:	22b00593          	li	a1,555
ffffffffc0209f7c:	00005517          	auipc	a0,0x5
ffffffffc0209f80:	f1c50513          	addi	a0,a0,-228 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc0209f84:	d1af60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209f88 <sfs_read>:
ffffffffc0209f88:	7139                	addi	sp,sp,-64
ffffffffc0209f8a:	f04a                	sd	s2,32(sp)
ffffffffc0209f8c:	06853903          	ld	s2,104(a0)
ffffffffc0209f90:	fc06                	sd	ra,56(sp)
ffffffffc0209f92:	f822                	sd	s0,48(sp)
ffffffffc0209f94:	f426                	sd	s1,40(sp)
ffffffffc0209f96:	ec4e                	sd	s3,24(sp)
ffffffffc0209f98:	04090f63          	beqz	s2,ffffffffc0209ff6 <sfs_read+0x6e>
ffffffffc0209f9c:	0b092783          	lw	a5,176(s2)
ffffffffc0209fa0:	ebb9                	bnez	a5,ffffffffc0209ff6 <sfs_read+0x6e>
ffffffffc0209fa2:	4d38                	lw	a4,88(a0)
ffffffffc0209fa4:	6785                	lui	a5,0x1
ffffffffc0209fa6:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209faa:	842a                	mv	s0,a0
ffffffffc0209fac:	06f71563          	bne	a4,a5,ffffffffc020a016 <sfs_read+0x8e>
ffffffffc0209fb0:	02050993          	addi	s3,a0,32
ffffffffc0209fb4:	854e                	mv	a0,s3
ffffffffc0209fb6:	84ae                	mv	s1,a1
ffffffffc0209fb8:	d0afa0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0209fbc:	0184b803          	ld	a6,24(s1) # 8000018 <_binary_bin_sfs_img_size+0x7f8ad18>
ffffffffc0209fc0:	6494                	ld	a3,8(s1)
ffffffffc0209fc2:	6090                	ld	a2,0(s1)
ffffffffc0209fc4:	85a2                	mv	a1,s0
ffffffffc0209fc6:	4781                	li	a5,0
ffffffffc0209fc8:	0038                	addi	a4,sp,8
ffffffffc0209fca:	854a                	mv	a0,s2
ffffffffc0209fcc:	e442                	sd	a6,8(sp)
ffffffffc0209fce:	de5ff0ef          	jal	ra,ffffffffc0209db2 <sfs_io_nolock>
ffffffffc0209fd2:	65a2                	ld	a1,8(sp)
ffffffffc0209fd4:	842a                	mv	s0,a0
ffffffffc0209fd6:	ed81                	bnez	a1,ffffffffc0209fee <sfs_read+0x66>
ffffffffc0209fd8:	854e                	mv	a0,s3
ffffffffc0209fda:	ce4fa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0209fde:	70e2                	ld	ra,56(sp)
ffffffffc0209fe0:	8522                	mv	a0,s0
ffffffffc0209fe2:	7442                	ld	s0,48(sp)
ffffffffc0209fe4:	74a2                	ld	s1,40(sp)
ffffffffc0209fe6:	7902                	ld	s2,32(sp)
ffffffffc0209fe8:	69e2                	ld	s3,24(sp)
ffffffffc0209fea:	6121                	addi	sp,sp,64
ffffffffc0209fec:	8082                	ret
ffffffffc0209fee:	8526                	mv	a0,s1
ffffffffc0209ff0:	bc6fb0ef          	jal	ra,ffffffffc02053b6 <iobuf_skip>
ffffffffc0209ff4:	b7d5                	j	ffffffffc0209fd8 <sfs_read+0x50>
ffffffffc0209ff6:	00005697          	auipc	a3,0x5
ffffffffc0209ffa:	cc268693          	addi	a3,a3,-830 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc0209ffe:	00002617          	auipc	a2,0x2
ffffffffc020a002:	8fa60613          	addi	a2,a2,-1798 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a006:	29400593          	li	a1,660
ffffffffc020a00a:	00005517          	auipc	a0,0x5
ffffffffc020a00e:	e8e50513          	addi	a0,a0,-370 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a012:	c8cf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a016:	867ff0ef          	jal	ra,ffffffffc020987c <sfs_io.part.0>

ffffffffc020a01a <sfs_write>:
ffffffffc020a01a:	7139                	addi	sp,sp,-64
ffffffffc020a01c:	f04a                	sd	s2,32(sp)
ffffffffc020a01e:	06853903          	ld	s2,104(a0)
ffffffffc020a022:	fc06                	sd	ra,56(sp)
ffffffffc020a024:	f822                	sd	s0,48(sp)
ffffffffc020a026:	f426                	sd	s1,40(sp)
ffffffffc020a028:	ec4e                	sd	s3,24(sp)
ffffffffc020a02a:	04090f63          	beqz	s2,ffffffffc020a088 <sfs_write+0x6e>
ffffffffc020a02e:	0b092783          	lw	a5,176(s2)
ffffffffc020a032:	ebb9                	bnez	a5,ffffffffc020a088 <sfs_write+0x6e>
ffffffffc020a034:	4d38                	lw	a4,88(a0)
ffffffffc020a036:	6785                	lui	a5,0x1
ffffffffc020a038:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a03c:	842a                	mv	s0,a0
ffffffffc020a03e:	06f71563          	bne	a4,a5,ffffffffc020a0a8 <sfs_write+0x8e>
ffffffffc020a042:	02050993          	addi	s3,a0,32
ffffffffc020a046:	854e                	mv	a0,s3
ffffffffc020a048:	84ae                	mv	s1,a1
ffffffffc020a04a:	c78fa0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020a04e:	0184b803          	ld	a6,24(s1)
ffffffffc020a052:	6494                	ld	a3,8(s1)
ffffffffc020a054:	6090                	ld	a2,0(s1)
ffffffffc020a056:	85a2                	mv	a1,s0
ffffffffc020a058:	4785                	li	a5,1
ffffffffc020a05a:	0038                	addi	a4,sp,8
ffffffffc020a05c:	854a                	mv	a0,s2
ffffffffc020a05e:	e442                	sd	a6,8(sp)
ffffffffc020a060:	d53ff0ef          	jal	ra,ffffffffc0209db2 <sfs_io_nolock>
ffffffffc020a064:	65a2                	ld	a1,8(sp)
ffffffffc020a066:	842a                	mv	s0,a0
ffffffffc020a068:	ed81                	bnez	a1,ffffffffc020a080 <sfs_write+0x66>
ffffffffc020a06a:	854e                	mv	a0,s3
ffffffffc020a06c:	c52fa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a070:	70e2                	ld	ra,56(sp)
ffffffffc020a072:	8522                	mv	a0,s0
ffffffffc020a074:	7442                	ld	s0,48(sp)
ffffffffc020a076:	74a2                	ld	s1,40(sp)
ffffffffc020a078:	7902                	ld	s2,32(sp)
ffffffffc020a07a:	69e2                	ld	s3,24(sp)
ffffffffc020a07c:	6121                	addi	sp,sp,64
ffffffffc020a07e:	8082                	ret
ffffffffc020a080:	8526                	mv	a0,s1
ffffffffc020a082:	b34fb0ef          	jal	ra,ffffffffc02053b6 <iobuf_skip>
ffffffffc020a086:	b7d5                	j	ffffffffc020a06a <sfs_write+0x50>
ffffffffc020a088:	00005697          	auipc	a3,0x5
ffffffffc020a08c:	c3068693          	addi	a3,a3,-976 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc020a090:	00002617          	auipc	a2,0x2
ffffffffc020a094:	86860613          	addi	a2,a2,-1944 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a098:	29400593          	li	a1,660
ffffffffc020a09c:	00005517          	auipc	a0,0x5
ffffffffc020a0a0:	dfc50513          	addi	a0,a0,-516 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a0a4:	bfaf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a0a8:	fd4ff0ef          	jal	ra,ffffffffc020987c <sfs_io.part.0>

ffffffffc020a0ac <sfs_dirent_read_nolock>:
ffffffffc020a0ac:	6198                	ld	a4,0(a1)
ffffffffc020a0ae:	7179                	addi	sp,sp,-48
ffffffffc020a0b0:	f406                	sd	ra,40(sp)
ffffffffc020a0b2:	00475883          	lhu	a7,4(a4)
ffffffffc020a0b6:	f022                	sd	s0,32(sp)
ffffffffc020a0b8:	ec26                	sd	s1,24(sp)
ffffffffc020a0ba:	4809                	li	a6,2
ffffffffc020a0bc:	05089b63          	bne	a7,a6,ffffffffc020a112 <sfs_dirent_read_nolock+0x66>
ffffffffc020a0c0:	4718                	lw	a4,8(a4)
ffffffffc020a0c2:	87b2                	mv	a5,a2
ffffffffc020a0c4:	2601                	sext.w	a2,a2
ffffffffc020a0c6:	04e7f663          	bgeu	a5,a4,ffffffffc020a112 <sfs_dirent_read_nolock+0x66>
ffffffffc020a0ca:	84b6                	mv	s1,a3
ffffffffc020a0cc:	0074                	addi	a3,sp,12
ffffffffc020a0ce:	842a                	mv	s0,a0
ffffffffc020a0d0:	a8bff0ef          	jal	ra,ffffffffc0209b5a <sfs_bmap_load_nolock>
ffffffffc020a0d4:	c511                	beqz	a0,ffffffffc020a0e0 <sfs_dirent_read_nolock+0x34>
ffffffffc020a0d6:	70a2                	ld	ra,40(sp)
ffffffffc020a0d8:	7402                	ld	s0,32(sp)
ffffffffc020a0da:	64e2                	ld	s1,24(sp)
ffffffffc020a0dc:	6145                	addi	sp,sp,48
ffffffffc020a0de:	8082                	ret
ffffffffc020a0e0:	45b2                	lw	a1,12(sp)
ffffffffc020a0e2:	4054                	lw	a3,4(s0)
ffffffffc020a0e4:	c5b9                	beqz	a1,ffffffffc020a132 <sfs_dirent_read_nolock+0x86>
ffffffffc020a0e6:	04d5f663          	bgeu	a1,a3,ffffffffc020a132 <sfs_dirent_read_nolock+0x86>
ffffffffc020a0ea:	7c08                	ld	a0,56(s0)
ffffffffc020a0ec:	ea7fe0ef          	jal	ra,ffffffffc0208f92 <bitmap_test>
ffffffffc020a0f0:	ed31                	bnez	a0,ffffffffc020a14c <sfs_dirent_read_nolock+0xa0>
ffffffffc020a0f2:	46b2                	lw	a3,12(sp)
ffffffffc020a0f4:	4701                	li	a4,0
ffffffffc020a0f6:	10400613          	li	a2,260
ffffffffc020a0fa:	85a6                	mv	a1,s1
ffffffffc020a0fc:	8522                	mv	a0,s0
ffffffffc020a0fe:	395000ef          	jal	ra,ffffffffc020ac92 <sfs_rbuf>
ffffffffc020a102:	f971                	bnez	a0,ffffffffc020a0d6 <sfs_dirent_read_nolock+0x2a>
ffffffffc020a104:	100481a3          	sb	zero,259(s1)
ffffffffc020a108:	70a2                	ld	ra,40(sp)
ffffffffc020a10a:	7402                	ld	s0,32(sp)
ffffffffc020a10c:	64e2                	ld	s1,24(sp)
ffffffffc020a10e:	6145                	addi	sp,sp,48
ffffffffc020a110:	8082                	ret
ffffffffc020a112:	00005697          	auipc	a3,0x5
ffffffffc020a116:	f1668693          	addi	a3,a3,-234 # ffffffffc020f028 <dev_node_ops+0x750>
ffffffffc020a11a:	00001617          	auipc	a2,0x1
ffffffffc020a11e:	7de60613          	addi	a2,a2,2014 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a122:	18e00593          	li	a1,398
ffffffffc020a126:	00005517          	auipc	a0,0x5
ffffffffc020a12a:	d7250513          	addi	a0,a0,-654 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a12e:	b70f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a132:	872e                	mv	a4,a1
ffffffffc020a134:	00005617          	auipc	a2,0x5
ffffffffc020a138:	d9460613          	addi	a2,a2,-620 # ffffffffc020eec8 <dev_node_ops+0x5f0>
ffffffffc020a13c:	05300593          	li	a1,83
ffffffffc020a140:	00005517          	auipc	a0,0x5
ffffffffc020a144:	d5850513          	addi	a0,a0,-680 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a148:	b56f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a14c:	00005697          	auipc	a3,0x5
ffffffffc020a150:	db468693          	addi	a3,a3,-588 # ffffffffc020ef00 <dev_node_ops+0x628>
ffffffffc020a154:	00001617          	auipc	a2,0x1
ffffffffc020a158:	7a460613          	addi	a2,a2,1956 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a15c:	19500593          	li	a1,405
ffffffffc020a160:	00005517          	auipc	a0,0x5
ffffffffc020a164:	d3850513          	addi	a0,a0,-712 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a168:	b36f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a16c <sfs_getdirentry>:
ffffffffc020a16c:	715d                	addi	sp,sp,-80
ffffffffc020a16e:	ec56                	sd	s5,24(sp)
ffffffffc020a170:	8aaa                	mv	s5,a0
ffffffffc020a172:	10400513          	li	a0,260
ffffffffc020a176:	e85a                	sd	s6,16(sp)
ffffffffc020a178:	e486                	sd	ra,72(sp)
ffffffffc020a17a:	e0a2                	sd	s0,64(sp)
ffffffffc020a17c:	fc26                	sd	s1,56(sp)
ffffffffc020a17e:	f84a                	sd	s2,48(sp)
ffffffffc020a180:	f44e                	sd	s3,40(sp)
ffffffffc020a182:	f052                	sd	s4,32(sp)
ffffffffc020a184:	e45e                	sd	s7,8(sp)
ffffffffc020a186:	e062                	sd	s8,0(sp)
ffffffffc020a188:	8b2e                	mv	s6,a1
ffffffffc020a18a:	e05f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a18e:	cd61                	beqz	a0,ffffffffc020a266 <sfs_getdirentry+0xfa>
ffffffffc020a190:	068abb83          	ld	s7,104(s5)
ffffffffc020a194:	0c0b8b63          	beqz	s7,ffffffffc020a26a <sfs_getdirentry+0xfe>
ffffffffc020a198:	0b0ba783          	lw	a5,176(s7) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a19c:	e7f9                	bnez	a5,ffffffffc020a26a <sfs_getdirentry+0xfe>
ffffffffc020a19e:	058aa703          	lw	a4,88(s5)
ffffffffc020a1a2:	6785                	lui	a5,0x1
ffffffffc020a1a4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a1a8:	0ef71163          	bne	a4,a5,ffffffffc020a28a <sfs_getdirentry+0x11e>
ffffffffc020a1ac:	008b3983          	ld	s3,8(s6)
ffffffffc020a1b0:	892a                	mv	s2,a0
ffffffffc020a1b2:	0a09c163          	bltz	s3,ffffffffc020a254 <sfs_getdirentry+0xe8>
ffffffffc020a1b6:	0ff9f793          	zext.b	a5,s3
ffffffffc020a1ba:	efc9                	bnez	a5,ffffffffc020a254 <sfs_getdirentry+0xe8>
ffffffffc020a1bc:	000ab783          	ld	a5,0(s5)
ffffffffc020a1c0:	0089d993          	srli	s3,s3,0x8
ffffffffc020a1c4:	2981                	sext.w	s3,s3
ffffffffc020a1c6:	479c                	lw	a5,8(a5)
ffffffffc020a1c8:	0937eb63          	bltu	a5,s3,ffffffffc020a25e <sfs_getdirentry+0xf2>
ffffffffc020a1cc:	020a8c13          	addi	s8,s5,32
ffffffffc020a1d0:	8562                	mv	a0,s8
ffffffffc020a1d2:	af0fa0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020a1d6:	000ab783          	ld	a5,0(s5)
ffffffffc020a1da:	0087aa03          	lw	s4,8(a5)
ffffffffc020a1de:	07405663          	blez	s4,ffffffffc020a24a <sfs_getdirentry+0xde>
ffffffffc020a1e2:	4481                	li	s1,0
ffffffffc020a1e4:	a811                	j	ffffffffc020a1f8 <sfs_getdirentry+0x8c>
ffffffffc020a1e6:	00092783          	lw	a5,0(s2)
ffffffffc020a1ea:	c781                	beqz	a5,ffffffffc020a1f2 <sfs_getdirentry+0x86>
ffffffffc020a1ec:	02098263          	beqz	s3,ffffffffc020a210 <sfs_getdirentry+0xa4>
ffffffffc020a1f0:	39fd                	addiw	s3,s3,-1
ffffffffc020a1f2:	2485                	addiw	s1,s1,1
ffffffffc020a1f4:	049a0b63          	beq	s4,s1,ffffffffc020a24a <sfs_getdirentry+0xde>
ffffffffc020a1f8:	86ca                	mv	a3,s2
ffffffffc020a1fa:	8626                	mv	a2,s1
ffffffffc020a1fc:	85d6                	mv	a1,s5
ffffffffc020a1fe:	855e                	mv	a0,s7
ffffffffc020a200:	eadff0ef          	jal	ra,ffffffffc020a0ac <sfs_dirent_read_nolock>
ffffffffc020a204:	842a                	mv	s0,a0
ffffffffc020a206:	d165                	beqz	a0,ffffffffc020a1e6 <sfs_getdirentry+0x7a>
ffffffffc020a208:	8562                	mv	a0,s8
ffffffffc020a20a:	ab4fa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a20e:	a831                	j	ffffffffc020a22a <sfs_getdirentry+0xbe>
ffffffffc020a210:	8562                	mv	a0,s8
ffffffffc020a212:	aacfa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a216:	4701                	li	a4,0
ffffffffc020a218:	4685                	li	a3,1
ffffffffc020a21a:	10000613          	li	a2,256
ffffffffc020a21e:	00490593          	addi	a1,s2,4
ffffffffc020a222:	855a                	mv	a0,s6
ffffffffc020a224:	926fb0ef          	jal	ra,ffffffffc020534a <iobuf_move>
ffffffffc020a228:	842a                	mv	s0,a0
ffffffffc020a22a:	854a                	mv	a0,s2
ffffffffc020a22c:	e13f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a230:	60a6                	ld	ra,72(sp)
ffffffffc020a232:	8522                	mv	a0,s0
ffffffffc020a234:	6406                	ld	s0,64(sp)
ffffffffc020a236:	74e2                	ld	s1,56(sp)
ffffffffc020a238:	7942                	ld	s2,48(sp)
ffffffffc020a23a:	79a2                	ld	s3,40(sp)
ffffffffc020a23c:	7a02                	ld	s4,32(sp)
ffffffffc020a23e:	6ae2                	ld	s5,24(sp)
ffffffffc020a240:	6b42                	ld	s6,16(sp)
ffffffffc020a242:	6ba2                	ld	s7,8(sp)
ffffffffc020a244:	6c02                	ld	s8,0(sp)
ffffffffc020a246:	6161                	addi	sp,sp,80
ffffffffc020a248:	8082                	ret
ffffffffc020a24a:	8562                	mv	a0,s8
ffffffffc020a24c:	5441                	li	s0,-16
ffffffffc020a24e:	a70fa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a252:	bfe1                	j	ffffffffc020a22a <sfs_getdirentry+0xbe>
ffffffffc020a254:	854a                	mv	a0,s2
ffffffffc020a256:	de9f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a25a:	5475                	li	s0,-3
ffffffffc020a25c:	bfd1                	j	ffffffffc020a230 <sfs_getdirentry+0xc4>
ffffffffc020a25e:	de1f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a262:	5441                	li	s0,-16
ffffffffc020a264:	b7f1                	j	ffffffffc020a230 <sfs_getdirentry+0xc4>
ffffffffc020a266:	5471                	li	s0,-4
ffffffffc020a268:	b7e1                	j	ffffffffc020a230 <sfs_getdirentry+0xc4>
ffffffffc020a26a:	00005697          	auipc	a3,0x5
ffffffffc020a26e:	a4e68693          	addi	a3,a3,-1458 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc020a272:	00001617          	auipc	a2,0x1
ffffffffc020a276:	68660613          	addi	a2,a2,1670 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a27a:	33800593          	li	a1,824
ffffffffc020a27e:	00005517          	auipc	a0,0x5
ffffffffc020a282:	c1a50513          	addi	a0,a0,-998 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a286:	a18f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a28a:	00005697          	auipc	a3,0x5
ffffffffc020a28e:	bd668693          	addi	a3,a3,-1066 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc020a292:	00001617          	auipc	a2,0x1
ffffffffc020a296:	66660613          	addi	a2,a2,1638 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a29a:	33900593          	li	a1,825
ffffffffc020a29e:	00005517          	auipc	a0,0x5
ffffffffc020a2a2:	bfa50513          	addi	a0,a0,-1030 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a2a6:	9f8f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a2aa <sfs_dirent_search_nolock.constprop.0>:
ffffffffc020a2aa:	715d                	addi	sp,sp,-80
ffffffffc020a2ac:	f052                	sd	s4,32(sp)
ffffffffc020a2ae:	8a2a                	mv	s4,a0
ffffffffc020a2b0:	8532                	mv	a0,a2
ffffffffc020a2b2:	f44e                	sd	s3,40(sp)
ffffffffc020a2b4:	e85a                	sd	s6,16(sp)
ffffffffc020a2b6:	e45e                	sd	s7,8(sp)
ffffffffc020a2b8:	e486                	sd	ra,72(sp)
ffffffffc020a2ba:	e0a2                	sd	s0,64(sp)
ffffffffc020a2bc:	fc26                	sd	s1,56(sp)
ffffffffc020a2be:	f84a                	sd	s2,48(sp)
ffffffffc020a2c0:	ec56                	sd	s5,24(sp)
ffffffffc020a2c2:	e062                	sd	s8,0(sp)
ffffffffc020a2c4:	8b32                	mv	s6,a2
ffffffffc020a2c6:	89ae                	mv	s3,a1
ffffffffc020a2c8:	8bb6                	mv	s7,a3
ffffffffc020a2ca:	0aa010ef          	jal	ra,ffffffffc020b374 <strlen>
ffffffffc020a2ce:	0ff00793          	li	a5,255
ffffffffc020a2d2:	06a7ef63          	bltu	a5,a0,ffffffffc020a350 <sfs_dirent_search_nolock.constprop.0+0xa6>
ffffffffc020a2d6:	10400513          	li	a0,260
ffffffffc020a2da:	cb5f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a2de:	892a                	mv	s2,a0
ffffffffc020a2e0:	c535                	beqz	a0,ffffffffc020a34c <sfs_dirent_search_nolock.constprop.0+0xa2>
ffffffffc020a2e2:	0009b783          	ld	a5,0(s3)
ffffffffc020a2e6:	0087aa83          	lw	s5,8(a5)
ffffffffc020a2ea:	05505a63          	blez	s5,ffffffffc020a33e <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a2ee:	4481                	li	s1,0
ffffffffc020a2f0:	00450c13          	addi	s8,a0,4
ffffffffc020a2f4:	a829                	j	ffffffffc020a30e <sfs_dirent_search_nolock.constprop.0+0x64>
ffffffffc020a2f6:	00092783          	lw	a5,0(s2)
ffffffffc020a2fa:	c799                	beqz	a5,ffffffffc020a308 <sfs_dirent_search_nolock.constprop.0+0x5e>
ffffffffc020a2fc:	85e2                	mv	a1,s8
ffffffffc020a2fe:	855a                	mv	a0,s6
ffffffffc020a300:	0bc010ef          	jal	ra,ffffffffc020b3bc <strcmp>
ffffffffc020a304:	842a                	mv	s0,a0
ffffffffc020a306:	cd15                	beqz	a0,ffffffffc020a342 <sfs_dirent_search_nolock.constprop.0+0x98>
ffffffffc020a308:	2485                	addiw	s1,s1,1
ffffffffc020a30a:	029a8a63          	beq	s5,s1,ffffffffc020a33e <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a30e:	86ca                	mv	a3,s2
ffffffffc020a310:	8626                	mv	a2,s1
ffffffffc020a312:	85ce                	mv	a1,s3
ffffffffc020a314:	8552                	mv	a0,s4
ffffffffc020a316:	d97ff0ef          	jal	ra,ffffffffc020a0ac <sfs_dirent_read_nolock>
ffffffffc020a31a:	842a                	mv	s0,a0
ffffffffc020a31c:	dd69                	beqz	a0,ffffffffc020a2f6 <sfs_dirent_search_nolock.constprop.0+0x4c>
ffffffffc020a31e:	854a                	mv	a0,s2
ffffffffc020a320:	d1ff70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a324:	60a6                	ld	ra,72(sp)
ffffffffc020a326:	8522                	mv	a0,s0
ffffffffc020a328:	6406                	ld	s0,64(sp)
ffffffffc020a32a:	74e2                	ld	s1,56(sp)
ffffffffc020a32c:	7942                	ld	s2,48(sp)
ffffffffc020a32e:	79a2                	ld	s3,40(sp)
ffffffffc020a330:	7a02                	ld	s4,32(sp)
ffffffffc020a332:	6ae2                	ld	s5,24(sp)
ffffffffc020a334:	6b42                	ld	s6,16(sp)
ffffffffc020a336:	6ba2                	ld	s7,8(sp)
ffffffffc020a338:	6c02                	ld	s8,0(sp)
ffffffffc020a33a:	6161                	addi	sp,sp,80
ffffffffc020a33c:	8082                	ret
ffffffffc020a33e:	5441                	li	s0,-16
ffffffffc020a340:	bff9                	j	ffffffffc020a31e <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a342:	00092783          	lw	a5,0(s2)
ffffffffc020a346:	00fba023          	sw	a5,0(s7)
ffffffffc020a34a:	bfd1                	j	ffffffffc020a31e <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a34c:	5471                	li	s0,-4
ffffffffc020a34e:	bfd9                	j	ffffffffc020a324 <sfs_dirent_search_nolock.constprop.0+0x7a>
ffffffffc020a350:	00005697          	auipc	a3,0x5
ffffffffc020a354:	d2868693          	addi	a3,a3,-728 # ffffffffc020f078 <dev_node_ops+0x7a0>
ffffffffc020a358:	00001617          	auipc	a2,0x1
ffffffffc020a35c:	5a060613          	addi	a2,a2,1440 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a360:	1ba00593          	li	a1,442
ffffffffc020a364:	00005517          	auipc	a0,0x5
ffffffffc020a368:	b3450513          	addi	a0,a0,-1228 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a36c:	932f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a370 <sfs_truncfile>:
ffffffffc020a370:	7175                	addi	sp,sp,-144
ffffffffc020a372:	e506                	sd	ra,136(sp)
ffffffffc020a374:	e122                	sd	s0,128(sp)
ffffffffc020a376:	fca6                	sd	s1,120(sp)
ffffffffc020a378:	f8ca                	sd	s2,112(sp)
ffffffffc020a37a:	f4ce                	sd	s3,104(sp)
ffffffffc020a37c:	f0d2                	sd	s4,96(sp)
ffffffffc020a37e:	ecd6                	sd	s5,88(sp)
ffffffffc020a380:	e8da                	sd	s6,80(sp)
ffffffffc020a382:	e4de                	sd	s7,72(sp)
ffffffffc020a384:	e0e2                	sd	s8,64(sp)
ffffffffc020a386:	fc66                	sd	s9,56(sp)
ffffffffc020a388:	f86a                	sd	s10,48(sp)
ffffffffc020a38a:	f46e                	sd	s11,40(sp)
ffffffffc020a38c:	080007b7          	lui	a5,0x8000
ffffffffc020a390:	16b7e463          	bltu	a5,a1,ffffffffc020a4f8 <sfs_truncfile+0x188>
ffffffffc020a394:	06853c83          	ld	s9,104(a0)
ffffffffc020a398:	89aa                	mv	s3,a0
ffffffffc020a39a:	160c8163          	beqz	s9,ffffffffc020a4fc <sfs_truncfile+0x18c>
ffffffffc020a39e:	0b0ca783          	lw	a5,176(s9) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a3a2:	14079d63          	bnez	a5,ffffffffc020a4fc <sfs_truncfile+0x18c>
ffffffffc020a3a6:	4d38                	lw	a4,88(a0)
ffffffffc020a3a8:	6405                	lui	s0,0x1
ffffffffc020a3aa:	23540793          	addi	a5,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a3ae:	16f71763          	bne	a4,a5,ffffffffc020a51c <sfs_truncfile+0x1ac>
ffffffffc020a3b2:	00053a83          	ld	s5,0(a0)
ffffffffc020a3b6:	147d                	addi	s0,s0,-1
ffffffffc020a3b8:	942e                	add	s0,s0,a1
ffffffffc020a3ba:	000ae783          	lwu	a5,0(s5)
ffffffffc020a3be:	8031                	srli	s0,s0,0xc
ffffffffc020a3c0:	8a2e                	mv	s4,a1
ffffffffc020a3c2:	2401                	sext.w	s0,s0
ffffffffc020a3c4:	02b79763          	bne	a5,a1,ffffffffc020a3f2 <sfs_truncfile+0x82>
ffffffffc020a3c8:	008aa783          	lw	a5,8(s5)
ffffffffc020a3cc:	4901                	li	s2,0
ffffffffc020a3ce:	18879763          	bne	a5,s0,ffffffffc020a55c <sfs_truncfile+0x1ec>
ffffffffc020a3d2:	60aa                	ld	ra,136(sp)
ffffffffc020a3d4:	640a                	ld	s0,128(sp)
ffffffffc020a3d6:	74e6                	ld	s1,120(sp)
ffffffffc020a3d8:	79a6                	ld	s3,104(sp)
ffffffffc020a3da:	7a06                	ld	s4,96(sp)
ffffffffc020a3dc:	6ae6                	ld	s5,88(sp)
ffffffffc020a3de:	6b46                	ld	s6,80(sp)
ffffffffc020a3e0:	6ba6                	ld	s7,72(sp)
ffffffffc020a3e2:	6c06                	ld	s8,64(sp)
ffffffffc020a3e4:	7ce2                	ld	s9,56(sp)
ffffffffc020a3e6:	7d42                	ld	s10,48(sp)
ffffffffc020a3e8:	7da2                	ld	s11,40(sp)
ffffffffc020a3ea:	854a                	mv	a0,s2
ffffffffc020a3ec:	7946                	ld	s2,112(sp)
ffffffffc020a3ee:	6149                	addi	sp,sp,144
ffffffffc020a3f0:	8082                	ret
ffffffffc020a3f2:	02050b13          	addi	s6,a0,32
ffffffffc020a3f6:	855a                	mv	a0,s6
ffffffffc020a3f8:	8cafa0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020a3fc:	008aa483          	lw	s1,8(s5)
ffffffffc020a400:	0a84e663          	bltu	s1,s0,ffffffffc020a4ac <sfs_truncfile+0x13c>
ffffffffc020a404:	0c947163          	bgeu	s0,s1,ffffffffc020a4c6 <sfs_truncfile+0x156>
ffffffffc020a408:	4dad                	li	s11,11
ffffffffc020a40a:	4b85                	li	s7,1
ffffffffc020a40c:	a09d                	j	ffffffffc020a472 <sfs_truncfile+0x102>
ffffffffc020a40e:	ff37091b          	addiw	s2,a4,-13
ffffffffc020a412:	0009079b          	sext.w	a5,s2
ffffffffc020a416:	3ff00713          	li	a4,1023
ffffffffc020a41a:	04f76563          	bltu	a4,a5,ffffffffc020a464 <sfs_truncfile+0xf4>
ffffffffc020a41e:	03cd2c03          	lw	s8,60(s10)
ffffffffc020a422:	040c0163          	beqz	s8,ffffffffc020a464 <sfs_truncfile+0xf4>
ffffffffc020a426:	004ca783          	lw	a5,4(s9)
ffffffffc020a42a:	18fc7963          	bgeu	s8,a5,ffffffffc020a5bc <sfs_truncfile+0x24c>
ffffffffc020a42e:	038cb503          	ld	a0,56(s9)
ffffffffc020a432:	85e2                	mv	a1,s8
ffffffffc020a434:	b5ffe0ef          	jal	ra,ffffffffc0208f92 <bitmap_test>
ffffffffc020a438:	16051263          	bnez	a0,ffffffffc020a59c <sfs_truncfile+0x22c>
ffffffffc020a43c:	02091793          	slli	a5,s2,0x20
ffffffffc020a440:	01e7d713          	srli	a4,a5,0x1e
ffffffffc020a444:	86e2                	mv	a3,s8
ffffffffc020a446:	4611                	li	a2,4
ffffffffc020a448:	082c                	addi	a1,sp,24
ffffffffc020a44a:	8566                	mv	a0,s9
ffffffffc020a44c:	e43a                	sd	a4,8(sp)
ffffffffc020a44e:	ce02                	sw	zero,28(sp)
ffffffffc020a450:	043000ef          	jal	ra,ffffffffc020ac92 <sfs_rbuf>
ffffffffc020a454:	892a                	mv	s2,a0
ffffffffc020a456:	e141                	bnez	a0,ffffffffc020a4d6 <sfs_truncfile+0x166>
ffffffffc020a458:	47e2                	lw	a5,24(sp)
ffffffffc020a45a:	6722                	ld	a4,8(sp)
ffffffffc020a45c:	e3c9                	bnez	a5,ffffffffc020a4de <sfs_truncfile+0x16e>
ffffffffc020a45e:	008d2603          	lw	a2,8(s10)
ffffffffc020a462:	367d                	addiw	a2,a2,-1
ffffffffc020a464:	00cd2423          	sw	a2,8(s10)
ffffffffc020a468:	0179b823          	sd	s7,16(s3)
ffffffffc020a46c:	34fd                	addiw	s1,s1,-1
ffffffffc020a46e:	04940a63          	beq	s0,s1,ffffffffc020a4c2 <sfs_truncfile+0x152>
ffffffffc020a472:	0009bd03          	ld	s10,0(s3)
ffffffffc020a476:	008d2703          	lw	a4,8(s10)
ffffffffc020a47a:	c369                	beqz	a4,ffffffffc020a53c <sfs_truncfile+0x1cc>
ffffffffc020a47c:	fff7079b          	addiw	a5,a4,-1
ffffffffc020a480:	0007861b          	sext.w	a2,a5
ffffffffc020a484:	f8cde5e3          	bltu	s11,a2,ffffffffc020a40e <sfs_truncfile+0x9e>
ffffffffc020a488:	02079713          	slli	a4,a5,0x20
ffffffffc020a48c:	01e75793          	srli	a5,a4,0x1e
ffffffffc020a490:	00fd0933          	add	s2,s10,a5
ffffffffc020a494:	00c92583          	lw	a1,12(s2)
ffffffffc020a498:	d5f1                	beqz	a1,ffffffffc020a464 <sfs_truncfile+0xf4>
ffffffffc020a49a:	8566                	mv	a0,s9
ffffffffc020a49c:	c04ff0ef          	jal	ra,ffffffffc02098a0 <sfs_block_free>
ffffffffc020a4a0:	00092623          	sw	zero,12(s2)
ffffffffc020a4a4:	008d2603          	lw	a2,8(s10)
ffffffffc020a4a8:	367d                	addiw	a2,a2,-1
ffffffffc020a4aa:	bf6d                	j	ffffffffc020a464 <sfs_truncfile+0xf4>
ffffffffc020a4ac:	4681                	li	a3,0
ffffffffc020a4ae:	8626                	mv	a2,s1
ffffffffc020a4b0:	85ce                	mv	a1,s3
ffffffffc020a4b2:	8566                	mv	a0,s9
ffffffffc020a4b4:	ea6ff0ef          	jal	ra,ffffffffc0209b5a <sfs_bmap_load_nolock>
ffffffffc020a4b8:	892a                	mv	s2,a0
ffffffffc020a4ba:	ed11                	bnez	a0,ffffffffc020a4d6 <sfs_truncfile+0x166>
ffffffffc020a4bc:	2485                	addiw	s1,s1,1
ffffffffc020a4be:	fe9417e3          	bne	s0,s1,ffffffffc020a4ac <sfs_truncfile+0x13c>
ffffffffc020a4c2:	008aa483          	lw	s1,8(s5)
ffffffffc020a4c6:	0a941b63          	bne	s0,s1,ffffffffc020a57c <sfs_truncfile+0x20c>
ffffffffc020a4ca:	014aa023          	sw	s4,0(s5)
ffffffffc020a4ce:	4785                	li	a5,1
ffffffffc020a4d0:	00f9b823          	sd	a5,16(s3)
ffffffffc020a4d4:	4901                	li	s2,0
ffffffffc020a4d6:	855a                	mv	a0,s6
ffffffffc020a4d8:	fe7f90ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a4dc:	bddd                	j	ffffffffc020a3d2 <sfs_truncfile+0x62>
ffffffffc020a4de:	86e2                	mv	a3,s8
ffffffffc020a4e0:	4611                	li	a2,4
ffffffffc020a4e2:	086c                	addi	a1,sp,28
ffffffffc020a4e4:	8566                	mv	a0,s9
ffffffffc020a4e6:	02d000ef          	jal	ra,ffffffffc020ad12 <sfs_wbuf>
ffffffffc020a4ea:	892a                	mv	s2,a0
ffffffffc020a4ec:	f56d                	bnez	a0,ffffffffc020a4d6 <sfs_truncfile+0x166>
ffffffffc020a4ee:	45e2                	lw	a1,24(sp)
ffffffffc020a4f0:	8566                	mv	a0,s9
ffffffffc020a4f2:	baeff0ef          	jal	ra,ffffffffc02098a0 <sfs_block_free>
ffffffffc020a4f6:	b7a5                	j	ffffffffc020a45e <sfs_truncfile+0xee>
ffffffffc020a4f8:	5975                	li	s2,-3
ffffffffc020a4fa:	bde1                	j	ffffffffc020a3d2 <sfs_truncfile+0x62>
ffffffffc020a4fc:	00004697          	auipc	a3,0x4
ffffffffc020a500:	7bc68693          	addi	a3,a3,1980 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc020a504:	00001617          	auipc	a2,0x1
ffffffffc020a508:	3f460613          	addi	a2,a2,1012 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a50c:	3a700593          	li	a1,935
ffffffffc020a510:	00005517          	auipc	a0,0x5
ffffffffc020a514:	98850513          	addi	a0,a0,-1656 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a518:	f87f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a51c:	00005697          	auipc	a3,0x5
ffffffffc020a520:	94468693          	addi	a3,a3,-1724 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc020a524:	00001617          	auipc	a2,0x1
ffffffffc020a528:	3d460613          	addi	a2,a2,980 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a52c:	3a800593          	li	a1,936
ffffffffc020a530:	00005517          	auipc	a0,0x5
ffffffffc020a534:	96850513          	addi	a0,a0,-1688 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a538:	f67f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a53c:	00005697          	auipc	a3,0x5
ffffffffc020a540:	b7c68693          	addi	a3,a3,-1156 # ffffffffc020f0b8 <dev_node_ops+0x7e0>
ffffffffc020a544:	00001617          	auipc	a2,0x1
ffffffffc020a548:	3b460613          	addi	a2,a2,948 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a54c:	17b00593          	li	a1,379
ffffffffc020a550:	00005517          	auipc	a0,0x5
ffffffffc020a554:	94850513          	addi	a0,a0,-1720 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a558:	f47f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a55c:	00005697          	auipc	a3,0x5
ffffffffc020a560:	b4468693          	addi	a3,a3,-1212 # ffffffffc020f0a0 <dev_node_ops+0x7c8>
ffffffffc020a564:	00001617          	auipc	a2,0x1
ffffffffc020a568:	39460613          	addi	a2,a2,916 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a56c:	3af00593          	li	a1,943
ffffffffc020a570:	00005517          	auipc	a0,0x5
ffffffffc020a574:	92850513          	addi	a0,a0,-1752 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a578:	f27f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a57c:	00005697          	auipc	a3,0x5
ffffffffc020a580:	b8c68693          	addi	a3,a3,-1140 # ffffffffc020f108 <dev_node_ops+0x830>
ffffffffc020a584:	00001617          	auipc	a2,0x1
ffffffffc020a588:	37460613          	addi	a2,a2,884 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a58c:	3c800593          	li	a1,968
ffffffffc020a590:	00005517          	auipc	a0,0x5
ffffffffc020a594:	90850513          	addi	a0,a0,-1784 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a598:	f07f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a59c:	00005697          	auipc	a3,0x5
ffffffffc020a5a0:	b3468693          	addi	a3,a3,-1228 # ffffffffc020f0d0 <dev_node_ops+0x7f8>
ffffffffc020a5a4:	00001617          	auipc	a2,0x1
ffffffffc020a5a8:	35460613          	addi	a2,a2,852 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a5ac:	12b00593          	li	a1,299
ffffffffc020a5b0:	00005517          	auipc	a0,0x5
ffffffffc020a5b4:	8e850513          	addi	a0,a0,-1816 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a5b8:	ee7f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a5bc:	8762                	mv	a4,s8
ffffffffc020a5be:	86be                	mv	a3,a5
ffffffffc020a5c0:	00005617          	auipc	a2,0x5
ffffffffc020a5c4:	90860613          	addi	a2,a2,-1784 # ffffffffc020eec8 <dev_node_ops+0x5f0>
ffffffffc020a5c8:	05300593          	li	a1,83
ffffffffc020a5cc:	00005517          	auipc	a0,0x5
ffffffffc020a5d0:	8cc50513          	addi	a0,a0,-1844 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a5d4:	ecbf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a5d8 <sfs_load_inode>:
ffffffffc020a5d8:	7139                	addi	sp,sp,-64
ffffffffc020a5da:	fc06                	sd	ra,56(sp)
ffffffffc020a5dc:	f822                	sd	s0,48(sp)
ffffffffc020a5de:	f426                	sd	s1,40(sp)
ffffffffc020a5e0:	f04a                	sd	s2,32(sp)
ffffffffc020a5e2:	84b2                	mv	s1,a2
ffffffffc020a5e4:	892a                	mv	s2,a0
ffffffffc020a5e6:	ec4e                	sd	s3,24(sp)
ffffffffc020a5e8:	e852                	sd	s4,16(sp)
ffffffffc020a5ea:	89ae                	mv	s3,a1
ffffffffc020a5ec:	e456                	sd	s5,8(sp)
ffffffffc020a5ee:	0d5000ef          	jal	ra,ffffffffc020aec2 <lock_sfs_fs>
ffffffffc020a5f2:	45a9                	li	a1,10
ffffffffc020a5f4:	8526                	mv	a0,s1
ffffffffc020a5f6:	0a893403          	ld	s0,168(s2)
ffffffffc020a5fa:	0e9000ef          	jal	ra,ffffffffc020aee2 <hash32>
ffffffffc020a5fe:	02051793          	slli	a5,a0,0x20
ffffffffc020a602:	01c7d713          	srli	a4,a5,0x1c
ffffffffc020a606:	9722                	add	a4,a4,s0
ffffffffc020a608:	843a                	mv	s0,a4
ffffffffc020a60a:	a029                	j	ffffffffc020a614 <sfs_load_inode+0x3c>
ffffffffc020a60c:	fc042783          	lw	a5,-64(s0)
ffffffffc020a610:	10978863          	beq	a5,s1,ffffffffc020a720 <sfs_load_inode+0x148>
ffffffffc020a614:	6400                	ld	s0,8(s0)
ffffffffc020a616:	fe871be3          	bne	a4,s0,ffffffffc020a60c <sfs_load_inode+0x34>
ffffffffc020a61a:	04000513          	li	a0,64
ffffffffc020a61e:	971f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a622:	8aaa                	mv	s5,a0
ffffffffc020a624:	16050563          	beqz	a0,ffffffffc020a78e <sfs_load_inode+0x1b6>
ffffffffc020a628:	00492683          	lw	a3,4(s2)
ffffffffc020a62c:	18048363          	beqz	s1,ffffffffc020a7b2 <sfs_load_inode+0x1da>
ffffffffc020a630:	18d4f163          	bgeu	s1,a3,ffffffffc020a7b2 <sfs_load_inode+0x1da>
ffffffffc020a634:	03893503          	ld	a0,56(s2)
ffffffffc020a638:	85a6                	mv	a1,s1
ffffffffc020a63a:	959fe0ef          	jal	ra,ffffffffc0208f92 <bitmap_test>
ffffffffc020a63e:	18051763          	bnez	a0,ffffffffc020a7cc <sfs_load_inode+0x1f4>
ffffffffc020a642:	4701                	li	a4,0
ffffffffc020a644:	86a6                	mv	a3,s1
ffffffffc020a646:	04000613          	li	a2,64
ffffffffc020a64a:	85d6                	mv	a1,s5
ffffffffc020a64c:	854a                	mv	a0,s2
ffffffffc020a64e:	644000ef          	jal	ra,ffffffffc020ac92 <sfs_rbuf>
ffffffffc020a652:	842a                	mv	s0,a0
ffffffffc020a654:	0e051563          	bnez	a0,ffffffffc020a73e <sfs_load_inode+0x166>
ffffffffc020a658:	006ad783          	lhu	a5,6(s5)
ffffffffc020a65c:	12078b63          	beqz	a5,ffffffffc020a792 <sfs_load_inode+0x1ba>
ffffffffc020a660:	6405                	lui	s0,0x1
ffffffffc020a662:	23540513          	addi	a0,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a666:	8e6fd0ef          	jal	ra,ffffffffc020774c <__alloc_inode>
ffffffffc020a66a:	8a2a                	mv	s4,a0
ffffffffc020a66c:	c961                	beqz	a0,ffffffffc020a73c <sfs_load_inode+0x164>
ffffffffc020a66e:	004ad683          	lhu	a3,4(s5)
ffffffffc020a672:	4785                	li	a5,1
ffffffffc020a674:	0cf69c63          	bne	a3,a5,ffffffffc020a74c <sfs_load_inode+0x174>
ffffffffc020a678:	864a                	mv	a2,s2
ffffffffc020a67a:	00005597          	auipc	a1,0x5
ffffffffc020a67e:	b9e58593          	addi	a1,a1,-1122 # ffffffffc020f218 <sfs_node_fileops>
ffffffffc020a682:	8e6fd0ef          	jal	ra,ffffffffc0207768 <inode_init>
ffffffffc020a686:	058a2783          	lw	a5,88(s4)
ffffffffc020a68a:	23540413          	addi	s0,s0,565
ffffffffc020a68e:	0e879063          	bne	a5,s0,ffffffffc020a76e <sfs_load_inode+0x196>
ffffffffc020a692:	4785                	li	a5,1
ffffffffc020a694:	00fa2c23          	sw	a5,24(s4)
ffffffffc020a698:	015a3023          	sd	s5,0(s4)
ffffffffc020a69c:	009a2423          	sw	s1,8(s4)
ffffffffc020a6a0:	000a3823          	sd	zero,16(s4)
ffffffffc020a6a4:	4585                	li	a1,1
ffffffffc020a6a6:	020a0513          	addi	a0,s4,32
ffffffffc020a6aa:	e0ff90ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc020a6ae:	058a2703          	lw	a4,88(s4)
ffffffffc020a6b2:	6785                	lui	a5,0x1
ffffffffc020a6b4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a6b8:	14f71663          	bne	a4,a5,ffffffffc020a804 <sfs_load_inode+0x22c>
ffffffffc020a6bc:	0a093703          	ld	a4,160(s2)
ffffffffc020a6c0:	038a0793          	addi	a5,s4,56
ffffffffc020a6c4:	008a2503          	lw	a0,8(s4)
ffffffffc020a6c8:	e31c                	sd	a5,0(a4)
ffffffffc020a6ca:	0af93023          	sd	a5,160(s2)
ffffffffc020a6ce:	09890793          	addi	a5,s2,152
ffffffffc020a6d2:	0a893403          	ld	s0,168(s2)
ffffffffc020a6d6:	45a9                	li	a1,10
ffffffffc020a6d8:	04ea3023          	sd	a4,64(s4)
ffffffffc020a6dc:	02fa3c23          	sd	a5,56(s4)
ffffffffc020a6e0:	003000ef          	jal	ra,ffffffffc020aee2 <hash32>
ffffffffc020a6e4:	02051713          	slli	a4,a0,0x20
ffffffffc020a6e8:	01c75793          	srli	a5,a4,0x1c
ffffffffc020a6ec:	97a2                	add	a5,a5,s0
ffffffffc020a6ee:	6798                	ld	a4,8(a5)
ffffffffc020a6f0:	048a0693          	addi	a3,s4,72
ffffffffc020a6f4:	e314                	sd	a3,0(a4)
ffffffffc020a6f6:	e794                	sd	a3,8(a5)
ffffffffc020a6f8:	04ea3823          	sd	a4,80(s4)
ffffffffc020a6fc:	04fa3423          	sd	a5,72(s4)
ffffffffc020a700:	854a                	mv	a0,s2
ffffffffc020a702:	7d0000ef          	jal	ra,ffffffffc020aed2 <unlock_sfs_fs>
ffffffffc020a706:	4401                	li	s0,0
ffffffffc020a708:	0149b023          	sd	s4,0(s3)
ffffffffc020a70c:	70e2                	ld	ra,56(sp)
ffffffffc020a70e:	8522                	mv	a0,s0
ffffffffc020a710:	7442                	ld	s0,48(sp)
ffffffffc020a712:	74a2                	ld	s1,40(sp)
ffffffffc020a714:	7902                	ld	s2,32(sp)
ffffffffc020a716:	69e2                	ld	s3,24(sp)
ffffffffc020a718:	6a42                	ld	s4,16(sp)
ffffffffc020a71a:	6aa2                	ld	s5,8(sp)
ffffffffc020a71c:	6121                	addi	sp,sp,64
ffffffffc020a71e:	8082                	ret
ffffffffc020a720:	fb840a13          	addi	s4,s0,-72
ffffffffc020a724:	8552                	mv	a0,s4
ffffffffc020a726:	8a4fd0ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc020a72a:	4785                	li	a5,1
ffffffffc020a72c:	fcf51ae3          	bne	a0,a5,ffffffffc020a700 <sfs_load_inode+0x128>
ffffffffc020a730:	fd042783          	lw	a5,-48(s0)
ffffffffc020a734:	2785                	addiw	a5,a5,1
ffffffffc020a736:	fcf42823          	sw	a5,-48(s0)
ffffffffc020a73a:	b7d9                	j	ffffffffc020a700 <sfs_load_inode+0x128>
ffffffffc020a73c:	5471                	li	s0,-4
ffffffffc020a73e:	8556                	mv	a0,s5
ffffffffc020a740:	8fff70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a744:	854a                	mv	a0,s2
ffffffffc020a746:	78c000ef          	jal	ra,ffffffffc020aed2 <unlock_sfs_fs>
ffffffffc020a74a:	b7c9                	j	ffffffffc020a70c <sfs_load_inode+0x134>
ffffffffc020a74c:	4789                	li	a5,2
ffffffffc020a74e:	08f69f63          	bne	a3,a5,ffffffffc020a7ec <sfs_load_inode+0x214>
ffffffffc020a752:	864a                	mv	a2,s2
ffffffffc020a754:	00005597          	auipc	a1,0x5
ffffffffc020a758:	a4458593          	addi	a1,a1,-1468 # ffffffffc020f198 <sfs_node_dirops>
ffffffffc020a75c:	80cfd0ef          	jal	ra,ffffffffc0207768 <inode_init>
ffffffffc020a760:	058a2703          	lw	a4,88(s4)
ffffffffc020a764:	6785                	lui	a5,0x1
ffffffffc020a766:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a76a:	f2f704e3          	beq	a4,a5,ffffffffc020a692 <sfs_load_inode+0xba>
ffffffffc020a76e:	00004697          	auipc	a3,0x4
ffffffffc020a772:	6f268693          	addi	a3,a3,1778 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc020a776:	00001617          	auipc	a2,0x1
ffffffffc020a77a:	18260613          	addi	a2,a2,386 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a77e:	07700593          	li	a1,119
ffffffffc020a782:	00004517          	auipc	a0,0x4
ffffffffc020a786:	71650513          	addi	a0,a0,1814 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a78a:	d15f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a78e:	5471                	li	s0,-4
ffffffffc020a790:	bf55                	j	ffffffffc020a744 <sfs_load_inode+0x16c>
ffffffffc020a792:	00005697          	auipc	a3,0x5
ffffffffc020a796:	98e68693          	addi	a3,a3,-1650 # ffffffffc020f120 <dev_node_ops+0x848>
ffffffffc020a79a:	00001617          	auipc	a2,0x1
ffffffffc020a79e:	15e60613          	addi	a2,a2,350 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a7a2:	0ad00593          	li	a1,173
ffffffffc020a7a6:	00004517          	auipc	a0,0x4
ffffffffc020a7aa:	6f250513          	addi	a0,a0,1778 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a7ae:	cf1f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a7b2:	8726                	mv	a4,s1
ffffffffc020a7b4:	00004617          	auipc	a2,0x4
ffffffffc020a7b8:	71460613          	addi	a2,a2,1812 # ffffffffc020eec8 <dev_node_ops+0x5f0>
ffffffffc020a7bc:	05300593          	li	a1,83
ffffffffc020a7c0:	00004517          	auipc	a0,0x4
ffffffffc020a7c4:	6d850513          	addi	a0,a0,1752 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a7c8:	cd7f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a7cc:	00004697          	auipc	a3,0x4
ffffffffc020a7d0:	73468693          	addi	a3,a3,1844 # ffffffffc020ef00 <dev_node_ops+0x628>
ffffffffc020a7d4:	00001617          	auipc	a2,0x1
ffffffffc020a7d8:	12460613          	addi	a2,a2,292 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a7dc:	0a800593          	li	a1,168
ffffffffc020a7e0:	00004517          	auipc	a0,0x4
ffffffffc020a7e4:	6b850513          	addi	a0,a0,1720 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a7e8:	cb7f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a7ec:	00004617          	auipc	a2,0x4
ffffffffc020a7f0:	6c460613          	addi	a2,a2,1732 # ffffffffc020eeb0 <dev_node_ops+0x5d8>
ffffffffc020a7f4:	02e00593          	li	a1,46
ffffffffc020a7f8:	00004517          	auipc	a0,0x4
ffffffffc020a7fc:	6a050513          	addi	a0,a0,1696 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a800:	c9ff50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a804:	00004697          	auipc	a3,0x4
ffffffffc020a808:	65c68693          	addi	a3,a3,1628 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc020a80c:	00001617          	auipc	a2,0x1
ffffffffc020a810:	0ec60613          	addi	a2,a2,236 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a814:	0b100593          	li	a1,177
ffffffffc020a818:	00004517          	auipc	a0,0x4
ffffffffc020a81c:	68050513          	addi	a0,a0,1664 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a820:	c7ff50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a824 <sfs_lookup>:
ffffffffc020a824:	7139                	addi	sp,sp,-64
ffffffffc020a826:	ec4e                	sd	s3,24(sp)
ffffffffc020a828:	06853983          	ld	s3,104(a0)
ffffffffc020a82c:	fc06                	sd	ra,56(sp)
ffffffffc020a82e:	f822                	sd	s0,48(sp)
ffffffffc020a830:	f426                	sd	s1,40(sp)
ffffffffc020a832:	f04a                	sd	s2,32(sp)
ffffffffc020a834:	e852                	sd	s4,16(sp)
ffffffffc020a836:	0a098c63          	beqz	s3,ffffffffc020a8ee <sfs_lookup+0xca>
ffffffffc020a83a:	0b09a783          	lw	a5,176(s3)
ffffffffc020a83e:	ebc5                	bnez	a5,ffffffffc020a8ee <sfs_lookup+0xca>
ffffffffc020a840:	0005c783          	lbu	a5,0(a1)
ffffffffc020a844:	84ae                	mv	s1,a1
ffffffffc020a846:	c7c1                	beqz	a5,ffffffffc020a8ce <sfs_lookup+0xaa>
ffffffffc020a848:	02f00713          	li	a4,47
ffffffffc020a84c:	08e78163          	beq	a5,a4,ffffffffc020a8ce <sfs_lookup+0xaa>
ffffffffc020a850:	842a                	mv	s0,a0
ffffffffc020a852:	8a32                	mv	s4,a2
ffffffffc020a854:	f77fc0ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc020a858:	4c38                	lw	a4,88(s0)
ffffffffc020a85a:	6785                	lui	a5,0x1
ffffffffc020a85c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a860:	0af71763          	bne	a4,a5,ffffffffc020a90e <sfs_lookup+0xea>
ffffffffc020a864:	6018                	ld	a4,0(s0)
ffffffffc020a866:	4789                	li	a5,2
ffffffffc020a868:	00475703          	lhu	a4,4(a4)
ffffffffc020a86c:	04f71c63          	bne	a4,a5,ffffffffc020a8c4 <sfs_lookup+0xa0>
ffffffffc020a870:	02040913          	addi	s2,s0,32
ffffffffc020a874:	854a                	mv	a0,s2
ffffffffc020a876:	c4df90ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020a87a:	8626                	mv	a2,s1
ffffffffc020a87c:	0054                	addi	a3,sp,4
ffffffffc020a87e:	85a2                	mv	a1,s0
ffffffffc020a880:	854e                	mv	a0,s3
ffffffffc020a882:	a29ff0ef          	jal	ra,ffffffffc020a2aa <sfs_dirent_search_nolock.constprop.0>
ffffffffc020a886:	84aa                	mv	s1,a0
ffffffffc020a888:	854a                	mv	a0,s2
ffffffffc020a88a:	c35f90ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a88e:	cc89                	beqz	s1,ffffffffc020a8a8 <sfs_lookup+0x84>
ffffffffc020a890:	8522                	mv	a0,s0
ffffffffc020a892:	806fd0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc020a896:	70e2                	ld	ra,56(sp)
ffffffffc020a898:	7442                	ld	s0,48(sp)
ffffffffc020a89a:	7902                	ld	s2,32(sp)
ffffffffc020a89c:	69e2                	ld	s3,24(sp)
ffffffffc020a89e:	6a42                	ld	s4,16(sp)
ffffffffc020a8a0:	8526                	mv	a0,s1
ffffffffc020a8a2:	74a2                	ld	s1,40(sp)
ffffffffc020a8a4:	6121                	addi	sp,sp,64
ffffffffc020a8a6:	8082                	ret
ffffffffc020a8a8:	4612                	lw	a2,4(sp)
ffffffffc020a8aa:	002c                	addi	a1,sp,8
ffffffffc020a8ac:	854e                	mv	a0,s3
ffffffffc020a8ae:	d2bff0ef          	jal	ra,ffffffffc020a5d8 <sfs_load_inode>
ffffffffc020a8b2:	84aa                	mv	s1,a0
ffffffffc020a8b4:	8522                	mv	a0,s0
ffffffffc020a8b6:	fe3fc0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc020a8ba:	fcf1                	bnez	s1,ffffffffc020a896 <sfs_lookup+0x72>
ffffffffc020a8bc:	67a2                	ld	a5,8(sp)
ffffffffc020a8be:	00fa3023          	sd	a5,0(s4)
ffffffffc020a8c2:	bfd1                	j	ffffffffc020a896 <sfs_lookup+0x72>
ffffffffc020a8c4:	8522                	mv	a0,s0
ffffffffc020a8c6:	fd3fc0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc020a8ca:	54b9                	li	s1,-18
ffffffffc020a8cc:	b7e9                	j	ffffffffc020a896 <sfs_lookup+0x72>
ffffffffc020a8ce:	00005697          	auipc	a3,0x5
ffffffffc020a8d2:	86a68693          	addi	a3,a3,-1942 # ffffffffc020f138 <dev_node_ops+0x860>
ffffffffc020a8d6:	00001617          	auipc	a2,0x1
ffffffffc020a8da:	02260613          	addi	a2,a2,34 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a8de:	3d900593          	li	a1,985
ffffffffc020a8e2:	00004517          	auipc	a0,0x4
ffffffffc020a8e6:	5b650513          	addi	a0,a0,1462 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a8ea:	bb5f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a8ee:	00004697          	auipc	a3,0x4
ffffffffc020a8f2:	3ca68693          	addi	a3,a3,970 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc020a8f6:	00001617          	auipc	a2,0x1
ffffffffc020a8fa:	00260613          	addi	a2,a2,2 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a8fe:	3d800593          	li	a1,984
ffffffffc020a902:	00004517          	auipc	a0,0x4
ffffffffc020a906:	59650513          	addi	a0,a0,1430 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a90a:	b95f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a90e:	00004697          	auipc	a3,0x4
ffffffffc020a912:	55268693          	addi	a3,a3,1362 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc020a916:	00001617          	auipc	a2,0x1
ffffffffc020a91a:	fe260613          	addi	a2,a2,-30 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020a91e:	3db00593          	li	a1,987
ffffffffc020a922:	00004517          	auipc	a0,0x4
ffffffffc020a926:	57650513          	addi	a0,a0,1398 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020a92a:	b75f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a92e <sfs_namefile>:
ffffffffc020a92e:	6d98                	ld	a4,24(a1)
ffffffffc020a930:	7175                	addi	sp,sp,-144
ffffffffc020a932:	e506                	sd	ra,136(sp)
ffffffffc020a934:	e122                	sd	s0,128(sp)
ffffffffc020a936:	fca6                	sd	s1,120(sp)
ffffffffc020a938:	f8ca                	sd	s2,112(sp)
ffffffffc020a93a:	f4ce                	sd	s3,104(sp)
ffffffffc020a93c:	f0d2                	sd	s4,96(sp)
ffffffffc020a93e:	ecd6                	sd	s5,88(sp)
ffffffffc020a940:	e8da                	sd	s6,80(sp)
ffffffffc020a942:	e4de                	sd	s7,72(sp)
ffffffffc020a944:	e0e2                	sd	s8,64(sp)
ffffffffc020a946:	fc66                	sd	s9,56(sp)
ffffffffc020a948:	f86a                	sd	s10,48(sp)
ffffffffc020a94a:	f46e                	sd	s11,40(sp)
ffffffffc020a94c:	e42e                	sd	a1,8(sp)
ffffffffc020a94e:	4789                	li	a5,2
ffffffffc020a950:	1ae7f363          	bgeu	a5,a4,ffffffffc020aaf6 <sfs_namefile+0x1c8>
ffffffffc020a954:	89aa                	mv	s3,a0
ffffffffc020a956:	10400513          	li	a0,260
ffffffffc020a95a:	e34f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a95e:	842a                	mv	s0,a0
ffffffffc020a960:	18050b63          	beqz	a0,ffffffffc020aaf6 <sfs_namefile+0x1c8>
ffffffffc020a964:	0689b483          	ld	s1,104(s3)
ffffffffc020a968:	1e048963          	beqz	s1,ffffffffc020ab5a <sfs_namefile+0x22c>
ffffffffc020a96c:	0b04a783          	lw	a5,176(s1)
ffffffffc020a970:	1e079563          	bnez	a5,ffffffffc020ab5a <sfs_namefile+0x22c>
ffffffffc020a974:	0589ac83          	lw	s9,88(s3)
ffffffffc020a978:	6785                	lui	a5,0x1
ffffffffc020a97a:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a97e:	1afc9e63          	bne	s9,a5,ffffffffc020ab3a <sfs_namefile+0x20c>
ffffffffc020a982:	6722                	ld	a4,8(sp)
ffffffffc020a984:	854e                	mv	a0,s3
ffffffffc020a986:	8ace                	mv	s5,s3
ffffffffc020a988:	6f1c                	ld	a5,24(a4)
ffffffffc020a98a:	00073b03          	ld	s6,0(a4)
ffffffffc020a98e:	02098a13          	addi	s4,s3,32
ffffffffc020a992:	ffe78b93          	addi	s7,a5,-2
ffffffffc020a996:	9b3e                	add	s6,s6,a5
ffffffffc020a998:	00004d17          	auipc	s10,0x4
ffffffffc020a99c:	7c0d0d13          	addi	s10,s10,1984 # ffffffffc020f158 <dev_node_ops+0x880>
ffffffffc020a9a0:	e2bfc0ef          	jal	ra,ffffffffc02077ca <inode_ref_inc>
ffffffffc020a9a4:	00440c13          	addi	s8,s0,4
ffffffffc020a9a8:	e066                	sd	s9,0(sp)
ffffffffc020a9aa:	8552                	mv	a0,s4
ffffffffc020a9ac:	b17f90ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020a9b0:	0854                	addi	a3,sp,20
ffffffffc020a9b2:	866a                	mv	a2,s10
ffffffffc020a9b4:	85d6                	mv	a1,s5
ffffffffc020a9b6:	8526                	mv	a0,s1
ffffffffc020a9b8:	8f3ff0ef          	jal	ra,ffffffffc020a2aa <sfs_dirent_search_nolock.constprop.0>
ffffffffc020a9bc:	8daa                	mv	s11,a0
ffffffffc020a9be:	8552                	mv	a0,s4
ffffffffc020a9c0:	afff90ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a9c4:	020d8863          	beqz	s11,ffffffffc020a9f4 <sfs_namefile+0xc6>
ffffffffc020a9c8:	854e                	mv	a0,s3
ffffffffc020a9ca:	ecffc0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc020a9ce:	8522                	mv	a0,s0
ffffffffc020a9d0:	e6ef70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a9d4:	60aa                	ld	ra,136(sp)
ffffffffc020a9d6:	640a                	ld	s0,128(sp)
ffffffffc020a9d8:	74e6                	ld	s1,120(sp)
ffffffffc020a9da:	7946                	ld	s2,112(sp)
ffffffffc020a9dc:	79a6                	ld	s3,104(sp)
ffffffffc020a9de:	7a06                	ld	s4,96(sp)
ffffffffc020a9e0:	6ae6                	ld	s5,88(sp)
ffffffffc020a9e2:	6b46                	ld	s6,80(sp)
ffffffffc020a9e4:	6ba6                	ld	s7,72(sp)
ffffffffc020a9e6:	6c06                	ld	s8,64(sp)
ffffffffc020a9e8:	7ce2                	ld	s9,56(sp)
ffffffffc020a9ea:	7d42                	ld	s10,48(sp)
ffffffffc020a9ec:	856e                	mv	a0,s11
ffffffffc020a9ee:	7da2                	ld	s11,40(sp)
ffffffffc020a9f0:	6149                	addi	sp,sp,144
ffffffffc020a9f2:	8082                	ret
ffffffffc020a9f4:	4652                	lw	a2,20(sp)
ffffffffc020a9f6:	082c                	addi	a1,sp,24
ffffffffc020a9f8:	8526                	mv	a0,s1
ffffffffc020a9fa:	bdfff0ef          	jal	ra,ffffffffc020a5d8 <sfs_load_inode>
ffffffffc020a9fe:	8daa                	mv	s11,a0
ffffffffc020aa00:	f561                	bnez	a0,ffffffffc020a9c8 <sfs_namefile+0x9a>
ffffffffc020aa02:	854e                	mv	a0,s3
ffffffffc020aa04:	008aa903          	lw	s2,8(s5)
ffffffffc020aa08:	e91fc0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc020aa0c:	6ce2                	ld	s9,24(sp)
ffffffffc020aa0e:	0b3c8463          	beq	s9,s3,ffffffffc020aab6 <sfs_namefile+0x188>
ffffffffc020aa12:	100c8463          	beqz	s9,ffffffffc020ab1a <sfs_namefile+0x1ec>
ffffffffc020aa16:	058ca703          	lw	a4,88(s9)
ffffffffc020aa1a:	6782                	ld	a5,0(sp)
ffffffffc020aa1c:	0ef71f63          	bne	a4,a5,ffffffffc020ab1a <sfs_namefile+0x1ec>
ffffffffc020aa20:	008ca703          	lw	a4,8(s9)
ffffffffc020aa24:	8ae6                	mv	s5,s9
ffffffffc020aa26:	0d270a63          	beq	a4,s2,ffffffffc020aafa <sfs_namefile+0x1cc>
ffffffffc020aa2a:	000cb703          	ld	a4,0(s9)
ffffffffc020aa2e:	4789                	li	a5,2
ffffffffc020aa30:	00475703          	lhu	a4,4(a4)
ffffffffc020aa34:	0cf71363          	bne	a4,a5,ffffffffc020aafa <sfs_namefile+0x1cc>
ffffffffc020aa38:	020c8a13          	addi	s4,s9,32
ffffffffc020aa3c:	8552                	mv	a0,s4
ffffffffc020aa3e:	a85f90ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020aa42:	000cb703          	ld	a4,0(s9)
ffffffffc020aa46:	00872983          	lw	s3,8(a4)
ffffffffc020aa4a:	01304963          	bgtz	s3,ffffffffc020aa5c <sfs_namefile+0x12e>
ffffffffc020aa4e:	a899                	j	ffffffffc020aaa4 <sfs_namefile+0x176>
ffffffffc020aa50:	4018                	lw	a4,0(s0)
ffffffffc020aa52:	01270e63          	beq	a4,s2,ffffffffc020aa6e <sfs_namefile+0x140>
ffffffffc020aa56:	2d85                	addiw	s11,s11,1
ffffffffc020aa58:	05b98663          	beq	s3,s11,ffffffffc020aaa4 <sfs_namefile+0x176>
ffffffffc020aa5c:	86a2                	mv	a3,s0
ffffffffc020aa5e:	866e                	mv	a2,s11
ffffffffc020aa60:	85e6                	mv	a1,s9
ffffffffc020aa62:	8526                	mv	a0,s1
ffffffffc020aa64:	e48ff0ef          	jal	ra,ffffffffc020a0ac <sfs_dirent_read_nolock>
ffffffffc020aa68:	872a                	mv	a4,a0
ffffffffc020aa6a:	d17d                	beqz	a0,ffffffffc020aa50 <sfs_namefile+0x122>
ffffffffc020aa6c:	a82d                	j	ffffffffc020aaa6 <sfs_namefile+0x178>
ffffffffc020aa6e:	8552                	mv	a0,s4
ffffffffc020aa70:	a4ff90ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020aa74:	8562                	mv	a0,s8
ffffffffc020aa76:	0ff000ef          	jal	ra,ffffffffc020b374 <strlen>
ffffffffc020aa7a:	00150793          	addi	a5,a0,1
ffffffffc020aa7e:	862a                	mv	a2,a0
ffffffffc020aa80:	06fbe863          	bltu	s7,a5,ffffffffc020aaf0 <sfs_namefile+0x1c2>
ffffffffc020aa84:	fff64913          	not	s2,a2
ffffffffc020aa88:	995a                	add	s2,s2,s6
ffffffffc020aa8a:	85e2                	mv	a1,s8
ffffffffc020aa8c:	854a                	mv	a0,s2
ffffffffc020aa8e:	40fb8bb3          	sub	s7,s7,a5
ffffffffc020aa92:	1d7000ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc020aa96:	02f00793          	li	a5,47
ffffffffc020aa9a:	fefb0fa3          	sb	a5,-1(s6)
ffffffffc020aa9e:	89e6                	mv	s3,s9
ffffffffc020aaa0:	8b4a                	mv	s6,s2
ffffffffc020aaa2:	b721                	j	ffffffffc020a9aa <sfs_namefile+0x7c>
ffffffffc020aaa4:	5741                	li	a4,-16
ffffffffc020aaa6:	8552                	mv	a0,s4
ffffffffc020aaa8:	e03a                	sd	a4,0(sp)
ffffffffc020aaaa:	a15f90ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020aaae:	6702                	ld	a4,0(sp)
ffffffffc020aab0:	89e6                	mv	s3,s9
ffffffffc020aab2:	8dba                	mv	s11,a4
ffffffffc020aab4:	bf11                	j	ffffffffc020a9c8 <sfs_namefile+0x9a>
ffffffffc020aab6:	854e                	mv	a0,s3
ffffffffc020aab8:	de1fc0ef          	jal	ra,ffffffffc0207898 <inode_ref_dec>
ffffffffc020aabc:	64a2                	ld	s1,8(sp)
ffffffffc020aabe:	85da                	mv	a1,s6
ffffffffc020aac0:	6c98                	ld	a4,24(s1)
ffffffffc020aac2:	6088                	ld	a0,0(s1)
ffffffffc020aac4:	1779                	addi	a4,a4,-2
ffffffffc020aac6:	41770bb3          	sub	s7,a4,s7
ffffffffc020aaca:	865e                	mv	a2,s7
ffffffffc020aacc:	0505                	addi	a0,a0,1
ffffffffc020aace:	15b000ef          	jal	ra,ffffffffc020b428 <memmove>
ffffffffc020aad2:	02f00713          	li	a4,47
ffffffffc020aad6:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020aada:	955e                	add	a0,a0,s7
ffffffffc020aadc:	00050023          	sb	zero,0(a0)
ffffffffc020aae0:	85de                	mv	a1,s7
ffffffffc020aae2:	8526                	mv	a0,s1
ffffffffc020aae4:	8d3fa0ef          	jal	ra,ffffffffc02053b6 <iobuf_skip>
ffffffffc020aae8:	8522                	mv	a0,s0
ffffffffc020aaea:	d54f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020aaee:	b5dd                	j	ffffffffc020a9d4 <sfs_namefile+0xa6>
ffffffffc020aaf0:	89e6                	mv	s3,s9
ffffffffc020aaf2:	5df1                	li	s11,-4
ffffffffc020aaf4:	bdd1                	j	ffffffffc020a9c8 <sfs_namefile+0x9a>
ffffffffc020aaf6:	5df1                	li	s11,-4
ffffffffc020aaf8:	bdf1                	j	ffffffffc020a9d4 <sfs_namefile+0xa6>
ffffffffc020aafa:	00004697          	auipc	a3,0x4
ffffffffc020aafe:	66668693          	addi	a3,a3,1638 # ffffffffc020f160 <dev_node_ops+0x888>
ffffffffc020ab02:	00001617          	auipc	a2,0x1
ffffffffc020ab06:	df660613          	addi	a2,a2,-522 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020ab0a:	2f700593          	li	a1,759
ffffffffc020ab0e:	00004517          	auipc	a0,0x4
ffffffffc020ab12:	38a50513          	addi	a0,a0,906 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020ab16:	989f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab1a:	00004697          	auipc	a3,0x4
ffffffffc020ab1e:	34668693          	addi	a3,a3,838 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc020ab22:	00001617          	auipc	a2,0x1
ffffffffc020ab26:	dd660613          	addi	a2,a2,-554 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020ab2a:	2f600593          	li	a1,758
ffffffffc020ab2e:	00004517          	auipc	a0,0x4
ffffffffc020ab32:	36a50513          	addi	a0,a0,874 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020ab36:	969f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab3a:	00004697          	auipc	a3,0x4
ffffffffc020ab3e:	32668693          	addi	a3,a3,806 # ffffffffc020ee60 <dev_node_ops+0x588>
ffffffffc020ab42:	00001617          	auipc	a2,0x1
ffffffffc020ab46:	db660613          	addi	a2,a2,-586 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020ab4a:	2e300593          	li	a1,739
ffffffffc020ab4e:	00004517          	auipc	a0,0x4
ffffffffc020ab52:	34a50513          	addi	a0,a0,842 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020ab56:	949f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab5a:	00004697          	auipc	a3,0x4
ffffffffc020ab5e:	15e68693          	addi	a3,a3,350 # ffffffffc020ecb8 <dev_node_ops+0x3e0>
ffffffffc020ab62:	00001617          	auipc	a2,0x1
ffffffffc020ab66:	d9660613          	addi	a2,a2,-618 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020ab6a:	2e200593          	li	a1,738
ffffffffc020ab6e:	00004517          	auipc	a0,0x4
ffffffffc020ab72:	32a50513          	addi	a0,a0,810 # ffffffffc020ee98 <dev_node_ops+0x5c0>
ffffffffc020ab76:	929f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ab7a <sfs_rwblock_nolock>:
ffffffffc020ab7a:	7139                	addi	sp,sp,-64
ffffffffc020ab7c:	f822                	sd	s0,48(sp)
ffffffffc020ab7e:	f426                	sd	s1,40(sp)
ffffffffc020ab80:	fc06                	sd	ra,56(sp)
ffffffffc020ab82:	842a                	mv	s0,a0
ffffffffc020ab84:	84b6                	mv	s1,a3
ffffffffc020ab86:	e211                	bnez	a2,ffffffffc020ab8a <sfs_rwblock_nolock+0x10>
ffffffffc020ab88:	e715                	bnez	a4,ffffffffc020abb4 <sfs_rwblock_nolock+0x3a>
ffffffffc020ab8a:	405c                	lw	a5,4(s0)
ffffffffc020ab8c:	02f67463          	bgeu	a2,a5,ffffffffc020abb4 <sfs_rwblock_nolock+0x3a>
ffffffffc020ab90:	00c6169b          	slliw	a3,a2,0xc
ffffffffc020ab94:	1682                	slli	a3,a3,0x20
ffffffffc020ab96:	6605                	lui	a2,0x1
ffffffffc020ab98:	9281                	srli	a3,a3,0x20
ffffffffc020ab9a:	850a                	mv	a0,sp
ffffffffc020ab9c:	fa4fa0ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc020aba0:	85aa                	mv	a1,a0
ffffffffc020aba2:	7808                	ld	a0,48(s0)
ffffffffc020aba4:	8626                	mv	a2,s1
ffffffffc020aba6:	7118                	ld	a4,32(a0)
ffffffffc020aba8:	9702                	jalr	a4
ffffffffc020abaa:	70e2                	ld	ra,56(sp)
ffffffffc020abac:	7442                	ld	s0,48(sp)
ffffffffc020abae:	74a2                	ld	s1,40(sp)
ffffffffc020abb0:	6121                	addi	sp,sp,64
ffffffffc020abb2:	8082                	ret
ffffffffc020abb4:	00004697          	auipc	a3,0x4
ffffffffc020abb8:	6e468693          	addi	a3,a3,1764 # ffffffffc020f298 <sfs_node_fileops+0x80>
ffffffffc020abbc:	00001617          	auipc	a2,0x1
ffffffffc020abc0:	d3c60613          	addi	a2,a2,-708 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020abc4:	45d5                	li	a1,21
ffffffffc020abc6:	00004517          	auipc	a0,0x4
ffffffffc020abca:	70a50513          	addi	a0,a0,1802 # ffffffffc020f2d0 <sfs_node_fileops+0xb8>
ffffffffc020abce:	8d1f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020abd2 <sfs_rblock>:
ffffffffc020abd2:	7139                	addi	sp,sp,-64
ffffffffc020abd4:	ec4e                	sd	s3,24(sp)
ffffffffc020abd6:	89b6                	mv	s3,a3
ffffffffc020abd8:	f822                	sd	s0,48(sp)
ffffffffc020abda:	f04a                	sd	s2,32(sp)
ffffffffc020abdc:	e852                	sd	s4,16(sp)
ffffffffc020abde:	fc06                	sd	ra,56(sp)
ffffffffc020abe0:	f426                	sd	s1,40(sp)
ffffffffc020abe2:	e456                	sd	s5,8(sp)
ffffffffc020abe4:	8a2a                	mv	s4,a0
ffffffffc020abe6:	892e                	mv	s2,a1
ffffffffc020abe8:	8432                	mv	s0,a2
ffffffffc020abea:	2e0000ef          	jal	ra,ffffffffc020aeca <lock_sfs_io>
ffffffffc020abee:	04098063          	beqz	s3,ffffffffc020ac2e <sfs_rblock+0x5c>
ffffffffc020abf2:	013409bb          	addw	s3,s0,s3
ffffffffc020abf6:	6a85                	lui	s5,0x1
ffffffffc020abf8:	a021                	j	ffffffffc020ac00 <sfs_rblock+0x2e>
ffffffffc020abfa:	9956                	add	s2,s2,s5
ffffffffc020abfc:	02898963          	beq	s3,s0,ffffffffc020ac2e <sfs_rblock+0x5c>
ffffffffc020ac00:	8622                	mv	a2,s0
ffffffffc020ac02:	85ca                	mv	a1,s2
ffffffffc020ac04:	4705                	li	a4,1
ffffffffc020ac06:	4681                	li	a3,0
ffffffffc020ac08:	8552                	mv	a0,s4
ffffffffc020ac0a:	f71ff0ef          	jal	ra,ffffffffc020ab7a <sfs_rwblock_nolock>
ffffffffc020ac0e:	84aa                	mv	s1,a0
ffffffffc020ac10:	2405                	addiw	s0,s0,1
ffffffffc020ac12:	d565                	beqz	a0,ffffffffc020abfa <sfs_rblock+0x28>
ffffffffc020ac14:	8552                	mv	a0,s4
ffffffffc020ac16:	2c4000ef          	jal	ra,ffffffffc020aeda <unlock_sfs_io>
ffffffffc020ac1a:	70e2                	ld	ra,56(sp)
ffffffffc020ac1c:	7442                	ld	s0,48(sp)
ffffffffc020ac1e:	7902                	ld	s2,32(sp)
ffffffffc020ac20:	69e2                	ld	s3,24(sp)
ffffffffc020ac22:	6a42                	ld	s4,16(sp)
ffffffffc020ac24:	6aa2                	ld	s5,8(sp)
ffffffffc020ac26:	8526                	mv	a0,s1
ffffffffc020ac28:	74a2                	ld	s1,40(sp)
ffffffffc020ac2a:	6121                	addi	sp,sp,64
ffffffffc020ac2c:	8082                	ret
ffffffffc020ac2e:	4481                	li	s1,0
ffffffffc020ac30:	b7d5                	j	ffffffffc020ac14 <sfs_rblock+0x42>

ffffffffc020ac32 <sfs_wblock>:
ffffffffc020ac32:	7139                	addi	sp,sp,-64
ffffffffc020ac34:	ec4e                	sd	s3,24(sp)
ffffffffc020ac36:	89b6                	mv	s3,a3
ffffffffc020ac38:	f822                	sd	s0,48(sp)
ffffffffc020ac3a:	f04a                	sd	s2,32(sp)
ffffffffc020ac3c:	e852                	sd	s4,16(sp)
ffffffffc020ac3e:	fc06                	sd	ra,56(sp)
ffffffffc020ac40:	f426                	sd	s1,40(sp)
ffffffffc020ac42:	e456                	sd	s5,8(sp)
ffffffffc020ac44:	8a2a                	mv	s4,a0
ffffffffc020ac46:	892e                	mv	s2,a1
ffffffffc020ac48:	8432                	mv	s0,a2
ffffffffc020ac4a:	280000ef          	jal	ra,ffffffffc020aeca <lock_sfs_io>
ffffffffc020ac4e:	04098063          	beqz	s3,ffffffffc020ac8e <sfs_wblock+0x5c>
ffffffffc020ac52:	013409bb          	addw	s3,s0,s3
ffffffffc020ac56:	6a85                	lui	s5,0x1
ffffffffc020ac58:	a021                	j	ffffffffc020ac60 <sfs_wblock+0x2e>
ffffffffc020ac5a:	9956                	add	s2,s2,s5
ffffffffc020ac5c:	02898963          	beq	s3,s0,ffffffffc020ac8e <sfs_wblock+0x5c>
ffffffffc020ac60:	8622                	mv	a2,s0
ffffffffc020ac62:	85ca                	mv	a1,s2
ffffffffc020ac64:	4705                	li	a4,1
ffffffffc020ac66:	4685                	li	a3,1
ffffffffc020ac68:	8552                	mv	a0,s4
ffffffffc020ac6a:	f11ff0ef          	jal	ra,ffffffffc020ab7a <sfs_rwblock_nolock>
ffffffffc020ac6e:	84aa                	mv	s1,a0
ffffffffc020ac70:	2405                	addiw	s0,s0,1
ffffffffc020ac72:	d565                	beqz	a0,ffffffffc020ac5a <sfs_wblock+0x28>
ffffffffc020ac74:	8552                	mv	a0,s4
ffffffffc020ac76:	264000ef          	jal	ra,ffffffffc020aeda <unlock_sfs_io>
ffffffffc020ac7a:	70e2                	ld	ra,56(sp)
ffffffffc020ac7c:	7442                	ld	s0,48(sp)
ffffffffc020ac7e:	7902                	ld	s2,32(sp)
ffffffffc020ac80:	69e2                	ld	s3,24(sp)
ffffffffc020ac82:	6a42                	ld	s4,16(sp)
ffffffffc020ac84:	6aa2                	ld	s5,8(sp)
ffffffffc020ac86:	8526                	mv	a0,s1
ffffffffc020ac88:	74a2                	ld	s1,40(sp)
ffffffffc020ac8a:	6121                	addi	sp,sp,64
ffffffffc020ac8c:	8082                	ret
ffffffffc020ac8e:	4481                	li	s1,0
ffffffffc020ac90:	b7d5                	j	ffffffffc020ac74 <sfs_wblock+0x42>

ffffffffc020ac92 <sfs_rbuf>:
ffffffffc020ac92:	7179                	addi	sp,sp,-48
ffffffffc020ac94:	f406                	sd	ra,40(sp)
ffffffffc020ac96:	f022                	sd	s0,32(sp)
ffffffffc020ac98:	ec26                	sd	s1,24(sp)
ffffffffc020ac9a:	e84a                	sd	s2,16(sp)
ffffffffc020ac9c:	e44e                	sd	s3,8(sp)
ffffffffc020ac9e:	e052                	sd	s4,0(sp)
ffffffffc020aca0:	6785                	lui	a5,0x1
ffffffffc020aca2:	04f77863          	bgeu	a4,a5,ffffffffc020acf2 <sfs_rbuf+0x60>
ffffffffc020aca6:	84ba                	mv	s1,a4
ffffffffc020aca8:	9732                	add	a4,a4,a2
ffffffffc020acaa:	89b2                	mv	s3,a2
ffffffffc020acac:	04e7e363          	bltu	a5,a4,ffffffffc020acf2 <sfs_rbuf+0x60>
ffffffffc020acb0:	8936                	mv	s2,a3
ffffffffc020acb2:	842a                	mv	s0,a0
ffffffffc020acb4:	8a2e                	mv	s4,a1
ffffffffc020acb6:	214000ef          	jal	ra,ffffffffc020aeca <lock_sfs_io>
ffffffffc020acba:	642c                	ld	a1,72(s0)
ffffffffc020acbc:	864a                	mv	a2,s2
ffffffffc020acbe:	4705                	li	a4,1
ffffffffc020acc0:	4681                	li	a3,0
ffffffffc020acc2:	8522                	mv	a0,s0
ffffffffc020acc4:	eb7ff0ef          	jal	ra,ffffffffc020ab7a <sfs_rwblock_nolock>
ffffffffc020acc8:	892a                	mv	s2,a0
ffffffffc020acca:	cd09                	beqz	a0,ffffffffc020ace4 <sfs_rbuf+0x52>
ffffffffc020accc:	8522                	mv	a0,s0
ffffffffc020acce:	20c000ef          	jal	ra,ffffffffc020aeda <unlock_sfs_io>
ffffffffc020acd2:	70a2                	ld	ra,40(sp)
ffffffffc020acd4:	7402                	ld	s0,32(sp)
ffffffffc020acd6:	64e2                	ld	s1,24(sp)
ffffffffc020acd8:	69a2                	ld	s3,8(sp)
ffffffffc020acda:	6a02                	ld	s4,0(sp)
ffffffffc020acdc:	854a                	mv	a0,s2
ffffffffc020acde:	6942                	ld	s2,16(sp)
ffffffffc020ace0:	6145                	addi	sp,sp,48
ffffffffc020ace2:	8082                	ret
ffffffffc020ace4:	642c                	ld	a1,72(s0)
ffffffffc020ace6:	864e                	mv	a2,s3
ffffffffc020ace8:	8552                	mv	a0,s4
ffffffffc020acea:	95a6                	add	a1,a1,s1
ffffffffc020acec:	77c000ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc020acf0:	bff1                	j	ffffffffc020accc <sfs_rbuf+0x3a>
ffffffffc020acf2:	00004697          	auipc	a3,0x4
ffffffffc020acf6:	5f668693          	addi	a3,a3,1526 # ffffffffc020f2e8 <sfs_node_fileops+0xd0>
ffffffffc020acfa:	00001617          	auipc	a2,0x1
ffffffffc020acfe:	bfe60613          	addi	a2,a2,-1026 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020ad02:	05500593          	li	a1,85
ffffffffc020ad06:	00004517          	auipc	a0,0x4
ffffffffc020ad0a:	5ca50513          	addi	a0,a0,1482 # ffffffffc020f2d0 <sfs_node_fileops+0xb8>
ffffffffc020ad0e:	f90f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ad12 <sfs_wbuf>:
ffffffffc020ad12:	7139                	addi	sp,sp,-64
ffffffffc020ad14:	fc06                	sd	ra,56(sp)
ffffffffc020ad16:	f822                	sd	s0,48(sp)
ffffffffc020ad18:	f426                	sd	s1,40(sp)
ffffffffc020ad1a:	f04a                	sd	s2,32(sp)
ffffffffc020ad1c:	ec4e                	sd	s3,24(sp)
ffffffffc020ad1e:	e852                	sd	s4,16(sp)
ffffffffc020ad20:	e456                	sd	s5,8(sp)
ffffffffc020ad22:	6785                	lui	a5,0x1
ffffffffc020ad24:	06f77163          	bgeu	a4,a5,ffffffffc020ad86 <sfs_wbuf+0x74>
ffffffffc020ad28:	893a                	mv	s2,a4
ffffffffc020ad2a:	9732                	add	a4,a4,a2
ffffffffc020ad2c:	8a32                	mv	s4,a2
ffffffffc020ad2e:	04e7ec63          	bltu	a5,a4,ffffffffc020ad86 <sfs_wbuf+0x74>
ffffffffc020ad32:	842a                	mv	s0,a0
ffffffffc020ad34:	89b6                	mv	s3,a3
ffffffffc020ad36:	8aae                	mv	s5,a1
ffffffffc020ad38:	192000ef          	jal	ra,ffffffffc020aeca <lock_sfs_io>
ffffffffc020ad3c:	642c                	ld	a1,72(s0)
ffffffffc020ad3e:	4705                	li	a4,1
ffffffffc020ad40:	4681                	li	a3,0
ffffffffc020ad42:	864e                	mv	a2,s3
ffffffffc020ad44:	8522                	mv	a0,s0
ffffffffc020ad46:	e35ff0ef          	jal	ra,ffffffffc020ab7a <sfs_rwblock_nolock>
ffffffffc020ad4a:	84aa                	mv	s1,a0
ffffffffc020ad4c:	cd11                	beqz	a0,ffffffffc020ad68 <sfs_wbuf+0x56>
ffffffffc020ad4e:	8522                	mv	a0,s0
ffffffffc020ad50:	18a000ef          	jal	ra,ffffffffc020aeda <unlock_sfs_io>
ffffffffc020ad54:	70e2                	ld	ra,56(sp)
ffffffffc020ad56:	7442                	ld	s0,48(sp)
ffffffffc020ad58:	7902                	ld	s2,32(sp)
ffffffffc020ad5a:	69e2                	ld	s3,24(sp)
ffffffffc020ad5c:	6a42                	ld	s4,16(sp)
ffffffffc020ad5e:	6aa2                	ld	s5,8(sp)
ffffffffc020ad60:	8526                	mv	a0,s1
ffffffffc020ad62:	74a2                	ld	s1,40(sp)
ffffffffc020ad64:	6121                	addi	sp,sp,64
ffffffffc020ad66:	8082                	ret
ffffffffc020ad68:	6428                	ld	a0,72(s0)
ffffffffc020ad6a:	8652                	mv	a2,s4
ffffffffc020ad6c:	85d6                	mv	a1,s5
ffffffffc020ad6e:	954a                	add	a0,a0,s2
ffffffffc020ad70:	6f8000ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc020ad74:	642c                	ld	a1,72(s0)
ffffffffc020ad76:	4705                	li	a4,1
ffffffffc020ad78:	4685                	li	a3,1
ffffffffc020ad7a:	864e                	mv	a2,s3
ffffffffc020ad7c:	8522                	mv	a0,s0
ffffffffc020ad7e:	dfdff0ef          	jal	ra,ffffffffc020ab7a <sfs_rwblock_nolock>
ffffffffc020ad82:	84aa                	mv	s1,a0
ffffffffc020ad84:	b7e9                	j	ffffffffc020ad4e <sfs_wbuf+0x3c>
ffffffffc020ad86:	00004697          	auipc	a3,0x4
ffffffffc020ad8a:	56268693          	addi	a3,a3,1378 # ffffffffc020f2e8 <sfs_node_fileops+0xd0>
ffffffffc020ad8e:	00001617          	auipc	a2,0x1
ffffffffc020ad92:	b6a60613          	addi	a2,a2,-1174 # ffffffffc020b8f8 <commands+0x210>
ffffffffc020ad96:	06b00593          	li	a1,107
ffffffffc020ad9a:	00004517          	auipc	a0,0x4
ffffffffc020ad9e:	53650513          	addi	a0,a0,1334 # ffffffffc020f2d0 <sfs_node_fileops+0xb8>
ffffffffc020ada2:	efcf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ada6 <sfs_sync_super>:
ffffffffc020ada6:	1101                	addi	sp,sp,-32
ffffffffc020ada8:	ec06                	sd	ra,24(sp)
ffffffffc020adaa:	e822                	sd	s0,16(sp)
ffffffffc020adac:	e426                	sd	s1,8(sp)
ffffffffc020adae:	842a                	mv	s0,a0
ffffffffc020adb0:	11a000ef          	jal	ra,ffffffffc020aeca <lock_sfs_io>
ffffffffc020adb4:	6428                	ld	a0,72(s0)
ffffffffc020adb6:	6605                	lui	a2,0x1
ffffffffc020adb8:	4581                	li	a1,0
ffffffffc020adba:	65c000ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc020adbe:	6428                	ld	a0,72(s0)
ffffffffc020adc0:	85a2                	mv	a1,s0
ffffffffc020adc2:	02c00613          	li	a2,44
ffffffffc020adc6:	6a2000ef          	jal	ra,ffffffffc020b468 <memcpy>
ffffffffc020adca:	642c                	ld	a1,72(s0)
ffffffffc020adcc:	4701                	li	a4,0
ffffffffc020adce:	4685                	li	a3,1
ffffffffc020add0:	4601                	li	a2,0
ffffffffc020add2:	8522                	mv	a0,s0
ffffffffc020add4:	da7ff0ef          	jal	ra,ffffffffc020ab7a <sfs_rwblock_nolock>
ffffffffc020add8:	84aa                	mv	s1,a0
ffffffffc020adda:	8522                	mv	a0,s0
ffffffffc020addc:	0fe000ef          	jal	ra,ffffffffc020aeda <unlock_sfs_io>
ffffffffc020ade0:	60e2                	ld	ra,24(sp)
ffffffffc020ade2:	6442                	ld	s0,16(sp)
ffffffffc020ade4:	8526                	mv	a0,s1
ffffffffc020ade6:	64a2                	ld	s1,8(sp)
ffffffffc020ade8:	6105                	addi	sp,sp,32
ffffffffc020adea:	8082                	ret

ffffffffc020adec <sfs_sync_freemap>:
ffffffffc020adec:	7139                	addi	sp,sp,-64
ffffffffc020adee:	ec4e                	sd	s3,24(sp)
ffffffffc020adf0:	e852                	sd	s4,16(sp)
ffffffffc020adf2:	00456983          	lwu	s3,4(a0)
ffffffffc020adf6:	8a2a                	mv	s4,a0
ffffffffc020adf8:	7d08                	ld	a0,56(a0)
ffffffffc020adfa:	67a1                	lui	a5,0x8
ffffffffc020adfc:	17fd                	addi	a5,a5,-1
ffffffffc020adfe:	4581                	li	a1,0
ffffffffc020ae00:	f822                	sd	s0,48(sp)
ffffffffc020ae02:	fc06                	sd	ra,56(sp)
ffffffffc020ae04:	f426                	sd	s1,40(sp)
ffffffffc020ae06:	f04a                	sd	s2,32(sp)
ffffffffc020ae08:	e456                	sd	s5,8(sp)
ffffffffc020ae0a:	99be                	add	s3,s3,a5
ffffffffc020ae0c:	a1afe0ef          	jal	ra,ffffffffc0209026 <bitmap_getdata>
ffffffffc020ae10:	00f9d993          	srli	s3,s3,0xf
ffffffffc020ae14:	842a                	mv	s0,a0
ffffffffc020ae16:	8552                	mv	a0,s4
ffffffffc020ae18:	0b2000ef          	jal	ra,ffffffffc020aeca <lock_sfs_io>
ffffffffc020ae1c:	04098163          	beqz	s3,ffffffffc020ae5e <sfs_sync_freemap+0x72>
ffffffffc020ae20:	09b2                	slli	s3,s3,0xc
ffffffffc020ae22:	99a2                	add	s3,s3,s0
ffffffffc020ae24:	4909                	li	s2,2
ffffffffc020ae26:	6a85                	lui	s5,0x1
ffffffffc020ae28:	a021                	j	ffffffffc020ae30 <sfs_sync_freemap+0x44>
ffffffffc020ae2a:	2905                	addiw	s2,s2,1
ffffffffc020ae2c:	02898963          	beq	s3,s0,ffffffffc020ae5e <sfs_sync_freemap+0x72>
ffffffffc020ae30:	85a2                	mv	a1,s0
ffffffffc020ae32:	864a                	mv	a2,s2
ffffffffc020ae34:	4705                	li	a4,1
ffffffffc020ae36:	4685                	li	a3,1
ffffffffc020ae38:	8552                	mv	a0,s4
ffffffffc020ae3a:	d41ff0ef          	jal	ra,ffffffffc020ab7a <sfs_rwblock_nolock>
ffffffffc020ae3e:	84aa                	mv	s1,a0
ffffffffc020ae40:	9456                	add	s0,s0,s5
ffffffffc020ae42:	d565                	beqz	a0,ffffffffc020ae2a <sfs_sync_freemap+0x3e>
ffffffffc020ae44:	8552                	mv	a0,s4
ffffffffc020ae46:	094000ef          	jal	ra,ffffffffc020aeda <unlock_sfs_io>
ffffffffc020ae4a:	70e2                	ld	ra,56(sp)
ffffffffc020ae4c:	7442                	ld	s0,48(sp)
ffffffffc020ae4e:	7902                	ld	s2,32(sp)
ffffffffc020ae50:	69e2                	ld	s3,24(sp)
ffffffffc020ae52:	6a42                	ld	s4,16(sp)
ffffffffc020ae54:	6aa2                	ld	s5,8(sp)
ffffffffc020ae56:	8526                	mv	a0,s1
ffffffffc020ae58:	74a2                	ld	s1,40(sp)
ffffffffc020ae5a:	6121                	addi	sp,sp,64
ffffffffc020ae5c:	8082                	ret
ffffffffc020ae5e:	4481                	li	s1,0
ffffffffc020ae60:	b7d5                	j	ffffffffc020ae44 <sfs_sync_freemap+0x58>

ffffffffc020ae62 <sfs_clear_block>:
ffffffffc020ae62:	7179                	addi	sp,sp,-48
ffffffffc020ae64:	f022                	sd	s0,32(sp)
ffffffffc020ae66:	e84a                	sd	s2,16(sp)
ffffffffc020ae68:	e44e                	sd	s3,8(sp)
ffffffffc020ae6a:	f406                	sd	ra,40(sp)
ffffffffc020ae6c:	89b2                	mv	s3,a2
ffffffffc020ae6e:	ec26                	sd	s1,24(sp)
ffffffffc020ae70:	892a                	mv	s2,a0
ffffffffc020ae72:	842e                	mv	s0,a1
ffffffffc020ae74:	056000ef          	jal	ra,ffffffffc020aeca <lock_sfs_io>
ffffffffc020ae78:	04893503          	ld	a0,72(s2)
ffffffffc020ae7c:	6605                	lui	a2,0x1
ffffffffc020ae7e:	4581                	li	a1,0
ffffffffc020ae80:	596000ef          	jal	ra,ffffffffc020b416 <memset>
ffffffffc020ae84:	02098d63          	beqz	s3,ffffffffc020aebe <sfs_clear_block+0x5c>
ffffffffc020ae88:	013409bb          	addw	s3,s0,s3
ffffffffc020ae8c:	a019                	j	ffffffffc020ae92 <sfs_clear_block+0x30>
ffffffffc020ae8e:	02898863          	beq	s3,s0,ffffffffc020aebe <sfs_clear_block+0x5c>
ffffffffc020ae92:	04893583          	ld	a1,72(s2)
ffffffffc020ae96:	8622                	mv	a2,s0
ffffffffc020ae98:	4705                	li	a4,1
ffffffffc020ae9a:	4685                	li	a3,1
ffffffffc020ae9c:	854a                	mv	a0,s2
ffffffffc020ae9e:	cddff0ef          	jal	ra,ffffffffc020ab7a <sfs_rwblock_nolock>
ffffffffc020aea2:	84aa                	mv	s1,a0
ffffffffc020aea4:	2405                	addiw	s0,s0,1
ffffffffc020aea6:	d565                	beqz	a0,ffffffffc020ae8e <sfs_clear_block+0x2c>
ffffffffc020aea8:	854a                	mv	a0,s2
ffffffffc020aeaa:	030000ef          	jal	ra,ffffffffc020aeda <unlock_sfs_io>
ffffffffc020aeae:	70a2                	ld	ra,40(sp)
ffffffffc020aeb0:	7402                	ld	s0,32(sp)
ffffffffc020aeb2:	6942                	ld	s2,16(sp)
ffffffffc020aeb4:	69a2                	ld	s3,8(sp)
ffffffffc020aeb6:	8526                	mv	a0,s1
ffffffffc020aeb8:	64e2                	ld	s1,24(sp)
ffffffffc020aeba:	6145                	addi	sp,sp,48
ffffffffc020aebc:	8082                	ret
ffffffffc020aebe:	4481                	li	s1,0
ffffffffc020aec0:	b7e5                	j	ffffffffc020aea8 <sfs_clear_block+0x46>

ffffffffc020aec2 <lock_sfs_fs>:
ffffffffc020aec2:	05050513          	addi	a0,a0,80
ffffffffc020aec6:	dfcf906f          	j	ffffffffc02044c2 <down>

ffffffffc020aeca <lock_sfs_io>:
ffffffffc020aeca:	06850513          	addi	a0,a0,104
ffffffffc020aece:	df4f906f          	j	ffffffffc02044c2 <down>

ffffffffc020aed2 <unlock_sfs_fs>:
ffffffffc020aed2:	05050513          	addi	a0,a0,80
ffffffffc020aed6:	de8f906f          	j	ffffffffc02044be <up>

ffffffffc020aeda <unlock_sfs_io>:
ffffffffc020aeda:	06850513          	addi	a0,a0,104
ffffffffc020aede:	de0f906f          	j	ffffffffc02044be <up>

ffffffffc020aee2 <hash32>:
ffffffffc020aee2:	9e3707b7          	lui	a5,0x9e370
ffffffffc020aee6:	2785                	addiw	a5,a5,1
ffffffffc020aee8:	02a7853b          	mulw	a0,a5,a0
ffffffffc020aeec:	02000793          	li	a5,32
ffffffffc020aef0:	9f8d                	subw	a5,a5,a1
ffffffffc020aef2:	00f5553b          	srlw	a0,a0,a5
ffffffffc020aef6:	8082                	ret

ffffffffc020aef8 <printnum>:
ffffffffc020aef8:	02071893          	slli	a7,a4,0x20
ffffffffc020aefc:	7139                	addi	sp,sp,-64
ffffffffc020aefe:	0208d893          	srli	a7,a7,0x20
ffffffffc020af02:	e456                	sd	s5,8(sp)
ffffffffc020af04:	0316fab3          	remu	s5,a3,a7
ffffffffc020af08:	f822                	sd	s0,48(sp)
ffffffffc020af0a:	f426                	sd	s1,40(sp)
ffffffffc020af0c:	f04a                	sd	s2,32(sp)
ffffffffc020af0e:	ec4e                	sd	s3,24(sp)
ffffffffc020af10:	fc06                	sd	ra,56(sp)
ffffffffc020af12:	e852                	sd	s4,16(sp)
ffffffffc020af14:	84aa                	mv	s1,a0
ffffffffc020af16:	89ae                	mv	s3,a1
ffffffffc020af18:	8932                	mv	s2,a2
ffffffffc020af1a:	fff7841b          	addiw	s0,a5,-1
ffffffffc020af1e:	2a81                	sext.w	s5,s5
ffffffffc020af20:	0516f163          	bgeu	a3,a7,ffffffffc020af62 <printnum+0x6a>
ffffffffc020af24:	8a42                	mv	s4,a6
ffffffffc020af26:	00805863          	blez	s0,ffffffffc020af36 <printnum+0x3e>
ffffffffc020af2a:	347d                	addiw	s0,s0,-1
ffffffffc020af2c:	864e                	mv	a2,s3
ffffffffc020af2e:	85ca                	mv	a1,s2
ffffffffc020af30:	8552                	mv	a0,s4
ffffffffc020af32:	9482                	jalr	s1
ffffffffc020af34:	f87d                	bnez	s0,ffffffffc020af2a <printnum+0x32>
ffffffffc020af36:	1a82                	slli	s5,s5,0x20
ffffffffc020af38:	00004797          	auipc	a5,0x4
ffffffffc020af3c:	3f878793          	addi	a5,a5,1016 # ffffffffc020f330 <sfs_node_fileops+0x118>
ffffffffc020af40:	020ada93          	srli	s5,s5,0x20
ffffffffc020af44:	9abe                	add	s5,s5,a5
ffffffffc020af46:	7442                	ld	s0,48(sp)
ffffffffc020af48:	000ac503          	lbu	a0,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020af4c:	70e2                	ld	ra,56(sp)
ffffffffc020af4e:	6a42                	ld	s4,16(sp)
ffffffffc020af50:	6aa2                	ld	s5,8(sp)
ffffffffc020af52:	864e                	mv	a2,s3
ffffffffc020af54:	85ca                	mv	a1,s2
ffffffffc020af56:	69e2                	ld	s3,24(sp)
ffffffffc020af58:	7902                	ld	s2,32(sp)
ffffffffc020af5a:	87a6                	mv	a5,s1
ffffffffc020af5c:	74a2                	ld	s1,40(sp)
ffffffffc020af5e:	6121                	addi	sp,sp,64
ffffffffc020af60:	8782                	jr	a5
ffffffffc020af62:	0316d6b3          	divu	a3,a3,a7
ffffffffc020af66:	87a2                	mv	a5,s0
ffffffffc020af68:	f91ff0ef          	jal	ra,ffffffffc020aef8 <printnum>
ffffffffc020af6c:	b7e9                	j	ffffffffc020af36 <printnum+0x3e>

ffffffffc020af6e <sprintputch>:
ffffffffc020af6e:	499c                	lw	a5,16(a1)
ffffffffc020af70:	6198                	ld	a4,0(a1)
ffffffffc020af72:	6594                	ld	a3,8(a1)
ffffffffc020af74:	2785                	addiw	a5,a5,1
ffffffffc020af76:	c99c                	sw	a5,16(a1)
ffffffffc020af78:	00d77763          	bgeu	a4,a3,ffffffffc020af86 <sprintputch+0x18>
ffffffffc020af7c:	00170793          	addi	a5,a4,1
ffffffffc020af80:	e19c                	sd	a5,0(a1)
ffffffffc020af82:	00a70023          	sb	a0,0(a4)
ffffffffc020af86:	8082                	ret

ffffffffc020af88 <vprintfmt>:
ffffffffc020af88:	7119                	addi	sp,sp,-128
ffffffffc020af8a:	f4a6                	sd	s1,104(sp)
ffffffffc020af8c:	f0ca                	sd	s2,96(sp)
ffffffffc020af8e:	ecce                	sd	s3,88(sp)
ffffffffc020af90:	e8d2                	sd	s4,80(sp)
ffffffffc020af92:	e4d6                	sd	s5,72(sp)
ffffffffc020af94:	e0da                	sd	s6,64(sp)
ffffffffc020af96:	fc5e                	sd	s7,56(sp)
ffffffffc020af98:	ec6e                	sd	s11,24(sp)
ffffffffc020af9a:	fc86                	sd	ra,120(sp)
ffffffffc020af9c:	f8a2                	sd	s0,112(sp)
ffffffffc020af9e:	f862                	sd	s8,48(sp)
ffffffffc020afa0:	f466                	sd	s9,40(sp)
ffffffffc020afa2:	f06a                	sd	s10,32(sp)
ffffffffc020afa4:	89aa                	mv	s3,a0
ffffffffc020afa6:	892e                	mv	s2,a1
ffffffffc020afa8:	84b2                	mv	s1,a2
ffffffffc020afaa:	8db6                	mv	s11,a3
ffffffffc020afac:	8aba                	mv	s5,a4
ffffffffc020afae:	02500a13          	li	s4,37
ffffffffc020afb2:	5bfd                	li	s7,-1
ffffffffc020afb4:	00004b17          	auipc	s6,0x4
ffffffffc020afb8:	3a8b0b13          	addi	s6,s6,936 # ffffffffc020f35c <sfs_node_fileops+0x144>
ffffffffc020afbc:	000dc503          	lbu	a0,0(s11) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020afc0:	001d8413          	addi	s0,s11,1
ffffffffc020afc4:	01450b63          	beq	a0,s4,ffffffffc020afda <vprintfmt+0x52>
ffffffffc020afc8:	c129                	beqz	a0,ffffffffc020b00a <vprintfmt+0x82>
ffffffffc020afca:	864a                	mv	a2,s2
ffffffffc020afcc:	85a6                	mv	a1,s1
ffffffffc020afce:	0405                	addi	s0,s0,1
ffffffffc020afd0:	9982                	jalr	s3
ffffffffc020afd2:	fff44503          	lbu	a0,-1(s0)
ffffffffc020afd6:	ff4519e3          	bne	a0,s4,ffffffffc020afc8 <vprintfmt+0x40>
ffffffffc020afda:	00044583          	lbu	a1,0(s0)
ffffffffc020afde:	02000813          	li	a6,32
ffffffffc020afe2:	4d01                	li	s10,0
ffffffffc020afe4:	4301                	li	t1,0
ffffffffc020afe6:	5cfd                	li	s9,-1
ffffffffc020afe8:	5c7d                	li	s8,-1
ffffffffc020afea:	05500513          	li	a0,85
ffffffffc020afee:	48a5                	li	a7,9
ffffffffc020aff0:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020aff4:	0ff67613          	zext.b	a2,a2
ffffffffc020aff8:	00140d93          	addi	s11,s0,1
ffffffffc020affc:	04c56263          	bltu	a0,a2,ffffffffc020b040 <vprintfmt+0xb8>
ffffffffc020b000:	060a                	slli	a2,a2,0x2
ffffffffc020b002:	965a                	add	a2,a2,s6
ffffffffc020b004:	4214                	lw	a3,0(a2)
ffffffffc020b006:	96da                	add	a3,a3,s6
ffffffffc020b008:	8682                	jr	a3
ffffffffc020b00a:	70e6                	ld	ra,120(sp)
ffffffffc020b00c:	7446                	ld	s0,112(sp)
ffffffffc020b00e:	74a6                	ld	s1,104(sp)
ffffffffc020b010:	7906                	ld	s2,96(sp)
ffffffffc020b012:	69e6                	ld	s3,88(sp)
ffffffffc020b014:	6a46                	ld	s4,80(sp)
ffffffffc020b016:	6aa6                	ld	s5,72(sp)
ffffffffc020b018:	6b06                	ld	s6,64(sp)
ffffffffc020b01a:	7be2                	ld	s7,56(sp)
ffffffffc020b01c:	7c42                	ld	s8,48(sp)
ffffffffc020b01e:	7ca2                	ld	s9,40(sp)
ffffffffc020b020:	7d02                	ld	s10,32(sp)
ffffffffc020b022:	6de2                	ld	s11,24(sp)
ffffffffc020b024:	6109                	addi	sp,sp,128
ffffffffc020b026:	8082                	ret
ffffffffc020b028:	882e                	mv	a6,a1
ffffffffc020b02a:	00144583          	lbu	a1,1(s0)
ffffffffc020b02e:	846e                	mv	s0,s11
ffffffffc020b030:	00140d93          	addi	s11,s0,1
ffffffffc020b034:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b038:	0ff67613          	zext.b	a2,a2
ffffffffc020b03c:	fcc572e3          	bgeu	a0,a2,ffffffffc020b000 <vprintfmt+0x78>
ffffffffc020b040:	864a                	mv	a2,s2
ffffffffc020b042:	85a6                	mv	a1,s1
ffffffffc020b044:	02500513          	li	a0,37
ffffffffc020b048:	9982                	jalr	s3
ffffffffc020b04a:	fff44783          	lbu	a5,-1(s0)
ffffffffc020b04e:	8da2                	mv	s11,s0
ffffffffc020b050:	f74786e3          	beq	a5,s4,ffffffffc020afbc <vprintfmt+0x34>
ffffffffc020b054:	ffedc783          	lbu	a5,-2(s11)
ffffffffc020b058:	1dfd                	addi	s11,s11,-1
ffffffffc020b05a:	ff479de3          	bne	a5,s4,ffffffffc020b054 <vprintfmt+0xcc>
ffffffffc020b05e:	bfb9                	j	ffffffffc020afbc <vprintfmt+0x34>
ffffffffc020b060:	fd058c9b          	addiw	s9,a1,-48
ffffffffc020b064:	00144583          	lbu	a1,1(s0)
ffffffffc020b068:	846e                	mv	s0,s11
ffffffffc020b06a:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b06e:	0005861b          	sext.w	a2,a1
ffffffffc020b072:	02d8e463          	bltu	a7,a3,ffffffffc020b09a <vprintfmt+0x112>
ffffffffc020b076:	00144583          	lbu	a1,1(s0)
ffffffffc020b07a:	002c969b          	slliw	a3,s9,0x2
ffffffffc020b07e:	0196873b          	addw	a4,a3,s9
ffffffffc020b082:	0017171b          	slliw	a4,a4,0x1
ffffffffc020b086:	9f31                	addw	a4,a4,a2
ffffffffc020b088:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b08c:	0405                	addi	s0,s0,1
ffffffffc020b08e:	fd070c9b          	addiw	s9,a4,-48
ffffffffc020b092:	0005861b          	sext.w	a2,a1
ffffffffc020b096:	fed8f0e3          	bgeu	a7,a3,ffffffffc020b076 <vprintfmt+0xee>
ffffffffc020b09a:	f40c5be3          	bgez	s8,ffffffffc020aff0 <vprintfmt+0x68>
ffffffffc020b09e:	8c66                	mv	s8,s9
ffffffffc020b0a0:	5cfd                	li	s9,-1
ffffffffc020b0a2:	b7b9                	j	ffffffffc020aff0 <vprintfmt+0x68>
ffffffffc020b0a4:	fffc4693          	not	a3,s8
ffffffffc020b0a8:	96fd                	srai	a3,a3,0x3f
ffffffffc020b0aa:	00dc77b3          	and	a5,s8,a3
ffffffffc020b0ae:	00144583          	lbu	a1,1(s0)
ffffffffc020b0b2:	00078c1b          	sext.w	s8,a5
ffffffffc020b0b6:	846e                	mv	s0,s11
ffffffffc020b0b8:	bf25                	j	ffffffffc020aff0 <vprintfmt+0x68>
ffffffffc020b0ba:	000aac83          	lw	s9,0(s5)
ffffffffc020b0be:	00144583          	lbu	a1,1(s0)
ffffffffc020b0c2:	0aa1                	addi	s5,s5,8
ffffffffc020b0c4:	846e                	mv	s0,s11
ffffffffc020b0c6:	bfd1                	j	ffffffffc020b09a <vprintfmt+0x112>
ffffffffc020b0c8:	4705                	li	a4,1
ffffffffc020b0ca:	008a8613          	addi	a2,s5,8
ffffffffc020b0ce:	00674463          	blt	a4,t1,ffffffffc020b0d6 <vprintfmt+0x14e>
ffffffffc020b0d2:	1c030c63          	beqz	t1,ffffffffc020b2aa <vprintfmt+0x322>
ffffffffc020b0d6:	000ab683          	ld	a3,0(s5)
ffffffffc020b0da:	4741                	li	a4,16
ffffffffc020b0dc:	8ab2                	mv	s5,a2
ffffffffc020b0de:	2801                	sext.w	a6,a6
ffffffffc020b0e0:	87e2                	mv	a5,s8
ffffffffc020b0e2:	8626                	mv	a2,s1
ffffffffc020b0e4:	85ca                	mv	a1,s2
ffffffffc020b0e6:	854e                	mv	a0,s3
ffffffffc020b0e8:	e11ff0ef          	jal	ra,ffffffffc020aef8 <printnum>
ffffffffc020b0ec:	bdc1                	j	ffffffffc020afbc <vprintfmt+0x34>
ffffffffc020b0ee:	000aa503          	lw	a0,0(s5)
ffffffffc020b0f2:	864a                	mv	a2,s2
ffffffffc020b0f4:	85a6                	mv	a1,s1
ffffffffc020b0f6:	0aa1                	addi	s5,s5,8
ffffffffc020b0f8:	9982                	jalr	s3
ffffffffc020b0fa:	b5c9                	j	ffffffffc020afbc <vprintfmt+0x34>
ffffffffc020b0fc:	4705                	li	a4,1
ffffffffc020b0fe:	008a8613          	addi	a2,s5,8
ffffffffc020b102:	00674463          	blt	a4,t1,ffffffffc020b10a <vprintfmt+0x182>
ffffffffc020b106:	18030d63          	beqz	t1,ffffffffc020b2a0 <vprintfmt+0x318>
ffffffffc020b10a:	000ab683          	ld	a3,0(s5)
ffffffffc020b10e:	4729                	li	a4,10
ffffffffc020b110:	8ab2                	mv	s5,a2
ffffffffc020b112:	b7f1                	j	ffffffffc020b0de <vprintfmt+0x156>
ffffffffc020b114:	00144583          	lbu	a1,1(s0)
ffffffffc020b118:	4d05                	li	s10,1
ffffffffc020b11a:	846e                	mv	s0,s11
ffffffffc020b11c:	bdd1                	j	ffffffffc020aff0 <vprintfmt+0x68>
ffffffffc020b11e:	864a                	mv	a2,s2
ffffffffc020b120:	85a6                	mv	a1,s1
ffffffffc020b122:	02500513          	li	a0,37
ffffffffc020b126:	9982                	jalr	s3
ffffffffc020b128:	bd51                	j	ffffffffc020afbc <vprintfmt+0x34>
ffffffffc020b12a:	00144583          	lbu	a1,1(s0)
ffffffffc020b12e:	2305                	addiw	t1,t1,1
ffffffffc020b130:	846e                	mv	s0,s11
ffffffffc020b132:	bd7d                	j	ffffffffc020aff0 <vprintfmt+0x68>
ffffffffc020b134:	4705                	li	a4,1
ffffffffc020b136:	008a8613          	addi	a2,s5,8
ffffffffc020b13a:	00674463          	blt	a4,t1,ffffffffc020b142 <vprintfmt+0x1ba>
ffffffffc020b13e:	14030c63          	beqz	t1,ffffffffc020b296 <vprintfmt+0x30e>
ffffffffc020b142:	000ab683          	ld	a3,0(s5)
ffffffffc020b146:	4721                	li	a4,8
ffffffffc020b148:	8ab2                	mv	s5,a2
ffffffffc020b14a:	bf51                	j	ffffffffc020b0de <vprintfmt+0x156>
ffffffffc020b14c:	03000513          	li	a0,48
ffffffffc020b150:	864a                	mv	a2,s2
ffffffffc020b152:	85a6                	mv	a1,s1
ffffffffc020b154:	e042                	sd	a6,0(sp)
ffffffffc020b156:	9982                	jalr	s3
ffffffffc020b158:	864a                	mv	a2,s2
ffffffffc020b15a:	85a6                	mv	a1,s1
ffffffffc020b15c:	07800513          	li	a0,120
ffffffffc020b160:	9982                	jalr	s3
ffffffffc020b162:	0aa1                	addi	s5,s5,8
ffffffffc020b164:	6802                	ld	a6,0(sp)
ffffffffc020b166:	4741                	li	a4,16
ffffffffc020b168:	ff8ab683          	ld	a3,-8(s5)
ffffffffc020b16c:	bf8d                	j	ffffffffc020b0de <vprintfmt+0x156>
ffffffffc020b16e:	000ab403          	ld	s0,0(s5)
ffffffffc020b172:	008a8793          	addi	a5,s5,8
ffffffffc020b176:	e03e                	sd	a5,0(sp)
ffffffffc020b178:	14040c63          	beqz	s0,ffffffffc020b2d0 <vprintfmt+0x348>
ffffffffc020b17c:	11805063          	blez	s8,ffffffffc020b27c <vprintfmt+0x2f4>
ffffffffc020b180:	02d00693          	li	a3,45
ffffffffc020b184:	0cd81963          	bne	a6,a3,ffffffffc020b256 <vprintfmt+0x2ce>
ffffffffc020b188:	00044683          	lbu	a3,0(s0)
ffffffffc020b18c:	0006851b          	sext.w	a0,a3
ffffffffc020b190:	ce8d                	beqz	a3,ffffffffc020b1ca <vprintfmt+0x242>
ffffffffc020b192:	00140a93          	addi	s5,s0,1
ffffffffc020b196:	05e00413          	li	s0,94
ffffffffc020b19a:	000cc563          	bltz	s9,ffffffffc020b1a4 <vprintfmt+0x21c>
ffffffffc020b19e:	3cfd                	addiw	s9,s9,-1
ffffffffc020b1a0:	037c8363          	beq	s9,s7,ffffffffc020b1c6 <vprintfmt+0x23e>
ffffffffc020b1a4:	864a                	mv	a2,s2
ffffffffc020b1a6:	85a6                	mv	a1,s1
ffffffffc020b1a8:	100d0663          	beqz	s10,ffffffffc020b2b4 <vprintfmt+0x32c>
ffffffffc020b1ac:	3681                	addiw	a3,a3,-32
ffffffffc020b1ae:	10d47363          	bgeu	s0,a3,ffffffffc020b2b4 <vprintfmt+0x32c>
ffffffffc020b1b2:	03f00513          	li	a0,63
ffffffffc020b1b6:	9982                	jalr	s3
ffffffffc020b1b8:	000ac683          	lbu	a3,0(s5)
ffffffffc020b1bc:	3c7d                	addiw	s8,s8,-1
ffffffffc020b1be:	0a85                	addi	s5,s5,1
ffffffffc020b1c0:	0006851b          	sext.w	a0,a3
ffffffffc020b1c4:	faf9                	bnez	a3,ffffffffc020b19a <vprintfmt+0x212>
ffffffffc020b1c6:	01805a63          	blez	s8,ffffffffc020b1da <vprintfmt+0x252>
ffffffffc020b1ca:	3c7d                	addiw	s8,s8,-1
ffffffffc020b1cc:	864a                	mv	a2,s2
ffffffffc020b1ce:	85a6                	mv	a1,s1
ffffffffc020b1d0:	02000513          	li	a0,32
ffffffffc020b1d4:	9982                	jalr	s3
ffffffffc020b1d6:	fe0c1ae3          	bnez	s8,ffffffffc020b1ca <vprintfmt+0x242>
ffffffffc020b1da:	6a82                	ld	s5,0(sp)
ffffffffc020b1dc:	b3c5                	j	ffffffffc020afbc <vprintfmt+0x34>
ffffffffc020b1de:	4705                	li	a4,1
ffffffffc020b1e0:	008a8d13          	addi	s10,s5,8
ffffffffc020b1e4:	00674463          	blt	a4,t1,ffffffffc020b1ec <vprintfmt+0x264>
ffffffffc020b1e8:	0a030463          	beqz	t1,ffffffffc020b290 <vprintfmt+0x308>
ffffffffc020b1ec:	000ab403          	ld	s0,0(s5)
ffffffffc020b1f0:	0c044463          	bltz	s0,ffffffffc020b2b8 <vprintfmt+0x330>
ffffffffc020b1f4:	86a2                	mv	a3,s0
ffffffffc020b1f6:	8aea                	mv	s5,s10
ffffffffc020b1f8:	4729                	li	a4,10
ffffffffc020b1fa:	b5d5                	j	ffffffffc020b0de <vprintfmt+0x156>
ffffffffc020b1fc:	000aa783          	lw	a5,0(s5)
ffffffffc020b200:	46e1                	li	a3,24
ffffffffc020b202:	0aa1                	addi	s5,s5,8
ffffffffc020b204:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b208:	8fb9                	xor	a5,a5,a4
ffffffffc020b20a:	40e7873b          	subw	a4,a5,a4
ffffffffc020b20e:	02e6c663          	blt	a3,a4,ffffffffc020b23a <vprintfmt+0x2b2>
ffffffffc020b212:	00371793          	slli	a5,a4,0x3
ffffffffc020b216:	00004697          	auipc	a3,0x4
ffffffffc020b21a:	47a68693          	addi	a3,a3,1146 # ffffffffc020f690 <error_string>
ffffffffc020b21e:	97b6                	add	a5,a5,a3
ffffffffc020b220:	639c                	ld	a5,0(a5)
ffffffffc020b222:	cf81                	beqz	a5,ffffffffc020b23a <vprintfmt+0x2b2>
ffffffffc020b224:	873e                	mv	a4,a5
ffffffffc020b226:	00000697          	auipc	a3,0x0
ffffffffc020b22a:	28268693          	addi	a3,a3,642 # ffffffffc020b4a8 <etext+0x28>
ffffffffc020b22e:	8626                	mv	a2,s1
ffffffffc020b230:	85ca                	mv	a1,s2
ffffffffc020b232:	854e                	mv	a0,s3
ffffffffc020b234:	0d4000ef          	jal	ra,ffffffffc020b308 <printfmt>
ffffffffc020b238:	b351                	j	ffffffffc020afbc <vprintfmt+0x34>
ffffffffc020b23a:	00004697          	auipc	a3,0x4
ffffffffc020b23e:	11668693          	addi	a3,a3,278 # ffffffffc020f350 <sfs_node_fileops+0x138>
ffffffffc020b242:	8626                	mv	a2,s1
ffffffffc020b244:	85ca                	mv	a1,s2
ffffffffc020b246:	854e                	mv	a0,s3
ffffffffc020b248:	0c0000ef          	jal	ra,ffffffffc020b308 <printfmt>
ffffffffc020b24c:	bb85                	j	ffffffffc020afbc <vprintfmt+0x34>
ffffffffc020b24e:	00004417          	auipc	s0,0x4
ffffffffc020b252:	0fa40413          	addi	s0,s0,250 # ffffffffc020f348 <sfs_node_fileops+0x130>
ffffffffc020b256:	85e6                	mv	a1,s9
ffffffffc020b258:	8522                	mv	a0,s0
ffffffffc020b25a:	e442                	sd	a6,8(sp)
ffffffffc020b25c:	132000ef          	jal	ra,ffffffffc020b38e <strnlen>
ffffffffc020b260:	40ac0c3b          	subw	s8,s8,a0
ffffffffc020b264:	01805c63          	blez	s8,ffffffffc020b27c <vprintfmt+0x2f4>
ffffffffc020b268:	6822                	ld	a6,8(sp)
ffffffffc020b26a:	00080a9b          	sext.w	s5,a6
ffffffffc020b26e:	3c7d                	addiw	s8,s8,-1
ffffffffc020b270:	864a                	mv	a2,s2
ffffffffc020b272:	85a6                	mv	a1,s1
ffffffffc020b274:	8556                	mv	a0,s5
ffffffffc020b276:	9982                	jalr	s3
ffffffffc020b278:	fe0c1be3          	bnez	s8,ffffffffc020b26e <vprintfmt+0x2e6>
ffffffffc020b27c:	00044683          	lbu	a3,0(s0)
ffffffffc020b280:	00140a93          	addi	s5,s0,1
ffffffffc020b284:	0006851b          	sext.w	a0,a3
ffffffffc020b288:	daa9                	beqz	a3,ffffffffc020b1da <vprintfmt+0x252>
ffffffffc020b28a:	05e00413          	li	s0,94
ffffffffc020b28e:	b731                	j	ffffffffc020b19a <vprintfmt+0x212>
ffffffffc020b290:	000aa403          	lw	s0,0(s5)
ffffffffc020b294:	bfb1                	j	ffffffffc020b1f0 <vprintfmt+0x268>
ffffffffc020b296:	000ae683          	lwu	a3,0(s5)
ffffffffc020b29a:	4721                	li	a4,8
ffffffffc020b29c:	8ab2                	mv	s5,a2
ffffffffc020b29e:	b581                	j	ffffffffc020b0de <vprintfmt+0x156>
ffffffffc020b2a0:	000ae683          	lwu	a3,0(s5)
ffffffffc020b2a4:	4729                	li	a4,10
ffffffffc020b2a6:	8ab2                	mv	s5,a2
ffffffffc020b2a8:	bd1d                	j	ffffffffc020b0de <vprintfmt+0x156>
ffffffffc020b2aa:	000ae683          	lwu	a3,0(s5)
ffffffffc020b2ae:	4741                	li	a4,16
ffffffffc020b2b0:	8ab2                	mv	s5,a2
ffffffffc020b2b2:	b535                	j	ffffffffc020b0de <vprintfmt+0x156>
ffffffffc020b2b4:	9982                	jalr	s3
ffffffffc020b2b6:	b709                	j	ffffffffc020b1b8 <vprintfmt+0x230>
ffffffffc020b2b8:	864a                	mv	a2,s2
ffffffffc020b2ba:	85a6                	mv	a1,s1
ffffffffc020b2bc:	02d00513          	li	a0,45
ffffffffc020b2c0:	e042                	sd	a6,0(sp)
ffffffffc020b2c2:	9982                	jalr	s3
ffffffffc020b2c4:	6802                	ld	a6,0(sp)
ffffffffc020b2c6:	8aea                	mv	s5,s10
ffffffffc020b2c8:	408006b3          	neg	a3,s0
ffffffffc020b2cc:	4729                	li	a4,10
ffffffffc020b2ce:	bd01                	j	ffffffffc020b0de <vprintfmt+0x156>
ffffffffc020b2d0:	03805163          	blez	s8,ffffffffc020b2f2 <vprintfmt+0x36a>
ffffffffc020b2d4:	02d00693          	li	a3,45
ffffffffc020b2d8:	f6d81be3          	bne	a6,a3,ffffffffc020b24e <vprintfmt+0x2c6>
ffffffffc020b2dc:	00004417          	auipc	s0,0x4
ffffffffc020b2e0:	06c40413          	addi	s0,s0,108 # ffffffffc020f348 <sfs_node_fileops+0x130>
ffffffffc020b2e4:	02800693          	li	a3,40
ffffffffc020b2e8:	02800513          	li	a0,40
ffffffffc020b2ec:	00140a93          	addi	s5,s0,1
ffffffffc020b2f0:	b55d                	j	ffffffffc020b196 <vprintfmt+0x20e>
ffffffffc020b2f2:	00004a97          	auipc	s5,0x4
ffffffffc020b2f6:	057a8a93          	addi	s5,s5,87 # ffffffffc020f349 <sfs_node_fileops+0x131>
ffffffffc020b2fa:	02800513          	li	a0,40
ffffffffc020b2fe:	02800693          	li	a3,40
ffffffffc020b302:	05e00413          	li	s0,94
ffffffffc020b306:	bd51                	j	ffffffffc020b19a <vprintfmt+0x212>

ffffffffc020b308 <printfmt>:
ffffffffc020b308:	7139                	addi	sp,sp,-64
ffffffffc020b30a:	02010313          	addi	t1,sp,32
ffffffffc020b30e:	f03a                	sd	a4,32(sp)
ffffffffc020b310:	871a                	mv	a4,t1
ffffffffc020b312:	ec06                	sd	ra,24(sp)
ffffffffc020b314:	f43e                	sd	a5,40(sp)
ffffffffc020b316:	f842                	sd	a6,48(sp)
ffffffffc020b318:	fc46                	sd	a7,56(sp)
ffffffffc020b31a:	e41a                	sd	t1,8(sp)
ffffffffc020b31c:	c6dff0ef          	jal	ra,ffffffffc020af88 <vprintfmt>
ffffffffc020b320:	60e2                	ld	ra,24(sp)
ffffffffc020b322:	6121                	addi	sp,sp,64
ffffffffc020b324:	8082                	ret

ffffffffc020b326 <snprintf>:
ffffffffc020b326:	711d                	addi	sp,sp,-96
ffffffffc020b328:	15fd                	addi	a1,a1,-1
ffffffffc020b32a:	03810313          	addi	t1,sp,56
ffffffffc020b32e:	95aa                	add	a1,a1,a0
ffffffffc020b330:	f406                	sd	ra,40(sp)
ffffffffc020b332:	fc36                	sd	a3,56(sp)
ffffffffc020b334:	e0ba                	sd	a4,64(sp)
ffffffffc020b336:	e4be                	sd	a5,72(sp)
ffffffffc020b338:	e8c2                	sd	a6,80(sp)
ffffffffc020b33a:	ecc6                	sd	a7,88(sp)
ffffffffc020b33c:	e01a                	sd	t1,0(sp)
ffffffffc020b33e:	e42a                	sd	a0,8(sp)
ffffffffc020b340:	e82e                	sd	a1,16(sp)
ffffffffc020b342:	cc02                	sw	zero,24(sp)
ffffffffc020b344:	c515                	beqz	a0,ffffffffc020b370 <snprintf+0x4a>
ffffffffc020b346:	02a5e563          	bltu	a1,a0,ffffffffc020b370 <snprintf+0x4a>
ffffffffc020b34a:	75dd                	lui	a1,0xffff7
ffffffffc020b34c:	86b2                	mv	a3,a2
ffffffffc020b34e:	00000517          	auipc	a0,0x0
ffffffffc020b352:	c2050513          	addi	a0,a0,-992 # ffffffffc020af6e <sprintputch>
ffffffffc020b356:	871a                	mv	a4,t1
ffffffffc020b358:	0030                	addi	a2,sp,8
ffffffffc020b35a:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc020b35e:	c2bff0ef          	jal	ra,ffffffffc020af88 <vprintfmt>
ffffffffc020b362:	67a2                	ld	a5,8(sp)
ffffffffc020b364:	00078023          	sb	zero,0(a5)
ffffffffc020b368:	4562                	lw	a0,24(sp)
ffffffffc020b36a:	70a2                	ld	ra,40(sp)
ffffffffc020b36c:	6125                	addi	sp,sp,96
ffffffffc020b36e:	8082                	ret
ffffffffc020b370:	5575                	li	a0,-3
ffffffffc020b372:	bfe5                	j	ffffffffc020b36a <snprintf+0x44>

ffffffffc020b374 <strlen>:
ffffffffc020b374:	00054783          	lbu	a5,0(a0)
ffffffffc020b378:	872a                	mv	a4,a0
ffffffffc020b37a:	4501                	li	a0,0
ffffffffc020b37c:	cb81                	beqz	a5,ffffffffc020b38c <strlen+0x18>
ffffffffc020b37e:	0505                	addi	a0,a0,1
ffffffffc020b380:	00a707b3          	add	a5,a4,a0
ffffffffc020b384:	0007c783          	lbu	a5,0(a5)
ffffffffc020b388:	fbfd                	bnez	a5,ffffffffc020b37e <strlen+0xa>
ffffffffc020b38a:	8082                	ret
ffffffffc020b38c:	8082                	ret

ffffffffc020b38e <strnlen>:
ffffffffc020b38e:	4781                	li	a5,0
ffffffffc020b390:	e589                	bnez	a1,ffffffffc020b39a <strnlen+0xc>
ffffffffc020b392:	a811                	j	ffffffffc020b3a6 <strnlen+0x18>
ffffffffc020b394:	0785                	addi	a5,a5,1
ffffffffc020b396:	00f58863          	beq	a1,a5,ffffffffc020b3a6 <strnlen+0x18>
ffffffffc020b39a:	00f50733          	add	a4,a0,a5
ffffffffc020b39e:	00074703          	lbu	a4,0(a4)
ffffffffc020b3a2:	fb6d                	bnez	a4,ffffffffc020b394 <strnlen+0x6>
ffffffffc020b3a4:	85be                	mv	a1,a5
ffffffffc020b3a6:	852e                	mv	a0,a1
ffffffffc020b3a8:	8082                	ret

ffffffffc020b3aa <strcpy>:
ffffffffc020b3aa:	87aa                	mv	a5,a0
ffffffffc020b3ac:	0005c703          	lbu	a4,0(a1)
ffffffffc020b3b0:	0785                	addi	a5,a5,1
ffffffffc020b3b2:	0585                	addi	a1,a1,1
ffffffffc020b3b4:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b3b8:	fb75                	bnez	a4,ffffffffc020b3ac <strcpy+0x2>
ffffffffc020b3ba:	8082                	ret

ffffffffc020b3bc <strcmp>:
ffffffffc020b3bc:	00054783          	lbu	a5,0(a0)
ffffffffc020b3c0:	0005c703          	lbu	a4,0(a1)
ffffffffc020b3c4:	cb89                	beqz	a5,ffffffffc020b3d6 <strcmp+0x1a>
ffffffffc020b3c6:	0505                	addi	a0,a0,1
ffffffffc020b3c8:	0585                	addi	a1,a1,1
ffffffffc020b3ca:	fee789e3          	beq	a5,a4,ffffffffc020b3bc <strcmp>
ffffffffc020b3ce:	0007851b          	sext.w	a0,a5
ffffffffc020b3d2:	9d19                	subw	a0,a0,a4
ffffffffc020b3d4:	8082                	ret
ffffffffc020b3d6:	4501                	li	a0,0
ffffffffc020b3d8:	bfed                	j	ffffffffc020b3d2 <strcmp+0x16>

ffffffffc020b3da <strncmp>:
ffffffffc020b3da:	c20d                	beqz	a2,ffffffffc020b3fc <strncmp+0x22>
ffffffffc020b3dc:	962e                	add	a2,a2,a1
ffffffffc020b3de:	a031                	j	ffffffffc020b3ea <strncmp+0x10>
ffffffffc020b3e0:	0505                	addi	a0,a0,1
ffffffffc020b3e2:	00e79a63          	bne	a5,a4,ffffffffc020b3f6 <strncmp+0x1c>
ffffffffc020b3e6:	00b60b63          	beq	a2,a1,ffffffffc020b3fc <strncmp+0x22>
ffffffffc020b3ea:	00054783          	lbu	a5,0(a0)
ffffffffc020b3ee:	0585                	addi	a1,a1,1
ffffffffc020b3f0:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020b3f4:	f7f5                	bnez	a5,ffffffffc020b3e0 <strncmp+0x6>
ffffffffc020b3f6:	40e7853b          	subw	a0,a5,a4
ffffffffc020b3fa:	8082                	ret
ffffffffc020b3fc:	4501                	li	a0,0
ffffffffc020b3fe:	8082                	ret

ffffffffc020b400 <strchr>:
ffffffffc020b400:	00054783          	lbu	a5,0(a0)
ffffffffc020b404:	c799                	beqz	a5,ffffffffc020b412 <strchr+0x12>
ffffffffc020b406:	00f58763          	beq	a1,a5,ffffffffc020b414 <strchr+0x14>
ffffffffc020b40a:	00154783          	lbu	a5,1(a0)
ffffffffc020b40e:	0505                	addi	a0,a0,1
ffffffffc020b410:	fbfd                	bnez	a5,ffffffffc020b406 <strchr+0x6>
ffffffffc020b412:	4501                	li	a0,0
ffffffffc020b414:	8082                	ret

ffffffffc020b416 <memset>:
ffffffffc020b416:	ca01                	beqz	a2,ffffffffc020b426 <memset+0x10>
ffffffffc020b418:	962a                	add	a2,a2,a0
ffffffffc020b41a:	87aa                	mv	a5,a0
ffffffffc020b41c:	0785                	addi	a5,a5,1
ffffffffc020b41e:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020b422:	fec79de3          	bne	a5,a2,ffffffffc020b41c <memset+0x6>
ffffffffc020b426:	8082                	ret

ffffffffc020b428 <memmove>:
ffffffffc020b428:	02a5f263          	bgeu	a1,a0,ffffffffc020b44c <memmove+0x24>
ffffffffc020b42c:	00c587b3          	add	a5,a1,a2
ffffffffc020b430:	00f57e63          	bgeu	a0,a5,ffffffffc020b44c <memmove+0x24>
ffffffffc020b434:	00c50733          	add	a4,a0,a2
ffffffffc020b438:	c615                	beqz	a2,ffffffffc020b464 <memmove+0x3c>
ffffffffc020b43a:	fff7c683          	lbu	a3,-1(a5)
ffffffffc020b43e:	17fd                	addi	a5,a5,-1
ffffffffc020b440:	177d                	addi	a4,a4,-1
ffffffffc020b442:	00d70023          	sb	a3,0(a4)
ffffffffc020b446:	fef59ae3          	bne	a1,a5,ffffffffc020b43a <memmove+0x12>
ffffffffc020b44a:	8082                	ret
ffffffffc020b44c:	00c586b3          	add	a3,a1,a2
ffffffffc020b450:	87aa                	mv	a5,a0
ffffffffc020b452:	ca11                	beqz	a2,ffffffffc020b466 <memmove+0x3e>
ffffffffc020b454:	0005c703          	lbu	a4,0(a1)
ffffffffc020b458:	0585                	addi	a1,a1,1
ffffffffc020b45a:	0785                	addi	a5,a5,1
ffffffffc020b45c:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b460:	fed59ae3          	bne	a1,a3,ffffffffc020b454 <memmove+0x2c>
ffffffffc020b464:	8082                	ret
ffffffffc020b466:	8082                	ret

ffffffffc020b468 <memcpy>:
ffffffffc020b468:	ca19                	beqz	a2,ffffffffc020b47e <memcpy+0x16>
ffffffffc020b46a:	962e                	add	a2,a2,a1
ffffffffc020b46c:	87aa                	mv	a5,a0
ffffffffc020b46e:	0005c703          	lbu	a4,0(a1)
ffffffffc020b472:	0585                	addi	a1,a1,1
ffffffffc020b474:	0785                	addi	a5,a5,1
ffffffffc020b476:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b47a:	fec59ae3          	bne	a1,a2,ffffffffc020b46e <memcpy+0x6>
ffffffffc020b47e:	8082                	ret
