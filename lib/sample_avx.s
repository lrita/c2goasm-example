	.text
	.intel_syntax noprefix
	.file	"lib/sample.c"
	.globl	sample_sum_avx
	.align	16, 0x90
	.type	sample_sum_avx,@function
sample_sum_avx:                         # @sample_sum_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	xor	eax, eax
	test	rsi, rsi
	jle	.LBB0_12
# BB#1:
	lea	rcx, [rdi + 8*rsi]
	lea	rax, [rdi + 8]
	cmp	rcx, rax
	cmova	rax, rcx
	mov	rdx, rdi
	not	rdx
	add	rdx, rax
	shr	rdx, 3
	inc	rdx
	xor	eax, eax
	cmp	rdx, 8
	jb	.LBB0_11
# BB#2:
	movabs	r9, 4611686018427387896
	xor	eax, eax
	and	r9, rdx
	je	.LBB0_11
# BB#3:
	lea	rsi, [r9 - 8]
	mov	rax, rsi
	shr	rax, 3
	xor	r8d, r8d
	bt	rsi, 3
	jb	.LBB0_4
# BB#5:
	vmovdqu	xmm0, xmmword ptr [rdi]
	vmovdqu	xmm1, xmmword ptr [rdi + 16]
	vmovdqu	xmm2, xmmword ptr [rdi + 32]
	vmovdqu	xmm3, xmmword ptr [rdi + 48]
	mov	r8d, 8
	jmp	.LBB0_6
.LBB0_4:
	vpxor	xmm0, xmm0, xmm0
	vpxor	xmm1, xmm1, xmm1
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
.LBB0_6:
	test	rax, rax
	je	.LBB0_9
# BB#7:
	mov	rax, r9
	sub	rax, r8
	lea	rsi, [rdi + 8*r8 + 112]
	.align	16, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	vpaddq	xmm0, xmm0, xmmword ptr [rsi - 112]
	vpaddq	xmm1, xmm1, xmmword ptr [rsi - 96]
	vpaddq	xmm2, xmm2, xmmword ptr [rsi - 80]
	vpaddq	xmm3, xmm3, xmmword ptr [rsi - 64]
	vpaddq	xmm0, xmm0, xmmword ptr [rsi - 48]
	vpaddq	xmm1, xmm1, xmmword ptr [rsi - 32]
	vpaddq	xmm2, xmm2, xmmword ptr [rsi - 16]
	vpaddq	xmm3, xmm3, xmmword ptr [rsi]
	sub	rsi, -128
	add	rax, -16
	jne	.LBB0_8
.LBB0_9:
	vpaddq	xmm0, xmm1, xmm0
	vpaddq	xmm0, xmm2, xmm0
	vpaddq	xmm0, xmm3, xmm0
	vpshufd	xmm1, xmm0, 78          # xmm1 = xmm0[2,3,0,1]
	vpaddq	xmm0, xmm0, xmm1
	vmovq	rax, xmm0
	cmp	rdx, r9
	je	.LBB0_12
# BB#10:
	lea	rdi, [rdi + 8*r9]
	.align	16, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	add	rax, qword ptr [rdi]
	add	rdi, 8
	cmp	rdi, rcx
	jb	.LBB0_11
.LBB0_12:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end0:
	.size	sample_sum_avx, .Lfunc_end0-sample_sum_avx

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_0:
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
	.text
	.globl	sample_max_avx
	.align	16, 0x90
	.type	sample_max_avx,@function
sample_max_avx:                         # @sample_max_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	xor	eax, eax
	test	rsi, rsi
	je	.LBB1_13
# BB#1:
	movabs	rax, -9223372036854775808
	jle	.LBB1_13
# BB#2:
	lea	rcx, [rdi + 8*rsi]
	lea	rsi, [rdi + 8]
	cmp	rcx, rsi
	cmova	rsi, rcx
	mov	rdx, rdi
	not	rdx
	add	rdx, rsi
	shr	rdx, 3
	inc	rdx
	cmp	rdx, 8
	jb	.LBB1_12
# BB#3:
	movabs	r8, 4611686018427387896
	and	r8, rdx
	je	.LBB1_12
# BB#4:
	lea	rax, [r8 - 8]
	mov	rsi, rax
	shr	rsi, 3
	xor	r9d, r9d
	bt	rax, 3
	jb	.LBB1_5
# BB#6:
	vmovdqu	xmm8, xmmword ptr [rdi]
	vmovdqu	xmm11, xmmword ptr [rdi + 16]
	vmovdqu	xmm10, xmmword ptr [rdi + 32]
	vmovdqu	xmm9, xmmword ptr [rdi + 48]
	mov	r9d, 8
	jmp	.LBB1_7
.LBB1_5:
	vmovdqa	xmm8, xmmword ptr [rip + .LCPI1_0] # xmm8 = [9223372036854775808,9223372036854775808]
	vmovdqa	xmm11, xmm8
	vmovdqa	xmm10, xmm8
	vmovdqa	xmm9, xmm8
.LBB1_7:
	test	rsi, rsi
	je	.LBB1_10
# BB#8:
	mov	rax, r8
	sub	rax, r9
	lea	rsi, [rdi + 8*r9 + 112]
	.align	16, 0x90
.LBB1_9:                                # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm4, xmmword ptr [rsi - 112]
	vmovdqu	xmm5, xmmword ptr [rsi - 96]
	vmovdqu	xmm6, xmmword ptr [rsi - 80]
	vmovdqu	xmm7, xmmword ptr [rsi - 64]
	vpcmpgtq	xmm0, xmm4, xmm8
	vpcmpgtq	xmm1, xmm5, xmm11
	vpcmpgtq	xmm2, xmm6, xmm10
	vpcmpgtq	xmm3, xmm7, xmm9
	vblendvpd	xmm0, xmm8, xmm4, xmm0
	vblendvpd	xmm1, xmm11, xmm5, xmm1
	vblendvpd	xmm2, xmm10, xmm6, xmm2
	vblendvpd	xmm3, xmm9, xmm7, xmm3
	vmovdqu	xmm4, xmmword ptr [rsi - 48]
	vmovdqu	xmm5, xmmword ptr [rsi - 32]
	vmovdqu	xmm6, xmmword ptr [rsi - 16]
	vmovdqu	xmm7, xmmword ptr [rsi]
	vpcmpgtq	xmm8, xmm4, xmm0
	vpcmpgtq	xmm9, xmm5, xmm1
	vpcmpgtq	xmm10, xmm6, xmm2
	vpcmpgtq	xmm12, xmm7, xmm3
	vblendvpd	xmm8, xmm0, xmm4, xmm8
	vblendvpd	xmm11, xmm1, xmm5, xmm9
	vblendvpd	xmm10, xmm2, xmm6, xmm10
	vblendvpd	xmm9, xmm3, xmm7, xmm12
	sub	rsi, -128
	add	rax, -16
	jne	.LBB1_9
.LBB1_10:
	vpcmpgtq	xmm0, xmm8, xmm11
	vblendvpd	xmm0, xmm11, xmm8, xmm0
	vpcmpgtq	xmm1, xmm0, xmm10
	vblendvpd	xmm0, xmm10, xmm0, xmm1
	vpcmpgtq	xmm1, xmm0, xmm9
	vblendvpd	xmm0, xmm9, xmm0, xmm1
	vpshufd	xmm1, xmm0, 78          # xmm1 = xmm0[2,3,0,1]
	vpcmpgtq	xmm1, xmm0, xmm1
	vpextrb	esi, xmm1, 0
	vmovq	r9, xmm0
	vpextrq	rax, xmm0, 1
	test	sil, 1
	cmovne	rax, r9
	cmp	rdx, r8
	je	.LBB1_13
# BB#11:
	lea	rdi, [rdi + 8*r8]
	.align	16, 0x90
.LBB1_12:                               # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rdi]
	cmp	rdx, rax
	cmovge	rax, rdx
	add	rdi, 8
	cmp	rdi, rcx
	jb	.LBB1_12
.LBB1_13:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end1:
	.size	sample_max_avx, .Lfunc_end1-sample_max_avx

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.text
	.globl	sample_min_avx
	.align	16, 0x90
	.type	sample_min_avx,@function
sample_min_avx:                         # @sample_min_avx
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	xor	eax, eax
	test	rsi, rsi
	je	.LBB2_13
# BB#1:
	movabs	rax, 9223372036854775807
	jle	.LBB2_13
# BB#2:
	lea	rcx, [rdi + 8*rsi]
	lea	rsi, [rdi + 8]
	cmp	rcx, rsi
	cmova	rsi, rcx
	mov	rdx, rdi
	not	rdx
	add	rdx, rsi
	shr	rdx, 3
	inc	rdx
	cmp	rdx, 8
	jb	.LBB2_12
# BB#3:
	movabs	r8, 4611686018427387896
	and	r8, rdx
	je	.LBB2_12
# BB#4:
	lea	rax, [r8 - 8]
	mov	rsi, rax
	shr	rsi, 3
	xor	r9d, r9d
	bt	rax, 3
	jb	.LBB2_5
# BB#6:
	vmovdqu	xmm8, xmmword ptr [rdi]
	vmovdqu	xmm11, xmmword ptr [rdi + 16]
	vmovdqu	xmm10, xmmword ptr [rdi + 32]
	vmovdqu	xmm9, xmmword ptr [rdi + 48]
	mov	r9d, 8
	jmp	.LBB2_7
.LBB2_5:
	vmovdqa	xmm8, xmmword ptr [rip + .LCPI2_0] # xmm8 = [9223372036854775807,9223372036854775807]
	vmovdqa	xmm11, xmm8
	vmovdqa	xmm10, xmm8
	vmovdqa	xmm9, xmm8
.LBB2_7:
	test	rsi, rsi
	je	.LBB2_10
# BB#8:
	mov	rax, r8
	sub	rax, r9
	lea	rsi, [rdi + 8*r9 + 112]
	.align	16, 0x90
.LBB2_9:                                # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm4, xmmword ptr [rsi - 112]
	vmovdqu	xmm5, xmmword ptr [rsi - 96]
	vmovdqu	xmm6, xmmword ptr [rsi - 80]
	vmovdqu	xmm7, xmmword ptr [rsi - 64]
	vpcmpgtq	xmm0, xmm8, xmm4
	vpcmpgtq	xmm1, xmm11, xmm5
	vpcmpgtq	xmm2, xmm10, xmm6
	vpcmpgtq	xmm3, xmm9, xmm7
	vblendvpd	xmm0, xmm8, xmm4, xmm0
	vblendvpd	xmm1, xmm11, xmm5, xmm1
	vblendvpd	xmm2, xmm10, xmm6, xmm2
	vblendvpd	xmm3, xmm9, xmm7, xmm3
	vmovdqu	xmm4, xmmword ptr [rsi - 48]
	vmovdqu	xmm5, xmmword ptr [rsi - 32]
	vmovdqu	xmm6, xmmword ptr [rsi - 16]
	vmovdqu	xmm7, xmmword ptr [rsi]
	vpcmpgtq	xmm8, xmm0, xmm4
	vpcmpgtq	xmm9, xmm1, xmm5
	vpcmpgtq	xmm10, xmm2, xmm6
	vpcmpgtq	xmm12, xmm3, xmm7
	vblendvpd	xmm8, xmm0, xmm4, xmm8
	vblendvpd	xmm11, xmm1, xmm5, xmm9
	vblendvpd	xmm10, xmm2, xmm6, xmm10
	vblendvpd	xmm9, xmm3, xmm7, xmm12
	sub	rsi, -128
	add	rax, -16
	jne	.LBB2_9
.LBB2_10:
	vpcmpgtq	xmm0, xmm11, xmm8
	vblendvpd	xmm0, xmm11, xmm8, xmm0
	vpcmpgtq	xmm1, xmm10, xmm0
	vblendvpd	xmm0, xmm10, xmm0, xmm1
	vpcmpgtq	xmm1, xmm9, xmm0
	vblendvpd	xmm0, xmm9, xmm0, xmm1
	vpshufd	xmm1, xmm0, 78          # xmm1 = xmm0[2,3,0,1]
	vpcmpgtq	xmm1, xmm1, xmm0
	vpextrb	esi, xmm1, 0
	vmovq	r9, xmm0
	vpextrq	rax, xmm0, 1
	test	sil, 1
	cmovne	rax, r9
	cmp	rdx, r8
	je	.LBB2_13
# BB#11:
	lea	rdi, [rdi + 8*r8]
	.align	16, 0x90
.LBB2_12:                               # =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rdi]
	cmp	rdx, rax
	cmovle	rax, rdx
	add	rdi, 8
	cmp	rdi, rcx
	jb	.LBB2_12
.LBB2_13:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end2:
	.size	sample_min_avx, .Lfunc_end2-sample_min_avx


	.ident	"Apple LLVM version 8.0.0 (clang-800.0.42.1)"
	.section	".note.GNU-stack","",@progbits
