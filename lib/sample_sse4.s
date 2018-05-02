	.text
	.intel_syntax noprefix
	.file	"lib/sample.c"
	.globl	sample_sum_sse4_2
	.align	16, 0x90
	.type	sample_sum_sse4_2,@function
sample_sum_sse4_2:                      # @sample_sum_sse4_2
# BB#0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	xor	eax, eax
	test	rsi, rsi
	jle	.LBB0_13
# BB#1:
	lea	rcx, [rdi + 8*rsi]
	lea	rax, [rdi + 8]
	cmp	rcx, rax
	cmova	rax, rcx
	mov	rsi, rdi
	not	rsi
	add	rsi, rax
	mov	r10, rsi
	shr	r10, 3
	inc	r10
	xor	eax, eax
	cmp	r10, 4
	jb	.LBB0_12
# BB#2:
	movabs	r8, 4611686018427387900
	xor	eax, eax
	and	r8, r10
	je	.LBB0_12
# BB#3:
	lea	r9, [r8 - 4]
	mov	edx, r9d
	shr	edx, 2
	inc	edx
	xor	eax, eax
	test	dl, 3
	je	.LBB0_4
# BB#5:
	shr	esi, 3
	inc	esi
	and	esi, 12
	add	esi, -4
	shr	esi, 2
	inc	esi
	and	esi, 3
	neg	rsi
	pxor	xmm0, xmm0
	xor	eax, eax
	pxor	xmm1, xmm1
	.align	16, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movdqu	xmm2, xmmword ptr [rdi + 8*rax]
	movdqu	xmm3, xmmword ptr [rdi + 8*rax + 16]
	paddq	xmm0, xmm2
	paddq	xmm1, xmm3
	add	rax, 4
	inc	rsi
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_4:
	pxor	xmm0, xmm0
	pxor	xmm1, xmm1
.LBB0_7:
	cmp	r9, 12
	jb	.LBB0_10
# BB#8:
	mov	rsi, r8
	sub	rsi, rax
	lea	rax, [rdi + 8*rax + 112]
	.align	16, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	movdqu	xmm2, xmmword ptr [rax - 112]
	movdqu	xmm3, xmmword ptr [rax - 96]
	movdqu	xmm4, xmmword ptr [rax - 80]
	movdqu	xmm5, xmmword ptr [rax - 64]
	paddq	xmm2, xmm0
	paddq	xmm3, xmm1
	paddq	xmm2, xmm4
	paddq	xmm3, xmm5
	movdqu	xmm4, xmmword ptr [rax - 48]
	movdqu	xmm5, xmmword ptr [rax - 32]
	paddq	xmm4, xmm2
	paddq	xmm5, xmm3
	movdqu	xmm0, xmmword ptr [rax - 16]
	movdqu	xmm1, xmmword ptr [rax]
	paddq	xmm0, xmm4
	paddq	xmm1, xmm5
	sub	rax, -128
	add	rsi, -16
	jne	.LBB0_9
.LBB0_10:
	paddq	xmm1, xmm0
	pshufd	xmm0, xmm1, 78          # xmm0 = xmm1[2,3,0,1]
	paddq	xmm0, xmm1
	movq	rax, xmm0
	cmp	r10, r8
	je	.LBB0_13
# BB#11:
	lea	rdi, [rdi + 8*r8]
	.align	16, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	add	rax, qword ptr [rdi]
	add	rdi, 8
	cmp	rdi, rcx
	jb	.LBB0_12
.LBB0_13:
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end0:
	.size	sample_sum_sse4_2, .Lfunc_end0-sample_sum_sse4_2

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_0:
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
	.text
	.globl	sample_max_sse4_2
	.align	16, 0x90
	.type	sample_max_sse4_2,@function
sample_max_sse4_2:                      # @sample_max_sse4_2
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
	cmp	rdx, 4
	jb	.LBB1_12
# BB#3:
	movabs	r8, 4611686018427387900
	and	r8, rdx
	je	.LBB1_12
# BB#4:
	lea	rax, [r8 - 4]
	mov	rsi, rax
	shr	rsi, 2
	xor	r9d, r9d
	bt	rax, 2
	jb	.LBB1_5
# BB#6:
	movdqu	xmm3, xmmword ptr [rdi]
	movdqu	xmm2, xmmword ptr [rdi + 16]
	mov	r9d, 4
	jmp	.LBB1_7
.LBB1_5:
	movdqa	xmm3, xmmword ptr [rip + .LCPI1_0] # xmm3 = [9223372036854775808,9223372036854775808]
	movdqa	xmm2, xmm3
.LBB1_7:
	test	rsi, rsi
	je	.LBB1_10
# BB#8:
	mov	rax, r8
	sub	rax, r9
	lea	rsi, [rdi + 8*r9 + 48]
	.align	16, 0x90
.LBB1_9:                                # =>This Inner Loop Header: Depth=1
	movdqu	xmm4, xmmword ptr [rsi - 48]
	movdqu	xmm5, xmmword ptr [rsi - 32]
	movdqu	xmm6, xmmword ptr [rsi - 16]
	movdqu	xmm7, xmmword ptr [rsi]
	movdqa	xmm0, xmm4
	pcmpgtq	xmm0, xmm3
	movdqa	xmm1, xmm5
	pcmpgtq	xmm1, xmm2
	blendvpd	xmm3, xmm4
	movdqa	xmm0, xmm1
	blendvpd	xmm2, xmm5
	movdqa	xmm0, xmm6
	pcmpgtq	xmm0, xmm3
	movdqa	xmm1, xmm7
	pcmpgtq	xmm1, xmm2
	blendvpd	xmm3, xmm6
	movdqa	xmm0, xmm1
	blendvpd	xmm2, xmm7
	add	rsi, 64
	add	rax, -8
	jne	.LBB1_9
.LBB1_10:
	movdqa	xmm0, xmm3
	pcmpgtq	xmm0, xmm2
	blendvpd	xmm2, xmm3
	pshufd	xmm0, xmm2, 78          # xmm0 = xmm2[2,3,0,1]
	movdqa	xmm1, xmm2
	pcmpgtq	xmm1, xmm0
	pextrb	esi, xmm1, 0
	movq	r9, xmm2
	pextrq	rax, xmm2, 1
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
	.size	sample_max_sse4_2, .Lfunc_end1-sample_max_sse4_2

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.text
	.globl	sample_min_sse4_2
	.align	16, 0x90
	.type	sample_min_sse4_2,@function
sample_min_sse4_2:                      # @sample_min_sse4_2
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
	cmp	rdx, 4
	jb	.LBB2_12
# BB#3:
	movabs	r8, 4611686018427387900
	and	r8, rdx
	je	.LBB2_12
# BB#4:
	lea	rax, [r8 - 4]
	mov	rsi, rax
	shr	rsi, 2
	xor	r9d, r9d
	bt	rax, 2
	jb	.LBB2_5
# BB#6:
	movdqu	xmm3, xmmword ptr [rdi]
	movdqu	xmm2, xmmword ptr [rdi + 16]
	mov	r9d, 4
	jmp	.LBB2_7
.LBB2_5:
	movdqa	xmm3, xmmword ptr [rip + .LCPI2_0] # xmm3 = [9223372036854775807,9223372036854775807]
	movdqa	xmm2, xmm3
.LBB2_7:
	test	rsi, rsi
	je	.LBB2_10
# BB#8:
	mov	rax, r8
	sub	rax, r9
	lea	rsi, [rdi + 8*r9 + 48]
	.align	16, 0x90
.LBB2_9:                                # =>This Inner Loop Header: Depth=1
	movdqu	xmm4, xmmword ptr [rsi - 48]
	movdqu	xmm5, xmmword ptr [rsi - 32]
	movdqu	xmm6, xmmword ptr [rsi - 16]
	movdqu	xmm7, xmmword ptr [rsi]
	movdqa	xmm0, xmm3
	pcmpgtq	xmm0, xmm4
	movdqa	xmm1, xmm2
	pcmpgtq	xmm1, xmm5
	blendvpd	xmm3, xmm4
	movdqa	xmm0, xmm1
	blendvpd	xmm2, xmm5
	movapd	xmm0, xmm3
	pcmpgtq	xmm0, xmm6
	movapd	xmm1, xmm2
	pcmpgtq	xmm1, xmm7
	blendvpd	xmm3, xmm6
	movdqa	xmm0, xmm1
	blendvpd	xmm2, xmm7
	add	rsi, 64
	add	rax, -8
	jne	.LBB2_9
.LBB2_10:
	movdqa	xmm0, xmm2
	pcmpgtq	xmm0, xmm3
	blendvpd	xmm2, xmm3
	pshufd	xmm0, xmm2, 78          # xmm0 = xmm2[2,3,0,1]
	pcmpgtq	xmm0, xmm2
	pextrb	esi, xmm0, 0
	movq	r9, xmm2
	pextrq	rax, xmm2, 1
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
	.size	sample_min_sse4_2, .Lfunc_end2-sample_min_sse4_2


	.ident	"Apple LLVM version 8.0.0 (clang-800.0.42.1)"
	.section	".note.GNU-stack","",@progbits
