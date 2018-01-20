	.file	"optimize_loop.c"
	.text
	.globl	_get_vec_len
	.def	_get_vec_len;	.scl	2;	.type	32;	.endef
_get_vec_len:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_get_vec_element
	.def	_get_vec_element;	.scl	2;	.type	32;	.endef
_get_vec_element:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	cmpl	$0, 12(%ebp)
	js	L4
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	12(%ebp), %eax
	jg	L5
L4:
	movl	$0, %eax
	jmp	L6
L5:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	12(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	fldl	(%eax)
	movl	16(%ebp), %eax
	fstpl	(%eax)
	movl	$1, %eax
L6:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_get_new_vec
	.def	_get_new_vec;	.scl	2;	.type	32;	.endef
_get_new_vec:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L8
	movl	$0, %eax
	jmp	L9
L8:
	movl	$0, -12(%ebp)
	movl	-16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%eax)
	cmpl	$0, 8(%ebp)
	jle	L10
	movl	8(%ebp), %eax
	movl	$8, 4(%esp)
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L10
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	$0, %eax
	jmp	L9
L10:
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	movl	-16(%ebp), %eax
L9:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC2:
	.ascii "combine1:%d\12\0"
	.text
	.globl	_combine1
	.def	_combine1;	.scl	2;	.type	32;	.endef
_combine1:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_clock
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	fld1
	fstpl	(%eax)
	movl	$0, -12(%ebp)
	jmp	L12
L13:
	leal	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_element
	movl	12(%ebp), %eax
	fldl	(%eax)
	fldl	-32(%ebp)
	fmulp	%st, %st(1)
	movl	12(%ebp), %eax
	fstpl	(%eax)
	addl	$1, -12(%ebp)
L12:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_len
	cmpl	-12(%ebp), %eax
	jg	L13
	call	_clock
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	subl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC3:
	.ascii "combine2:%d\12\0"
	.text
	.globl	_combine2
	.def	_combine2;	.scl	2;	.type	32;	.endef
_combine2:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_clock
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	fld1
	fstpl	(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_len
	movl	%eax, -20(%ebp)
	movl	$0, -12(%ebp)
	jmp	L15
L16:
	leal	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_element
	movl	12(%ebp), %eax
	fldl	(%eax)
	fldl	-32(%ebp)
	fmulp	%st, %st(1)
	movl	12(%ebp), %eax
	fstpl	(%eax)
	addl	$1, -12(%ebp)
L15:
	movl	-12(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jl	L16
	call	_clock
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	subl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_get_vec_start
	.def	_get_vec_start;	.scl	2;	.type	32;	.endef
_get_vec_start:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC4:
	.ascii "combine3:%d\12\0"
	.text
	.globl	_combine3
	.def	_combine3;	.scl	2;	.type	32;	.endef
_combine3:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_clock
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	fld1
	fstpl	(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_len
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_start
	movl	%eax, -24(%ebp)
	movl	$0, -12(%ebp)
	jmp	L20
L21:
	movl	12(%ebp), %eax
	fldl	(%eax)
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fmulp	%st, %st(1)
	movl	12(%ebp), %eax
	fstpl	(%eax)
	addl	$1, -12(%ebp)
L20:
	movl	-12(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jl	L21
	call	_clock
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	subl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC5:
	.ascii "combine4:%d\12\0"
	.text
	.globl	_combine4
	.def	_combine4;	.scl	2;	.type	32;	.endef
_combine4:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_clock
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_len
	movl	%eax, -32(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_start
	movl	%eax, -36(%ebp)
	fld1
	fstpl	-24(%ebp)
	movl	$0, -12(%ebp)
	jmp	L23
L24:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fldl	-24(%ebp)
	fmulp	%st, %st(1)
	fstpl	-24(%ebp)
	addl	$1, -12(%ebp)
L23:
	movl	-12(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jl	L24
	movl	12(%ebp), %eax
	fldl	-24(%ebp)
	fstpl	(%eax)
	call	_clock
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	subl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC6:
	.ascii "combine4b:%d\12\0"
	.text
	.globl	_combine4b
	.def	_combine4b;	.scl	2;	.type	32;	.endef
_combine4b:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_clock
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_len
	movl	%eax, -32(%ebp)
	fld1
	fstpl	-24(%ebp)
	movl	$0, -12(%ebp)
	jmp	L26
L28:
	cmpl	$0, -12(%ebp)
	js	L27
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-12(%ebp), %eax
	jle	L27
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	fldl	(%eax)
	fldl	-24(%ebp)
	fmulp	%st, %st(1)
	fstpl	-24(%ebp)
L27:
	addl	$1, -12(%ebp)
L26:
	movl	-12(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jl	L28
	movl	12(%ebp), %eax
	fldl	-24(%ebp)
	fstpl	(%eax)
	call	_clock
	movl	%eax, -36(%ebp)
	movl	-36(%ebp), %eax
	subl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
LC7:
	.ascii "combine5:%d\12\0"
	.text
	.globl	_combine5
	.def	_combine5;	.scl	2;	.type	32;	.endef
_combine5:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	call	_clock
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_len
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_start
	movl	%eax, -40(%ebp)
	fld1
	fstpl	-24(%ebp)
	movl	$0, -12(%ebp)
	jmp	L30
L31:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fmull	-24(%ebp)
	movl	-12(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,8), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fmulp	%st, %st(1)
	fstpl	-24(%ebp)
	addl	$2, -12(%ebp)
L30:
	movl	-12(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jl	L31
	jmp	L32
L33:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fldl	-24(%ebp)
	fmulp	%st, %st(1)
	fstpl	-24(%ebp)
	addl	$1, -12(%ebp)
L32:
	movl	-12(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jl	L33
	movl	12(%ebp), %eax
	fldl	-24(%ebp)
	fstpl	(%eax)
	call	_clock
	movl	%eax, -44(%ebp)
	movl	-44(%ebp), %eax
	subl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.section .rdata,"dr"
LC8:
	.ascii "combine6:%d\12\0"
	.text
	.globl	_combine6
	.def	_combine6;	.scl	2;	.type	32;	.endef
_combine6:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	call	_clock
	movl	%eax, -36(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_len
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -44(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_start
	movl	%eax, -48(%ebp)
	fld1
	fstpl	-24(%ebp)
	fld1
	fstpl	-32(%ebp)
	movl	$0, -12(%ebp)
	jmp	L35
L36:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fldl	-24(%ebp)
	fmulp	%st, %st(1)
	fstpl	-24(%ebp)
	movl	-12(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,8), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fldl	-32(%ebp)
	fmulp	%st, %st(1)
	fstpl	-32(%ebp)
	addl	$2, -12(%ebp)
L35:
	movl	-12(%ebp), %eax
	cmpl	-44(%ebp), %eax
	jl	L36
	jmp	L37
L38:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fldl	-24(%ebp)
	fmulp	%st, %st(1)
	fstpl	-24(%ebp)
	addl	$1, -12(%ebp)
L37:
	movl	-12(%ebp), %eax
	cmpl	-40(%ebp), %eax
	jl	L38
	fldl	-24(%ebp)
	fmull	-32(%ebp)
	movl	12(%ebp), %eax
	fstpl	(%eax)
	call	_clock
	movl	%eax, -52(%ebp)
	movl	-52(%ebp), %eax
	subl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC9:
	.ascii "combine7:%d\12\0"
	.text
	.globl	_combine7
	.def	_combine7;	.scl	2;	.type	32;	.endef
_combine7:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	call	_clock
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_len
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_get_vec_start
	movl	%eax, -40(%ebp)
	fld1
	fstpl	-24(%ebp)
	movl	$0, -12(%ebp)
	jmp	L40
L41:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	movl	-12(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,8), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fmulp	%st, %st(1)
	fldl	-24(%ebp)
	fmulp	%st, %st(1)
	fstpl	-24(%ebp)
	addl	$2, -12(%ebp)
L40:
	movl	-12(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jl	L41
	jmp	L42
L43:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fldl	-24(%ebp)
	fmulp	%st, %st(1)
	fstpl	-24(%ebp)
	addl	$1, -12(%ebp)
L42:
	movl	-12(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jl	L43
	movl	12(%ebp), %eax
	fldl	-24(%ebp)
	fstpl	(%eax)
	call	_clock
	movl	%eax, -44(%ebp)
	movl	-44(%ebp), %eax
	subl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$99999999, (%esp)
	call	_get_new_vec
	movl	%eax, 28(%esp)
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_combine1
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_combine2
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_combine3
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_combine4
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_combine4b
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_combine5
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_combine6
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_combine7
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_calloc;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_clock;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
