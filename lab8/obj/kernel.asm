
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
ffffffffc0200062:	4620b0ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0200066:	52c000ef          	jal	ra,ffffffffc0200592 <cons_init>
ffffffffc020006a:	0000b597          	auipc	a1,0xb
ffffffffc020006e:	4c658593          	addi	a1,a1,1222 # ffffffffc020b530 <etext+0x2>
ffffffffc0200072:	0000b517          	auipc	a0,0xb
ffffffffc0200076:	4de50513          	addi	a0,a0,1246 # ffffffffc020b550 <etext+0x22>
ffffffffc020007a:	12c000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ae000ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc0200082:	62a000ef          	jal	ra,ffffffffc02006ac <dtb_init>
ffffffffc0200086:	24b020ef          	jal	ra,ffffffffc0202ad0 <pmm_init>
ffffffffc020008a:	3ef000ef          	jal	ra,ffffffffc0200c78 <pic_init>
ffffffffc020008e:	515000ef          	jal	ra,ffffffffc0200da2 <idt_init>
ffffffffc0200092:	6d7030ef          	jal	ra,ffffffffc0203f68 <vmm_init>
ffffffffc0200096:	1b0070ef          	jal	ra,ffffffffc0207246 <sched_init>
ffffffffc020009a:	5b7060ef          	jal	ra,ffffffffc0206e50 <proc_init>
ffffffffc020009e:	1bf000ef          	jal	ra,ffffffffc0200a5c <ide_init>
ffffffffc02000a2:	108050ef          	jal	ra,ffffffffc02051aa <fs_init>
ffffffffc02000a6:	4a4000ef          	jal	ra,ffffffffc020054a <clock_init>
ffffffffc02000aa:	3c3000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02000ae:	76f060ef          	jal	ra,ffffffffc020701c <cpu_idle>

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
ffffffffc02000cc:	49050513          	addi	a0,a0,1168 # ffffffffc020b558 <etext+0x2a>
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
ffffffffc020019a:	69d0a0ef          	jal	ra,ffffffffc020b036 <vprintfmt>
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
ffffffffc02001d6:	6610a0ef          	jal	ra,ffffffffc020b036 <vprintfmt>
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
ffffffffc0200200:	2220b0ef          	jal	ra,ffffffffc020b422 <strlen>
ffffffffc0200204:	842a                	mv	s0,a0
ffffffffc0200206:	0505                	addi	a0,a0,1
ffffffffc0200208:	587010ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020020c:	84aa                	mv	s1,a0
ffffffffc020020e:	c901                	beqz	a0,ffffffffc020021e <strdup+0x2a>
ffffffffc0200210:	8622                	mv	a2,s0
ffffffffc0200212:	85ca                	mv	a1,s2
ffffffffc0200214:	9426                	add	s0,s0,s1
ffffffffc0200216:	3000b0ef          	jal	ra,ffffffffc020b516 <memcpy>
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
ffffffffc0200232:	33250513          	addi	a0,a0,818 # ffffffffc020b560 <etext+0x32>
ffffffffc0200236:	e406                	sd	ra,8(sp)
ffffffffc0200238:	f6fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020023c:	00000597          	auipc	a1,0x0
ffffffffc0200240:	e0e58593          	addi	a1,a1,-498 # ffffffffc020004a <kern_init>
ffffffffc0200244:	0000b517          	auipc	a0,0xb
ffffffffc0200248:	33c50513          	addi	a0,a0,828 # ffffffffc020b580 <etext+0x52>
ffffffffc020024c:	f5bff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200250:	0000b597          	auipc	a1,0xb
ffffffffc0200254:	2de58593          	addi	a1,a1,734 # ffffffffc020b52e <etext>
ffffffffc0200258:	0000b517          	auipc	a0,0xb
ffffffffc020025c:	34850513          	addi	a0,a0,840 # ffffffffc020b5a0 <etext+0x72>
ffffffffc0200260:	f47ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200264:	00091597          	auipc	a1,0x91
ffffffffc0200268:	dfc58593          	addi	a1,a1,-516 # ffffffffc0291060 <buf>
ffffffffc020026c:	0000b517          	auipc	a0,0xb
ffffffffc0200270:	35450513          	addi	a0,a0,852 # ffffffffc020b5c0 <etext+0x92>
ffffffffc0200274:	f33ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200278:	00096597          	auipc	a1,0x96
ffffffffc020027c:	69858593          	addi	a1,a1,1688 # ffffffffc0296910 <end>
ffffffffc0200280:	0000b517          	auipc	a0,0xb
ffffffffc0200284:	36050513          	addi	a0,a0,864 # ffffffffc020b5e0 <etext+0xb2>
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
ffffffffc02002b2:	35250513          	addi	a0,a0,850 # ffffffffc020b600 <etext+0xd2>
ffffffffc02002b6:	0141                	addi	sp,sp,16
ffffffffc02002b8:	b5fd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002ba <print_stackframe>:
ffffffffc02002ba:	1141                	addi	sp,sp,-16
ffffffffc02002bc:	0000b617          	auipc	a2,0xb
ffffffffc02002c0:	37460613          	addi	a2,a2,884 # ffffffffc020b630 <etext+0x102>
ffffffffc02002c4:	04e00593          	li	a1,78
ffffffffc02002c8:	0000b517          	auipc	a0,0xb
ffffffffc02002cc:	38050513          	addi	a0,a0,896 # ffffffffc020b648 <etext+0x11a>
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	1cc000ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02002d6 <mon_help>:
ffffffffc02002d6:	1141                	addi	sp,sp,-16
ffffffffc02002d8:	0000b617          	auipc	a2,0xb
ffffffffc02002dc:	38860613          	addi	a2,a2,904 # ffffffffc020b660 <etext+0x132>
ffffffffc02002e0:	0000b597          	auipc	a1,0xb
ffffffffc02002e4:	3a058593          	addi	a1,a1,928 # ffffffffc020b680 <etext+0x152>
ffffffffc02002e8:	0000b517          	auipc	a0,0xb
ffffffffc02002ec:	3a050513          	addi	a0,a0,928 # ffffffffc020b688 <etext+0x15a>
ffffffffc02002f0:	e406                	sd	ra,8(sp)
ffffffffc02002f2:	eb5ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02002f6:	0000b617          	auipc	a2,0xb
ffffffffc02002fa:	3a260613          	addi	a2,a2,930 # ffffffffc020b698 <etext+0x16a>
ffffffffc02002fe:	0000b597          	auipc	a1,0xb
ffffffffc0200302:	3c258593          	addi	a1,a1,962 # ffffffffc020b6c0 <etext+0x192>
ffffffffc0200306:	0000b517          	auipc	a0,0xb
ffffffffc020030a:	38250513          	addi	a0,a0,898 # ffffffffc020b688 <etext+0x15a>
ffffffffc020030e:	e99ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200312:	0000b617          	auipc	a2,0xb
ffffffffc0200316:	3be60613          	addi	a2,a2,958 # ffffffffc020b6d0 <etext+0x1a2>
ffffffffc020031a:	0000b597          	auipc	a1,0xb
ffffffffc020031e:	3d658593          	addi	a1,a1,982 # ffffffffc020b6f0 <etext+0x1c2>
ffffffffc0200322:	0000b517          	auipc	a0,0xb
ffffffffc0200326:	36650513          	addi	a0,a0,870 # ffffffffc020b688 <etext+0x15a>
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
ffffffffc0200360:	3a450513          	addi	a0,a0,932 # ffffffffc020b700 <etext+0x1d2>
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
ffffffffc0200382:	3aa50513          	addi	a0,a0,938 # ffffffffc020b728 <etext+0x1fa>
ffffffffc0200386:	e21ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020038a:	000b8563          	beqz	s7,ffffffffc0200394 <kmonitor+0x3e>
ffffffffc020038e:	855e                	mv	a0,s7
ffffffffc0200390:	3fb000ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0200394:	0000bc17          	auipc	s8,0xb
ffffffffc0200398:	404c0c13          	addi	s8,s8,1028 # ffffffffc020b798 <commands>
ffffffffc020039c:	0000b917          	auipc	s2,0xb
ffffffffc02003a0:	3b490913          	addi	s2,s2,948 # ffffffffc020b750 <etext+0x222>
ffffffffc02003a4:	0000b497          	auipc	s1,0xb
ffffffffc02003a8:	3b448493          	addi	s1,s1,948 # ffffffffc020b758 <etext+0x22a>
ffffffffc02003ac:	49bd                	li	s3,15
ffffffffc02003ae:	0000bb17          	auipc	s6,0xb
ffffffffc02003b2:	3b2b0b13          	addi	s6,s6,946 # ffffffffc020b760 <etext+0x232>
ffffffffc02003b6:	0000ba17          	auipc	s4,0xb
ffffffffc02003ba:	2caa0a13          	addi	s4,s4,714 # ffffffffc020b680 <etext+0x152>
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
ffffffffc02003dc:	3c0d0d13          	addi	s10,s10,960 # ffffffffc020b798 <commands>
ffffffffc02003e0:	8552                	mv	a0,s4
ffffffffc02003e2:	4401                	li	s0,0
ffffffffc02003e4:	0d61                	addi	s10,s10,24
ffffffffc02003e6:	0840b0ef          	jal	ra,ffffffffc020b46a <strcmp>
ffffffffc02003ea:	c919                	beqz	a0,ffffffffc0200400 <kmonitor+0xaa>
ffffffffc02003ec:	2405                	addiw	s0,s0,1
ffffffffc02003ee:	0b540063          	beq	s0,s5,ffffffffc020048e <kmonitor+0x138>
ffffffffc02003f2:	000d3503          	ld	a0,0(s10)
ffffffffc02003f6:	6582                	ld	a1,0(sp)
ffffffffc02003f8:	0d61                	addi	s10,s10,24
ffffffffc02003fa:	0700b0ef          	jal	ra,ffffffffc020b46a <strcmp>
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
ffffffffc0200438:	0760b0ef          	jal	ra,ffffffffc020b4ae <strchr>
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
ffffffffc0200476:	0380b0ef          	jal	ra,ffffffffc020b4ae <strchr>
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
ffffffffc0200494:	2f050513          	addi	a0,a0,752 # ffffffffc020b780 <etext+0x252>
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
ffffffffc02004d0:	31450513          	addi	a0,a0,788 # ffffffffc020b7e0 <commands+0x48>
ffffffffc02004d4:	e43e                	sd	a5,8(sp)
ffffffffc02004d6:	cd1ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004da:	65a2                	ld	a1,8(sp)
ffffffffc02004dc:	8522                	mv	a0,s0
ffffffffc02004de:	ca3ff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc02004e2:	0000c517          	auipc	a0,0xc
ffffffffc02004e6:	5be50513          	addi	a0,a0,1470 # ffffffffc020caa0 <default_pmm_manager+0x610>
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
ffffffffc020051a:	2ea50513          	addi	a0,a0,746 # ffffffffc020b800 <commands+0x68>
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
ffffffffc020053a:	56a50513          	addi	a0,a0,1386 # ffffffffc020caa0 <default_pmm_manager+0x610>
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
ffffffffc020056c:	2b850513          	addi	a0,a0,696 # ffffffffc020b820 <commands+0x88>
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
ffffffffc02006b2:	19250513          	addi	a0,a0,402 # ffffffffc020b840 <commands+0xa8>
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
ffffffffc02006e0:	17450513          	addi	a0,a0,372 # ffffffffc020b850 <commands+0xb8>
ffffffffc02006e4:	ac3ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006e8:	00014417          	auipc	s0,0x14
ffffffffc02006ec:	92040413          	addi	s0,s0,-1760 # ffffffffc0214008 <boot_dtb>
ffffffffc02006f0:	600c                	ld	a1,0(s0)
ffffffffc02006f2:	0000b517          	auipc	a0,0xb
ffffffffc02006f6:	16e50513          	addi	a0,a0,366 # ffffffffc020b860 <commands+0xc8>
ffffffffc02006fa:	aadff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006fe:	00043a03          	ld	s4,0(s0)
ffffffffc0200702:	0000b517          	auipc	a0,0xb
ffffffffc0200706:	17650513          	addi	a0,a0,374 # ffffffffc020b878 <commands+0xe0>
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
ffffffffc02007c0:	10c90913          	addi	s2,s2,268 # ffffffffc020b8c8 <commands+0x130>
ffffffffc02007c4:	49bd                	li	s3,15
ffffffffc02007c6:	4d91                	li	s11,4
ffffffffc02007c8:	4d05                	li	s10,1
ffffffffc02007ca:	0000b497          	auipc	s1,0xb
ffffffffc02007ce:	0f648493          	addi	s1,s1,246 # ffffffffc020b8c0 <commands+0x128>
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
ffffffffc0200822:	12250513          	addi	a0,a0,290 # ffffffffc020b940 <commands+0x1a8>
ffffffffc0200826:	981ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020082a:	0000b517          	auipc	a0,0xb
ffffffffc020082e:	14e50513          	addi	a0,a0,334 # ffffffffc020b978 <commands+0x1e0>
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
ffffffffc020086e:	02e50513          	addi	a0,a0,46 # ffffffffc020b898 <commands+0x100>
ffffffffc0200872:	6109                	addi	sp,sp,128
ffffffffc0200874:	ba0d                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200876:	8556                	mv	a0,s5
ffffffffc0200878:	3ab0a0ef          	jal	ra,ffffffffc020b422 <strlen>
ffffffffc020087c:	8a2a                	mv	s4,a0
ffffffffc020087e:	4619                	li	a2,6
ffffffffc0200880:	85a6                	mv	a1,s1
ffffffffc0200882:	8556                	mv	a0,s5
ffffffffc0200884:	2a01                	sext.w	s4,s4
ffffffffc0200886:	4030a0ef          	jal	ra,ffffffffc020b488 <strncmp>
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
ffffffffc020091c:	34f0a0ef          	jal	ra,ffffffffc020b46a <strcmp>
ffffffffc0200920:	66a2                	ld	a3,8(sp)
ffffffffc0200922:	f94d                	bnez	a0,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200924:	fb59f8e3          	bgeu	s3,s5,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200928:	00ca3783          	ld	a5,12(s4)
ffffffffc020092c:	014a3703          	ld	a4,20(s4)
ffffffffc0200930:	0000b517          	auipc	a0,0xb
ffffffffc0200934:	fa050513          	addi	a0,a0,-96 # ffffffffc020b8d0 <commands+0x138>
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
ffffffffc0200a02:	ef250513          	addi	a0,a0,-270 # ffffffffc020b8f0 <commands+0x158>
ffffffffc0200a06:	fa0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a0a:	014b5613          	srli	a2,s6,0x14
ffffffffc0200a0e:	85da                	mv	a1,s6
ffffffffc0200a10:	0000b517          	auipc	a0,0xb
ffffffffc0200a14:	ef850513          	addi	a0,a0,-264 # ffffffffc020b908 <commands+0x170>
ffffffffc0200a18:	f8eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a1c:	008b05b3          	add	a1,s6,s0
ffffffffc0200a20:	15fd                	addi	a1,a1,-1
ffffffffc0200a22:	0000b517          	auipc	a0,0xb
ffffffffc0200a26:	f0650513          	addi	a0,a0,-250 # ffffffffc020b928 <commands+0x190>
ffffffffc0200a2a:	f7cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a2e:	0000b517          	auipc	a0,0xb
ffffffffc0200a32:	f4a50513          	addi	a0,a0,-182 # ffffffffc020b978 <commands+0x1e0>
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
ffffffffc0200abc:	ed868693          	addi	a3,a3,-296 # ffffffffc020b990 <commands+0x1f8>
ffffffffc0200ac0:	0000b617          	auipc	a2,0xb
ffffffffc0200ac4:	ee860613          	addi	a2,a2,-280 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0200ac8:	45c5                	li	a1,17
ffffffffc0200aca:	0000b517          	auipc	a0,0xb
ffffffffc0200ace:	ef650513          	addi	a0,a0,-266 # ffffffffc020b9c0 <commands+0x228>
ffffffffc0200ad2:	9cdff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200ad6:	0000b697          	auipc	a3,0xb
ffffffffc0200ada:	f0268693          	addi	a3,a3,-254 # ffffffffc020b9d8 <commands+0x240>
ffffffffc0200ade:	0000b617          	auipc	a2,0xb
ffffffffc0200ae2:	eca60613          	addi	a2,a2,-310 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0200ae6:	45d1                	li	a1,20
ffffffffc0200ae8:	0000b517          	auipc	a0,0xb
ffffffffc0200aec:	ed850513          	addi	a0,a0,-296 # ffffffffc020b9c0 <commands+0x228>
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
ffffffffc0200b9a:	e5a68693          	addi	a3,a3,-422 # ffffffffc020b9f0 <commands+0x258>
ffffffffc0200b9e:	0000b617          	auipc	a2,0xb
ffffffffc0200ba2:	e0a60613          	addi	a2,a2,-502 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0200ba6:	02200593          	li	a1,34
ffffffffc0200baa:	0000b517          	auipc	a0,0xb
ffffffffc0200bae:	e1650513          	addi	a0,a0,-490 # ffffffffc020b9c0 <commands+0x228>
ffffffffc0200bb2:	8edff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200bb6:	0000b697          	auipc	a3,0xb
ffffffffc0200bba:	e6268693          	addi	a3,a3,-414 # ffffffffc020ba18 <commands+0x280>
ffffffffc0200bbe:	0000b617          	auipc	a2,0xb
ffffffffc0200bc2:	dea60613          	addi	a2,a2,-534 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0200bc6:	02300593          	li	a1,35
ffffffffc0200bca:	0000b517          	auipc	a0,0xb
ffffffffc0200bce:	df650513          	addi	a0,a0,-522 # ffffffffc020b9c0 <commands+0x228>
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
ffffffffc0200c30:	dc468693          	addi	a3,a3,-572 # ffffffffc020b9f0 <commands+0x258>
ffffffffc0200c34:	0000b617          	auipc	a2,0xb
ffffffffc0200c38:	d7460613          	addi	a2,a2,-652 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0200c3c:	02900593          	li	a1,41
ffffffffc0200c40:	0000b517          	auipc	a0,0xb
ffffffffc0200c44:	d8050513          	addi	a0,a0,-640 # ffffffffc020b9c0 <commands+0x228>
ffffffffc0200c48:	857ff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200c4c:	0000b697          	auipc	a3,0xb
ffffffffc0200c50:	dcc68693          	addi	a3,a3,-564 # ffffffffc020ba18 <commands+0x280>
ffffffffc0200c54:	0000b617          	auipc	a2,0xb
ffffffffc0200c58:	d5460613          	addi	a2,a2,-684 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0200c5c:	02a00593          	li	a1,42
ffffffffc0200c60:	0000b517          	auipc	a0,0xb
ffffffffc0200c64:	d6050513          	addi	a0,a0,-672 # ffffffffc020b9c0 <commands+0x228>
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
ffffffffc0200c98:	07f0a0ef          	jal	ra,ffffffffc020b516 <memcpy>
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
ffffffffc0200cc2:	0550a0ef          	jal	ra,ffffffffc020b516 <memcpy>
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
ffffffffc0200ce4:	7e00a0ef          	jal	ra,ffffffffc020b4c4 <memset>
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
ffffffffc0200d16:	d5e50513          	addi	a0,a0,-674 # ffffffffc020ba70 <commands+0x2d8>
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
ffffffffc0200d38:	d9458593          	addi	a1,a1,-620 # ffffffffc020bac8 <commands+0x330>
ffffffffc0200d3c:	71c0a0ef          	jal	ra,ffffffffc020b458 <strcpy>
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
ffffffffc0200d80:	cdc50513          	addi	a0,a0,-804 # ffffffffc020ba58 <commands+0x2c0>
ffffffffc0200d84:	6105                	addi	sp,sp,32
ffffffffc0200d86:	c20ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200d8a:	0000b617          	auipc	a2,0xb
ffffffffc0200d8e:	d0e60613          	addi	a2,a2,-754 # ffffffffc020ba98 <commands+0x300>
ffffffffc0200d92:	03200593          	li	a1,50
ffffffffc0200d96:	0000b517          	auipc	a0,0xb
ffffffffc0200d9a:	d1a50513          	addi	a0,a0,-742 # ffffffffc020bab0 <commands+0x318>
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
ffffffffc0200dc8:	d1450513          	addi	a0,a0,-748 # ffffffffc020bad8 <commands+0x340>
ffffffffc0200dcc:	e406                	sd	ra,8(sp)
ffffffffc0200dce:	bd8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dd2:	640c                	ld	a1,8(s0)
ffffffffc0200dd4:	0000b517          	auipc	a0,0xb
ffffffffc0200dd8:	d1c50513          	addi	a0,a0,-740 # ffffffffc020baf0 <commands+0x358>
ffffffffc0200ddc:	bcaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200de0:	680c                	ld	a1,16(s0)
ffffffffc0200de2:	0000b517          	auipc	a0,0xb
ffffffffc0200de6:	d2650513          	addi	a0,a0,-730 # ffffffffc020bb08 <commands+0x370>
ffffffffc0200dea:	bbcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dee:	6c0c                	ld	a1,24(s0)
ffffffffc0200df0:	0000b517          	auipc	a0,0xb
ffffffffc0200df4:	d3050513          	addi	a0,a0,-720 # ffffffffc020bb20 <commands+0x388>
ffffffffc0200df8:	baeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dfc:	700c                	ld	a1,32(s0)
ffffffffc0200dfe:	0000b517          	auipc	a0,0xb
ffffffffc0200e02:	d3a50513          	addi	a0,a0,-710 # ffffffffc020bb38 <commands+0x3a0>
ffffffffc0200e06:	ba0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e0a:	740c                	ld	a1,40(s0)
ffffffffc0200e0c:	0000b517          	auipc	a0,0xb
ffffffffc0200e10:	d4450513          	addi	a0,a0,-700 # ffffffffc020bb50 <commands+0x3b8>
ffffffffc0200e14:	b92ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e18:	780c                	ld	a1,48(s0)
ffffffffc0200e1a:	0000b517          	auipc	a0,0xb
ffffffffc0200e1e:	d4e50513          	addi	a0,a0,-690 # ffffffffc020bb68 <commands+0x3d0>
ffffffffc0200e22:	b84ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e26:	7c0c                	ld	a1,56(s0)
ffffffffc0200e28:	0000b517          	auipc	a0,0xb
ffffffffc0200e2c:	d5850513          	addi	a0,a0,-680 # ffffffffc020bb80 <commands+0x3e8>
ffffffffc0200e30:	b76ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e34:	602c                	ld	a1,64(s0)
ffffffffc0200e36:	0000b517          	auipc	a0,0xb
ffffffffc0200e3a:	d6250513          	addi	a0,a0,-670 # ffffffffc020bb98 <commands+0x400>
ffffffffc0200e3e:	b68ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e42:	642c                	ld	a1,72(s0)
ffffffffc0200e44:	0000b517          	auipc	a0,0xb
ffffffffc0200e48:	d6c50513          	addi	a0,a0,-660 # ffffffffc020bbb0 <commands+0x418>
ffffffffc0200e4c:	b5aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e50:	682c                	ld	a1,80(s0)
ffffffffc0200e52:	0000b517          	auipc	a0,0xb
ffffffffc0200e56:	d7650513          	addi	a0,a0,-650 # ffffffffc020bbc8 <commands+0x430>
ffffffffc0200e5a:	b4cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e5e:	6c2c                	ld	a1,88(s0)
ffffffffc0200e60:	0000b517          	auipc	a0,0xb
ffffffffc0200e64:	d8050513          	addi	a0,a0,-640 # ffffffffc020bbe0 <commands+0x448>
ffffffffc0200e68:	b3eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e6c:	702c                	ld	a1,96(s0)
ffffffffc0200e6e:	0000b517          	auipc	a0,0xb
ffffffffc0200e72:	d8a50513          	addi	a0,a0,-630 # ffffffffc020bbf8 <commands+0x460>
ffffffffc0200e76:	b30ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e7a:	742c                	ld	a1,104(s0)
ffffffffc0200e7c:	0000b517          	auipc	a0,0xb
ffffffffc0200e80:	d9450513          	addi	a0,a0,-620 # ffffffffc020bc10 <commands+0x478>
ffffffffc0200e84:	b22ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e88:	782c                	ld	a1,112(s0)
ffffffffc0200e8a:	0000b517          	auipc	a0,0xb
ffffffffc0200e8e:	d9e50513          	addi	a0,a0,-610 # ffffffffc020bc28 <commands+0x490>
ffffffffc0200e92:	b14ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e96:	7c2c                	ld	a1,120(s0)
ffffffffc0200e98:	0000b517          	auipc	a0,0xb
ffffffffc0200e9c:	da850513          	addi	a0,a0,-600 # ffffffffc020bc40 <commands+0x4a8>
ffffffffc0200ea0:	b06ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ea4:	604c                	ld	a1,128(s0)
ffffffffc0200ea6:	0000b517          	auipc	a0,0xb
ffffffffc0200eaa:	db250513          	addi	a0,a0,-590 # ffffffffc020bc58 <commands+0x4c0>
ffffffffc0200eae:	af8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eb2:	644c                	ld	a1,136(s0)
ffffffffc0200eb4:	0000b517          	auipc	a0,0xb
ffffffffc0200eb8:	dbc50513          	addi	a0,a0,-580 # ffffffffc020bc70 <commands+0x4d8>
ffffffffc0200ebc:	aeaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ec0:	684c                	ld	a1,144(s0)
ffffffffc0200ec2:	0000b517          	auipc	a0,0xb
ffffffffc0200ec6:	dc650513          	addi	a0,a0,-570 # ffffffffc020bc88 <commands+0x4f0>
ffffffffc0200eca:	adcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ece:	6c4c                	ld	a1,152(s0)
ffffffffc0200ed0:	0000b517          	auipc	a0,0xb
ffffffffc0200ed4:	dd050513          	addi	a0,a0,-560 # ffffffffc020bca0 <commands+0x508>
ffffffffc0200ed8:	aceff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200edc:	704c                	ld	a1,160(s0)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	dda50513          	addi	a0,a0,-550 # ffffffffc020bcb8 <commands+0x520>
ffffffffc0200ee6:	ac0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eea:	744c                	ld	a1,168(s0)
ffffffffc0200eec:	0000b517          	auipc	a0,0xb
ffffffffc0200ef0:	de450513          	addi	a0,a0,-540 # ffffffffc020bcd0 <commands+0x538>
ffffffffc0200ef4:	ab2ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ef8:	784c                	ld	a1,176(s0)
ffffffffc0200efa:	0000b517          	auipc	a0,0xb
ffffffffc0200efe:	dee50513          	addi	a0,a0,-530 # ffffffffc020bce8 <commands+0x550>
ffffffffc0200f02:	aa4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f06:	7c4c                	ld	a1,184(s0)
ffffffffc0200f08:	0000b517          	auipc	a0,0xb
ffffffffc0200f0c:	df850513          	addi	a0,a0,-520 # ffffffffc020bd00 <commands+0x568>
ffffffffc0200f10:	a96ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f14:	606c                	ld	a1,192(s0)
ffffffffc0200f16:	0000b517          	auipc	a0,0xb
ffffffffc0200f1a:	e0250513          	addi	a0,a0,-510 # ffffffffc020bd18 <commands+0x580>
ffffffffc0200f1e:	a88ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f22:	646c                	ld	a1,200(s0)
ffffffffc0200f24:	0000b517          	auipc	a0,0xb
ffffffffc0200f28:	e0c50513          	addi	a0,a0,-500 # ffffffffc020bd30 <commands+0x598>
ffffffffc0200f2c:	a7aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f30:	686c                	ld	a1,208(s0)
ffffffffc0200f32:	0000b517          	auipc	a0,0xb
ffffffffc0200f36:	e1650513          	addi	a0,a0,-490 # ffffffffc020bd48 <commands+0x5b0>
ffffffffc0200f3a:	a6cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f3e:	6c6c                	ld	a1,216(s0)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	e2050513          	addi	a0,a0,-480 # ffffffffc020bd60 <commands+0x5c8>
ffffffffc0200f48:	a5eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f4c:	706c                	ld	a1,224(s0)
ffffffffc0200f4e:	0000b517          	auipc	a0,0xb
ffffffffc0200f52:	e2a50513          	addi	a0,a0,-470 # ffffffffc020bd78 <commands+0x5e0>
ffffffffc0200f56:	a50ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f5a:	746c                	ld	a1,232(s0)
ffffffffc0200f5c:	0000b517          	auipc	a0,0xb
ffffffffc0200f60:	e3450513          	addi	a0,a0,-460 # ffffffffc020bd90 <commands+0x5f8>
ffffffffc0200f64:	a42ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f68:	786c                	ld	a1,240(s0)
ffffffffc0200f6a:	0000b517          	auipc	a0,0xb
ffffffffc0200f6e:	e3e50513          	addi	a0,a0,-450 # ffffffffc020bda8 <commands+0x610>
ffffffffc0200f72:	a34ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f76:	7c6c                	ld	a1,248(s0)
ffffffffc0200f78:	6402                	ld	s0,0(sp)
ffffffffc0200f7a:	60a2                	ld	ra,8(sp)
ffffffffc0200f7c:	0000b517          	auipc	a0,0xb
ffffffffc0200f80:	e4450513          	addi	a0,a0,-444 # ffffffffc020bdc0 <commands+0x628>
ffffffffc0200f84:	0141                	addi	sp,sp,16
ffffffffc0200f86:	a20ff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f8a <print_trapframe>:
ffffffffc0200f8a:	1141                	addi	sp,sp,-16
ffffffffc0200f8c:	e022                	sd	s0,0(sp)
ffffffffc0200f8e:	85aa                	mv	a1,a0
ffffffffc0200f90:	842a                	mv	s0,a0
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	e4650513          	addi	a0,a0,-442 # ffffffffc020bdd8 <commands+0x640>
ffffffffc0200f9a:	e406                	sd	ra,8(sp)
ffffffffc0200f9c:	a0aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fa0:	8522                	mv	a0,s0
ffffffffc0200fa2:	e1bff0ef          	jal	ra,ffffffffc0200dbc <print_regs>
ffffffffc0200fa6:	10043583          	ld	a1,256(s0)
ffffffffc0200faa:	0000b517          	auipc	a0,0xb
ffffffffc0200fae:	e4650513          	addi	a0,a0,-442 # ffffffffc020bdf0 <commands+0x658>
ffffffffc0200fb2:	9f4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fb6:	10843583          	ld	a1,264(s0)
ffffffffc0200fba:	0000b517          	auipc	a0,0xb
ffffffffc0200fbe:	e4e50513          	addi	a0,a0,-434 # ffffffffc020be08 <commands+0x670>
ffffffffc0200fc2:	9e4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fc6:	11043583          	ld	a1,272(s0)
ffffffffc0200fca:	0000b517          	auipc	a0,0xb
ffffffffc0200fce:	e5650513          	addi	a0,a0,-426 # ffffffffc020be20 <commands+0x688>
ffffffffc0200fd2:	9d4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fd6:	11843583          	ld	a1,280(s0)
ffffffffc0200fda:	6402                	ld	s0,0(sp)
ffffffffc0200fdc:	60a2                	ld	ra,8(sp)
ffffffffc0200fde:	0000b517          	auipc	a0,0xb
ffffffffc0200fe2:	e5250513          	addi	a0,a0,-430 # ffffffffc020be30 <commands+0x698>
ffffffffc0200fe6:	0141                	addi	sp,sp,16
ffffffffc0200fe8:	9beff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200fec <interrupt_handler>:
ffffffffc0200fec:	11853783          	ld	a5,280(a0)
ffffffffc0200ff0:	472d                	li	a4,11
ffffffffc0200ff2:	0786                	slli	a5,a5,0x1
ffffffffc0200ff4:	8385                	srli	a5,a5,0x1
ffffffffc0200ff6:	06f76c63          	bltu	a4,a5,ffffffffc020106e <interrupt_handler+0x82>
ffffffffc0200ffa:	0000b717          	auipc	a4,0xb
ffffffffc0200ffe:	eee70713          	addi	a4,a4,-274 # ffffffffc020bee8 <commands+0x750>
ffffffffc0201002:	078a                	slli	a5,a5,0x2
ffffffffc0201004:	97ba                	add	a5,a5,a4
ffffffffc0201006:	439c                	lw	a5,0(a5)
ffffffffc0201008:	97ba                	add	a5,a5,a4
ffffffffc020100a:	8782                	jr	a5
ffffffffc020100c:	0000b517          	auipc	a0,0xb
ffffffffc0201010:	e9c50513          	addi	a0,a0,-356 # ffffffffc020bea8 <commands+0x710>
ffffffffc0201014:	992ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201018:	0000b517          	auipc	a0,0xb
ffffffffc020101c:	e7050513          	addi	a0,a0,-400 # ffffffffc020be88 <commands+0x6f0>
ffffffffc0201020:	986ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201024:	0000b517          	auipc	a0,0xb
ffffffffc0201028:	e2450513          	addi	a0,a0,-476 # ffffffffc020be48 <commands+0x6b0>
ffffffffc020102c:	97aff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	e3850513          	addi	a0,a0,-456 # ffffffffc020be68 <commands+0x6d0>
ffffffffc0201038:	96eff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103c:	1141                	addi	sp,sp,-16
ffffffffc020103e:	e406                	sd	ra,8(sp)
ffffffffc0201040:	d3aff0ef          	jal	ra,ffffffffc020057a <clock_set_next_event>
ffffffffc0201044:	00096717          	auipc	a4,0x96
ffffffffc0201048:	82c70713          	addi	a4,a4,-2004 # ffffffffc0296870 <ticks>
ffffffffc020104c:	631c                	ld	a5,0(a4)
ffffffffc020104e:	0785                	addi	a5,a5,1
ffffffffc0201050:	e31c                	sd	a5,0(a4)
ffffffffc0201052:	504060ef          	jal	ra,ffffffffc0207556 <run_timer_list>
ffffffffc0201056:	d9eff0ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020105a:	60a2                	ld	ra,8(sp)
ffffffffc020105c:	0141                	addi	sp,sp,16
ffffffffc020105e:	3c90706f          	j	ffffffffc0208c26 <dev_stdin_write>
ffffffffc0201062:	0000b517          	auipc	a0,0xb
ffffffffc0201066:	e6650513          	addi	a0,a0,-410 # ffffffffc020bec8 <commands+0x730>
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
ffffffffc0201086:	02670713          	addi	a4,a4,38 # ffffffffc020c0a8 <commands+0x910>
ffffffffc020108a:	078a                	slli	a5,a5,0x2
ffffffffc020108c:	97ba                	add	a5,a5,a4
ffffffffc020108e:	439c                	lw	a5,0(a5)
ffffffffc0201090:	97ba                	add	a5,a5,a4
ffffffffc0201092:	8782                	jr	a5
ffffffffc0201094:	0000b517          	auipc	a0,0xb
ffffffffc0201098:	f6c50513          	addi	a0,a0,-148 # ffffffffc020c000 <commands+0x868>
ffffffffc020109c:	90aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010a0:	10843783          	ld	a5,264(s0)
ffffffffc02010a4:	60a2                	ld	ra,8(sp)
ffffffffc02010a6:	0791                	addi	a5,a5,4
ffffffffc02010a8:	10f43423          	sd	a5,264(s0)
ffffffffc02010ac:	6402                	ld	s0,0(sp)
ffffffffc02010ae:	0141                	addi	sp,sp,16
ffffffffc02010b0:	6bc0606f          	j	ffffffffc020776c <syscall>
ffffffffc02010b4:	0000b517          	auipc	a0,0xb
ffffffffc02010b8:	f6c50513          	addi	a0,a0,-148 # ffffffffc020c020 <commands+0x888>
ffffffffc02010bc:	6402                	ld	s0,0(sp)
ffffffffc02010be:	60a2                	ld	ra,8(sp)
ffffffffc02010c0:	0141                	addi	sp,sp,16
ffffffffc02010c2:	8e4ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010c6:	0000b517          	auipc	a0,0xb
ffffffffc02010ca:	f7a50513          	addi	a0,a0,-134 # ffffffffc020c040 <commands+0x8a8>
ffffffffc02010ce:	b7fd                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010d0:	0000b517          	auipc	a0,0xb
ffffffffc02010d4:	f9050513          	addi	a0,a0,-112 # ffffffffc020c060 <commands+0x8c8>
ffffffffc02010d8:	b7d5                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010da:	0000b517          	auipc	a0,0xb
ffffffffc02010de:	f9e50513          	addi	a0,a0,-98 # ffffffffc020c078 <commands+0x8e0>
ffffffffc02010e2:	bfe9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010e4:	0000b517          	auipc	a0,0xb
ffffffffc02010e8:	fac50513          	addi	a0,a0,-84 # ffffffffc020c090 <commands+0x8f8>
ffffffffc02010ec:	bfc1                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010ee:	0000b517          	auipc	a0,0xb
ffffffffc02010f2:	e2a50513          	addi	a0,a0,-470 # ffffffffc020bf18 <commands+0x780>
ffffffffc02010f6:	b7d9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010f8:	0000b517          	auipc	a0,0xb
ffffffffc02010fc:	e4050513          	addi	a0,a0,-448 # ffffffffc020bf38 <commands+0x7a0>
ffffffffc0201100:	bf75                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201102:	0000b517          	auipc	a0,0xb
ffffffffc0201106:	e5650513          	addi	a0,a0,-426 # ffffffffc020bf58 <commands+0x7c0>
ffffffffc020110a:	bf4d                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020110c:	0000b517          	auipc	a0,0xb
ffffffffc0201110:	e6450513          	addi	a0,a0,-412 # ffffffffc020bf70 <commands+0x7d8>
ffffffffc0201114:	b765                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201116:	0000b517          	auipc	a0,0xb
ffffffffc020111a:	e6a50513          	addi	a0,a0,-406 # ffffffffc020bf80 <commands+0x7e8>
ffffffffc020111e:	bf79                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201120:	0000b517          	auipc	a0,0xb
ffffffffc0201124:	e8050513          	addi	a0,a0,-384 # ffffffffc020bfa0 <commands+0x808>
ffffffffc0201128:	bf51                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020112a:	0000b517          	auipc	a0,0xb
ffffffffc020112e:	ebe50513          	addi	a0,a0,-322 # ffffffffc020bfe8 <commands+0x850>
ffffffffc0201132:	b769                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201134:	8522                	mv	a0,s0
ffffffffc0201136:	6402                	ld	s0,0(sp)
ffffffffc0201138:	60a2                	ld	ra,8(sp)
ffffffffc020113a:	0141                	addi	sp,sp,16
ffffffffc020113c:	b5b9                	j	ffffffffc0200f8a <print_trapframe>
ffffffffc020113e:	0000b617          	auipc	a2,0xb
ffffffffc0201142:	e7a60613          	addi	a2,a2,-390 # ffffffffc020bfb8 <commands+0x820>
ffffffffc0201146:	0b100593          	li	a1,177
ffffffffc020114a:	0000b517          	auipc	a0,0xb
ffffffffc020114e:	e8650513          	addi	a0,a0,-378 # ffffffffc020bfd0 <commands+0x838>
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
ffffffffc02011d2:	1780606f          	j	ffffffffc020734a <schedule>
ffffffffc02011d6:	555d                	li	a0,-9
ffffffffc02011d8:	67f040ef          	jal	ra,ffffffffc0206056 <do_exit>
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
ffffffffc020136a:	4b263603          	ld	a2,1202(a2) # ffffffffc020f818 <nbase>
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
ffffffffc02015b0:	b3c68693          	addi	a3,a3,-1220 # ffffffffc020c0e8 <commands+0x950>
ffffffffc02015b4:	0000a617          	auipc	a2,0xa
ffffffffc02015b8:	3f460613          	addi	a2,a2,1012 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02015bc:	0ef00593          	li	a1,239
ffffffffc02015c0:	0000b517          	auipc	a0,0xb
ffffffffc02015c4:	b3850513          	addi	a0,a0,-1224 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02015c8:	ed7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015cc:	0000b697          	auipc	a3,0xb
ffffffffc02015d0:	bc468693          	addi	a3,a3,-1084 # ffffffffc020c190 <commands+0x9f8>
ffffffffc02015d4:	0000a617          	auipc	a2,0xa
ffffffffc02015d8:	3d460613          	addi	a2,a2,980 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02015dc:	0bc00593          	li	a1,188
ffffffffc02015e0:	0000b517          	auipc	a0,0xb
ffffffffc02015e4:	b1850513          	addi	a0,a0,-1256 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02015e8:	eb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015ec:	0000b697          	auipc	a3,0xb
ffffffffc02015f0:	bcc68693          	addi	a3,a3,-1076 # ffffffffc020c1b8 <commands+0xa20>
ffffffffc02015f4:	0000a617          	auipc	a2,0xa
ffffffffc02015f8:	3b460613          	addi	a2,a2,948 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02015fc:	0bd00593          	li	a1,189
ffffffffc0201600:	0000b517          	auipc	a0,0xb
ffffffffc0201604:	af850513          	addi	a0,a0,-1288 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201608:	e97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020160c:	0000b697          	auipc	a3,0xb
ffffffffc0201610:	bec68693          	addi	a3,a3,-1044 # ffffffffc020c1f8 <commands+0xa60>
ffffffffc0201614:	0000a617          	auipc	a2,0xa
ffffffffc0201618:	39460613          	addi	a2,a2,916 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020161c:	0bf00593          	li	a1,191
ffffffffc0201620:	0000b517          	auipc	a0,0xb
ffffffffc0201624:	ad850513          	addi	a0,a0,-1320 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201628:	e77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020162c:	0000b697          	auipc	a3,0xb
ffffffffc0201630:	c5468693          	addi	a3,a3,-940 # ffffffffc020c280 <commands+0xae8>
ffffffffc0201634:	0000a617          	auipc	a2,0xa
ffffffffc0201638:	37460613          	addi	a2,a2,884 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020163c:	0d800593          	li	a1,216
ffffffffc0201640:	0000b517          	auipc	a0,0xb
ffffffffc0201644:	ab850513          	addi	a0,a0,-1352 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201648:	e57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020164c:	0000b697          	auipc	a3,0xb
ffffffffc0201650:	ae468693          	addi	a3,a3,-1308 # ffffffffc020c130 <commands+0x998>
ffffffffc0201654:	0000a617          	auipc	a2,0xa
ffffffffc0201658:	35460613          	addi	a2,a2,852 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020165c:	0d100593          	li	a1,209
ffffffffc0201660:	0000b517          	auipc	a0,0xb
ffffffffc0201664:	a9850513          	addi	a0,a0,-1384 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201668:	e37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020166c:	0000b697          	auipc	a3,0xb
ffffffffc0201670:	c0468693          	addi	a3,a3,-1020 # ffffffffc020c270 <commands+0xad8>
ffffffffc0201674:	0000a617          	auipc	a2,0xa
ffffffffc0201678:	33460613          	addi	a2,a2,820 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020167c:	0cf00593          	li	a1,207
ffffffffc0201680:	0000b517          	auipc	a0,0xb
ffffffffc0201684:	a7850513          	addi	a0,a0,-1416 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201688:	e17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020168c:	0000b697          	auipc	a3,0xb
ffffffffc0201690:	bcc68693          	addi	a3,a3,-1076 # ffffffffc020c258 <commands+0xac0>
ffffffffc0201694:	0000a617          	auipc	a2,0xa
ffffffffc0201698:	31460613          	addi	a2,a2,788 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020169c:	0ca00593          	li	a1,202
ffffffffc02016a0:	0000b517          	auipc	a0,0xb
ffffffffc02016a4:	a5850513          	addi	a0,a0,-1448 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02016a8:	df7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ac:	0000b697          	auipc	a3,0xb
ffffffffc02016b0:	b8c68693          	addi	a3,a3,-1140 # ffffffffc020c238 <commands+0xaa0>
ffffffffc02016b4:	0000a617          	auipc	a2,0xa
ffffffffc02016b8:	2f460613          	addi	a2,a2,756 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02016bc:	0c100593          	li	a1,193
ffffffffc02016c0:	0000b517          	auipc	a0,0xb
ffffffffc02016c4:	a3850513          	addi	a0,a0,-1480 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02016c8:	dd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016cc:	0000b697          	auipc	a3,0xb
ffffffffc02016d0:	bfc68693          	addi	a3,a3,-1028 # ffffffffc020c2c8 <commands+0xb30>
ffffffffc02016d4:	0000a617          	auipc	a2,0xa
ffffffffc02016d8:	2d460613          	addi	a2,a2,724 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02016dc:	0f700593          	li	a1,247
ffffffffc02016e0:	0000b517          	auipc	a0,0xb
ffffffffc02016e4:	a1850513          	addi	a0,a0,-1512 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02016e8:	db7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ec:	0000b697          	auipc	a3,0xb
ffffffffc02016f0:	bcc68693          	addi	a3,a3,-1076 # ffffffffc020c2b8 <commands+0xb20>
ffffffffc02016f4:	0000a617          	auipc	a2,0xa
ffffffffc02016f8:	2b460613          	addi	a2,a2,692 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02016fc:	0de00593          	li	a1,222
ffffffffc0201700:	0000b517          	auipc	a0,0xb
ffffffffc0201704:	9f850513          	addi	a0,a0,-1544 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201708:	d97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020170c:	0000b697          	auipc	a3,0xb
ffffffffc0201710:	b4c68693          	addi	a3,a3,-1204 # ffffffffc020c258 <commands+0xac0>
ffffffffc0201714:	0000a617          	auipc	a2,0xa
ffffffffc0201718:	29460613          	addi	a2,a2,660 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020171c:	0dc00593          	li	a1,220
ffffffffc0201720:	0000b517          	auipc	a0,0xb
ffffffffc0201724:	9d850513          	addi	a0,a0,-1576 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201728:	d77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020172c:	0000b697          	auipc	a3,0xb
ffffffffc0201730:	b6c68693          	addi	a3,a3,-1172 # ffffffffc020c298 <commands+0xb00>
ffffffffc0201734:	0000a617          	auipc	a2,0xa
ffffffffc0201738:	27460613          	addi	a2,a2,628 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020173c:	0db00593          	li	a1,219
ffffffffc0201740:	0000b517          	auipc	a0,0xb
ffffffffc0201744:	9b850513          	addi	a0,a0,-1608 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201748:	d57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020174c:	0000b697          	auipc	a3,0xb
ffffffffc0201750:	9e468693          	addi	a3,a3,-1564 # ffffffffc020c130 <commands+0x998>
ffffffffc0201754:	0000a617          	auipc	a2,0xa
ffffffffc0201758:	25460613          	addi	a2,a2,596 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020175c:	0b800593          	li	a1,184
ffffffffc0201760:	0000b517          	auipc	a0,0xb
ffffffffc0201764:	99850513          	addi	a0,a0,-1640 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201768:	d37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020176c:	0000b697          	auipc	a3,0xb
ffffffffc0201770:	aec68693          	addi	a3,a3,-1300 # ffffffffc020c258 <commands+0xac0>
ffffffffc0201774:	0000a617          	auipc	a2,0xa
ffffffffc0201778:	23460613          	addi	a2,a2,564 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020177c:	0d500593          	li	a1,213
ffffffffc0201780:	0000b517          	auipc	a0,0xb
ffffffffc0201784:	97850513          	addi	a0,a0,-1672 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201788:	d17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020178c:	0000b697          	auipc	a3,0xb
ffffffffc0201790:	9e468693          	addi	a3,a3,-1564 # ffffffffc020c170 <commands+0x9d8>
ffffffffc0201794:	0000a617          	auipc	a2,0xa
ffffffffc0201798:	21460613          	addi	a2,a2,532 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020179c:	0d300593          	li	a1,211
ffffffffc02017a0:	0000b517          	auipc	a0,0xb
ffffffffc02017a4:	95850513          	addi	a0,a0,-1704 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02017a8:	cf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ac:	0000b697          	auipc	a3,0xb
ffffffffc02017b0:	9a468693          	addi	a3,a3,-1628 # ffffffffc020c150 <commands+0x9b8>
ffffffffc02017b4:	0000a617          	auipc	a2,0xa
ffffffffc02017b8:	1f460613          	addi	a2,a2,500 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02017bc:	0d200593          	li	a1,210
ffffffffc02017c0:	0000b517          	auipc	a0,0xb
ffffffffc02017c4:	93850513          	addi	a0,a0,-1736 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02017c8:	cd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017cc:	0000b697          	auipc	a3,0xb
ffffffffc02017d0:	9a468693          	addi	a3,a3,-1628 # ffffffffc020c170 <commands+0x9d8>
ffffffffc02017d4:	0000a617          	auipc	a2,0xa
ffffffffc02017d8:	1d460613          	addi	a2,a2,468 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02017dc:	0ba00593          	li	a1,186
ffffffffc02017e0:	0000b517          	auipc	a0,0xb
ffffffffc02017e4:	91850513          	addi	a0,a0,-1768 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02017e8:	cb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ec:	0000b697          	auipc	a3,0xb
ffffffffc02017f0:	c2c68693          	addi	a3,a3,-980 # ffffffffc020c418 <commands+0xc80>
ffffffffc02017f4:	0000a617          	auipc	a2,0xa
ffffffffc02017f8:	1b460613          	addi	a2,a2,436 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02017fc:	12400593          	li	a1,292
ffffffffc0201800:	0000b517          	auipc	a0,0xb
ffffffffc0201804:	8f850513          	addi	a0,a0,-1800 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201808:	c97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020180c:	0000b697          	auipc	a3,0xb
ffffffffc0201810:	aac68693          	addi	a3,a3,-1364 # ffffffffc020c2b8 <commands+0xb20>
ffffffffc0201814:	0000a617          	auipc	a2,0xa
ffffffffc0201818:	19460613          	addi	a2,a2,404 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020181c:	11900593          	li	a1,281
ffffffffc0201820:	0000b517          	auipc	a0,0xb
ffffffffc0201824:	8d850513          	addi	a0,a0,-1832 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201828:	c77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020182c:	0000b697          	auipc	a3,0xb
ffffffffc0201830:	a2c68693          	addi	a3,a3,-1492 # ffffffffc020c258 <commands+0xac0>
ffffffffc0201834:	0000a617          	auipc	a2,0xa
ffffffffc0201838:	17460613          	addi	a2,a2,372 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020183c:	11700593          	li	a1,279
ffffffffc0201840:	0000b517          	auipc	a0,0xb
ffffffffc0201844:	8b850513          	addi	a0,a0,-1864 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201848:	c57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020184c:	0000b697          	auipc	a3,0xb
ffffffffc0201850:	9cc68693          	addi	a3,a3,-1588 # ffffffffc020c218 <commands+0xa80>
ffffffffc0201854:	0000a617          	auipc	a2,0xa
ffffffffc0201858:	15460613          	addi	a2,a2,340 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020185c:	0c000593          	li	a1,192
ffffffffc0201860:	0000b517          	auipc	a0,0xb
ffffffffc0201864:	89850513          	addi	a0,a0,-1896 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201868:	c37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020186c:	0000b697          	auipc	a3,0xb
ffffffffc0201870:	b6c68693          	addi	a3,a3,-1172 # ffffffffc020c3d8 <commands+0xc40>
ffffffffc0201874:	0000a617          	auipc	a2,0xa
ffffffffc0201878:	13460613          	addi	a2,a2,308 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020187c:	11100593          	li	a1,273
ffffffffc0201880:	0000b517          	auipc	a0,0xb
ffffffffc0201884:	87850513          	addi	a0,a0,-1928 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201888:	c17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020188c:	0000b697          	auipc	a3,0xb
ffffffffc0201890:	b2c68693          	addi	a3,a3,-1236 # ffffffffc020c3b8 <commands+0xc20>
ffffffffc0201894:	0000a617          	auipc	a2,0xa
ffffffffc0201898:	11460613          	addi	a2,a2,276 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020189c:	10f00593          	li	a1,271
ffffffffc02018a0:	0000b517          	auipc	a0,0xb
ffffffffc02018a4:	85850513          	addi	a0,a0,-1960 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02018a8:	bf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ac:	0000b697          	auipc	a3,0xb
ffffffffc02018b0:	ae468693          	addi	a3,a3,-1308 # ffffffffc020c390 <commands+0xbf8>
ffffffffc02018b4:	0000a617          	auipc	a2,0xa
ffffffffc02018b8:	0f460613          	addi	a2,a2,244 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02018bc:	10d00593          	li	a1,269
ffffffffc02018c0:	0000b517          	auipc	a0,0xb
ffffffffc02018c4:	83850513          	addi	a0,a0,-1992 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02018c8:	bd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018cc:	0000b697          	auipc	a3,0xb
ffffffffc02018d0:	a9c68693          	addi	a3,a3,-1380 # ffffffffc020c368 <commands+0xbd0>
ffffffffc02018d4:	0000a617          	auipc	a2,0xa
ffffffffc02018d8:	0d460613          	addi	a2,a2,212 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02018dc:	10c00593          	li	a1,268
ffffffffc02018e0:	0000b517          	auipc	a0,0xb
ffffffffc02018e4:	81850513          	addi	a0,a0,-2024 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02018e8:	bb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ec:	0000b697          	auipc	a3,0xb
ffffffffc02018f0:	a6c68693          	addi	a3,a3,-1428 # ffffffffc020c358 <commands+0xbc0>
ffffffffc02018f4:	0000a617          	auipc	a2,0xa
ffffffffc02018f8:	0b460613          	addi	a2,a2,180 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02018fc:	10700593          	li	a1,263
ffffffffc0201900:	0000a517          	auipc	a0,0xa
ffffffffc0201904:	7f850513          	addi	a0,a0,2040 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201908:	b97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020190c:	0000b697          	auipc	a3,0xb
ffffffffc0201910:	94c68693          	addi	a3,a3,-1716 # ffffffffc020c258 <commands+0xac0>
ffffffffc0201914:	0000a617          	auipc	a2,0xa
ffffffffc0201918:	09460613          	addi	a2,a2,148 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020191c:	10600593          	li	a1,262
ffffffffc0201920:	0000a517          	auipc	a0,0xa
ffffffffc0201924:	7d850513          	addi	a0,a0,2008 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201928:	b77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020192c:	0000b697          	auipc	a3,0xb
ffffffffc0201930:	a0c68693          	addi	a3,a3,-1524 # ffffffffc020c338 <commands+0xba0>
ffffffffc0201934:	0000a617          	auipc	a2,0xa
ffffffffc0201938:	07460613          	addi	a2,a2,116 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020193c:	10500593          	li	a1,261
ffffffffc0201940:	0000a517          	auipc	a0,0xa
ffffffffc0201944:	7b850513          	addi	a0,a0,1976 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201948:	b57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020194c:	0000b697          	auipc	a3,0xb
ffffffffc0201950:	9bc68693          	addi	a3,a3,-1604 # ffffffffc020c308 <commands+0xb70>
ffffffffc0201954:	0000a617          	auipc	a2,0xa
ffffffffc0201958:	05460613          	addi	a2,a2,84 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020195c:	10400593          	li	a1,260
ffffffffc0201960:	0000a517          	auipc	a0,0xa
ffffffffc0201964:	79850513          	addi	a0,a0,1944 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201968:	b37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020196c:	0000b697          	auipc	a3,0xb
ffffffffc0201970:	98468693          	addi	a3,a3,-1660 # ffffffffc020c2f0 <commands+0xb58>
ffffffffc0201974:	0000a617          	auipc	a2,0xa
ffffffffc0201978:	03460613          	addi	a2,a2,52 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020197c:	10300593          	li	a1,259
ffffffffc0201980:	0000a517          	auipc	a0,0xa
ffffffffc0201984:	77850513          	addi	a0,a0,1912 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201988:	b17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020198c:	0000b697          	auipc	a3,0xb
ffffffffc0201990:	8cc68693          	addi	a3,a3,-1844 # ffffffffc020c258 <commands+0xac0>
ffffffffc0201994:	0000a617          	auipc	a2,0xa
ffffffffc0201998:	01460613          	addi	a2,a2,20 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020199c:	0fd00593          	li	a1,253
ffffffffc02019a0:	0000a517          	auipc	a0,0xa
ffffffffc02019a4:	75850513          	addi	a0,a0,1880 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02019a8:	af7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ac:	0000b697          	auipc	a3,0xb
ffffffffc02019b0:	92c68693          	addi	a3,a3,-1748 # ffffffffc020c2d8 <commands+0xb40>
ffffffffc02019b4:	0000a617          	auipc	a2,0xa
ffffffffc02019b8:	ff460613          	addi	a2,a2,-12 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02019bc:	0f800593          	li	a1,248
ffffffffc02019c0:	0000a517          	auipc	a0,0xa
ffffffffc02019c4:	73850513          	addi	a0,a0,1848 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02019c8:	ad7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019cc:	0000b697          	auipc	a3,0xb
ffffffffc02019d0:	a2c68693          	addi	a3,a3,-1492 # ffffffffc020c3f8 <commands+0xc60>
ffffffffc02019d4:	0000a617          	auipc	a2,0xa
ffffffffc02019d8:	fd460613          	addi	a2,a2,-44 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02019dc:	11600593          	li	a1,278
ffffffffc02019e0:	0000a517          	auipc	a0,0xa
ffffffffc02019e4:	71850513          	addi	a0,a0,1816 # ffffffffc020c0f8 <commands+0x960>
ffffffffc02019e8:	ab7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ec:	0000b697          	auipc	a3,0xb
ffffffffc02019f0:	a3c68693          	addi	a3,a3,-1476 # ffffffffc020c428 <commands+0xc90>
ffffffffc02019f4:	0000a617          	auipc	a2,0xa
ffffffffc02019f8:	fb460613          	addi	a2,a2,-76 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02019fc:	12500593          	li	a1,293
ffffffffc0201a00:	0000a517          	auipc	a0,0xa
ffffffffc0201a04:	6f850513          	addi	a0,a0,1784 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201a08:	a97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a0c:	0000a697          	auipc	a3,0xa
ffffffffc0201a10:	70468693          	addi	a3,a3,1796 # ffffffffc020c110 <commands+0x978>
ffffffffc0201a14:	0000a617          	auipc	a2,0xa
ffffffffc0201a18:	f9460613          	addi	a2,a2,-108 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0201a1c:	0f200593          	li	a1,242
ffffffffc0201a20:	0000a517          	auipc	a0,0xa
ffffffffc0201a24:	6d850513          	addi	a0,a0,1752 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201a28:	a77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a2c:	0000a697          	auipc	a3,0xa
ffffffffc0201a30:	72468693          	addi	a3,a3,1828 # ffffffffc020c150 <commands+0x9b8>
ffffffffc0201a34:	0000a617          	auipc	a2,0xa
ffffffffc0201a38:	f7460613          	addi	a2,a2,-140 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0201a3c:	0b900593          	li	a1,185
ffffffffc0201a40:	0000a517          	auipc	a0,0xa
ffffffffc0201a44:	6b850513          	addi	a0,a0,1720 # ffffffffc020c0f8 <commands+0x960>
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
ffffffffc0201b7c:	8c868693          	addi	a3,a3,-1848 # ffffffffc020c440 <commands+0xca8>
ffffffffc0201b80:	0000a617          	auipc	a2,0xa
ffffffffc0201b84:	e2860613          	addi	a2,a2,-472 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0201b88:	08200593          	li	a1,130
ffffffffc0201b8c:	0000a517          	auipc	a0,0xa
ffffffffc0201b90:	56c50513          	addi	a0,a0,1388 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201b94:	90bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201b98:	0000b697          	auipc	a3,0xb
ffffffffc0201b9c:	8a068693          	addi	a3,a3,-1888 # ffffffffc020c438 <commands+0xca0>
ffffffffc0201ba0:	0000a617          	auipc	a2,0xa
ffffffffc0201ba4:	e0860613          	addi	a2,a2,-504 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0201ba8:	07f00593          	li	a1,127
ffffffffc0201bac:	0000a517          	auipc	a0,0xa
ffffffffc0201bb0:	54c50513          	addi	a0,a0,1356 # ffffffffc020c0f8 <commands+0x960>
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
ffffffffc0201c4e:	7ee68693          	addi	a3,a3,2030 # ffffffffc020c438 <commands+0xca0>
ffffffffc0201c52:	0000a617          	auipc	a2,0xa
ffffffffc0201c56:	d5660613          	addi	a2,a2,-682 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0201c5a:	06100593          	li	a1,97
ffffffffc0201c5e:	0000a517          	auipc	a0,0xa
ffffffffc0201c62:	49a50513          	addi	a0,a0,1178 # ffffffffc020c0f8 <commands+0x960>
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
ffffffffc0201d20:	74c68693          	addi	a3,a3,1868 # ffffffffc020c468 <commands+0xcd0>
ffffffffc0201d24:	0000a617          	auipc	a2,0xa
ffffffffc0201d28:	c8460613          	addi	a2,a2,-892 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0201d2c:	04800593          	li	a1,72
ffffffffc0201d30:	0000a517          	auipc	a0,0xa
ffffffffc0201d34:	3c850513          	addi	a0,a0,968 # ffffffffc020c0f8 <commands+0x960>
ffffffffc0201d38:	f66fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201d3c:	0000a697          	auipc	a3,0xa
ffffffffc0201d40:	6fc68693          	addi	a3,a3,1788 # ffffffffc020c438 <commands+0xca0>
ffffffffc0201d44:	0000a617          	auipc	a2,0xa
ffffffffc0201d48:	c6460613          	addi	a2,a2,-924 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0201d4c:	04500593          	li	a1,69
ffffffffc0201d50:	0000a517          	auipc	a0,0xa
ffffffffc0201d54:	3a850513          	addi	a0,a0,936 # ffffffffc020c0f8 <commands+0x960>
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
ffffffffc0201e30:	9ec6b683          	ld	a3,-1556(a3) # ffffffffc020f818 <nbase>
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
ffffffffc0201e60:	66c60613          	addi	a2,a2,1644 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc0201e64:	07100593          	li	a1,113
ffffffffc0201e68:	0000a517          	auipc	a0,0xa
ffffffffc0201e6c:	68850513          	addi	a0,a0,1672 # ffffffffc020c4f0 <default_pmm_manager+0x60>
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
ffffffffc0201f4e:	5b668693          	addi	a3,a3,1462 # ffffffffc020c500 <default_pmm_manager+0x70>
ffffffffc0201f52:	0000a617          	auipc	a2,0xa
ffffffffc0201f56:	a5660613          	addi	a2,a2,-1450 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0201f5a:	06300593          	li	a1,99
ffffffffc0201f5e:	0000a517          	auipc	a0,0xa
ffffffffc0201f62:	5c250513          	addi	a0,a0,1474 # ffffffffc020c520 <default_pmm_manager+0x90>
ffffffffc0201f66:	d38fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201f6a <kmalloc_init>:
ffffffffc0201f6a:	1141                	addi	sp,sp,-16
ffffffffc0201f6c:	0000a517          	auipc	a0,0xa
ffffffffc0201f70:	5cc50513          	addi	a0,a0,1484 # ffffffffc020c538 <default_pmm_manager+0xa8>
ffffffffc0201f74:	e406                	sd	ra,8(sp)
ffffffffc0201f76:	a30fe0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201f7a:	60a2                	ld	ra,8(sp)
ffffffffc0201f7c:	0000a517          	auipc	a0,0xa
ffffffffc0201f80:	5d450513          	addi	a0,a0,1492 # ffffffffc020c550 <default_pmm_manager+0xc0>
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
ffffffffc02020a8:	77453503          	ld	a0,1908(a0) # ffffffffc020f818 <nbase>
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
ffffffffc0202106:	49660613          	addi	a2,a2,1174 # ffffffffc020c598 <default_pmm_manager+0x108>
ffffffffc020210a:	06900593          	li	a1,105
ffffffffc020210e:	0000a517          	auipc	a0,0xa
ffffffffc0202112:	3e250513          	addi	a0,a0,994 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0202116:	b88fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020211a:	86a2                	mv	a3,s0
ffffffffc020211c:	0000a617          	auipc	a2,0xa
ffffffffc0202120:	45460613          	addi	a2,a2,1108 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc0202124:	07700593          	li	a1,119
ffffffffc0202128:	0000a517          	auipc	a0,0xa
ffffffffc020212c:	3c850513          	addi	a0,a0,968 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0202130:	b6efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202134 <pa2page.part.0>:
ffffffffc0202134:	1141                	addi	sp,sp,-16
ffffffffc0202136:	0000a617          	auipc	a2,0xa
ffffffffc020213a:	46260613          	addi	a2,a2,1122 # ffffffffc020c598 <default_pmm_manager+0x108>
ffffffffc020213e:	06900593          	li	a1,105
ffffffffc0202142:	0000a517          	auipc	a0,0xa
ffffffffc0202146:	3ae50513          	addi	a0,a0,942 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc020214a:	e406                	sd	ra,8(sp)
ffffffffc020214c:	b52fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202150 <pte2page.part.0>:
ffffffffc0202150:	1141                	addi	sp,sp,-16
ffffffffc0202152:	0000a617          	auipc	a2,0xa
ffffffffc0202156:	46660613          	addi	a2,a2,1126 # ffffffffc020c5b8 <default_pmm_manager+0x128>
ffffffffc020215a:	07f00593          	li	a1,127
ffffffffc020215e:	0000a517          	auipc	a0,0xa
ffffffffc0202162:	39250513          	addi	a0,a0,914 # ffffffffc020c4f0 <default_pmm_manager+0x60>
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
ffffffffc02022bc:	208090ef          	jal	ra,ffffffffc020b4c4 <memset>
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
ffffffffc020235e:	166090ef          	jal	ra,ffffffffc020b4c4 <memset>
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
ffffffffc02023ec:	0e060613          	addi	a2,a2,224 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc02023f0:	13200593          	li	a1,306
ffffffffc02023f4:	0000a517          	auipc	a0,0xa
ffffffffc02023f8:	1ec50513          	addi	a0,a0,492 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02023fc:	8a2fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202400:	0000a617          	auipc	a2,0xa
ffffffffc0202404:	0c860613          	addi	a2,a2,200 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc0202408:	12500593          	li	a1,293
ffffffffc020240c:	0000a517          	auipc	a0,0xa
ffffffffc0202410:	1d450513          	addi	a0,a0,468 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0202414:	88afe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202418:	86aa                	mv	a3,a0
ffffffffc020241a:	0000a617          	auipc	a2,0xa
ffffffffc020241e:	0ae60613          	addi	a2,a2,174 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc0202422:	12100593          	li	a1,289
ffffffffc0202426:	0000a517          	auipc	a0,0xa
ffffffffc020242a:	1ba50513          	addi	a0,a0,442 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020242e:	870fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202432:	86aa                	mv	a3,a0
ffffffffc0202434:	0000a617          	auipc	a2,0xa
ffffffffc0202438:	09460613          	addi	a2,a2,148 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc020243c:	12f00593          	li	a1,303
ffffffffc0202440:	0000a517          	auipc	a0,0xa
ffffffffc0202444:	1a050513          	addi	a0,a0,416 # ffffffffc020c5e0 <default_pmm_manager+0x150>
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
ffffffffc02024d6:	13668693          	addi	a3,a3,310 # ffffffffc020c608 <default_pmm_manager+0x178>
ffffffffc02024da:	00009617          	auipc	a2,0x9
ffffffffc02024de:	4ce60613          	addi	a2,a2,1230 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02024e2:	09c00593          	li	a1,156
ffffffffc02024e6:	0000a517          	auipc	a0,0xa
ffffffffc02024ea:	0fa50513          	addi	a0,a0,250 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02024ee:	fb1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024f2:	0000a697          	auipc	a3,0xa
ffffffffc02024f6:	0fe68693          	addi	a3,a3,254 # ffffffffc020c5f0 <default_pmm_manager+0x160>
ffffffffc02024fa:	00009617          	auipc	a2,0x9
ffffffffc02024fe:	4ae60613          	addi	a2,a2,1198 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0202502:	09500593          	li	a1,149
ffffffffc0202506:	0000a517          	auipc	a0,0xa
ffffffffc020250a:	0da50513          	addi	a0,a0,218 # ffffffffc020c5e0 <default_pmm_manager+0x150>
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
ffffffffc020266c:	fb068693          	addi	a3,a3,-80 # ffffffffc020c618 <default_pmm_manager+0x188>
ffffffffc0202670:	00009617          	auipc	a2,0x9
ffffffffc0202674:	33860613          	addi	a2,a2,824 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0202678:	15a00593          	li	a1,346
ffffffffc020267c:	0000a517          	auipc	a0,0xa
ffffffffc0202680:	f6450513          	addi	a0,a0,-156 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0202684:	e1bfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202688:	0000a697          	auipc	a3,0xa
ffffffffc020268c:	fc068693          	addi	a3,a3,-64 # ffffffffc020c648 <default_pmm_manager+0x1b8>
ffffffffc0202690:	00009617          	auipc	a2,0x9
ffffffffc0202694:	31860613          	addi	a2,a2,792 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0202698:	15b00593          	li	a1,347
ffffffffc020269c:	0000a517          	auipc	a0,0xa
ffffffffc02026a0:	f4450513          	addi	a0,a0,-188 # ffffffffc020c5e0 <default_pmm_manager+0x150>
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
ffffffffc02028e6:	d3668693          	addi	a3,a3,-714 # ffffffffc020c618 <default_pmm_manager+0x188>
ffffffffc02028ea:	00009617          	auipc	a2,0x9
ffffffffc02028ee:	0be60613          	addi	a2,a2,190 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02028f2:	16f00593          	li	a1,367
ffffffffc02028f6:	0000a517          	auipc	a0,0xa
ffffffffc02028fa:	cea50513          	addi	a0,a0,-790 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02028fe:	ba1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202902:	0000a617          	auipc	a2,0xa
ffffffffc0202906:	bc660613          	addi	a2,a2,-1082 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc020290a:	07100593          	li	a1,113
ffffffffc020290e:	0000a517          	auipc	a0,0xa
ffffffffc0202912:	be250513          	addi	a0,a0,-1054 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0202916:	b89fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020291a:	81bff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc020291e:	0000a697          	auipc	a3,0xa
ffffffffc0202922:	d2a68693          	addi	a3,a3,-726 # ffffffffc020c648 <default_pmm_manager+0x1b8>
ffffffffc0202926:	00009617          	auipc	a2,0x9
ffffffffc020292a:	08260613          	addi	a2,a2,130 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020292e:	17000593          	li	a1,368
ffffffffc0202932:	0000a517          	auipc	a0,0xa
ffffffffc0202936:	cae50513          	addi	a0,a0,-850 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020293a:	b65fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020293e <page_remove>:
ffffffffc020293e:	7179                	addi	sp,sp,-48
ffffffffc0202940:	4601                	li	a2,0
ffffffffc0202942:	ec26                	sd	s1,24(sp)
ffffffffc0202944:	f406                	sd	ra,40(sp)
ffffffffc0202946:	f022                	sd	s0,32(sp)
ffffffffc0202948:	84ae                	mv	s1,a1
ffffffffc020294a:	8dbff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020294e:	c511                	beqz	a0,ffffffffc020295a <page_remove+0x1c>
ffffffffc0202950:	611c                	ld	a5,0(a0)
ffffffffc0202952:	842a                	mv	s0,a0
ffffffffc0202954:	0017f713          	andi	a4,a5,1
ffffffffc0202958:	e711                	bnez	a4,ffffffffc0202964 <page_remove+0x26>
ffffffffc020295a:	70a2                	ld	ra,40(sp)
ffffffffc020295c:	7402                	ld	s0,32(sp)
ffffffffc020295e:	64e2                	ld	s1,24(sp)
ffffffffc0202960:	6145                	addi	sp,sp,48
ffffffffc0202962:	8082                	ret
ffffffffc0202964:	078a                	slli	a5,a5,0x2
ffffffffc0202966:	83b1                	srli	a5,a5,0xc
ffffffffc0202968:	00094717          	auipc	a4,0x94
ffffffffc020296c:	f3873703          	ld	a4,-200(a4) # ffffffffc02968a0 <npage>
ffffffffc0202970:	06e7f363          	bgeu	a5,a4,ffffffffc02029d6 <page_remove+0x98>
ffffffffc0202974:	fff80537          	lui	a0,0xfff80
ffffffffc0202978:	97aa                	add	a5,a5,a0
ffffffffc020297a:	079a                	slli	a5,a5,0x6
ffffffffc020297c:	00094517          	auipc	a0,0x94
ffffffffc0202980:	f2c53503          	ld	a0,-212(a0) # ffffffffc02968a8 <pages>
ffffffffc0202984:	953e                	add	a0,a0,a5
ffffffffc0202986:	411c                	lw	a5,0(a0)
ffffffffc0202988:	fff7871b          	addiw	a4,a5,-1
ffffffffc020298c:	c118                	sw	a4,0(a0)
ffffffffc020298e:	cb11                	beqz	a4,ffffffffc02029a2 <page_remove+0x64>
ffffffffc0202990:	00043023          	sd	zero,0(s0)
ffffffffc0202994:	12048073          	sfence.vma	s1
ffffffffc0202998:	70a2                	ld	ra,40(sp)
ffffffffc020299a:	7402                	ld	s0,32(sp)
ffffffffc020299c:	64e2                	ld	s1,24(sp)
ffffffffc020299e:	6145                	addi	sp,sp,48
ffffffffc02029a0:	8082                	ret
ffffffffc02029a2:	100027f3          	csrr	a5,sstatus
ffffffffc02029a6:	8b89                	andi	a5,a5,2
ffffffffc02029a8:	eb89                	bnez	a5,ffffffffc02029ba <page_remove+0x7c>
ffffffffc02029aa:	00094797          	auipc	a5,0x94
ffffffffc02029ae:	f067b783          	ld	a5,-250(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02029b2:	739c                	ld	a5,32(a5)
ffffffffc02029b4:	4585                	li	a1,1
ffffffffc02029b6:	9782                	jalr	a5
ffffffffc02029b8:	bfe1                	j	ffffffffc0202990 <page_remove+0x52>
ffffffffc02029ba:	e42a                	sd	a0,8(sp)
ffffffffc02029bc:	ab6fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02029c0:	00094797          	auipc	a5,0x94
ffffffffc02029c4:	ef07b783          	ld	a5,-272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02029c8:	739c                	ld	a5,32(a5)
ffffffffc02029ca:	6522                	ld	a0,8(sp)
ffffffffc02029cc:	4585                	li	a1,1
ffffffffc02029ce:	9782                	jalr	a5
ffffffffc02029d0:	a9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02029d4:	bf75                	j	ffffffffc0202990 <page_remove+0x52>
ffffffffc02029d6:	f5eff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02029da <page_insert>:
ffffffffc02029da:	7139                	addi	sp,sp,-64
ffffffffc02029dc:	e852                	sd	s4,16(sp)
ffffffffc02029de:	8a32                	mv	s4,a2
ffffffffc02029e0:	f822                	sd	s0,48(sp)
ffffffffc02029e2:	4605                	li	a2,1
ffffffffc02029e4:	842e                	mv	s0,a1
ffffffffc02029e6:	85d2                	mv	a1,s4
ffffffffc02029e8:	f426                	sd	s1,40(sp)
ffffffffc02029ea:	fc06                	sd	ra,56(sp)
ffffffffc02029ec:	f04a                	sd	s2,32(sp)
ffffffffc02029ee:	ec4e                	sd	s3,24(sp)
ffffffffc02029f0:	e456                	sd	s5,8(sp)
ffffffffc02029f2:	84b6                	mv	s1,a3
ffffffffc02029f4:	831ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02029f8:	c961                	beqz	a0,ffffffffc0202ac8 <page_insert+0xee>
ffffffffc02029fa:	4014                	lw	a3,0(s0)
ffffffffc02029fc:	611c                	ld	a5,0(a0)
ffffffffc02029fe:	89aa                	mv	s3,a0
ffffffffc0202a00:	0016871b          	addiw	a4,a3,1
ffffffffc0202a04:	c018                	sw	a4,0(s0)
ffffffffc0202a06:	0017f713          	andi	a4,a5,1
ffffffffc0202a0a:	ef05                	bnez	a4,ffffffffc0202a42 <page_insert+0x68>
ffffffffc0202a0c:	00094717          	auipc	a4,0x94
ffffffffc0202a10:	e9c73703          	ld	a4,-356(a4) # ffffffffc02968a8 <pages>
ffffffffc0202a14:	8c19                	sub	s0,s0,a4
ffffffffc0202a16:	000807b7          	lui	a5,0x80
ffffffffc0202a1a:	8419                	srai	s0,s0,0x6
ffffffffc0202a1c:	943e                	add	s0,s0,a5
ffffffffc0202a1e:	042a                	slli	s0,s0,0xa
ffffffffc0202a20:	8cc1                	or	s1,s1,s0
ffffffffc0202a22:	0014e493          	ori	s1,s1,1
ffffffffc0202a26:	0099b023          	sd	s1,0(s3) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202a2a:	120a0073          	sfence.vma	s4
ffffffffc0202a2e:	4501                	li	a0,0
ffffffffc0202a30:	70e2                	ld	ra,56(sp)
ffffffffc0202a32:	7442                	ld	s0,48(sp)
ffffffffc0202a34:	74a2                	ld	s1,40(sp)
ffffffffc0202a36:	7902                	ld	s2,32(sp)
ffffffffc0202a38:	69e2                	ld	s3,24(sp)
ffffffffc0202a3a:	6a42                	ld	s4,16(sp)
ffffffffc0202a3c:	6aa2                	ld	s5,8(sp)
ffffffffc0202a3e:	6121                	addi	sp,sp,64
ffffffffc0202a40:	8082                	ret
ffffffffc0202a42:	078a                	slli	a5,a5,0x2
ffffffffc0202a44:	83b1                	srli	a5,a5,0xc
ffffffffc0202a46:	00094717          	auipc	a4,0x94
ffffffffc0202a4a:	e5a73703          	ld	a4,-422(a4) # ffffffffc02968a0 <npage>
ffffffffc0202a4e:	06e7ff63          	bgeu	a5,a4,ffffffffc0202acc <page_insert+0xf2>
ffffffffc0202a52:	00094a97          	auipc	s5,0x94
ffffffffc0202a56:	e56a8a93          	addi	s5,s5,-426 # ffffffffc02968a8 <pages>
ffffffffc0202a5a:	000ab703          	ld	a4,0(s5)
ffffffffc0202a5e:	fff80937          	lui	s2,0xfff80
ffffffffc0202a62:	993e                	add	s2,s2,a5
ffffffffc0202a64:	091a                	slli	s2,s2,0x6
ffffffffc0202a66:	993a                	add	s2,s2,a4
ffffffffc0202a68:	01240c63          	beq	s0,s2,ffffffffc0202a80 <page_insert+0xa6>
ffffffffc0202a6c:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202a70:	fff7869b          	addiw	a3,a5,-1
ffffffffc0202a74:	00d92023          	sw	a3,0(s2)
ffffffffc0202a78:	c691                	beqz	a3,ffffffffc0202a84 <page_insert+0xaa>
ffffffffc0202a7a:	120a0073          	sfence.vma	s4
ffffffffc0202a7e:	bf59                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202a80:	c014                	sw	a3,0(s0)
ffffffffc0202a82:	bf49                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202a84:	100027f3          	csrr	a5,sstatus
ffffffffc0202a88:	8b89                	andi	a5,a5,2
ffffffffc0202a8a:	ef91                	bnez	a5,ffffffffc0202aa6 <page_insert+0xcc>
ffffffffc0202a8c:	00094797          	auipc	a5,0x94
ffffffffc0202a90:	e247b783          	ld	a5,-476(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202a94:	739c                	ld	a5,32(a5)
ffffffffc0202a96:	4585                	li	a1,1
ffffffffc0202a98:	854a                	mv	a0,s2
ffffffffc0202a9a:	9782                	jalr	a5
ffffffffc0202a9c:	000ab703          	ld	a4,0(s5)
ffffffffc0202aa0:	120a0073          	sfence.vma	s4
ffffffffc0202aa4:	bf85                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202aa6:	9ccfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202aaa:	00094797          	auipc	a5,0x94
ffffffffc0202aae:	e067b783          	ld	a5,-506(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202ab2:	739c                	ld	a5,32(a5)
ffffffffc0202ab4:	4585                	li	a1,1
ffffffffc0202ab6:	854a                	mv	a0,s2
ffffffffc0202ab8:	9782                	jalr	a5
ffffffffc0202aba:	9b2fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202abe:	000ab703          	ld	a4,0(s5)
ffffffffc0202ac2:	120a0073          	sfence.vma	s4
ffffffffc0202ac6:	b7b9                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202ac8:	5571                	li	a0,-4
ffffffffc0202aca:	b79d                	j	ffffffffc0202a30 <page_insert+0x56>
ffffffffc0202acc:	e68ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202ad0 <pmm_init>:
ffffffffc0202ad0:	0000a797          	auipc	a5,0xa
ffffffffc0202ad4:	9c078793          	addi	a5,a5,-1600 # ffffffffc020c490 <default_pmm_manager>
ffffffffc0202ad8:	638c                	ld	a1,0(a5)
ffffffffc0202ada:	7159                	addi	sp,sp,-112
ffffffffc0202adc:	f85a                	sd	s6,48(sp)
ffffffffc0202ade:	0000a517          	auipc	a0,0xa
ffffffffc0202ae2:	b8250513          	addi	a0,a0,-1150 # ffffffffc020c660 <default_pmm_manager+0x1d0>
ffffffffc0202ae6:	00094b17          	auipc	s6,0x94
ffffffffc0202aea:	dcab0b13          	addi	s6,s6,-566 # ffffffffc02968b0 <pmm_manager>
ffffffffc0202aee:	f486                	sd	ra,104(sp)
ffffffffc0202af0:	e8ca                	sd	s2,80(sp)
ffffffffc0202af2:	e4ce                	sd	s3,72(sp)
ffffffffc0202af4:	f0a2                	sd	s0,96(sp)
ffffffffc0202af6:	eca6                	sd	s1,88(sp)
ffffffffc0202af8:	e0d2                	sd	s4,64(sp)
ffffffffc0202afa:	fc56                	sd	s5,56(sp)
ffffffffc0202afc:	f45e                	sd	s7,40(sp)
ffffffffc0202afe:	f062                	sd	s8,32(sp)
ffffffffc0202b00:	ec66                	sd	s9,24(sp)
ffffffffc0202b02:	00fb3023          	sd	a5,0(s6)
ffffffffc0202b06:	ea0fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b0a:	000b3783          	ld	a5,0(s6)
ffffffffc0202b0e:	00094997          	auipc	s3,0x94
ffffffffc0202b12:	daa98993          	addi	s3,s3,-598 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202b16:	679c                	ld	a5,8(a5)
ffffffffc0202b18:	9782                	jalr	a5
ffffffffc0202b1a:	57f5                	li	a5,-3
ffffffffc0202b1c:	07fa                	slli	a5,a5,0x1e
ffffffffc0202b1e:	00f9b023          	sd	a5,0(s3)
ffffffffc0202b22:	f27fd0ef          	jal	ra,ffffffffc0200a48 <get_memory_base>
ffffffffc0202b26:	892a                	mv	s2,a0
ffffffffc0202b28:	f2bfd0ef          	jal	ra,ffffffffc0200a52 <get_memory_size>
ffffffffc0202b2c:	280502e3          	beqz	a0,ffffffffc02035b0 <pmm_init+0xae0>
ffffffffc0202b30:	84aa                	mv	s1,a0
ffffffffc0202b32:	0000a517          	auipc	a0,0xa
ffffffffc0202b36:	b6650513          	addi	a0,a0,-1178 # ffffffffc020c698 <default_pmm_manager+0x208>
ffffffffc0202b3a:	e6cfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b3e:	00990433          	add	s0,s2,s1
ffffffffc0202b42:	fff40693          	addi	a3,s0,-1
ffffffffc0202b46:	864a                	mv	a2,s2
ffffffffc0202b48:	85a6                	mv	a1,s1
ffffffffc0202b4a:	0000a517          	auipc	a0,0xa
ffffffffc0202b4e:	b6650513          	addi	a0,a0,-1178 # ffffffffc020c6b0 <default_pmm_manager+0x220>
ffffffffc0202b52:	e54fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b56:	c8000737          	lui	a4,0xc8000
ffffffffc0202b5a:	87a2                	mv	a5,s0
ffffffffc0202b5c:	5e876e63          	bltu	a4,s0,ffffffffc0203158 <pmm_init+0x688>
ffffffffc0202b60:	757d                	lui	a0,0xfffff
ffffffffc0202b62:	00095617          	auipc	a2,0x95
ffffffffc0202b66:	dad60613          	addi	a2,a2,-595 # ffffffffc029790f <end+0xfff>
ffffffffc0202b6a:	8e69                	and	a2,a2,a0
ffffffffc0202b6c:	00094497          	auipc	s1,0x94
ffffffffc0202b70:	d3448493          	addi	s1,s1,-716 # ffffffffc02968a0 <npage>
ffffffffc0202b74:	00c7d513          	srli	a0,a5,0xc
ffffffffc0202b78:	00094b97          	auipc	s7,0x94
ffffffffc0202b7c:	d30b8b93          	addi	s7,s7,-720 # ffffffffc02968a8 <pages>
ffffffffc0202b80:	e088                	sd	a0,0(s1)
ffffffffc0202b82:	00cbb023          	sd	a2,0(s7)
ffffffffc0202b86:	000807b7          	lui	a5,0x80
ffffffffc0202b8a:	86b2                	mv	a3,a2
ffffffffc0202b8c:	02f50863          	beq	a0,a5,ffffffffc0202bbc <pmm_init+0xec>
ffffffffc0202b90:	4781                	li	a5,0
ffffffffc0202b92:	4585                	li	a1,1
ffffffffc0202b94:	fff806b7          	lui	a3,0xfff80
ffffffffc0202b98:	00679513          	slli	a0,a5,0x6
ffffffffc0202b9c:	9532                	add	a0,a0,a2
ffffffffc0202b9e:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd686f8>
ffffffffc0202ba2:	40b7302f          	amoor.d	zero,a1,(a4)
ffffffffc0202ba6:	6088                	ld	a0,0(s1)
ffffffffc0202ba8:	0785                	addi	a5,a5,1
ffffffffc0202baa:	000bb603          	ld	a2,0(s7)
ffffffffc0202bae:	00d50733          	add	a4,a0,a3
ffffffffc0202bb2:	fee7e3e3          	bltu	a5,a4,ffffffffc0202b98 <pmm_init+0xc8>
ffffffffc0202bb6:	071a                	slli	a4,a4,0x6
ffffffffc0202bb8:	00e606b3          	add	a3,a2,a4
ffffffffc0202bbc:	c02007b7          	lui	a5,0xc0200
ffffffffc0202bc0:	3af6eae3          	bltu	a3,a5,ffffffffc0203774 <pmm_init+0xca4>
ffffffffc0202bc4:	0009b583          	ld	a1,0(s3)
ffffffffc0202bc8:	77fd                	lui	a5,0xfffff
ffffffffc0202bca:	8c7d                	and	s0,s0,a5
ffffffffc0202bcc:	8e8d                	sub	a3,a3,a1
ffffffffc0202bce:	5e86e363          	bltu	a3,s0,ffffffffc02031b4 <pmm_init+0x6e4>
ffffffffc0202bd2:	0000a517          	auipc	a0,0xa
ffffffffc0202bd6:	b0650513          	addi	a0,a0,-1274 # ffffffffc020c6d8 <default_pmm_manager+0x248>
ffffffffc0202bda:	dccfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bde:	000b3783          	ld	a5,0(s6)
ffffffffc0202be2:	7b9c                	ld	a5,48(a5)
ffffffffc0202be4:	9782                	jalr	a5
ffffffffc0202be6:	0000a517          	auipc	a0,0xa
ffffffffc0202bea:	b0a50513          	addi	a0,a0,-1270 # ffffffffc020c6f0 <default_pmm_manager+0x260>
ffffffffc0202bee:	db8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bf2:	100027f3          	csrr	a5,sstatus
ffffffffc0202bf6:	8b89                	andi	a5,a5,2
ffffffffc0202bf8:	5a079363          	bnez	a5,ffffffffc020319e <pmm_init+0x6ce>
ffffffffc0202bfc:	000b3783          	ld	a5,0(s6)
ffffffffc0202c00:	4505                	li	a0,1
ffffffffc0202c02:	6f9c                	ld	a5,24(a5)
ffffffffc0202c04:	9782                	jalr	a5
ffffffffc0202c06:	842a                	mv	s0,a0
ffffffffc0202c08:	180408e3          	beqz	s0,ffffffffc0203598 <pmm_init+0xac8>
ffffffffc0202c0c:	000bb683          	ld	a3,0(s7)
ffffffffc0202c10:	5a7d                	li	s4,-1
ffffffffc0202c12:	6098                	ld	a4,0(s1)
ffffffffc0202c14:	40d406b3          	sub	a3,s0,a3
ffffffffc0202c18:	8699                	srai	a3,a3,0x6
ffffffffc0202c1a:	00080437          	lui	s0,0x80
ffffffffc0202c1e:	96a2                	add	a3,a3,s0
ffffffffc0202c20:	00ca5793          	srli	a5,s4,0xc
ffffffffc0202c24:	8ff5                	and	a5,a5,a3
ffffffffc0202c26:	06b2                	slli	a3,a3,0xc
ffffffffc0202c28:	30e7fde3          	bgeu	a5,a4,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0202c2c:	0009b403          	ld	s0,0(s3)
ffffffffc0202c30:	6605                	lui	a2,0x1
ffffffffc0202c32:	4581                	li	a1,0
ffffffffc0202c34:	9436                	add	s0,s0,a3
ffffffffc0202c36:	8522                	mv	a0,s0
ffffffffc0202c38:	08d080ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0202c3c:	0009b683          	ld	a3,0(s3)
ffffffffc0202c40:	77fd                	lui	a5,0xfffff
ffffffffc0202c42:	0000a917          	auipc	s2,0xa
ffffffffc0202c46:	8eb90913          	addi	s2,s2,-1813 # ffffffffc020c52d <default_pmm_manager+0x9d>
ffffffffc0202c4a:	00f97933          	and	s2,s2,a5
ffffffffc0202c4e:	c0200ab7          	lui	s5,0xc0200
ffffffffc0202c52:	3fe00637          	lui	a2,0x3fe00
ffffffffc0202c56:	964a                	add	a2,a2,s2
ffffffffc0202c58:	4729                	li	a4,10
ffffffffc0202c5a:	40da86b3          	sub	a3,s5,a3
ffffffffc0202c5e:	c02005b7          	lui	a1,0xc0200
ffffffffc0202c62:	8522                	mv	a0,s0
ffffffffc0202c64:	fe8ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202c68:	c8000637          	lui	a2,0xc8000
ffffffffc0202c6c:	41260633          	sub	a2,a2,s2
ffffffffc0202c70:	3f596ce3          	bltu	s2,s5,ffffffffc0203868 <pmm_init+0xd98>
ffffffffc0202c74:	0009b683          	ld	a3,0(s3)
ffffffffc0202c78:	85ca                	mv	a1,s2
ffffffffc0202c7a:	4719                	li	a4,6
ffffffffc0202c7c:	40d906b3          	sub	a3,s2,a3
ffffffffc0202c80:	8522                	mv	a0,s0
ffffffffc0202c82:	00094917          	auipc	s2,0x94
ffffffffc0202c86:	c1690913          	addi	s2,s2,-1002 # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0202c8a:	fc2ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202c8e:	00893023          	sd	s0,0(s2)
ffffffffc0202c92:	2d5464e3          	bltu	s0,s5,ffffffffc020375a <pmm_init+0xc8a>
ffffffffc0202c96:	0009b783          	ld	a5,0(s3)
ffffffffc0202c9a:	1a7e                	slli	s4,s4,0x3f
ffffffffc0202c9c:	8c1d                	sub	s0,s0,a5
ffffffffc0202c9e:	00c45793          	srli	a5,s0,0xc
ffffffffc0202ca2:	00094717          	auipc	a4,0x94
ffffffffc0202ca6:	be873723          	sd	s0,-1042(a4) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0202caa:	0147ea33          	or	s4,a5,s4
ffffffffc0202cae:	180a1073          	csrw	satp,s4
ffffffffc0202cb2:	12000073          	sfence.vma
ffffffffc0202cb6:	0000a517          	auipc	a0,0xa
ffffffffc0202cba:	a7a50513          	addi	a0,a0,-1414 # ffffffffc020c730 <default_pmm_manager+0x2a0>
ffffffffc0202cbe:	ce8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202cc2:	0000e717          	auipc	a4,0xe
ffffffffc0202cc6:	33e70713          	addi	a4,a4,830 # ffffffffc0211000 <bootstack>
ffffffffc0202cca:	0000e797          	auipc	a5,0xe
ffffffffc0202cce:	33678793          	addi	a5,a5,822 # ffffffffc0211000 <bootstack>
ffffffffc0202cd2:	5cf70d63          	beq	a4,a5,ffffffffc02032ac <pmm_init+0x7dc>
ffffffffc0202cd6:	100027f3          	csrr	a5,sstatus
ffffffffc0202cda:	8b89                	andi	a5,a5,2
ffffffffc0202cdc:	4a079763          	bnez	a5,ffffffffc020318a <pmm_init+0x6ba>
ffffffffc0202ce0:	000b3783          	ld	a5,0(s6)
ffffffffc0202ce4:	779c                	ld	a5,40(a5)
ffffffffc0202ce6:	9782                	jalr	a5
ffffffffc0202ce8:	842a                	mv	s0,a0
ffffffffc0202cea:	6098                	ld	a4,0(s1)
ffffffffc0202cec:	c80007b7          	lui	a5,0xc8000
ffffffffc0202cf0:	83b1                	srli	a5,a5,0xc
ffffffffc0202cf2:	08e7e3e3          	bltu	a5,a4,ffffffffc0203578 <pmm_init+0xaa8>
ffffffffc0202cf6:	00093503          	ld	a0,0(s2)
ffffffffc0202cfa:	04050fe3          	beqz	a0,ffffffffc0203558 <pmm_init+0xa88>
ffffffffc0202cfe:	03451793          	slli	a5,a0,0x34
ffffffffc0202d02:	04079be3          	bnez	a5,ffffffffc0203558 <pmm_init+0xa88>
ffffffffc0202d06:	4601                	li	a2,0
ffffffffc0202d08:	4581                	li	a1,0
ffffffffc0202d0a:	809ff0ef          	jal	ra,ffffffffc0202512 <get_page>
ffffffffc0202d0e:	2e0511e3          	bnez	a0,ffffffffc02037f0 <pmm_init+0xd20>
ffffffffc0202d12:	100027f3          	csrr	a5,sstatus
ffffffffc0202d16:	8b89                	andi	a5,a5,2
ffffffffc0202d18:	44079e63          	bnez	a5,ffffffffc0203174 <pmm_init+0x6a4>
ffffffffc0202d1c:	000b3783          	ld	a5,0(s6)
ffffffffc0202d20:	4505                	li	a0,1
ffffffffc0202d22:	6f9c                	ld	a5,24(a5)
ffffffffc0202d24:	9782                	jalr	a5
ffffffffc0202d26:	8a2a                	mv	s4,a0
ffffffffc0202d28:	00093503          	ld	a0,0(s2)
ffffffffc0202d2c:	4681                	li	a3,0
ffffffffc0202d2e:	4601                	li	a2,0
ffffffffc0202d30:	85d2                	mv	a1,s4
ffffffffc0202d32:	ca9ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202d36:	26051be3          	bnez	a0,ffffffffc02037ac <pmm_init+0xcdc>
ffffffffc0202d3a:	00093503          	ld	a0,0(s2)
ffffffffc0202d3e:	4601                	li	a2,0
ffffffffc0202d40:	4581                	li	a1,0
ffffffffc0202d42:	ce2ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202d46:	280505e3          	beqz	a0,ffffffffc02037d0 <pmm_init+0xd00>
ffffffffc0202d4a:	611c                	ld	a5,0(a0)
ffffffffc0202d4c:	0017f713          	andi	a4,a5,1
ffffffffc0202d50:	26070ee3          	beqz	a4,ffffffffc02037cc <pmm_init+0xcfc>
ffffffffc0202d54:	6098                	ld	a4,0(s1)
ffffffffc0202d56:	078a                	slli	a5,a5,0x2
ffffffffc0202d58:	83b1                	srli	a5,a5,0xc
ffffffffc0202d5a:	62e7f363          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202d5e:	000bb683          	ld	a3,0(s7)
ffffffffc0202d62:	fff80637          	lui	a2,0xfff80
ffffffffc0202d66:	97b2                	add	a5,a5,a2
ffffffffc0202d68:	079a                	slli	a5,a5,0x6
ffffffffc0202d6a:	97b6                	add	a5,a5,a3
ffffffffc0202d6c:	2afa12e3          	bne	s4,a5,ffffffffc0203810 <pmm_init+0xd40>
ffffffffc0202d70:	000a2683          	lw	a3,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202d74:	4785                	li	a5,1
ffffffffc0202d76:	2cf699e3          	bne	a3,a5,ffffffffc0203848 <pmm_init+0xd78>
ffffffffc0202d7a:	00093503          	ld	a0,0(s2)
ffffffffc0202d7e:	77fd                	lui	a5,0xfffff
ffffffffc0202d80:	6114                	ld	a3,0(a0)
ffffffffc0202d82:	068a                	slli	a3,a3,0x2
ffffffffc0202d84:	8efd                	and	a3,a3,a5
ffffffffc0202d86:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202d8a:	2ae673e3          	bgeu	a2,a4,ffffffffc0203830 <pmm_init+0xd60>
ffffffffc0202d8e:	0009bc03          	ld	s8,0(s3)
ffffffffc0202d92:	96e2                	add	a3,a3,s8
ffffffffc0202d94:	0006ba83          	ld	s5,0(a3) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202d98:	0a8a                	slli	s5,s5,0x2
ffffffffc0202d9a:	00fafab3          	and	s5,s5,a5
ffffffffc0202d9e:	00cad793          	srli	a5,s5,0xc
ffffffffc0202da2:	06e7f3e3          	bgeu	a5,a4,ffffffffc0203608 <pmm_init+0xb38>
ffffffffc0202da6:	4601                	li	a2,0
ffffffffc0202da8:	6585                	lui	a1,0x1
ffffffffc0202daa:	9ae2                	add	s5,s5,s8
ffffffffc0202dac:	c78ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202db0:	0aa1                	addi	s5,s5,8
ffffffffc0202db2:	03551be3          	bne	a0,s5,ffffffffc02035e8 <pmm_init+0xb18>
ffffffffc0202db6:	100027f3          	csrr	a5,sstatus
ffffffffc0202dba:	8b89                	andi	a5,a5,2
ffffffffc0202dbc:	3a079163          	bnez	a5,ffffffffc020315e <pmm_init+0x68e>
ffffffffc0202dc0:	000b3783          	ld	a5,0(s6)
ffffffffc0202dc4:	4505                	li	a0,1
ffffffffc0202dc6:	6f9c                	ld	a5,24(a5)
ffffffffc0202dc8:	9782                	jalr	a5
ffffffffc0202dca:	8c2a                	mv	s8,a0
ffffffffc0202dcc:	00093503          	ld	a0,0(s2)
ffffffffc0202dd0:	46d1                	li	a3,20
ffffffffc0202dd2:	6605                	lui	a2,0x1
ffffffffc0202dd4:	85e2                	mv	a1,s8
ffffffffc0202dd6:	c05ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202dda:	1a0519e3          	bnez	a0,ffffffffc020378c <pmm_init+0xcbc>
ffffffffc0202dde:	00093503          	ld	a0,0(s2)
ffffffffc0202de2:	4601                	li	a2,0
ffffffffc0202de4:	6585                	lui	a1,0x1
ffffffffc0202de6:	c3eff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202dea:	10050ce3          	beqz	a0,ffffffffc0203702 <pmm_init+0xc32>
ffffffffc0202dee:	611c                	ld	a5,0(a0)
ffffffffc0202df0:	0107f713          	andi	a4,a5,16
ffffffffc0202df4:	0e0707e3          	beqz	a4,ffffffffc02036e2 <pmm_init+0xc12>
ffffffffc0202df8:	8b91                	andi	a5,a5,4
ffffffffc0202dfa:	0c0784e3          	beqz	a5,ffffffffc02036c2 <pmm_init+0xbf2>
ffffffffc0202dfe:	00093503          	ld	a0,0(s2)
ffffffffc0202e02:	611c                	ld	a5,0(a0)
ffffffffc0202e04:	8bc1                	andi	a5,a5,16
ffffffffc0202e06:	08078ee3          	beqz	a5,ffffffffc02036a2 <pmm_init+0xbd2>
ffffffffc0202e0a:	000c2703          	lw	a4,0(s8)
ffffffffc0202e0e:	4785                	li	a5,1
ffffffffc0202e10:	06f719e3          	bne	a4,a5,ffffffffc0203682 <pmm_init+0xbb2>
ffffffffc0202e14:	4681                	li	a3,0
ffffffffc0202e16:	6605                	lui	a2,0x1
ffffffffc0202e18:	85d2                	mv	a1,s4
ffffffffc0202e1a:	bc1ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202e1e:	040512e3          	bnez	a0,ffffffffc0203662 <pmm_init+0xb92>
ffffffffc0202e22:	000a2703          	lw	a4,0(s4)
ffffffffc0202e26:	4789                	li	a5,2
ffffffffc0202e28:	00f71de3          	bne	a4,a5,ffffffffc0203642 <pmm_init+0xb72>
ffffffffc0202e2c:	000c2783          	lw	a5,0(s8)
ffffffffc0202e30:	7e079963          	bnez	a5,ffffffffc0203622 <pmm_init+0xb52>
ffffffffc0202e34:	00093503          	ld	a0,0(s2)
ffffffffc0202e38:	4601                	li	a2,0
ffffffffc0202e3a:	6585                	lui	a1,0x1
ffffffffc0202e3c:	be8ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202e40:	54050263          	beqz	a0,ffffffffc0203384 <pmm_init+0x8b4>
ffffffffc0202e44:	6118                	ld	a4,0(a0)
ffffffffc0202e46:	00177793          	andi	a5,a4,1
ffffffffc0202e4a:	180781e3          	beqz	a5,ffffffffc02037cc <pmm_init+0xcfc>
ffffffffc0202e4e:	6094                	ld	a3,0(s1)
ffffffffc0202e50:	00271793          	slli	a5,a4,0x2
ffffffffc0202e54:	83b1                	srli	a5,a5,0xc
ffffffffc0202e56:	52d7f563          	bgeu	a5,a3,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202e5a:	000bb683          	ld	a3,0(s7)
ffffffffc0202e5e:	fff80ab7          	lui	s5,0xfff80
ffffffffc0202e62:	97d6                	add	a5,a5,s5
ffffffffc0202e64:	079a                	slli	a5,a5,0x6
ffffffffc0202e66:	97b6                	add	a5,a5,a3
ffffffffc0202e68:	58fa1e63          	bne	s4,a5,ffffffffc0203404 <pmm_init+0x934>
ffffffffc0202e6c:	8b41                	andi	a4,a4,16
ffffffffc0202e6e:	56071b63          	bnez	a4,ffffffffc02033e4 <pmm_init+0x914>
ffffffffc0202e72:	00093503          	ld	a0,0(s2)
ffffffffc0202e76:	4581                	li	a1,0
ffffffffc0202e78:	ac7ff0ef          	jal	ra,ffffffffc020293e <page_remove>
ffffffffc0202e7c:	000a2c83          	lw	s9,0(s4)
ffffffffc0202e80:	4785                	li	a5,1
ffffffffc0202e82:	5cfc9163          	bne	s9,a5,ffffffffc0203444 <pmm_init+0x974>
ffffffffc0202e86:	000c2783          	lw	a5,0(s8)
ffffffffc0202e8a:	58079d63          	bnez	a5,ffffffffc0203424 <pmm_init+0x954>
ffffffffc0202e8e:	00093503          	ld	a0,0(s2)
ffffffffc0202e92:	6585                	lui	a1,0x1
ffffffffc0202e94:	aabff0ef          	jal	ra,ffffffffc020293e <page_remove>
ffffffffc0202e98:	000a2783          	lw	a5,0(s4)
ffffffffc0202e9c:	200793e3          	bnez	a5,ffffffffc02038a2 <pmm_init+0xdd2>
ffffffffc0202ea0:	000c2783          	lw	a5,0(s8)
ffffffffc0202ea4:	1c079fe3          	bnez	a5,ffffffffc0203882 <pmm_init+0xdb2>
ffffffffc0202ea8:	00093a03          	ld	s4,0(s2)
ffffffffc0202eac:	608c                	ld	a1,0(s1)
ffffffffc0202eae:	000a3683          	ld	a3,0(s4)
ffffffffc0202eb2:	068a                	slli	a3,a3,0x2
ffffffffc0202eb4:	82b1                	srli	a3,a3,0xc
ffffffffc0202eb6:	4cb6f563          	bgeu	a3,a1,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202eba:	000bb503          	ld	a0,0(s7)
ffffffffc0202ebe:	96d6                	add	a3,a3,s5
ffffffffc0202ec0:	069a                	slli	a3,a3,0x6
ffffffffc0202ec2:	00d507b3          	add	a5,a0,a3
ffffffffc0202ec6:	439c                	lw	a5,0(a5)
ffffffffc0202ec8:	4f979e63          	bne	a5,s9,ffffffffc02033c4 <pmm_init+0x8f4>
ffffffffc0202ecc:	8699                	srai	a3,a3,0x6
ffffffffc0202ece:	00080637          	lui	a2,0x80
ffffffffc0202ed2:	96b2                	add	a3,a3,a2
ffffffffc0202ed4:	00c69713          	slli	a4,a3,0xc
ffffffffc0202ed8:	8331                	srli	a4,a4,0xc
ffffffffc0202eda:	06b2                	slli	a3,a3,0xc
ffffffffc0202edc:	06b773e3          	bgeu	a4,a1,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0202ee0:	0009b703          	ld	a4,0(s3)
ffffffffc0202ee4:	96ba                	add	a3,a3,a4
ffffffffc0202ee6:	629c                	ld	a5,0(a3)
ffffffffc0202ee8:	078a                	slli	a5,a5,0x2
ffffffffc0202eea:	83b1                	srli	a5,a5,0xc
ffffffffc0202eec:	48b7fa63          	bgeu	a5,a1,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202ef0:	8f91                	sub	a5,a5,a2
ffffffffc0202ef2:	079a                	slli	a5,a5,0x6
ffffffffc0202ef4:	953e                	add	a0,a0,a5
ffffffffc0202ef6:	100027f3          	csrr	a5,sstatus
ffffffffc0202efa:	8b89                	andi	a5,a5,2
ffffffffc0202efc:	32079463          	bnez	a5,ffffffffc0203224 <pmm_init+0x754>
ffffffffc0202f00:	000b3783          	ld	a5,0(s6)
ffffffffc0202f04:	4585                	li	a1,1
ffffffffc0202f06:	739c                	ld	a5,32(a5)
ffffffffc0202f08:	9782                	jalr	a5
ffffffffc0202f0a:	000a3783          	ld	a5,0(s4)
ffffffffc0202f0e:	6098                	ld	a4,0(s1)
ffffffffc0202f10:	078a                	slli	a5,a5,0x2
ffffffffc0202f12:	83b1                	srli	a5,a5,0xc
ffffffffc0202f14:	46e7f663          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202f18:	000bb503          	ld	a0,0(s7)
ffffffffc0202f1c:	fff80737          	lui	a4,0xfff80
ffffffffc0202f20:	97ba                	add	a5,a5,a4
ffffffffc0202f22:	079a                	slli	a5,a5,0x6
ffffffffc0202f24:	953e                	add	a0,a0,a5
ffffffffc0202f26:	100027f3          	csrr	a5,sstatus
ffffffffc0202f2a:	8b89                	andi	a5,a5,2
ffffffffc0202f2c:	2e079063          	bnez	a5,ffffffffc020320c <pmm_init+0x73c>
ffffffffc0202f30:	000b3783          	ld	a5,0(s6)
ffffffffc0202f34:	4585                	li	a1,1
ffffffffc0202f36:	739c                	ld	a5,32(a5)
ffffffffc0202f38:	9782                	jalr	a5
ffffffffc0202f3a:	00093783          	ld	a5,0(s2)
ffffffffc0202f3e:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0202f42:	12000073          	sfence.vma
ffffffffc0202f46:	100027f3          	csrr	a5,sstatus
ffffffffc0202f4a:	8b89                	andi	a5,a5,2
ffffffffc0202f4c:	2a079663          	bnez	a5,ffffffffc02031f8 <pmm_init+0x728>
ffffffffc0202f50:	000b3783          	ld	a5,0(s6)
ffffffffc0202f54:	779c                	ld	a5,40(a5)
ffffffffc0202f56:	9782                	jalr	a5
ffffffffc0202f58:	8a2a                	mv	s4,a0
ffffffffc0202f5a:	7d441463          	bne	s0,s4,ffffffffc0203722 <pmm_init+0xc52>
ffffffffc0202f5e:	0000a517          	auipc	a0,0xa
ffffffffc0202f62:	b2a50513          	addi	a0,a0,-1238 # ffffffffc020ca88 <default_pmm_manager+0x5f8>
ffffffffc0202f66:	a40fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202f6a:	100027f3          	csrr	a5,sstatus
ffffffffc0202f6e:	8b89                	andi	a5,a5,2
ffffffffc0202f70:	26079a63          	bnez	a5,ffffffffc02031e4 <pmm_init+0x714>
ffffffffc0202f74:	000b3783          	ld	a5,0(s6)
ffffffffc0202f78:	779c                	ld	a5,40(a5)
ffffffffc0202f7a:	9782                	jalr	a5
ffffffffc0202f7c:	8c2a                	mv	s8,a0
ffffffffc0202f7e:	6098                	ld	a4,0(s1)
ffffffffc0202f80:	c0200437          	lui	s0,0xc0200
ffffffffc0202f84:	7afd                	lui	s5,0xfffff
ffffffffc0202f86:	00c71793          	slli	a5,a4,0xc
ffffffffc0202f8a:	6a05                	lui	s4,0x1
ffffffffc0202f8c:	02f47c63          	bgeu	s0,a5,ffffffffc0202fc4 <pmm_init+0x4f4>
ffffffffc0202f90:	00c45793          	srli	a5,s0,0xc
ffffffffc0202f94:	00093503          	ld	a0,0(s2)
ffffffffc0202f98:	3ae7f763          	bgeu	a5,a4,ffffffffc0203346 <pmm_init+0x876>
ffffffffc0202f9c:	0009b583          	ld	a1,0(s3)
ffffffffc0202fa0:	4601                	li	a2,0
ffffffffc0202fa2:	95a2                	add	a1,a1,s0
ffffffffc0202fa4:	a80ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202fa8:	36050f63          	beqz	a0,ffffffffc0203326 <pmm_init+0x856>
ffffffffc0202fac:	611c                	ld	a5,0(a0)
ffffffffc0202fae:	078a                	slli	a5,a5,0x2
ffffffffc0202fb0:	0157f7b3          	and	a5,a5,s5
ffffffffc0202fb4:	3a879663          	bne	a5,s0,ffffffffc0203360 <pmm_init+0x890>
ffffffffc0202fb8:	6098                	ld	a4,0(s1)
ffffffffc0202fba:	9452                	add	s0,s0,s4
ffffffffc0202fbc:	00c71793          	slli	a5,a4,0xc
ffffffffc0202fc0:	fcf468e3          	bltu	s0,a5,ffffffffc0202f90 <pmm_init+0x4c0>
ffffffffc0202fc4:	00093783          	ld	a5,0(s2)
ffffffffc0202fc8:	639c                	ld	a5,0(a5)
ffffffffc0202fca:	48079d63          	bnez	a5,ffffffffc0203464 <pmm_init+0x994>
ffffffffc0202fce:	100027f3          	csrr	a5,sstatus
ffffffffc0202fd2:	8b89                	andi	a5,a5,2
ffffffffc0202fd4:	26079463          	bnez	a5,ffffffffc020323c <pmm_init+0x76c>
ffffffffc0202fd8:	000b3783          	ld	a5,0(s6)
ffffffffc0202fdc:	4505                	li	a0,1
ffffffffc0202fde:	6f9c                	ld	a5,24(a5)
ffffffffc0202fe0:	9782                	jalr	a5
ffffffffc0202fe2:	8a2a                	mv	s4,a0
ffffffffc0202fe4:	00093503          	ld	a0,0(s2)
ffffffffc0202fe8:	4699                	li	a3,6
ffffffffc0202fea:	10000613          	li	a2,256
ffffffffc0202fee:	85d2                	mv	a1,s4
ffffffffc0202ff0:	9ebff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202ff4:	4a051863          	bnez	a0,ffffffffc02034a4 <pmm_init+0x9d4>
ffffffffc0202ff8:	000a2703          	lw	a4,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202ffc:	4785                	li	a5,1
ffffffffc0202ffe:	48f71363          	bne	a4,a5,ffffffffc0203484 <pmm_init+0x9b4>
ffffffffc0203002:	00093503          	ld	a0,0(s2)
ffffffffc0203006:	6405                	lui	s0,0x1
ffffffffc0203008:	4699                	li	a3,6
ffffffffc020300a:	10040613          	addi	a2,s0,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc020300e:	85d2                	mv	a1,s4
ffffffffc0203010:	9cbff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203014:	38051863          	bnez	a0,ffffffffc02033a4 <pmm_init+0x8d4>
ffffffffc0203018:	000a2703          	lw	a4,0(s4)
ffffffffc020301c:	4789                	li	a5,2
ffffffffc020301e:	4ef71363          	bne	a4,a5,ffffffffc0203504 <pmm_init+0xa34>
ffffffffc0203022:	0000a597          	auipc	a1,0xa
ffffffffc0203026:	bae58593          	addi	a1,a1,-1106 # ffffffffc020cbd0 <default_pmm_manager+0x740>
ffffffffc020302a:	10000513          	li	a0,256
ffffffffc020302e:	42a080ef          	jal	ra,ffffffffc020b458 <strcpy>
ffffffffc0203032:	10040593          	addi	a1,s0,256
ffffffffc0203036:	10000513          	li	a0,256
ffffffffc020303a:	430080ef          	jal	ra,ffffffffc020b46a <strcmp>
ffffffffc020303e:	4a051363          	bnez	a0,ffffffffc02034e4 <pmm_init+0xa14>
ffffffffc0203042:	000bb683          	ld	a3,0(s7)
ffffffffc0203046:	00080737          	lui	a4,0x80
ffffffffc020304a:	547d                	li	s0,-1
ffffffffc020304c:	40da06b3          	sub	a3,s4,a3
ffffffffc0203050:	8699                	srai	a3,a3,0x6
ffffffffc0203052:	609c                	ld	a5,0(s1)
ffffffffc0203054:	96ba                	add	a3,a3,a4
ffffffffc0203056:	8031                	srli	s0,s0,0xc
ffffffffc0203058:	0086f733          	and	a4,a3,s0
ffffffffc020305c:	06b2                	slli	a3,a3,0xc
ffffffffc020305e:	6ef77263          	bgeu	a4,a5,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0203062:	0009b783          	ld	a5,0(s3)
ffffffffc0203066:	10000513          	li	a0,256
ffffffffc020306a:	96be                	add	a3,a3,a5
ffffffffc020306c:	10068023          	sb	zero,256(a3)
ffffffffc0203070:	3b2080ef          	jal	ra,ffffffffc020b422 <strlen>
ffffffffc0203074:	44051863          	bnez	a0,ffffffffc02034c4 <pmm_init+0x9f4>
ffffffffc0203078:	00093a83          	ld	s5,0(s2)
ffffffffc020307c:	609c                	ld	a5,0(s1)
ffffffffc020307e:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0203082:	068a                	slli	a3,a3,0x2
ffffffffc0203084:	82b1                	srli	a3,a3,0xc
ffffffffc0203086:	2ef6fd63          	bgeu	a3,a5,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc020308a:	8c75                	and	s0,s0,a3
ffffffffc020308c:	06b2                	slli	a3,a3,0xc
ffffffffc020308e:	6af47a63          	bgeu	s0,a5,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0203092:	0009b403          	ld	s0,0(s3)
ffffffffc0203096:	9436                	add	s0,s0,a3
ffffffffc0203098:	100027f3          	csrr	a5,sstatus
ffffffffc020309c:	8b89                	andi	a5,a5,2
ffffffffc020309e:	1e079c63          	bnez	a5,ffffffffc0203296 <pmm_init+0x7c6>
ffffffffc02030a2:	000b3783          	ld	a5,0(s6)
ffffffffc02030a6:	4585                	li	a1,1
ffffffffc02030a8:	8552                	mv	a0,s4
ffffffffc02030aa:	739c                	ld	a5,32(a5)
ffffffffc02030ac:	9782                	jalr	a5
ffffffffc02030ae:	601c                	ld	a5,0(s0)
ffffffffc02030b0:	6098                	ld	a4,0(s1)
ffffffffc02030b2:	078a                	slli	a5,a5,0x2
ffffffffc02030b4:	83b1                	srli	a5,a5,0xc
ffffffffc02030b6:	2ce7f563          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02030ba:	000bb503          	ld	a0,0(s7)
ffffffffc02030be:	fff80737          	lui	a4,0xfff80
ffffffffc02030c2:	97ba                	add	a5,a5,a4
ffffffffc02030c4:	079a                	slli	a5,a5,0x6
ffffffffc02030c6:	953e                	add	a0,a0,a5
ffffffffc02030c8:	100027f3          	csrr	a5,sstatus
ffffffffc02030cc:	8b89                	andi	a5,a5,2
ffffffffc02030ce:	1a079863          	bnez	a5,ffffffffc020327e <pmm_init+0x7ae>
ffffffffc02030d2:	000b3783          	ld	a5,0(s6)
ffffffffc02030d6:	4585                	li	a1,1
ffffffffc02030d8:	739c                	ld	a5,32(a5)
ffffffffc02030da:	9782                	jalr	a5
ffffffffc02030dc:	000ab783          	ld	a5,0(s5)
ffffffffc02030e0:	6098                	ld	a4,0(s1)
ffffffffc02030e2:	078a                	slli	a5,a5,0x2
ffffffffc02030e4:	83b1                	srli	a5,a5,0xc
ffffffffc02030e6:	28e7fd63          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02030ea:	000bb503          	ld	a0,0(s7)
ffffffffc02030ee:	fff80737          	lui	a4,0xfff80
ffffffffc02030f2:	97ba                	add	a5,a5,a4
ffffffffc02030f4:	079a                	slli	a5,a5,0x6
ffffffffc02030f6:	953e                	add	a0,a0,a5
ffffffffc02030f8:	100027f3          	csrr	a5,sstatus
ffffffffc02030fc:	8b89                	andi	a5,a5,2
ffffffffc02030fe:	16079463          	bnez	a5,ffffffffc0203266 <pmm_init+0x796>
ffffffffc0203102:	000b3783          	ld	a5,0(s6)
ffffffffc0203106:	4585                	li	a1,1
ffffffffc0203108:	739c                	ld	a5,32(a5)
ffffffffc020310a:	9782                	jalr	a5
ffffffffc020310c:	00093783          	ld	a5,0(s2)
ffffffffc0203110:	0007b023          	sd	zero,0(a5)
ffffffffc0203114:	12000073          	sfence.vma
ffffffffc0203118:	100027f3          	csrr	a5,sstatus
ffffffffc020311c:	8b89                	andi	a5,a5,2
ffffffffc020311e:	12079a63          	bnez	a5,ffffffffc0203252 <pmm_init+0x782>
ffffffffc0203122:	000b3783          	ld	a5,0(s6)
ffffffffc0203126:	779c                	ld	a5,40(a5)
ffffffffc0203128:	9782                	jalr	a5
ffffffffc020312a:	842a                	mv	s0,a0
ffffffffc020312c:	488c1e63          	bne	s8,s0,ffffffffc02035c8 <pmm_init+0xaf8>
ffffffffc0203130:	0000a517          	auipc	a0,0xa
ffffffffc0203134:	b1850513          	addi	a0,a0,-1256 # ffffffffc020cc48 <default_pmm_manager+0x7b8>
ffffffffc0203138:	86efd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020313c:	7406                	ld	s0,96(sp)
ffffffffc020313e:	70a6                	ld	ra,104(sp)
ffffffffc0203140:	64e6                	ld	s1,88(sp)
ffffffffc0203142:	6946                	ld	s2,80(sp)
ffffffffc0203144:	69a6                	ld	s3,72(sp)
ffffffffc0203146:	6a06                	ld	s4,64(sp)
ffffffffc0203148:	7ae2                	ld	s5,56(sp)
ffffffffc020314a:	7b42                	ld	s6,48(sp)
ffffffffc020314c:	7ba2                	ld	s7,40(sp)
ffffffffc020314e:	7c02                	ld	s8,32(sp)
ffffffffc0203150:	6ce2                	ld	s9,24(sp)
ffffffffc0203152:	6165                	addi	sp,sp,112
ffffffffc0203154:	e17fe06f          	j	ffffffffc0201f6a <kmalloc_init>
ffffffffc0203158:	c80007b7          	lui	a5,0xc8000
ffffffffc020315c:	b411                	j	ffffffffc0202b60 <pmm_init+0x90>
ffffffffc020315e:	b15fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203162:	000b3783          	ld	a5,0(s6)
ffffffffc0203166:	4505                	li	a0,1
ffffffffc0203168:	6f9c                	ld	a5,24(a5)
ffffffffc020316a:	9782                	jalr	a5
ffffffffc020316c:	8c2a                	mv	s8,a0
ffffffffc020316e:	afffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203172:	b9a9                	j	ffffffffc0202dcc <pmm_init+0x2fc>
ffffffffc0203174:	afffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203178:	000b3783          	ld	a5,0(s6)
ffffffffc020317c:	4505                	li	a0,1
ffffffffc020317e:	6f9c                	ld	a5,24(a5)
ffffffffc0203180:	9782                	jalr	a5
ffffffffc0203182:	8a2a                	mv	s4,a0
ffffffffc0203184:	ae9fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203188:	b645                	j	ffffffffc0202d28 <pmm_init+0x258>
ffffffffc020318a:	ae9fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020318e:	000b3783          	ld	a5,0(s6)
ffffffffc0203192:	779c                	ld	a5,40(a5)
ffffffffc0203194:	9782                	jalr	a5
ffffffffc0203196:	842a                	mv	s0,a0
ffffffffc0203198:	ad5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020319c:	b6b9                	j	ffffffffc0202cea <pmm_init+0x21a>
ffffffffc020319e:	ad5fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031a2:	000b3783          	ld	a5,0(s6)
ffffffffc02031a6:	4505                	li	a0,1
ffffffffc02031a8:	6f9c                	ld	a5,24(a5)
ffffffffc02031aa:	9782                	jalr	a5
ffffffffc02031ac:	842a                	mv	s0,a0
ffffffffc02031ae:	abffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02031b2:	bc99                	j	ffffffffc0202c08 <pmm_init+0x138>
ffffffffc02031b4:	6705                	lui	a4,0x1
ffffffffc02031b6:	177d                	addi	a4,a4,-1
ffffffffc02031b8:	96ba                	add	a3,a3,a4
ffffffffc02031ba:	8ff5                	and	a5,a5,a3
ffffffffc02031bc:	00c7d713          	srli	a4,a5,0xc
ffffffffc02031c0:	1ca77063          	bgeu	a4,a0,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02031c4:	000b3683          	ld	a3,0(s6)
ffffffffc02031c8:	fff80537          	lui	a0,0xfff80
ffffffffc02031cc:	972a                	add	a4,a4,a0
ffffffffc02031ce:	6a94                	ld	a3,16(a3)
ffffffffc02031d0:	8c1d                	sub	s0,s0,a5
ffffffffc02031d2:	00671513          	slli	a0,a4,0x6
ffffffffc02031d6:	00c45593          	srli	a1,s0,0xc
ffffffffc02031da:	9532                	add	a0,a0,a2
ffffffffc02031dc:	9682                	jalr	a3
ffffffffc02031de:	0009b583          	ld	a1,0(s3)
ffffffffc02031e2:	bac5                	j	ffffffffc0202bd2 <pmm_init+0x102>
ffffffffc02031e4:	a8ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031e8:	000b3783          	ld	a5,0(s6)
ffffffffc02031ec:	779c                	ld	a5,40(a5)
ffffffffc02031ee:	9782                	jalr	a5
ffffffffc02031f0:	8c2a                	mv	s8,a0
ffffffffc02031f2:	a7bfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02031f6:	b361                	j	ffffffffc0202f7e <pmm_init+0x4ae>
ffffffffc02031f8:	a7bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031fc:	000b3783          	ld	a5,0(s6)
ffffffffc0203200:	779c                	ld	a5,40(a5)
ffffffffc0203202:	9782                	jalr	a5
ffffffffc0203204:	8a2a                	mv	s4,a0
ffffffffc0203206:	a67fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020320a:	bb81                	j	ffffffffc0202f5a <pmm_init+0x48a>
ffffffffc020320c:	e42a                	sd	a0,8(sp)
ffffffffc020320e:	a65fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203212:	000b3783          	ld	a5,0(s6)
ffffffffc0203216:	6522                	ld	a0,8(sp)
ffffffffc0203218:	4585                	li	a1,1
ffffffffc020321a:	739c                	ld	a5,32(a5)
ffffffffc020321c:	9782                	jalr	a5
ffffffffc020321e:	a4ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203222:	bb21                	j	ffffffffc0202f3a <pmm_init+0x46a>
ffffffffc0203224:	e42a                	sd	a0,8(sp)
ffffffffc0203226:	a4dfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020322a:	000b3783          	ld	a5,0(s6)
ffffffffc020322e:	6522                	ld	a0,8(sp)
ffffffffc0203230:	4585                	li	a1,1
ffffffffc0203232:	739c                	ld	a5,32(a5)
ffffffffc0203234:	9782                	jalr	a5
ffffffffc0203236:	a37fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020323a:	b9c1                	j	ffffffffc0202f0a <pmm_init+0x43a>
ffffffffc020323c:	a37fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203240:	000b3783          	ld	a5,0(s6)
ffffffffc0203244:	4505                	li	a0,1
ffffffffc0203246:	6f9c                	ld	a5,24(a5)
ffffffffc0203248:	9782                	jalr	a5
ffffffffc020324a:	8a2a                	mv	s4,a0
ffffffffc020324c:	a21fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203250:	bb51                	j	ffffffffc0202fe4 <pmm_init+0x514>
ffffffffc0203252:	a21fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203256:	000b3783          	ld	a5,0(s6)
ffffffffc020325a:	779c                	ld	a5,40(a5)
ffffffffc020325c:	9782                	jalr	a5
ffffffffc020325e:	842a                	mv	s0,a0
ffffffffc0203260:	a0dfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203264:	b5e1                	j	ffffffffc020312c <pmm_init+0x65c>
ffffffffc0203266:	e42a                	sd	a0,8(sp)
ffffffffc0203268:	a0bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020326c:	000b3783          	ld	a5,0(s6)
ffffffffc0203270:	6522                	ld	a0,8(sp)
ffffffffc0203272:	4585                	li	a1,1
ffffffffc0203274:	739c                	ld	a5,32(a5)
ffffffffc0203276:	9782                	jalr	a5
ffffffffc0203278:	9f5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020327c:	bd41                	j	ffffffffc020310c <pmm_init+0x63c>
ffffffffc020327e:	e42a                	sd	a0,8(sp)
ffffffffc0203280:	9f3fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203284:	000b3783          	ld	a5,0(s6)
ffffffffc0203288:	6522                	ld	a0,8(sp)
ffffffffc020328a:	4585                	li	a1,1
ffffffffc020328c:	739c                	ld	a5,32(a5)
ffffffffc020328e:	9782                	jalr	a5
ffffffffc0203290:	9ddfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203294:	b5a1                	j	ffffffffc02030dc <pmm_init+0x60c>
ffffffffc0203296:	9ddfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020329a:	000b3783          	ld	a5,0(s6)
ffffffffc020329e:	4585                	li	a1,1
ffffffffc02032a0:	8552                	mv	a0,s4
ffffffffc02032a2:	739c                	ld	a5,32(a5)
ffffffffc02032a4:	9782                	jalr	a5
ffffffffc02032a6:	9c7fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032aa:	b511                	j	ffffffffc02030ae <pmm_init+0x5de>
ffffffffc02032ac:	00010417          	auipc	s0,0x10
ffffffffc02032b0:	d5440413          	addi	s0,s0,-684 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032b4:	00010797          	auipc	a5,0x10
ffffffffc02032b8:	d4c78793          	addi	a5,a5,-692 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032bc:	a0f41de3          	bne	s0,a5,ffffffffc0202cd6 <pmm_init+0x206>
ffffffffc02032c0:	4581                	li	a1,0
ffffffffc02032c2:	6605                	lui	a2,0x1
ffffffffc02032c4:	8522                	mv	a0,s0
ffffffffc02032c6:	1fe080ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc02032ca:	0000d597          	auipc	a1,0xd
ffffffffc02032ce:	d3658593          	addi	a1,a1,-714 # ffffffffc0210000 <bootstackguard>
ffffffffc02032d2:	0000e797          	auipc	a5,0xe
ffffffffc02032d6:	d20786a3          	sb	zero,-723(a5) # ffffffffc0210fff <bootstackguard+0xfff>
ffffffffc02032da:	0000d797          	auipc	a5,0xd
ffffffffc02032de:	d2078323          	sb	zero,-730(a5) # ffffffffc0210000 <bootstackguard>
ffffffffc02032e2:	00093503          	ld	a0,0(s2)
ffffffffc02032e6:	2555ec63          	bltu	a1,s5,ffffffffc020353e <pmm_init+0xa6e>
ffffffffc02032ea:	0009b683          	ld	a3,0(s3)
ffffffffc02032ee:	4701                	li	a4,0
ffffffffc02032f0:	6605                	lui	a2,0x1
ffffffffc02032f2:	40d586b3          	sub	a3,a1,a3
ffffffffc02032f6:	956ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc02032fa:	00093503          	ld	a0,0(s2)
ffffffffc02032fe:	23546363          	bltu	s0,s5,ffffffffc0203524 <pmm_init+0xa54>
ffffffffc0203302:	0009b683          	ld	a3,0(s3)
ffffffffc0203306:	4701                	li	a4,0
ffffffffc0203308:	6605                	lui	a2,0x1
ffffffffc020330a:	40d406b3          	sub	a3,s0,a3
ffffffffc020330e:	85a2                	mv	a1,s0
ffffffffc0203310:	93cff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0203314:	12000073          	sfence.vma
ffffffffc0203318:	00009517          	auipc	a0,0x9
ffffffffc020331c:	44050513          	addi	a0,a0,1088 # ffffffffc020c758 <default_pmm_manager+0x2c8>
ffffffffc0203320:	e87fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0203324:	ba4d                	j	ffffffffc0202cd6 <pmm_init+0x206>
ffffffffc0203326:	00009697          	auipc	a3,0x9
ffffffffc020332a:	78268693          	addi	a3,a3,1922 # ffffffffc020caa8 <default_pmm_manager+0x618>
ffffffffc020332e:	00008617          	auipc	a2,0x8
ffffffffc0203332:	67a60613          	addi	a2,a2,1658 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203336:	28800593          	li	a1,648
ffffffffc020333a:	00009517          	auipc	a0,0x9
ffffffffc020333e:	2a650513          	addi	a0,a0,678 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203342:	95cfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203346:	86a2                	mv	a3,s0
ffffffffc0203348:	00009617          	auipc	a2,0x9
ffffffffc020334c:	18060613          	addi	a2,a2,384 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc0203350:	28800593          	li	a1,648
ffffffffc0203354:	00009517          	auipc	a0,0x9
ffffffffc0203358:	28c50513          	addi	a0,a0,652 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020335c:	942fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203360:	00009697          	auipc	a3,0x9
ffffffffc0203364:	78868693          	addi	a3,a3,1928 # ffffffffc020cae8 <default_pmm_manager+0x658>
ffffffffc0203368:	00008617          	auipc	a2,0x8
ffffffffc020336c:	64060613          	addi	a2,a2,1600 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203370:	28900593          	li	a1,649
ffffffffc0203374:	00009517          	auipc	a0,0x9
ffffffffc0203378:	26c50513          	addi	a0,a0,620 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020337c:	922fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203380:	db5fe0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc0203384:	00009697          	auipc	a3,0x9
ffffffffc0203388:	58c68693          	addi	a3,a3,1420 # ffffffffc020c910 <default_pmm_manager+0x480>
ffffffffc020338c:	00008617          	auipc	a2,0x8
ffffffffc0203390:	61c60613          	addi	a2,a2,1564 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203394:	26500593          	li	a1,613
ffffffffc0203398:	00009517          	auipc	a0,0x9
ffffffffc020339c:	24850513          	addi	a0,a0,584 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02033a0:	8fefd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033a4:	00009697          	auipc	a3,0x9
ffffffffc02033a8:	7cc68693          	addi	a3,a3,1996 # ffffffffc020cb70 <default_pmm_manager+0x6e0>
ffffffffc02033ac:	00008617          	auipc	a2,0x8
ffffffffc02033b0:	5fc60613          	addi	a2,a2,1532 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02033b4:	29200593          	li	a1,658
ffffffffc02033b8:	00009517          	auipc	a0,0x9
ffffffffc02033bc:	22850513          	addi	a0,a0,552 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02033c0:	8defd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033c4:	00009697          	auipc	a3,0x9
ffffffffc02033c8:	66c68693          	addi	a3,a3,1644 # ffffffffc020ca30 <default_pmm_manager+0x5a0>
ffffffffc02033cc:	00008617          	auipc	a2,0x8
ffffffffc02033d0:	5dc60613          	addi	a2,a2,1500 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02033d4:	27100593          	li	a1,625
ffffffffc02033d8:	00009517          	auipc	a0,0x9
ffffffffc02033dc:	20850513          	addi	a0,a0,520 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02033e0:	8befd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033e4:	00009697          	auipc	a3,0x9
ffffffffc02033e8:	61c68693          	addi	a3,a3,1564 # ffffffffc020ca00 <default_pmm_manager+0x570>
ffffffffc02033ec:	00008617          	auipc	a2,0x8
ffffffffc02033f0:	5bc60613          	addi	a2,a2,1468 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02033f4:	26700593          	li	a1,615
ffffffffc02033f8:	00009517          	auipc	a0,0x9
ffffffffc02033fc:	1e850513          	addi	a0,a0,488 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203400:	89efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203404:	00009697          	auipc	a3,0x9
ffffffffc0203408:	46c68693          	addi	a3,a3,1132 # ffffffffc020c870 <default_pmm_manager+0x3e0>
ffffffffc020340c:	00008617          	auipc	a2,0x8
ffffffffc0203410:	59c60613          	addi	a2,a2,1436 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203414:	26600593          	li	a1,614
ffffffffc0203418:	00009517          	auipc	a0,0x9
ffffffffc020341c:	1c850513          	addi	a0,a0,456 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203420:	87efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203424:	00009697          	auipc	a3,0x9
ffffffffc0203428:	5c468693          	addi	a3,a3,1476 # ffffffffc020c9e8 <default_pmm_manager+0x558>
ffffffffc020342c:	00008617          	auipc	a2,0x8
ffffffffc0203430:	57c60613          	addi	a2,a2,1404 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203434:	26b00593          	li	a1,619
ffffffffc0203438:	00009517          	auipc	a0,0x9
ffffffffc020343c:	1a850513          	addi	a0,a0,424 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203440:	85efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203444:	00009697          	auipc	a3,0x9
ffffffffc0203448:	44468693          	addi	a3,a3,1092 # ffffffffc020c888 <default_pmm_manager+0x3f8>
ffffffffc020344c:	00008617          	auipc	a2,0x8
ffffffffc0203450:	55c60613          	addi	a2,a2,1372 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203454:	26a00593          	li	a1,618
ffffffffc0203458:	00009517          	auipc	a0,0x9
ffffffffc020345c:	18850513          	addi	a0,a0,392 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203460:	83efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203464:	00009697          	auipc	a3,0x9
ffffffffc0203468:	69c68693          	addi	a3,a3,1692 # ffffffffc020cb00 <default_pmm_manager+0x670>
ffffffffc020346c:	00008617          	auipc	a2,0x8
ffffffffc0203470:	53c60613          	addi	a2,a2,1340 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203474:	28c00593          	li	a1,652
ffffffffc0203478:	00009517          	auipc	a0,0x9
ffffffffc020347c:	16850513          	addi	a0,a0,360 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203480:	81efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203484:	00009697          	auipc	a3,0x9
ffffffffc0203488:	6d468693          	addi	a3,a3,1748 # ffffffffc020cb58 <default_pmm_manager+0x6c8>
ffffffffc020348c:	00008617          	auipc	a2,0x8
ffffffffc0203490:	51c60613          	addi	a2,a2,1308 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203494:	29100593          	li	a1,657
ffffffffc0203498:	00009517          	auipc	a0,0x9
ffffffffc020349c:	14850513          	addi	a0,a0,328 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02034a0:	ffffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034a4:	00009697          	auipc	a3,0x9
ffffffffc02034a8:	67468693          	addi	a3,a3,1652 # ffffffffc020cb18 <default_pmm_manager+0x688>
ffffffffc02034ac:	00008617          	auipc	a2,0x8
ffffffffc02034b0:	4fc60613          	addi	a2,a2,1276 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02034b4:	29000593          	li	a1,656
ffffffffc02034b8:	00009517          	auipc	a0,0x9
ffffffffc02034bc:	12850513          	addi	a0,a0,296 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02034c0:	fdffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034c4:	00009697          	auipc	a3,0x9
ffffffffc02034c8:	75c68693          	addi	a3,a3,1884 # ffffffffc020cc20 <default_pmm_manager+0x790>
ffffffffc02034cc:	00008617          	auipc	a2,0x8
ffffffffc02034d0:	4dc60613          	addi	a2,a2,1244 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02034d4:	29a00593          	li	a1,666
ffffffffc02034d8:	00009517          	auipc	a0,0x9
ffffffffc02034dc:	10850513          	addi	a0,a0,264 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02034e0:	fbffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034e4:	00009697          	auipc	a3,0x9
ffffffffc02034e8:	70468693          	addi	a3,a3,1796 # ffffffffc020cbe8 <default_pmm_manager+0x758>
ffffffffc02034ec:	00008617          	auipc	a2,0x8
ffffffffc02034f0:	4bc60613          	addi	a2,a2,1212 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02034f4:	29700593          	li	a1,663
ffffffffc02034f8:	00009517          	auipc	a0,0x9
ffffffffc02034fc:	0e850513          	addi	a0,a0,232 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203500:	f9ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203504:	00009697          	auipc	a3,0x9
ffffffffc0203508:	6b468693          	addi	a3,a3,1716 # ffffffffc020cbb8 <default_pmm_manager+0x728>
ffffffffc020350c:	00008617          	auipc	a2,0x8
ffffffffc0203510:	49c60613          	addi	a2,a2,1180 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203514:	29300593          	li	a1,659
ffffffffc0203518:	00009517          	auipc	a0,0x9
ffffffffc020351c:	0c850513          	addi	a0,a0,200 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203520:	f7ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203524:	86a2                	mv	a3,s0
ffffffffc0203526:	00009617          	auipc	a2,0x9
ffffffffc020352a:	04a60613          	addi	a2,a2,74 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc020352e:	0dc00593          	li	a1,220
ffffffffc0203532:	00009517          	auipc	a0,0x9
ffffffffc0203536:	0ae50513          	addi	a0,a0,174 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020353a:	f65fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020353e:	86ae                	mv	a3,a1
ffffffffc0203540:	00009617          	auipc	a2,0x9
ffffffffc0203544:	03060613          	addi	a2,a2,48 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc0203548:	0db00593          	li	a1,219
ffffffffc020354c:	00009517          	auipc	a0,0x9
ffffffffc0203550:	09450513          	addi	a0,a0,148 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203554:	f4bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203558:	00009697          	auipc	a3,0x9
ffffffffc020355c:	24868693          	addi	a3,a3,584 # ffffffffc020c7a0 <default_pmm_manager+0x310>
ffffffffc0203560:	00008617          	auipc	a2,0x8
ffffffffc0203564:	44860613          	addi	a2,a2,1096 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203568:	24a00593          	li	a1,586
ffffffffc020356c:	00009517          	auipc	a0,0x9
ffffffffc0203570:	07450513          	addi	a0,a0,116 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203574:	f2bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203578:	00009697          	auipc	a3,0x9
ffffffffc020357c:	20868693          	addi	a3,a3,520 # ffffffffc020c780 <default_pmm_manager+0x2f0>
ffffffffc0203580:	00008617          	auipc	a2,0x8
ffffffffc0203584:	42860613          	addi	a2,a2,1064 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203588:	24900593          	li	a1,585
ffffffffc020358c:	00009517          	auipc	a0,0x9
ffffffffc0203590:	05450513          	addi	a0,a0,84 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203594:	f0bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203598:	00009617          	auipc	a2,0x9
ffffffffc020359c:	17860613          	addi	a2,a2,376 # ffffffffc020c710 <default_pmm_manager+0x280>
ffffffffc02035a0:	0aa00593          	li	a1,170
ffffffffc02035a4:	00009517          	auipc	a0,0x9
ffffffffc02035a8:	03c50513          	addi	a0,a0,60 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02035ac:	ef3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035b0:	00009617          	auipc	a2,0x9
ffffffffc02035b4:	0c860613          	addi	a2,a2,200 # ffffffffc020c678 <default_pmm_manager+0x1e8>
ffffffffc02035b8:	06500593          	li	a1,101
ffffffffc02035bc:	00009517          	auipc	a0,0x9
ffffffffc02035c0:	02450513          	addi	a0,a0,36 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02035c4:	edbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035c8:	00009697          	auipc	a3,0x9
ffffffffc02035cc:	49868693          	addi	a3,a3,1176 # ffffffffc020ca60 <default_pmm_manager+0x5d0>
ffffffffc02035d0:	00008617          	auipc	a2,0x8
ffffffffc02035d4:	3d860613          	addi	a2,a2,984 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02035d8:	2a300593          	li	a1,675
ffffffffc02035dc:	00009517          	auipc	a0,0x9
ffffffffc02035e0:	00450513          	addi	a0,a0,4 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02035e4:	ebbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035e8:	00009697          	auipc	a3,0x9
ffffffffc02035ec:	2b868693          	addi	a3,a3,696 # ffffffffc020c8a0 <default_pmm_manager+0x410>
ffffffffc02035f0:	00008617          	auipc	a2,0x8
ffffffffc02035f4:	3b860613          	addi	a2,a2,952 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02035f8:	25800593          	li	a1,600
ffffffffc02035fc:	00009517          	auipc	a0,0x9
ffffffffc0203600:	fe450513          	addi	a0,a0,-28 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203604:	e9bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203608:	86d6                	mv	a3,s5
ffffffffc020360a:	00009617          	auipc	a2,0x9
ffffffffc020360e:	ebe60613          	addi	a2,a2,-322 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc0203612:	25700593          	li	a1,599
ffffffffc0203616:	00009517          	auipc	a0,0x9
ffffffffc020361a:	fca50513          	addi	a0,a0,-54 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020361e:	e81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203622:	00009697          	auipc	a3,0x9
ffffffffc0203626:	3c668693          	addi	a3,a3,966 # ffffffffc020c9e8 <default_pmm_manager+0x558>
ffffffffc020362a:	00008617          	auipc	a2,0x8
ffffffffc020362e:	37e60613          	addi	a2,a2,894 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203632:	26400593          	li	a1,612
ffffffffc0203636:	00009517          	auipc	a0,0x9
ffffffffc020363a:	faa50513          	addi	a0,a0,-86 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020363e:	e61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203642:	00009697          	auipc	a3,0x9
ffffffffc0203646:	38e68693          	addi	a3,a3,910 # ffffffffc020c9d0 <default_pmm_manager+0x540>
ffffffffc020364a:	00008617          	auipc	a2,0x8
ffffffffc020364e:	35e60613          	addi	a2,a2,862 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203652:	26300593          	li	a1,611
ffffffffc0203656:	00009517          	auipc	a0,0x9
ffffffffc020365a:	f8a50513          	addi	a0,a0,-118 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020365e:	e41fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203662:	00009697          	auipc	a3,0x9
ffffffffc0203666:	33e68693          	addi	a3,a3,830 # ffffffffc020c9a0 <default_pmm_manager+0x510>
ffffffffc020366a:	00008617          	auipc	a2,0x8
ffffffffc020366e:	33e60613          	addi	a2,a2,830 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203672:	26200593          	li	a1,610
ffffffffc0203676:	00009517          	auipc	a0,0x9
ffffffffc020367a:	f6a50513          	addi	a0,a0,-150 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020367e:	e21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203682:	00009697          	auipc	a3,0x9
ffffffffc0203686:	30668693          	addi	a3,a3,774 # ffffffffc020c988 <default_pmm_manager+0x4f8>
ffffffffc020368a:	00008617          	auipc	a2,0x8
ffffffffc020368e:	31e60613          	addi	a2,a2,798 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203692:	26000593          	li	a1,608
ffffffffc0203696:	00009517          	auipc	a0,0x9
ffffffffc020369a:	f4a50513          	addi	a0,a0,-182 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020369e:	e01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036a2:	00009697          	auipc	a3,0x9
ffffffffc02036a6:	2c668693          	addi	a3,a3,710 # ffffffffc020c968 <default_pmm_manager+0x4d8>
ffffffffc02036aa:	00008617          	auipc	a2,0x8
ffffffffc02036ae:	2fe60613          	addi	a2,a2,766 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02036b2:	25f00593          	li	a1,607
ffffffffc02036b6:	00009517          	auipc	a0,0x9
ffffffffc02036ba:	f2a50513          	addi	a0,a0,-214 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02036be:	de1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036c2:	00009697          	auipc	a3,0x9
ffffffffc02036c6:	29668693          	addi	a3,a3,662 # ffffffffc020c958 <default_pmm_manager+0x4c8>
ffffffffc02036ca:	00008617          	auipc	a2,0x8
ffffffffc02036ce:	2de60613          	addi	a2,a2,734 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02036d2:	25e00593          	li	a1,606
ffffffffc02036d6:	00009517          	auipc	a0,0x9
ffffffffc02036da:	f0a50513          	addi	a0,a0,-246 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02036de:	dc1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036e2:	00009697          	auipc	a3,0x9
ffffffffc02036e6:	26668693          	addi	a3,a3,614 # ffffffffc020c948 <default_pmm_manager+0x4b8>
ffffffffc02036ea:	00008617          	auipc	a2,0x8
ffffffffc02036ee:	2be60613          	addi	a2,a2,702 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02036f2:	25d00593          	li	a1,605
ffffffffc02036f6:	00009517          	auipc	a0,0x9
ffffffffc02036fa:	eea50513          	addi	a0,a0,-278 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02036fe:	da1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203702:	00009697          	auipc	a3,0x9
ffffffffc0203706:	20e68693          	addi	a3,a3,526 # ffffffffc020c910 <default_pmm_manager+0x480>
ffffffffc020370a:	00008617          	auipc	a2,0x8
ffffffffc020370e:	29e60613          	addi	a2,a2,670 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203712:	25c00593          	li	a1,604
ffffffffc0203716:	00009517          	auipc	a0,0x9
ffffffffc020371a:	eca50513          	addi	a0,a0,-310 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020371e:	d81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203722:	00009697          	auipc	a3,0x9
ffffffffc0203726:	33e68693          	addi	a3,a3,830 # ffffffffc020ca60 <default_pmm_manager+0x5d0>
ffffffffc020372a:	00008617          	auipc	a2,0x8
ffffffffc020372e:	27e60613          	addi	a2,a2,638 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203732:	27900593          	li	a1,633
ffffffffc0203736:	00009517          	auipc	a0,0x9
ffffffffc020373a:	eaa50513          	addi	a0,a0,-342 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020373e:	d61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203742:	00009617          	auipc	a2,0x9
ffffffffc0203746:	d8660613          	addi	a2,a2,-634 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc020374a:	07100593          	li	a1,113
ffffffffc020374e:	00009517          	auipc	a0,0x9
ffffffffc0203752:	da250513          	addi	a0,a0,-606 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0203756:	d49fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020375a:	86a2                	mv	a3,s0
ffffffffc020375c:	00009617          	auipc	a2,0x9
ffffffffc0203760:	e1460613          	addi	a2,a2,-492 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc0203764:	0ca00593          	li	a1,202
ffffffffc0203768:	00009517          	auipc	a0,0x9
ffffffffc020376c:	e7850513          	addi	a0,a0,-392 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203770:	d2ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203774:	00009617          	auipc	a2,0x9
ffffffffc0203778:	dfc60613          	addi	a2,a2,-516 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc020377c:	08100593          	li	a1,129
ffffffffc0203780:	00009517          	auipc	a0,0x9
ffffffffc0203784:	e6050513          	addi	a0,a0,-416 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203788:	d17fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020378c:	00009697          	auipc	a3,0x9
ffffffffc0203790:	14468693          	addi	a3,a3,324 # ffffffffc020c8d0 <default_pmm_manager+0x440>
ffffffffc0203794:	00008617          	auipc	a2,0x8
ffffffffc0203798:	21460613          	addi	a2,a2,532 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020379c:	25b00593          	li	a1,603
ffffffffc02037a0:	00009517          	auipc	a0,0x9
ffffffffc02037a4:	e4050513          	addi	a0,a0,-448 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02037a8:	cf7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037ac:	00009697          	auipc	a3,0x9
ffffffffc02037b0:	06468693          	addi	a3,a3,100 # ffffffffc020c810 <default_pmm_manager+0x380>
ffffffffc02037b4:	00008617          	auipc	a2,0x8
ffffffffc02037b8:	1f460613          	addi	a2,a2,500 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02037bc:	24f00593          	li	a1,591
ffffffffc02037c0:	00009517          	auipc	a0,0x9
ffffffffc02037c4:	e2050513          	addi	a0,a0,-480 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02037c8:	cd7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037cc:	985fe0ef          	jal	ra,ffffffffc0202150 <pte2page.part.0>
ffffffffc02037d0:	00009697          	auipc	a3,0x9
ffffffffc02037d4:	07068693          	addi	a3,a3,112 # ffffffffc020c840 <default_pmm_manager+0x3b0>
ffffffffc02037d8:	00008617          	auipc	a2,0x8
ffffffffc02037dc:	1d060613          	addi	a2,a2,464 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02037e0:	25200593          	li	a1,594
ffffffffc02037e4:	00009517          	auipc	a0,0x9
ffffffffc02037e8:	dfc50513          	addi	a0,a0,-516 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02037ec:	cb3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037f0:	00009697          	auipc	a3,0x9
ffffffffc02037f4:	ff068693          	addi	a3,a3,-16 # ffffffffc020c7e0 <default_pmm_manager+0x350>
ffffffffc02037f8:	00008617          	auipc	a2,0x8
ffffffffc02037fc:	1b060613          	addi	a2,a2,432 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203800:	24b00593          	li	a1,587
ffffffffc0203804:	00009517          	auipc	a0,0x9
ffffffffc0203808:	ddc50513          	addi	a0,a0,-548 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020380c:	c93fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203810:	00009697          	auipc	a3,0x9
ffffffffc0203814:	06068693          	addi	a3,a3,96 # ffffffffc020c870 <default_pmm_manager+0x3e0>
ffffffffc0203818:	00008617          	auipc	a2,0x8
ffffffffc020381c:	19060613          	addi	a2,a2,400 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203820:	25300593          	li	a1,595
ffffffffc0203824:	00009517          	auipc	a0,0x9
ffffffffc0203828:	dbc50513          	addi	a0,a0,-580 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020382c:	c73fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203830:	00009617          	auipc	a2,0x9
ffffffffc0203834:	c9860613          	addi	a2,a2,-872 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc0203838:	25600593          	li	a1,598
ffffffffc020383c:	00009517          	auipc	a0,0x9
ffffffffc0203840:	da450513          	addi	a0,a0,-604 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203844:	c5bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203848:	00009697          	auipc	a3,0x9
ffffffffc020384c:	04068693          	addi	a3,a3,64 # ffffffffc020c888 <default_pmm_manager+0x3f8>
ffffffffc0203850:	00008617          	auipc	a2,0x8
ffffffffc0203854:	15860613          	addi	a2,a2,344 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203858:	25400593          	li	a1,596
ffffffffc020385c:	00009517          	auipc	a0,0x9
ffffffffc0203860:	d8450513          	addi	a0,a0,-636 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203864:	c3bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203868:	86ca                	mv	a3,s2
ffffffffc020386a:	00009617          	auipc	a2,0x9
ffffffffc020386e:	d0660613          	addi	a2,a2,-762 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc0203872:	0c600593          	li	a1,198
ffffffffc0203876:	00009517          	auipc	a0,0x9
ffffffffc020387a:	d6a50513          	addi	a0,a0,-662 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020387e:	c21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203882:	00009697          	auipc	a3,0x9
ffffffffc0203886:	16668693          	addi	a3,a3,358 # ffffffffc020c9e8 <default_pmm_manager+0x558>
ffffffffc020388a:	00008617          	auipc	a2,0x8
ffffffffc020388e:	11e60613          	addi	a2,a2,286 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203892:	26f00593          	li	a1,623
ffffffffc0203896:	00009517          	auipc	a0,0x9
ffffffffc020389a:	d4a50513          	addi	a0,a0,-694 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc020389e:	c01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038a2:	00009697          	auipc	a3,0x9
ffffffffc02038a6:	17668693          	addi	a3,a3,374 # ffffffffc020ca18 <default_pmm_manager+0x588>
ffffffffc02038aa:	00008617          	auipc	a2,0x8
ffffffffc02038ae:	0fe60613          	addi	a2,a2,254 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02038b2:	26e00593          	li	a1,622
ffffffffc02038b6:	00009517          	auipc	a0,0x9
ffffffffc02038ba:	d2a50513          	addi	a0,a0,-726 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc02038be:	be1fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02038c2 <copy_range>:
ffffffffc02038c2:	7159                	addi	sp,sp,-112
ffffffffc02038c4:	00d667b3          	or	a5,a2,a3
ffffffffc02038c8:	f486                	sd	ra,104(sp)
ffffffffc02038ca:	f0a2                	sd	s0,96(sp)
ffffffffc02038cc:	eca6                	sd	s1,88(sp)
ffffffffc02038ce:	e8ca                	sd	s2,80(sp)
ffffffffc02038d0:	e4ce                	sd	s3,72(sp)
ffffffffc02038d2:	e0d2                	sd	s4,64(sp)
ffffffffc02038d4:	fc56                	sd	s5,56(sp)
ffffffffc02038d6:	f85a                	sd	s6,48(sp)
ffffffffc02038d8:	f45e                	sd	s7,40(sp)
ffffffffc02038da:	f062                	sd	s8,32(sp)
ffffffffc02038dc:	ec66                	sd	s9,24(sp)
ffffffffc02038de:	e86a                	sd	s10,16(sp)
ffffffffc02038e0:	e46e                	sd	s11,8(sp)
ffffffffc02038e2:	17d2                	slli	a5,a5,0x34
ffffffffc02038e4:	20079f63          	bnez	a5,ffffffffc0203b02 <copy_range+0x240>
ffffffffc02038e8:	002007b7          	lui	a5,0x200
ffffffffc02038ec:	8432                	mv	s0,a2
ffffffffc02038ee:	1af66263          	bltu	a2,a5,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc02038f2:	8936                	mv	s2,a3
ffffffffc02038f4:	18d67f63          	bgeu	a2,a3,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc02038f8:	4785                	li	a5,1
ffffffffc02038fa:	07fe                	slli	a5,a5,0x1f
ffffffffc02038fc:	18d7eb63          	bltu	a5,a3,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc0203900:	5b7d                	li	s6,-1
ffffffffc0203902:	8aaa                	mv	s5,a0
ffffffffc0203904:	89ae                	mv	s3,a1
ffffffffc0203906:	6a05                	lui	s4,0x1
ffffffffc0203908:	00093c17          	auipc	s8,0x93
ffffffffc020390c:	f98c0c13          	addi	s8,s8,-104 # ffffffffc02968a0 <npage>
ffffffffc0203910:	00093b97          	auipc	s7,0x93
ffffffffc0203914:	f98b8b93          	addi	s7,s7,-104 # ffffffffc02968a8 <pages>
ffffffffc0203918:	00cb5b13          	srli	s6,s6,0xc
ffffffffc020391c:	00093c97          	auipc	s9,0x93
ffffffffc0203920:	f94c8c93          	addi	s9,s9,-108 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203924:	4601                	li	a2,0
ffffffffc0203926:	85a2                	mv	a1,s0
ffffffffc0203928:	854e                	mv	a0,s3
ffffffffc020392a:	8fbfe0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020392e:	84aa                	mv	s1,a0
ffffffffc0203930:	0e050c63          	beqz	a0,ffffffffc0203a28 <copy_range+0x166>
ffffffffc0203934:	611c                	ld	a5,0(a0)
ffffffffc0203936:	8b85                	andi	a5,a5,1
ffffffffc0203938:	e785                	bnez	a5,ffffffffc0203960 <copy_range+0x9e>
ffffffffc020393a:	9452                	add	s0,s0,s4
ffffffffc020393c:	ff2464e3          	bltu	s0,s2,ffffffffc0203924 <copy_range+0x62>
ffffffffc0203940:	4501                	li	a0,0
ffffffffc0203942:	70a6                	ld	ra,104(sp)
ffffffffc0203944:	7406                	ld	s0,96(sp)
ffffffffc0203946:	64e6                	ld	s1,88(sp)
ffffffffc0203948:	6946                	ld	s2,80(sp)
ffffffffc020394a:	69a6                	ld	s3,72(sp)
ffffffffc020394c:	6a06                	ld	s4,64(sp)
ffffffffc020394e:	7ae2                	ld	s5,56(sp)
ffffffffc0203950:	7b42                	ld	s6,48(sp)
ffffffffc0203952:	7ba2                	ld	s7,40(sp)
ffffffffc0203954:	7c02                	ld	s8,32(sp)
ffffffffc0203956:	6ce2                	ld	s9,24(sp)
ffffffffc0203958:	6d42                	ld	s10,16(sp)
ffffffffc020395a:	6da2                	ld	s11,8(sp)
ffffffffc020395c:	6165                	addi	sp,sp,112
ffffffffc020395e:	8082                	ret
ffffffffc0203960:	4605                	li	a2,1
ffffffffc0203962:	85a2                	mv	a1,s0
ffffffffc0203964:	8556                	mv	a0,s5
ffffffffc0203966:	8bffe0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020396a:	c56d                	beqz	a0,ffffffffc0203a54 <copy_range+0x192>
ffffffffc020396c:	609c                	ld	a5,0(s1)
ffffffffc020396e:	0017f713          	andi	a4,a5,1
ffffffffc0203972:	01f7f493          	andi	s1,a5,31
ffffffffc0203976:	16070a63          	beqz	a4,ffffffffc0203aea <copy_range+0x228>
ffffffffc020397a:	000c3683          	ld	a3,0(s8)
ffffffffc020397e:	078a                	slli	a5,a5,0x2
ffffffffc0203980:	00c7d713          	srli	a4,a5,0xc
ffffffffc0203984:	14d77763          	bgeu	a4,a3,ffffffffc0203ad2 <copy_range+0x210>
ffffffffc0203988:	000bb783          	ld	a5,0(s7)
ffffffffc020398c:	fff806b7          	lui	a3,0xfff80
ffffffffc0203990:	9736                	add	a4,a4,a3
ffffffffc0203992:	071a                	slli	a4,a4,0x6
ffffffffc0203994:	00e78db3          	add	s11,a5,a4
ffffffffc0203998:	10002773          	csrr	a4,sstatus
ffffffffc020399c:	8b09                	andi	a4,a4,2
ffffffffc020399e:	e345                	bnez	a4,ffffffffc0203a3e <copy_range+0x17c>
ffffffffc02039a0:	000cb703          	ld	a4,0(s9)
ffffffffc02039a4:	4505                	li	a0,1
ffffffffc02039a6:	6f18                	ld	a4,24(a4)
ffffffffc02039a8:	9702                	jalr	a4
ffffffffc02039aa:	8d2a                	mv	s10,a0
ffffffffc02039ac:	0c0d8363          	beqz	s11,ffffffffc0203a72 <copy_range+0x1b0>
ffffffffc02039b0:	100d0163          	beqz	s10,ffffffffc0203ab2 <copy_range+0x1f0>
ffffffffc02039b4:	000bb703          	ld	a4,0(s7)
ffffffffc02039b8:	000805b7          	lui	a1,0x80
ffffffffc02039bc:	000c3603          	ld	a2,0(s8)
ffffffffc02039c0:	40ed86b3          	sub	a3,s11,a4
ffffffffc02039c4:	8699                	srai	a3,a3,0x6
ffffffffc02039c6:	96ae                	add	a3,a3,a1
ffffffffc02039c8:	0166f7b3          	and	a5,a3,s6
ffffffffc02039cc:	06b2                	slli	a3,a3,0xc
ffffffffc02039ce:	08c7f663          	bgeu	a5,a2,ffffffffc0203a5a <copy_range+0x198>
ffffffffc02039d2:	40ed07b3          	sub	a5,s10,a4
ffffffffc02039d6:	00093717          	auipc	a4,0x93
ffffffffc02039da:	ee270713          	addi	a4,a4,-286 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02039de:	6308                	ld	a0,0(a4)
ffffffffc02039e0:	8799                	srai	a5,a5,0x6
ffffffffc02039e2:	97ae                	add	a5,a5,a1
ffffffffc02039e4:	0167f733          	and	a4,a5,s6
ffffffffc02039e8:	00a685b3          	add	a1,a3,a0
ffffffffc02039ec:	07b2                	slli	a5,a5,0xc
ffffffffc02039ee:	06c77563          	bgeu	a4,a2,ffffffffc0203a58 <copy_range+0x196>
ffffffffc02039f2:	6605                	lui	a2,0x1
ffffffffc02039f4:	953e                	add	a0,a0,a5
ffffffffc02039f6:	321070ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc02039fa:	86a6                	mv	a3,s1
ffffffffc02039fc:	8622                	mv	a2,s0
ffffffffc02039fe:	85ea                	mv	a1,s10
ffffffffc0203a00:	8556                	mv	a0,s5
ffffffffc0203a02:	fd9fe0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203a06:	d915                	beqz	a0,ffffffffc020393a <copy_range+0x78>
ffffffffc0203a08:	00009697          	auipc	a3,0x9
ffffffffc0203a0c:	28068693          	addi	a3,a3,640 # ffffffffc020cc88 <default_pmm_manager+0x7f8>
ffffffffc0203a10:	00008617          	auipc	a2,0x8
ffffffffc0203a14:	f9860613          	addi	a2,a2,-104 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203a18:	1e700593          	li	a1,487
ffffffffc0203a1c:	00009517          	auipc	a0,0x9
ffffffffc0203a20:	bc450513          	addi	a0,a0,-1084 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203a24:	a7bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a28:	00200637          	lui	a2,0x200
ffffffffc0203a2c:	9432                	add	s0,s0,a2
ffffffffc0203a2e:	ffe00637          	lui	a2,0xffe00
ffffffffc0203a32:	8c71                	and	s0,s0,a2
ffffffffc0203a34:	f00406e3          	beqz	s0,ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a38:	ef2466e3          	bltu	s0,s2,ffffffffc0203924 <copy_range+0x62>
ffffffffc0203a3c:	b711                	j	ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a3e:	a34fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203a42:	000cb703          	ld	a4,0(s9)
ffffffffc0203a46:	4505                	li	a0,1
ffffffffc0203a48:	6f18                	ld	a4,24(a4)
ffffffffc0203a4a:	9702                	jalr	a4
ffffffffc0203a4c:	8d2a                	mv	s10,a0
ffffffffc0203a4e:	a1efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203a52:	bfa9                	j	ffffffffc02039ac <copy_range+0xea>
ffffffffc0203a54:	5571                	li	a0,-4
ffffffffc0203a56:	b5f5                	j	ffffffffc0203942 <copy_range+0x80>
ffffffffc0203a58:	86be                	mv	a3,a5
ffffffffc0203a5a:	00009617          	auipc	a2,0x9
ffffffffc0203a5e:	a6e60613          	addi	a2,a2,-1426 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc0203a62:	07100593          	li	a1,113
ffffffffc0203a66:	00009517          	auipc	a0,0x9
ffffffffc0203a6a:	a8a50513          	addi	a0,a0,-1398 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0203a6e:	a31fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a72:	00009697          	auipc	a3,0x9
ffffffffc0203a76:	1f668693          	addi	a3,a3,502 # ffffffffc020cc68 <default_pmm_manager+0x7d8>
ffffffffc0203a7a:	00008617          	auipc	a2,0x8
ffffffffc0203a7e:	f2e60613          	addi	a2,a2,-210 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203a82:	1ce00593          	li	a1,462
ffffffffc0203a86:	00009517          	auipc	a0,0x9
ffffffffc0203a8a:	b5a50513          	addi	a0,a0,-1190 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203a8e:	a11fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a92:	00009697          	auipc	a3,0x9
ffffffffc0203a96:	bb668693          	addi	a3,a3,-1098 # ffffffffc020c648 <default_pmm_manager+0x1b8>
ffffffffc0203a9a:	00008617          	auipc	a2,0x8
ffffffffc0203a9e:	f0e60613          	addi	a2,a2,-242 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203aa2:	1b600593          	li	a1,438
ffffffffc0203aa6:	00009517          	auipc	a0,0x9
ffffffffc0203aaa:	b3a50513          	addi	a0,a0,-1222 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203aae:	9f1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ab2:	00009697          	auipc	a3,0x9
ffffffffc0203ab6:	1c668693          	addi	a3,a3,454 # ffffffffc020cc78 <default_pmm_manager+0x7e8>
ffffffffc0203aba:	00008617          	auipc	a2,0x8
ffffffffc0203abe:	eee60613          	addi	a2,a2,-274 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203ac2:	1cf00593          	li	a1,463
ffffffffc0203ac6:	00009517          	auipc	a0,0x9
ffffffffc0203aca:	b1a50513          	addi	a0,a0,-1254 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203ace:	9d1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ad2:	00009617          	auipc	a2,0x9
ffffffffc0203ad6:	ac660613          	addi	a2,a2,-1338 # ffffffffc020c598 <default_pmm_manager+0x108>
ffffffffc0203ada:	06900593          	li	a1,105
ffffffffc0203ade:	00009517          	auipc	a0,0x9
ffffffffc0203ae2:	a1250513          	addi	a0,a0,-1518 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0203ae6:	9b9fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203aea:	00009617          	auipc	a2,0x9
ffffffffc0203aee:	ace60613          	addi	a2,a2,-1330 # ffffffffc020c5b8 <default_pmm_manager+0x128>
ffffffffc0203af2:	07f00593          	li	a1,127
ffffffffc0203af6:	00009517          	auipc	a0,0x9
ffffffffc0203afa:	9fa50513          	addi	a0,a0,-1542 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0203afe:	9a1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b02:	00009697          	auipc	a3,0x9
ffffffffc0203b06:	b1668693          	addi	a3,a3,-1258 # ffffffffc020c618 <default_pmm_manager+0x188>
ffffffffc0203b0a:	00008617          	auipc	a2,0x8
ffffffffc0203b0e:	e9e60613          	addi	a2,a2,-354 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203b12:	1b500593          	li	a1,437
ffffffffc0203b16:	00009517          	auipc	a0,0x9
ffffffffc0203b1a:	aca50513          	addi	a0,a0,-1334 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203b1e:	981fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203b22 <pgdir_alloc_page>:
ffffffffc0203b22:	7179                	addi	sp,sp,-48
ffffffffc0203b24:	ec26                	sd	s1,24(sp)
ffffffffc0203b26:	e84a                	sd	s2,16(sp)
ffffffffc0203b28:	e052                	sd	s4,0(sp)
ffffffffc0203b2a:	f406                	sd	ra,40(sp)
ffffffffc0203b2c:	f022                	sd	s0,32(sp)
ffffffffc0203b2e:	e44e                	sd	s3,8(sp)
ffffffffc0203b30:	8a2a                	mv	s4,a0
ffffffffc0203b32:	84ae                	mv	s1,a1
ffffffffc0203b34:	8932                	mv	s2,a2
ffffffffc0203b36:	100027f3          	csrr	a5,sstatus
ffffffffc0203b3a:	8b89                	andi	a5,a5,2
ffffffffc0203b3c:	00093997          	auipc	s3,0x93
ffffffffc0203b40:	d7498993          	addi	s3,s3,-652 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203b44:	ef8d                	bnez	a5,ffffffffc0203b7e <pgdir_alloc_page+0x5c>
ffffffffc0203b46:	0009b783          	ld	a5,0(s3)
ffffffffc0203b4a:	4505                	li	a0,1
ffffffffc0203b4c:	6f9c                	ld	a5,24(a5)
ffffffffc0203b4e:	9782                	jalr	a5
ffffffffc0203b50:	842a                	mv	s0,a0
ffffffffc0203b52:	cc09                	beqz	s0,ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203b54:	86ca                	mv	a3,s2
ffffffffc0203b56:	8626                	mv	a2,s1
ffffffffc0203b58:	85a2                	mv	a1,s0
ffffffffc0203b5a:	8552                	mv	a0,s4
ffffffffc0203b5c:	e7ffe0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203b60:	e915                	bnez	a0,ffffffffc0203b94 <pgdir_alloc_page+0x72>
ffffffffc0203b62:	4018                	lw	a4,0(s0)
ffffffffc0203b64:	fc04                	sd	s1,56(s0)
ffffffffc0203b66:	4785                	li	a5,1
ffffffffc0203b68:	04f71e63          	bne	a4,a5,ffffffffc0203bc4 <pgdir_alloc_page+0xa2>
ffffffffc0203b6c:	70a2                	ld	ra,40(sp)
ffffffffc0203b6e:	8522                	mv	a0,s0
ffffffffc0203b70:	7402                	ld	s0,32(sp)
ffffffffc0203b72:	64e2                	ld	s1,24(sp)
ffffffffc0203b74:	6942                	ld	s2,16(sp)
ffffffffc0203b76:	69a2                	ld	s3,8(sp)
ffffffffc0203b78:	6a02                	ld	s4,0(sp)
ffffffffc0203b7a:	6145                	addi	sp,sp,48
ffffffffc0203b7c:	8082                	ret
ffffffffc0203b7e:	8f4fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203b82:	0009b783          	ld	a5,0(s3)
ffffffffc0203b86:	4505                	li	a0,1
ffffffffc0203b88:	6f9c                	ld	a5,24(a5)
ffffffffc0203b8a:	9782                	jalr	a5
ffffffffc0203b8c:	842a                	mv	s0,a0
ffffffffc0203b8e:	8defd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203b92:	b7c1                	j	ffffffffc0203b52 <pgdir_alloc_page+0x30>
ffffffffc0203b94:	100027f3          	csrr	a5,sstatus
ffffffffc0203b98:	8b89                	andi	a5,a5,2
ffffffffc0203b9a:	eb89                	bnez	a5,ffffffffc0203bac <pgdir_alloc_page+0x8a>
ffffffffc0203b9c:	0009b783          	ld	a5,0(s3)
ffffffffc0203ba0:	8522                	mv	a0,s0
ffffffffc0203ba2:	4585                	li	a1,1
ffffffffc0203ba4:	739c                	ld	a5,32(a5)
ffffffffc0203ba6:	4401                	li	s0,0
ffffffffc0203ba8:	9782                	jalr	a5
ffffffffc0203baa:	b7c9                	j	ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203bac:	8c6fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203bb0:	0009b783          	ld	a5,0(s3)
ffffffffc0203bb4:	8522                	mv	a0,s0
ffffffffc0203bb6:	4585                	li	a1,1
ffffffffc0203bb8:	739c                	ld	a5,32(a5)
ffffffffc0203bba:	4401                	li	s0,0
ffffffffc0203bbc:	9782                	jalr	a5
ffffffffc0203bbe:	8aefd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203bc2:	b76d                	j	ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203bc4:	00009697          	auipc	a3,0x9
ffffffffc0203bc8:	0d468693          	addi	a3,a3,212 # ffffffffc020cc98 <default_pmm_manager+0x808>
ffffffffc0203bcc:	00008617          	auipc	a2,0x8
ffffffffc0203bd0:	ddc60613          	addi	a2,a2,-548 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203bd4:	23000593          	li	a1,560
ffffffffc0203bd8:	00009517          	auipc	a0,0x9
ffffffffc0203bdc:	a0850513          	addi	a0,a0,-1528 # ffffffffc020c5e0 <default_pmm_manager+0x150>
ffffffffc0203be0:	8bffc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203be4 <check_vma_overlap.part.0>:
ffffffffc0203be4:	1141                	addi	sp,sp,-16
ffffffffc0203be6:	00009697          	auipc	a3,0x9
ffffffffc0203bea:	0ca68693          	addi	a3,a3,202 # ffffffffc020ccb0 <default_pmm_manager+0x820>
ffffffffc0203bee:	00008617          	auipc	a2,0x8
ffffffffc0203bf2:	dba60613          	addi	a2,a2,-582 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203bf6:	07400593          	li	a1,116
ffffffffc0203bfa:	00009517          	auipc	a0,0x9
ffffffffc0203bfe:	0d650513          	addi	a0,a0,214 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc0203c02:	e406                	sd	ra,8(sp)
ffffffffc0203c04:	89bfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203c08 <mm_create>:
ffffffffc0203c08:	1141                	addi	sp,sp,-16
ffffffffc0203c0a:	05800513          	li	a0,88
ffffffffc0203c0e:	e022                	sd	s0,0(sp)
ffffffffc0203c10:	e406                	sd	ra,8(sp)
ffffffffc0203c12:	b7cfe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203c16:	842a                	mv	s0,a0
ffffffffc0203c18:	c115                	beqz	a0,ffffffffc0203c3c <mm_create+0x34>
ffffffffc0203c1a:	e408                	sd	a0,8(s0)
ffffffffc0203c1c:	e008                	sd	a0,0(s0)
ffffffffc0203c1e:	00053823          	sd	zero,16(a0)
ffffffffc0203c22:	00053c23          	sd	zero,24(a0)
ffffffffc0203c26:	02052023          	sw	zero,32(a0)
ffffffffc0203c2a:	02053423          	sd	zero,40(a0)
ffffffffc0203c2e:	02052823          	sw	zero,48(a0)
ffffffffc0203c32:	4585                	li	a1,1
ffffffffc0203c34:	03850513          	addi	a0,a0,56
ffffffffc0203c38:	123000ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0203c3c:	60a2                	ld	ra,8(sp)
ffffffffc0203c3e:	8522                	mv	a0,s0
ffffffffc0203c40:	6402                	ld	s0,0(sp)
ffffffffc0203c42:	0141                	addi	sp,sp,16
ffffffffc0203c44:	8082                	ret

ffffffffc0203c46 <find_vma>:
ffffffffc0203c46:	86aa                	mv	a3,a0
ffffffffc0203c48:	c505                	beqz	a0,ffffffffc0203c70 <find_vma+0x2a>
ffffffffc0203c4a:	6908                	ld	a0,16(a0)
ffffffffc0203c4c:	c501                	beqz	a0,ffffffffc0203c54 <find_vma+0xe>
ffffffffc0203c4e:	651c                	ld	a5,8(a0)
ffffffffc0203c50:	02f5f263          	bgeu	a1,a5,ffffffffc0203c74 <find_vma+0x2e>
ffffffffc0203c54:	669c                	ld	a5,8(a3)
ffffffffc0203c56:	00f68d63          	beq	a3,a5,ffffffffc0203c70 <find_vma+0x2a>
ffffffffc0203c5a:	fe87b703          	ld	a4,-24(a5) # 1fffe8 <_binary_bin_sfs_img_size+0x18ace8>
ffffffffc0203c5e:	00e5e663          	bltu	a1,a4,ffffffffc0203c6a <find_vma+0x24>
ffffffffc0203c62:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203c66:	00e5ec63          	bltu	a1,a4,ffffffffc0203c7e <find_vma+0x38>
ffffffffc0203c6a:	679c                	ld	a5,8(a5)
ffffffffc0203c6c:	fef697e3          	bne	a3,a5,ffffffffc0203c5a <find_vma+0x14>
ffffffffc0203c70:	4501                	li	a0,0
ffffffffc0203c72:	8082                	ret
ffffffffc0203c74:	691c                	ld	a5,16(a0)
ffffffffc0203c76:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0203c54 <find_vma+0xe>
ffffffffc0203c7a:	ea88                	sd	a0,16(a3)
ffffffffc0203c7c:	8082                	ret
ffffffffc0203c7e:	fe078513          	addi	a0,a5,-32
ffffffffc0203c82:	ea88                	sd	a0,16(a3)
ffffffffc0203c84:	8082                	ret

ffffffffc0203c86 <insert_vma_struct>:
ffffffffc0203c86:	6590                	ld	a2,8(a1)
ffffffffc0203c88:	0105b803          	ld	a6,16(a1) # 80010 <_binary_bin_sfs_img_size+0xad10>
ffffffffc0203c8c:	1141                	addi	sp,sp,-16
ffffffffc0203c8e:	e406                	sd	ra,8(sp)
ffffffffc0203c90:	87aa                	mv	a5,a0
ffffffffc0203c92:	01066763          	bltu	a2,a6,ffffffffc0203ca0 <insert_vma_struct+0x1a>
ffffffffc0203c96:	a085                	j	ffffffffc0203cf6 <insert_vma_struct+0x70>
ffffffffc0203c98:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203c9c:	04e66863          	bltu	a2,a4,ffffffffc0203cec <insert_vma_struct+0x66>
ffffffffc0203ca0:	86be                	mv	a3,a5
ffffffffc0203ca2:	679c                	ld	a5,8(a5)
ffffffffc0203ca4:	fef51ae3          	bne	a0,a5,ffffffffc0203c98 <insert_vma_struct+0x12>
ffffffffc0203ca8:	02a68463          	beq	a3,a0,ffffffffc0203cd0 <insert_vma_struct+0x4a>
ffffffffc0203cac:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203cb0:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203cb4:	08e8f163          	bgeu	a7,a4,ffffffffc0203d36 <insert_vma_struct+0xb0>
ffffffffc0203cb8:	04e66f63          	bltu	a2,a4,ffffffffc0203d16 <insert_vma_struct+0x90>
ffffffffc0203cbc:	00f50a63          	beq	a0,a5,ffffffffc0203cd0 <insert_vma_struct+0x4a>
ffffffffc0203cc0:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203cc4:	05076963          	bltu	a4,a6,ffffffffc0203d16 <insert_vma_struct+0x90>
ffffffffc0203cc8:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203ccc:	02c77363          	bgeu	a4,a2,ffffffffc0203cf2 <insert_vma_struct+0x6c>
ffffffffc0203cd0:	5118                	lw	a4,32(a0)
ffffffffc0203cd2:	e188                	sd	a0,0(a1)
ffffffffc0203cd4:	02058613          	addi	a2,a1,32
ffffffffc0203cd8:	e390                	sd	a2,0(a5)
ffffffffc0203cda:	e690                	sd	a2,8(a3)
ffffffffc0203cdc:	60a2                	ld	ra,8(sp)
ffffffffc0203cde:	f59c                	sd	a5,40(a1)
ffffffffc0203ce0:	f194                	sd	a3,32(a1)
ffffffffc0203ce2:	0017079b          	addiw	a5,a4,1
ffffffffc0203ce6:	d11c                	sw	a5,32(a0)
ffffffffc0203ce8:	0141                	addi	sp,sp,16
ffffffffc0203cea:	8082                	ret
ffffffffc0203cec:	fca690e3          	bne	a3,a0,ffffffffc0203cac <insert_vma_struct+0x26>
ffffffffc0203cf0:	bfd1                	j	ffffffffc0203cc4 <insert_vma_struct+0x3e>
ffffffffc0203cf2:	ef3ff0ef          	jal	ra,ffffffffc0203be4 <check_vma_overlap.part.0>
ffffffffc0203cf6:	00009697          	auipc	a3,0x9
ffffffffc0203cfa:	fea68693          	addi	a3,a3,-22 # ffffffffc020cce0 <default_pmm_manager+0x850>
ffffffffc0203cfe:	00008617          	auipc	a2,0x8
ffffffffc0203d02:	caa60613          	addi	a2,a2,-854 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203d06:	07a00593          	li	a1,122
ffffffffc0203d0a:	00009517          	auipc	a0,0x9
ffffffffc0203d0e:	fc650513          	addi	a0,a0,-58 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc0203d12:	f8cfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203d16:	00009697          	auipc	a3,0x9
ffffffffc0203d1a:	00a68693          	addi	a3,a3,10 # ffffffffc020cd20 <default_pmm_manager+0x890>
ffffffffc0203d1e:	00008617          	auipc	a2,0x8
ffffffffc0203d22:	c8a60613          	addi	a2,a2,-886 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203d26:	07300593          	li	a1,115
ffffffffc0203d2a:	00009517          	auipc	a0,0x9
ffffffffc0203d2e:	fa650513          	addi	a0,a0,-90 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc0203d32:	f6cfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203d36:	00009697          	auipc	a3,0x9
ffffffffc0203d3a:	fca68693          	addi	a3,a3,-54 # ffffffffc020cd00 <default_pmm_manager+0x870>
ffffffffc0203d3e:	00008617          	auipc	a2,0x8
ffffffffc0203d42:	c6a60613          	addi	a2,a2,-918 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203d46:	07200593          	li	a1,114
ffffffffc0203d4a:	00009517          	auipc	a0,0x9
ffffffffc0203d4e:	f8650513          	addi	a0,a0,-122 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc0203d52:	f4cfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203d56 <mm_destroy>:
ffffffffc0203d56:	591c                	lw	a5,48(a0)
ffffffffc0203d58:	1141                	addi	sp,sp,-16
ffffffffc0203d5a:	e406                	sd	ra,8(sp)
ffffffffc0203d5c:	e022                	sd	s0,0(sp)
ffffffffc0203d5e:	e78d                	bnez	a5,ffffffffc0203d88 <mm_destroy+0x32>
ffffffffc0203d60:	842a                	mv	s0,a0
ffffffffc0203d62:	6508                	ld	a0,8(a0)
ffffffffc0203d64:	00a40c63          	beq	s0,a0,ffffffffc0203d7c <mm_destroy+0x26>
ffffffffc0203d68:	6118                	ld	a4,0(a0)
ffffffffc0203d6a:	651c                	ld	a5,8(a0)
ffffffffc0203d6c:	1501                	addi	a0,a0,-32
ffffffffc0203d6e:	e71c                	sd	a5,8(a4)
ffffffffc0203d70:	e398                	sd	a4,0(a5)
ffffffffc0203d72:	accfe0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0203d76:	6408                	ld	a0,8(s0)
ffffffffc0203d78:	fea418e3          	bne	s0,a0,ffffffffc0203d68 <mm_destroy+0x12>
ffffffffc0203d7c:	8522                	mv	a0,s0
ffffffffc0203d7e:	6402                	ld	s0,0(sp)
ffffffffc0203d80:	60a2                	ld	ra,8(sp)
ffffffffc0203d82:	0141                	addi	sp,sp,16
ffffffffc0203d84:	abafe06f          	j	ffffffffc020203e <kfree>
ffffffffc0203d88:	00009697          	auipc	a3,0x9
ffffffffc0203d8c:	fb868693          	addi	a3,a3,-72 # ffffffffc020cd40 <default_pmm_manager+0x8b0>
ffffffffc0203d90:	00008617          	auipc	a2,0x8
ffffffffc0203d94:	c1860613          	addi	a2,a2,-1000 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203d98:	09e00593          	li	a1,158
ffffffffc0203d9c:	00009517          	auipc	a0,0x9
ffffffffc0203da0:	f3450513          	addi	a0,a0,-204 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc0203da4:	efafc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203da8 <mm_map>:
ffffffffc0203da8:	7139                	addi	sp,sp,-64
ffffffffc0203daa:	f822                	sd	s0,48(sp)
ffffffffc0203dac:	6405                	lui	s0,0x1
ffffffffc0203dae:	147d                	addi	s0,s0,-1
ffffffffc0203db0:	77fd                	lui	a5,0xfffff
ffffffffc0203db2:	9622                	add	a2,a2,s0
ffffffffc0203db4:	962e                	add	a2,a2,a1
ffffffffc0203db6:	f426                	sd	s1,40(sp)
ffffffffc0203db8:	fc06                	sd	ra,56(sp)
ffffffffc0203dba:	00f5f4b3          	and	s1,a1,a5
ffffffffc0203dbe:	f04a                	sd	s2,32(sp)
ffffffffc0203dc0:	ec4e                	sd	s3,24(sp)
ffffffffc0203dc2:	e852                	sd	s4,16(sp)
ffffffffc0203dc4:	e456                	sd	s5,8(sp)
ffffffffc0203dc6:	002005b7          	lui	a1,0x200
ffffffffc0203dca:	00f67433          	and	s0,a2,a5
ffffffffc0203dce:	06b4e363          	bltu	s1,a1,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dd2:	0684f163          	bgeu	s1,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dd6:	4785                	li	a5,1
ffffffffc0203dd8:	07fe                	slli	a5,a5,0x1f
ffffffffc0203dda:	0487ed63          	bltu	a5,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dde:	89aa                	mv	s3,a0
ffffffffc0203de0:	cd21                	beqz	a0,ffffffffc0203e38 <mm_map+0x90>
ffffffffc0203de2:	85a6                	mv	a1,s1
ffffffffc0203de4:	8ab6                	mv	s5,a3
ffffffffc0203de6:	8a3a                	mv	s4,a4
ffffffffc0203de8:	e5fff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0203dec:	c501                	beqz	a0,ffffffffc0203df4 <mm_map+0x4c>
ffffffffc0203dee:	651c                	ld	a5,8(a0)
ffffffffc0203df0:	0487e263          	bltu	a5,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203df4:	03000513          	li	a0,48
ffffffffc0203df8:	996fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203dfc:	892a                	mv	s2,a0
ffffffffc0203dfe:	5571                	li	a0,-4
ffffffffc0203e00:	02090163          	beqz	s2,ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e04:	854e                	mv	a0,s3
ffffffffc0203e06:	00993423          	sd	s1,8(s2)
ffffffffc0203e0a:	00893823          	sd	s0,16(s2)
ffffffffc0203e0e:	01592c23          	sw	s5,24(s2)
ffffffffc0203e12:	85ca                	mv	a1,s2
ffffffffc0203e14:	e73ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203e18:	4501                	li	a0,0
ffffffffc0203e1a:	000a0463          	beqz	s4,ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e1e:	012a3023          	sd	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0203e22:	70e2                	ld	ra,56(sp)
ffffffffc0203e24:	7442                	ld	s0,48(sp)
ffffffffc0203e26:	74a2                	ld	s1,40(sp)
ffffffffc0203e28:	7902                	ld	s2,32(sp)
ffffffffc0203e2a:	69e2                	ld	s3,24(sp)
ffffffffc0203e2c:	6a42                	ld	s4,16(sp)
ffffffffc0203e2e:	6aa2                	ld	s5,8(sp)
ffffffffc0203e30:	6121                	addi	sp,sp,64
ffffffffc0203e32:	8082                	ret
ffffffffc0203e34:	5575                	li	a0,-3
ffffffffc0203e36:	b7f5                	j	ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e38:	00009697          	auipc	a3,0x9
ffffffffc0203e3c:	f2068693          	addi	a3,a3,-224 # ffffffffc020cd58 <default_pmm_manager+0x8c8>
ffffffffc0203e40:	00008617          	auipc	a2,0x8
ffffffffc0203e44:	b6860613          	addi	a2,a2,-1176 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203e48:	0b300593          	li	a1,179
ffffffffc0203e4c:	00009517          	auipc	a0,0x9
ffffffffc0203e50:	e8450513          	addi	a0,a0,-380 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc0203e54:	e4afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203e58 <dup_mmap>:
ffffffffc0203e58:	7139                	addi	sp,sp,-64
ffffffffc0203e5a:	fc06                	sd	ra,56(sp)
ffffffffc0203e5c:	f822                	sd	s0,48(sp)
ffffffffc0203e5e:	f426                	sd	s1,40(sp)
ffffffffc0203e60:	f04a                	sd	s2,32(sp)
ffffffffc0203e62:	ec4e                	sd	s3,24(sp)
ffffffffc0203e64:	e852                	sd	s4,16(sp)
ffffffffc0203e66:	e456                	sd	s5,8(sp)
ffffffffc0203e68:	c52d                	beqz	a0,ffffffffc0203ed2 <dup_mmap+0x7a>
ffffffffc0203e6a:	892a                	mv	s2,a0
ffffffffc0203e6c:	84ae                	mv	s1,a1
ffffffffc0203e6e:	842e                	mv	s0,a1
ffffffffc0203e70:	e595                	bnez	a1,ffffffffc0203e9c <dup_mmap+0x44>
ffffffffc0203e72:	a085                	j	ffffffffc0203ed2 <dup_mmap+0x7a>
ffffffffc0203e74:	854a                	mv	a0,s2
ffffffffc0203e76:	0155b423          	sd	s5,8(a1) # 200008 <_binary_bin_sfs_img_size+0x18ad08>
ffffffffc0203e7a:	0145b823          	sd	s4,16(a1)
ffffffffc0203e7e:	0135ac23          	sw	s3,24(a1)
ffffffffc0203e82:	e05ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203e86:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_bin_swap_img_size-0x6d10>
ffffffffc0203e8a:	fe843603          	ld	a2,-24(s0)
ffffffffc0203e8e:	6c8c                	ld	a1,24(s1)
ffffffffc0203e90:	01893503          	ld	a0,24(s2)
ffffffffc0203e94:	4701                	li	a4,0
ffffffffc0203e96:	a2dff0ef          	jal	ra,ffffffffc02038c2 <copy_range>
ffffffffc0203e9a:	e105                	bnez	a0,ffffffffc0203eba <dup_mmap+0x62>
ffffffffc0203e9c:	6000                	ld	s0,0(s0)
ffffffffc0203e9e:	02848863          	beq	s1,s0,ffffffffc0203ece <dup_mmap+0x76>
ffffffffc0203ea2:	03000513          	li	a0,48
ffffffffc0203ea6:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203eaa:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203eae:	ff842983          	lw	s3,-8(s0)
ffffffffc0203eb2:	8dcfe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203eb6:	85aa                	mv	a1,a0
ffffffffc0203eb8:	fd55                	bnez	a0,ffffffffc0203e74 <dup_mmap+0x1c>
ffffffffc0203eba:	5571                	li	a0,-4
ffffffffc0203ebc:	70e2                	ld	ra,56(sp)
ffffffffc0203ebe:	7442                	ld	s0,48(sp)
ffffffffc0203ec0:	74a2                	ld	s1,40(sp)
ffffffffc0203ec2:	7902                	ld	s2,32(sp)
ffffffffc0203ec4:	69e2                	ld	s3,24(sp)
ffffffffc0203ec6:	6a42                	ld	s4,16(sp)
ffffffffc0203ec8:	6aa2                	ld	s5,8(sp)
ffffffffc0203eca:	6121                	addi	sp,sp,64
ffffffffc0203ecc:	8082                	ret
ffffffffc0203ece:	4501                	li	a0,0
ffffffffc0203ed0:	b7f5                	j	ffffffffc0203ebc <dup_mmap+0x64>
ffffffffc0203ed2:	00009697          	auipc	a3,0x9
ffffffffc0203ed6:	e9668693          	addi	a3,a3,-362 # ffffffffc020cd68 <default_pmm_manager+0x8d8>
ffffffffc0203eda:	00008617          	auipc	a2,0x8
ffffffffc0203ede:	ace60613          	addi	a2,a2,-1330 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203ee2:	0cf00593          	li	a1,207
ffffffffc0203ee6:	00009517          	auipc	a0,0x9
ffffffffc0203eea:	dea50513          	addi	a0,a0,-534 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc0203eee:	db0fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203ef2 <exit_mmap>:
ffffffffc0203ef2:	1101                	addi	sp,sp,-32
ffffffffc0203ef4:	ec06                	sd	ra,24(sp)
ffffffffc0203ef6:	e822                	sd	s0,16(sp)
ffffffffc0203ef8:	e426                	sd	s1,8(sp)
ffffffffc0203efa:	e04a                	sd	s2,0(sp)
ffffffffc0203efc:	c531                	beqz	a0,ffffffffc0203f48 <exit_mmap+0x56>
ffffffffc0203efe:	591c                	lw	a5,48(a0)
ffffffffc0203f00:	84aa                	mv	s1,a0
ffffffffc0203f02:	e3b9                	bnez	a5,ffffffffc0203f48 <exit_mmap+0x56>
ffffffffc0203f04:	6500                	ld	s0,8(a0)
ffffffffc0203f06:	01853903          	ld	s2,24(a0)
ffffffffc0203f0a:	02850663          	beq	a0,s0,ffffffffc0203f36 <exit_mmap+0x44>
ffffffffc0203f0e:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f12:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f16:	854a                	mv	a0,s2
ffffffffc0203f18:	e4efe0ef          	jal	ra,ffffffffc0202566 <unmap_range>
ffffffffc0203f1c:	6400                	ld	s0,8(s0)
ffffffffc0203f1e:	fe8498e3          	bne	s1,s0,ffffffffc0203f0e <exit_mmap+0x1c>
ffffffffc0203f22:	6400                	ld	s0,8(s0)
ffffffffc0203f24:	00848c63          	beq	s1,s0,ffffffffc0203f3c <exit_mmap+0x4a>
ffffffffc0203f28:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f2c:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f30:	854a                	mv	a0,s2
ffffffffc0203f32:	f7afe0ef          	jal	ra,ffffffffc02026ac <exit_range>
ffffffffc0203f36:	6400                	ld	s0,8(s0)
ffffffffc0203f38:	fe8498e3          	bne	s1,s0,ffffffffc0203f28 <exit_mmap+0x36>
ffffffffc0203f3c:	60e2                	ld	ra,24(sp)
ffffffffc0203f3e:	6442                	ld	s0,16(sp)
ffffffffc0203f40:	64a2                	ld	s1,8(sp)
ffffffffc0203f42:	6902                	ld	s2,0(sp)
ffffffffc0203f44:	6105                	addi	sp,sp,32
ffffffffc0203f46:	8082                	ret
ffffffffc0203f48:	00009697          	auipc	a3,0x9
ffffffffc0203f4c:	e4068693          	addi	a3,a3,-448 # ffffffffc020cd88 <default_pmm_manager+0x8f8>
ffffffffc0203f50:	00008617          	auipc	a2,0x8
ffffffffc0203f54:	a5860613          	addi	a2,a2,-1448 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203f58:	0e800593          	li	a1,232
ffffffffc0203f5c:	00009517          	auipc	a0,0x9
ffffffffc0203f60:	d7450513          	addi	a0,a0,-652 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc0203f64:	d3afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203f68 <vmm_init>:
ffffffffc0203f68:	7139                	addi	sp,sp,-64
ffffffffc0203f6a:	05800513          	li	a0,88
ffffffffc0203f6e:	fc06                	sd	ra,56(sp)
ffffffffc0203f70:	f822                	sd	s0,48(sp)
ffffffffc0203f72:	f426                	sd	s1,40(sp)
ffffffffc0203f74:	f04a                	sd	s2,32(sp)
ffffffffc0203f76:	ec4e                	sd	s3,24(sp)
ffffffffc0203f78:	e852                	sd	s4,16(sp)
ffffffffc0203f7a:	e456                	sd	s5,8(sp)
ffffffffc0203f7c:	812fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203f80:	2e050963          	beqz	a0,ffffffffc0204272 <vmm_init+0x30a>
ffffffffc0203f84:	e508                	sd	a0,8(a0)
ffffffffc0203f86:	e108                	sd	a0,0(a0)
ffffffffc0203f88:	00053823          	sd	zero,16(a0)
ffffffffc0203f8c:	00053c23          	sd	zero,24(a0)
ffffffffc0203f90:	02052023          	sw	zero,32(a0)
ffffffffc0203f94:	02053423          	sd	zero,40(a0)
ffffffffc0203f98:	02052823          	sw	zero,48(a0)
ffffffffc0203f9c:	84aa                	mv	s1,a0
ffffffffc0203f9e:	4585                	li	a1,1
ffffffffc0203fa0:	03850513          	addi	a0,a0,56
ffffffffc0203fa4:	5b6000ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0203fa8:	03200413          	li	s0,50
ffffffffc0203fac:	a811                	j	ffffffffc0203fc0 <vmm_init+0x58>
ffffffffc0203fae:	e500                	sd	s0,8(a0)
ffffffffc0203fb0:	e91c                	sd	a5,16(a0)
ffffffffc0203fb2:	00052c23          	sw	zero,24(a0)
ffffffffc0203fb6:	146d                	addi	s0,s0,-5
ffffffffc0203fb8:	8526                	mv	a0,s1
ffffffffc0203fba:	ccdff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203fbe:	c80d                	beqz	s0,ffffffffc0203ff0 <vmm_init+0x88>
ffffffffc0203fc0:	03000513          	li	a0,48
ffffffffc0203fc4:	fcbfd0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203fc8:	85aa                	mv	a1,a0
ffffffffc0203fca:	00240793          	addi	a5,s0,2
ffffffffc0203fce:	f165                	bnez	a0,ffffffffc0203fae <vmm_init+0x46>
ffffffffc0203fd0:	00009697          	auipc	a3,0x9
ffffffffc0203fd4:	f5068693          	addi	a3,a3,-176 # ffffffffc020cf20 <default_pmm_manager+0xa90>
ffffffffc0203fd8:	00008617          	auipc	a2,0x8
ffffffffc0203fdc:	9d060613          	addi	a2,a2,-1584 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0203fe0:	12c00593          	li	a1,300
ffffffffc0203fe4:	00009517          	auipc	a0,0x9
ffffffffc0203fe8:	cec50513          	addi	a0,a0,-788 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc0203fec:	cb2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ff0:	03700413          	li	s0,55
ffffffffc0203ff4:	1f900913          	li	s2,505
ffffffffc0203ff8:	a819                	j	ffffffffc020400e <vmm_init+0xa6>
ffffffffc0203ffa:	e500                	sd	s0,8(a0)
ffffffffc0203ffc:	e91c                	sd	a5,16(a0)
ffffffffc0203ffe:	00052c23          	sw	zero,24(a0)
ffffffffc0204002:	0415                	addi	s0,s0,5
ffffffffc0204004:	8526                	mv	a0,s1
ffffffffc0204006:	c81ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc020400a:	03240a63          	beq	s0,s2,ffffffffc020403e <vmm_init+0xd6>
ffffffffc020400e:	03000513          	li	a0,48
ffffffffc0204012:	f7dfd0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0204016:	85aa                	mv	a1,a0
ffffffffc0204018:	00240793          	addi	a5,s0,2
ffffffffc020401c:	fd79                	bnez	a0,ffffffffc0203ffa <vmm_init+0x92>
ffffffffc020401e:	00009697          	auipc	a3,0x9
ffffffffc0204022:	f0268693          	addi	a3,a3,-254 # ffffffffc020cf20 <default_pmm_manager+0xa90>
ffffffffc0204026:	00008617          	auipc	a2,0x8
ffffffffc020402a:	98260613          	addi	a2,a2,-1662 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020402e:	13300593          	li	a1,307
ffffffffc0204032:	00009517          	auipc	a0,0x9
ffffffffc0204036:	c9e50513          	addi	a0,a0,-866 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc020403a:	c64fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020403e:	649c                	ld	a5,8(s1)
ffffffffc0204040:	471d                	li	a4,7
ffffffffc0204042:	1fb00593          	li	a1,507
ffffffffc0204046:	16f48663          	beq	s1,a5,ffffffffc02041b2 <vmm_init+0x24a>
ffffffffc020404a:	fe87b603          	ld	a2,-24(a5) # ffffffffffffefe8 <end+0x3fd686d8>
ffffffffc020404e:	ffe70693          	addi	a3,a4,-2
ffffffffc0204052:	10d61063          	bne	a2,a3,ffffffffc0204152 <vmm_init+0x1ea>
ffffffffc0204056:	ff07b683          	ld	a3,-16(a5)
ffffffffc020405a:	0ed71c63          	bne	a4,a3,ffffffffc0204152 <vmm_init+0x1ea>
ffffffffc020405e:	0715                	addi	a4,a4,5
ffffffffc0204060:	679c                	ld	a5,8(a5)
ffffffffc0204062:	feb712e3          	bne	a4,a1,ffffffffc0204046 <vmm_init+0xde>
ffffffffc0204066:	4a1d                	li	s4,7
ffffffffc0204068:	4415                	li	s0,5
ffffffffc020406a:	1f900a93          	li	s5,505
ffffffffc020406e:	85a2                	mv	a1,s0
ffffffffc0204070:	8526                	mv	a0,s1
ffffffffc0204072:	bd5ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204076:	892a                	mv	s2,a0
ffffffffc0204078:	16050d63          	beqz	a0,ffffffffc02041f2 <vmm_init+0x28a>
ffffffffc020407c:	00140593          	addi	a1,s0,1
ffffffffc0204080:	8526                	mv	a0,s1
ffffffffc0204082:	bc5ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204086:	89aa                	mv	s3,a0
ffffffffc0204088:	14050563          	beqz	a0,ffffffffc02041d2 <vmm_init+0x26a>
ffffffffc020408c:	85d2                	mv	a1,s4
ffffffffc020408e:	8526                	mv	a0,s1
ffffffffc0204090:	bb7ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204094:	16051f63          	bnez	a0,ffffffffc0204212 <vmm_init+0x2aa>
ffffffffc0204098:	00340593          	addi	a1,s0,3
ffffffffc020409c:	8526                	mv	a0,s1
ffffffffc020409e:	ba9ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040a2:	1a051863          	bnez	a0,ffffffffc0204252 <vmm_init+0x2ea>
ffffffffc02040a6:	00440593          	addi	a1,s0,4
ffffffffc02040aa:	8526                	mv	a0,s1
ffffffffc02040ac:	b9bff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040b0:	18051163          	bnez	a0,ffffffffc0204232 <vmm_init+0x2ca>
ffffffffc02040b4:	00893783          	ld	a5,8(s2)
ffffffffc02040b8:	0a879d63          	bne	a5,s0,ffffffffc0204172 <vmm_init+0x20a>
ffffffffc02040bc:	01093783          	ld	a5,16(s2)
ffffffffc02040c0:	0b479963          	bne	a5,s4,ffffffffc0204172 <vmm_init+0x20a>
ffffffffc02040c4:	0089b783          	ld	a5,8(s3)
ffffffffc02040c8:	0c879563          	bne	a5,s0,ffffffffc0204192 <vmm_init+0x22a>
ffffffffc02040cc:	0109b783          	ld	a5,16(s3)
ffffffffc02040d0:	0d479163          	bne	a5,s4,ffffffffc0204192 <vmm_init+0x22a>
ffffffffc02040d4:	0415                	addi	s0,s0,5
ffffffffc02040d6:	0a15                	addi	s4,s4,5
ffffffffc02040d8:	f9541be3          	bne	s0,s5,ffffffffc020406e <vmm_init+0x106>
ffffffffc02040dc:	4411                	li	s0,4
ffffffffc02040de:	597d                	li	s2,-1
ffffffffc02040e0:	85a2                	mv	a1,s0
ffffffffc02040e2:	8526                	mv	a0,s1
ffffffffc02040e4:	b63ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040e8:	0004059b          	sext.w	a1,s0
ffffffffc02040ec:	c90d                	beqz	a0,ffffffffc020411e <vmm_init+0x1b6>
ffffffffc02040ee:	6914                	ld	a3,16(a0)
ffffffffc02040f0:	6510                	ld	a2,8(a0)
ffffffffc02040f2:	00009517          	auipc	a0,0x9
ffffffffc02040f6:	db650513          	addi	a0,a0,-586 # ffffffffc020cea8 <default_pmm_manager+0xa18>
ffffffffc02040fa:	8acfc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02040fe:	00009697          	auipc	a3,0x9
ffffffffc0204102:	dd268693          	addi	a3,a3,-558 # ffffffffc020ced0 <default_pmm_manager+0xa40>
ffffffffc0204106:	00008617          	auipc	a2,0x8
ffffffffc020410a:	8a260613          	addi	a2,a2,-1886 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020410e:	15900593          	li	a1,345
ffffffffc0204112:	00009517          	auipc	a0,0x9
ffffffffc0204116:	bbe50513          	addi	a0,a0,-1090 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc020411a:	b84fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020411e:	147d                	addi	s0,s0,-1
ffffffffc0204120:	fd2410e3          	bne	s0,s2,ffffffffc02040e0 <vmm_init+0x178>
ffffffffc0204124:	8526                	mv	a0,s1
ffffffffc0204126:	c31ff0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc020412a:	00009517          	auipc	a0,0x9
ffffffffc020412e:	dbe50513          	addi	a0,a0,-578 # ffffffffc020cee8 <default_pmm_manager+0xa58>
ffffffffc0204132:	874fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0204136:	7442                	ld	s0,48(sp)
ffffffffc0204138:	70e2                	ld	ra,56(sp)
ffffffffc020413a:	74a2                	ld	s1,40(sp)
ffffffffc020413c:	7902                	ld	s2,32(sp)
ffffffffc020413e:	69e2                	ld	s3,24(sp)
ffffffffc0204140:	6a42                	ld	s4,16(sp)
ffffffffc0204142:	6aa2                	ld	s5,8(sp)
ffffffffc0204144:	00009517          	auipc	a0,0x9
ffffffffc0204148:	dc450513          	addi	a0,a0,-572 # ffffffffc020cf08 <default_pmm_manager+0xa78>
ffffffffc020414c:	6121                	addi	sp,sp,64
ffffffffc020414e:	858fc06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0204152:	00009697          	auipc	a3,0x9
ffffffffc0204156:	c6e68693          	addi	a3,a3,-914 # ffffffffc020cdc0 <default_pmm_manager+0x930>
ffffffffc020415a:	00008617          	auipc	a2,0x8
ffffffffc020415e:	84e60613          	addi	a2,a2,-1970 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204162:	13d00593          	li	a1,317
ffffffffc0204166:	00009517          	auipc	a0,0x9
ffffffffc020416a:	b6a50513          	addi	a0,a0,-1174 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc020416e:	b30fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204172:	00009697          	auipc	a3,0x9
ffffffffc0204176:	cd668693          	addi	a3,a3,-810 # ffffffffc020ce48 <default_pmm_manager+0x9b8>
ffffffffc020417a:	00008617          	auipc	a2,0x8
ffffffffc020417e:	82e60613          	addi	a2,a2,-2002 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204182:	14e00593          	li	a1,334
ffffffffc0204186:	00009517          	auipc	a0,0x9
ffffffffc020418a:	b4a50513          	addi	a0,a0,-1206 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc020418e:	b10fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204192:	00009697          	auipc	a3,0x9
ffffffffc0204196:	ce668693          	addi	a3,a3,-794 # ffffffffc020ce78 <default_pmm_manager+0x9e8>
ffffffffc020419a:	00008617          	auipc	a2,0x8
ffffffffc020419e:	80e60613          	addi	a2,a2,-2034 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02041a2:	14f00593          	li	a1,335
ffffffffc02041a6:	00009517          	auipc	a0,0x9
ffffffffc02041aa:	b2a50513          	addi	a0,a0,-1238 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc02041ae:	af0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041b2:	00009697          	auipc	a3,0x9
ffffffffc02041b6:	bf668693          	addi	a3,a3,-1034 # ffffffffc020cda8 <default_pmm_manager+0x918>
ffffffffc02041ba:	00007617          	auipc	a2,0x7
ffffffffc02041be:	7ee60613          	addi	a2,a2,2030 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02041c2:	13b00593          	li	a1,315
ffffffffc02041c6:	00009517          	auipc	a0,0x9
ffffffffc02041ca:	b0a50513          	addi	a0,a0,-1270 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc02041ce:	ad0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041d2:	00009697          	auipc	a3,0x9
ffffffffc02041d6:	c3668693          	addi	a3,a3,-970 # ffffffffc020ce08 <default_pmm_manager+0x978>
ffffffffc02041da:	00007617          	auipc	a2,0x7
ffffffffc02041de:	7ce60613          	addi	a2,a2,1998 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02041e2:	14600593          	li	a1,326
ffffffffc02041e6:	00009517          	auipc	a0,0x9
ffffffffc02041ea:	aea50513          	addi	a0,a0,-1302 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc02041ee:	ab0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041f2:	00009697          	auipc	a3,0x9
ffffffffc02041f6:	c0668693          	addi	a3,a3,-1018 # ffffffffc020cdf8 <default_pmm_manager+0x968>
ffffffffc02041fa:	00007617          	auipc	a2,0x7
ffffffffc02041fe:	7ae60613          	addi	a2,a2,1966 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204202:	14400593          	li	a1,324
ffffffffc0204206:	00009517          	auipc	a0,0x9
ffffffffc020420a:	aca50513          	addi	a0,a0,-1334 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc020420e:	a90fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204212:	00009697          	auipc	a3,0x9
ffffffffc0204216:	c0668693          	addi	a3,a3,-1018 # ffffffffc020ce18 <default_pmm_manager+0x988>
ffffffffc020421a:	00007617          	auipc	a2,0x7
ffffffffc020421e:	78e60613          	addi	a2,a2,1934 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204222:	14800593          	li	a1,328
ffffffffc0204226:	00009517          	auipc	a0,0x9
ffffffffc020422a:	aaa50513          	addi	a0,a0,-1366 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc020422e:	a70fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204232:	00009697          	auipc	a3,0x9
ffffffffc0204236:	c0668693          	addi	a3,a3,-1018 # ffffffffc020ce38 <default_pmm_manager+0x9a8>
ffffffffc020423a:	00007617          	auipc	a2,0x7
ffffffffc020423e:	76e60613          	addi	a2,a2,1902 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204242:	14c00593          	li	a1,332
ffffffffc0204246:	00009517          	auipc	a0,0x9
ffffffffc020424a:	a8a50513          	addi	a0,a0,-1398 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc020424e:	a50fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204252:	00009697          	auipc	a3,0x9
ffffffffc0204256:	bd668693          	addi	a3,a3,-1066 # ffffffffc020ce28 <default_pmm_manager+0x998>
ffffffffc020425a:	00007617          	auipc	a2,0x7
ffffffffc020425e:	74e60613          	addi	a2,a2,1870 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204262:	14a00593          	li	a1,330
ffffffffc0204266:	00009517          	auipc	a0,0x9
ffffffffc020426a:	a6a50513          	addi	a0,a0,-1430 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc020426e:	a30fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204272:	00009697          	auipc	a3,0x9
ffffffffc0204276:	ae668693          	addi	a3,a3,-1306 # ffffffffc020cd58 <default_pmm_manager+0x8c8>
ffffffffc020427a:	00007617          	auipc	a2,0x7
ffffffffc020427e:	72e60613          	addi	a2,a2,1838 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204282:	12400593          	li	a1,292
ffffffffc0204286:	00009517          	auipc	a0,0x9
ffffffffc020428a:	a4a50513          	addi	a0,a0,-1462 # ffffffffc020ccd0 <default_pmm_manager+0x840>
ffffffffc020428e:	a10fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204292 <user_mem_check>:
ffffffffc0204292:	7179                	addi	sp,sp,-48
ffffffffc0204294:	f022                	sd	s0,32(sp)
ffffffffc0204296:	f406                	sd	ra,40(sp)
ffffffffc0204298:	ec26                	sd	s1,24(sp)
ffffffffc020429a:	e84a                	sd	s2,16(sp)
ffffffffc020429c:	e44e                	sd	s3,8(sp)
ffffffffc020429e:	e052                	sd	s4,0(sp)
ffffffffc02042a0:	842e                	mv	s0,a1
ffffffffc02042a2:	c135                	beqz	a0,ffffffffc0204306 <user_mem_check+0x74>
ffffffffc02042a4:	002007b7          	lui	a5,0x200
ffffffffc02042a8:	04f5e663          	bltu	a1,a5,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ac:	00c584b3          	add	s1,a1,a2
ffffffffc02042b0:	0495f263          	bgeu	a1,s1,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042b4:	4785                	li	a5,1
ffffffffc02042b6:	07fe                	slli	a5,a5,0x1f
ffffffffc02042b8:	0297ee63          	bltu	a5,s1,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042bc:	892a                	mv	s2,a0
ffffffffc02042be:	89b6                	mv	s3,a3
ffffffffc02042c0:	6a05                	lui	s4,0x1
ffffffffc02042c2:	a821                	j	ffffffffc02042da <user_mem_check+0x48>
ffffffffc02042c4:	0027f693          	andi	a3,a5,2
ffffffffc02042c8:	9752                	add	a4,a4,s4
ffffffffc02042ca:	8ba1                	andi	a5,a5,8
ffffffffc02042cc:	c685                	beqz	a3,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ce:	c399                	beqz	a5,ffffffffc02042d4 <user_mem_check+0x42>
ffffffffc02042d0:	02e46263          	bltu	s0,a4,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042d4:	6900                	ld	s0,16(a0)
ffffffffc02042d6:	04947663          	bgeu	s0,s1,ffffffffc0204322 <user_mem_check+0x90>
ffffffffc02042da:	85a2                	mv	a1,s0
ffffffffc02042dc:	854a                	mv	a0,s2
ffffffffc02042de:	969ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02042e2:	c909                	beqz	a0,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042e4:	6518                	ld	a4,8(a0)
ffffffffc02042e6:	00e46763          	bltu	s0,a4,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ea:	4d1c                	lw	a5,24(a0)
ffffffffc02042ec:	fc099ce3          	bnez	s3,ffffffffc02042c4 <user_mem_check+0x32>
ffffffffc02042f0:	8b85                	andi	a5,a5,1
ffffffffc02042f2:	f3ed                	bnez	a5,ffffffffc02042d4 <user_mem_check+0x42>
ffffffffc02042f4:	4501                	li	a0,0
ffffffffc02042f6:	70a2                	ld	ra,40(sp)
ffffffffc02042f8:	7402                	ld	s0,32(sp)
ffffffffc02042fa:	64e2                	ld	s1,24(sp)
ffffffffc02042fc:	6942                	ld	s2,16(sp)
ffffffffc02042fe:	69a2                	ld	s3,8(sp)
ffffffffc0204300:	6a02                	ld	s4,0(sp)
ffffffffc0204302:	6145                	addi	sp,sp,48
ffffffffc0204304:	8082                	ret
ffffffffc0204306:	c02007b7          	lui	a5,0xc0200
ffffffffc020430a:	4501                	li	a0,0
ffffffffc020430c:	fef5e5e3          	bltu	a1,a5,ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204310:	962e                	add	a2,a2,a1
ffffffffc0204312:	fec5f2e3          	bgeu	a1,a2,ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204316:	c8000537          	lui	a0,0xc8000
ffffffffc020431a:	0505                	addi	a0,a0,1
ffffffffc020431c:	00a63533          	sltu	a0,a2,a0
ffffffffc0204320:	bfd9                	j	ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204322:	4505                	li	a0,1
ffffffffc0204324:	bfc9                	j	ffffffffc02042f6 <user_mem_check+0x64>

ffffffffc0204326 <copy_from_user>:
ffffffffc0204326:	1101                	addi	sp,sp,-32
ffffffffc0204328:	e822                	sd	s0,16(sp)
ffffffffc020432a:	e426                	sd	s1,8(sp)
ffffffffc020432c:	8432                	mv	s0,a2
ffffffffc020432e:	84b6                	mv	s1,a3
ffffffffc0204330:	e04a                	sd	s2,0(sp)
ffffffffc0204332:	86ba                	mv	a3,a4
ffffffffc0204334:	892e                	mv	s2,a1
ffffffffc0204336:	8626                	mv	a2,s1
ffffffffc0204338:	85a2                	mv	a1,s0
ffffffffc020433a:	ec06                	sd	ra,24(sp)
ffffffffc020433c:	f57ff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0204340:	c519                	beqz	a0,ffffffffc020434e <copy_from_user+0x28>
ffffffffc0204342:	8626                	mv	a2,s1
ffffffffc0204344:	85a2                	mv	a1,s0
ffffffffc0204346:	854a                	mv	a0,s2
ffffffffc0204348:	1ce070ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc020434c:	4505                	li	a0,1
ffffffffc020434e:	60e2                	ld	ra,24(sp)
ffffffffc0204350:	6442                	ld	s0,16(sp)
ffffffffc0204352:	64a2                	ld	s1,8(sp)
ffffffffc0204354:	6902                	ld	s2,0(sp)
ffffffffc0204356:	6105                	addi	sp,sp,32
ffffffffc0204358:	8082                	ret

ffffffffc020435a <copy_to_user>:
ffffffffc020435a:	1101                	addi	sp,sp,-32
ffffffffc020435c:	e822                	sd	s0,16(sp)
ffffffffc020435e:	8436                	mv	s0,a3
ffffffffc0204360:	e04a                	sd	s2,0(sp)
ffffffffc0204362:	4685                	li	a3,1
ffffffffc0204364:	8932                	mv	s2,a2
ffffffffc0204366:	8622                	mv	a2,s0
ffffffffc0204368:	e426                	sd	s1,8(sp)
ffffffffc020436a:	ec06                	sd	ra,24(sp)
ffffffffc020436c:	84ae                	mv	s1,a1
ffffffffc020436e:	f25ff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0204372:	c519                	beqz	a0,ffffffffc0204380 <copy_to_user+0x26>
ffffffffc0204374:	8622                	mv	a2,s0
ffffffffc0204376:	85ca                	mv	a1,s2
ffffffffc0204378:	8526                	mv	a0,s1
ffffffffc020437a:	19c070ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc020437e:	4505                	li	a0,1
ffffffffc0204380:	60e2                	ld	ra,24(sp)
ffffffffc0204382:	6442                	ld	s0,16(sp)
ffffffffc0204384:	64a2                	ld	s1,8(sp)
ffffffffc0204386:	6902                	ld	s2,0(sp)
ffffffffc0204388:	6105                	addi	sp,sp,32
ffffffffc020438a:	8082                	ret

ffffffffc020438c <copy_string>:
ffffffffc020438c:	7139                	addi	sp,sp,-64
ffffffffc020438e:	ec4e                	sd	s3,24(sp)
ffffffffc0204390:	6985                	lui	s3,0x1
ffffffffc0204392:	99b2                	add	s3,s3,a2
ffffffffc0204394:	77fd                	lui	a5,0xfffff
ffffffffc0204396:	00f9f9b3          	and	s3,s3,a5
ffffffffc020439a:	f426                	sd	s1,40(sp)
ffffffffc020439c:	f04a                	sd	s2,32(sp)
ffffffffc020439e:	e852                	sd	s4,16(sp)
ffffffffc02043a0:	e456                	sd	s5,8(sp)
ffffffffc02043a2:	fc06                	sd	ra,56(sp)
ffffffffc02043a4:	f822                	sd	s0,48(sp)
ffffffffc02043a6:	84b2                	mv	s1,a2
ffffffffc02043a8:	8aaa                	mv	s5,a0
ffffffffc02043aa:	8a2e                	mv	s4,a1
ffffffffc02043ac:	8936                	mv	s2,a3
ffffffffc02043ae:	40c989b3          	sub	s3,s3,a2
ffffffffc02043b2:	a015                	j	ffffffffc02043d6 <copy_string+0x4a>
ffffffffc02043b4:	088070ef          	jal	ra,ffffffffc020b43c <strnlen>
ffffffffc02043b8:	87aa                	mv	a5,a0
ffffffffc02043ba:	85a6                	mv	a1,s1
ffffffffc02043bc:	8552                	mv	a0,s4
ffffffffc02043be:	8622                	mv	a2,s0
ffffffffc02043c0:	0487e363          	bltu	a5,s0,ffffffffc0204406 <copy_string+0x7a>
ffffffffc02043c4:	0329f763          	bgeu	s3,s2,ffffffffc02043f2 <copy_string+0x66>
ffffffffc02043c8:	14e070ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc02043cc:	9a22                	add	s4,s4,s0
ffffffffc02043ce:	94a2                	add	s1,s1,s0
ffffffffc02043d0:	40890933          	sub	s2,s2,s0
ffffffffc02043d4:	6985                	lui	s3,0x1
ffffffffc02043d6:	4681                	li	a3,0
ffffffffc02043d8:	85a6                	mv	a1,s1
ffffffffc02043da:	8556                	mv	a0,s5
ffffffffc02043dc:	844a                	mv	s0,s2
ffffffffc02043de:	0129f363          	bgeu	s3,s2,ffffffffc02043e4 <copy_string+0x58>
ffffffffc02043e2:	844e                	mv	s0,s3
ffffffffc02043e4:	8622                	mv	a2,s0
ffffffffc02043e6:	eadff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc02043ea:	87aa                	mv	a5,a0
ffffffffc02043ec:	85a2                	mv	a1,s0
ffffffffc02043ee:	8526                	mv	a0,s1
ffffffffc02043f0:	f3f1                	bnez	a5,ffffffffc02043b4 <copy_string+0x28>
ffffffffc02043f2:	4501                	li	a0,0
ffffffffc02043f4:	70e2                	ld	ra,56(sp)
ffffffffc02043f6:	7442                	ld	s0,48(sp)
ffffffffc02043f8:	74a2                	ld	s1,40(sp)
ffffffffc02043fa:	7902                	ld	s2,32(sp)
ffffffffc02043fc:	69e2                	ld	s3,24(sp)
ffffffffc02043fe:	6a42                	ld	s4,16(sp)
ffffffffc0204400:	6aa2                	ld	s5,8(sp)
ffffffffc0204402:	6121                	addi	sp,sp,64
ffffffffc0204404:	8082                	ret
ffffffffc0204406:	00178613          	addi	a2,a5,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc020440a:	10c070ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc020440e:	4505                	li	a0,1
ffffffffc0204410:	b7d5                	j	ffffffffc02043f4 <copy_string+0x68>

ffffffffc0204412 <__down.constprop.0>:
ffffffffc0204412:	715d                	addi	sp,sp,-80
ffffffffc0204414:	e0a2                	sd	s0,64(sp)
ffffffffc0204416:	e486                	sd	ra,72(sp)
ffffffffc0204418:	fc26                	sd	s1,56(sp)
ffffffffc020441a:	842a                	mv	s0,a0
ffffffffc020441c:	100027f3          	csrr	a5,sstatus
ffffffffc0204420:	8b89                	andi	a5,a5,2
ffffffffc0204422:	ebb1                	bnez	a5,ffffffffc0204476 <__down.constprop.0+0x64>
ffffffffc0204424:	411c                	lw	a5,0(a0)
ffffffffc0204426:	00f05a63          	blez	a5,ffffffffc020443a <__down.constprop.0+0x28>
ffffffffc020442a:	37fd                	addiw	a5,a5,-1
ffffffffc020442c:	c11c                	sw	a5,0(a0)
ffffffffc020442e:	4501                	li	a0,0
ffffffffc0204430:	60a6                	ld	ra,72(sp)
ffffffffc0204432:	6406                	ld	s0,64(sp)
ffffffffc0204434:	74e2                	ld	s1,56(sp)
ffffffffc0204436:	6161                	addi	sp,sp,80
ffffffffc0204438:	8082                	ret
ffffffffc020443a:	00850413          	addi	s0,a0,8 # ffffffffc8000008 <end+0x7d696f8>
ffffffffc020443e:	0024                	addi	s1,sp,8
ffffffffc0204440:	10000613          	li	a2,256
ffffffffc0204444:	85a6                	mv	a1,s1
ffffffffc0204446:	8522                	mv	a0,s0
ffffffffc0204448:	2d8000ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc020444c:	6ff020ef          	jal	ra,ffffffffc020734a <schedule>
ffffffffc0204450:	100027f3          	csrr	a5,sstatus
ffffffffc0204454:	8b89                	andi	a5,a5,2
ffffffffc0204456:	efb9                	bnez	a5,ffffffffc02044b4 <__down.constprop.0+0xa2>
ffffffffc0204458:	8526                	mv	a0,s1
ffffffffc020445a:	19c000ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc020445e:	e531                	bnez	a0,ffffffffc02044aa <__down.constprop.0+0x98>
ffffffffc0204460:	4542                	lw	a0,16(sp)
ffffffffc0204462:	10000793          	li	a5,256
ffffffffc0204466:	fcf515e3          	bne	a0,a5,ffffffffc0204430 <__down.constprop.0+0x1e>
ffffffffc020446a:	60a6                	ld	ra,72(sp)
ffffffffc020446c:	6406                	ld	s0,64(sp)
ffffffffc020446e:	74e2                	ld	s1,56(sp)
ffffffffc0204470:	4501                	li	a0,0
ffffffffc0204472:	6161                	addi	sp,sp,80
ffffffffc0204474:	8082                	ret
ffffffffc0204476:	ffcfc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020447a:	401c                	lw	a5,0(s0)
ffffffffc020447c:	00f05c63          	blez	a5,ffffffffc0204494 <__down.constprop.0+0x82>
ffffffffc0204480:	37fd                	addiw	a5,a5,-1
ffffffffc0204482:	c01c                	sw	a5,0(s0)
ffffffffc0204484:	fe8fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204488:	60a6                	ld	ra,72(sp)
ffffffffc020448a:	6406                	ld	s0,64(sp)
ffffffffc020448c:	74e2                	ld	s1,56(sp)
ffffffffc020448e:	4501                	li	a0,0
ffffffffc0204490:	6161                	addi	sp,sp,80
ffffffffc0204492:	8082                	ret
ffffffffc0204494:	0421                	addi	s0,s0,8
ffffffffc0204496:	0024                	addi	s1,sp,8
ffffffffc0204498:	10000613          	li	a2,256
ffffffffc020449c:	85a6                	mv	a1,s1
ffffffffc020449e:	8522                	mv	a0,s0
ffffffffc02044a0:	280000ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc02044a4:	fc8fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02044a8:	b755                	j	ffffffffc020444c <__down.constprop.0+0x3a>
ffffffffc02044aa:	85a6                	mv	a1,s1
ffffffffc02044ac:	8522                	mv	a0,s0
ffffffffc02044ae:	0ee000ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc02044b2:	b77d                	j	ffffffffc0204460 <__down.constprop.0+0x4e>
ffffffffc02044b4:	fbefc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02044b8:	8526                	mv	a0,s1
ffffffffc02044ba:	13c000ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc02044be:	e501                	bnez	a0,ffffffffc02044c6 <__down.constprop.0+0xb4>
ffffffffc02044c0:	facfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02044c4:	bf71                	j	ffffffffc0204460 <__down.constprop.0+0x4e>
ffffffffc02044c6:	85a6                	mv	a1,s1
ffffffffc02044c8:	8522                	mv	a0,s0
ffffffffc02044ca:	0d2000ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc02044ce:	bfcd                	j	ffffffffc02044c0 <__down.constprop.0+0xae>

ffffffffc02044d0 <__up.constprop.0>:
ffffffffc02044d0:	1101                	addi	sp,sp,-32
ffffffffc02044d2:	e822                	sd	s0,16(sp)
ffffffffc02044d4:	ec06                	sd	ra,24(sp)
ffffffffc02044d6:	e426                	sd	s1,8(sp)
ffffffffc02044d8:	e04a                	sd	s2,0(sp)
ffffffffc02044da:	842a                	mv	s0,a0
ffffffffc02044dc:	100027f3          	csrr	a5,sstatus
ffffffffc02044e0:	8b89                	andi	a5,a5,2
ffffffffc02044e2:	4901                	li	s2,0
ffffffffc02044e4:	eba1                	bnez	a5,ffffffffc0204534 <__up.constprop.0+0x64>
ffffffffc02044e6:	00840493          	addi	s1,s0,8
ffffffffc02044ea:	8526                	mv	a0,s1
ffffffffc02044ec:	0ee000ef          	jal	ra,ffffffffc02045da <wait_queue_first>
ffffffffc02044f0:	85aa                	mv	a1,a0
ffffffffc02044f2:	cd0d                	beqz	a0,ffffffffc020452c <__up.constprop.0+0x5c>
ffffffffc02044f4:	6118                	ld	a4,0(a0)
ffffffffc02044f6:	10000793          	li	a5,256
ffffffffc02044fa:	0ec72703          	lw	a4,236(a4)
ffffffffc02044fe:	02f71f63          	bne	a4,a5,ffffffffc020453c <__up.constprop.0+0x6c>
ffffffffc0204502:	4685                	li	a3,1
ffffffffc0204504:	10000613          	li	a2,256
ffffffffc0204508:	8526                	mv	a0,s1
ffffffffc020450a:	0fa000ef          	jal	ra,ffffffffc0204604 <wakeup_wait>
ffffffffc020450e:	00091863          	bnez	s2,ffffffffc020451e <__up.constprop.0+0x4e>
ffffffffc0204512:	60e2                	ld	ra,24(sp)
ffffffffc0204514:	6442                	ld	s0,16(sp)
ffffffffc0204516:	64a2                	ld	s1,8(sp)
ffffffffc0204518:	6902                	ld	s2,0(sp)
ffffffffc020451a:	6105                	addi	sp,sp,32
ffffffffc020451c:	8082                	ret
ffffffffc020451e:	6442                	ld	s0,16(sp)
ffffffffc0204520:	60e2                	ld	ra,24(sp)
ffffffffc0204522:	64a2                	ld	s1,8(sp)
ffffffffc0204524:	6902                	ld	s2,0(sp)
ffffffffc0204526:	6105                	addi	sp,sp,32
ffffffffc0204528:	f44fc06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020452c:	401c                	lw	a5,0(s0)
ffffffffc020452e:	2785                	addiw	a5,a5,1
ffffffffc0204530:	c01c                	sw	a5,0(s0)
ffffffffc0204532:	bff1                	j	ffffffffc020450e <__up.constprop.0+0x3e>
ffffffffc0204534:	f3efc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204538:	4905                	li	s2,1
ffffffffc020453a:	b775                	j	ffffffffc02044e6 <__up.constprop.0+0x16>
ffffffffc020453c:	00009697          	auipc	a3,0x9
ffffffffc0204540:	9f468693          	addi	a3,a3,-1548 # ffffffffc020cf30 <default_pmm_manager+0xaa0>
ffffffffc0204544:	00007617          	auipc	a2,0x7
ffffffffc0204548:	46460613          	addi	a2,a2,1124 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020454c:	45e5                	li	a1,25
ffffffffc020454e:	00009517          	auipc	a0,0x9
ffffffffc0204552:	a0a50513          	addi	a0,a0,-1526 # ffffffffc020cf58 <default_pmm_manager+0xac8>
ffffffffc0204556:	f49fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020455a <sem_init>:
ffffffffc020455a:	c10c                	sw	a1,0(a0)
ffffffffc020455c:	0521                	addi	a0,a0,8
ffffffffc020455e:	a825                	j	ffffffffc0204596 <wait_queue_init>

ffffffffc0204560 <up>:
ffffffffc0204560:	f71ff06f          	j	ffffffffc02044d0 <__up.constprop.0>

ffffffffc0204564 <down>:
ffffffffc0204564:	1141                	addi	sp,sp,-16
ffffffffc0204566:	e406                	sd	ra,8(sp)
ffffffffc0204568:	eabff0ef          	jal	ra,ffffffffc0204412 <__down.constprop.0>
ffffffffc020456c:	2501                	sext.w	a0,a0
ffffffffc020456e:	e501                	bnez	a0,ffffffffc0204576 <down+0x12>
ffffffffc0204570:	60a2                	ld	ra,8(sp)
ffffffffc0204572:	0141                	addi	sp,sp,16
ffffffffc0204574:	8082                	ret
ffffffffc0204576:	00009697          	auipc	a3,0x9
ffffffffc020457a:	9f268693          	addi	a3,a3,-1550 # ffffffffc020cf68 <default_pmm_manager+0xad8>
ffffffffc020457e:	00007617          	auipc	a2,0x7
ffffffffc0204582:	42a60613          	addi	a2,a2,1066 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204586:	04000593          	li	a1,64
ffffffffc020458a:	00009517          	auipc	a0,0x9
ffffffffc020458e:	9ce50513          	addi	a0,a0,-1586 # ffffffffc020cf58 <default_pmm_manager+0xac8>
ffffffffc0204592:	f0dfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204596 <wait_queue_init>:
ffffffffc0204596:	e508                	sd	a0,8(a0)
ffffffffc0204598:	e108                	sd	a0,0(a0)
ffffffffc020459a:	8082                	ret

ffffffffc020459c <wait_queue_del>:
ffffffffc020459c:	7198                	ld	a4,32(a1)
ffffffffc020459e:	01858793          	addi	a5,a1,24
ffffffffc02045a2:	00e78b63          	beq	a5,a4,ffffffffc02045b8 <wait_queue_del+0x1c>
ffffffffc02045a6:	6994                	ld	a3,16(a1)
ffffffffc02045a8:	00a69863          	bne	a3,a0,ffffffffc02045b8 <wait_queue_del+0x1c>
ffffffffc02045ac:	6d94                	ld	a3,24(a1)
ffffffffc02045ae:	e698                	sd	a4,8(a3)
ffffffffc02045b0:	e314                	sd	a3,0(a4)
ffffffffc02045b2:	f19c                	sd	a5,32(a1)
ffffffffc02045b4:	ed9c                	sd	a5,24(a1)
ffffffffc02045b6:	8082                	ret
ffffffffc02045b8:	1141                	addi	sp,sp,-16
ffffffffc02045ba:	00009697          	auipc	a3,0x9
ffffffffc02045be:	a0e68693          	addi	a3,a3,-1522 # ffffffffc020cfc8 <default_pmm_manager+0xb38>
ffffffffc02045c2:	00007617          	auipc	a2,0x7
ffffffffc02045c6:	3e660613          	addi	a2,a2,998 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02045ca:	45f1                	li	a1,28
ffffffffc02045cc:	00009517          	auipc	a0,0x9
ffffffffc02045d0:	9e450513          	addi	a0,a0,-1564 # ffffffffc020cfb0 <default_pmm_manager+0xb20>
ffffffffc02045d4:	e406                	sd	ra,8(sp)
ffffffffc02045d6:	ec9fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02045da <wait_queue_first>:
ffffffffc02045da:	651c                	ld	a5,8(a0)
ffffffffc02045dc:	00f50563          	beq	a0,a5,ffffffffc02045e6 <wait_queue_first+0xc>
ffffffffc02045e0:	fe878513          	addi	a0,a5,-24
ffffffffc02045e4:	8082                	ret
ffffffffc02045e6:	4501                	li	a0,0
ffffffffc02045e8:	8082                	ret

ffffffffc02045ea <wait_queue_empty>:
ffffffffc02045ea:	651c                	ld	a5,8(a0)
ffffffffc02045ec:	40a78533          	sub	a0,a5,a0
ffffffffc02045f0:	00153513          	seqz	a0,a0
ffffffffc02045f4:	8082                	ret

ffffffffc02045f6 <wait_in_queue>:
ffffffffc02045f6:	711c                	ld	a5,32(a0)
ffffffffc02045f8:	0561                	addi	a0,a0,24
ffffffffc02045fa:	40a78533          	sub	a0,a5,a0
ffffffffc02045fe:	00a03533          	snez	a0,a0
ffffffffc0204602:	8082                	ret

ffffffffc0204604 <wakeup_wait>:
ffffffffc0204604:	e689                	bnez	a3,ffffffffc020460e <wakeup_wait+0xa>
ffffffffc0204606:	6188                	ld	a0,0(a1)
ffffffffc0204608:	c590                	sw	a2,8(a1)
ffffffffc020460a:	48f0206f          	j	ffffffffc0207298 <wakeup_proc>
ffffffffc020460e:	7198                	ld	a4,32(a1)
ffffffffc0204610:	01858793          	addi	a5,a1,24
ffffffffc0204614:	00e78e63          	beq	a5,a4,ffffffffc0204630 <wakeup_wait+0x2c>
ffffffffc0204618:	6994                	ld	a3,16(a1)
ffffffffc020461a:	00d51b63          	bne	a0,a3,ffffffffc0204630 <wakeup_wait+0x2c>
ffffffffc020461e:	6d94                	ld	a3,24(a1)
ffffffffc0204620:	6188                	ld	a0,0(a1)
ffffffffc0204622:	e698                	sd	a4,8(a3)
ffffffffc0204624:	e314                	sd	a3,0(a4)
ffffffffc0204626:	f19c                	sd	a5,32(a1)
ffffffffc0204628:	ed9c                	sd	a5,24(a1)
ffffffffc020462a:	c590                	sw	a2,8(a1)
ffffffffc020462c:	46d0206f          	j	ffffffffc0207298 <wakeup_proc>
ffffffffc0204630:	1141                	addi	sp,sp,-16
ffffffffc0204632:	00009697          	auipc	a3,0x9
ffffffffc0204636:	99668693          	addi	a3,a3,-1642 # ffffffffc020cfc8 <default_pmm_manager+0xb38>
ffffffffc020463a:	00007617          	auipc	a2,0x7
ffffffffc020463e:	36e60613          	addi	a2,a2,878 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204642:	45f1                	li	a1,28
ffffffffc0204644:	00009517          	auipc	a0,0x9
ffffffffc0204648:	96c50513          	addi	a0,a0,-1684 # ffffffffc020cfb0 <default_pmm_manager+0xb20>
ffffffffc020464c:	e406                	sd	ra,8(sp)
ffffffffc020464e:	e51fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204652 <wakeup_queue>:
ffffffffc0204652:	651c                	ld	a5,8(a0)
ffffffffc0204654:	0ca78563          	beq	a5,a0,ffffffffc020471e <wakeup_queue+0xcc>
ffffffffc0204658:	1101                	addi	sp,sp,-32
ffffffffc020465a:	e822                	sd	s0,16(sp)
ffffffffc020465c:	e426                	sd	s1,8(sp)
ffffffffc020465e:	e04a                	sd	s2,0(sp)
ffffffffc0204660:	ec06                	sd	ra,24(sp)
ffffffffc0204662:	84aa                	mv	s1,a0
ffffffffc0204664:	892e                	mv	s2,a1
ffffffffc0204666:	fe878413          	addi	s0,a5,-24
ffffffffc020466a:	e23d                	bnez	a2,ffffffffc02046d0 <wakeup_queue+0x7e>
ffffffffc020466c:	6008                	ld	a0,0(s0)
ffffffffc020466e:	01242423          	sw	s2,8(s0)
ffffffffc0204672:	427020ef          	jal	ra,ffffffffc0207298 <wakeup_proc>
ffffffffc0204676:	701c                	ld	a5,32(s0)
ffffffffc0204678:	01840713          	addi	a4,s0,24
ffffffffc020467c:	02e78463          	beq	a5,a4,ffffffffc02046a4 <wakeup_queue+0x52>
ffffffffc0204680:	6818                	ld	a4,16(s0)
ffffffffc0204682:	02e49163          	bne	s1,a4,ffffffffc02046a4 <wakeup_queue+0x52>
ffffffffc0204686:	02f48f63          	beq	s1,a5,ffffffffc02046c4 <wakeup_queue+0x72>
ffffffffc020468a:	fe87b503          	ld	a0,-24(a5)
ffffffffc020468e:	ff27a823          	sw	s2,-16(a5)
ffffffffc0204692:	fe878413          	addi	s0,a5,-24
ffffffffc0204696:	403020ef          	jal	ra,ffffffffc0207298 <wakeup_proc>
ffffffffc020469a:	701c                	ld	a5,32(s0)
ffffffffc020469c:	01840713          	addi	a4,s0,24
ffffffffc02046a0:	fee790e3          	bne	a5,a4,ffffffffc0204680 <wakeup_queue+0x2e>
ffffffffc02046a4:	00009697          	auipc	a3,0x9
ffffffffc02046a8:	92468693          	addi	a3,a3,-1756 # ffffffffc020cfc8 <default_pmm_manager+0xb38>
ffffffffc02046ac:	00007617          	auipc	a2,0x7
ffffffffc02046b0:	2fc60613          	addi	a2,a2,764 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02046b4:	02200593          	li	a1,34
ffffffffc02046b8:	00009517          	auipc	a0,0x9
ffffffffc02046bc:	8f850513          	addi	a0,a0,-1800 # ffffffffc020cfb0 <default_pmm_manager+0xb20>
ffffffffc02046c0:	ddffb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02046c4:	60e2                	ld	ra,24(sp)
ffffffffc02046c6:	6442                	ld	s0,16(sp)
ffffffffc02046c8:	64a2                	ld	s1,8(sp)
ffffffffc02046ca:	6902                	ld	s2,0(sp)
ffffffffc02046cc:	6105                	addi	sp,sp,32
ffffffffc02046ce:	8082                	ret
ffffffffc02046d0:	6798                	ld	a4,8(a5)
ffffffffc02046d2:	02f70763          	beq	a4,a5,ffffffffc0204700 <wakeup_queue+0xae>
ffffffffc02046d6:	6814                	ld	a3,16(s0)
ffffffffc02046d8:	02d49463          	bne	s1,a3,ffffffffc0204700 <wakeup_queue+0xae>
ffffffffc02046dc:	6c14                	ld	a3,24(s0)
ffffffffc02046de:	6008                	ld	a0,0(s0)
ffffffffc02046e0:	e698                	sd	a4,8(a3)
ffffffffc02046e2:	e314                	sd	a3,0(a4)
ffffffffc02046e4:	f01c                	sd	a5,32(s0)
ffffffffc02046e6:	ec1c                	sd	a5,24(s0)
ffffffffc02046e8:	01242423          	sw	s2,8(s0)
ffffffffc02046ec:	3ad020ef          	jal	ra,ffffffffc0207298 <wakeup_proc>
ffffffffc02046f0:	6480                	ld	s0,8(s1)
ffffffffc02046f2:	fc8489e3          	beq	s1,s0,ffffffffc02046c4 <wakeup_queue+0x72>
ffffffffc02046f6:	6418                	ld	a4,8(s0)
ffffffffc02046f8:	87a2                	mv	a5,s0
ffffffffc02046fa:	1421                	addi	s0,s0,-24
ffffffffc02046fc:	fce79de3          	bne	a5,a4,ffffffffc02046d6 <wakeup_queue+0x84>
ffffffffc0204700:	00009697          	auipc	a3,0x9
ffffffffc0204704:	8c868693          	addi	a3,a3,-1848 # ffffffffc020cfc8 <default_pmm_manager+0xb38>
ffffffffc0204708:	00007617          	auipc	a2,0x7
ffffffffc020470c:	2a060613          	addi	a2,a2,672 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204710:	45f1                	li	a1,28
ffffffffc0204712:	00009517          	auipc	a0,0x9
ffffffffc0204716:	89e50513          	addi	a0,a0,-1890 # ffffffffc020cfb0 <default_pmm_manager+0xb20>
ffffffffc020471a:	d85fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020471e:	8082                	ret

ffffffffc0204720 <wait_current_set>:
ffffffffc0204720:	00092797          	auipc	a5,0x92
ffffffffc0204724:	1a07b783          	ld	a5,416(a5) # ffffffffc02968c0 <current>
ffffffffc0204728:	c39d                	beqz	a5,ffffffffc020474e <wait_current_set+0x2e>
ffffffffc020472a:	01858713          	addi	a4,a1,24
ffffffffc020472e:	800006b7          	lui	a3,0x80000
ffffffffc0204732:	ed98                	sd	a4,24(a1)
ffffffffc0204734:	e19c                	sd	a5,0(a1)
ffffffffc0204736:	c594                	sw	a3,8(a1)
ffffffffc0204738:	4685                	li	a3,1
ffffffffc020473a:	c394                	sw	a3,0(a5)
ffffffffc020473c:	0ec7a623          	sw	a2,236(a5)
ffffffffc0204740:	611c                	ld	a5,0(a0)
ffffffffc0204742:	e988                	sd	a0,16(a1)
ffffffffc0204744:	e118                	sd	a4,0(a0)
ffffffffc0204746:	e798                	sd	a4,8(a5)
ffffffffc0204748:	f188                	sd	a0,32(a1)
ffffffffc020474a:	ed9c                	sd	a5,24(a1)
ffffffffc020474c:	8082                	ret
ffffffffc020474e:	1141                	addi	sp,sp,-16
ffffffffc0204750:	00009697          	auipc	a3,0x9
ffffffffc0204754:	8b868693          	addi	a3,a3,-1864 # ffffffffc020d008 <default_pmm_manager+0xb78>
ffffffffc0204758:	00007617          	auipc	a2,0x7
ffffffffc020475c:	25060613          	addi	a2,a2,592 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204760:	07400593          	li	a1,116
ffffffffc0204764:	00009517          	auipc	a0,0x9
ffffffffc0204768:	84c50513          	addi	a0,a0,-1972 # ffffffffc020cfb0 <default_pmm_manager+0xb20>
ffffffffc020476c:	e406                	sd	ra,8(sp)
ffffffffc020476e:	d31fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204772 <get_fd_array.part.0>:
ffffffffc0204772:	1141                	addi	sp,sp,-16
ffffffffc0204774:	00009697          	auipc	a3,0x9
ffffffffc0204778:	8a468693          	addi	a3,a3,-1884 # ffffffffc020d018 <default_pmm_manager+0xb88>
ffffffffc020477c:	00007617          	auipc	a2,0x7
ffffffffc0204780:	22c60613          	addi	a2,a2,556 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204784:	45d1                	li	a1,20
ffffffffc0204786:	00009517          	auipc	a0,0x9
ffffffffc020478a:	8c250513          	addi	a0,a0,-1854 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc020478e:	e406                	sd	ra,8(sp)
ffffffffc0204790:	d0ffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204794 <fd_array_alloc>:
ffffffffc0204794:	00092797          	auipc	a5,0x92
ffffffffc0204798:	12c7b783          	ld	a5,300(a5) # ffffffffc02968c0 <current>
ffffffffc020479c:	1487b783          	ld	a5,328(a5)
ffffffffc02047a0:	1141                	addi	sp,sp,-16
ffffffffc02047a2:	e406                	sd	ra,8(sp)
ffffffffc02047a4:	c3a5                	beqz	a5,ffffffffc0204804 <fd_array_alloc+0x70>
ffffffffc02047a6:	4b98                	lw	a4,16(a5)
ffffffffc02047a8:	04e05e63          	blez	a4,ffffffffc0204804 <fd_array_alloc+0x70>
ffffffffc02047ac:	775d                	lui	a4,0xffff7
ffffffffc02047ae:	ad970713          	addi	a4,a4,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02047b2:	679c                	ld	a5,8(a5)
ffffffffc02047b4:	02e50863          	beq	a0,a4,ffffffffc02047e4 <fd_array_alloc+0x50>
ffffffffc02047b8:	04700713          	li	a4,71
ffffffffc02047bc:	04a76263          	bltu	a4,a0,ffffffffc0204800 <fd_array_alloc+0x6c>
ffffffffc02047c0:	00351713          	slli	a4,a0,0x3
ffffffffc02047c4:	40a70533          	sub	a0,a4,a0
ffffffffc02047c8:	050e                	slli	a0,a0,0x3
ffffffffc02047ca:	97aa                	add	a5,a5,a0
ffffffffc02047cc:	4398                	lw	a4,0(a5)
ffffffffc02047ce:	e71d                	bnez	a4,ffffffffc02047fc <fd_array_alloc+0x68>
ffffffffc02047d0:	5b88                	lw	a0,48(a5)
ffffffffc02047d2:	e91d                	bnez	a0,ffffffffc0204808 <fd_array_alloc+0x74>
ffffffffc02047d4:	4705                	li	a4,1
ffffffffc02047d6:	c398                	sw	a4,0(a5)
ffffffffc02047d8:	0207b423          	sd	zero,40(a5)
ffffffffc02047dc:	e19c                	sd	a5,0(a1)
ffffffffc02047de:	60a2                	ld	ra,8(sp)
ffffffffc02047e0:	0141                	addi	sp,sp,16
ffffffffc02047e2:	8082                	ret
ffffffffc02047e4:	6685                	lui	a3,0x1
ffffffffc02047e6:	fc068693          	addi	a3,a3,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02047ea:	96be                	add	a3,a3,a5
ffffffffc02047ec:	4398                	lw	a4,0(a5)
ffffffffc02047ee:	d36d                	beqz	a4,ffffffffc02047d0 <fd_array_alloc+0x3c>
ffffffffc02047f0:	03878793          	addi	a5,a5,56
ffffffffc02047f4:	fef69ce3          	bne	a3,a5,ffffffffc02047ec <fd_array_alloc+0x58>
ffffffffc02047f8:	5529                	li	a0,-22
ffffffffc02047fa:	b7d5                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc02047fc:	5545                	li	a0,-15
ffffffffc02047fe:	b7c5                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc0204800:	5575                	li	a0,-3
ffffffffc0204802:	bff1                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc0204804:	f6fff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204808:	00009697          	auipc	a3,0x9
ffffffffc020480c:	85068693          	addi	a3,a3,-1968 # ffffffffc020d058 <default_pmm_manager+0xbc8>
ffffffffc0204810:	00007617          	auipc	a2,0x7
ffffffffc0204814:	19860613          	addi	a2,a2,408 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204818:	03b00593          	li	a1,59
ffffffffc020481c:	00009517          	auipc	a0,0x9
ffffffffc0204820:	82c50513          	addi	a0,a0,-2004 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc0204824:	c7bfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204828 <fd_array_free>:
ffffffffc0204828:	411c                	lw	a5,0(a0)
ffffffffc020482a:	1141                	addi	sp,sp,-16
ffffffffc020482c:	e022                	sd	s0,0(sp)
ffffffffc020482e:	e406                	sd	ra,8(sp)
ffffffffc0204830:	4705                	li	a4,1
ffffffffc0204832:	842a                	mv	s0,a0
ffffffffc0204834:	04e78063          	beq	a5,a4,ffffffffc0204874 <fd_array_free+0x4c>
ffffffffc0204838:	470d                	li	a4,3
ffffffffc020483a:	04e79563          	bne	a5,a4,ffffffffc0204884 <fd_array_free+0x5c>
ffffffffc020483e:	591c                	lw	a5,48(a0)
ffffffffc0204840:	c38d                	beqz	a5,ffffffffc0204862 <fd_array_free+0x3a>
ffffffffc0204842:	00009697          	auipc	a3,0x9
ffffffffc0204846:	81668693          	addi	a3,a3,-2026 # ffffffffc020d058 <default_pmm_manager+0xbc8>
ffffffffc020484a:	00007617          	auipc	a2,0x7
ffffffffc020484e:	15e60613          	addi	a2,a2,350 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204852:	04500593          	li	a1,69
ffffffffc0204856:	00008517          	auipc	a0,0x8
ffffffffc020485a:	7f250513          	addi	a0,a0,2034 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc020485e:	c41fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204862:	7408                	ld	a0,40(s0)
ffffffffc0204864:	0ab030ef          	jal	ra,ffffffffc020810e <vfs_close>
ffffffffc0204868:	60a2                	ld	ra,8(sp)
ffffffffc020486a:	00042023          	sw	zero,0(s0)
ffffffffc020486e:	6402                	ld	s0,0(sp)
ffffffffc0204870:	0141                	addi	sp,sp,16
ffffffffc0204872:	8082                	ret
ffffffffc0204874:	591c                	lw	a5,48(a0)
ffffffffc0204876:	f7f1                	bnez	a5,ffffffffc0204842 <fd_array_free+0x1a>
ffffffffc0204878:	60a2                	ld	ra,8(sp)
ffffffffc020487a:	00042023          	sw	zero,0(s0)
ffffffffc020487e:	6402                	ld	s0,0(sp)
ffffffffc0204880:	0141                	addi	sp,sp,16
ffffffffc0204882:	8082                	ret
ffffffffc0204884:	00009697          	auipc	a3,0x9
ffffffffc0204888:	80c68693          	addi	a3,a3,-2036 # ffffffffc020d090 <default_pmm_manager+0xc00>
ffffffffc020488c:	00007617          	auipc	a2,0x7
ffffffffc0204890:	11c60613          	addi	a2,a2,284 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204894:	04400593          	li	a1,68
ffffffffc0204898:	00008517          	auipc	a0,0x8
ffffffffc020489c:	7b050513          	addi	a0,a0,1968 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc02048a0:	bfffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02048a4 <fd_array_release>:
ffffffffc02048a4:	4118                	lw	a4,0(a0)
ffffffffc02048a6:	1141                	addi	sp,sp,-16
ffffffffc02048a8:	e406                	sd	ra,8(sp)
ffffffffc02048aa:	4685                	li	a3,1
ffffffffc02048ac:	3779                	addiw	a4,a4,-2
ffffffffc02048ae:	04e6e063          	bltu	a3,a4,ffffffffc02048ee <fd_array_release+0x4a>
ffffffffc02048b2:	5918                	lw	a4,48(a0)
ffffffffc02048b4:	00e05d63          	blez	a4,ffffffffc02048ce <fd_array_release+0x2a>
ffffffffc02048b8:	fff7069b          	addiw	a3,a4,-1
ffffffffc02048bc:	d914                	sw	a3,48(a0)
ffffffffc02048be:	c681                	beqz	a3,ffffffffc02048c6 <fd_array_release+0x22>
ffffffffc02048c0:	60a2                	ld	ra,8(sp)
ffffffffc02048c2:	0141                	addi	sp,sp,16
ffffffffc02048c4:	8082                	ret
ffffffffc02048c6:	60a2                	ld	ra,8(sp)
ffffffffc02048c8:	0141                	addi	sp,sp,16
ffffffffc02048ca:	f5fff06f          	j	ffffffffc0204828 <fd_array_free>
ffffffffc02048ce:	00009697          	auipc	a3,0x9
ffffffffc02048d2:	83268693          	addi	a3,a3,-1998 # ffffffffc020d100 <default_pmm_manager+0xc70>
ffffffffc02048d6:	00007617          	auipc	a2,0x7
ffffffffc02048da:	0d260613          	addi	a2,a2,210 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02048de:	05600593          	li	a1,86
ffffffffc02048e2:	00008517          	auipc	a0,0x8
ffffffffc02048e6:	76650513          	addi	a0,a0,1894 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc02048ea:	bb5fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02048ee:	00008697          	auipc	a3,0x8
ffffffffc02048f2:	7da68693          	addi	a3,a3,2010 # ffffffffc020d0c8 <default_pmm_manager+0xc38>
ffffffffc02048f6:	00007617          	auipc	a2,0x7
ffffffffc02048fa:	0b260613          	addi	a2,a2,178 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02048fe:	05500593          	li	a1,85
ffffffffc0204902:	00008517          	auipc	a0,0x8
ffffffffc0204906:	74650513          	addi	a0,a0,1862 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc020490a:	b95fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020490e <fd_array_open.part.0>:
ffffffffc020490e:	1141                	addi	sp,sp,-16
ffffffffc0204910:	00009697          	auipc	a3,0x9
ffffffffc0204914:	80868693          	addi	a3,a3,-2040 # ffffffffc020d118 <default_pmm_manager+0xc88>
ffffffffc0204918:	00007617          	auipc	a2,0x7
ffffffffc020491c:	09060613          	addi	a2,a2,144 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204920:	05f00593          	li	a1,95
ffffffffc0204924:	00008517          	auipc	a0,0x8
ffffffffc0204928:	72450513          	addi	a0,a0,1828 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc020492c:	e406                	sd	ra,8(sp)
ffffffffc020492e:	b71fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204932 <fd_array_init>:
ffffffffc0204932:	4781                	li	a5,0
ffffffffc0204934:	04800713          	li	a4,72
ffffffffc0204938:	cd1c                	sw	a5,24(a0)
ffffffffc020493a:	02052823          	sw	zero,48(a0)
ffffffffc020493e:	00052023          	sw	zero,0(a0)
ffffffffc0204942:	2785                	addiw	a5,a5,1
ffffffffc0204944:	03850513          	addi	a0,a0,56
ffffffffc0204948:	fee798e3          	bne	a5,a4,ffffffffc0204938 <fd_array_init+0x6>
ffffffffc020494c:	8082                	ret

ffffffffc020494e <fd_array_close>:
ffffffffc020494e:	4118                	lw	a4,0(a0)
ffffffffc0204950:	1141                	addi	sp,sp,-16
ffffffffc0204952:	e406                	sd	ra,8(sp)
ffffffffc0204954:	e022                	sd	s0,0(sp)
ffffffffc0204956:	4789                	li	a5,2
ffffffffc0204958:	04f71a63          	bne	a4,a5,ffffffffc02049ac <fd_array_close+0x5e>
ffffffffc020495c:	591c                	lw	a5,48(a0)
ffffffffc020495e:	842a                	mv	s0,a0
ffffffffc0204960:	02f05663          	blez	a5,ffffffffc020498c <fd_array_close+0x3e>
ffffffffc0204964:	37fd                	addiw	a5,a5,-1
ffffffffc0204966:	470d                	li	a4,3
ffffffffc0204968:	c118                	sw	a4,0(a0)
ffffffffc020496a:	d91c                	sw	a5,48(a0)
ffffffffc020496c:	0007871b          	sext.w	a4,a5
ffffffffc0204970:	c709                	beqz	a4,ffffffffc020497a <fd_array_close+0x2c>
ffffffffc0204972:	60a2                	ld	ra,8(sp)
ffffffffc0204974:	6402                	ld	s0,0(sp)
ffffffffc0204976:	0141                	addi	sp,sp,16
ffffffffc0204978:	8082                	ret
ffffffffc020497a:	7508                	ld	a0,40(a0)
ffffffffc020497c:	792030ef          	jal	ra,ffffffffc020810e <vfs_close>
ffffffffc0204980:	60a2                	ld	ra,8(sp)
ffffffffc0204982:	00042023          	sw	zero,0(s0)
ffffffffc0204986:	6402                	ld	s0,0(sp)
ffffffffc0204988:	0141                	addi	sp,sp,16
ffffffffc020498a:	8082                	ret
ffffffffc020498c:	00008697          	auipc	a3,0x8
ffffffffc0204990:	77468693          	addi	a3,a3,1908 # ffffffffc020d100 <default_pmm_manager+0xc70>
ffffffffc0204994:	00007617          	auipc	a2,0x7
ffffffffc0204998:	01460613          	addi	a2,a2,20 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020499c:	06800593          	li	a1,104
ffffffffc02049a0:	00008517          	auipc	a0,0x8
ffffffffc02049a4:	6a850513          	addi	a0,a0,1704 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc02049a8:	af7fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02049ac:	00008697          	auipc	a3,0x8
ffffffffc02049b0:	6c468693          	addi	a3,a3,1732 # ffffffffc020d070 <default_pmm_manager+0xbe0>
ffffffffc02049b4:	00007617          	auipc	a2,0x7
ffffffffc02049b8:	ff460613          	addi	a2,a2,-12 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02049bc:	06700593          	li	a1,103
ffffffffc02049c0:	00008517          	auipc	a0,0x8
ffffffffc02049c4:	68850513          	addi	a0,a0,1672 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc02049c8:	ad7fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02049cc <fd_array_dup>:
ffffffffc02049cc:	7179                	addi	sp,sp,-48
ffffffffc02049ce:	e84a                	sd	s2,16(sp)
ffffffffc02049d0:	00052903          	lw	s2,0(a0)
ffffffffc02049d4:	f406                	sd	ra,40(sp)
ffffffffc02049d6:	f022                	sd	s0,32(sp)
ffffffffc02049d8:	ec26                	sd	s1,24(sp)
ffffffffc02049da:	e44e                	sd	s3,8(sp)
ffffffffc02049dc:	4785                	li	a5,1
ffffffffc02049de:	04f91663          	bne	s2,a5,ffffffffc0204a2a <fd_array_dup+0x5e>
ffffffffc02049e2:	0005a983          	lw	s3,0(a1)
ffffffffc02049e6:	4789                	li	a5,2
ffffffffc02049e8:	04f99163          	bne	s3,a5,ffffffffc0204a2a <fd_array_dup+0x5e>
ffffffffc02049ec:	7584                	ld	s1,40(a1)
ffffffffc02049ee:	699c                	ld	a5,16(a1)
ffffffffc02049f0:	7194                	ld	a3,32(a1)
ffffffffc02049f2:	6598                	ld	a4,8(a1)
ffffffffc02049f4:	842a                	mv	s0,a0
ffffffffc02049f6:	e91c                	sd	a5,16(a0)
ffffffffc02049f8:	f114                	sd	a3,32(a0)
ffffffffc02049fa:	e518                	sd	a4,8(a0)
ffffffffc02049fc:	8526                	mv	a0,s1
ffffffffc02049fe:	66f020ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc0204a02:	8526                	mv	a0,s1
ffffffffc0204a04:	675020ef          	jal	ra,ffffffffc0207878 <inode_open_inc>
ffffffffc0204a08:	401c                	lw	a5,0(s0)
ffffffffc0204a0a:	f404                	sd	s1,40(s0)
ffffffffc0204a0c:	03279f63          	bne	a5,s2,ffffffffc0204a4a <fd_array_dup+0x7e>
ffffffffc0204a10:	cc8d                	beqz	s1,ffffffffc0204a4a <fd_array_dup+0x7e>
ffffffffc0204a12:	581c                	lw	a5,48(s0)
ffffffffc0204a14:	01342023          	sw	s3,0(s0)
ffffffffc0204a18:	70a2                	ld	ra,40(sp)
ffffffffc0204a1a:	2785                	addiw	a5,a5,1
ffffffffc0204a1c:	d81c                	sw	a5,48(s0)
ffffffffc0204a1e:	7402                	ld	s0,32(sp)
ffffffffc0204a20:	64e2                	ld	s1,24(sp)
ffffffffc0204a22:	6942                	ld	s2,16(sp)
ffffffffc0204a24:	69a2                	ld	s3,8(sp)
ffffffffc0204a26:	6145                	addi	sp,sp,48
ffffffffc0204a28:	8082                	ret
ffffffffc0204a2a:	00008697          	auipc	a3,0x8
ffffffffc0204a2e:	71e68693          	addi	a3,a3,1822 # ffffffffc020d148 <default_pmm_manager+0xcb8>
ffffffffc0204a32:	00007617          	auipc	a2,0x7
ffffffffc0204a36:	f7660613          	addi	a2,a2,-138 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204a3a:	07300593          	li	a1,115
ffffffffc0204a3e:	00008517          	auipc	a0,0x8
ffffffffc0204a42:	60a50513          	addi	a0,a0,1546 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc0204a46:	a59fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204a4a:	ec5ff0ef          	jal	ra,ffffffffc020490e <fd_array_open.part.0>

ffffffffc0204a4e <file_testfd>:
ffffffffc0204a4e:	04700793          	li	a5,71
ffffffffc0204a52:	04a7e263          	bltu	a5,a0,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a56:	00092797          	auipc	a5,0x92
ffffffffc0204a5a:	e6a7b783          	ld	a5,-406(a5) # ffffffffc02968c0 <current>
ffffffffc0204a5e:	1487b783          	ld	a5,328(a5)
ffffffffc0204a62:	cf85                	beqz	a5,ffffffffc0204a9a <file_testfd+0x4c>
ffffffffc0204a64:	4b98                	lw	a4,16(a5)
ffffffffc0204a66:	02e05a63          	blez	a4,ffffffffc0204a9a <file_testfd+0x4c>
ffffffffc0204a6a:	6798                	ld	a4,8(a5)
ffffffffc0204a6c:	00351793          	slli	a5,a0,0x3
ffffffffc0204a70:	8f89                	sub	a5,a5,a0
ffffffffc0204a72:	078e                	slli	a5,a5,0x3
ffffffffc0204a74:	97ba                	add	a5,a5,a4
ffffffffc0204a76:	4394                	lw	a3,0(a5)
ffffffffc0204a78:	4709                	li	a4,2
ffffffffc0204a7a:	00e69e63          	bne	a3,a4,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a7e:	4f98                	lw	a4,24(a5)
ffffffffc0204a80:	00a71b63          	bne	a4,a0,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a84:	c199                	beqz	a1,ffffffffc0204a8a <file_testfd+0x3c>
ffffffffc0204a86:	6788                	ld	a0,8(a5)
ffffffffc0204a88:	c901                	beqz	a0,ffffffffc0204a98 <file_testfd+0x4a>
ffffffffc0204a8a:	4505                	li	a0,1
ffffffffc0204a8c:	c611                	beqz	a2,ffffffffc0204a98 <file_testfd+0x4a>
ffffffffc0204a8e:	6b88                	ld	a0,16(a5)
ffffffffc0204a90:	00a03533          	snez	a0,a0
ffffffffc0204a94:	8082                	ret
ffffffffc0204a96:	4501                	li	a0,0
ffffffffc0204a98:	8082                	ret
ffffffffc0204a9a:	1141                	addi	sp,sp,-16
ffffffffc0204a9c:	e406                	sd	ra,8(sp)
ffffffffc0204a9e:	cd5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204aa2 <file_open>:
ffffffffc0204aa2:	711d                	addi	sp,sp,-96
ffffffffc0204aa4:	ec86                	sd	ra,88(sp)
ffffffffc0204aa6:	e8a2                	sd	s0,80(sp)
ffffffffc0204aa8:	e4a6                	sd	s1,72(sp)
ffffffffc0204aaa:	e0ca                	sd	s2,64(sp)
ffffffffc0204aac:	fc4e                	sd	s3,56(sp)
ffffffffc0204aae:	f852                	sd	s4,48(sp)
ffffffffc0204ab0:	0035f793          	andi	a5,a1,3
ffffffffc0204ab4:	470d                	li	a4,3
ffffffffc0204ab6:	0ce78163          	beq	a5,a4,ffffffffc0204b78 <file_open+0xd6>
ffffffffc0204aba:	078e                	slli	a5,a5,0x3
ffffffffc0204abc:	00009717          	auipc	a4,0x9
ffffffffc0204ac0:	8fc70713          	addi	a4,a4,-1796 # ffffffffc020d3b8 <CSWTCH.79>
ffffffffc0204ac4:	892a                	mv	s2,a0
ffffffffc0204ac6:	00009697          	auipc	a3,0x9
ffffffffc0204aca:	8da68693          	addi	a3,a3,-1830 # ffffffffc020d3a0 <CSWTCH.78>
ffffffffc0204ace:	755d                	lui	a0,0xffff7
ffffffffc0204ad0:	96be                	add	a3,a3,a5
ffffffffc0204ad2:	84ae                	mv	s1,a1
ffffffffc0204ad4:	97ba                	add	a5,a5,a4
ffffffffc0204ad6:	858a                	mv	a1,sp
ffffffffc0204ad8:	ad950513          	addi	a0,a0,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204adc:	0006ba03          	ld	s4,0(a3)
ffffffffc0204ae0:	0007b983          	ld	s3,0(a5)
ffffffffc0204ae4:	cb1ff0ef          	jal	ra,ffffffffc0204794 <fd_array_alloc>
ffffffffc0204ae8:	842a                	mv	s0,a0
ffffffffc0204aea:	c911                	beqz	a0,ffffffffc0204afe <file_open+0x5c>
ffffffffc0204aec:	60e6                	ld	ra,88(sp)
ffffffffc0204aee:	8522                	mv	a0,s0
ffffffffc0204af0:	6446                	ld	s0,80(sp)
ffffffffc0204af2:	64a6                	ld	s1,72(sp)
ffffffffc0204af4:	6906                	ld	s2,64(sp)
ffffffffc0204af6:	79e2                	ld	s3,56(sp)
ffffffffc0204af8:	7a42                	ld	s4,48(sp)
ffffffffc0204afa:	6125                	addi	sp,sp,96
ffffffffc0204afc:	8082                	ret
ffffffffc0204afe:	0030                	addi	a2,sp,8
ffffffffc0204b00:	85a6                	mv	a1,s1
ffffffffc0204b02:	854a                	mv	a0,s2
ffffffffc0204b04:	464030ef          	jal	ra,ffffffffc0207f68 <vfs_open>
ffffffffc0204b08:	842a                	mv	s0,a0
ffffffffc0204b0a:	e13d                	bnez	a0,ffffffffc0204b70 <file_open+0xce>
ffffffffc0204b0c:	6782                	ld	a5,0(sp)
ffffffffc0204b0e:	0204f493          	andi	s1,s1,32
ffffffffc0204b12:	6422                	ld	s0,8(sp)
ffffffffc0204b14:	0207b023          	sd	zero,32(a5)
ffffffffc0204b18:	c885                	beqz	s1,ffffffffc0204b48 <file_open+0xa6>
ffffffffc0204b1a:	c03d                	beqz	s0,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b1c:	783c                	ld	a5,112(s0)
ffffffffc0204b1e:	c3ad                	beqz	a5,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b20:	779c                	ld	a5,40(a5)
ffffffffc0204b22:	cfb9                	beqz	a5,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b24:	8522                	mv	a0,s0
ffffffffc0204b26:	00008597          	auipc	a1,0x8
ffffffffc0204b2a:	6aa58593          	addi	a1,a1,1706 # ffffffffc020d1d0 <default_pmm_manager+0xd40>
ffffffffc0204b2e:	557020ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0204b32:	783c                	ld	a5,112(s0)
ffffffffc0204b34:	6522                	ld	a0,8(sp)
ffffffffc0204b36:	080c                	addi	a1,sp,16
ffffffffc0204b38:	779c                	ld	a5,40(a5)
ffffffffc0204b3a:	9782                	jalr	a5
ffffffffc0204b3c:	842a                	mv	s0,a0
ffffffffc0204b3e:	e515                	bnez	a0,ffffffffc0204b6a <file_open+0xc8>
ffffffffc0204b40:	6782                	ld	a5,0(sp)
ffffffffc0204b42:	7722                	ld	a4,40(sp)
ffffffffc0204b44:	6422                	ld	s0,8(sp)
ffffffffc0204b46:	f398                	sd	a4,32(a5)
ffffffffc0204b48:	4394                	lw	a3,0(a5)
ffffffffc0204b4a:	f780                	sd	s0,40(a5)
ffffffffc0204b4c:	0147b423          	sd	s4,8(a5)
ffffffffc0204b50:	0137b823          	sd	s3,16(a5)
ffffffffc0204b54:	4705                	li	a4,1
ffffffffc0204b56:	02e69363          	bne	a3,a4,ffffffffc0204b7c <file_open+0xda>
ffffffffc0204b5a:	c00d                	beqz	s0,ffffffffc0204b7c <file_open+0xda>
ffffffffc0204b5c:	5b98                	lw	a4,48(a5)
ffffffffc0204b5e:	4689                	li	a3,2
ffffffffc0204b60:	4f80                	lw	s0,24(a5)
ffffffffc0204b62:	2705                	addiw	a4,a4,1
ffffffffc0204b64:	c394                	sw	a3,0(a5)
ffffffffc0204b66:	db98                	sw	a4,48(a5)
ffffffffc0204b68:	b751                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b6a:	6522                	ld	a0,8(sp)
ffffffffc0204b6c:	5a2030ef          	jal	ra,ffffffffc020810e <vfs_close>
ffffffffc0204b70:	6502                	ld	a0,0(sp)
ffffffffc0204b72:	cb7ff0ef          	jal	ra,ffffffffc0204828 <fd_array_free>
ffffffffc0204b76:	bf9d                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b78:	5475                	li	s0,-3
ffffffffc0204b7a:	bf8d                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b7c:	d93ff0ef          	jal	ra,ffffffffc020490e <fd_array_open.part.0>
ffffffffc0204b80:	00008697          	auipc	a3,0x8
ffffffffc0204b84:	60068693          	addi	a3,a3,1536 # ffffffffc020d180 <default_pmm_manager+0xcf0>
ffffffffc0204b88:	00007617          	auipc	a2,0x7
ffffffffc0204b8c:	e2060613          	addi	a2,a2,-480 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204b90:	0b500593          	li	a1,181
ffffffffc0204b94:	00008517          	auipc	a0,0x8
ffffffffc0204b98:	4b450513          	addi	a0,a0,1204 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc0204b9c:	903fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204ba0 <file_close>:
ffffffffc0204ba0:	04700713          	li	a4,71
ffffffffc0204ba4:	04a76563          	bltu	a4,a0,ffffffffc0204bee <file_close+0x4e>
ffffffffc0204ba8:	00092717          	auipc	a4,0x92
ffffffffc0204bac:	d1873703          	ld	a4,-744(a4) # ffffffffc02968c0 <current>
ffffffffc0204bb0:	14873703          	ld	a4,328(a4)
ffffffffc0204bb4:	1141                	addi	sp,sp,-16
ffffffffc0204bb6:	e406                	sd	ra,8(sp)
ffffffffc0204bb8:	cf0d                	beqz	a4,ffffffffc0204bf2 <file_close+0x52>
ffffffffc0204bba:	4b14                	lw	a3,16(a4)
ffffffffc0204bbc:	02d05b63          	blez	a3,ffffffffc0204bf2 <file_close+0x52>
ffffffffc0204bc0:	6718                	ld	a4,8(a4)
ffffffffc0204bc2:	87aa                	mv	a5,a0
ffffffffc0204bc4:	050e                	slli	a0,a0,0x3
ffffffffc0204bc6:	8d1d                	sub	a0,a0,a5
ffffffffc0204bc8:	050e                	slli	a0,a0,0x3
ffffffffc0204bca:	953a                	add	a0,a0,a4
ffffffffc0204bcc:	4114                	lw	a3,0(a0)
ffffffffc0204bce:	4709                	li	a4,2
ffffffffc0204bd0:	00e69b63          	bne	a3,a4,ffffffffc0204be6 <file_close+0x46>
ffffffffc0204bd4:	4d18                	lw	a4,24(a0)
ffffffffc0204bd6:	00f71863          	bne	a4,a5,ffffffffc0204be6 <file_close+0x46>
ffffffffc0204bda:	d75ff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc0204bde:	60a2                	ld	ra,8(sp)
ffffffffc0204be0:	4501                	li	a0,0
ffffffffc0204be2:	0141                	addi	sp,sp,16
ffffffffc0204be4:	8082                	ret
ffffffffc0204be6:	60a2                	ld	ra,8(sp)
ffffffffc0204be8:	5575                	li	a0,-3
ffffffffc0204bea:	0141                	addi	sp,sp,16
ffffffffc0204bec:	8082                	ret
ffffffffc0204bee:	5575                	li	a0,-3
ffffffffc0204bf0:	8082                	ret
ffffffffc0204bf2:	b81ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204bf6 <file_read>:
ffffffffc0204bf6:	715d                	addi	sp,sp,-80
ffffffffc0204bf8:	e486                	sd	ra,72(sp)
ffffffffc0204bfa:	e0a2                	sd	s0,64(sp)
ffffffffc0204bfc:	fc26                	sd	s1,56(sp)
ffffffffc0204bfe:	f84a                	sd	s2,48(sp)
ffffffffc0204c00:	f44e                	sd	s3,40(sp)
ffffffffc0204c02:	f052                	sd	s4,32(sp)
ffffffffc0204c04:	0006b023          	sd	zero,0(a3)
ffffffffc0204c08:	04700793          	li	a5,71
ffffffffc0204c0c:	0aa7e463          	bltu	a5,a0,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c10:	00092797          	auipc	a5,0x92
ffffffffc0204c14:	cb07b783          	ld	a5,-848(a5) # ffffffffc02968c0 <current>
ffffffffc0204c18:	1487b783          	ld	a5,328(a5)
ffffffffc0204c1c:	cfd1                	beqz	a5,ffffffffc0204cb8 <file_read+0xc2>
ffffffffc0204c1e:	4b98                	lw	a4,16(a5)
ffffffffc0204c20:	08e05c63          	blez	a4,ffffffffc0204cb8 <file_read+0xc2>
ffffffffc0204c24:	6780                	ld	s0,8(a5)
ffffffffc0204c26:	00351793          	slli	a5,a0,0x3
ffffffffc0204c2a:	8f89                	sub	a5,a5,a0
ffffffffc0204c2c:	078e                	slli	a5,a5,0x3
ffffffffc0204c2e:	943e                	add	s0,s0,a5
ffffffffc0204c30:	00042983          	lw	s3,0(s0)
ffffffffc0204c34:	4789                	li	a5,2
ffffffffc0204c36:	06f99f63          	bne	s3,a5,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c3a:	4c1c                	lw	a5,24(s0)
ffffffffc0204c3c:	06a79c63          	bne	a5,a0,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c40:	641c                	ld	a5,8(s0)
ffffffffc0204c42:	cbad                	beqz	a5,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c44:	581c                	lw	a5,48(s0)
ffffffffc0204c46:	8a36                	mv	s4,a3
ffffffffc0204c48:	7014                	ld	a3,32(s0)
ffffffffc0204c4a:	2785                	addiw	a5,a5,1
ffffffffc0204c4c:	850a                	mv	a0,sp
ffffffffc0204c4e:	d81c                	sw	a5,48(s0)
ffffffffc0204c50:	792000ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc0204c54:	02843903          	ld	s2,40(s0)
ffffffffc0204c58:	84aa                	mv	s1,a0
ffffffffc0204c5a:	06090163          	beqz	s2,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c5e:	07093783          	ld	a5,112(s2)
ffffffffc0204c62:	cfa9                	beqz	a5,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c64:	6f9c                	ld	a5,24(a5)
ffffffffc0204c66:	cbb9                	beqz	a5,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c68:	00008597          	auipc	a1,0x8
ffffffffc0204c6c:	5c058593          	addi	a1,a1,1472 # ffffffffc020d228 <default_pmm_manager+0xd98>
ffffffffc0204c70:	854a                	mv	a0,s2
ffffffffc0204c72:	413020ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0204c76:	07093783          	ld	a5,112(s2)
ffffffffc0204c7a:	7408                	ld	a0,40(s0)
ffffffffc0204c7c:	85a6                	mv	a1,s1
ffffffffc0204c7e:	6f9c                	ld	a5,24(a5)
ffffffffc0204c80:	9782                	jalr	a5
ffffffffc0204c82:	689c                	ld	a5,16(s1)
ffffffffc0204c84:	6c94                	ld	a3,24(s1)
ffffffffc0204c86:	4018                	lw	a4,0(s0)
ffffffffc0204c88:	84aa                	mv	s1,a0
ffffffffc0204c8a:	8f95                	sub	a5,a5,a3
ffffffffc0204c8c:	03370063          	beq	a4,s3,ffffffffc0204cac <file_read+0xb6>
ffffffffc0204c90:	00fa3023          	sd	a5,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0204c94:	8522                	mv	a0,s0
ffffffffc0204c96:	c0fff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204c9a:	60a6                	ld	ra,72(sp)
ffffffffc0204c9c:	6406                	ld	s0,64(sp)
ffffffffc0204c9e:	7942                	ld	s2,48(sp)
ffffffffc0204ca0:	79a2                	ld	s3,40(sp)
ffffffffc0204ca2:	7a02                	ld	s4,32(sp)
ffffffffc0204ca4:	8526                	mv	a0,s1
ffffffffc0204ca6:	74e2                	ld	s1,56(sp)
ffffffffc0204ca8:	6161                	addi	sp,sp,80
ffffffffc0204caa:	8082                	ret
ffffffffc0204cac:	7018                	ld	a4,32(s0)
ffffffffc0204cae:	973e                	add	a4,a4,a5
ffffffffc0204cb0:	f018                	sd	a4,32(s0)
ffffffffc0204cb2:	bff9                	j	ffffffffc0204c90 <file_read+0x9a>
ffffffffc0204cb4:	54f5                	li	s1,-3
ffffffffc0204cb6:	b7d5                	j	ffffffffc0204c9a <file_read+0xa4>
ffffffffc0204cb8:	abbff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204cbc:	00008697          	auipc	a3,0x8
ffffffffc0204cc0:	51c68693          	addi	a3,a3,1308 # ffffffffc020d1d8 <default_pmm_manager+0xd48>
ffffffffc0204cc4:	00007617          	auipc	a2,0x7
ffffffffc0204cc8:	ce460613          	addi	a2,a2,-796 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204ccc:	0de00593          	li	a1,222
ffffffffc0204cd0:	00008517          	auipc	a0,0x8
ffffffffc0204cd4:	37850513          	addi	a0,a0,888 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc0204cd8:	fc6fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204cdc <file_write>:
ffffffffc0204cdc:	715d                	addi	sp,sp,-80
ffffffffc0204cde:	e486                	sd	ra,72(sp)
ffffffffc0204ce0:	e0a2                	sd	s0,64(sp)
ffffffffc0204ce2:	fc26                	sd	s1,56(sp)
ffffffffc0204ce4:	f84a                	sd	s2,48(sp)
ffffffffc0204ce6:	f44e                	sd	s3,40(sp)
ffffffffc0204ce8:	f052                	sd	s4,32(sp)
ffffffffc0204cea:	0006b023          	sd	zero,0(a3)
ffffffffc0204cee:	04700793          	li	a5,71
ffffffffc0204cf2:	0aa7e463          	bltu	a5,a0,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204cf6:	00092797          	auipc	a5,0x92
ffffffffc0204cfa:	bca7b783          	ld	a5,-1078(a5) # ffffffffc02968c0 <current>
ffffffffc0204cfe:	1487b783          	ld	a5,328(a5)
ffffffffc0204d02:	cfd1                	beqz	a5,ffffffffc0204d9e <file_write+0xc2>
ffffffffc0204d04:	4b98                	lw	a4,16(a5)
ffffffffc0204d06:	08e05c63          	blez	a4,ffffffffc0204d9e <file_write+0xc2>
ffffffffc0204d0a:	6780                	ld	s0,8(a5)
ffffffffc0204d0c:	00351793          	slli	a5,a0,0x3
ffffffffc0204d10:	8f89                	sub	a5,a5,a0
ffffffffc0204d12:	078e                	slli	a5,a5,0x3
ffffffffc0204d14:	943e                	add	s0,s0,a5
ffffffffc0204d16:	00042983          	lw	s3,0(s0)
ffffffffc0204d1a:	4789                	li	a5,2
ffffffffc0204d1c:	06f99f63          	bne	s3,a5,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d20:	4c1c                	lw	a5,24(s0)
ffffffffc0204d22:	06a79c63          	bne	a5,a0,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d26:	681c                	ld	a5,16(s0)
ffffffffc0204d28:	cbad                	beqz	a5,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d2a:	581c                	lw	a5,48(s0)
ffffffffc0204d2c:	8a36                	mv	s4,a3
ffffffffc0204d2e:	7014                	ld	a3,32(s0)
ffffffffc0204d30:	2785                	addiw	a5,a5,1
ffffffffc0204d32:	850a                	mv	a0,sp
ffffffffc0204d34:	d81c                	sw	a5,48(s0)
ffffffffc0204d36:	6ac000ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc0204d3a:	02843903          	ld	s2,40(s0)
ffffffffc0204d3e:	84aa                	mv	s1,a0
ffffffffc0204d40:	06090163          	beqz	s2,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d44:	07093783          	ld	a5,112(s2)
ffffffffc0204d48:	cfa9                	beqz	a5,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d4a:	739c                	ld	a5,32(a5)
ffffffffc0204d4c:	cbb9                	beqz	a5,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d4e:	00008597          	auipc	a1,0x8
ffffffffc0204d52:	53258593          	addi	a1,a1,1330 # ffffffffc020d280 <default_pmm_manager+0xdf0>
ffffffffc0204d56:	854a                	mv	a0,s2
ffffffffc0204d58:	32d020ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0204d5c:	07093783          	ld	a5,112(s2)
ffffffffc0204d60:	7408                	ld	a0,40(s0)
ffffffffc0204d62:	85a6                	mv	a1,s1
ffffffffc0204d64:	739c                	ld	a5,32(a5)
ffffffffc0204d66:	9782                	jalr	a5
ffffffffc0204d68:	689c                	ld	a5,16(s1)
ffffffffc0204d6a:	6c94                	ld	a3,24(s1)
ffffffffc0204d6c:	4018                	lw	a4,0(s0)
ffffffffc0204d6e:	84aa                	mv	s1,a0
ffffffffc0204d70:	8f95                	sub	a5,a5,a3
ffffffffc0204d72:	03370063          	beq	a4,s3,ffffffffc0204d92 <file_write+0xb6>
ffffffffc0204d76:	00fa3023          	sd	a5,0(s4)
ffffffffc0204d7a:	8522                	mv	a0,s0
ffffffffc0204d7c:	b29ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204d80:	60a6                	ld	ra,72(sp)
ffffffffc0204d82:	6406                	ld	s0,64(sp)
ffffffffc0204d84:	7942                	ld	s2,48(sp)
ffffffffc0204d86:	79a2                	ld	s3,40(sp)
ffffffffc0204d88:	7a02                	ld	s4,32(sp)
ffffffffc0204d8a:	8526                	mv	a0,s1
ffffffffc0204d8c:	74e2                	ld	s1,56(sp)
ffffffffc0204d8e:	6161                	addi	sp,sp,80
ffffffffc0204d90:	8082                	ret
ffffffffc0204d92:	7018                	ld	a4,32(s0)
ffffffffc0204d94:	973e                	add	a4,a4,a5
ffffffffc0204d96:	f018                	sd	a4,32(s0)
ffffffffc0204d98:	bff9                	j	ffffffffc0204d76 <file_write+0x9a>
ffffffffc0204d9a:	54f5                	li	s1,-3
ffffffffc0204d9c:	b7d5                	j	ffffffffc0204d80 <file_write+0xa4>
ffffffffc0204d9e:	9d5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204da2:	00008697          	auipc	a3,0x8
ffffffffc0204da6:	48e68693          	addi	a3,a3,1166 # ffffffffc020d230 <default_pmm_manager+0xda0>
ffffffffc0204daa:	00007617          	auipc	a2,0x7
ffffffffc0204dae:	bfe60613          	addi	a2,a2,-1026 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204db2:	0f800593          	li	a1,248
ffffffffc0204db6:	00008517          	auipc	a0,0x8
ffffffffc0204dba:	29250513          	addi	a0,a0,658 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc0204dbe:	ee0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204dc2 <file_seek>:
ffffffffc0204dc2:	7139                	addi	sp,sp,-64
ffffffffc0204dc4:	fc06                	sd	ra,56(sp)
ffffffffc0204dc6:	f822                	sd	s0,48(sp)
ffffffffc0204dc8:	f426                	sd	s1,40(sp)
ffffffffc0204dca:	f04a                	sd	s2,32(sp)
ffffffffc0204dcc:	04700793          	li	a5,71
ffffffffc0204dd0:	08a7e863          	bltu	a5,a0,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204dd4:	00092797          	auipc	a5,0x92
ffffffffc0204dd8:	aec7b783          	ld	a5,-1300(a5) # ffffffffc02968c0 <current>
ffffffffc0204ddc:	1487b783          	ld	a5,328(a5)
ffffffffc0204de0:	cfdd                	beqz	a5,ffffffffc0204e9e <file_seek+0xdc>
ffffffffc0204de2:	4b98                	lw	a4,16(a5)
ffffffffc0204de4:	0ae05d63          	blez	a4,ffffffffc0204e9e <file_seek+0xdc>
ffffffffc0204de8:	6780                	ld	s0,8(a5)
ffffffffc0204dea:	00351793          	slli	a5,a0,0x3
ffffffffc0204dee:	8f89                	sub	a5,a5,a0
ffffffffc0204df0:	078e                	slli	a5,a5,0x3
ffffffffc0204df2:	943e                	add	s0,s0,a5
ffffffffc0204df4:	4018                	lw	a4,0(s0)
ffffffffc0204df6:	4789                	li	a5,2
ffffffffc0204df8:	06f71463          	bne	a4,a5,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204dfc:	4c1c                	lw	a5,24(s0)
ffffffffc0204dfe:	06a79163          	bne	a5,a0,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204e02:	581c                	lw	a5,48(s0)
ffffffffc0204e04:	4685                	li	a3,1
ffffffffc0204e06:	892e                	mv	s2,a1
ffffffffc0204e08:	2785                	addiw	a5,a5,1
ffffffffc0204e0a:	d81c                	sw	a5,48(s0)
ffffffffc0204e0c:	02d60063          	beq	a2,a3,ffffffffc0204e2c <file_seek+0x6a>
ffffffffc0204e10:	06e60063          	beq	a2,a4,ffffffffc0204e70 <file_seek+0xae>
ffffffffc0204e14:	54f5                	li	s1,-3
ffffffffc0204e16:	ce11                	beqz	a2,ffffffffc0204e32 <file_seek+0x70>
ffffffffc0204e18:	8522                	mv	a0,s0
ffffffffc0204e1a:	a8bff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204e1e:	70e2                	ld	ra,56(sp)
ffffffffc0204e20:	7442                	ld	s0,48(sp)
ffffffffc0204e22:	7902                	ld	s2,32(sp)
ffffffffc0204e24:	8526                	mv	a0,s1
ffffffffc0204e26:	74a2                	ld	s1,40(sp)
ffffffffc0204e28:	6121                	addi	sp,sp,64
ffffffffc0204e2a:	8082                	ret
ffffffffc0204e2c:	701c                	ld	a5,32(s0)
ffffffffc0204e2e:	00f58933          	add	s2,a1,a5
ffffffffc0204e32:	7404                	ld	s1,40(s0)
ffffffffc0204e34:	c4bd                	beqz	s1,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e36:	78bc                	ld	a5,112(s1)
ffffffffc0204e38:	c7ad                	beqz	a5,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e3a:	6fbc                	ld	a5,88(a5)
ffffffffc0204e3c:	c3bd                	beqz	a5,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e3e:	8526                	mv	a0,s1
ffffffffc0204e40:	00008597          	auipc	a1,0x8
ffffffffc0204e44:	49858593          	addi	a1,a1,1176 # ffffffffc020d2d8 <default_pmm_manager+0xe48>
ffffffffc0204e48:	23d020ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0204e4c:	78bc                	ld	a5,112(s1)
ffffffffc0204e4e:	7408                	ld	a0,40(s0)
ffffffffc0204e50:	85ca                	mv	a1,s2
ffffffffc0204e52:	6fbc                	ld	a5,88(a5)
ffffffffc0204e54:	9782                	jalr	a5
ffffffffc0204e56:	84aa                	mv	s1,a0
ffffffffc0204e58:	f161                	bnez	a0,ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e5a:	03243023          	sd	s2,32(s0)
ffffffffc0204e5e:	bf6d                	j	ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e60:	70e2                	ld	ra,56(sp)
ffffffffc0204e62:	7442                	ld	s0,48(sp)
ffffffffc0204e64:	54f5                	li	s1,-3
ffffffffc0204e66:	7902                	ld	s2,32(sp)
ffffffffc0204e68:	8526                	mv	a0,s1
ffffffffc0204e6a:	74a2                	ld	s1,40(sp)
ffffffffc0204e6c:	6121                	addi	sp,sp,64
ffffffffc0204e6e:	8082                	ret
ffffffffc0204e70:	7404                	ld	s1,40(s0)
ffffffffc0204e72:	c8a1                	beqz	s1,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e74:	78bc                	ld	a5,112(s1)
ffffffffc0204e76:	c7b1                	beqz	a5,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e78:	779c                	ld	a5,40(a5)
ffffffffc0204e7a:	c7a1                	beqz	a5,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e7c:	8526                	mv	a0,s1
ffffffffc0204e7e:	00008597          	auipc	a1,0x8
ffffffffc0204e82:	35258593          	addi	a1,a1,850 # ffffffffc020d1d0 <default_pmm_manager+0xd40>
ffffffffc0204e86:	1ff020ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0204e8a:	78bc                	ld	a5,112(s1)
ffffffffc0204e8c:	7408                	ld	a0,40(s0)
ffffffffc0204e8e:	858a                	mv	a1,sp
ffffffffc0204e90:	779c                	ld	a5,40(a5)
ffffffffc0204e92:	9782                	jalr	a5
ffffffffc0204e94:	84aa                	mv	s1,a0
ffffffffc0204e96:	f149                	bnez	a0,ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e98:	67e2                	ld	a5,24(sp)
ffffffffc0204e9a:	993e                	add	s2,s2,a5
ffffffffc0204e9c:	bf59                	j	ffffffffc0204e32 <file_seek+0x70>
ffffffffc0204e9e:	8d5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204ea2:	00008697          	auipc	a3,0x8
ffffffffc0204ea6:	3e668693          	addi	a3,a3,998 # ffffffffc020d288 <default_pmm_manager+0xdf8>
ffffffffc0204eaa:	00007617          	auipc	a2,0x7
ffffffffc0204eae:	afe60613          	addi	a2,a2,-1282 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204eb2:	11a00593          	li	a1,282
ffffffffc0204eb6:	00008517          	auipc	a0,0x8
ffffffffc0204eba:	19250513          	addi	a0,a0,402 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc0204ebe:	de0fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204ec2:	00008697          	auipc	a3,0x8
ffffffffc0204ec6:	2be68693          	addi	a3,a3,702 # ffffffffc020d180 <default_pmm_manager+0xcf0>
ffffffffc0204eca:	00007617          	auipc	a2,0x7
ffffffffc0204ece:	ade60613          	addi	a2,a2,-1314 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204ed2:	11200593          	li	a1,274
ffffffffc0204ed6:	00008517          	auipc	a0,0x8
ffffffffc0204eda:	17250513          	addi	a0,a0,370 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc0204ede:	dc0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204ee2 <file_fstat>:
ffffffffc0204ee2:	1101                	addi	sp,sp,-32
ffffffffc0204ee4:	ec06                	sd	ra,24(sp)
ffffffffc0204ee6:	e822                	sd	s0,16(sp)
ffffffffc0204ee8:	e426                	sd	s1,8(sp)
ffffffffc0204eea:	e04a                	sd	s2,0(sp)
ffffffffc0204eec:	04700793          	li	a5,71
ffffffffc0204ef0:	06a7ef63          	bltu	a5,a0,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204ef4:	00092797          	auipc	a5,0x92
ffffffffc0204ef8:	9cc7b783          	ld	a5,-1588(a5) # ffffffffc02968c0 <current>
ffffffffc0204efc:	1487b783          	ld	a5,328(a5)
ffffffffc0204f00:	cfd9                	beqz	a5,ffffffffc0204f9e <file_fstat+0xbc>
ffffffffc0204f02:	4b98                	lw	a4,16(a5)
ffffffffc0204f04:	08e05d63          	blez	a4,ffffffffc0204f9e <file_fstat+0xbc>
ffffffffc0204f08:	6780                	ld	s0,8(a5)
ffffffffc0204f0a:	00351793          	slli	a5,a0,0x3
ffffffffc0204f0e:	8f89                	sub	a5,a5,a0
ffffffffc0204f10:	078e                	slli	a5,a5,0x3
ffffffffc0204f12:	943e                	add	s0,s0,a5
ffffffffc0204f14:	4018                	lw	a4,0(s0)
ffffffffc0204f16:	4789                	li	a5,2
ffffffffc0204f18:	04f71b63          	bne	a4,a5,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204f1c:	4c1c                	lw	a5,24(s0)
ffffffffc0204f1e:	04a79863          	bne	a5,a0,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204f22:	581c                	lw	a5,48(s0)
ffffffffc0204f24:	02843903          	ld	s2,40(s0)
ffffffffc0204f28:	2785                	addiw	a5,a5,1
ffffffffc0204f2a:	d81c                	sw	a5,48(s0)
ffffffffc0204f2c:	04090963          	beqz	s2,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f30:	07093783          	ld	a5,112(s2)
ffffffffc0204f34:	c7a9                	beqz	a5,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f36:	779c                	ld	a5,40(a5)
ffffffffc0204f38:	c3b9                	beqz	a5,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f3a:	84ae                	mv	s1,a1
ffffffffc0204f3c:	854a                	mv	a0,s2
ffffffffc0204f3e:	00008597          	auipc	a1,0x8
ffffffffc0204f42:	29258593          	addi	a1,a1,658 # ffffffffc020d1d0 <default_pmm_manager+0xd40>
ffffffffc0204f46:	13f020ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0204f4a:	07093783          	ld	a5,112(s2)
ffffffffc0204f4e:	7408                	ld	a0,40(s0)
ffffffffc0204f50:	85a6                	mv	a1,s1
ffffffffc0204f52:	779c                	ld	a5,40(a5)
ffffffffc0204f54:	9782                	jalr	a5
ffffffffc0204f56:	87aa                	mv	a5,a0
ffffffffc0204f58:	8522                	mv	a0,s0
ffffffffc0204f5a:	843e                	mv	s0,a5
ffffffffc0204f5c:	949ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204f60:	60e2                	ld	ra,24(sp)
ffffffffc0204f62:	8522                	mv	a0,s0
ffffffffc0204f64:	6442                	ld	s0,16(sp)
ffffffffc0204f66:	64a2                	ld	s1,8(sp)
ffffffffc0204f68:	6902                	ld	s2,0(sp)
ffffffffc0204f6a:	6105                	addi	sp,sp,32
ffffffffc0204f6c:	8082                	ret
ffffffffc0204f6e:	5475                	li	s0,-3
ffffffffc0204f70:	60e2                	ld	ra,24(sp)
ffffffffc0204f72:	8522                	mv	a0,s0
ffffffffc0204f74:	6442                	ld	s0,16(sp)
ffffffffc0204f76:	64a2                	ld	s1,8(sp)
ffffffffc0204f78:	6902                	ld	s2,0(sp)
ffffffffc0204f7a:	6105                	addi	sp,sp,32
ffffffffc0204f7c:	8082                	ret
ffffffffc0204f7e:	00008697          	auipc	a3,0x8
ffffffffc0204f82:	20268693          	addi	a3,a3,514 # ffffffffc020d180 <default_pmm_manager+0xcf0>
ffffffffc0204f86:	00007617          	auipc	a2,0x7
ffffffffc0204f8a:	a2260613          	addi	a2,a2,-1502 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0204f8e:	12c00593          	li	a1,300
ffffffffc0204f92:	00008517          	auipc	a0,0x8
ffffffffc0204f96:	0b650513          	addi	a0,a0,182 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc0204f9a:	d04fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204f9e:	fd4ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204fa2 <file_fsync>:
ffffffffc0204fa2:	1101                	addi	sp,sp,-32
ffffffffc0204fa4:	ec06                	sd	ra,24(sp)
ffffffffc0204fa6:	e822                	sd	s0,16(sp)
ffffffffc0204fa8:	e426                	sd	s1,8(sp)
ffffffffc0204faa:	04700793          	li	a5,71
ffffffffc0204fae:	06a7e863          	bltu	a5,a0,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fb2:	00092797          	auipc	a5,0x92
ffffffffc0204fb6:	90e7b783          	ld	a5,-1778(a5) # ffffffffc02968c0 <current>
ffffffffc0204fba:	1487b783          	ld	a5,328(a5)
ffffffffc0204fbe:	c7d9                	beqz	a5,ffffffffc020504c <file_fsync+0xaa>
ffffffffc0204fc0:	4b98                	lw	a4,16(a5)
ffffffffc0204fc2:	08e05563          	blez	a4,ffffffffc020504c <file_fsync+0xaa>
ffffffffc0204fc6:	6780                	ld	s0,8(a5)
ffffffffc0204fc8:	00351793          	slli	a5,a0,0x3
ffffffffc0204fcc:	8f89                	sub	a5,a5,a0
ffffffffc0204fce:	078e                	slli	a5,a5,0x3
ffffffffc0204fd0:	943e                	add	s0,s0,a5
ffffffffc0204fd2:	4018                	lw	a4,0(s0)
ffffffffc0204fd4:	4789                	li	a5,2
ffffffffc0204fd6:	04f71463          	bne	a4,a5,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fda:	4c1c                	lw	a5,24(s0)
ffffffffc0204fdc:	04a79163          	bne	a5,a0,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fe0:	581c                	lw	a5,48(s0)
ffffffffc0204fe2:	7404                	ld	s1,40(s0)
ffffffffc0204fe4:	2785                	addiw	a5,a5,1
ffffffffc0204fe6:	d81c                	sw	a5,48(s0)
ffffffffc0204fe8:	c0b1                	beqz	s1,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204fea:	78bc                	ld	a5,112(s1)
ffffffffc0204fec:	c3a1                	beqz	a5,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204fee:	7b9c                	ld	a5,48(a5)
ffffffffc0204ff0:	cf95                	beqz	a5,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204ff2:	00008597          	auipc	a1,0x8
ffffffffc0204ff6:	33e58593          	addi	a1,a1,830 # ffffffffc020d330 <default_pmm_manager+0xea0>
ffffffffc0204ffa:	8526                	mv	a0,s1
ffffffffc0204ffc:	089020ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0205000:	78bc                	ld	a5,112(s1)
ffffffffc0205002:	7408                	ld	a0,40(s0)
ffffffffc0205004:	7b9c                	ld	a5,48(a5)
ffffffffc0205006:	9782                	jalr	a5
ffffffffc0205008:	87aa                	mv	a5,a0
ffffffffc020500a:	8522                	mv	a0,s0
ffffffffc020500c:	843e                	mv	s0,a5
ffffffffc020500e:	897ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0205012:	60e2                	ld	ra,24(sp)
ffffffffc0205014:	8522                	mv	a0,s0
ffffffffc0205016:	6442                	ld	s0,16(sp)
ffffffffc0205018:	64a2                	ld	s1,8(sp)
ffffffffc020501a:	6105                	addi	sp,sp,32
ffffffffc020501c:	8082                	ret
ffffffffc020501e:	5475                	li	s0,-3
ffffffffc0205020:	60e2                	ld	ra,24(sp)
ffffffffc0205022:	8522                	mv	a0,s0
ffffffffc0205024:	6442                	ld	s0,16(sp)
ffffffffc0205026:	64a2                	ld	s1,8(sp)
ffffffffc0205028:	6105                	addi	sp,sp,32
ffffffffc020502a:	8082                	ret
ffffffffc020502c:	00008697          	auipc	a3,0x8
ffffffffc0205030:	2b468693          	addi	a3,a3,692 # ffffffffc020d2e0 <default_pmm_manager+0xe50>
ffffffffc0205034:	00007617          	auipc	a2,0x7
ffffffffc0205038:	97460613          	addi	a2,a2,-1676 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020503c:	13a00593          	li	a1,314
ffffffffc0205040:	00008517          	auipc	a0,0x8
ffffffffc0205044:	00850513          	addi	a0,a0,8 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc0205048:	c56fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020504c:	f26ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0205050 <file_getdirentry>:
ffffffffc0205050:	715d                	addi	sp,sp,-80
ffffffffc0205052:	e486                	sd	ra,72(sp)
ffffffffc0205054:	e0a2                	sd	s0,64(sp)
ffffffffc0205056:	fc26                	sd	s1,56(sp)
ffffffffc0205058:	f84a                	sd	s2,48(sp)
ffffffffc020505a:	f44e                	sd	s3,40(sp)
ffffffffc020505c:	04700793          	li	a5,71
ffffffffc0205060:	0aa7e063          	bltu	a5,a0,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc0205064:	00092797          	auipc	a5,0x92
ffffffffc0205068:	85c7b783          	ld	a5,-1956(a5) # ffffffffc02968c0 <current>
ffffffffc020506c:	1487b783          	ld	a5,328(a5)
ffffffffc0205070:	c3e9                	beqz	a5,ffffffffc0205132 <file_getdirentry+0xe2>
ffffffffc0205072:	4b98                	lw	a4,16(a5)
ffffffffc0205074:	0ae05f63          	blez	a4,ffffffffc0205132 <file_getdirentry+0xe2>
ffffffffc0205078:	6780                	ld	s0,8(a5)
ffffffffc020507a:	00351793          	slli	a5,a0,0x3
ffffffffc020507e:	8f89                	sub	a5,a5,a0
ffffffffc0205080:	078e                	slli	a5,a5,0x3
ffffffffc0205082:	943e                	add	s0,s0,a5
ffffffffc0205084:	4018                	lw	a4,0(s0)
ffffffffc0205086:	4789                	li	a5,2
ffffffffc0205088:	06f71c63          	bne	a4,a5,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc020508c:	4c1c                	lw	a5,24(s0)
ffffffffc020508e:	06a79963          	bne	a5,a0,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc0205092:	581c                	lw	a5,48(s0)
ffffffffc0205094:	6194                	ld	a3,0(a1)
ffffffffc0205096:	84ae                	mv	s1,a1
ffffffffc0205098:	2785                	addiw	a5,a5,1
ffffffffc020509a:	10000613          	li	a2,256
ffffffffc020509e:	d81c                	sw	a5,48(s0)
ffffffffc02050a0:	05a1                	addi	a1,a1,8
ffffffffc02050a2:	850a                	mv	a0,sp
ffffffffc02050a4:	33e000ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02050a8:	02843983          	ld	s3,40(s0)
ffffffffc02050ac:	892a                	mv	s2,a0
ffffffffc02050ae:	06098263          	beqz	s3,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050b2:	0709b783          	ld	a5,112(s3) # 1070 <_binary_bin_swap_img_size-0x6c90>
ffffffffc02050b6:	cfb1                	beqz	a5,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050b8:	63bc                	ld	a5,64(a5)
ffffffffc02050ba:	cfa1                	beqz	a5,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050bc:	854e                	mv	a0,s3
ffffffffc02050be:	00008597          	auipc	a1,0x8
ffffffffc02050c2:	2d258593          	addi	a1,a1,722 # ffffffffc020d390 <default_pmm_manager+0xf00>
ffffffffc02050c6:	7be020ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc02050ca:	0709b783          	ld	a5,112(s3)
ffffffffc02050ce:	7408                	ld	a0,40(s0)
ffffffffc02050d0:	85ca                	mv	a1,s2
ffffffffc02050d2:	63bc                	ld	a5,64(a5)
ffffffffc02050d4:	9782                	jalr	a5
ffffffffc02050d6:	89aa                	mv	s3,a0
ffffffffc02050d8:	e909                	bnez	a0,ffffffffc02050ea <file_getdirentry+0x9a>
ffffffffc02050da:	609c                	ld	a5,0(s1)
ffffffffc02050dc:	01093683          	ld	a3,16(s2)
ffffffffc02050e0:	01893703          	ld	a4,24(s2)
ffffffffc02050e4:	97b6                	add	a5,a5,a3
ffffffffc02050e6:	8f99                	sub	a5,a5,a4
ffffffffc02050e8:	e09c                	sd	a5,0(s1)
ffffffffc02050ea:	8522                	mv	a0,s0
ffffffffc02050ec:	fb8ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc02050f0:	60a6                	ld	ra,72(sp)
ffffffffc02050f2:	6406                	ld	s0,64(sp)
ffffffffc02050f4:	74e2                	ld	s1,56(sp)
ffffffffc02050f6:	7942                	ld	s2,48(sp)
ffffffffc02050f8:	854e                	mv	a0,s3
ffffffffc02050fa:	79a2                	ld	s3,40(sp)
ffffffffc02050fc:	6161                	addi	sp,sp,80
ffffffffc02050fe:	8082                	ret
ffffffffc0205100:	60a6                	ld	ra,72(sp)
ffffffffc0205102:	6406                	ld	s0,64(sp)
ffffffffc0205104:	59f5                	li	s3,-3
ffffffffc0205106:	74e2                	ld	s1,56(sp)
ffffffffc0205108:	7942                	ld	s2,48(sp)
ffffffffc020510a:	854e                	mv	a0,s3
ffffffffc020510c:	79a2                	ld	s3,40(sp)
ffffffffc020510e:	6161                	addi	sp,sp,80
ffffffffc0205110:	8082                	ret
ffffffffc0205112:	00008697          	auipc	a3,0x8
ffffffffc0205116:	22668693          	addi	a3,a3,550 # ffffffffc020d338 <default_pmm_manager+0xea8>
ffffffffc020511a:	00007617          	auipc	a2,0x7
ffffffffc020511e:	88e60613          	addi	a2,a2,-1906 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0205122:	14a00593          	li	a1,330
ffffffffc0205126:	00008517          	auipc	a0,0x8
ffffffffc020512a:	f2250513          	addi	a0,a0,-222 # ffffffffc020d048 <default_pmm_manager+0xbb8>
ffffffffc020512e:	b70fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205132:	e40ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0205136 <file_dup>:
ffffffffc0205136:	04700713          	li	a4,71
ffffffffc020513a:	06a76463          	bltu	a4,a0,ffffffffc02051a2 <file_dup+0x6c>
ffffffffc020513e:	00091717          	auipc	a4,0x91
ffffffffc0205142:	78273703          	ld	a4,1922(a4) # ffffffffc02968c0 <current>
ffffffffc0205146:	14873703          	ld	a4,328(a4)
ffffffffc020514a:	1101                	addi	sp,sp,-32
ffffffffc020514c:	ec06                	sd	ra,24(sp)
ffffffffc020514e:	e822                	sd	s0,16(sp)
ffffffffc0205150:	cb39                	beqz	a4,ffffffffc02051a6 <file_dup+0x70>
ffffffffc0205152:	4b14                	lw	a3,16(a4)
ffffffffc0205154:	04d05963          	blez	a3,ffffffffc02051a6 <file_dup+0x70>
ffffffffc0205158:	6700                	ld	s0,8(a4)
ffffffffc020515a:	00351713          	slli	a4,a0,0x3
ffffffffc020515e:	8f09                	sub	a4,a4,a0
ffffffffc0205160:	070e                	slli	a4,a4,0x3
ffffffffc0205162:	943a                	add	s0,s0,a4
ffffffffc0205164:	4014                	lw	a3,0(s0)
ffffffffc0205166:	4709                	li	a4,2
ffffffffc0205168:	02e69863          	bne	a3,a4,ffffffffc0205198 <file_dup+0x62>
ffffffffc020516c:	4c18                	lw	a4,24(s0)
ffffffffc020516e:	02a71563          	bne	a4,a0,ffffffffc0205198 <file_dup+0x62>
ffffffffc0205172:	852e                	mv	a0,a1
ffffffffc0205174:	002c                	addi	a1,sp,8
ffffffffc0205176:	e1eff0ef          	jal	ra,ffffffffc0204794 <fd_array_alloc>
ffffffffc020517a:	c509                	beqz	a0,ffffffffc0205184 <file_dup+0x4e>
ffffffffc020517c:	60e2                	ld	ra,24(sp)
ffffffffc020517e:	6442                	ld	s0,16(sp)
ffffffffc0205180:	6105                	addi	sp,sp,32
ffffffffc0205182:	8082                	ret
ffffffffc0205184:	6522                	ld	a0,8(sp)
ffffffffc0205186:	85a2                	mv	a1,s0
ffffffffc0205188:	845ff0ef          	jal	ra,ffffffffc02049cc <fd_array_dup>
ffffffffc020518c:	67a2                	ld	a5,8(sp)
ffffffffc020518e:	60e2                	ld	ra,24(sp)
ffffffffc0205190:	6442                	ld	s0,16(sp)
ffffffffc0205192:	4f88                	lw	a0,24(a5)
ffffffffc0205194:	6105                	addi	sp,sp,32
ffffffffc0205196:	8082                	ret
ffffffffc0205198:	60e2                	ld	ra,24(sp)
ffffffffc020519a:	6442                	ld	s0,16(sp)
ffffffffc020519c:	5575                	li	a0,-3
ffffffffc020519e:	6105                	addi	sp,sp,32
ffffffffc02051a0:	8082                	ret
ffffffffc02051a2:	5575                	li	a0,-3
ffffffffc02051a4:	8082                	ret
ffffffffc02051a6:	dccff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc02051aa <fs_init>:
ffffffffc02051aa:	1141                	addi	sp,sp,-16
ffffffffc02051ac:	e406                	sd	ra,8(sp)
ffffffffc02051ae:	0f5020ef          	jal	ra,ffffffffc0207aa2 <vfs_init>
ffffffffc02051b2:	5cc030ef          	jal	ra,ffffffffc020877e <dev_init>
ffffffffc02051b6:	60a2                	ld	ra,8(sp)
ffffffffc02051b8:	0141                	addi	sp,sp,16
ffffffffc02051ba:	71d0306f          	j	ffffffffc02090d6 <sfs_init>

ffffffffc02051be <fs_cleanup>:
ffffffffc02051be:	3370206f          	j	ffffffffc0207cf4 <vfs_cleanup>

ffffffffc02051c2 <lock_files>:
ffffffffc02051c2:	0561                	addi	a0,a0,24
ffffffffc02051c4:	ba0ff06f          	j	ffffffffc0204564 <down>

ffffffffc02051c8 <unlock_files>:
ffffffffc02051c8:	0561                	addi	a0,a0,24
ffffffffc02051ca:	b96ff06f          	j	ffffffffc0204560 <up>

ffffffffc02051ce <files_create>:
ffffffffc02051ce:	1141                	addi	sp,sp,-16
ffffffffc02051d0:	6505                	lui	a0,0x1
ffffffffc02051d2:	e022                	sd	s0,0(sp)
ffffffffc02051d4:	e406                	sd	ra,8(sp)
ffffffffc02051d6:	db9fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02051da:	842a                	mv	s0,a0
ffffffffc02051dc:	cd19                	beqz	a0,ffffffffc02051fa <files_create+0x2c>
ffffffffc02051de:	03050793          	addi	a5,a0,48 # 1030 <_binary_bin_swap_img_size-0x6cd0>
ffffffffc02051e2:	00043023          	sd	zero,0(s0)
ffffffffc02051e6:	0561                	addi	a0,a0,24
ffffffffc02051e8:	e41c                	sd	a5,8(s0)
ffffffffc02051ea:	00042823          	sw	zero,16(s0)
ffffffffc02051ee:	4585                	li	a1,1
ffffffffc02051f0:	b6aff0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc02051f4:	6408                	ld	a0,8(s0)
ffffffffc02051f6:	f3cff0ef          	jal	ra,ffffffffc0204932 <fd_array_init>
ffffffffc02051fa:	60a2                	ld	ra,8(sp)
ffffffffc02051fc:	8522                	mv	a0,s0
ffffffffc02051fe:	6402                	ld	s0,0(sp)
ffffffffc0205200:	0141                	addi	sp,sp,16
ffffffffc0205202:	8082                	ret

ffffffffc0205204 <files_destroy>:
ffffffffc0205204:	7179                	addi	sp,sp,-48
ffffffffc0205206:	f406                	sd	ra,40(sp)
ffffffffc0205208:	f022                	sd	s0,32(sp)
ffffffffc020520a:	ec26                	sd	s1,24(sp)
ffffffffc020520c:	e84a                	sd	s2,16(sp)
ffffffffc020520e:	e44e                	sd	s3,8(sp)
ffffffffc0205210:	c52d                	beqz	a0,ffffffffc020527a <files_destroy+0x76>
ffffffffc0205212:	491c                	lw	a5,16(a0)
ffffffffc0205214:	89aa                	mv	s3,a0
ffffffffc0205216:	e3b5                	bnez	a5,ffffffffc020527a <files_destroy+0x76>
ffffffffc0205218:	6108                	ld	a0,0(a0)
ffffffffc020521a:	c119                	beqz	a0,ffffffffc0205220 <files_destroy+0x1c>
ffffffffc020521c:	71e020ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc0205220:	0089b403          	ld	s0,8(s3)
ffffffffc0205224:	6485                	lui	s1,0x1
ffffffffc0205226:	fc048493          	addi	s1,s1,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc020522a:	94a2                	add	s1,s1,s0
ffffffffc020522c:	4909                	li	s2,2
ffffffffc020522e:	401c                	lw	a5,0(s0)
ffffffffc0205230:	03278063          	beq	a5,s2,ffffffffc0205250 <files_destroy+0x4c>
ffffffffc0205234:	e39d                	bnez	a5,ffffffffc020525a <files_destroy+0x56>
ffffffffc0205236:	03840413          	addi	s0,s0,56
ffffffffc020523a:	fe849ae3          	bne	s1,s0,ffffffffc020522e <files_destroy+0x2a>
ffffffffc020523e:	7402                	ld	s0,32(sp)
ffffffffc0205240:	70a2                	ld	ra,40(sp)
ffffffffc0205242:	64e2                	ld	s1,24(sp)
ffffffffc0205244:	6942                	ld	s2,16(sp)
ffffffffc0205246:	854e                	mv	a0,s3
ffffffffc0205248:	69a2                	ld	s3,8(sp)
ffffffffc020524a:	6145                	addi	sp,sp,48
ffffffffc020524c:	df3fc06f          	j	ffffffffc020203e <kfree>
ffffffffc0205250:	8522                	mv	a0,s0
ffffffffc0205252:	efcff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc0205256:	401c                	lw	a5,0(s0)
ffffffffc0205258:	bff1                	j	ffffffffc0205234 <files_destroy+0x30>
ffffffffc020525a:	00008697          	auipc	a3,0x8
ffffffffc020525e:	1b668693          	addi	a3,a3,438 # ffffffffc020d410 <CSWTCH.79+0x58>
ffffffffc0205262:	00006617          	auipc	a2,0x6
ffffffffc0205266:	74660613          	addi	a2,a2,1862 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020526a:	03d00593          	li	a1,61
ffffffffc020526e:	00008517          	auipc	a0,0x8
ffffffffc0205272:	19250513          	addi	a0,a0,402 # ffffffffc020d400 <CSWTCH.79+0x48>
ffffffffc0205276:	a28fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020527a:	00008697          	auipc	a3,0x8
ffffffffc020527e:	15668693          	addi	a3,a3,342 # ffffffffc020d3d0 <CSWTCH.79+0x18>
ffffffffc0205282:	00006617          	auipc	a2,0x6
ffffffffc0205286:	72660613          	addi	a2,a2,1830 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020528a:	03300593          	li	a1,51
ffffffffc020528e:	00008517          	auipc	a0,0x8
ffffffffc0205292:	17250513          	addi	a0,a0,370 # ffffffffc020d400 <CSWTCH.79+0x48>
ffffffffc0205296:	a08fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020529a <files_closeall>:
ffffffffc020529a:	1101                	addi	sp,sp,-32
ffffffffc020529c:	ec06                	sd	ra,24(sp)
ffffffffc020529e:	e822                	sd	s0,16(sp)
ffffffffc02052a0:	e426                	sd	s1,8(sp)
ffffffffc02052a2:	e04a                	sd	s2,0(sp)
ffffffffc02052a4:	c129                	beqz	a0,ffffffffc02052e6 <files_closeall+0x4c>
ffffffffc02052a6:	491c                	lw	a5,16(a0)
ffffffffc02052a8:	02f05f63          	blez	a5,ffffffffc02052e6 <files_closeall+0x4c>
ffffffffc02052ac:	6504                	ld	s1,8(a0)
ffffffffc02052ae:	6785                	lui	a5,0x1
ffffffffc02052b0:	fc078793          	addi	a5,a5,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02052b4:	07048413          	addi	s0,s1,112
ffffffffc02052b8:	4909                	li	s2,2
ffffffffc02052ba:	94be                	add	s1,s1,a5
ffffffffc02052bc:	a029                	j	ffffffffc02052c6 <files_closeall+0x2c>
ffffffffc02052be:	03840413          	addi	s0,s0,56
ffffffffc02052c2:	00848c63          	beq	s1,s0,ffffffffc02052da <files_closeall+0x40>
ffffffffc02052c6:	401c                	lw	a5,0(s0)
ffffffffc02052c8:	ff279be3          	bne	a5,s2,ffffffffc02052be <files_closeall+0x24>
ffffffffc02052cc:	8522                	mv	a0,s0
ffffffffc02052ce:	03840413          	addi	s0,s0,56
ffffffffc02052d2:	e7cff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc02052d6:	fe8498e3          	bne	s1,s0,ffffffffc02052c6 <files_closeall+0x2c>
ffffffffc02052da:	60e2                	ld	ra,24(sp)
ffffffffc02052dc:	6442                	ld	s0,16(sp)
ffffffffc02052de:	64a2                	ld	s1,8(sp)
ffffffffc02052e0:	6902                	ld	s2,0(sp)
ffffffffc02052e2:	6105                	addi	sp,sp,32
ffffffffc02052e4:	8082                	ret
ffffffffc02052e6:	00008697          	auipc	a3,0x8
ffffffffc02052ea:	d3268693          	addi	a3,a3,-718 # ffffffffc020d018 <default_pmm_manager+0xb88>
ffffffffc02052ee:	00006617          	auipc	a2,0x6
ffffffffc02052f2:	6ba60613          	addi	a2,a2,1722 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02052f6:	04500593          	li	a1,69
ffffffffc02052fa:	00008517          	auipc	a0,0x8
ffffffffc02052fe:	10650513          	addi	a0,a0,262 # ffffffffc020d400 <CSWTCH.79+0x48>
ffffffffc0205302:	99cfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205306 <dup_files>:
ffffffffc0205306:	7179                	addi	sp,sp,-48
ffffffffc0205308:	f406                	sd	ra,40(sp)
ffffffffc020530a:	f022                	sd	s0,32(sp)
ffffffffc020530c:	ec26                	sd	s1,24(sp)
ffffffffc020530e:	e84a                	sd	s2,16(sp)
ffffffffc0205310:	e44e                	sd	s3,8(sp)
ffffffffc0205312:	e052                	sd	s4,0(sp)
ffffffffc0205314:	c52d                	beqz	a0,ffffffffc020537e <dup_files+0x78>
ffffffffc0205316:	842e                	mv	s0,a1
ffffffffc0205318:	c1bd                	beqz	a1,ffffffffc020537e <dup_files+0x78>
ffffffffc020531a:	491c                	lw	a5,16(a0)
ffffffffc020531c:	84aa                	mv	s1,a0
ffffffffc020531e:	e3c1                	bnez	a5,ffffffffc020539e <dup_files+0x98>
ffffffffc0205320:	499c                	lw	a5,16(a1)
ffffffffc0205322:	06f05e63          	blez	a5,ffffffffc020539e <dup_files+0x98>
ffffffffc0205326:	6188                	ld	a0,0(a1)
ffffffffc0205328:	e088                	sd	a0,0(s1)
ffffffffc020532a:	c119                	beqz	a0,ffffffffc0205330 <dup_files+0x2a>
ffffffffc020532c:	540020ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc0205330:	6400                	ld	s0,8(s0)
ffffffffc0205332:	6905                	lui	s2,0x1
ffffffffc0205334:	fc090913          	addi	s2,s2,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205338:	6484                	ld	s1,8(s1)
ffffffffc020533a:	9922                	add	s2,s2,s0
ffffffffc020533c:	4989                	li	s3,2
ffffffffc020533e:	4a05                	li	s4,1
ffffffffc0205340:	a039                	j	ffffffffc020534e <dup_files+0x48>
ffffffffc0205342:	03840413          	addi	s0,s0,56
ffffffffc0205346:	03848493          	addi	s1,s1,56
ffffffffc020534a:	02890163          	beq	s2,s0,ffffffffc020536c <dup_files+0x66>
ffffffffc020534e:	401c                	lw	a5,0(s0)
ffffffffc0205350:	ff3799e3          	bne	a5,s3,ffffffffc0205342 <dup_files+0x3c>
ffffffffc0205354:	0144a023          	sw	s4,0(s1)
ffffffffc0205358:	85a2                	mv	a1,s0
ffffffffc020535a:	8526                	mv	a0,s1
ffffffffc020535c:	03840413          	addi	s0,s0,56
ffffffffc0205360:	e6cff0ef          	jal	ra,ffffffffc02049cc <fd_array_dup>
ffffffffc0205364:	03848493          	addi	s1,s1,56
ffffffffc0205368:	fe8913e3          	bne	s2,s0,ffffffffc020534e <dup_files+0x48>
ffffffffc020536c:	70a2                	ld	ra,40(sp)
ffffffffc020536e:	7402                	ld	s0,32(sp)
ffffffffc0205370:	64e2                	ld	s1,24(sp)
ffffffffc0205372:	6942                	ld	s2,16(sp)
ffffffffc0205374:	69a2                	ld	s3,8(sp)
ffffffffc0205376:	6a02                	ld	s4,0(sp)
ffffffffc0205378:	4501                	li	a0,0
ffffffffc020537a:	6145                	addi	sp,sp,48
ffffffffc020537c:	8082                	ret
ffffffffc020537e:	00008697          	auipc	a3,0x8
ffffffffc0205382:	9ea68693          	addi	a3,a3,-1558 # ffffffffc020cd68 <default_pmm_manager+0x8d8>
ffffffffc0205386:	00006617          	auipc	a2,0x6
ffffffffc020538a:	62260613          	addi	a2,a2,1570 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020538e:	05300593          	li	a1,83
ffffffffc0205392:	00008517          	auipc	a0,0x8
ffffffffc0205396:	06e50513          	addi	a0,a0,110 # ffffffffc020d400 <CSWTCH.79+0x48>
ffffffffc020539a:	904fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020539e:	00008697          	auipc	a3,0x8
ffffffffc02053a2:	08a68693          	addi	a3,a3,138 # ffffffffc020d428 <CSWTCH.79+0x70>
ffffffffc02053a6:	00006617          	auipc	a2,0x6
ffffffffc02053aa:	60260613          	addi	a2,a2,1538 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02053ae:	05400593          	li	a1,84
ffffffffc02053b2:	00008517          	auipc	a0,0x8
ffffffffc02053b6:	04e50513          	addi	a0,a0,78 # ffffffffc020d400 <CSWTCH.79+0x48>
ffffffffc02053ba:	8e4fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02053be <iobuf_skip.part.0>:
ffffffffc02053be:	1141                	addi	sp,sp,-16
ffffffffc02053c0:	00008697          	auipc	a3,0x8
ffffffffc02053c4:	09868693          	addi	a3,a3,152 # ffffffffc020d458 <CSWTCH.79+0xa0>
ffffffffc02053c8:	00006617          	auipc	a2,0x6
ffffffffc02053cc:	5e060613          	addi	a2,a2,1504 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02053d0:	04a00593          	li	a1,74
ffffffffc02053d4:	00008517          	auipc	a0,0x8
ffffffffc02053d8:	09c50513          	addi	a0,a0,156 # ffffffffc020d470 <CSWTCH.79+0xb8>
ffffffffc02053dc:	e406                	sd	ra,8(sp)
ffffffffc02053de:	8c0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02053e2 <iobuf_init>:
ffffffffc02053e2:	e10c                	sd	a1,0(a0)
ffffffffc02053e4:	e514                	sd	a3,8(a0)
ffffffffc02053e6:	ed10                	sd	a2,24(a0)
ffffffffc02053e8:	e910                	sd	a2,16(a0)
ffffffffc02053ea:	8082                	ret

ffffffffc02053ec <iobuf_move>:
ffffffffc02053ec:	7179                	addi	sp,sp,-48
ffffffffc02053ee:	ec26                	sd	s1,24(sp)
ffffffffc02053f0:	6d04                	ld	s1,24(a0)
ffffffffc02053f2:	f022                	sd	s0,32(sp)
ffffffffc02053f4:	e84a                	sd	s2,16(sp)
ffffffffc02053f6:	e44e                	sd	s3,8(sp)
ffffffffc02053f8:	f406                	sd	ra,40(sp)
ffffffffc02053fa:	842a                	mv	s0,a0
ffffffffc02053fc:	8932                	mv	s2,a2
ffffffffc02053fe:	852e                	mv	a0,a1
ffffffffc0205400:	89ba                	mv	s3,a4
ffffffffc0205402:	00967363          	bgeu	a2,s1,ffffffffc0205408 <iobuf_move+0x1c>
ffffffffc0205406:	84b2                	mv	s1,a2
ffffffffc0205408:	c495                	beqz	s1,ffffffffc0205434 <iobuf_move+0x48>
ffffffffc020540a:	600c                	ld	a1,0(s0)
ffffffffc020540c:	c681                	beqz	a3,ffffffffc0205414 <iobuf_move+0x28>
ffffffffc020540e:	87ae                	mv	a5,a1
ffffffffc0205410:	85aa                	mv	a1,a0
ffffffffc0205412:	853e                	mv	a0,a5
ffffffffc0205414:	8626                	mv	a2,s1
ffffffffc0205416:	0c0060ef          	jal	ra,ffffffffc020b4d6 <memmove>
ffffffffc020541a:	6c1c                	ld	a5,24(s0)
ffffffffc020541c:	0297ea63          	bltu	a5,s1,ffffffffc0205450 <iobuf_move+0x64>
ffffffffc0205420:	6014                	ld	a3,0(s0)
ffffffffc0205422:	6418                	ld	a4,8(s0)
ffffffffc0205424:	8f85                	sub	a5,a5,s1
ffffffffc0205426:	96a6                	add	a3,a3,s1
ffffffffc0205428:	9726                	add	a4,a4,s1
ffffffffc020542a:	e014                	sd	a3,0(s0)
ffffffffc020542c:	e418                	sd	a4,8(s0)
ffffffffc020542e:	ec1c                	sd	a5,24(s0)
ffffffffc0205430:	40990933          	sub	s2,s2,s1
ffffffffc0205434:	00098463          	beqz	s3,ffffffffc020543c <iobuf_move+0x50>
ffffffffc0205438:	0099b023          	sd	s1,0(s3)
ffffffffc020543c:	4501                	li	a0,0
ffffffffc020543e:	00091b63          	bnez	s2,ffffffffc0205454 <iobuf_move+0x68>
ffffffffc0205442:	70a2                	ld	ra,40(sp)
ffffffffc0205444:	7402                	ld	s0,32(sp)
ffffffffc0205446:	64e2                	ld	s1,24(sp)
ffffffffc0205448:	6942                	ld	s2,16(sp)
ffffffffc020544a:	69a2                	ld	s3,8(sp)
ffffffffc020544c:	6145                	addi	sp,sp,48
ffffffffc020544e:	8082                	ret
ffffffffc0205450:	f6fff0ef          	jal	ra,ffffffffc02053be <iobuf_skip.part.0>
ffffffffc0205454:	5571                	li	a0,-4
ffffffffc0205456:	b7f5                	j	ffffffffc0205442 <iobuf_move+0x56>

ffffffffc0205458 <iobuf_skip>:
ffffffffc0205458:	6d1c                	ld	a5,24(a0)
ffffffffc020545a:	00b7eb63          	bltu	a5,a1,ffffffffc0205470 <iobuf_skip+0x18>
ffffffffc020545e:	6114                	ld	a3,0(a0)
ffffffffc0205460:	6518                	ld	a4,8(a0)
ffffffffc0205462:	8f8d                	sub	a5,a5,a1
ffffffffc0205464:	96ae                	add	a3,a3,a1
ffffffffc0205466:	95ba                	add	a1,a1,a4
ffffffffc0205468:	e114                	sd	a3,0(a0)
ffffffffc020546a:	e50c                	sd	a1,8(a0)
ffffffffc020546c:	ed1c                	sd	a5,24(a0)
ffffffffc020546e:	8082                	ret
ffffffffc0205470:	1141                	addi	sp,sp,-16
ffffffffc0205472:	e406                	sd	ra,8(sp)
ffffffffc0205474:	f4bff0ef          	jal	ra,ffffffffc02053be <iobuf_skip.part.0>

ffffffffc0205478 <copy_path>:
ffffffffc0205478:	7139                	addi	sp,sp,-64
ffffffffc020547a:	f04a                	sd	s2,32(sp)
ffffffffc020547c:	00091917          	auipc	s2,0x91
ffffffffc0205480:	44490913          	addi	s2,s2,1092 # ffffffffc02968c0 <current>
ffffffffc0205484:	00093703          	ld	a4,0(s2)
ffffffffc0205488:	ec4e                	sd	s3,24(sp)
ffffffffc020548a:	89aa                	mv	s3,a0
ffffffffc020548c:	6505                	lui	a0,0x1
ffffffffc020548e:	f426                	sd	s1,40(sp)
ffffffffc0205490:	e852                	sd	s4,16(sp)
ffffffffc0205492:	fc06                	sd	ra,56(sp)
ffffffffc0205494:	f822                	sd	s0,48(sp)
ffffffffc0205496:	e456                	sd	s5,8(sp)
ffffffffc0205498:	02873a03          	ld	s4,40(a4)
ffffffffc020549c:	84ae                	mv	s1,a1
ffffffffc020549e:	af1fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02054a2:	c141                	beqz	a0,ffffffffc0205522 <copy_path+0xaa>
ffffffffc02054a4:	842a                	mv	s0,a0
ffffffffc02054a6:	040a0563          	beqz	s4,ffffffffc02054f0 <copy_path+0x78>
ffffffffc02054aa:	038a0a93          	addi	s5,s4,56
ffffffffc02054ae:	8556                	mv	a0,s5
ffffffffc02054b0:	8b4ff0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02054b4:	00093783          	ld	a5,0(s2)
ffffffffc02054b8:	cba1                	beqz	a5,ffffffffc0205508 <copy_path+0x90>
ffffffffc02054ba:	43dc                	lw	a5,4(a5)
ffffffffc02054bc:	6685                	lui	a3,0x1
ffffffffc02054be:	8626                	mv	a2,s1
ffffffffc02054c0:	04fa2823          	sw	a5,80(s4)
ffffffffc02054c4:	85a2                	mv	a1,s0
ffffffffc02054c6:	8552                	mv	a0,s4
ffffffffc02054c8:	ec5fe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc02054cc:	c529                	beqz	a0,ffffffffc0205516 <copy_path+0x9e>
ffffffffc02054ce:	8556                	mv	a0,s5
ffffffffc02054d0:	890ff0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02054d4:	040a2823          	sw	zero,80(s4)
ffffffffc02054d8:	0089b023          	sd	s0,0(s3)
ffffffffc02054dc:	4501                	li	a0,0
ffffffffc02054de:	70e2                	ld	ra,56(sp)
ffffffffc02054e0:	7442                	ld	s0,48(sp)
ffffffffc02054e2:	74a2                	ld	s1,40(sp)
ffffffffc02054e4:	7902                	ld	s2,32(sp)
ffffffffc02054e6:	69e2                	ld	s3,24(sp)
ffffffffc02054e8:	6a42                	ld	s4,16(sp)
ffffffffc02054ea:	6aa2                	ld	s5,8(sp)
ffffffffc02054ec:	6121                	addi	sp,sp,64
ffffffffc02054ee:	8082                	ret
ffffffffc02054f0:	85aa                	mv	a1,a0
ffffffffc02054f2:	6685                	lui	a3,0x1
ffffffffc02054f4:	8626                	mv	a2,s1
ffffffffc02054f6:	4501                	li	a0,0
ffffffffc02054f8:	e95fe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc02054fc:	fd71                	bnez	a0,ffffffffc02054d8 <copy_path+0x60>
ffffffffc02054fe:	8522                	mv	a0,s0
ffffffffc0205500:	b3ffc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205504:	5575                	li	a0,-3
ffffffffc0205506:	bfe1                	j	ffffffffc02054de <copy_path+0x66>
ffffffffc0205508:	6685                	lui	a3,0x1
ffffffffc020550a:	8626                	mv	a2,s1
ffffffffc020550c:	85a2                	mv	a1,s0
ffffffffc020550e:	8552                	mv	a0,s4
ffffffffc0205510:	e7dfe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc0205514:	fd4d                	bnez	a0,ffffffffc02054ce <copy_path+0x56>
ffffffffc0205516:	8556                	mv	a0,s5
ffffffffc0205518:	848ff0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020551c:	040a2823          	sw	zero,80(s4)
ffffffffc0205520:	bff9                	j	ffffffffc02054fe <copy_path+0x86>
ffffffffc0205522:	5571                	li	a0,-4
ffffffffc0205524:	bf6d                	j	ffffffffc02054de <copy_path+0x66>

ffffffffc0205526 <sysfile_open>:
ffffffffc0205526:	7179                	addi	sp,sp,-48
ffffffffc0205528:	872a                	mv	a4,a0
ffffffffc020552a:	ec26                	sd	s1,24(sp)
ffffffffc020552c:	0028                	addi	a0,sp,8
ffffffffc020552e:	84ae                	mv	s1,a1
ffffffffc0205530:	85ba                	mv	a1,a4
ffffffffc0205532:	f022                	sd	s0,32(sp)
ffffffffc0205534:	f406                	sd	ra,40(sp)
ffffffffc0205536:	f43ff0ef          	jal	ra,ffffffffc0205478 <copy_path>
ffffffffc020553a:	842a                	mv	s0,a0
ffffffffc020553c:	e909                	bnez	a0,ffffffffc020554e <sysfile_open+0x28>
ffffffffc020553e:	6522                	ld	a0,8(sp)
ffffffffc0205540:	85a6                	mv	a1,s1
ffffffffc0205542:	d60ff0ef          	jal	ra,ffffffffc0204aa2 <file_open>
ffffffffc0205546:	842a                	mv	s0,a0
ffffffffc0205548:	6522                	ld	a0,8(sp)
ffffffffc020554a:	af5fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020554e:	70a2                	ld	ra,40(sp)
ffffffffc0205550:	8522                	mv	a0,s0
ffffffffc0205552:	7402                	ld	s0,32(sp)
ffffffffc0205554:	64e2                	ld	s1,24(sp)
ffffffffc0205556:	6145                	addi	sp,sp,48
ffffffffc0205558:	8082                	ret

ffffffffc020555a <sysfile_close>:
ffffffffc020555a:	e46ff06f          	j	ffffffffc0204ba0 <file_close>

ffffffffc020555e <sysfile_read>:
ffffffffc020555e:	7159                	addi	sp,sp,-112
ffffffffc0205560:	f0a2                	sd	s0,96(sp)
ffffffffc0205562:	f486                	sd	ra,104(sp)
ffffffffc0205564:	eca6                	sd	s1,88(sp)
ffffffffc0205566:	e8ca                	sd	s2,80(sp)
ffffffffc0205568:	e4ce                	sd	s3,72(sp)
ffffffffc020556a:	e0d2                	sd	s4,64(sp)
ffffffffc020556c:	fc56                	sd	s5,56(sp)
ffffffffc020556e:	f85a                	sd	s6,48(sp)
ffffffffc0205570:	f45e                	sd	s7,40(sp)
ffffffffc0205572:	f062                	sd	s8,32(sp)
ffffffffc0205574:	ec66                	sd	s9,24(sp)
ffffffffc0205576:	4401                	li	s0,0
ffffffffc0205578:	ee19                	bnez	a2,ffffffffc0205596 <sysfile_read+0x38>
ffffffffc020557a:	70a6                	ld	ra,104(sp)
ffffffffc020557c:	8522                	mv	a0,s0
ffffffffc020557e:	7406                	ld	s0,96(sp)
ffffffffc0205580:	64e6                	ld	s1,88(sp)
ffffffffc0205582:	6946                	ld	s2,80(sp)
ffffffffc0205584:	69a6                	ld	s3,72(sp)
ffffffffc0205586:	6a06                	ld	s4,64(sp)
ffffffffc0205588:	7ae2                	ld	s5,56(sp)
ffffffffc020558a:	7b42                	ld	s6,48(sp)
ffffffffc020558c:	7ba2                	ld	s7,40(sp)
ffffffffc020558e:	7c02                	ld	s8,32(sp)
ffffffffc0205590:	6ce2                	ld	s9,24(sp)
ffffffffc0205592:	6165                	addi	sp,sp,112
ffffffffc0205594:	8082                	ret
ffffffffc0205596:	00091c97          	auipc	s9,0x91
ffffffffc020559a:	32ac8c93          	addi	s9,s9,810 # ffffffffc02968c0 <current>
ffffffffc020559e:	000cb783          	ld	a5,0(s9)
ffffffffc02055a2:	84b2                	mv	s1,a2
ffffffffc02055a4:	8b2e                	mv	s6,a1
ffffffffc02055a6:	4601                	li	a2,0
ffffffffc02055a8:	4585                	li	a1,1
ffffffffc02055aa:	0287b903          	ld	s2,40(a5)
ffffffffc02055ae:	8aaa                	mv	s5,a0
ffffffffc02055b0:	c9eff0ef          	jal	ra,ffffffffc0204a4e <file_testfd>
ffffffffc02055b4:	c959                	beqz	a0,ffffffffc020564a <sysfile_read+0xec>
ffffffffc02055b6:	6505                	lui	a0,0x1
ffffffffc02055b8:	9d7fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02055bc:	89aa                	mv	s3,a0
ffffffffc02055be:	c941                	beqz	a0,ffffffffc020564e <sysfile_read+0xf0>
ffffffffc02055c0:	4b81                	li	s7,0
ffffffffc02055c2:	6a05                	lui	s4,0x1
ffffffffc02055c4:	03890c13          	addi	s8,s2,56
ffffffffc02055c8:	0744ec63          	bltu	s1,s4,ffffffffc0205640 <sysfile_read+0xe2>
ffffffffc02055cc:	e452                	sd	s4,8(sp)
ffffffffc02055ce:	6605                	lui	a2,0x1
ffffffffc02055d0:	0034                	addi	a3,sp,8
ffffffffc02055d2:	85ce                	mv	a1,s3
ffffffffc02055d4:	8556                	mv	a0,s5
ffffffffc02055d6:	e20ff0ef          	jal	ra,ffffffffc0204bf6 <file_read>
ffffffffc02055da:	66a2                	ld	a3,8(sp)
ffffffffc02055dc:	842a                	mv	s0,a0
ffffffffc02055de:	ca9d                	beqz	a3,ffffffffc0205614 <sysfile_read+0xb6>
ffffffffc02055e0:	00090c63          	beqz	s2,ffffffffc02055f8 <sysfile_read+0x9a>
ffffffffc02055e4:	8562                	mv	a0,s8
ffffffffc02055e6:	f7ffe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02055ea:	000cb783          	ld	a5,0(s9)
ffffffffc02055ee:	cfa1                	beqz	a5,ffffffffc0205646 <sysfile_read+0xe8>
ffffffffc02055f0:	43dc                	lw	a5,4(a5)
ffffffffc02055f2:	66a2                	ld	a3,8(sp)
ffffffffc02055f4:	04f92823          	sw	a5,80(s2)
ffffffffc02055f8:	864e                	mv	a2,s3
ffffffffc02055fa:	85da                	mv	a1,s6
ffffffffc02055fc:	854a                	mv	a0,s2
ffffffffc02055fe:	d5dfe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205602:	c50d                	beqz	a0,ffffffffc020562c <sysfile_read+0xce>
ffffffffc0205604:	67a2                	ld	a5,8(sp)
ffffffffc0205606:	04f4e663          	bltu	s1,a5,ffffffffc0205652 <sysfile_read+0xf4>
ffffffffc020560a:	9b3e                	add	s6,s6,a5
ffffffffc020560c:	8c9d                	sub	s1,s1,a5
ffffffffc020560e:	9bbe                	add	s7,s7,a5
ffffffffc0205610:	02091263          	bnez	s2,ffffffffc0205634 <sysfile_read+0xd6>
ffffffffc0205614:	e401                	bnez	s0,ffffffffc020561c <sysfile_read+0xbe>
ffffffffc0205616:	67a2                	ld	a5,8(sp)
ffffffffc0205618:	c391                	beqz	a5,ffffffffc020561c <sysfile_read+0xbe>
ffffffffc020561a:	f4dd                	bnez	s1,ffffffffc02055c8 <sysfile_read+0x6a>
ffffffffc020561c:	854e                	mv	a0,s3
ffffffffc020561e:	a21fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205622:	f40b8ce3          	beqz	s7,ffffffffc020557a <sysfile_read+0x1c>
ffffffffc0205626:	000b841b          	sext.w	s0,s7
ffffffffc020562a:	bf81                	j	ffffffffc020557a <sysfile_read+0x1c>
ffffffffc020562c:	e011                	bnez	s0,ffffffffc0205630 <sysfile_read+0xd2>
ffffffffc020562e:	5475                	li	s0,-3
ffffffffc0205630:	fe0906e3          	beqz	s2,ffffffffc020561c <sysfile_read+0xbe>
ffffffffc0205634:	8562                	mv	a0,s8
ffffffffc0205636:	f2bfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020563a:	04092823          	sw	zero,80(s2)
ffffffffc020563e:	bfd9                	j	ffffffffc0205614 <sysfile_read+0xb6>
ffffffffc0205640:	e426                	sd	s1,8(sp)
ffffffffc0205642:	8626                	mv	a2,s1
ffffffffc0205644:	b771                	j	ffffffffc02055d0 <sysfile_read+0x72>
ffffffffc0205646:	66a2                	ld	a3,8(sp)
ffffffffc0205648:	bf45                	j	ffffffffc02055f8 <sysfile_read+0x9a>
ffffffffc020564a:	5475                	li	s0,-3
ffffffffc020564c:	b73d                	j	ffffffffc020557a <sysfile_read+0x1c>
ffffffffc020564e:	5471                	li	s0,-4
ffffffffc0205650:	b72d                	j	ffffffffc020557a <sysfile_read+0x1c>
ffffffffc0205652:	00008697          	auipc	a3,0x8
ffffffffc0205656:	e2e68693          	addi	a3,a3,-466 # ffffffffc020d480 <CSWTCH.79+0xc8>
ffffffffc020565a:	00006617          	auipc	a2,0x6
ffffffffc020565e:	34e60613          	addi	a2,a2,846 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0205662:	05500593          	li	a1,85
ffffffffc0205666:	00008517          	auipc	a0,0x8
ffffffffc020566a:	e2a50513          	addi	a0,a0,-470 # ffffffffc020d490 <CSWTCH.79+0xd8>
ffffffffc020566e:	e31fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205672 <sysfile_write>:
ffffffffc0205672:	7159                	addi	sp,sp,-112
ffffffffc0205674:	e8ca                	sd	s2,80(sp)
ffffffffc0205676:	f486                	sd	ra,104(sp)
ffffffffc0205678:	f0a2                	sd	s0,96(sp)
ffffffffc020567a:	eca6                	sd	s1,88(sp)
ffffffffc020567c:	e4ce                	sd	s3,72(sp)
ffffffffc020567e:	e0d2                	sd	s4,64(sp)
ffffffffc0205680:	fc56                	sd	s5,56(sp)
ffffffffc0205682:	f85a                	sd	s6,48(sp)
ffffffffc0205684:	f45e                	sd	s7,40(sp)
ffffffffc0205686:	f062                	sd	s8,32(sp)
ffffffffc0205688:	ec66                	sd	s9,24(sp)
ffffffffc020568a:	4901                	li	s2,0
ffffffffc020568c:	ee19                	bnez	a2,ffffffffc02056aa <sysfile_write+0x38>
ffffffffc020568e:	70a6                	ld	ra,104(sp)
ffffffffc0205690:	7406                	ld	s0,96(sp)
ffffffffc0205692:	64e6                	ld	s1,88(sp)
ffffffffc0205694:	69a6                	ld	s3,72(sp)
ffffffffc0205696:	6a06                	ld	s4,64(sp)
ffffffffc0205698:	7ae2                	ld	s5,56(sp)
ffffffffc020569a:	7b42                	ld	s6,48(sp)
ffffffffc020569c:	7ba2                	ld	s7,40(sp)
ffffffffc020569e:	7c02                	ld	s8,32(sp)
ffffffffc02056a0:	6ce2                	ld	s9,24(sp)
ffffffffc02056a2:	854a                	mv	a0,s2
ffffffffc02056a4:	6946                	ld	s2,80(sp)
ffffffffc02056a6:	6165                	addi	sp,sp,112
ffffffffc02056a8:	8082                	ret
ffffffffc02056aa:	00091c17          	auipc	s8,0x91
ffffffffc02056ae:	216c0c13          	addi	s8,s8,534 # ffffffffc02968c0 <current>
ffffffffc02056b2:	000c3783          	ld	a5,0(s8)
ffffffffc02056b6:	8432                	mv	s0,a2
ffffffffc02056b8:	89ae                	mv	s3,a1
ffffffffc02056ba:	4605                	li	a2,1
ffffffffc02056bc:	4581                	li	a1,0
ffffffffc02056be:	7784                	ld	s1,40(a5)
ffffffffc02056c0:	8baa                	mv	s7,a0
ffffffffc02056c2:	b8cff0ef          	jal	ra,ffffffffc0204a4e <file_testfd>
ffffffffc02056c6:	cd59                	beqz	a0,ffffffffc0205764 <sysfile_write+0xf2>
ffffffffc02056c8:	6505                	lui	a0,0x1
ffffffffc02056ca:	8c5fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02056ce:	8a2a                	mv	s4,a0
ffffffffc02056d0:	cd41                	beqz	a0,ffffffffc0205768 <sysfile_write+0xf6>
ffffffffc02056d2:	4c81                	li	s9,0
ffffffffc02056d4:	6a85                	lui	s5,0x1
ffffffffc02056d6:	03848b13          	addi	s6,s1,56
ffffffffc02056da:	05546a63          	bltu	s0,s5,ffffffffc020572e <sysfile_write+0xbc>
ffffffffc02056de:	e456                	sd	s5,8(sp)
ffffffffc02056e0:	c8a9                	beqz	s1,ffffffffc0205732 <sysfile_write+0xc0>
ffffffffc02056e2:	855a                	mv	a0,s6
ffffffffc02056e4:	e81fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02056e8:	000c3783          	ld	a5,0(s8)
ffffffffc02056ec:	c399                	beqz	a5,ffffffffc02056f2 <sysfile_write+0x80>
ffffffffc02056ee:	43dc                	lw	a5,4(a5)
ffffffffc02056f0:	c8bc                	sw	a5,80(s1)
ffffffffc02056f2:	66a2                	ld	a3,8(sp)
ffffffffc02056f4:	4701                	li	a4,0
ffffffffc02056f6:	864e                	mv	a2,s3
ffffffffc02056f8:	85d2                	mv	a1,s4
ffffffffc02056fa:	8526                	mv	a0,s1
ffffffffc02056fc:	c2bfe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc0205700:	c139                	beqz	a0,ffffffffc0205746 <sysfile_write+0xd4>
ffffffffc0205702:	855a                	mv	a0,s6
ffffffffc0205704:	e5dfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205708:	0404a823          	sw	zero,80(s1)
ffffffffc020570c:	6622                	ld	a2,8(sp)
ffffffffc020570e:	0034                	addi	a3,sp,8
ffffffffc0205710:	85d2                	mv	a1,s4
ffffffffc0205712:	855e                	mv	a0,s7
ffffffffc0205714:	dc8ff0ef          	jal	ra,ffffffffc0204cdc <file_write>
ffffffffc0205718:	67a2                	ld	a5,8(sp)
ffffffffc020571a:	892a                	mv	s2,a0
ffffffffc020571c:	ef85                	bnez	a5,ffffffffc0205754 <sysfile_write+0xe2>
ffffffffc020571e:	8552                	mv	a0,s4
ffffffffc0205720:	91ffc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205724:	f60c85e3          	beqz	s9,ffffffffc020568e <sysfile_write+0x1c>
ffffffffc0205728:	000c891b          	sext.w	s2,s9
ffffffffc020572c:	b78d                	j	ffffffffc020568e <sysfile_write+0x1c>
ffffffffc020572e:	e422                	sd	s0,8(sp)
ffffffffc0205730:	f8cd                	bnez	s1,ffffffffc02056e2 <sysfile_write+0x70>
ffffffffc0205732:	66a2                	ld	a3,8(sp)
ffffffffc0205734:	4701                	li	a4,0
ffffffffc0205736:	864e                	mv	a2,s3
ffffffffc0205738:	85d2                	mv	a1,s4
ffffffffc020573a:	4501                	li	a0,0
ffffffffc020573c:	bebfe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc0205740:	f571                	bnez	a0,ffffffffc020570c <sysfile_write+0x9a>
ffffffffc0205742:	5975                	li	s2,-3
ffffffffc0205744:	bfe9                	j	ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205746:	855a                	mv	a0,s6
ffffffffc0205748:	e19fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020574c:	5975                	li	s2,-3
ffffffffc020574e:	0404a823          	sw	zero,80(s1)
ffffffffc0205752:	b7f1                	j	ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205754:	00f46c63          	bltu	s0,a5,ffffffffc020576c <sysfile_write+0xfa>
ffffffffc0205758:	99be                	add	s3,s3,a5
ffffffffc020575a:	8c1d                	sub	s0,s0,a5
ffffffffc020575c:	9cbe                	add	s9,s9,a5
ffffffffc020575e:	f161                	bnez	a0,ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205760:	fc2d                	bnez	s0,ffffffffc02056da <sysfile_write+0x68>
ffffffffc0205762:	bf75                	j	ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205764:	5975                	li	s2,-3
ffffffffc0205766:	b725                	j	ffffffffc020568e <sysfile_write+0x1c>
ffffffffc0205768:	5971                	li	s2,-4
ffffffffc020576a:	b715                	j	ffffffffc020568e <sysfile_write+0x1c>
ffffffffc020576c:	00008697          	auipc	a3,0x8
ffffffffc0205770:	d1468693          	addi	a3,a3,-748 # ffffffffc020d480 <CSWTCH.79+0xc8>
ffffffffc0205774:	00006617          	auipc	a2,0x6
ffffffffc0205778:	23460613          	addi	a2,a2,564 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020577c:	08a00593          	li	a1,138
ffffffffc0205780:	00008517          	auipc	a0,0x8
ffffffffc0205784:	d1050513          	addi	a0,a0,-752 # ffffffffc020d490 <CSWTCH.79+0xd8>
ffffffffc0205788:	d17fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020578c <sysfile_seek>:
ffffffffc020578c:	e36ff06f          	j	ffffffffc0204dc2 <file_seek>

ffffffffc0205790 <sysfile_fstat>:
ffffffffc0205790:	715d                	addi	sp,sp,-80
ffffffffc0205792:	f44e                	sd	s3,40(sp)
ffffffffc0205794:	00091997          	auipc	s3,0x91
ffffffffc0205798:	12c98993          	addi	s3,s3,300 # ffffffffc02968c0 <current>
ffffffffc020579c:	0009b703          	ld	a4,0(s3)
ffffffffc02057a0:	fc26                	sd	s1,56(sp)
ffffffffc02057a2:	84ae                	mv	s1,a1
ffffffffc02057a4:	858a                	mv	a1,sp
ffffffffc02057a6:	e0a2                	sd	s0,64(sp)
ffffffffc02057a8:	f84a                	sd	s2,48(sp)
ffffffffc02057aa:	e486                	sd	ra,72(sp)
ffffffffc02057ac:	02873903          	ld	s2,40(a4)
ffffffffc02057b0:	f052                	sd	s4,32(sp)
ffffffffc02057b2:	f30ff0ef          	jal	ra,ffffffffc0204ee2 <file_fstat>
ffffffffc02057b6:	842a                	mv	s0,a0
ffffffffc02057b8:	e91d                	bnez	a0,ffffffffc02057ee <sysfile_fstat+0x5e>
ffffffffc02057ba:	04090363          	beqz	s2,ffffffffc0205800 <sysfile_fstat+0x70>
ffffffffc02057be:	03890a13          	addi	s4,s2,56
ffffffffc02057c2:	8552                	mv	a0,s4
ffffffffc02057c4:	da1fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02057c8:	0009b783          	ld	a5,0(s3)
ffffffffc02057cc:	c3b9                	beqz	a5,ffffffffc0205812 <sysfile_fstat+0x82>
ffffffffc02057ce:	43dc                	lw	a5,4(a5)
ffffffffc02057d0:	02000693          	li	a3,32
ffffffffc02057d4:	860a                	mv	a2,sp
ffffffffc02057d6:	04f92823          	sw	a5,80(s2)
ffffffffc02057da:	85a6                	mv	a1,s1
ffffffffc02057dc:	854a                	mv	a0,s2
ffffffffc02057de:	b7dfe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc02057e2:	c121                	beqz	a0,ffffffffc0205822 <sysfile_fstat+0x92>
ffffffffc02057e4:	8552                	mv	a0,s4
ffffffffc02057e6:	d7bfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02057ea:	04092823          	sw	zero,80(s2)
ffffffffc02057ee:	60a6                	ld	ra,72(sp)
ffffffffc02057f0:	8522                	mv	a0,s0
ffffffffc02057f2:	6406                	ld	s0,64(sp)
ffffffffc02057f4:	74e2                	ld	s1,56(sp)
ffffffffc02057f6:	7942                	ld	s2,48(sp)
ffffffffc02057f8:	79a2                	ld	s3,40(sp)
ffffffffc02057fa:	7a02                	ld	s4,32(sp)
ffffffffc02057fc:	6161                	addi	sp,sp,80
ffffffffc02057fe:	8082                	ret
ffffffffc0205800:	02000693          	li	a3,32
ffffffffc0205804:	860a                	mv	a2,sp
ffffffffc0205806:	85a6                	mv	a1,s1
ffffffffc0205808:	b53fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc020580c:	f16d                	bnez	a0,ffffffffc02057ee <sysfile_fstat+0x5e>
ffffffffc020580e:	5475                	li	s0,-3
ffffffffc0205810:	bff9                	j	ffffffffc02057ee <sysfile_fstat+0x5e>
ffffffffc0205812:	02000693          	li	a3,32
ffffffffc0205816:	860a                	mv	a2,sp
ffffffffc0205818:	85a6                	mv	a1,s1
ffffffffc020581a:	854a                	mv	a0,s2
ffffffffc020581c:	b3ffe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205820:	f171                	bnez	a0,ffffffffc02057e4 <sysfile_fstat+0x54>
ffffffffc0205822:	8552                	mv	a0,s4
ffffffffc0205824:	d3dfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205828:	5475                	li	s0,-3
ffffffffc020582a:	04092823          	sw	zero,80(s2)
ffffffffc020582e:	b7c1                	j	ffffffffc02057ee <sysfile_fstat+0x5e>

ffffffffc0205830 <sysfile_fsync>:
ffffffffc0205830:	f72ff06f          	j	ffffffffc0204fa2 <file_fsync>

ffffffffc0205834 <sysfile_getcwd>:
ffffffffc0205834:	715d                	addi	sp,sp,-80
ffffffffc0205836:	f44e                	sd	s3,40(sp)
ffffffffc0205838:	00091997          	auipc	s3,0x91
ffffffffc020583c:	08898993          	addi	s3,s3,136 # ffffffffc02968c0 <current>
ffffffffc0205840:	0009b783          	ld	a5,0(s3)
ffffffffc0205844:	f84a                	sd	s2,48(sp)
ffffffffc0205846:	e486                	sd	ra,72(sp)
ffffffffc0205848:	e0a2                	sd	s0,64(sp)
ffffffffc020584a:	fc26                	sd	s1,56(sp)
ffffffffc020584c:	f052                	sd	s4,32(sp)
ffffffffc020584e:	0287b903          	ld	s2,40(a5)
ffffffffc0205852:	cda9                	beqz	a1,ffffffffc02058ac <sysfile_getcwd+0x78>
ffffffffc0205854:	842e                	mv	s0,a1
ffffffffc0205856:	84aa                	mv	s1,a0
ffffffffc0205858:	04090363          	beqz	s2,ffffffffc020589e <sysfile_getcwd+0x6a>
ffffffffc020585c:	03890a13          	addi	s4,s2,56
ffffffffc0205860:	8552                	mv	a0,s4
ffffffffc0205862:	d03fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205866:	0009b783          	ld	a5,0(s3)
ffffffffc020586a:	c781                	beqz	a5,ffffffffc0205872 <sysfile_getcwd+0x3e>
ffffffffc020586c:	43dc                	lw	a5,4(a5)
ffffffffc020586e:	04f92823          	sw	a5,80(s2)
ffffffffc0205872:	4685                	li	a3,1
ffffffffc0205874:	8622                	mv	a2,s0
ffffffffc0205876:	85a6                	mv	a1,s1
ffffffffc0205878:	854a                	mv	a0,s2
ffffffffc020587a:	a19fe0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc020587e:	e90d                	bnez	a0,ffffffffc02058b0 <sysfile_getcwd+0x7c>
ffffffffc0205880:	5475                	li	s0,-3
ffffffffc0205882:	8552                	mv	a0,s4
ffffffffc0205884:	cddfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205888:	04092823          	sw	zero,80(s2)
ffffffffc020588c:	60a6                	ld	ra,72(sp)
ffffffffc020588e:	8522                	mv	a0,s0
ffffffffc0205890:	6406                	ld	s0,64(sp)
ffffffffc0205892:	74e2                	ld	s1,56(sp)
ffffffffc0205894:	7942                	ld	s2,48(sp)
ffffffffc0205896:	79a2                	ld	s3,40(sp)
ffffffffc0205898:	7a02                	ld	s4,32(sp)
ffffffffc020589a:	6161                	addi	sp,sp,80
ffffffffc020589c:	8082                	ret
ffffffffc020589e:	862e                	mv	a2,a1
ffffffffc02058a0:	4685                	li	a3,1
ffffffffc02058a2:	85aa                	mv	a1,a0
ffffffffc02058a4:	4501                	li	a0,0
ffffffffc02058a6:	9edfe0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc02058aa:	ed09                	bnez	a0,ffffffffc02058c4 <sysfile_getcwd+0x90>
ffffffffc02058ac:	5475                	li	s0,-3
ffffffffc02058ae:	bff9                	j	ffffffffc020588c <sysfile_getcwd+0x58>
ffffffffc02058b0:	8622                	mv	a2,s0
ffffffffc02058b2:	4681                	li	a3,0
ffffffffc02058b4:	85a6                	mv	a1,s1
ffffffffc02058b6:	850a                	mv	a0,sp
ffffffffc02058b8:	b2bff0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02058bc:	36f020ef          	jal	ra,ffffffffc020842a <vfs_getcwd>
ffffffffc02058c0:	842a                	mv	s0,a0
ffffffffc02058c2:	b7c1                	j	ffffffffc0205882 <sysfile_getcwd+0x4e>
ffffffffc02058c4:	8622                	mv	a2,s0
ffffffffc02058c6:	4681                	li	a3,0
ffffffffc02058c8:	85a6                	mv	a1,s1
ffffffffc02058ca:	850a                	mv	a0,sp
ffffffffc02058cc:	b17ff0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02058d0:	35b020ef          	jal	ra,ffffffffc020842a <vfs_getcwd>
ffffffffc02058d4:	842a                	mv	s0,a0
ffffffffc02058d6:	bf5d                	j	ffffffffc020588c <sysfile_getcwd+0x58>

ffffffffc02058d8 <sysfile_getdirentry>:
ffffffffc02058d8:	7139                	addi	sp,sp,-64
ffffffffc02058da:	e852                	sd	s4,16(sp)
ffffffffc02058dc:	00091a17          	auipc	s4,0x91
ffffffffc02058e0:	fe4a0a13          	addi	s4,s4,-28 # ffffffffc02968c0 <current>
ffffffffc02058e4:	000a3703          	ld	a4,0(s4)
ffffffffc02058e8:	ec4e                	sd	s3,24(sp)
ffffffffc02058ea:	89aa                	mv	s3,a0
ffffffffc02058ec:	10800513          	li	a0,264
ffffffffc02058f0:	f426                	sd	s1,40(sp)
ffffffffc02058f2:	f04a                	sd	s2,32(sp)
ffffffffc02058f4:	fc06                	sd	ra,56(sp)
ffffffffc02058f6:	f822                	sd	s0,48(sp)
ffffffffc02058f8:	e456                	sd	s5,8(sp)
ffffffffc02058fa:	7704                	ld	s1,40(a4)
ffffffffc02058fc:	892e                	mv	s2,a1
ffffffffc02058fe:	e90fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205902:	c169                	beqz	a0,ffffffffc02059c4 <sysfile_getdirentry+0xec>
ffffffffc0205904:	842a                	mv	s0,a0
ffffffffc0205906:	c8c1                	beqz	s1,ffffffffc0205996 <sysfile_getdirentry+0xbe>
ffffffffc0205908:	03848a93          	addi	s5,s1,56
ffffffffc020590c:	8556                	mv	a0,s5
ffffffffc020590e:	c57fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205912:	000a3783          	ld	a5,0(s4)
ffffffffc0205916:	c399                	beqz	a5,ffffffffc020591c <sysfile_getdirentry+0x44>
ffffffffc0205918:	43dc                	lw	a5,4(a5)
ffffffffc020591a:	c8bc                	sw	a5,80(s1)
ffffffffc020591c:	4705                	li	a4,1
ffffffffc020591e:	46a1                	li	a3,8
ffffffffc0205920:	864a                	mv	a2,s2
ffffffffc0205922:	85a2                	mv	a1,s0
ffffffffc0205924:	8526                	mv	a0,s1
ffffffffc0205926:	a01fe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc020592a:	e505                	bnez	a0,ffffffffc0205952 <sysfile_getdirentry+0x7a>
ffffffffc020592c:	8556                	mv	a0,s5
ffffffffc020592e:	c33fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205932:	59f5                	li	s3,-3
ffffffffc0205934:	0404a823          	sw	zero,80(s1)
ffffffffc0205938:	8522                	mv	a0,s0
ffffffffc020593a:	f04fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020593e:	70e2                	ld	ra,56(sp)
ffffffffc0205940:	7442                	ld	s0,48(sp)
ffffffffc0205942:	74a2                	ld	s1,40(sp)
ffffffffc0205944:	7902                	ld	s2,32(sp)
ffffffffc0205946:	6a42                	ld	s4,16(sp)
ffffffffc0205948:	6aa2                	ld	s5,8(sp)
ffffffffc020594a:	854e                	mv	a0,s3
ffffffffc020594c:	69e2                	ld	s3,24(sp)
ffffffffc020594e:	6121                	addi	sp,sp,64
ffffffffc0205950:	8082                	ret
ffffffffc0205952:	8556                	mv	a0,s5
ffffffffc0205954:	c0dfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205958:	854e                	mv	a0,s3
ffffffffc020595a:	85a2                	mv	a1,s0
ffffffffc020595c:	0404a823          	sw	zero,80(s1)
ffffffffc0205960:	ef0ff0ef          	jal	ra,ffffffffc0205050 <file_getdirentry>
ffffffffc0205964:	89aa                	mv	s3,a0
ffffffffc0205966:	f969                	bnez	a0,ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc0205968:	8556                	mv	a0,s5
ffffffffc020596a:	bfbfe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020596e:	000a3783          	ld	a5,0(s4)
ffffffffc0205972:	c399                	beqz	a5,ffffffffc0205978 <sysfile_getdirentry+0xa0>
ffffffffc0205974:	43dc                	lw	a5,4(a5)
ffffffffc0205976:	c8bc                	sw	a5,80(s1)
ffffffffc0205978:	10800693          	li	a3,264
ffffffffc020597c:	8622                	mv	a2,s0
ffffffffc020597e:	85ca                	mv	a1,s2
ffffffffc0205980:	8526                	mv	a0,s1
ffffffffc0205982:	9d9fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205986:	e111                	bnez	a0,ffffffffc020598a <sysfile_getdirentry+0xb2>
ffffffffc0205988:	59f5                	li	s3,-3
ffffffffc020598a:	8556                	mv	a0,s5
ffffffffc020598c:	bd5fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205990:	0404a823          	sw	zero,80(s1)
ffffffffc0205994:	b755                	j	ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc0205996:	85aa                	mv	a1,a0
ffffffffc0205998:	4705                	li	a4,1
ffffffffc020599a:	46a1                	li	a3,8
ffffffffc020599c:	864a                	mv	a2,s2
ffffffffc020599e:	4501                	li	a0,0
ffffffffc02059a0:	987fe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc02059a4:	cd11                	beqz	a0,ffffffffc02059c0 <sysfile_getdirentry+0xe8>
ffffffffc02059a6:	854e                	mv	a0,s3
ffffffffc02059a8:	85a2                	mv	a1,s0
ffffffffc02059aa:	ea6ff0ef          	jal	ra,ffffffffc0205050 <file_getdirentry>
ffffffffc02059ae:	89aa                	mv	s3,a0
ffffffffc02059b0:	f541                	bnez	a0,ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc02059b2:	10800693          	li	a3,264
ffffffffc02059b6:	8622                	mv	a2,s0
ffffffffc02059b8:	85ca                	mv	a1,s2
ffffffffc02059ba:	9a1fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc02059be:	fd2d                	bnez	a0,ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc02059c0:	59f5                	li	s3,-3
ffffffffc02059c2:	bf9d                	j	ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc02059c4:	59f1                	li	s3,-4
ffffffffc02059c6:	bfa5                	j	ffffffffc020593e <sysfile_getdirentry+0x66>

ffffffffc02059c8 <sysfile_dup>:
ffffffffc02059c8:	f6eff06f          	j	ffffffffc0205136 <file_dup>

ffffffffc02059cc <kernel_thread_entry>:
ffffffffc02059cc:	8526                	mv	a0,s1
ffffffffc02059ce:	9402                	jalr	s0
ffffffffc02059d0:	686000ef          	jal	ra,ffffffffc0206056 <do_exit>

ffffffffc02059d4 <alloc_proc>:
ffffffffc02059d4:	1141                	addi	sp,sp,-16
ffffffffc02059d6:	15000513          	li	a0,336
ffffffffc02059da:	e022                	sd	s0,0(sp)
ffffffffc02059dc:	e406                	sd	ra,8(sp)
ffffffffc02059de:	db0fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02059e2:	842a                	mv	s0,a0
ffffffffc02059e4:	c141                	beqz	a0,ffffffffc0205a64 <alloc_proc+0x90>
ffffffffc02059e6:	57fd                	li	a5,-1
ffffffffc02059e8:	1782                	slli	a5,a5,0x20
ffffffffc02059ea:	e11c                	sd	a5,0(a0)
ffffffffc02059ec:	07000613          	li	a2,112
ffffffffc02059f0:	4581                	li	a1,0
ffffffffc02059f2:	00052423          	sw	zero,8(a0)
ffffffffc02059f6:	00053823          	sd	zero,16(a0)
ffffffffc02059fa:	00053c23          	sd	zero,24(a0)
ffffffffc02059fe:	02053023          	sd	zero,32(a0)
ffffffffc0205a02:	02053423          	sd	zero,40(a0)
ffffffffc0205a06:	03050513          	addi	a0,a0,48
ffffffffc0205a0a:	2bb050ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0205a0e:	00091797          	auipc	a5,0x91
ffffffffc0205a12:	e827b783          	ld	a5,-382(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0205a16:	f45c                	sd	a5,168(s0)
ffffffffc0205a18:	0a043023          	sd	zero,160(s0)
ffffffffc0205a1c:	0a042823          	sw	zero,176(s0)
ffffffffc0205a20:	463d                	li	a2,15
ffffffffc0205a22:	4581                	li	a1,0
ffffffffc0205a24:	0b440513          	addi	a0,s0,180
ffffffffc0205a28:	29d050ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0205a2c:	11040793          	addi	a5,s0,272
ffffffffc0205a30:	0e042623          	sw	zero,236(s0)
ffffffffc0205a34:	0e043c23          	sd	zero,248(s0)
ffffffffc0205a38:	10043023          	sd	zero,256(s0)
ffffffffc0205a3c:	0e043823          	sd	zero,240(s0)
ffffffffc0205a40:	10043423          	sd	zero,264(s0)
ffffffffc0205a44:	10f43c23          	sd	a5,280(s0)
ffffffffc0205a48:	10f43823          	sd	a5,272(s0)
ffffffffc0205a4c:	12042023          	sw	zero,288(s0)
ffffffffc0205a50:	12043423          	sd	zero,296(s0)
ffffffffc0205a54:	12043823          	sd	zero,304(s0)
ffffffffc0205a58:	12043c23          	sd	zero,312(s0)
ffffffffc0205a5c:	14043023          	sd	zero,320(s0)
ffffffffc0205a60:	14043423          	sd	zero,328(s0)
ffffffffc0205a64:	60a2                	ld	ra,8(sp)
ffffffffc0205a66:	8522                	mv	a0,s0
ffffffffc0205a68:	6402                	ld	s0,0(sp)
ffffffffc0205a6a:	0141                	addi	sp,sp,16
ffffffffc0205a6c:	8082                	ret

ffffffffc0205a6e <forkret>:
ffffffffc0205a6e:	00091797          	auipc	a5,0x91
ffffffffc0205a72:	e527b783          	ld	a5,-430(a5) # ffffffffc02968c0 <current>
ffffffffc0205a76:	73c8                	ld	a0,160(a5)
ffffffffc0205a78:	833fb06f          	j	ffffffffc02012aa <forkrets>

ffffffffc0205a7c <put_pgdir.isra.0>:
ffffffffc0205a7c:	1141                	addi	sp,sp,-16
ffffffffc0205a7e:	e406                	sd	ra,8(sp)
ffffffffc0205a80:	c02007b7          	lui	a5,0xc0200
ffffffffc0205a84:	02f56e63          	bltu	a0,a5,ffffffffc0205ac0 <put_pgdir.isra.0+0x44>
ffffffffc0205a88:	00091697          	auipc	a3,0x91
ffffffffc0205a8c:	e306b683          	ld	a3,-464(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205a90:	8d15                	sub	a0,a0,a3
ffffffffc0205a92:	8131                	srli	a0,a0,0xc
ffffffffc0205a94:	00091797          	auipc	a5,0x91
ffffffffc0205a98:	e0c7b783          	ld	a5,-500(a5) # ffffffffc02968a0 <npage>
ffffffffc0205a9c:	02f57f63          	bgeu	a0,a5,ffffffffc0205ada <put_pgdir.isra.0+0x5e>
ffffffffc0205aa0:	0000a697          	auipc	a3,0xa
ffffffffc0205aa4:	d786b683          	ld	a3,-648(a3) # ffffffffc020f818 <nbase>
ffffffffc0205aa8:	60a2                	ld	ra,8(sp)
ffffffffc0205aaa:	8d15                	sub	a0,a0,a3
ffffffffc0205aac:	00091797          	auipc	a5,0x91
ffffffffc0205ab0:	dfc7b783          	ld	a5,-516(a5) # ffffffffc02968a8 <pages>
ffffffffc0205ab4:	051a                	slli	a0,a0,0x6
ffffffffc0205ab6:	4585                	li	a1,1
ffffffffc0205ab8:	953e                	add	a0,a0,a5
ffffffffc0205aba:	0141                	addi	sp,sp,16
ffffffffc0205abc:	eeefc06f          	j	ffffffffc02021aa <free_pages>
ffffffffc0205ac0:	86aa                	mv	a3,a0
ffffffffc0205ac2:	00007617          	auipc	a2,0x7
ffffffffc0205ac6:	aae60613          	addi	a2,a2,-1362 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc0205aca:	07700593          	li	a1,119
ffffffffc0205ace:	00007517          	auipc	a0,0x7
ffffffffc0205ad2:	a2250513          	addi	a0,a0,-1502 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0205ad6:	9c9fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205ada:	00007617          	auipc	a2,0x7
ffffffffc0205ade:	abe60613          	addi	a2,a2,-1346 # ffffffffc020c598 <default_pmm_manager+0x108>
ffffffffc0205ae2:	06900593          	li	a1,105
ffffffffc0205ae6:	00007517          	auipc	a0,0x7
ffffffffc0205aea:	a0a50513          	addi	a0,a0,-1526 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0205aee:	9b1fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205af2 <setup_pgdir>:
ffffffffc0205af2:	1101                	addi	sp,sp,-32
ffffffffc0205af4:	e426                	sd	s1,8(sp)
ffffffffc0205af6:	84aa                	mv	s1,a0
ffffffffc0205af8:	4505                	li	a0,1
ffffffffc0205afa:	ec06                	sd	ra,24(sp)
ffffffffc0205afc:	e822                	sd	s0,16(sp)
ffffffffc0205afe:	e6efc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205b02:	c939                	beqz	a0,ffffffffc0205b58 <setup_pgdir+0x66>
ffffffffc0205b04:	00091697          	auipc	a3,0x91
ffffffffc0205b08:	da46b683          	ld	a3,-604(a3) # ffffffffc02968a8 <pages>
ffffffffc0205b0c:	40d506b3          	sub	a3,a0,a3
ffffffffc0205b10:	8699                	srai	a3,a3,0x6
ffffffffc0205b12:	0000a417          	auipc	s0,0xa
ffffffffc0205b16:	d0643403          	ld	s0,-762(s0) # ffffffffc020f818 <nbase>
ffffffffc0205b1a:	96a2                	add	a3,a3,s0
ffffffffc0205b1c:	00c69793          	slli	a5,a3,0xc
ffffffffc0205b20:	83b1                	srli	a5,a5,0xc
ffffffffc0205b22:	00091717          	auipc	a4,0x91
ffffffffc0205b26:	d7e73703          	ld	a4,-642(a4) # ffffffffc02968a0 <npage>
ffffffffc0205b2a:	06b2                	slli	a3,a3,0xc
ffffffffc0205b2c:	02e7f863          	bgeu	a5,a4,ffffffffc0205b5c <setup_pgdir+0x6a>
ffffffffc0205b30:	00091417          	auipc	s0,0x91
ffffffffc0205b34:	d8843403          	ld	s0,-632(s0) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205b38:	9436                	add	s0,s0,a3
ffffffffc0205b3a:	6605                	lui	a2,0x1
ffffffffc0205b3c:	00091597          	auipc	a1,0x91
ffffffffc0205b40:	d5c5b583          	ld	a1,-676(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0205b44:	8522                	mv	a0,s0
ffffffffc0205b46:	1d1050ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc0205b4a:	4501                	li	a0,0
ffffffffc0205b4c:	ec80                	sd	s0,24(s1)
ffffffffc0205b4e:	60e2                	ld	ra,24(sp)
ffffffffc0205b50:	6442                	ld	s0,16(sp)
ffffffffc0205b52:	64a2                	ld	s1,8(sp)
ffffffffc0205b54:	6105                	addi	sp,sp,32
ffffffffc0205b56:	8082                	ret
ffffffffc0205b58:	5571                	li	a0,-4
ffffffffc0205b5a:	bfd5                	j	ffffffffc0205b4e <setup_pgdir+0x5c>
ffffffffc0205b5c:	00007617          	auipc	a2,0x7
ffffffffc0205b60:	96c60613          	addi	a2,a2,-1684 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc0205b64:	07100593          	li	a1,113
ffffffffc0205b68:	00007517          	auipc	a0,0x7
ffffffffc0205b6c:	98850513          	addi	a0,a0,-1656 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0205b70:	92ffa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205b74 <proc_run>:
ffffffffc0205b74:	7179                	addi	sp,sp,-48
ffffffffc0205b76:	ec4a                	sd	s2,24(sp)
ffffffffc0205b78:	00091917          	auipc	s2,0x91
ffffffffc0205b7c:	d4890913          	addi	s2,s2,-696 # ffffffffc02968c0 <current>
ffffffffc0205b80:	f026                	sd	s1,32(sp)
ffffffffc0205b82:	00093483          	ld	s1,0(s2)
ffffffffc0205b86:	f406                	sd	ra,40(sp)
ffffffffc0205b88:	e84e                	sd	s3,16(sp)
ffffffffc0205b8a:	02a48a63          	beq	s1,a0,ffffffffc0205bbe <proc_run+0x4a>
ffffffffc0205b8e:	100027f3          	csrr	a5,sstatus
ffffffffc0205b92:	8b89                	andi	a5,a5,2
ffffffffc0205b94:	4981                	li	s3,0
ffffffffc0205b96:	e3a9                	bnez	a5,ffffffffc0205bd8 <proc_run+0x64>
ffffffffc0205b98:	755c                	ld	a5,168(a0)
ffffffffc0205b9a:	577d                	li	a4,-1
ffffffffc0205b9c:	177e                	slli	a4,a4,0x3f
ffffffffc0205b9e:	83b1                	srli	a5,a5,0xc
ffffffffc0205ba0:	00a93023          	sd	a0,0(s2)
ffffffffc0205ba4:	8fd9                	or	a5,a5,a4
ffffffffc0205ba6:	18079073          	csrw	satp,a5
ffffffffc0205baa:	12000073          	sfence.vma
ffffffffc0205bae:	03050593          	addi	a1,a0,48
ffffffffc0205bb2:	03048513          	addi	a0,s1,48
ffffffffc0205bb6:	53e010ef          	jal	ra,ffffffffc02070f4 <switch_to>
ffffffffc0205bba:	00099863          	bnez	s3,ffffffffc0205bca <proc_run+0x56>
ffffffffc0205bbe:	70a2                	ld	ra,40(sp)
ffffffffc0205bc0:	7482                	ld	s1,32(sp)
ffffffffc0205bc2:	6962                	ld	s2,24(sp)
ffffffffc0205bc4:	69c2                	ld	s3,16(sp)
ffffffffc0205bc6:	6145                	addi	sp,sp,48
ffffffffc0205bc8:	8082                	ret
ffffffffc0205bca:	70a2                	ld	ra,40(sp)
ffffffffc0205bcc:	7482                	ld	s1,32(sp)
ffffffffc0205bce:	6962                	ld	s2,24(sp)
ffffffffc0205bd0:	69c2                	ld	s3,16(sp)
ffffffffc0205bd2:	6145                	addi	sp,sp,48
ffffffffc0205bd4:	898fb06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0205bd8:	e42a                	sd	a0,8(sp)
ffffffffc0205bda:	898fb0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205bde:	6522                	ld	a0,8(sp)
ffffffffc0205be0:	4985                	li	s3,1
ffffffffc0205be2:	bf5d                	j	ffffffffc0205b98 <proc_run+0x24>

ffffffffc0205be4 <do_fork>:
ffffffffc0205be4:	7159                	addi	sp,sp,-112
ffffffffc0205be6:	e8ca                	sd	s2,80(sp)
ffffffffc0205be8:	00091917          	auipc	s2,0x91
ffffffffc0205bec:	cf090913          	addi	s2,s2,-784 # ffffffffc02968d8 <nr_process>
ffffffffc0205bf0:	00092783          	lw	a5,0(s2)
ffffffffc0205bf4:	e4ce                	sd	s3,72(sp)
ffffffffc0205bf6:	f486                	sd	ra,104(sp)
ffffffffc0205bf8:	f0a2                	sd	s0,96(sp)
ffffffffc0205bfa:	eca6                	sd	s1,88(sp)
ffffffffc0205bfc:	e0d2                	sd	s4,64(sp)
ffffffffc0205bfe:	fc56                	sd	s5,56(sp)
ffffffffc0205c00:	f85a                	sd	s6,48(sp)
ffffffffc0205c02:	f45e                	sd	s7,40(sp)
ffffffffc0205c04:	f062                	sd	s8,32(sp)
ffffffffc0205c06:	ec66                	sd	s9,24(sp)
ffffffffc0205c08:	e86a                	sd	s10,16(sp)
ffffffffc0205c0a:	e46e                	sd	s11,8(sp)
ffffffffc0205c0c:	6985                	lui	s3,0x1
ffffffffc0205c0e:	3337dc63          	bge	a5,s3,ffffffffc0205f46 <do_fork+0x362>
ffffffffc0205c12:	8a2a                	mv	s4,a0
ffffffffc0205c14:	8aae                	mv	s5,a1
ffffffffc0205c16:	84b2                	mv	s1,a2
ffffffffc0205c18:	dbdff0ef          	jal	ra,ffffffffc02059d4 <alloc_proc>
ffffffffc0205c1c:	842a                	mv	s0,a0
ffffffffc0205c1e:	30050d63          	beqz	a0,ffffffffc0205f38 <do_fork+0x354>
ffffffffc0205c22:	00091b17          	auipc	s6,0x91
ffffffffc0205c26:	c9eb0b13          	addi	s6,s6,-866 # ffffffffc02968c0 <current>
ffffffffc0205c2a:	000b3783          	ld	a5,0(s6)
ffffffffc0205c2e:	0ec7a703          	lw	a4,236(a5)
ffffffffc0205c32:	f11c                	sd	a5,32(a0)
ffffffffc0205c34:	38071d63          	bnez	a4,ffffffffc0205fce <do_fork+0x3ea>
ffffffffc0205c38:	4509                	li	a0,2
ffffffffc0205c3a:	d32fc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205c3e:	2e050a63          	beqz	a0,ffffffffc0205f32 <do_fork+0x34e>
ffffffffc0205c42:	00091c17          	auipc	s8,0x91
ffffffffc0205c46:	c66c0c13          	addi	s8,s8,-922 # ffffffffc02968a8 <pages>
ffffffffc0205c4a:	000c3683          	ld	a3,0(s8)
ffffffffc0205c4e:	0000ab97          	auipc	s7,0xa
ffffffffc0205c52:	bcabbb83          	ld	s7,-1078(s7) # ffffffffc020f818 <nbase>
ffffffffc0205c56:	00091c97          	auipc	s9,0x91
ffffffffc0205c5a:	c4ac8c93          	addi	s9,s9,-950 # ffffffffc02968a0 <npage>
ffffffffc0205c5e:	40d506b3          	sub	a3,a0,a3
ffffffffc0205c62:	8699                	srai	a3,a3,0x6
ffffffffc0205c64:	96de                	add	a3,a3,s7
ffffffffc0205c66:	000cb703          	ld	a4,0(s9)
ffffffffc0205c6a:	00c69793          	slli	a5,a3,0xc
ffffffffc0205c6e:	83b1                	srli	a5,a5,0xc
ffffffffc0205c70:	06b2                	slli	a3,a3,0xc
ffffffffc0205c72:	2ce7ff63          	bgeu	a5,a4,ffffffffc0205f50 <do_fork+0x36c>
ffffffffc0205c76:	000b3703          	ld	a4,0(s6)
ffffffffc0205c7a:	00091d17          	auipc	s10,0x91
ffffffffc0205c7e:	c3ed0d13          	addi	s10,s10,-962 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205c82:	000d3783          	ld	a5,0(s10)
ffffffffc0205c86:	14873d83          	ld	s11,328(a4)
ffffffffc0205c8a:	96be                	add	a3,a3,a5
ffffffffc0205c8c:	e814                	sd	a3,16(s0)
ffffffffc0205c8e:	2e0d8963          	beqz	s11,ffffffffc0205f80 <do_fork+0x39c>
ffffffffc0205c92:	80098993          	addi	s3,s3,-2048 # 800 <_binary_bin_swap_img_size-0x7500>
ffffffffc0205c96:	013a79b3          	and	s3,s4,s3
ffffffffc0205c9a:	1e098063          	beqz	s3,ffffffffc0205e7a <do_fork+0x296>
ffffffffc0205c9e:	010da783          	lw	a5,16(s11)
ffffffffc0205ca2:	02873983          	ld	s3,40(a4)
ffffffffc0205ca6:	2785                	addiw	a5,a5,1
ffffffffc0205ca8:	00fda823          	sw	a5,16(s11)
ffffffffc0205cac:	15b43423          	sd	s11,328(s0)
ffffffffc0205cb0:	02098763          	beqz	s3,ffffffffc0205cde <do_fork+0xfa>
ffffffffc0205cb4:	100a7a13          	andi	s4,s4,256
ffffffffc0205cb8:	1c0a0d63          	beqz	s4,ffffffffc0205e92 <do_fork+0x2ae>
ffffffffc0205cbc:	0309a783          	lw	a5,48(s3)
ffffffffc0205cc0:	0189b683          	ld	a3,24(s3)
ffffffffc0205cc4:	c0200737          	lui	a4,0xc0200
ffffffffc0205cc8:	2785                	addiw	a5,a5,1
ffffffffc0205cca:	02f9a823          	sw	a5,48(s3)
ffffffffc0205cce:	03343423          	sd	s3,40(s0)
ffffffffc0205cd2:	30e6ee63          	bltu	a3,a4,ffffffffc0205fee <do_fork+0x40a>
ffffffffc0205cd6:	000d3783          	ld	a5,0(s10)
ffffffffc0205cda:	8e9d                	sub	a3,a3,a5
ffffffffc0205cdc:	f454                	sd	a3,168(s0)
ffffffffc0205cde:	6818                	ld	a4,16(s0)
ffffffffc0205ce0:	6789                	lui	a5,0x2
ffffffffc0205ce2:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0205ce6:	973e                	add	a4,a4,a5
ffffffffc0205ce8:	8626                	mv	a2,s1
ffffffffc0205cea:	f058                	sd	a4,160(s0)
ffffffffc0205cec:	87ba                	mv	a5,a4
ffffffffc0205cee:	12048893          	addi	a7,s1,288
ffffffffc0205cf2:	00063803          	ld	a6,0(a2)
ffffffffc0205cf6:	6608                	ld	a0,8(a2)
ffffffffc0205cf8:	6a0c                	ld	a1,16(a2)
ffffffffc0205cfa:	6e14                	ld	a3,24(a2)
ffffffffc0205cfc:	0107b023          	sd	a6,0(a5)
ffffffffc0205d00:	e788                	sd	a0,8(a5)
ffffffffc0205d02:	eb8c                	sd	a1,16(a5)
ffffffffc0205d04:	ef94                	sd	a3,24(a5)
ffffffffc0205d06:	02060613          	addi	a2,a2,32
ffffffffc0205d0a:	02078793          	addi	a5,a5,32
ffffffffc0205d0e:	ff1612e3          	bne	a2,a7,ffffffffc0205cf2 <do_fork+0x10e>
ffffffffc0205d12:	04073823          	sd	zero,80(a4) # ffffffffc0200050 <kern_init+0x6>
ffffffffc0205d16:	120a8f63          	beqz	s5,ffffffffc0205e54 <do_fork+0x270>
ffffffffc0205d1a:	01573823          	sd	s5,16(a4)
ffffffffc0205d1e:	00000797          	auipc	a5,0x0
ffffffffc0205d22:	d5078793          	addi	a5,a5,-688 # ffffffffc0205a6e <forkret>
ffffffffc0205d26:	f81c                	sd	a5,48(s0)
ffffffffc0205d28:	fc18                	sd	a4,56(s0)
ffffffffc0205d2a:	100027f3          	csrr	a5,sstatus
ffffffffc0205d2e:	8b89                	andi	a5,a5,2
ffffffffc0205d30:	4981                	li	s3,0
ffffffffc0205d32:	14079063          	bnez	a5,ffffffffc0205e72 <do_fork+0x28e>
ffffffffc0205d36:	0008b817          	auipc	a6,0x8b
ffffffffc0205d3a:	32280813          	addi	a6,a6,802 # ffffffffc0291058 <last_pid.1>
ffffffffc0205d3e:	00082783          	lw	a5,0(a6)
ffffffffc0205d42:	6709                	lui	a4,0x2
ffffffffc0205d44:	0017851b          	addiw	a0,a5,1
ffffffffc0205d48:	00a82023          	sw	a0,0(a6)
ffffffffc0205d4c:	08e55d63          	bge	a0,a4,ffffffffc0205de6 <do_fork+0x202>
ffffffffc0205d50:	0008b317          	auipc	t1,0x8b
ffffffffc0205d54:	30c30313          	addi	t1,t1,780 # ffffffffc029105c <next_safe.0>
ffffffffc0205d58:	00032783          	lw	a5,0(t1)
ffffffffc0205d5c:	00090497          	auipc	s1,0x90
ffffffffc0205d60:	a6448493          	addi	s1,s1,-1436 # ffffffffc02957c0 <proc_list>
ffffffffc0205d64:	08f55963          	bge	a0,a5,ffffffffc0205df6 <do_fork+0x212>
ffffffffc0205d68:	c048                	sw	a0,4(s0)
ffffffffc0205d6a:	45a9                	li	a1,10
ffffffffc0205d6c:	2501                	sext.w	a0,a0
ffffffffc0205d6e:	222050ef          	jal	ra,ffffffffc020af90 <hash32>
ffffffffc0205d72:	02051793          	slli	a5,a0,0x20
ffffffffc0205d76:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205d7a:	0008c797          	auipc	a5,0x8c
ffffffffc0205d7e:	a4678793          	addi	a5,a5,-1466 # ffffffffc02917c0 <hash_list>
ffffffffc0205d82:	953e                	add	a0,a0,a5
ffffffffc0205d84:	650c                	ld	a1,8(a0)
ffffffffc0205d86:	7014                	ld	a3,32(s0)
ffffffffc0205d88:	0d840793          	addi	a5,s0,216
ffffffffc0205d8c:	e19c                	sd	a5,0(a1)
ffffffffc0205d8e:	6490                	ld	a2,8(s1)
ffffffffc0205d90:	e51c                	sd	a5,8(a0)
ffffffffc0205d92:	7af8                	ld	a4,240(a3)
ffffffffc0205d94:	0c840793          	addi	a5,s0,200
ffffffffc0205d98:	f06c                	sd	a1,224(s0)
ffffffffc0205d9a:	ec68                	sd	a0,216(s0)
ffffffffc0205d9c:	e21c                	sd	a5,0(a2)
ffffffffc0205d9e:	e49c                	sd	a5,8(s1)
ffffffffc0205da0:	e870                	sd	a2,208(s0)
ffffffffc0205da2:	e464                	sd	s1,200(s0)
ffffffffc0205da4:	0e043c23          	sd	zero,248(s0)
ffffffffc0205da8:	10e43023          	sd	a4,256(s0)
ffffffffc0205dac:	c311                	beqz	a4,ffffffffc0205db0 <do_fork+0x1cc>
ffffffffc0205dae:	ff60                	sd	s0,248(a4)
ffffffffc0205db0:	00092783          	lw	a5,0(s2)
ffffffffc0205db4:	fae0                	sd	s0,240(a3)
ffffffffc0205db6:	2785                	addiw	a5,a5,1
ffffffffc0205db8:	00f92023          	sw	a5,0(s2)
ffffffffc0205dbc:	10099063          	bnez	s3,ffffffffc0205ebc <do_fork+0x2d8>
ffffffffc0205dc0:	8522                	mv	a0,s0
ffffffffc0205dc2:	4d6010ef          	jal	ra,ffffffffc0207298 <wakeup_proc>
ffffffffc0205dc6:	4048                	lw	a0,4(s0)
ffffffffc0205dc8:	70a6                	ld	ra,104(sp)
ffffffffc0205dca:	7406                	ld	s0,96(sp)
ffffffffc0205dcc:	64e6                	ld	s1,88(sp)
ffffffffc0205dce:	6946                	ld	s2,80(sp)
ffffffffc0205dd0:	69a6                	ld	s3,72(sp)
ffffffffc0205dd2:	6a06                	ld	s4,64(sp)
ffffffffc0205dd4:	7ae2                	ld	s5,56(sp)
ffffffffc0205dd6:	7b42                	ld	s6,48(sp)
ffffffffc0205dd8:	7ba2                	ld	s7,40(sp)
ffffffffc0205dda:	7c02                	ld	s8,32(sp)
ffffffffc0205ddc:	6ce2                	ld	s9,24(sp)
ffffffffc0205dde:	6d42                	ld	s10,16(sp)
ffffffffc0205de0:	6da2                	ld	s11,8(sp)
ffffffffc0205de2:	6165                	addi	sp,sp,112
ffffffffc0205de4:	8082                	ret
ffffffffc0205de6:	4785                	li	a5,1
ffffffffc0205de8:	00f82023          	sw	a5,0(a6)
ffffffffc0205dec:	4505                	li	a0,1
ffffffffc0205dee:	0008b317          	auipc	t1,0x8b
ffffffffc0205df2:	26e30313          	addi	t1,t1,622 # ffffffffc029105c <next_safe.0>
ffffffffc0205df6:	00090497          	auipc	s1,0x90
ffffffffc0205dfa:	9ca48493          	addi	s1,s1,-1590 # ffffffffc02957c0 <proc_list>
ffffffffc0205dfe:	0084be03          	ld	t3,8(s1)
ffffffffc0205e02:	6789                	lui	a5,0x2
ffffffffc0205e04:	00f32023          	sw	a5,0(t1)
ffffffffc0205e08:	86aa                	mv	a3,a0
ffffffffc0205e0a:	4581                	li	a1,0
ffffffffc0205e0c:	6e89                	lui	t4,0x2
ffffffffc0205e0e:	129e0763          	beq	t3,s1,ffffffffc0205f3c <do_fork+0x358>
ffffffffc0205e12:	88ae                	mv	a7,a1
ffffffffc0205e14:	87f2                	mv	a5,t3
ffffffffc0205e16:	6609                	lui	a2,0x2
ffffffffc0205e18:	a811                	j	ffffffffc0205e2c <do_fork+0x248>
ffffffffc0205e1a:	00e6d663          	bge	a3,a4,ffffffffc0205e26 <do_fork+0x242>
ffffffffc0205e1e:	00c75463          	bge	a4,a2,ffffffffc0205e26 <do_fork+0x242>
ffffffffc0205e22:	863a                	mv	a2,a4
ffffffffc0205e24:	4885                	li	a7,1
ffffffffc0205e26:	679c                	ld	a5,8(a5)
ffffffffc0205e28:	00978d63          	beq	a5,s1,ffffffffc0205e42 <do_fork+0x25e>
ffffffffc0205e2c:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_bin_swap_img_size-0x5dc4>
ffffffffc0205e30:	fed715e3          	bne	a4,a3,ffffffffc0205e1a <do_fork+0x236>
ffffffffc0205e34:	2685                	addiw	a3,a3,1
ffffffffc0205e36:	0ac6df63          	bge	a3,a2,ffffffffc0205ef4 <do_fork+0x310>
ffffffffc0205e3a:	679c                	ld	a5,8(a5)
ffffffffc0205e3c:	4585                	li	a1,1
ffffffffc0205e3e:	fe9797e3          	bne	a5,s1,ffffffffc0205e2c <do_fork+0x248>
ffffffffc0205e42:	c581                	beqz	a1,ffffffffc0205e4a <do_fork+0x266>
ffffffffc0205e44:	00d82023          	sw	a3,0(a6)
ffffffffc0205e48:	8536                	mv	a0,a3
ffffffffc0205e4a:	f0088fe3          	beqz	a7,ffffffffc0205d68 <do_fork+0x184>
ffffffffc0205e4e:	00c32023          	sw	a2,0(t1)
ffffffffc0205e52:	bf19                	j	ffffffffc0205d68 <do_fork+0x184>
ffffffffc0205e54:	8aba                	mv	s5,a4
ffffffffc0205e56:	01573823          	sd	s5,16(a4) # 2010 <_binary_bin_swap_img_size-0x5cf0>
ffffffffc0205e5a:	00000797          	auipc	a5,0x0
ffffffffc0205e5e:	c1478793          	addi	a5,a5,-1004 # ffffffffc0205a6e <forkret>
ffffffffc0205e62:	f81c                	sd	a5,48(s0)
ffffffffc0205e64:	fc18                	sd	a4,56(s0)
ffffffffc0205e66:	100027f3          	csrr	a5,sstatus
ffffffffc0205e6a:	8b89                	andi	a5,a5,2
ffffffffc0205e6c:	4981                	li	s3,0
ffffffffc0205e6e:	ec0784e3          	beqz	a5,ffffffffc0205d36 <do_fork+0x152>
ffffffffc0205e72:	e01fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205e76:	4985                	li	s3,1
ffffffffc0205e78:	bd7d                	j	ffffffffc0205d36 <do_fork+0x152>
ffffffffc0205e7a:	b54ff0ef          	jal	ra,ffffffffc02051ce <files_create>
ffffffffc0205e7e:	89aa                	mv	s3,a0
ffffffffc0205e80:	c151                	beqz	a0,ffffffffc0205f04 <do_fork+0x320>
ffffffffc0205e82:	85ee                	mv	a1,s11
ffffffffc0205e84:	c82ff0ef          	jal	ra,ffffffffc0205306 <dup_files>
ffffffffc0205e88:	e93d                	bnez	a0,ffffffffc0205efe <do_fork+0x31a>
ffffffffc0205e8a:	000b3703          	ld	a4,0(s6)
ffffffffc0205e8e:	8dce                	mv	s11,s3
ffffffffc0205e90:	b539                	j	ffffffffc0205c9e <do_fork+0xba>
ffffffffc0205e92:	d77fd0ef          	jal	ra,ffffffffc0203c08 <mm_create>
ffffffffc0205e96:	8a2a                	mv	s4,a0
ffffffffc0205e98:	c519                	beqz	a0,ffffffffc0205ea6 <do_fork+0x2c2>
ffffffffc0205e9a:	c59ff0ef          	jal	ra,ffffffffc0205af2 <setup_pgdir>
ffffffffc0205e9e:	c115                	beqz	a0,ffffffffc0205ec2 <do_fork+0x2de>
ffffffffc0205ea0:	8552                	mv	a0,s4
ffffffffc0205ea2:	eb5fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0205ea6:	14843503          	ld	a0,328(s0)
ffffffffc0205eaa:	cd29                	beqz	a0,ffffffffc0205f04 <do_fork+0x320>
ffffffffc0205eac:	491c                	lw	a5,16(a0)
ffffffffc0205eae:	fff7871b          	addiw	a4,a5,-1
ffffffffc0205eb2:	c918                	sw	a4,16(a0)
ffffffffc0205eb4:	eb21                	bnez	a4,ffffffffc0205f04 <do_fork+0x320>
ffffffffc0205eb6:	b4eff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc0205eba:	a0a9                	j	ffffffffc0205f04 <do_fork+0x320>
ffffffffc0205ebc:	db1fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0205ec0:	b701                	j	ffffffffc0205dc0 <do_fork+0x1dc>
ffffffffc0205ec2:	03898d93          	addi	s11,s3,56
ffffffffc0205ec6:	856e                	mv	a0,s11
ffffffffc0205ec8:	e9cfe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205ecc:	000b3783          	ld	a5,0(s6)
ffffffffc0205ed0:	c781                	beqz	a5,ffffffffc0205ed8 <do_fork+0x2f4>
ffffffffc0205ed2:	43dc                	lw	a5,4(a5)
ffffffffc0205ed4:	04f9a823          	sw	a5,80(s3)
ffffffffc0205ed8:	85ce                	mv	a1,s3
ffffffffc0205eda:	8552                	mv	a0,s4
ffffffffc0205edc:	f7dfd0ef          	jal	ra,ffffffffc0203e58 <dup_mmap>
ffffffffc0205ee0:	8b2a                	mv	s6,a0
ffffffffc0205ee2:	856e                	mv	a0,s11
ffffffffc0205ee4:	e7cfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205ee8:	0409a823          	sw	zero,80(s3)
ffffffffc0205eec:	0a0b1a63          	bnez	s6,ffffffffc0205fa0 <do_fork+0x3bc>
ffffffffc0205ef0:	89d2                	mv	s3,s4
ffffffffc0205ef2:	b3e9                	j	ffffffffc0205cbc <do_fork+0xd8>
ffffffffc0205ef4:	01d6c363          	blt	a3,t4,ffffffffc0205efa <do_fork+0x316>
ffffffffc0205ef8:	4685                	li	a3,1
ffffffffc0205efa:	4585                	li	a1,1
ffffffffc0205efc:	bf09                	j	ffffffffc0205e0e <do_fork+0x22a>
ffffffffc0205efe:	854e                	mv	a0,s3
ffffffffc0205f00:	b04ff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc0205f04:	6814                	ld	a3,16(s0)
ffffffffc0205f06:	c02007b7          	lui	a5,0xc0200
ffffffffc0205f0a:	04f6ef63          	bltu	a3,a5,ffffffffc0205f68 <do_fork+0x384>
ffffffffc0205f0e:	000d3783          	ld	a5,0(s10)
ffffffffc0205f12:	000cb703          	ld	a4,0(s9)
ffffffffc0205f16:	40f687b3          	sub	a5,a3,a5
ffffffffc0205f1a:	83b1                	srli	a5,a5,0xc
ffffffffc0205f1c:	08e7fd63          	bgeu	a5,a4,ffffffffc0205fb6 <do_fork+0x3d2>
ffffffffc0205f20:	000c3503          	ld	a0,0(s8)
ffffffffc0205f24:	417787b3          	sub	a5,a5,s7
ffffffffc0205f28:	079a                	slli	a5,a5,0x6
ffffffffc0205f2a:	4589                	li	a1,2
ffffffffc0205f2c:	953e                	add	a0,a0,a5
ffffffffc0205f2e:	a7cfc0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0205f32:	8522                	mv	a0,s0
ffffffffc0205f34:	90afc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205f38:	5571                	li	a0,-4
ffffffffc0205f3a:	b579                	j	ffffffffc0205dc8 <do_fork+0x1e4>
ffffffffc0205f3c:	c599                	beqz	a1,ffffffffc0205f4a <do_fork+0x366>
ffffffffc0205f3e:	00d82023          	sw	a3,0(a6)
ffffffffc0205f42:	8536                	mv	a0,a3
ffffffffc0205f44:	b515                	j	ffffffffc0205d68 <do_fork+0x184>
ffffffffc0205f46:	556d                	li	a0,-5
ffffffffc0205f48:	b541                	j	ffffffffc0205dc8 <do_fork+0x1e4>
ffffffffc0205f4a:	00082503          	lw	a0,0(a6)
ffffffffc0205f4e:	bd29                	j	ffffffffc0205d68 <do_fork+0x184>
ffffffffc0205f50:	00006617          	auipc	a2,0x6
ffffffffc0205f54:	57860613          	addi	a2,a2,1400 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc0205f58:	07100593          	li	a1,113
ffffffffc0205f5c:	00006517          	auipc	a0,0x6
ffffffffc0205f60:	59450513          	addi	a0,a0,1428 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0205f64:	d3afa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f68:	00006617          	auipc	a2,0x6
ffffffffc0205f6c:	60860613          	addi	a2,a2,1544 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc0205f70:	07700593          	li	a1,119
ffffffffc0205f74:	00006517          	auipc	a0,0x6
ffffffffc0205f78:	57c50513          	addi	a0,a0,1404 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0205f7c:	d22fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f80:	00007697          	auipc	a3,0x7
ffffffffc0205f84:	56068693          	addi	a3,a3,1376 # ffffffffc020d4e0 <CSWTCH.79+0x128>
ffffffffc0205f88:	00006617          	auipc	a2,0x6
ffffffffc0205f8c:	a2060613          	addi	a2,a2,-1504 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0205f90:	1cc00593          	li	a1,460
ffffffffc0205f94:	00007517          	auipc	a0,0x7
ffffffffc0205f98:	53450513          	addi	a0,a0,1332 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0205f9c:	d02fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205fa0:	8552                	mv	a0,s4
ffffffffc0205fa2:	f51fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0205fa6:	018a3503          	ld	a0,24(s4)
ffffffffc0205faa:	ad3ff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0205fae:	8552                	mv	a0,s4
ffffffffc0205fb0:	da7fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0205fb4:	bdcd                	j	ffffffffc0205ea6 <do_fork+0x2c2>
ffffffffc0205fb6:	00006617          	auipc	a2,0x6
ffffffffc0205fba:	5e260613          	addi	a2,a2,1506 # ffffffffc020c598 <default_pmm_manager+0x108>
ffffffffc0205fbe:	06900593          	li	a1,105
ffffffffc0205fc2:	00006517          	auipc	a0,0x6
ffffffffc0205fc6:	52e50513          	addi	a0,a0,1326 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0205fca:	cd4fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205fce:	00007697          	auipc	a3,0x7
ffffffffc0205fd2:	4da68693          	addi	a3,a3,1242 # ffffffffc020d4a8 <CSWTCH.79+0xf0>
ffffffffc0205fd6:	00006617          	auipc	a2,0x6
ffffffffc0205fda:	9d260613          	addi	a2,a2,-1582 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0205fde:	22e00593          	li	a1,558
ffffffffc0205fe2:	00007517          	auipc	a0,0x7
ffffffffc0205fe6:	4e650513          	addi	a0,a0,1254 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0205fea:	cb4fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205fee:	00006617          	auipc	a2,0x6
ffffffffc0205ff2:	58260613          	addi	a2,a2,1410 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc0205ff6:	1ac00593          	li	a1,428
ffffffffc0205ffa:	00007517          	auipc	a0,0x7
ffffffffc0205ffe:	4ce50513          	addi	a0,a0,1230 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206002:	c9cfa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206006 <kernel_thread>:
ffffffffc0206006:	7129                	addi	sp,sp,-320
ffffffffc0206008:	fa22                	sd	s0,304(sp)
ffffffffc020600a:	f626                	sd	s1,296(sp)
ffffffffc020600c:	f24a                	sd	s2,288(sp)
ffffffffc020600e:	84ae                	mv	s1,a1
ffffffffc0206010:	892a                	mv	s2,a0
ffffffffc0206012:	8432                	mv	s0,a2
ffffffffc0206014:	4581                	li	a1,0
ffffffffc0206016:	12000613          	li	a2,288
ffffffffc020601a:	850a                	mv	a0,sp
ffffffffc020601c:	fe06                	sd	ra,312(sp)
ffffffffc020601e:	4a6050ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0206022:	e0ca                	sd	s2,64(sp)
ffffffffc0206024:	e4a6                	sd	s1,72(sp)
ffffffffc0206026:	100027f3          	csrr	a5,sstatus
ffffffffc020602a:	edd7f793          	andi	a5,a5,-291
ffffffffc020602e:	1207e793          	ori	a5,a5,288
ffffffffc0206032:	e23e                	sd	a5,256(sp)
ffffffffc0206034:	860a                	mv	a2,sp
ffffffffc0206036:	10046513          	ori	a0,s0,256
ffffffffc020603a:	00000797          	auipc	a5,0x0
ffffffffc020603e:	99278793          	addi	a5,a5,-1646 # ffffffffc02059cc <kernel_thread_entry>
ffffffffc0206042:	4581                	li	a1,0
ffffffffc0206044:	e63e                	sd	a5,264(sp)
ffffffffc0206046:	b9fff0ef          	jal	ra,ffffffffc0205be4 <do_fork>
ffffffffc020604a:	70f2                	ld	ra,312(sp)
ffffffffc020604c:	7452                	ld	s0,304(sp)
ffffffffc020604e:	74b2                	ld	s1,296(sp)
ffffffffc0206050:	7912                	ld	s2,288(sp)
ffffffffc0206052:	6131                	addi	sp,sp,320
ffffffffc0206054:	8082                	ret

ffffffffc0206056 <do_exit>:
ffffffffc0206056:	7179                	addi	sp,sp,-48
ffffffffc0206058:	f022                	sd	s0,32(sp)
ffffffffc020605a:	00091417          	auipc	s0,0x91
ffffffffc020605e:	86640413          	addi	s0,s0,-1946 # ffffffffc02968c0 <current>
ffffffffc0206062:	601c                	ld	a5,0(s0)
ffffffffc0206064:	f406                	sd	ra,40(sp)
ffffffffc0206066:	ec26                	sd	s1,24(sp)
ffffffffc0206068:	e84a                	sd	s2,16(sp)
ffffffffc020606a:	e44e                	sd	s3,8(sp)
ffffffffc020606c:	e052                	sd	s4,0(sp)
ffffffffc020606e:	00091717          	auipc	a4,0x91
ffffffffc0206072:	85a73703          	ld	a4,-1958(a4) # ffffffffc02968c8 <idleproc>
ffffffffc0206076:	0ee78763          	beq	a5,a4,ffffffffc0206164 <do_exit+0x10e>
ffffffffc020607a:	00091497          	auipc	s1,0x91
ffffffffc020607e:	85648493          	addi	s1,s1,-1962 # ffffffffc02968d0 <initproc>
ffffffffc0206082:	6098                	ld	a4,0(s1)
ffffffffc0206084:	10e78763          	beq	a5,a4,ffffffffc0206192 <do_exit+0x13c>
ffffffffc0206088:	0287b983          	ld	s3,40(a5)
ffffffffc020608c:	892a                	mv	s2,a0
ffffffffc020608e:	02098e63          	beqz	s3,ffffffffc02060ca <do_exit+0x74>
ffffffffc0206092:	00090797          	auipc	a5,0x90
ffffffffc0206096:	7fe7b783          	ld	a5,2046(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc020609a:	577d                	li	a4,-1
ffffffffc020609c:	177e                	slli	a4,a4,0x3f
ffffffffc020609e:	83b1                	srli	a5,a5,0xc
ffffffffc02060a0:	8fd9                	or	a5,a5,a4
ffffffffc02060a2:	18079073          	csrw	satp,a5
ffffffffc02060a6:	0309a783          	lw	a5,48(s3)
ffffffffc02060aa:	fff7871b          	addiw	a4,a5,-1
ffffffffc02060ae:	02e9a823          	sw	a4,48(s3)
ffffffffc02060b2:	c769                	beqz	a4,ffffffffc020617c <do_exit+0x126>
ffffffffc02060b4:	601c                	ld	a5,0(s0)
ffffffffc02060b6:	1487b503          	ld	a0,328(a5)
ffffffffc02060ba:	0207b423          	sd	zero,40(a5)
ffffffffc02060be:	c511                	beqz	a0,ffffffffc02060ca <do_exit+0x74>
ffffffffc02060c0:	491c                	lw	a5,16(a0)
ffffffffc02060c2:	fff7871b          	addiw	a4,a5,-1
ffffffffc02060c6:	c918                	sw	a4,16(a0)
ffffffffc02060c8:	cb59                	beqz	a4,ffffffffc020615e <do_exit+0x108>
ffffffffc02060ca:	601c                	ld	a5,0(s0)
ffffffffc02060cc:	470d                	li	a4,3
ffffffffc02060ce:	c398                	sw	a4,0(a5)
ffffffffc02060d0:	0f27a423          	sw	s2,232(a5)
ffffffffc02060d4:	100027f3          	csrr	a5,sstatus
ffffffffc02060d8:	8b89                	andi	a5,a5,2
ffffffffc02060da:	4a01                	li	s4,0
ffffffffc02060dc:	e7f9                	bnez	a5,ffffffffc02061aa <do_exit+0x154>
ffffffffc02060de:	6018                	ld	a4,0(s0)
ffffffffc02060e0:	800007b7          	lui	a5,0x80000
ffffffffc02060e4:	0785                	addi	a5,a5,1
ffffffffc02060e6:	7308                	ld	a0,32(a4)
ffffffffc02060e8:	0ec52703          	lw	a4,236(a0)
ffffffffc02060ec:	0cf70363          	beq	a4,a5,ffffffffc02061b2 <do_exit+0x15c>
ffffffffc02060f0:	6018                	ld	a4,0(s0)
ffffffffc02060f2:	7b7c                	ld	a5,240(a4)
ffffffffc02060f4:	c3a1                	beqz	a5,ffffffffc0206134 <do_exit+0xde>
ffffffffc02060f6:	800009b7          	lui	s3,0x80000
ffffffffc02060fa:	490d                	li	s2,3
ffffffffc02060fc:	0985                	addi	s3,s3,1
ffffffffc02060fe:	a021                	j	ffffffffc0206106 <do_exit+0xb0>
ffffffffc0206100:	6018                	ld	a4,0(s0)
ffffffffc0206102:	7b7c                	ld	a5,240(a4)
ffffffffc0206104:	cb85                	beqz	a5,ffffffffc0206134 <do_exit+0xde>
ffffffffc0206106:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_bin_sfs_img_size+0xffffffff7ff8ae00>
ffffffffc020610a:	6088                	ld	a0,0(s1)
ffffffffc020610c:	fb74                	sd	a3,240(a4)
ffffffffc020610e:	7978                	ld	a4,240(a0)
ffffffffc0206110:	0e07bc23          	sd	zero,248(a5)
ffffffffc0206114:	10e7b023          	sd	a4,256(a5)
ffffffffc0206118:	c311                	beqz	a4,ffffffffc020611c <do_exit+0xc6>
ffffffffc020611a:	ff7c                	sd	a5,248(a4)
ffffffffc020611c:	4398                	lw	a4,0(a5)
ffffffffc020611e:	f388                	sd	a0,32(a5)
ffffffffc0206120:	f97c                	sd	a5,240(a0)
ffffffffc0206122:	fd271fe3          	bne	a4,s2,ffffffffc0206100 <do_exit+0xaa>
ffffffffc0206126:	0ec52783          	lw	a5,236(a0)
ffffffffc020612a:	fd379be3          	bne	a5,s3,ffffffffc0206100 <do_exit+0xaa>
ffffffffc020612e:	16a010ef          	jal	ra,ffffffffc0207298 <wakeup_proc>
ffffffffc0206132:	b7f9                	j	ffffffffc0206100 <do_exit+0xaa>
ffffffffc0206134:	020a1263          	bnez	s4,ffffffffc0206158 <do_exit+0x102>
ffffffffc0206138:	212010ef          	jal	ra,ffffffffc020734a <schedule>
ffffffffc020613c:	601c                	ld	a5,0(s0)
ffffffffc020613e:	00007617          	auipc	a2,0x7
ffffffffc0206142:	3da60613          	addi	a2,a2,986 # ffffffffc020d518 <CSWTCH.79+0x160>
ffffffffc0206146:	29600593          	li	a1,662
ffffffffc020614a:	43d4                	lw	a3,4(a5)
ffffffffc020614c:	00007517          	auipc	a0,0x7
ffffffffc0206150:	37c50513          	addi	a0,a0,892 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206154:	b4afa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206158:	b15fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020615c:	bff1                	j	ffffffffc0206138 <do_exit+0xe2>
ffffffffc020615e:	8a6ff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc0206162:	b7a5                	j	ffffffffc02060ca <do_exit+0x74>
ffffffffc0206164:	00007617          	auipc	a2,0x7
ffffffffc0206168:	39460613          	addi	a2,a2,916 # ffffffffc020d4f8 <CSWTCH.79+0x140>
ffffffffc020616c:	26100593          	li	a1,609
ffffffffc0206170:	00007517          	auipc	a0,0x7
ffffffffc0206174:	35850513          	addi	a0,a0,856 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206178:	b26fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020617c:	854e                	mv	a0,s3
ffffffffc020617e:	d75fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206182:	0189b503          	ld	a0,24(s3) # ffffffff80000018 <_binary_bin_sfs_img_size+0xffffffff7ff8ad18>
ffffffffc0206186:	8f7ff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc020618a:	854e                	mv	a0,s3
ffffffffc020618c:	bcbfd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206190:	b715                	j	ffffffffc02060b4 <do_exit+0x5e>
ffffffffc0206192:	00007617          	auipc	a2,0x7
ffffffffc0206196:	37660613          	addi	a2,a2,886 # ffffffffc020d508 <CSWTCH.79+0x150>
ffffffffc020619a:	26500593          	li	a1,613
ffffffffc020619e:	00007517          	auipc	a0,0x7
ffffffffc02061a2:	32a50513          	addi	a0,a0,810 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc02061a6:	af8fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02061aa:	ac9fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02061ae:	4a05                	li	s4,1
ffffffffc02061b0:	b73d                	j	ffffffffc02060de <do_exit+0x88>
ffffffffc02061b2:	0e6010ef          	jal	ra,ffffffffc0207298 <wakeup_proc>
ffffffffc02061b6:	bf2d                	j	ffffffffc02060f0 <do_exit+0x9a>

ffffffffc02061b8 <do_wait.part.0>:
ffffffffc02061b8:	715d                	addi	sp,sp,-80
ffffffffc02061ba:	f84a                	sd	s2,48(sp)
ffffffffc02061bc:	f44e                	sd	s3,40(sp)
ffffffffc02061be:	80000937          	lui	s2,0x80000
ffffffffc02061c2:	6989                	lui	s3,0x2
ffffffffc02061c4:	fc26                	sd	s1,56(sp)
ffffffffc02061c6:	f052                	sd	s4,32(sp)
ffffffffc02061c8:	ec56                	sd	s5,24(sp)
ffffffffc02061ca:	e85a                	sd	s6,16(sp)
ffffffffc02061cc:	e45e                	sd	s7,8(sp)
ffffffffc02061ce:	e486                	sd	ra,72(sp)
ffffffffc02061d0:	e0a2                	sd	s0,64(sp)
ffffffffc02061d2:	84aa                	mv	s1,a0
ffffffffc02061d4:	8a2e                	mv	s4,a1
ffffffffc02061d6:	00090b97          	auipc	s7,0x90
ffffffffc02061da:	6eab8b93          	addi	s7,s7,1770 # ffffffffc02968c0 <current>
ffffffffc02061de:	00050b1b          	sext.w	s6,a0
ffffffffc02061e2:	fff50a9b          	addiw	s5,a0,-1
ffffffffc02061e6:	19f9                	addi	s3,s3,-2
ffffffffc02061e8:	0905                	addi	s2,s2,1
ffffffffc02061ea:	ccbd                	beqz	s1,ffffffffc0206268 <do_wait.part.0+0xb0>
ffffffffc02061ec:	0359e863          	bltu	s3,s5,ffffffffc020621c <do_wait.part.0+0x64>
ffffffffc02061f0:	45a9                	li	a1,10
ffffffffc02061f2:	855a                	mv	a0,s6
ffffffffc02061f4:	59d040ef          	jal	ra,ffffffffc020af90 <hash32>
ffffffffc02061f8:	02051793          	slli	a5,a0,0x20
ffffffffc02061fc:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0206200:	0008b797          	auipc	a5,0x8b
ffffffffc0206204:	5c078793          	addi	a5,a5,1472 # ffffffffc02917c0 <hash_list>
ffffffffc0206208:	953e                	add	a0,a0,a5
ffffffffc020620a:	842a                	mv	s0,a0
ffffffffc020620c:	a029                	j	ffffffffc0206216 <do_wait.part.0+0x5e>
ffffffffc020620e:	f2c42783          	lw	a5,-212(s0)
ffffffffc0206212:	02978163          	beq	a5,s1,ffffffffc0206234 <do_wait.part.0+0x7c>
ffffffffc0206216:	6400                	ld	s0,8(s0)
ffffffffc0206218:	fe851be3          	bne	a0,s0,ffffffffc020620e <do_wait.part.0+0x56>
ffffffffc020621c:	5579                	li	a0,-2
ffffffffc020621e:	60a6                	ld	ra,72(sp)
ffffffffc0206220:	6406                	ld	s0,64(sp)
ffffffffc0206222:	74e2                	ld	s1,56(sp)
ffffffffc0206224:	7942                	ld	s2,48(sp)
ffffffffc0206226:	79a2                	ld	s3,40(sp)
ffffffffc0206228:	7a02                	ld	s4,32(sp)
ffffffffc020622a:	6ae2                	ld	s5,24(sp)
ffffffffc020622c:	6b42                	ld	s6,16(sp)
ffffffffc020622e:	6ba2                	ld	s7,8(sp)
ffffffffc0206230:	6161                	addi	sp,sp,80
ffffffffc0206232:	8082                	ret
ffffffffc0206234:	000bb683          	ld	a3,0(s7)
ffffffffc0206238:	f4843783          	ld	a5,-184(s0)
ffffffffc020623c:	fed790e3          	bne	a5,a3,ffffffffc020621c <do_wait.part.0+0x64>
ffffffffc0206240:	f2842703          	lw	a4,-216(s0)
ffffffffc0206244:	478d                	li	a5,3
ffffffffc0206246:	0ef70b63          	beq	a4,a5,ffffffffc020633c <do_wait.part.0+0x184>
ffffffffc020624a:	4785                	li	a5,1
ffffffffc020624c:	c29c                	sw	a5,0(a3)
ffffffffc020624e:	0f26a623          	sw	s2,236(a3)
ffffffffc0206252:	0f8010ef          	jal	ra,ffffffffc020734a <schedule>
ffffffffc0206256:	000bb783          	ld	a5,0(s7)
ffffffffc020625a:	0b07a783          	lw	a5,176(a5)
ffffffffc020625e:	8b85                	andi	a5,a5,1
ffffffffc0206260:	d7c9                	beqz	a5,ffffffffc02061ea <do_wait.part.0+0x32>
ffffffffc0206262:	555d                	li	a0,-9
ffffffffc0206264:	df3ff0ef          	jal	ra,ffffffffc0206056 <do_exit>
ffffffffc0206268:	000bb683          	ld	a3,0(s7)
ffffffffc020626c:	7ae0                	ld	s0,240(a3)
ffffffffc020626e:	d45d                	beqz	s0,ffffffffc020621c <do_wait.part.0+0x64>
ffffffffc0206270:	470d                	li	a4,3
ffffffffc0206272:	a021                	j	ffffffffc020627a <do_wait.part.0+0xc2>
ffffffffc0206274:	10043403          	ld	s0,256(s0)
ffffffffc0206278:	d869                	beqz	s0,ffffffffc020624a <do_wait.part.0+0x92>
ffffffffc020627a:	401c                	lw	a5,0(s0)
ffffffffc020627c:	fee79ce3          	bne	a5,a4,ffffffffc0206274 <do_wait.part.0+0xbc>
ffffffffc0206280:	00090797          	auipc	a5,0x90
ffffffffc0206284:	6487b783          	ld	a5,1608(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0206288:	0c878963          	beq	a5,s0,ffffffffc020635a <do_wait.part.0+0x1a2>
ffffffffc020628c:	00090797          	auipc	a5,0x90
ffffffffc0206290:	6447b783          	ld	a5,1604(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206294:	0cf40363          	beq	s0,a5,ffffffffc020635a <do_wait.part.0+0x1a2>
ffffffffc0206298:	000a0663          	beqz	s4,ffffffffc02062a4 <do_wait.part.0+0xec>
ffffffffc020629c:	0e842783          	lw	a5,232(s0)
ffffffffc02062a0:	00fa2023          	sw	a5,0(s4)
ffffffffc02062a4:	100027f3          	csrr	a5,sstatus
ffffffffc02062a8:	8b89                	andi	a5,a5,2
ffffffffc02062aa:	4581                	li	a1,0
ffffffffc02062ac:	e7c1                	bnez	a5,ffffffffc0206334 <do_wait.part.0+0x17c>
ffffffffc02062ae:	6c70                	ld	a2,216(s0)
ffffffffc02062b0:	7074                	ld	a3,224(s0)
ffffffffc02062b2:	10043703          	ld	a4,256(s0)
ffffffffc02062b6:	7c7c                	ld	a5,248(s0)
ffffffffc02062b8:	e614                	sd	a3,8(a2)
ffffffffc02062ba:	e290                	sd	a2,0(a3)
ffffffffc02062bc:	6470                	ld	a2,200(s0)
ffffffffc02062be:	6874                	ld	a3,208(s0)
ffffffffc02062c0:	e614                	sd	a3,8(a2)
ffffffffc02062c2:	e290                	sd	a2,0(a3)
ffffffffc02062c4:	c319                	beqz	a4,ffffffffc02062ca <do_wait.part.0+0x112>
ffffffffc02062c6:	ff7c                	sd	a5,248(a4)
ffffffffc02062c8:	7c7c                	ld	a5,248(s0)
ffffffffc02062ca:	c3b5                	beqz	a5,ffffffffc020632e <do_wait.part.0+0x176>
ffffffffc02062cc:	10e7b023          	sd	a4,256(a5)
ffffffffc02062d0:	00090717          	auipc	a4,0x90
ffffffffc02062d4:	60870713          	addi	a4,a4,1544 # ffffffffc02968d8 <nr_process>
ffffffffc02062d8:	431c                	lw	a5,0(a4)
ffffffffc02062da:	37fd                	addiw	a5,a5,-1
ffffffffc02062dc:	c31c                	sw	a5,0(a4)
ffffffffc02062de:	e5a9                	bnez	a1,ffffffffc0206328 <do_wait.part.0+0x170>
ffffffffc02062e0:	6814                	ld	a3,16(s0)
ffffffffc02062e2:	c02007b7          	lui	a5,0xc0200
ffffffffc02062e6:	04f6ee63          	bltu	a3,a5,ffffffffc0206342 <do_wait.part.0+0x18a>
ffffffffc02062ea:	00090797          	auipc	a5,0x90
ffffffffc02062ee:	5ce7b783          	ld	a5,1486(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02062f2:	8e9d                	sub	a3,a3,a5
ffffffffc02062f4:	82b1                	srli	a3,a3,0xc
ffffffffc02062f6:	00090797          	auipc	a5,0x90
ffffffffc02062fa:	5aa7b783          	ld	a5,1450(a5) # ffffffffc02968a0 <npage>
ffffffffc02062fe:	06f6fa63          	bgeu	a3,a5,ffffffffc0206372 <do_wait.part.0+0x1ba>
ffffffffc0206302:	00009517          	auipc	a0,0x9
ffffffffc0206306:	51653503          	ld	a0,1302(a0) # ffffffffc020f818 <nbase>
ffffffffc020630a:	8e89                	sub	a3,a3,a0
ffffffffc020630c:	069a                	slli	a3,a3,0x6
ffffffffc020630e:	00090517          	auipc	a0,0x90
ffffffffc0206312:	59a53503          	ld	a0,1434(a0) # ffffffffc02968a8 <pages>
ffffffffc0206316:	9536                	add	a0,a0,a3
ffffffffc0206318:	4589                	li	a1,2
ffffffffc020631a:	e91fb0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020631e:	8522                	mv	a0,s0
ffffffffc0206320:	d1ffb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206324:	4501                	li	a0,0
ffffffffc0206326:	bde5                	j	ffffffffc020621e <do_wait.part.0+0x66>
ffffffffc0206328:	945fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020632c:	bf55                	j	ffffffffc02062e0 <do_wait.part.0+0x128>
ffffffffc020632e:	701c                	ld	a5,32(s0)
ffffffffc0206330:	fbf8                	sd	a4,240(a5)
ffffffffc0206332:	bf79                	j	ffffffffc02062d0 <do_wait.part.0+0x118>
ffffffffc0206334:	93ffa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0206338:	4585                	li	a1,1
ffffffffc020633a:	bf95                	j	ffffffffc02062ae <do_wait.part.0+0xf6>
ffffffffc020633c:	f2840413          	addi	s0,s0,-216
ffffffffc0206340:	b781                	j	ffffffffc0206280 <do_wait.part.0+0xc8>
ffffffffc0206342:	00006617          	auipc	a2,0x6
ffffffffc0206346:	22e60613          	addi	a2,a2,558 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc020634a:	07700593          	li	a1,119
ffffffffc020634e:	00006517          	auipc	a0,0x6
ffffffffc0206352:	1a250513          	addi	a0,a0,418 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0206356:	948fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020635a:	00007617          	auipc	a2,0x7
ffffffffc020635e:	1de60613          	addi	a2,a2,478 # ffffffffc020d538 <CSWTCH.79+0x180>
ffffffffc0206362:	44a00593          	li	a1,1098
ffffffffc0206366:	00007517          	auipc	a0,0x7
ffffffffc020636a:	16250513          	addi	a0,a0,354 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc020636e:	930fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206372:	00006617          	auipc	a2,0x6
ffffffffc0206376:	22660613          	addi	a2,a2,550 # ffffffffc020c598 <default_pmm_manager+0x108>
ffffffffc020637a:	06900593          	li	a1,105
ffffffffc020637e:	00006517          	auipc	a0,0x6
ffffffffc0206382:	17250513          	addi	a0,a0,370 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0206386:	918fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020638a <init_main>:
ffffffffc020638a:	1141                	addi	sp,sp,-16
ffffffffc020638c:	00007517          	auipc	a0,0x7
ffffffffc0206390:	1cc50513          	addi	a0,a0,460 # ffffffffc020d558 <CSWTCH.79+0x1a0>
ffffffffc0206394:	e406                	sd	ra,8(sp)
ffffffffc0206396:	724010ef          	jal	ra,ffffffffc0207aba <vfs_set_bootfs>
ffffffffc020639a:	e179                	bnez	a0,ffffffffc0206460 <init_main+0xd6>
ffffffffc020639c:	e4ffb0ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc02063a0:	bebfb0ef          	jal	ra,ffffffffc0201f8a <kallocated>
ffffffffc02063a4:	4601                	li	a2,0
ffffffffc02063a6:	4581                	li	a1,0
ffffffffc02063a8:	00001517          	auipc	a0,0x1
ffffffffc02063ac:	94a50513          	addi	a0,a0,-1718 # ffffffffc0206cf2 <user_main>
ffffffffc02063b0:	c57ff0ef          	jal	ra,ffffffffc0206006 <kernel_thread>
ffffffffc02063b4:	00a04563          	bgtz	a0,ffffffffc02063be <init_main+0x34>
ffffffffc02063b8:	a841                	j	ffffffffc0206448 <init_main+0xbe>
ffffffffc02063ba:	791000ef          	jal	ra,ffffffffc020734a <schedule>
ffffffffc02063be:	4581                	li	a1,0
ffffffffc02063c0:	4501                	li	a0,0
ffffffffc02063c2:	df7ff0ef          	jal	ra,ffffffffc02061b8 <do_wait.part.0>
ffffffffc02063c6:	d975                	beqz	a0,ffffffffc02063ba <init_main+0x30>
ffffffffc02063c8:	df7fe0ef          	jal	ra,ffffffffc02051be <fs_cleanup>
ffffffffc02063cc:	00007517          	auipc	a0,0x7
ffffffffc02063d0:	1d450513          	addi	a0,a0,468 # ffffffffc020d5a0 <CSWTCH.79+0x1e8>
ffffffffc02063d4:	dd3f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02063d8:	00090797          	auipc	a5,0x90
ffffffffc02063dc:	4f87b783          	ld	a5,1272(a5) # ffffffffc02968d0 <initproc>
ffffffffc02063e0:	7bf8                	ld	a4,240(a5)
ffffffffc02063e2:	e339                	bnez	a4,ffffffffc0206428 <init_main+0x9e>
ffffffffc02063e4:	7ff8                	ld	a4,248(a5)
ffffffffc02063e6:	e329                	bnez	a4,ffffffffc0206428 <init_main+0x9e>
ffffffffc02063e8:	1007b703          	ld	a4,256(a5)
ffffffffc02063ec:	ef15                	bnez	a4,ffffffffc0206428 <init_main+0x9e>
ffffffffc02063ee:	00090697          	auipc	a3,0x90
ffffffffc02063f2:	4ea6a683          	lw	a3,1258(a3) # ffffffffc02968d8 <nr_process>
ffffffffc02063f6:	4709                	li	a4,2
ffffffffc02063f8:	0ce69163          	bne	a3,a4,ffffffffc02064ba <init_main+0x130>
ffffffffc02063fc:	0008f717          	auipc	a4,0x8f
ffffffffc0206400:	3c470713          	addi	a4,a4,964 # ffffffffc02957c0 <proc_list>
ffffffffc0206404:	6714                	ld	a3,8(a4)
ffffffffc0206406:	0c878793          	addi	a5,a5,200
ffffffffc020640a:	08d79863          	bne	a5,a3,ffffffffc020649a <init_main+0x110>
ffffffffc020640e:	6318                	ld	a4,0(a4)
ffffffffc0206410:	06e79563          	bne	a5,a4,ffffffffc020647a <init_main+0xf0>
ffffffffc0206414:	00007517          	auipc	a0,0x7
ffffffffc0206418:	27450513          	addi	a0,a0,628 # ffffffffc020d688 <CSWTCH.79+0x2d0>
ffffffffc020641c:	d8bf90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206420:	60a2                	ld	ra,8(sp)
ffffffffc0206422:	4501                	li	a0,0
ffffffffc0206424:	0141                	addi	sp,sp,16
ffffffffc0206426:	8082                	ret
ffffffffc0206428:	00007697          	auipc	a3,0x7
ffffffffc020642c:	1a068693          	addi	a3,a3,416 # ffffffffc020d5c8 <CSWTCH.79+0x210>
ffffffffc0206430:	00005617          	auipc	a2,0x5
ffffffffc0206434:	57860613          	addi	a2,a2,1400 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0206438:	4c000593          	li	a1,1216
ffffffffc020643c:	00007517          	auipc	a0,0x7
ffffffffc0206440:	08c50513          	addi	a0,a0,140 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206444:	85afa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206448:	00007617          	auipc	a2,0x7
ffffffffc020644c:	13860613          	addi	a2,a2,312 # ffffffffc020d580 <CSWTCH.79+0x1c8>
ffffffffc0206450:	4b300593          	li	a1,1203
ffffffffc0206454:	00007517          	auipc	a0,0x7
ffffffffc0206458:	07450513          	addi	a0,a0,116 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc020645c:	842fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206460:	86aa                	mv	a3,a0
ffffffffc0206462:	00007617          	auipc	a2,0x7
ffffffffc0206466:	0fe60613          	addi	a2,a2,254 # ffffffffc020d560 <CSWTCH.79+0x1a8>
ffffffffc020646a:	4ab00593          	li	a1,1195
ffffffffc020646e:	00007517          	auipc	a0,0x7
ffffffffc0206472:	05a50513          	addi	a0,a0,90 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206476:	828fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020647a:	00007697          	auipc	a3,0x7
ffffffffc020647e:	1de68693          	addi	a3,a3,478 # ffffffffc020d658 <CSWTCH.79+0x2a0>
ffffffffc0206482:	00005617          	auipc	a2,0x5
ffffffffc0206486:	52660613          	addi	a2,a2,1318 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020648a:	4c300593          	li	a1,1219
ffffffffc020648e:	00007517          	auipc	a0,0x7
ffffffffc0206492:	03a50513          	addi	a0,a0,58 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206496:	808fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020649a:	00007697          	auipc	a3,0x7
ffffffffc020649e:	18e68693          	addi	a3,a3,398 # ffffffffc020d628 <CSWTCH.79+0x270>
ffffffffc02064a2:	00005617          	auipc	a2,0x5
ffffffffc02064a6:	50660613          	addi	a2,a2,1286 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02064aa:	4c200593          	li	a1,1218
ffffffffc02064ae:	00007517          	auipc	a0,0x7
ffffffffc02064b2:	01a50513          	addi	a0,a0,26 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc02064b6:	fe9f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02064ba:	00007697          	auipc	a3,0x7
ffffffffc02064be:	15e68693          	addi	a3,a3,350 # ffffffffc020d618 <CSWTCH.79+0x260>
ffffffffc02064c2:	00005617          	auipc	a2,0x5
ffffffffc02064c6:	4e660613          	addi	a2,a2,1254 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02064ca:	4c100593          	li	a1,1217
ffffffffc02064ce:	00007517          	auipc	a0,0x7
ffffffffc02064d2:	ffa50513          	addi	a0,a0,-6 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc02064d6:	fc9f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02064da <do_execve>:
ffffffffc02064da:	d9010113          	addi	sp,sp,-624
ffffffffc02064de:	25313423          	sd	s3,584(sp)
ffffffffc02064e2:	00090997          	auipc	s3,0x90
ffffffffc02064e6:	3de98993          	addi	s3,s3,990 # ffffffffc02968c0 <current>
ffffffffc02064ea:	0009b683          	ld	a3,0(s3)
ffffffffc02064ee:	25413023          	sd	s4,576(sp)
ffffffffc02064f2:	fff5871b          	addiw	a4,a1,-1
ffffffffc02064f6:	0286ba03          	ld	s4,40(a3)
ffffffffc02064fa:	0005869b          	sext.w	a3,a1
ffffffffc02064fe:	26113423          	sd	ra,616(sp)
ffffffffc0206502:	26813023          	sd	s0,608(sp)
ffffffffc0206506:	24913c23          	sd	s1,600(sp)
ffffffffc020650a:	25213823          	sd	s2,592(sp)
ffffffffc020650e:	23513c23          	sd	s5,568(sp)
ffffffffc0206512:	23613823          	sd	s6,560(sp)
ffffffffc0206516:	23713423          	sd	s7,552(sp)
ffffffffc020651a:	23813023          	sd	s8,544(sp)
ffffffffc020651e:	21913c23          	sd	s9,536(sp)
ffffffffc0206522:	21a13823          	sd	s10,528(sp)
ffffffffc0206526:	21b13423          	sd	s11,520(sp)
ffffffffc020652a:	c83a                	sw	a4,16(sp)
ffffffffc020652c:	47fd                	li	a5,31
ffffffffc020652e:	ec36                	sd	a3,24(sp)
ffffffffc0206530:	64e7e263          	bltu	a5,a4,ffffffffc0206b74 <do_execve+0x69a>
ffffffffc0206534:	842e                	mv	s0,a1
ffffffffc0206536:	84aa                	mv	s1,a0
ffffffffc0206538:	8b32                	mv	s6,a2
ffffffffc020653a:	4581                	li	a1,0
ffffffffc020653c:	4641                	li	a2,16
ffffffffc020653e:	18a8                	addi	a0,sp,120
ffffffffc0206540:	785040ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0206544:	000a0c63          	beqz	s4,ffffffffc020655c <do_execve+0x82>
ffffffffc0206548:	038a0513          	addi	a0,s4,56
ffffffffc020654c:	818fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0206550:	0009b783          	ld	a5,0(s3)
ffffffffc0206554:	c781                	beqz	a5,ffffffffc020655c <do_execve+0x82>
ffffffffc0206556:	43dc                	lw	a5,4(a5)
ffffffffc0206558:	04fa2823          	sw	a5,80(s4)
ffffffffc020655c:	1a048d63          	beqz	s1,ffffffffc0206716 <do_execve+0x23c>
ffffffffc0206560:	46c1                	li	a3,16
ffffffffc0206562:	8626                	mv	a2,s1
ffffffffc0206564:	18ac                	addi	a1,sp,120
ffffffffc0206566:	8552                	mv	a0,s4
ffffffffc0206568:	e25fd0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc020656c:	6a050263          	beqz	a0,ffffffffc0206c10 <do_execve+0x736>
ffffffffc0206570:	00341c93          	slli	s9,s0,0x3
ffffffffc0206574:	4681                	li	a3,0
ffffffffc0206576:	8666                	mv	a2,s9
ffffffffc0206578:	85da                	mv	a1,s6
ffffffffc020657a:	8552                	mv	a0,s4
ffffffffc020657c:	d17fd0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0206580:	895a                	mv	s2,s6
ffffffffc0206582:	68050363          	beqz	a0,ffffffffc0206c08 <do_execve+0x72e>
ffffffffc0206586:	10010c13          	addi	s8,sp,256
ffffffffc020658a:	8ae2                	mv	s5,s8
ffffffffc020658c:	4481                	li	s1,0
ffffffffc020658e:	6505                	lui	a0,0x1
ffffffffc0206590:	9fffb0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0206594:	8baa                	mv	s7,a0
ffffffffc0206596:	0e050d63          	beqz	a0,ffffffffc0206690 <do_execve+0x1b6>
ffffffffc020659a:	00093603          	ld	a2,0(s2) # ffffffff80000000 <_binary_bin_sfs_img_size+0xffffffff7ff8ad00>
ffffffffc020659e:	85aa                	mv	a1,a0
ffffffffc02065a0:	6685                	lui	a3,0x1
ffffffffc02065a2:	8552                	mv	a0,s4
ffffffffc02065a4:	de9fd0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc02065a8:	16050263          	beqz	a0,ffffffffc020670c <do_execve+0x232>
ffffffffc02065ac:	017ab023          	sd	s7,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc02065b0:	2485                	addiw	s1,s1,1
ffffffffc02065b2:	0aa1                	addi	s5,s5,8
ffffffffc02065b4:	0921                	addi	s2,s2,8
ffffffffc02065b6:	fc941ce3          	bne	s0,s1,ffffffffc020658e <do_execve+0xb4>
ffffffffc02065ba:	000b3903          	ld	s2,0(s6)
ffffffffc02065be:	080a0c63          	beqz	s4,ffffffffc0206656 <do_execve+0x17c>
ffffffffc02065c2:	038a0513          	addi	a0,s4,56
ffffffffc02065c6:	f9bfd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02065ca:	0009b783          	ld	a5,0(s3)
ffffffffc02065ce:	040a2823          	sw	zero,80(s4)
ffffffffc02065d2:	1487b503          	ld	a0,328(a5)
ffffffffc02065d6:	cc5fe0ef          	jal	ra,ffffffffc020529a <files_closeall>
ffffffffc02065da:	4581                	li	a1,0
ffffffffc02065dc:	854a                	mv	a0,s2
ffffffffc02065de:	f49fe0ef          	jal	ra,ffffffffc0205526 <sysfile_open>
ffffffffc02065e2:	8baa                	mv	s7,a0
ffffffffc02065e4:	66054863          	bltz	a0,ffffffffc0206c54 <do_execve+0x77a>
ffffffffc02065e8:	00090797          	auipc	a5,0x90
ffffffffc02065ec:	2a87b783          	ld	a5,680(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc02065f0:	577d                	li	a4,-1
ffffffffc02065f2:	177e                	slli	a4,a4,0x3f
ffffffffc02065f4:	83b1                	srli	a5,a5,0xc
ffffffffc02065f6:	8fd9                	or	a5,a5,a4
ffffffffc02065f8:	18079073          	csrw	satp,a5
ffffffffc02065fc:	030a2783          	lw	a5,48(s4)
ffffffffc0206600:	fff7871b          	addiw	a4,a5,-1
ffffffffc0206604:	02ea2823          	sw	a4,48(s4)
ffffffffc0206608:	16070363          	beqz	a4,ffffffffc020676e <do_execve+0x294>
ffffffffc020660c:	0009b783          	ld	a5,0(s3)
ffffffffc0206610:	0207b423          	sd	zero,40(a5)
ffffffffc0206614:	df4fd0ef          	jal	ra,ffffffffc0203c08 <mm_create>
ffffffffc0206618:	8a2a                	mv	s4,a0
ffffffffc020661a:	c901                	beqz	a0,ffffffffc020662a <do_execve+0x150>
ffffffffc020661c:	cd6ff0ef          	jal	ra,ffffffffc0205af2 <setup_pgdir>
ffffffffc0206620:	10050763          	beqz	a0,ffffffffc020672e <do_execve+0x254>
ffffffffc0206624:	8552                	mv	a0,s4
ffffffffc0206626:	f30fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc020662a:	5df1                	li	s11,-4
ffffffffc020662c:	67c2                	ld	a5,16(sp)
ffffffffc020662e:	147d                	addi	s0,s0,-1
ffffffffc0206630:	ff0c0493          	addi	s1,s8,-16
ffffffffc0206634:	02079713          	slli	a4,a5,0x20
ffffffffc0206638:	040e                	slli	s0,s0,0x3
ffffffffc020663a:	94e6                	add	s1,s1,s9
ffffffffc020663c:	01d75793          	srli	a5,a4,0x1d
ffffffffc0206640:	9462                	add	s0,s0,s8
ffffffffc0206642:	8c9d                	sub	s1,s1,a5
ffffffffc0206644:	6008                	ld	a0,0(s0)
ffffffffc0206646:	1461                	addi	s0,s0,-8
ffffffffc0206648:	9f7fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020664c:	fe941ce3          	bne	s0,s1,ffffffffc0206644 <do_execve+0x16a>
ffffffffc0206650:	856e                	mv	a0,s11
ffffffffc0206652:	a05ff0ef          	jal	ra,ffffffffc0206056 <do_exit>
ffffffffc0206656:	0009b783          	ld	a5,0(s3)
ffffffffc020665a:	1487b503          	ld	a0,328(a5)
ffffffffc020665e:	c3dfe0ef          	jal	ra,ffffffffc020529a <files_closeall>
ffffffffc0206662:	4581                	li	a1,0
ffffffffc0206664:	854a                	mv	a0,s2
ffffffffc0206666:	ec1fe0ef          	jal	ra,ffffffffc0205526 <sysfile_open>
ffffffffc020666a:	8baa                	mv	s7,a0
ffffffffc020666c:	5e054263          	bltz	a0,ffffffffc0206c50 <do_execve+0x776>
ffffffffc0206670:	0009b783          	ld	a5,0(s3)
ffffffffc0206674:	779c                	ld	a5,40(a5)
ffffffffc0206676:	dfd9                	beqz	a5,ffffffffc0206614 <do_execve+0x13a>
ffffffffc0206678:	00007617          	auipc	a2,0x7
ffffffffc020667c:	04060613          	addi	a2,a2,64 # ffffffffc020d6b8 <CSWTCH.79+0x300>
ffffffffc0206680:	2cb00593          	li	a1,715
ffffffffc0206684:	00007517          	auipc	a0,0x7
ffffffffc0206688:	e4450513          	addi	a0,a0,-444 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc020668c:	e13f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206690:	5df1                	li	s11,-4
ffffffffc0206692:	c49d                	beqz	s1,ffffffffc02066c0 <do_execve+0x1e6>
ffffffffc0206694:	00349713          	slli	a4,s1,0x3
ffffffffc0206698:	fff48413          	addi	s0,s1,-1
ffffffffc020669c:	ff0c0793          	addi	a5,s8,-16
ffffffffc02066a0:	34fd                	addiw	s1,s1,-1
ffffffffc02066a2:	97ba                	add	a5,a5,a4
ffffffffc02066a4:	02049713          	slli	a4,s1,0x20
ffffffffc02066a8:	040e                	slli	s0,s0,0x3
ffffffffc02066aa:	01d75493          	srli	s1,a4,0x1d
ffffffffc02066ae:	9462                	add	s0,s0,s8
ffffffffc02066b0:	409784b3          	sub	s1,a5,s1
ffffffffc02066b4:	6008                	ld	a0,0(s0)
ffffffffc02066b6:	1461                	addi	s0,s0,-8
ffffffffc02066b8:	987fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02066bc:	fe849ce3          	bne	s1,s0,ffffffffc02066b4 <do_execve+0x1da>
ffffffffc02066c0:	000a0863          	beqz	s4,ffffffffc02066d0 <do_execve+0x1f6>
ffffffffc02066c4:	038a0513          	addi	a0,s4,56
ffffffffc02066c8:	e99fd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02066cc:	040a2823          	sw	zero,80(s4)
ffffffffc02066d0:	26813083          	ld	ra,616(sp)
ffffffffc02066d4:	26013403          	ld	s0,608(sp)
ffffffffc02066d8:	25813483          	ld	s1,600(sp)
ffffffffc02066dc:	25013903          	ld	s2,592(sp)
ffffffffc02066e0:	24813983          	ld	s3,584(sp)
ffffffffc02066e4:	24013a03          	ld	s4,576(sp)
ffffffffc02066e8:	23813a83          	ld	s5,568(sp)
ffffffffc02066ec:	23013b03          	ld	s6,560(sp)
ffffffffc02066f0:	22813b83          	ld	s7,552(sp)
ffffffffc02066f4:	22013c03          	ld	s8,544(sp)
ffffffffc02066f8:	21813c83          	ld	s9,536(sp)
ffffffffc02066fc:	21013d03          	ld	s10,528(sp)
ffffffffc0206700:	856e                	mv	a0,s11
ffffffffc0206702:	20813d83          	ld	s11,520(sp)
ffffffffc0206706:	27010113          	addi	sp,sp,624
ffffffffc020670a:	8082                	ret
ffffffffc020670c:	855e                	mv	a0,s7
ffffffffc020670e:	931fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206712:	5df5                	li	s11,-3
ffffffffc0206714:	bfbd                	j	ffffffffc0206692 <do_execve+0x1b8>
ffffffffc0206716:	0009b783          	ld	a5,0(s3)
ffffffffc020671a:	00007617          	auipc	a2,0x7
ffffffffc020671e:	f8e60613          	addi	a2,a2,-114 # ffffffffc020d6a8 <CSWTCH.79+0x2f0>
ffffffffc0206722:	45c1                	li	a1,16
ffffffffc0206724:	43d4                	lw	a3,4(a5)
ffffffffc0206726:	18a8                	addi	a0,sp,120
ffffffffc0206728:	4ad040ef          	jal	ra,ffffffffc020b3d4 <snprintf>
ffffffffc020672c:	b591                	j	ffffffffc0206570 <do_execve+0x96>
ffffffffc020672e:	4601                	li	a2,0
ffffffffc0206730:	4581                	li	a1,0
ffffffffc0206732:	855e                	mv	a0,s7
ffffffffc0206734:	858ff0ef          	jal	ra,ffffffffc020578c <sysfile_seek>
ffffffffc0206738:	8daa                	mv	s11,a0
ffffffffc020673a:	c909                	beqz	a0,ffffffffc020674c <do_execve+0x272>
ffffffffc020673c:	018a3503          	ld	a0,24(s4)
ffffffffc0206740:	b3cff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0206744:	8552                	mv	a0,s4
ffffffffc0206746:	e10fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc020674a:	b5cd                	j	ffffffffc020662c <do_execve+0x152>
ffffffffc020674c:	04000613          	li	a2,64
ffffffffc0206750:	018c                	addi	a1,sp,192
ffffffffc0206752:	855e                	mv	a0,s7
ffffffffc0206754:	e0bfe0ef          	jal	ra,ffffffffc020555e <sysfile_read>
ffffffffc0206758:	04000793          	li	a5,64
ffffffffc020675c:	02f50463          	beq	a0,a5,ffffffffc0206784 <do_execve+0x2aa>
ffffffffc0206760:	87aa                	mv	a5,a0
ffffffffc0206762:	00054363          	bltz	a0,ffffffffc0206768 <do_execve+0x28e>
ffffffffc0206766:	57fd                	li	a5,-1
ffffffffc0206768:	00078d9b          	sext.w	s11,a5
ffffffffc020676c:	bfc1                	j	ffffffffc020673c <do_execve+0x262>
ffffffffc020676e:	8552                	mv	a0,s4
ffffffffc0206770:	f82fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206774:	018a3503          	ld	a0,24(s4)
ffffffffc0206778:	b04ff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc020677c:	8552                	mv	a0,s4
ffffffffc020677e:	dd8fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206782:	b569                	j	ffffffffc020660c <do_execve+0x132>
ffffffffc0206784:	470e                	lw	a4,192(sp)
ffffffffc0206786:	464c47b7          	lui	a5,0x464c4
ffffffffc020678a:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc020678e:	32f71163          	bne	a4,a5,ffffffffc0206ab0 <do_execve+0x5d6>
ffffffffc0206792:	0f815783          	lhu	a5,248(sp)
ffffffffc0206796:	e482                	sd	zero,72(sp)
ffffffffc0206798:	e882                	sd	zero,80(sp)
ffffffffc020679a:	18078963          	beqz	a5,ffffffffc020692c <do_execve+0x452>
ffffffffc020679e:	57fd                	li	a5,-1
ffffffffc02067a0:	83b1                	srli	a5,a5,0xc
ffffffffc02067a2:	f83e                	sd	a5,48(sp)
ffffffffc02067a4:	fc66                	sd	s9,56(sp)
ffffffffc02067a6:	f4a6                	sd	s1,104(sp)
ffffffffc02067a8:	f0ee                	sd	s11,96(sp)
ffffffffc02067aa:	e0a2                	sd	s0,64(sp)
ffffffffc02067ac:	758e                	ld	a1,224(sp)
ffffffffc02067ae:	67a6                	ld	a5,72(sp)
ffffffffc02067b0:	4601                	li	a2,0
ffffffffc02067b2:	855e                	mv	a0,s7
ffffffffc02067b4:	95be                	add	a1,a1,a5
ffffffffc02067b6:	fd7fe0ef          	jal	ra,ffffffffc020578c <sysfile_seek>
ffffffffc02067ba:	e42a                	sd	a0,8(sp)
ffffffffc02067bc:	14051263          	bnez	a0,ffffffffc0206900 <do_execve+0x426>
ffffffffc02067c0:	03800613          	li	a2,56
ffffffffc02067c4:	012c                	addi	a1,sp,136
ffffffffc02067c6:	855e                	mv	a0,s7
ffffffffc02067c8:	d97fe0ef          	jal	ra,ffffffffc020555e <sysfile_read>
ffffffffc02067cc:	03800793          	li	a5,56
ffffffffc02067d0:	12f50b63          	beq	a0,a5,ffffffffc0206906 <do_execve+0x42c>
ffffffffc02067d4:	7ce2                	ld	s9,56(sp)
ffffffffc02067d6:	6406                	ld	s0,64(sp)
ffffffffc02067d8:	892a                	mv	s2,a0
ffffffffc02067da:	00054363          	bltz	a0,ffffffffc02067e0 <do_execve+0x306>
ffffffffc02067de:	597d                	li	s2,-1
ffffffffc02067e0:	0009079b          	sext.w	a5,s2
ffffffffc02067e4:	e43e                	sd	a5,8(sp)
ffffffffc02067e6:	8552                	mv	a0,s4
ffffffffc02067e8:	f0afd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc02067ec:	018a3503          	ld	a0,24(s4)
ffffffffc02067f0:	6da2                	ld	s11,8(sp)
ffffffffc02067f2:	a8aff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc02067f6:	8552                	mv	a0,s4
ffffffffc02067f8:	d5efd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc02067fc:	bd05                	j	ffffffffc020662c <do_execve+0x152>
ffffffffc02067fe:	764a                	ld	a2,176(sp)
ffffffffc0206800:	77aa                	ld	a5,168(sp)
ffffffffc0206802:	42f66663          	bltu	a2,a5,ffffffffc0206c2e <do_execve+0x754>
ffffffffc0206806:	47ba                	lw	a5,140(sp)
ffffffffc0206808:	0017f693          	andi	a3,a5,1
ffffffffc020680c:	c291                	beqz	a3,ffffffffc0206810 <do_execve+0x336>
ffffffffc020680e:	4691                	li	a3,4
ffffffffc0206810:	0027f713          	andi	a4,a5,2
ffffffffc0206814:	8b91                	andi	a5,a5,4
ffffffffc0206816:	2a071663          	bnez	a4,ffffffffc0206ac2 <do_execve+0x5e8>
ffffffffc020681a:	4745                	li	a4,17
ffffffffc020681c:	ecba                	sd	a4,88(sp)
ffffffffc020681e:	c789                	beqz	a5,ffffffffc0206828 <do_execve+0x34e>
ffffffffc0206820:	47cd                	li	a5,19
ffffffffc0206822:	0016e693          	ori	a3,a3,1
ffffffffc0206826:	ecbe                	sd	a5,88(sp)
ffffffffc0206828:	0026f793          	andi	a5,a3,2
ffffffffc020682c:	28079f63          	bnez	a5,ffffffffc0206aca <do_execve+0x5f0>
ffffffffc0206830:	0046f793          	andi	a5,a3,4
ffffffffc0206834:	c789                	beqz	a5,ffffffffc020683e <do_execve+0x364>
ffffffffc0206836:	67e6                	ld	a5,88(sp)
ffffffffc0206838:	0087e793          	ori	a5,a5,8
ffffffffc020683c:	ecbe                	sd	a5,88(sp)
ffffffffc020683e:	65ea                	ld	a1,152(sp)
ffffffffc0206840:	4701                	li	a4,0
ffffffffc0206842:	8552                	mv	a0,s4
ffffffffc0206844:	d64fd0ef          	jal	ra,ffffffffc0203da8 <mm_map>
ffffffffc0206848:	e42a                	sd	a0,8(sp)
ffffffffc020684a:	e95d                	bnez	a0,ffffffffc0206900 <do_execve+0x426>
ffffffffc020684c:	696a                	ld	s2,152(sp)
ffffffffc020684e:	7caa                	ld	s9,168(sp)
ffffffffc0206850:	76fd                	lui	a3,0xfffff
ffffffffc0206852:	6b4a                	ld	s6,144(sp)
ffffffffc0206854:	9cca                	add	s9,s9,s2
ffffffffc0206856:	00d97db3          	and	s11,s2,a3
ffffffffc020685a:	3d997563          	bgeu	s2,s9,ffffffffc0206c24 <do_execve+0x74a>
ffffffffc020685e:	57f1                	li	a5,-4
ffffffffc0206860:	6ae6                	ld	s5,88(sp)
ffffffffc0206862:	e43e                	sd	a5,8(sp)
ffffffffc0206864:	846e                	mv	s0,s11
ffffffffc0206866:	a01d                	j	ffffffffc020688c <do_execve+0x3b2>
ffffffffc0206868:	7702                	ld	a4,32(sp)
ffffffffc020686a:	77a2                	ld	a5,40(sp)
ffffffffc020686c:	40890433          	sub	s0,s2,s0
ffffffffc0206870:	8626                	mv	a2,s1
ffffffffc0206872:	00f705b3          	add	a1,a4,a5
ffffffffc0206876:	95a2                	add	a1,a1,s0
ffffffffc0206878:	855e                	mv	a0,s7
ffffffffc020687a:	ce5fe0ef          	jal	ra,ffffffffc020555e <sysfile_read>
ffffffffc020687e:	f4a49be3          	bne	s1,a0,ffffffffc02067d4 <do_execve+0x2fa>
ffffffffc0206882:	9926                	add	s2,s2,s1
ffffffffc0206884:	9b26                	add	s6,s6,s1
ffffffffc0206886:	846e                	mv	s0,s11
ffffffffc0206888:	2f997863          	bgeu	s2,s9,ffffffffc0206b78 <do_execve+0x69e>
ffffffffc020688c:	018a3503          	ld	a0,24(s4)
ffffffffc0206890:	8656                	mv	a2,s5
ffffffffc0206892:	85a2                	mv	a1,s0
ffffffffc0206894:	a8efd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206898:	8d2a                	mv	s10,a0
ffffffffc020689a:	2a050b63          	beqz	a0,ffffffffc0206b50 <do_execve+0x676>
ffffffffc020689e:	6785                	lui	a5,0x1
ffffffffc02068a0:	00f40db3          	add	s11,s0,a5
ffffffffc02068a4:	412d84b3          	sub	s1,s11,s2
ffffffffc02068a8:	01bcf463          	bgeu	s9,s11,ffffffffc02068b0 <do_execve+0x3d6>
ffffffffc02068ac:	412c84b3          	sub	s1,s9,s2
ffffffffc02068b0:	00090797          	auipc	a5,0x90
ffffffffc02068b4:	ff878793          	addi	a5,a5,-8 # ffffffffc02968a8 <pages>
ffffffffc02068b8:	638c                	ld	a1,0(a5)
ffffffffc02068ba:	00009797          	auipc	a5,0x9
ffffffffc02068be:	f5e78793          	addi	a5,a5,-162 # ffffffffc020f818 <nbase>
ffffffffc02068c2:	6388                	ld	a0,0(a5)
ffffffffc02068c4:	00090797          	auipc	a5,0x90
ffffffffc02068c8:	fdc78793          	addi	a5,a5,-36 # ffffffffc02968a0 <npage>
ffffffffc02068cc:	6390                	ld	a2,0(a5)
ffffffffc02068ce:	40bd05b3          	sub	a1,s10,a1
ffffffffc02068d2:	77c2                	ld	a5,48(sp)
ffffffffc02068d4:	8599                	srai	a1,a1,0x6
ffffffffc02068d6:	95aa                	add	a1,a1,a0
ffffffffc02068d8:	00f5f533          	and	a0,a1,a5
ffffffffc02068dc:	00c59793          	slli	a5,a1,0xc
ffffffffc02068e0:	f03e                	sd	a5,32(sp)
ffffffffc02068e2:	36c57b63          	bgeu	a0,a2,ffffffffc0206c58 <do_execve+0x77e>
ffffffffc02068e6:	00090797          	auipc	a5,0x90
ffffffffc02068ea:	fd278793          	addi	a5,a5,-46 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02068ee:	639c                	ld	a5,0(a5)
ffffffffc02068f0:	4601                	li	a2,0
ffffffffc02068f2:	85da                	mv	a1,s6
ffffffffc02068f4:	855e                	mv	a0,s7
ffffffffc02068f6:	f43e                	sd	a5,40(sp)
ffffffffc02068f8:	e95fe0ef          	jal	ra,ffffffffc020578c <sysfile_seek>
ffffffffc02068fc:	e42a                	sd	a0,8(sp)
ffffffffc02068fe:	d52d                	beqz	a0,ffffffffc0206868 <do_execve+0x38e>
ffffffffc0206900:	7ce2                	ld	s9,56(sp)
ffffffffc0206902:	6406                	ld	s0,64(sp)
ffffffffc0206904:	b5cd                	j	ffffffffc02067e6 <do_execve+0x30c>
ffffffffc0206906:	472a                	lw	a4,136(sp)
ffffffffc0206908:	4785                	li	a5,1
ffffffffc020690a:	eef70ae3          	beq	a4,a5,ffffffffc02067fe <do_execve+0x324>
ffffffffc020690e:	6746                	ld	a4,80(sp)
ffffffffc0206910:	66a6                	ld	a3,72(sp)
ffffffffc0206912:	0f815783          	lhu	a5,248(sp)
ffffffffc0206916:	2705                	addiw	a4,a4,1
ffffffffc0206918:	03868693          	addi	a3,a3,56 # fffffffffffff038 <end+0x3fd68728>
ffffffffc020691c:	e8ba                	sd	a4,80(sp)
ffffffffc020691e:	e4b6                	sd	a3,72(sp)
ffffffffc0206920:	e8f766e3          	bltu	a4,a5,ffffffffc02067ac <do_execve+0x2d2>
ffffffffc0206924:	7ce2                	ld	s9,56(sp)
ffffffffc0206926:	74a6                	ld	s1,104(sp)
ffffffffc0206928:	7d86                	ld	s11,96(sp)
ffffffffc020692a:	6406                	ld	s0,64(sp)
ffffffffc020692c:	4701                	li	a4,0
ffffffffc020692e:	46ad                	li	a3,11
ffffffffc0206930:	00100637          	lui	a2,0x100
ffffffffc0206934:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0206938:	8552                	mv	a0,s4
ffffffffc020693a:	c6efd0ef          	jal	ra,ffffffffc0203da8 <mm_map>
ffffffffc020693e:	e42a                	sd	a0,8(sp)
ffffffffc0206940:	ea0513e3          	bnez	a0,ffffffffc02067e6 <do_execve+0x30c>
ffffffffc0206944:	018a3503          	ld	a0,24(s4)
ffffffffc0206948:	467d                	li	a2,31
ffffffffc020694a:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc020694e:	9d4fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206952:	38050063          	beqz	a0,ffffffffc0206cd2 <do_execve+0x7f8>
ffffffffc0206956:	018a3503          	ld	a0,24(s4)
ffffffffc020695a:	467d                	li	a2,31
ffffffffc020695c:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc0206960:	9c2fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206964:	34050763          	beqz	a0,ffffffffc0206cb2 <do_execve+0x7d8>
ffffffffc0206968:	018a3503          	ld	a0,24(s4)
ffffffffc020696c:	467d                	li	a2,31
ffffffffc020696e:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc0206972:	9b0fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206976:	30050e63          	beqz	a0,ffffffffc0206c92 <do_execve+0x7b8>
ffffffffc020697a:	018a3503          	ld	a0,24(s4)
ffffffffc020697e:	467d                	li	a2,31
ffffffffc0206980:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0206984:	99efd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206988:	2e050563          	beqz	a0,ffffffffc0206c72 <do_execve+0x798>
ffffffffc020698c:	030a2783          	lw	a5,48(s4)
ffffffffc0206990:	0009b703          	ld	a4,0(s3)
ffffffffc0206994:	018a3683          	ld	a3,24(s4)
ffffffffc0206998:	2785                	addiw	a5,a5,1
ffffffffc020699a:	02fa2823          	sw	a5,48(s4)
ffffffffc020699e:	03473423          	sd	s4,40(a4)
ffffffffc02069a2:	c02007b7          	lui	a5,0xc0200
ffffffffc02069a6:	28f6e963          	bltu	a3,a5,ffffffffc0206c38 <do_execve+0x75e>
ffffffffc02069aa:	00090797          	auipc	a5,0x90
ffffffffc02069ae:	f0e7b783          	ld	a5,-242(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02069b2:	8e9d                	sub	a3,a3,a5
ffffffffc02069b4:	f754                	sd	a3,168(a4)
ffffffffc02069b6:	577d                	li	a4,-1
ffffffffc02069b8:	00c6d793          	srli	a5,a3,0xc
ffffffffc02069bc:	177e                	slli	a4,a4,0x3f
ffffffffc02069be:	8fd9                	or	a5,a5,a4
ffffffffc02069c0:	18079073          	csrw	satp,a5
ffffffffc02069c4:	6b62                	ld	s6,24(sp)
ffffffffc02069c6:	4901                	li	s2,0
ffffffffc02069c8:	8ae2                	mv	s5,s8
ffffffffc02069ca:	4a01                	li	s4,0
ffffffffc02069cc:	000ab503          	ld	a0,0(s5)
ffffffffc02069d0:	6585                	lui	a1,0x1
ffffffffc02069d2:	2a05                	addiw	s4,s4,1
ffffffffc02069d4:	269040ef          	jal	ra,ffffffffc020b43c <strnlen>
ffffffffc02069d8:	00150793          	addi	a5,a0,1
ffffffffc02069dc:	0127893b          	addw	s2,a5,s2
ffffffffc02069e0:	0aa1                	addi	s5,s5,8
ffffffffc02069e2:	ff6a65e3          	bltu	s4,s6,ffffffffc02069cc <do_execve+0x4f2>
ffffffffc02069e6:	0039579b          	srliw	a5,s2,0x3
ffffffffc02069ea:	10000937          	lui	s2,0x10000
ffffffffc02069ee:	197d                	addi	s2,s2,-1
ffffffffc02069f0:	40f90933          	sub	s2,s2,a5
ffffffffc02069f4:	090e                	slli	s2,s2,0x3
ffffffffc02069f6:	41990d33          	sub	s10,s2,s9
ffffffffc02069fa:	418d07b3          	sub	a5,s10,s8
ffffffffc02069fe:	8ae2                	mv	s5,s8
ffffffffc0206a00:	4b81                	li	s7,0
ffffffffc0206a02:	4b01                	li	s6,0
ffffffffc0206a04:	e43e                	sd	a5,8(sp)
ffffffffc0206a06:	8a4a                	mv	s4,s2
ffffffffc0206a08:	67a2                	ld	a5,8(sp)
ffffffffc0206a0a:	000ab903          	ld	s2,0(s5)
ffffffffc0206a0e:	020b1513          	slli	a0,s6,0x20
ffffffffc0206a12:	9101                	srli	a0,a0,0x20
ffffffffc0206a14:	97d6                	add	a5,a5,s5
ffffffffc0206a16:	9552                	add	a0,a0,s4
ffffffffc0206a18:	e388                	sd	a0,0(a5)
ffffffffc0206a1a:	85ca                	mv	a1,s2
ffffffffc0206a1c:	23d040ef          	jal	ra,ffffffffc020b458 <strcpy>
ffffffffc0206a20:	6585                	lui	a1,0x1
ffffffffc0206a22:	854a                	mv	a0,s2
ffffffffc0206a24:	219040ef          	jal	ra,ffffffffc020b43c <strnlen>
ffffffffc0206a28:	00150793          	addi	a5,a0,1
ffffffffc0206a2c:	01678b3b          	addw	s6,a5,s6
ffffffffc0206a30:	67e2                	ld	a5,24(sp)
ffffffffc0206a32:	2b85                	addiw	s7,s7,1
ffffffffc0206a34:	0aa1                	addi	s5,s5,8
ffffffffc0206a36:	fcfbe9e3          	bltu	s7,a5,ffffffffc0206a08 <do_execve+0x52e>
ffffffffc0206a3a:	0009b783          	ld	a5,0(s3)
ffffffffc0206a3e:	fe9d2e23          	sw	s1,-4(s10)
ffffffffc0206a42:	12000613          	li	a2,288
ffffffffc0206a46:	73c4                	ld	s1,160(a5)
ffffffffc0206a48:	4581                	li	a1,0
ffffffffc0206a4a:	ffcd0a13          	addi	s4,s10,-4
ffffffffc0206a4e:	1004b903          	ld	s2,256(s1)
ffffffffc0206a52:	8526                	mv	a0,s1
ffffffffc0206a54:	271040ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0206a58:	676e                	ld	a4,216(sp)
ffffffffc0206a5a:	edf97793          	andi	a5,s2,-289
ffffffffc0206a5e:	0207e793          	ori	a5,a5,32
ffffffffc0206a62:	0144b823          	sd	s4,16(s1)
ffffffffc0206a66:	10e4b423          	sd	a4,264(s1)
ffffffffc0206a6a:	10f4b023          	sd	a5,256(s1)
ffffffffc0206a6e:	67c2                	ld	a5,16(sp)
ffffffffc0206a70:	147d                	addi	s0,s0,-1
ffffffffc0206a72:	ff0c0493          	addi	s1,s8,-16
ffffffffc0206a76:	02079713          	slli	a4,a5,0x20
ffffffffc0206a7a:	040e                	slli	s0,s0,0x3
ffffffffc0206a7c:	94e6                	add	s1,s1,s9
ffffffffc0206a7e:	01d75793          	srli	a5,a4,0x1d
ffffffffc0206a82:	9462                	add	s0,s0,s8
ffffffffc0206a84:	8c9d                	sub	s1,s1,a5
ffffffffc0206a86:	6008                	ld	a0,0(s0)
ffffffffc0206a88:	1461                	addi	s0,s0,-8
ffffffffc0206a8a:	db4fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206a8e:	fe941ce3          	bne	s0,s1,ffffffffc0206a86 <do_execve+0x5ac>
ffffffffc0206a92:	0009b403          	ld	s0,0(s3)
ffffffffc0206a96:	4641                	li	a2,16
ffffffffc0206a98:	4581                	li	a1,0
ffffffffc0206a9a:	0b440413          	addi	s0,s0,180
ffffffffc0206a9e:	8522                	mv	a0,s0
ffffffffc0206aa0:	225040ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0206aa4:	463d                	li	a2,15
ffffffffc0206aa6:	18ac                	addi	a1,sp,120
ffffffffc0206aa8:	8522                	mv	a0,s0
ffffffffc0206aaa:	26d040ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc0206aae:	b10d                	j	ffffffffc02066d0 <do_execve+0x1f6>
ffffffffc0206ab0:	018a3503          	ld	a0,24(s4)
ffffffffc0206ab4:	5de1                	li	s11,-8
ffffffffc0206ab6:	fc7fe0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0206aba:	8552                	mv	a0,s4
ffffffffc0206abc:	a9afd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206ac0:	b6b5                	j	ffffffffc020662c <do_execve+0x152>
ffffffffc0206ac2:	0026e693          	ori	a3,a3,2
ffffffffc0206ac6:	d4079de3          	bnez	a5,ffffffffc0206820 <do_execve+0x346>
ffffffffc0206aca:	47dd                	li	a5,23
ffffffffc0206acc:	ecbe                	sd	a5,88(sp)
ffffffffc0206ace:	b38d                	j	ffffffffc0206830 <do_execve+0x356>
ffffffffc0206ad0:	10879c63          	bne	a5,s0,ffffffffc0206be8 <do_execve+0x70e>
ffffffffc0206ad4:	8922                	mv	s2,s0
ffffffffc0206ad6:	e2997ce3          	bgeu	s2,s1,ffffffffc020690e <do_execve+0x434>
ffffffffc0206ada:	6de6                	ld	s11,88(sp)
ffffffffc0206adc:	6c85                	lui	s9,0x1
ffffffffc0206ade:	00090b17          	auipc	s6,0x90
ffffffffc0206ae2:	dc2b0b13          	addi	s6,s6,-574 # ffffffffc02968a0 <npage>
ffffffffc0206ae6:	00090a97          	auipc	s5,0x90
ffffffffc0206aea:	dd2a8a93          	addi	s5,s5,-558 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206aee:	a889                	j	ffffffffc0206b40 <do_execve+0x666>
ffffffffc0206af0:	40890533          	sub	a0,s2,s0
ffffffffc0206af4:	9466                	add	s0,s0,s9
ffffffffc0206af6:	41240633          	sub	a2,s0,s2
ffffffffc0206afa:	0084f463          	bgeu	s1,s0,ffffffffc0206b02 <do_execve+0x628>
ffffffffc0206afe:	41248633          	sub	a2,s1,s2
ffffffffc0206b02:	00090797          	auipc	a5,0x90
ffffffffc0206b06:	da678793          	addi	a5,a5,-602 # ffffffffc02968a8 <pages>
ffffffffc0206b0a:	639c                	ld	a5,0(a5)
ffffffffc0206b0c:	00009717          	auipc	a4,0x9
ffffffffc0206b10:	d0c70713          	addi	a4,a4,-756 # ffffffffc020f818 <nbase>
ffffffffc0206b14:	6314                	ld	a3,0(a4)
ffffffffc0206b16:	40fd07b3          	sub	a5,s10,a5
ffffffffc0206b1a:	8799                	srai	a5,a5,0x6
ffffffffc0206b1c:	97b6                	add	a5,a5,a3
ffffffffc0206b1e:	76c2                	ld	a3,48(sp)
ffffffffc0206b20:	000b3703          	ld	a4,0(s6)
ffffffffc0206b24:	8efd                	and	a3,a3,a5
ffffffffc0206b26:	07b2                	slli	a5,a5,0xc
ffffffffc0206b28:	12e6f863          	bgeu	a3,a4,ffffffffc0206c58 <do_execve+0x77e>
ffffffffc0206b2c:	000ab703          	ld	a4,0(s5)
ffffffffc0206b30:	9932                	add	s2,s2,a2
ffffffffc0206b32:	4581                	li	a1,0
ffffffffc0206b34:	97ba                	add	a5,a5,a4
ffffffffc0206b36:	953e                	add	a0,a0,a5
ffffffffc0206b38:	18d040ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0206b3c:	dc9979e3          	bgeu	s2,s1,ffffffffc020690e <do_execve+0x434>
ffffffffc0206b40:	018a3503          	ld	a0,24(s4)
ffffffffc0206b44:	866e                	mv	a2,s11
ffffffffc0206b46:	85a2                	mv	a1,s0
ffffffffc0206b48:	fdbfc0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206b4c:	8d2a                	mv	s10,a0
ffffffffc0206b4e:	f14d                	bnez	a0,ffffffffc0206af0 <do_execve+0x616>
ffffffffc0206b50:	8552                	mv	a0,s4
ffffffffc0206b52:	7ce2                	ld	s9,56(sp)
ffffffffc0206b54:	7d86                	ld	s11,96(sp)
ffffffffc0206b56:	6406                	ld	s0,64(sp)
ffffffffc0206b58:	b9afd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206b5c:	018a3503          	ld	a0,24(s4)
ffffffffc0206b60:	f1dfe0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0206b64:	8552                	mv	a0,s4
ffffffffc0206b66:	9f0fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206b6a:	67a2                	ld	a5,8(sp)
ffffffffc0206b6c:	f00781e3          	beqz	a5,ffffffffc0206a6e <do_execve+0x594>
ffffffffc0206b70:	6da2                	ld	s11,8(sp)
ffffffffc0206b72:	bc6d                	j	ffffffffc020662c <do_execve+0x152>
ffffffffc0206b74:	5df5                	li	s11,-3
ffffffffc0206b76:	bea9                	j	ffffffffc02066d0 <do_execve+0x1f6>
ffffffffc0206b78:	64ea                	ld	s1,152(sp)
ffffffffc0206b7a:	76ca                	ld	a3,176(sp)
ffffffffc0206b7c:	94b6                	add	s1,s1,a3
ffffffffc0206b7e:	f4897ce3          	bgeu	s2,s0,ffffffffc0206ad6 <do_execve+0x5fc>
ffffffffc0206b82:	d92486e3          	beq	s1,s2,ffffffffc020690e <do_execve+0x434>
ffffffffc0206b86:	6505                	lui	a0,0x1
ffffffffc0206b88:	954a                	add	a0,a0,s2
ffffffffc0206b8a:	8d01                	sub	a0,a0,s0
ffffffffc0206b8c:	41248ab3          	sub	s5,s1,s2
ffffffffc0206b90:	0084e463          	bltu	s1,s0,ffffffffc0206b98 <do_execve+0x6be>
ffffffffc0206b94:	41240ab3          	sub	s5,s0,s2
ffffffffc0206b98:	00090797          	auipc	a5,0x90
ffffffffc0206b9c:	d1078793          	addi	a5,a5,-752 # ffffffffc02968a8 <pages>
ffffffffc0206ba0:	6394                	ld	a3,0(a5)
ffffffffc0206ba2:	00009797          	auipc	a5,0x9
ffffffffc0206ba6:	c7678793          	addi	a5,a5,-906 # ffffffffc020f818 <nbase>
ffffffffc0206baa:	638c                	ld	a1,0(a5)
ffffffffc0206bac:	40dd06b3          	sub	a3,s10,a3
ffffffffc0206bb0:	77c2                	ld	a5,48(sp)
ffffffffc0206bb2:	8699                	srai	a3,a3,0x6
ffffffffc0206bb4:	96ae                	add	a3,a3,a1
ffffffffc0206bb6:	00f6f5b3          	and	a1,a3,a5
ffffffffc0206bba:	00090617          	auipc	a2,0x90
ffffffffc0206bbe:	ce663603          	ld	a2,-794(a2) # ffffffffc02968a0 <npage>
ffffffffc0206bc2:	06b2                	slli	a3,a3,0xc
ffffffffc0206bc4:	08c5fb63          	bgeu	a1,a2,ffffffffc0206c5a <do_execve+0x780>
ffffffffc0206bc8:	00090617          	auipc	a2,0x90
ffffffffc0206bcc:	cf063603          	ld	a2,-784(a2) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206bd0:	96b2                	add	a3,a3,a2
ffffffffc0206bd2:	4581                	li	a1,0
ffffffffc0206bd4:	8656                	mv	a2,s5
ffffffffc0206bd6:	9536                	add	a0,a0,a3
ffffffffc0206bd8:	0ed040ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0206bdc:	012a87b3          	add	a5,s5,s2
ffffffffc0206be0:	ee84f8e3          	bgeu	s1,s0,ffffffffc0206ad0 <do_execve+0x5f6>
ffffffffc0206be4:	d2f485e3          	beq	s1,a5,ffffffffc020690e <do_execve+0x434>
ffffffffc0206be8:	00007697          	auipc	a3,0x7
ffffffffc0206bec:	af868693          	addi	a3,a3,-1288 # ffffffffc020d6e0 <CSWTCH.79+0x328>
ffffffffc0206bf0:	00005617          	auipc	a2,0x5
ffffffffc0206bf4:	db860613          	addi	a2,a2,-584 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0206bf8:	34000593          	li	a1,832
ffffffffc0206bfc:	00007517          	auipc	a0,0x7
ffffffffc0206c00:	8cc50513          	addi	a0,a0,-1844 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206c04:	89bf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c08:	5df5                	li	s11,-3
ffffffffc0206c0a:	aa0a1de3          	bnez	s4,ffffffffc02066c4 <do_execve+0x1ea>
ffffffffc0206c0e:	b4c9                	j	ffffffffc02066d0 <do_execve+0x1f6>
ffffffffc0206c10:	f60a02e3          	beqz	s4,ffffffffc0206b74 <do_execve+0x69a>
ffffffffc0206c14:	038a0513          	addi	a0,s4,56
ffffffffc0206c18:	949fd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0206c1c:	5df5                	li	s11,-3
ffffffffc0206c1e:	040a2823          	sw	zero,80(s4)
ffffffffc0206c22:	b47d                	j	ffffffffc02066d0 <do_execve+0x1f6>
ffffffffc0206c24:	57f1                	li	a5,-4
ffffffffc0206c26:	84ca                	mv	s1,s2
ffffffffc0206c28:	846e                	mv	s0,s11
ffffffffc0206c2a:	e43e                	sd	a5,8(sp)
ffffffffc0206c2c:	b7b9                	j	ffffffffc0206b7a <do_execve+0x6a0>
ffffffffc0206c2e:	57e1                	li	a5,-8
ffffffffc0206c30:	7ce2                	ld	s9,56(sp)
ffffffffc0206c32:	6406                	ld	s0,64(sp)
ffffffffc0206c34:	e43e                	sd	a5,8(sp)
ffffffffc0206c36:	be45                	j	ffffffffc02067e6 <do_execve+0x30c>
ffffffffc0206c38:	00006617          	auipc	a2,0x6
ffffffffc0206c3c:	93860613          	addi	a2,a2,-1736 # ffffffffc020c570 <default_pmm_manager+0xe0>
ffffffffc0206c40:	35f00593          	li	a1,863
ffffffffc0206c44:	00007517          	auipc	a0,0x7
ffffffffc0206c48:	88450513          	addi	a0,a0,-1916 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206c4c:	853f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c50:	8daa                	mv	s11,a0
ffffffffc0206c52:	bae9                	j	ffffffffc020662c <do_execve+0x152>
ffffffffc0206c54:	8daa                	mv	s11,a0
ffffffffc0206c56:	bad9                	j	ffffffffc020662c <do_execve+0x152>
ffffffffc0206c58:	86be                	mv	a3,a5
ffffffffc0206c5a:	00006617          	auipc	a2,0x6
ffffffffc0206c5e:	86e60613          	addi	a2,a2,-1938 # ffffffffc020c4c8 <default_pmm_manager+0x38>
ffffffffc0206c62:	07100593          	li	a1,113
ffffffffc0206c66:	00006517          	auipc	a0,0x6
ffffffffc0206c6a:	88a50513          	addi	a0,a0,-1910 # ffffffffc020c4f0 <default_pmm_manager+0x60>
ffffffffc0206c6e:	831f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c72:	00007697          	auipc	a3,0x7
ffffffffc0206c76:	b8668693          	addi	a3,a3,-1146 # ffffffffc020d7f8 <CSWTCH.79+0x440>
ffffffffc0206c7a:	00005617          	auipc	a2,0x5
ffffffffc0206c7e:	d2e60613          	addi	a2,a2,-722 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0206c82:	35a00593          	li	a1,858
ffffffffc0206c86:	00007517          	auipc	a0,0x7
ffffffffc0206c8a:	84250513          	addi	a0,a0,-1982 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206c8e:	811f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c92:	00007697          	auipc	a3,0x7
ffffffffc0206c96:	b1e68693          	addi	a3,a3,-1250 # ffffffffc020d7b0 <CSWTCH.79+0x3f8>
ffffffffc0206c9a:	00005617          	auipc	a2,0x5
ffffffffc0206c9e:	d0e60613          	addi	a2,a2,-754 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0206ca2:	35900593          	li	a1,857
ffffffffc0206ca6:	00007517          	auipc	a0,0x7
ffffffffc0206caa:	82250513          	addi	a0,a0,-2014 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206cae:	ff0f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206cb2:	00007697          	auipc	a3,0x7
ffffffffc0206cb6:	ab668693          	addi	a3,a3,-1354 # ffffffffc020d768 <CSWTCH.79+0x3b0>
ffffffffc0206cba:	00005617          	auipc	a2,0x5
ffffffffc0206cbe:	cee60613          	addi	a2,a2,-786 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0206cc2:	35800593          	li	a1,856
ffffffffc0206cc6:	00007517          	auipc	a0,0x7
ffffffffc0206cca:	80250513          	addi	a0,a0,-2046 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206cce:	fd0f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206cd2:	00007697          	auipc	a3,0x7
ffffffffc0206cd6:	a4e68693          	addi	a3,a3,-1458 # ffffffffc020d720 <CSWTCH.79+0x368>
ffffffffc0206cda:	00005617          	auipc	a2,0x5
ffffffffc0206cde:	cce60613          	addi	a2,a2,-818 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0206ce2:	35700593          	li	a1,855
ffffffffc0206ce6:	00006517          	auipc	a0,0x6
ffffffffc0206cea:	7e250513          	addi	a0,a0,2018 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206cee:	fb0f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206cf2 <user_main>:
ffffffffc0206cf2:	7179                	addi	sp,sp,-48
ffffffffc0206cf4:	e84a                	sd	s2,16(sp)
ffffffffc0206cf6:	00090917          	auipc	s2,0x90
ffffffffc0206cfa:	bca90913          	addi	s2,s2,-1078 # ffffffffc02968c0 <current>
ffffffffc0206cfe:	00093783          	ld	a5,0(s2)
ffffffffc0206d02:	00007617          	auipc	a2,0x7
ffffffffc0206d06:	b3e60613          	addi	a2,a2,-1218 # ffffffffc020d840 <CSWTCH.79+0x488>
ffffffffc0206d0a:	00007517          	auipc	a0,0x7
ffffffffc0206d0e:	b3e50513          	addi	a0,a0,-1218 # ffffffffc020d848 <CSWTCH.79+0x490>
ffffffffc0206d12:	43cc                	lw	a1,4(a5)
ffffffffc0206d14:	f406                	sd	ra,40(sp)
ffffffffc0206d16:	f022                	sd	s0,32(sp)
ffffffffc0206d18:	ec26                	sd	s1,24(sp)
ffffffffc0206d1a:	e032                	sd	a2,0(sp)
ffffffffc0206d1c:	e402                	sd	zero,8(sp)
ffffffffc0206d1e:	c88f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206d22:	6782                	ld	a5,0(sp)
ffffffffc0206d24:	cfb9                	beqz	a5,ffffffffc0206d82 <user_main+0x90>
ffffffffc0206d26:	003c                	addi	a5,sp,8
ffffffffc0206d28:	4401                	li	s0,0
ffffffffc0206d2a:	6398                	ld	a4,0(a5)
ffffffffc0206d2c:	0405                	addi	s0,s0,1
ffffffffc0206d2e:	07a1                	addi	a5,a5,8
ffffffffc0206d30:	ff6d                	bnez	a4,ffffffffc0206d2a <user_main+0x38>
ffffffffc0206d32:	00093783          	ld	a5,0(s2)
ffffffffc0206d36:	12000613          	li	a2,288
ffffffffc0206d3a:	6b84                	ld	s1,16(a5)
ffffffffc0206d3c:	73cc                	ld	a1,160(a5)
ffffffffc0206d3e:	6789                	lui	a5,0x2
ffffffffc0206d40:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0206d44:	94be                	add	s1,s1,a5
ffffffffc0206d46:	8526                	mv	a0,s1
ffffffffc0206d48:	7ce040ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc0206d4c:	00093783          	ld	a5,0(s2)
ffffffffc0206d50:	860a                	mv	a2,sp
ffffffffc0206d52:	0004059b          	sext.w	a1,s0
ffffffffc0206d56:	f3c4                	sd	s1,160(a5)
ffffffffc0206d58:	00007517          	auipc	a0,0x7
ffffffffc0206d5c:	ae850513          	addi	a0,a0,-1304 # ffffffffc020d840 <CSWTCH.79+0x488>
ffffffffc0206d60:	f7aff0ef          	jal	ra,ffffffffc02064da <do_execve>
ffffffffc0206d64:	8126                	mv	sp,s1
ffffffffc0206d66:	ceafa06f          	j	ffffffffc0201250 <__trapret>
ffffffffc0206d6a:	00007617          	auipc	a2,0x7
ffffffffc0206d6e:	b0660613          	addi	a2,a2,-1274 # ffffffffc020d870 <CSWTCH.79+0x4b8>
ffffffffc0206d72:	4a100593          	li	a1,1185
ffffffffc0206d76:	00006517          	auipc	a0,0x6
ffffffffc0206d7a:	75250513          	addi	a0,a0,1874 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206d7e:	f20f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206d82:	4401                	li	s0,0
ffffffffc0206d84:	b77d                	j	ffffffffc0206d32 <user_main+0x40>

ffffffffc0206d86 <do_yield>:
ffffffffc0206d86:	00090797          	auipc	a5,0x90
ffffffffc0206d8a:	b3a7b783          	ld	a5,-1222(a5) # ffffffffc02968c0 <current>
ffffffffc0206d8e:	4705                	li	a4,1
ffffffffc0206d90:	ef98                	sd	a4,24(a5)
ffffffffc0206d92:	4501                	li	a0,0
ffffffffc0206d94:	8082                	ret

ffffffffc0206d96 <do_wait>:
ffffffffc0206d96:	1101                	addi	sp,sp,-32
ffffffffc0206d98:	e822                	sd	s0,16(sp)
ffffffffc0206d9a:	e426                	sd	s1,8(sp)
ffffffffc0206d9c:	ec06                	sd	ra,24(sp)
ffffffffc0206d9e:	842e                	mv	s0,a1
ffffffffc0206da0:	84aa                	mv	s1,a0
ffffffffc0206da2:	c999                	beqz	a1,ffffffffc0206db8 <do_wait+0x22>
ffffffffc0206da4:	00090797          	auipc	a5,0x90
ffffffffc0206da8:	b1c7b783          	ld	a5,-1252(a5) # ffffffffc02968c0 <current>
ffffffffc0206dac:	7788                	ld	a0,40(a5)
ffffffffc0206dae:	4685                	li	a3,1
ffffffffc0206db0:	4611                	li	a2,4
ffffffffc0206db2:	ce0fd0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0206db6:	c909                	beqz	a0,ffffffffc0206dc8 <do_wait+0x32>
ffffffffc0206db8:	85a2                	mv	a1,s0
ffffffffc0206dba:	6442                	ld	s0,16(sp)
ffffffffc0206dbc:	60e2                	ld	ra,24(sp)
ffffffffc0206dbe:	8526                	mv	a0,s1
ffffffffc0206dc0:	64a2                	ld	s1,8(sp)
ffffffffc0206dc2:	6105                	addi	sp,sp,32
ffffffffc0206dc4:	bf4ff06f          	j	ffffffffc02061b8 <do_wait.part.0>
ffffffffc0206dc8:	60e2                	ld	ra,24(sp)
ffffffffc0206dca:	6442                	ld	s0,16(sp)
ffffffffc0206dcc:	64a2                	ld	s1,8(sp)
ffffffffc0206dce:	5575                	li	a0,-3
ffffffffc0206dd0:	6105                	addi	sp,sp,32
ffffffffc0206dd2:	8082                	ret

ffffffffc0206dd4 <do_kill>:
ffffffffc0206dd4:	1141                	addi	sp,sp,-16
ffffffffc0206dd6:	6789                	lui	a5,0x2
ffffffffc0206dd8:	e406                	sd	ra,8(sp)
ffffffffc0206dda:	e022                	sd	s0,0(sp)
ffffffffc0206ddc:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206de0:	17f9                	addi	a5,a5,-2
ffffffffc0206de2:	02e7e963          	bltu	a5,a4,ffffffffc0206e14 <do_kill+0x40>
ffffffffc0206de6:	842a                	mv	s0,a0
ffffffffc0206de8:	45a9                	li	a1,10
ffffffffc0206dea:	2501                	sext.w	a0,a0
ffffffffc0206dec:	1a4040ef          	jal	ra,ffffffffc020af90 <hash32>
ffffffffc0206df0:	02051793          	slli	a5,a0,0x20
ffffffffc0206df4:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0206df8:	0008b797          	auipc	a5,0x8b
ffffffffc0206dfc:	9c878793          	addi	a5,a5,-1592 # ffffffffc02917c0 <hash_list>
ffffffffc0206e00:	953e                	add	a0,a0,a5
ffffffffc0206e02:	87aa                	mv	a5,a0
ffffffffc0206e04:	a029                	j	ffffffffc0206e0e <do_kill+0x3a>
ffffffffc0206e06:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0206e0a:	00870b63          	beq	a4,s0,ffffffffc0206e20 <do_kill+0x4c>
ffffffffc0206e0e:	679c                	ld	a5,8(a5)
ffffffffc0206e10:	fef51be3          	bne	a0,a5,ffffffffc0206e06 <do_kill+0x32>
ffffffffc0206e14:	5475                	li	s0,-3
ffffffffc0206e16:	60a2                	ld	ra,8(sp)
ffffffffc0206e18:	8522                	mv	a0,s0
ffffffffc0206e1a:	6402                	ld	s0,0(sp)
ffffffffc0206e1c:	0141                	addi	sp,sp,16
ffffffffc0206e1e:	8082                	ret
ffffffffc0206e20:	fd87a703          	lw	a4,-40(a5)
ffffffffc0206e24:	00177693          	andi	a3,a4,1
ffffffffc0206e28:	e295                	bnez	a3,ffffffffc0206e4c <do_kill+0x78>
ffffffffc0206e2a:	4bd4                	lw	a3,20(a5)
ffffffffc0206e2c:	00176713          	ori	a4,a4,1
ffffffffc0206e30:	fce7ac23          	sw	a4,-40(a5)
ffffffffc0206e34:	4401                	li	s0,0
ffffffffc0206e36:	fe06d0e3          	bgez	a3,ffffffffc0206e16 <do_kill+0x42>
ffffffffc0206e3a:	f2878513          	addi	a0,a5,-216
ffffffffc0206e3e:	45a000ef          	jal	ra,ffffffffc0207298 <wakeup_proc>
ffffffffc0206e42:	60a2                	ld	ra,8(sp)
ffffffffc0206e44:	8522                	mv	a0,s0
ffffffffc0206e46:	6402                	ld	s0,0(sp)
ffffffffc0206e48:	0141                	addi	sp,sp,16
ffffffffc0206e4a:	8082                	ret
ffffffffc0206e4c:	545d                	li	s0,-9
ffffffffc0206e4e:	b7e1                	j	ffffffffc0206e16 <do_kill+0x42>

ffffffffc0206e50 <proc_init>:
ffffffffc0206e50:	1101                	addi	sp,sp,-32
ffffffffc0206e52:	e426                	sd	s1,8(sp)
ffffffffc0206e54:	0008f797          	auipc	a5,0x8f
ffffffffc0206e58:	96c78793          	addi	a5,a5,-1684 # ffffffffc02957c0 <proc_list>
ffffffffc0206e5c:	ec06                	sd	ra,24(sp)
ffffffffc0206e5e:	e822                	sd	s0,16(sp)
ffffffffc0206e60:	e04a                	sd	s2,0(sp)
ffffffffc0206e62:	0008b497          	auipc	s1,0x8b
ffffffffc0206e66:	95e48493          	addi	s1,s1,-1698 # ffffffffc02917c0 <hash_list>
ffffffffc0206e6a:	e79c                	sd	a5,8(a5)
ffffffffc0206e6c:	e39c                	sd	a5,0(a5)
ffffffffc0206e6e:	0008f717          	auipc	a4,0x8f
ffffffffc0206e72:	95270713          	addi	a4,a4,-1710 # ffffffffc02957c0 <proc_list>
ffffffffc0206e76:	87a6                	mv	a5,s1
ffffffffc0206e78:	e79c                	sd	a5,8(a5)
ffffffffc0206e7a:	e39c                	sd	a5,0(a5)
ffffffffc0206e7c:	07c1                	addi	a5,a5,16
ffffffffc0206e7e:	fef71de3          	bne	a4,a5,ffffffffc0206e78 <proc_init+0x28>
ffffffffc0206e82:	b53fe0ef          	jal	ra,ffffffffc02059d4 <alloc_proc>
ffffffffc0206e86:	00090917          	auipc	s2,0x90
ffffffffc0206e8a:	a4290913          	addi	s2,s2,-1470 # ffffffffc02968c8 <idleproc>
ffffffffc0206e8e:	00a93023          	sd	a0,0(s2)
ffffffffc0206e92:	842a                	mv	s0,a0
ffffffffc0206e94:	12050863          	beqz	a0,ffffffffc0206fc4 <proc_init+0x174>
ffffffffc0206e98:	4789                	li	a5,2
ffffffffc0206e9a:	e11c                	sd	a5,0(a0)
ffffffffc0206e9c:	0000a797          	auipc	a5,0xa
ffffffffc0206ea0:	16478793          	addi	a5,a5,356 # ffffffffc0211000 <bootstack>
ffffffffc0206ea4:	e91c                	sd	a5,16(a0)
ffffffffc0206ea6:	4785                	li	a5,1
ffffffffc0206ea8:	ed1c                	sd	a5,24(a0)
ffffffffc0206eaa:	b24fe0ef          	jal	ra,ffffffffc02051ce <files_create>
ffffffffc0206eae:	14a43423          	sd	a0,328(s0)
ffffffffc0206eb2:	0e050d63          	beqz	a0,ffffffffc0206fac <proc_init+0x15c>
ffffffffc0206eb6:	00093403          	ld	s0,0(s2)
ffffffffc0206eba:	4641                	li	a2,16
ffffffffc0206ebc:	4581                	li	a1,0
ffffffffc0206ebe:	14843703          	ld	a4,328(s0)
ffffffffc0206ec2:	0b440413          	addi	s0,s0,180
ffffffffc0206ec6:	8522                	mv	a0,s0
ffffffffc0206ec8:	4b1c                	lw	a5,16(a4)
ffffffffc0206eca:	2785                	addiw	a5,a5,1
ffffffffc0206ecc:	cb1c                	sw	a5,16(a4)
ffffffffc0206ece:	5f6040ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0206ed2:	463d                	li	a2,15
ffffffffc0206ed4:	00007597          	auipc	a1,0x7
ffffffffc0206ed8:	9fc58593          	addi	a1,a1,-1540 # ffffffffc020d8d0 <CSWTCH.79+0x518>
ffffffffc0206edc:	8522                	mv	a0,s0
ffffffffc0206ede:	638040ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc0206ee2:	00090717          	auipc	a4,0x90
ffffffffc0206ee6:	9f670713          	addi	a4,a4,-1546 # ffffffffc02968d8 <nr_process>
ffffffffc0206eea:	431c                	lw	a5,0(a4)
ffffffffc0206eec:	00093683          	ld	a3,0(s2)
ffffffffc0206ef0:	4601                	li	a2,0
ffffffffc0206ef2:	2785                	addiw	a5,a5,1
ffffffffc0206ef4:	4581                	li	a1,0
ffffffffc0206ef6:	fffff517          	auipc	a0,0xfffff
ffffffffc0206efa:	49450513          	addi	a0,a0,1172 # ffffffffc020638a <init_main>
ffffffffc0206efe:	c31c                	sw	a5,0(a4)
ffffffffc0206f00:	00090797          	auipc	a5,0x90
ffffffffc0206f04:	9cd7b023          	sd	a3,-1600(a5) # ffffffffc02968c0 <current>
ffffffffc0206f08:	8feff0ef          	jal	ra,ffffffffc0206006 <kernel_thread>
ffffffffc0206f0c:	842a                	mv	s0,a0
ffffffffc0206f0e:	08a05363          	blez	a0,ffffffffc0206f94 <proc_init+0x144>
ffffffffc0206f12:	6789                	lui	a5,0x2
ffffffffc0206f14:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206f18:	17f9                	addi	a5,a5,-2
ffffffffc0206f1a:	2501                	sext.w	a0,a0
ffffffffc0206f1c:	02e7e363          	bltu	a5,a4,ffffffffc0206f42 <proc_init+0xf2>
ffffffffc0206f20:	45a9                	li	a1,10
ffffffffc0206f22:	06e040ef          	jal	ra,ffffffffc020af90 <hash32>
ffffffffc0206f26:	02051793          	slli	a5,a0,0x20
ffffffffc0206f2a:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0206f2e:	96a6                	add	a3,a3,s1
ffffffffc0206f30:	87b6                	mv	a5,a3
ffffffffc0206f32:	a029                	j	ffffffffc0206f3c <proc_init+0xec>
ffffffffc0206f34:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_bin_swap_img_size-0x5dd4>
ffffffffc0206f38:	04870b63          	beq	a4,s0,ffffffffc0206f8e <proc_init+0x13e>
ffffffffc0206f3c:	679c                	ld	a5,8(a5)
ffffffffc0206f3e:	fef69be3          	bne	a3,a5,ffffffffc0206f34 <proc_init+0xe4>
ffffffffc0206f42:	4781                	li	a5,0
ffffffffc0206f44:	0b478493          	addi	s1,a5,180
ffffffffc0206f48:	4641                	li	a2,16
ffffffffc0206f4a:	4581                	li	a1,0
ffffffffc0206f4c:	00090417          	auipc	s0,0x90
ffffffffc0206f50:	98440413          	addi	s0,s0,-1660 # ffffffffc02968d0 <initproc>
ffffffffc0206f54:	8526                	mv	a0,s1
ffffffffc0206f56:	e01c                	sd	a5,0(s0)
ffffffffc0206f58:	56c040ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0206f5c:	463d                	li	a2,15
ffffffffc0206f5e:	00007597          	auipc	a1,0x7
ffffffffc0206f62:	99a58593          	addi	a1,a1,-1638 # ffffffffc020d8f8 <CSWTCH.79+0x540>
ffffffffc0206f66:	8526                	mv	a0,s1
ffffffffc0206f68:	5ae040ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc0206f6c:	00093783          	ld	a5,0(s2)
ffffffffc0206f70:	c7d1                	beqz	a5,ffffffffc0206ffc <proc_init+0x1ac>
ffffffffc0206f72:	43dc                	lw	a5,4(a5)
ffffffffc0206f74:	e7c1                	bnez	a5,ffffffffc0206ffc <proc_init+0x1ac>
ffffffffc0206f76:	601c                	ld	a5,0(s0)
ffffffffc0206f78:	c3b5                	beqz	a5,ffffffffc0206fdc <proc_init+0x18c>
ffffffffc0206f7a:	43d8                	lw	a4,4(a5)
ffffffffc0206f7c:	4785                	li	a5,1
ffffffffc0206f7e:	04f71f63          	bne	a4,a5,ffffffffc0206fdc <proc_init+0x18c>
ffffffffc0206f82:	60e2                	ld	ra,24(sp)
ffffffffc0206f84:	6442                	ld	s0,16(sp)
ffffffffc0206f86:	64a2                	ld	s1,8(sp)
ffffffffc0206f88:	6902                	ld	s2,0(sp)
ffffffffc0206f8a:	6105                	addi	sp,sp,32
ffffffffc0206f8c:	8082                	ret
ffffffffc0206f8e:	f2878793          	addi	a5,a5,-216
ffffffffc0206f92:	bf4d                	j	ffffffffc0206f44 <proc_init+0xf4>
ffffffffc0206f94:	00007617          	auipc	a2,0x7
ffffffffc0206f98:	94460613          	addi	a2,a2,-1724 # ffffffffc020d8d8 <CSWTCH.79+0x520>
ffffffffc0206f9c:	4ed00593          	li	a1,1261
ffffffffc0206fa0:	00006517          	auipc	a0,0x6
ffffffffc0206fa4:	52850513          	addi	a0,a0,1320 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206fa8:	cf6f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206fac:	00007617          	auipc	a2,0x7
ffffffffc0206fb0:	8fc60613          	addi	a2,a2,-1796 # ffffffffc020d8a8 <CSWTCH.79+0x4f0>
ffffffffc0206fb4:	4e100593          	li	a1,1249
ffffffffc0206fb8:	00006517          	auipc	a0,0x6
ffffffffc0206fbc:	51050513          	addi	a0,a0,1296 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206fc0:	cdef90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206fc4:	00007617          	auipc	a2,0x7
ffffffffc0206fc8:	8cc60613          	addi	a2,a2,-1844 # ffffffffc020d890 <CSWTCH.79+0x4d8>
ffffffffc0206fcc:	4d700593          	li	a1,1239
ffffffffc0206fd0:	00006517          	auipc	a0,0x6
ffffffffc0206fd4:	4f850513          	addi	a0,a0,1272 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206fd8:	cc6f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206fdc:	00007697          	auipc	a3,0x7
ffffffffc0206fe0:	94c68693          	addi	a3,a3,-1716 # ffffffffc020d928 <CSWTCH.79+0x570>
ffffffffc0206fe4:	00005617          	auipc	a2,0x5
ffffffffc0206fe8:	9c460613          	addi	a2,a2,-1596 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0206fec:	4f400593          	li	a1,1268
ffffffffc0206ff0:	00006517          	auipc	a0,0x6
ffffffffc0206ff4:	4d850513          	addi	a0,a0,1240 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0206ff8:	ca6f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206ffc:	00007697          	auipc	a3,0x7
ffffffffc0207000:	90468693          	addi	a3,a3,-1788 # ffffffffc020d900 <CSWTCH.79+0x548>
ffffffffc0207004:	00005617          	auipc	a2,0x5
ffffffffc0207008:	9a460613          	addi	a2,a2,-1628 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020700c:	4f300593          	li	a1,1267
ffffffffc0207010:	00006517          	auipc	a0,0x6
ffffffffc0207014:	4b850513          	addi	a0,a0,1208 # ffffffffc020d4c8 <CSWTCH.79+0x110>
ffffffffc0207018:	c86f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020701c <cpu_idle>:
ffffffffc020701c:	1141                	addi	sp,sp,-16
ffffffffc020701e:	e022                	sd	s0,0(sp)
ffffffffc0207020:	e406                	sd	ra,8(sp)
ffffffffc0207022:	00090417          	auipc	s0,0x90
ffffffffc0207026:	89e40413          	addi	s0,s0,-1890 # ffffffffc02968c0 <current>
ffffffffc020702a:	6018                	ld	a4,0(s0)
ffffffffc020702c:	6f1c                	ld	a5,24(a4)
ffffffffc020702e:	dffd                	beqz	a5,ffffffffc020702c <cpu_idle+0x10>
ffffffffc0207030:	31a000ef          	jal	ra,ffffffffc020734a <schedule>
ffffffffc0207034:	bfdd                	j	ffffffffc020702a <cpu_idle+0xe>

ffffffffc0207036 <lab6_set_priority>:
ffffffffc0207036:	1141                	addi	sp,sp,-16
ffffffffc0207038:	e022                	sd	s0,0(sp)
ffffffffc020703a:	85aa                	mv	a1,a0
ffffffffc020703c:	842a                	mv	s0,a0
ffffffffc020703e:	00007517          	auipc	a0,0x7
ffffffffc0207042:	91250513          	addi	a0,a0,-1774 # ffffffffc020d950 <CSWTCH.79+0x598>
ffffffffc0207046:	e406                	sd	ra,8(sp)
ffffffffc0207048:	95ef90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020704c:	00090797          	auipc	a5,0x90
ffffffffc0207050:	8747b783          	ld	a5,-1932(a5) # ffffffffc02968c0 <current>
ffffffffc0207054:	e801                	bnez	s0,ffffffffc0207064 <lab6_set_priority+0x2e>
ffffffffc0207056:	60a2                	ld	ra,8(sp)
ffffffffc0207058:	6402                	ld	s0,0(sp)
ffffffffc020705a:	4705                	li	a4,1
ffffffffc020705c:	14e7a223          	sw	a4,324(a5)
ffffffffc0207060:	0141                	addi	sp,sp,16
ffffffffc0207062:	8082                	ret
ffffffffc0207064:	60a2                	ld	ra,8(sp)
ffffffffc0207066:	1487a223          	sw	s0,324(a5)
ffffffffc020706a:	6402                	ld	s0,0(sp)
ffffffffc020706c:	0141                	addi	sp,sp,16
ffffffffc020706e:	8082                	ret

ffffffffc0207070 <do_sleep>:
ffffffffc0207070:	c539                	beqz	a0,ffffffffc02070be <do_sleep+0x4e>
ffffffffc0207072:	7179                	addi	sp,sp,-48
ffffffffc0207074:	f022                	sd	s0,32(sp)
ffffffffc0207076:	f406                	sd	ra,40(sp)
ffffffffc0207078:	842a                	mv	s0,a0
ffffffffc020707a:	100027f3          	csrr	a5,sstatus
ffffffffc020707e:	8b89                	andi	a5,a5,2
ffffffffc0207080:	e3a9                	bnez	a5,ffffffffc02070c2 <do_sleep+0x52>
ffffffffc0207082:	00090797          	auipc	a5,0x90
ffffffffc0207086:	83e7b783          	ld	a5,-1986(a5) # ffffffffc02968c0 <current>
ffffffffc020708a:	0818                	addi	a4,sp,16
ffffffffc020708c:	c02a                	sw	a0,0(sp)
ffffffffc020708e:	ec3a                	sd	a4,24(sp)
ffffffffc0207090:	e83a                	sd	a4,16(sp)
ffffffffc0207092:	e43e                	sd	a5,8(sp)
ffffffffc0207094:	4705                	li	a4,1
ffffffffc0207096:	c398                	sw	a4,0(a5)
ffffffffc0207098:	80000737          	lui	a4,0x80000
ffffffffc020709c:	840a                	mv	s0,sp
ffffffffc020709e:	0709                	addi	a4,a4,2
ffffffffc02070a0:	0ee7a623          	sw	a4,236(a5)
ffffffffc02070a4:	8522                	mv	a0,s0
ffffffffc02070a6:	364000ef          	jal	ra,ffffffffc020740a <add_timer>
ffffffffc02070aa:	2a0000ef          	jal	ra,ffffffffc020734a <schedule>
ffffffffc02070ae:	8522                	mv	a0,s0
ffffffffc02070b0:	422000ef          	jal	ra,ffffffffc02074d2 <del_timer>
ffffffffc02070b4:	70a2                	ld	ra,40(sp)
ffffffffc02070b6:	7402                	ld	s0,32(sp)
ffffffffc02070b8:	4501                	li	a0,0
ffffffffc02070ba:	6145                	addi	sp,sp,48
ffffffffc02070bc:	8082                	ret
ffffffffc02070be:	4501                	li	a0,0
ffffffffc02070c0:	8082                	ret
ffffffffc02070c2:	bb1f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02070c6:	0008f797          	auipc	a5,0x8f
ffffffffc02070ca:	7fa7b783          	ld	a5,2042(a5) # ffffffffc02968c0 <current>
ffffffffc02070ce:	0818                	addi	a4,sp,16
ffffffffc02070d0:	c022                	sw	s0,0(sp)
ffffffffc02070d2:	e43e                	sd	a5,8(sp)
ffffffffc02070d4:	ec3a                	sd	a4,24(sp)
ffffffffc02070d6:	e83a                	sd	a4,16(sp)
ffffffffc02070d8:	4705                	li	a4,1
ffffffffc02070da:	c398                	sw	a4,0(a5)
ffffffffc02070dc:	80000737          	lui	a4,0x80000
ffffffffc02070e0:	0709                	addi	a4,a4,2
ffffffffc02070e2:	840a                	mv	s0,sp
ffffffffc02070e4:	8522                	mv	a0,s0
ffffffffc02070e6:	0ee7a623          	sw	a4,236(a5)
ffffffffc02070ea:	320000ef          	jal	ra,ffffffffc020740a <add_timer>
ffffffffc02070ee:	b7ff90ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02070f2:	bf65                	j	ffffffffc02070aa <do_sleep+0x3a>

ffffffffc02070f4 <switch_to>:
ffffffffc02070f4:	00153023          	sd	ra,0(a0)
ffffffffc02070f8:	00253423          	sd	sp,8(a0)
ffffffffc02070fc:	e900                	sd	s0,16(a0)
ffffffffc02070fe:	ed04                	sd	s1,24(a0)
ffffffffc0207100:	03253023          	sd	s2,32(a0)
ffffffffc0207104:	03353423          	sd	s3,40(a0)
ffffffffc0207108:	03453823          	sd	s4,48(a0)
ffffffffc020710c:	03553c23          	sd	s5,56(a0)
ffffffffc0207110:	05653023          	sd	s6,64(a0)
ffffffffc0207114:	05753423          	sd	s7,72(a0)
ffffffffc0207118:	05853823          	sd	s8,80(a0)
ffffffffc020711c:	05953c23          	sd	s9,88(a0)
ffffffffc0207120:	07a53023          	sd	s10,96(a0)
ffffffffc0207124:	07b53423          	sd	s11,104(a0)
ffffffffc0207128:	0005b083          	ld	ra,0(a1)
ffffffffc020712c:	0085b103          	ld	sp,8(a1)
ffffffffc0207130:	6980                	ld	s0,16(a1)
ffffffffc0207132:	6d84                	ld	s1,24(a1)
ffffffffc0207134:	0205b903          	ld	s2,32(a1)
ffffffffc0207138:	0285b983          	ld	s3,40(a1)
ffffffffc020713c:	0305ba03          	ld	s4,48(a1)
ffffffffc0207140:	0385ba83          	ld	s5,56(a1)
ffffffffc0207144:	0405bb03          	ld	s6,64(a1)
ffffffffc0207148:	0485bb83          	ld	s7,72(a1)
ffffffffc020714c:	0505bc03          	ld	s8,80(a1)
ffffffffc0207150:	0585bc83          	ld	s9,88(a1)
ffffffffc0207154:	0605bd03          	ld	s10,96(a1)
ffffffffc0207158:	0685bd83          	ld	s11,104(a1)
ffffffffc020715c:	8082                	ret

ffffffffc020715e <RR_init>:
ffffffffc020715e:	e508                	sd	a0,8(a0)
ffffffffc0207160:	e108                	sd	a0,0(a0)
ffffffffc0207162:	00052823          	sw	zero,16(a0)
ffffffffc0207166:	8082                	ret

ffffffffc0207168 <RR_pick_next>:
ffffffffc0207168:	651c                	ld	a5,8(a0)
ffffffffc020716a:	00f50563          	beq	a0,a5,ffffffffc0207174 <RR_pick_next+0xc>
ffffffffc020716e:	ef078513          	addi	a0,a5,-272
ffffffffc0207172:	8082                	ret
ffffffffc0207174:	4501                	li	a0,0
ffffffffc0207176:	8082                	ret

ffffffffc0207178 <RR_proc_tick>:
ffffffffc0207178:	1205a783          	lw	a5,288(a1)
ffffffffc020717c:	00f05563          	blez	a5,ffffffffc0207186 <RR_proc_tick+0xe>
ffffffffc0207180:	37fd                	addiw	a5,a5,-1
ffffffffc0207182:	12f5a023          	sw	a5,288(a1)
ffffffffc0207186:	e399                	bnez	a5,ffffffffc020718c <RR_proc_tick+0x14>
ffffffffc0207188:	4785                	li	a5,1
ffffffffc020718a:	ed9c                	sd	a5,24(a1)
ffffffffc020718c:	8082                	ret

ffffffffc020718e <RR_dequeue>:
ffffffffc020718e:	1185b703          	ld	a4,280(a1)
ffffffffc0207192:	11058793          	addi	a5,a1,272
ffffffffc0207196:	02e78363          	beq	a5,a4,ffffffffc02071bc <RR_dequeue+0x2e>
ffffffffc020719a:	1085b683          	ld	a3,264(a1)
ffffffffc020719e:	00a69f63          	bne	a3,a0,ffffffffc02071bc <RR_dequeue+0x2e>
ffffffffc02071a2:	1105b503          	ld	a0,272(a1)
ffffffffc02071a6:	4a90                	lw	a2,16(a3)
ffffffffc02071a8:	e518                	sd	a4,8(a0)
ffffffffc02071aa:	e308                	sd	a0,0(a4)
ffffffffc02071ac:	10f5bc23          	sd	a5,280(a1)
ffffffffc02071b0:	10f5b823          	sd	a5,272(a1)
ffffffffc02071b4:	fff6079b          	addiw	a5,a2,-1
ffffffffc02071b8:	ca9c                	sw	a5,16(a3)
ffffffffc02071ba:	8082                	ret
ffffffffc02071bc:	1141                	addi	sp,sp,-16
ffffffffc02071be:	00006697          	auipc	a3,0x6
ffffffffc02071c2:	7aa68693          	addi	a3,a3,1962 # ffffffffc020d968 <CSWTCH.79+0x5b0>
ffffffffc02071c6:	00004617          	auipc	a2,0x4
ffffffffc02071ca:	7e260613          	addi	a2,a2,2018 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02071ce:	03c00593          	li	a1,60
ffffffffc02071d2:	00006517          	auipc	a0,0x6
ffffffffc02071d6:	7ce50513          	addi	a0,a0,1998 # ffffffffc020d9a0 <CSWTCH.79+0x5e8>
ffffffffc02071da:	e406                	sd	ra,8(sp)
ffffffffc02071dc:	ac2f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02071e0 <RR_enqueue>:
ffffffffc02071e0:	1185b703          	ld	a4,280(a1)
ffffffffc02071e4:	11058793          	addi	a5,a1,272
ffffffffc02071e8:	02e79d63          	bne	a5,a4,ffffffffc0207222 <RR_enqueue+0x42>
ffffffffc02071ec:	6118                	ld	a4,0(a0)
ffffffffc02071ee:	1205a683          	lw	a3,288(a1)
ffffffffc02071f2:	e11c                	sd	a5,0(a0)
ffffffffc02071f4:	e71c                	sd	a5,8(a4)
ffffffffc02071f6:	10a5bc23          	sd	a0,280(a1)
ffffffffc02071fa:	10e5b823          	sd	a4,272(a1)
ffffffffc02071fe:	495c                	lw	a5,20(a0)
ffffffffc0207200:	ea89                	bnez	a3,ffffffffc0207212 <RR_enqueue+0x32>
ffffffffc0207202:	12f5a023          	sw	a5,288(a1)
ffffffffc0207206:	491c                	lw	a5,16(a0)
ffffffffc0207208:	10a5b423          	sd	a0,264(a1)
ffffffffc020720c:	2785                	addiw	a5,a5,1
ffffffffc020720e:	c91c                	sw	a5,16(a0)
ffffffffc0207210:	8082                	ret
ffffffffc0207212:	fed7c8e3          	blt	a5,a3,ffffffffc0207202 <RR_enqueue+0x22>
ffffffffc0207216:	491c                	lw	a5,16(a0)
ffffffffc0207218:	10a5b423          	sd	a0,264(a1)
ffffffffc020721c:	2785                	addiw	a5,a5,1
ffffffffc020721e:	c91c                	sw	a5,16(a0)
ffffffffc0207220:	8082                	ret
ffffffffc0207222:	1141                	addi	sp,sp,-16
ffffffffc0207224:	00006697          	auipc	a3,0x6
ffffffffc0207228:	79c68693          	addi	a3,a3,1948 # ffffffffc020d9c0 <CSWTCH.79+0x608>
ffffffffc020722c:	00004617          	auipc	a2,0x4
ffffffffc0207230:	77c60613          	addi	a2,a2,1916 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207234:	02800593          	li	a1,40
ffffffffc0207238:	00006517          	auipc	a0,0x6
ffffffffc020723c:	76850513          	addi	a0,a0,1896 # ffffffffc020d9a0 <CSWTCH.79+0x5e8>
ffffffffc0207240:	e406                	sd	ra,8(sp)
ffffffffc0207242:	a5cf90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207246 <sched_init>:
ffffffffc0207246:	1141                	addi	sp,sp,-16
ffffffffc0207248:	0008a717          	auipc	a4,0x8a
ffffffffc020724c:	dd870713          	addi	a4,a4,-552 # ffffffffc0291020 <default_sched_class>
ffffffffc0207250:	e022                	sd	s0,0(sp)
ffffffffc0207252:	e406                	sd	ra,8(sp)
ffffffffc0207254:	0008e797          	auipc	a5,0x8e
ffffffffc0207258:	59c78793          	addi	a5,a5,1436 # ffffffffc02957f0 <timer_list>
ffffffffc020725c:	6714                	ld	a3,8(a4)
ffffffffc020725e:	0008e517          	auipc	a0,0x8e
ffffffffc0207262:	57250513          	addi	a0,a0,1394 # ffffffffc02957d0 <__rq>
ffffffffc0207266:	e79c                	sd	a5,8(a5)
ffffffffc0207268:	e39c                	sd	a5,0(a5)
ffffffffc020726a:	4795                	li	a5,5
ffffffffc020726c:	c95c                	sw	a5,20(a0)
ffffffffc020726e:	0008f417          	auipc	s0,0x8f
ffffffffc0207272:	67a40413          	addi	s0,s0,1658 # ffffffffc02968e8 <sched_class>
ffffffffc0207276:	0008f797          	auipc	a5,0x8f
ffffffffc020727a:	66a7b523          	sd	a0,1642(a5) # ffffffffc02968e0 <rq>
ffffffffc020727e:	e018                	sd	a4,0(s0)
ffffffffc0207280:	9682                	jalr	a3
ffffffffc0207282:	601c                	ld	a5,0(s0)
ffffffffc0207284:	6402                	ld	s0,0(sp)
ffffffffc0207286:	60a2                	ld	ra,8(sp)
ffffffffc0207288:	638c                	ld	a1,0(a5)
ffffffffc020728a:	00006517          	auipc	a0,0x6
ffffffffc020728e:	76650513          	addi	a0,a0,1894 # ffffffffc020d9f0 <CSWTCH.79+0x638>
ffffffffc0207292:	0141                	addi	sp,sp,16
ffffffffc0207294:	f13f806f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0207298 <wakeup_proc>:
ffffffffc0207298:	4118                	lw	a4,0(a0)
ffffffffc020729a:	1101                	addi	sp,sp,-32
ffffffffc020729c:	ec06                	sd	ra,24(sp)
ffffffffc020729e:	e822                	sd	s0,16(sp)
ffffffffc02072a0:	e426                	sd	s1,8(sp)
ffffffffc02072a2:	478d                	li	a5,3
ffffffffc02072a4:	08f70363          	beq	a4,a5,ffffffffc020732a <wakeup_proc+0x92>
ffffffffc02072a8:	842a                	mv	s0,a0
ffffffffc02072aa:	100027f3          	csrr	a5,sstatus
ffffffffc02072ae:	8b89                	andi	a5,a5,2
ffffffffc02072b0:	4481                	li	s1,0
ffffffffc02072b2:	e7bd                	bnez	a5,ffffffffc0207320 <wakeup_proc+0x88>
ffffffffc02072b4:	4789                	li	a5,2
ffffffffc02072b6:	04f70863          	beq	a4,a5,ffffffffc0207306 <wakeup_proc+0x6e>
ffffffffc02072ba:	c01c                	sw	a5,0(s0)
ffffffffc02072bc:	0e042623          	sw	zero,236(s0)
ffffffffc02072c0:	0008f797          	auipc	a5,0x8f
ffffffffc02072c4:	6007b783          	ld	a5,1536(a5) # ffffffffc02968c0 <current>
ffffffffc02072c8:	02878363          	beq	a5,s0,ffffffffc02072ee <wakeup_proc+0x56>
ffffffffc02072cc:	0008f797          	auipc	a5,0x8f
ffffffffc02072d0:	5fc7b783          	ld	a5,1532(a5) # ffffffffc02968c8 <idleproc>
ffffffffc02072d4:	00f40d63          	beq	s0,a5,ffffffffc02072ee <wakeup_proc+0x56>
ffffffffc02072d8:	0008f797          	auipc	a5,0x8f
ffffffffc02072dc:	6107b783          	ld	a5,1552(a5) # ffffffffc02968e8 <sched_class>
ffffffffc02072e0:	6b9c                	ld	a5,16(a5)
ffffffffc02072e2:	85a2                	mv	a1,s0
ffffffffc02072e4:	0008f517          	auipc	a0,0x8f
ffffffffc02072e8:	5fc53503          	ld	a0,1532(a0) # ffffffffc02968e0 <rq>
ffffffffc02072ec:	9782                	jalr	a5
ffffffffc02072ee:	e491                	bnez	s1,ffffffffc02072fa <wakeup_proc+0x62>
ffffffffc02072f0:	60e2                	ld	ra,24(sp)
ffffffffc02072f2:	6442                	ld	s0,16(sp)
ffffffffc02072f4:	64a2                	ld	s1,8(sp)
ffffffffc02072f6:	6105                	addi	sp,sp,32
ffffffffc02072f8:	8082                	ret
ffffffffc02072fa:	6442                	ld	s0,16(sp)
ffffffffc02072fc:	60e2                	ld	ra,24(sp)
ffffffffc02072fe:	64a2                	ld	s1,8(sp)
ffffffffc0207300:	6105                	addi	sp,sp,32
ffffffffc0207302:	96bf906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207306:	00006617          	auipc	a2,0x6
ffffffffc020730a:	73a60613          	addi	a2,a2,1850 # ffffffffc020da40 <CSWTCH.79+0x688>
ffffffffc020730e:	05200593          	li	a1,82
ffffffffc0207312:	00006517          	auipc	a0,0x6
ffffffffc0207316:	71650513          	addi	a0,a0,1814 # ffffffffc020da28 <CSWTCH.79+0x670>
ffffffffc020731a:	9ecf90ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc020731e:	bfc1                	j	ffffffffc02072ee <wakeup_proc+0x56>
ffffffffc0207320:	953f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207324:	4018                	lw	a4,0(s0)
ffffffffc0207326:	4485                	li	s1,1
ffffffffc0207328:	b771                	j	ffffffffc02072b4 <wakeup_proc+0x1c>
ffffffffc020732a:	00006697          	auipc	a3,0x6
ffffffffc020732e:	6de68693          	addi	a3,a3,1758 # ffffffffc020da08 <CSWTCH.79+0x650>
ffffffffc0207332:	00004617          	auipc	a2,0x4
ffffffffc0207336:	67660613          	addi	a2,a2,1654 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020733a:	04300593          	li	a1,67
ffffffffc020733e:	00006517          	auipc	a0,0x6
ffffffffc0207342:	6ea50513          	addi	a0,a0,1770 # ffffffffc020da28 <CSWTCH.79+0x670>
ffffffffc0207346:	958f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020734a <schedule>:
ffffffffc020734a:	7179                	addi	sp,sp,-48
ffffffffc020734c:	f406                	sd	ra,40(sp)
ffffffffc020734e:	f022                	sd	s0,32(sp)
ffffffffc0207350:	ec26                	sd	s1,24(sp)
ffffffffc0207352:	e84a                	sd	s2,16(sp)
ffffffffc0207354:	e44e                	sd	s3,8(sp)
ffffffffc0207356:	e052                	sd	s4,0(sp)
ffffffffc0207358:	100027f3          	csrr	a5,sstatus
ffffffffc020735c:	8b89                	andi	a5,a5,2
ffffffffc020735e:	4a01                	li	s4,0
ffffffffc0207360:	e3cd                	bnez	a5,ffffffffc0207402 <schedule+0xb8>
ffffffffc0207362:	0008f497          	auipc	s1,0x8f
ffffffffc0207366:	55e48493          	addi	s1,s1,1374 # ffffffffc02968c0 <current>
ffffffffc020736a:	608c                	ld	a1,0(s1)
ffffffffc020736c:	0008f997          	auipc	s3,0x8f
ffffffffc0207370:	57c98993          	addi	s3,s3,1404 # ffffffffc02968e8 <sched_class>
ffffffffc0207374:	0008f917          	auipc	s2,0x8f
ffffffffc0207378:	56c90913          	addi	s2,s2,1388 # ffffffffc02968e0 <rq>
ffffffffc020737c:	4194                	lw	a3,0(a1)
ffffffffc020737e:	0005bc23          	sd	zero,24(a1)
ffffffffc0207382:	4709                	li	a4,2
ffffffffc0207384:	0009b783          	ld	a5,0(s3)
ffffffffc0207388:	00093503          	ld	a0,0(s2)
ffffffffc020738c:	04e68e63          	beq	a3,a4,ffffffffc02073e8 <schedule+0x9e>
ffffffffc0207390:	739c                	ld	a5,32(a5)
ffffffffc0207392:	9782                	jalr	a5
ffffffffc0207394:	842a                	mv	s0,a0
ffffffffc0207396:	c521                	beqz	a0,ffffffffc02073de <schedule+0x94>
ffffffffc0207398:	0009b783          	ld	a5,0(s3)
ffffffffc020739c:	00093503          	ld	a0,0(s2)
ffffffffc02073a0:	85a2                	mv	a1,s0
ffffffffc02073a2:	6f9c                	ld	a5,24(a5)
ffffffffc02073a4:	9782                	jalr	a5
ffffffffc02073a6:	441c                	lw	a5,8(s0)
ffffffffc02073a8:	6098                	ld	a4,0(s1)
ffffffffc02073aa:	2785                	addiw	a5,a5,1
ffffffffc02073ac:	c41c                	sw	a5,8(s0)
ffffffffc02073ae:	00870563          	beq	a4,s0,ffffffffc02073b8 <schedule+0x6e>
ffffffffc02073b2:	8522                	mv	a0,s0
ffffffffc02073b4:	fc0fe0ef          	jal	ra,ffffffffc0205b74 <proc_run>
ffffffffc02073b8:	000a1a63          	bnez	s4,ffffffffc02073cc <schedule+0x82>
ffffffffc02073bc:	70a2                	ld	ra,40(sp)
ffffffffc02073be:	7402                	ld	s0,32(sp)
ffffffffc02073c0:	64e2                	ld	s1,24(sp)
ffffffffc02073c2:	6942                	ld	s2,16(sp)
ffffffffc02073c4:	69a2                	ld	s3,8(sp)
ffffffffc02073c6:	6a02                	ld	s4,0(sp)
ffffffffc02073c8:	6145                	addi	sp,sp,48
ffffffffc02073ca:	8082                	ret
ffffffffc02073cc:	7402                	ld	s0,32(sp)
ffffffffc02073ce:	70a2                	ld	ra,40(sp)
ffffffffc02073d0:	64e2                	ld	s1,24(sp)
ffffffffc02073d2:	6942                	ld	s2,16(sp)
ffffffffc02073d4:	69a2                	ld	s3,8(sp)
ffffffffc02073d6:	6a02                	ld	s4,0(sp)
ffffffffc02073d8:	6145                	addi	sp,sp,48
ffffffffc02073da:	893f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02073de:	0008f417          	auipc	s0,0x8f
ffffffffc02073e2:	4ea43403          	ld	s0,1258(s0) # ffffffffc02968c8 <idleproc>
ffffffffc02073e6:	b7c1                	j	ffffffffc02073a6 <schedule+0x5c>
ffffffffc02073e8:	0008f717          	auipc	a4,0x8f
ffffffffc02073ec:	4e073703          	ld	a4,1248(a4) # ffffffffc02968c8 <idleproc>
ffffffffc02073f0:	fae580e3          	beq	a1,a4,ffffffffc0207390 <schedule+0x46>
ffffffffc02073f4:	6b9c                	ld	a5,16(a5)
ffffffffc02073f6:	9782                	jalr	a5
ffffffffc02073f8:	0009b783          	ld	a5,0(s3)
ffffffffc02073fc:	00093503          	ld	a0,0(s2)
ffffffffc0207400:	bf41                	j	ffffffffc0207390 <schedule+0x46>
ffffffffc0207402:	871f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207406:	4a05                	li	s4,1
ffffffffc0207408:	bfa9                	j	ffffffffc0207362 <schedule+0x18>

ffffffffc020740a <add_timer>:
ffffffffc020740a:	1141                	addi	sp,sp,-16
ffffffffc020740c:	e022                	sd	s0,0(sp)
ffffffffc020740e:	e406                	sd	ra,8(sp)
ffffffffc0207410:	842a                	mv	s0,a0
ffffffffc0207412:	100027f3          	csrr	a5,sstatus
ffffffffc0207416:	8b89                	andi	a5,a5,2
ffffffffc0207418:	4501                	li	a0,0
ffffffffc020741a:	eba5                	bnez	a5,ffffffffc020748a <add_timer+0x80>
ffffffffc020741c:	401c                	lw	a5,0(s0)
ffffffffc020741e:	cbb5                	beqz	a5,ffffffffc0207492 <add_timer+0x88>
ffffffffc0207420:	6418                	ld	a4,8(s0)
ffffffffc0207422:	cb25                	beqz	a4,ffffffffc0207492 <add_timer+0x88>
ffffffffc0207424:	6c18                	ld	a4,24(s0)
ffffffffc0207426:	01040593          	addi	a1,s0,16
ffffffffc020742a:	08e59463          	bne	a1,a4,ffffffffc02074b2 <add_timer+0xa8>
ffffffffc020742e:	0008e617          	auipc	a2,0x8e
ffffffffc0207432:	3c260613          	addi	a2,a2,962 # ffffffffc02957f0 <timer_list>
ffffffffc0207436:	6618                	ld	a4,8(a2)
ffffffffc0207438:	00c71863          	bne	a4,a2,ffffffffc0207448 <add_timer+0x3e>
ffffffffc020743c:	a80d                	j	ffffffffc020746e <add_timer+0x64>
ffffffffc020743e:	6718                	ld	a4,8(a4)
ffffffffc0207440:	9f95                	subw	a5,a5,a3
ffffffffc0207442:	c01c                	sw	a5,0(s0)
ffffffffc0207444:	02c70563          	beq	a4,a2,ffffffffc020746e <add_timer+0x64>
ffffffffc0207448:	ff072683          	lw	a3,-16(a4)
ffffffffc020744c:	fed7f9e3          	bgeu	a5,a3,ffffffffc020743e <add_timer+0x34>
ffffffffc0207450:	40f687bb          	subw	a5,a3,a5
ffffffffc0207454:	fef72823          	sw	a5,-16(a4)
ffffffffc0207458:	631c                	ld	a5,0(a4)
ffffffffc020745a:	e30c                	sd	a1,0(a4)
ffffffffc020745c:	e78c                	sd	a1,8(a5)
ffffffffc020745e:	ec18                	sd	a4,24(s0)
ffffffffc0207460:	e81c                	sd	a5,16(s0)
ffffffffc0207462:	c105                	beqz	a0,ffffffffc0207482 <add_timer+0x78>
ffffffffc0207464:	6402                	ld	s0,0(sp)
ffffffffc0207466:	60a2                	ld	ra,8(sp)
ffffffffc0207468:	0141                	addi	sp,sp,16
ffffffffc020746a:	803f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020746e:	0008e717          	auipc	a4,0x8e
ffffffffc0207472:	38270713          	addi	a4,a4,898 # ffffffffc02957f0 <timer_list>
ffffffffc0207476:	631c                	ld	a5,0(a4)
ffffffffc0207478:	e30c                	sd	a1,0(a4)
ffffffffc020747a:	e78c                	sd	a1,8(a5)
ffffffffc020747c:	ec18                	sd	a4,24(s0)
ffffffffc020747e:	e81c                	sd	a5,16(s0)
ffffffffc0207480:	f175                	bnez	a0,ffffffffc0207464 <add_timer+0x5a>
ffffffffc0207482:	60a2                	ld	ra,8(sp)
ffffffffc0207484:	6402                	ld	s0,0(sp)
ffffffffc0207486:	0141                	addi	sp,sp,16
ffffffffc0207488:	8082                	ret
ffffffffc020748a:	fe8f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020748e:	4505                	li	a0,1
ffffffffc0207490:	b771                	j	ffffffffc020741c <add_timer+0x12>
ffffffffc0207492:	00006697          	auipc	a3,0x6
ffffffffc0207496:	5ce68693          	addi	a3,a3,1486 # ffffffffc020da60 <CSWTCH.79+0x6a8>
ffffffffc020749a:	00004617          	auipc	a2,0x4
ffffffffc020749e:	50e60613          	addi	a2,a2,1294 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02074a2:	07a00593          	li	a1,122
ffffffffc02074a6:	00006517          	auipc	a0,0x6
ffffffffc02074aa:	58250513          	addi	a0,a0,1410 # ffffffffc020da28 <CSWTCH.79+0x670>
ffffffffc02074ae:	ff1f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02074b2:	00006697          	auipc	a3,0x6
ffffffffc02074b6:	5de68693          	addi	a3,a3,1502 # ffffffffc020da90 <CSWTCH.79+0x6d8>
ffffffffc02074ba:	00004617          	auipc	a2,0x4
ffffffffc02074be:	4ee60613          	addi	a2,a2,1262 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02074c2:	07b00593          	li	a1,123
ffffffffc02074c6:	00006517          	auipc	a0,0x6
ffffffffc02074ca:	56250513          	addi	a0,a0,1378 # ffffffffc020da28 <CSWTCH.79+0x670>
ffffffffc02074ce:	fd1f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02074d2 <del_timer>:
ffffffffc02074d2:	1101                	addi	sp,sp,-32
ffffffffc02074d4:	e822                	sd	s0,16(sp)
ffffffffc02074d6:	ec06                	sd	ra,24(sp)
ffffffffc02074d8:	e426                	sd	s1,8(sp)
ffffffffc02074da:	842a                	mv	s0,a0
ffffffffc02074dc:	100027f3          	csrr	a5,sstatus
ffffffffc02074e0:	8b89                	andi	a5,a5,2
ffffffffc02074e2:	01050493          	addi	s1,a0,16
ffffffffc02074e6:	eb9d                	bnez	a5,ffffffffc020751c <del_timer+0x4a>
ffffffffc02074e8:	6d1c                	ld	a5,24(a0)
ffffffffc02074ea:	02978463          	beq	a5,s1,ffffffffc0207512 <del_timer+0x40>
ffffffffc02074ee:	4114                	lw	a3,0(a0)
ffffffffc02074f0:	6918                	ld	a4,16(a0)
ffffffffc02074f2:	ce81                	beqz	a3,ffffffffc020750a <del_timer+0x38>
ffffffffc02074f4:	0008e617          	auipc	a2,0x8e
ffffffffc02074f8:	2fc60613          	addi	a2,a2,764 # ffffffffc02957f0 <timer_list>
ffffffffc02074fc:	00c78763          	beq	a5,a2,ffffffffc020750a <del_timer+0x38>
ffffffffc0207500:	ff07a603          	lw	a2,-16(a5)
ffffffffc0207504:	9eb1                	addw	a3,a3,a2
ffffffffc0207506:	fed7a823          	sw	a3,-16(a5)
ffffffffc020750a:	e71c                	sd	a5,8(a4)
ffffffffc020750c:	e398                	sd	a4,0(a5)
ffffffffc020750e:	ec04                	sd	s1,24(s0)
ffffffffc0207510:	e804                	sd	s1,16(s0)
ffffffffc0207512:	60e2                	ld	ra,24(sp)
ffffffffc0207514:	6442                	ld	s0,16(sp)
ffffffffc0207516:	64a2                	ld	s1,8(sp)
ffffffffc0207518:	6105                	addi	sp,sp,32
ffffffffc020751a:	8082                	ret
ffffffffc020751c:	f56f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207520:	6c1c                	ld	a5,24(s0)
ffffffffc0207522:	02978463          	beq	a5,s1,ffffffffc020754a <del_timer+0x78>
ffffffffc0207526:	4014                	lw	a3,0(s0)
ffffffffc0207528:	6818                	ld	a4,16(s0)
ffffffffc020752a:	ce81                	beqz	a3,ffffffffc0207542 <del_timer+0x70>
ffffffffc020752c:	0008e617          	auipc	a2,0x8e
ffffffffc0207530:	2c460613          	addi	a2,a2,708 # ffffffffc02957f0 <timer_list>
ffffffffc0207534:	00c78763          	beq	a5,a2,ffffffffc0207542 <del_timer+0x70>
ffffffffc0207538:	ff07a603          	lw	a2,-16(a5)
ffffffffc020753c:	9eb1                	addw	a3,a3,a2
ffffffffc020753e:	fed7a823          	sw	a3,-16(a5)
ffffffffc0207542:	e71c                	sd	a5,8(a4)
ffffffffc0207544:	e398                	sd	a4,0(a5)
ffffffffc0207546:	ec04                	sd	s1,24(s0)
ffffffffc0207548:	e804                	sd	s1,16(s0)
ffffffffc020754a:	6442                	ld	s0,16(sp)
ffffffffc020754c:	60e2                	ld	ra,24(sp)
ffffffffc020754e:	64a2                	ld	s1,8(sp)
ffffffffc0207550:	6105                	addi	sp,sp,32
ffffffffc0207552:	f1af906f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc0207556 <run_timer_list>:
ffffffffc0207556:	7139                	addi	sp,sp,-64
ffffffffc0207558:	fc06                	sd	ra,56(sp)
ffffffffc020755a:	f822                	sd	s0,48(sp)
ffffffffc020755c:	f426                	sd	s1,40(sp)
ffffffffc020755e:	f04a                	sd	s2,32(sp)
ffffffffc0207560:	ec4e                	sd	s3,24(sp)
ffffffffc0207562:	e852                	sd	s4,16(sp)
ffffffffc0207564:	e456                	sd	s5,8(sp)
ffffffffc0207566:	e05a                	sd	s6,0(sp)
ffffffffc0207568:	100027f3          	csrr	a5,sstatus
ffffffffc020756c:	8b89                	andi	a5,a5,2
ffffffffc020756e:	4b01                	li	s6,0
ffffffffc0207570:	efe9                	bnez	a5,ffffffffc020764a <run_timer_list+0xf4>
ffffffffc0207572:	0008e997          	auipc	s3,0x8e
ffffffffc0207576:	27e98993          	addi	s3,s3,638 # ffffffffc02957f0 <timer_list>
ffffffffc020757a:	0089b403          	ld	s0,8(s3)
ffffffffc020757e:	07340a63          	beq	s0,s3,ffffffffc02075f2 <run_timer_list+0x9c>
ffffffffc0207582:	ff042783          	lw	a5,-16(s0)
ffffffffc0207586:	ff040913          	addi	s2,s0,-16
ffffffffc020758a:	0e078763          	beqz	a5,ffffffffc0207678 <run_timer_list+0x122>
ffffffffc020758e:	fff7871b          	addiw	a4,a5,-1
ffffffffc0207592:	fee42823          	sw	a4,-16(s0)
ffffffffc0207596:	ef31                	bnez	a4,ffffffffc02075f2 <run_timer_list+0x9c>
ffffffffc0207598:	00006a97          	auipc	s5,0x6
ffffffffc020759c:	560a8a93          	addi	s5,s5,1376 # ffffffffc020daf8 <CSWTCH.79+0x740>
ffffffffc02075a0:	00006a17          	auipc	s4,0x6
ffffffffc02075a4:	488a0a13          	addi	s4,s4,1160 # ffffffffc020da28 <CSWTCH.79+0x670>
ffffffffc02075a8:	a005                	j	ffffffffc02075c8 <run_timer_list+0x72>
ffffffffc02075aa:	0a07d763          	bgez	a5,ffffffffc0207658 <run_timer_list+0x102>
ffffffffc02075ae:	8526                	mv	a0,s1
ffffffffc02075b0:	ce9ff0ef          	jal	ra,ffffffffc0207298 <wakeup_proc>
ffffffffc02075b4:	854a                	mv	a0,s2
ffffffffc02075b6:	f1dff0ef          	jal	ra,ffffffffc02074d2 <del_timer>
ffffffffc02075ba:	03340c63          	beq	s0,s3,ffffffffc02075f2 <run_timer_list+0x9c>
ffffffffc02075be:	ff042783          	lw	a5,-16(s0)
ffffffffc02075c2:	ff040913          	addi	s2,s0,-16
ffffffffc02075c6:	e795                	bnez	a5,ffffffffc02075f2 <run_timer_list+0x9c>
ffffffffc02075c8:	00893483          	ld	s1,8(s2)
ffffffffc02075cc:	6400                	ld	s0,8(s0)
ffffffffc02075ce:	0ec4a783          	lw	a5,236(s1)
ffffffffc02075d2:	ffe1                	bnez	a5,ffffffffc02075aa <run_timer_list+0x54>
ffffffffc02075d4:	40d4                	lw	a3,4(s1)
ffffffffc02075d6:	8656                	mv	a2,s5
ffffffffc02075d8:	0ba00593          	li	a1,186
ffffffffc02075dc:	8552                	mv	a0,s4
ffffffffc02075de:	f29f80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc02075e2:	8526                	mv	a0,s1
ffffffffc02075e4:	cb5ff0ef          	jal	ra,ffffffffc0207298 <wakeup_proc>
ffffffffc02075e8:	854a                	mv	a0,s2
ffffffffc02075ea:	ee9ff0ef          	jal	ra,ffffffffc02074d2 <del_timer>
ffffffffc02075ee:	fd3418e3          	bne	s0,s3,ffffffffc02075be <run_timer_list+0x68>
ffffffffc02075f2:	0008f597          	auipc	a1,0x8f
ffffffffc02075f6:	2ce5b583          	ld	a1,718(a1) # ffffffffc02968c0 <current>
ffffffffc02075fa:	c18d                	beqz	a1,ffffffffc020761c <run_timer_list+0xc6>
ffffffffc02075fc:	0008f797          	auipc	a5,0x8f
ffffffffc0207600:	2cc7b783          	ld	a5,716(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0207604:	04f58763          	beq	a1,a5,ffffffffc0207652 <run_timer_list+0xfc>
ffffffffc0207608:	0008f797          	auipc	a5,0x8f
ffffffffc020760c:	2e07b783          	ld	a5,736(a5) # ffffffffc02968e8 <sched_class>
ffffffffc0207610:	779c                	ld	a5,40(a5)
ffffffffc0207612:	0008f517          	auipc	a0,0x8f
ffffffffc0207616:	2ce53503          	ld	a0,718(a0) # ffffffffc02968e0 <rq>
ffffffffc020761a:	9782                	jalr	a5
ffffffffc020761c:	000b1c63          	bnez	s6,ffffffffc0207634 <run_timer_list+0xde>
ffffffffc0207620:	70e2                	ld	ra,56(sp)
ffffffffc0207622:	7442                	ld	s0,48(sp)
ffffffffc0207624:	74a2                	ld	s1,40(sp)
ffffffffc0207626:	7902                	ld	s2,32(sp)
ffffffffc0207628:	69e2                	ld	s3,24(sp)
ffffffffc020762a:	6a42                	ld	s4,16(sp)
ffffffffc020762c:	6aa2                	ld	s5,8(sp)
ffffffffc020762e:	6b02                	ld	s6,0(sp)
ffffffffc0207630:	6121                	addi	sp,sp,64
ffffffffc0207632:	8082                	ret
ffffffffc0207634:	7442                	ld	s0,48(sp)
ffffffffc0207636:	70e2                	ld	ra,56(sp)
ffffffffc0207638:	74a2                	ld	s1,40(sp)
ffffffffc020763a:	7902                	ld	s2,32(sp)
ffffffffc020763c:	69e2                	ld	s3,24(sp)
ffffffffc020763e:	6a42                	ld	s4,16(sp)
ffffffffc0207640:	6aa2                	ld	s5,8(sp)
ffffffffc0207642:	6b02                	ld	s6,0(sp)
ffffffffc0207644:	6121                	addi	sp,sp,64
ffffffffc0207646:	e26f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020764a:	e28f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020764e:	4b05                	li	s6,1
ffffffffc0207650:	b70d                	j	ffffffffc0207572 <run_timer_list+0x1c>
ffffffffc0207652:	4785                	li	a5,1
ffffffffc0207654:	ed9c                	sd	a5,24(a1)
ffffffffc0207656:	b7d9                	j	ffffffffc020761c <run_timer_list+0xc6>
ffffffffc0207658:	00006697          	auipc	a3,0x6
ffffffffc020765c:	47868693          	addi	a3,a3,1144 # ffffffffc020dad0 <CSWTCH.79+0x718>
ffffffffc0207660:	00004617          	auipc	a2,0x4
ffffffffc0207664:	34860613          	addi	a2,a2,840 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207668:	0b600593          	li	a1,182
ffffffffc020766c:	00006517          	auipc	a0,0x6
ffffffffc0207670:	3bc50513          	addi	a0,a0,956 # ffffffffc020da28 <CSWTCH.79+0x670>
ffffffffc0207674:	e2bf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207678:	00006697          	auipc	a3,0x6
ffffffffc020767c:	44068693          	addi	a3,a3,1088 # ffffffffc020dab8 <CSWTCH.79+0x700>
ffffffffc0207680:	00004617          	auipc	a2,0x4
ffffffffc0207684:	32860613          	addi	a2,a2,808 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207688:	0ae00593          	li	a1,174
ffffffffc020768c:	00006517          	auipc	a0,0x6
ffffffffc0207690:	39c50513          	addi	a0,a0,924 # ffffffffc020da28 <CSWTCH.79+0x670>
ffffffffc0207694:	e0bf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207698 <sys_getpid>:
ffffffffc0207698:	0008f797          	auipc	a5,0x8f
ffffffffc020769c:	2287b783          	ld	a5,552(a5) # ffffffffc02968c0 <current>
ffffffffc02076a0:	43c8                	lw	a0,4(a5)
ffffffffc02076a2:	8082                	ret

ffffffffc02076a4 <sys_pgdir>:
ffffffffc02076a4:	4501                	li	a0,0
ffffffffc02076a6:	8082                	ret

ffffffffc02076a8 <sys_gettime>:
ffffffffc02076a8:	0008f797          	auipc	a5,0x8f
ffffffffc02076ac:	1c87b783          	ld	a5,456(a5) # ffffffffc0296870 <ticks>
ffffffffc02076b0:	0027951b          	slliw	a0,a5,0x2
ffffffffc02076b4:	9d3d                	addw	a0,a0,a5
ffffffffc02076b6:	0015151b          	slliw	a0,a0,0x1
ffffffffc02076ba:	8082                	ret

ffffffffc02076bc <sys_lab6_set_priority>:
ffffffffc02076bc:	4108                	lw	a0,0(a0)
ffffffffc02076be:	1141                	addi	sp,sp,-16
ffffffffc02076c0:	e406                	sd	ra,8(sp)
ffffffffc02076c2:	975ff0ef          	jal	ra,ffffffffc0207036 <lab6_set_priority>
ffffffffc02076c6:	60a2                	ld	ra,8(sp)
ffffffffc02076c8:	4501                	li	a0,0
ffffffffc02076ca:	0141                	addi	sp,sp,16
ffffffffc02076cc:	8082                	ret

ffffffffc02076ce <sys_dup>:
ffffffffc02076ce:	450c                	lw	a1,8(a0)
ffffffffc02076d0:	4108                	lw	a0,0(a0)
ffffffffc02076d2:	af6fe06f          	j	ffffffffc02059c8 <sysfile_dup>

ffffffffc02076d6 <sys_getdirentry>:
ffffffffc02076d6:	650c                	ld	a1,8(a0)
ffffffffc02076d8:	4108                	lw	a0,0(a0)
ffffffffc02076da:	9fefe06f          	j	ffffffffc02058d8 <sysfile_getdirentry>

ffffffffc02076de <sys_getcwd>:
ffffffffc02076de:	650c                	ld	a1,8(a0)
ffffffffc02076e0:	6108                	ld	a0,0(a0)
ffffffffc02076e2:	952fe06f          	j	ffffffffc0205834 <sysfile_getcwd>

ffffffffc02076e6 <sys_fsync>:
ffffffffc02076e6:	4108                	lw	a0,0(a0)
ffffffffc02076e8:	948fe06f          	j	ffffffffc0205830 <sysfile_fsync>

ffffffffc02076ec <sys_fstat>:
ffffffffc02076ec:	650c                	ld	a1,8(a0)
ffffffffc02076ee:	4108                	lw	a0,0(a0)
ffffffffc02076f0:	8a0fe06f          	j	ffffffffc0205790 <sysfile_fstat>

ffffffffc02076f4 <sys_seek>:
ffffffffc02076f4:	4910                	lw	a2,16(a0)
ffffffffc02076f6:	650c                	ld	a1,8(a0)
ffffffffc02076f8:	4108                	lw	a0,0(a0)
ffffffffc02076fa:	892fe06f          	j	ffffffffc020578c <sysfile_seek>

ffffffffc02076fe <sys_write>:
ffffffffc02076fe:	6910                	ld	a2,16(a0)
ffffffffc0207700:	650c                	ld	a1,8(a0)
ffffffffc0207702:	4108                	lw	a0,0(a0)
ffffffffc0207704:	f6ffd06f          	j	ffffffffc0205672 <sysfile_write>

ffffffffc0207708 <sys_read>:
ffffffffc0207708:	6910                	ld	a2,16(a0)
ffffffffc020770a:	650c                	ld	a1,8(a0)
ffffffffc020770c:	4108                	lw	a0,0(a0)
ffffffffc020770e:	e51fd06f          	j	ffffffffc020555e <sysfile_read>

ffffffffc0207712 <sys_close>:
ffffffffc0207712:	4108                	lw	a0,0(a0)
ffffffffc0207714:	e47fd06f          	j	ffffffffc020555a <sysfile_close>

ffffffffc0207718 <sys_open>:
ffffffffc0207718:	450c                	lw	a1,8(a0)
ffffffffc020771a:	6108                	ld	a0,0(a0)
ffffffffc020771c:	e0bfd06f          	j	ffffffffc0205526 <sysfile_open>

ffffffffc0207720 <sys_putc>:
ffffffffc0207720:	4108                	lw	a0,0(a0)
ffffffffc0207722:	1141                	addi	sp,sp,-16
ffffffffc0207724:	e406                	sd	ra,8(sp)
ffffffffc0207726:	abdf80ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc020772a:	60a2                	ld	ra,8(sp)
ffffffffc020772c:	4501                	li	a0,0
ffffffffc020772e:	0141                	addi	sp,sp,16
ffffffffc0207730:	8082                	ret

ffffffffc0207732 <sys_kill>:
ffffffffc0207732:	4108                	lw	a0,0(a0)
ffffffffc0207734:	ea0ff06f          	j	ffffffffc0206dd4 <do_kill>

ffffffffc0207738 <sys_sleep>:
ffffffffc0207738:	4108                	lw	a0,0(a0)
ffffffffc020773a:	937ff06f          	j	ffffffffc0207070 <do_sleep>

ffffffffc020773e <sys_yield>:
ffffffffc020773e:	e48ff06f          	j	ffffffffc0206d86 <do_yield>

ffffffffc0207742 <sys_exec>:
ffffffffc0207742:	6910                	ld	a2,16(a0)
ffffffffc0207744:	450c                	lw	a1,8(a0)
ffffffffc0207746:	6108                	ld	a0,0(a0)
ffffffffc0207748:	d93fe06f          	j	ffffffffc02064da <do_execve>

ffffffffc020774c <sys_wait>:
ffffffffc020774c:	650c                	ld	a1,8(a0)
ffffffffc020774e:	4108                	lw	a0,0(a0)
ffffffffc0207750:	e46ff06f          	j	ffffffffc0206d96 <do_wait>

ffffffffc0207754 <sys_fork>:
ffffffffc0207754:	0008f797          	auipc	a5,0x8f
ffffffffc0207758:	16c7b783          	ld	a5,364(a5) # ffffffffc02968c0 <current>
ffffffffc020775c:	73d0                	ld	a2,160(a5)
ffffffffc020775e:	4501                	li	a0,0
ffffffffc0207760:	6a0c                	ld	a1,16(a2)
ffffffffc0207762:	c82fe06f          	j	ffffffffc0205be4 <do_fork>

ffffffffc0207766 <sys_exit>:
ffffffffc0207766:	4108                	lw	a0,0(a0)
ffffffffc0207768:	8effe06f          	j	ffffffffc0206056 <do_exit>

ffffffffc020776c <syscall>:
ffffffffc020776c:	715d                	addi	sp,sp,-80
ffffffffc020776e:	fc26                	sd	s1,56(sp)
ffffffffc0207770:	0008f497          	auipc	s1,0x8f
ffffffffc0207774:	15048493          	addi	s1,s1,336 # ffffffffc02968c0 <current>
ffffffffc0207778:	6098                	ld	a4,0(s1)
ffffffffc020777a:	e0a2                	sd	s0,64(sp)
ffffffffc020777c:	f84a                	sd	s2,48(sp)
ffffffffc020777e:	7340                	ld	s0,160(a4)
ffffffffc0207780:	e486                	sd	ra,72(sp)
ffffffffc0207782:	0ff00793          	li	a5,255
ffffffffc0207786:	05042903          	lw	s2,80(s0)
ffffffffc020778a:	0327ee63          	bltu	a5,s2,ffffffffc02077c6 <syscall+0x5a>
ffffffffc020778e:	00391713          	slli	a4,s2,0x3
ffffffffc0207792:	00006797          	auipc	a5,0x6
ffffffffc0207796:	3ce78793          	addi	a5,a5,974 # ffffffffc020db60 <syscalls>
ffffffffc020779a:	97ba                	add	a5,a5,a4
ffffffffc020779c:	639c                	ld	a5,0(a5)
ffffffffc020779e:	c785                	beqz	a5,ffffffffc02077c6 <syscall+0x5a>
ffffffffc02077a0:	6c28                	ld	a0,88(s0)
ffffffffc02077a2:	702c                	ld	a1,96(s0)
ffffffffc02077a4:	7430                	ld	a2,104(s0)
ffffffffc02077a6:	7834                	ld	a3,112(s0)
ffffffffc02077a8:	7c38                	ld	a4,120(s0)
ffffffffc02077aa:	e42a                	sd	a0,8(sp)
ffffffffc02077ac:	e82e                	sd	a1,16(sp)
ffffffffc02077ae:	ec32                	sd	a2,24(sp)
ffffffffc02077b0:	f036                	sd	a3,32(sp)
ffffffffc02077b2:	f43a                	sd	a4,40(sp)
ffffffffc02077b4:	0028                	addi	a0,sp,8
ffffffffc02077b6:	9782                	jalr	a5
ffffffffc02077b8:	60a6                	ld	ra,72(sp)
ffffffffc02077ba:	e828                	sd	a0,80(s0)
ffffffffc02077bc:	6406                	ld	s0,64(sp)
ffffffffc02077be:	74e2                	ld	s1,56(sp)
ffffffffc02077c0:	7942                	ld	s2,48(sp)
ffffffffc02077c2:	6161                	addi	sp,sp,80
ffffffffc02077c4:	8082                	ret
ffffffffc02077c6:	8522                	mv	a0,s0
ffffffffc02077c8:	fc2f90ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc02077cc:	609c                	ld	a5,0(s1)
ffffffffc02077ce:	86ca                	mv	a3,s2
ffffffffc02077d0:	00006617          	auipc	a2,0x6
ffffffffc02077d4:	34860613          	addi	a2,a2,840 # ffffffffc020db18 <CSWTCH.79+0x760>
ffffffffc02077d8:	43d8                	lw	a4,4(a5)
ffffffffc02077da:	0d800593          	li	a1,216
ffffffffc02077de:	0b478793          	addi	a5,a5,180
ffffffffc02077e2:	00006517          	auipc	a0,0x6
ffffffffc02077e6:	36650513          	addi	a0,a0,870 # ffffffffc020db48 <CSWTCH.79+0x790>
ffffffffc02077ea:	cb5f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02077ee <__alloc_inode>:
ffffffffc02077ee:	1141                	addi	sp,sp,-16
ffffffffc02077f0:	e022                	sd	s0,0(sp)
ffffffffc02077f2:	842a                	mv	s0,a0
ffffffffc02077f4:	07800513          	li	a0,120
ffffffffc02077f8:	e406                	sd	ra,8(sp)
ffffffffc02077fa:	f94fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02077fe:	c111                	beqz	a0,ffffffffc0207802 <__alloc_inode+0x14>
ffffffffc0207800:	cd20                	sw	s0,88(a0)
ffffffffc0207802:	60a2                	ld	ra,8(sp)
ffffffffc0207804:	6402                	ld	s0,0(sp)
ffffffffc0207806:	0141                	addi	sp,sp,16
ffffffffc0207808:	8082                	ret

ffffffffc020780a <inode_init>:
ffffffffc020780a:	4785                	li	a5,1
ffffffffc020780c:	06052023          	sw	zero,96(a0)
ffffffffc0207810:	f92c                	sd	a1,112(a0)
ffffffffc0207812:	f530                	sd	a2,104(a0)
ffffffffc0207814:	cd7c                	sw	a5,92(a0)
ffffffffc0207816:	8082                	ret

ffffffffc0207818 <inode_kill>:
ffffffffc0207818:	4d78                	lw	a4,92(a0)
ffffffffc020781a:	1141                	addi	sp,sp,-16
ffffffffc020781c:	e406                	sd	ra,8(sp)
ffffffffc020781e:	e719                	bnez	a4,ffffffffc020782c <inode_kill+0x14>
ffffffffc0207820:	513c                	lw	a5,96(a0)
ffffffffc0207822:	e78d                	bnez	a5,ffffffffc020784c <inode_kill+0x34>
ffffffffc0207824:	60a2                	ld	ra,8(sp)
ffffffffc0207826:	0141                	addi	sp,sp,16
ffffffffc0207828:	817fa06f          	j	ffffffffc020203e <kfree>
ffffffffc020782c:	00007697          	auipc	a3,0x7
ffffffffc0207830:	b3468693          	addi	a3,a3,-1228 # ffffffffc020e360 <syscalls+0x800>
ffffffffc0207834:	00004617          	auipc	a2,0x4
ffffffffc0207838:	17460613          	addi	a2,a2,372 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020783c:	02900593          	li	a1,41
ffffffffc0207840:	00007517          	auipc	a0,0x7
ffffffffc0207844:	b4050513          	addi	a0,a0,-1216 # ffffffffc020e380 <syscalls+0x820>
ffffffffc0207848:	c57f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020784c:	00007697          	auipc	a3,0x7
ffffffffc0207850:	b4c68693          	addi	a3,a3,-1204 # ffffffffc020e398 <syscalls+0x838>
ffffffffc0207854:	00004617          	auipc	a2,0x4
ffffffffc0207858:	15460613          	addi	a2,a2,340 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020785c:	02a00593          	li	a1,42
ffffffffc0207860:	00007517          	auipc	a0,0x7
ffffffffc0207864:	b2050513          	addi	a0,a0,-1248 # ffffffffc020e380 <syscalls+0x820>
ffffffffc0207868:	c37f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020786c <inode_ref_inc>:
ffffffffc020786c:	4d7c                	lw	a5,92(a0)
ffffffffc020786e:	2785                	addiw	a5,a5,1
ffffffffc0207870:	cd7c                	sw	a5,92(a0)
ffffffffc0207872:	0007851b          	sext.w	a0,a5
ffffffffc0207876:	8082                	ret

ffffffffc0207878 <inode_open_inc>:
ffffffffc0207878:	513c                	lw	a5,96(a0)
ffffffffc020787a:	2785                	addiw	a5,a5,1
ffffffffc020787c:	d13c                	sw	a5,96(a0)
ffffffffc020787e:	0007851b          	sext.w	a0,a5
ffffffffc0207882:	8082                	ret

ffffffffc0207884 <inode_check>:
ffffffffc0207884:	1141                	addi	sp,sp,-16
ffffffffc0207886:	e406                	sd	ra,8(sp)
ffffffffc0207888:	c90d                	beqz	a0,ffffffffc02078ba <inode_check+0x36>
ffffffffc020788a:	793c                	ld	a5,112(a0)
ffffffffc020788c:	c79d                	beqz	a5,ffffffffc02078ba <inode_check+0x36>
ffffffffc020788e:	6398                	ld	a4,0(a5)
ffffffffc0207890:	4625d7b7          	lui	a5,0x4625d
ffffffffc0207894:	0786                	slli	a5,a5,0x1
ffffffffc0207896:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc020789a:	08f71063          	bne	a4,a5,ffffffffc020791a <inode_check+0x96>
ffffffffc020789e:	4d78                	lw	a4,92(a0)
ffffffffc02078a0:	513c                	lw	a5,96(a0)
ffffffffc02078a2:	04f74c63          	blt	a4,a5,ffffffffc02078fa <inode_check+0x76>
ffffffffc02078a6:	0407ca63          	bltz	a5,ffffffffc02078fa <inode_check+0x76>
ffffffffc02078aa:	66c1                	lui	a3,0x10
ffffffffc02078ac:	02d75763          	bge	a4,a3,ffffffffc02078da <inode_check+0x56>
ffffffffc02078b0:	02d7d563          	bge	a5,a3,ffffffffc02078da <inode_check+0x56>
ffffffffc02078b4:	60a2                	ld	ra,8(sp)
ffffffffc02078b6:	0141                	addi	sp,sp,16
ffffffffc02078b8:	8082                	ret
ffffffffc02078ba:	00007697          	auipc	a3,0x7
ffffffffc02078be:	afe68693          	addi	a3,a3,-1282 # ffffffffc020e3b8 <syscalls+0x858>
ffffffffc02078c2:	00004617          	auipc	a2,0x4
ffffffffc02078c6:	0e660613          	addi	a2,a2,230 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02078ca:	06e00593          	li	a1,110
ffffffffc02078ce:	00007517          	auipc	a0,0x7
ffffffffc02078d2:	ab250513          	addi	a0,a0,-1358 # ffffffffc020e380 <syscalls+0x820>
ffffffffc02078d6:	bc9f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02078da:	00007697          	auipc	a3,0x7
ffffffffc02078de:	b5e68693          	addi	a3,a3,-1186 # ffffffffc020e438 <syscalls+0x8d8>
ffffffffc02078e2:	00004617          	auipc	a2,0x4
ffffffffc02078e6:	0c660613          	addi	a2,a2,198 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02078ea:	07200593          	li	a1,114
ffffffffc02078ee:	00007517          	auipc	a0,0x7
ffffffffc02078f2:	a9250513          	addi	a0,a0,-1390 # ffffffffc020e380 <syscalls+0x820>
ffffffffc02078f6:	ba9f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02078fa:	00007697          	auipc	a3,0x7
ffffffffc02078fe:	b0e68693          	addi	a3,a3,-1266 # ffffffffc020e408 <syscalls+0x8a8>
ffffffffc0207902:	00004617          	auipc	a2,0x4
ffffffffc0207906:	0a660613          	addi	a2,a2,166 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020790a:	07100593          	li	a1,113
ffffffffc020790e:	00007517          	auipc	a0,0x7
ffffffffc0207912:	a7250513          	addi	a0,a0,-1422 # ffffffffc020e380 <syscalls+0x820>
ffffffffc0207916:	b89f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020791a:	00007697          	auipc	a3,0x7
ffffffffc020791e:	ac668693          	addi	a3,a3,-1338 # ffffffffc020e3e0 <syscalls+0x880>
ffffffffc0207922:	00004617          	auipc	a2,0x4
ffffffffc0207926:	08660613          	addi	a2,a2,134 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020792a:	06f00593          	li	a1,111
ffffffffc020792e:	00007517          	auipc	a0,0x7
ffffffffc0207932:	a5250513          	addi	a0,a0,-1454 # ffffffffc020e380 <syscalls+0x820>
ffffffffc0207936:	b69f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020793a <inode_ref_dec>:
ffffffffc020793a:	4d7c                	lw	a5,92(a0)
ffffffffc020793c:	1101                	addi	sp,sp,-32
ffffffffc020793e:	ec06                	sd	ra,24(sp)
ffffffffc0207940:	e822                	sd	s0,16(sp)
ffffffffc0207942:	e426                	sd	s1,8(sp)
ffffffffc0207944:	e04a                	sd	s2,0(sp)
ffffffffc0207946:	06f05e63          	blez	a5,ffffffffc02079c2 <inode_ref_dec+0x88>
ffffffffc020794a:	fff7849b          	addiw	s1,a5,-1
ffffffffc020794e:	cd64                	sw	s1,92(a0)
ffffffffc0207950:	842a                	mv	s0,a0
ffffffffc0207952:	e09d                	bnez	s1,ffffffffc0207978 <inode_ref_dec+0x3e>
ffffffffc0207954:	793c                	ld	a5,112(a0)
ffffffffc0207956:	c7b1                	beqz	a5,ffffffffc02079a2 <inode_ref_dec+0x68>
ffffffffc0207958:	0487b903          	ld	s2,72(a5)
ffffffffc020795c:	04090363          	beqz	s2,ffffffffc02079a2 <inode_ref_dec+0x68>
ffffffffc0207960:	00007597          	auipc	a1,0x7
ffffffffc0207964:	b8858593          	addi	a1,a1,-1144 # ffffffffc020e4e8 <syscalls+0x988>
ffffffffc0207968:	f1dff0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc020796c:	8522                	mv	a0,s0
ffffffffc020796e:	9902                	jalr	s2
ffffffffc0207970:	c501                	beqz	a0,ffffffffc0207978 <inode_ref_dec+0x3e>
ffffffffc0207972:	57c5                	li	a5,-15
ffffffffc0207974:	00f51963          	bne	a0,a5,ffffffffc0207986 <inode_ref_dec+0x4c>
ffffffffc0207978:	60e2                	ld	ra,24(sp)
ffffffffc020797a:	6442                	ld	s0,16(sp)
ffffffffc020797c:	6902                	ld	s2,0(sp)
ffffffffc020797e:	8526                	mv	a0,s1
ffffffffc0207980:	64a2                	ld	s1,8(sp)
ffffffffc0207982:	6105                	addi	sp,sp,32
ffffffffc0207984:	8082                	ret
ffffffffc0207986:	85aa                	mv	a1,a0
ffffffffc0207988:	00007517          	auipc	a0,0x7
ffffffffc020798c:	b6850513          	addi	a0,a0,-1176 # ffffffffc020e4f0 <syscalls+0x990>
ffffffffc0207990:	817f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207994:	60e2                	ld	ra,24(sp)
ffffffffc0207996:	6442                	ld	s0,16(sp)
ffffffffc0207998:	6902                	ld	s2,0(sp)
ffffffffc020799a:	8526                	mv	a0,s1
ffffffffc020799c:	64a2                	ld	s1,8(sp)
ffffffffc020799e:	6105                	addi	sp,sp,32
ffffffffc02079a0:	8082                	ret
ffffffffc02079a2:	00007697          	auipc	a3,0x7
ffffffffc02079a6:	af668693          	addi	a3,a3,-1290 # ffffffffc020e498 <syscalls+0x938>
ffffffffc02079aa:	00004617          	auipc	a2,0x4
ffffffffc02079ae:	ffe60613          	addi	a2,a2,-2 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02079b2:	04400593          	li	a1,68
ffffffffc02079b6:	00007517          	auipc	a0,0x7
ffffffffc02079ba:	9ca50513          	addi	a0,a0,-1590 # ffffffffc020e380 <syscalls+0x820>
ffffffffc02079be:	ae1f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02079c2:	00007697          	auipc	a3,0x7
ffffffffc02079c6:	ab668693          	addi	a3,a3,-1354 # ffffffffc020e478 <syscalls+0x918>
ffffffffc02079ca:	00004617          	auipc	a2,0x4
ffffffffc02079ce:	fde60613          	addi	a2,a2,-34 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02079d2:	03f00593          	li	a1,63
ffffffffc02079d6:	00007517          	auipc	a0,0x7
ffffffffc02079da:	9aa50513          	addi	a0,a0,-1622 # ffffffffc020e380 <syscalls+0x820>
ffffffffc02079de:	ac1f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02079e2 <inode_open_dec>:
ffffffffc02079e2:	513c                	lw	a5,96(a0)
ffffffffc02079e4:	1101                	addi	sp,sp,-32
ffffffffc02079e6:	ec06                	sd	ra,24(sp)
ffffffffc02079e8:	e822                	sd	s0,16(sp)
ffffffffc02079ea:	e426                	sd	s1,8(sp)
ffffffffc02079ec:	e04a                	sd	s2,0(sp)
ffffffffc02079ee:	06f05b63          	blez	a5,ffffffffc0207a64 <inode_open_dec+0x82>
ffffffffc02079f2:	fff7849b          	addiw	s1,a5,-1
ffffffffc02079f6:	d124                	sw	s1,96(a0)
ffffffffc02079f8:	842a                	mv	s0,a0
ffffffffc02079fa:	e085                	bnez	s1,ffffffffc0207a1a <inode_open_dec+0x38>
ffffffffc02079fc:	793c                	ld	a5,112(a0)
ffffffffc02079fe:	c3b9                	beqz	a5,ffffffffc0207a44 <inode_open_dec+0x62>
ffffffffc0207a00:	0107b903          	ld	s2,16(a5)
ffffffffc0207a04:	04090063          	beqz	s2,ffffffffc0207a44 <inode_open_dec+0x62>
ffffffffc0207a08:	00007597          	auipc	a1,0x7
ffffffffc0207a0c:	b7858593          	addi	a1,a1,-1160 # ffffffffc020e580 <syscalls+0xa20>
ffffffffc0207a10:	e75ff0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0207a14:	8522                	mv	a0,s0
ffffffffc0207a16:	9902                	jalr	s2
ffffffffc0207a18:	e901                	bnez	a0,ffffffffc0207a28 <inode_open_dec+0x46>
ffffffffc0207a1a:	60e2                	ld	ra,24(sp)
ffffffffc0207a1c:	6442                	ld	s0,16(sp)
ffffffffc0207a1e:	6902                	ld	s2,0(sp)
ffffffffc0207a20:	8526                	mv	a0,s1
ffffffffc0207a22:	64a2                	ld	s1,8(sp)
ffffffffc0207a24:	6105                	addi	sp,sp,32
ffffffffc0207a26:	8082                	ret
ffffffffc0207a28:	85aa                	mv	a1,a0
ffffffffc0207a2a:	00007517          	auipc	a0,0x7
ffffffffc0207a2e:	b5e50513          	addi	a0,a0,-1186 # ffffffffc020e588 <syscalls+0xa28>
ffffffffc0207a32:	f74f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207a36:	60e2                	ld	ra,24(sp)
ffffffffc0207a38:	6442                	ld	s0,16(sp)
ffffffffc0207a3a:	6902                	ld	s2,0(sp)
ffffffffc0207a3c:	8526                	mv	a0,s1
ffffffffc0207a3e:	64a2                	ld	s1,8(sp)
ffffffffc0207a40:	6105                	addi	sp,sp,32
ffffffffc0207a42:	8082                	ret
ffffffffc0207a44:	00007697          	auipc	a3,0x7
ffffffffc0207a48:	aec68693          	addi	a3,a3,-1300 # ffffffffc020e530 <syscalls+0x9d0>
ffffffffc0207a4c:	00004617          	auipc	a2,0x4
ffffffffc0207a50:	f5c60613          	addi	a2,a2,-164 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207a54:	06100593          	li	a1,97
ffffffffc0207a58:	00007517          	auipc	a0,0x7
ffffffffc0207a5c:	92850513          	addi	a0,a0,-1752 # ffffffffc020e380 <syscalls+0x820>
ffffffffc0207a60:	a3ff80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207a64:	00007697          	auipc	a3,0x7
ffffffffc0207a68:	aac68693          	addi	a3,a3,-1364 # ffffffffc020e510 <syscalls+0x9b0>
ffffffffc0207a6c:	00004617          	auipc	a2,0x4
ffffffffc0207a70:	f3c60613          	addi	a2,a2,-196 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207a74:	05c00593          	li	a1,92
ffffffffc0207a78:	00007517          	auipc	a0,0x7
ffffffffc0207a7c:	90850513          	addi	a0,a0,-1784 # ffffffffc020e380 <syscalls+0x820>
ffffffffc0207a80:	a1ff80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207a84 <__alloc_fs>:
ffffffffc0207a84:	1141                	addi	sp,sp,-16
ffffffffc0207a86:	e022                	sd	s0,0(sp)
ffffffffc0207a88:	842a                	mv	s0,a0
ffffffffc0207a8a:	0d800513          	li	a0,216
ffffffffc0207a8e:	e406                	sd	ra,8(sp)
ffffffffc0207a90:	cfefa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207a94:	c119                	beqz	a0,ffffffffc0207a9a <__alloc_fs+0x16>
ffffffffc0207a96:	0a852823          	sw	s0,176(a0)
ffffffffc0207a9a:	60a2                	ld	ra,8(sp)
ffffffffc0207a9c:	6402                	ld	s0,0(sp)
ffffffffc0207a9e:	0141                	addi	sp,sp,16
ffffffffc0207aa0:	8082                	ret

ffffffffc0207aa2 <vfs_init>:
ffffffffc0207aa2:	1141                	addi	sp,sp,-16
ffffffffc0207aa4:	4585                	li	a1,1
ffffffffc0207aa6:	0008e517          	auipc	a0,0x8e
ffffffffc0207aaa:	d5a50513          	addi	a0,a0,-678 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207aae:	e406                	sd	ra,8(sp)
ffffffffc0207ab0:	aabfc0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0207ab4:	60a2                	ld	ra,8(sp)
ffffffffc0207ab6:	0141                	addi	sp,sp,16
ffffffffc0207ab8:	a40d                	j	ffffffffc0207cda <vfs_devlist_init>

ffffffffc0207aba <vfs_set_bootfs>:
ffffffffc0207aba:	7179                	addi	sp,sp,-48
ffffffffc0207abc:	f022                	sd	s0,32(sp)
ffffffffc0207abe:	f406                	sd	ra,40(sp)
ffffffffc0207ac0:	ec26                	sd	s1,24(sp)
ffffffffc0207ac2:	e402                	sd	zero,8(sp)
ffffffffc0207ac4:	842a                	mv	s0,a0
ffffffffc0207ac6:	c915                	beqz	a0,ffffffffc0207afa <vfs_set_bootfs+0x40>
ffffffffc0207ac8:	03a00593          	li	a1,58
ffffffffc0207acc:	1e3030ef          	jal	ra,ffffffffc020b4ae <strchr>
ffffffffc0207ad0:	c135                	beqz	a0,ffffffffc0207b34 <vfs_set_bootfs+0x7a>
ffffffffc0207ad2:	00154783          	lbu	a5,1(a0)
ffffffffc0207ad6:	efb9                	bnez	a5,ffffffffc0207b34 <vfs_set_bootfs+0x7a>
ffffffffc0207ad8:	8522                	mv	a0,s0
ffffffffc0207ada:	11f000ef          	jal	ra,ffffffffc02083f8 <vfs_chdir>
ffffffffc0207ade:	842a                	mv	s0,a0
ffffffffc0207ae0:	c519                	beqz	a0,ffffffffc0207aee <vfs_set_bootfs+0x34>
ffffffffc0207ae2:	70a2                	ld	ra,40(sp)
ffffffffc0207ae4:	8522                	mv	a0,s0
ffffffffc0207ae6:	7402                	ld	s0,32(sp)
ffffffffc0207ae8:	64e2                	ld	s1,24(sp)
ffffffffc0207aea:	6145                	addi	sp,sp,48
ffffffffc0207aec:	8082                	ret
ffffffffc0207aee:	0028                	addi	a0,sp,8
ffffffffc0207af0:	013000ef          	jal	ra,ffffffffc0208302 <vfs_get_curdir>
ffffffffc0207af4:	842a                	mv	s0,a0
ffffffffc0207af6:	f575                	bnez	a0,ffffffffc0207ae2 <vfs_set_bootfs+0x28>
ffffffffc0207af8:	6422                	ld	s0,8(sp)
ffffffffc0207afa:	0008e517          	auipc	a0,0x8e
ffffffffc0207afe:	d0650513          	addi	a0,a0,-762 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207b02:	a63fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207b06:	0008f797          	auipc	a5,0x8f
ffffffffc0207b0a:	dea78793          	addi	a5,a5,-534 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207b0e:	6384                	ld	s1,0(a5)
ffffffffc0207b10:	0008e517          	auipc	a0,0x8e
ffffffffc0207b14:	cf050513          	addi	a0,a0,-784 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207b18:	e380                	sd	s0,0(a5)
ffffffffc0207b1a:	4401                	li	s0,0
ffffffffc0207b1c:	a45fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207b20:	d0e9                	beqz	s1,ffffffffc0207ae2 <vfs_set_bootfs+0x28>
ffffffffc0207b22:	8526                	mv	a0,s1
ffffffffc0207b24:	e17ff0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc0207b28:	70a2                	ld	ra,40(sp)
ffffffffc0207b2a:	8522                	mv	a0,s0
ffffffffc0207b2c:	7402                	ld	s0,32(sp)
ffffffffc0207b2e:	64e2                	ld	s1,24(sp)
ffffffffc0207b30:	6145                	addi	sp,sp,48
ffffffffc0207b32:	8082                	ret
ffffffffc0207b34:	5475                	li	s0,-3
ffffffffc0207b36:	b775                	j	ffffffffc0207ae2 <vfs_set_bootfs+0x28>

ffffffffc0207b38 <vfs_get_bootfs>:
ffffffffc0207b38:	1101                	addi	sp,sp,-32
ffffffffc0207b3a:	e426                	sd	s1,8(sp)
ffffffffc0207b3c:	0008f497          	auipc	s1,0x8f
ffffffffc0207b40:	db448493          	addi	s1,s1,-588 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207b44:	609c                	ld	a5,0(s1)
ffffffffc0207b46:	ec06                	sd	ra,24(sp)
ffffffffc0207b48:	e822                	sd	s0,16(sp)
ffffffffc0207b4a:	c3a1                	beqz	a5,ffffffffc0207b8a <vfs_get_bootfs+0x52>
ffffffffc0207b4c:	842a                	mv	s0,a0
ffffffffc0207b4e:	0008e517          	auipc	a0,0x8e
ffffffffc0207b52:	cb250513          	addi	a0,a0,-846 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207b56:	a0ffc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207b5a:	6084                	ld	s1,0(s1)
ffffffffc0207b5c:	c08d                	beqz	s1,ffffffffc0207b7e <vfs_get_bootfs+0x46>
ffffffffc0207b5e:	8526                	mv	a0,s1
ffffffffc0207b60:	d0dff0ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc0207b64:	0008e517          	auipc	a0,0x8e
ffffffffc0207b68:	c9c50513          	addi	a0,a0,-868 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207b6c:	9f5fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207b70:	4501                	li	a0,0
ffffffffc0207b72:	e004                	sd	s1,0(s0)
ffffffffc0207b74:	60e2                	ld	ra,24(sp)
ffffffffc0207b76:	6442                	ld	s0,16(sp)
ffffffffc0207b78:	64a2                	ld	s1,8(sp)
ffffffffc0207b7a:	6105                	addi	sp,sp,32
ffffffffc0207b7c:	8082                	ret
ffffffffc0207b7e:	0008e517          	auipc	a0,0x8e
ffffffffc0207b82:	c8250513          	addi	a0,a0,-894 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207b86:	9dbfc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207b8a:	5541                	li	a0,-16
ffffffffc0207b8c:	b7e5                	j	ffffffffc0207b74 <vfs_get_bootfs+0x3c>

ffffffffc0207b8e <vfs_do_add>:
ffffffffc0207b8e:	7139                	addi	sp,sp,-64
ffffffffc0207b90:	fc06                	sd	ra,56(sp)
ffffffffc0207b92:	f822                	sd	s0,48(sp)
ffffffffc0207b94:	f426                	sd	s1,40(sp)
ffffffffc0207b96:	f04a                	sd	s2,32(sp)
ffffffffc0207b98:	ec4e                	sd	s3,24(sp)
ffffffffc0207b9a:	e852                	sd	s4,16(sp)
ffffffffc0207b9c:	e456                	sd	s5,8(sp)
ffffffffc0207b9e:	e05a                	sd	s6,0(sp)
ffffffffc0207ba0:	0e050b63          	beqz	a0,ffffffffc0207c96 <vfs_do_add+0x108>
ffffffffc0207ba4:	842a                	mv	s0,a0
ffffffffc0207ba6:	8a2e                	mv	s4,a1
ffffffffc0207ba8:	8b32                	mv	s6,a2
ffffffffc0207baa:	8ab6                	mv	s5,a3
ffffffffc0207bac:	c5cd                	beqz	a1,ffffffffc0207c56 <vfs_do_add+0xc8>
ffffffffc0207bae:	4db8                	lw	a4,88(a1)
ffffffffc0207bb0:	6785                	lui	a5,0x1
ffffffffc0207bb2:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207bb6:	0af71163          	bne	a4,a5,ffffffffc0207c58 <vfs_do_add+0xca>
ffffffffc0207bba:	8522                	mv	a0,s0
ffffffffc0207bbc:	067030ef          	jal	ra,ffffffffc020b422 <strlen>
ffffffffc0207bc0:	47fd                	li	a5,31
ffffffffc0207bc2:	0ca7e663          	bltu	a5,a0,ffffffffc0207c8e <vfs_do_add+0x100>
ffffffffc0207bc6:	8522                	mv	a0,s0
ffffffffc0207bc8:	e2cf80ef          	jal	ra,ffffffffc02001f4 <strdup>
ffffffffc0207bcc:	84aa                	mv	s1,a0
ffffffffc0207bce:	c171                	beqz	a0,ffffffffc0207c92 <vfs_do_add+0x104>
ffffffffc0207bd0:	03000513          	li	a0,48
ffffffffc0207bd4:	bbafa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207bd8:	89aa                	mv	s3,a0
ffffffffc0207bda:	c92d                	beqz	a0,ffffffffc0207c4c <vfs_do_add+0xbe>
ffffffffc0207bdc:	0008e517          	auipc	a0,0x8e
ffffffffc0207be0:	c4c50513          	addi	a0,a0,-948 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207be4:	0008e917          	auipc	s2,0x8e
ffffffffc0207be8:	c3490913          	addi	s2,s2,-972 # ffffffffc0295818 <vdev_list>
ffffffffc0207bec:	979fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207bf0:	844a                	mv	s0,s2
ffffffffc0207bf2:	a039                	j	ffffffffc0207c00 <vfs_do_add+0x72>
ffffffffc0207bf4:	fe043503          	ld	a0,-32(s0)
ffffffffc0207bf8:	85a6                	mv	a1,s1
ffffffffc0207bfa:	071030ef          	jal	ra,ffffffffc020b46a <strcmp>
ffffffffc0207bfe:	cd2d                	beqz	a0,ffffffffc0207c78 <vfs_do_add+0xea>
ffffffffc0207c00:	6400                	ld	s0,8(s0)
ffffffffc0207c02:	ff2419e3          	bne	s0,s2,ffffffffc0207bf4 <vfs_do_add+0x66>
ffffffffc0207c06:	6418                	ld	a4,8(s0)
ffffffffc0207c08:	02098793          	addi	a5,s3,32
ffffffffc0207c0c:	0099b023          	sd	s1,0(s3)
ffffffffc0207c10:	0149b423          	sd	s4,8(s3)
ffffffffc0207c14:	0159bc23          	sd	s5,24(s3)
ffffffffc0207c18:	0169b823          	sd	s6,16(s3)
ffffffffc0207c1c:	e31c                	sd	a5,0(a4)
ffffffffc0207c1e:	0289b023          	sd	s0,32(s3)
ffffffffc0207c22:	02e9b423          	sd	a4,40(s3)
ffffffffc0207c26:	0008e517          	auipc	a0,0x8e
ffffffffc0207c2a:	c0250513          	addi	a0,a0,-1022 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c2e:	e41c                	sd	a5,8(s0)
ffffffffc0207c30:	4401                	li	s0,0
ffffffffc0207c32:	92ffc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207c36:	70e2                	ld	ra,56(sp)
ffffffffc0207c38:	8522                	mv	a0,s0
ffffffffc0207c3a:	7442                	ld	s0,48(sp)
ffffffffc0207c3c:	74a2                	ld	s1,40(sp)
ffffffffc0207c3e:	7902                	ld	s2,32(sp)
ffffffffc0207c40:	69e2                	ld	s3,24(sp)
ffffffffc0207c42:	6a42                	ld	s4,16(sp)
ffffffffc0207c44:	6aa2                	ld	s5,8(sp)
ffffffffc0207c46:	6b02                	ld	s6,0(sp)
ffffffffc0207c48:	6121                	addi	sp,sp,64
ffffffffc0207c4a:	8082                	ret
ffffffffc0207c4c:	5471                	li	s0,-4
ffffffffc0207c4e:	8526                	mv	a0,s1
ffffffffc0207c50:	beefa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207c54:	b7cd                	j	ffffffffc0207c36 <vfs_do_add+0xa8>
ffffffffc0207c56:	d2b5                	beqz	a3,ffffffffc0207bba <vfs_do_add+0x2c>
ffffffffc0207c58:	00007697          	auipc	a3,0x7
ffffffffc0207c5c:	97868693          	addi	a3,a3,-1672 # ffffffffc020e5d0 <syscalls+0xa70>
ffffffffc0207c60:	00004617          	auipc	a2,0x4
ffffffffc0207c64:	d4860613          	addi	a2,a2,-696 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207c68:	08f00593          	li	a1,143
ffffffffc0207c6c:	00007517          	auipc	a0,0x7
ffffffffc0207c70:	94c50513          	addi	a0,a0,-1716 # ffffffffc020e5b8 <syscalls+0xa58>
ffffffffc0207c74:	82bf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207c78:	0008e517          	auipc	a0,0x8e
ffffffffc0207c7c:	bb050513          	addi	a0,a0,-1104 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c80:	8e1fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207c84:	854e                	mv	a0,s3
ffffffffc0207c86:	bb8fa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207c8a:	5425                	li	s0,-23
ffffffffc0207c8c:	b7c9                	j	ffffffffc0207c4e <vfs_do_add+0xc0>
ffffffffc0207c8e:	5451                	li	s0,-12
ffffffffc0207c90:	b75d                	j	ffffffffc0207c36 <vfs_do_add+0xa8>
ffffffffc0207c92:	5471                	li	s0,-4
ffffffffc0207c94:	b74d                	j	ffffffffc0207c36 <vfs_do_add+0xa8>
ffffffffc0207c96:	00007697          	auipc	a3,0x7
ffffffffc0207c9a:	91268693          	addi	a3,a3,-1774 # ffffffffc020e5a8 <syscalls+0xa48>
ffffffffc0207c9e:	00004617          	auipc	a2,0x4
ffffffffc0207ca2:	d0a60613          	addi	a2,a2,-758 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207ca6:	08e00593          	li	a1,142
ffffffffc0207caa:	00007517          	auipc	a0,0x7
ffffffffc0207cae:	90e50513          	addi	a0,a0,-1778 # ffffffffc020e5b8 <syscalls+0xa58>
ffffffffc0207cb2:	fecf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207cb6 <find_mount.part.0>:
ffffffffc0207cb6:	1141                	addi	sp,sp,-16
ffffffffc0207cb8:	00007697          	auipc	a3,0x7
ffffffffc0207cbc:	8f068693          	addi	a3,a3,-1808 # ffffffffc020e5a8 <syscalls+0xa48>
ffffffffc0207cc0:	00004617          	auipc	a2,0x4
ffffffffc0207cc4:	ce860613          	addi	a2,a2,-792 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207cc8:	0cd00593          	li	a1,205
ffffffffc0207ccc:	00007517          	auipc	a0,0x7
ffffffffc0207cd0:	8ec50513          	addi	a0,a0,-1812 # ffffffffc020e5b8 <syscalls+0xa58>
ffffffffc0207cd4:	e406                	sd	ra,8(sp)
ffffffffc0207cd6:	fc8f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207cda <vfs_devlist_init>:
ffffffffc0207cda:	0008e797          	auipc	a5,0x8e
ffffffffc0207cde:	b3e78793          	addi	a5,a5,-1218 # ffffffffc0295818 <vdev_list>
ffffffffc0207ce2:	4585                	li	a1,1
ffffffffc0207ce4:	0008e517          	auipc	a0,0x8e
ffffffffc0207ce8:	b4450513          	addi	a0,a0,-1212 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207cec:	e79c                	sd	a5,8(a5)
ffffffffc0207cee:	e39c                	sd	a5,0(a5)
ffffffffc0207cf0:	86bfc06f          	j	ffffffffc020455a <sem_init>

ffffffffc0207cf4 <vfs_cleanup>:
ffffffffc0207cf4:	1101                	addi	sp,sp,-32
ffffffffc0207cf6:	e426                	sd	s1,8(sp)
ffffffffc0207cf8:	0008e497          	auipc	s1,0x8e
ffffffffc0207cfc:	b2048493          	addi	s1,s1,-1248 # ffffffffc0295818 <vdev_list>
ffffffffc0207d00:	649c                	ld	a5,8(s1)
ffffffffc0207d02:	ec06                	sd	ra,24(sp)
ffffffffc0207d04:	e822                	sd	s0,16(sp)
ffffffffc0207d06:	02978e63          	beq	a5,s1,ffffffffc0207d42 <vfs_cleanup+0x4e>
ffffffffc0207d0a:	0008e517          	auipc	a0,0x8e
ffffffffc0207d0e:	b1e50513          	addi	a0,a0,-1250 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207d12:	853fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207d16:	6480                	ld	s0,8(s1)
ffffffffc0207d18:	00940b63          	beq	s0,s1,ffffffffc0207d2e <vfs_cleanup+0x3a>
ffffffffc0207d1c:	ff043783          	ld	a5,-16(s0)
ffffffffc0207d20:	853e                	mv	a0,a5
ffffffffc0207d22:	c399                	beqz	a5,ffffffffc0207d28 <vfs_cleanup+0x34>
ffffffffc0207d24:	6bfc                	ld	a5,208(a5)
ffffffffc0207d26:	9782                	jalr	a5
ffffffffc0207d28:	6400                	ld	s0,8(s0)
ffffffffc0207d2a:	fe9419e3          	bne	s0,s1,ffffffffc0207d1c <vfs_cleanup+0x28>
ffffffffc0207d2e:	6442                	ld	s0,16(sp)
ffffffffc0207d30:	60e2                	ld	ra,24(sp)
ffffffffc0207d32:	64a2                	ld	s1,8(sp)
ffffffffc0207d34:	0008e517          	auipc	a0,0x8e
ffffffffc0207d38:	af450513          	addi	a0,a0,-1292 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207d3c:	6105                	addi	sp,sp,32
ffffffffc0207d3e:	823fc06f          	j	ffffffffc0204560 <up>
ffffffffc0207d42:	60e2                	ld	ra,24(sp)
ffffffffc0207d44:	6442                	ld	s0,16(sp)
ffffffffc0207d46:	64a2                	ld	s1,8(sp)
ffffffffc0207d48:	6105                	addi	sp,sp,32
ffffffffc0207d4a:	8082                	ret

ffffffffc0207d4c <vfs_get_root>:
ffffffffc0207d4c:	7179                	addi	sp,sp,-48
ffffffffc0207d4e:	f406                	sd	ra,40(sp)
ffffffffc0207d50:	f022                	sd	s0,32(sp)
ffffffffc0207d52:	ec26                	sd	s1,24(sp)
ffffffffc0207d54:	e84a                	sd	s2,16(sp)
ffffffffc0207d56:	e44e                	sd	s3,8(sp)
ffffffffc0207d58:	e052                	sd	s4,0(sp)
ffffffffc0207d5a:	c541                	beqz	a0,ffffffffc0207de2 <vfs_get_root+0x96>
ffffffffc0207d5c:	0008e917          	auipc	s2,0x8e
ffffffffc0207d60:	abc90913          	addi	s2,s2,-1348 # ffffffffc0295818 <vdev_list>
ffffffffc0207d64:	00893783          	ld	a5,8(s2)
ffffffffc0207d68:	07278b63          	beq	a5,s2,ffffffffc0207dde <vfs_get_root+0x92>
ffffffffc0207d6c:	89aa                	mv	s3,a0
ffffffffc0207d6e:	0008e517          	auipc	a0,0x8e
ffffffffc0207d72:	aba50513          	addi	a0,a0,-1350 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207d76:	8a2e                	mv	s4,a1
ffffffffc0207d78:	844a                	mv	s0,s2
ffffffffc0207d7a:	feafc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207d7e:	a801                	j	ffffffffc0207d8e <vfs_get_root+0x42>
ffffffffc0207d80:	fe043583          	ld	a1,-32(s0)
ffffffffc0207d84:	854e                	mv	a0,s3
ffffffffc0207d86:	6e4030ef          	jal	ra,ffffffffc020b46a <strcmp>
ffffffffc0207d8a:	84aa                	mv	s1,a0
ffffffffc0207d8c:	c505                	beqz	a0,ffffffffc0207db4 <vfs_get_root+0x68>
ffffffffc0207d8e:	6400                	ld	s0,8(s0)
ffffffffc0207d90:	ff2418e3          	bne	s0,s2,ffffffffc0207d80 <vfs_get_root+0x34>
ffffffffc0207d94:	54cd                	li	s1,-13
ffffffffc0207d96:	0008e517          	auipc	a0,0x8e
ffffffffc0207d9a:	a9250513          	addi	a0,a0,-1390 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207d9e:	fc2fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207da2:	70a2                	ld	ra,40(sp)
ffffffffc0207da4:	7402                	ld	s0,32(sp)
ffffffffc0207da6:	6942                	ld	s2,16(sp)
ffffffffc0207da8:	69a2                	ld	s3,8(sp)
ffffffffc0207daa:	6a02                	ld	s4,0(sp)
ffffffffc0207dac:	8526                	mv	a0,s1
ffffffffc0207dae:	64e2                	ld	s1,24(sp)
ffffffffc0207db0:	6145                	addi	sp,sp,48
ffffffffc0207db2:	8082                	ret
ffffffffc0207db4:	ff043503          	ld	a0,-16(s0)
ffffffffc0207db8:	c519                	beqz	a0,ffffffffc0207dc6 <vfs_get_root+0x7a>
ffffffffc0207dba:	617c                	ld	a5,192(a0)
ffffffffc0207dbc:	9782                	jalr	a5
ffffffffc0207dbe:	c519                	beqz	a0,ffffffffc0207dcc <vfs_get_root+0x80>
ffffffffc0207dc0:	00aa3023          	sd	a0,0(s4)
ffffffffc0207dc4:	bfc9                	j	ffffffffc0207d96 <vfs_get_root+0x4a>
ffffffffc0207dc6:	ff843783          	ld	a5,-8(s0)
ffffffffc0207dca:	c399                	beqz	a5,ffffffffc0207dd0 <vfs_get_root+0x84>
ffffffffc0207dcc:	54c9                	li	s1,-14
ffffffffc0207dce:	b7e1                	j	ffffffffc0207d96 <vfs_get_root+0x4a>
ffffffffc0207dd0:	fe843503          	ld	a0,-24(s0)
ffffffffc0207dd4:	a99ff0ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc0207dd8:	fe843503          	ld	a0,-24(s0)
ffffffffc0207ddc:	b7cd                	j	ffffffffc0207dbe <vfs_get_root+0x72>
ffffffffc0207dde:	54cd                	li	s1,-13
ffffffffc0207de0:	b7c9                	j	ffffffffc0207da2 <vfs_get_root+0x56>
ffffffffc0207de2:	00006697          	auipc	a3,0x6
ffffffffc0207de6:	7c668693          	addi	a3,a3,1990 # ffffffffc020e5a8 <syscalls+0xa48>
ffffffffc0207dea:	00004617          	auipc	a2,0x4
ffffffffc0207dee:	bbe60613          	addi	a2,a2,-1090 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207df2:	04500593          	li	a1,69
ffffffffc0207df6:	00006517          	auipc	a0,0x6
ffffffffc0207dfa:	7c250513          	addi	a0,a0,1986 # ffffffffc020e5b8 <syscalls+0xa58>
ffffffffc0207dfe:	ea0f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207e02 <vfs_get_devname>:
ffffffffc0207e02:	0008e697          	auipc	a3,0x8e
ffffffffc0207e06:	a1668693          	addi	a3,a3,-1514 # ffffffffc0295818 <vdev_list>
ffffffffc0207e0a:	87b6                	mv	a5,a3
ffffffffc0207e0c:	e511                	bnez	a0,ffffffffc0207e18 <vfs_get_devname+0x16>
ffffffffc0207e0e:	a829                	j	ffffffffc0207e28 <vfs_get_devname+0x26>
ffffffffc0207e10:	ff07b703          	ld	a4,-16(a5)
ffffffffc0207e14:	00a70763          	beq	a4,a0,ffffffffc0207e22 <vfs_get_devname+0x20>
ffffffffc0207e18:	679c                	ld	a5,8(a5)
ffffffffc0207e1a:	fed79be3          	bne	a5,a3,ffffffffc0207e10 <vfs_get_devname+0xe>
ffffffffc0207e1e:	4501                	li	a0,0
ffffffffc0207e20:	8082                	ret
ffffffffc0207e22:	fe07b503          	ld	a0,-32(a5)
ffffffffc0207e26:	8082                	ret
ffffffffc0207e28:	1141                	addi	sp,sp,-16
ffffffffc0207e2a:	00007697          	auipc	a3,0x7
ffffffffc0207e2e:	80668693          	addi	a3,a3,-2042 # ffffffffc020e630 <syscalls+0xad0>
ffffffffc0207e32:	00004617          	auipc	a2,0x4
ffffffffc0207e36:	b7660613          	addi	a2,a2,-1162 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207e3a:	06a00593          	li	a1,106
ffffffffc0207e3e:	00006517          	auipc	a0,0x6
ffffffffc0207e42:	77a50513          	addi	a0,a0,1914 # ffffffffc020e5b8 <syscalls+0xa58>
ffffffffc0207e46:	e406                	sd	ra,8(sp)
ffffffffc0207e48:	e56f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207e4c <vfs_add_dev>:
ffffffffc0207e4c:	86b2                	mv	a3,a2
ffffffffc0207e4e:	4601                	li	a2,0
ffffffffc0207e50:	d3fff06f          	j	ffffffffc0207b8e <vfs_do_add>

ffffffffc0207e54 <vfs_mount>:
ffffffffc0207e54:	7179                	addi	sp,sp,-48
ffffffffc0207e56:	e84a                	sd	s2,16(sp)
ffffffffc0207e58:	892a                	mv	s2,a0
ffffffffc0207e5a:	0008e517          	auipc	a0,0x8e
ffffffffc0207e5e:	9ce50513          	addi	a0,a0,-1586 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207e62:	e44e                	sd	s3,8(sp)
ffffffffc0207e64:	f406                	sd	ra,40(sp)
ffffffffc0207e66:	f022                	sd	s0,32(sp)
ffffffffc0207e68:	ec26                	sd	s1,24(sp)
ffffffffc0207e6a:	89ae                	mv	s3,a1
ffffffffc0207e6c:	ef8fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207e70:	08090a63          	beqz	s2,ffffffffc0207f04 <vfs_mount+0xb0>
ffffffffc0207e74:	0008e497          	auipc	s1,0x8e
ffffffffc0207e78:	9a448493          	addi	s1,s1,-1628 # ffffffffc0295818 <vdev_list>
ffffffffc0207e7c:	6480                	ld	s0,8(s1)
ffffffffc0207e7e:	00941663          	bne	s0,s1,ffffffffc0207e8a <vfs_mount+0x36>
ffffffffc0207e82:	a8ad                	j	ffffffffc0207efc <vfs_mount+0xa8>
ffffffffc0207e84:	6400                	ld	s0,8(s0)
ffffffffc0207e86:	06940b63          	beq	s0,s1,ffffffffc0207efc <vfs_mount+0xa8>
ffffffffc0207e8a:	ff843783          	ld	a5,-8(s0)
ffffffffc0207e8e:	dbfd                	beqz	a5,ffffffffc0207e84 <vfs_mount+0x30>
ffffffffc0207e90:	fe043503          	ld	a0,-32(s0)
ffffffffc0207e94:	85ca                	mv	a1,s2
ffffffffc0207e96:	5d4030ef          	jal	ra,ffffffffc020b46a <strcmp>
ffffffffc0207e9a:	f56d                	bnez	a0,ffffffffc0207e84 <vfs_mount+0x30>
ffffffffc0207e9c:	ff043783          	ld	a5,-16(s0)
ffffffffc0207ea0:	e3a5                	bnez	a5,ffffffffc0207f00 <vfs_mount+0xac>
ffffffffc0207ea2:	fe043783          	ld	a5,-32(s0)
ffffffffc0207ea6:	c3c9                	beqz	a5,ffffffffc0207f28 <vfs_mount+0xd4>
ffffffffc0207ea8:	ff843783          	ld	a5,-8(s0)
ffffffffc0207eac:	cfb5                	beqz	a5,ffffffffc0207f28 <vfs_mount+0xd4>
ffffffffc0207eae:	fe843503          	ld	a0,-24(s0)
ffffffffc0207eb2:	c939                	beqz	a0,ffffffffc0207f08 <vfs_mount+0xb4>
ffffffffc0207eb4:	4d38                	lw	a4,88(a0)
ffffffffc0207eb6:	6785                	lui	a5,0x1
ffffffffc0207eb8:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207ebc:	04f71663          	bne	a4,a5,ffffffffc0207f08 <vfs_mount+0xb4>
ffffffffc0207ec0:	ff040593          	addi	a1,s0,-16
ffffffffc0207ec4:	9982                	jalr	s3
ffffffffc0207ec6:	84aa                	mv	s1,a0
ffffffffc0207ec8:	ed01                	bnez	a0,ffffffffc0207ee0 <vfs_mount+0x8c>
ffffffffc0207eca:	ff043783          	ld	a5,-16(s0)
ffffffffc0207ece:	cfad                	beqz	a5,ffffffffc0207f48 <vfs_mount+0xf4>
ffffffffc0207ed0:	fe043583          	ld	a1,-32(s0)
ffffffffc0207ed4:	00006517          	auipc	a0,0x6
ffffffffc0207ed8:	7ec50513          	addi	a0,a0,2028 # ffffffffc020e6c0 <syscalls+0xb60>
ffffffffc0207edc:	acaf80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207ee0:	0008e517          	auipc	a0,0x8e
ffffffffc0207ee4:	94850513          	addi	a0,a0,-1720 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207ee8:	e78fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207eec:	70a2                	ld	ra,40(sp)
ffffffffc0207eee:	7402                	ld	s0,32(sp)
ffffffffc0207ef0:	6942                	ld	s2,16(sp)
ffffffffc0207ef2:	69a2                	ld	s3,8(sp)
ffffffffc0207ef4:	8526                	mv	a0,s1
ffffffffc0207ef6:	64e2                	ld	s1,24(sp)
ffffffffc0207ef8:	6145                	addi	sp,sp,48
ffffffffc0207efa:	8082                	ret
ffffffffc0207efc:	54cd                	li	s1,-13
ffffffffc0207efe:	b7cd                	j	ffffffffc0207ee0 <vfs_mount+0x8c>
ffffffffc0207f00:	54c5                	li	s1,-15
ffffffffc0207f02:	bff9                	j	ffffffffc0207ee0 <vfs_mount+0x8c>
ffffffffc0207f04:	db3ff0ef          	jal	ra,ffffffffc0207cb6 <find_mount.part.0>
ffffffffc0207f08:	00006697          	auipc	a3,0x6
ffffffffc0207f0c:	76868693          	addi	a3,a3,1896 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc0207f10:	00004617          	auipc	a2,0x4
ffffffffc0207f14:	a9860613          	addi	a2,a2,-1384 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207f18:	0ed00593          	li	a1,237
ffffffffc0207f1c:	00006517          	auipc	a0,0x6
ffffffffc0207f20:	69c50513          	addi	a0,a0,1692 # ffffffffc020e5b8 <syscalls+0xa58>
ffffffffc0207f24:	d7af80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207f28:	00006697          	auipc	a3,0x6
ffffffffc0207f2c:	71868693          	addi	a3,a3,1816 # ffffffffc020e640 <syscalls+0xae0>
ffffffffc0207f30:	00004617          	auipc	a2,0x4
ffffffffc0207f34:	a7860613          	addi	a2,a2,-1416 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207f38:	0eb00593          	li	a1,235
ffffffffc0207f3c:	00006517          	auipc	a0,0x6
ffffffffc0207f40:	67c50513          	addi	a0,a0,1660 # ffffffffc020e5b8 <syscalls+0xa58>
ffffffffc0207f44:	d5af80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207f48:	00006697          	auipc	a3,0x6
ffffffffc0207f4c:	76068693          	addi	a3,a3,1888 # ffffffffc020e6a8 <syscalls+0xb48>
ffffffffc0207f50:	00004617          	auipc	a2,0x4
ffffffffc0207f54:	a5860613          	addi	a2,a2,-1448 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0207f58:	0ef00593          	li	a1,239
ffffffffc0207f5c:	00006517          	auipc	a0,0x6
ffffffffc0207f60:	65c50513          	addi	a0,a0,1628 # ffffffffc020e5b8 <syscalls+0xa58>
ffffffffc0207f64:	d3af80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207f68 <vfs_open>:
ffffffffc0207f68:	711d                	addi	sp,sp,-96
ffffffffc0207f6a:	e4a6                	sd	s1,72(sp)
ffffffffc0207f6c:	e0ca                	sd	s2,64(sp)
ffffffffc0207f6e:	fc4e                	sd	s3,56(sp)
ffffffffc0207f70:	ec86                	sd	ra,88(sp)
ffffffffc0207f72:	e8a2                	sd	s0,80(sp)
ffffffffc0207f74:	f852                	sd	s4,48(sp)
ffffffffc0207f76:	f456                	sd	s5,40(sp)
ffffffffc0207f78:	0035f793          	andi	a5,a1,3
ffffffffc0207f7c:	84ae                	mv	s1,a1
ffffffffc0207f7e:	892a                	mv	s2,a0
ffffffffc0207f80:	89b2                	mv	s3,a2
ffffffffc0207f82:	0e078663          	beqz	a5,ffffffffc020806e <vfs_open+0x106>
ffffffffc0207f86:	470d                	li	a4,3
ffffffffc0207f88:	0105fa93          	andi	s5,a1,16
ffffffffc0207f8c:	0ce78f63          	beq	a5,a4,ffffffffc020806a <vfs_open+0x102>
ffffffffc0207f90:	002c                	addi	a1,sp,8
ffffffffc0207f92:	854a                	mv	a0,s2
ffffffffc0207f94:	2ae000ef          	jal	ra,ffffffffc0208242 <vfs_lookup>
ffffffffc0207f98:	842a                	mv	s0,a0
ffffffffc0207f9a:	0044fa13          	andi	s4,s1,4
ffffffffc0207f9e:	e159                	bnez	a0,ffffffffc0208024 <vfs_open+0xbc>
ffffffffc0207fa0:	00c4f793          	andi	a5,s1,12
ffffffffc0207fa4:	4731                	li	a4,12
ffffffffc0207fa6:	0ee78263          	beq	a5,a4,ffffffffc020808a <vfs_open+0x122>
ffffffffc0207faa:	6422                	ld	s0,8(sp)
ffffffffc0207fac:	12040163          	beqz	s0,ffffffffc02080ce <vfs_open+0x166>
ffffffffc0207fb0:	783c                	ld	a5,112(s0)
ffffffffc0207fb2:	cff1                	beqz	a5,ffffffffc020808e <vfs_open+0x126>
ffffffffc0207fb4:	679c                	ld	a5,8(a5)
ffffffffc0207fb6:	cfe1                	beqz	a5,ffffffffc020808e <vfs_open+0x126>
ffffffffc0207fb8:	8522                	mv	a0,s0
ffffffffc0207fba:	00006597          	auipc	a1,0x6
ffffffffc0207fbe:	7e658593          	addi	a1,a1,2022 # ffffffffc020e7a0 <syscalls+0xc40>
ffffffffc0207fc2:	8c3ff0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0207fc6:	783c                	ld	a5,112(s0)
ffffffffc0207fc8:	6522                	ld	a0,8(sp)
ffffffffc0207fca:	85a6                	mv	a1,s1
ffffffffc0207fcc:	679c                	ld	a5,8(a5)
ffffffffc0207fce:	9782                	jalr	a5
ffffffffc0207fd0:	842a                	mv	s0,a0
ffffffffc0207fd2:	6522                	ld	a0,8(sp)
ffffffffc0207fd4:	e845                	bnez	s0,ffffffffc0208084 <vfs_open+0x11c>
ffffffffc0207fd6:	015a6a33          	or	s4,s4,s5
ffffffffc0207fda:	89fff0ef          	jal	ra,ffffffffc0207878 <inode_open_inc>
ffffffffc0207fde:	020a0663          	beqz	s4,ffffffffc020800a <vfs_open+0xa2>
ffffffffc0207fe2:	64a2                	ld	s1,8(sp)
ffffffffc0207fe4:	c4e9                	beqz	s1,ffffffffc02080ae <vfs_open+0x146>
ffffffffc0207fe6:	78bc                	ld	a5,112(s1)
ffffffffc0207fe8:	c3f9                	beqz	a5,ffffffffc02080ae <vfs_open+0x146>
ffffffffc0207fea:	73bc                	ld	a5,96(a5)
ffffffffc0207fec:	c3e9                	beqz	a5,ffffffffc02080ae <vfs_open+0x146>
ffffffffc0207fee:	00007597          	auipc	a1,0x7
ffffffffc0207ff2:	81258593          	addi	a1,a1,-2030 # ffffffffc020e800 <syscalls+0xca0>
ffffffffc0207ff6:	8526                	mv	a0,s1
ffffffffc0207ff8:	88dff0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0207ffc:	78bc                	ld	a5,112(s1)
ffffffffc0207ffe:	6522                	ld	a0,8(sp)
ffffffffc0208000:	4581                	li	a1,0
ffffffffc0208002:	73bc                	ld	a5,96(a5)
ffffffffc0208004:	9782                	jalr	a5
ffffffffc0208006:	87aa                	mv	a5,a0
ffffffffc0208008:	e92d                	bnez	a0,ffffffffc020807a <vfs_open+0x112>
ffffffffc020800a:	67a2                	ld	a5,8(sp)
ffffffffc020800c:	00f9b023          	sd	a5,0(s3)
ffffffffc0208010:	60e6                	ld	ra,88(sp)
ffffffffc0208012:	8522                	mv	a0,s0
ffffffffc0208014:	6446                	ld	s0,80(sp)
ffffffffc0208016:	64a6                	ld	s1,72(sp)
ffffffffc0208018:	6906                	ld	s2,64(sp)
ffffffffc020801a:	79e2                	ld	s3,56(sp)
ffffffffc020801c:	7a42                	ld	s4,48(sp)
ffffffffc020801e:	7aa2                	ld	s5,40(sp)
ffffffffc0208020:	6125                	addi	sp,sp,96
ffffffffc0208022:	8082                	ret
ffffffffc0208024:	57c1                	li	a5,-16
ffffffffc0208026:	fef515e3          	bne	a0,a5,ffffffffc0208010 <vfs_open+0xa8>
ffffffffc020802a:	fe0a03e3          	beqz	s4,ffffffffc0208010 <vfs_open+0xa8>
ffffffffc020802e:	0810                	addi	a2,sp,16
ffffffffc0208030:	082c                	addi	a1,sp,24
ffffffffc0208032:	854a                	mv	a0,s2
ffffffffc0208034:	2a4000ef          	jal	ra,ffffffffc02082d8 <vfs_lookup_parent>
ffffffffc0208038:	842a                	mv	s0,a0
ffffffffc020803a:	f979                	bnez	a0,ffffffffc0208010 <vfs_open+0xa8>
ffffffffc020803c:	6462                	ld	s0,24(sp)
ffffffffc020803e:	c845                	beqz	s0,ffffffffc02080ee <vfs_open+0x186>
ffffffffc0208040:	783c                	ld	a5,112(s0)
ffffffffc0208042:	c7d5                	beqz	a5,ffffffffc02080ee <vfs_open+0x186>
ffffffffc0208044:	77bc                	ld	a5,104(a5)
ffffffffc0208046:	c7c5                	beqz	a5,ffffffffc02080ee <vfs_open+0x186>
ffffffffc0208048:	8522                	mv	a0,s0
ffffffffc020804a:	00006597          	auipc	a1,0x6
ffffffffc020804e:	6ee58593          	addi	a1,a1,1774 # ffffffffc020e738 <syscalls+0xbd8>
ffffffffc0208052:	833ff0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0208056:	783c                	ld	a5,112(s0)
ffffffffc0208058:	65c2                	ld	a1,16(sp)
ffffffffc020805a:	6562                	ld	a0,24(sp)
ffffffffc020805c:	77bc                	ld	a5,104(a5)
ffffffffc020805e:	4034d613          	srai	a2,s1,0x3
ffffffffc0208062:	0034                	addi	a3,sp,8
ffffffffc0208064:	8a05                	andi	a2,a2,1
ffffffffc0208066:	9782                	jalr	a5
ffffffffc0208068:	b789                	j	ffffffffc0207faa <vfs_open+0x42>
ffffffffc020806a:	5475                	li	s0,-3
ffffffffc020806c:	b755                	j	ffffffffc0208010 <vfs_open+0xa8>
ffffffffc020806e:	0105fa93          	andi	s5,a1,16
ffffffffc0208072:	5475                	li	s0,-3
ffffffffc0208074:	f80a9ee3          	bnez	s5,ffffffffc0208010 <vfs_open+0xa8>
ffffffffc0208078:	bf21                	j	ffffffffc0207f90 <vfs_open+0x28>
ffffffffc020807a:	6522                	ld	a0,8(sp)
ffffffffc020807c:	843e                	mv	s0,a5
ffffffffc020807e:	965ff0ef          	jal	ra,ffffffffc02079e2 <inode_open_dec>
ffffffffc0208082:	6522                	ld	a0,8(sp)
ffffffffc0208084:	8b7ff0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc0208088:	b761                	j	ffffffffc0208010 <vfs_open+0xa8>
ffffffffc020808a:	5425                	li	s0,-23
ffffffffc020808c:	b751                	j	ffffffffc0208010 <vfs_open+0xa8>
ffffffffc020808e:	00006697          	auipc	a3,0x6
ffffffffc0208092:	6c268693          	addi	a3,a3,1730 # ffffffffc020e750 <syscalls+0xbf0>
ffffffffc0208096:	00004617          	auipc	a2,0x4
ffffffffc020809a:	91260613          	addi	a2,a2,-1774 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020809e:	03300593          	li	a1,51
ffffffffc02080a2:	00006517          	auipc	a0,0x6
ffffffffc02080a6:	67e50513          	addi	a0,a0,1662 # ffffffffc020e720 <syscalls+0xbc0>
ffffffffc02080aa:	bf4f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02080ae:	00006697          	auipc	a3,0x6
ffffffffc02080b2:	6fa68693          	addi	a3,a3,1786 # ffffffffc020e7a8 <syscalls+0xc48>
ffffffffc02080b6:	00004617          	auipc	a2,0x4
ffffffffc02080ba:	8f260613          	addi	a2,a2,-1806 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02080be:	03a00593          	li	a1,58
ffffffffc02080c2:	00006517          	auipc	a0,0x6
ffffffffc02080c6:	65e50513          	addi	a0,a0,1630 # ffffffffc020e720 <syscalls+0xbc0>
ffffffffc02080ca:	bd4f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02080ce:	00006697          	auipc	a3,0x6
ffffffffc02080d2:	67268693          	addi	a3,a3,1650 # ffffffffc020e740 <syscalls+0xbe0>
ffffffffc02080d6:	00004617          	auipc	a2,0x4
ffffffffc02080da:	8d260613          	addi	a2,a2,-1838 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02080de:	03100593          	li	a1,49
ffffffffc02080e2:	00006517          	auipc	a0,0x6
ffffffffc02080e6:	63e50513          	addi	a0,a0,1598 # ffffffffc020e720 <syscalls+0xbc0>
ffffffffc02080ea:	bb4f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02080ee:	00006697          	auipc	a3,0x6
ffffffffc02080f2:	5e268693          	addi	a3,a3,1506 # ffffffffc020e6d0 <syscalls+0xb70>
ffffffffc02080f6:	00004617          	auipc	a2,0x4
ffffffffc02080fa:	8b260613          	addi	a2,a2,-1870 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02080fe:	02c00593          	li	a1,44
ffffffffc0208102:	00006517          	auipc	a0,0x6
ffffffffc0208106:	61e50513          	addi	a0,a0,1566 # ffffffffc020e720 <syscalls+0xbc0>
ffffffffc020810a:	b94f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020810e <vfs_close>:
ffffffffc020810e:	1141                	addi	sp,sp,-16
ffffffffc0208110:	e406                	sd	ra,8(sp)
ffffffffc0208112:	e022                	sd	s0,0(sp)
ffffffffc0208114:	842a                	mv	s0,a0
ffffffffc0208116:	8cdff0ef          	jal	ra,ffffffffc02079e2 <inode_open_dec>
ffffffffc020811a:	8522                	mv	a0,s0
ffffffffc020811c:	81fff0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc0208120:	60a2                	ld	ra,8(sp)
ffffffffc0208122:	6402                	ld	s0,0(sp)
ffffffffc0208124:	4501                	li	a0,0
ffffffffc0208126:	0141                	addi	sp,sp,16
ffffffffc0208128:	8082                	ret

ffffffffc020812a <get_device>:
ffffffffc020812a:	7179                	addi	sp,sp,-48
ffffffffc020812c:	ec26                	sd	s1,24(sp)
ffffffffc020812e:	e84a                	sd	s2,16(sp)
ffffffffc0208130:	f406                	sd	ra,40(sp)
ffffffffc0208132:	f022                	sd	s0,32(sp)
ffffffffc0208134:	00054303          	lbu	t1,0(a0)
ffffffffc0208138:	892e                	mv	s2,a1
ffffffffc020813a:	84b2                	mv	s1,a2
ffffffffc020813c:	02030463          	beqz	t1,ffffffffc0208164 <get_device+0x3a>
ffffffffc0208140:	00150413          	addi	s0,a0,1
ffffffffc0208144:	86a2                	mv	a3,s0
ffffffffc0208146:	879a                	mv	a5,t1
ffffffffc0208148:	4701                	li	a4,0
ffffffffc020814a:	03a00813          	li	a6,58
ffffffffc020814e:	02f00893          	li	a7,47
ffffffffc0208152:	03078263          	beq	a5,a6,ffffffffc0208176 <get_device+0x4c>
ffffffffc0208156:	05178963          	beq	a5,a7,ffffffffc02081a8 <get_device+0x7e>
ffffffffc020815a:	0006c783          	lbu	a5,0(a3)
ffffffffc020815e:	2705                	addiw	a4,a4,1
ffffffffc0208160:	0685                	addi	a3,a3,1
ffffffffc0208162:	fbe5                	bnez	a5,ffffffffc0208152 <get_device+0x28>
ffffffffc0208164:	7402                	ld	s0,32(sp)
ffffffffc0208166:	00a93023          	sd	a0,0(s2)
ffffffffc020816a:	70a2                	ld	ra,40(sp)
ffffffffc020816c:	6942                	ld	s2,16(sp)
ffffffffc020816e:	8526                	mv	a0,s1
ffffffffc0208170:	64e2                	ld	s1,24(sp)
ffffffffc0208172:	6145                	addi	sp,sp,48
ffffffffc0208174:	a279                	j	ffffffffc0208302 <vfs_get_curdir>
ffffffffc0208176:	cb15                	beqz	a4,ffffffffc02081aa <get_device+0x80>
ffffffffc0208178:	00e507b3          	add	a5,a0,a4
ffffffffc020817c:	0705                	addi	a4,a4,1
ffffffffc020817e:	00078023          	sb	zero,0(a5)
ffffffffc0208182:	972a                	add	a4,a4,a0
ffffffffc0208184:	02f00613          	li	a2,47
ffffffffc0208188:	00074783          	lbu	a5,0(a4)
ffffffffc020818c:	86ba                	mv	a3,a4
ffffffffc020818e:	0705                	addi	a4,a4,1
ffffffffc0208190:	fec78ce3          	beq	a5,a2,ffffffffc0208188 <get_device+0x5e>
ffffffffc0208194:	7402                	ld	s0,32(sp)
ffffffffc0208196:	70a2                	ld	ra,40(sp)
ffffffffc0208198:	00d93023          	sd	a3,0(s2)
ffffffffc020819c:	85a6                	mv	a1,s1
ffffffffc020819e:	6942                	ld	s2,16(sp)
ffffffffc02081a0:	64e2                	ld	s1,24(sp)
ffffffffc02081a2:	6145                	addi	sp,sp,48
ffffffffc02081a4:	ba9ff06f          	j	ffffffffc0207d4c <vfs_get_root>
ffffffffc02081a8:	ff55                	bnez	a4,ffffffffc0208164 <get_device+0x3a>
ffffffffc02081aa:	02f00793          	li	a5,47
ffffffffc02081ae:	04f30563          	beq	t1,a5,ffffffffc02081f8 <get_device+0xce>
ffffffffc02081b2:	03a00793          	li	a5,58
ffffffffc02081b6:	06f31663          	bne	t1,a5,ffffffffc0208222 <get_device+0xf8>
ffffffffc02081ba:	0028                	addi	a0,sp,8
ffffffffc02081bc:	146000ef          	jal	ra,ffffffffc0208302 <vfs_get_curdir>
ffffffffc02081c0:	e515                	bnez	a0,ffffffffc02081ec <get_device+0xc2>
ffffffffc02081c2:	67a2                	ld	a5,8(sp)
ffffffffc02081c4:	77a8                	ld	a0,104(a5)
ffffffffc02081c6:	cd15                	beqz	a0,ffffffffc0208202 <get_device+0xd8>
ffffffffc02081c8:	617c                	ld	a5,192(a0)
ffffffffc02081ca:	9782                	jalr	a5
ffffffffc02081cc:	87aa                	mv	a5,a0
ffffffffc02081ce:	6522                	ld	a0,8(sp)
ffffffffc02081d0:	e09c                	sd	a5,0(s1)
ffffffffc02081d2:	f68ff0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc02081d6:	02f00713          	li	a4,47
ffffffffc02081da:	a011                	j	ffffffffc02081de <get_device+0xb4>
ffffffffc02081dc:	0405                	addi	s0,s0,1
ffffffffc02081de:	00044783          	lbu	a5,0(s0)
ffffffffc02081e2:	fee78de3          	beq	a5,a4,ffffffffc02081dc <get_device+0xb2>
ffffffffc02081e6:	00893023          	sd	s0,0(s2)
ffffffffc02081ea:	4501                	li	a0,0
ffffffffc02081ec:	70a2                	ld	ra,40(sp)
ffffffffc02081ee:	7402                	ld	s0,32(sp)
ffffffffc02081f0:	64e2                	ld	s1,24(sp)
ffffffffc02081f2:	6942                	ld	s2,16(sp)
ffffffffc02081f4:	6145                	addi	sp,sp,48
ffffffffc02081f6:	8082                	ret
ffffffffc02081f8:	8526                	mv	a0,s1
ffffffffc02081fa:	93fff0ef          	jal	ra,ffffffffc0207b38 <vfs_get_bootfs>
ffffffffc02081fe:	dd61                	beqz	a0,ffffffffc02081d6 <get_device+0xac>
ffffffffc0208200:	b7f5                	j	ffffffffc02081ec <get_device+0xc2>
ffffffffc0208202:	00006697          	auipc	a3,0x6
ffffffffc0208206:	63668693          	addi	a3,a3,1590 # ffffffffc020e838 <syscalls+0xcd8>
ffffffffc020820a:	00003617          	auipc	a2,0x3
ffffffffc020820e:	79e60613          	addi	a2,a2,1950 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208212:	03900593          	li	a1,57
ffffffffc0208216:	00006517          	auipc	a0,0x6
ffffffffc020821a:	60a50513          	addi	a0,a0,1546 # ffffffffc020e820 <syscalls+0xcc0>
ffffffffc020821e:	a80f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208222:	00006697          	auipc	a3,0x6
ffffffffc0208226:	5ee68693          	addi	a3,a3,1518 # ffffffffc020e810 <syscalls+0xcb0>
ffffffffc020822a:	00003617          	auipc	a2,0x3
ffffffffc020822e:	77e60613          	addi	a2,a2,1918 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208232:	03300593          	li	a1,51
ffffffffc0208236:	00006517          	auipc	a0,0x6
ffffffffc020823a:	5ea50513          	addi	a0,a0,1514 # ffffffffc020e820 <syscalls+0xcc0>
ffffffffc020823e:	a60f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208242 <vfs_lookup>:
ffffffffc0208242:	7139                	addi	sp,sp,-64
ffffffffc0208244:	f426                	sd	s1,40(sp)
ffffffffc0208246:	0830                	addi	a2,sp,24
ffffffffc0208248:	84ae                	mv	s1,a1
ffffffffc020824a:	002c                	addi	a1,sp,8
ffffffffc020824c:	f822                	sd	s0,48(sp)
ffffffffc020824e:	fc06                	sd	ra,56(sp)
ffffffffc0208250:	f04a                	sd	s2,32(sp)
ffffffffc0208252:	e42a                	sd	a0,8(sp)
ffffffffc0208254:	ed7ff0ef          	jal	ra,ffffffffc020812a <get_device>
ffffffffc0208258:	842a                	mv	s0,a0
ffffffffc020825a:	ed1d                	bnez	a0,ffffffffc0208298 <vfs_lookup+0x56>
ffffffffc020825c:	67a2                	ld	a5,8(sp)
ffffffffc020825e:	6962                	ld	s2,24(sp)
ffffffffc0208260:	0007c783          	lbu	a5,0(a5)
ffffffffc0208264:	c3a9                	beqz	a5,ffffffffc02082a6 <vfs_lookup+0x64>
ffffffffc0208266:	04090963          	beqz	s2,ffffffffc02082b8 <vfs_lookup+0x76>
ffffffffc020826a:	07093783          	ld	a5,112(s2)
ffffffffc020826e:	c7a9                	beqz	a5,ffffffffc02082b8 <vfs_lookup+0x76>
ffffffffc0208270:	7bbc                	ld	a5,112(a5)
ffffffffc0208272:	c3b9                	beqz	a5,ffffffffc02082b8 <vfs_lookup+0x76>
ffffffffc0208274:	854a                	mv	a0,s2
ffffffffc0208276:	00006597          	auipc	a1,0x6
ffffffffc020827a:	62a58593          	addi	a1,a1,1578 # ffffffffc020e8a0 <syscalls+0xd40>
ffffffffc020827e:	e06ff0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0208282:	07093783          	ld	a5,112(s2)
ffffffffc0208286:	65a2                	ld	a1,8(sp)
ffffffffc0208288:	6562                	ld	a0,24(sp)
ffffffffc020828a:	7bbc                	ld	a5,112(a5)
ffffffffc020828c:	8626                	mv	a2,s1
ffffffffc020828e:	9782                	jalr	a5
ffffffffc0208290:	842a                	mv	s0,a0
ffffffffc0208292:	6562                	ld	a0,24(sp)
ffffffffc0208294:	ea6ff0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc0208298:	70e2                	ld	ra,56(sp)
ffffffffc020829a:	8522                	mv	a0,s0
ffffffffc020829c:	7442                	ld	s0,48(sp)
ffffffffc020829e:	74a2                	ld	s1,40(sp)
ffffffffc02082a0:	7902                	ld	s2,32(sp)
ffffffffc02082a2:	6121                	addi	sp,sp,64
ffffffffc02082a4:	8082                	ret
ffffffffc02082a6:	70e2                	ld	ra,56(sp)
ffffffffc02082a8:	8522                	mv	a0,s0
ffffffffc02082aa:	7442                	ld	s0,48(sp)
ffffffffc02082ac:	0124b023          	sd	s2,0(s1)
ffffffffc02082b0:	74a2                	ld	s1,40(sp)
ffffffffc02082b2:	7902                	ld	s2,32(sp)
ffffffffc02082b4:	6121                	addi	sp,sp,64
ffffffffc02082b6:	8082                	ret
ffffffffc02082b8:	00006697          	auipc	a3,0x6
ffffffffc02082bc:	59868693          	addi	a3,a3,1432 # ffffffffc020e850 <syscalls+0xcf0>
ffffffffc02082c0:	00003617          	auipc	a2,0x3
ffffffffc02082c4:	6e860613          	addi	a2,a2,1768 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02082c8:	04f00593          	li	a1,79
ffffffffc02082cc:	00006517          	auipc	a0,0x6
ffffffffc02082d0:	55450513          	addi	a0,a0,1364 # ffffffffc020e820 <syscalls+0xcc0>
ffffffffc02082d4:	9caf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02082d8 <vfs_lookup_parent>:
ffffffffc02082d8:	7139                	addi	sp,sp,-64
ffffffffc02082da:	f822                	sd	s0,48(sp)
ffffffffc02082dc:	f426                	sd	s1,40(sp)
ffffffffc02082de:	842e                	mv	s0,a1
ffffffffc02082e0:	84b2                	mv	s1,a2
ffffffffc02082e2:	002c                	addi	a1,sp,8
ffffffffc02082e4:	0830                	addi	a2,sp,24
ffffffffc02082e6:	fc06                	sd	ra,56(sp)
ffffffffc02082e8:	e42a                	sd	a0,8(sp)
ffffffffc02082ea:	e41ff0ef          	jal	ra,ffffffffc020812a <get_device>
ffffffffc02082ee:	e509                	bnez	a0,ffffffffc02082f8 <vfs_lookup_parent+0x20>
ffffffffc02082f0:	67a2                	ld	a5,8(sp)
ffffffffc02082f2:	e09c                	sd	a5,0(s1)
ffffffffc02082f4:	67e2                	ld	a5,24(sp)
ffffffffc02082f6:	e01c                	sd	a5,0(s0)
ffffffffc02082f8:	70e2                	ld	ra,56(sp)
ffffffffc02082fa:	7442                	ld	s0,48(sp)
ffffffffc02082fc:	74a2                	ld	s1,40(sp)
ffffffffc02082fe:	6121                	addi	sp,sp,64
ffffffffc0208300:	8082                	ret

ffffffffc0208302 <vfs_get_curdir>:
ffffffffc0208302:	0008e797          	auipc	a5,0x8e
ffffffffc0208306:	5be7b783          	ld	a5,1470(a5) # ffffffffc02968c0 <current>
ffffffffc020830a:	1487b783          	ld	a5,328(a5)
ffffffffc020830e:	1101                	addi	sp,sp,-32
ffffffffc0208310:	e426                	sd	s1,8(sp)
ffffffffc0208312:	6384                	ld	s1,0(a5)
ffffffffc0208314:	ec06                	sd	ra,24(sp)
ffffffffc0208316:	e822                	sd	s0,16(sp)
ffffffffc0208318:	cc81                	beqz	s1,ffffffffc0208330 <vfs_get_curdir+0x2e>
ffffffffc020831a:	842a                	mv	s0,a0
ffffffffc020831c:	8526                	mv	a0,s1
ffffffffc020831e:	d4eff0ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc0208322:	4501                	li	a0,0
ffffffffc0208324:	e004                	sd	s1,0(s0)
ffffffffc0208326:	60e2                	ld	ra,24(sp)
ffffffffc0208328:	6442                	ld	s0,16(sp)
ffffffffc020832a:	64a2                	ld	s1,8(sp)
ffffffffc020832c:	6105                	addi	sp,sp,32
ffffffffc020832e:	8082                	ret
ffffffffc0208330:	5541                	li	a0,-16
ffffffffc0208332:	bfd5                	j	ffffffffc0208326 <vfs_get_curdir+0x24>

ffffffffc0208334 <vfs_set_curdir>:
ffffffffc0208334:	7139                	addi	sp,sp,-64
ffffffffc0208336:	f04a                	sd	s2,32(sp)
ffffffffc0208338:	0008e917          	auipc	s2,0x8e
ffffffffc020833c:	58890913          	addi	s2,s2,1416 # ffffffffc02968c0 <current>
ffffffffc0208340:	00093783          	ld	a5,0(s2)
ffffffffc0208344:	f822                	sd	s0,48(sp)
ffffffffc0208346:	842a                	mv	s0,a0
ffffffffc0208348:	1487b503          	ld	a0,328(a5)
ffffffffc020834c:	ec4e                	sd	s3,24(sp)
ffffffffc020834e:	fc06                	sd	ra,56(sp)
ffffffffc0208350:	f426                	sd	s1,40(sp)
ffffffffc0208352:	e71fc0ef          	jal	ra,ffffffffc02051c2 <lock_files>
ffffffffc0208356:	00093783          	ld	a5,0(s2)
ffffffffc020835a:	1487b503          	ld	a0,328(a5)
ffffffffc020835e:	00053983          	ld	s3,0(a0)
ffffffffc0208362:	07340963          	beq	s0,s3,ffffffffc02083d4 <vfs_set_curdir+0xa0>
ffffffffc0208366:	cc39                	beqz	s0,ffffffffc02083c4 <vfs_set_curdir+0x90>
ffffffffc0208368:	783c                	ld	a5,112(s0)
ffffffffc020836a:	c7bd                	beqz	a5,ffffffffc02083d8 <vfs_set_curdir+0xa4>
ffffffffc020836c:	6bbc                	ld	a5,80(a5)
ffffffffc020836e:	c7ad                	beqz	a5,ffffffffc02083d8 <vfs_set_curdir+0xa4>
ffffffffc0208370:	00006597          	auipc	a1,0x6
ffffffffc0208374:	5a058593          	addi	a1,a1,1440 # ffffffffc020e910 <syscalls+0xdb0>
ffffffffc0208378:	8522                	mv	a0,s0
ffffffffc020837a:	d0aff0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc020837e:	783c                	ld	a5,112(s0)
ffffffffc0208380:	006c                	addi	a1,sp,12
ffffffffc0208382:	8522                	mv	a0,s0
ffffffffc0208384:	6bbc                	ld	a5,80(a5)
ffffffffc0208386:	9782                	jalr	a5
ffffffffc0208388:	84aa                	mv	s1,a0
ffffffffc020838a:	e901                	bnez	a0,ffffffffc020839a <vfs_set_curdir+0x66>
ffffffffc020838c:	47b2                	lw	a5,12(sp)
ffffffffc020838e:	669d                	lui	a3,0x7
ffffffffc0208390:	6709                	lui	a4,0x2
ffffffffc0208392:	8ff5                	and	a5,a5,a3
ffffffffc0208394:	54b9                	li	s1,-18
ffffffffc0208396:	02e78063          	beq	a5,a4,ffffffffc02083b6 <vfs_set_curdir+0x82>
ffffffffc020839a:	00093783          	ld	a5,0(s2)
ffffffffc020839e:	1487b503          	ld	a0,328(a5)
ffffffffc02083a2:	e27fc0ef          	jal	ra,ffffffffc02051c8 <unlock_files>
ffffffffc02083a6:	70e2                	ld	ra,56(sp)
ffffffffc02083a8:	7442                	ld	s0,48(sp)
ffffffffc02083aa:	7902                	ld	s2,32(sp)
ffffffffc02083ac:	69e2                	ld	s3,24(sp)
ffffffffc02083ae:	8526                	mv	a0,s1
ffffffffc02083b0:	74a2                	ld	s1,40(sp)
ffffffffc02083b2:	6121                	addi	sp,sp,64
ffffffffc02083b4:	8082                	ret
ffffffffc02083b6:	8522                	mv	a0,s0
ffffffffc02083b8:	cb4ff0ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc02083bc:	00093783          	ld	a5,0(s2)
ffffffffc02083c0:	1487b503          	ld	a0,328(a5)
ffffffffc02083c4:	e100                	sd	s0,0(a0)
ffffffffc02083c6:	4481                	li	s1,0
ffffffffc02083c8:	fc098de3          	beqz	s3,ffffffffc02083a2 <vfs_set_curdir+0x6e>
ffffffffc02083cc:	854e                	mv	a0,s3
ffffffffc02083ce:	d6cff0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc02083d2:	b7e1                	j	ffffffffc020839a <vfs_set_curdir+0x66>
ffffffffc02083d4:	4481                	li	s1,0
ffffffffc02083d6:	b7f1                	j	ffffffffc02083a2 <vfs_set_curdir+0x6e>
ffffffffc02083d8:	00006697          	auipc	a3,0x6
ffffffffc02083dc:	4d068693          	addi	a3,a3,1232 # ffffffffc020e8a8 <syscalls+0xd48>
ffffffffc02083e0:	00003617          	auipc	a2,0x3
ffffffffc02083e4:	5c860613          	addi	a2,a2,1480 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02083e8:	04300593          	li	a1,67
ffffffffc02083ec:	00006517          	auipc	a0,0x6
ffffffffc02083f0:	50c50513          	addi	a0,a0,1292 # ffffffffc020e8f8 <syscalls+0xd98>
ffffffffc02083f4:	8aaf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02083f8 <vfs_chdir>:
ffffffffc02083f8:	1101                	addi	sp,sp,-32
ffffffffc02083fa:	002c                	addi	a1,sp,8
ffffffffc02083fc:	e822                	sd	s0,16(sp)
ffffffffc02083fe:	ec06                	sd	ra,24(sp)
ffffffffc0208400:	e43ff0ef          	jal	ra,ffffffffc0208242 <vfs_lookup>
ffffffffc0208404:	842a                	mv	s0,a0
ffffffffc0208406:	c511                	beqz	a0,ffffffffc0208412 <vfs_chdir+0x1a>
ffffffffc0208408:	60e2                	ld	ra,24(sp)
ffffffffc020840a:	8522                	mv	a0,s0
ffffffffc020840c:	6442                	ld	s0,16(sp)
ffffffffc020840e:	6105                	addi	sp,sp,32
ffffffffc0208410:	8082                	ret
ffffffffc0208412:	6522                	ld	a0,8(sp)
ffffffffc0208414:	f21ff0ef          	jal	ra,ffffffffc0208334 <vfs_set_curdir>
ffffffffc0208418:	842a                	mv	s0,a0
ffffffffc020841a:	6522                	ld	a0,8(sp)
ffffffffc020841c:	d1eff0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc0208420:	60e2                	ld	ra,24(sp)
ffffffffc0208422:	8522                	mv	a0,s0
ffffffffc0208424:	6442                	ld	s0,16(sp)
ffffffffc0208426:	6105                	addi	sp,sp,32
ffffffffc0208428:	8082                	ret

ffffffffc020842a <vfs_getcwd>:
ffffffffc020842a:	0008e797          	auipc	a5,0x8e
ffffffffc020842e:	4967b783          	ld	a5,1174(a5) # ffffffffc02968c0 <current>
ffffffffc0208432:	1487b783          	ld	a5,328(a5)
ffffffffc0208436:	7179                	addi	sp,sp,-48
ffffffffc0208438:	ec26                	sd	s1,24(sp)
ffffffffc020843a:	6384                	ld	s1,0(a5)
ffffffffc020843c:	f406                	sd	ra,40(sp)
ffffffffc020843e:	f022                	sd	s0,32(sp)
ffffffffc0208440:	e84a                	sd	s2,16(sp)
ffffffffc0208442:	ccbd                	beqz	s1,ffffffffc02084c0 <vfs_getcwd+0x96>
ffffffffc0208444:	892a                	mv	s2,a0
ffffffffc0208446:	8526                	mv	a0,s1
ffffffffc0208448:	c24ff0ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc020844c:	74a8                	ld	a0,104(s1)
ffffffffc020844e:	c93d                	beqz	a0,ffffffffc02084c4 <vfs_getcwd+0x9a>
ffffffffc0208450:	9b3ff0ef          	jal	ra,ffffffffc0207e02 <vfs_get_devname>
ffffffffc0208454:	842a                	mv	s0,a0
ffffffffc0208456:	7cd020ef          	jal	ra,ffffffffc020b422 <strlen>
ffffffffc020845a:	862a                	mv	a2,a0
ffffffffc020845c:	85a2                	mv	a1,s0
ffffffffc020845e:	4701                	li	a4,0
ffffffffc0208460:	4685                	li	a3,1
ffffffffc0208462:	854a                	mv	a0,s2
ffffffffc0208464:	f89fc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc0208468:	842a                	mv	s0,a0
ffffffffc020846a:	c919                	beqz	a0,ffffffffc0208480 <vfs_getcwd+0x56>
ffffffffc020846c:	8526                	mv	a0,s1
ffffffffc020846e:	cccff0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc0208472:	70a2                	ld	ra,40(sp)
ffffffffc0208474:	8522                	mv	a0,s0
ffffffffc0208476:	7402                	ld	s0,32(sp)
ffffffffc0208478:	64e2                	ld	s1,24(sp)
ffffffffc020847a:	6942                	ld	s2,16(sp)
ffffffffc020847c:	6145                	addi	sp,sp,48
ffffffffc020847e:	8082                	ret
ffffffffc0208480:	03a00793          	li	a5,58
ffffffffc0208484:	4701                	li	a4,0
ffffffffc0208486:	4685                	li	a3,1
ffffffffc0208488:	4605                	li	a2,1
ffffffffc020848a:	00f10593          	addi	a1,sp,15
ffffffffc020848e:	854a                	mv	a0,s2
ffffffffc0208490:	00f107a3          	sb	a5,15(sp)
ffffffffc0208494:	f59fc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc0208498:	842a                	mv	s0,a0
ffffffffc020849a:	f969                	bnez	a0,ffffffffc020846c <vfs_getcwd+0x42>
ffffffffc020849c:	78bc                	ld	a5,112(s1)
ffffffffc020849e:	c3b9                	beqz	a5,ffffffffc02084e4 <vfs_getcwd+0xba>
ffffffffc02084a0:	7f9c                	ld	a5,56(a5)
ffffffffc02084a2:	c3a9                	beqz	a5,ffffffffc02084e4 <vfs_getcwd+0xba>
ffffffffc02084a4:	00006597          	auipc	a1,0x6
ffffffffc02084a8:	4cc58593          	addi	a1,a1,1228 # ffffffffc020e970 <syscalls+0xe10>
ffffffffc02084ac:	8526                	mv	a0,s1
ffffffffc02084ae:	bd6ff0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc02084b2:	78bc                	ld	a5,112(s1)
ffffffffc02084b4:	85ca                	mv	a1,s2
ffffffffc02084b6:	8526                	mv	a0,s1
ffffffffc02084b8:	7f9c                	ld	a5,56(a5)
ffffffffc02084ba:	9782                	jalr	a5
ffffffffc02084bc:	842a                	mv	s0,a0
ffffffffc02084be:	b77d                	j	ffffffffc020846c <vfs_getcwd+0x42>
ffffffffc02084c0:	5441                	li	s0,-16
ffffffffc02084c2:	bf45                	j	ffffffffc0208472 <vfs_getcwd+0x48>
ffffffffc02084c4:	00006697          	auipc	a3,0x6
ffffffffc02084c8:	37468693          	addi	a3,a3,884 # ffffffffc020e838 <syscalls+0xcd8>
ffffffffc02084cc:	00003617          	auipc	a2,0x3
ffffffffc02084d0:	4dc60613          	addi	a2,a2,1244 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02084d4:	06e00593          	li	a1,110
ffffffffc02084d8:	00006517          	auipc	a0,0x6
ffffffffc02084dc:	42050513          	addi	a0,a0,1056 # ffffffffc020e8f8 <syscalls+0xd98>
ffffffffc02084e0:	fbff70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02084e4:	00006697          	auipc	a3,0x6
ffffffffc02084e8:	43468693          	addi	a3,a3,1076 # ffffffffc020e918 <syscalls+0xdb8>
ffffffffc02084ec:	00003617          	auipc	a2,0x3
ffffffffc02084f0:	4bc60613          	addi	a2,a2,1212 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02084f4:	07800593          	li	a1,120
ffffffffc02084f8:	00006517          	auipc	a0,0x6
ffffffffc02084fc:	40050513          	addi	a0,a0,1024 # ffffffffc020e8f8 <syscalls+0xd98>
ffffffffc0208500:	f9ff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208504 <dev_lookup>:
ffffffffc0208504:	0005c783          	lbu	a5,0(a1)
ffffffffc0208508:	e385                	bnez	a5,ffffffffc0208528 <dev_lookup+0x24>
ffffffffc020850a:	1101                	addi	sp,sp,-32
ffffffffc020850c:	e822                	sd	s0,16(sp)
ffffffffc020850e:	e426                	sd	s1,8(sp)
ffffffffc0208510:	ec06                	sd	ra,24(sp)
ffffffffc0208512:	84aa                	mv	s1,a0
ffffffffc0208514:	8432                	mv	s0,a2
ffffffffc0208516:	b56ff0ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc020851a:	60e2                	ld	ra,24(sp)
ffffffffc020851c:	e004                	sd	s1,0(s0)
ffffffffc020851e:	6442                	ld	s0,16(sp)
ffffffffc0208520:	64a2                	ld	s1,8(sp)
ffffffffc0208522:	4501                	li	a0,0
ffffffffc0208524:	6105                	addi	sp,sp,32
ffffffffc0208526:	8082                	ret
ffffffffc0208528:	5541                	li	a0,-16
ffffffffc020852a:	8082                	ret

ffffffffc020852c <dev_fstat>:
ffffffffc020852c:	1101                	addi	sp,sp,-32
ffffffffc020852e:	e426                	sd	s1,8(sp)
ffffffffc0208530:	84ae                	mv	s1,a1
ffffffffc0208532:	e822                	sd	s0,16(sp)
ffffffffc0208534:	02000613          	li	a2,32
ffffffffc0208538:	842a                	mv	s0,a0
ffffffffc020853a:	4581                	li	a1,0
ffffffffc020853c:	8526                	mv	a0,s1
ffffffffc020853e:	ec06                	sd	ra,24(sp)
ffffffffc0208540:	785020ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0208544:	c429                	beqz	s0,ffffffffc020858e <dev_fstat+0x62>
ffffffffc0208546:	783c                	ld	a5,112(s0)
ffffffffc0208548:	c3b9                	beqz	a5,ffffffffc020858e <dev_fstat+0x62>
ffffffffc020854a:	6bbc                	ld	a5,80(a5)
ffffffffc020854c:	c3a9                	beqz	a5,ffffffffc020858e <dev_fstat+0x62>
ffffffffc020854e:	00006597          	auipc	a1,0x6
ffffffffc0208552:	3c258593          	addi	a1,a1,962 # ffffffffc020e910 <syscalls+0xdb0>
ffffffffc0208556:	8522                	mv	a0,s0
ffffffffc0208558:	b2cff0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc020855c:	783c                	ld	a5,112(s0)
ffffffffc020855e:	85a6                	mv	a1,s1
ffffffffc0208560:	8522                	mv	a0,s0
ffffffffc0208562:	6bbc                	ld	a5,80(a5)
ffffffffc0208564:	9782                	jalr	a5
ffffffffc0208566:	ed19                	bnez	a0,ffffffffc0208584 <dev_fstat+0x58>
ffffffffc0208568:	4c38                	lw	a4,88(s0)
ffffffffc020856a:	6785                	lui	a5,0x1
ffffffffc020856c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208570:	02f71f63          	bne	a4,a5,ffffffffc02085ae <dev_fstat+0x82>
ffffffffc0208574:	6018                	ld	a4,0(s0)
ffffffffc0208576:	641c                	ld	a5,8(s0)
ffffffffc0208578:	4685                	li	a3,1
ffffffffc020857a:	e494                	sd	a3,8(s1)
ffffffffc020857c:	02e787b3          	mul	a5,a5,a4
ffffffffc0208580:	e898                	sd	a4,16(s1)
ffffffffc0208582:	ec9c                	sd	a5,24(s1)
ffffffffc0208584:	60e2                	ld	ra,24(sp)
ffffffffc0208586:	6442                	ld	s0,16(sp)
ffffffffc0208588:	64a2                	ld	s1,8(sp)
ffffffffc020858a:	6105                	addi	sp,sp,32
ffffffffc020858c:	8082                	ret
ffffffffc020858e:	00006697          	auipc	a3,0x6
ffffffffc0208592:	31a68693          	addi	a3,a3,794 # ffffffffc020e8a8 <syscalls+0xd48>
ffffffffc0208596:	00003617          	auipc	a2,0x3
ffffffffc020859a:	41260613          	addi	a2,a2,1042 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020859e:	04200593          	li	a1,66
ffffffffc02085a2:	00006517          	auipc	a0,0x6
ffffffffc02085a6:	3de50513          	addi	a0,a0,990 # ffffffffc020e980 <syscalls+0xe20>
ffffffffc02085aa:	ef5f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02085ae:	00006697          	auipc	a3,0x6
ffffffffc02085b2:	0c268693          	addi	a3,a3,194 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc02085b6:	00003617          	auipc	a2,0x3
ffffffffc02085ba:	3f260613          	addi	a2,a2,1010 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02085be:	04500593          	li	a1,69
ffffffffc02085c2:	00006517          	auipc	a0,0x6
ffffffffc02085c6:	3be50513          	addi	a0,a0,958 # ffffffffc020e980 <syscalls+0xe20>
ffffffffc02085ca:	ed5f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02085ce <dev_ioctl>:
ffffffffc02085ce:	c909                	beqz	a0,ffffffffc02085e0 <dev_ioctl+0x12>
ffffffffc02085d0:	4d34                	lw	a3,88(a0)
ffffffffc02085d2:	6705                	lui	a4,0x1
ffffffffc02085d4:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02085d8:	00e69463          	bne	a3,a4,ffffffffc02085e0 <dev_ioctl+0x12>
ffffffffc02085dc:	751c                	ld	a5,40(a0)
ffffffffc02085de:	8782                	jr	a5
ffffffffc02085e0:	1141                	addi	sp,sp,-16
ffffffffc02085e2:	00006697          	auipc	a3,0x6
ffffffffc02085e6:	08e68693          	addi	a3,a3,142 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc02085ea:	00003617          	auipc	a2,0x3
ffffffffc02085ee:	3be60613          	addi	a2,a2,958 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02085f2:	03500593          	li	a1,53
ffffffffc02085f6:	00006517          	auipc	a0,0x6
ffffffffc02085fa:	38a50513          	addi	a0,a0,906 # ffffffffc020e980 <syscalls+0xe20>
ffffffffc02085fe:	e406                	sd	ra,8(sp)
ffffffffc0208600:	e9ff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208604 <dev_tryseek>:
ffffffffc0208604:	c51d                	beqz	a0,ffffffffc0208632 <dev_tryseek+0x2e>
ffffffffc0208606:	4d38                	lw	a4,88(a0)
ffffffffc0208608:	6785                	lui	a5,0x1
ffffffffc020860a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020860e:	02f71263          	bne	a4,a5,ffffffffc0208632 <dev_tryseek+0x2e>
ffffffffc0208612:	611c                	ld	a5,0(a0)
ffffffffc0208614:	cf89                	beqz	a5,ffffffffc020862e <dev_tryseek+0x2a>
ffffffffc0208616:	6518                	ld	a4,8(a0)
ffffffffc0208618:	02e5f6b3          	remu	a3,a1,a4
ffffffffc020861c:	ea89                	bnez	a3,ffffffffc020862e <dev_tryseek+0x2a>
ffffffffc020861e:	0005c863          	bltz	a1,ffffffffc020862e <dev_tryseek+0x2a>
ffffffffc0208622:	02e787b3          	mul	a5,a5,a4
ffffffffc0208626:	00f5f463          	bgeu	a1,a5,ffffffffc020862e <dev_tryseek+0x2a>
ffffffffc020862a:	4501                	li	a0,0
ffffffffc020862c:	8082                	ret
ffffffffc020862e:	5575                	li	a0,-3
ffffffffc0208630:	8082                	ret
ffffffffc0208632:	1141                	addi	sp,sp,-16
ffffffffc0208634:	00006697          	auipc	a3,0x6
ffffffffc0208638:	03c68693          	addi	a3,a3,60 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc020863c:	00003617          	auipc	a2,0x3
ffffffffc0208640:	36c60613          	addi	a2,a2,876 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208644:	05f00593          	li	a1,95
ffffffffc0208648:	00006517          	auipc	a0,0x6
ffffffffc020864c:	33850513          	addi	a0,a0,824 # ffffffffc020e980 <syscalls+0xe20>
ffffffffc0208650:	e406                	sd	ra,8(sp)
ffffffffc0208652:	e4df70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208656 <dev_gettype>:
ffffffffc0208656:	c10d                	beqz	a0,ffffffffc0208678 <dev_gettype+0x22>
ffffffffc0208658:	4d38                	lw	a4,88(a0)
ffffffffc020865a:	6785                	lui	a5,0x1
ffffffffc020865c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208660:	00f71c63          	bne	a4,a5,ffffffffc0208678 <dev_gettype+0x22>
ffffffffc0208664:	6118                	ld	a4,0(a0)
ffffffffc0208666:	6795                	lui	a5,0x5
ffffffffc0208668:	c701                	beqz	a4,ffffffffc0208670 <dev_gettype+0x1a>
ffffffffc020866a:	c19c                	sw	a5,0(a1)
ffffffffc020866c:	4501                	li	a0,0
ffffffffc020866e:	8082                	ret
ffffffffc0208670:	6791                	lui	a5,0x4
ffffffffc0208672:	c19c                	sw	a5,0(a1)
ffffffffc0208674:	4501                	li	a0,0
ffffffffc0208676:	8082                	ret
ffffffffc0208678:	1141                	addi	sp,sp,-16
ffffffffc020867a:	00006697          	auipc	a3,0x6
ffffffffc020867e:	ff668693          	addi	a3,a3,-10 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc0208682:	00003617          	auipc	a2,0x3
ffffffffc0208686:	32660613          	addi	a2,a2,806 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020868a:	05300593          	li	a1,83
ffffffffc020868e:	00006517          	auipc	a0,0x6
ffffffffc0208692:	2f250513          	addi	a0,a0,754 # ffffffffc020e980 <syscalls+0xe20>
ffffffffc0208696:	e406                	sd	ra,8(sp)
ffffffffc0208698:	e07f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020869c <dev_write>:
ffffffffc020869c:	c911                	beqz	a0,ffffffffc02086b0 <dev_write+0x14>
ffffffffc020869e:	4d34                	lw	a3,88(a0)
ffffffffc02086a0:	6705                	lui	a4,0x1
ffffffffc02086a2:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02086a6:	00e69563          	bne	a3,a4,ffffffffc02086b0 <dev_write+0x14>
ffffffffc02086aa:	711c                	ld	a5,32(a0)
ffffffffc02086ac:	4605                	li	a2,1
ffffffffc02086ae:	8782                	jr	a5
ffffffffc02086b0:	1141                	addi	sp,sp,-16
ffffffffc02086b2:	00006697          	auipc	a3,0x6
ffffffffc02086b6:	fbe68693          	addi	a3,a3,-66 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc02086ba:	00003617          	auipc	a2,0x3
ffffffffc02086be:	2ee60613          	addi	a2,a2,750 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02086c2:	02c00593          	li	a1,44
ffffffffc02086c6:	00006517          	auipc	a0,0x6
ffffffffc02086ca:	2ba50513          	addi	a0,a0,698 # ffffffffc020e980 <syscalls+0xe20>
ffffffffc02086ce:	e406                	sd	ra,8(sp)
ffffffffc02086d0:	dcff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02086d4 <dev_read>:
ffffffffc02086d4:	c911                	beqz	a0,ffffffffc02086e8 <dev_read+0x14>
ffffffffc02086d6:	4d34                	lw	a3,88(a0)
ffffffffc02086d8:	6705                	lui	a4,0x1
ffffffffc02086da:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02086de:	00e69563          	bne	a3,a4,ffffffffc02086e8 <dev_read+0x14>
ffffffffc02086e2:	711c                	ld	a5,32(a0)
ffffffffc02086e4:	4601                	li	a2,0
ffffffffc02086e6:	8782                	jr	a5
ffffffffc02086e8:	1141                	addi	sp,sp,-16
ffffffffc02086ea:	00006697          	auipc	a3,0x6
ffffffffc02086ee:	f8668693          	addi	a3,a3,-122 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc02086f2:	00003617          	auipc	a2,0x3
ffffffffc02086f6:	2b660613          	addi	a2,a2,694 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02086fa:	02300593          	li	a1,35
ffffffffc02086fe:	00006517          	auipc	a0,0x6
ffffffffc0208702:	28250513          	addi	a0,a0,642 # ffffffffc020e980 <syscalls+0xe20>
ffffffffc0208706:	e406                	sd	ra,8(sp)
ffffffffc0208708:	d97f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020870c <dev_close>:
ffffffffc020870c:	c909                	beqz	a0,ffffffffc020871e <dev_close+0x12>
ffffffffc020870e:	4d34                	lw	a3,88(a0)
ffffffffc0208710:	6705                	lui	a4,0x1
ffffffffc0208712:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208716:	00e69463          	bne	a3,a4,ffffffffc020871e <dev_close+0x12>
ffffffffc020871a:	6d1c                	ld	a5,24(a0)
ffffffffc020871c:	8782                	jr	a5
ffffffffc020871e:	1141                	addi	sp,sp,-16
ffffffffc0208720:	00006697          	auipc	a3,0x6
ffffffffc0208724:	f5068693          	addi	a3,a3,-176 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc0208728:	00003617          	auipc	a2,0x3
ffffffffc020872c:	28060613          	addi	a2,a2,640 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208730:	45e9                	li	a1,26
ffffffffc0208732:	00006517          	auipc	a0,0x6
ffffffffc0208736:	24e50513          	addi	a0,a0,590 # ffffffffc020e980 <syscalls+0xe20>
ffffffffc020873a:	e406                	sd	ra,8(sp)
ffffffffc020873c:	d63f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208740 <dev_open>:
ffffffffc0208740:	03c5f713          	andi	a4,a1,60
ffffffffc0208744:	eb11                	bnez	a4,ffffffffc0208758 <dev_open+0x18>
ffffffffc0208746:	c919                	beqz	a0,ffffffffc020875c <dev_open+0x1c>
ffffffffc0208748:	4d34                	lw	a3,88(a0)
ffffffffc020874a:	6705                	lui	a4,0x1
ffffffffc020874c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208750:	00e69663          	bne	a3,a4,ffffffffc020875c <dev_open+0x1c>
ffffffffc0208754:	691c                	ld	a5,16(a0)
ffffffffc0208756:	8782                	jr	a5
ffffffffc0208758:	5575                	li	a0,-3
ffffffffc020875a:	8082                	ret
ffffffffc020875c:	1141                	addi	sp,sp,-16
ffffffffc020875e:	00006697          	auipc	a3,0x6
ffffffffc0208762:	f1268693          	addi	a3,a3,-238 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc0208766:	00003617          	auipc	a2,0x3
ffffffffc020876a:	24260613          	addi	a2,a2,578 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020876e:	45c5                	li	a1,17
ffffffffc0208770:	00006517          	auipc	a0,0x6
ffffffffc0208774:	21050513          	addi	a0,a0,528 # ffffffffc020e980 <syscalls+0xe20>
ffffffffc0208778:	e406                	sd	ra,8(sp)
ffffffffc020877a:	d25f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020877e <dev_init>:
ffffffffc020877e:	1141                	addi	sp,sp,-16
ffffffffc0208780:	e406                	sd	ra,8(sp)
ffffffffc0208782:	542000ef          	jal	ra,ffffffffc0208cc4 <dev_init_stdin>
ffffffffc0208786:	65a000ef          	jal	ra,ffffffffc0208de0 <dev_init_stdout>
ffffffffc020878a:	60a2                	ld	ra,8(sp)
ffffffffc020878c:	0141                	addi	sp,sp,16
ffffffffc020878e:	a439                	j	ffffffffc020899c <dev_init_disk0>

ffffffffc0208790 <dev_create_inode>:
ffffffffc0208790:	6505                	lui	a0,0x1
ffffffffc0208792:	1141                	addi	sp,sp,-16
ffffffffc0208794:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208798:	e022                	sd	s0,0(sp)
ffffffffc020879a:	e406                	sd	ra,8(sp)
ffffffffc020879c:	852ff0ef          	jal	ra,ffffffffc02077ee <__alloc_inode>
ffffffffc02087a0:	842a                	mv	s0,a0
ffffffffc02087a2:	c901                	beqz	a0,ffffffffc02087b2 <dev_create_inode+0x22>
ffffffffc02087a4:	4601                	li	a2,0
ffffffffc02087a6:	00006597          	auipc	a1,0x6
ffffffffc02087aa:	1f258593          	addi	a1,a1,498 # ffffffffc020e998 <dev_node_ops>
ffffffffc02087ae:	85cff0ef          	jal	ra,ffffffffc020780a <inode_init>
ffffffffc02087b2:	60a2                	ld	ra,8(sp)
ffffffffc02087b4:	8522                	mv	a0,s0
ffffffffc02087b6:	6402                	ld	s0,0(sp)
ffffffffc02087b8:	0141                	addi	sp,sp,16
ffffffffc02087ba:	8082                	ret

ffffffffc02087bc <disk0_open>:
ffffffffc02087bc:	4501                	li	a0,0
ffffffffc02087be:	8082                	ret

ffffffffc02087c0 <disk0_close>:
ffffffffc02087c0:	4501                	li	a0,0
ffffffffc02087c2:	8082                	ret

ffffffffc02087c4 <disk0_ioctl>:
ffffffffc02087c4:	5531                	li	a0,-20
ffffffffc02087c6:	8082                	ret

ffffffffc02087c8 <disk0_io>:
ffffffffc02087c8:	659c                	ld	a5,8(a1)
ffffffffc02087ca:	7159                	addi	sp,sp,-112
ffffffffc02087cc:	eca6                	sd	s1,88(sp)
ffffffffc02087ce:	f45e                	sd	s7,40(sp)
ffffffffc02087d0:	6d84                	ld	s1,24(a1)
ffffffffc02087d2:	6b85                	lui	s7,0x1
ffffffffc02087d4:	1bfd                	addi	s7,s7,-1
ffffffffc02087d6:	e4ce                	sd	s3,72(sp)
ffffffffc02087d8:	43f7d993          	srai	s3,a5,0x3f
ffffffffc02087dc:	0179f9b3          	and	s3,s3,s7
ffffffffc02087e0:	99be                	add	s3,s3,a5
ffffffffc02087e2:	8fc5                	or	a5,a5,s1
ffffffffc02087e4:	f486                	sd	ra,104(sp)
ffffffffc02087e6:	f0a2                	sd	s0,96(sp)
ffffffffc02087e8:	e8ca                	sd	s2,80(sp)
ffffffffc02087ea:	e0d2                	sd	s4,64(sp)
ffffffffc02087ec:	fc56                	sd	s5,56(sp)
ffffffffc02087ee:	f85a                	sd	s6,48(sp)
ffffffffc02087f0:	f062                	sd	s8,32(sp)
ffffffffc02087f2:	ec66                	sd	s9,24(sp)
ffffffffc02087f4:	e86a                	sd	s10,16(sp)
ffffffffc02087f6:	0177f7b3          	and	a5,a5,s7
ffffffffc02087fa:	10079d63          	bnez	a5,ffffffffc0208914 <disk0_io+0x14c>
ffffffffc02087fe:	40c9d993          	srai	s3,s3,0xc
ffffffffc0208802:	00c4d713          	srli	a4,s1,0xc
ffffffffc0208806:	2981                	sext.w	s3,s3
ffffffffc0208808:	2701                	sext.w	a4,a4
ffffffffc020880a:	00e987bb          	addw	a5,s3,a4
ffffffffc020880e:	6114                	ld	a3,0(a0)
ffffffffc0208810:	1782                	slli	a5,a5,0x20
ffffffffc0208812:	9381                	srli	a5,a5,0x20
ffffffffc0208814:	10f6e063          	bltu	a3,a5,ffffffffc0208914 <disk0_io+0x14c>
ffffffffc0208818:	4501                	li	a0,0
ffffffffc020881a:	ef19                	bnez	a4,ffffffffc0208838 <disk0_io+0x70>
ffffffffc020881c:	70a6                	ld	ra,104(sp)
ffffffffc020881e:	7406                	ld	s0,96(sp)
ffffffffc0208820:	64e6                	ld	s1,88(sp)
ffffffffc0208822:	6946                	ld	s2,80(sp)
ffffffffc0208824:	69a6                	ld	s3,72(sp)
ffffffffc0208826:	6a06                	ld	s4,64(sp)
ffffffffc0208828:	7ae2                	ld	s5,56(sp)
ffffffffc020882a:	7b42                	ld	s6,48(sp)
ffffffffc020882c:	7ba2                	ld	s7,40(sp)
ffffffffc020882e:	7c02                	ld	s8,32(sp)
ffffffffc0208830:	6ce2                	ld	s9,24(sp)
ffffffffc0208832:	6d42                	ld	s10,16(sp)
ffffffffc0208834:	6165                	addi	sp,sp,112
ffffffffc0208836:	8082                	ret
ffffffffc0208838:	0008d517          	auipc	a0,0x8d
ffffffffc020883c:	00850513          	addi	a0,a0,8 # ffffffffc0295840 <disk0_sem>
ffffffffc0208840:	8b2e                	mv	s6,a1
ffffffffc0208842:	8c32                	mv	s8,a2
ffffffffc0208844:	0008ea97          	auipc	s5,0x8e
ffffffffc0208848:	0b4a8a93          	addi	s5,s5,180 # ffffffffc02968f8 <disk0_buffer>
ffffffffc020884c:	d19fb0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0208850:	6c91                	lui	s9,0x4
ffffffffc0208852:	e4b9                	bnez	s1,ffffffffc02088a0 <disk0_io+0xd8>
ffffffffc0208854:	a845                	j	ffffffffc0208904 <disk0_io+0x13c>
ffffffffc0208856:	00c4d413          	srli	s0,s1,0xc
ffffffffc020885a:	0034169b          	slliw	a3,s0,0x3
ffffffffc020885e:	00068d1b          	sext.w	s10,a3
ffffffffc0208862:	1682                	slli	a3,a3,0x20
ffffffffc0208864:	2401                	sext.w	s0,s0
ffffffffc0208866:	9281                	srli	a3,a3,0x20
ffffffffc0208868:	8926                	mv	s2,s1
ffffffffc020886a:	00399a1b          	slliw	s4,s3,0x3
ffffffffc020886e:	862e                	mv	a2,a1
ffffffffc0208870:	4509                	li	a0,2
ffffffffc0208872:	85d2                	mv	a1,s4
ffffffffc0208874:	accf80ef          	jal	ra,ffffffffc0200b40 <ide_read_secs>
ffffffffc0208878:	e165                	bnez	a0,ffffffffc0208958 <disk0_io+0x190>
ffffffffc020887a:	000ab583          	ld	a1,0(s5)
ffffffffc020887e:	0038                	addi	a4,sp,8
ffffffffc0208880:	4685                	li	a3,1
ffffffffc0208882:	864a                	mv	a2,s2
ffffffffc0208884:	855a                	mv	a0,s6
ffffffffc0208886:	b67fc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc020888a:	67a2                	ld	a5,8(sp)
ffffffffc020888c:	09279663          	bne	a5,s2,ffffffffc0208918 <disk0_io+0x150>
ffffffffc0208890:	017977b3          	and	a5,s2,s7
ffffffffc0208894:	e3d1                	bnez	a5,ffffffffc0208918 <disk0_io+0x150>
ffffffffc0208896:	412484b3          	sub	s1,s1,s2
ffffffffc020889a:	013409bb          	addw	s3,s0,s3
ffffffffc020889e:	c0bd                	beqz	s1,ffffffffc0208904 <disk0_io+0x13c>
ffffffffc02088a0:	000ab583          	ld	a1,0(s5)
ffffffffc02088a4:	000c1b63          	bnez	s8,ffffffffc02088ba <disk0_io+0xf2>
ffffffffc02088a8:	fb94e7e3          	bltu	s1,s9,ffffffffc0208856 <disk0_io+0x8e>
ffffffffc02088ac:	02000693          	li	a3,32
ffffffffc02088b0:	02000d13          	li	s10,32
ffffffffc02088b4:	4411                	li	s0,4
ffffffffc02088b6:	6911                	lui	s2,0x4
ffffffffc02088b8:	bf4d                	j	ffffffffc020886a <disk0_io+0xa2>
ffffffffc02088ba:	0038                	addi	a4,sp,8
ffffffffc02088bc:	4681                	li	a3,0
ffffffffc02088be:	6611                	lui	a2,0x4
ffffffffc02088c0:	855a                	mv	a0,s6
ffffffffc02088c2:	b2bfc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc02088c6:	6422                	ld	s0,8(sp)
ffffffffc02088c8:	c825                	beqz	s0,ffffffffc0208938 <disk0_io+0x170>
ffffffffc02088ca:	0684e763          	bltu	s1,s0,ffffffffc0208938 <disk0_io+0x170>
ffffffffc02088ce:	017477b3          	and	a5,s0,s7
ffffffffc02088d2:	e3bd                	bnez	a5,ffffffffc0208938 <disk0_io+0x170>
ffffffffc02088d4:	8031                	srli	s0,s0,0xc
ffffffffc02088d6:	0034179b          	slliw	a5,s0,0x3
ffffffffc02088da:	000ab603          	ld	a2,0(s5)
ffffffffc02088de:	0039991b          	slliw	s2,s3,0x3
ffffffffc02088e2:	02079693          	slli	a3,a5,0x20
ffffffffc02088e6:	9281                	srli	a3,a3,0x20
ffffffffc02088e8:	85ca                	mv	a1,s2
ffffffffc02088ea:	4509                	li	a0,2
ffffffffc02088ec:	2401                	sext.w	s0,s0
ffffffffc02088ee:	00078a1b          	sext.w	s4,a5
ffffffffc02088f2:	ae4f80ef          	jal	ra,ffffffffc0200bd6 <ide_write_secs>
ffffffffc02088f6:	e151                	bnez	a0,ffffffffc020897a <disk0_io+0x1b2>
ffffffffc02088f8:	6922                	ld	s2,8(sp)
ffffffffc02088fa:	013409bb          	addw	s3,s0,s3
ffffffffc02088fe:	412484b3          	sub	s1,s1,s2
ffffffffc0208902:	fcd9                	bnez	s1,ffffffffc02088a0 <disk0_io+0xd8>
ffffffffc0208904:	0008d517          	auipc	a0,0x8d
ffffffffc0208908:	f3c50513          	addi	a0,a0,-196 # ffffffffc0295840 <disk0_sem>
ffffffffc020890c:	c55fb0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0208910:	4501                	li	a0,0
ffffffffc0208912:	b729                	j	ffffffffc020881c <disk0_io+0x54>
ffffffffc0208914:	5575                	li	a0,-3
ffffffffc0208916:	b719                	j	ffffffffc020881c <disk0_io+0x54>
ffffffffc0208918:	00006697          	auipc	a3,0x6
ffffffffc020891c:	1f868693          	addi	a3,a3,504 # ffffffffc020eb10 <dev_node_ops+0x178>
ffffffffc0208920:	00003617          	auipc	a2,0x3
ffffffffc0208924:	08860613          	addi	a2,a2,136 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208928:	06200593          	li	a1,98
ffffffffc020892c:	00006517          	auipc	a0,0x6
ffffffffc0208930:	12c50513          	addi	a0,a0,300 # ffffffffc020ea58 <dev_node_ops+0xc0>
ffffffffc0208934:	b6bf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208938:	00006697          	auipc	a3,0x6
ffffffffc020893c:	0e068693          	addi	a3,a3,224 # ffffffffc020ea18 <dev_node_ops+0x80>
ffffffffc0208940:	00003617          	auipc	a2,0x3
ffffffffc0208944:	06860613          	addi	a2,a2,104 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208948:	05700593          	li	a1,87
ffffffffc020894c:	00006517          	auipc	a0,0x6
ffffffffc0208950:	10c50513          	addi	a0,a0,268 # ffffffffc020ea58 <dev_node_ops+0xc0>
ffffffffc0208954:	b4bf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208958:	88aa                	mv	a7,a0
ffffffffc020895a:	886a                	mv	a6,s10
ffffffffc020895c:	87a2                	mv	a5,s0
ffffffffc020895e:	8752                	mv	a4,s4
ffffffffc0208960:	86ce                	mv	a3,s3
ffffffffc0208962:	00006617          	auipc	a2,0x6
ffffffffc0208966:	16660613          	addi	a2,a2,358 # ffffffffc020eac8 <dev_node_ops+0x130>
ffffffffc020896a:	02d00593          	li	a1,45
ffffffffc020896e:	00006517          	auipc	a0,0x6
ffffffffc0208972:	0ea50513          	addi	a0,a0,234 # ffffffffc020ea58 <dev_node_ops+0xc0>
ffffffffc0208976:	b29f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020897a:	88aa                	mv	a7,a0
ffffffffc020897c:	8852                	mv	a6,s4
ffffffffc020897e:	87a2                	mv	a5,s0
ffffffffc0208980:	874a                	mv	a4,s2
ffffffffc0208982:	86ce                	mv	a3,s3
ffffffffc0208984:	00006617          	auipc	a2,0x6
ffffffffc0208988:	0f460613          	addi	a2,a2,244 # ffffffffc020ea78 <dev_node_ops+0xe0>
ffffffffc020898c:	03700593          	li	a1,55
ffffffffc0208990:	00006517          	auipc	a0,0x6
ffffffffc0208994:	0c850513          	addi	a0,a0,200 # ffffffffc020ea58 <dev_node_ops+0xc0>
ffffffffc0208998:	b07f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020899c <dev_init_disk0>:
ffffffffc020899c:	1101                	addi	sp,sp,-32
ffffffffc020899e:	ec06                	sd	ra,24(sp)
ffffffffc02089a0:	e822                	sd	s0,16(sp)
ffffffffc02089a2:	e426                	sd	s1,8(sp)
ffffffffc02089a4:	dedff0ef          	jal	ra,ffffffffc0208790 <dev_create_inode>
ffffffffc02089a8:	c541                	beqz	a0,ffffffffc0208a30 <dev_init_disk0+0x94>
ffffffffc02089aa:	4d38                	lw	a4,88(a0)
ffffffffc02089ac:	6485                	lui	s1,0x1
ffffffffc02089ae:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02089b2:	842a                	mv	s0,a0
ffffffffc02089b4:	0cf71f63          	bne	a4,a5,ffffffffc0208a92 <dev_init_disk0+0xf6>
ffffffffc02089b8:	4509                	li	a0,2
ffffffffc02089ba:	93af80ef          	jal	ra,ffffffffc0200af4 <ide_device_valid>
ffffffffc02089be:	cd55                	beqz	a0,ffffffffc0208a7a <dev_init_disk0+0xde>
ffffffffc02089c0:	4509                	li	a0,2
ffffffffc02089c2:	956f80ef          	jal	ra,ffffffffc0200b18 <ide_device_size>
ffffffffc02089c6:	00355793          	srli	a5,a0,0x3
ffffffffc02089ca:	e01c                	sd	a5,0(s0)
ffffffffc02089cc:	00000797          	auipc	a5,0x0
ffffffffc02089d0:	df078793          	addi	a5,a5,-528 # ffffffffc02087bc <disk0_open>
ffffffffc02089d4:	e81c                	sd	a5,16(s0)
ffffffffc02089d6:	00000797          	auipc	a5,0x0
ffffffffc02089da:	dea78793          	addi	a5,a5,-534 # ffffffffc02087c0 <disk0_close>
ffffffffc02089de:	ec1c                	sd	a5,24(s0)
ffffffffc02089e0:	00000797          	auipc	a5,0x0
ffffffffc02089e4:	de878793          	addi	a5,a5,-536 # ffffffffc02087c8 <disk0_io>
ffffffffc02089e8:	f01c                	sd	a5,32(s0)
ffffffffc02089ea:	00000797          	auipc	a5,0x0
ffffffffc02089ee:	dda78793          	addi	a5,a5,-550 # ffffffffc02087c4 <disk0_ioctl>
ffffffffc02089f2:	f41c                	sd	a5,40(s0)
ffffffffc02089f4:	4585                	li	a1,1
ffffffffc02089f6:	0008d517          	auipc	a0,0x8d
ffffffffc02089fa:	e4a50513          	addi	a0,a0,-438 # ffffffffc0295840 <disk0_sem>
ffffffffc02089fe:	e404                	sd	s1,8(s0)
ffffffffc0208a00:	b5bfb0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0208a04:	6511                	lui	a0,0x4
ffffffffc0208a06:	d88f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208a0a:	0008e797          	auipc	a5,0x8e
ffffffffc0208a0e:	eea7b723          	sd	a0,-274(a5) # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208a12:	c921                	beqz	a0,ffffffffc0208a62 <dev_init_disk0+0xc6>
ffffffffc0208a14:	4605                	li	a2,1
ffffffffc0208a16:	85a2                	mv	a1,s0
ffffffffc0208a18:	00006517          	auipc	a0,0x6
ffffffffc0208a1c:	18850513          	addi	a0,a0,392 # ffffffffc020eba0 <dev_node_ops+0x208>
ffffffffc0208a20:	c2cff0ef          	jal	ra,ffffffffc0207e4c <vfs_add_dev>
ffffffffc0208a24:	e115                	bnez	a0,ffffffffc0208a48 <dev_init_disk0+0xac>
ffffffffc0208a26:	60e2                	ld	ra,24(sp)
ffffffffc0208a28:	6442                	ld	s0,16(sp)
ffffffffc0208a2a:	64a2                	ld	s1,8(sp)
ffffffffc0208a2c:	6105                	addi	sp,sp,32
ffffffffc0208a2e:	8082                	ret
ffffffffc0208a30:	00006617          	auipc	a2,0x6
ffffffffc0208a34:	11060613          	addi	a2,a2,272 # ffffffffc020eb40 <dev_node_ops+0x1a8>
ffffffffc0208a38:	08700593          	li	a1,135
ffffffffc0208a3c:	00006517          	auipc	a0,0x6
ffffffffc0208a40:	01c50513          	addi	a0,a0,28 # ffffffffc020ea58 <dev_node_ops+0xc0>
ffffffffc0208a44:	a5bf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208a48:	86aa                	mv	a3,a0
ffffffffc0208a4a:	00006617          	auipc	a2,0x6
ffffffffc0208a4e:	15e60613          	addi	a2,a2,350 # ffffffffc020eba8 <dev_node_ops+0x210>
ffffffffc0208a52:	08d00593          	li	a1,141
ffffffffc0208a56:	00006517          	auipc	a0,0x6
ffffffffc0208a5a:	00250513          	addi	a0,a0,2 # ffffffffc020ea58 <dev_node_ops+0xc0>
ffffffffc0208a5e:	a41f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208a62:	00006617          	auipc	a2,0x6
ffffffffc0208a66:	11e60613          	addi	a2,a2,286 # ffffffffc020eb80 <dev_node_ops+0x1e8>
ffffffffc0208a6a:	07f00593          	li	a1,127
ffffffffc0208a6e:	00006517          	auipc	a0,0x6
ffffffffc0208a72:	fea50513          	addi	a0,a0,-22 # ffffffffc020ea58 <dev_node_ops+0xc0>
ffffffffc0208a76:	a29f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208a7a:	00006617          	auipc	a2,0x6
ffffffffc0208a7e:	0e660613          	addi	a2,a2,230 # ffffffffc020eb60 <dev_node_ops+0x1c8>
ffffffffc0208a82:	07300593          	li	a1,115
ffffffffc0208a86:	00006517          	auipc	a0,0x6
ffffffffc0208a8a:	fd250513          	addi	a0,a0,-46 # ffffffffc020ea58 <dev_node_ops+0xc0>
ffffffffc0208a8e:	a11f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208a92:	00006697          	auipc	a3,0x6
ffffffffc0208a96:	bde68693          	addi	a3,a3,-1058 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc0208a9a:	00003617          	auipc	a2,0x3
ffffffffc0208a9e:	f0e60613          	addi	a2,a2,-242 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208aa2:	08900593          	li	a1,137
ffffffffc0208aa6:	00006517          	auipc	a0,0x6
ffffffffc0208aaa:	fb250513          	addi	a0,a0,-78 # ffffffffc020ea58 <dev_node_ops+0xc0>
ffffffffc0208aae:	9f1f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208ab2 <stdin_open>:
ffffffffc0208ab2:	4501                	li	a0,0
ffffffffc0208ab4:	e191                	bnez	a1,ffffffffc0208ab8 <stdin_open+0x6>
ffffffffc0208ab6:	8082                	ret
ffffffffc0208ab8:	5575                	li	a0,-3
ffffffffc0208aba:	8082                	ret

ffffffffc0208abc <stdin_close>:
ffffffffc0208abc:	4501                	li	a0,0
ffffffffc0208abe:	8082                	ret

ffffffffc0208ac0 <stdin_ioctl>:
ffffffffc0208ac0:	5575                	li	a0,-3
ffffffffc0208ac2:	8082                	ret

ffffffffc0208ac4 <stdin_io>:
ffffffffc0208ac4:	7135                	addi	sp,sp,-160
ffffffffc0208ac6:	ed06                	sd	ra,152(sp)
ffffffffc0208ac8:	e922                	sd	s0,144(sp)
ffffffffc0208aca:	e526                	sd	s1,136(sp)
ffffffffc0208acc:	e14a                	sd	s2,128(sp)
ffffffffc0208ace:	fcce                	sd	s3,120(sp)
ffffffffc0208ad0:	f8d2                	sd	s4,112(sp)
ffffffffc0208ad2:	f4d6                	sd	s5,104(sp)
ffffffffc0208ad4:	f0da                	sd	s6,96(sp)
ffffffffc0208ad6:	ecde                	sd	s7,88(sp)
ffffffffc0208ad8:	e8e2                	sd	s8,80(sp)
ffffffffc0208ada:	e4e6                	sd	s9,72(sp)
ffffffffc0208adc:	e0ea                	sd	s10,64(sp)
ffffffffc0208ade:	fc6e                	sd	s11,56(sp)
ffffffffc0208ae0:	14061163          	bnez	a2,ffffffffc0208c22 <stdin_io+0x15e>
ffffffffc0208ae4:	0005bd83          	ld	s11,0(a1)
ffffffffc0208ae8:	0185bd03          	ld	s10,24(a1)
ffffffffc0208aec:	8b2e                	mv	s6,a1
ffffffffc0208aee:	100027f3          	csrr	a5,sstatus
ffffffffc0208af2:	8b89                	andi	a5,a5,2
ffffffffc0208af4:	10079e63          	bnez	a5,ffffffffc0208c10 <stdin_io+0x14c>
ffffffffc0208af8:	4401                	li	s0,0
ffffffffc0208afa:	100d0963          	beqz	s10,ffffffffc0208c0c <stdin_io+0x148>
ffffffffc0208afe:	0008e997          	auipc	s3,0x8e
ffffffffc0208b02:	e0298993          	addi	s3,s3,-510 # ffffffffc0296900 <p_rpos>
ffffffffc0208b06:	0009b783          	ld	a5,0(s3)
ffffffffc0208b0a:	800004b7          	lui	s1,0x80000
ffffffffc0208b0e:	6c85                	lui	s9,0x1
ffffffffc0208b10:	4a81                	li	s5,0
ffffffffc0208b12:	0008ea17          	auipc	s4,0x8e
ffffffffc0208b16:	df6a0a13          	addi	s4,s4,-522 # ffffffffc0296908 <p_wpos>
ffffffffc0208b1a:	0491                	addi	s1,s1,4
ffffffffc0208b1c:	0008d917          	auipc	s2,0x8d
ffffffffc0208b20:	d3c90913          	addi	s2,s2,-708 # ffffffffc0295858 <__wait_queue>
ffffffffc0208b24:	1cfd                	addi	s9,s9,-1
ffffffffc0208b26:	000a3703          	ld	a4,0(s4)
ffffffffc0208b2a:	000a8c1b          	sext.w	s8,s5
ffffffffc0208b2e:	8be2                	mv	s7,s8
ffffffffc0208b30:	02e7d763          	bge	a5,a4,ffffffffc0208b5e <stdin_io+0x9a>
ffffffffc0208b34:	a859                	j	ffffffffc0208bca <stdin_io+0x106>
ffffffffc0208b36:	815fe0ef          	jal	ra,ffffffffc020734a <schedule>
ffffffffc0208b3a:	100027f3          	csrr	a5,sstatus
ffffffffc0208b3e:	8b89                	andi	a5,a5,2
ffffffffc0208b40:	4401                	li	s0,0
ffffffffc0208b42:	ef8d                	bnez	a5,ffffffffc0208b7c <stdin_io+0xb8>
ffffffffc0208b44:	0028                	addi	a0,sp,8
ffffffffc0208b46:	ab1fb0ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc0208b4a:	e121                	bnez	a0,ffffffffc0208b8a <stdin_io+0xc6>
ffffffffc0208b4c:	47c2                	lw	a5,16(sp)
ffffffffc0208b4e:	04979563          	bne	a5,s1,ffffffffc0208b98 <stdin_io+0xd4>
ffffffffc0208b52:	0009b783          	ld	a5,0(s3)
ffffffffc0208b56:	000a3703          	ld	a4,0(s4)
ffffffffc0208b5a:	06e7c863          	blt	a5,a4,ffffffffc0208bca <stdin_io+0x106>
ffffffffc0208b5e:	8626                	mv	a2,s1
ffffffffc0208b60:	002c                	addi	a1,sp,8
ffffffffc0208b62:	854a                	mv	a0,s2
ffffffffc0208b64:	bbdfb0ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc0208b68:	d479                	beqz	s0,ffffffffc0208b36 <stdin_io+0x72>
ffffffffc0208b6a:	902f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208b6e:	fdcfe0ef          	jal	ra,ffffffffc020734a <schedule>
ffffffffc0208b72:	100027f3          	csrr	a5,sstatus
ffffffffc0208b76:	8b89                	andi	a5,a5,2
ffffffffc0208b78:	4401                	li	s0,0
ffffffffc0208b7a:	d7e9                	beqz	a5,ffffffffc0208b44 <stdin_io+0x80>
ffffffffc0208b7c:	8f6f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208b80:	0028                	addi	a0,sp,8
ffffffffc0208b82:	4405                	li	s0,1
ffffffffc0208b84:	a73fb0ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc0208b88:	d171                	beqz	a0,ffffffffc0208b4c <stdin_io+0x88>
ffffffffc0208b8a:	002c                	addi	a1,sp,8
ffffffffc0208b8c:	854a                	mv	a0,s2
ffffffffc0208b8e:	a0ffb0ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc0208b92:	47c2                	lw	a5,16(sp)
ffffffffc0208b94:	fa978fe3          	beq	a5,s1,ffffffffc0208b52 <stdin_io+0x8e>
ffffffffc0208b98:	e435                	bnez	s0,ffffffffc0208c04 <stdin_io+0x140>
ffffffffc0208b9a:	060b8963          	beqz	s7,ffffffffc0208c0c <stdin_io+0x148>
ffffffffc0208b9e:	018b3783          	ld	a5,24(s6)
ffffffffc0208ba2:	41578ab3          	sub	s5,a5,s5
ffffffffc0208ba6:	015b3c23          	sd	s5,24(s6)
ffffffffc0208baa:	60ea                	ld	ra,152(sp)
ffffffffc0208bac:	644a                	ld	s0,144(sp)
ffffffffc0208bae:	64aa                	ld	s1,136(sp)
ffffffffc0208bb0:	690a                	ld	s2,128(sp)
ffffffffc0208bb2:	79e6                	ld	s3,120(sp)
ffffffffc0208bb4:	7a46                	ld	s4,112(sp)
ffffffffc0208bb6:	7aa6                	ld	s5,104(sp)
ffffffffc0208bb8:	7b06                	ld	s6,96(sp)
ffffffffc0208bba:	6c46                	ld	s8,80(sp)
ffffffffc0208bbc:	6ca6                	ld	s9,72(sp)
ffffffffc0208bbe:	6d06                	ld	s10,64(sp)
ffffffffc0208bc0:	7de2                	ld	s11,56(sp)
ffffffffc0208bc2:	855e                	mv	a0,s7
ffffffffc0208bc4:	6be6                	ld	s7,88(sp)
ffffffffc0208bc6:	610d                	addi	sp,sp,160
ffffffffc0208bc8:	8082                	ret
ffffffffc0208bca:	43f7d713          	srai	a4,a5,0x3f
ffffffffc0208bce:	03475693          	srli	a3,a4,0x34
ffffffffc0208bd2:	00d78733          	add	a4,a5,a3
ffffffffc0208bd6:	01977733          	and	a4,a4,s9
ffffffffc0208bda:	8f15                	sub	a4,a4,a3
ffffffffc0208bdc:	0008d697          	auipc	a3,0x8d
ffffffffc0208be0:	c8c68693          	addi	a3,a3,-884 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208be4:	9736                	add	a4,a4,a3
ffffffffc0208be6:	00074683          	lbu	a3,0(a4)
ffffffffc0208bea:	0785                	addi	a5,a5,1
ffffffffc0208bec:	015d8733          	add	a4,s11,s5
ffffffffc0208bf0:	00d70023          	sb	a3,0(a4)
ffffffffc0208bf4:	00f9b023          	sd	a5,0(s3)
ffffffffc0208bf8:	0a85                	addi	s5,s5,1
ffffffffc0208bfa:	001c0b9b          	addiw	s7,s8,1
ffffffffc0208bfe:	f3aae4e3          	bltu	s5,s10,ffffffffc0208b26 <stdin_io+0x62>
ffffffffc0208c02:	dc51                	beqz	s0,ffffffffc0208b9e <stdin_io+0xda>
ffffffffc0208c04:	868f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208c08:	f80b9be3          	bnez	s7,ffffffffc0208b9e <stdin_io+0xda>
ffffffffc0208c0c:	4b81                	li	s7,0
ffffffffc0208c0e:	bf71                	j	ffffffffc0208baa <stdin_io+0xe6>
ffffffffc0208c10:	862f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208c14:	4405                	li	s0,1
ffffffffc0208c16:	ee0d14e3          	bnez	s10,ffffffffc0208afe <stdin_io+0x3a>
ffffffffc0208c1a:	852f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208c1e:	4b81                	li	s7,0
ffffffffc0208c20:	b769                	j	ffffffffc0208baa <stdin_io+0xe6>
ffffffffc0208c22:	5bf5                	li	s7,-3
ffffffffc0208c24:	b759                	j	ffffffffc0208baa <stdin_io+0xe6>

ffffffffc0208c26 <dev_stdin_write>:
ffffffffc0208c26:	e111                	bnez	a0,ffffffffc0208c2a <dev_stdin_write+0x4>
ffffffffc0208c28:	8082                	ret
ffffffffc0208c2a:	1101                	addi	sp,sp,-32
ffffffffc0208c2c:	e822                	sd	s0,16(sp)
ffffffffc0208c2e:	ec06                	sd	ra,24(sp)
ffffffffc0208c30:	e426                	sd	s1,8(sp)
ffffffffc0208c32:	842a                	mv	s0,a0
ffffffffc0208c34:	100027f3          	csrr	a5,sstatus
ffffffffc0208c38:	8b89                	andi	a5,a5,2
ffffffffc0208c3a:	4481                	li	s1,0
ffffffffc0208c3c:	e3c1                	bnez	a5,ffffffffc0208cbc <dev_stdin_write+0x96>
ffffffffc0208c3e:	0008e597          	auipc	a1,0x8e
ffffffffc0208c42:	cca58593          	addi	a1,a1,-822 # ffffffffc0296908 <p_wpos>
ffffffffc0208c46:	6198                	ld	a4,0(a1)
ffffffffc0208c48:	6605                	lui	a2,0x1
ffffffffc0208c4a:	fff60513          	addi	a0,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208c4e:	43f75693          	srai	a3,a4,0x3f
ffffffffc0208c52:	92d1                	srli	a3,a3,0x34
ffffffffc0208c54:	00d707b3          	add	a5,a4,a3
ffffffffc0208c58:	8fe9                	and	a5,a5,a0
ffffffffc0208c5a:	8f95                	sub	a5,a5,a3
ffffffffc0208c5c:	0008d697          	auipc	a3,0x8d
ffffffffc0208c60:	c0c68693          	addi	a3,a3,-1012 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208c64:	97b6                	add	a5,a5,a3
ffffffffc0208c66:	00878023          	sb	s0,0(a5)
ffffffffc0208c6a:	0008e797          	auipc	a5,0x8e
ffffffffc0208c6e:	c967b783          	ld	a5,-874(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208c72:	40f707b3          	sub	a5,a4,a5
ffffffffc0208c76:	00c7d463          	bge	a5,a2,ffffffffc0208c7e <dev_stdin_write+0x58>
ffffffffc0208c7a:	0705                	addi	a4,a4,1
ffffffffc0208c7c:	e198                	sd	a4,0(a1)
ffffffffc0208c7e:	0008d517          	auipc	a0,0x8d
ffffffffc0208c82:	bda50513          	addi	a0,a0,-1062 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c86:	965fb0ef          	jal	ra,ffffffffc02045ea <wait_queue_empty>
ffffffffc0208c8a:	cd09                	beqz	a0,ffffffffc0208ca4 <dev_stdin_write+0x7e>
ffffffffc0208c8c:	e491                	bnez	s1,ffffffffc0208c98 <dev_stdin_write+0x72>
ffffffffc0208c8e:	60e2                	ld	ra,24(sp)
ffffffffc0208c90:	6442                	ld	s0,16(sp)
ffffffffc0208c92:	64a2                	ld	s1,8(sp)
ffffffffc0208c94:	6105                	addi	sp,sp,32
ffffffffc0208c96:	8082                	ret
ffffffffc0208c98:	6442                	ld	s0,16(sp)
ffffffffc0208c9a:	60e2                	ld	ra,24(sp)
ffffffffc0208c9c:	64a2                	ld	s1,8(sp)
ffffffffc0208c9e:	6105                	addi	sp,sp,32
ffffffffc0208ca0:	fcdf706f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0208ca4:	800005b7          	lui	a1,0x80000
ffffffffc0208ca8:	4605                	li	a2,1
ffffffffc0208caa:	0591                	addi	a1,a1,4
ffffffffc0208cac:	0008d517          	auipc	a0,0x8d
ffffffffc0208cb0:	bac50513          	addi	a0,a0,-1108 # ffffffffc0295858 <__wait_queue>
ffffffffc0208cb4:	99ffb0ef          	jal	ra,ffffffffc0204652 <wakeup_queue>
ffffffffc0208cb8:	d8f9                	beqz	s1,ffffffffc0208c8e <dev_stdin_write+0x68>
ffffffffc0208cba:	bff9                	j	ffffffffc0208c98 <dev_stdin_write+0x72>
ffffffffc0208cbc:	fb7f70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208cc0:	4485                	li	s1,1
ffffffffc0208cc2:	bfb5                	j	ffffffffc0208c3e <dev_stdin_write+0x18>

ffffffffc0208cc4 <dev_init_stdin>:
ffffffffc0208cc4:	1141                	addi	sp,sp,-16
ffffffffc0208cc6:	e406                	sd	ra,8(sp)
ffffffffc0208cc8:	e022                	sd	s0,0(sp)
ffffffffc0208cca:	ac7ff0ef          	jal	ra,ffffffffc0208790 <dev_create_inode>
ffffffffc0208cce:	c93d                	beqz	a0,ffffffffc0208d44 <dev_init_stdin+0x80>
ffffffffc0208cd0:	4d38                	lw	a4,88(a0)
ffffffffc0208cd2:	6785                	lui	a5,0x1
ffffffffc0208cd4:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208cd8:	842a                	mv	s0,a0
ffffffffc0208cda:	08f71e63          	bne	a4,a5,ffffffffc0208d76 <dev_init_stdin+0xb2>
ffffffffc0208cde:	4785                	li	a5,1
ffffffffc0208ce0:	e41c                	sd	a5,8(s0)
ffffffffc0208ce2:	00000797          	auipc	a5,0x0
ffffffffc0208ce6:	dd078793          	addi	a5,a5,-560 # ffffffffc0208ab2 <stdin_open>
ffffffffc0208cea:	e81c                	sd	a5,16(s0)
ffffffffc0208cec:	00000797          	auipc	a5,0x0
ffffffffc0208cf0:	dd078793          	addi	a5,a5,-560 # ffffffffc0208abc <stdin_close>
ffffffffc0208cf4:	ec1c                	sd	a5,24(s0)
ffffffffc0208cf6:	00000797          	auipc	a5,0x0
ffffffffc0208cfa:	dce78793          	addi	a5,a5,-562 # ffffffffc0208ac4 <stdin_io>
ffffffffc0208cfe:	f01c                	sd	a5,32(s0)
ffffffffc0208d00:	00000797          	auipc	a5,0x0
ffffffffc0208d04:	dc078793          	addi	a5,a5,-576 # ffffffffc0208ac0 <stdin_ioctl>
ffffffffc0208d08:	f41c                	sd	a5,40(s0)
ffffffffc0208d0a:	0008d517          	auipc	a0,0x8d
ffffffffc0208d0e:	b4e50513          	addi	a0,a0,-1202 # ffffffffc0295858 <__wait_queue>
ffffffffc0208d12:	00043023          	sd	zero,0(s0)
ffffffffc0208d16:	0008e797          	auipc	a5,0x8e
ffffffffc0208d1a:	be07b923          	sd	zero,-1038(a5) # ffffffffc0296908 <p_wpos>
ffffffffc0208d1e:	0008e797          	auipc	a5,0x8e
ffffffffc0208d22:	be07b123          	sd	zero,-1054(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208d26:	871fb0ef          	jal	ra,ffffffffc0204596 <wait_queue_init>
ffffffffc0208d2a:	4601                	li	a2,0
ffffffffc0208d2c:	85a2                	mv	a1,s0
ffffffffc0208d2e:	00006517          	auipc	a0,0x6
ffffffffc0208d32:	eda50513          	addi	a0,a0,-294 # ffffffffc020ec08 <dev_node_ops+0x270>
ffffffffc0208d36:	916ff0ef          	jal	ra,ffffffffc0207e4c <vfs_add_dev>
ffffffffc0208d3a:	e10d                	bnez	a0,ffffffffc0208d5c <dev_init_stdin+0x98>
ffffffffc0208d3c:	60a2                	ld	ra,8(sp)
ffffffffc0208d3e:	6402                	ld	s0,0(sp)
ffffffffc0208d40:	0141                	addi	sp,sp,16
ffffffffc0208d42:	8082                	ret
ffffffffc0208d44:	00006617          	auipc	a2,0x6
ffffffffc0208d48:	e8460613          	addi	a2,a2,-380 # ffffffffc020ebc8 <dev_node_ops+0x230>
ffffffffc0208d4c:	07500593          	li	a1,117
ffffffffc0208d50:	00006517          	auipc	a0,0x6
ffffffffc0208d54:	e9850513          	addi	a0,a0,-360 # ffffffffc020ebe8 <dev_node_ops+0x250>
ffffffffc0208d58:	f46f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208d5c:	86aa                	mv	a3,a0
ffffffffc0208d5e:	00006617          	auipc	a2,0x6
ffffffffc0208d62:	eb260613          	addi	a2,a2,-334 # ffffffffc020ec10 <dev_node_ops+0x278>
ffffffffc0208d66:	07b00593          	li	a1,123
ffffffffc0208d6a:	00006517          	auipc	a0,0x6
ffffffffc0208d6e:	e7e50513          	addi	a0,a0,-386 # ffffffffc020ebe8 <dev_node_ops+0x250>
ffffffffc0208d72:	f2cf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208d76:	00006697          	auipc	a3,0x6
ffffffffc0208d7a:	8fa68693          	addi	a3,a3,-1798 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc0208d7e:	00003617          	auipc	a2,0x3
ffffffffc0208d82:	c2a60613          	addi	a2,a2,-982 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208d86:	07700593          	li	a1,119
ffffffffc0208d8a:	00006517          	auipc	a0,0x6
ffffffffc0208d8e:	e5e50513          	addi	a0,a0,-418 # ffffffffc020ebe8 <dev_node_ops+0x250>
ffffffffc0208d92:	f0cf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208d96 <stdout_open>:
ffffffffc0208d96:	4785                	li	a5,1
ffffffffc0208d98:	4501                	li	a0,0
ffffffffc0208d9a:	00f59363          	bne	a1,a5,ffffffffc0208da0 <stdout_open+0xa>
ffffffffc0208d9e:	8082                	ret
ffffffffc0208da0:	5575                	li	a0,-3
ffffffffc0208da2:	8082                	ret

ffffffffc0208da4 <stdout_close>:
ffffffffc0208da4:	4501                	li	a0,0
ffffffffc0208da6:	8082                	ret

ffffffffc0208da8 <stdout_ioctl>:
ffffffffc0208da8:	5575                	li	a0,-3
ffffffffc0208daa:	8082                	ret

ffffffffc0208dac <stdout_io>:
ffffffffc0208dac:	ca05                	beqz	a2,ffffffffc0208ddc <stdout_io+0x30>
ffffffffc0208dae:	6d9c                	ld	a5,24(a1)
ffffffffc0208db0:	1101                	addi	sp,sp,-32
ffffffffc0208db2:	e822                	sd	s0,16(sp)
ffffffffc0208db4:	e426                	sd	s1,8(sp)
ffffffffc0208db6:	ec06                	sd	ra,24(sp)
ffffffffc0208db8:	6180                	ld	s0,0(a1)
ffffffffc0208dba:	84ae                	mv	s1,a1
ffffffffc0208dbc:	cb91                	beqz	a5,ffffffffc0208dd0 <stdout_io+0x24>
ffffffffc0208dbe:	00044503          	lbu	a0,0(s0)
ffffffffc0208dc2:	0405                	addi	s0,s0,1
ffffffffc0208dc4:	c1ef70ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0208dc8:	6c9c                	ld	a5,24(s1)
ffffffffc0208dca:	17fd                	addi	a5,a5,-1
ffffffffc0208dcc:	ec9c                	sd	a5,24(s1)
ffffffffc0208dce:	fbe5                	bnez	a5,ffffffffc0208dbe <stdout_io+0x12>
ffffffffc0208dd0:	60e2                	ld	ra,24(sp)
ffffffffc0208dd2:	6442                	ld	s0,16(sp)
ffffffffc0208dd4:	64a2                	ld	s1,8(sp)
ffffffffc0208dd6:	4501                	li	a0,0
ffffffffc0208dd8:	6105                	addi	sp,sp,32
ffffffffc0208dda:	8082                	ret
ffffffffc0208ddc:	5575                	li	a0,-3
ffffffffc0208dde:	8082                	ret

ffffffffc0208de0 <dev_init_stdout>:
ffffffffc0208de0:	1141                	addi	sp,sp,-16
ffffffffc0208de2:	e406                	sd	ra,8(sp)
ffffffffc0208de4:	9adff0ef          	jal	ra,ffffffffc0208790 <dev_create_inode>
ffffffffc0208de8:	c939                	beqz	a0,ffffffffc0208e3e <dev_init_stdout+0x5e>
ffffffffc0208dea:	4d38                	lw	a4,88(a0)
ffffffffc0208dec:	6785                	lui	a5,0x1
ffffffffc0208dee:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208df2:	85aa                	mv	a1,a0
ffffffffc0208df4:	06f71e63          	bne	a4,a5,ffffffffc0208e70 <dev_init_stdout+0x90>
ffffffffc0208df8:	4785                	li	a5,1
ffffffffc0208dfa:	e51c                	sd	a5,8(a0)
ffffffffc0208dfc:	00000797          	auipc	a5,0x0
ffffffffc0208e00:	f9a78793          	addi	a5,a5,-102 # ffffffffc0208d96 <stdout_open>
ffffffffc0208e04:	e91c                	sd	a5,16(a0)
ffffffffc0208e06:	00000797          	auipc	a5,0x0
ffffffffc0208e0a:	f9e78793          	addi	a5,a5,-98 # ffffffffc0208da4 <stdout_close>
ffffffffc0208e0e:	ed1c                	sd	a5,24(a0)
ffffffffc0208e10:	00000797          	auipc	a5,0x0
ffffffffc0208e14:	f9c78793          	addi	a5,a5,-100 # ffffffffc0208dac <stdout_io>
ffffffffc0208e18:	f11c                	sd	a5,32(a0)
ffffffffc0208e1a:	00000797          	auipc	a5,0x0
ffffffffc0208e1e:	f8e78793          	addi	a5,a5,-114 # ffffffffc0208da8 <stdout_ioctl>
ffffffffc0208e22:	00053023          	sd	zero,0(a0)
ffffffffc0208e26:	f51c                	sd	a5,40(a0)
ffffffffc0208e28:	4601                	li	a2,0
ffffffffc0208e2a:	00006517          	auipc	a0,0x6
ffffffffc0208e2e:	e4650513          	addi	a0,a0,-442 # ffffffffc020ec70 <dev_node_ops+0x2d8>
ffffffffc0208e32:	81aff0ef          	jal	ra,ffffffffc0207e4c <vfs_add_dev>
ffffffffc0208e36:	e105                	bnez	a0,ffffffffc0208e56 <dev_init_stdout+0x76>
ffffffffc0208e38:	60a2                	ld	ra,8(sp)
ffffffffc0208e3a:	0141                	addi	sp,sp,16
ffffffffc0208e3c:	8082                	ret
ffffffffc0208e3e:	00006617          	auipc	a2,0x6
ffffffffc0208e42:	df260613          	addi	a2,a2,-526 # ffffffffc020ec30 <dev_node_ops+0x298>
ffffffffc0208e46:	03700593          	li	a1,55
ffffffffc0208e4a:	00006517          	auipc	a0,0x6
ffffffffc0208e4e:	e0650513          	addi	a0,a0,-506 # ffffffffc020ec50 <dev_node_ops+0x2b8>
ffffffffc0208e52:	e4cf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208e56:	86aa                	mv	a3,a0
ffffffffc0208e58:	00006617          	auipc	a2,0x6
ffffffffc0208e5c:	e2060613          	addi	a2,a2,-480 # ffffffffc020ec78 <dev_node_ops+0x2e0>
ffffffffc0208e60:	03d00593          	li	a1,61
ffffffffc0208e64:	00006517          	auipc	a0,0x6
ffffffffc0208e68:	dec50513          	addi	a0,a0,-532 # ffffffffc020ec50 <dev_node_ops+0x2b8>
ffffffffc0208e6c:	e32f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208e70:	00006697          	auipc	a3,0x6
ffffffffc0208e74:	80068693          	addi	a3,a3,-2048 # ffffffffc020e670 <syscalls+0xb10>
ffffffffc0208e78:	00003617          	auipc	a2,0x3
ffffffffc0208e7c:	b3060613          	addi	a2,a2,-1232 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208e80:	03900593          	li	a1,57
ffffffffc0208e84:	00006517          	auipc	a0,0x6
ffffffffc0208e88:	dcc50513          	addi	a0,a0,-564 # ffffffffc020ec50 <dev_node_ops+0x2b8>
ffffffffc0208e8c:	e12f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208e90 <bitmap_translate.part.0>:
ffffffffc0208e90:	1141                	addi	sp,sp,-16
ffffffffc0208e92:	00006697          	auipc	a3,0x6
ffffffffc0208e96:	e0668693          	addi	a3,a3,-506 # ffffffffc020ec98 <dev_node_ops+0x300>
ffffffffc0208e9a:	00003617          	auipc	a2,0x3
ffffffffc0208e9e:	b0e60613          	addi	a2,a2,-1266 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208ea2:	04c00593          	li	a1,76
ffffffffc0208ea6:	00006517          	auipc	a0,0x6
ffffffffc0208eaa:	e0a50513          	addi	a0,a0,-502 # ffffffffc020ecb0 <dev_node_ops+0x318>
ffffffffc0208eae:	e406                	sd	ra,8(sp)
ffffffffc0208eb0:	deef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208eb4 <bitmap_create>:
ffffffffc0208eb4:	7139                	addi	sp,sp,-64
ffffffffc0208eb6:	fc06                	sd	ra,56(sp)
ffffffffc0208eb8:	f822                	sd	s0,48(sp)
ffffffffc0208eba:	f426                	sd	s1,40(sp)
ffffffffc0208ebc:	f04a                	sd	s2,32(sp)
ffffffffc0208ebe:	ec4e                	sd	s3,24(sp)
ffffffffc0208ec0:	e852                	sd	s4,16(sp)
ffffffffc0208ec2:	e456                	sd	s5,8(sp)
ffffffffc0208ec4:	c14d                	beqz	a0,ffffffffc0208f66 <bitmap_create+0xb2>
ffffffffc0208ec6:	842a                	mv	s0,a0
ffffffffc0208ec8:	4541                	li	a0,16
ffffffffc0208eca:	8c4f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208ece:	84aa                	mv	s1,a0
ffffffffc0208ed0:	cd25                	beqz	a0,ffffffffc0208f48 <bitmap_create+0x94>
ffffffffc0208ed2:	02041a13          	slli	s4,s0,0x20
ffffffffc0208ed6:	020a5a13          	srli	s4,s4,0x20
ffffffffc0208eda:	01fa0793          	addi	a5,s4,31
ffffffffc0208ede:	0057d993          	srli	s3,a5,0x5
ffffffffc0208ee2:	00299a93          	slli	s5,s3,0x2
ffffffffc0208ee6:	8556                	mv	a0,s5
ffffffffc0208ee8:	894e                	mv	s2,s3
ffffffffc0208eea:	8a4f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208eee:	c53d                	beqz	a0,ffffffffc0208f5c <bitmap_create+0xa8>
ffffffffc0208ef0:	0134a223          	sw	s3,4(s1) # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208ef4:	c080                	sw	s0,0(s1)
ffffffffc0208ef6:	8656                	mv	a2,s5
ffffffffc0208ef8:	0ff00593          	li	a1,255
ffffffffc0208efc:	5c8020ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc0208f00:	e488                	sd	a0,8(s1)
ffffffffc0208f02:	0996                	slli	s3,s3,0x5
ffffffffc0208f04:	053a0263          	beq	s4,s3,ffffffffc0208f48 <bitmap_create+0x94>
ffffffffc0208f08:	fff9079b          	addiw	a5,s2,-1
ffffffffc0208f0c:	0057969b          	slliw	a3,a5,0x5
ffffffffc0208f10:	0054561b          	srliw	a2,s0,0x5
ffffffffc0208f14:	40d4073b          	subw	a4,s0,a3
ffffffffc0208f18:	0054541b          	srliw	s0,s0,0x5
ffffffffc0208f1c:	08f61463          	bne	a2,a5,ffffffffc0208fa4 <bitmap_create+0xf0>
ffffffffc0208f20:	fff7069b          	addiw	a3,a4,-1
ffffffffc0208f24:	47f9                	li	a5,30
ffffffffc0208f26:	04d7ef63          	bltu	a5,a3,ffffffffc0208f84 <bitmap_create+0xd0>
ffffffffc0208f2a:	1402                	slli	s0,s0,0x20
ffffffffc0208f2c:	8079                	srli	s0,s0,0x1e
ffffffffc0208f2e:	9522                	add	a0,a0,s0
ffffffffc0208f30:	411c                	lw	a5,0(a0)
ffffffffc0208f32:	4585                	li	a1,1
ffffffffc0208f34:	02000613          	li	a2,32
ffffffffc0208f38:	00e596bb          	sllw	a3,a1,a4
ffffffffc0208f3c:	8fb5                	xor	a5,a5,a3
ffffffffc0208f3e:	2705                	addiw	a4,a4,1
ffffffffc0208f40:	2781                	sext.w	a5,a5
ffffffffc0208f42:	fec71be3          	bne	a4,a2,ffffffffc0208f38 <bitmap_create+0x84>
ffffffffc0208f46:	c11c                	sw	a5,0(a0)
ffffffffc0208f48:	70e2                	ld	ra,56(sp)
ffffffffc0208f4a:	7442                	ld	s0,48(sp)
ffffffffc0208f4c:	7902                	ld	s2,32(sp)
ffffffffc0208f4e:	69e2                	ld	s3,24(sp)
ffffffffc0208f50:	6a42                	ld	s4,16(sp)
ffffffffc0208f52:	6aa2                	ld	s5,8(sp)
ffffffffc0208f54:	8526                	mv	a0,s1
ffffffffc0208f56:	74a2                	ld	s1,40(sp)
ffffffffc0208f58:	6121                	addi	sp,sp,64
ffffffffc0208f5a:	8082                	ret
ffffffffc0208f5c:	8526                	mv	a0,s1
ffffffffc0208f5e:	8e0f90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208f62:	4481                	li	s1,0
ffffffffc0208f64:	b7d5                	j	ffffffffc0208f48 <bitmap_create+0x94>
ffffffffc0208f66:	00006697          	auipc	a3,0x6
ffffffffc0208f6a:	d6268693          	addi	a3,a3,-670 # ffffffffc020ecc8 <dev_node_ops+0x330>
ffffffffc0208f6e:	00003617          	auipc	a2,0x3
ffffffffc0208f72:	a3a60613          	addi	a2,a2,-1478 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208f76:	45d5                	li	a1,21
ffffffffc0208f78:	00006517          	auipc	a0,0x6
ffffffffc0208f7c:	d3850513          	addi	a0,a0,-712 # ffffffffc020ecb0 <dev_node_ops+0x318>
ffffffffc0208f80:	d1ef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208f84:	00006697          	auipc	a3,0x6
ffffffffc0208f88:	d8468693          	addi	a3,a3,-636 # ffffffffc020ed08 <dev_node_ops+0x370>
ffffffffc0208f8c:	00003617          	auipc	a2,0x3
ffffffffc0208f90:	a1c60613          	addi	a2,a2,-1508 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208f94:	02b00593          	li	a1,43
ffffffffc0208f98:	00006517          	auipc	a0,0x6
ffffffffc0208f9c:	d1850513          	addi	a0,a0,-744 # ffffffffc020ecb0 <dev_node_ops+0x318>
ffffffffc0208fa0:	cfef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208fa4:	00006697          	auipc	a3,0x6
ffffffffc0208fa8:	d4c68693          	addi	a3,a3,-692 # ffffffffc020ecf0 <dev_node_ops+0x358>
ffffffffc0208fac:	00003617          	auipc	a2,0x3
ffffffffc0208fb0:	9fc60613          	addi	a2,a2,-1540 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0208fb4:	02a00593          	li	a1,42
ffffffffc0208fb8:	00006517          	auipc	a0,0x6
ffffffffc0208fbc:	cf850513          	addi	a0,a0,-776 # ffffffffc020ecb0 <dev_node_ops+0x318>
ffffffffc0208fc0:	cdef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208fc4 <bitmap_alloc>:
ffffffffc0208fc4:	4150                	lw	a2,4(a0)
ffffffffc0208fc6:	651c                	ld	a5,8(a0)
ffffffffc0208fc8:	c231                	beqz	a2,ffffffffc020900c <bitmap_alloc+0x48>
ffffffffc0208fca:	4701                	li	a4,0
ffffffffc0208fcc:	a029                	j	ffffffffc0208fd6 <bitmap_alloc+0x12>
ffffffffc0208fce:	2705                	addiw	a4,a4,1
ffffffffc0208fd0:	0791                	addi	a5,a5,4
ffffffffc0208fd2:	02e60d63          	beq	a2,a4,ffffffffc020900c <bitmap_alloc+0x48>
ffffffffc0208fd6:	4394                	lw	a3,0(a5)
ffffffffc0208fd8:	dafd                	beqz	a3,ffffffffc0208fce <bitmap_alloc+0xa>
ffffffffc0208fda:	4501                	li	a0,0
ffffffffc0208fdc:	4885                	li	a7,1
ffffffffc0208fde:	8e36                	mv	t3,a3
ffffffffc0208fe0:	02000313          	li	t1,32
ffffffffc0208fe4:	a021                	j	ffffffffc0208fec <bitmap_alloc+0x28>
ffffffffc0208fe6:	2505                	addiw	a0,a0,1
ffffffffc0208fe8:	02650463          	beq	a0,t1,ffffffffc0209010 <bitmap_alloc+0x4c>
ffffffffc0208fec:	00a8983b          	sllw	a6,a7,a0
ffffffffc0208ff0:	0106f633          	and	a2,a3,a6
ffffffffc0208ff4:	2601                	sext.w	a2,a2
ffffffffc0208ff6:	da65                	beqz	a2,ffffffffc0208fe6 <bitmap_alloc+0x22>
ffffffffc0208ff8:	010e4833          	xor	a6,t3,a6
ffffffffc0208ffc:	0057171b          	slliw	a4,a4,0x5
ffffffffc0209000:	9f29                	addw	a4,a4,a0
ffffffffc0209002:	0107a023          	sw	a6,0(a5)
ffffffffc0209006:	c198                	sw	a4,0(a1)
ffffffffc0209008:	4501                	li	a0,0
ffffffffc020900a:	8082                	ret
ffffffffc020900c:	5571                	li	a0,-4
ffffffffc020900e:	8082                	ret
ffffffffc0209010:	1141                	addi	sp,sp,-16
ffffffffc0209012:	00004697          	auipc	a3,0x4
ffffffffc0209016:	a1668693          	addi	a3,a3,-1514 # ffffffffc020ca28 <default_pmm_manager+0x598>
ffffffffc020901a:	00003617          	auipc	a2,0x3
ffffffffc020901e:	98e60613          	addi	a2,a2,-1650 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209022:	04300593          	li	a1,67
ffffffffc0209026:	00006517          	auipc	a0,0x6
ffffffffc020902a:	c8a50513          	addi	a0,a0,-886 # ffffffffc020ecb0 <dev_node_ops+0x318>
ffffffffc020902e:	e406                	sd	ra,8(sp)
ffffffffc0209030:	c6ef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209034 <bitmap_test>:
ffffffffc0209034:	411c                	lw	a5,0(a0)
ffffffffc0209036:	00f5ff63          	bgeu	a1,a5,ffffffffc0209054 <bitmap_test+0x20>
ffffffffc020903a:	651c                	ld	a5,8(a0)
ffffffffc020903c:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0209040:	070a                	slli	a4,a4,0x2
ffffffffc0209042:	97ba                	add	a5,a5,a4
ffffffffc0209044:	4388                	lw	a0,0(a5)
ffffffffc0209046:	4785                	li	a5,1
ffffffffc0209048:	00b795bb          	sllw	a1,a5,a1
ffffffffc020904c:	8d6d                	and	a0,a0,a1
ffffffffc020904e:	1502                	slli	a0,a0,0x20
ffffffffc0209050:	9101                	srli	a0,a0,0x20
ffffffffc0209052:	8082                	ret
ffffffffc0209054:	1141                	addi	sp,sp,-16
ffffffffc0209056:	e406                	sd	ra,8(sp)
ffffffffc0209058:	e39ff0ef          	jal	ra,ffffffffc0208e90 <bitmap_translate.part.0>

ffffffffc020905c <bitmap_free>:
ffffffffc020905c:	411c                	lw	a5,0(a0)
ffffffffc020905e:	1141                	addi	sp,sp,-16
ffffffffc0209060:	e406                	sd	ra,8(sp)
ffffffffc0209062:	02f5f463          	bgeu	a1,a5,ffffffffc020908a <bitmap_free+0x2e>
ffffffffc0209066:	651c                	ld	a5,8(a0)
ffffffffc0209068:	0055d71b          	srliw	a4,a1,0x5
ffffffffc020906c:	070a                	slli	a4,a4,0x2
ffffffffc020906e:	97ba                	add	a5,a5,a4
ffffffffc0209070:	4398                	lw	a4,0(a5)
ffffffffc0209072:	4685                	li	a3,1
ffffffffc0209074:	00b695bb          	sllw	a1,a3,a1
ffffffffc0209078:	00b776b3          	and	a3,a4,a1
ffffffffc020907c:	2681                	sext.w	a3,a3
ffffffffc020907e:	ea81                	bnez	a3,ffffffffc020908e <bitmap_free+0x32>
ffffffffc0209080:	60a2                	ld	ra,8(sp)
ffffffffc0209082:	8f4d                	or	a4,a4,a1
ffffffffc0209084:	c398                	sw	a4,0(a5)
ffffffffc0209086:	0141                	addi	sp,sp,16
ffffffffc0209088:	8082                	ret
ffffffffc020908a:	e07ff0ef          	jal	ra,ffffffffc0208e90 <bitmap_translate.part.0>
ffffffffc020908e:	00006697          	auipc	a3,0x6
ffffffffc0209092:	ca268693          	addi	a3,a3,-862 # ffffffffc020ed30 <dev_node_ops+0x398>
ffffffffc0209096:	00003617          	auipc	a2,0x3
ffffffffc020909a:	91260613          	addi	a2,a2,-1774 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020909e:	05f00593          	li	a1,95
ffffffffc02090a2:	00006517          	auipc	a0,0x6
ffffffffc02090a6:	c0e50513          	addi	a0,a0,-1010 # ffffffffc020ecb0 <dev_node_ops+0x318>
ffffffffc02090aa:	bf4f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02090ae <bitmap_destroy>:
ffffffffc02090ae:	1141                	addi	sp,sp,-16
ffffffffc02090b0:	e022                	sd	s0,0(sp)
ffffffffc02090b2:	842a                	mv	s0,a0
ffffffffc02090b4:	6508                	ld	a0,8(a0)
ffffffffc02090b6:	e406                	sd	ra,8(sp)
ffffffffc02090b8:	f87f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02090bc:	8522                	mv	a0,s0
ffffffffc02090be:	6402                	ld	s0,0(sp)
ffffffffc02090c0:	60a2                	ld	ra,8(sp)
ffffffffc02090c2:	0141                	addi	sp,sp,16
ffffffffc02090c4:	f7bf806f          	j	ffffffffc020203e <kfree>

ffffffffc02090c8 <bitmap_getdata>:
ffffffffc02090c8:	c589                	beqz	a1,ffffffffc02090d2 <bitmap_getdata+0xa>
ffffffffc02090ca:	00456783          	lwu	a5,4(a0)
ffffffffc02090ce:	078a                	slli	a5,a5,0x2
ffffffffc02090d0:	e19c                	sd	a5,0(a1)
ffffffffc02090d2:	6508                	ld	a0,8(a0)
ffffffffc02090d4:	8082                	ret

ffffffffc02090d6 <sfs_init>:
ffffffffc02090d6:	1141                	addi	sp,sp,-16
ffffffffc02090d8:	00006517          	auipc	a0,0x6
ffffffffc02090dc:	ac850513          	addi	a0,a0,-1336 # ffffffffc020eba0 <dev_node_ops+0x208>
ffffffffc02090e0:	e406                	sd	ra,8(sp)
ffffffffc02090e2:	554000ef          	jal	ra,ffffffffc0209636 <sfs_mount>
ffffffffc02090e6:	e501                	bnez	a0,ffffffffc02090ee <sfs_init+0x18>
ffffffffc02090e8:	60a2                	ld	ra,8(sp)
ffffffffc02090ea:	0141                	addi	sp,sp,16
ffffffffc02090ec:	8082                	ret
ffffffffc02090ee:	86aa                	mv	a3,a0
ffffffffc02090f0:	00006617          	auipc	a2,0x6
ffffffffc02090f4:	c5060613          	addi	a2,a2,-944 # ffffffffc020ed40 <dev_node_ops+0x3a8>
ffffffffc02090f8:	45c1                	li	a1,16
ffffffffc02090fa:	00006517          	auipc	a0,0x6
ffffffffc02090fe:	c6650513          	addi	a0,a0,-922 # ffffffffc020ed60 <dev_node_ops+0x3c8>
ffffffffc0209102:	b9cf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209106 <sfs_unmount>:
ffffffffc0209106:	1141                	addi	sp,sp,-16
ffffffffc0209108:	e406                	sd	ra,8(sp)
ffffffffc020910a:	e022                	sd	s0,0(sp)
ffffffffc020910c:	cd1d                	beqz	a0,ffffffffc020914a <sfs_unmount+0x44>
ffffffffc020910e:	0b052783          	lw	a5,176(a0)
ffffffffc0209112:	842a                	mv	s0,a0
ffffffffc0209114:	eb9d                	bnez	a5,ffffffffc020914a <sfs_unmount+0x44>
ffffffffc0209116:	7158                	ld	a4,160(a0)
ffffffffc0209118:	09850793          	addi	a5,a0,152
ffffffffc020911c:	02f71563          	bne	a4,a5,ffffffffc0209146 <sfs_unmount+0x40>
ffffffffc0209120:	613c                	ld	a5,64(a0)
ffffffffc0209122:	e7a1                	bnez	a5,ffffffffc020916a <sfs_unmount+0x64>
ffffffffc0209124:	7d08                	ld	a0,56(a0)
ffffffffc0209126:	f89ff0ef          	jal	ra,ffffffffc02090ae <bitmap_destroy>
ffffffffc020912a:	6428                	ld	a0,72(s0)
ffffffffc020912c:	f13f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209130:	7448                	ld	a0,168(s0)
ffffffffc0209132:	f0df80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209136:	8522                	mv	a0,s0
ffffffffc0209138:	f07f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020913c:	4501                	li	a0,0
ffffffffc020913e:	60a2                	ld	ra,8(sp)
ffffffffc0209140:	6402                	ld	s0,0(sp)
ffffffffc0209142:	0141                	addi	sp,sp,16
ffffffffc0209144:	8082                	ret
ffffffffc0209146:	5545                	li	a0,-15
ffffffffc0209148:	bfdd                	j	ffffffffc020913e <sfs_unmount+0x38>
ffffffffc020914a:	00006697          	auipc	a3,0x6
ffffffffc020914e:	c2e68693          	addi	a3,a3,-978 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc0209152:	00003617          	auipc	a2,0x3
ffffffffc0209156:	85660613          	addi	a2,a2,-1962 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020915a:	04100593          	li	a1,65
ffffffffc020915e:	00006517          	auipc	a0,0x6
ffffffffc0209162:	c4a50513          	addi	a0,a0,-950 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc0209166:	b38f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020916a:	00006697          	auipc	a3,0x6
ffffffffc020916e:	c5668693          	addi	a3,a3,-938 # ffffffffc020edc0 <dev_node_ops+0x428>
ffffffffc0209172:	00003617          	auipc	a2,0x3
ffffffffc0209176:	83660613          	addi	a2,a2,-1994 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020917a:	04500593          	li	a1,69
ffffffffc020917e:	00006517          	auipc	a0,0x6
ffffffffc0209182:	c2a50513          	addi	a0,a0,-982 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc0209186:	b18f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020918a <sfs_cleanup>:
ffffffffc020918a:	1101                	addi	sp,sp,-32
ffffffffc020918c:	ec06                	sd	ra,24(sp)
ffffffffc020918e:	e822                	sd	s0,16(sp)
ffffffffc0209190:	e426                	sd	s1,8(sp)
ffffffffc0209192:	e04a                	sd	s2,0(sp)
ffffffffc0209194:	c525                	beqz	a0,ffffffffc02091fc <sfs_cleanup+0x72>
ffffffffc0209196:	0b052783          	lw	a5,176(a0)
ffffffffc020919a:	84aa                	mv	s1,a0
ffffffffc020919c:	e3a5                	bnez	a5,ffffffffc02091fc <sfs_cleanup+0x72>
ffffffffc020919e:	4158                	lw	a4,4(a0)
ffffffffc02091a0:	4514                	lw	a3,8(a0)
ffffffffc02091a2:	00c50913          	addi	s2,a0,12
ffffffffc02091a6:	85ca                	mv	a1,s2
ffffffffc02091a8:	40d7063b          	subw	a2,a4,a3
ffffffffc02091ac:	00006517          	auipc	a0,0x6
ffffffffc02091b0:	c2c50513          	addi	a0,a0,-980 # ffffffffc020edd8 <dev_node_ops+0x440>
ffffffffc02091b4:	ff3f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02091b8:	02000413          	li	s0,32
ffffffffc02091bc:	a019                	j	ffffffffc02091c2 <sfs_cleanup+0x38>
ffffffffc02091be:	347d                	addiw	s0,s0,-1
ffffffffc02091c0:	c819                	beqz	s0,ffffffffc02091d6 <sfs_cleanup+0x4c>
ffffffffc02091c2:	7cdc                	ld	a5,184(s1)
ffffffffc02091c4:	8526                	mv	a0,s1
ffffffffc02091c6:	9782                	jalr	a5
ffffffffc02091c8:	f97d                	bnez	a0,ffffffffc02091be <sfs_cleanup+0x34>
ffffffffc02091ca:	60e2                	ld	ra,24(sp)
ffffffffc02091cc:	6442                	ld	s0,16(sp)
ffffffffc02091ce:	64a2                	ld	s1,8(sp)
ffffffffc02091d0:	6902                	ld	s2,0(sp)
ffffffffc02091d2:	6105                	addi	sp,sp,32
ffffffffc02091d4:	8082                	ret
ffffffffc02091d6:	6442                	ld	s0,16(sp)
ffffffffc02091d8:	60e2                	ld	ra,24(sp)
ffffffffc02091da:	64a2                	ld	s1,8(sp)
ffffffffc02091dc:	86ca                	mv	a3,s2
ffffffffc02091de:	6902                	ld	s2,0(sp)
ffffffffc02091e0:	872a                	mv	a4,a0
ffffffffc02091e2:	00006617          	auipc	a2,0x6
ffffffffc02091e6:	c1660613          	addi	a2,a2,-1002 # ffffffffc020edf8 <dev_node_ops+0x460>
ffffffffc02091ea:	05f00593          	li	a1,95
ffffffffc02091ee:	00006517          	auipc	a0,0x6
ffffffffc02091f2:	bba50513          	addi	a0,a0,-1094 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc02091f6:	6105                	addi	sp,sp,32
ffffffffc02091f8:	b0ef706f          	j	ffffffffc0200506 <__warn>
ffffffffc02091fc:	00006697          	auipc	a3,0x6
ffffffffc0209200:	b7c68693          	addi	a3,a3,-1156 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc0209204:	00002617          	auipc	a2,0x2
ffffffffc0209208:	7a460613          	addi	a2,a2,1956 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020920c:	05400593          	li	a1,84
ffffffffc0209210:	00006517          	auipc	a0,0x6
ffffffffc0209214:	b9850513          	addi	a0,a0,-1128 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc0209218:	a86f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020921c <sfs_sync>:
ffffffffc020921c:	7179                	addi	sp,sp,-48
ffffffffc020921e:	f406                	sd	ra,40(sp)
ffffffffc0209220:	f022                	sd	s0,32(sp)
ffffffffc0209222:	ec26                	sd	s1,24(sp)
ffffffffc0209224:	e84a                	sd	s2,16(sp)
ffffffffc0209226:	e44e                	sd	s3,8(sp)
ffffffffc0209228:	e052                	sd	s4,0(sp)
ffffffffc020922a:	cd4d                	beqz	a0,ffffffffc02092e4 <sfs_sync+0xc8>
ffffffffc020922c:	0b052783          	lw	a5,176(a0)
ffffffffc0209230:	8a2a                	mv	s4,a0
ffffffffc0209232:	ebcd                	bnez	a5,ffffffffc02092e4 <sfs_sync+0xc8>
ffffffffc0209234:	53d010ef          	jal	ra,ffffffffc020af70 <lock_sfs_fs>
ffffffffc0209238:	0a0a3403          	ld	s0,160(s4)
ffffffffc020923c:	098a0913          	addi	s2,s4,152
ffffffffc0209240:	02890763          	beq	s2,s0,ffffffffc020926e <sfs_sync+0x52>
ffffffffc0209244:	00004997          	auipc	s3,0x4
ffffffffc0209248:	0ec98993          	addi	s3,s3,236 # ffffffffc020d330 <default_pmm_manager+0xea0>
ffffffffc020924c:	7c1c                	ld	a5,56(s0)
ffffffffc020924e:	fc840493          	addi	s1,s0,-56
ffffffffc0209252:	cbb5                	beqz	a5,ffffffffc02092c6 <sfs_sync+0xaa>
ffffffffc0209254:	7b9c                	ld	a5,48(a5)
ffffffffc0209256:	cba5                	beqz	a5,ffffffffc02092c6 <sfs_sync+0xaa>
ffffffffc0209258:	85ce                	mv	a1,s3
ffffffffc020925a:	8526                	mv	a0,s1
ffffffffc020925c:	e28fe0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0209260:	7c1c                	ld	a5,56(s0)
ffffffffc0209262:	8526                	mv	a0,s1
ffffffffc0209264:	7b9c                	ld	a5,48(a5)
ffffffffc0209266:	9782                	jalr	a5
ffffffffc0209268:	6400                	ld	s0,8(s0)
ffffffffc020926a:	fe8911e3          	bne	s2,s0,ffffffffc020924c <sfs_sync+0x30>
ffffffffc020926e:	8552                	mv	a0,s4
ffffffffc0209270:	511010ef          	jal	ra,ffffffffc020af80 <unlock_sfs_fs>
ffffffffc0209274:	040a3783          	ld	a5,64(s4)
ffffffffc0209278:	4501                	li	a0,0
ffffffffc020927a:	eb89                	bnez	a5,ffffffffc020928c <sfs_sync+0x70>
ffffffffc020927c:	70a2                	ld	ra,40(sp)
ffffffffc020927e:	7402                	ld	s0,32(sp)
ffffffffc0209280:	64e2                	ld	s1,24(sp)
ffffffffc0209282:	6942                	ld	s2,16(sp)
ffffffffc0209284:	69a2                	ld	s3,8(sp)
ffffffffc0209286:	6a02                	ld	s4,0(sp)
ffffffffc0209288:	6145                	addi	sp,sp,48
ffffffffc020928a:	8082                	ret
ffffffffc020928c:	040a3023          	sd	zero,64(s4)
ffffffffc0209290:	8552                	mv	a0,s4
ffffffffc0209292:	3c3010ef          	jal	ra,ffffffffc020ae54 <sfs_sync_super>
ffffffffc0209296:	cd01                	beqz	a0,ffffffffc02092ae <sfs_sync+0x92>
ffffffffc0209298:	70a2                	ld	ra,40(sp)
ffffffffc020929a:	7402                	ld	s0,32(sp)
ffffffffc020929c:	4785                	li	a5,1
ffffffffc020929e:	04fa3023          	sd	a5,64(s4)
ffffffffc02092a2:	64e2                	ld	s1,24(sp)
ffffffffc02092a4:	6942                	ld	s2,16(sp)
ffffffffc02092a6:	69a2                	ld	s3,8(sp)
ffffffffc02092a8:	6a02                	ld	s4,0(sp)
ffffffffc02092aa:	6145                	addi	sp,sp,48
ffffffffc02092ac:	8082                	ret
ffffffffc02092ae:	8552                	mv	a0,s4
ffffffffc02092b0:	3eb010ef          	jal	ra,ffffffffc020ae9a <sfs_sync_freemap>
ffffffffc02092b4:	f175                	bnez	a0,ffffffffc0209298 <sfs_sync+0x7c>
ffffffffc02092b6:	70a2                	ld	ra,40(sp)
ffffffffc02092b8:	7402                	ld	s0,32(sp)
ffffffffc02092ba:	64e2                	ld	s1,24(sp)
ffffffffc02092bc:	6942                	ld	s2,16(sp)
ffffffffc02092be:	69a2                	ld	s3,8(sp)
ffffffffc02092c0:	6a02                	ld	s4,0(sp)
ffffffffc02092c2:	6145                	addi	sp,sp,48
ffffffffc02092c4:	8082                	ret
ffffffffc02092c6:	00004697          	auipc	a3,0x4
ffffffffc02092ca:	01a68693          	addi	a3,a3,26 # ffffffffc020d2e0 <default_pmm_manager+0xe50>
ffffffffc02092ce:	00002617          	auipc	a2,0x2
ffffffffc02092d2:	6da60613          	addi	a2,a2,1754 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02092d6:	45ed                	li	a1,27
ffffffffc02092d8:	00006517          	auipc	a0,0x6
ffffffffc02092dc:	ad050513          	addi	a0,a0,-1328 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc02092e0:	9bef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02092e4:	00006697          	auipc	a3,0x6
ffffffffc02092e8:	a9468693          	addi	a3,a3,-1388 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc02092ec:	00002617          	auipc	a2,0x2
ffffffffc02092f0:	6bc60613          	addi	a2,a2,1724 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02092f4:	45d5                	li	a1,21
ffffffffc02092f6:	00006517          	auipc	a0,0x6
ffffffffc02092fa:	ab250513          	addi	a0,a0,-1358 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc02092fe:	9a0f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209302 <sfs_get_root>:
ffffffffc0209302:	1101                	addi	sp,sp,-32
ffffffffc0209304:	ec06                	sd	ra,24(sp)
ffffffffc0209306:	cd09                	beqz	a0,ffffffffc0209320 <sfs_get_root+0x1e>
ffffffffc0209308:	0b052783          	lw	a5,176(a0)
ffffffffc020930c:	eb91                	bnez	a5,ffffffffc0209320 <sfs_get_root+0x1e>
ffffffffc020930e:	4605                	li	a2,1
ffffffffc0209310:	002c                	addi	a1,sp,8
ffffffffc0209312:	374010ef          	jal	ra,ffffffffc020a686 <sfs_load_inode>
ffffffffc0209316:	e50d                	bnez	a0,ffffffffc0209340 <sfs_get_root+0x3e>
ffffffffc0209318:	60e2                	ld	ra,24(sp)
ffffffffc020931a:	6522                	ld	a0,8(sp)
ffffffffc020931c:	6105                	addi	sp,sp,32
ffffffffc020931e:	8082                	ret
ffffffffc0209320:	00006697          	auipc	a3,0x6
ffffffffc0209324:	a5868693          	addi	a3,a3,-1448 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc0209328:	00002617          	auipc	a2,0x2
ffffffffc020932c:	68060613          	addi	a2,a2,1664 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209330:	03600593          	li	a1,54
ffffffffc0209334:	00006517          	auipc	a0,0x6
ffffffffc0209338:	a7450513          	addi	a0,a0,-1420 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc020933c:	962f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209340:	86aa                	mv	a3,a0
ffffffffc0209342:	00006617          	auipc	a2,0x6
ffffffffc0209346:	ad660613          	addi	a2,a2,-1322 # ffffffffc020ee18 <dev_node_ops+0x480>
ffffffffc020934a:	03700593          	li	a1,55
ffffffffc020934e:	00006517          	auipc	a0,0x6
ffffffffc0209352:	a5a50513          	addi	a0,a0,-1446 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc0209356:	948f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020935a <sfs_do_mount>:
ffffffffc020935a:	6518                	ld	a4,8(a0)
ffffffffc020935c:	7171                	addi	sp,sp,-176
ffffffffc020935e:	f506                	sd	ra,168(sp)
ffffffffc0209360:	f122                	sd	s0,160(sp)
ffffffffc0209362:	ed26                	sd	s1,152(sp)
ffffffffc0209364:	e94a                	sd	s2,144(sp)
ffffffffc0209366:	e54e                	sd	s3,136(sp)
ffffffffc0209368:	e152                	sd	s4,128(sp)
ffffffffc020936a:	fcd6                	sd	s5,120(sp)
ffffffffc020936c:	f8da                	sd	s6,112(sp)
ffffffffc020936e:	f4de                	sd	s7,104(sp)
ffffffffc0209370:	f0e2                	sd	s8,96(sp)
ffffffffc0209372:	ece6                	sd	s9,88(sp)
ffffffffc0209374:	e8ea                	sd	s10,80(sp)
ffffffffc0209376:	e4ee                	sd	s11,72(sp)
ffffffffc0209378:	6785                	lui	a5,0x1
ffffffffc020937a:	24f71663          	bne	a4,a5,ffffffffc02095c6 <sfs_do_mount+0x26c>
ffffffffc020937e:	892a                	mv	s2,a0
ffffffffc0209380:	4501                	li	a0,0
ffffffffc0209382:	8aae                	mv	s5,a1
ffffffffc0209384:	f00fe0ef          	jal	ra,ffffffffc0207a84 <__alloc_fs>
ffffffffc0209388:	842a                	mv	s0,a0
ffffffffc020938a:	24050463          	beqz	a0,ffffffffc02095d2 <sfs_do_mount+0x278>
ffffffffc020938e:	0b052b03          	lw	s6,176(a0)
ffffffffc0209392:	260b1263          	bnez	s6,ffffffffc02095f6 <sfs_do_mount+0x29c>
ffffffffc0209396:	03253823          	sd	s2,48(a0)
ffffffffc020939a:	6505                	lui	a0,0x1
ffffffffc020939c:	bf3f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02093a0:	e428                	sd	a0,72(s0)
ffffffffc02093a2:	84aa                	mv	s1,a0
ffffffffc02093a4:	16050363          	beqz	a0,ffffffffc020950a <sfs_do_mount+0x1b0>
ffffffffc02093a8:	85aa                	mv	a1,a0
ffffffffc02093aa:	4681                	li	a3,0
ffffffffc02093ac:	6605                	lui	a2,0x1
ffffffffc02093ae:	1008                	addi	a0,sp,32
ffffffffc02093b0:	832fc0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02093b4:	02093783          	ld	a5,32(s2)
ffffffffc02093b8:	85aa                	mv	a1,a0
ffffffffc02093ba:	4601                	li	a2,0
ffffffffc02093bc:	854a                	mv	a0,s2
ffffffffc02093be:	9782                	jalr	a5
ffffffffc02093c0:	8a2a                	mv	s4,a0
ffffffffc02093c2:	10051e63          	bnez	a0,ffffffffc02094de <sfs_do_mount+0x184>
ffffffffc02093c6:	408c                	lw	a1,0(s1)
ffffffffc02093c8:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc02093cc:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc02093d0:	14c59863          	bne	a1,a2,ffffffffc0209520 <sfs_do_mount+0x1c6>
ffffffffc02093d4:	40dc                	lw	a5,4(s1)
ffffffffc02093d6:	00093603          	ld	a2,0(s2)
ffffffffc02093da:	02079713          	slli	a4,a5,0x20
ffffffffc02093de:	9301                	srli	a4,a4,0x20
ffffffffc02093e0:	12e66763          	bltu	a2,a4,ffffffffc020950e <sfs_do_mount+0x1b4>
ffffffffc02093e4:	020485a3          	sb	zero,43(s1)
ffffffffc02093e8:	0084af03          	lw	t5,8(s1)
ffffffffc02093ec:	00c4ae83          	lw	t4,12(s1)
ffffffffc02093f0:	0104ae03          	lw	t3,16(s1)
ffffffffc02093f4:	0144a303          	lw	t1,20(s1)
ffffffffc02093f8:	0184a883          	lw	a7,24(s1)
ffffffffc02093fc:	01c4a803          	lw	a6,28(s1)
ffffffffc0209400:	5090                	lw	a2,32(s1)
ffffffffc0209402:	50d4                	lw	a3,36(s1)
ffffffffc0209404:	5498                	lw	a4,40(s1)
ffffffffc0209406:	6511                	lui	a0,0x4
ffffffffc0209408:	c00c                	sw	a1,0(s0)
ffffffffc020940a:	c05c                	sw	a5,4(s0)
ffffffffc020940c:	01e42423          	sw	t5,8(s0)
ffffffffc0209410:	01d42623          	sw	t4,12(s0)
ffffffffc0209414:	01c42823          	sw	t3,16(s0)
ffffffffc0209418:	00642a23          	sw	t1,20(s0)
ffffffffc020941c:	01142c23          	sw	a7,24(s0)
ffffffffc0209420:	01042e23          	sw	a6,28(s0)
ffffffffc0209424:	d010                	sw	a2,32(s0)
ffffffffc0209426:	d054                	sw	a3,36(s0)
ffffffffc0209428:	d418                	sw	a4,40(s0)
ffffffffc020942a:	b65f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020942e:	f448                	sd	a0,168(s0)
ffffffffc0209430:	8c2a                	mv	s8,a0
ffffffffc0209432:	18050c63          	beqz	a0,ffffffffc02095ca <sfs_do_mount+0x270>
ffffffffc0209436:	6711                	lui	a4,0x4
ffffffffc0209438:	87aa                	mv	a5,a0
ffffffffc020943a:	972a                	add	a4,a4,a0
ffffffffc020943c:	e79c                	sd	a5,8(a5)
ffffffffc020943e:	e39c                	sd	a5,0(a5)
ffffffffc0209440:	07c1                	addi	a5,a5,16
ffffffffc0209442:	fee79de3          	bne	a5,a4,ffffffffc020943c <sfs_do_mount+0xe2>
ffffffffc0209446:	0044eb83          	lwu	s7,4(s1)
ffffffffc020944a:	67a1                	lui	a5,0x8
ffffffffc020944c:	fff78993          	addi	s3,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc0209450:	9bce                	add	s7,s7,s3
ffffffffc0209452:	77e1                	lui	a5,0xffff8
ffffffffc0209454:	00fbfbb3          	and	s7,s7,a5
ffffffffc0209458:	2b81                	sext.w	s7,s7
ffffffffc020945a:	855e                	mv	a0,s7
ffffffffc020945c:	a59ff0ef          	jal	ra,ffffffffc0208eb4 <bitmap_create>
ffffffffc0209460:	fc08                	sd	a0,56(s0)
ffffffffc0209462:	8d2a                	mv	s10,a0
ffffffffc0209464:	14050f63          	beqz	a0,ffffffffc02095c2 <sfs_do_mount+0x268>
ffffffffc0209468:	0044e783          	lwu	a5,4(s1)
ffffffffc020946c:	082c                	addi	a1,sp,24
ffffffffc020946e:	97ce                	add	a5,a5,s3
ffffffffc0209470:	00f7d713          	srli	a4,a5,0xf
ffffffffc0209474:	e43a                	sd	a4,8(sp)
ffffffffc0209476:	40f7d993          	srai	s3,a5,0xf
ffffffffc020947a:	c4fff0ef          	jal	ra,ffffffffc02090c8 <bitmap_getdata>
ffffffffc020947e:	14050c63          	beqz	a0,ffffffffc02095d6 <sfs_do_mount+0x27c>
ffffffffc0209482:	00c9979b          	slliw	a5,s3,0xc
ffffffffc0209486:	66e2                	ld	a3,24(sp)
ffffffffc0209488:	1782                	slli	a5,a5,0x20
ffffffffc020948a:	9381                	srli	a5,a5,0x20
ffffffffc020948c:	14d79563          	bne	a5,a3,ffffffffc02095d6 <sfs_do_mount+0x27c>
ffffffffc0209490:	6722                	ld	a4,8(sp)
ffffffffc0209492:	6d89                	lui	s11,0x2
ffffffffc0209494:	89aa                	mv	s3,a0
ffffffffc0209496:	00c71c93          	slli	s9,a4,0xc
ffffffffc020949a:	9caa                	add	s9,s9,a0
ffffffffc020949c:	40ad8dbb          	subw	s11,s11,a0
ffffffffc02094a0:	e711                	bnez	a4,ffffffffc02094ac <sfs_do_mount+0x152>
ffffffffc02094a2:	a079                	j	ffffffffc0209530 <sfs_do_mount+0x1d6>
ffffffffc02094a4:	6785                	lui	a5,0x1
ffffffffc02094a6:	99be                	add	s3,s3,a5
ffffffffc02094a8:	093c8463          	beq	s9,s3,ffffffffc0209530 <sfs_do_mount+0x1d6>
ffffffffc02094ac:	013d86bb          	addw	a3,s11,s3
ffffffffc02094b0:	1682                	slli	a3,a3,0x20
ffffffffc02094b2:	6605                	lui	a2,0x1
ffffffffc02094b4:	85ce                	mv	a1,s3
ffffffffc02094b6:	9281                	srli	a3,a3,0x20
ffffffffc02094b8:	1008                	addi	a0,sp,32
ffffffffc02094ba:	f29fb0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02094be:	02093783          	ld	a5,32(s2)
ffffffffc02094c2:	85aa                	mv	a1,a0
ffffffffc02094c4:	4601                	li	a2,0
ffffffffc02094c6:	854a                	mv	a0,s2
ffffffffc02094c8:	9782                	jalr	a5
ffffffffc02094ca:	dd69                	beqz	a0,ffffffffc02094a4 <sfs_do_mount+0x14a>
ffffffffc02094cc:	e42a                	sd	a0,8(sp)
ffffffffc02094ce:	856a                	mv	a0,s10
ffffffffc02094d0:	bdfff0ef          	jal	ra,ffffffffc02090ae <bitmap_destroy>
ffffffffc02094d4:	67a2                	ld	a5,8(sp)
ffffffffc02094d6:	8a3e                	mv	s4,a5
ffffffffc02094d8:	8562                	mv	a0,s8
ffffffffc02094da:	b65f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02094de:	8526                	mv	a0,s1
ffffffffc02094e0:	b5ff80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02094e4:	8522                	mv	a0,s0
ffffffffc02094e6:	b59f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02094ea:	70aa                	ld	ra,168(sp)
ffffffffc02094ec:	740a                	ld	s0,160(sp)
ffffffffc02094ee:	64ea                	ld	s1,152(sp)
ffffffffc02094f0:	694a                	ld	s2,144(sp)
ffffffffc02094f2:	69aa                	ld	s3,136(sp)
ffffffffc02094f4:	7ae6                	ld	s5,120(sp)
ffffffffc02094f6:	7b46                	ld	s6,112(sp)
ffffffffc02094f8:	7ba6                	ld	s7,104(sp)
ffffffffc02094fa:	7c06                	ld	s8,96(sp)
ffffffffc02094fc:	6ce6                	ld	s9,88(sp)
ffffffffc02094fe:	6d46                	ld	s10,80(sp)
ffffffffc0209500:	6da6                	ld	s11,72(sp)
ffffffffc0209502:	8552                	mv	a0,s4
ffffffffc0209504:	6a0a                	ld	s4,128(sp)
ffffffffc0209506:	614d                	addi	sp,sp,176
ffffffffc0209508:	8082                	ret
ffffffffc020950a:	5a71                	li	s4,-4
ffffffffc020950c:	bfe1                	j	ffffffffc02094e4 <sfs_do_mount+0x18a>
ffffffffc020950e:	85be                	mv	a1,a5
ffffffffc0209510:	00006517          	auipc	a0,0x6
ffffffffc0209514:	96050513          	addi	a0,a0,-1696 # ffffffffc020ee70 <dev_node_ops+0x4d8>
ffffffffc0209518:	c8ff60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020951c:	5a75                	li	s4,-3
ffffffffc020951e:	b7c1                	j	ffffffffc02094de <sfs_do_mount+0x184>
ffffffffc0209520:	00006517          	auipc	a0,0x6
ffffffffc0209524:	91850513          	addi	a0,a0,-1768 # ffffffffc020ee38 <dev_node_ops+0x4a0>
ffffffffc0209528:	c7ff60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020952c:	5a75                	li	s4,-3
ffffffffc020952e:	bf45                	j	ffffffffc02094de <sfs_do_mount+0x184>
ffffffffc0209530:	00442903          	lw	s2,4(s0)
ffffffffc0209534:	4481                	li	s1,0
ffffffffc0209536:	080b8c63          	beqz	s7,ffffffffc02095ce <sfs_do_mount+0x274>
ffffffffc020953a:	85a6                	mv	a1,s1
ffffffffc020953c:	856a                	mv	a0,s10
ffffffffc020953e:	af7ff0ef          	jal	ra,ffffffffc0209034 <bitmap_test>
ffffffffc0209542:	c111                	beqz	a0,ffffffffc0209546 <sfs_do_mount+0x1ec>
ffffffffc0209544:	2b05                	addiw	s6,s6,1
ffffffffc0209546:	2485                	addiw	s1,s1,1
ffffffffc0209548:	fe9b99e3          	bne	s7,s1,ffffffffc020953a <sfs_do_mount+0x1e0>
ffffffffc020954c:	441c                	lw	a5,8(s0)
ffffffffc020954e:	0d679463          	bne	a5,s6,ffffffffc0209616 <sfs_do_mount+0x2bc>
ffffffffc0209552:	4585                	li	a1,1
ffffffffc0209554:	05040513          	addi	a0,s0,80
ffffffffc0209558:	04043023          	sd	zero,64(s0)
ffffffffc020955c:	ffffa0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0209560:	4585                	li	a1,1
ffffffffc0209562:	06840513          	addi	a0,s0,104
ffffffffc0209566:	ff5fa0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc020956a:	4585                	li	a1,1
ffffffffc020956c:	08040513          	addi	a0,s0,128
ffffffffc0209570:	febfa0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0209574:	09840793          	addi	a5,s0,152
ffffffffc0209578:	f05c                	sd	a5,160(s0)
ffffffffc020957a:	ec5c                	sd	a5,152(s0)
ffffffffc020957c:	874a                	mv	a4,s2
ffffffffc020957e:	86da                	mv	a3,s6
ffffffffc0209580:	4169063b          	subw	a2,s2,s6
ffffffffc0209584:	00c40593          	addi	a1,s0,12
ffffffffc0209588:	00006517          	auipc	a0,0x6
ffffffffc020958c:	97850513          	addi	a0,a0,-1672 # ffffffffc020ef00 <dev_node_ops+0x568>
ffffffffc0209590:	c17f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209594:	00000797          	auipc	a5,0x0
ffffffffc0209598:	c8878793          	addi	a5,a5,-888 # ffffffffc020921c <sfs_sync>
ffffffffc020959c:	fc5c                	sd	a5,184(s0)
ffffffffc020959e:	00000797          	auipc	a5,0x0
ffffffffc02095a2:	d6478793          	addi	a5,a5,-668 # ffffffffc0209302 <sfs_get_root>
ffffffffc02095a6:	e07c                	sd	a5,192(s0)
ffffffffc02095a8:	00000797          	auipc	a5,0x0
ffffffffc02095ac:	b5e78793          	addi	a5,a5,-1186 # ffffffffc0209106 <sfs_unmount>
ffffffffc02095b0:	e47c                	sd	a5,200(s0)
ffffffffc02095b2:	00000797          	auipc	a5,0x0
ffffffffc02095b6:	bd878793          	addi	a5,a5,-1064 # ffffffffc020918a <sfs_cleanup>
ffffffffc02095ba:	e87c                	sd	a5,208(s0)
ffffffffc02095bc:	008ab023          	sd	s0,0(s5)
ffffffffc02095c0:	b72d                	j	ffffffffc02094ea <sfs_do_mount+0x190>
ffffffffc02095c2:	5a71                	li	s4,-4
ffffffffc02095c4:	bf11                	j	ffffffffc02094d8 <sfs_do_mount+0x17e>
ffffffffc02095c6:	5a49                	li	s4,-14
ffffffffc02095c8:	b70d                	j	ffffffffc02094ea <sfs_do_mount+0x190>
ffffffffc02095ca:	5a71                	li	s4,-4
ffffffffc02095cc:	bf09                	j	ffffffffc02094de <sfs_do_mount+0x184>
ffffffffc02095ce:	4b01                	li	s6,0
ffffffffc02095d0:	bfb5                	j	ffffffffc020954c <sfs_do_mount+0x1f2>
ffffffffc02095d2:	5a71                	li	s4,-4
ffffffffc02095d4:	bf19                	j	ffffffffc02094ea <sfs_do_mount+0x190>
ffffffffc02095d6:	00006697          	auipc	a3,0x6
ffffffffc02095da:	8ca68693          	addi	a3,a3,-1846 # ffffffffc020eea0 <dev_node_ops+0x508>
ffffffffc02095de:	00002617          	auipc	a2,0x2
ffffffffc02095e2:	3ca60613          	addi	a2,a2,970 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02095e6:	08300593          	li	a1,131
ffffffffc02095ea:	00005517          	auipc	a0,0x5
ffffffffc02095ee:	7be50513          	addi	a0,a0,1982 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc02095f2:	eadf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02095f6:	00005697          	auipc	a3,0x5
ffffffffc02095fa:	78268693          	addi	a3,a3,1922 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc02095fe:	00002617          	auipc	a2,0x2
ffffffffc0209602:	3aa60613          	addi	a2,a2,938 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209606:	0a300593          	li	a1,163
ffffffffc020960a:	00005517          	auipc	a0,0x5
ffffffffc020960e:	79e50513          	addi	a0,a0,1950 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc0209612:	e8df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209616:	00006697          	auipc	a3,0x6
ffffffffc020961a:	8ba68693          	addi	a3,a3,-1862 # ffffffffc020eed0 <dev_node_ops+0x538>
ffffffffc020961e:	00002617          	auipc	a2,0x2
ffffffffc0209622:	38a60613          	addi	a2,a2,906 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209626:	0e000593          	li	a1,224
ffffffffc020962a:	00005517          	auipc	a0,0x5
ffffffffc020962e:	77e50513          	addi	a0,a0,1918 # ffffffffc020eda8 <dev_node_ops+0x410>
ffffffffc0209632:	e6df60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209636 <sfs_mount>:
ffffffffc0209636:	00000597          	auipc	a1,0x0
ffffffffc020963a:	d2458593          	addi	a1,a1,-732 # ffffffffc020935a <sfs_do_mount>
ffffffffc020963e:	817fe06f          	j	ffffffffc0207e54 <vfs_mount>

ffffffffc0209642 <sfs_opendir>:
ffffffffc0209642:	0235f593          	andi	a1,a1,35
ffffffffc0209646:	4501                	li	a0,0
ffffffffc0209648:	e191                	bnez	a1,ffffffffc020964c <sfs_opendir+0xa>
ffffffffc020964a:	8082                	ret
ffffffffc020964c:	553d                	li	a0,-17
ffffffffc020964e:	8082                	ret

ffffffffc0209650 <sfs_openfile>:
ffffffffc0209650:	4501                	li	a0,0
ffffffffc0209652:	8082                	ret

ffffffffc0209654 <sfs_gettype>:
ffffffffc0209654:	1141                	addi	sp,sp,-16
ffffffffc0209656:	e406                	sd	ra,8(sp)
ffffffffc0209658:	c939                	beqz	a0,ffffffffc02096ae <sfs_gettype+0x5a>
ffffffffc020965a:	4d34                	lw	a3,88(a0)
ffffffffc020965c:	6785                	lui	a5,0x1
ffffffffc020965e:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209662:	04e69663          	bne	a3,a4,ffffffffc02096ae <sfs_gettype+0x5a>
ffffffffc0209666:	6114                	ld	a3,0(a0)
ffffffffc0209668:	4709                	li	a4,2
ffffffffc020966a:	0046d683          	lhu	a3,4(a3)
ffffffffc020966e:	02e68a63          	beq	a3,a4,ffffffffc02096a2 <sfs_gettype+0x4e>
ffffffffc0209672:	470d                	li	a4,3
ffffffffc0209674:	02e68163          	beq	a3,a4,ffffffffc0209696 <sfs_gettype+0x42>
ffffffffc0209678:	4705                	li	a4,1
ffffffffc020967a:	00e68f63          	beq	a3,a4,ffffffffc0209698 <sfs_gettype+0x44>
ffffffffc020967e:	00006617          	auipc	a2,0x6
ffffffffc0209682:	8f260613          	addi	a2,a2,-1806 # ffffffffc020ef70 <dev_node_ops+0x5d8>
ffffffffc0209686:	38d00593          	li	a1,909
ffffffffc020968a:	00006517          	auipc	a0,0x6
ffffffffc020968e:	8ce50513          	addi	a0,a0,-1842 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209692:	e0df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209696:	678d                	lui	a5,0x3
ffffffffc0209698:	60a2                	ld	ra,8(sp)
ffffffffc020969a:	c19c                	sw	a5,0(a1)
ffffffffc020969c:	4501                	li	a0,0
ffffffffc020969e:	0141                	addi	sp,sp,16
ffffffffc02096a0:	8082                	ret
ffffffffc02096a2:	60a2                	ld	ra,8(sp)
ffffffffc02096a4:	6789                	lui	a5,0x2
ffffffffc02096a6:	c19c                	sw	a5,0(a1)
ffffffffc02096a8:	4501                	li	a0,0
ffffffffc02096aa:	0141                	addi	sp,sp,16
ffffffffc02096ac:	8082                	ret
ffffffffc02096ae:	00006697          	auipc	a3,0x6
ffffffffc02096b2:	87268693          	addi	a3,a3,-1934 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc02096b6:	00002617          	auipc	a2,0x2
ffffffffc02096ba:	2f260613          	addi	a2,a2,754 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02096be:	38100593          	li	a1,897
ffffffffc02096c2:	00006517          	auipc	a0,0x6
ffffffffc02096c6:	89650513          	addi	a0,a0,-1898 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc02096ca:	dd5f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02096ce <sfs_fsync>:
ffffffffc02096ce:	7179                	addi	sp,sp,-48
ffffffffc02096d0:	ec26                	sd	s1,24(sp)
ffffffffc02096d2:	7524                	ld	s1,104(a0)
ffffffffc02096d4:	f406                	sd	ra,40(sp)
ffffffffc02096d6:	f022                	sd	s0,32(sp)
ffffffffc02096d8:	e84a                	sd	s2,16(sp)
ffffffffc02096da:	e44e                	sd	s3,8(sp)
ffffffffc02096dc:	c4bd                	beqz	s1,ffffffffc020974a <sfs_fsync+0x7c>
ffffffffc02096de:	0b04a783          	lw	a5,176(s1)
ffffffffc02096e2:	e7a5                	bnez	a5,ffffffffc020974a <sfs_fsync+0x7c>
ffffffffc02096e4:	4d38                	lw	a4,88(a0)
ffffffffc02096e6:	6785                	lui	a5,0x1
ffffffffc02096e8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02096ec:	842a                	mv	s0,a0
ffffffffc02096ee:	06f71e63          	bne	a4,a5,ffffffffc020976a <sfs_fsync+0x9c>
ffffffffc02096f2:	691c                	ld	a5,16(a0)
ffffffffc02096f4:	4901                	li	s2,0
ffffffffc02096f6:	eb89                	bnez	a5,ffffffffc0209708 <sfs_fsync+0x3a>
ffffffffc02096f8:	70a2                	ld	ra,40(sp)
ffffffffc02096fa:	7402                	ld	s0,32(sp)
ffffffffc02096fc:	64e2                	ld	s1,24(sp)
ffffffffc02096fe:	69a2                	ld	s3,8(sp)
ffffffffc0209700:	854a                	mv	a0,s2
ffffffffc0209702:	6942                	ld	s2,16(sp)
ffffffffc0209704:	6145                	addi	sp,sp,48
ffffffffc0209706:	8082                	ret
ffffffffc0209708:	02050993          	addi	s3,a0,32
ffffffffc020970c:	854e                	mv	a0,s3
ffffffffc020970e:	e57fa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0209712:	681c                	ld	a5,16(s0)
ffffffffc0209714:	ef81                	bnez	a5,ffffffffc020972c <sfs_fsync+0x5e>
ffffffffc0209716:	854e                	mv	a0,s3
ffffffffc0209718:	e49fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020971c:	70a2                	ld	ra,40(sp)
ffffffffc020971e:	7402                	ld	s0,32(sp)
ffffffffc0209720:	64e2                	ld	s1,24(sp)
ffffffffc0209722:	69a2                	ld	s3,8(sp)
ffffffffc0209724:	854a                	mv	a0,s2
ffffffffc0209726:	6942                	ld	s2,16(sp)
ffffffffc0209728:	6145                	addi	sp,sp,48
ffffffffc020972a:	8082                	ret
ffffffffc020972c:	4414                	lw	a3,8(s0)
ffffffffc020972e:	600c                	ld	a1,0(s0)
ffffffffc0209730:	00043823          	sd	zero,16(s0)
ffffffffc0209734:	4701                	li	a4,0
ffffffffc0209736:	04000613          	li	a2,64
ffffffffc020973a:	8526                	mv	a0,s1
ffffffffc020973c:	684010ef          	jal	ra,ffffffffc020adc0 <sfs_wbuf>
ffffffffc0209740:	892a                	mv	s2,a0
ffffffffc0209742:	d971                	beqz	a0,ffffffffc0209716 <sfs_fsync+0x48>
ffffffffc0209744:	4785                	li	a5,1
ffffffffc0209746:	e81c                	sd	a5,16(s0)
ffffffffc0209748:	b7f9                	j	ffffffffc0209716 <sfs_fsync+0x48>
ffffffffc020974a:	00005697          	auipc	a3,0x5
ffffffffc020974e:	62e68693          	addi	a3,a3,1582 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc0209752:	00002617          	auipc	a2,0x2
ffffffffc0209756:	25660613          	addi	a2,a2,598 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020975a:	2c500593          	li	a1,709
ffffffffc020975e:	00005517          	auipc	a0,0x5
ffffffffc0209762:	7fa50513          	addi	a0,a0,2042 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209766:	d39f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020976a:	00005697          	auipc	a3,0x5
ffffffffc020976e:	7b668693          	addi	a3,a3,1974 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc0209772:	00002617          	auipc	a2,0x2
ffffffffc0209776:	23660613          	addi	a2,a2,566 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020977a:	2c600593          	li	a1,710
ffffffffc020977e:	00005517          	auipc	a0,0x5
ffffffffc0209782:	7da50513          	addi	a0,a0,2010 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209786:	d19f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020978a <sfs_fstat>:
ffffffffc020978a:	1101                	addi	sp,sp,-32
ffffffffc020978c:	e426                	sd	s1,8(sp)
ffffffffc020978e:	84ae                	mv	s1,a1
ffffffffc0209790:	e822                	sd	s0,16(sp)
ffffffffc0209792:	02000613          	li	a2,32
ffffffffc0209796:	842a                	mv	s0,a0
ffffffffc0209798:	4581                	li	a1,0
ffffffffc020979a:	8526                	mv	a0,s1
ffffffffc020979c:	ec06                	sd	ra,24(sp)
ffffffffc020979e:	527010ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc02097a2:	c439                	beqz	s0,ffffffffc02097f0 <sfs_fstat+0x66>
ffffffffc02097a4:	783c                	ld	a5,112(s0)
ffffffffc02097a6:	c7a9                	beqz	a5,ffffffffc02097f0 <sfs_fstat+0x66>
ffffffffc02097a8:	6bbc                	ld	a5,80(a5)
ffffffffc02097aa:	c3b9                	beqz	a5,ffffffffc02097f0 <sfs_fstat+0x66>
ffffffffc02097ac:	00005597          	auipc	a1,0x5
ffffffffc02097b0:	16458593          	addi	a1,a1,356 # ffffffffc020e910 <syscalls+0xdb0>
ffffffffc02097b4:	8522                	mv	a0,s0
ffffffffc02097b6:	8cefe0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc02097ba:	783c                	ld	a5,112(s0)
ffffffffc02097bc:	85a6                	mv	a1,s1
ffffffffc02097be:	8522                	mv	a0,s0
ffffffffc02097c0:	6bbc                	ld	a5,80(a5)
ffffffffc02097c2:	9782                	jalr	a5
ffffffffc02097c4:	e10d                	bnez	a0,ffffffffc02097e6 <sfs_fstat+0x5c>
ffffffffc02097c6:	4c38                	lw	a4,88(s0)
ffffffffc02097c8:	6785                	lui	a5,0x1
ffffffffc02097ca:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02097ce:	04f71163          	bne	a4,a5,ffffffffc0209810 <sfs_fstat+0x86>
ffffffffc02097d2:	601c                	ld	a5,0(s0)
ffffffffc02097d4:	0067d683          	lhu	a3,6(a5)
ffffffffc02097d8:	0087e703          	lwu	a4,8(a5)
ffffffffc02097dc:	0007e783          	lwu	a5,0(a5)
ffffffffc02097e0:	e494                	sd	a3,8(s1)
ffffffffc02097e2:	e898                	sd	a4,16(s1)
ffffffffc02097e4:	ec9c                	sd	a5,24(s1)
ffffffffc02097e6:	60e2                	ld	ra,24(sp)
ffffffffc02097e8:	6442                	ld	s0,16(sp)
ffffffffc02097ea:	64a2                	ld	s1,8(sp)
ffffffffc02097ec:	6105                	addi	sp,sp,32
ffffffffc02097ee:	8082                	ret
ffffffffc02097f0:	00005697          	auipc	a3,0x5
ffffffffc02097f4:	0b868693          	addi	a3,a3,184 # ffffffffc020e8a8 <syscalls+0xd48>
ffffffffc02097f8:	00002617          	auipc	a2,0x2
ffffffffc02097fc:	1b060613          	addi	a2,a2,432 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209800:	2b600593          	li	a1,694
ffffffffc0209804:	00005517          	auipc	a0,0x5
ffffffffc0209808:	75450513          	addi	a0,a0,1876 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020980c:	c93f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209810:	00005697          	auipc	a3,0x5
ffffffffc0209814:	71068693          	addi	a3,a3,1808 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc0209818:	00002617          	auipc	a2,0x2
ffffffffc020981c:	19060613          	addi	a2,a2,400 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209820:	2b900593          	li	a1,697
ffffffffc0209824:	00005517          	auipc	a0,0x5
ffffffffc0209828:	73450513          	addi	a0,a0,1844 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020982c:	c73f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209830 <sfs_tryseek>:
ffffffffc0209830:	080007b7          	lui	a5,0x8000
ffffffffc0209834:	04f5fd63          	bgeu	a1,a5,ffffffffc020988e <sfs_tryseek+0x5e>
ffffffffc0209838:	1101                	addi	sp,sp,-32
ffffffffc020983a:	e822                	sd	s0,16(sp)
ffffffffc020983c:	ec06                	sd	ra,24(sp)
ffffffffc020983e:	e426                	sd	s1,8(sp)
ffffffffc0209840:	842a                	mv	s0,a0
ffffffffc0209842:	c921                	beqz	a0,ffffffffc0209892 <sfs_tryseek+0x62>
ffffffffc0209844:	4d38                	lw	a4,88(a0)
ffffffffc0209846:	6785                	lui	a5,0x1
ffffffffc0209848:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020984c:	04f71363          	bne	a4,a5,ffffffffc0209892 <sfs_tryseek+0x62>
ffffffffc0209850:	611c                	ld	a5,0(a0)
ffffffffc0209852:	84ae                	mv	s1,a1
ffffffffc0209854:	0007e783          	lwu	a5,0(a5)
ffffffffc0209858:	02b7d563          	bge	a5,a1,ffffffffc0209882 <sfs_tryseek+0x52>
ffffffffc020985c:	793c                	ld	a5,112(a0)
ffffffffc020985e:	cbb1                	beqz	a5,ffffffffc02098b2 <sfs_tryseek+0x82>
ffffffffc0209860:	73bc                	ld	a5,96(a5)
ffffffffc0209862:	cba1                	beqz	a5,ffffffffc02098b2 <sfs_tryseek+0x82>
ffffffffc0209864:	00005597          	auipc	a1,0x5
ffffffffc0209868:	f9c58593          	addi	a1,a1,-100 # ffffffffc020e800 <syscalls+0xca0>
ffffffffc020986c:	818fe0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0209870:	783c                	ld	a5,112(s0)
ffffffffc0209872:	8522                	mv	a0,s0
ffffffffc0209874:	6442                	ld	s0,16(sp)
ffffffffc0209876:	60e2                	ld	ra,24(sp)
ffffffffc0209878:	73bc                	ld	a5,96(a5)
ffffffffc020987a:	85a6                	mv	a1,s1
ffffffffc020987c:	64a2                	ld	s1,8(sp)
ffffffffc020987e:	6105                	addi	sp,sp,32
ffffffffc0209880:	8782                	jr	a5
ffffffffc0209882:	60e2                	ld	ra,24(sp)
ffffffffc0209884:	6442                	ld	s0,16(sp)
ffffffffc0209886:	64a2                	ld	s1,8(sp)
ffffffffc0209888:	4501                	li	a0,0
ffffffffc020988a:	6105                	addi	sp,sp,32
ffffffffc020988c:	8082                	ret
ffffffffc020988e:	5575                	li	a0,-3
ffffffffc0209890:	8082                	ret
ffffffffc0209892:	00005697          	auipc	a3,0x5
ffffffffc0209896:	68e68693          	addi	a3,a3,1678 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc020989a:	00002617          	auipc	a2,0x2
ffffffffc020989e:	10e60613          	addi	a2,a2,270 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02098a2:	39800593          	li	a1,920
ffffffffc02098a6:	00005517          	auipc	a0,0x5
ffffffffc02098aa:	6b250513          	addi	a0,a0,1714 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc02098ae:	bf1f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02098b2:	00005697          	auipc	a3,0x5
ffffffffc02098b6:	ef668693          	addi	a3,a3,-266 # ffffffffc020e7a8 <syscalls+0xc48>
ffffffffc02098ba:	00002617          	auipc	a2,0x2
ffffffffc02098be:	0ee60613          	addi	a2,a2,238 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02098c2:	39a00593          	li	a1,922
ffffffffc02098c6:	00005517          	auipc	a0,0x5
ffffffffc02098ca:	69250513          	addi	a0,a0,1682 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc02098ce:	bd1f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02098d2 <sfs_close>:
ffffffffc02098d2:	1141                	addi	sp,sp,-16
ffffffffc02098d4:	e406                	sd	ra,8(sp)
ffffffffc02098d6:	e022                	sd	s0,0(sp)
ffffffffc02098d8:	c11d                	beqz	a0,ffffffffc02098fe <sfs_close+0x2c>
ffffffffc02098da:	793c                	ld	a5,112(a0)
ffffffffc02098dc:	842a                	mv	s0,a0
ffffffffc02098de:	c385                	beqz	a5,ffffffffc02098fe <sfs_close+0x2c>
ffffffffc02098e0:	7b9c                	ld	a5,48(a5)
ffffffffc02098e2:	cf91                	beqz	a5,ffffffffc02098fe <sfs_close+0x2c>
ffffffffc02098e4:	00004597          	auipc	a1,0x4
ffffffffc02098e8:	a4c58593          	addi	a1,a1,-1460 # ffffffffc020d330 <default_pmm_manager+0xea0>
ffffffffc02098ec:	f99fd0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc02098f0:	783c                	ld	a5,112(s0)
ffffffffc02098f2:	8522                	mv	a0,s0
ffffffffc02098f4:	6402                	ld	s0,0(sp)
ffffffffc02098f6:	60a2                	ld	ra,8(sp)
ffffffffc02098f8:	7b9c                	ld	a5,48(a5)
ffffffffc02098fa:	0141                	addi	sp,sp,16
ffffffffc02098fc:	8782                	jr	a5
ffffffffc02098fe:	00004697          	auipc	a3,0x4
ffffffffc0209902:	9e268693          	addi	a3,a3,-1566 # ffffffffc020d2e0 <default_pmm_manager+0xe50>
ffffffffc0209906:	00002617          	auipc	a2,0x2
ffffffffc020990a:	0a260613          	addi	a2,a2,162 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020990e:	21c00593          	li	a1,540
ffffffffc0209912:	00005517          	auipc	a0,0x5
ffffffffc0209916:	64650513          	addi	a0,a0,1606 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020991a:	b85f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020991e <sfs_io.part.0>:
ffffffffc020991e:	1141                	addi	sp,sp,-16
ffffffffc0209920:	00005697          	auipc	a3,0x5
ffffffffc0209924:	60068693          	addi	a3,a3,1536 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc0209928:	00002617          	auipc	a2,0x2
ffffffffc020992c:	08060613          	addi	a2,a2,128 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209930:	29500593          	li	a1,661
ffffffffc0209934:	00005517          	auipc	a0,0x5
ffffffffc0209938:	62450513          	addi	a0,a0,1572 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020993c:	e406                	sd	ra,8(sp)
ffffffffc020993e:	b61f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209942 <sfs_block_free>:
ffffffffc0209942:	1101                	addi	sp,sp,-32
ffffffffc0209944:	e426                	sd	s1,8(sp)
ffffffffc0209946:	ec06                	sd	ra,24(sp)
ffffffffc0209948:	e822                	sd	s0,16(sp)
ffffffffc020994a:	4154                	lw	a3,4(a0)
ffffffffc020994c:	84ae                	mv	s1,a1
ffffffffc020994e:	c595                	beqz	a1,ffffffffc020997a <sfs_block_free+0x38>
ffffffffc0209950:	02d5f563          	bgeu	a1,a3,ffffffffc020997a <sfs_block_free+0x38>
ffffffffc0209954:	842a                	mv	s0,a0
ffffffffc0209956:	7d08                	ld	a0,56(a0)
ffffffffc0209958:	edcff0ef          	jal	ra,ffffffffc0209034 <bitmap_test>
ffffffffc020995c:	ed05                	bnez	a0,ffffffffc0209994 <sfs_block_free+0x52>
ffffffffc020995e:	7c08                	ld	a0,56(s0)
ffffffffc0209960:	85a6                	mv	a1,s1
ffffffffc0209962:	efaff0ef          	jal	ra,ffffffffc020905c <bitmap_free>
ffffffffc0209966:	441c                	lw	a5,8(s0)
ffffffffc0209968:	4705                	li	a4,1
ffffffffc020996a:	60e2                	ld	ra,24(sp)
ffffffffc020996c:	2785                	addiw	a5,a5,1
ffffffffc020996e:	e038                	sd	a4,64(s0)
ffffffffc0209970:	c41c                	sw	a5,8(s0)
ffffffffc0209972:	6442                	ld	s0,16(sp)
ffffffffc0209974:	64a2                	ld	s1,8(sp)
ffffffffc0209976:	6105                	addi	sp,sp,32
ffffffffc0209978:	8082                	ret
ffffffffc020997a:	8726                	mv	a4,s1
ffffffffc020997c:	00005617          	auipc	a2,0x5
ffffffffc0209980:	60c60613          	addi	a2,a2,1548 # ffffffffc020ef88 <dev_node_ops+0x5f0>
ffffffffc0209984:	05300593          	li	a1,83
ffffffffc0209988:	00005517          	auipc	a0,0x5
ffffffffc020998c:	5d050513          	addi	a0,a0,1488 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209990:	b0ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209994:	00005697          	auipc	a3,0x5
ffffffffc0209998:	62c68693          	addi	a3,a3,1580 # ffffffffc020efc0 <dev_node_ops+0x628>
ffffffffc020999c:	00002617          	auipc	a2,0x2
ffffffffc02099a0:	00c60613          	addi	a2,a2,12 # ffffffffc020b9a8 <commands+0x210>
ffffffffc02099a4:	06a00593          	li	a1,106
ffffffffc02099a8:	00005517          	auipc	a0,0x5
ffffffffc02099ac:	5b050513          	addi	a0,a0,1456 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc02099b0:	aeff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02099b4 <sfs_reclaim>:
ffffffffc02099b4:	1101                	addi	sp,sp,-32
ffffffffc02099b6:	e426                	sd	s1,8(sp)
ffffffffc02099b8:	7524                	ld	s1,104(a0)
ffffffffc02099ba:	ec06                	sd	ra,24(sp)
ffffffffc02099bc:	e822                	sd	s0,16(sp)
ffffffffc02099be:	e04a                	sd	s2,0(sp)
ffffffffc02099c0:	0e048a63          	beqz	s1,ffffffffc0209ab4 <sfs_reclaim+0x100>
ffffffffc02099c4:	0b04a783          	lw	a5,176(s1)
ffffffffc02099c8:	0e079663          	bnez	a5,ffffffffc0209ab4 <sfs_reclaim+0x100>
ffffffffc02099cc:	4d38                	lw	a4,88(a0)
ffffffffc02099ce:	6785                	lui	a5,0x1
ffffffffc02099d0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02099d4:	842a                	mv	s0,a0
ffffffffc02099d6:	10f71f63          	bne	a4,a5,ffffffffc0209af4 <sfs_reclaim+0x140>
ffffffffc02099da:	8526                	mv	a0,s1
ffffffffc02099dc:	594010ef          	jal	ra,ffffffffc020af70 <lock_sfs_fs>
ffffffffc02099e0:	4c1c                	lw	a5,24(s0)
ffffffffc02099e2:	0ef05963          	blez	a5,ffffffffc0209ad4 <sfs_reclaim+0x120>
ffffffffc02099e6:	fff7871b          	addiw	a4,a5,-1
ffffffffc02099ea:	cc18                	sw	a4,24(s0)
ffffffffc02099ec:	eb59                	bnez	a4,ffffffffc0209a82 <sfs_reclaim+0xce>
ffffffffc02099ee:	05c42903          	lw	s2,92(s0)
ffffffffc02099f2:	08091863          	bnez	s2,ffffffffc0209a82 <sfs_reclaim+0xce>
ffffffffc02099f6:	601c                	ld	a5,0(s0)
ffffffffc02099f8:	0067d783          	lhu	a5,6(a5)
ffffffffc02099fc:	e785                	bnez	a5,ffffffffc0209a24 <sfs_reclaim+0x70>
ffffffffc02099fe:	783c                	ld	a5,112(s0)
ffffffffc0209a00:	10078a63          	beqz	a5,ffffffffc0209b14 <sfs_reclaim+0x160>
ffffffffc0209a04:	73bc                	ld	a5,96(a5)
ffffffffc0209a06:	10078763          	beqz	a5,ffffffffc0209b14 <sfs_reclaim+0x160>
ffffffffc0209a0a:	00005597          	auipc	a1,0x5
ffffffffc0209a0e:	df658593          	addi	a1,a1,-522 # ffffffffc020e800 <syscalls+0xca0>
ffffffffc0209a12:	8522                	mv	a0,s0
ffffffffc0209a14:	e71fd0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0209a18:	783c                	ld	a5,112(s0)
ffffffffc0209a1a:	4581                	li	a1,0
ffffffffc0209a1c:	8522                	mv	a0,s0
ffffffffc0209a1e:	73bc                	ld	a5,96(a5)
ffffffffc0209a20:	9782                	jalr	a5
ffffffffc0209a22:	e559                	bnez	a0,ffffffffc0209ab0 <sfs_reclaim+0xfc>
ffffffffc0209a24:	681c                	ld	a5,16(s0)
ffffffffc0209a26:	c39d                	beqz	a5,ffffffffc0209a4c <sfs_reclaim+0x98>
ffffffffc0209a28:	783c                	ld	a5,112(s0)
ffffffffc0209a2a:	10078563          	beqz	a5,ffffffffc0209b34 <sfs_reclaim+0x180>
ffffffffc0209a2e:	7b9c                	ld	a5,48(a5)
ffffffffc0209a30:	10078263          	beqz	a5,ffffffffc0209b34 <sfs_reclaim+0x180>
ffffffffc0209a34:	8522                	mv	a0,s0
ffffffffc0209a36:	00004597          	auipc	a1,0x4
ffffffffc0209a3a:	8fa58593          	addi	a1,a1,-1798 # ffffffffc020d330 <default_pmm_manager+0xea0>
ffffffffc0209a3e:	e47fd0ef          	jal	ra,ffffffffc0207884 <inode_check>
ffffffffc0209a42:	783c                	ld	a5,112(s0)
ffffffffc0209a44:	8522                	mv	a0,s0
ffffffffc0209a46:	7b9c                	ld	a5,48(a5)
ffffffffc0209a48:	9782                	jalr	a5
ffffffffc0209a4a:	e13d                	bnez	a0,ffffffffc0209ab0 <sfs_reclaim+0xfc>
ffffffffc0209a4c:	7c18                	ld	a4,56(s0)
ffffffffc0209a4e:	603c                	ld	a5,64(s0)
ffffffffc0209a50:	8526                	mv	a0,s1
ffffffffc0209a52:	e71c                	sd	a5,8(a4)
ffffffffc0209a54:	e398                	sd	a4,0(a5)
ffffffffc0209a56:	6438                	ld	a4,72(s0)
ffffffffc0209a58:	683c                	ld	a5,80(s0)
ffffffffc0209a5a:	e71c                	sd	a5,8(a4)
ffffffffc0209a5c:	e398                	sd	a4,0(a5)
ffffffffc0209a5e:	522010ef          	jal	ra,ffffffffc020af80 <unlock_sfs_fs>
ffffffffc0209a62:	6008                	ld	a0,0(s0)
ffffffffc0209a64:	00655783          	lhu	a5,6(a0)
ffffffffc0209a68:	cb85                	beqz	a5,ffffffffc0209a98 <sfs_reclaim+0xe4>
ffffffffc0209a6a:	dd4f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209a6e:	8522                	mv	a0,s0
ffffffffc0209a70:	da9fd0ef          	jal	ra,ffffffffc0207818 <inode_kill>
ffffffffc0209a74:	60e2                	ld	ra,24(sp)
ffffffffc0209a76:	6442                	ld	s0,16(sp)
ffffffffc0209a78:	64a2                	ld	s1,8(sp)
ffffffffc0209a7a:	854a                	mv	a0,s2
ffffffffc0209a7c:	6902                	ld	s2,0(sp)
ffffffffc0209a7e:	6105                	addi	sp,sp,32
ffffffffc0209a80:	8082                	ret
ffffffffc0209a82:	5945                	li	s2,-15
ffffffffc0209a84:	8526                	mv	a0,s1
ffffffffc0209a86:	4fa010ef          	jal	ra,ffffffffc020af80 <unlock_sfs_fs>
ffffffffc0209a8a:	60e2                	ld	ra,24(sp)
ffffffffc0209a8c:	6442                	ld	s0,16(sp)
ffffffffc0209a8e:	64a2                	ld	s1,8(sp)
ffffffffc0209a90:	854a                	mv	a0,s2
ffffffffc0209a92:	6902                	ld	s2,0(sp)
ffffffffc0209a94:	6105                	addi	sp,sp,32
ffffffffc0209a96:	8082                	ret
ffffffffc0209a98:	440c                	lw	a1,8(s0)
ffffffffc0209a9a:	8526                	mv	a0,s1
ffffffffc0209a9c:	ea7ff0ef          	jal	ra,ffffffffc0209942 <sfs_block_free>
ffffffffc0209aa0:	6008                	ld	a0,0(s0)
ffffffffc0209aa2:	5d4c                	lw	a1,60(a0)
ffffffffc0209aa4:	d1f9                	beqz	a1,ffffffffc0209a6a <sfs_reclaim+0xb6>
ffffffffc0209aa6:	8526                	mv	a0,s1
ffffffffc0209aa8:	e9bff0ef          	jal	ra,ffffffffc0209942 <sfs_block_free>
ffffffffc0209aac:	6008                	ld	a0,0(s0)
ffffffffc0209aae:	bf75                	j	ffffffffc0209a6a <sfs_reclaim+0xb6>
ffffffffc0209ab0:	892a                	mv	s2,a0
ffffffffc0209ab2:	bfc9                	j	ffffffffc0209a84 <sfs_reclaim+0xd0>
ffffffffc0209ab4:	00005697          	auipc	a3,0x5
ffffffffc0209ab8:	2c468693          	addi	a3,a3,708 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc0209abc:	00002617          	auipc	a2,0x2
ffffffffc0209ac0:	eec60613          	addi	a2,a2,-276 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209ac4:	35600593          	li	a1,854
ffffffffc0209ac8:	00005517          	auipc	a0,0x5
ffffffffc0209acc:	49050513          	addi	a0,a0,1168 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209ad0:	9cff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209ad4:	00005697          	auipc	a3,0x5
ffffffffc0209ad8:	50c68693          	addi	a3,a3,1292 # ffffffffc020efe0 <dev_node_ops+0x648>
ffffffffc0209adc:	00002617          	auipc	a2,0x2
ffffffffc0209ae0:	ecc60613          	addi	a2,a2,-308 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209ae4:	35c00593          	li	a1,860
ffffffffc0209ae8:	00005517          	auipc	a0,0x5
ffffffffc0209aec:	47050513          	addi	a0,a0,1136 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209af0:	9aff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209af4:	00005697          	auipc	a3,0x5
ffffffffc0209af8:	42c68693          	addi	a3,a3,1068 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc0209afc:	00002617          	auipc	a2,0x2
ffffffffc0209b00:	eac60613          	addi	a2,a2,-340 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209b04:	35700593          	li	a1,855
ffffffffc0209b08:	00005517          	auipc	a0,0x5
ffffffffc0209b0c:	45050513          	addi	a0,a0,1104 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209b10:	98ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b14:	00005697          	auipc	a3,0x5
ffffffffc0209b18:	c9468693          	addi	a3,a3,-876 # ffffffffc020e7a8 <syscalls+0xc48>
ffffffffc0209b1c:	00002617          	auipc	a2,0x2
ffffffffc0209b20:	e8c60613          	addi	a2,a2,-372 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209b24:	36100593          	li	a1,865
ffffffffc0209b28:	00005517          	auipc	a0,0x5
ffffffffc0209b2c:	43050513          	addi	a0,a0,1072 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209b30:	96ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b34:	00003697          	auipc	a3,0x3
ffffffffc0209b38:	7ac68693          	addi	a3,a3,1964 # ffffffffc020d2e0 <default_pmm_manager+0xe50>
ffffffffc0209b3c:	00002617          	auipc	a2,0x2
ffffffffc0209b40:	e6c60613          	addi	a2,a2,-404 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209b44:	36600593          	li	a1,870
ffffffffc0209b48:	00005517          	auipc	a0,0x5
ffffffffc0209b4c:	41050513          	addi	a0,a0,1040 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209b50:	94ff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209b54 <sfs_block_alloc>:
ffffffffc0209b54:	1101                	addi	sp,sp,-32
ffffffffc0209b56:	e822                	sd	s0,16(sp)
ffffffffc0209b58:	842a                	mv	s0,a0
ffffffffc0209b5a:	7d08                	ld	a0,56(a0)
ffffffffc0209b5c:	e426                	sd	s1,8(sp)
ffffffffc0209b5e:	ec06                	sd	ra,24(sp)
ffffffffc0209b60:	84ae                	mv	s1,a1
ffffffffc0209b62:	c62ff0ef          	jal	ra,ffffffffc0208fc4 <bitmap_alloc>
ffffffffc0209b66:	e90d                	bnez	a0,ffffffffc0209b98 <sfs_block_alloc+0x44>
ffffffffc0209b68:	441c                	lw	a5,8(s0)
ffffffffc0209b6a:	cbad                	beqz	a5,ffffffffc0209bdc <sfs_block_alloc+0x88>
ffffffffc0209b6c:	37fd                	addiw	a5,a5,-1
ffffffffc0209b6e:	c41c                	sw	a5,8(s0)
ffffffffc0209b70:	408c                	lw	a1,0(s1)
ffffffffc0209b72:	4785                	li	a5,1
ffffffffc0209b74:	e03c                	sd	a5,64(s0)
ffffffffc0209b76:	4054                	lw	a3,4(s0)
ffffffffc0209b78:	c58d                	beqz	a1,ffffffffc0209ba2 <sfs_block_alloc+0x4e>
ffffffffc0209b7a:	02d5f463          	bgeu	a1,a3,ffffffffc0209ba2 <sfs_block_alloc+0x4e>
ffffffffc0209b7e:	7c08                	ld	a0,56(s0)
ffffffffc0209b80:	cb4ff0ef          	jal	ra,ffffffffc0209034 <bitmap_test>
ffffffffc0209b84:	ed05                	bnez	a0,ffffffffc0209bbc <sfs_block_alloc+0x68>
ffffffffc0209b86:	8522                	mv	a0,s0
ffffffffc0209b88:	6442                	ld	s0,16(sp)
ffffffffc0209b8a:	408c                	lw	a1,0(s1)
ffffffffc0209b8c:	60e2                	ld	ra,24(sp)
ffffffffc0209b8e:	64a2                	ld	s1,8(sp)
ffffffffc0209b90:	4605                	li	a2,1
ffffffffc0209b92:	6105                	addi	sp,sp,32
ffffffffc0209b94:	37c0106f          	j	ffffffffc020af10 <sfs_clear_block>
ffffffffc0209b98:	60e2                	ld	ra,24(sp)
ffffffffc0209b9a:	6442                	ld	s0,16(sp)
ffffffffc0209b9c:	64a2                	ld	s1,8(sp)
ffffffffc0209b9e:	6105                	addi	sp,sp,32
ffffffffc0209ba0:	8082                	ret
ffffffffc0209ba2:	872e                	mv	a4,a1
ffffffffc0209ba4:	00005617          	auipc	a2,0x5
ffffffffc0209ba8:	3e460613          	addi	a2,a2,996 # ffffffffc020ef88 <dev_node_ops+0x5f0>
ffffffffc0209bac:	05300593          	li	a1,83
ffffffffc0209bb0:	00005517          	auipc	a0,0x5
ffffffffc0209bb4:	3a850513          	addi	a0,a0,936 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209bb8:	8e7f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209bbc:	00005697          	auipc	a3,0x5
ffffffffc0209bc0:	45c68693          	addi	a3,a3,1116 # ffffffffc020f018 <dev_node_ops+0x680>
ffffffffc0209bc4:	00002617          	auipc	a2,0x2
ffffffffc0209bc8:	de460613          	addi	a2,a2,-540 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209bcc:	06100593          	li	a1,97
ffffffffc0209bd0:	00005517          	auipc	a0,0x5
ffffffffc0209bd4:	38850513          	addi	a0,a0,904 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209bd8:	8c7f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209bdc:	00005697          	auipc	a3,0x5
ffffffffc0209be0:	41c68693          	addi	a3,a3,1052 # ffffffffc020eff8 <dev_node_ops+0x660>
ffffffffc0209be4:	00002617          	auipc	a2,0x2
ffffffffc0209be8:	dc460613          	addi	a2,a2,-572 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209bec:	05f00593          	li	a1,95
ffffffffc0209bf0:	00005517          	auipc	a0,0x5
ffffffffc0209bf4:	36850513          	addi	a0,a0,872 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209bf8:	8a7f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209bfc <sfs_bmap_load_nolock>:
ffffffffc0209bfc:	7159                	addi	sp,sp,-112
ffffffffc0209bfe:	f85a                	sd	s6,48(sp)
ffffffffc0209c00:	0005bb03          	ld	s6,0(a1)
ffffffffc0209c04:	f45e                	sd	s7,40(sp)
ffffffffc0209c06:	f486                	sd	ra,104(sp)
ffffffffc0209c08:	008b2b83          	lw	s7,8(s6)
ffffffffc0209c0c:	f0a2                	sd	s0,96(sp)
ffffffffc0209c0e:	eca6                	sd	s1,88(sp)
ffffffffc0209c10:	e8ca                	sd	s2,80(sp)
ffffffffc0209c12:	e4ce                	sd	s3,72(sp)
ffffffffc0209c14:	e0d2                	sd	s4,64(sp)
ffffffffc0209c16:	fc56                	sd	s5,56(sp)
ffffffffc0209c18:	f062                	sd	s8,32(sp)
ffffffffc0209c1a:	ec66                	sd	s9,24(sp)
ffffffffc0209c1c:	18cbe363          	bltu	s7,a2,ffffffffc0209da2 <sfs_bmap_load_nolock+0x1a6>
ffffffffc0209c20:	47ad                	li	a5,11
ffffffffc0209c22:	8aae                	mv	s5,a1
ffffffffc0209c24:	8432                	mv	s0,a2
ffffffffc0209c26:	84aa                	mv	s1,a0
ffffffffc0209c28:	89b6                	mv	s3,a3
ffffffffc0209c2a:	04c7f563          	bgeu	a5,a2,ffffffffc0209c74 <sfs_bmap_load_nolock+0x78>
ffffffffc0209c2e:	ff46071b          	addiw	a4,a2,-12
ffffffffc0209c32:	0007069b          	sext.w	a3,a4
ffffffffc0209c36:	3ff00793          	li	a5,1023
ffffffffc0209c3a:	1ad7e163          	bltu	a5,a3,ffffffffc0209ddc <sfs_bmap_load_nolock+0x1e0>
ffffffffc0209c3e:	03cb2a03          	lw	s4,60(s6)
ffffffffc0209c42:	02071793          	slli	a5,a4,0x20
ffffffffc0209c46:	c602                	sw	zero,12(sp)
ffffffffc0209c48:	c452                	sw	s4,8(sp)
ffffffffc0209c4a:	01e7dc13          	srli	s8,a5,0x1e
ffffffffc0209c4e:	0e0a1e63          	bnez	s4,ffffffffc0209d4a <sfs_bmap_load_nolock+0x14e>
ffffffffc0209c52:	0acb8663          	beq	s7,a2,ffffffffc0209cfe <sfs_bmap_load_nolock+0x102>
ffffffffc0209c56:	4a01                	li	s4,0
ffffffffc0209c58:	40d4                	lw	a3,4(s1)
ffffffffc0209c5a:	8752                	mv	a4,s4
ffffffffc0209c5c:	00005617          	auipc	a2,0x5
ffffffffc0209c60:	32c60613          	addi	a2,a2,812 # ffffffffc020ef88 <dev_node_ops+0x5f0>
ffffffffc0209c64:	05300593          	li	a1,83
ffffffffc0209c68:	00005517          	auipc	a0,0x5
ffffffffc0209c6c:	2f050513          	addi	a0,a0,752 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209c70:	82ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209c74:	02061793          	slli	a5,a2,0x20
ffffffffc0209c78:	01e7da13          	srli	s4,a5,0x1e
ffffffffc0209c7c:	9a5a                	add	s4,s4,s6
ffffffffc0209c7e:	00ca2583          	lw	a1,12(s4)
ffffffffc0209c82:	c22e                	sw	a1,4(sp)
ffffffffc0209c84:	ed99                	bnez	a1,ffffffffc0209ca2 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209c86:	fccb98e3          	bne	s7,a2,ffffffffc0209c56 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209c8a:	004c                	addi	a1,sp,4
ffffffffc0209c8c:	ec9ff0ef          	jal	ra,ffffffffc0209b54 <sfs_block_alloc>
ffffffffc0209c90:	892a                	mv	s2,a0
ffffffffc0209c92:	e921                	bnez	a0,ffffffffc0209ce2 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c94:	4592                	lw	a1,4(sp)
ffffffffc0209c96:	4705                	li	a4,1
ffffffffc0209c98:	00ba2623          	sw	a1,12(s4)
ffffffffc0209c9c:	00eab823          	sd	a4,16(s5)
ffffffffc0209ca0:	d9dd                	beqz	a1,ffffffffc0209c56 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209ca2:	40d4                	lw	a3,4(s1)
ffffffffc0209ca4:	10d5ff63          	bgeu	a1,a3,ffffffffc0209dc2 <sfs_bmap_load_nolock+0x1c6>
ffffffffc0209ca8:	7c88                	ld	a0,56(s1)
ffffffffc0209caa:	b8aff0ef          	jal	ra,ffffffffc0209034 <bitmap_test>
ffffffffc0209cae:	18051363          	bnez	a0,ffffffffc0209e34 <sfs_bmap_load_nolock+0x238>
ffffffffc0209cb2:	4a12                	lw	s4,4(sp)
ffffffffc0209cb4:	fa0a02e3          	beqz	s4,ffffffffc0209c58 <sfs_bmap_load_nolock+0x5c>
ffffffffc0209cb8:	40dc                	lw	a5,4(s1)
ffffffffc0209cba:	f8fa7fe3          	bgeu	s4,a5,ffffffffc0209c58 <sfs_bmap_load_nolock+0x5c>
ffffffffc0209cbe:	7c88                	ld	a0,56(s1)
ffffffffc0209cc0:	85d2                	mv	a1,s4
ffffffffc0209cc2:	b72ff0ef          	jal	ra,ffffffffc0209034 <bitmap_test>
ffffffffc0209cc6:	12051763          	bnez	a0,ffffffffc0209df4 <sfs_bmap_load_nolock+0x1f8>
ffffffffc0209cca:	008b9763          	bne	s7,s0,ffffffffc0209cd8 <sfs_bmap_load_nolock+0xdc>
ffffffffc0209cce:	008b2783          	lw	a5,8(s6)
ffffffffc0209cd2:	2785                	addiw	a5,a5,1
ffffffffc0209cd4:	00fb2423          	sw	a5,8(s6)
ffffffffc0209cd8:	4901                	li	s2,0
ffffffffc0209cda:	00098463          	beqz	s3,ffffffffc0209ce2 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209cde:	0149a023          	sw	s4,0(s3)
ffffffffc0209ce2:	70a6                	ld	ra,104(sp)
ffffffffc0209ce4:	7406                	ld	s0,96(sp)
ffffffffc0209ce6:	64e6                	ld	s1,88(sp)
ffffffffc0209ce8:	69a6                	ld	s3,72(sp)
ffffffffc0209cea:	6a06                	ld	s4,64(sp)
ffffffffc0209cec:	7ae2                	ld	s5,56(sp)
ffffffffc0209cee:	7b42                	ld	s6,48(sp)
ffffffffc0209cf0:	7ba2                	ld	s7,40(sp)
ffffffffc0209cf2:	7c02                	ld	s8,32(sp)
ffffffffc0209cf4:	6ce2                	ld	s9,24(sp)
ffffffffc0209cf6:	854a                	mv	a0,s2
ffffffffc0209cf8:	6946                	ld	s2,80(sp)
ffffffffc0209cfa:	6165                	addi	sp,sp,112
ffffffffc0209cfc:	8082                	ret
ffffffffc0209cfe:	002c                	addi	a1,sp,8
ffffffffc0209d00:	e55ff0ef          	jal	ra,ffffffffc0209b54 <sfs_block_alloc>
ffffffffc0209d04:	892a                	mv	s2,a0
ffffffffc0209d06:	00c10c93          	addi	s9,sp,12
ffffffffc0209d0a:	fd61                	bnez	a0,ffffffffc0209ce2 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209d0c:	85e6                	mv	a1,s9
ffffffffc0209d0e:	8526                	mv	a0,s1
ffffffffc0209d10:	e45ff0ef          	jal	ra,ffffffffc0209b54 <sfs_block_alloc>
ffffffffc0209d14:	892a                	mv	s2,a0
ffffffffc0209d16:	e925                	bnez	a0,ffffffffc0209d86 <sfs_bmap_load_nolock+0x18a>
ffffffffc0209d18:	46a2                	lw	a3,8(sp)
ffffffffc0209d1a:	85e6                	mv	a1,s9
ffffffffc0209d1c:	8762                	mv	a4,s8
ffffffffc0209d1e:	4611                	li	a2,4
ffffffffc0209d20:	8526                	mv	a0,s1
ffffffffc0209d22:	09e010ef          	jal	ra,ffffffffc020adc0 <sfs_wbuf>
ffffffffc0209d26:	45b2                	lw	a1,12(sp)
ffffffffc0209d28:	892a                	mv	s2,a0
ffffffffc0209d2a:	e939                	bnez	a0,ffffffffc0209d80 <sfs_bmap_load_nolock+0x184>
ffffffffc0209d2c:	03cb2683          	lw	a3,60(s6)
ffffffffc0209d30:	4722                	lw	a4,8(sp)
ffffffffc0209d32:	c22e                	sw	a1,4(sp)
ffffffffc0209d34:	f6d706e3          	beq	a4,a3,ffffffffc0209ca0 <sfs_bmap_load_nolock+0xa4>
ffffffffc0209d38:	eef1                	bnez	a3,ffffffffc0209e14 <sfs_bmap_load_nolock+0x218>
ffffffffc0209d3a:	02eb2e23          	sw	a4,60(s6)
ffffffffc0209d3e:	4705                	li	a4,1
ffffffffc0209d40:	00eab823          	sd	a4,16(s5)
ffffffffc0209d44:	f00589e3          	beqz	a1,ffffffffc0209c56 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209d48:	bfa9                	j	ffffffffc0209ca2 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209d4a:	00c10c93          	addi	s9,sp,12
ffffffffc0209d4e:	8762                	mv	a4,s8
ffffffffc0209d50:	86d2                	mv	a3,s4
ffffffffc0209d52:	4611                	li	a2,4
ffffffffc0209d54:	85e6                	mv	a1,s9
ffffffffc0209d56:	7eb000ef          	jal	ra,ffffffffc020ad40 <sfs_rbuf>
ffffffffc0209d5a:	892a                	mv	s2,a0
ffffffffc0209d5c:	f159                	bnez	a0,ffffffffc0209ce2 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209d5e:	45b2                	lw	a1,12(sp)
ffffffffc0209d60:	e995                	bnez	a1,ffffffffc0209d94 <sfs_bmap_load_nolock+0x198>
ffffffffc0209d62:	fa8b85e3          	beq	s7,s0,ffffffffc0209d0c <sfs_bmap_load_nolock+0x110>
ffffffffc0209d66:	03cb2703          	lw	a4,60(s6)
ffffffffc0209d6a:	47a2                	lw	a5,8(sp)
ffffffffc0209d6c:	c202                	sw	zero,4(sp)
ffffffffc0209d6e:	eee784e3          	beq	a5,a4,ffffffffc0209c56 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209d72:	e34d                	bnez	a4,ffffffffc0209e14 <sfs_bmap_load_nolock+0x218>
ffffffffc0209d74:	02fb2e23          	sw	a5,60(s6)
ffffffffc0209d78:	4785                	li	a5,1
ffffffffc0209d7a:	00fab823          	sd	a5,16(s5)
ffffffffc0209d7e:	bde1                	j	ffffffffc0209c56 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209d80:	8526                	mv	a0,s1
ffffffffc0209d82:	bc1ff0ef          	jal	ra,ffffffffc0209942 <sfs_block_free>
ffffffffc0209d86:	45a2                	lw	a1,8(sp)
ffffffffc0209d88:	f4ba0de3          	beq	s4,a1,ffffffffc0209ce2 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209d8c:	8526                	mv	a0,s1
ffffffffc0209d8e:	bb5ff0ef          	jal	ra,ffffffffc0209942 <sfs_block_free>
ffffffffc0209d92:	bf81                	j	ffffffffc0209ce2 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209d94:	03cb2683          	lw	a3,60(s6)
ffffffffc0209d98:	4722                	lw	a4,8(sp)
ffffffffc0209d9a:	c22e                	sw	a1,4(sp)
ffffffffc0209d9c:	f8e69ee3          	bne	a3,a4,ffffffffc0209d38 <sfs_bmap_load_nolock+0x13c>
ffffffffc0209da0:	b709                	j	ffffffffc0209ca2 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209da2:	00005697          	auipc	a3,0x5
ffffffffc0209da6:	29e68693          	addi	a3,a3,670 # ffffffffc020f040 <dev_node_ops+0x6a8>
ffffffffc0209daa:	00002617          	auipc	a2,0x2
ffffffffc0209dae:	bfe60613          	addi	a2,a2,-1026 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209db2:	16400593          	li	a1,356
ffffffffc0209db6:	00005517          	auipc	a0,0x5
ffffffffc0209dba:	1a250513          	addi	a0,a0,418 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209dbe:	ee0f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209dc2:	872e                	mv	a4,a1
ffffffffc0209dc4:	00005617          	auipc	a2,0x5
ffffffffc0209dc8:	1c460613          	addi	a2,a2,452 # ffffffffc020ef88 <dev_node_ops+0x5f0>
ffffffffc0209dcc:	05300593          	li	a1,83
ffffffffc0209dd0:	00005517          	auipc	a0,0x5
ffffffffc0209dd4:	18850513          	addi	a0,a0,392 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209dd8:	ec6f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209ddc:	00005617          	auipc	a2,0x5
ffffffffc0209de0:	29460613          	addi	a2,a2,660 # ffffffffc020f070 <dev_node_ops+0x6d8>
ffffffffc0209de4:	11e00593          	li	a1,286
ffffffffc0209de8:	00005517          	auipc	a0,0x5
ffffffffc0209dec:	17050513          	addi	a0,a0,368 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209df0:	eaef60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209df4:	00005697          	auipc	a3,0x5
ffffffffc0209df8:	1cc68693          	addi	a3,a3,460 # ffffffffc020efc0 <dev_node_ops+0x628>
ffffffffc0209dfc:	00002617          	auipc	a2,0x2
ffffffffc0209e00:	bac60613          	addi	a2,a2,-1108 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209e04:	16b00593          	li	a1,363
ffffffffc0209e08:	00005517          	auipc	a0,0x5
ffffffffc0209e0c:	15050513          	addi	a0,a0,336 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209e10:	e8ef60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209e14:	00005697          	auipc	a3,0x5
ffffffffc0209e18:	24468693          	addi	a3,a3,580 # ffffffffc020f058 <dev_node_ops+0x6c0>
ffffffffc0209e1c:	00002617          	auipc	a2,0x2
ffffffffc0209e20:	b8c60613          	addi	a2,a2,-1140 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209e24:	11800593          	li	a1,280
ffffffffc0209e28:	00005517          	auipc	a0,0x5
ffffffffc0209e2c:	13050513          	addi	a0,a0,304 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209e30:	e6ef60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209e34:	00005697          	auipc	a3,0x5
ffffffffc0209e38:	26c68693          	addi	a3,a3,620 # ffffffffc020f0a0 <dev_node_ops+0x708>
ffffffffc0209e3c:	00002617          	auipc	a2,0x2
ffffffffc0209e40:	b6c60613          	addi	a2,a2,-1172 # ffffffffc020b9a8 <commands+0x210>
ffffffffc0209e44:	12100593          	li	a1,289
ffffffffc0209e48:	00005517          	auipc	a0,0x5
ffffffffc0209e4c:	11050513          	addi	a0,a0,272 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc0209e50:	e4ef60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209e54 <sfs_io_nolock>:
ffffffffc0209e54:	7135                	addi	sp,sp,-160
ffffffffc0209e56:	f8d2                	sd	s4,112(sp)
ffffffffc0209e58:	8a2e                	mv	s4,a1
ffffffffc0209e5a:	618c                	ld	a1,0(a1)
ffffffffc0209e5c:	ed06                	sd	ra,152(sp)
ffffffffc0209e5e:	e922                	sd	s0,144(sp)
ffffffffc0209e60:	0045d883          	lhu	a7,4(a1)
ffffffffc0209e64:	e526                	sd	s1,136(sp)
ffffffffc0209e66:	e14a                	sd	s2,128(sp)
ffffffffc0209e68:	fcce                	sd	s3,120(sp)
ffffffffc0209e6a:	f4d6                	sd	s5,104(sp)
ffffffffc0209e6c:	f0da                	sd	s6,96(sp)
ffffffffc0209e6e:	ecde                	sd	s7,88(sp)
ffffffffc0209e70:	e8e2                	sd	s8,80(sp)
ffffffffc0209e72:	e4e6                	sd	s9,72(sp)
ffffffffc0209e74:	e0ea                	sd	s10,64(sp)
ffffffffc0209e76:	fc6e                	sd	s11,56(sp)
ffffffffc0209e78:	4809                	li	a6,2
ffffffffc0209e7a:	19088e63          	beq	a7,a6,ffffffffc020a016 <sfs_io_nolock+0x1c2>
ffffffffc0209e7e:	00073a83          	ld	s5,0(a4) # 4000 <_binary_bin_swap_img_size-0x3d00>
ffffffffc0209e82:	8c3a                	mv	s8,a4
ffffffffc0209e84:	000c3023          	sd	zero,0(s8)
ffffffffc0209e88:	08000737          	lui	a4,0x8000
ffffffffc0209e8c:	84b6                	mv	s1,a3
ffffffffc0209e8e:	8bb6                	mv	s7,a3
ffffffffc0209e90:	9ab6                	add	s5,s5,a3
ffffffffc0209e92:	18e6f063          	bgeu	a3,a4,ffffffffc020a012 <sfs_io_nolock+0x1be>
ffffffffc0209e96:	16dace63          	blt	s5,a3,ffffffffc020a012 <sfs_io_nolock+0x1be>
ffffffffc0209e9a:	892a                	mv	s2,a0
ffffffffc0209e9c:	4501                	li	a0,0
ffffffffc0209e9e:	0d568963          	beq	a3,s5,ffffffffc0209f70 <sfs_io_nolock+0x11c>
ffffffffc0209ea2:	8432                	mv	s0,a2
ffffffffc0209ea4:	01577463          	bgeu	a4,s5,ffffffffc0209eac <sfs_io_nolock+0x58>
ffffffffc0209ea8:	08000ab7          	lui	s5,0x8000
ffffffffc0209eac:	c3ed                	beqz	a5,ffffffffc0209f8e <sfs_io_nolock+0x13a>
ffffffffc0209eae:	00001797          	auipc	a5,0x1
ffffffffc0209eb2:	f1278793          	addi	a5,a5,-238 # ffffffffc020adc0 <sfs_wbuf>
ffffffffc0209eb6:	00001c97          	auipc	s9,0x1
ffffffffc0209eba:	e2ac8c93          	addi	s9,s9,-470 # ffffffffc020ace0 <sfs_wblock>
ffffffffc0209ebe:	e43e                	sd	a5,8(sp)
ffffffffc0209ec0:	40c4d793          	srai	a5,s1,0xc
ffffffffc0209ec4:	40cadd13          	srai	s10,s5,0xc
ffffffffc0209ec8:	6705                	lui	a4,0x1
ffffffffc0209eca:	40fd08bb          	subw	a7,s10,a5
ffffffffc0209ece:	fff70b13          	addi	s6,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0209ed2:	00078d9b          	sext.w	s11,a5
ffffffffc0209ed6:	000d079b          	sext.w	a5,s10
ffffffffc0209eda:	0164fb33          	and	s6,s1,s6
ffffffffc0209ede:	e83e                	sd	a5,16(sp)
ffffffffc0209ee0:	00088d1b          	sext.w	s10,a7
ffffffffc0209ee4:	89da                	mv	s3,s6
ffffffffc0209ee6:	020b0d63          	beqz	s6,ffffffffc0209f20 <sfs_io_nolock+0xcc>
ffffffffc0209eea:	409a89b3          	sub	s3,s5,s1
ffffffffc0209eee:	0c0d1163          	bnez	s10,ffffffffc0209fb0 <sfs_io_nolock+0x15c>
ffffffffc0209ef2:	1074                	addi	a3,sp,44
ffffffffc0209ef4:	866e                	mv	a2,s11
ffffffffc0209ef6:	85d2                	mv	a1,s4
ffffffffc0209ef8:	854a                	mv	a0,s2
ffffffffc0209efa:	ce46                	sw	a7,28(sp)
ffffffffc0209efc:	d01ff0ef          	jal	ra,ffffffffc0209bfc <sfs_bmap_load_nolock>
ffffffffc0209f00:	e171                	bnez	a0,ffffffffc0209fc4 <sfs_io_nolock+0x170>
ffffffffc0209f02:	56b2                	lw	a3,44(sp)
ffffffffc0209f04:	67a2                	ld	a5,8(sp)
ffffffffc0209f06:	875a                	mv	a4,s6
ffffffffc0209f08:	864e                	mv	a2,s3
ffffffffc0209f0a:	85a2                	mv	a1,s0
ffffffffc0209f0c:	854a                	mv	a0,s2
ffffffffc0209f0e:	9782                	jalr	a5
ffffffffc0209f10:	e955                	bnez	a0,ffffffffc0209fc4 <sfs_io_nolock+0x170>
ffffffffc0209f12:	48f2                	lw	a7,28(sp)
ffffffffc0209f14:	020d0e63          	beqz	s10,ffffffffc0209f50 <sfs_io_nolock+0xfc>
ffffffffc0209f18:	944e                	add	s0,s0,s3
ffffffffc0209f1a:	2d85                	addiw	s11,s11,1
ffffffffc0209f1c:	fff88d1b          	addiw	s10,a7,-1
ffffffffc0209f20:	0a0d0f63          	beqz	s10,ffffffffc0209fde <sfs_io_nolock+0x18a>
ffffffffc0209f24:	01bd0bbb          	addw	s7,s10,s11
ffffffffc0209f28:	6b05                	lui	s6,0x1
ffffffffc0209f2a:	a821                	j	ffffffffc0209f42 <sfs_io_nolock+0xee>
ffffffffc0209f2c:	5632                	lw	a2,44(sp)
ffffffffc0209f2e:	4685                	li	a3,1
ffffffffc0209f30:	85a2                	mv	a1,s0
ffffffffc0209f32:	854a                	mv	a0,s2
ffffffffc0209f34:	9c82                	jalr	s9
ffffffffc0209f36:	ed09                	bnez	a0,ffffffffc0209f50 <sfs_io_nolock+0xfc>
ffffffffc0209f38:	2d85                	addiw	s11,s11,1
ffffffffc0209f3a:	99da                	add	s3,s3,s6
ffffffffc0209f3c:	945a                	add	s0,s0,s6
ffffffffc0209f3e:	0b7d8063          	beq	s11,s7,ffffffffc0209fde <sfs_io_nolock+0x18a>
ffffffffc0209f42:	1074                	addi	a3,sp,44
ffffffffc0209f44:	866e                	mv	a2,s11
ffffffffc0209f46:	85d2                	mv	a1,s4
ffffffffc0209f48:	854a                	mv	a0,s2
ffffffffc0209f4a:	cb3ff0ef          	jal	ra,ffffffffc0209bfc <sfs_bmap_load_nolock>
ffffffffc0209f4e:	dd79                	beqz	a0,ffffffffc0209f2c <sfs_io_nolock+0xd8>
ffffffffc0209f50:	01348bb3          	add	s7,s1,s3
ffffffffc0209f54:	000a3783          	ld	a5,0(s4)
ffffffffc0209f58:	013c3023          	sd	s3,0(s8)
ffffffffc0209f5c:	0007e703          	lwu	a4,0(a5)
ffffffffc0209f60:	01777863          	bgeu	a4,s7,ffffffffc0209f70 <sfs_io_nolock+0x11c>
ffffffffc0209f64:	013484bb          	addw	s1,s1,s3
ffffffffc0209f68:	c384                	sw	s1,0(a5)
ffffffffc0209f6a:	4785                	li	a5,1
ffffffffc0209f6c:	00fa3823          	sd	a5,16(s4)
ffffffffc0209f70:	60ea                	ld	ra,152(sp)
ffffffffc0209f72:	644a                	ld	s0,144(sp)
ffffffffc0209f74:	64aa                	ld	s1,136(sp)
ffffffffc0209f76:	690a                	ld	s2,128(sp)
ffffffffc0209f78:	79e6                	ld	s3,120(sp)
ffffffffc0209f7a:	7a46                	ld	s4,112(sp)
ffffffffc0209f7c:	7aa6                	ld	s5,104(sp)
ffffffffc0209f7e:	7b06                	ld	s6,96(sp)
ffffffffc0209f80:	6be6                	ld	s7,88(sp)
ffffffffc0209f82:	6c46                	ld	s8,80(sp)
ffffffffc0209f84:	6ca6                	ld	s9,72(sp)
ffffffffc0209f86:	6d06                	ld	s10,64(sp)
ffffffffc0209f88:	7de2                	ld	s11,56(sp)
ffffffffc0209f8a:	610d                	addi	sp,sp,160
ffffffffc0209f8c:	8082                	ret
ffffffffc0209f8e:	0005e783          	lwu	a5,0(a1)
ffffffffc0209f92:	4501                	li	a0,0
ffffffffc0209f94:	fcf4dee3          	bge	s1,a5,ffffffffc0209f70 <sfs_io_nolock+0x11c>
ffffffffc0209f98:	0357c863          	blt	a5,s5,ffffffffc0209fc8 <sfs_io_nolock+0x174>
ffffffffc0209f9c:	00001797          	auipc	a5,0x1
ffffffffc0209fa0:	da478793          	addi	a5,a5,-604 # ffffffffc020ad40 <sfs_rbuf>
ffffffffc0209fa4:	00001c97          	auipc	s9,0x1
ffffffffc0209fa8:	cdcc8c93          	addi	s9,s9,-804 # ffffffffc020ac80 <sfs_rblock>
ffffffffc0209fac:	e43e                	sd	a5,8(sp)
ffffffffc0209fae:	bf09                	j	ffffffffc0209ec0 <sfs_io_nolock+0x6c>
ffffffffc0209fb0:	1074                	addi	a3,sp,44
ffffffffc0209fb2:	866e                	mv	a2,s11
ffffffffc0209fb4:	85d2                	mv	a1,s4
ffffffffc0209fb6:	854a                	mv	a0,s2
ffffffffc0209fb8:	416709b3          	sub	s3,a4,s6
ffffffffc0209fbc:	ce46                	sw	a7,28(sp)
ffffffffc0209fbe:	c3fff0ef          	jal	ra,ffffffffc0209bfc <sfs_bmap_load_nolock>
ffffffffc0209fc2:	d121                	beqz	a0,ffffffffc0209f02 <sfs_io_nolock+0xae>
ffffffffc0209fc4:	4981                	li	s3,0
ffffffffc0209fc6:	b779                	j	ffffffffc0209f54 <sfs_io_nolock+0x100>
ffffffffc0209fc8:	8abe                	mv	s5,a5
ffffffffc0209fca:	00001797          	auipc	a5,0x1
ffffffffc0209fce:	d7678793          	addi	a5,a5,-650 # ffffffffc020ad40 <sfs_rbuf>
ffffffffc0209fd2:	00001c97          	auipc	s9,0x1
ffffffffc0209fd6:	caec8c93          	addi	s9,s9,-850 # ffffffffc020ac80 <sfs_rblock>
ffffffffc0209fda:	e43e                	sd	a5,8(sp)
ffffffffc0209fdc:	b5d5                	j	ffffffffc0209ec0 <sfs_io_nolock+0x6c>
ffffffffc0209fde:	1ad2                	slli	s5,s5,0x34
ffffffffc0209fe0:	034adb13          	srli	s6,s5,0x34
ffffffffc0209fe4:	000a9663          	bnez	s5,ffffffffc0209ff0 <sfs_io_nolock+0x19c>
ffffffffc0209fe8:	01348bb3          	add	s7,s1,s3
ffffffffc0209fec:	4501                	li	a0,0
ffffffffc0209fee:	b79d                	j	ffffffffc0209f54 <sfs_io_nolock+0x100>
ffffffffc0209ff0:	6642                	ld	a2,16(sp)
ffffffffc0209ff2:	1074                	addi	a3,sp,44
ffffffffc0209ff4:	85d2                	mv	a1,s4
ffffffffc0209ff6:	854a                	mv	a0,s2
ffffffffc0209ff8:	c05ff0ef          	jal	ra,ffffffffc0209bfc <sfs_bmap_load_nolock>
ffffffffc0209ffc:	f931                	bnez	a0,ffffffffc0209f50 <sfs_io_nolock+0xfc>
ffffffffc0209ffe:	56b2                	lw	a3,44(sp)
ffffffffc020a000:	67a2                	ld	a5,8(sp)
ffffffffc020a002:	4701                	li	a4,0
ffffffffc020a004:	865a                	mv	a2,s6
ffffffffc020a006:	85a2                	mv	a1,s0
ffffffffc020a008:	854a                	mv	a0,s2
ffffffffc020a00a:	9782                	jalr	a5
ffffffffc020a00c:	f131                	bnez	a0,ffffffffc0209f50 <sfs_io_nolock+0xfc>
ffffffffc020a00e:	99da                	add	s3,s3,s6
ffffffffc020a010:	b781                	j	ffffffffc0209f50 <sfs_io_nolock+0xfc>
ffffffffc020a012:	5575                	li	a0,-3
ffffffffc020a014:	bfb1                	j	ffffffffc0209f70 <sfs_io_nolock+0x11c>
ffffffffc020a016:	00005697          	auipc	a3,0x5
ffffffffc020a01a:	0b268693          	addi	a3,a3,178 # ffffffffc020f0c8 <dev_node_ops+0x730>
ffffffffc020a01e:	00002617          	auipc	a2,0x2
ffffffffc020a022:	98a60613          	addi	a2,a2,-1654 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a026:	22b00593          	li	a1,555
ffffffffc020a02a:	00005517          	auipc	a0,0x5
ffffffffc020a02e:	f2e50513          	addi	a0,a0,-210 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a032:	c6cf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a036 <sfs_read>:
ffffffffc020a036:	7139                	addi	sp,sp,-64
ffffffffc020a038:	f04a                	sd	s2,32(sp)
ffffffffc020a03a:	06853903          	ld	s2,104(a0)
ffffffffc020a03e:	fc06                	sd	ra,56(sp)
ffffffffc020a040:	f822                	sd	s0,48(sp)
ffffffffc020a042:	f426                	sd	s1,40(sp)
ffffffffc020a044:	ec4e                	sd	s3,24(sp)
ffffffffc020a046:	04090f63          	beqz	s2,ffffffffc020a0a4 <sfs_read+0x6e>
ffffffffc020a04a:	0b092783          	lw	a5,176(s2)
ffffffffc020a04e:	ebb9                	bnez	a5,ffffffffc020a0a4 <sfs_read+0x6e>
ffffffffc020a050:	4d38                	lw	a4,88(a0)
ffffffffc020a052:	6785                	lui	a5,0x1
ffffffffc020a054:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a058:	842a                	mv	s0,a0
ffffffffc020a05a:	06f71563          	bne	a4,a5,ffffffffc020a0c4 <sfs_read+0x8e>
ffffffffc020a05e:	02050993          	addi	s3,a0,32
ffffffffc020a062:	854e                	mv	a0,s3
ffffffffc020a064:	84ae                	mv	s1,a1
ffffffffc020a066:	cfefa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a06a:	0184b803          	ld	a6,24(s1)
ffffffffc020a06e:	6494                	ld	a3,8(s1)
ffffffffc020a070:	6090                	ld	a2,0(s1)
ffffffffc020a072:	85a2                	mv	a1,s0
ffffffffc020a074:	4781                	li	a5,0
ffffffffc020a076:	0038                	addi	a4,sp,8
ffffffffc020a078:	854a                	mv	a0,s2
ffffffffc020a07a:	e442                	sd	a6,8(sp)
ffffffffc020a07c:	dd9ff0ef          	jal	ra,ffffffffc0209e54 <sfs_io_nolock>
ffffffffc020a080:	65a2                	ld	a1,8(sp)
ffffffffc020a082:	842a                	mv	s0,a0
ffffffffc020a084:	ed81                	bnez	a1,ffffffffc020a09c <sfs_read+0x66>
ffffffffc020a086:	854e                	mv	a0,s3
ffffffffc020a088:	cd8fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a08c:	70e2                	ld	ra,56(sp)
ffffffffc020a08e:	8522                	mv	a0,s0
ffffffffc020a090:	7442                	ld	s0,48(sp)
ffffffffc020a092:	74a2                	ld	s1,40(sp)
ffffffffc020a094:	7902                	ld	s2,32(sp)
ffffffffc020a096:	69e2                	ld	s3,24(sp)
ffffffffc020a098:	6121                	addi	sp,sp,64
ffffffffc020a09a:	8082                	ret
ffffffffc020a09c:	8526                	mv	a0,s1
ffffffffc020a09e:	bbafb0ef          	jal	ra,ffffffffc0205458 <iobuf_skip>
ffffffffc020a0a2:	b7d5                	j	ffffffffc020a086 <sfs_read+0x50>
ffffffffc020a0a4:	00005697          	auipc	a3,0x5
ffffffffc020a0a8:	cd468693          	addi	a3,a3,-812 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc020a0ac:	00002617          	auipc	a2,0x2
ffffffffc020a0b0:	8fc60613          	addi	a2,a2,-1796 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a0b4:	29400593          	li	a1,660
ffffffffc020a0b8:	00005517          	auipc	a0,0x5
ffffffffc020a0bc:	ea050513          	addi	a0,a0,-352 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a0c0:	bdef60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a0c4:	85bff0ef          	jal	ra,ffffffffc020991e <sfs_io.part.0>

ffffffffc020a0c8 <sfs_write>:
ffffffffc020a0c8:	7139                	addi	sp,sp,-64
ffffffffc020a0ca:	f04a                	sd	s2,32(sp)
ffffffffc020a0cc:	06853903          	ld	s2,104(a0)
ffffffffc020a0d0:	fc06                	sd	ra,56(sp)
ffffffffc020a0d2:	f822                	sd	s0,48(sp)
ffffffffc020a0d4:	f426                	sd	s1,40(sp)
ffffffffc020a0d6:	ec4e                	sd	s3,24(sp)
ffffffffc020a0d8:	04090f63          	beqz	s2,ffffffffc020a136 <sfs_write+0x6e>
ffffffffc020a0dc:	0b092783          	lw	a5,176(s2)
ffffffffc020a0e0:	ebb9                	bnez	a5,ffffffffc020a136 <sfs_write+0x6e>
ffffffffc020a0e2:	4d38                	lw	a4,88(a0)
ffffffffc020a0e4:	6785                	lui	a5,0x1
ffffffffc020a0e6:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a0ea:	842a                	mv	s0,a0
ffffffffc020a0ec:	06f71563          	bne	a4,a5,ffffffffc020a156 <sfs_write+0x8e>
ffffffffc020a0f0:	02050993          	addi	s3,a0,32
ffffffffc020a0f4:	854e                	mv	a0,s3
ffffffffc020a0f6:	84ae                	mv	s1,a1
ffffffffc020a0f8:	c6cfa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a0fc:	0184b803          	ld	a6,24(s1)
ffffffffc020a100:	6494                	ld	a3,8(s1)
ffffffffc020a102:	6090                	ld	a2,0(s1)
ffffffffc020a104:	85a2                	mv	a1,s0
ffffffffc020a106:	4785                	li	a5,1
ffffffffc020a108:	0038                	addi	a4,sp,8
ffffffffc020a10a:	854a                	mv	a0,s2
ffffffffc020a10c:	e442                	sd	a6,8(sp)
ffffffffc020a10e:	d47ff0ef          	jal	ra,ffffffffc0209e54 <sfs_io_nolock>
ffffffffc020a112:	65a2                	ld	a1,8(sp)
ffffffffc020a114:	842a                	mv	s0,a0
ffffffffc020a116:	ed81                	bnez	a1,ffffffffc020a12e <sfs_write+0x66>
ffffffffc020a118:	854e                	mv	a0,s3
ffffffffc020a11a:	c46fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a11e:	70e2                	ld	ra,56(sp)
ffffffffc020a120:	8522                	mv	a0,s0
ffffffffc020a122:	7442                	ld	s0,48(sp)
ffffffffc020a124:	74a2                	ld	s1,40(sp)
ffffffffc020a126:	7902                	ld	s2,32(sp)
ffffffffc020a128:	69e2                	ld	s3,24(sp)
ffffffffc020a12a:	6121                	addi	sp,sp,64
ffffffffc020a12c:	8082                	ret
ffffffffc020a12e:	8526                	mv	a0,s1
ffffffffc020a130:	b28fb0ef          	jal	ra,ffffffffc0205458 <iobuf_skip>
ffffffffc020a134:	b7d5                	j	ffffffffc020a118 <sfs_write+0x50>
ffffffffc020a136:	00005697          	auipc	a3,0x5
ffffffffc020a13a:	c4268693          	addi	a3,a3,-958 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc020a13e:	00002617          	auipc	a2,0x2
ffffffffc020a142:	86a60613          	addi	a2,a2,-1942 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a146:	29400593          	li	a1,660
ffffffffc020a14a:	00005517          	auipc	a0,0x5
ffffffffc020a14e:	e0e50513          	addi	a0,a0,-498 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a152:	b4cf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a156:	fc8ff0ef          	jal	ra,ffffffffc020991e <sfs_io.part.0>

ffffffffc020a15a <sfs_dirent_read_nolock>:
ffffffffc020a15a:	6198                	ld	a4,0(a1)
ffffffffc020a15c:	7179                	addi	sp,sp,-48
ffffffffc020a15e:	f406                	sd	ra,40(sp)
ffffffffc020a160:	00475883          	lhu	a7,4(a4)
ffffffffc020a164:	f022                	sd	s0,32(sp)
ffffffffc020a166:	ec26                	sd	s1,24(sp)
ffffffffc020a168:	4809                	li	a6,2
ffffffffc020a16a:	05089b63          	bne	a7,a6,ffffffffc020a1c0 <sfs_dirent_read_nolock+0x66>
ffffffffc020a16e:	4718                	lw	a4,8(a4)
ffffffffc020a170:	87b2                	mv	a5,a2
ffffffffc020a172:	2601                	sext.w	a2,a2
ffffffffc020a174:	04e7f663          	bgeu	a5,a4,ffffffffc020a1c0 <sfs_dirent_read_nolock+0x66>
ffffffffc020a178:	84b6                	mv	s1,a3
ffffffffc020a17a:	0074                	addi	a3,sp,12
ffffffffc020a17c:	842a                	mv	s0,a0
ffffffffc020a17e:	a7fff0ef          	jal	ra,ffffffffc0209bfc <sfs_bmap_load_nolock>
ffffffffc020a182:	c511                	beqz	a0,ffffffffc020a18e <sfs_dirent_read_nolock+0x34>
ffffffffc020a184:	70a2                	ld	ra,40(sp)
ffffffffc020a186:	7402                	ld	s0,32(sp)
ffffffffc020a188:	64e2                	ld	s1,24(sp)
ffffffffc020a18a:	6145                	addi	sp,sp,48
ffffffffc020a18c:	8082                	ret
ffffffffc020a18e:	45b2                	lw	a1,12(sp)
ffffffffc020a190:	4054                	lw	a3,4(s0)
ffffffffc020a192:	c5b9                	beqz	a1,ffffffffc020a1e0 <sfs_dirent_read_nolock+0x86>
ffffffffc020a194:	04d5f663          	bgeu	a1,a3,ffffffffc020a1e0 <sfs_dirent_read_nolock+0x86>
ffffffffc020a198:	7c08                	ld	a0,56(s0)
ffffffffc020a19a:	e9bfe0ef          	jal	ra,ffffffffc0209034 <bitmap_test>
ffffffffc020a19e:	ed31                	bnez	a0,ffffffffc020a1fa <sfs_dirent_read_nolock+0xa0>
ffffffffc020a1a0:	46b2                	lw	a3,12(sp)
ffffffffc020a1a2:	4701                	li	a4,0
ffffffffc020a1a4:	10400613          	li	a2,260
ffffffffc020a1a8:	85a6                	mv	a1,s1
ffffffffc020a1aa:	8522                	mv	a0,s0
ffffffffc020a1ac:	395000ef          	jal	ra,ffffffffc020ad40 <sfs_rbuf>
ffffffffc020a1b0:	f971                	bnez	a0,ffffffffc020a184 <sfs_dirent_read_nolock+0x2a>
ffffffffc020a1b2:	100481a3          	sb	zero,259(s1)
ffffffffc020a1b6:	70a2                	ld	ra,40(sp)
ffffffffc020a1b8:	7402                	ld	s0,32(sp)
ffffffffc020a1ba:	64e2                	ld	s1,24(sp)
ffffffffc020a1bc:	6145                	addi	sp,sp,48
ffffffffc020a1be:	8082                	ret
ffffffffc020a1c0:	00005697          	auipc	a3,0x5
ffffffffc020a1c4:	f2868693          	addi	a3,a3,-216 # ffffffffc020f0e8 <dev_node_ops+0x750>
ffffffffc020a1c8:	00001617          	auipc	a2,0x1
ffffffffc020a1cc:	7e060613          	addi	a2,a2,2016 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a1d0:	18e00593          	li	a1,398
ffffffffc020a1d4:	00005517          	auipc	a0,0x5
ffffffffc020a1d8:	d8450513          	addi	a0,a0,-636 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a1dc:	ac2f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a1e0:	872e                	mv	a4,a1
ffffffffc020a1e2:	00005617          	auipc	a2,0x5
ffffffffc020a1e6:	da660613          	addi	a2,a2,-602 # ffffffffc020ef88 <dev_node_ops+0x5f0>
ffffffffc020a1ea:	05300593          	li	a1,83
ffffffffc020a1ee:	00005517          	auipc	a0,0x5
ffffffffc020a1f2:	d6a50513          	addi	a0,a0,-662 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a1f6:	aa8f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a1fa:	00005697          	auipc	a3,0x5
ffffffffc020a1fe:	dc668693          	addi	a3,a3,-570 # ffffffffc020efc0 <dev_node_ops+0x628>
ffffffffc020a202:	00001617          	auipc	a2,0x1
ffffffffc020a206:	7a660613          	addi	a2,a2,1958 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a20a:	19500593          	li	a1,405
ffffffffc020a20e:	00005517          	auipc	a0,0x5
ffffffffc020a212:	d4a50513          	addi	a0,a0,-694 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a216:	a88f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a21a <sfs_getdirentry>:
ffffffffc020a21a:	715d                	addi	sp,sp,-80
ffffffffc020a21c:	ec56                	sd	s5,24(sp)
ffffffffc020a21e:	8aaa                	mv	s5,a0
ffffffffc020a220:	10400513          	li	a0,260
ffffffffc020a224:	e85a                	sd	s6,16(sp)
ffffffffc020a226:	e486                	sd	ra,72(sp)
ffffffffc020a228:	e0a2                	sd	s0,64(sp)
ffffffffc020a22a:	fc26                	sd	s1,56(sp)
ffffffffc020a22c:	f84a                	sd	s2,48(sp)
ffffffffc020a22e:	f44e                	sd	s3,40(sp)
ffffffffc020a230:	f052                	sd	s4,32(sp)
ffffffffc020a232:	e45e                	sd	s7,8(sp)
ffffffffc020a234:	e062                	sd	s8,0(sp)
ffffffffc020a236:	8b2e                	mv	s6,a1
ffffffffc020a238:	d57f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a23c:	cd61                	beqz	a0,ffffffffc020a314 <sfs_getdirentry+0xfa>
ffffffffc020a23e:	068abb83          	ld	s7,104(s5) # 8000068 <_binary_bin_sfs_img_size+0x7f8ad68>
ffffffffc020a242:	0c0b8b63          	beqz	s7,ffffffffc020a318 <sfs_getdirentry+0xfe>
ffffffffc020a246:	0b0ba783          	lw	a5,176(s7) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a24a:	e7f9                	bnez	a5,ffffffffc020a318 <sfs_getdirentry+0xfe>
ffffffffc020a24c:	058aa703          	lw	a4,88(s5)
ffffffffc020a250:	6785                	lui	a5,0x1
ffffffffc020a252:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a256:	0ef71163          	bne	a4,a5,ffffffffc020a338 <sfs_getdirentry+0x11e>
ffffffffc020a25a:	008b3983          	ld	s3,8(s6) # 1008 <_binary_bin_swap_img_size-0x6cf8>
ffffffffc020a25e:	892a                	mv	s2,a0
ffffffffc020a260:	0a09c163          	bltz	s3,ffffffffc020a302 <sfs_getdirentry+0xe8>
ffffffffc020a264:	0ff9f793          	zext.b	a5,s3
ffffffffc020a268:	efc9                	bnez	a5,ffffffffc020a302 <sfs_getdirentry+0xe8>
ffffffffc020a26a:	000ab783          	ld	a5,0(s5)
ffffffffc020a26e:	0089d993          	srli	s3,s3,0x8
ffffffffc020a272:	2981                	sext.w	s3,s3
ffffffffc020a274:	479c                	lw	a5,8(a5)
ffffffffc020a276:	0937eb63          	bltu	a5,s3,ffffffffc020a30c <sfs_getdirentry+0xf2>
ffffffffc020a27a:	020a8c13          	addi	s8,s5,32
ffffffffc020a27e:	8562                	mv	a0,s8
ffffffffc020a280:	ae4fa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a284:	000ab783          	ld	a5,0(s5)
ffffffffc020a288:	0087aa03          	lw	s4,8(a5)
ffffffffc020a28c:	07405663          	blez	s4,ffffffffc020a2f8 <sfs_getdirentry+0xde>
ffffffffc020a290:	4481                	li	s1,0
ffffffffc020a292:	a811                	j	ffffffffc020a2a6 <sfs_getdirentry+0x8c>
ffffffffc020a294:	00092783          	lw	a5,0(s2)
ffffffffc020a298:	c781                	beqz	a5,ffffffffc020a2a0 <sfs_getdirentry+0x86>
ffffffffc020a29a:	02098263          	beqz	s3,ffffffffc020a2be <sfs_getdirentry+0xa4>
ffffffffc020a29e:	39fd                	addiw	s3,s3,-1
ffffffffc020a2a0:	2485                	addiw	s1,s1,1
ffffffffc020a2a2:	049a0b63          	beq	s4,s1,ffffffffc020a2f8 <sfs_getdirentry+0xde>
ffffffffc020a2a6:	86ca                	mv	a3,s2
ffffffffc020a2a8:	8626                	mv	a2,s1
ffffffffc020a2aa:	85d6                	mv	a1,s5
ffffffffc020a2ac:	855e                	mv	a0,s7
ffffffffc020a2ae:	eadff0ef          	jal	ra,ffffffffc020a15a <sfs_dirent_read_nolock>
ffffffffc020a2b2:	842a                	mv	s0,a0
ffffffffc020a2b4:	d165                	beqz	a0,ffffffffc020a294 <sfs_getdirentry+0x7a>
ffffffffc020a2b6:	8562                	mv	a0,s8
ffffffffc020a2b8:	aa8fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a2bc:	a831                	j	ffffffffc020a2d8 <sfs_getdirentry+0xbe>
ffffffffc020a2be:	8562                	mv	a0,s8
ffffffffc020a2c0:	aa0fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a2c4:	4701                	li	a4,0
ffffffffc020a2c6:	4685                	li	a3,1
ffffffffc020a2c8:	10000613          	li	a2,256
ffffffffc020a2cc:	00490593          	addi	a1,s2,4
ffffffffc020a2d0:	855a                	mv	a0,s6
ffffffffc020a2d2:	91afb0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc020a2d6:	842a                	mv	s0,a0
ffffffffc020a2d8:	854a                	mv	a0,s2
ffffffffc020a2da:	d65f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a2de:	60a6                	ld	ra,72(sp)
ffffffffc020a2e0:	8522                	mv	a0,s0
ffffffffc020a2e2:	6406                	ld	s0,64(sp)
ffffffffc020a2e4:	74e2                	ld	s1,56(sp)
ffffffffc020a2e6:	7942                	ld	s2,48(sp)
ffffffffc020a2e8:	79a2                	ld	s3,40(sp)
ffffffffc020a2ea:	7a02                	ld	s4,32(sp)
ffffffffc020a2ec:	6ae2                	ld	s5,24(sp)
ffffffffc020a2ee:	6b42                	ld	s6,16(sp)
ffffffffc020a2f0:	6ba2                	ld	s7,8(sp)
ffffffffc020a2f2:	6c02                	ld	s8,0(sp)
ffffffffc020a2f4:	6161                	addi	sp,sp,80
ffffffffc020a2f6:	8082                	ret
ffffffffc020a2f8:	8562                	mv	a0,s8
ffffffffc020a2fa:	5441                	li	s0,-16
ffffffffc020a2fc:	a64fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a300:	bfe1                	j	ffffffffc020a2d8 <sfs_getdirentry+0xbe>
ffffffffc020a302:	854a                	mv	a0,s2
ffffffffc020a304:	d3bf70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a308:	5475                	li	s0,-3
ffffffffc020a30a:	bfd1                	j	ffffffffc020a2de <sfs_getdirentry+0xc4>
ffffffffc020a30c:	d33f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a310:	5441                	li	s0,-16
ffffffffc020a312:	b7f1                	j	ffffffffc020a2de <sfs_getdirentry+0xc4>
ffffffffc020a314:	5471                	li	s0,-4
ffffffffc020a316:	b7e1                	j	ffffffffc020a2de <sfs_getdirentry+0xc4>
ffffffffc020a318:	00005697          	auipc	a3,0x5
ffffffffc020a31c:	a6068693          	addi	a3,a3,-1440 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc020a320:	00001617          	auipc	a2,0x1
ffffffffc020a324:	68860613          	addi	a2,a2,1672 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a328:	33800593          	li	a1,824
ffffffffc020a32c:	00005517          	auipc	a0,0x5
ffffffffc020a330:	c2c50513          	addi	a0,a0,-980 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a334:	96af60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a338:	00005697          	auipc	a3,0x5
ffffffffc020a33c:	be868693          	addi	a3,a3,-1048 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc020a340:	00001617          	auipc	a2,0x1
ffffffffc020a344:	66860613          	addi	a2,a2,1640 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a348:	33900593          	li	a1,825
ffffffffc020a34c:	00005517          	auipc	a0,0x5
ffffffffc020a350:	c0c50513          	addi	a0,a0,-1012 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a354:	94af60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a358 <sfs_dirent_search_nolock.constprop.0>:
ffffffffc020a358:	715d                	addi	sp,sp,-80
ffffffffc020a35a:	f052                	sd	s4,32(sp)
ffffffffc020a35c:	8a2a                	mv	s4,a0
ffffffffc020a35e:	8532                	mv	a0,a2
ffffffffc020a360:	f44e                	sd	s3,40(sp)
ffffffffc020a362:	e85a                	sd	s6,16(sp)
ffffffffc020a364:	e45e                	sd	s7,8(sp)
ffffffffc020a366:	e486                	sd	ra,72(sp)
ffffffffc020a368:	e0a2                	sd	s0,64(sp)
ffffffffc020a36a:	fc26                	sd	s1,56(sp)
ffffffffc020a36c:	f84a                	sd	s2,48(sp)
ffffffffc020a36e:	ec56                	sd	s5,24(sp)
ffffffffc020a370:	e062                	sd	s8,0(sp)
ffffffffc020a372:	8b32                	mv	s6,a2
ffffffffc020a374:	89ae                	mv	s3,a1
ffffffffc020a376:	8bb6                	mv	s7,a3
ffffffffc020a378:	0aa010ef          	jal	ra,ffffffffc020b422 <strlen>
ffffffffc020a37c:	0ff00793          	li	a5,255
ffffffffc020a380:	06a7ef63          	bltu	a5,a0,ffffffffc020a3fe <sfs_dirent_search_nolock.constprop.0+0xa6>
ffffffffc020a384:	10400513          	li	a0,260
ffffffffc020a388:	c07f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a38c:	892a                	mv	s2,a0
ffffffffc020a38e:	c535                	beqz	a0,ffffffffc020a3fa <sfs_dirent_search_nolock.constprop.0+0xa2>
ffffffffc020a390:	0009b783          	ld	a5,0(s3)
ffffffffc020a394:	0087aa83          	lw	s5,8(a5)
ffffffffc020a398:	05505a63          	blez	s5,ffffffffc020a3ec <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a39c:	4481                	li	s1,0
ffffffffc020a39e:	00450c13          	addi	s8,a0,4
ffffffffc020a3a2:	a829                	j	ffffffffc020a3bc <sfs_dirent_search_nolock.constprop.0+0x64>
ffffffffc020a3a4:	00092783          	lw	a5,0(s2)
ffffffffc020a3a8:	c799                	beqz	a5,ffffffffc020a3b6 <sfs_dirent_search_nolock.constprop.0+0x5e>
ffffffffc020a3aa:	85e2                	mv	a1,s8
ffffffffc020a3ac:	855a                	mv	a0,s6
ffffffffc020a3ae:	0bc010ef          	jal	ra,ffffffffc020b46a <strcmp>
ffffffffc020a3b2:	842a                	mv	s0,a0
ffffffffc020a3b4:	cd15                	beqz	a0,ffffffffc020a3f0 <sfs_dirent_search_nolock.constprop.0+0x98>
ffffffffc020a3b6:	2485                	addiw	s1,s1,1
ffffffffc020a3b8:	029a8a63          	beq	s5,s1,ffffffffc020a3ec <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a3bc:	86ca                	mv	a3,s2
ffffffffc020a3be:	8626                	mv	a2,s1
ffffffffc020a3c0:	85ce                	mv	a1,s3
ffffffffc020a3c2:	8552                	mv	a0,s4
ffffffffc020a3c4:	d97ff0ef          	jal	ra,ffffffffc020a15a <sfs_dirent_read_nolock>
ffffffffc020a3c8:	842a                	mv	s0,a0
ffffffffc020a3ca:	dd69                	beqz	a0,ffffffffc020a3a4 <sfs_dirent_search_nolock.constprop.0+0x4c>
ffffffffc020a3cc:	854a                	mv	a0,s2
ffffffffc020a3ce:	c71f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a3d2:	60a6                	ld	ra,72(sp)
ffffffffc020a3d4:	8522                	mv	a0,s0
ffffffffc020a3d6:	6406                	ld	s0,64(sp)
ffffffffc020a3d8:	74e2                	ld	s1,56(sp)
ffffffffc020a3da:	7942                	ld	s2,48(sp)
ffffffffc020a3dc:	79a2                	ld	s3,40(sp)
ffffffffc020a3de:	7a02                	ld	s4,32(sp)
ffffffffc020a3e0:	6ae2                	ld	s5,24(sp)
ffffffffc020a3e2:	6b42                	ld	s6,16(sp)
ffffffffc020a3e4:	6ba2                	ld	s7,8(sp)
ffffffffc020a3e6:	6c02                	ld	s8,0(sp)
ffffffffc020a3e8:	6161                	addi	sp,sp,80
ffffffffc020a3ea:	8082                	ret
ffffffffc020a3ec:	5441                	li	s0,-16
ffffffffc020a3ee:	bff9                	j	ffffffffc020a3cc <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a3f0:	00092783          	lw	a5,0(s2)
ffffffffc020a3f4:	00fba023          	sw	a5,0(s7)
ffffffffc020a3f8:	bfd1                	j	ffffffffc020a3cc <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a3fa:	5471                	li	s0,-4
ffffffffc020a3fc:	bfd9                	j	ffffffffc020a3d2 <sfs_dirent_search_nolock.constprop.0+0x7a>
ffffffffc020a3fe:	00005697          	auipc	a3,0x5
ffffffffc020a402:	d3a68693          	addi	a3,a3,-710 # ffffffffc020f138 <dev_node_ops+0x7a0>
ffffffffc020a406:	00001617          	auipc	a2,0x1
ffffffffc020a40a:	5a260613          	addi	a2,a2,1442 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a40e:	1ba00593          	li	a1,442
ffffffffc020a412:	00005517          	auipc	a0,0x5
ffffffffc020a416:	b4650513          	addi	a0,a0,-1210 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a41a:	884f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a41e <sfs_truncfile>:
ffffffffc020a41e:	7175                	addi	sp,sp,-144
ffffffffc020a420:	e506                	sd	ra,136(sp)
ffffffffc020a422:	e122                	sd	s0,128(sp)
ffffffffc020a424:	fca6                	sd	s1,120(sp)
ffffffffc020a426:	f8ca                	sd	s2,112(sp)
ffffffffc020a428:	f4ce                	sd	s3,104(sp)
ffffffffc020a42a:	f0d2                	sd	s4,96(sp)
ffffffffc020a42c:	ecd6                	sd	s5,88(sp)
ffffffffc020a42e:	e8da                	sd	s6,80(sp)
ffffffffc020a430:	e4de                	sd	s7,72(sp)
ffffffffc020a432:	e0e2                	sd	s8,64(sp)
ffffffffc020a434:	fc66                	sd	s9,56(sp)
ffffffffc020a436:	f86a                	sd	s10,48(sp)
ffffffffc020a438:	f46e                	sd	s11,40(sp)
ffffffffc020a43a:	080007b7          	lui	a5,0x8000
ffffffffc020a43e:	16b7e463          	bltu	a5,a1,ffffffffc020a5a6 <sfs_truncfile+0x188>
ffffffffc020a442:	06853c83          	ld	s9,104(a0)
ffffffffc020a446:	89aa                	mv	s3,a0
ffffffffc020a448:	160c8163          	beqz	s9,ffffffffc020a5aa <sfs_truncfile+0x18c>
ffffffffc020a44c:	0b0ca783          	lw	a5,176(s9)
ffffffffc020a450:	14079d63          	bnez	a5,ffffffffc020a5aa <sfs_truncfile+0x18c>
ffffffffc020a454:	4d38                	lw	a4,88(a0)
ffffffffc020a456:	6405                	lui	s0,0x1
ffffffffc020a458:	23540793          	addi	a5,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a45c:	16f71763          	bne	a4,a5,ffffffffc020a5ca <sfs_truncfile+0x1ac>
ffffffffc020a460:	00053a83          	ld	s5,0(a0)
ffffffffc020a464:	147d                	addi	s0,s0,-1
ffffffffc020a466:	942e                	add	s0,s0,a1
ffffffffc020a468:	000ae783          	lwu	a5,0(s5)
ffffffffc020a46c:	8031                	srli	s0,s0,0xc
ffffffffc020a46e:	8a2e                	mv	s4,a1
ffffffffc020a470:	2401                	sext.w	s0,s0
ffffffffc020a472:	02b79763          	bne	a5,a1,ffffffffc020a4a0 <sfs_truncfile+0x82>
ffffffffc020a476:	008aa783          	lw	a5,8(s5)
ffffffffc020a47a:	4901                	li	s2,0
ffffffffc020a47c:	18879763          	bne	a5,s0,ffffffffc020a60a <sfs_truncfile+0x1ec>
ffffffffc020a480:	60aa                	ld	ra,136(sp)
ffffffffc020a482:	640a                	ld	s0,128(sp)
ffffffffc020a484:	74e6                	ld	s1,120(sp)
ffffffffc020a486:	79a6                	ld	s3,104(sp)
ffffffffc020a488:	7a06                	ld	s4,96(sp)
ffffffffc020a48a:	6ae6                	ld	s5,88(sp)
ffffffffc020a48c:	6b46                	ld	s6,80(sp)
ffffffffc020a48e:	6ba6                	ld	s7,72(sp)
ffffffffc020a490:	6c06                	ld	s8,64(sp)
ffffffffc020a492:	7ce2                	ld	s9,56(sp)
ffffffffc020a494:	7d42                	ld	s10,48(sp)
ffffffffc020a496:	7da2                	ld	s11,40(sp)
ffffffffc020a498:	854a                	mv	a0,s2
ffffffffc020a49a:	7946                	ld	s2,112(sp)
ffffffffc020a49c:	6149                	addi	sp,sp,144
ffffffffc020a49e:	8082                	ret
ffffffffc020a4a0:	02050b13          	addi	s6,a0,32
ffffffffc020a4a4:	855a                	mv	a0,s6
ffffffffc020a4a6:	8befa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a4aa:	008aa483          	lw	s1,8(s5)
ffffffffc020a4ae:	0a84e663          	bltu	s1,s0,ffffffffc020a55a <sfs_truncfile+0x13c>
ffffffffc020a4b2:	0c947163          	bgeu	s0,s1,ffffffffc020a574 <sfs_truncfile+0x156>
ffffffffc020a4b6:	4dad                	li	s11,11
ffffffffc020a4b8:	4b85                	li	s7,1
ffffffffc020a4ba:	a09d                	j	ffffffffc020a520 <sfs_truncfile+0x102>
ffffffffc020a4bc:	ff37091b          	addiw	s2,a4,-13
ffffffffc020a4c0:	0009079b          	sext.w	a5,s2
ffffffffc020a4c4:	3ff00713          	li	a4,1023
ffffffffc020a4c8:	04f76563          	bltu	a4,a5,ffffffffc020a512 <sfs_truncfile+0xf4>
ffffffffc020a4cc:	03cd2c03          	lw	s8,60(s10)
ffffffffc020a4d0:	040c0163          	beqz	s8,ffffffffc020a512 <sfs_truncfile+0xf4>
ffffffffc020a4d4:	004ca783          	lw	a5,4(s9)
ffffffffc020a4d8:	18fc7963          	bgeu	s8,a5,ffffffffc020a66a <sfs_truncfile+0x24c>
ffffffffc020a4dc:	038cb503          	ld	a0,56(s9)
ffffffffc020a4e0:	85e2                	mv	a1,s8
ffffffffc020a4e2:	b53fe0ef          	jal	ra,ffffffffc0209034 <bitmap_test>
ffffffffc020a4e6:	16051263          	bnez	a0,ffffffffc020a64a <sfs_truncfile+0x22c>
ffffffffc020a4ea:	02091793          	slli	a5,s2,0x20
ffffffffc020a4ee:	01e7d713          	srli	a4,a5,0x1e
ffffffffc020a4f2:	86e2                	mv	a3,s8
ffffffffc020a4f4:	4611                	li	a2,4
ffffffffc020a4f6:	082c                	addi	a1,sp,24
ffffffffc020a4f8:	8566                	mv	a0,s9
ffffffffc020a4fa:	e43a                	sd	a4,8(sp)
ffffffffc020a4fc:	ce02                	sw	zero,28(sp)
ffffffffc020a4fe:	043000ef          	jal	ra,ffffffffc020ad40 <sfs_rbuf>
ffffffffc020a502:	892a                	mv	s2,a0
ffffffffc020a504:	e141                	bnez	a0,ffffffffc020a584 <sfs_truncfile+0x166>
ffffffffc020a506:	47e2                	lw	a5,24(sp)
ffffffffc020a508:	6722                	ld	a4,8(sp)
ffffffffc020a50a:	e3c9                	bnez	a5,ffffffffc020a58c <sfs_truncfile+0x16e>
ffffffffc020a50c:	008d2603          	lw	a2,8(s10)
ffffffffc020a510:	367d                	addiw	a2,a2,-1
ffffffffc020a512:	00cd2423          	sw	a2,8(s10)
ffffffffc020a516:	0179b823          	sd	s7,16(s3)
ffffffffc020a51a:	34fd                	addiw	s1,s1,-1
ffffffffc020a51c:	04940a63          	beq	s0,s1,ffffffffc020a570 <sfs_truncfile+0x152>
ffffffffc020a520:	0009bd03          	ld	s10,0(s3)
ffffffffc020a524:	008d2703          	lw	a4,8(s10)
ffffffffc020a528:	c369                	beqz	a4,ffffffffc020a5ea <sfs_truncfile+0x1cc>
ffffffffc020a52a:	fff7079b          	addiw	a5,a4,-1
ffffffffc020a52e:	0007861b          	sext.w	a2,a5
ffffffffc020a532:	f8cde5e3          	bltu	s11,a2,ffffffffc020a4bc <sfs_truncfile+0x9e>
ffffffffc020a536:	02079713          	slli	a4,a5,0x20
ffffffffc020a53a:	01e75793          	srli	a5,a4,0x1e
ffffffffc020a53e:	00fd0933          	add	s2,s10,a5
ffffffffc020a542:	00c92583          	lw	a1,12(s2)
ffffffffc020a546:	d5f1                	beqz	a1,ffffffffc020a512 <sfs_truncfile+0xf4>
ffffffffc020a548:	8566                	mv	a0,s9
ffffffffc020a54a:	bf8ff0ef          	jal	ra,ffffffffc0209942 <sfs_block_free>
ffffffffc020a54e:	00092623          	sw	zero,12(s2)
ffffffffc020a552:	008d2603          	lw	a2,8(s10)
ffffffffc020a556:	367d                	addiw	a2,a2,-1
ffffffffc020a558:	bf6d                	j	ffffffffc020a512 <sfs_truncfile+0xf4>
ffffffffc020a55a:	4681                	li	a3,0
ffffffffc020a55c:	8626                	mv	a2,s1
ffffffffc020a55e:	85ce                	mv	a1,s3
ffffffffc020a560:	8566                	mv	a0,s9
ffffffffc020a562:	e9aff0ef          	jal	ra,ffffffffc0209bfc <sfs_bmap_load_nolock>
ffffffffc020a566:	892a                	mv	s2,a0
ffffffffc020a568:	ed11                	bnez	a0,ffffffffc020a584 <sfs_truncfile+0x166>
ffffffffc020a56a:	2485                	addiw	s1,s1,1
ffffffffc020a56c:	fe9417e3          	bne	s0,s1,ffffffffc020a55a <sfs_truncfile+0x13c>
ffffffffc020a570:	008aa483          	lw	s1,8(s5)
ffffffffc020a574:	0a941b63          	bne	s0,s1,ffffffffc020a62a <sfs_truncfile+0x20c>
ffffffffc020a578:	014aa023          	sw	s4,0(s5)
ffffffffc020a57c:	4785                	li	a5,1
ffffffffc020a57e:	00f9b823          	sd	a5,16(s3)
ffffffffc020a582:	4901                	li	s2,0
ffffffffc020a584:	855a                	mv	a0,s6
ffffffffc020a586:	fdbf90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a58a:	bddd                	j	ffffffffc020a480 <sfs_truncfile+0x62>
ffffffffc020a58c:	86e2                	mv	a3,s8
ffffffffc020a58e:	4611                	li	a2,4
ffffffffc020a590:	086c                	addi	a1,sp,28
ffffffffc020a592:	8566                	mv	a0,s9
ffffffffc020a594:	02d000ef          	jal	ra,ffffffffc020adc0 <sfs_wbuf>
ffffffffc020a598:	892a                	mv	s2,a0
ffffffffc020a59a:	f56d                	bnez	a0,ffffffffc020a584 <sfs_truncfile+0x166>
ffffffffc020a59c:	45e2                	lw	a1,24(sp)
ffffffffc020a59e:	8566                	mv	a0,s9
ffffffffc020a5a0:	ba2ff0ef          	jal	ra,ffffffffc0209942 <sfs_block_free>
ffffffffc020a5a4:	b7a5                	j	ffffffffc020a50c <sfs_truncfile+0xee>
ffffffffc020a5a6:	5975                	li	s2,-3
ffffffffc020a5a8:	bde1                	j	ffffffffc020a480 <sfs_truncfile+0x62>
ffffffffc020a5aa:	00004697          	auipc	a3,0x4
ffffffffc020a5ae:	7ce68693          	addi	a3,a3,1998 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc020a5b2:	00001617          	auipc	a2,0x1
ffffffffc020a5b6:	3f660613          	addi	a2,a2,1014 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a5ba:	3a700593          	li	a1,935
ffffffffc020a5be:	00005517          	auipc	a0,0x5
ffffffffc020a5c2:	99a50513          	addi	a0,a0,-1638 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a5c6:	ed9f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a5ca:	00005697          	auipc	a3,0x5
ffffffffc020a5ce:	95668693          	addi	a3,a3,-1706 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc020a5d2:	00001617          	auipc	a2,0x1
ffffffffc020a5d6:	3d660613          	addi	a2,a2,982 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a5da:	3a800593          	li	a1,936
ffffffffc020a5de:	00005517          	auipc	a0,0x5
ffffffffc020a5e2:	97a50513          	addi	a0,a0,-1670 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a5e6:	eb9f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a5ea:	00005697          	auipc	a3,0x5
ffffffffc020a5ee:	b8e68693          	addi	a3,a3,-1138 # ffffffffc020f178 <dev_node_ops+0x7e0>
ffffffffc020a5f2:	00001617          	auipc	a2,0x1
ffffffffc020a5f6:	3b660613          	addi	a2,a2,950 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a5fa:	17b00593          	li	a1,379
ffffffffc020a5fe:	00005517          	auipc	a0,0x5
ffffffffc020a602:	95a50513          	addi	a0,a0,-1702 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a606:	e99f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a60a:	00005697          	auipc	a3,0x5
ffffffffc020a60e:	b5668693          	addi	a3,a3,-1194 # ffffffffc020f160 <dev_node_ops+0x7c8>
ffffffffc020a612:	00001617          	auipc	a2,0x1
ffffffffc020a616:	39660613          	addi	a2,a2,918 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a61a:	3af00593          	li	a1,943
ffffffffc020a61e:	00005517          	auipc	a0,0x5
ffffffffc020a622:	93a50513          	addi	a0,a0,-1734 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a626:	e79f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a62a:	00005697          	auipc	a3,0x5
ffffffffc020a62e:	b9e68693          	addi	a3,a3,-1122 # ffffffffc020f1c8 <dev_node_ops+0x830>
ffffffffc020a632:	00001617          	auipc	a2,0x1
ffffffffc020a636:	37660613          	addi	a2,a2,886 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a63a:	3c800593          	li	a1,968
ffffffffc020a63e:	00005517          	auipc	a0,0x5
ffffffffc020a642:	91a50513          	addi	a0,a0,-1766 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a646:	e59f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a64a:	00005697          	auipc	a3,0x5
ffffffffc020a64e:	b4668693          	addi	a3,a3,-1210 # ffffffffc020f190 <dev_node_ops+0x7f8>
ffffffffc020a652:	00001617          	auipc	a2,0x1
ffffffffc020a656:	35660613          	addi	a2,a2,854 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a65a:	12b00593          	li	a1,299
ffffffffc020a65e:	00005517          	auipc	a0,0x5
ffffffffc020a662:	8fa50513          	addi	a0,a0,-1798 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a666:	e39f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a66a:	8762                	mv	a4,s8
ffffffffc020a66c:	86be                	mv	a3,a5
ffffffffc020a66e:	00005617          	auipc	a2,0x5
ffffffffc020a672:	91a60613          	addi	a2,a2,-1766 # ffffffffc020ef88 <dev_node_ops+0x5f0>
ffffffffc020a676:	05300593          	li	a1,83
ffffffffc020a67a:	00005517          	auipc	a0,0x5
ffffffffc020a67e:	8de50513          	addi	a0,a0,-1826 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a682:	e1df50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a686 <sfs_load_inode>:
ffffffffc020a686:	7139                	addi	sp,sp,-64
ffffffffc020a688:	fc06                	sd	ra,56(sp)
ffffffffc020a68a:	f822                	sd	s0,48(sp)
ffffffffc020a68c:	f426                	sd	s1,40(sp)
ffffffffc020a68e:	f04a                	sd	s2,32(sp)
ffffffffc020a690:	84b2                	mv	s1,a2
ffffffffc020a692:	892a                	mv	s2,a0
ffffffffc020a694:	ec4e                	sd	s3,24(sp)
ffffffffc020a696:	e852                	sd	s4,16(sp)
ffffffffc020a698:	89ae                	mv	s3,a1
ffffffffc020a69a:	e456                	sd	s5,8(sp)
ffffffffc020a69c:	0d5000ef          	jal	ra,ffffffffc020af70 <lock_sfs_fs>
ffffffffc020a6a0:	45a9                	li	a1,10
ffffffffc020a6a2:	8526                	mv	a0,s1
ffffffffc020a6a4:	0a893403          	ld	s0,168(s2)
ffffffffc020a6a8:	0e9000ef          	jal	ra,ffffffffc020af90 <hash32>
ffffffffc020a6ac:	02051793          	slli	a5,a0,0x20
ffffffffc020a6b0:	01c7d713          	srli	a4,a5,0x1c
ffffffffc020a6b4:	9722                	add	a4,a4,s0
ffffffffc020a6b6:	843a                	mv	s0,a4
ffffffffc020a6b8:	a029                	j	ffffffffc020a6c2 <sfs_load_inode+0x3c>
ffffffffc020a6ba:	fc042783          	lw	a5,-64(s0)
ffffffffc020a6be:	10978863          	beq	a5,s1,ffffffffc020a7ce <sfs_load_inode+0x148>
ffffffffc020a6c2:	6400                	ld	s0,8(s0)
ffffffffc020a6c4:	fe871be3          	bne	a4,s0,ffffffffc020a6ba <sfs_load_inode+0x34>
ffffffffc020a6c8:	04000513          	li	a0,64
ffffffffc020a6cc:	8c3f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a6d0:	8aaa                	mv	s5,a0
ffffffffc020a6d2:	16050563          	beqz	a0,ffffffffc020a83c <sfs_load_inode+0x1b6>
ffffffffc020a6d6:	00492683          	lw	a3,4(s2)
ffffffffc020a6da:	18048363          	beqz	s1,ffffffffc020a860 <sfs_load_inode+0x1da>
ffffffffc020a6de:	18d4f163          	bgeu	s1,a3,ffffffffc020a860 <sfs_load_inode+0x1da>
ffffffffc020a6e2:	03893503          	ld	a0,56(s2)
ffffffffc020a6e6:	85a6                	mv	a1,s1
ffffffffc020a6e8:	94dfe0ef          	jal	ra,ffffffffc0209034 <bitmap_test>
ffffffffc020a6ec:	18051763          	bnez	a0,ffffffffc020a87a <sfs_load_inode+0x1f4>
ffffffffc020a6f0:	4701                	li	a4,0
ffffffffc020a6f2:	86a6                	mv	a3,s1
ffffffffc020a6f4:	04000613          	li	a2,64
ffffffffc020a6f8:	85d6                	mv	a1,s5
ffffffffc020a6fa:	854a                	mv	a0,s2
ffffffffc020a6fc:	644000ef          	jal	ra,ffffffffc020ad40 <sfs_rbuf>
ffffffffc020a700:	842a                	mv	s0,a0
ffffffffc020a702:	0e051563          	bnez	a0,ffffffffc020a7ec <sfs_load_inode+0x166>
ffffffffc020a706:	006ad783          	lhu	a5,6(s5)
ffffffffc020a70a:	12078b63          	beqz	a5,ffffffffc020a840 <sfs_load_inode+0x1ba>
ffffffffc020a70e:	6405                	lui	s0,0x1
ffffffffc020a710:	23540513          	addi	a0,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a714:	8dafd0ef          	jal	ra,ffffffffc02077ee <__alloc_inode>
ffffffffc020a718:	8a2a                	mv	s4,a0
ffffffffc020a71a:	c961                	beqz	a0,ffffffffc020a7ea <sfs_load_inode+0x164>
ffffffffc020a71c:	004ad683          	lhu	a3,4(s5)
ffffffffc020a720:	4785                	li	a5,1
ffffffffc020a722:	0cf69c63          	bne	a3,a5,ffffffffc020a7fa <sfs_load_inode+0x174>
ffffffffc020a726:	864a                	mv	a2,s2
ffffffffc020a728:	00005597          	auipc	a1,0x5
ffffffffc020a72c:	bb058593          	addi	a1,a1,-1104 # ffffffffc020f2d8 <sfs_node_fileops>
ffffffffc020a730:	8dafd0ef          	jal	ra,ffffffffc020780a <inode_init>
ffffffffc020a734:	058a2783          	lw	a5,88(s4)
ffffffffc020a738:	23540413          	addi	s0,s0,565
ffffffffc020a73c:	0e879063          	bne	a5,s0,ffffffffc020a81c <sfs_load_inode+0x196>
ffffffffc020a740:	4785                	li	a5,1
ffffffffc020a742:	00fa2c23          	sw	a5,24(s4)
ffffffffc020a746:	015a3023          	sd	s5,0(s4)
ffffffffc020a74a:	009a2423          	sw	s1,8(s4)
ffffffffc020a74e:	000a3823          	sd	zero,16(s4)
ffffffffc020a752:	4585                	li	a1,1
ffffffffc020a754:	020a0513          	addi	a0,s4,32
ffffffffc020a758:	e03f90ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc020a75c:	058a2703          	lw	a4,88(s4)
ffffffffc020a760:	6785                	lui	a5,0x1
ffffffffc020a762:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a766:	14f71663          	bne	a4,a5,ffffffffc020a8b2 <sfs_load_inode+0x22c>
ffffffffc020a76a:	0a093703          	ld	a4,160(s2)
ffffffffc020a76e:	038a0793          	addi	a5,s4,56
ffffffffc020a772:	008a2503          	lw	a0,8(s4)
ffffffffc020a776:	e31c                	sd	a5,0(a4)
ffffffffc020a778:	0af93023          	sd	a5,160(s2)
ffffffffc020a77c:	09890793          	addi	a5,s2,152
ffffffffc020a780:	0a893403          	ld	s0,168(s2)
ffffffffc020a784:	45a9                	li	a1,10
ffffffffc020a786:	04ea3023          	sd	a4,64(s4)
ffffffffc020a78a:	02fa3c23          	sd	a5,56(s4)
ffffffffc020a78e:	003000ef          	jal	ra,ffffffffc020af90 <hash32>
ffffffffc020a792:	02051713          	slli	a4,a0,0x20
ffffffffc020a796:	01c75793          	srli	a5,a4,0x1c
ffffffffc020a79a:	97a2                	add	a5,a5,s0
ffffffffc020a79c:	6798                	ld	a4,8(a5)
ffffffffc020a79e:	048a0693          	addi	a3,s4,72
ffffffffc020a7a2:	e314                	sd	a3,0(a4)
ffffffffc020a7a4:	e794                	sd	a3,8(a5)
ffffffffc020a7a6:	04ea3823          	sd	a4,80(s4)
ffffffffc020a7aa:	04fa3423          	sd	a5,72(s4)
ffffffffc020a7ae:	854a                	mv	a0,s2
ffffffffc020a7b0:	7d0000ef          	jal	ra,ffffffffc020af80 <unlock_sfs_fs>
ffffffffc020a7b4:	4401                	li	s0,0
ffffffffc020a7b6:	0149b023          	sd	s4,0(s3)
ffffffffc020a7ba:	70e2                	ld	ra,56(sp)
ffffffffc020a7bc:	8522                	mv	a0,s0
ffffffffc020a7be:	7442                	ld	s0,48(sp)
ffffffffc020a7c0:	74a2                	ld	s1,40(sp)
ffffffffc020a7c2:	7902                	ld	s2,32(sp)
ffffffffc020a7c4:	69e2                	ld	s3,24(sp)
ffffffffc020a7c6:	6a42                	ld	s4,16(sp)
ffffffffc020a7c8:	6aa2                	ld	s5,8(sp)
ffffffffc020a7ca:	6121                	addi	sp,sp,64
ffffffffc020a7cc:	8082                	ret
ffffffffc020a7ce:	fb840a13          	addi	s4,s0,-72
ffffffffc020a7d2:	8552                	mv	a0,s4
ffffffffc020a7d4:	898fd0ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc020a7d8:	4785                	li	a5,1
ffffffffc020a7da:	fcf51ae3          	bne	a0,a5,ffffffffc020a7ae <sfs_load_inode+0x128>
ffffffffc020a7de:	fd042783          	lw	a5,-48(s0)
ffffffffc020a7e2:	2785                	addiw	a5,a5,1
ffffffffc020a7e4:	fcf42823          	sw	a5,-48(s0)
ffffffffc020a7e8:	b7d9                	j	ffffffffc020a7ae <sfs_load_inode+0x128>
ffffffffc020a7ea:	5471                	li	s0,-4
ffffffffc020a7ec:	8556                	mv	a0,s5
ffffffffc020a7ee:	851f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a7f2:	854a                	mv	a0,s2
ffffffffc020a7f4:	78c000ef          	jal	ra,ffffffffc020af80 <unlock_sfs_fs>
ffffffffc020a7f8:	b7c9                	j	ffffffffc020a7ba <sfs_load_inode+0x134>
ffffffffc020a7fa:	4789                	li	a5,2
ffffffffc020a7fc:	08f69f63          	bne	a3,a5,ffffffffc020a89a <sfs_load_inode+0x214>
ffffffffc020a800:	864a                	mv	a2,s2
ffffffffc020a802:	00005597          	auipc	a1,0x5
ffffffffc020a806:	a5658593          	addi	a1,a1,-1450 # ffffffffc020f258 <sfs_node_dirops>
ffffffffc020a80a:	800fd0ef          	jal	ra,ffffffffc020780a <inode_init>
ffffffffc020a80e:	058a2703          	lw	a4,88(s4)
ffffffffc020a812:	6785                	lui	a5,0x1
ffffffffc020a814:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a818:	f2f704e3          	beq	a4,a5,ffffffffc020a740 <sfs_load_inode+0xba>
ffffffffc020a81c:	00004697          	auipc	a3,0x4
ffffffffc020a820:	70468693          	addi	a3,a3,1796 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc020a824:	00001617          	auipc	a2,0x1
ffffffffc020a828:	18460613          	addi	a2,a2,388 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a82c:	07700593          	li	a1,119
ffffffffc020a830:	00004517          	auipc	a0,0x4
ffffffffc020a834:	72850513          	addi	a0,a0,1832 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a838:	c67f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a83c:	5471                	li	s0,-4
ffffffffc020a83e:	bf55                	j	ffffffffc020a7f2 <sfs_load_inode+0x16c>
ffffffffc020a840:	00005697          	auipc	a3,0x5
ffffffffc020a844:	9a068693          	addi	a3,a3,-1632 # ffffffffc020f1e0 <dev_node_ops+0x848>
ffffffffc020a848:	00001617          	auipc	a2,0x1
ffffffffc020a84c:	16060613          	addi	a2,a2,352 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a850:	0ad00593          	li	a1,173
ffffffffc020a854:	00004517          	auipc	a0,0x4
ffffffffc020a858:	70450513          	addi	a0,a0,1796 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a85c:	c43f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a860:	8726                	mv	a4,s1
ffffffffc020a862:	00004617          	auipc	a2,0x4
ffffffffc020a866:	72660613          	addi	a2,a2,1830 # ffffffffc020ef88 <dev_node_ops+0x5f0>
ffffffffc020a86a:	05300593          	li	a1,83
ffffffffc020a86e:	00004517          	auipc	a0,0x4
ffffffffc020a872:	6ea50513          	addi	a0,a0,1770 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a876:	c29f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a87a:	00004697          	auipc	a3,0x4
ffffffffc020a87e:	74668693          	addi	a3,a3,1862 # ffffffffc020efc0 <dev_node_ops+0x628>
ffffffffc020a882:	00001617          	auipc	a2,0x1
ffffffffc020a886:	12660613          	addi	a2,a2,294 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a88a:	0a800593          	li	a1,168
ffffffffc020a88e:	00004517          	auipc	a0,0x4
ffffffffc020a892:	6ca50513          	addi	a0,a0,1738 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a896:	c09f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a89a:	00004617          	auipc	a2,0x4
ffffffffc020a89e:	6d660613          	addi	a2,a2,1750 # ffffffffc020ef70 <dev_node_ops+0x5d8>
ffffffffc020a8a2:	02e00593          	li	a1,46
ffffffffc020a8a6:	00004517          	auipc	a0,0x4
ffffffffc020a8aa:	6b250513          	addi	a0,a0,1714 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a8ae:	bf1f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a8b2:	00004697          	auipc	a3,0x4
ffffffffc020a8b6:	66e68693          	addi	a3,a3,1646 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc020a8ba:	00001617          	auipc	a2,0x1
ffffffffc020a8be:	0ee60613          	addi	a2,a2,238 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a8c2:	0b100593          	li	a1,177
ffffffffc020a8c6:	00004517          	auipc	a0,0x4
ffffffffc020a8ca:	69250513          	addi	a0,a0,1682 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a8ce:	bd1f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a8d2 <sfs_lookup>:
ffffffffc020a8d2:	7139                	addi	sp,sp,-64
ffffffffc020a8d4:	ec4e                	sd	s3,24(sp)
ffffffffc020a8d6:	06853983          	ld	s3,104(a0)
ffffffffc020a8da:	fc06                	sd	ra,56(sp)
ffffffffc020a8dc:	f822                	sd	s0,48(sp)
ffffffffc020a8de:	f426                	sd	s1,40(sp)
ffffffffc020a8e0:	f04a                	sd	s2,32(sp)
ffffffffc020a8e2:	e852                	sd	s4,16(sp)
ffffffffc020a8e4:	0a098c63          	beqz	s3,ffffffffc020a99c <sfs_lookup+0xca>
ffffffffc020a8e8:	0b09a783          	lw	a5,176(s3)
ffffffffc020a8ec:	ebc5                	bnez	a5,ffffffffc020a99c <sfs_lookup+0xca>
ffffffffc020a8ee:	0005c783          	lbu	a5,0(a1)
ffffffffc020a8f2:	84ae                	mv	s1,a1
ffffffffc020a8f4:	c7c1                	beqz	a5,ffffffffc020a97c <sfs_lookup+0xaa>
ffffffffc020a8f6:	02f00713          	li	a4,47
ffffffffc020a8fa:	08e78163          	beq	a5,a4,ffffffffc020a97c <sfs_lookup+0xaa>
ffffffffc020a8fe:	842a                	mv	s0,a0
ffffffffc020a900:	8a32                	mv	s4,a2
ffffffffc020a902:	f6bfc0ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc020a906:	4c38                	lw	a4,88(s0)
ffffffffc020a908:	6785                	lui	a5,0x1
ffffffffc020a90a:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a90e:	0af71763          	bne	a4,a5,ffffffffc020a9bc <sfs_lookup+0xea>
ffffffffc020a912:	6018                	ld	a4,0(s0)
ffffffffc020a914:	4789                	li	a5,2
ffffffffc020a916:	00475703          	lhu	a4,4(a4)
ffffffffc020a91a:	04f71c63          	bne	a4,a5,ffffffffc020a972 <sfs_lookup+0xa0>
ffffffffc020a91e:	02040913          	addi	s2,s0,32
ffffffffc020a922:	854a                	mv	a0,s2
ffffffffc020a924:	c41f90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a928:	8626                	mv	a2,s1
ffffffffc020a92a:	0054                	addi	a3,sp,4
ffffffffc020a92c:	85a2                	mv	a1,s0
ffffffffc020a92e:	854e                	mv	a0,s3
ffffffffc020a930:	a29ff0ef          	jal	ra,ffffffffc020a358 <sfs_dirent_search_nolock.constprop.0>
ffffffffc020a934:	84aa                	mv	s1,a0
ffffffffc020a936:	854a                	mv	a0,s2
ffffffffc020a938:	c29f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a93c:	cc89                	beqz	s1,ffffffffc020a956 <sfs_lookup+0x84>
ffffffffc020a93e:	8522                	mv	a0,s0
ffffffffc020a940:	ffbfc0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc020a944:	70e2                	ld	ra,56(sp)
ffffffffc020a946:	7442                	ld	s0,48(sp)
ffffffffc020a948:	7902                	ld	s2,32(sp)
ffffffffc020a94a:	69e2                	ld	s3,24(sp)
ffffffffc020a94c:	6a42                	ld	s4,16(sp)
ffffffffc020a94e:	8526                	mv	a0,s1
ffffffffc020a950:	74a2                	ld	s1,40(sp)
ffffffffc020a952:	6121                	addi	sp,sp,64
ffffffffc020a954:	8082                	ret
ffffffffc020a956:	4612                	lw	a2,4(sp)
ffffffffc020a958:	002c                	addi	a1,sp,8
ffffffffc020a95a:	854e                	mv	a0,s3
ffffffffc020a95c:	d2bff0ef          	jal	ra,ffffffffc020a686 <sfs_load_inode>
ffffffffc020a960:	84aa                	mv	s1,a0
ffffffffc020a962:	8522                	mv	a0,s0
ffffffffc020a964:	fd7fc0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc020a968:	fcf1                	bnez	s1,ffffffffc020a944 <sfs_lookup+0x72>
ffffffffc020a96a:	67a2                	ld	a5,8(sp)
ffffffffc020a96c:	00fa3023          	sd	a5,0(s4)
ffffffffc020a970:	bfd1                	j	ffffffffc020a944 <sfs_lookup+0x72>
ffffffffc020a972:	8522                	mv	a0,s0
ffffffffc020a974:	fc7fc0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc020a978:	54b9                	li	s1,-18
ffffffffc020a97a:	b7e9                	j	ffffffffc020a944 <sfs_lookup+0x72>
ffffffffc020a97c:	00005697          	auipc	a3,0x5
ffffffffc020a980:	87c68693          	addi	a3,a3,-1924 # ffffffffc020f1f8 <dev_node_ops+0x860>
ffffffffc020a984:	00001617          	auipc	a2,0x1
ffffffffc020a988:	02460613          	addi	a2,a2,36 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a98c:	3d900593          	li	a1,985
ffffffffc020a990:	00004517          	auipc	a0,0x4
ffffffffc020a994:	5c850513          	addi	a0,a0,1480 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a998:	b07f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a99c:	00004697          	auipc	a3,0x4
ffffffffc020a9a0:	3dc68693          	addi	a3,a3,988 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc020a9a4:	00001617          	auipc	a2,0x1
ffffffffc020a9a8:	00460613          	addi	a2,a2,4 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a9ac:	3d800593          	li	a1,984
ffffffffc020a9b0:	00004517          	auipc	a0,0x4
ffffffffc020a9b4:	5a850513          	addi	a0,a0,1448 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a9b8:	ae7f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a9bc:	00004697          	auipc	a3,0x4
ffffffffc020a9c0:	56468693          	addi	a3,a3,1380 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc020a9c4:	00001617          	auipc	a2,0x1
ffffffffc020a9c8:	fe460613          	addi	a2,a2,-28 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020a9cc:	3db00593          	li	a1,987
ffffffffc020a9d0:	00004517          	auipc	a0,0x4
ffffffffc020a9d4:	58850513          	addi	a0,a0,1416 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020a9d8:	ac7f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a9dc <sfs_namefile>:
ffffffffc020a9dc:	6d98                	ld	a4,24(a1)
ffffffffc020a9de:	7175                	addi	sp,sp,-144
ffffffffc020a9e0:	e506                	sd	ra,136(sp)
ffffffffc020a9e2:	e122                	sd	s0,128(sp)
ffffffffc020a9e4:	fca6                	sd	s1,120(sp)
ffffffffc020a9e6:	f8ca                	sd	s2,112(sp)
ffffffffc020a9e8:	f4ce                	sd	s3,104(sp)
ffffffffc020a9ea:	f0d2                	sd	s4,96(sp)
ffffffffc020a9ec:	ecd6                	sd	s5,88(sp)
ffffffffc020a9ee:	e8da                	sd	s6,80(sp)
ffffffffc020a9f0:	e4de                	sd	s7,72(sp)
ffffffffc020a9f2:	e0e2                	sd	s8,64(sp)
ffffffffc020a9f4:	fc66                	sd	s9,56(sp)
ffffffffc020a9f6:	f86a                	sd	s10,48(sp)
ffffffffc020a9f8:	f46e                	sd	s11,40(sp)
ffffffffc020a9fa:	e42e                	sd	a1,8(sp)
ffffffffc020a9fc:	4789                	li	a5,2
ffffffffc020a9fe:	1ae7f363          	bgeu	a5,a4,ffffffffc020aba4 <sfs_namefile+0x1c8>
ffffffffc020aa02:	89aa                	mv	s3,a0
ffffffffc020aa04:	10400513          	li	a0,260
ffffffffc020aa08:	d86f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020aa0c:	842a                	mv	s0,a0
ffffffffc020aa0e:	18050b63          	beqz	a0,ffffffffc020aba4 <sfs_namefile+0x1c8>
ffffffffc020aa12:	0689b483          	ld	s1,104(s3)
ffffffffc020aa16:	1e048963          	beqz	s1,ffffffffc020ac08 <sfs_namefile+0x22c>
ffffffffc020aa1a:	0b04a783          	lw	a5,176(s1)
ffffffffc020aa1e:	1e079563          	bnez	a5,ffffffffc020ac08 <sfs_namefile+0x22c>
ffffffffc020aa22:	0589ac83          	lw	s9,88(s3)
ffffffffc020aa26:	6785                	lui	a5,0x1
ffffffffc020aa28:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020aa2c:	1afc9e63          	bne	s9,a5,ffffffffc020abe8 <sfs_namefile+0x20c>
ffffffffc020aa30:	6722                	ld	a4,8(sp)
ffffffffc020aa32:	854e                	mv	a0,s3
ffffffffc020aa34:	8ace                	mv	s5,s3
ffffffffc020aa36:	6f1c                	ld	a5,24(a4)
ffffffffc020aa38:	00073b03          	ld	s6,0(a4)
ffffffffc020aa3c:	02098a13          	addi	s4,s3,32
ffffffffc020aa40:	ffe78b93          	addi	s7,a5,-2
ffffffffc020aa44:	9b3e                	add	s6,s6,a5
ffffffffc020aa46:	00004d17          	auipc	s10,0x4
ffffffffc020aa4a:	7d2d0d13          	addi	s10,s10,2002 # ffffffffc020f218 <dev_node_ops+0x880>
ffffffffc020aa4e:	e1ffc0ef          	jal	ra,ffffffffc020786c <inode_ref_inc>
ffffffffc020aa52:	00440c13          	addi	s8,s0,4
ffffffffc020aa56:	e066                	sd	s9,0(sp)
ffffffffc020aa58:	8552                	mv	a0,s4
ffffffffc020aa5a:	b0bf90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020aa5e:	0854                	addi	a3,sp,20
ffffffffc020aa60:	866a                	mv	a2,s10
ffffffffc020aa62:	85d6                	mv	a1,s5
ffffffffc020aa64:	8526                	mv	a0,s1
ffffffffc020aa66:	8f3ff0ef          	jal	ra,ffffffffc020a358 <sfs_dirent_search_nolock.constprop.0>
ffffffffc020aa6a:	8daa                	mv	s11,a0
ffffffffc020aa6c:	8552                	mv	a0,s4
ffffffffc020aa6e:	af3f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020aa72:	020d8863          	beqz	s11,ffffffffc020aaa2 <sfs_namefile+0xc6>
ffffffffc020aa76:	854e                	mv	a0,s3
ffffffffc020aa78:	ec3fc0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc020aa7c:	8522                	mv	a0,s0
ffffffffc020aa7e:	dc0f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020aa82:	60aa                	ld	ra,136(sp)
ffffffffc020aa84:	640a                	ld	s0,128(sp)
ffffffffc020aa86:	74e6                	ld	s1,120(sp)
ffffffffc020aa88:	7946                	ld	s2,112(sp)
ffffffffc020aa8a:	79a6                	ld	s3,104(sp)
ffffffffc020aa8c:	7a06                	ld	s4,96(sp)
ffffffffc020aa8e:	6ae6                	ld	s5,88(sp)
ffffffffc020aa90:	6b46                	ld	s6,80(sp)
ffffffffc020aa92:	6ba6                	ld	s7,72(sp)
ffffffffc020aa94:	6c06                	ld	s8,64(sp)
ffffffffc020aa96:	7ce2                	ld	s9,56(sp)
ffffffffc020aa98:	7d42                	ld	s10,48(sp)
ffffffffc020aa9a:	856e                	mv	a0,s11
ffffffffc020aa9c:	7da2                	ld	s11,40(sp)
ffffffffc020aa9e:	6149                	addi	sp,sp,144
ffffffffc020aaa0:	8082                	ret
ffffffffc020aaa2:	4652                	lw	a2,20(sp)
ffffffffc020aaa4:	082c                	addi	a1,sp,24
ffffffffc020aaa6:	8526                	mv	a0,s1
ffffffffc020aaa8:	bdfff0ef          	jal	ra,ffffffffc020a686 <sfs_load_inode>
ffffffffc020aaac:	8daa                	mv	s11,a0
ffffffffc020aaae:	f561                	bnez	a0,ffffffffc020aa76 <sfs_namefile+0x9a>
ffffffffc020aab0:	854e                	mv	a0,s3
ffffffffc020aab2:	008aa903          	lw	s2,8(s5)
ffffffffc020aab6:	e85fc0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc020aaba:	6ce2                	ld	s9,24(sp)
ffffffffc020aabc:	0b3c8463          	beq	s9,s3,ffffffffc020ab64 <sfs_namefile+0x188>
ffffffffc020aac0:	100c8463          	beqz	s9,ffffffffc020abc8 <sfs_namefile+0x1ec>
ffffffffc020aac4:	058ca703          	lw	a4,88(s9)
ffffffffc020aac8:	6782                	ld	a5,0(sp)
ffffffffc020aaca:	0ef71f63          	bne	a4,a5,ffffffffc020abc8 <sfs_namefile+0x1ec>
ffffffffc020aace:	008ca703          	lw	a4,8(s9)
ffffffffc020aad2:	8ae6                	mv	s5,s9
ffffffffc020aad4:	0d270a63          	beq	a4,s2,ffffffffc020aba8 <sfs_namefile+0x1cc>
ffffffffc020aad8:	000cb703          	ld	a4,0(s9)
ffffffffc020aadc:	4789                	li	a5,2
ffffffffc020aade:	00475703          	lhu	a4,4(a4)
ffffffffc020aae2:	0cf71363          	bne	a4,a5,ffffffffc020aba8 <sfs_namefile+0x1cc>
ffffffffc020aae6:	020c8a13          	addi	s4,s9,32
ffffffffc020aaea:	8552                	mv	a0,s4
ffffffffc020aaec:	a79f90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020aaf0:	000cb703          	ld	a4,0(s9)
ffffffffc020aaf4:	00872983          	lw	s3,8(a4)
ffffffffc020aaf8:	01304963          	bgtz	s3,ffffffffc020ab0a <sfs_namefile+0x12e>
ffffffffc020aafc:	a899                	j	ffffffffc020ab52 <sfs_namefile+0x176>
ffffffffc020aafe:	4018                	lw	a4,0(s0)
ffffffffc020ab00:	01270e63          	beq	a4,s2,ffffffffc020ab1c <sfs_namefile+0x140>
ffffffffc020ab04:	2d85                	addiw	s11,s11,1
ffffffffc020ab06:	05b98663          	beq	s3,s11,ffffffffc020ab52 <sfs_namefile+0x176>
ffffffffc020ab0a:	86a2                	mv	a3,s0
ffffffffc020ab0c:	866e                	mv	a2,s11
ffffffffc020ab0e:	85e6                	mv	a1,s9
ffffffffc020ab10:	8526                	mv	a0,s1
ffffffffc020ab12:	e48ff0ef          	jal	ra,ffffffffc020a15a <sfs_dirent_read_nolock>
ffffffffc020ab16:	872a                	mv	a4,a0
ffffffffc020ab18:	d17d                	beqz	a0,ffffffffc020aafe <sfs_namefile+0x122>
ffffffffc020ab1a:	a82d                	j	ffffffffc020ab54 <sfs_namefile+0x178>
ffffffffc020ab1c:	8552                	mv	a0,s4
ffffffffc020ab1e:	a43f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020ab22:	8562                	mv	a0,s8
ffffffffc020ab24:	0ff000ef          	jal	ra,ffffffffc020b422 <strlen>
ffffffffc020ab28:	00150793          	addi	a5,a0,1
ffffffffc020ab2c:	862a                	mv	a2,a0
ffffffffc020ab2e:	06fbe863          	bltu	s7,a5,ffffffffc020ab9e <sfs_namefile+0x1c2>
ffffffffc020ab32:	fff64913          	not	s2,a2
ffffffffc020ab36:	995a                	add	s2,s2,s6
ffffffffc020ab38:	85e2                	mv	a1,s8
ffffffffc020ab3a:	854a                	mv	a0,s2
ffffffffc020ab3c:	40fb8bb3          	sub	s7,s7,a5
ffffffffc020ab40:	1d7000ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc020ab44:	02f00793          	li	a5,47
ffffffffc020ab48:	fefb0fa3          	sb	a5,-1(s6)
ffffffffc020ab4c:	89e6                	mv	s3,s9
ffffffffc020ab4e:	8b4a                	mv	s6,s2
ffffffffc020ab50:	b721                	j	ffffffffc020aa58 <sfs_namefile+0x7c>
ffffffffc020ab52:	5741                	li	a4,-16
ffffffffc020ab54:	8552                	mv	a0,s4
ffffffffc020ab56:	e03a                	sd	a4,0(sp)
ffffffffc020ab58:	a09f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020ab5c:	6702                	ld	a4,0(sp)
ffffffffc020ab5e:	89e6                	mv	s3,s9
ffffffffc020ab60:	8dba                	mv	s11,a4
ffffffffc020ab62:	bf11                	j	ffffffffc020aa76 <sfs_namefile+0x9a>
ffffffffc020ab64:	854e                	mv	a0,s3
ffffffffc020ab66:	dd5fc0ef          	jal	ra,ffffffffc020793a <inode_ref_dec>
ffffffffc020ab6a:	64a2                	ld	s1,8(sp)
ffffffffc020ab6c:	85da                	mv	a1,s6
ffffffffc020ab6e:	6c98                	ld	a4,24(s1)
ffffffffc020ab70:	6088                	ld	a0,0(s1)
ffffffffc020ab72:	1779                	addi	a4,a4,-2
ffffffffc020ab74:	41770bb3          	sub	s7,a4,s7
ffffffffc020ab78:	865e                	mv	a2,s7
ffffffffc020ab7a:	0505                	addi	a0,a0,1
ffffffffc020ab7c:	15b000ef          	jal	ra,ffffffffc020b4d6 <memmove>
ffffffffc020ab80:	02f00713          	li	a4,47
ffffffffc020ab84:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020ab88:	955e                	add	a0,a0,s7
ffffffffc020ab8a:	00050023          	sb	zero,0(a0)
ffffffffc020ab8e:	85de                	mv	a1,s7
ffffffffc020ab90:	8526                	mv	a0,s1
ffffffffc020ab92:	8c7fa0ef          	jal	ra,ffffffffc0205458 <iobuf_skip>
ffffffffc020ab96:	8522                	mv	a0,s0
ffffffffc020ab98:	ca6f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020ab9c:	b5dd                	j	ffffffffc020aa82 <sfs_namefile+0xa6>
ffffffffc020ab9e:	89e6                	mv	s3,s9
ffffffffc020aba0:	5df1                	li	s11,-4
ffffffffc020aba2:	bdd1                	j	ffffffffc020aa76 <sfs_namefile+0x9a>
ffffffffc020aba4:	5df1                	li	s11,-4
ffffffffc020aba6:	bdf1                	j	ffffffffc020aa82 <sfs_namefile+0xa6>
ffffffffc020aba8:	00004697          	auipc	a3,0x4
ffffffffc020abac:	67868693          	addi	a3,a3,1656 # ffffffffc020f220 <dev_node_ops+0x888>
ffffffffc020abb0:	00001617          	auipc	a2,0x1
ffffffffc020abb4:	df860613          	addi	a2,a2,-520 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020abb8:	2f700593          	li	a1,759
ffffffffc020abbc:	00004517          	auipc	a0,0x4
ffffffffc020abc0:	39c50513          	addi	a0,a0,924 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020abc4:	8dbf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020abc8:	00004697          	auipc	a3,0x4
ffffffffc020abcc:	35868693          	addi	a3,a3,856 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc020abd0:	00001617          	auipc	a2,0x1
ffffffffc020abd4:	dd860613          	addi	a2,a2,-552 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020abd8:	2f600593          	li	a1,758
ffffffffc020abdc:	00004517          	auipc	a0,0x4
ffffffffc020abe0:	37c50513          	addi	a0,a0,892 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020abe4:	8bbf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020abe8:	00004697          	auipc	a3,0x4
ffffffffc020abec:	33868693          	addi	a3,a3,824 # ffffffffc020ef20 <dev_node_ops+0x588>
ffffffffc020abf0:	00001617          	auipc	a2,0x1
ffffffffc020abf4:	db860613          	addi	a2,a2,-584 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020abf8:	2e300593          	li	a1,739
ffffffffc020abfc:	00004517          	auipc	a0,0x4
ffffffffc020ac00:	35c50513          	addi	a0,a0,860 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020ac04:	89bf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ac08:	00004697          	auipc	a3,0x4
ffffffffc020ac0c:	17068693          	addi	a3,a3,368 # ffffffffc020ed78 <dev_node_ops+0x3e0>
ffffffffc020ac10:	00001617          	auipc	a2,0x1
ffffffffc020ac14:	d9860613          	addi	a2,a2,-616 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020ac18:	2e200593          	li	a1,738
ffffffffc020ac1c:	00004517          	auipc	a0,0x4
ffffffffc020ac20:	33c50513          	addi	a0,a0,828 # ffffffffc020ef58 <dev_node_ops+0x5c0>
ffffffffc020ac24:	87bf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ac28 <sfs_rwblock_nolock>:
ffffffffc020ac28:	7139                	addi	sp,sp,-64
ffffffffc020ac2a:	f822                	sd	s0,48(sp)
ffffffffc020ac2c:	f426                	sd	s1,40(sp)
ffffffffc020ac2e:	fc06                	sd	ra,56(sp)
ffffffffc020ac30:	842a                	mv	s0,a0
ffffffffc020ac32:	84b6                	mv	s1,a3
ffffffffc020ac34:	e211                	bnez	a2,ffffffffc020ac38 <sfs_rwblock_nolock+0x10>
ffffffffc020ac36:	e715                	bnez	a4,ffffffffc020ac62 <sfs_rwblock_nolock+0x3a>
ffffffffc020ac38:	405c                	lw	a5,4(s0)
ffffffffc020ac3a:	02f67463          	bgeu	a2,a5,ffffffffc020ac62 <sfs_rwblock_nolock+0x3a>
ffffffffc020ac3e:	00c6169b          	slliw	a3,a2,0xc
ffffffffc020ac42:	1682                	slli	a3,a3,0x20
ffffffffc020ac44:	6605                	lui	a2,0x1
ffffffffc020ac46:	9281                	srli	a3,a3,0x20
ffffffffc020ac48:	850a                	mv	a0,sp
ffffffffc020ac4a:	f98fa0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc020ac4e:	85aa                	mv	a1,a0
ffffffffc020ac50:	7808                	ld	a0,48(s0)
ffffffffc020ac52:	8626                	mv	a2,s1
ffffffffc020ac54:	7118                	ld	a4,32(a0)
ffffffffc020ac56:	9702                	jalr	a4
ffffffffc020ac58:	70e2                	ld	ra,56(sp)
ffffffffc020ac5a:	7442                	ld	s0,48(sp)
ffffffffc020ac5c:	74a2                	ld	s1,40(sp)
ffffffffc020ac5e:	6121                	addi	sp,sp,64
ffffffffc020ac60:	8082                	ret
ffffffffc020ac62:	00004697          	auipc	a3,0x4
ffffffffc020ac66:	6f668693          	addi	a3,a3,1782 # ffffffffc020f358 <sfs_node_fileops+0x80>
ffffffffc020ac6a:	00001617          	auipc	a2,0x1
ffffffffc020ac6e:	d3e60613          	addi	a2,a2,-706 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020ac72:	45d5                	li	a1,21
ffffffffc020ac74:	00004517          	auipc	a0,0x4
ffffffffc020ac78:	71c50513          	addi	a0,a0,1820 # ffffffffc020f390 <sfs_node_fileops+0xb8>
ffffffffc020ac7c:	823f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ac80 <sfs_rblock>:
ffffffffc020ac80:	7139                	addi	sp,sp,-64
ffffffffc020ac82:	ec4e                	sd	s3,24(sp)
ffffffffc020ac84:	89b6                	mv	s3,a3
ffffffffc020ac86:	f822                	sd	s0,48(sp)
ffffffffc020ac88:	f04a                	sd	s2,32(sp)
ffffffffc020ac8a:	e852                	sd	s4,16(sp)
ffffffffc020ac8c:	fc06                	sd	ra,56(sp)
ffffffffc020ac8e:	f426                	sd	s1,40(sp)
ffffffffc020ac90:	e456                	sd	s5,8(sp)
ffffffffc020ac92:	8a2a                	mv	s4,a0
ffffffffc020ac94:	892e                	mv	s2,a1
ffffffffc020ac96:	8432                	mv	s0,a2
ffffffffc020ac98:	2e0000ef          	jal	ra,ffffffffc020af78 <lock_sfs_io>
ffffffffc020ac9c:	04098063          	beqz	s3,ffffffffc020acdc <sfs_rblock+0x5c>
ffffffffc020aca0:	013409bb          	addw	s3,s0,s3
ffffffffc020aca4:	6a85                	lui	s5,0x1
ffffffffc020aca6:	a021                	j	ffffffffc020acae <sfs_rblock+0x2e>
ffffffffc020aca8:	9956                	add	s2,s2,s5
ffffffffc020acaa:	02898963          	beq	s3,s0,ffffffffc020acdc <sfs_rblock+0x5c>
ffffffffc020acae:	8622                	mv	a2,s0
ffffffffc020acb0:	85ca                	mv	a1,s2
ffffffffc020acb2:	4705                	li	a4,1
ffffffffc020acb4:	4681                	li	a3,0
ffffffffc020acb6:	8552                	mv	a0,s4
ffffffffc020acb8:	f71ff0ef          	jal	ra,ffffffffc020ac28 <sfs_rwblock_nolock>
ffffffffc020acbc:	84aa                	mv	s1,a0
ffffffffc020acbe:	2405                	addiw	s0,s0,1
ffffffffc020acc0:	d565                	beqz	a0,ffffffffc020aca8 <sfs_rblock+0x28>
ffffffffc020acc2:	8552                	mv	a0,s4
ffffffffc020acc4:	2c4000ef          	jal	ra,ffffffffc020af88 <unlock_sfs_io>
ffffffffc020acc8:	70e2                	ld	ra,56(sp)
ffffffffc020acca:	7442                	ld	s0,48(sp)
ffffffffc020accc:	7902                	ld	s2,32(sp)
ffffffffc020acce:	69e2                	ld	s3,24(sp)
ffffffffc020acd0:	6a42                	ld	s4,16(sp)
ffffffffc020acd2:	6aa2                	ld	s5,8(sp)
ffffffffc020acd4:	8526                	mv	a0,s1
ffffffffc020acd6:	74a2                	ld	s1,40(sp)
ffffffffc020acd8:	6121                	addi	sp,sp,64
ffffffffc020acda:	8082                	ret
ffffffffc020acdc:	4481                	li	s1,0
ffffffffc020acde:	b7d5                	j	ffffffffc020acc2 <sfs_rblock+0x42>

ffffffffc020ace0 <sfs_wblock>:
ffffffffc020ace0:	7139                	addi	sp,sp,-64
ffffffffc020ace2:	ec4e                	sd	s3,24(sp)
ffffffffc020ace4:	89b6                	mv	s3,a3
ffffffffc020ace6:	f822                	sd	s0,48(sp)
ffffffffc020ace8:	f04a                	sd	s2,32(sp)
ffffffffc020acea:	e852                	sd	s4,16(sp)
ffffffffc020acec:	fc06                	sd	ra,56(sp)
ffffffffc020acee:	f426                	sd	s1,40(sp)
ffffffffc020acf0:	e456                	sd	s5,8(sp)
ffffffffc020acf2:	8a2a                	mv	s4,a0
ffffffffc020acf4:	892e                	mv	s2,a1
ffffffffc020acf6:	8432                	mv	s0,a2
ffffffffc020acf8:	280000ef          	jal	ra,ffffffffc020af78 <lock_sfs_io>
ffffffffc020acfc:	04098063          	beqz	s3,ffffffffc020ad3c <sfs_wblock+0x5c>
ffffffffc020ad00:	013409bb          	addw	s3,s0,s3
ffffffffc020ad04:	6a85                	lui	s5,0x1
ffffffffc020ad06:	a021                	j	ffffffffc020ad0e <sfs_wblock+0x2e>
ffffffffc020ad08:	9956                	add	s2,s2,s5
ffffffffc020ad0a:	02898963          	beq	s3,s0,ffffffffc020ad3c <sfs_wblock+0x5c>
ffffffffc020ad0e:	8622                	mv	a2,s0
ffffffffc020ad10:	85ca                	mv	a1,s2
ffffffffc020ad12:	4705                	li	a4,1
ffffffffc020ad14:	4685                	li	a3,1
ffffffffc020ad16:	8552                	mv	a0,s4
ffffffffc020ad18:	f11ff0ef          	jal	ra,ffffffffc020ac28 <sfs_rwblock_nolock>
ffffffffc020ad1c:	84aa                	mv	s1,a0
ffffffffc020ad1e:	2405                	addiw	s0,s0,1
ffffffffc020ad20:	d565                	beqz	a0,ffffffffc020ad08 <sfs_wblock+0x28>
ffffffffc020ad22:	8552                	mv	a0,s4
ffffffffc020ad24:	264000ef          	jal	ra,ffffffffc020af88 <unlock_sfs_io>
ffffffffc020ad28:	70e2                	ld	ra,56(sp)
ffffffffc020ad2a:	7442                	ld	s0,48(sp)
ffffffffc020ad2c:	7902                	ld	s2,32(sp)
ffffffffc020ad2e:	69e2                	ld	s3,24(sp)
ffffffffc020ad30:	6a42                	ld	s4,16(sp)
ffffffffc020ad32:	6aa2                	ld	s5,8(sp)
ffffffffc020ad34:	8526                	mv	a0,s1
ffffffffc020ad36:	74a2                	ld	s1,40(sp)
ffffffffc020ad38:	6121                	addi	sp,sp,64
ffffffffc020ad3a:	8082                	ret
ffffffffc020ad3c:	4481                	li	s1,0
ffffffffc020ad3e:	b7d5                	j	ffffffffc020ad22 <sfs_wblock+0x42>

ffffffffc020ad40 <sfs_rbuf>:
ffffffffc020ad40:	7179                	addi	sp,sp,-48
ffffffffc020ad42:	f406                	sd	ra,40(sp)
ffffffffc020ad44:	f022                	sd	s0,32(sp)
ffffffffc020ad46:	ec26                	sd	s1,24(sp)
ffffffffc020ad48:	e84a                	sd	s2,16(sp)
ffffffffc020ad4a:	e44e                	sd	s3,8(sp)
ffffffffc020ad4c:	e052                	sd	s4,0(sp)
ffffffffc020ad4e:	6785                	lui	a5,0x1
ffffffffc020ad50:	04f77863          	bgeu	a4,a5,ffffffffc020ada0 <sfs_rbuf+0x60>
ffffffffc020ad54:	84ba                	mv	s1,a4
ffffffffc020ad56:	9732                	add	a4,a4,a2
ffffffffc020ad58:	89b2                	mv	s3,a2
ffffffffc020ad5a:	04e7e363          	bltu	a5,a4,ffffffffc020ada0 <sfs_rbuf+0x60>
ffffffffc020ad5e:	8936                	mv	s2,a3
ffffffffc020ad60:	842a                	mv	s0,a0
ffffffffc020ad62:	8a2e                	mv	s4,a1
ffffffffc020ad64:	214000ef          	jal	ra,ffffffffc020af78 <lock_sfs_io>
ffffffffc020ad68:	642c                	ld	a1,72(s0)
ffffffffc020ad6a:	864a                	mv	a2,s2
ffffffffc020ad6c:	4705                	li	a4,1
ffffffffc020ad6e:	4681                	li	a3,0
ffffffffc020ad70:	8522                	mv	a0,s0
ffffffffc020ad72:	eb7ff0ef          	jal	ra,ffffffffc020ac28 <sfs_rwblock_nolock>
ffffffffc020ad76:	892a                	mv	s2,a0
ffffffffc020ad78:	cd09                	beqz	a0,ffffffffc020ad92 <sfs_rbuf+0x52>
ffffffffc020ad7a:	8522                	mv	a0,s0
ffffffffc020ad7c:	20c000ef          	jal	ra,ffffffffc020af88 <unlock_sfs_io>
ffffffffc020ad80:	70a2                	ld	ra,40(sp)
ffffffffc020ad82:	7402                	ld	s0,32(sp)
ffffffffc020ad84:	64e2                	ld	s1,24(sp)
ffffffffc020ad86:	69a2                	ld	s3,8(sp)
ffffffffc020ad88:	6a02                	ld	s4,0(sp)
ffffffffc020ad8a:	854a                	mv	a0,s2
ffffffffc020ad8c:	6942                	ld	s2,16(sp)
ffffffffc020ad8e:	6145                	addi	sp,sp,48
ffffffffc020ad90:	8082                	ret
ffffffffc020ad92:	642c                	ld	a1,72(s0)
ffffffffc020ad94:	864e                	mv	a2,s3
ffffffffc020ad96:	8552                	mv	a0,s4
ffffffffc020ad98:	95a6                	add	a1,a1,s1
ffffffffc020ad9a:	77c000ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc020ad9e:	bff1                	j	ffffffffc020ad7a <sfs_rbuf+0x3a>
ffffffffc020ada0:	00004697          	auipc	a3,0x4
ffffffffc020ada4:	60868693          	addi	a3,a3,1544 # ffffffffc020f3a8 <sfs_node_fileops+0xd0>
ffffffffc020ada8:	00001617          	auipc	a2,0x1
ffffffffc020adac:	c0060613          	addi	a2,a2,-1024 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020adb0:	05500593          	li	a1,85
ffffffffc020adb4:	00004517          	auipc	a0,0x4
ffffffffc020adb8:	5dc50513          	addi	a0,a0,1500 # ffffffffc020f390 <sfs_node_fileops+0xb8>
ffffffffc020adbc:	ee2f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020adc0 <sfs_wbuf>:
ffffffffc020adc0:	7139                	addi	sp,sp,-64
ffffffffc020adc2:	fc06                	sd	ra,56(sp)
ffffffffc020adc4:	f822                	sd	s0,48(sp)
ffffffffc020adc6:	f426                	sd	s1,40(sp)
ffffffffc020adc8:	f04a                	sd	s2,32(sp)
ffffffffc020adca:	ec4e                	sd	s3,24(sp)
ffffffffc020adcc:	e852                	sd	s4,16(sp)
ffffffffc020adce:	e456                	sd	s5,8(sp)
ffffffffc020add0:	6785                	lui	a5,0x1
ffffffffc020add2:	06f77163          	bgeu	a4,a5,ffffffffc020ae34 <sfs_wbuf+0x74>
ffffffffc020add6:	893a                	mv	s2,a4
ffffffffc020add8:	9732                	add	a4,a4,a2
ffffffffc020adda:	8a32                	mv	s4,a2
ffffffffc020addc:	04e7ec63          	bltu	a5,a4,ffffffffc020ae34 <sfs_wbuf+0x74>
ffffffffc020ade0:	842a                	mv	s0,a0
ffffffffc020ade2:	89b6                	mv	s3,a3
ffffffffc020ade4:	8aae                	mv	s5,a1
ffffffffc020ade6:	192000ef          	jal	ra,ffffffffc020af78 <lock_sfs_io>
ffffffffc020adea:	642c                	ld	a1,72(s0)
ffffffffc020adec:	4705                	li	a4,1
ffffffffc020adee:	4681                	li	a3,0
ffffffffc020adf0:	864e                	mv	a2,s3
ffffffffc020adf2:	8522                	mv	a0,s0
ffffffffc020adf4:	e35ff0ef          	jal	ra,ffffffffc020ac28 <sfs_rwblock_nolock>
ffffffffc020adf8:	84aa                	mv	s1,a0
ffffffffc020adfa:	cd11                	beqz	a0,ffffffffc020ae16 <sfs_wbuf+0x56>
ffffffffc020adfc:	8522                	mv	a0,s0
ffffffffc020adfe:	18a000ef          	jal	ra,ffffffffc020af88 <unlock_sfs_io>
ffffffffc020ae02:	70e2                	ld	ra,56(sp)
ffffffffc020ae04:	7442                	ld	s0,48(sp)
ffffffffc020ae06:	7902                	ld	s2,32(sp)
ffffffffc020ae08:	69e2                	ld	s3,24(sp)
ffffffffc020ae0a:	6a42                	ld	s4,16(sp)
ffffffffc020ae0c:	6aa2                	ld	s5,8(sp)
ffffffffc020ae0e:	8526                	mv	a0,s1
ffffffffc020ae10:	74a2                	ld	s1,40(sp)
ffffffffc020ae12:	6121                	addi	sp,sp,64
ffffffffc020ae14:	8082                	ret
ffffffffc020ae16:	6428                	ld	a0,72(s0)
ffffffffc020ae18:	8652                	mv	a2,s4
ffffffffc020ae1a:	85d6                	mv	a1,s5
ffffffffc020ae1c:	954a                	add	a0,a0,s2
ffffffffc020ae1e:	6f8000ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc020ae22:	642c                	ld	a1,72(s0)
ffffffffc020ae24:	4705                	li	a4,1
ffffffffc020ae26:	4685                	li	a3,1
ffffffffc020ae28:	864e                	mv	a2,s3
ffffffffc020ae2a:	8522                	mv	a0,s0
ffffffffc020ae2c:	dfdff0ef          	jal	ra,ffffffffc020ac28 <sfs_rwblock_nolock>
ffffffffc020ae30:	84aa                	mv	s1,a0
ffffffffc020ae32:	b7e9                	j	ffffffffc020adfc <sfs_wbuf+0x3c>
ffffffffc020ae34:	00004697          	auipc	a3,0x4
ffffffffc020ae38:	57468693          	addi	a3,a3,1396 # ffffffffc020f3a8 <sfs_node_fileops+0xd0>
ffffffffc020ae3c:	00001617          	auipc	a2,0x1
ffffffffc020ae40:	b6c60613          	addi	a2,a2,-1172 # ffffffffc020b9a8 <commands+0x210>
ffffffffc020ae44:	06b00593          	li	a1,107
ffffffffc020ae48:	00004517          	auipc	a0,0x4
ffffffffc020ae4c:	54850513          	addi	a0,a0,1352 # ffffffffc020f390 <sfs_node_fileops+0xb8>
ffffffffc020ae50:	e4ef50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ae54 <sfs_sync_super>:
ffffffffc020ae54:	1101                	addi	sp,sp,-32
ffffffffc020ae56:	ec06                	sd	ra,24(sp)
ffffffffc020ae58:	e822                	sd	s0,16(sp)
ffffffffc020ae5a:	e426                	sd	s1,8(sp)
ffffffffc020ae5c:	842a                	mv	s0,a0
ffffffffc020ae5e:	11a000ef          	jal	ra,ffffffffc020af78 <lock_sfs_io>
ffffffffc020ae62:	6428                	ld	a0,72(s0)
ffffffffc020ae64:	6605                	lui	a2,0x1
ffffffffc020ae66:	4581                	li	a1,0
ffffffffc020ae68:	65c000ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc020ae6c:	6428                	ld	a0,72(s0)
ffffffffc020ae6e:	85a2                	mv	a1,s0
ffffffffc020ae70:	02c00613          	li	a2,44
ffffffffc020ae74:	6a2000ef          	jal	ra,ffffffffc020b516 <memcpy>
ffffffffc020ae78:	642c                	ld	a1,72(s0)
ffffffffc020ae7a:	4701                	li	a4,0
ffffffffc020ae7c:	4685                	li	a3,1
ffffffffc020ae7e:	4601                	li	a2,0
ffffffffc020ae80:	8522                	mv	a0,s0
ffffffffc020ae82:	da7ff0ef          	jal	ra,ffffffffc020ac28 <sfs_rwblock_nolock>
ffffffffc020ae86:	84aa                	mv	s1,a0
ffffffffc020ae88:	8522                	mv	a0,s0
ffffffffc020ae8a:	0fe000ef          	jal	ra,ffffffffc020af88 <unlock_sfs_io>
ffffffffc020ae8e:	60e2                	ld	ra,24(sp)
ffffffffc020ae90:	6442                	ld	s0,16(sp)
ffffffffc020ae92:	8526                	mv	a0,s1
ffffffffc020ae94:	64a2                	ld	s1,8(sp)
ffffffffc020ae96:	6105                	addi	sp,sp,32
ffffffffc020ae98:	8082                	ret

ffffffffc020ae9a <sfs_sync_freemap>:
ffffffffc020ae9a:	7139                	addi	sp,sp,-64
ffffffffc020ae9c:	ec4e                	sd	s3,24(sp)
ffffffffc020ae9e:	e852                	sd	s4,16(sp)
ffffffffc020aea0:	00456983          	lwu	s3,4(a0)
ffffffffc020aea4:	8a2a                	mv	s4,a0
ffffffffc020aea6:	7d08                	ld	a0,56(a0)
ffffffffc020aea8:	67a1                	lui	a5,0x8
ffffffffc020aeaa:	17fd                	addi	a5,a5,-1
ffffffffc020aeac:	4581                	li	a1,0
ffffffffc020aeae:	f822                	sd	s0,48(sp)
ffffffffc020aeb0:	fc06                	sd	ra,56(sp)
ffffffffc020aeb2:	f426                	sd	s1,40(sp)
ffffffffc020aeb4:	f04a                	sd	s2,32(sp)
ffffffffc020aeb6:	e456                	sd	s5,8(sp)
ffffffffc020aeb8:	99be                	add	s3,s3,a5
ffffffffc020aeba:	a0efe0ef          	jal	ra,ffffffffc02090c8 <bitmap_getdata>
ffffffffc020aebe:	00f9d993          	srli	s3,s3,0xf
ffffffffc020aec2:	842a                	mv	s0,a0
ffffffffc020aec4:	8552                	mv	a0,s4
ffffffffc020aec6:	0b2000ef          	jal	ra,ffffffffc020af78 <lock_sfs_io>
ffffffffc020aeca:	04098163          	beqz	s3,ffffffffc020af0c <sfs_sync_freemap+0x72>
ffffffffc020aece:	09b2                	slli	s3,s3,0xc
ffffffffc020aed0:	99a2                	add	s3,s3,s0
ffffffffc020aed2:	4909                	li	s2,2
ffffffffc020aed4:	6a85                	lui	s5,0x1
ffffffffc020aed6:	a021                	j	ffffffffc020aede <sfs_sync_freemap+0x44>
ffffffffc020aed8:	2905                	addiw	s2,s2,1
ffffffffc020aeda:	02898963          	beq	s3,s0,ffffffffc020af0c <sfs_sync_freemap+0x72>
ffffffffc020aede:	85a2                	mv	a1,s0
ffffffffc020aee0:	864a                	mv	a2,s2
ffffffffc020aee2:	4705                	li	a4,1
ffffffffc020aee4:	4685                	li	a3,1
ffffffffc020aee6:	8552                	mv	a0,s4
ffffffffc020aee8:	d41ff0ef          	jal	ra,ffffffffc020ac28 <sfs_rwblock_nolock>
ffffffffc020aeec:	84aa                	mv	s1,a0
ffffffffc020aeee:	9456                	add	s0,s0,s5
ffffffffc020aef0:	d565                	beqz	a0,ffffffffc020aed8 <sfs_sync_freemap+0x3e>
ffffffffc020aef2:	8552                	mv	a0,s4
ffffffffc020aef4:	094000ef          	jal	ra,ffffffffc020af88 <unlock_sfs_io>
ffffffffc020aef8:	70e2                	ld	ra,56(sp)
ffffffffc020aefa:	7442                	ld	s0,48(sp)
ffffffffc020aefc:	7902                	ld	s2,32(sp)
ffffffffc020aefe:	69e2                	ld	s3,24(sp)
ffffffffc020af00:	6a42                	ld	s4,16(sp)
ffffffffc020af02:	6aa2                	ld	s5,8(sp)
ffffffffc020af04:	8526                	mv	a0,s1
ffffffffc020af06:	74a2                	ld	s1,40(sp)
ffffffffc020af08:	6121                	addi	sp,sp,64
ffffffffc020af0a:	8082                	ret
ffffffffc020af0c:	4481                	li	s1,0
ffffffffc020af0e:	b7d5                	j	ffffffffc020aef2 <sfs_sync_freemap+0x58>

ffffffffc020af10 <sfs_clear_block>:
ffffffffc020af10:	7179                	addi	sp,sp,-48
ffffffffc020af12:	f022                	sd	s0,32(sp)
ffffffffc020af14:	e84a                	sd	s2,16(sp)
ffffffffc020af16:	e44e                	sd	s3,8(sp)
ffffffffc020af18:	f406                	sd	ra,40(sp)
ffffffffc020af1a:	89b2                	mv	s3,a2
ffffffffc020af1c:	ec26                	sd	s1,24(sp)
ffffffffc020af1e:	892a                	mv	s2,a0
ffffffffc020af20:	842e                	mv	s0,a1
ffffffffc020af22:	056000ef          	jal	ra,ffffffffc020af78 <lock_sfs_io>
ffffffffc020af26:	04893503          	ld	a0,72(s2)
ffffffffc020af2a:	6605                	lui	a2,0x1
ffffffffc020af2c:	4581                	li	a1,0
ffffffffc020af2e:	596000ef          	jal	ra,ffffffffc020b4c4 <memset>
ffffffffc020af32:	02098d63          	beqz	s3,ffffffffc020af6c <sfs_clear_block+0x5c>
ffffffffc020af36:	013409bb          	addw	s3,s0,s3
ffffffffc020af3a:	a019                	j	ffffffffc020af40 <sfs_clear_block+0x30>
ffffffffc020af3c:	02898863          	beq	s3,s0,ffffffffc020af6c <sfs_clear_block+0x5c>
ffffffffc020af40:	04893583          	ld	a1,72(s2)
ffffffffc020af44:	8622                	mv	a2,s0
ffffffffc020af46:	4705                	li	a4,1
ffffffffc020af48:	4685                	li	a3,1
ffffffffc020af4a:	854a                	mv	a0,s2
ffffffffc020af4c:	cddff0ef          	jal	ra,ffffffffc020ac28 <sfs_rwblock_nolock>
ffffffffc020af50:	84aa                	mv	s1,a0
ffffffffc020af52:	2405                	addiw	s0,s0,1
ffffffffc020af54:	d565                	beqz	a0,ffffffffc020af3c <sfs_clear_block+0x2c>
ffffffffc020af56:	854a                	mv	a0,s2
ffffffffc020af58:	030000ef          	jal	ra,ffffffffc020af88 <unlock_sfs_io>
ffffffffc020af5c:	70a2                	ld	ra,40(sp)
ffffffffc020af5e:	7402                	ld	s0,32(sp)
ffffffffc020af60:	6942                	ld	s2,16(sp)
ffffffffc020af62:	69a2                	ld	s3,8(sp)
ffffffffc020af64:	8526                	mv	a0,s1
ffffffffc020af66:	64e2                	ld	s1,24(sp)
ffffffffc020af68:	6145                	addi	sp,sp,48
ffffffffc020af6a:	8082                	ret
ffffffffc020af6c:	4481                	li	s1,0
ffffffffc020af6e:	b7e5                	j	ffffffffc020af56 <sfs_clear_block+0x46>

ffffffffc020af70 <lock_sfs_fs>:
ffffffffc020af70:	05050513          	addi	a0,a0,80
ffffffffc020af74:	df0f906f          	j	ffffffffc0204564 <down>

ffffffffc020af78 <lock_sfs_io>:
ffffffffc020af78:	06850513          	addi	a0,a0,104
ffffffffc020af7c:	de8f906f          	j	ffffffffc0204564 <down>

ffffffffc020af80 <unlock_sfs_fs>:
ffffffffc020af80:	05050513          	addi	a0,a0,80
ffffffffc020af84:	ddcf906f          	j	ffffffffc0204560 <up>

ffffffffc020af88 <unlock_sfs_io>:
ffffffffc020af88:	06850513          	addi	a0,a0,104
ffffffffc020af8c:	dd4f906f          	j	ffffffffc0204560 <up>

ffffffffc020af90 <hash32>:
ffffffffc020af90:	9e3707b7          	lui	a5,0x9e370
ffffffffc020af94:	2785                	addiw	a5,a5,1
ffffffffc020af96:	02a7853b          	mulw	a0,a5,a0
ffffffffc020af9a:	02000793          	li	a5,32
ffffffffc020af9e:	9f8d                	subw	a5,a5,a1
ffffffffc020afa0:	00f5553b          	srlw	a0,a0,a5
ffffffffc020afa4:	8082                	ret

ffffffffc020afa6 <printnum>:
ffffffffc020afa6:	02071893          	slli	a7,a4,0x20
ffffffffc020afaa:	7139                	addi	sp,sp,-64
ffffffffc020afac:	0208d893          	srli	a7,a7,0x20
ffffffffc020afb0:	e456                	sd	s5,8(sp)
ffffffffc020afb2:	0316fab3          	remu	s5,a3,a7
ffffffffc020afb6:	f822                	sd	s0,48(sp)
ffffffffc020afb8:	f426                	sd	s1,40(sp)
ffffffffc020afba:	f04a                	sd	s2,32(sp)
ffffffffc020afbc:	ec4e                	sd	s3,24(sp)
ffffffffc020afbe:	fc06                	sd	ra,56(sp)
ffffffffc020afc0:	e852                	sd	s4,16(sp)
ffffffffc020afc2:	84aa                	mv	s1,a0
ffffffffc020afc4:	89ae                	mv	s3,a1
ffffffffc020afc6:	8932                	mv	s2,a2
ffffffffc020afc8:	fff7841b          	addiw	s0,a5,-1
ffffffffc020afcc:	2a81                	sext.w	s5,s5
ffffffffc020afce:	0516f163          	bgeu	a3,a7,ffffffffc020b010 <printnum+0x6a>
ffffffffc020afd2:	8a42                	mv	s4,a6
ffffffffc020afd4:	00805863          	blez	s0,ffffffffc020afe4 <printnum+0x3e>
ffffffffc020afd8:	347d                	addiw	s0,s0,-1
ffffffffc020afda:	864e                	mv	a2,s3
ffffffffc020afdc:	85ca                	mv	a1,s2
ffffffffc020afde:	8552                	mv	a0,s4
ffffffffc020afe0:	9482                	jalr	s1
ffffffffc020afe2:	f87d                	bnez	s0,ffffffffc020afd8 <printnum+0x32>
ffffffffc020afe4:	1a82                	slli	s5,s5,0x20
ffffffffc020afe6:	00004797          	auipc	a5,0x4
ffffffffc020afea:	40a78793          	addi	a5,a5,1034 # ffffffffc020f3f0 <sfs_node_fileops+0x118>
ffffffffc020afee:	020ada93          	srli	s5,s5,0x20
ffffffffc020aff2:	9abe                	add	s5,s5,a5
ffffffffc020aff4:	7442                	ld	s0,48(sp)
ffffffffc020aff6:	000ac503          	lbu	a0,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020affa:	70e2                	ld	ra,56(sp)
ffffffffc020affc:	6a42                	ld	s4,16(sp)
ffffffffc020affe:	6aa2                	ld	s5,8(sp)
ffffffffc020b000:	864e                	mv	a2,s3
ffffffffc020b002:	85ca                	mv	a1,s2
ffffffffc020b004:	69e2                	ld	s3,24(sp)
ffffffffc020b006:	7902                	ld	s2,32(sp)
ffffffffc020b008:	87a6                	mv	a5,s1
ffffffffc020b00a:	74a2                	ld	s1,40(sp)
ffffffffc020b00c:	6121                	addi	sp,sp,64
ffffffffc020b00e:	8782                	jr	a5
ffffffffc020b010:	0316d6b3          	divu	a3,a3,a7
ffffffffc020b014:	87a2                	mv	a5,s0
ffffffffc020b016:	f91ff0ef          	jal	ra,ffffffffc020afa6 <printnum>
ffffffffc020b01a:	b7e9                	j	ffffffffc020afe4 <printnum+0x3e>

ffffffffc020b01c <sprintputch>:
ffffffffc020b01c:	499c                	lw	a5,16(a1)
ffffffffc020b01e:	6198                	ld	a4,0(a1)
ffffffffc020b020:	6594                	ld	a3,8(a1)
ffffffffc020b022:	2785                	addiw	a5,a5,1
ffffffffc020b024:	c99c                	sw	a5,16(a1)
ffffffffc020b026:	00d77763          	bgeu	a4,a3,ffffffffc020b034 <sprintputch+0x18>
ffffffffc020b02a:	00170793          	addi	a5,a4,1
ffffffffc020b02e:	e19c                	sd	a5,0(a1)
ffffffffc020b030:	00a70023          	sb	a0,0(a4)
ffffffffc020b034:	8082                	ret

ffffffffc020b036 <vprintfmt>:
ffffffffc020b036:	7119                	addi	sp,sp,-128
ffffffffc020b038:	f4a6                	sd	s1,104(sp)
ffffffffc020b03a:	f0ca                	sd	s2,96(sp)
ffffffffc020b03c:	ecce                	sd	s3,88(sp)
ffffffffc020b03e:	e8d2                	sd	s4,80(sp)
ffffffffc020b040:	e4d6                	sd	s5,72(sp)
ffffffffc020b042:	e0da                	sd	s6,64(sp)
ffffffffc020b044:	fc5e                	sd	s7,56(sp)
ffffffffc020b046:	ec6e                	sd	s11,24(sp)
ffffffffc020b048:	fc86                	sd	ra,120(sp)
ffffffffc020b04a:	f8a2                	sd	s0,112(sp)
ffffffffc020b04c:	f862                	sd	s8,48(sp)
ffffffffc020b04e:	f466                	sd	s9,40(sp)
ffffffffc020b050:	f06a                	sd	s10,32(sp)
ffffffffc020b052:	89aa                	mv	s3,a0
ffffffffc020b054:	892e                	mv	s2,a1
ffffffffc020b056:	84b2                	mv	s1,a2
ffffffffc020b058:	8db6                	mv	s11,a3
ffffffffc020b05a:	8aba                	mv	s5,a4
ffffffffc020b05c:	02500a13          	li	s4,37
ffffffffc020b060:	5bfd                	li	s7,-1
ffffffffc020b062:	00004b17          	auipc	s6,0x4
ffffffffc020b066:	3bab0b13          	addi	s6,s6,954 # ffffffffc020f41c <sfs_node_fileops+0x144>
ffffffffc020b06a:	000dc503          	lbu	a0,0(s11) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020b06e:	001d8413          	addi	s0,s11,1
ffffffffc020b072:	01450b63          	beq	a0,s4,ffffffffc020b088 <vprintfmt+0x52>
ffffffffc020b076:	c129                	beqz	a0,ffffffffc020b0b8 <vprintfmt+0x82>
ffffffffc020b078:	864a                	mv	a2,s2
ffffffffc020b07a:	85a6                	mv	a1,s1
ffffffffc020b07c:	0405                	addi	s0,s0,1
ffffffffc020b07e:	9982                	jalr	s3
ffffffffc020b080:	fff44503          	lbu	a0,-1(s0)
ffffffffc020b084:	ff4519e3          	bne	a0,s4,ffffffffc020b076 <vprintfmt+0x40>
ffffffffc020b088:	00044583          	lbu	a1,0(s0)
ffffffffc020b08c:	02000813          	li	a6,32
ffffffffc020b090:	4d01                	li	s10,0
ffffffffc020b092:	4301                	li	t1,0
ffffffffc020b094:	5cfd                	li	s9,-1
ffffffffc020b096:	5c7d                	li	s8,-1
ffffffffc020b098:	05500513          	li	a0,85
ffffffffc020b09c:	48a5                	li	a7,9
ffffffffc020b09e:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b0a2:	0ff67613          	zext.b	a2,a2
ffffffffc020b0a6:	00140d93          	addi	s11,s0,1
ffffffffc020b0aa:	04c56263          	bltu	a0,a2,ffffffffc020b0ee <vprintfmt+0xb8>
ffffffffc020b0ae:	060a                	slli	a2,a2,0x2
ffffffffc020b0b0:	965a                	add	a2,a2,s6
ffffffffc020b0b2:	4214                	lw	a3,0(a2)
ffffffffc020b0b4:	96da                	add	a3,a3,s6
ffffffffc020b0b6:	8682                	jr	a3
ffffffffc020b0b8:	70e6                	ld	ra,120(sp)
ffffffffc020b0ba:	7446                	ld	s0,112(sp)
ffffffffc020b0bc:	74a6                	ld	s1,104(sp)
ffffffffc020b0be:	7906                	ld	s2,96(sp)
ffffffffc020b0c0:	69e6                	ld	s3,88(sp)
ffffffffc020b0c2:	6a46                	ld	s4,80(sp)
ffffffffc020b0c4:	6aa6                	ld	s5,72(sp)
ffffffffc020b0c6:	6b06                	ld	s6,64(sp)
ffffffffc020b0c8:	7be2                	ld	s7,56(sp)
ffffffffc020b0ca:	7c42                	ld	s8,48(sp)
ffffffffc020b0cc:	7ca2                	ld	s9,40(sp)
ffffffffc020b0ce:	7d02                	ld	s10,32(sp)
ffffffffc020b0d0:	6de2                	ld	s11,24(sp)
ffffffffc020b0d2:	6109                	addi	sp,sp,128
ffffffffc020b0d4:	8082                	ret
ffffffffc020b0d6:	882e                	mv	a6,a1
ffffffffc020b0d8:	00144583          	lbu	a1,1(s0)
ffffffffc020b0dc:	846e                	mv	s0,s11
ffffffffc020b0de:	00140d93          	addi	s11,s0,1
ffffffffc020b0e2:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b0e6:	0ff67613          	zext.b	a2,a2
ffffffffc020b0ea:	fcc572e3          	bgeu	a0,a2,ffffffffc020b0ae <vprintfmt+0x78>
ffffffffc020b0ee:	864a                	mv	a2,s2
ffffffffc020b0f0:	85a6                	mv	a1,s1
ffffffffc020b0f2:	02500513          	li	a0,37
ffffffffc020b0f6:	9982                	jalr	s3
ffffffffc020b0f8:	fff44783          	lbu	a5,-1(s0)
ffffffffc020b0fc:	8da2                	mv	s11,s0
ffffffffc020b0fe:	f74786e3          	beq	a5,s4,ffffffffc020b06a <vprintfmt+0x34>
ffffffffc020b102:	ffedc783          	lbu	a5,-2(s11)
ffffffffc020b106:	1dfd                	addi	s11,s11,-1
ffffffffc020b108:	ff479de3          	bne	a5,s4,ffffffffc020b102 <vprintfmt+0xcc>
ffffffffc020b10c:	bfb9                	j	ffffffffc020b06a <vprintfmt+0x34>
ffffffffc020b10e:	fd058c9b          	addiw	s9,a1,-48
ffffffffc020b112:	00144583          	lbu	a1,1(s0)
ffffffffc020b116:	846e                	mv	s0,s11
ffffffffc020b118:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b11c:	0005861b          	sext.w	a2,a1
ffffffffc020b120:	02d8e463          	bltu	a7,a3,ffffffffc020b148 <vprintfmt+0x112>
ffffffffc020b124:	00144583          	lbu	a1,1(s0)
ffffffffc020b128:	002c969b          	slliw	a3,s9,0x2
ffffffffc020b12c:	0196873b          	addw	a4,a3,s9
ffffffffc020b130:	0017171b          	slliw	a4,a4,0x1
ffffffffc020b134:	9f31                	addw	a4,a4,a2
ffffffffc020b136:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b13a:	0405                	addi	s0,s0,1
ffffffffc020b13c:	fd070c9b          	addiw	s9,a4,-48
ffffffffc020b140:	0005861b          	sext.w	a2,a1
ffffffffc020b144:	fed8f0e3          	bgeu	a7,a3,ffffffffc020b124 <vprintfmt+0xee>
ffffffffc020b148:	f40c5be3          	bgez	s8,ffffffffc020b09e <vprintfmt+0x68>
ffffffffc020b14c:	8c66                	mv	s8,s9
ffffffffc020b14e:	5cfd                	li	s9,-1
ffffffffc020b150:	b7b9                	j	ffffffffc020b09e <vprintfmt+0x68>
ffffffffc020b152:	fffc4693          	not	a3,s8
ffffffffc020b156:	96fd                	srai	a3,a3,0x3f
ffffffffc020b158:	00dc77b3          	and	a5,s8,a3
ffffffffc020b15c:	00144583          	lbu	a1,1(s0)
ffffffffc020b160:	00078c1b          	sext.w	s8,a5
ffffffffc020b164:	846e                	mv	s0,s11
ffffffffc020b166:	bf25                	j	ffffffffc020b09e <vprintfmt+0x68>
ffffffffc020b168:	000aac83          	lw	s9,0(s5)
ffffffffc020b16c:	00144583          	lbu	a1,1(s0)
ffffffffc020b170:	0aa1                	addi	s5,s5,8
ffffffffc020b172:	846e                	mv	s0,s11
ffffffffc020b174:	bfd1                	j	ffffffffc020b148 <vprintfmt+0x112>
ffffffffc020b176:	4705                	li	a4,1
ffffffffc020b178:	008a8613          	addi	a2,s5,8
ffffffffc020b17c:	00674463          	blt	a4,t1,ffffffffc020b184 <vprintfmt+0x14e>
ffffffffc020b180:	1c030c63          	beqz	t1,ffffffffc020b358 <vprintfmt+0x322>
ffffffffc020b184:	000ab683          	ld	a3,0(s5)
ffffffffc020b188:	4741                	li	a4,16
ffffffffc020b18a:	8ab2                	mv	s5,a2
ffffffffc020b18c:	2801                	sext.w	a6,a6
ffffffffc020b18e:	87e2                	mv	a5,s8
ffffffffc020b190:	8626                	mv	a2,s1
ffffffffc020b192:	85ca                	mv	a1,s2
ffffffffc020b194:	854e                	mv	a0,s3
ffffffffc020b196:	e11ff0ef          	jal	ra,ffffffffc020afa6 <printnum>
ffffffffc020b19a:	bdc1                	j	ffffffffc020b06a <vprintfmt+0x34>
ffffffffc020b19c:	000aa503          	lw	a0,0(s5)
ffffffffc020b1a0:	864a                	mv	a2,s2
ffffffffc020b1a2:	85a6                	mv	a1,s1
ffffffffc020b1a4:	0aa1                	addi	s5,s5,8
ffffffffc020b1a6:	9982                	jalr	s3
ffffffffc020b1a8:	b5c9                	j	ffffffffc020b06a <vprintfmt+0x34>
ffffffffc020b1aa:	4705                	li	a4,1
ffffffffc020b1ac:	008a8613          	addi	a2,s5,8
ffffffffc020b1b0:	00674463          	blt	a4,t1,ffffffffc020b1b8 <vprintfmt+0x182>
ffffffffc020b1b4:	18030d63          	beqz	t1,ffffffffc020b34e <vprintfmt+0x318>
ffffffffc020b1b8:	000ab683          	ld	a3,0(s5)
ffffffffc020b1bc:	4729                	li	a4,10
ffffffffc020b1be:	8ab2                	mv	s5,a2
ffffffffc020b1c0:	b7f1                	j	ffffffffc020b18c <vprintfmt+0x156>
ffffffffc020b1c2:	00144583          	lbu	a1,1(s0)
ffffffffc020b1c6:	4d05                	li	s10,1
ffffffffc020b1c8:	846e                	mv	s0,s11
ffffffffc020b1ca:	bdd1                	j	ffffffffc020b09e <vprintfmt+0x68>
ffffffffc020b1cc:	864a                	mv	a2,s2
ffffffffc020b1ce:	85a6                	mv	a1,s1
ffffffffc020b1d0:	02500513          	li	a0,37
ffffffffc020b1d4:	9982                	jalr	s3
ffffffffc020b1d6:	bd51                	j	ffffffffc020b06a <vprintfmt+0x34>
ffffffffc020b1d8:	00144583          	lbu	a1,1(s0)
ffffffffc020b1dc:	2305                	addiw	t1,t1,1
ffffffffc020b1de:	846e                	mv	s0,s11
ffffffffc020b1e0:	bd7d                	j	ffffffffc020b09e <vprintfmt+0x68>
ffffffffc020b1e2:	4705                	li	a4,1
ffffffffc020b1e4:	008a8613          	addi	a2,s5,8
ffffffffc020b1e8:	00674463          	blt	a4,t1,ffffffffc020b1f0 <vprintfmt+0x1ba>
ffffffffc020b1ec:	14030c63          	beqz	t1,ffffffffc020b344 <vprintfmt+0x30e>
ffffffffc020b1f0:	000ab683          	ld	a3,0(s5)
ffffffffc020b1f4:	4721                	li	a4,8
ffffffffc020b1f6:	8ab2                	mv	s5,a2
ffffffffc020b1f8:	bf51                	j	ffffffffc020b18c <vprintfmt+0x156>
ffffffffc020b1fa:	03000513          	li	a0,48
ffffffffc020b1fe:	864a                	mv	a2,s2
ffffffffc020b200:	85a6                	mv	a1,s1
ffffffffc020b202:	e042                	sd	a6,0(sp)
ffffffffc020b204:	9982                	jalr	s3
ffffffffc020b206:	864a                	mv	a2,s2
ffffffffc020b208:	85a6                	mv	a1,s1
ffffffffc020b20a:	07800513          	li	a0,120
ffffffffc020b20e:	9982                	jalr	s3
ffffffffc020b210:	0aa1                	addi	s5,s5,8
ffffffffc020b212:	6802                	ld	a6,0(sp)
ffffffffc020b214:	4741                	li	a4,16
ffffffffc020b216:	ff8ab683          	ld	a3,-8(s5)
ffffffffc020b21a:	bf8d                	j	ffffffffc020b18c <vprintfmt+0x156>
ffffffffc020b21c:	000ab403          	ld	s0,0(s5)
ffffffffc020b220:	008a8793          	addi	a5,s5,8
ffffffffc020b224:	e03e                	sd	a5,0(sp)
ffffffffc020b226:	14040c63          	beqz	s0,ffffffffc020b37e <vprintfmt+0x348>
ffffffffc020b22a:	11805063          	blez	s8,ffffffffc020b32a <vprintfmt+0x2f4>
ffffffffc020b22e:	02d00693          	li	a3,45
ffffffffc020b232:	0cd81963          	bne	a6,a3,ffffffffc020b304 <vprintfmt+0x2ce>
ffffffffc020b236:	00044683          	lbu	a3,0(s0)
ffffffffc020b23a:	0006851b          	sext.w	a0,a3
ffffffffc020b23e:	ce8d                	beqz	a3,ffffffffc020b278 <vprintfmt+0x242>
ffffffffc020b240:	00140a93          	addi	s5,s0,1
ffffffffc020b244:	05e00413          	li	s0,94
ffffffffc020b248:	000cc563          	bltz	s9,ffffffffc020b252 <vprintfmt+0x21c>
ffffffffc020b24c:	3cfd                	addiw	s9,s9,-1
ffffffffc020b24e:	037c8363          	beq	s9,s7,ffffffffc020b274 <vprintfmt+0x23e>
ffffffffc020b252:	864a                	mv	a2,s2
ffffffffc020b254:	85a6                	mv	a1,s1
ffffffffc020b256:	100d0663          	beqz	s10,ffffffffc020b362 <vprintfmt+0x32c>
ffffffffc020b25a:	3681                	addiw	a3,a3,-32
ffffffffc020b25c:	10d47363          	bgeu	s0,a3,ffffffffc020b362 <vprintfmt+0x32c>
ffffffffc020b260:	03f00513          	li	a0,63
ffffffffc020b264:	9982                	jalr	s3
ffffffffc020b266:	000ac683          	lbu	a3,0(s5)
ffffffffc020b26a:	3c7d                	addiw	s8,s8,-1
ffffffffc020b26c:	0a85                	addi	s5,s5,1
ffffffffc020b26e:	0006851b          	sext.w	a0,a3
ffffffffc020b272:	faf9                	bnez	a3,ffffffffc020b248 <vprintfmt+0x212>
ffffffffc020b274:	01805a63          	blez	s8,ffffffffc020b288 <vprintfmt+0x252>
ffffffffc020b278:	3c7d                	addiw	s8,s8,-1
ffffffffc020b27a:	864a                	mv	a2,s2
ffffffffc020b27c:	85a6                	mv	a1,s1
ffffffffc020b27e:	02000513          	li	a0,32
ffffffffc020b282:	9982                	jalr	s3
ffffffffc020b284:	fe0c1ae3          	bnez	s8,ffffffffc020b278 <vprintfmt+0x242>
ffffffffc020b288:	6a82                	ld	s5,0(sp)
ffffffffc020b28a:	b3c5                	j	ffffffffc020b06a <vprintfmt+0x34>
ffffffffc020b28c:	4705                	li	a4,1
ffffffffc020b28e:	008a8d13          	addi	s10,s5,8
ffffffffc020b292:	00674463          	blt	a4,t1,ffffffffc020b29a <vprintfmt+0x264>
ffffffffc020b296:	0a030463          	beqz	t1,ffffffffc020b33e <vprintfmt+0x308>
ffffffffc020b29a:	000ab403          	ld	s0,0(s5)
ffffffffc020b29e:	0c044463          	bltz	s0,ffffffffc020b366 <vprintfmt+0x330>
ffffffffc020b2a2:	86a2                	mv	a3,s0
ffffffffc020b2a4:	8aea                	mv	s5,s10
ffffffffc020b2a6:	4729                	li	a4,10
ffffffffc020b2a8:	b5d5                	j	ffffffffc020b18c <vprintfmt+0x156>
ffffffffc020b2aa:	000aa783          	lw	a5,0(s5)
ffffffffc020b2ae:	46e1                	li	a3,24
ffffffffc020b2b0:	0aa1                	addi	s5,s5,8
ffffffffc020b2b2:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b2b6:	8fb9                	xor	a5,a5,a4
ffffffffc020b2b8:	40e7873b          	subw	a4,a5,a4
ffffffffc020b2bc:	02e6c663          	blt	a3,a4,ffffffffc020b2e8 <vprintfmt+0x2b2>
ffffffffc020b2c0:	00371793          	slli	a5,a4,0x3
ffffffffc020b2c4:	00004697          	auipc	a3,0x4
ffffffffc020b2c8:	48c68693          	addi	a3,a3,1164 # ffffffffc020f750 <error_string>
ffffffffc020b2cc:	97b6                	add	a5,a5,a3
ffffffffc020b2ce:	639c                	ld	a5,0(a5)
ffffffffc020b2d0:	cf81                	beqz	a5,ffffffffc020b2e8 <vprintfmt+0x2b2>
ffffffffc020b2d2:	873e                	mv	a4,a5
ffffffffc020b2d4:	00000697          	auipc	a3,0x0
ffffffffc020b2d8:	28468693          	addi	a3,a3,644 # ffffffffc020b558 <etext+0x2a>
ffffffffc020b2dc:	8626                	mv	a2,s1
ffffffffc020b2de:	85ca                	mv	a1,s2
ffffffffc020b2e0:	854e                	mv	a0,s3
ffffffffc020b2e2:	0d4000ef          	jal	ra,ffffffffc020b3b6 <printfmt>
ffffffffc020b2e6:	b351                	j	ffffffffc020b06a <vprintfmt+0x34>
ffffffffc020b2e8:	00004697          	auipc	a3,0x4
ffffffffc020b2ec:	12868693          	addi	a3,a3,296 # ffffffffc020f410 <sfs_node_fileops+0x138>
ffffffffc020b2f0:	8626                	mv	a2,s1
ffffffffc020b2f2:	85ca                	mv	a1,s2
ffffffffc020b2f4:	854e                	mv	a0,s3
ffffffffc020b2f6:	0c0000ef          	jal	ra,ffffffffc020b3b6 <printfmt>
ffffffffc020b2fa:	bb85                	j	ffffffffc020b06a <vprintfmt+0x34>
ffffffffc020b2fc:	00004417          	auipc	s0,0x4
ffffffffc020b300:	10c40413          	addi	s0,s0,268 # ffffffffc020f408 <sfs_node_fileops+0x130>
ffffffffc020b304:	85e6                	mv	a1,s9
ffffffffc020b306:	8522                	mv	a0,s0
ffffffffc020b308:	e442                	sd	a6,8(sp)
ffffffffc020b30a:	132000ef          	jal	ra,ffffffffc020b43c <strnlen>
ffffffffc020b30e:	40ac0c3b          	subw	s8,s8,a0
ffffffffc020b312:	01805c63          	blez	s8,ffffffffc020b32a <vprintfmt+0x2f4>
ffffffffc020b316:	6822                	ld	a6,8(sp)
ffffffffc020b318:	00080a9b          	sext.w	s5,a6
ffffffffc020b31c:	3c7d                	addiw	s8,s8,-1
ffffffffc020b31e:	864a                	mv	a2,s2
ffffffffc020b320:	85a6                	mv	a1,s1
ffffffffc020b322:	8556                	mv	a0,s5
ffffffffc020b324:	9982                	jalr	s3
ffffffffc020b326:	fe0c1be3          	bnez	s8,ffffffffc020b31c <vprintfmt+0x2e6>
ffffffffc020b32a:	00044683          	lbu	a3,0(s0)
ffffffffc020b32e:	00140a93          	addi	s5,s0,1
ffffffffc020b332:	0006851b          	sext.w	a0,a3
ffffffffc020b336:	daa9                	beqz	a3,ffffffffc020b288 <vprintfmt+0x252>
ffffffffc020b338:	05e00413          	li	s0,94
ffffffffc020b33c:	b731                	j	ffffffffc020b248 <vprintfmt+0x212>
ffffffffc020b33e:	000aa403          	lw	s0,0(s5)
ffffffffc020b342:	bfb1                	j	ffffffffc020b29e <vprintfmt+0x268>
ffffffffc020b344:	000ae683          	lwu	a3,0(s5)
ffffffffc020b348:	4721                	li	a4,8
ffffffffc020b34a:	8ab2                	mv	s5,a2
ffffffffc020b34c:	b581                	j	ffffffffc020b18c <vprintfmt+0x156>
ffffffffc020b34e:	000ae683          	lwu	a3,0(s5)
ffffffffc020b352:	4729                	li	a4,10
ffffffffc020b354:	8ab2                	mv	s5,a2
ffffffffc020b356:	bd1d                	j	ffffffffc020b18c <vprintfmt+0x156>
ffffffffc020b358:	000ae683          	lwu	a3,0(s5)
ffffffffc020b35c:	4741                	li	a4,16
ffffffffc020b35e:	8ab2                	mv	s5,a2
ffffffffc020b360:	b535                	j	ffffffffc020b18c <vprintfmt+0x156>
ffffffffc020b362:	9982                	jalr	s3
ffffffffc020b364:	b709                	j	ffffffffc020b266 <vprintfmt+0x230>
ffffffffc020b366:	864a                	mv	a2,s2
ffffffffc020b368:	85a6                	mv	a1,s1
ffffffffc020b36a:	02d00513          	li	a0,45
ffffffffc020b36e:	e042                	sd	a6,0(sp)
ffffffffc020b370:	9982                	jalr	s3
ffffffffc020b372:	6802                	ld	a6,0(sp)
ffffffffc020b374:	8aea                	mv	s5,s10
ffffffffc020b376:	408006b3          	neg	a3,s0
ffffffffc020b37a:	4729                	li	a4,10
ffffffffc020b37c:	bd01                	j	ffffffffc020b18c <vprintfmt+0x156>
ffffffffc020b37e:	03805163          	blez	s8,ffffffffc020b3a0 <vprintfmt+0x36a>
ffffffffc020b382:	02d00693          	li	a3,45
ffffffffc020b386:	f6d81be3          	bne	a6,a3,ffffffffc020b2fc <vprintfmt+0x2c6>
ffffffffc020b38a:	00004417          	auipc	s0,0x4
ffffffffc020b38e:	07e40413          	addi	s0,s0,126 # ffffffffc020f408 <sfs_node_fileops+0x130>
ffffffffc020b392:	02800693          	li	a3,40
ffffffffc020b396:	02800513          	li	a0,40
ffffffffc020b39a:	00140a93          	addi	s5,s0,1
ffffffffc020b39e:	b55d                	j	ffffffffc020b244 <vprintfmt+0x20e>
ffffffffc020b3a0:	00004a97          	auipc	s5,0x4
ffffffffc020b3a4:	069a8a93          	addi	s5,s5,105 # ffffffffc020f409 <sfs_node_fileops+0x131>
ffffffffc020b3a8:	02800513          	li	a0,40
ffffffffc020b3ac:	02800693          	li	a3,40
ffffffffc020b3b0:	05e00413          	li	s0,94
ffffffffc020b3b4:	bd51                	j	ffffffffc020b248 <vprintfmt+0x212>

ffffffffc020b3b6 <printfmt>:
ffffffffc020b3b6:	7139                	addi	sp,sp,-64
ffffffffc020b3b8:	02010313          	addi	t1,sp,32
ffffffffc020b3bc:	f03a                	sd	a4,32(sp)
ffffffffc020b3be:	871a                	mv	a4,t1
ffffffffc020b3c0:	ec06                	sd	ra,24(sp)
ffffffffc020b3c2:	f43e                	sd	a5,40(sp)
ffffffffc020b3c4:	f842                	sd	a6,48(sp)
ffffffffc020b3c6:	fc46                	sd	a7,56(sp)
ffffffffc020b3c8:	e41a                	sd	t1,8(sp)
ffffffffc020b3ca:	c6dff0ef          	jal	ra,ffffffffc020b036 <vprintfmt>
ffffffffc020b3ce:	60e2                	ld	ra,24(sp)
ffffffffc020b3d0:	6121                	addi	sp,sp,64
ffffffffc020b3d2:	8082                	ret

ffffffffc020b3d4 <snprintf>:
ffffffffc020b3d4:	711d                	addi	sp,sp,-96
ffffffffc020b3d6:	15fd                	addi	a1,a1,-1
ffffffffc020b3d8:	03810313          	addi	t1,sp,56
ffffffffc020b3dc:	95aa                	add	a1,a1,a0
ffffffffc020b3de:	f406                	sd	ra,40(sp)
ffffffffc020b3e0:	fc36                	sd	a3,56(sp)
ffffffffc020b3e2:	e0ba                	sd	a4,64(sp)
ffffffffc020b3e4:	e4be                	sd	a5,72(sp)
ffffffffc020b3e6:	e8c2                	sd	a6,80(sp)
ffffffffc020b3e8:	ecc6                	sd	a7,88(sp)
ffffffffc020b3ea:	e01a                	sd	t1,0(sp)
ffffffffc020b3ec:	e42a                	sd	a0,8(sp)
ffffffffc020b3ee:	e82e                	sd	a1,16(sp)
ffffffffc020b3f0:	cc02                	sw	zero,24(sp)
ffffffffc020b3f2:	c515                	beqz	a0,ffffffffc020b41e <snprintf+0x4a>
ffffffffc020b3f4:	02a5e563          	bltu	a1,a0,ffffffffc020b41e <snprintf+0x4a>
ffffffffc020b3f8:	75dd                	lui	a1,0xffff7
ffffffffc020b3fa:	86b2                	mv	a3,a2
ffffffffc020b3fc:	00000517          	auipc	a0,0x0
ffffffffc020b400:	c2050513          	addi	a0,a0,-992 # ffffffffc020b01c <sprintputch>
ffffffffc020b404:	871a                	mv	a4,t1
ffffffffc020b406:	0030                	addi	a2,sp,8
ffffffffc020b408:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc020b40c:	c2bff0ef          	jal	ra,ffffffffc020b036 <vprintfmt>
ffffffffc020b410:	67a2                	ld	a5,8(sp)
ffffffffc020b412:	00078023          	sb	zero,0(a5)
ffffffffc020b416:	4562                	lw	a0,24(sp)
ffffffffc020b418:	70a2                	ld	ra,40(sp)
ffffffffc020b41a:	6125                	addi	sp,sp,96
ffffffffc020b41c:	8082                	ret
ffffffffc020b41e:	5575                	li	a0,-3
ffffffffc020b420:	bfe5                	j	ffffffffc020b418 <snprintf+0x44>

ffffffffc020b422 <strlen>:
ffffffffc020b422:	00054783          	lbu	a5,0(a0)
ffffffffc020b426:	872a                	mv	a4,a0
ffffffffc020b428:	4501                	li	a0,0
ffffffffc020b42a:	cb81                	beqz	a5,ffffffffc020b43a <strlen+0x18>
ffffffffc020b42c:	0505                	addi	a0,a0,1
ffffffffc020b42e:	00a707b3          	add	a5,a4,a0
ffffffffc020b432:	0007c783          	lbu	a5,0(a5)
ffffffffc020b436:	fbfd                	bnez	a5,ffffffffc020b42c <strlen+0xa>
ffffffffc020b438:	8082                	ret
ffffffffc020b43a:	8082                	ret

ffffffffc020b43c <strnlen>:
ffffffffc020b43c:	4781                	li	a5,0
ffffffffc020b43e:	e589                	bnez	a1,ffffffffc020b448 <strnlen+0xc>
ffffffffc020b440:	a811                	j	ffffffffc020b454 <strnlen+0x18>
ffffffffc020b442:	0785                	addi	a5,a5,1
ffffffffc020b444:	00f58863          	beq	a1,a5,ffffffffc020b454 <strnlen+0x18>
ffffffffc020b448:	00f50733          	add	a4,a0,a5
ffffffffc020b44c:	00074703          	lbu	a4,0(a4)
ffffffffc020b450:	fb6d                	bnez	a4,ffffffffc020b442 <strnlen+0x6>
ffffffffc020b452:	85be                	mv	a1,a5
ffffffffc020b454:	852e                	mv	a0,a1
ffffffffc020b456:	8082                	ret

ffffffffc020b458 <strcpy>:
ffffffffc020b458:	87aa                	mv	a5,a0
ffffffffc020b45a:	0005c703          	lbu	a4,0(a1)
ffffffffc020b45e:	0785                	addi	a5,a5,1
ffffffffc020b460:	0585                	addi	a1,a1,1
ffffffffc020b462:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b466:	fb75                	bnez	a4,ffffffffc020b45a <strcpy+0x2>
ffffffffc020b468:	8082                	ret

ffffffffc020b46a <strcmp>:
ffffffffc020b46a:	00054783          	lbu	a5,0(a0)
ffffffffc020b46e:	0005c703          	lbu	a4,0(a1)
ffffffffc020b472:	cb89                	beqz	a5,ffffffffc020b484 <strcmp+0x1a>
ffffffffc020b474:	0505                	addi	a0,a0,1
ffffffffc020b476:	0585                	addi	a1,a1,1
ffffffffc020b478:	fee789e3          	beq	a5,a4,ffffffffc020b46a <strcmp>
ffffffffc020b47c:	0007851b          	sext.w	a0,a5
ffffffffc020b480:	9d19                	subw	a0,a0,a4
ffffffffc020b482:	8082                	ret
ffffffffc020b484:	4501                	li	a0,0
ffffffffc020b486:	bfed                	j	ffffffffc020b480 <strcmp+0x16>

ffffffffc020b488 <strncmp>:
ffffffffc020b488:	c20d                	beqz	a2,ffffffffc020b4aa <strncmp+0x22>
ffffffffc020b48a:	962e                	add	a2,a2,a1
ffffffffc020b48c:	a031                	j	ffffffffc020b498 <strncmp+0x10>
ffffffffc020b48e:	0505                	addi	a0,a0,1
ffffffffc020b490:	00e79a63          	bne	a5,a4,ffffffffc020b4a4 <strncmp+0x1c>
ffffffffc020b494:	00b60b63          	beq	a2,a1,ffffffffc020b4aa <strncmp+0x22>
ffffffffc020b498:	00054783          	lbu	a5,0(a0)
ffffffffc020b49c:	0585                	addi	a1,a1,1
ffffffffc020b49e:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020b4a2:	f7f5                	bnez	a5,ffffffffc020b48e <strncmp+0x6>
ffffffffc020b4a4:	40e7853b          	subw	a0,a5,a4
ffffffffc020b4a8:	8082                	ret
ffffffffc020b4aa:	4501                	li	a0,0
ffffffffc020b4ac:	8082                	ret

ffffffffc020b4ae <strchr>:
ffffffffc020b4ae:	00054783          	lbu	a5,0(a0)
ffffffffc020b4b2:	c799                	beqz	a5,ffffffffc020b4c0 <strchr+0x12>
ffffffffc020b4b4:	00f58763          	beq	a1,a5,ffffffffc020b4c2 <strchr+0x14>
ffffffffc020b4b8:	00154783          	lbu	a5,1(a0)
ffffffffc020b4bc:	0505                	addi	a0,a0,1
ffffffffc020b4be:	fbfd                	bnez	a5,ffffffffc020b4b4 <strchr+0x6>
ffffffffc020b4c0:	4501                	li	a0,0
ffffffffc020b4c2:	8082                	ret

ffffffffc020b4c4 <memset>:
ffffffffc020b4c4:	ca01                	beqz	a2,ffffffffc020b4d4 <memset+0x10>
ffffffffc020b4c6:	962a                	add	a2,a2,a0
ffffffffc020b4c8:	87aa                	mv	a5,a0
ffffffffc020b4ca:	0785                	addi	a5,a5,1
ffffffffc020b4cc:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020b4d0:	fec79de3          	bne	a5,a2,ffffffffc020b4ca <memset+0x6>
ffffffffc020b4d4:	8082                	ret

ffffffffc020b4d6 <memmove>:
ffffffffc020b4d6:	02a5f263          	bgeu	a1,a0,ffffffffc020b4fa <memmove+0x24>
ffffffffc020b4da:	00c587b3          	add	a5,a1,a2
ffffffffc020b4de:	00f57e63          	bgeu	a0,a5,ffffffffc020b4fa <memmove+0x24>
ffffffffc020b4e2:	00c50733          	add	a4,a0,a2
ffffffffc020b4e6:	c615                	beqz	a2,ffffffffc020b512 <memmove+0x3c>
ffffffffc020b4e8:	fff7c683          	lbu	a3,-1(a5)
ffffffffc020b4ec:	17fd                	addi	a5,a5,-1
ffffffffc020b4ee:	177d                	addi	a4,a4,-1
ffffffffc020b4f0:	00d70023          	sb	a3,0(a4)
ffffffffc020b4f4:	fef59ae3          	bne	a1,a5,ffffffffc020b4e8 <memmove+0x12>
ffffffffc020b4f8:	8082                	ret
ffffffffc020b4fa:	00c586b3          	add	a3,a1,a2
ffffffffc020b4fe:	87aa                	mv	a5,a0
ffffffffc020b500:	ca11                	beqz	a2,ffffffffc020b514 <memmove+0x3e>
ffffffffc020b502:	0005c703          	lbu	a4,0(a1)
ffffffffc020b506:	0585                	addi	a1,a1,1
ffffffffc020b508:	0785                	addi	a5,a5,1
ffffffffc020b50a:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b50e:	fed59ae3          	bne	a1,a3,ffffffffc020b502 <memmove+0x2c>
ffffffffc020b512:	8082                	ret
ffffffffc020b514:	8082                	ret

ffffffffc020b516 <memcpy>:
ffffffffc020b516:	ca19                	beqz	a2,ffffffffc020b52c <memcpy+0x16>
ffffffffc020b518:	962e                	add	a2,a2,a1
ffffffffc020b51a:	87aa                	mv	a5,a0
ffffffffc020b51c:	0005c703          	lbu	a4,0(a1)
ffffffffc020b520:	0585                	addi	a1,a1,1
ffffffffc020b522:	0785                	addi	a5,a5,1
ffffffffc020b524:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b528:	fec59ae3          	bne	a1,a2,ffffffffc020b51c <memcpy+0x6>
ffffffffc020b52c:	8082                	ret
