	.file	"counter_la.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/mnt/hgfs/shared_folder/SOC_Final_UART_FIFO/SoCLab-ExtraLab/testbench/counter_la" "counter_la.c"
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB316:
	.file 1 "../../firmware/stub.c"
	.loc 1 19 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	.loc 1 20 2
	.loc 1 20 5 is_stmt 0
	li	a5,10
	beq	a0,a5,.L6
.LVL1:
.L2:
	.loc 1 22 13 discriminator 1
	li	a3,-268410880
	.loc 1 22 60 discriminator 1
	li	a4,1
.L3:
	.loc 1 22 60 is_stmt 1 discriminator 1
	.loc 1 22 13 is_stmt 0 discriminator 1
	lw	a5,-2044(a3)
	.loc 1 22 60 discriminator 1
	beq	a5,a4,.L3
	.loc 1 23 2 is_stmt 1
	.loc 1 23 50 is_stmt 0
	li	a5,-268410880
	sw	s0,-2048(a5)
	.loc 1 24 1
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL2:
.L6:
	.cfi_restore_state
	.loc 1 21 3 is_stmt 1
	li	a0,13
.LVL3:
	call	putchar
.LVL4:
	j	.L2
	.cfi_endproc
.LFE316:
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
.LFB317:
	.loc 1 27 1
	.cfi_startproc
.LVL5:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	.loc 1 28 2
	.loc 1 28 9
	lbu	a0,0(a0)
.LVL6:
	beq	a0,zero,.L7
.L9:
	.loc 1 29 3
	.loc 1 29 14 is_stmt 0
	addi	s0,s0,1
.LVL7:
	.loc 1 29 3
	call	putchar
.LVL8:
	.loc 1 28 9 is_stmt 1
	lbu	a0,0(s0)
	bne	a0,zero,.L9
.L7:
	.loc 1 30 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL9:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE317:
	.size	print, .-print
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB323:
	.file 2 "counter_la.c"
	.loc 2 50 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.loc 2 53 5
	.loc 2 81 3
	.loc 2 81 51 is_stmt 0
	li	a2,1
	li	a5,-268419072
	sw	a2,-2048(a5)
	.loc 2 116 3 is_stmt 1
	.loc 2 116 37 is_stmt 0
	li	a5,637534208
	li	a3,8192
	addi	a4,a3,-2039
	sw	a4,160(a5)
	.loc 2 117 3 is_stmt 1
	.loc 2 117 37 is_stmt 0
	sw	a4,156(a5)
	.loc 2 118 3 is_stmt 1
	.loc 2 118 37 is_stmt 0
	sw	a4,152(a5)
	.loc 2 119 3 is_stmt 1
	.loc 2 119 37 is_stmt 0
	sw	a4,148(a5)
	.loc 2 120 3 is_stmt 1
	.loc 2 120 37 is_stmt 0
	sw	a4,144(a5)
	.loc 2 121 3 is_stmt 1
	.loc 2 121 37 is_stmt 0
	sw	a4,140(a5)
	.loc 2 122 3 is_stmt 1
	.loc 2 122 37 is_stmt 0
	sw	a4,136(a5)
	.loc 2 123 3 is_stmt 1
	.loc 2 123 37 is_stmt 0
	sw	a4,132(a5)
	.loc 2 124 3 is_stmt 1
	.loc 2 124 37 is_stmt 0
	sw	a4,128(a5)
	.loc 2 125 3 is_stmt 1
	.loc 2 125 37 is_stmt 0
	sw	a4,124(a5)
	.loc 2 126 3 is_stmt 1
	.loc 2 126 37 is_stmt 0
	sw	a4,120(a5)
	.loc 2 127 3 is_stmt 1
	.loc 2 127 37 is_stmt 0
	sw	a4,116(a5)
	.loc 2 128 3 is_stmt 1
	.loc 2 128 37 is_stmt 0
	sw	a4,112(a5)
	.loc 2 129 3 is_stmt 1
	.loc 2 129 37 is_stmt 0
	sw	a4,108(a5)
	.loc 2 130 3 is_stmt 1
	.loc 2 130 37 is_stmt 0
	sw	a4,104(a5)
	.loc 2 131 3 is_stmt 1
	.loc 2 131 37 is_stmt 0
	sw	a4,100(a5)
	.loc 2 133 3 is_stmt 1
	.loc 2 133 37 is_stmt 0
	sw	a4,96(a5)
	.loc 2 134 3 is_stmt 1
	.loc 2 134 37 is_stmt 0
	sw	a4,92(a5)
	.loc 2 135 3 is_stmt 1
	.loc 2 135 37 is_stmt 0
	sw	a4,88(a5)
	.loc 2 136 3 is_stmt 1
	.loc 2 136 37 is_stmt 0
	sw	a4,84(a5)
	.loc 2 137 3 is_stmt 1
	.loc 2 137 37 is_stmt 0
	sw	a4,80(a5)
	.loc 2 138 3 is_stmt 1
	.loc 2 138 37 is_stmt 0
	sw	a4,76(a5)
	.loc 2 139 3 is_stmt 1
	.loc 2 139 37 is_stmt 0
	sw	a4,72(a5)
	.loc 2 140 3 is_stmt 1
	.loc 2 140 37 is_stmt 0
	sw	a4,68(a5)
	.loc 2 141 3 is_stmt 1
	.loc 2 141 37 is_stmt 0
	sw	a4,64(a5)
	.loc 2 142 3 is_stmt 1
	.loc 2 142 37 is_stmt 0
	sw	a4,52(a5)
	.loc 2 143 3 is_stmt 1
	.loc 2 143 37 is_stmt 0
	sw	a4,48(a5)
	.loc 2 144 3 is_stmt 1
	.loc 2 144 37 is_stmt 0
	sw	a4,44(a5)
	.loc 2 145 3 is_stmt 1
	.loc 2 145 37 is_stmt 0
	sw	a4,40(a5)
	.loc 2 146 3 is_stmt 1
	.loc 2 146 37 is_stmt 0
	sw	a4,36(a5)
	.loc 2 149 3 is_stmt 1
	.loc 2 149 37 is_stmt 0
	addi	a3,a3,-2040
	sw	a3,60(a5)
	.loc 2 151 3 is_stmt 1
	.loc 2 151 37 is_stmt 0
	li	a4,1027
	sw	a4,56(a5)
	.loc 2 159 2 is_stmt 1
	.loc 2 159 36 is_stmt 0
	sw	a2,0(a5)
	.loc 2 160 2 is_stmt 1
	.loc 2 160 10 is_stmt 0
	li	a3,637534208
	.loc 2 160 43
	li	a4,1
.L13:
	.loc 2 160 43 is_stmt 1 discriminator 1
	.loc 2 160 10 is_stmt 0 discriminator 1
	lw	a5,0(a3)
	.loc 2 160 43 discriminator 1
	beq	a5,a4,.L13
	.loc 2 164 2 is_stmt 1
	.loc 2 164 114 is_stmt 0
	li	a5,-268423168
	sw	zero,12(a5)
	.loc 2 164 57
	sw	zero,28(a5)
	.loc 2 165 2 is_stmt 1
	.loc 2 165 112 is_stmt 0
	li	a4,-1
	sw	a4,8(a5)
	.loc 2 165 56
	sw	a4,24(a5)
	.loc 2 166 2 is_stmt 1
	.loc 2 166 112 is_stmt 0
	sw	zero,4(a5)
	.loc 2 166 56
	sw	zero,20(a5)
	.loc 2 167 2 is_stmt 1
	.loc 2 167 100 is_stmt 0
	sw	zero,0(a5)
	.loc 2 167 50
	sw	zero,16(a5)
	.loc 2 170 2 is_stmt 1
	.loc 2 170 36 is_stmt 0
	li	s0,637534208
	li	a4,-1419771904
	sw	a4,12(s0)
	.loc 2 173 2 is_stmt 1
	.loc 2 173 56 is_stmt 0
	sw	zero,56(a5)
	.loc 2 176 2 is_stmt 1
	.loc 2 176 112 is_stmt 0
	sw	zero,8(a5)
	.loc 2 176 56
	sw	zero,24(a5)
	.loc 2 181 3 is_stmt 1
.LBB12:
.LBB13:
	.file 3 "../../firmware/irq_vex.h"
	.loc 3 24 2
	.loc 3 25 2
 #APP
# 25 "../../firmware/irq_vex.h" 1
	csrr a5, 3008
# 0 "" 2
.LVL10:
	.loc 3 26 2
 #NO_APP
.LBE13:
.LBE12:
	.loc 2 182 3
	.loc 2 183 3
.LBB14:
.LBB15:
	.loc 3 31 2
	ori	a5,a5,4
.LVL11:
 #APP
# 31 "../../firmware/irq_vex.h" 1
	csrw 3008, a5
# 0 "" 2
.LVL12:
 #NO_APP
.LBE15:
.LBE14:
	.loc 2 185 3
.LBB16:
	.file 4 "../../firmware/csr.h"
	.loc 4 806 2
.LBB17:
.LBB18:
	.file 5 "../../firmware/hw/common.h"
	.loc 5 34 2
	.loc 5 34 32 is_stmt 0
	li	a5,-268406784
.LVL13:
	li	a3,1
	sw	a3,-2028(a5)
.LVL14:
.LBE18:
.LBE17:
.LBE16:
	.loc 2 187 2 is_stmt 1
	.loc 2 187 36 is_stmt 0
	li	s1,-1419706368
	sw	s1,12(s0)
	.loc 2 188 2 is_stmt 1
	.loc 2 188 36 is_stmt 0
	sw	a4,12(s0)
	.loc 2 190 2 is_stmt 1
	.loc 2 190 13 is_stmt 0
	call	matmul
.LVL15:
	.loc 2 191 2 is_stmt 1
	.loc 2 191 43 is_stmt 0
	lw	a5,0(a0)
	slli	a5,a5,16
	.loc 2 191 36
	sw	a5,12(s0)
	.loc 2 192 2 is_stmt 1
	.loc 2 192 47 is_stmt 0
	lw	a5,4(a0)
	slli	a5,a5,16
	.loc 2 192 36
	sw	a5,12(s0)
	.loc 2 193 2 is_stmt 1
	.loc 2 193 47 is_stmt 0
	lw	a5,8(a0)
	slli	a5,a5,16
	.loc 2 193 36
	sw	a5,12(s0)
	.loc 2 194 2 is_stmt 1
	.loc 2 194 47 is_stmt 0
	lw	a5,12(a0)
	slli	a5,a5,16
	.loc 2 194 36
	sw	a5,12(s0)
	.loc 2 196 2 is_stmt 1
	.loc 2 196 8 is_stmt 0
	call	matmul
.LVL16:
	.loc 2 197 2 is_stmt 1
	.loc 2 197 43 is_stmt 0
	lw	a5,0(a0)
	slli	a5,a5,16
	.loc 2 197 36
	sw	a5,12(s0)
	.loc 2 198 2 is_stmt 1
	.loc 2 198 47 is_stmt 0
	lw	a5,4(a0)
	slli	a5,a5,16
	.loc 2 198 36
	sw	a5,12(s0)
	.loc 2 199 2 is_stmt 1
	.loc 2 199 47 is_stmt 0
	lw	a5,8(a0)
	slli	a5,a5,16
	.loc 2 199 36
	sw	a5,12(s0)
	.loc 2 200 2 is_stmt 1
	.loc 2 200 47 is_stmt 0
	lw	a5,12(a0)
	slli	a5,a5,16
	.loc 2 200 36
	sw	a5,12(s0)
	.loc 2 202 2 is_stmt 1
	.loc 2 202 8 is_stmt 0
	call	matmul
.LVL17:
	.loc 2 203 2 is_stmt 1
	.loc 2 203 43 is_stmt 0
	lw	a5,0(a0)
	slli	a5,a5,16
	.loc 2 203 36
	sw	a5,12(s0)
	.loc 2 204 2 is_stmt 1
	.loc 2 204 47 is_stmt 0
	lw	a5,4(a0)
	slli	a5,a5,16
	.loc 2 204 36
	sw	a5,12(s0)
	.loc 2 205 2 is_stmt 1
	.loc 2 205 47 is_stmt 0
	lw	a5,8(a0)
	slli	a5,a5,16
	.loc 2 205 36
	sw	a5,12(s0)
	.loc 2 206 2 is_stmt 1
	.loc 2 206 47 is_stmt 0
	lw	a5,12(a0)
	slli	a5,a5,16
	.loc 2 206 36
	sw	a5,12(s0)
	.loc 2 208 2 is_stmt 1
	.loc 2 208 36 is_stmt 0
	sw	s1,12(s0)
	.loc 2 210 1
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE323:
	.size	main, .-main
.Letext0:
	.file 6 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x22e
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x9
	.4byte	.LASF17
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
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
	.byte	0xa
	.4byte	.LASF18
	.byte	0x6
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0xc
	.4byte	.LASF19
	.byte	0x2
	.byte	0x1d
	.byte	0xd
	.4byte	0x8a
	.4byte	0x8a
	.byte	0xd
	.byte	0
	.byte	0x5
	.4byte	0x6a
	.byte	0xe
	.4byte	.LASF20
	.byte	0x2
	.byte	0x31
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x158
	.byte	0xf
	.4byte	.LASF11
	.byte	0x2
	.byte	0x35
	.byte	0x9
	.4byte	0x6a
	.4byte	.LLST2
	.byte	0x10
	.string	"tmp"
	.byte	0x2
	.byte	0xbe
	.byte	0x7
	.4byte	0x8a
	.4byte	.LLST3
	.byte	0x4
	.4byte	0x172
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0xb5
	.byte	0xa
	.4byte	0xde
	.byte	0x11
	.4byte	0x183
	.byte	0
	.byte	0x4
	.4byte	0x158
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.byte	0xb7
	.byte	0x3
	.4byte	0xfb
	.byte	0x2
	.4byte	0x165
	.4byte	.LLST4
	.byte	0
	.byte	0x4
	.4byte	0x1fd
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.byte	0xb9
	.byte	0x3
	.4byte	0x13c
	.byte	0x2
	.4byte	0x20b
	.4byte	.LLST5
	.byte	0x12
	.4byte	0x217
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.byte	0x4
	.2byte	0x326
	.byte	0x2
	.byte	0x2
	.4byte	0x228
	.4byte	.LLST6
	.byte	0x2
	.4byte	0x220
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0x3
	.4byte	.LVL15
	.4byte	0x78
	.byte	0x3
	.4byte	.LVL16
	.4byte	0x78
	.byte	0x3
	.4byte	.LVL17
	.4byte	0x78
	.byte	0
	.byte	0x13
	.4byte	.LASF15
	.byte	0x3
	.byte	0x1d
	.byte	0x14
	.byte	0x3
	.4byte	0x172
	.byte	0x14
	.4byte	.LASF11
	.byte	0x3
	.byte	0x1d
	.byte	0x2d
	.4byte	0x71
	.byte	0
	.byte	0x15
	.4byte	.LASF21
	.byte	0x3
	.byte	0x16
	.byte	0x1c
	.4byte	0x71
	.byte	0x3
	.4byte	0x190
	.byte	0x16
	.4byte	.LASF11
	.byte	0x3
	.byte	0x18
	.byte	0xf
	.4byte	0x71
	.byte	0
	.byte	0x6
	.4byte	.LASF13
	.byte	0x1a
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x1bb
	.byte	0x7
	.string	"p"
	.byte	0x1a
	.byte	0x18
	.4byte	0x1bb
	.4byte	.LLST1
	.byte	0x3
	.4byte	.LVL8
	.4byte	0x1cc
	.byte	0
	.byte	0x5
	.4byte	0x1c7
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x17
	.4byte	0x1c0
	.byte	0x6
	.4byte	.LASF14
	.byte	0x12
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x1fd
	.byte	0x7
	.string	"c"
	.byte	0x12
	.byte	0x13
	.4byte	0x1c0
	.4byte	.LLST0
	.byte	0x18
	.4byte	.LVL4
	.4byte	0x1cc
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3d
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x325
	.byte	0x14
	.byte	0x3
	.4byte	0x217
	.byte	0x1b
	.string	"v"
	.byte	0x4
	.2byte	0x325
	.byte	0x38
	.4byte	0x50
	.byte	0
	.byte	0x1c
	.4byte	.LASF22
	.byte	0x5
	.byte	0x20
	.byte	0x14
	.byte	0x3
	.byte	0x8
	.string	"v"
	.byte	0x33
	.4byte	0x5c
	.byte	0x8
	.string	"a"
	.byte	0x44
	.4byte	0x5c
	.byte	0
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
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0x21
	.byte	0x2
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x27
	.byte	0x19
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
	.byte	0x7
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x5
	.byte	0x3b
	.byte	0x21
	.byte	0x20
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x5
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
	.byte	0x15
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
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
.LLST2:
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL13
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL16-1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL17-1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL17
	.4byte	.LFE323
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL12
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL14
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL14
	.byte	0x6
	.byte	0x9e
	.byte	0x4
	.4byte	0xf0006814
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL9
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LFE316
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
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
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF17:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O1 -ffreestanding"
.LASF22:
	.string	"csr_write_simple"
.LASF19:
	.string	"matmul"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF14:
	.string	"putchar"
.LASF20:
	.string	"main"
.LASF21:
	.string	"irq_getmask"
.LASF15:
	.string	"irq_setmask"
.LASF10:
	.string	"unsigned int"
.LASF16:
	.string	"user_irq_0_ev_enable_write"
.LASF9:
	.string	"long long unsigned int"
.LASF5:
	.string	"long long int"
.LASF11:
	.string	"mask"
.LASF13:
	.string	"print"
.LASF3:
	.string	"short int"
.LASF18:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF12:
	.string	"char"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"counter_la.c"
.LASF1:
	.string	"/mnt/hgfs/shared_folder/SOC_Final_UART_FIFO/SoCLab-ExtraLab/testbench/counter_la"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
