	.text
	.intel_syntax noprefix
	.file	"lib/sample.c"
	.globl	sample_sum_avx2
	.align	16, 0x90
	.type	sample_sum_avx2,@function
sample_sum_avx2:                        # @sample_sum_avx2
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
	cmp	rdx, 16
	jb	.LBB0_11
# BB#2:
	movabs	r9, 4611686018427387888
	xor	eax, eax
	and	r9, rdx
	je	.LBB0_11
# BB#3:
	lea	rsi, [r9 - 16]
	mov	rax, rsi
	shr	rax, 4
	xor	r8d, r8d
	bt	rsi, 4
	jb	.LBB0_4
# BB#5:
	vmovdqu	ymm0, ymmword ptr [rdi]
	vmovdqu	ymm1, ymmword ptr [rdi + 32]
	vmovdqu	ymm2, ymmword ptr [rdi + 64]
	vmovdqu	ymm3, ymmword ptr [rdi + 96]
	mov	r8d, 16
	jmp	.LBB0_6
.LBB0_4:
	vpxor	ymm0, ymm0, ymm0
	vpxor	ymm1, ymm1, ymm1
	vpxor	ymm2, ymm2, ymm2
	vpxor	ymm3, ymm3, ymm3
.LBB0_6:
	test	rax, rax
	je	.LBB0_9
# BB#7:
	mov	rax, r9
	sub	rax, r8
	lea	rsi, [rdi + 8*r8 + 224]
	.align	16, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	vpaddq	ymm0, ymm0, ymmword ptr [rsi - 224]
	vpaddq	ymm1, ymm1, ymmword ptr [rsi - 192]
	vpaddq	ymm2, ymm2, ymmword ptr [rsi - 160]
	vpaddq	ymm3, ymm3, ymmword ptr [rsi - 128]
	vpaddq	ymm0, ymm0, ymmword ptr [rsi - 96]
	vpaddq	ymm1, ymm1, ymmword ptr [rsi - 64]
	vpaddq	ymm2, ymm2, ymmword ptr [rsi - 32]
	vpaddq	ymm3, ymm3, ymmword ptr [rsi]
	add	rsi, 256
	add	rax, -32
	jne	.LBB0_8
.LBB0_9:
	vpaddq	ymm0, ymm1, ymm0
	vpaddq	ymm0, ymm2, ymm0
	vpaddq	ymm0, ymm3, ymm0
	vextracti128	xmm1, ymm0, 1
	vpaddq	ymm0, ymm0, ymm1
	vpshufd	xmm1, xmm0, 78          # xmm1 = xmm0[2,3,0,1]
	vpaddq	ymm0, ymm0, ymm1
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
	vzeroupper
	ret
.Lfunc_end0:
	.size	sample_sum_avx2, .Lfunc_end0-sample_sum_avx2

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_0:
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
	.section	.rodata,"a",@progbits
.LCPI1_1:
	.long	0                       # 0x0
	.long	2                       # 0x2
	.long	4                       # 0x4
	.long	6                       # 0x6
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.text
	.globl	sample_max_avx2
	.align	16, 0x90
	.type	sample_max_avx2,@function
sample_max_avx2:                        # @sample_max_avx2
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
	cmp	rdx, 16
	jb	.LBB1_12
# BB#3:
	movabs	r8, 4611686018427387888
	and	r8, rdx
	je	.LBB1_12
# BB#4:
	lea	rax, [r8 - 16]
	mov	rsi, rax
	shr	rsi, 4
	xor	r9d, r9d
	bt	rax, 4
	jb	.LBB1_5
# BB#6:
	vmovdqu	ymm0, ymmword ptr [rdi]
	vmovdqu	ymm3, ymmword ptr [rdi + 32]
	vmovdqu	ymm2, ymmword ptr [rdi + 64]
	vmovdqu	ymm1, ymmword ptr [rdi + 96]
	mov	r9d, 16
	jmp	.LBB1_7
.LBB1_5:
	vpbroadcastq	ymm0, qword ptr [rip + .LCPI1_0]
	vmovdqa	ymm3, ymm0
	vmovdqa	ymm2, ymm0
	vmovdqa	ymm1, ymm0
.LBB1_7:
	test	rsi, rsi
	je	.LBB1_10
# BB#8:
	mov	rax, r8
	sub	rax, r9
	lea	rsi, [rdi + 8*r9 + 224]
	.align	16, 0x90
.LBB1_9:                                # =>This Inner Loop Header: Depth=1
	vmovdqu	ymm4, ymmword ptr [rsi - 224]
	vmovdqu	ymm5, ymmword ptr [rsi - 192]
	vmovdqu	ymm6, ymmword ptr [rsi - 160]
	vmovdqu	ymm7, ymmword ptr [rsi - 128]
	vpcmpgtq	ymm8, ymm4, ymm0
	vpcmpgtq	ymm9, ymm5, ymm3
	vpcmpgtq	ymm10, ymm6, ymm2
	vpcmpgtq	ymm11, ymm7, ymm1
	vblendvpd	ymm0, ymm0, ymm4, ymm8
	vblendvpd	ymm3, ymm3, ymm5, ymm9
	vblendvpd	ymm2, ymm2, ymm6, ymm10
	vblendvpd	ymm1, ymm1, ymm7, ymm11
	vmovdqu	ymm4, ymmword ptr [rsi - 96]
	vmovdqu	ymm5, ymmword ptr [rsi - 64]
	vmovdqu	ymm6, ymmword ptr [rsi - 32]
	vmovdqu	ymm7, ymmword ptr [rsi]
	vpcmpgtq	ymm8, ymm4, ymm0
	vpcmpgtq	ymm9, ymm5, ymm3
	vpcmpgtq	ymm10, ymm6, ymm2
	vpcmpgtq	ymm11, ymm7, ymm1
	vblendvpd	ymm0, ymm0, ymm4, ymm8
	vblendvpd	ymm3, ymm3, ymm5, ymm9
	vblendvpd	ymm2, ymm2, ymm6, ymm10
	vblendvpd	ymm1, ymm1, ymm7, ymm11
	add	rsi, 256
	add	rax, -32
	jne	.LBB1_9
.LBB1_10:
	vpcmpgtq	ymm4, ymm0, ymm3
	vblendvpd	ymm0, ymm3, ymm0, ymm4
	vpcmpgtq	ymm3, ymm0, ymm2
	vblendvpd	ymm0, ymm2, ymm0, ymm3
	vpcmpgtq	ymm2, ymm0, ymm1
	vblendvpd	ymm0, ymm1, ymm0, ymm2
	vextractf128	xmm1, ymm0, 1
	vpcmpgtq	ymm2, ymm0, ymm1
	vblendvpd	ymm0, ymm1, ymm0, ymm2
	vpshufd	xmm1, xmm0, 78          # xmm1 = xmm0[2,3,0,1]
	vpcmpgtq	ymm1, ymm0, ymm1
	vmovdqa	ymm2, ymmword ptr [rip + .LCPI1_1] # ymm2 = <0,2,4,6,u,u,u,u>
	vpermd	ymm1, ymm2, ymm1
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
	vzeroupper
	ret
.Lfunc_end1:
	.size	sample_max_avx2, .Lfunc_end1-sample_max_avx2

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_0:
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.section	.rodata,"a",@progbits
.LCPI2_1:
	.long	0                       # 0x0
	.long	2                       # 0x2
	.long	4                       # 0x4
	.long	6                       # 0x6
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.text
	.globl	sample_min_avx2
	.align	16, 0x90
	.type	sample_min_avx2,@function
sample_min_avx2:                        # @sample_min_avx2
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
	cmp	rdx, 16
	jb	.LBB2_12
# BB#3:
	movabs	r8, 4611686018427387888
	and	r8, rdx
	je	.LBB2_12
# BB#4:
	lea	rax, [r8 - 16]
	mov	rsi, rax
	shr	rsi, 4
	xor	r9d, r9d
	bt	rax, 4
	jb	.LBB2_5
# BB#6:
	vmovdqu	ymm0, ymmword ptr [rdi]
	vmovdqu	ymm3, ymmword ptr [rdi + 32]
	vmovdqu	ymm2, ymmword ptr [rdi + 64]
	vmovdqu	ymm1, ymmword ptr [rdi + 96]
	mov	r9d, 16
	jmp	.LBB2_7
.LBB2_5:
	vpbroadcastq	ymm0, qword ptr [rip + .LCPI2_0]
	vmovdqa	ymm3, ymm0
	vmovdqa	ymm2, ymm0
	vmovdqa	ymm1, ymm0
.LBB2_7:
	test	rsi, rsi
	je	.LBB2_10
# BB#8:
	mov	rax, r8
	sub	rax, r9
	lea	rsi, [rdi + 8*r9 + 224]
	.align	16, 0x90
.LBB2_9:                                # =>This Inner Loop Header: Depth=1
	vmovdqu	ymm4, ymmword ptr [rsi - 224]
	vmovdqu	ymm5, ymmword ptr [rsi - 192]
	vmovdqu	ymm6, ymmword ptr [rsi - 160]
	vmovdqu	ymm7, ymmword ptr [rsi - 128]
	vpcmpgtq	ymm8, ymm0, ymm4
	vpcmpgtq	ymm9, ymm3, ymm5
	vpcmpgtq	ymm10, ymm2, ymm6
	vpcmpgtq	ymm11, ymm1, ymm7
	vblendvpd	ymm0, ymm0, ymm4, ymm8
	vblendvpd	ymm3, ymm3, ymm5, ymm9
	vblendvpd	ymm2, ymm2, ymm6, ymm10
	vblendvpd	ymm1, ymm1, ymm7, ymm11
	vmovdqu	ymm4, ymmword ptr [rsi - 96]
	vmovdqu	ymm5, ymmword ptr [rsi - 64]
	vmovdqu	ymm6, ymmword ptr [rsi - 32]
	vmovdqu	ymm7, ymmword ptr [rsi]
	vpcmpgtq	ymm8, ymm0, ymm4
	vpcmpgtq	ymm9, ymm3, ymm5
	vpcmpgtq	ymm10, ymm2, ymm6
	vpcmpgtq	ymm11, ymm1, ymm7
	vblendvpd	ymm0, ymm0, ymm4, ymm8
	vblendvpd	ymm3, ymm3, ymm5, ymm9
	vblendvpd	ymm2, ymm2, ymm6, ymm10
	vblendvpd	ymm1, ymm1, ymm7, ymm11
	add	rsi, 256
	add	rax, -32
	jne	.LBB2_9
.LBB2_10:
	vpcmpgtq	ymm4, ymm3, ymm0
	vblendvpd	ymm0, ymm3, ymm0, ymm4
	vpcmpgtq	ymm3, ymm2, ymm0
	vblendvpd	ymm0, ymm2, ymm0, ymm3
	vpcmpgtq	ymm2, ymm1, ymm0
	vblendvpd	ymm0, ymm1, ymm0, ymm2
	vextractf128	xmm1, ymm0, 1
	vpcmpgtq	ymm2, ymm1, ymm0
	vblendvpd	ymm0, ymm1, ymm0, ymm2
	vpshufd	xmm1, xmm0, 78          # xmm1 = xmm0[2,3,0,1]
	vpcmpgtq	ymm1, ymm1, ymm0
	vmovdqa	ymm2, ymmword ptr [rip + .LCPI2_1] # ymm2 = <0,2,4,6,u,u,u,u>
	vpermd	ymm1, ymm2, ymm1
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
	vzeroupper
	ret
.Lfunc_end2:
	.size	sample_min_avx2, .Lfunc_end2-sample_min_avx2


	.ident	"Apple LLVM version 8.0.0 (clang-800.0.42.1)"
	.section	".note.GNU-stack","",@progbits
