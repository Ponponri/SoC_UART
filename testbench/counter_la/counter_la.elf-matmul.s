	.file	"matmul.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ponponri/Desktop/shared_folder/SoCLab-ExtraLab_1226_uart/SoCLab-ExtraLab/testbench/counter_la" "../../firmware/matmul.c"
	.globl	__mulsi3
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB0:
	.file 1 "../../firmware/matmul.c"
	.loc 1 4 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	sw	s10,16(sp)
	sw	s11,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	.loc 1 5 2
.LVL0:
	.loc 1 6 2
	.loc 1 7 2
	.loc 1 8 2
	.loc 1 9 2
	.loc 1 10 2
	.loc 1 11 2
	.loc 1 11 13
	lui	s7,%hi(.LANCHOR0)
	addi	s7,s7,%lo(.LANCHOR0)
	addi	s3,s7,16
	lui	s9,%hi(.LANCHOR1)
	addi	s9,s9,%lo(.LANCHOR1)
	.loc 1 12 9 is_stmt 0
	li	s10,0
	lui	s11,%hi(.LANCHOR0)
	addi	s11,s11,%lo(.LANCHOR0)
	.loc 1 12 14
	li	s8,4
.LVL1:
.L2:
	.loc 1 12 14 is_stmt 1
	addi	s6,s11,64
	.loc 1 13 8 is_stmt 0
	mv	s5,s9
	.loc 1 12 9
	li	s4,0
.LVL2:
.L6:
	.loc 1 14 15 is_stmt 1
	.loc 1 4 1 is_stmt 0
	mv	s1,s6
	mv	s0,s7
	.loc 1 13 8
	li	s2,0
.LVL3:
.L3:
	.loc 1 15 5 is_stmt 1 discriminator 3
	.loc 1 15 25 is_stmt 0 discriminator 3
	lw	a1,0(s1)
	lw	a0,0(s0)
	call	__mulsi3
.LVL4:
	.loc 1 15 9 discriminator 3
	add	s2,s2,a0
.LVL5:
	.loc 1 14 19 is_stmt 1 discriminator 3
	.loc 1 14 15 discriminator 3
	addi	s0,s0,4
	addi	s1,s1,16
	bne	s0,s3,.L3
	.loc 1 16 4 discriminator 2
	.loc 1 16 22 is_stmt 0 discriminator 2
	sw	s2,0(s5)
	.loc 1 12 19 is_stmt 1 discriminator 2
	addi	s4,s4,1
.LVL6:
	.loc 1 12 14 discriminator 2
	addi	s5,s5,4
	addi	s6,s6,4
	bne	s4,s8,.L6
	.loc 1 11 18 discriminator 2
	.loc 1 11 13 discriminator 2
	addi	s10,s10,4
	addi	s7,s7,16
	addi	s3,s3,16
	addi	s9,s9,16
	li	a5,16
	bne	s10,a5,.L2
	.loc 1 20 2
	.loc 1 20 9 is_stmt 0
	lui	a0,%hi(.LANCHOR1)
	.loc 1 21 1
	addi	a0,a0,%lo(.LANCHOR1)
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
.LVL7:
	lw	s3,44(sp)
	.cfi_restore 19
	lw	s4,40(sp)
	.cfi_restore 20
.LVL8:
	lw	s5,36(sp)
	.cfi_restore 21
.LVL9:
	lw	s6,32(sp)
	.cfi_restore 22
	lw	s7,28(sp)
	.cfi_restore 23
	lw	s8,24(sp)
	.cfi_restore 24
	lw	s9,20(sp)
	.cfi_restore 25
	lw	s10,16(sp)
	.cfi_restore 26
	lw	s11,12(sp)
	.cfi_restore 27
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	matmul, .-matmul
	.globl	result
	.globl	B
	.globl	A
	.globl	mat_addr
	.globl	mat_ptr
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	result, @object
	.size	result, 64
result:
	.zero	64
	.section	.adder,"aw"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	A, @object
	.size	A, 64
A:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.type	B, @object
	.size	B, 64
B:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.section	.sbss,"aw",@nobits
	.align	2
	.type	mat_ptr, @object
	.size	mat_ptr, 4
mat_ptr:
	.zero	4
	.section	.sdata,"aw"
	.align	2
	.type	mat_addr, @object
	.size	mat_addr, 4
mat_addr:
	.word	806354944
	.text
.Letext0:
	.file 2 "../../firmware/matmul.h"
	.file 3 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x15a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x6
	.4byte	.LASF15
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL4
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x7
	.4byte	.LASF16
	.byte	0x3
	.byte	0x34
	.byte	0x1b
	.4byte	0x61
	.byte	0x8
	.4byte	0x50
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x3
	.4byte	.LASF11
	.byte	0x7
	.byte	0x14
	.4byte	0x8e
	.byte	0x5
	.byte	0x3
	.4byte	mat_ptr
	.byte	0x4
	.4byte	0x5c
	.byte	0x3
	.4byte	.LASF12
	.byte	0x8
	.byte	0x13
	.4byte	0x5c
	.byte	0x5
	.byte	0x3
	.4byte	mat_addr
	.byte	0xa
	.4byte	0x6f
	.4byte	0xb4
	.byte	0xb
	.4byte	0x76
	.byte	0xf
	.byte	0
	.byte	0x5
	.string	"A"
	.byte	0xb
	.4byte	0xa4
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0x5
	.string	"B"
	.byte	0x10
	.4byte	0xa4
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x3
	.4byte	.LASF13
	.byte	0x15
	.byte	0x6
	.4byte	0xa4
	.byte	0x5
	.byte	0x3
	.4byte	result
	.byte	0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x3
	.byte	0x33
	.4byte	0x14f
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x14f
	.byte	0x2
	.string	"i"
	.byte	0x5
	.4byte	0x6f
	.4byte	.LLST0
	.byte	0x2
	.string	"j"
	.byte	0x6
	.4byte	0x6f
	.4byte	.LLST1
	.byte	0x2
	.string	"k"
	.byte	0x7
	.4byte	0x6f
	.4byte	.LLST2
	.byte	0x2
	.string	"sum"
	.byte	0x8
	.4byte	0x6f
	.4byte	.LLST3
	.byte	0xd
	.string	"kk"
	.byte	0x1
	.byte	0x9
	.byte	0x6
	.4byte	0x6f
	.byte	0xe
	.4byte	.LASF14
	.byte	0x1
	.byte	0xa
	.byte	0xf
	.4byte	0x76
	.byte	0
	.byte	0xf
	.4byte	.LVL4
	.4byte	0x154
	.byte	0
	.byte	0x4
	.4byte	0x6f
	.byte	0x10
	.4byte	.LASF18
	.4byte	.LASF18
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x31
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL8
	.byte	0x1
	.byte	0x64
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL7
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL9
	.byte	0x2
	.byte	0x85
	.byte	0x7c
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL4:
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"count"
.LASF15:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O1 -ffreestanding"
.LASF12:
	.string	"mat_addr"
.LASF17:
	.string	"matmul"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF18:
	.string	"__mulsi3"
.LASF10:
	.string	"unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF13:
	.string	"result"
.LASF5:
	.string	"long long int"
.LASF3:
	.string	"short int"
.LASF11:
	.string	"mat_ptr"
.LASF16:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ponponri/Desktop/shared_folder/SoCLab-ExtraLab_1226_uart/SoCLab-ExtraLab/testbench/counter_la"
.LASF0:
	.string	"../../firmware/matmul.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
