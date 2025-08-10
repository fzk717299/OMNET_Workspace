	.file	"stringutil.cc"
	.section	.text$_ZNKSt5ctypeIcE8do_widenEc,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNKSt5ctypeIcE8do_widenEc
	.def	_ZNKSt5ctypeIcE8do_widenEc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt5ctypeIcE8do_widenEc
_ZNKSt5ctypeIcE8do_widenEc:
.LFB7088:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%edx, %eax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNK7omnetpp6common17opp_runtime_error4whatEv,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNK7omnetpp6common17opp_runtime_error4whatEv
	.def	_ZNK7omnetpp6common17opp_runtime_error4whatEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNK7omnetpp6common17opp_runtime_error4whatEv
_ZNK7omnetpp6common17opp_runtime_error4whatEv:
.LFB7893:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	16(%rcx), %rax
	popq	%rbp
	ret
	.seh_endproc
	.text
	.align 2
	.p2align 4,,15
	.def	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD2Ev;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD2Ev
_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD2Ev:
.LFB9379:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	popq	%rbp
	ret
	.seh_endproc
	.def	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD1Ev;	.scl	3;	.type	32;	.endef
	.set	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD1Ev,_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD2Ev
	.align 2
	.p2align 4,,15
	.def	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD0Ev;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD0Ev
_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD0Ev:
.LFB9381:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	popq	%rbp
	jmp	_ZdlPv
	.seh_endproc
	.section	.text$_ZN7omnetpp6common17opp_runtime_errorD1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZN7omnetpp6common17opp_runtime_errorD1Ev
	.def	_ZN7omnetpp6common17opp_runtime_errorD1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common17opp_runtime_errorD1Ev
_ZN7omnetpp6common17opp_runtime_errorD1Ev:
.LFB7891:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	16+_ZTVN7omnetpp6common17opp_runtime_errorE(%rip), %rax
	movq	%rcx, %rbx
	movq	%rax, (%rcx)
	movq	16(%rcx), %rcx
	leaq	32(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L7
	call	_ZdlPv
.L7:
	movq	%rbx, %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	jmp	_ZNSt13runtime_errorD2Ev
	.seh_endproc
	.text
	.align 2
	.p2align 4,,15
	.def	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolver18isVariableNameCharEc;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolver18isVariableNameCharEc
_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolver18isVariableNameCharEc:
.LFB8586:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%edx, %ebx
	movzbl	%dl, %ecx
	call	*__imp_isalnum(%rip)
	cmpb	$95, %bl
	sete	%dl
	testl	%eax, %eax
	setne	%al
	orl	%edx, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB9383:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	popq	%rbp
	jmp	_ZNSt8ios_base4InitD1Ev
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "/\\:?*<>|'`\"$%{}^&\0"
	.text
	.p2align 4,,15
	.def	_ZN7omnetpp6commonL13isInvalidCharEc;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6commonL13isInvalidCharEc
_ZN7omnetpp6commonL13isInvalidCharEc:
.LFB8634:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$1, %eax
	leal	-32(%rcx), %edx
	cmpb	$94, %dl
	ja	.L10
	movsbl	%cl, %edx
	leaq	.LC0(%rip), %rcx
	call	strchr
	testq	%rax, %rax
	setne	%al
.L10:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "%g%n\0"
	.text
	.p2align 4,,15
	.def	_Z6sscanfPKcS0_z.constprop.111;	.scl	3;	.type	32;	.endef
	.seh_proc	_Z6sscanfPKcS0_z.constprop.111
_Z6sscanfPKcS0_z.constprop.111:
.LFB9486:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC1(%rip), %rdx
	movq	%r8, 32(%rbp)
	leaq	32(%rbp), %r8
	movq	%r9, 40(%rbp)
	movq	%r8, -8(%rbp)
	call	__mingw_vsscanf
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN7omnetpp6common17opp_runtime_errorD0Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZN7omnetpp6common17opp_runtime_errorD0Ev
	.def	_ZN7omnetpp6common17opp_runtime_errorD0Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common17opp_runtime_errorD0Ev
_ZN7omnetpp6common17opp_runtime_errorD0Ev:
.LFB7892:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	16+_ZTVN7omnetpp6common17opp_runtime_errorE(%rip), %rax
	movq	%rcx, %rbx
	movq	%rax, (%rcx)
	movq	16(%rcx), %rcx
	leaq	32(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L15
	call	_ZdlPv
.L15:
	movq	%rbx, %rcx
	call	_ZNSt13runtime_errorD2Ev
	movq	%rbx, %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	jmp	_ZdlPv
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "basic_string::_M_construct null not valid\0"
.LC3:
	.ascii "Unknown variable $%s\0"
	.text
	.align 2
	.p2align 4,,15
	.def	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverclERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverclERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverclERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8587:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	8(%rdx), %rax
	movq	%rcx, %rdi
	movq	%r8, %r13
	movq	16(%rax), %rsi
	leaq	8(%rax), %r14
	movq	%r14, -88(%rbp)
	testq	%rsi, %rsi
	je	.L17
	movq	8(%r8), %r15
	movq	(%r8), %r12
	jmp	.L18
	.p2align 4,,10
.L23:
	movq	24(%rsi), %rsi
	testq	%rsi, %rsi
	je	.L19
.L18:
	movq	40(%rsi), %rbx
	movq	%r15, %r8
	cmpq	%r15, %rbx
	cmovbe	%rbx, %r8
	testq	%r8, %r8
	je	.L20
	movq	32(%rsi), %rcx
	movq	%r12, %rdx
	call	memcmp
	testl	%eax, %eax
	jne	.L21
.L20:
	subq	%r15, %rbx
	cmpq	$2147483647, %rbx
	jg	.L22
	cmpq	$-2147483648, %rbx
	jl	.L23
	movl	%ebx, %eax
.L21:
	testl	%eax, %eax
	js	.L23
.L22:
	movq	%rsi, %r14
	movq	16(%rsi), %rsi
	testq	%rsi, %rsi
	jne	.L18
.L19:
	cmpq	%r14, -88(%rbp)
	je	.L17
	movq	40(%r14), %rbx
	cmpq	%rbx, %r15
	movq	%rbx, %r8
	cmovbe	%r15, %r8
	testq	%r8, %r8
	jne	.L55
	subq	%rbx, %r15
	cmpq	$2147483647, %r15
	jg	.L27
.L58:
	cmpq	$-2147483648, %r15
	jl	.L17
	movl	%r15d, %eax
.L26:
	testl	%eax, %eax
	js	.L17
.L27:
	leaq	16(%rdi), %rax
	movq	%rax, (%rdi)
	movq	64(%r14), %rsi
	movq	72(%r14), %rbx
	movq	%rsi, %rdx
	addq	%rbx, %rdx
	je	.L36
	testq	%rsi, %rsi
	je	.L56
.L36:
	cmpq	$15, %rbx
	movq	%rbx, -72(%rbp)
	ja	.L57
	cmpq	$1, %rbx
	jne	.L30
	movzbl	(%rsi), %edx
	movb	%dl, 16(%rdi)
.L31:
	movq	%rbx, 8(%rdi)
	movb	$0, (%rax,%rbx)
	movq	%rdi, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L17:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	movq	0(%r13), %r8
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB0:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE0:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB1:
	call	__cxa_throw
	.p2align 4,,10
.L55:
	movq	32(%r14), %rdx
	movq	%r12, %rcx
	call	memcmp
	testl	%eax, %eax
	jne	.L26
	subq	%rbx, %r15
	cmpq	$2147483647, %r15
	jle	.L58
	jmp	.L27
	.p2align 4,,10
.L57:
	leaq	-72(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-72(%rbp), %rdx
	movq	%rax, (%rdi)
	movq	%rdx, 16(%rdi)
.L29:
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-72(%rbp), %rbx
	movq	(%rdi), %rax
	jmp	.L31
	.p2align 4,,10
.L30:
	testq	%rbx, %rbx
	je	.L31
	jmp	.L29
.L56:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.L37:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
	call	_Unwind_Resume
	nop
.LEHE1:
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8587:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8587-.LLSDACSB8587
.LLSDACSB8587:
	.uleb128 .LEHB0-.LFB8587
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L37-.LFB8587
	.uleb128 0
	.uleb128 .LEHB1-.LFB8587
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE8587:
	.text
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "basic_string::replace\0"
	.align 8
.LC5:
	.ascii "%s: __pos (which is %zu) > this->size() (which is %zu)\0"
	.text
	.p2align 4,,15
	.def	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110:
.LFB9487:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	leaq	16(%rcx), %r13
	movq	%rcx, %rdi
	movq	%r8, %rsi
	movq	%r9, %r12
	movq	%r13, (%rcx)
	movq	(%rdx), %r14
	movq	8(%rdx), %rbx
	movq	%r14, %rax
	addq	%rbx, %rax
	je	.L60
	testq	%r14, %r14
	je	.L78
.L60:
	cmpq	$15, %rbx
	movq	%rbx, -8(%rbp)
	ja	.L79
	cmpq	$1, %rbx
	jne	.L63
	movzbl	(%r14), %eax
	movb	%al, 16(%rdi)
	movq	%r13, %rax
.L64:
	movq	%rbx, 8(%rdi)
	xorl	%r8d, %r8d
	movb	$0, (%rax,%rbx)
	jmp	.L67
	.p2align 4,,10
.L81:
	movq	8(%rdi), %rax
	movq	8(%r12), %rdx
	movq	(%r12), %r9
	movq	%rax, %r8
	subq	%rbx, %r8
	cmpq	%r8, 8(%rsi)
	cmovbe	8(%rsi), %r8
	cmpq	%rax, %rbx
	ja	.L80
	movq	%rdx, 32(%rsp)
	movq	%rdi, %rcx
	movq	%rbx, %rdx
.LEHB2:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
.LEHE2:
	addq	8(%r12), %rbx
	movq	%rbx, %r8
.L67:
	movq	8(%rsi), %r9
	movq	(%rsi), %rdx
	movq	%rdi, %rcx
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcyy
	cmpq	$-1, %rax
	movq	%rax, %rbx
	jne	.L81
	movq	%rdi, %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
.L63:
	testq	%rbx, %rbx
	movq	%r13, %rax
	je	.L64
	jmp	.L62
	.p2align 4,,10
.L79:
	leaq	-8(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rdi, %rcx
.LEHB3:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE3:
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdi)
	movq	%rdx, 16(%rdi)
.L62:
	movq	%rbx, %r8
	movq	%r14, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-8(%rbp), %rbx
	movq	(%rdi), %rax
	jmp	.L64
.L80:
	leaq	.LC4(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rax, %r9
	movq	%rbx, %r8
.LEHB4:
	call	_ZSt24__throw_out_of_range_fmtPKcz
.LEHE4:
.L71:
	movq	(%rdi), %rcx
	movq	%rax, %rbx
	cmpq	%rcx, %r13
	je	.L69
	call	_ZdlPv
.L69:
	movq	%rbx, %rcx
.LEHB5:
	call	_Unwind_Resume
.L78:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
	nop
.LEHE5:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA9487:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9487-.LLSDACSB9487
.LLSDACSB9487:
	.uleb128 .LEHB2-.LFB9487
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L71-.LFB9487
	.uleb128 0
	.uleb128 .LEHB3-.LFB9487
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB4-.LFB9487
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L71-.LFB9487
	.uleb128 0
	.uleb128 .LEHB5-.LFB9487
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE9487:
	.text
	.seh_endproc
	.section	.text$_Z6sscanfPKcS0_z,"x"
	.linkonce discard
	.p2align 4,,15
	.globl	_Z6sscanfPKcS0_z
	.def	_Z6sscanfPKcS0_z;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6sscanfPKcS0_z
_Z6sscanfPKcS0_z:
.LFB1:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%r8, 32(%rbp)
	leaq	32(%rbp), %r8
	movq	%r9, 40(%rbp)
	movq	%r8, -8(%rbp)
	call	__mingw_vsscanf
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_Z7sprintfPcPKcz,"x"
	.linkonce discard
	.p2align 4,,15
	.globl	_Z7sprintfPcPKcz
	.def	_Z7sprintfPcPKcz;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7sprintfPcPKcz
_Z7sprintfPcPKcz:
.LFB9:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%r8, 32(%rbp)
	leaq	32(%rbp), %r8
	movq	%r9, 40(%rbp)
	movq	%r8, -8(%rbp)
	call	__mingw_vsprintf
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common11opp_isblankEPKc
	.def	_ZN7omnetpp6common11opp_isblankEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common11opp_isblankEPKc
_ZN7omnetpp6common11opp_isblankEPKc:
.LFB8565:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$1, %eax
	testq	%rcx, %rcx
	movq	%rcx, %rbx
	je	.L84
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L84
	movq	__imp_isspace(%rip), %rsi
	jmp	.L86
	.p2align 4,,10
.L93:
	addq	$1, %rbx
	movzbl	(%rbx), %ecx
	testb	%cl, %cl
	je	.L92
.L86:
	call	*%rsi
	testl	%eax, %eax
	jne	.L93
	xorl	%eax, %eax
.L84:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4,,10
.L92:
	movl	$1, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii "basic_string::substr\0"
.LC7:
	.ascii "basic_string::basic_string\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common8opp_trimERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN7omnetpp6common8opp_trimERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common8opp_trimERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN7omnetpp6common8opp_trimERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8566:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	8(%rdx), %rax
	movq	%rcx, %r14
	movq	%rdx, 24(%rbp)
	testl	%eax, %eax
	movq	%rax, -88(%rbp)
	movl	%eax, %ebx
	jle	.L95
	leal	-1(%rax), %r12d
	movq	(%rdx), %r13
	xorl	%r15d, %r15d
	movq	__imp_isspace(%rip), %rdi
	addq	$1, %r12
	jmp	.L97
	.p2align 4,,10
.L121:
	leal	1(%r15), %esi
	addq	$1, %r15
	cmpq	%r15, %r12
	je	.L120
.L97:
	movzbl	0(%r13,%r15), %ecx
	movl	%r15d, %esi
	call	*%rdi
	testl	%eax, %eax
	jne	.L121
	movq	-88(%rbp), %rax
	cmpl	%r15d, %eax
	jle	.L98
	cltq
	leaq	-1(%r13,%rax), %r13
	jmp	.L99
	.p2align 4,,10
.L100:
	subq	$1, %r13
	cmpl	%esi, %r12d
	movl	%r12d, %ebx
	je	.L98
.L99:
	movzbl	0(%r13), %ecx
	leal	-1(%rbx), %r12d
	call	*%rdi
	testl	%eax, %eax
	jne	.L100
.L98:
	subl	%esi, %ebx
	cmpq	%r15, -88(%rbp)
	movslq	%ebx, %rbx
	jb	.L122
	movq	24(%rbp), %rdx
	leaq	16(%r14), %rax
	movq	%rax, (%r14)
	movq	8(%rdx), %r9
	movq	(%rdx), %rsi
	cmpq	%r15, %r9
	jb	.L123
.L102:
	subq	%r15, %r9
	addq	%r15, %rsi
	cmpq	%rbx, %r9
	movq	%rsi, %rdx
	cmovbe	%r9, %rbx
	addq	%rbx, %rdx
	je	.L103
	testq	%rsi, %rsi
	je	.L124
.L103:
	cmpq	$15, %rbx
	movq	%rbx, -72(%rbp)
	ja	.L125
	cmpq	$1, %rbx
	jne	.L106
	movzbl	(%rsi), %edx
	movb	%dl, (%rax)
.L107:
	movq	%rbx, 8(%r14)
	movb	$0, (%rax,%rbx)
	movq	%r14, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L120:
	movslq	%esi, %r15
	jmp	.L98
	.p2align 4,,10
.L125:
	leaq	-72(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r14, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-72(%rbp), %rdx
	movq	%rax, (%r14)
	movq	%rdx, 16(%r14)
.L105:
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-72(%rbp), %rbx
	movq	(%r14), %rax
	jmp	.L107
	.p2align 4,,10
.L106:
	testq	%rbx, %rbx
	je	.L107
	jmp	.L105
	.p2align 4,,10
.L95:
	leaq	16(%rcx), %rax
	movslq	-88(%rbp), %rbx
	xorl	%r15d, %r15d
	movq	%rax, (%rcx)
	movq	(%rdx), %rsi
	movq	8(%rdx), %r9
	jmp	.L102
.L122:
	movq	-88(%rbp), %r9
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%r15, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L123:
	leaq	.LC7(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%r15, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L124:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
.LC8:
	.ascii "Missing opening quote\0"
	.align 8
.LC9:
	.ascii "Illegal escape sequence '\\%c' (Hint: use double backslashes to quote display string special chars: equal sign, comma, semicolon)\0"
.LC10:
	.ascii "Illegal escape sequence '\\%c'\0"
.LC11:
	.ascii "Missing closing quote\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common18opp_parsequotedstrB5cxx11EPKcRS2_
	.def	_ZN7omnetpp6common18opp_parsequotedstrB5cxx11EPKcRS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common18opp_parsequotedstrB5cxx11EPKcRS2_
_ZN7omnetpp6common18opp_parsequotedstrB5cxx11EPKcRS2_:
.LFB8573:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	__imp_isspace(%rip), %rsi
	movq	%rcx, %rdi
	movq	%rdx, %r15
	movq	%r8, %r13
	movq	%rdx, %r14
	jmp	.L127
	.p2align 4,,10
.L167:
	movq	%rbx, %r14
.L127:
	movzbl	(%r14), %ecx
	leaq	1(%r14), %rbx
	movl	%ecx, %r12d
	call	*%rsi
	testl	%eax, %eax
	jne	.L167
	cmpb	$34, %r12b
	jne	.L189
	movq	%r15, %rcx
	call	strlen
	leaq	1(%rax), %rcx
.LEHB6:
	call	_Znay
.LEHE6:
	movq	%rax, %r12
	movzbl	1(%r14), %eax
	movq	%r12, %rdx
	testb	%al, %al
	je	.L129
	cmpb	$34, %al
	je	.L129
	leaq	.L133(%rip), %r9
	jmp	.L155
	.p2align 4,,10
.L130:
	movb	%al, (%rdx)
	movq	%r8, %rbx
	movl	%ecx, %eax
.L144:
	addq	$1, %rdx
	testb	%al, %al
	je	.L129
.L191:
	cmpb	$34, %al
	je	.L129
.L155:
	cmpb	$92, %al
	leaq	1(%rbx), %r8
	movzbl	1(%rbx), %ecx
	jne	.L130
	cmpb	$120, %cl
	ja	.L131
	movslq	(%r9,%rcx,4), %rax
	addq	%r9, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L133:
	.long	.L132-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L134-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L135-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L136-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L136-.L133
	.long	.L131-.L133
	.long	.L136-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L137-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L138-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L139-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L140-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L141-.L133
	.long	.L131-.L133
	.long	.L142-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L131-.L133
	.long	.L143-.L133
	.text
	.p2align 4,,10
.L143:
	movsbl	2(%rbx), %ecx
	leaq	2(%rbx), %r10
	leal	-48(%rcx), %r8d
	movl	%ecx, %eax
	cmpb	$9, %r8b
	ja	.L145
	subl	$48, %ecx
.L146:
	testl	%ecx, %ecx
	js	.L170
	movsbl	3(%rbx), %r8d
	leaq	3(%rbx), %r11
	leal	-48(%r8), %r10d
	movl	%r8d, %eax
	cmpb	$9, %r10b
	jbe	.L190
	leal	-65(%r8), %r10d
	cmpb	$5, %r10b
	ja	.L151
	subl	$55, %r8d
.L150:
	testl	%r8d, %r8d
	js	.L184
.L153:
	sall	$4, %ecx
	movzbl	4(%rbx), %eax
	addq	$4, %rbx
	addl	%r8d, %ecx
	movb	%cl, (%rdx)
.L195:
	addq	$1, %rdx
	testb	%al, %al
	jne	.L191
	.p2align 4,,10
.L129:
	addq	$1, %rbx
	cmpb	$34, %al
	movb	$0, (%rdx)
	je	.L157
	jmp	.L154
	.p2align 4,,10
.L192:
	addq	$1, %rbx
.L157:
	movzbl	(%rbx), %ecx
	call	*%rsi
	testl	%eax, %eax
	jne	.L192
	leaq	16(%rdi), %rsi
	movq	%rbx, 0(%r13)
	movq	%r12, %rcx
	movq	%rsi, (%rdi)
	call	strlen
	cmpq	$15, %rax
	movq	%rax, %rbx
	movq	%rax, -88(%rbp)
	ja	.L193
	cmpq	$1, %rax
	jne	.L161
	movzbl	(%r12), %edx
	movb	%dl, 16(%rdi)
.L162:
	movq	%rax, 8(%rdi)
	movq	%r12, %rcx
	movb	$0, (%rsi,%rax)
	call	_ZdaPv
	movq	%rdi, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L142:
	movzbl	2(%rbx), %eax
	movb	$9, (%rdx)
	addq	$2, %rbx
	jmp	.L144
	.p2align 4,,10
.L141:
	movzbl	2(%rbx), %eax
	movb	$13, (%rdx)
	addq	$2, %rbx
	jmp	.L144
	.p2align 4,,10
.L140:
	movzbl	2(%rbx), %eax
	movb	$10, (%rdx)
	addq	$2, %rbx
	jmp	.L144
	.p2align 4,,10
.L139:
	movzbl	2(%rbx), %eax
	movb	$12, (%rdx)
	addq	$2, %rbx
	jmp	.L144
	.p2align 4,,10
.L138:
	movzbl	2(%rbx), %eax
	movb	$8, (%rdx)
	addq	$2, %rbx
	jmp	.L144
	.p2align 4,,10
.L137:
	movzbl	2(%rbx), %eax
	movb	$92, (%rdx)
	addq	$2, %rbx
	jmp	.L144
	.p2align 4,,10
.L135:
	movzbl	2(%rbx), %eax
	movb	$34, (%rdx)
	addq	$2, %rbx
	jmp	.L144
	.p2align 4,,10
.L134:
	movzbl	2(%rbx), %eax
	subq	$1, %rdx
	addq	$2, %rbx
	jmp	.L144
	.p2align 4,,10
.L132:
	movb	$0, (%rdx)
.L154:
	movq	%r12, %rcx
	call	_ZdaPv
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC11(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB7:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE7:
.L185:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB8:
	call	__cxa_throw
	.p2align 4,,10
.L145:
	leal	-65(%rcx), %r8d
	cmpb	$5, %r8b
	jbe	.L194
	leal	-97(%rcx), %r8d
	cmpb	$5, %r8b
	ja	.L170
	subl	$87, %ecx
	jmp	.L146
	.p2align 4,,10
.L193:
	leaq	-88(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE8:
	movq	%rax, %rsi
	movq	%rax, (%rdi)
	movq	-88(%rbp), %rax
	movq	%rax, 16(%rdi)
.L160:
	movq	%rsi, %rcx
	movq	%rbx, %r8
	movq	%r12, %rdx
	call	memcpy
	movq	-88(%rbp), %rax
	movq	(%rdi), %rsi
	jmp	.L162
	.p2align 4,,10
.L170:
	xorl	%ecx, %ecx
	movq	%r10, %rbx
	movb	%cl, (%rdx)
	jmp	.L195
	.p2align 4,,10
.L190:
	subl	$48, %r8d
	testl	%r8d, %r8d
	jns	.L153
.L184:
	movq	%r11, %rbx
	movb	%cl, (%rdx)
	jmp	.L195
.L194:
	subl	$55, %ecx
	jmp	.L146
	.p2align 4,,10
.L161:
	testq	%rax, %rax
	je	.L162
	jmp	.L160
	.p2align 4,,10
.L151:
	leal	-97(%r8), %r10d
	subl	$87, %r8d
	cmpb	$5, %r10b
	jbe	.L150
	jmp	.L184
.L131:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	movsbl	1(%rbx), %r8d
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rsi
.LEHB9:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE9:
.L186:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rsi, %rcx
.LEHB10:
	call	__cxa_throw
.LEHE10:
.L136:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	movsbl	1(%rbx), %r8d
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rsi
.LEHB11:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE11:
	jmp	.L186
.L189:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB12:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE12:
	jmp	.L185
.L172:
.L188:
	movq	%rax, %rbx
	movq	%rsi, %rcx
	call	__cxa_free_exception
	movq	%rbx, %rcx
.LEHB13:
	call	_Unwind_Resume
.L171:
.L187:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
	call	_Unwind_Resume
.LEHE13:
.L174:
	jmp	.L187
.L173:
	jmp	.L188
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8573:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8573-.LLSDACSB8573
.LLSDACSB8573:
	.uleb128 .LEHB6-.LFB8573
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB7-.LFB8573
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L174-.LFB8573
	.uleb128 0
	.uleb128 .LEHB8-.LFB8573
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB9-.LFB8573
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L173-.LFB8573
	.uleb128 0
	.uleb128 .LEHB10-.LFB8573
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB11-.LFB8573
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L172-.LFB8573
	.uleb128 0
	.uleb128 .LEHB12-.LFB8573
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L171-.LFB8573
	.uleb128 0
	.uleb128 .LEHB13-.LFB8573
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
.LLSDACSE8573:
	.text
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "Trailing garbage after string literal\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common18opp_parsequotedstrB5cxx11EPKc
	.def	_ZN7omnetpp6common18opp_parsequotedstrB5cxx11EPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common18opp_parsequotedstrB5cxx11EPKc
_ZN7omnetpp6common18opp_parsequotedstrB5cxx11EPKc:
.LFB8567:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	-88(%rbp), %r8
	movq	%rcx, %rbx
.LEHB14:
	call	_ZN7omnetpp6common18opp_parsequotedstrB5cxx11EPKcRS2_
.LEHE14:
	movq	-88(%rbp), %rax
	cmpb	$0, (%rax)
	jne	.L203
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L203:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rsi
.LEHB15:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE15:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rsi, %rcx
.LEHB16:
	call	__cxa_throw
.LEHE16:
.L202:
	movq	%rax, %rsi
.L199:
	movq	(%rbx), %rcx
	addq	$16, %rbx
	cmpq	%rbx, %rcx
	je	.L200
	call	_ZdlPv
.L200:
	movq	%rsi, %rcx
.LEHB17:
	call	_Unwind_Resume
.LEHE17:
.L201:
	movq	%rax, %rdi
	movq	%rsi, %rcx
	call	__cxa_free_exception
	movq	%rdi, %rsi
	jmp	.L199
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8567:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8567-.LLSDACSB8567
.LLSDACSB8567:
	.uleb128 .LEHB14-.LFB8567
	.uleb128 .LEHE14-.LEHB14
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB15-.LFB8567
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L201-.LFB8567
	.uleb128 0
	.uleb128 .LEHB16-.LFB8567
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L202-.LFB8567
	.uleb128 0
	.uleb128 .LEHB17-.LFB8567
	.uleb128 .LEHE17-.LEHB17
	.uleb128 0
	.uleb128 0
.LLSDACSE8567:
	.text
	.seh_endproc
	.section .rdata,"dr"
.LC13:
	.ascii "%2.2X\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common12opp_quotestrERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN7omnetpp6common12opp_quotestrERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12opp_quotestrERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN7omnetpp6common12opp_quotestrERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8574:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	8(%rdx), %rax
	leaq	.LC13(%rip), %r14
	movq	%rcx, %r12
	movq	%rdx, %rbx
	leaq	3(,%rax,4), %rcx
	call	_Znay
	movq	(%rbx), %rsi
	leaq	1(%rax), %rdi
	movq	%rax, %r13
	movb	$34, (%rax)
	.p2align 4,,10
.L205:
	movzbl	(%rsi), %ebx
	testb	%bl, %bl
	je	.L206
.L227:
	addq	$1, %rsi
	cmpb	$12, %bl
	je	.L208
	jg	.L209
	cmpb	$9, %bl
	je	.L210
	cmpb	$10, %bl
	je	.L211
	cmpb	$8, %bl
	je	.L225
.L207:
	movzbl	%bl, %ecx
	call	*__imp_iscntrl(%rip)
	testl	%eax, %eax
	jne	.L226
	movb	%bl, (%rdi)
	movzbl	(%rsi), %ebx
	addq	$1, %rdi
	testb	%bl, %bl
	jne	.L227
	.p2align 4,,10
.L206:
	leaq	16(%r12), %rsi
	movl	$34, %eax
	movq	%r13, %rcx
	movw	%ax, (%rdi)
	movq	%rsi, (%r12)
	call	strlen
	cmpq	$15, %rax
	movq	%rax, %rbx
	movq	%rax, -8(%rbp)
	ja	.L228
	cmpq	$1, %rax
	jne	.L220
	movzbl	0(%r13), %edx
	movb	%dl, 16(%r12)
.L221:
	movq	%rax, 8(%r12)
	movq	%r13, %rcx
	movb	$0, (%rsi,%rax)
	call	_ZdaPv
	movq	%r12, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
.L209:
	cmpb	$34, %bl
	je	.L213
	cmpb	$92, %bl
	je	.L214
	cmpb	$13, %bl
	jne	.L207
	movl	$29276, %r10d
	addq	$2, %rdi
	movw	%r10w, -2(%rdi)
	jmp	.L205
	.p2align 4,,10
.L213:
	movl	$8796, %r8d
	addq	$2, %rdi
	movw	%r8w, -2(%rdi)
	jmp	.L205
	.p2align 4,,10
.L208:
	movl	$26204, %ebx
	addq	$2, %rdi
	movw	%bx, -2(%rdi)
	jmp	.L205
	.p2align 4,,10
.L214:
	movl	$23644, %ecx
	addq	$2, %rdi
	movw	%cx, -2(%rdi)
	jmp	.L205
	.p2align 4,,10
.L225:
	movl	$25180, %eax
	addq	$2, %rdi
	movw	%ax, -2(%rdi)
	jmp	.L205
	.p2align 4,,10
.L211:
	movl	$28252, %r11d
	addq	$2, %rdi
	movw	%r11w, -2(%rdi)
	jmp	.L205
	.p2align 4,,10
.L210:
	movl	$29788, %r9d
	addq	$2, %rdi
	movw	%r9w, -2(%rdi)
	jmp	.L205
	.p2align 4,,10
.L226:
	movl	$30812, %edx
	leaq	2(%rdi), %rcx
	addq	$4, %rdi
	movw	%dx, -4(%rdi)
	movsbl	-1(%rsi), %r8d
	movq	%r14, %rdx
	call	_Z7sprintfPcPKcz
	jmp	.L205
	.p2align 4,,10
.L228:
	leaq	-8(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r12, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	%rax, %rsi
	movq	%rax, (%r12)
	movq	-8(%rbp), %rax
	movq	%rax, 16(%r12)
.L219:
	movq	%rsi, %rcx
	movq	%rbx, %r8
	movq	%r13, %rdx
	call	memcpy
	movq	-8(%rbp), %rax
	movq	(%r12), %rsi
	jmp	.L221
	.p2align 4,,10
.L220:
	testq	%rax, %rax
	je	.L221
	jmp	.L219
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common15opp_needsquotesEPKc
	.def	_ZN7omnetpp6common15opp_needsquotesEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common15opp_needsquotesEPKc
_ZN7omnetpp6common15opp_needsquotesEPKc:
.LFB8575:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movzbl	(%rcx), %esi
	movl	$1, %ebx
	movq	%rcx, %rdi
	testb	%sil, %sil
	je	.L229
	movq	__imp_isspace(%rip), %r12
	movq	__imp_iscntrl(%rip), %r13
	jmp	.L231
	.p2align 4,,10
.L236:
	movl	%r14d, %ecx
	call	*%r13
	testl	%eax, %eax
	jne	.L233
	addq	$1, %rdi
	movzbl	(%rdi), %esi
	testb	%sil, %sil
	je	.L229
.L231:
	movzbl	%sil, %r14d
	movl	%r14d, %ecx
	call	*%r12
	testl	%eax, %eax
	setne	%al
	cmpb	$92, %sil
	sete	%dl
	orl	%edx, %eax
	cmpb	$34, %sil
	sete	%bl
	orb	%al, %bl
	je	.L236
.L229:
	movl	%ebx, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
.L233:
	movl	$1, %ebx
	jmp	.L229
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common12opp_vstringfB5cxx11EPKcRPc
	.def	_ZN7omnetpp6common12opp_vstringfB5cxx11EPKcRPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12opp_vstringfB5cxx11EPKcRPc
_ZN7omnetpp6common12opp_vstringfB5cxx11EPKcRPc:
.LFB8577:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	(%r8), %r13
	leaq	16(%rcx), %r12
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	%r8, %rbx
	movl	$32, %edx
	xorl	%r8d, %r8d
	movq	%r12, (%rcx)
.LEHB18:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEyc
.LEHE18:
	movq	(%rbx), %r9
	movq	(%rsi), %rcx
	movq	%rdi, %r8
	movl	$32, %edx
.LEHB19:
	call	__mingw_vsnprintf
	cmpl	$31, %eax
	jle	.L238
	addl	$1, %eax
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	movslq	%eax, %rbx
	movq	%rbx, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEyc
	movq	(%rsi), %rcx
	movq	%r13, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	__mingw_vsnprintf
.L238:
	movslq	%eax, %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEyc
.LEHE19:
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
.L241:
	movq	(%rsi), %rcx
	movq	%rax, %rbx
	cmpq	%rcx, %r12
	je	.L240
	call	_ZdlPv
.L240:
	movq	%rbx, %rcx
.LEHB20:
	call	_Unwind_Resume
	nop
.LEHE20:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8577:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8577-.LLSDACSB8577
.LLSDACSB8577:
	.uleb128 .LEHB18-.LFB8577
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB19-.LFB8577
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L241-.LFB8577
	.uleb128 0
	.uleb128 .LEHB20-.LFB8577
	.uleb128 .LEHE20-.LEHB20
	.uleb128 0
	.uleb128 0
.LLSDACSE8577:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common11opp_stringfB5cxx11EPKcz
	.def	_ZN7omnetpp6common11opp_stringfB5cxx11EPKcz;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common11opp_stringfB5cxx11EPKcz
_ZN7omnetpp6common11opp_stringfB5cxx11EPKcz:
.LFB8576:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	-32(%rbp), %rax
	movq	%r8, -32(%rbp)
	leaq	-88(%rbp), %r8
	movq	%rcx, %rbx
	movq	%r9, -24(%rbp)
	movq	%rax, -88(%rbp)
	call	_ZN7omnetpp6common12opp_vstringfB5cxx11EPKcRPc
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC14:
	.ascii "C\0"
.LC15:
	.ascii "%d%n\0"
.LC16:
	.ascii "%u%n\0"
.LC17:
	.ascii "%ld%n\0"
.LC18:
	.ascii "%lld%n\0"
.LC19:
	.ascii "%lu%n\0"
.LC20:
	.ascii "%llu%n\0"
.LC21:
	.ascii "%lg%n\0"
	.align 8
.LC22:
	.ascii "opp_vsscanf: Unsupported format \"%s\"\0"
	.align 8
.LC23:
	.ascii "opp_vsscanf: Unexpected char in format string \"%s\"\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common11opp_vsscanfEPKcS2_Pc
	.def	_ZN7omnetpp6common11opp_vsscanfEPKcS2_Pc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common11opp_vsscanfEPKcS2_Pc
_ZN7omnetpp6common11opp_vsscanfEPKcS2_Pc:
.LFB8578:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	xorl	%r13d, %r13d
	movq	%rdx, %rdi
	leaq	.LC14(%rip), %rdx
	movq	%rcx, %rbx
	movl	$4, %ecx
	movq	%r8, %r12
	leaq	-84(%rbp), %r14
	call	setlocale
	movq	__imp_isspace(%rip), %rsi
	.p2align 4,,10
.L245:
	movzbl	(%rdi), %r15d
	cmpb	$37, %r15b
	jne	.L246
.L276:
	movzbl	1(%rdi), %eax
	cmpb	$100, %al
	je	.L273
	cmpb	$117, %al
	je	.L274
	cmpb	$108, %al
	je	.L275
	cmpb	$103, %al
	jne	.L254
	movq	(%r12), %r8
	leaq	.LC1(%rip), %rdx
	movq	%r14, %r9
	movq	%rbx, %rcx
	leaq	8(%r12), %r15
.LEHB21:
	call	_Z6sscanfPKcS0_z.constprop.111
.LEHE21:
.L268:
	addq	$2, %rdi
	addl	%eax, %r13d
	movq	%r15, %r12
	movslq	-84(%rbp), %rax
	movzbl	(%rdi), %r15d
	addq	%rax, %rbx
	cmpb	$37, %r15b
	je	.L276
.L246:
	movzbl	%r15b, %ecx
	call	*%rsi
	testl	%eax, %eax
	jne	.L258
	jmp	.L256
	.p2align 4,,10
.L277:
	addq	$1, %rbx
.L258:
	movzbl	(%rbx), %ecx
	call	*%rsi
	testl	%eax, %eax
	jne	.L277
	addq	$1, %rdi
	jmp	.L245
	.p2align 4,,10
.L275:
	movzbl	2(%rdi), %eax
	cmpb	$100, %al
	je	.L278
	cmpb	$108, %al
	je	.L279
	cmpb	$117, %al
	je	.L280
	cmpb	$103, %al
	je	.L281
.L254:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC22(%rip), %rdx
	movq	%rdi, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB22:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE22:
.L271:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB23:
	call	__cxa_throw
	.p2align 4,,10
.L273:
	movq	(%r12), %r8
	leaq	.LC15(%rip), %rdx
	movq	%r14, %r9
	movq	%rbx, %rcx
	leaq	8(%r12), %r15
	call	_Z6sscanfPKcS0_z
	jmp	.L268
	.p2align 4,,10
.L274:
	movq	(%r12), %r8
	leaq	.LC16(%rip), %rdx
	movq	%r14, %r9
	movq	%rbx, %rcx
	leaq	8(%r12), %r15
	call	_Z6sscanfPKcS0_z
	jmp	.L268
	.p2align 4,,10
.L256:
	testb	%r15b, %r15b
	je	.L244
	cmpb	$35, %r15b
	jne	.L282
.L244:
	movl	%r13d, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L279:
	movzbl	3(%rdi), %eax
	cmpb	$100, %al
	je	.L283
	cmpb	$117, %al
	jne	.L254
	movq	(%r12), %r8
	leaq	8(%r12), %r15
	leaq	.LC20(%rip), %rdx
	movq	%r14, %r9
.L270:
	movq	%rbx, %rcx
	addq	$4, %rdi
	movq	%r15, %r12
	call	_Z6sscanfPKcS0_z
	addl	%eax, %r13d
	movslq	-84(%rbp), %rax
	addq	%rax, %rbx
	jmp	.L245
.L278:
	movq	(%r12), %r8
	leaq	8(%r12), %r15
	leaq	.LC17(%rip), %rdx
	movq	%r14, %r9
.L269:
	movq	%rbx, %rcx
	addq	$3, %rdi
	movq	%r15, %r12
	call	_Z6sscanfPKcS0_z
.LEHE23:
	addl	%eax, %r13d
	movslq	-84(%rbp), %rax
	addq	%rax, %rbx
	jmp	.L245
.L280:
	leaq	8(%r12), %r15
	movq	%r14, %r9
	movq	(%r12), %r8
	leaq	.LC19(%rip), %rdx
	jmp	.L269
.L281:
	leaq	8(%r12), %r15
	movq	%r14, %r9
	movq	(%r12), %r8
	leaq	.LC21(%rip), %rdx
	jmp	.L269
.L283:
	leaq	8(%r12), %r15
	movq	%r14, %r9
	movq	(%r12), %r8
	leaq	.LC18(%rip), %rdx
	jmp	.L270
.L282:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC23(%rip), %rdx
	movq	%rdi, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB24:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE24:
	jmp	.L271
.L265:
.L272:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
.LEHB25:
	call	_Unwind_Resume
.LEHE25:
.L266:
	jmp	.L272
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8578:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8578-.LLSDACSB8578
.LLSDACSB8578:
	.uleb128 .LEHB21-.LFB8578
	.uleb128 .LEHE21-.LEHB21
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB22-.LFB8578
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L265-.LFB8578
	.uleb128 0
	.uleb128 .LEHB23-.LFB8578
	.uleb128 .LEHE23-.LEHB23
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB24-.LFB8578
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L266-.LFB8578
	.uleb128 0
	.uleb128 .LEHB25-.LFB8578
	.uleb128 .LEHE25-.LEHB25
	.uleb128 0
	.uleb128 0
.LLSDACSE8578:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b
	.def	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b
_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b:
.LFB8579:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	48(%rbp), %r15d
	leaq	16(%rcx), %r13
	movq	%rcx, %rdi
	movq	%r8, %rsi
	movq	%r9, %r12
	movq	%r13, (%rcx)
	movq	(%rdx), %r14
	movq	8(%rdx), %rbx
	movq	%r14, %rax
	addq	%rbx, %rax
	je	.L285
	testq	%r14, %r14
	je	.L313
.L285:
	cmpq	$15, %rbx
	movq	%rbx, -72(%rbp)
	ja	.L314
	cmpq	$1, %rbx
	jne	.L288
	movzbl	(%r14), %eax
	movb	%al, 16(%rdi)
	movq	%r13, %rax
.L289:
	xorl	%r8d, %r8d
	testb	%r15b, %r15b
	movq	%rbx, 8(%rdi)
	movb	$0, (%rax,%rbx)
	jne	.L290
	jmp	.L315
	.p2align 4,,10
.L316:
	movq	8(%rdi), %rax
	movq	8(%r12), %rdx
	movq	(%r12), %r9
	movq	%rax, %r8
	subq	%rbx, %r8
	cmpq	%r8, 8(%rsi)
	cmovbe	8(%rsi), %r8
	cmpq	%rax, %rbx
	ja	.L292
	movq	%rdx, 32(%rsp)
	movq	%rdi, %rcx
	movq	%rbx, %rdx
.LEHB26:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
	addq	8(%r12), %rbx
	movq	%rbx, %r8
.L290:
	movq	8(%rsi), %r9
	movq	(%rsi), %rdx
	movq	%rdi, %rcx
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcyy
	cmpq	$-1, %rax
	movq	%rax, %rbx
	jne	.L316
.L284:
	movq	%rdi, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L315:
	movq	8(%rsi), %r9
	movq	(%rsi), %rdx
	movq	%rdi, %rcx
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcyy
	cmpq	$-1, %rax
	movq	%rax, %rbx
	je	.L284
	movq	8(%rdi), %rax
	movq	8(%rsi), %rdx
	movq	8(%r12), %rcx
	movq	(%r12), %r9
	movq	%rax, %r8
	subq	%rbx, %r8
	cmpq	%rdx, %r8
	cmova	%rdx, %r8
	cmpq	%rax, %rbx
	ja	.L292
	movq	%rcx, 32(%rsp)
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
.LEHE26:
	jmp	.L284
	.p2align 4,,10
.L314:
	leaq	-72(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rdi, %rcx
.LEHB27:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE27:
	movq	-72(%rbp), %rdx
	movq	%rax, (%rdi)
	movq	%rdx, 16(%rdi)
.L287:
	movq	%rbx, %r8
	movq	%r14, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-72(%rbp), %rbx
	movq	(%rdi), %rax
	jmp	.L289
	.p2align 4,,10
.L288:
	testq	%rbx, %rbx
	movq	%r13, %rax
	je	.L289
	jmp	.L287
	.p2align 4,,10
.L292:
	leaq	.LC4(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rax, %r9
	movq	%rbx, %r8
.LEHB28:
	call	_ZSt24__throw_out_of_range_fmtPKcz
.LEHE28:
.L299:
	movq	(%rdi), %rcx
	movq	%rax, %rbx
	cmpq	%rcx, %r13
	je	.L296
	call	_ZdlPv
.L296:
	movq	%rbx, %rcx
.LEHB29:
	call	_Unwind_Resume
.L313:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
	nop
.LEHE29:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8579:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8579-.LLSDACSB8579
.LLSDACSB8579:
	.uleb128 .LEHB26-.LFB8579
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L299-.LFB8579
	.uleb128 0
	.uleb128 .LEHB27-.LFB8579
	.uleb128 .LEHE27-.LEHB27
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB28-.LFB8579
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L299-.LFB8579
	.uleb128 0
	.uleb128 .LEHB29-.LFB8579
	.uleb128 .LEHE29-.LEHB29
	.uleb128 0
	.uleb128 0
.LLSDACSE8579:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common23opp_substitutevariablesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERNS0_32opp_substitutevariables_resolverE
	.def	_ZN7omnetpp6common23opp_substitutevariablesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERNS0_32opp_substitutevariables_resolverE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common23opp_substitutevariablesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERNS0_32opp_substitutevariables_resolverE
_ZN7omnetpp6common23opp_substitutevariablesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERNS0_32opp_substitutevariables_resolverE:
.LFB8589:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$184, %rsp
	.seh_stackalloc	184
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	xorl	%ebx, %ebx
	movq	%rcx, %rax
	movq	%rcx, 128(%rbp)
	movq	%rdx, %rdi
	addq	$16, %rax
	movq	%r8, %r12
	movq	$0, 8(%rcx)
	movq	%rax, -88(%rbp)
	movq	%rax, (%rcx)
	movb	$0, 16(%rcx)
	.p2align 4,,10
.L318:
	cmpq	8(%rdi), %rbx
	jnb	.L317
.L485:
	movq	%rbx, %r8
	movl	$36, %edx
	movq	%rdi, %rcx
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEcy
	cmpq	$-1, %rax
	movq	%rax, %r15
	je	.L321
	movq	8(%rdi), %r9
	subq	%rbx, %rax
	cmpq	%r9, %rbx
	ja	.L478
	movq	(%rdi), %rsi
	subq	%rbx, %r9
	leaq	16(%rbp), %rdx
	movq	%rdx, -56(%rbp)
	leaq	32(%rbp), %rdx
	addq	%rbx, %rsi
	cmpq	%rax, %r9
	cmovbe	%r9, %rax
	movq	%rdx, 16(%rbp)
	movq	%rax, %rbx
	movq	%rsi, %rax
	addq	%rbx, %rax
	je	.L323
	testq	%rsi, %rsi
	je	.L479
.L323:
	cmpq	$15, %rbx
	movq	%rbx, -48(%rbp)
	ja	.L480
	cmpq	$1, %rbx
	jne	.L326
	movzbl	(%rsi), %eax
	movb	%al, 32(%rbp)
	movq	-56(%rbp), %rax
	addq	$16, %rax
.L327:
	movq	%rbx, 24(%rbp)
	movq	128(%rbp), %rcx
	movb	$0, (%rax,%rbx)
	movq	24(%rbp), %r8
	movq	16(%rbp), %rdx
.LEHB30:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
.LEHE30:
	movq	-56(%rbp), %rax
	movq	16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L331
	call	_ZdlPv
.L331:
	movq	8(%rdi), %rsi
	leaq	1(%r15), %r13
	cmpq	%rsi, %r13
	jb	.L481
.L332:
	movq	%r13, %rax
	subq	%r15, %rax
	cmpq	%rsi, %r15
	ja	.L482
	movq	(%rdi), %rbx
	movq	-56(%rbp), %rcx
	subq	%r15, %rsi
	addq	%r15, %rbx
	cmpq	%rax, %rsi
	leaq	16(%rcx), %rdx
	cmova	%rax, %rsi
	movq	%rbx, %rax
	addq	%rsi, %rax
	movq	%rdx, 16(%rbp)
	je	.L340
	testq	%rbx, %rbx
	je	.L483
.L340:
	cmpq	$15, %rsi
	movq	%rsi, -40(%rbp)
	ja	.L484
	cmpq	$1, %rsi
	jne	.L343
	movzbl	(%rbx), %eax
	movb	%al, 32(%rbp)
	movq	-56(%rbp), %rax
	addq	$16, %rax
.L344:
	movq	%rsi, 24(%rbp)
	movq	128(%rbp), %rcx
	movb	$0, (%rax,%rsi)
	movq	24(%rbp), %r8
	movq	16(%rbp), %rdx
.LEHB31:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
.LEHE31:
	movq	-56(%rbp), %rax
	movq	16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L345
	call	_ZdlPv
.L345:
	movq	%r13, %rbx
	cmpq	8(%rdi), %rbx
	jb	.L485
.L317:
	movq	128(%rbp), %rax
	addq	$184, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L481:
	movq	(%rdi), %rax
	movzbl	1(%rax,%r15), %r14d
	cmpb	$123, %r14b
	je	.L486
.L333:
	movq	%r13, %rbx
	.p2align 4,,10
.L338:
	movq	(%r12), %rax
	leaq	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolver18isVariableNameCharEc(%rip), %rdx
	movq	16(%rax), %rax
	cmpq	%rdx, %rax
	jne	.L334
	movzbl	%r14b, %ecx
	call	*__imp_isalnum(%rip)
	testl	%eax, %eax
	jne	.L335
	cmpb	$95, %r14b
	je	.L335
.L336:
	cmpq	%r13, %rbx
	je	.L332
	leaq	2(%r15), %r14
	cmpq	%r13, %r14
	jne	.L347
	cmpq	%rsi, %rbx
	je	.L348
	movq	(%rdi), %rax
	cmpb	$125, (%rax,%rbx)
	je	.L347
.L348:
	movq	%rbx, %rax
	subq	%r15, %rax
	cmpq	%rsi, %r15
	ja	.L487
	movq	(%rdi), %r13
	movq	-56(%rbp), %rcx
	subq	%r15, %rsi
	addq	%r15, %r13
	cmpq	%rax, %rsi
	leaq	16(%rcx), %rdx
	cmova	%rax, %rsi
	movq	%r13, %rax
	addq	%rsi, %rax
	movq	%rdx, 16(%rbp)
	je	.L350
	testq	%r13, %r13
	je	.L488
.L350:
	cmpq	$15, %rsi
	movq	%rsi, -32(%rbp)
	ja	.L489
	cmpq	$1, %rsi
	jne	.L353
	movzbl	0(%r13), %eax
	movb	%al, 32(%rbp)
	movq	-56(%rbp), %rax
	addq	$16, %rax
.L354:
	movq	%rsi, 24(%rbp)
	movq	128(%rbp), %rcx
	movb	$0, (%rax,%rsi)
	movq	24(%rbp), %r8
	movq	16(%rbp), %rdx
.LEHB32:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
.LEHE32:
	movq	-56(%rbp), %rax
	movq	16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L318
.L472:
	call	_ZdlPv
	jmp	.L318
	.p2align 4,,10
.L334:
	movsbl	%r14b, %edx
	movq	%r12, %rcx
.LEHB33:
	call	*%rax
.LEHE33:
	testb	%al, %al
	movq	8(%rdi), %rsi
	je	.L336
.L335:
	addq	$1, %rbx
	cmpq	%rsi, %rbx
	jnb	.L336
	movq	(%rdi), %rax
	movzbl	(%rax,%rbx), %r14d
	jmp	.L338
	.p2align 4,,10
.L347:
	movq	%rbx, %rax
	subq	%r13, %rax
	cmpq	%r13, %rsi
	jb	.L490
	movq	(%rdi), %r15
	subq	%r13, %rsi
	leaq	-16(%rbp), %rcx
	movq	%rbp, -16(%rbp)
	movq	%rcx, -72(%rbp)
	addq	%r13, %r15
	cmpq	%rax, %rsi
	cmova	%rax, %rsi
	movq	%r15, %rax
	addq	%rsi, %rax
	je	.L357
	testq	%r15, %r15
	je	.L491
.L357:
	cmpq	$15, %rsi
	movq	%rsi, 16(%rbp)
	ja	.L492
	cmpq	$1, %rsi
	jne	.L360
	movzbl	(%r15), %eax
	movb	%al, 0(%rbp)
	movq	-72(%rbp), %rax
	addq	$16, %rax
.L361:
	movq	%rsi, -8(%rbp)
	movb	$0, (%rax,%rsi)
	xorl	%eax, %eax
	cmpq	%r13, %r14
	leaq	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverclERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%rip), %rdx
	sete	%al
	addq	%rax, %rbx
	movq	(%r12), %rax
	movq	24(%rax), %rax
	cmpq	%rdx, %rax
	jne	.L493
	movq	8(%r12), %rax
	movq	16(%rax), %r13
	leaq	8(%rax), %r14
	movq	%r14, -80(%rbp)
	testq	%r13, %r13
	je	.L366
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %r15
	movq	%rax, -64(%rbp)
	jmp	.L367
	.p2align 4,,10
.L372:
	movq	24(%r13), %r13
	testq	%r13, %r13
	je	.L368
.L367:
	movq	40(%r13), %rsi
	movq	%r15, %r8
	cmpq	%r15, %rsi
	cmovbe	%rsi, %r8
	testq	%r8, %r8
	je	.L369
	movq	32(%r13), %rcx
	movq	-64(%rbp), %rdx
	call	memcmp
	testl	%eax, %eax
	jne	.L370
.L369:
	subq	%r15, %rsi
	cmpq	$2147483647, %rsi
	jg	.L371
	cmpq	$-2147483648, %rsi
	jl	.L372
	movl	%esi, %eax
.L370:
	testl	%eax, %eax
	js	.L372
.L371:
	movq	%r13, %r14
	movq	16(%r13), %r13
	testq	%r13, %r13
	jne	.L367
.L368:
	cmpq	-80(%rbp), %r14
	je	.L366
	movq	40(%r14), %rsi
	cmpq	%rsi, %r15
	movq	%rsi, %r8
	cmovbe	%r15, %r8
	testq	%r8, %r8
	je	.L374
	movq	32(%r14), %rdx
	movq	-64(%rbp), %rcx
	call	memcmp
	testl	%eax, %eax
	jne	.L375
.L374:
	subq	%rsi, %r15
	cmpq	$2147483647, %r15
	jg	.L376
	cmpq	$-2147483648, %r15
	jl	.L366
	movl	%r15d, %eax
.L375:
	testl	%eax, %eax
	js	.L366
.L376:
	movq	-56(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 16(%rbp)
	movq	64(%r14), %r13
	movq	72(%r14), %rsi
	movq	%r13, %rax
	addq	%rsi, %rax
	je	.L409
	testq	%r13, %r13
	je	.L494
.L409:
	cmpq	$15, %rsi
	movq	%rsi, -24(%rbp)
	ja	.L495
	cmpq	$1, %rsi
	jne	.L379
	movzbl	0(%r13), %eax
	movb	%al, 32(%rbp)
	movq	-56(%rbp), %rax
	addq	$16, %rax
.L380:
	movq	%rsi, 24(%rbp)
	movb	$0, (%rax,%rsi)
.L381:
	movq	24(%rbp), %r8
	movq	16(%rbp), %rdx
	movq	128(%rbp), %rcx
.LEHB34:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
.LEHE34:
	movq	-56(%rbp), %rax
	movq	16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L384
	call	_ZdlPv
.L384:
	movq	-72(%rbp), %rax
	movq	-16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	.L472
	jmp	.L318
	.p2align 4,,10
.L480:
	movq	-56(%rbp), %rcx
	leaq	-48(%rbp), %rdx
	xorl	%r8d, %r8d
.LEHB35:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE35:
	movq	-48(%rbp), %rdx
	movq	%rax, 16(%rbp)
	movq	%rdx, 32(%rbp)
.L325:
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-48(%rbp), %rbx
	movq	16(%rbp), %rax
	jmp	.L327
	.p2align 4,,10
.L366:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	movq	-16(%rbp), %r8
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB36:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE36:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB37:
	call	__cxa_throw
.LEHE37:
	.p2align 4,,10
.L326:
	movq	-56(%rbp), %rax
	addq	$16, %rax
	testq	%rbx, %rbx
	je	.L327
	jmp	.L325
	.p2align 4,,10
.L486:
	leaq	2(%r15), %r13
	cmpq	%rsi, %r13
	jnb	.L332
	movzbl	2(%rax,%r15), %r14d
	jmp	.L333
	.p2align 4,,10
.L492:
	movq	-56(%rbp), %rdx
	movq	-72(%rbp), %rcx
	xorl	%r8d, %r8d
.LEHB38:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE38:
	movq	16(%rbp), %rdx
	movq	%rax, -16(%rbp)
	movq	%rdx, 0(%rbp)
.L359:
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	16(%rbp), %rsi
	movq	-16(%rbp), %rax
	jmp	.L361
	.p2align 4,,10
.L495:
	movq	-56(%rbp), %rcx
	leaq	-24(%rbp), %rdx
	xorl	%r8d, %r8d
.LEHB39:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-24(%rbp), %rdx
	movq	%rax, 16(%rbp)
	movq	%rdx, 32(%rbp)
.L378:
	movq	%rsi, %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-24(%rbp), %rsi
	movq	16(%rbp), %rax
	jmp	.L380
	.p2align 4,,10
.L493:
	movq	-72(%rbp), %r8
	movq	%r12, %rdx
	movq	-56(%rbp), %rcx
	call	*%rax
.LEHE39:
	jmp	.L381
	.p2align 4,,10
.L360:
	movq	-72(%rbp), %rax
	addq	$16, %rax
	testq	%rsi, %rsi
	je	.L361
	jmp	.L359
	.p2align 4,,10
.L489:
	movq	-56(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	xorl	%r8d, %r8d
.LEHB40:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE40:
	movq	-32(%rbp), %rdx
	movq	%rax, 16(%rbp)
	movq	%rdx, 32(%rbp)
.L352:
	movq	%rsi, %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-32(%rbp), %rsi
	movq	16(%rbp), %rax
	jmp	.L354
	.p2align 4,,10
.L321:
	movq	8(%rdi), %rax
	cmpq	%rax, %rbx
	jnb	.L317
	leaq	32(%rbp), %rdx
	leaq	16(%rbp), %rcx
	movq	%rdx, 16(%rbp)
	movq	(%rdi), %rdx
	movq	%rax, %rdi
	subq	%rbx, %rdi
	movq	%rcx, -56(%rbp)
	leaq	(%rdx,%rbx), %rsi
	addq	%rax, %rdx
	movq	%rdi, %rbx
	je	.L387
	testq	%rsi, %rsi
	je	.L496
.L387:
	cmpq	$15, %rbx
	movq	%rbx, -16(%rbp)
	ja	.L497
	cmpq	$1, %rbx
	jne	.L390
	movzbl	(%rsi), %eax
	movb	%al, 32(%rbp)
	movq	-56(%rbp), %rax
	addq	$16, %rax
.L391:
	movq	%rbx, 24(%rbp)
	movq	128(%rbp), %rcx
	movb	$0, (%rax,%rbx)
	movq	24(%rbp), %r8
	movq	16(%rbp), %rdx
.LEHB41:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
.LEHE41:
	movq	-56(%rbp), %rax
	movq	16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L317
	call	_ZdlPv
	jmp	.L317
	.p2align 4,,10
.L379:
	movq	-56(%rbp), %rax
	addq	$16, %rax
	testq	%rsi, %rsi
	je	.L380
	jmp	.L378
	.p2align 4,,10
.L484:
	movq	-56(%rbp), %rcx
	leaq	-40(%rbp), %rdx
	xorl	%r8d, %r8d
.LEHB42:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-40(%rbp), %rdx
	movq	%rax, 16(%rbp)
	movq	%rdx, 32(%rbp)
.L342:
	movq	%rsi, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-40(%rbp), %rsi
	movq	16(%rbp), %rax
	jmp	.L344
.L353:
	movq	-56(%rbp), %rax
	addq	$16, %rax
	testq	%rsi, %rsi
	je	.L354
	jmp	.L352
	.p2align 4,,10
.L343:
	movq	-56(%rbp), %rax
	addq	$16, %rax
	testq	%rsi, %rsi
	je	.L344
	jmp	.L342
	.p2align 4,,10
.L390:
	movq	-56(%rbp), %rax
	addq	$16, %rax
	testq	%rbx, %rbx
	je	.L391
	jmp	.L389
	.p2align 4,,10
.L497:
	movq	-56(%rbp), %rcx
	leaq	-16(%rbp), %rdx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-16(%rbp), %rdx
	movq	%rax, 16(%rbp)
	movq	%rdx, 32(%rbp)
.L389:
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-16(%rbp), %rbx
	movq	16(%rbp), %rax
	jmp	.L391
.L478:
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rbx, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.LEHE42:
.L417:
	movq	%rax, %rbx
.L395:
	movq	128(%rbp), %rax
	movq	(%rax), %rcx
	cmpq	%rcx, -88(%rbp)
	je	.L405
	call	_ZdlPv
.L405:
	movq	%rbx, %rcx
.LEHB43:
	call	_Unwind_Resume
.LEHE43:
.L423:
.L475:
	movq	%rax, %rbx
	movq	-56(%rbp), %rax
	movq	16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L395
.L473:
	call	_ZdlPv
	jmp	.L395
.L496:
	leaq	.LC2(%rip), %rcx
.LEHB44:
	call	_ZSt19__throw_logic_errorPKc
.L419:
	jmp	.L475
.L422:
	movq	%rax, %rbx
	movq	-56(%rbp), %rax
	movq	16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L383
	call	_ZdlPv
.L383:
	movq	-72(%rbp), %rax
	movq	-16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	.L473
	jmp	.L395
.L483:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.L421:
	movq	%rax, %rbx
	jmp	.L383
.L424:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rbx
	jmp	.L383
.L488:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.L487:
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rsi, %r9
	movq	%r15, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.LEHE44:
.L494:
	leaq	.LC2(%rip), %rcx
.LEHB45:
	call	_ZSt19__throw_logic_errorPKc
.LEHE45:
.L479:
	leaq	.LC2(%rip), %rcx
.LEHB46:
	call	_ZSt19__throw_logic_errorPKc
.L482:
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rsi, %r9
	movq	%r15, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L418:
	jmp	.L475
.L420:
	jmp	.L475
.L490:
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rsi, %r9
	movq	%r13, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L491:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
	nop
.LEHE46:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8589:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8589-.LLSDACSB8589
.LLSDACSB8589:
	.uleb128 .LEHB30-.LFB8589
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L418-.LFB8589
	.uleb128 0
	.uleb128 .LEHB31-.LFB8589
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L419-.LFB8589
	.uleb128 0
	.uleb128 .LEHB32-.LFB8589
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L420-.LFB8589
	.uleb128 0
	.uleb128 .LEHB33-.LFB8589
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L417-.LFB8589
	.uleb128 0
	.uleb128 .LEHB34-.LFB8589
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L422-.LFB8589
	.uleb128 0
	.uleb128 .LEHB35-.LFB8589
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L417-.LFB8589
	.uleb128 0
	.uleb128 .LEHB36-.LFB8589
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L424-.LFB8589
	.uleb128 0
	.uleb128 .LEHB37-.LFB8589
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L421-.LFB8589
	.uleb128 0
	.uleb128 .LEHB38-.LFB8589
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L417-.LFB8589
	.uleb128 0
	.uleb128 .LEHB39-.LFB8589
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L421-.LFB8589
	.uleb128 0
	.uleb128 .LEHB40-.LFB8589
	.uleb128 .LEHE40-.LEHB40
	.uleb128 .L417-.LFB8589
	.uleb128 0
	.uleb128 .LEHB41-.LFB8589
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L423-.LFB8589
	.uleb128 0
	.uleb128 .LEHB42-.LFB8589
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L417-.LFB8589
	.uleb128 0
	.uleb128 .LEHB43-.LFB8589
	.uleb128 .LEHE43-.LEHB43
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB44-.LFB8589
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L417-.LFB8589
	.uleb128 0
	.uleb128 .LEHB45-.LFB8589
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L421-.LFB8589
	.uleb128 0
	.uleb128 .LEHB46-.LFB8589
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L417-.LFB8589
	.uleb128 0
.LLSDACSE8589:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common23opp_substitutevariablesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKSt3mapIS6_S6_St4lessIS6_ESaISt4pairIS7_S6_EEE
	.def	_ZN7omnetpp6common23opp_substitutevariablesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKSt3mapIS6_S6_St4lessIS6_ESaISt4pairIS7_S6_EEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common23opp_substitutevariablesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKSt3mapIS6_S6_St4lessIS6_ESaISt4pairIS7_S6_EEE
_ZN7omnetpp6common23opp_substitutevariablesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKSt3mapIS6_S6_St4lessIS6_ESaISt4pairIS7_S6_EEE:
.LFB8588:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	16+_ZTVN7omnetpp6common12_GLOBAL__N_116MapBasedResolverE(%rip), %rax
	movq	%r8, -88(%rbp)
	leaq	-96(%rbp), %r8
	movq	%rcx, %rbx
	movq	%rax, -96(%rbp)
	call	_ZN7omnetpp6common23opp_substitutevariablesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERNS0_32opp_substitutevariables_resolverE
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common14opp_breaklinesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi
	.def	_ZN7omnetpp6common14opp_breaklinesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common14opp_breaklinesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi
_ZN7omnetpp6common14opp_breaklinesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi:
.LFB8590:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	16(%rcx), %rax
	movq	%rcx, %rbx
	movl	%r8d, %esi
	movq	%rax, (%rcx)
	movq	(%rdx), %r12
	movq	8(%rdx), %rdi
	movq	%r12, %rcx
	addq	%rdi, %rcx
	je	.L500
	testq	%r12, %r12
	je	.L536
.L500:
	cmpq	$15, %rdi
	movq	%rdi, -88(%rbp)
	ja	.L537
	cmpq	$1, %rdi
	jne	.L503
	movzbl	(%r12), %edx
	movb	%dl, 16(%rbx)
.L504:
	movq	%rdi, 8(%rbx)
	movb	$0, (%rax,%rdi)
	xorl	%r9d, %r9d
	movq	8(%rbx), %rax
	movl	%esi, %r8d
	cmpl	%esi, %eax
	movl	%eax, %r11d
	jle	.L499
	.p2align 4,,10
.L505:
	movq	(%rbx), %r10
	movslq	%r9d, %rdi
	cmpl	%r8d, %r9d
	leaq	(%r10,%rdi), %r13
	movzbl	0(%r13), %r12d
	jge	.L519
	cmpb	$10, %r12b
	je	.L521
	leaq	1(%r10,%rdi), %rdx
	movl	%r9d, %eax
	jmp	.L508
	.p2align 4,,10
.L532:
	movq	%rdx, %rcx
	addq	$1, %rdx
	cmpb	$10, -1(%rdx)
	je	.L507
.L508:
	addl	$1, %eax
	cmpl	%r8d, %eax
	jne	.L532
	movslq	%eax, %rcx
	addq	%r10, %rcx
	movzbl	(%rcx), %edx
.L506:
	cmpb	$32, %dl
	je	.L507
	cmpb	$10, %dl
	je	.L507
	movslq	%eax, %rdx
	leaq	-1(%r10,%rdx), %rdx
.L511:
	subl	$1, %eax
	cmpl	%r9d, %eax
	jl	.L538
	movzbl	(%rdx), %r8d
	movq	%rdx, %rcx
	subq	$1, %rdx
	cmpb	$32, %r8b
	je	.L507
	cmpb	$10, %r8b
	jne	.L511
	.p2align 4,,10
.L507:
	leal	1(%rax), %r9d
	movb	$10, (%rcx)
	leal	(%rsi,%r9), %r8d
	cmpl	%r8d, %r11d
	jg	.L505
.L499:
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
.L503:
	testq	%rdi, %rdi
	je	.L504
	jmp	.L502
	.p2align 4,,10
.L538:
	cmpl	%r9d, %r11d
	jle	.L499
	cmpb	$10, %r12b
	je	.L521
	cmpb	$32, %r12b
	je	.L521
	leaq	1(%r10,%rdi), %rdx
	movl	%r9d, %eax
	jmp	.L516
	.p2align 4,,10
.L535:
	movzbl	(%rdx), %r8d
	movq	%rdx, %rcx
	addq	$1, %rdx
	cmpb	$32, %r8b
	je	.L507
	cmpb	$10, %r8b
	je	.L507
.L516:
	addl	$1, %eax
	cmpl	%eax, %r11d
	jne	.L535
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
.L521:
	movl	%r9d, %eax
	movq	%r13, %rcx
	leal	1(%rax), %r9d
	movb	$10, (%rcx)
	leal	(%rsi,%r9), %r8d
	cmpl	%r8d, %r11d
	jg	.L505
	jmp	.L499
	.p2align 4,,10
.L519:
	movq	%r13, %rcx
	movl	%r12d, %edx
	movl	%r9d, %eax
	jmp	.L506
.L537:
	leaq	-88(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-88(%rbp), %rdx
	movq	%rax, (%rbx)
	movq	%rdx, 16(%rbx)
.L502:
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-88(%rbp), %rdi
	movq	(%rbx), %rax
	jmp	.L504
.L536:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
	nop
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common15opp_indentlinesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
	.def	_ZN7omnetpp6common15opp_indentlinesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common15opp_indentlinesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
_ZN7omnetpp6common15opp_indentlinesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_:
.LFB8591:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$200, %rsp
	.seh_stackalloc	200
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%r8, %r13
	leaq	-64(%rbp), %rsi
	movq	%rdx, %r15
	movl	$10, %edx
	movq	8(%r8), %r8
	movq	%rcx, %rbx
	movw	%dx, -48(%rbp)
	movq	0(%r13), %rdx
	leaq	16(%rsi), %rax
	movq	%rsi, %rcx
	movq	$1, -56(%rbp)
	movq	%rax, -64(%rbp)
.LEHB47:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
.LEHE47:
	leaq	-32(%rbp), %rdi
	leaq	16(%rdi), %rdx
	movq	%rdx, -32(%rbp)
	movq	(%rax), %rcx
	leaq	16(%rax), %rdx
	cmpq	%rdx, %rcx
	je	.L582
	movq	%rcx, -32(%rbp)
	movq	16(%rax), %rcx
	movq	%rcx, -16(%rbp)
.L541:
	movq	8(%rax), %rcx
	movb	$0, 16(%rax)
	leaq	32(%rbp), %r12
	movq	%rdi, %r9
	movq	%rbp, %r8
	movq	%rbp, %r14
	movq	%rcx, -24(%rbp)
	movq	%rdx, (%rax)
	movq	%r12, %rcx
	movq	$0, 8(%rax)
	leaq	16(%rbp), %rax
	movq	%r15, %rdx
	movq	$1, 8(%rbp)
	movq	%rax, 0(%rbp)
	movl	$10, %eax
	movw	%ax, 16(%rbp)
.LEHB48:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE48:
	movq	8(%r13), %rax
	movq	0(%r13), %r9
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%r12, %rcx
	movq	%rax, 32(%rsp)
.LEHB49:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
.LEHE49:
	leaq	16(%rbx), %rdx
	movq	%rdx, (%rbx)
	movq	(%rax), %rcx
	movq	%rdx, -72(%rbp)
	leaq	16(%rax), %rdx
	cmpq	%rdx, %rcx
	je	.L583
	movq	%rcx, (%rbx)
	movq	16(%rax), %rcx
	movq	%rcx, 16(%rbx)
.L543:
	movq	8(%rax), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rdx, (%rax)
	movq	$0, 8(%rax)
	movb	$0, 16(%rax)
	leaq	16(%r12), %rax
	movq	32(%rbp), %rcx
	cmpq	%rax, %rcx
	je	.L544
	call	_ZdlPv
.L544:
	movq	0(%rbp), %rcx
	leaq	16(%r14), %rax
	cmpq	%rax, %rcx
	je	.L545
	call	_ZdlPv
.L545:
	movq	-32(%rbp), %rcx
	addq	$16, %rdi
	cmpq	%rdi, %rcx
	je	.L546
	call	_ZdlPv
.L546:
	movq	-64(%rbp), %rcx
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	je	.L547
	call	_ZdlPv
.L547:
	movq	(%r15), %rdx
	movq	8(%r15), %rax
	cmpb	$10, -1(%rdx,%rax)
	je	.L584
.L539:
	movq	%rbx, %rax
	addq	$200, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L582:
	movq	16(%rax), %r9
	movq	24(%rax), %r10
	movq	%r9, -16(%rbp)
	movq	%r10, -8(%rbp)
	jmp	.L541
	.p2align 4,,10
.L583:
	movq	16(%rax), %r9
	movq	24(%rax), %r10
	movq	%r9, 16(%rbx)
	movq	%r10, 24(%rbx)
	jmp	.L543
	.p2align 4,,10
.L584:
	movq	8(%rbx), %rax
	movq	(%rbx), %rdi
	leaq	16(%r12), %rdx
	movq	%rdx, 32(%rbp)
	movq	%rax, %rsi
	subq	8(%r13), %rsi
	cmpq	%rax, %rsi
	cmova	%rax, %rsi
	movq	%rdi, %rax
	addq	%rsi, %rax
	je	.L549
	testq	%rdi, %rdi
	je	.L585
.L549:
	cmpq	$15, %rsi
	movq	%rsi, 0(%rbp)
	ja	.L586
	cmpq	$1, %rsi
	jne	.L552
	movzbl	(%rdi), %eax
	movb	%al, 48(%rbp)
	leaq	16(%r12), %rax
.L553:
	movq	%rsi, 40(%rbp)
	movb	$0, (%rax,%rsi)
	leaq	16(%r12), %rcx
	movq	32(%rbp), %rdx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L554
	cmpq	%rax, -72(%rbp)
	movq	40(%rbp), %r8
	movq	48(%rbp), %rcx
	je	.L587
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L556
	movq	%rax, 32(%rbp)
	movq	%r9, 48(%rbp)
.L557:
	movq	$0, 40(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	32(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L539
	call	_ZdlPv
	jmp	.L539
	.p2align 4,,10
.L586:
	xorl	%r8d, %r8d
	movq	%r14, %rdx
	movq	%r12, %rcx
.LEHB50:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE50:
	movq	0(%rbp), %rdx
	movq	%rax, 32(%rbp)
	movq	%rdx, 48(%rbp)
.L551:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	0(%rbp), %rsi
	movq	32(%rbp), %rax
	jmp	.L553
	.p2align 4,,10
.L587:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L556:
	leaq	16(%r12), %rax
	movq	%rax, 32(%rbp)
	jmp	.L557
	.p2align 4,,10
.L552:
	testq	%rsi, %rsi
	leaq	16(%r12), %rax
	je	.L553
	jmp	.L551
	.p2align 4,,10
.L554:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	32(%rbp), %rax
	jmp	.L557
.L585:
	leaq	.LC2(%rip), %rcx
.LEHB51:
	call	_ZSt19__throw_logic_errorPKc
.LEHE51:
.L569:
	movq	%rax, %rbx
.L564:
	movq	-64(%rbp), %rcx
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	je	.L565
	call	_ZdlPv
.L565:
	movq	%rbx, %rcx
.LEHB52:
	call	_Unwind_Resume
.L571:
	movq	32(%rbp), %rcx
	addq	$16, %r12
	movq	%rax, %rbx
	cmpq	%r12, %rcx
	je	.L561
	call	_ZdlPv
.L561:
	movq	0(%rbp), %rcx
	addq	$16, %r14
	cmpq	%r14, %rcx
	je	.L562
	call	_ZdlPv
.L562:
	movq	-32(%rbp), %rcx
	addq	$16, %rdi
	cmpq	%rdi, %rcx
	je	.L564
	call	_ZdlPv
	jmp	.L564
.L570:
	movq	%rax, %rbx
	jmp	.L561
.L572:
	movq	(%rbx), %rcx
	cmpq	-72(%rbp), %rcx
	movq	%rax, %rsi
	je	.L567
	call	_ZdlPv
.L567:
	movq	%rsi, %rcx
	call	_Unwind_Resume
	nop
.LEHE52:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8591:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8591-.LLSDACSB8591
.LLSDACSB8591:
	.uleb128 .LEHB47-.LFB8591
	.uleb128 .LEHE47-.LEHB47
	.uleb128 .L569-.LFB8591
	.uleb128 0
	.uleb128 .LEHB48-.LFB8591
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L570-.LFB8591
	.uleb128 0
	.uleb128 .LEHB49-.LFB8591
	.uleb128 .LEHE49-.LEHB49
	.uleb128 .L571-.LFB8591
	.uleb128 0
	.uleb128 .LEHB50-.LFB8591
	.uleb128 .LEHE50-.LEHB50
	.uleb128 .L572-.LFB8591
	.uleb128 0
	.uleb128 .LEHB51-.LFB8591
	.uleb128 .LEHE51-.LEHB51
	.uleb128 .L572-.LFB8591
	.uleb128 0
	.uleb128 .LEHB52-.LFB8591
	.uleb128 .LEHE52-.LEHB52
	.uleb128 0
	.uleb128 0
.LLSDACSE8591:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common20opp_stringbeginswithEPKcS2_
	.def	_ZN7omnetpp6common20opp_stringbeginswithEPKcS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common20opp_stringbeginswithEPKcS2_
_ZN7omnetpp6common20opp_stringbeginswithEPKcS2_:
.LFB8598:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rcx, %rbx
	call	strlen
	movq	%rsi, %rcx
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %r8
	xorl	%eax, %eax
	cmpq	%r8, %rdi
	jb	.L588
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	strncmp
	testl	%eax, %eax
	sete	%al
.L588:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common18opp_stringendswithEPKcS2_
	.def	_ZN7omnetpp6common18opp_stringendswithEPKcS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common18opp_stringendswithEPKcS2_
_ZN7omnetpp6common18opp_stringendswithEPKcS2_:
.LFB8599:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rbx
	call	strlen
	movq	%rax, %rdx
	xorl	%eax, %eax
	cmpl	%edx, %ebx
	jl	.L591
	movslq	%edx, %rdx
	movslq	%ebx, %rbx
	subq	%rdx, %rbx
	movq	%rdi, %rdx
	leaq	(%rsi,%rbx), %rcx
	call	strcmp
	testl	%eax, %eax
	sete	%al
.L591:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common19opp_substringbeforeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
	.def	_ZN7omnetpp6common19opp_substringbeforeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common19opp_substringbeforeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
_ZN7omnetpp6common19opp_substringbeforeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_:
.LFB8600:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	8(%r8), %r9
	movq	%r8, %rax
	movq	%rdx, %rbx
	movq	%rcx, %rsi
	movq	(%rax), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcyy
	leaq	16(%rsi), %rcx
	cmpq	$-1, %rax
	movq	%rcx, (%rsi)
	je	.L611
	cmpq	%rax, 8(%rbx)
	movq	(%rbx), %rdi
	cmovbe	8(%rbx), %rax
	movq	%rax, %rbx
	movq	%rdi, %rax
	addq	%rbx, %rax
	je	.L597
	testq	%rdi, %rdi
	je	.L612
.L597:
	cmpq	$15, %rbx
	movq	%rbx, -88(%rbp)
	ja	.L613
	cmpq	$1, %rbx
	jne	.L600
	movzbl	(%rdi), %eax
	movb	%al, 16(%rsi)
.L601:
	movq	%rsi, %rax
	movq	%rbx, 8(%rsi)
	movb	$0, (%rcx,%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L613:
	leaq	-88(%rbp), %rdx
	movq	%rsi, %rcx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	%rax, %rcx
	movq	%rax, (%rsi)
	movq	-88(%rbp), %rax
	movq	%rax, 16(%rsi)
.L599:
	movq	%rbx, %r8
	movq	%rdi, %rdx
	call	memcpy
	movq	-88(%rbp), %rbx
	movq	(%rsi), %rcx
	jmp	.L601
	.p2align 4,,10
.L611:
	movq	%rsi, %rax
	movq	$0, 8(%rsi)
	movb	$0, 16(%rsi)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L600:
	testq	%rbx, %rbx
	je	.L601
	jmp	.L599
.L612:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
	nop
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common18opp_substringafterERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
	.def	_ZN7omnetpp6common18opp_substringafterERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common18opp_substringafterERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
_ZN7omnetpp6common18opp_substringafterERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_:
.LFB8601:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	8(%r8), %r9
	movq	%r8, %rdi
	movq	%rdx, %rsi
	xorl	%r8d, %r8d
	movq	(%rdi), %rdx
	movq	%rcx, %rbx
	movq	%rsi, %rcx
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcyy
	cmpq	$-1, %rax
	je	.L633
	addq	8(%rdi), %rax
	movq	8(%rsi), %r9
	cmpq	%r9, %rax
	movq	%rax, %r8
	ja	.L634
	leaq	16(%rbx), %rax
	movq	%rax, (%rbx)
	movq	8(%rsi), %r9
	movq	(%rsi), %rdx
	cmpq	%r9, %r8
	ja	.L635
	movq	%r9, %rsi
	leaq	(%rdx,%r8), %rdi
	subq	%r8, %rsi
	addq	%r9, %rdx
	je	.L619
	testq	%rdi, %rdi
	je	.L636
.L619:
	cmpq	$15, %rsi
	movq	%rsi, -88(%rbp)
	ja	.L637
	cmpq	$1, %rsi
	jne	.L622
	movzbl	(%rdi), %edx
	movb	%dl, 16(%rbx)
.L623:
	movq	%rsi, 8(%rbx)
	movb	$0, (%rax,%rsi)
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L637:
	leaq	-88(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-88(%rbp), %rdx
	movq	%rax, (%rbx)
	movq	%rdx, 16(%rbx)
.L621:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-88(%rbp), %rsi
	movq	(%rbx), %rax
	jmp	.L623
	.p2align 4,,10
.L633:
	leaq	16(%rbx), %rax
	movq	$0, 8(%rbx)
	movb	$0, 16(%rbx)
	movq	%rax, (%rbx)
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L622:
	testq	%rsi, %rsi
	je	.L623
	jmp	.L621
.L636:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.L635:
	leaq	.LC7(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L634:
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	call	_ZSt24__throw_out_of_range_fmtPKcz
	nop
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common23opp_substringbeforelastERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
	.def	_ZN7omnetpp6common23opp_substringbeforelastERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common23opp_substringbeforelastERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
_ZN7omnetpp6common23opp_substringbeforelastERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_:
.LFB8602:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	8(%r8), %r9
	movq	%r8, %rax
	movq	%rdx, %rbx
	movq	%rcx, %rsi
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	movq	$-1, %r8
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEPKcyy
	leaq	16(%rsi), %rcx
	cmpq	$-1, %rax
	movq	%rcx, (%rsi)
	je	.L655
	cmpq	%rax, 8(%rbx)
	movq	(%rbx), %rdi
	cmovbe	8(%rbx), %rax
	movq	%rax, %rbx
	movq	%rdi, %rax
	addq	%rbx, %rax
	je	.L641
	testq	%rdi, %rdi
	je	.L656
.L641:
	cmpq	$15, %rbx
	movq	%rbx, -88(%rbp)
	ja	.L657
	cmpq	$1, %rbx
	jne	.L644
	movzbl	(%rdi), %eax
	movb	%al, 16(%rsi)
.L645:
	movq	%rsi, %rax
	movq	%rbx, 8(%rsi)
	movb	$0, (%rcx,%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L657:
	leaq	-88(%rbp), %rdx
	movq	%rsi, %rcx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	%rax, %rcx
	movq	%rax, (%rsi)
	movq	-88(%rbp), %rax
	movq	%rax, 16(%rsi)
.L643:
	movq	%rbx, %r8
	movq	%rdi, %rdx
	call	memcpy
	movq	-88(%rbp), %rbx
	movq	(%rsi), %rcx
	jmp	.L645
	.p2align 4,,10
.L655:
	movq	%rsi, %rax
	movq	$0, 8(%rsi)
	movb	$0, 16(%rsi)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L644:
	testq	%rbx, %rbx
	je	.L645
	jmp	.L643
.L656:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
	nop
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common22opp_substringafterlastERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
	.def	_ZN7omnetpp6common22opp_substringafterlastERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common22opp_substringafterlastERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
_ZN7omnetpp6common22opp_substringafterlastERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_:
.LFB8603:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	8(%r8), %r9
	movq	%r8, %rdi
	movq	%rdx, %rsi
	movq	%rcx, %rbx
	movq	(%rdi), %rdx
	movq	$-1, %r8
	movq	%rsi, %rcx
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEPKcyy
	cmpq	$-1, %rax
	je	.L677
	addq	8(%rdi), %rax
	movq	8(%rsi), %r9
	cmpq	%r9, %rax
	movq	%rax, %r8
	ja	.L678
	leaq	16(%rbx), %rax
	movq	%rax, (%rbx)
	movq	8(%rsi), %r9
	movq	(%rsi), %rdx
	cmpq	%r9, %r8
	ja	.L679
	movq	%r9, %rsi
	leaq	(%rdx,%r8), %rdi
	subq	%r8, %rsi
	addq	%r9, %rdx
	je	.L663
	testq	%rdi, %rdi
	je	.L680
.L663:
	cmpq	$15, %rsi
	movq	%rsi, -88(%rbp)
	ja	.L681
	cmpq	$1, %rsi
	jne	.L666
	movzbl	(%rdi), %edx
	movb	%dl, 16(%rbx)
.L667:
	movq	%rsi, 8(%rbx)
	movb	$0, (%rax,%rsi)
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L681:
	leaq	-88(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-88(%rbp), %rdx
	movq	%rax, (%rbx)
	movq	%rdx, 16(%rbx)
.L665:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-88(%rbp), %rsi
	movq	(%rbx), %rax
	jmp	.L667
	.p2align 4,,10
.L677:
	leaq	16(%rbx), %rax
	movq	$0, 8(%rbx)
	movb	$0, 16(%rbx)
	movq	%rax, (%rbx)
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L666:
	testq	%rsi, %rsi
	je	.L667
	jmp	.L665
.L680:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.L679:
	leaq	.LC7(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L678:
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	call	_ZSt24__throw_out_of_range_fmtPKcz
	nop
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common10opp_concatEPKcS2_S2_S2_
	.def	_ZN7omnetpp6common10opp_concatEPKcS2_S2_S2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common10opp_concatEPKcS2_S2_S2_
_ZN7omnetpp6common10opp_concatEPKcS2_S2_S2_:
.LFB8604:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	leaq	_ZZN7omnetpp6common10opp_concatEPKcS2_S2_S2_E3buf(%rip), %rax
	testq	%rcx, %rcx
	je	.L683
	movzbl	(%rcx), %r10d
	testb	%r10b, %r10b
	je	.L683
	leaq	255(%rax), %r11
	jmp	.L684
	.p2align 4,,10
.L685:
	cmpq	%r11, %rax
	je	.L683
.L684:
	addq	$1, %rcx
	addq	$1, %rax
	movb	%r10b, -1(%rax)
	movzbl	(%rcx), %r10d
	testb	%r10b, %r10b
	jne	.L685
.L683:
	testq	%rdx, %rdx
	je	.L686
	movzbl	(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L686
	leaq	255+_ZZN7omnetpp6common10opp_concatEPKcS2_S2_S2_E3buf(%rip), %rcx
	jmp	.L723
	.p2align 4,,10
.L687:
	addq	$1, %rdx
	addq	$1, %rax
	movb	%r10b, -1(%rax)
	movzbl	(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L686
.L723:
	cmpq	%rcx, %rax
	jne	.L687
	leaq	255+_ZZN7omnetpp6common10opp_concatEPKcS2_S2_S2_E3buf(%rip), %rax
.L686:
	testq	%r8, %r8
	je	.L690
	movzbl	(%r8), %edx
	testb	%dl, %dl
	je	.L690
	leaq	255+_ZZN7omnetpp6common10opp_concatEPKcS2_S2_S2_E3buf(%rip), %rcx
	jmp	.L724
	.p2align 4,,10
.L691:
	addq	$1, %r8
	addq	$1, %rax
	movb	%dl, -1(%rax)
	movzbl	(%r8), %edx
	testb	%dl, %dl
	je	.L690
.L724:
	cmpq	%rcx, %rax
	jne	.L691
	leaq	255+_ZZN7omnetpp6common10opp_concatEPKcS2_S2_S2_E3buf(%rip), %rax
.L690:
	testq	%r9, %r9
	je	.L694
	movzbl	(%r9), %edx
	testb	%dl, %dl
	je	.L694
	leaq	255+_ZZN7omnetpp6common10opp_concatEPKcS2_S2_S2_E3buf(%rip), %rcx
	jmp	.L725
	.p2align 4,,10
.L695:
	addq	$1, %r9
	addq	$1, %rax
	movb	%dl, -1(%rax)
	movzbl	(%r9), %edx
	testb	%dl, %dl
	je	.L694
.L725:
	cmpq	%rcx, %rax
	jne	.L695
	leaq	255+_ZZN7omnetpp6common10opp_concatEPKcS2_S2_S2_E3buf(%rip), %rax
.L694:
	movb	$0, (%rax)
	leaq	_ZZN7omnetpp6common10opp_concatEPKcS2_S2_S2_E3buf(%rip), %rax
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common10opp_struprEPc
	.def	_ZN7omnetpp6common10opp_struprEPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common10opp_struprEPc
_ZN7omnetpp6common10opp_struprEPc:
.LFB8605:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, %rdi
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L727
	movq	__imp_toupper(%rip), %rsi
	movq	%rdi, %rbx
	.p2align 4,,10
.L728:
	call	*%rsi
	addq	$1, %rbx
	movb	%al, -1(%rbx)
	movzbl	(%rbx), %ecx
	testb	%cl, %cl
	jne	.L728
.L727:
	movq	%rdi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common10opp_strlwrEPc
	.def	_ZN7omnetpp6common10opp_strlwrEPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common10opp_strlwrEPc
_ZN7omnetpp6common10opp_strlwrEPc:
.LFB8606:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, %rdi
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L734
	movq	__imp_tolower(%rip), %rsi
	movq	%rdi, %rbx
	.p2align 4,,10
.L735:
	call	*%rsi
	addq	$1, %rbx
	movb	%al, -1(%rbx)
	movzbl	(%rbx), %ecx
	testb	%cl, %cl
	jne	.L735
.L734:
	movq	%rdi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common12opp_strlowerB5cxx11EPKc
	.def	_ZN7omnetpp6common12opp_strlowerB5cxx11EPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12opp_strlowerB5cxx11EPKc
_ZN7omnetpp6common12opp_strlowerB5cxx11EPKc:
.LFB8607:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	testq	%rdx, %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	je	.L756
	leaq	16(%rcx), %rbx
	movq	%rbx, (%rcx)
	movq	%rdx, %rcx
	call	strlen
	cmpq	$15, %rax
	movq	%rax, %r12
	movq	%rax, -8(%rbp)
	ja	.L757
	cmpq	$1, %rax
	jne	.L744
	movzbl	(%rdi), %edx
	movb	%dl, 16(%rsi)
.L745:
	movq	%rax, 8(%rsi)
	movb	$0, (%rbx,%rax)
	movq	(%rsi), %rbx
	movq	8(%rsi), %rdi
	addq	%rbx, %rdi
	cmpq	%rbx, %rdi
	je	.L740
	movq	__imp_tolower(%rip), %r12
	.p2align 4,,10
.L747:
	movzbl	(%rbx), %ecx
	addq	$1, %rbx
	call	*%r12
	movb	%al, -1(%rbx)
	cmpq	%rdi, %rbx
	jne	.L747
.L740:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
.L757:
	leaq	-8(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	%rax, %rbx
	movq	%rax, (%rsi)
	movq	-8(%rbp), %rax
	movq	%rax, 16(%rsi)
.L743:
	movq	%rbx, %rcx
	movq	%r12, %r8
	movq	%rdi, %rdx
	call	memcpy
	movq	-8(%rbp), %rax
	movq	(%rsi), %rbx
	jmp	.L745
	.p2align 4,,10
.L756:
	leaq	16(%rcx), %rbx
	xorl	%eax, %eax
	movq	%rbx, (%rcx)
	jmp	.L745
.L744:
	testq	%r12, %r12
	je	.L745
	jmp	.L743
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common12opp_strupperB5cxx11EPKc
	.def	_ZN7omnetpp6common12opp_strupperB5cxx11EPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12opp_strupperB5cxx11EPKc
_ZN7omnetpp6common12opp_strupperB5cxx11EPKc:
.LFB8608:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	testq	%rdx, %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	je	.L774
	leaq	16(%rcx), %rbx
	movq	%rbx, (%rcx)
	movq	%rdx, %rcx
	call	strlen
	cmpq	$15, %rax
	movq	%rax, %r12
	movq	%rax, -8(%rbp)
	ja	.L775
	cmpq	$1, %rax
	jne	.L762
	movzbl	(%rdi), %edx
	movb	%dl, 16(%rsi)
.L763:
	movq	%rax, 8(%rsi)
	movb	$0, (%rbx,%rax)
	movq	(%rsi), %rbx
	movq	8(%rsi), %rdi
	addq	%rbx, %rdi
	cmpq	%rbx, %rdi
	je	.L758
	movq	__imp_toupper(%rip), %r12
	.p2align 4,,10
.L765:
	movzbl	(%rbx), %ecx
	addq	$1, %rbx
	call	*%r12
	movb	%al, -1(%rbx)
	cmpq	%rdi, %rbx
	jne	.L765
.L758:
	movq	%rsi, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
.L775:
	leaq	-8(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	%rax, %rbx
	movq	%rax, (%rsi)
	movq	-8(%rbp), %rax
	movq	%rax, 16(%rsi)
.L761:
	movq	%rbx, %rcx
	movq	%r12, %r8
	movq	%rdi, %rdx
	call	memcpy
	movq	-8(%rbp), %rax
	movq	(%rsi), %rbx
	jmp	.L763
	.p2align 4,,10
.L774:
	leaq	16(%rcx), %rbx
	xorl	%eax, %eax
	movq	%rbx, (%rcx)
	jmp	.L763
.L762:
	testq	%r12, %r12
	je	.L763
	jmp	.L761
	.seh_endproc
	.section .rdata,"dr"
.LC24:
	.ascii "basic_string::append\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common8opp_joinB5cxx11EPKcS2_S2_
	.def	_ZN7omnetpp6common8opp_joinB5cxx11EPKcS2_S2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common8opp_joinB5cxx11EPKcS2_S2_
_ZN7omnetpp6common8opp_joinB5cxx11EPKcS2_S2_:
.LFB8609:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$120, %rsp
	.seh_stackalloc	120
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	testq	%r8, %r8
	movq	%rcx, %rbx
	movq	%rdx, %r13
	movq	%r8, %rdi
	movq	%r9, %rsi
	je	.L777
	movzbl	(%r8), %r12d
	testb	%r12b, %r12b
	je	.L777
	testq	%r9, %r9
	je	.L778
	cmpb	$0, (%r9)
	jne	.L831
.L778:
	leaq	16(%rbx), %r12
	movq	%rdi, %rcx
	movq	%r12, (%rbx)
	call	strlen
	cmpq	$15, %rax
	movq	%rax, %rsi
	movq	%rax, -48(%rbp)
	ja	.L832
	cmpq	$1, %rax
	jne	.L794
	movzbl	(%rdi), %edx
	movb	%dl, 16(%rbx)
.L795:
	movq	%rax, 8(%rbx)
	movb	$0, (%r12,%rax)
	jmp	.L776
	.p2align 4,,10
.L777:
	testq	%rsi, %rsi
	je	.L833
	leaq	16(%rbx), %rdi
	movq	%rsi, %rcx
	movq	%rdi, (%rbx)
	call	strlen
	cmpq	$15, %rax
	movq	%rax, %r12
	movq	%rax, -48(%rbp)
	ja	.L834
	cmpq	$1, %rax
	jne	.L783
	movzbl	(%rsi), %edx
	movb	%dl, 16(%rbx)
.L784:
	movq	%rax, 8(%rbx)
	movb	$0, (%rdi,%rax)
.L776:
	movq	%rbx, %rax
	addq	$120, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L833:
	leaq	16(%rbx), %rdi
	xorl	%eax, %eax
	movq	%rdi, (%rbx)
	jmp	.L784
	.p2align 4,,10
.L834:
	leaq	-48(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
.LEHB53:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE53:
	movq	%rax, %rdi
	movq	%rax, (%rbx)
	movq	-48(%rbp), %rax
	movq	%rax, 16(%rbx)
.L782:
	movq	%rdi, %rcx
	movq	%r12, %r8
	movq	%rsi, %rdx
	call	memcpy
	movq	-48(%rbp), %rax
	movq	(%rbx), %rdi
	jmp	.L784
	.p2align 4,,10
.L831:
	leaq	-80(%rbp), %r14
	movq	%r8, %rcx
	leaq	16(%r14), %r15
	movq	%r15, -80(%rbp)
	call	strlen
	cmpq	$15, %rax
	movq	%rax, %r9
	movq	%rax, -48(%rbp)
	ja	.L835
	cmpq	$1, %rax
	jne	.L788
	movb	%r12b, -64(%rbp)
.L789:
	movq	%rax, -72(%rbp)
	movq	%r13, %rcx
	movb	$0, (%r15,%rax)
	call	strlen
	movabsq	$9223372036854775807, %rdx
	subq	-72(%rbp), %rdx
	movq	%rax, %r8
	cmpq	%rdx, %rax
	ja	.L836
	movq	%r13, %rdx
	movq	%r14, %rcx
.LEHB54:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
.LEHE54:
	leaq	-48(%rbp), %rdi
	leaq	16(%rdi), %rdx
	movq	%rdx, -48(%rbp)
	movq	(%rax), %rcx
	leaq	16(%rax), %rdx
	cmpq	%rdx, %rcx
	je	.L837
	movq	%rcx, -48(%rbp)
	movq	16(%rax), %rcx
	movq	%rcx, -32(%rbp)
.L797:
	movq	8(%rax), %rcx
	movq	%rcx, -40(%rbp)
	movq	%rdx, (%rax)
	movq	%rsi, %rcx
	movq	$0, 8(%rax)
	movb	$0, 16(%rax)
	call	strlen
	movabsq	$9223372036854775807, %rdx
	subq	-40(%rbp), %rdx
	movq	%rax, %r8
	cmpq	%rdx, %rax
	ja	.L838
	movq	%rsi, %rdx
	movq	%rdi, %rcx
.LEHB55:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
.LEHE55:
	leaq	16(%rbx), %rdx
	movq	%rdx, (%rbx)
	movq	(%rax), %rcx
	leaq	16(%rax), %rdx
	cmpq	%rdx, %rcx
	je	.L839
	movq	%rcx, (%rbx)
	movq	16(%rax), %rcx
	movq	%rcx, 16(%rbx)
.L800:
	movq	8(%rax), %rcx
	addq	$16, %rdi
	movq	%rcx, 8(%rbx)
	movq	%rdx, (%rax)
	movq	$0, 8(%rax)
	movb	$0, 16(%rax)
	movq	-48(%rbp), %rcx
	cmpq	%rdi, %rcx
	je	.L801
	call	_ZdlPv
.L801:
	movq	-80(%rbp), %rcx
	addq	$16, %r14
	cmpq	%r14, %rcx
	je	.L776
	call	_ZdlPv
	jmp	.L776
	.p2align 4,,10
.L832:
	leaq	-48(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
.LEHB56:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	%rax, %r12
	movq	%rax, (%rbx)
	movq	-48(%rbp), %rax
	movq	%rax, 16(%rbx)
.L793:
	movq	%r12, %rcx
	movq	%rsi, %r8
	movq	%rdi, %rdx
	call	memcpy
	movq	-48(%rbp), %rax
	movq	(%rbx), %r12
	jmp	.L795
	.p2align 4,,10
.L794:
	testq	%rax, %rax
	je	.L795
	jmp	.L793
	.p2align 4,,10
.L835:
	leaq	-48(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r14, %rcx
	movq	%rax, -88(%rbp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE56:
	movq	-48(%rbp), %rdx
	movq	-88(%rbp), %r9
	movq	%rax, -80(%rbp)
	movq	%rdx, -64(%rbp)
.L787:
	movq	%r9, %r8
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-48(%rbp), %rax
	movq	-80(%rbp), %r15
	jmp	.L789
	.p2align 4,,10
.L837:
	movq	16(%rax), %r9
	movq	24(%rax), %r10
	movq	%r9, -32(%rbp)
	movq	%r10, -24(%rbp)
	jmp	.L797
	.p2align 4,,10
.L839:
	movq	16(%rax), %r9
	movq	24(%rax), %r10
	movq	%r9, 16(%rbx)
	movq	%r10, 24(%rbx)
	jmp	.L800
	.p2align 4,,10
.L788:
	testq	%rax, %rax
	je	.L789
	movq	%r15, %rax
	jmp	.L787
.L783:
	testq	%r12, %r12
	je	.L784
	jmp	.L782
.L838:
	leaq	.LC24(%rip), %rcx
.LEHB57:
	call	_ZSt20__throw_length_errorPKc
.LEHE57:
.L811:
	movq	-48(%rbp), %rcx
	addq	$16, %rdi
	movq	%rax, %rbx
	cmpq	%rdi, %rcx
	je	.L805
	call	_ZdlPv
.L805:
	movq	-80(%rbp), %rcx
	addq	$16, %r14
	cmpq	%r14, %rcx
	je	.L806
	call	_ZdlPv
.L806:
	movq	%rbx, %rcx
.LEHB58:
	call	_Unwind_Resume
.LEHE58:
.L810:
	movq	%rax, %rbx
	jmp	.L805
.L836:
	leaq	.LC24(%rip), %rcx
.LEHB59:
	call	_ZSt20__throw_length_errorPKc
	nop
.LEHE59:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8609:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8609-.LLSDACSB8609
.LLSDACSB8609:
	.uleb128 .LEHB53-.LFB8609
	.uleb128 .LEHE53-.LEHB53
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB54-.LFB8609
	.uleb128 .LEHE54-.LEHB54
	.uleb128 .L810-.LFB8609
	.uleb128 0
	.uleb128 .LEHB55-.LFB8609
	.uleb128 .LEHE55-.LEHB55
	.uleb128 .L811-.LFB8609
	.uleb128 0
	.uleb128 .LEHB56-.LFB8609
	.uleb128 .LEHE56-.LEHB56
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB57-.LFB8609
	.uleb128 .LEHE57-.LEHB57
	.uleb128 .L811-.LFB8609
	.uleb128 0
	.uleb128 .LEHB58-.LFB8609
	.uleb128 .LEHE58-.LEHB58
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB59-.LFB8609
	.uleb128 .LEHE59-.LEHB59
	.uleb128 .L810-.LFB8609
	.uleb128 0
.LLSDACSE8609:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common10strdictcmpEPKcS2_
	.def	_ZN7omnetpp6common10strdictcmpEPKcS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common10strdictcmpEPKcS2_
_ZN7omnetpp6common10strdictcmpEPKcS2_:
.LFB8612:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	movaps	%xmm6, -64(%rbp)
	.seh_savexmm	%xmm6, 64
	.seh_endprologue
	xorl	%r13d, %r13d
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movq	__imp_tolower(%rip), %r12
.L841:
	movzbl	(%rdi), %eax
	movzbl	(%rsi), %ebx
	testb	%al, %al
	je	.L842
.L877:
	testb	%bl, %bl
	je	.L858
	movzbl	%al, %r15d
	leal	-48(%r15), %edx
	cmpl	$9, %edx
	ja	.L844
	movzbl	%bl, %edx
	subl	$48, %edx
	cmpl	$9, %edx
	jbe	.L845
.L844:
	cmpb	%bl, %al
	je	.L857
	movl	%r15d, %ecx
	call	*%r12
	movl	%eax, %r14d
	movb	%al, -81(%rbp)
	movl	%ebx, %ecx
	call	*%r12
	cmpb	%r14b, %al
	jne	.L876
	testl	%r13d, %r13d
	jne	.L857
	movl	%r15d, %ecx
	call	*__imp_isalpha(%rip)
	testl	%eax, %eax
	movl	%eax, %r13d
	je	.L857
	movl	%ebx, %ecx
	call	*__imp_isalpha(%rip)
	testl	%eax, %eax
	movl	%eax, %r13d
	je	.L857
	movl	%ebx, %ecx
	call	*__imp_isupper(%rip)
	cmpl	$1, %eax
	sbbl	%r13d, %r13d
	andl	$2, %r13d
	subl	$1, %r13d
	.p2align 4,,10
.L857:
	addq	$1, %rdi
	movzbl	(%rdi), %eax
	addq	$1, %rsi
	movzbl	(%rsi), %ebx
	testb	%al, %al
	jne	.L877
.L842:
	testb	%bl, %bl
	movl	$-1, %eax
	cmovne	%eax, %r13d
.L840:
	movaps	-64(%rbp), %xmm6
	movl	%r13d, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L845:
	leaq	-80(%rbp), %rdx
	movq	%rdi, %rcx
	call	__mingw_strtod
	leaq	-72(%rbp), %rdx
	movapd	%xmm0, %xmm6
	movq	%rsi, %rcx
	call	__mingw_strtod
	ucomisd	%xmm6, %xmm0
	jp	.L858
	jne	.L878
	testl	%r13d, %r13d
	movq	-80(%rbp), %r8
	movq	-72(%rbp), %rax
	jne	.L852
	subq	%rdi, %r8
	subq	%rsi, %rax
	cmpq	%rax, %r8
	jge	.L853
.L875:
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	*__imp__strnicmp(%rip)
	movl	%eax, %r13d
	movq	-80(%rbp), %r8
	movq	-72(%rbp), %rax
	testl	%r13d, %r13d
	jne	.L852
	movq	%r8, %rcx
	movq	%rax, %rdx
	subq	%rdi, %rcx
	subq	%rsi, %rdx
	cmpq	%rdx, %rcx
	je	.L852
	setge	%r13b
	movzbl	%r13b, %r13d
	leal	-1(%r13,%r13), %r13d
	.p2align 4,,10
.L852:
	movq	%rax, %rsi
	movq	%r8, %rdi
	jmp	.L841
	.p2align 4,,10
.L853:
	movq	%rax, %r8
	jmp	.L875
.L878:
	movl	$-1, %r13d
	ja	.L840
	.p2align 4,,10
.L858:
	movl	$1, %r13d
	jmp	.L840
	.p2align 4,,10
.L876:
	xorl	%r13d, %r13d
	cmpb	%r14b, %al
	setle	%r13b
	leal	-1(%r13,%r13), %r13d
	jmp	.L840
	.seh_endproc
	.section .rdata,"dr"
.LC25:
	.ascii "%d\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common8opp_itoaEPci
	.def	_ZN7omnetpp6common8opp_itoaEPci;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common8opp_itoaEPci
_ZN7omnetpp6common8opp_itoaEPci:
.LFB8613:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%edx, %r8d
	leaq	.LC25(%rip), %rdx
	movq	%rcx, %rbx
	call	_Z7sprintfPcPKcz
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC26:
	.ascii "%ld\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common8opp_ltoaEPcl
	.def	_ZN7omnetpp6common8opp_ltoaEPcl;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common8opp_ltoaEPcl
_ZN7omnetpp6common8opp_ltoaEPcl:
.LFB8614:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%edx, %r8d
	leaq	.LC26(%rip), %rdx
	movq	%rcx, %rbx
	call	_Z7sprintfPcPKcz
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC27:
	.ascii "%lld\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common10opp_i64toaEPcx
	.def	_ZN7omnetpp6common10opp_i64toaEPcx;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common10opp_i64toaEPcx
_ZN7omnetpp6common10opp_i64toaEPcx:
.LFB8615:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rdx, %r8
	leaq	.LC27(%rip), %rdx
	movq	%rcx, %rbx
	call	_Z7sprintfPcPKcz
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC28:
	.ascii "-inf\0"
.LC29:
	.ascii "inf\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common8opp_dtoaEPcPKcd
	.def	_ZN7omnetpp6common8opp_dtoaEPcPKcd;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common8opp_dtoaEPcPKcd
_ZN7omnetpp6common8opp_dtoaEPcPKcd:
.LFB8616:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movsd	.LC31(%rip), %xmm1
	movapd	%xmm2, %xmm0
	andpd	.LC30(%rip), %xmm2
	movq	%rcx, %rbx
	ucomisd	%xmm2, %xmm1
	jnb	.L888
	ucomisd	%xmm1, %xmm2
	jbe	.L885
	pxor	%xmm1, %xmm1
	leaq	.LC29(%rip), %rax
	leaq	.LC28(%rip), %rdx
	ucomisd	%xmm0, %xmm1
	cmovbe	%rax, %rdx
	call	strcpy
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
.L885:
	movq	%rbx, %rax
	movl	$7233902, (%rcx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
.L888:
	movapd	%xmm0, %xmm2
	movq	%xmm0, %r8
	call	_Z7sprintfPcPKcz
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC33:
	.ascii "opp_ttoa(): scaleexp=%d out of accepted range [-18,18]\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common8opp_ttoaEPcxiRS1_
	.def	_ZN7omnetpp6common8opp_ttoaEPcxiRS1_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common8opp_ttoaEPcxiRS1_
_ZN7omnetpp6common8opp_ttoaEPcxiRS1_:
.LFB8617:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leal	18(%r8), %eax
	movq	%rdx, %rbx
	cmpl	$36, %eax
	ja	.L926
	leaq	63(%rcx), %rax
	testq	%rdx, %rdx
	movq	%rax, (%r9)
	movb	$0, 63(%rcx)
	movq	(%r9), %rcx
	je	.L927
	movq	%rdx, %rax
	sarq	$63, %rax
	movq	%rax, %rsi
	xorq	%rdx, %rsi
	subq	%rsi, %rax
	testl	%r8d, %r8d
	movq	%rax, %rsi
	jle	.L894
	leal	-1(%r8), %eax
	movl	%r8d, %r9d
	movabsq	$3472328296227680304, %rdx
	negl	%r9d
	cltq
	movslq	%r9d, %r9
	addq	$1, %rax
	addq	%rcx, %r9
	cmpl	$8, %eax
	jnb	.L895
	testb	$4, %al
	jne	.L928
	testl	%eax, %eax
	jne	.L929
.L896:
	negl	%r8d
	movslq	%r8d, %r8
	addq	%r8, %rcx
	xorl	%r8d, %r8d
.L894:
	movq	%rcx, %r9
	movl	$1, %r11d
	movabsq	$7378697629483820647, %r10
	jmp	.L905
	.p2align 4,,10
.L931:
	testl	%eax, %eax
	jne	.L901
	testl	%r8d, %r8d
	jns	.L901
	testq	%rdx, %rdx
	movq	%rdx, %rsi
	movl	%edi, %r8d
	je	.L930
.L905:
	movq	%rsi, %rax
	leal	1(%r8), %edi
	imulq	%r10
	movq	%rsi, %rax
	sarq	$63, %rax
	sarq	$2, %rdx
	subq	%rax, %rdx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%esi, %eax
	testb	%r11b, %r11b
	jne	.L931
.L901:
	testl	%r8d, %r8d
	leaq	-1(%r9), %r11
	jne	.L904
	cmpq	%rcx, %r9
	je	.L904
	leaq	-2(%r9), %r8
	movb	$46, -1(%r9)
	movq	%r11, %r9
	movq	%r8, %r11
.L904:
	addl	$48, %eax
	movq	%rdx, %rsi
	movl	%edi, %r8d
	movb	%al, -1(%r9)
	movq	%r11, %r9
	xorl	%r11d, %r11d
	testq	%rdx, %rdx
	jne	.L905
.L930:
	cmpl	$0, %edi
	jle	.L932
	testq	%rbx, %rbx
	js	.L933
.L889:
	movq	%r9, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L933:
	movb	$45, -1(%r9)
	subq	$1, %r9
	movq	%r9, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L927:
	leaq	-1(%rcx), %r9
	movb	$48, -1(%rcx)
	movq	%r9, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L895:
	movl	%eax, %r10d
	movq	%rdx, (%r9)
	movq	%rdx, -8(%r9,%r10)
	leaq	8(%r9), %r10
	andq	$-8, %r10
	subq	%r10, %r9
	addl	%r9d, %eax
	andl	$-8, %eax
	cmpl	$8, %eax
	jb	.L896
	andl	$-8, %eax
	xorl	%r9d, %r9d
.L899:
	movl	%r9d, %r11d
	addl	$8, %r9d
	cmpl	%eax, %r9d
	movq	%rdx, (%r10,%r11)
	jb	.L899
	jmp	.L896
	.p2align 4,,10
.L932:
	je	.L910
	notl	%edi
	movl	$48, %edx
	movq	%rdi, %rcx
	leaq	1(%rdi), %r8
	notq	%rcx
	addq	%rcx, %r9
	movq	%r9, %rcx
	call	memset
	movq	%rax, %rcx
.L907:
	testq	%rbx, %rbx
	movb	$46, -1(%rcx)
	leaq	-2(%rcx), %r9
	movb	$48, -2(%rcx)
	jns	.L889
	jmp	.L933
	.p2align 4,,10
.L929:
	testb	$2, %al
	movb	$48, (%r9)
	je	.L896
	movl	%eax, %edx
	movl	$12336, %eax
	movw	%ax, -2(%r9,%rdx)
	jmp	.L896
.L910:
	movq	%r9, %rcx
	jmp	.L907
.L928:
	movl	%eax, %edx
	movl	$808464432, (%r9)
	movl	$808464432, -4(%r9,%rdx)
	jmp	.L896
.L926:
	movl	$48, %ecx
	movl	%r8d, -84(%rbp)
	call	__cxa_allocate_exception
	movl	-84(%rbp), %r8d
	leaq	.LC33(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB60:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE60:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB61:
	call	__cxa_throw
.L911:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
	call	_Unwind_Resume
	nop
.LEHE61:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8617:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8617-.LLSDACSB8617
.LLSDACSB8617:
	.uleb128 .LEHB60-.LFB8617
	.uleb128 .LEHE60-.LEHB60
	.uleb128 .L911-.LFB8617
	.uleb128 0
	.uleb128 .LEHB61-.LFB8617
	.uleb128 .LEHE61-.LEHB61
	.uleb128 0
	.uleb128 0
.LLSDACSE8617:
	.text
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC34:
	.ascii "Cannot represent \"%s\" in the target integer type\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common10opp_strtolEPKcPPc
	.def	_ZN7omnetpp6common10opp_strtolEPKcPPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common10opp_strtolEPKcPPc
_ZN7omnetpp6common10opp_strtolEPKcPPc:
.LFB8621:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	__imp_isspace(%rip), %rsi
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	jmp	.L936
	.p2align 4,,10
.L947:
	addq	$1, %rbx
.L936:
	movzbl	(%rbx), %ecx
	call	*%rsi
	testl	%eax, %eax
	jne	.L947
	movq	__imp__errno(%rip), %rsi
.LEHB62:
	call	*%rsi
	movl	$0, (%rax)
	movzbl	(%rbx), %eax
	cmpb	$48, %al
	je	.L948
	subl	$43, %eax
	movl	$10, %r8d
	testb	$-3, %al
	jne	.L938
	cmpb	$48, 1(%rbx)
	je	.L949
.L938:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	strtol
	movl	%eax, %edi
	leal	2147483647(%rax), %eax
	cmpl	$-3, %eax
	ja	.L950
.L934:
	movl	%edi, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L950:
	call	*%rsi
.LEHE62:
	cmpl	$34, (%rax)
	jne	.L934
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC34(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	movq	%rax, %rsi
.LEHB63:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE63:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rsi, %rcx
.LEHB64:
	call	__cxa_throw
	.p2align 4,,10
.L948:
	movzbl	1(%rbx), %ecx
	call	*__imp_toupper(%rip)
	movl	$10, %r8d
	cmpb	$88, %al
	movl	$16, %eax
	cmove	%eax, %r8d
	jmp	.L938
	.p2align 4,,10
.L949:
	movzbl	2(%rbx), %ecx
	movl	%r8d, -84(%rbp)
	call	*__imp_toupper(%rip)
	movl	$10, %r8d
	cmpb	$88, %al
	movl	$16, %eax
	cmove	%eax, %r8d
	jmp	.L938
.L946:
	movq	%rax, %rbx
	movq	%rsi, %rcx
	call	__cxa_free_exception
	movq	%rbx, %rcx
	call	_Unwind_Resume
	nop
.LEHE64:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8621:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8621-.LLSDACSB8621
.LLSDACSB8621:
	.uleb128 .LEHB62-.LFB8621
	.uleb128 .LEHE62-.LEHB62
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB63-.LFB8621
	.uleb128 .LEHE63-.LEHB63
	.uleb128 .L946-.LFB8621
	.uleb128 0
	.uleb128 .LEHB64-.LFB8621
	.uleb128 .LEHE64-.LEHB64
	.uleb128 0
	.uleb128 0
.LLSDACSE8621:
	.text
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC35:
	.ascii "Cannot parse \"%s\" as an unsigned integer\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common8opp_atolEPKc
	.def	_ZN7omnetpp6common8opp_atolEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common8opp_atolEPKc
_ZN7omnetpp6common8opp_atolEPKc:
.LFB8622:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	-88(%rbp), %rdx
	movq	%rcx, %r12
.LEHB65:
	call	_ZN7omnetpp6common10opp_strtolEPKcPPc
.LEHE65:
	movq	-88(%rbp), %rbx
	movl	%eax, %r13d
	movq	__imp_isspace(%rip), %rdi
	jmp	.L953
	.p2align 4,,10
.L957:
	addq	$1, %rbx
.L953:
	movzbl	(%rbx), %ecx
	movl	%ecx, %esi
	call	*%rdi
	testl	%eax, %eax
	jne	.L957
	testb	%sil, %sil
	jne	.L958
	movl	%r13d, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
.L958:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC35(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB66:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE66:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB67:
	call	__cxa_throw
.L956:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
	call	_Unwind_Resume
	nop
.LEHE67:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8622:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8622-.LLSDACSB8622
.LLSDACSB8622:
	.uleb128 .LEHB65-.LFB8622
	.uleb128 .LEHE65-.LEHB65
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB66-.LFB8622
	.uleb128 .LEHE66-.LEHB66
	.uleb128 .L956-.LFB8622
	.uleb128 0
	.uleb128 .LEHB67-.LFB8622
	.uleb128 .LEHE67-.LEHB67
	.uleb128 0
	.uleb128 0
.LLSDACSE8622:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common11opp_strtoulEPKcPPc
	.def	_ZN7omnetpp6common11opp_strtoulEPKcPPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common11opp_strtoulEPKcPPc
_ZN7omnetpp6common11opp_strtoulEPKcPPc:
.LFB8623:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	__imp_isspace(%rip), %rsi
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	jmp	.L961
	.p2align 4,,10
.L972:
	addq	$1, %rbx
.L961:
	movzbl	(%rbx), %ecx
	call	*%rsi
	testl	%eax, %eax
	jne	.L972
	movq	__imp__errno(%rip), %rsi
.LEHB68:
	call	*%rsi
	movl	$0, (%rax)
	movzbl	(%rbx), %eax
	cmpb	$48, %al
	je	.L973
	subl	$43, %eax
	movl	$10, %r8d
	testb	$-3, %al
	jne	.L963
	cmpb	$48, 1(%rbx)
	je	.L974
.L963:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	strtoul
	cmpl	$-1, %eax
	movl	%eax, %edi
	je	.L975
.L959:
	movl	%edi, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L973:
	movzbl	1(%rbx), %ecx
	call	*__imp_toupper(%rip)
	movl	$10, %r8d
	cmpb	$88, %al
	movl	$16, %eax
	cmove	%eax, %r8d
	jmp	.L963
	.p2align 4,,10
.L975:
	call	*%rsi
.LEHE68:
	cmpl	$34, (%rax)
	jne	.L959
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC34(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	movq	%rax, %rsi
.LEHB69:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE69:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rsi, %rcx
.LEHB70:
	call	__cxa_throw
	.p2align 4,,10
.L974:
	movzbl	2(%rbx), %ecx
	movl	%r8d, -84(%rbp)
	call	*__imp_toupper(%rip)
	movl	$10, %r8d
	cmpb	$88, %al
	movl	$16, %eax
	cmove	%eax, %r8d
	jmp	.L963
.L971:
	movq	%rax, %rbx
	movq	%rsi, %rcx
	call	__cxa_free_exception
	movq	%rbx, %rcx
	call	_Unwind_Resume
	nop
.LEHE70:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8623:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8623-.LLSDACSB8623
.LLSDACSB8623:
	.uleb128 .LEHB68-.LFB8623
	.uleb128 .LEHE68-.LEHB68
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB69-.LFB8623
	.uleb128 .LEHE69-.LEHB69
	.uleb128 .L971-.LFB8623
	.uleb128 0
	.uleb128 .LEHB70-.LFB8623
	.uleb128 .LEHE70-.LEHB70
	.uleb128 0
	.uleb128 0
.LLSDACSE8623:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common9opp_atoulEPKc
	.def	_ZN7omnetpp6common9opp_atoulEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common9opp_atoulEPKc
_ZN7omnetpp6common9opp_atoulEPKc:
.LFB8624:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	-88(%rbp), %rdx
	movq	%rcx, %r12
.LEHB71:
	call	_ZN7omnetpp6common11opp_strtoulEPKcPPc
.LEHE71:
	movq	-88(%rbp), %rbx
	movl	%eax, %r13d
	movq	__imp_isspace(%rip), %rdi
	jmp	.L978
	.p2align 4,,10
.L982:
	addq	$1, %rbx
.L978:
	movzbl	(%rbx), %ecx
	movl	%ecx, %esi
	call	*%rdi
	testl	%eax, %eax
	jne	.L982
	testb	%sil, %sil
	jne	.L983
	movl	%r13d, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
.L983:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC35(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB72:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE72:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB73:
	call	__cxa_throw
.L981:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
	call	_Unwind_Resume
	nop
.LEHE73:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8624:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8624-.LLSDACSB8624
.LLSDACSB8624:
	.uleb128 .LEHB71-.LFB8624
	.uleb128 .LEHE71-.LEHB71
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB72-.LFB8624
	.uleb128 .LEHE72-.LEHB72
	.uleb128 .L981-.LFB8624
	.uleb128 0
	.uleb128 .LEHB73-.LFB8624
	.uleb128 .LEHE73-.LEHB73
	.uleb128 0
	.uleb128 0
.LLSDACSE8624:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common11opp_strtollEPKcPPc
	.def	_ZN7omnetpp6common11opp_strtollEPKcPPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common11opp_strtollEPKcPPc
_ZN7omnetpp6common11opp_strtollEPKcPPc:
.LFB8625:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	__imp_isspace(%rip), %rsi
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	jmp	.L986
	.p2align 4,,10
.L997:
	addq	$1, %rbx
.L986:
	movzbl	(%rbx), %ecx
	call	*%rsi
	testl	%eax, %eax
	jne	.L997
	movq	__imp__errno(%rip), %rsi
.LEHB74:
	call	*%rsi
	movl	$0, (%rax)
	movzbl	(%rbx), %eax
	cmpb	$48, %al
	je	.L998
	subl	$43, %eax
	movl	$10, %r8d
	testb	$-3, %al
	jne	.L988
	cmpb	$48, 1(%rbx)
	je	.L999
.L988:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	strtoll
	movq	%rax, %rdi
	movabsq	$9223372036854775807, %rax
	addq	%rdi, %rax
	cmpq	$-3, %rax
	ja	.L1000
.L984:
	movq	%rdi, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L1000:
	call	*%rsi
.LEHE74:
	cmpl	$34, (%rax)
	jne	.L984
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC34(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	movq	%rax, %rsi
.LEHB75:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE75:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rsi, %rcx
.LEHB76:
	call	__cxa_throw
	.p2align 4,,10
.L998:
	movzbl	1(%rbx), %ecx
	call	*__imp_toupper(%rip)
	movl	$10, %r8d
	cmpb	$88, %al
	movl	$16, %eax
	cmove	%eax, %r8d
	jmp	.L988
	.p2align 4,,10
.L999:
	movzbl	2(%rbx), %ecx
	movl	%r8d, -84(%rbp)
	call	*__imp_toupper(%rip)
	movl	$10, %r8d
	cmpb	$88, %al
	movl	$16, %eax
	cmove	%eax, %r8d
	jmp	.L988
.L996:
	movq	%rax, %rbx
	movq	%rsi, %rcx
	call	__cxa_free_exception
	movq	%rbx, %rcx
	call	_Unwind_Resume
	nop
.LEHE76:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8625:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8625-.LLSDACSB8625
.LLSDACSB8625:
	.uleb128 .LEHB74-.LFB8625
	.uleb128 .LEHE74-.LEHB74
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB75-.LFB8625
	.uleb128 .LEHE75-.LEHB75
	.uleb128 .L996-.LFB8625
	.uleb128 0
	.uleb128 .LEHB76-.LFB8625
	.uleb128 .LEHE76-.LEHB76
	.uleb128 0
	.uleb128 0
.LLSDACSE8625:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common9opp_atollEPKc
	.def	_ZN7omnetpp6common9opp_atollEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common9opp_atollEPKc
_ZN7omnetpp6common9opp_atollEPKc:
.LFB8626:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	-88(%rbp), %rdx
	movq	%rcx, %r12
.LEHB77:
	call	_ZN7omnetpp6common11opp_strtollEPKcPPc
.LEHE77:
	movq	-88(%rbp), %rbx
	movq	%rax, %r13
	movq	__imp_isspace(%rip), %rdi
	jmp	.L1003
	.p2align 4,,10
.L1007:
	addq	$1, %rbx
.L1003:
	movzbl	(%rbx), %ecx
	movl	%ecx, %esi
	call	*%rdi
	testl	%eax, %eax
	jne	.L1007
	testb	%sil, %sil
	jne	.L1008
	movq	%r13, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
.L1008:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC35(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB78:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE78:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB79:
	call	__cxa_throw
.L1006:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
	call	_Unwind_Resume
	nop
.LEHE79:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8626:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8626-.LLSDACSB8626
.LLSDACSB8626:
	.uleb128 .LEHB77-.LFB8626
	.uleb128 .LEHE77-.LEHB77
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB78-.LFB8626
	.uleb128 .LEHE78-.LEHB78
	.uleb128 .L1006-.LFB8626
	.uleb128 0
	.uleb128 .LEHB79-.LFB8626
	.uleb128 .LEHE79-.LEHB79
	.uleb128 0
	.uleb128 0
.LLSDACSE8626:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common12opp_strtoullEPKcPPc
	.def	_ZN7omnetpp6common12opp_strtoullEPKcPPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12opp_strtoullEPKcPPc
_ZN7omnetpp6common12opp_strtoullEPKcPPc:
.LFB8627:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	__imp_isspace(%rip), %rsi
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	jmp	.L1011
	.p2align 4,,10
.L1022:
	addq	$1, %rbx
.L1011:
	movzbl	(%rbx), %ecx
	call	*%rsi
	testl	%eax, %eax
	jne	.L1022
	movq	__imp__errno(%rip), %rsi
.LEHB80:
	call	*%rsi
	movl	$0, (%rax)
	movzbl	(%rbx), %eax
	cmpb	$48, %al
	je	.L1023
	subl	$43, %eax
	movl	$10, %r8d
	testb	$-3, %al
	jne	.L1013
	cmpb	$48, 1(%rbx)
	je	.L1024
.L1013:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	strtoull
	cmpq	$-1, %rax
	movq	%rax, %rdi
	je	.L1025
.L1009:
	movq	%rdi, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L1023:
	movzbl	1(%rbx), %ecx
	call	*__imp_toupper(%rip)
	movl	$10, %r8d
	cmpb	$88, %al
	movl	$16, %eax
	cmove	%eax, %r8d
	jmp	.L1013
	.p2align 4,,10
.L1025:
	call	*%rsi
.LEHE80:
	cmpl	$34, (%rax)
	jne	.L1009
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC34(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	movq	%rax, %rsi
.LEHB81:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE81:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rsi, %rcx
.LEHB82:
	call	__cxa_throw
	.p2align 4,,10
.L1024:
	movzbl	2(%rbx), %ecx
	movl	%r8d, -84(%rbp)
	call	*__imp_toupper(%rip)
	movl	$10, %r8d
	cmpb	$88, %al
	movl	$16, %eax
	cmove	%eax, %r8d
	jmp	.L1013
.L1021:
	movq	%rax, %rbx
	movq	%rsi, %rcx
	call	__cxa_free_exception
	movq	%rbx, %rcx
	call	_Unwind_Resume
	nop
.LEHE82:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8627:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8627-.LLSDACSB8627
.LLSDACSB8627:
	.uleb128 .LEHB80-.LFB8627
	.uleb128 .LEHE80-.LEHB80
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB81-.LFB8627
	.uleb128 .LEHE81-.LEHB81
	.uleb128 .L1021-.LFB8627
	.uleb128 0
	.uleb128 .LEHB82-.LFB8627
	.uleb128 .LEHE82-.LEHB82
	.uleb128 0
	.uleb128 0
.LLSDACSE8627:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common10opp_atoullEPKc
	.def	_ZN7omnetpp6common10opp_atoullEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common10opp_atoullEPKc
_ZN7omnetpp6common10opp_atoullEPKc:
.LFB8628:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	-88(%rbp), %rdx
	movq	%rcx, %r12
.LEHB83:
	call	_ZN7omnetpp6common12opp_strtoullEPKcPPc
.LEHE83:
	movq	-88(%rbp), %rbx
	movq	%rax, %r13
	movq	__imp_isspace(%rip), %rdi
	jmp	.L1028
	.p2align 4,,10
.L1032:
	addq	$1, %rbx
.L1028:
	movzbl	(%rbx), %ecx
	movl	%ecx, %esi
	call	*%rdi
	testl	%eax, %eax
	jne	.L1032
	testb	%sil, %sil
	jne	.L1033
	movq	%r13, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
.L1033:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC35(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB84:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE84:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB85:
	call	__cxa_throw
.L1031:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
	call	_Unwind_Resume
	nop
.LEHE85:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8628:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8628-.LLSDACSB8628
.LLSDACSB8628:
	.uleb128 .LEHB83-.LFB8628
	.uleb128 .LEHE83-.LEHB83
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB84-.LFB8628
	.uleb128 .LEHE84-.LEHB84
	.uleb128 .L1031-.LFB8628
	.uleb128 0
	.uleb128 .LEHB85-.LFB8628
	.uleb128 .LEHE85-.LEHB85
	.uleb128 0
	.uleb128 0
.LLSDACSE8628:
	.text
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC37:
	.ascii "Cannot represent \"%s\" in double\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common10opp_strtodEPKcPPc
	.def	_ZN7omnetpp6common10opp_strtodEPKcPPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common10opp_strtodEPKcPPc
_ZN7omnetpp6common10opp_strtodEPKcPPc:
.LFB8629:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	movaps	%xmm6, -16(%rbp)
	.seh_savexmm	%xmm6, 32
	.seh_endprologue
	movq	%rdx, %rsi
	leaq	.LC14(%rip), %rdx
	movq	%rcx, %rbx
	movl	$4, %ecx
	call	setlocale
	movq	%rsi, %rdx
	movq	%rbx, %rcx
.LEHB86:
	call	__mingw_strtod
	movapd	%xmm0, %xmm6
	movsd	.LC36(%rip), %xmm0
	ucomisd	%xmm6, %xmm0
	ja	.L1035
	ucomisd	.LC31(%rip), %xmm6
	jbe	.L1034
.L1035:
	call	*__imp__errno(%rip)
.LEHE86:
	cmpl	$34, (%rax)
	je	.L1041
.L1034:
	movapd	%xmm6, %xmm0
	movaps	-16(%rbp), %xmm6
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
.L1041:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC37(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	movq	%rax, %rsi
.LEHB87:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE87:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rsi, %rcx
.LEHB88:
	call	__cxa_throw
.L1040:
	movq	%rax, %rbx
	movq	%rsi, %rcx
	call	__cxa_free_exception
	movq	%rbx, %rcx
	call	_Unwind_Resume
	nop
.LEHE88:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8629:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8629-.LLSDACSB8629
.LLSDACSB8629:
	.uleb128 .LEHB86-.LFB8629
	.uleb128 .LEHE86-.LEHB86
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB87-.LFB8629
	.uleb128 .LEHE87-.LEHB87
	.uleb128 .L1040-.LFB8629
	.uleb128 0
	.uleb128 .LEHB88-.LFB8629
	.uleb128 .LEHE88-.LEHB88
	.uleb128 0
	.uleb128 0
.LLSDACSE8629:
	.text
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC38:
	.ascii "Cannot parse \"%s\" as a real number\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common8opp_atofEPKc
	.def	_ZN7omnetpp6common8opp_atofEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common8opp_atofEPKc
_ZN7omnetpp6common8opp_atofEPKc:
.LFB8630:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	movaps	%xmm6, -16(%rbp)
	.seh_savexmm	%xmm6, 48
	.seh_endprologue
	leaq	.LC14(%rip), %rdx
	movq	%rcx, %r12
	movl	$4, %ecx
	call	setlocale
	leaq	.LC14(%rip), %rdx
	movl	$4, %ecx
	call	setlocale
	leaq	-24(%rbp), %rdx
	movq	%r12, %rcx
.LEHB89:
	call	__mingw_strtod
	movapd	%xmm0, %xmm6
	movsd	.LC36(%rip), %xmm0
	ucomisd	%xmm6, %xmm0
	ja	.L1043
	ucomisd	.LC31(%rip), %xmm6
	jbe	.L1045
.L1043:
	call	*__imp__errno(%rip)
.LEHE89:
	cmpl	$34, (%rax)
	je	.L1054
.L1045:
	movq	-24(%rbp), %rbx
	movq	__imp_isspace(%rip), %rdi
	jmp	.L1044
	.p2align 4,,10
.L1055:
	movq	%rbx, -24(%rbp)
.L1044:
	movzbl	(%rbx), %ecx
	addq	$1, %rbx
	movl	%ecx, %esi
	call	*%rdi
	testl	%eax, %eax
	jne	.L1055
	testb	%sil, %sil
	jne	.L1056
	movapd	%xmm6, %xmm0
	movaps	-16(%rbp), %xmm6
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
.L1056:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC38(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB90:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE90:
.L1052:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB91:
	call	__cxa_throw
.LEHE91:
.L1054:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC37(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB92:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE92:
	jmp	.L1052
.L1050:
.L1053:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
.LEHB93:
	call	_Unwind_Resume
.LEHE93:
.L1051:
	jmp	.L1053
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8630:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8630-.LLSDACSB8630
.LLSDACSB8630:
	.uleb128 .LEHB89-.LFB8630
	.uleb128 .LEHE89-.LEHB89
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB90-.LFB8630
	.uleb128 .LEHE90-.LEHB90
	.uleb128 .L1050-.LFB8630
	.uleb128 0
	.uleb128 .LEHB91-.LFB8630
	.uleb128 .LEHE91-.LEHB91
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB92-.LFB8630
	.uleb128 .LEHE92-.LEHB92
	.uleb128 .L1051-.LFB8630
	.uleb128 0
	.uleb128 .LEHB93-.LFB8630
	.uleb128 .LEHE93-.LEHB93
	.uleb128 0
	.uleb128 0
.LLSDACSE8630:
	.text
	.seh_endproc
	.section .rdata,"dr"
.LC39:
	.ascii "%04d%02d%02d-%02d:%02d:%02d\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common22opp_makedatetimestringB5cxx11Ev
	.def	_ZN7omnetpp6common22opp_makedatetimestringB5cxx11Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common22opp_makedatetimestringB5cxx11Ev
_ZN7omnetpp6common22opp_makedatetimestringB5cxx11Ev:
.LFB8631:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$120, %rsp
	.seh_stackalloc	120
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, %rsi
	xorl	%ecx, %ecx
	leaq	-48(%rbp), %rdi
	call	*__imp__time64(%rip)
	leaq	-64(%rbp), %rcx
	movq	%rax, -64(%rbp)
	movq	%rdi, %rbx
	call	*__imp__localtime64(%rip)
	movl	(%rax), %r8d
	movl	16(%rax), %ecx
	movl	20(%rax), %edx
	movl	%r8d, 56(%rsp)
	movl	4(%rax), %r8d
	leal	1(%rcx), %r9d
	movq	%rdi, %rcx
	movl	%r8d, 48(%rsp)
	movl	8(%rax), %r8d
	movl	%r8d, 40(%rsp)
	movl	12(%rax), %eax
	leal	1900(%rdx), %r8d
	leaq	.LC39(%rip), %rdx
	movl	%eax, 32(%rsp)
	call	_Z7sprintfPcPKcz
	leaq	16(%rsi), %rax
	movq	%rax, (%rsi)
.L1058:
	movl	(%rbx), %r8d
	addq	$4, %rbx
	leal	-16843009(%r8), %edx
	notl	%r8d
	andl	%r8d, %edx
	andl	$-2139062144, %edx
	je	.L1058
	movl	%edx, %ecx
	shrl	$16, %ecx
	testl	$32896, %edx
	cmove	%ecx, %edx
	leaq	2(%rbx), %rcx
	cmove	%rcx, %rbx
	movl	%edx, %ecx
	addb	%dl, %cl
	sbbq	$3, %rbx
	subq	%rdi, %rbx
	cmpq	$15, %rbx
	movq	%rbx, -56(%rbp)
	ja	.L1069
	cmpq	$1, %rbx
	jne	.L1062
	movzbl	-48(%rbp), %edx
	movb	%dl, 16(%rsi)
.L1063:
	movq	%rbx, 8(%rsi)
	movb	$0, (%rax,%rbx)
	movq	%rsi, %rax
	addq	$120, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L1069:
	leaq	-56(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-56(%rbp), %rdx
	movq	%rax, (%rsi)
	movq	%rdx, 16(%rsi)
.L1061:
	movq	%rbx, %r8
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-56(%rbp), %rbx
	movq	(%rsi), %rax
	jmp	.L1063
	.p2align 4,,10
.L1062:
	testq	%rbx, %rbx
	je	.L1063
	jmp	.L1061
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common21opp_findmatchingquoteEPKc
	.def	_ZN7omnetpp6common21opp_findmatchingquoteEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common21opp_findmatchingquoteEPKc
_ZN7omnetpp6common21opp_findmatchingquoteEPKc:
.LFB8632:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	__imp_isspace(%rip), %rdi
	movq	%rcx, %rbx
	jmp	.L1071
	.p2align 4,,10
.L1080:
	movq	%rdx, %rbx
.L1071:
	movzbl	(%rbx), %ecx
	movl	%ecx, %esi
	call	*%rdi
	testl	%eax, %eax
	leaq	1(%rbx), %rdx
	jne	.L1080
	cmpb	$34, %sil
	jne	.L1085
	movzbl	1(%rbx), %ecx
	testb	%cl, %cl
	je	.L1081
	cmpb	$34, %cl
	jne	.L1074
	jmp	.L1081
	.p2align 4,,10
.L1075:
	movzbl	1(%rdx), %ecx
	cmpb	$34, %cl
	je	.L1073
	testb	%cl, %cl
	je	.L1073
.L1077:
	movq	%rax, %rdx
.L1074:
	cmpb	$92, %cl
	leaq	1(%rdx), %rax
	jne	.L1075
	movzbl	2(%rdx), %ecx
	leaq	2(%rdx), %rax
	testb	%cl, %cl
	je	.L1073
	cmpb	$34, %cl
	jne	.L1077
.L1073:
	testb	%cl, %cl
	movl	$0, %edx
	cmove	%rdx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L1081:
	movq	%rdx, %rax
	jmp	.L1073
.L1085:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB94:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE94:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB95:
	call	__cxa_throw
.L1083:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
	call	_Unwind_Resume
	nop
.LEHE95:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8632:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8632-.LLSDACSB8632
.LLSDACSB8632:
	.uleb128 .LEHB94-.LFB8632
	.uleb128 .LEHE94-.LEHB94
	.uleb128 .L1083-.LFB8632
	.uleb128 0
	.uleb128 .LEHB95-.LFB8632
	.uleb128 .LEHE95-.LEHB95
	.uleb128 0
	.uleb128 0
.LLSDACSE8632:
	.text
	.seh_endproc
	.section .rdata,"dr"
.LC40:
	.ascii "Missing left parenthesis\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common21opp_findmatchingparenEPKc
	.def	_ZN7omnetpp6common21opp_findmatchingparenEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common21opp_findmatchingparenEPKc
_ZN7omnetpp6common21opp_findmatchingparenEPKc:
.LFB8633:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	__imp_isspace(%rip), %rdi
	movq	%rcx, %rsi
	jmp	.L1087
	.p2align 4,,10
.L1106:
	movq	%rbx, %rsi
.L1087:
	movzbl	(%rsi), %ecx
	leaq	1(%rsi), %rbx
	movl	%ecx, %r12d
	call	*%rdi
	testl	%eax, %eax
	jne	.L1106
	cmpb	$40, %r12b
	jne	.L1124
	movzbl	1(%rsi), %edx
	testb	%dl, %dl
	je	.L1107
	movl	$1, %esi
	jmp	.L1090
	.p2align 4,,10
.L1091:
	cmpb	$41, %dl
	je	.L1125
	cmpb	$34, %dl
	je	.L1096
.L1095:
	movzbl	1(%rbx), %edx
	leaq	1(%rbx), %rax
	testb	%dl, %dl
	je	.L1092
	testl	%esi, %esi
	je	.L1086
.L1093:
	movq	%rax, %rbx
.L1090:
	cmpb	$40, %dl
	jne	.L1091
	movzbl	1(%rbx), %edx
	addl	$1, %esi
	leaq	1(%rbx), %rax
	testb	%dl, %dl
	jne	.L1093
.L1092:
	testl	%esi, %esi
	movl	$0, %edx
	cmovne	%rdx, %rax
.L1086:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
.L1108:
	movq	%rdx, %rbx
.L1096:
	movzbl	(%rbx), %ecx
	movl	%ecx, %r12d
	call	*%rdi
	testl	%eax, %eax
	leaq	1(%rbx), %rdx
	jne	.L1108
	cmpb	$34, %r12b
	jne	.L1126
	movzbl	1(%rbx), %eax
	testb	%al, %al
	je	.L1109
	cmpb	$34, %al
	jne	.L1099
	jmp	.L1109
	.p2align 4,,10
.L1100:
	movzbl	1(%rdx), %eax
	cmpb	$34, %al
	je	.L1098
	testb	%al, %al
	je	.L1098
.L1101:
	movq	%rbx, %rdx
.L1099:
	cmpb	$92, %al
	leaq	1(%rdx), %rbx
	jne	.L1100
	movzbl	2(%rdx), %eax
	leaq	2(%rdx), %rbx
	testb	%al, %al
	je	.L1098
	cmpb	$34, %al
	jne	.L1101
	.p2align 4,,10
.L1098:
	testb	%al, %al
	jne	.L1095
.L1107:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
.L1125:
	subl	$1, %esi
	jmp	.L1095
	.p2align 4,,10
.L1109:
	testb	%al, %al
	movq	%rdx, %rbx
	jne	.L1095
	jmp	.L1107
.L1126:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB96:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE96:
.L1122:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rbx, %rcx
.LEHB97:
	call	__cxa_throw
.LEHE97:
.L1124:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	leaq	.LC40(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB98:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE98:
	jmp	.L1122
.L1112:
.L1123:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
.LEHB99:
	call	_Unwind_Resume
.LEHE99:
.L1111:
	jmp	.L1123
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8633:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8633-.LLSDACSB8633
.LLSDACSB8633:
	.uleb128 .LEHB96-.LFB8633
	.uleb128 .LEHE96-.LEHB96
	.uleb128 .L1112-.LFB8633
	.uleb128 0
	.uleb128 .LEHB97-.LFB8633
	.uleb128 .LEHE97-.LEHB97
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB98-.LFB8633
	.uleb128 .LEHE98-.LEHB98
	.uleb128 .L1111-.LFB8633
	.uleb128 0
	.uleb128 .LEHB99-.LFB8633
	.uleb128 .LEHE99-.LEHB99
	.uleb128 0
	.uleb128 0
.LLSDACSE8633:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common13opp_urldecodeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN7omnetpp6common13opp_urldecodeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common13opp_urldecodeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN7omnetpp6common13opp_urldecodeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8638:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	leaq	16(%rcx), %r12
	movq	$0, 8(%rcx)
	movb	$0, 16(%rcx)
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	%r12, (%rcx)
	movq	(%rdx), %rbx
	movq	8(%rdx), %rax
	addq	%rbx, %rax
	cmpq	%rax, %rbx
	je	.L1127
	xorl	%edx, %edx
	jmp	.L1139
	.p2align 4,,10
.L1144:
	movl	$32, 32(%rsp)
	movl	$1, %r9d
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
.LEHB100:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE14_M_replace_auxEyyyc
.L1132:
	movq	8(%rdi), %rax
	addq	(%rdi), %rax
	addq	$1, %rbx
	cmpq	%rbx, %rax
	je	.L1127
.L1145:
	movq	8(%rsi), %rdx
.L1139:
	movsbl	(%rbx), %ecx
	cmpb	$37, %cl
	je	.L1130
	cmpb	$43, %cl
	je	.L1144
	movl	%ecx, 32(%rsp)
	movl	$1, %r9d
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE14_M_replace_auxEyyyc
	movq	8(%rdi), %rax
	addq	(%rdi), %rax
	addq	$1, %rbx
	cmpq	%rbx, %rax
	jne	.L1145
.L1127:
	movq	%rsi, %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
.L1130:
	subq	%rbx, %rax
	cmpq	$1, %rax
	jle	.L1133
	movzbl	1(%rbx), %eax
	movl	%eax, %r13d
	subl	$48, %eax
	cmpl	$9, %eax
	ja	.L1133
	movzbl	2(%rbx), %ecx
	movq	%rdx, -8(%rbp)
	movl	%ecx, %r14d
	call	*__imp_isxdigit(%rip)
	testl	%eax, %eax
	movq	-8(%rbp), %rdx
	je	.L1133
	addq	$2, %rbx
	movsbl	%r13b, %r8d
	cmpb	$64, %r13b
	movsbl	%r14b, %ecx
	leal	-48(%r8), %eax
	jle	.L1136
	andl	$223, %r8d
	leal	-55(%r8), %eax
.L1136:
	sall	$4, %eax
	cmpb	$64, %r14b
	leal	-48(%rcx), %r8d
	jle	.L1138
	andl	$223, %ecx
	leal	-55(%rcx), %r8d
.L1138:
	addl	%r8d, %eax
	movl	$1, %r9d
	xorl	%r8d, %r8d
	movsbl	%al, %eax
	movq	%rsi, %rcx
	movl	%eax, 32(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE14_M_replace_auxEyyyc
	jmp	.L1132
	.p2align 4,,10
.L1133:
	movl	$37, 32(%rsp)
	movl	$1, %r9d
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE14_M_replace_auxEyyyc
.LEHE100:
	jmp	.L1132
.L1142:
	movq	(%rsi), %rcx
	movq	%rax, %rbx
	cmpq	%rcx, %r12
	je	.L1141
	call	_ZdlPv
.L1141:
	movq	%rbx, %rcx
.LEHB101:
	call	_Unwind_Resume
	nop
.LEHE101:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8638:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8638-.LLSDACSB8638
.LLSDACSB8638:
	.uleb128 .LEHB100-.LFB8638
	.uleb128 .LEHE100-.LEHB100
	.uleb128 .L1142-.LFB8638
	.uleb128 0
	.uleb128 .LEHB101-.LFB8638
	.uleb128 .LEHE101-.LEHB101
	.uleb128 0
	.uleb128 0
.LLSDACSE8638:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common12opp_strnistrEPKcS2_ib
	.def	_ZN7omnetpp6common12opp_strnistrEPKcS2_ib;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12opp_strnistrEPKcS2_ib
_ZN7omnetpp6common12opp_strnistrEPKcS2_ib:
.LFB8642:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%r8d, %edi
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	movq	%rdx, %r12
	movl	%r9d, %r13d
	call	strlen
	testl	%edi, %edi
	movq	%rax, %rsi
	jne	.L1147
	movq	%rbx, %rcx
	call	strlen
	movl	%eax, %edi
.L1147:
	subl	%esi, %edi
	js	.L1150
	cmpb	$0, (%rbx)
	je	.L1150
	testb	%r13b, %r13b
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	je	.L1151
	leaq	1(%rbx,%rdi), %rdi
	jmp	.L1152
	.p2align 4,,10
.L1166:
	addq	$1, %rbx
	cmpq	%rdi, %rbx
	je	.L1150
	cmpb	$0, (%rbx)
	je	.L1150
.L1152:
	movq	%rsi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	strncmp
	testl	%eax, %eax
	jne	.L1166
	movq	%rbx, %rax
.L1168:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
.L1150:
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
.L1151:
	leaq	1(%rbx,%rdi), %r13
	movq	__imp__strnicmp(%rip), %rdi
	jmp	.L1156
	.p2align 4,,10
.L1167:
	addq	$1, %rbx
	cmpq	%rbx, %r13
	je	.L1150
	cmpb	$0, (%rbx)
	je	.L1150
.L1156:
	movq	%rsi, %r8
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	*%rdi
	testl	%eax, %eax
	jne	.L1167
	movq	%rbx, %rax
	jmp	.L1168
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common14opp_latexQuoteERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN7omnetpp6common14opp_latexQuoteERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common14opp_latexQuoteERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN7omnetpp6common14opp_latexQuoteERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8643:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$456, %rsp
	.seh_stackalloc	456
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	(%rdx), %r12
	movq	8(%rdx), %rsi
	leaq	-64(%rbp), %rdi
	movq	%rcx, %r13
	leaq	16(%rdi), %rax
	movq	%rax, -64(%rbp)
	movq	%r12, %rax
	addq	%rsi, %rax
	je	.L1170
	testq	%r12, %r12
	je	.L1375
.L1170:
	cmpq	$15, %rsi
	movq	%rsi, 288(%rbp)
	ja	.L1376
	cmpq	$1, %rsi
	jne	.L1173
	movzbl	(%r12), %eax
	leaq	288(%rbp), %rbx
	movb	%al, -48(%rbp)
	leaq	16(%rdi), %rax
.L1174:
	movq	%rsi, -56(%rbp)
	movb	$0, (%rax,%rsi)
	leaq	16(%rbx), %rax
	leaq	256(%rbp), %rsi
	leaq	-32(%rbp), %r12
	movl	$8, %r10d
	movq	%rax, 288(%rbp)
	movl	$92, %r11d
	movq	%rbx, %r9
	leaq	16(%rsi), %rax
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%r12, %rcx
	movq	$1, 296(%rbp)
	movw	%r10w, 304(%rbp)
	movq	%rax, 256(%rbp)
	movq	$1, 264(%rbp)
	movw	%r11w, 272(%rbp)
.LEHB102:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE102:
	movq	-32(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1175
	leaq	16(%rdi), %rcx
	movq	-24(%rbp), %r9
	movq	-16(%rbp), %r8
	cmpq	%rcx, %rax
	je	.L1377
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1177
	movq	%rax, -32(%rbp)
	movq	%rcx, -16(%rbp)
.L1178:
	movq	$0, -24(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	-32(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1179
	call	_ZdlPv
.L1179:
	movq	256(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1180
	call	_ZdlPv
.L1180:
	movq	288(%rbp), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1181
	call	_ZdlPv
.L1181:
	leaq	16(%rbx), %rax
	movl	$31580, %r8d
	movl	$123, %r9d
	movw	%r8w, 304(%rbp)
	movw	%r9w, 272(%rbp)
	movq	%rsi, %r8
	movq	%rax, 288(%rbp)
	leaq	16(%rsi), %rax
	movq	%rbx, %r9
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	movq	$2, 296(%rbp)
	movb	$0, 306(%rbp)
	movq	%rax, 256(%rbp)
	movq	%rbp, %r12
	movq	$1, 264(%rbp)
.LEHB103:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE103:
	movq	0(%rbp), %rdx
	leaq	16(%rbp), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1182
	leaq	16(%rdi), %rcx
	movq	16(%rbp), %r8
	movq	8(%rbp), %r9
	cmpq	%rcx, %rax
	je	.L1378
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1184
	movq	%rax, 0(%rbp)
	movq	%rcx, 16(%rbp)
.L1185:
	movq	$0, 8(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	0(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1186
	call	_ZdlPv
.L1186:
	movq	256(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1187
	call	_ZdlPv
.L1187:
	movq	288(%rbp), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1188
	call	_ZdlPv
.L1188:
	leaq	16(%rbx), %rax
	leaq	32(%rbp), %r12
	movl	$32092, %edx
	movl	$125, %ecx
	movw	%dx, 304(%rbp)
	movq	%rbx, %r9
	movq	%rax, 288(%rbp)
	leaq	16(%rsi), %rax
	movw	%cx, 272(%rbp)
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%r12, %rcx
	movq	$2, 296(%rbp)
	movb	$0, 306(%rbp)
	movq	%rax, 256(%rbp)
	movq	$1, 264(%rbp)
.LEHB104:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE104:
	movq	32(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1189
	leaq	16(%rdi), %rcx
	movq	40(%rbp), %r9
	movq	48(%rbp), %r8
	cmpq	%rcx, %rax
	je	.L1379
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1191
	movq	%rax, 32(%rbp)
	movq	%rcx, 48(%rbp)
.L1192:
	movq	$0, 40(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	32(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1193
	call	_ZdlPv
.L1193:
	movq	256(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1194
	call	_ZdlPv
.L1194:
	movq	288(%rbp), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1195
	call	_ZdlPv
.L1195:
	leaq	16(%rbx), %rax
	leaq	64(%rbp), %r12
	movq	%rbx, %r9
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	$2, 296(%rbp)
	movq	%rax, 288(%rbp)
	movl	$24412, %eax
	movq	%r12, %rcx
	movw	%ax, 304(%rbp)
	leaq	16(%rsi), %rax
	movb	$0, 306(%rbp)
	movq	$1, 264(%rbp)
	movq	%rax, 256(%rbp)
	movl	$95, %eax
	movw	%ax, 272(%rbp)
.LEHB105:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE105:
	movq	64(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1196
	leaq	16(%rdi), %rcx
	movq	72(%rbp), %r9
	movq	80(%rbp), %r8
	cmpq	%rcx, %rax
	je	.L1380
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1198
	movq	%rax, 64(%rbp)
	movq	%rcx, 80(%rbp)
.L1199:
	movq	$0, 72(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	64(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1200
	call	_ZdlPv
.L1200:
	movq	256(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1201
	call	_ZdlPv
.L1201:
	movq	288(%rbp), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1202
	call	_ZdlPv
.L1202:
	leaq	16(%rbx), %rax
	leaq	96(%rbp), %r12
	movq	%rbx, %r9
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	$2, 296(%rbp)
	movq	%rax, 288(%rbp)
	movl	$9308, %eax
	movq	%r12, %rcx
	movw	%ax, 304(%rbp)
	leaq	16(%rsi), %rax
	movb	$0, 306(%rbp)
	movq	$1, 264(%rbp)
	movq	%rax, 256(%rbp)
	movl	$36, %eax
	movw	%ax, 272(%rbp)
.LEHB106:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE106:
	movq	96(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1203
	leaq	16(%rdi), %rcx
	movq	104(%rbp), %r9
	movq	112(%rbp), %r8
	cmpq	%rcx, %rax
	je	.L1381
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1205
	movq	%rax, 96(%rbp)
	movq	%rcx, 112(%rbp)
.L1206:
	movq	$0, 104(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	96(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1207
	call	_ZdlPv
.L1207:
	movq	256(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1208
	call	_ZdlPv
.L1208:
	movq	288(%rbp), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1209
	call	_ZdlPv
.L1209:
	leaq	16(%rbx), %rax
	leaq	128(%rbp), %r12
	movq	%rbx, %r9
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	$2, 296(%rbp)
	movq	%rax, 288(%rbp)
	movl	$9564, %eax
	movq	%r12, %rcx
	movw	%ax, 304(%rbp)
	leaq	16(%rsi), %rax
	movb	$0, 306(%rbp)
	movq	$1, 264(%rbp)
	movq	%rax, 256(%rbp)
	movl	$37, %eax
	movw	%ax, 272(%rbp)
.LEHB107:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE107:
	movq	128(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1210
	leaq	16(%rdi), %rcx
	movq	144(%rbp), %r8
	movq	136(%rbp), %r9
	cmpq	%rcx, %rax
	je	.L1382
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1212
	movq	%rax, 128(%rbp)
	movq	%rcx, 144(%rbp)
.L1213:
	movq	$0, 136(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	128(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1214
	call	_ZdlPv
.L1214:
	movq	256(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1215
	call	_ZdlPv
.L1215:
	movq	288(%rbp), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1216
	call	_ZdlPv
.L1216:
	leaq	16(%rbx), %rax
	movl	$38, %r12d
	movl	$9820, %r11d
	movw	%r12w, 272(%rbp)
	leaq	160(%rbp), %r12
	movq	%rbx, %r9
	movq	%rax, 288(%rbp)
	leaq	16(%rsi), %rax
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%r12, %rcx
	movw	%r11w, 304(%rbp)
	movq	$2, 296(%rbp)
	movb	$0, 306(%rbp)
	movq	%rax, 256(%rbp)
	movq	$1, 264(%rbp)
.LEHB108:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE108:
	movq	160(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1217
	leaq	16(%rdi), %rcx
	movq	168(%rbp), %r9
	movq	176(%rbp), %r8
	cmpq	%rcx, %rax
	je	.L1383
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1219
	movq	%rax, 160(%rbp)
	movq	%rcx, 176(%rbp)
.L1220:
	movq	$0, 168(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	160(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1221
	call	_ZdlPv
.L1221:
	movq	256(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1222
	call	_ZdlPv
.L1222:
	movq	288(%rbp), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1223
	call	_ZdlPv
.L1223:
	leaq	16(%rbx), %rax
	leaq	192(%rbp), %r12
	movl	$9052, %r9d
	movw	%r9w, 304(%rbp)
	movl	$35, %r10d
	movq	%rbx, %r9
	movq	%rax, 288(%rbp)
	leaq	16(%rsi), %rax
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%r12, %rcx
	movq	$2, 296(%rbp)
	movb	$0, 306(%rbp)
	movq	%rax, 256(%rbp)
	movq	$1, 264(%rbp)
	movw	%r10w, 272(%rbp)
.LEHB109:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE109:
	movq	192(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1224
	leaq	16(%rdi), %rcx
	movq	200(%rbp), %r9
	movq	208(%rbp), %r8
	cmpq	%rcx, %rax
	je	.L1384
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1226
	movq	%rax, 192(%rbp)
	movq	%rcx, 208(%rbp)
.L1227:
	movq	$0, 200(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	192(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1228
	call	_ZdlPv
.L1228:
	movq	256(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1229
	call	_ZdlPv
.L1229:
	movq	288(%rbp), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1230
	call	_ZdlPv
.L1230:
	leaq	16(%rbx), %rax
	leaq	-88(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movq	$16, -88(%rbp)
	movq	%rax, 288(%rbp)
.LEHB110:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE110:
	movq	-88(%rbp), %rdx
	movabsq	$9036599514587425635, %rcx
	movq	%rax, 288(%rbp)
	leaq	224(%rbp), %r12
	movl	$8, %r8d
	movq	%rbx, %r9
	movq	%rdx, 304(%rbp)
	movabsq	$7017299229843676283, %rdx
	movq	%rcx, 8(%rax)
	movq	%rdx, (%rax)
	movq	-88(%rbp), %rax
	movq	%r12, %rcx
	movq	288(%rbp), %rdx
	movq	%rax, 296(%rbp)
	movb	$0, (%rdx,%rax)
	leaq	16(%rsi), %rax
	movw	%r8w, 272(%rbp)
	movq	%rdi, %rdx
	movq	%rsi, %r8
	movq	$1, 264(%rbp)
	movq	%rax, 256(%rbp)
.LEHB111:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE111:
	movq	224(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1231
	leaq	16(%rdi), %rcx
	movq	232(%rbp), %r9
	movq	240(%rbp), %r8
	cmpq	%rcx, %rax
	je	.L1385
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1233
	movq	%rax, 224(%rbp)
	movq	%rcx, 240(%rbp)
.L1234:
	movq	$0, 232(%rbp)
	movb	$0, (%rax)
	leaq	16(%r12), %rax
	movq	224(%rbp), %rcx
	cmpq	%rax, %rcx
	je	.L1235
	call	_ZdlPv
.L1235:
	movq	256(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1236
	call	_ZdlPv
.L1236:
	movq	288(%rbp), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1237
	call	_ZdlPv
.L1237:
	leaq	16(%rbx), %rax
	movl	$23644, %edx
	movl	$10, %ecx
	movw	%dx, 304(%rbp)
	movw	%cx, 240(%rbp)
	movq	%rbx, %r9
	movq	%rax, 288(%rbp)
	leaq	16(%r12), %rax
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	movq	$2, 296(%rbp)
	movb	$0, 306(%rbp)
	movq	%rax, 224(%rbp)
	movq	$1, 232(%rbp)
.LEHB112:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE112:
	movq	256(%rbp), %rdx
	leaq	16(%rsi), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1238
	leaq	16(%rdi), %rcx
	movq	264(%rbp), %r9
	movq	272(%rbp), %r8
	cmpq	%rcx, %rax
	je	.L1386
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1240
	movq	%rax, 256(%rbp)
	movq	%rcx, 272(%rbp)
.L1241:
	movq	$0, 264(%rbp)
	movb	$0, (%rax)
	leaq	16(%rsi), %rax
	movq	256(%rbp), %rcx
	cmpq	%rax, %rcx
	je	.L1242
	call	_ZdlPv
.L1242:
	movq	224(%rbp), %rcx
	leaq	16(%r12), %rax
	cmpq	%rax, %rcx
	je	.L1243
	call	_ZdlPv
.L1243:
	movq	288(%rbp), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1244
	call	_ZdlPv
.L1244:
	leaq	16(%rsi), %rax
	leaq	-80(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	movq	$17, -80(%rbp)
	movq	%rax, 256(%rbp)
.LEHB113:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE113:
	movq	-80(%rbp), %rdx
	movabsq	$7306083695682218339, %rcx
	movq	%rax, 256(%rbp)
	movq	%rsi, %r9
	movq	%r12, %r8
	movq	%rdx, 272(%rbp)
	movabsq	$8314054447549668475, %rdx
	movq	%rcx, 8(%rax)
	movq	%rdx, (%rax)
	movb	$125, 16(%rax)
	movq	%rbx, %rcx
	movq	-80(%rbp), %rax
	movq	256(%rbp), %rdx
	movq	%rax, 264(%rbp)
	movb	$0, (%rdx,%rax)
	leaq	16(%r12), %rax
	movq	%rdi, %rdx
	movq	$1, 232(%rbp)
	movq	%rax, 224(%rbp)
	movl	$126, %eax
	movw	%ax, 240(%rbp)
.LEHB114:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE114:
	movq	288(%rbp), %rdx
	leaq	16(%rbx), %rcx
	movq	-64(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L1245
	leaq	16(%rdi), %rcx
	movq	304(%rbp), %r8
	movq	296(%rbp), %r9
	cmpq	%rcx, %rax
	je	.L1387
	testq	%rax, %rax
	movq	-48(%rbp), %rcx
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
	je	.L1247
	movq	%rax, 288(%rbp)
	movq	%rcx, 304(%rbp)
.L1248:
	movq	$0, 296(%rbp)
	movb	$0, (%rax)
	addq	$16, %rbx
	movq	288(%rbp), %rcx
	cmpq	%rbx, %rcx
	je	.L1249
	call	_ZdlPv
.L1249:
	movq	224(%rbp), %rcx
	addq	$16, %r12
	cmpq	%r12, %rcx
	je	.L1250
	call	_ZdlPv
.L1250:
	movq	256(%rbp), %rcx
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	je	.L1251
	call	_ZdlPv
.L1251:
	movq	-64(%rbp), %rsi
	leaq	16(%r13), %rbx
	movq	%rbx, 0(%r13)
	testq	%rsi, %rsi
	je	.L1252
	movq	%rsi, %rcx
	call	strlen
	cmpq	$15, %rax
	movq	%rax, %r12
	movq	%rax, -72(%rbp)
	ja	.L1388
	cmpq	$1, %rax
	jne	.L1256
	movzbl	(%rsi), %edx
	movb	%dl, 16(%r13)
.L1257:
	movq	%rax, 8(%r13)
	movb	$0, (%rbx,%rax)
	addq	$16, %rdi
	movq	-64(%rbp), %rcx
	cmpq	%rdi, %rcx
	je	.L1169
	call	_ZdlPv
.L1169:
	movq	%r13, %rax
	addq	$456, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.p2align 4,,10
.L1376:
	leaq	288(%rbp), %rbx
	xorl	%r8d, %r8d
	movq	%rdi, %rcx
	movq	%rbx, %rdx
.LEHB115:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE115:
	movq	288(%rbp), %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -48(%rbp)
.L1172:
	movq	%rsi, %r8
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	288(%rbp), %rsi
	movq	-64(%rbp), %rax
	jmp	.L1174
	.p2align 4,,10
.L1388:
	leaq	-72(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r13, %rcx
.LEHB116:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE116:
	movq	%rax, %rbx
	movq	%rax, 0(%r13)
	movq	-72(%rbp), %rax
	movq	%rax, 16(%r13)
.L1255:
	movq	%rbx, %rcx
	movq	%r12, %r8
	movq	%rsi, %rdx
	call	memcpy
	movq	-72(%rbp), %rax
	movq	0(%r13), %rbx
	jmp	.L1257
	.p2align 4,,10
.L1377:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1177:
	leaq	16(%r12), %rax
	movq	%rax, -32(%rbp)
	jmp	.L1178
	.p2align 4,,10
.L1387:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1247:
	leaq	16(%rbx), %rax
	movq	%rax, 288(%rbp)
	jmp	.L1248
	.p2align 4,,10
.L1379:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1191:
	leaq	16(%r12), %rax
	movq	%rax, 32(%rbp)
	jmp	.L1192
	.p2align 4,,10
.L1378:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1184:
	leaq	16(%r12), %rax
	movq	%rax, 0(%rbp)
	jmp	.L1185
	.p2align 4,,10
.L1386:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1240:
	leaq	16(%rsi), %rax
	movq	%rax, 256(%rbp)
	jmp	.L1241
	.p2align 4,,10
.L1385:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1233:
	leaq	16(%r12), %rax
	movq	%rax, 224(%rbp)
	jmp	.L1234
	.p2align 4,,10
.L1384:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1226:
	leaq	16(%r12), %rax
	movq	%rax, 192(%rbp)
	jmp	.L1227
	.p2align 4,,10
.L1383:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1219:
	leaq	16(%r12), %rax
	movq	%rax, 160(%rbp)
	jmp	.L1220
	.p2align 4,,10
.L1382:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1212:
	leaq	16(%r12), %rax
	movq	%rax, 128(%rbp)
	jmp	.L1213
	.p2align 4,,10
.L1381:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1205:
	leaq	16(%r12), %rax
	movq	%rax, 96(%rbp)
	jmp	.L1206
	.p2align 4,,10
.L1380:
	movq	%rdx, -64(%rbp)
	movq	%r9, -56(%rbp)
	movq	%r8, -48(%rbp)
.L1198:
	leaq	16(%r12), %rax
	movq	%rax, 64(%rbp)
	jmp	.L1199
	.p2align 4,,10
.L1173:
	testq	%rsi, %rsi
	leaq	16(%rdi), %rax
	leaq	288(%rbp), %rbx
	je	.L1174
	jmp	.L1172
	.p2align 4,,10
.L1256:
	testq	%rax, %rax
	je	.L1257
	jmp	.L1255
	.p2align 4,,10
.L1238:
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	256(%rbp), %rax
	jmp	.L1241
	.p2align 4,,10
.L1231:
	movq	%r12, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	224(%rbp), %rax
	jmp	.L1234
	.p2align 4,,10
.L1224:
	movq	%r12, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	192(%rbp), %rax
	jmp	.L1227
	.p2align 4,,10
.L1245:
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	288(%rbp), %rax
	jmp	.L1248
	.p2align 4,,10
.L1175:
	movq	%r12, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	-32(%rbp), %rax
	jmp	.L1178
	.p2align 4,,10
.L1189:
	movq	%r12, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	32(%rbp), %rax
	jmp	.L1192
	.p2align 4,,10
.L1182:
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	0(%rbp), %rax
	jmp	.L1185
	.p2align 4,,10
.L1217:
	movq	%r12, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	160(%rbp), %rax
	jmp	.L1220
	.p2align 4,,10
.L1210:
	movq	%r12, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	128(%rbp), %rax
	jmp	.L1213
	.p2align 4,,10
.L1203:
	movq	%r12, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	96(%rbp), %rax
	jmp	.L1206
	.p2align 4,,10
.L1196:
	movq	%r12, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	64(%rbp), %rax
	jmp	.L1199
.L1375:
	leaq	.LC2(%rip), %rcx
.LEHB117:
	call	_ZSt19__throw_logic_errorPKc
.LEHE117:
.L1252:
	leaq	.LC2(%rip), %rcx
.LEHB118:
	call	_ZSt19__throw_logic_errorPKc
.LEHE118:
.L1296:
	movq	%rax, %r12
.L1262:
	movq	-64(%rbp), %rcx
	addq	$16, %rdi
	cmpq	%rdi, %rcx
	je	.L1293
	call	_ZdlPv
.L1293:
	movq	%r12, %rcx
.LEHB119:
	call	_Unwind_Resume
.LEHE119:
.L1297:
.L1367:
	movq	256(%rbp), %rcx
	addq	$16, %rsi
	movq	%rax, %r12
	cmpq	%rsi, %rcx
	je	.L1285
	call	_ZdlPv
.L1285:
	movq	288(%rbp), %rcx
	addq	$16, %rbx
	cmpq	%rbx, %rcx
	je	.L1262
	call	_ZdlPv
	jmp	.L1262
.L1301:
	jmp	.L1367
.L1302:
	jmp	.L1367
.L1304:
	jmp	.L1367
.L1305:
	movq	224(%rbp), %rcx
	addq	$16, %r12
	movq	%rax, %rsi
	cmpq	%r12, %rcx
	je	.L1288
	call	_ZdlPv
.L1288:
	movq	288(%rbp), %rcx
	addq	$16, %rbx
	cmpq	%rbx, %rcx
	je	.L1289
	call	_ZdlPv
.L1289:
	movq	%rsi, %r12
	jmp	.L1262
.L1306:
	movq	224(%rbp), %rcx
	addq	$16, %r12
	movq	%rax, %rbx
	cmpq	%r12, %rcx
	je	.L1291
	call	_ZdlPv
.L1291:
	movq	256(%rbp), %rcx
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	je	.L1292
	call	_ZdlPv
.L1292:
	movq	%rbx, %r12
	jmp	.L1262
.L1298:
	jmp	.L1367
.L1295:
	jmp	.L1367
.L1303:
	jmp	.L1367
.L1299:
	jmp	.L1367
.L1300:
	jmp	.L1367
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8643:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8643-.LLSDACSB8643
.LLSDACSB8643:
	.uleb128 .LEHB102-.LFB8643
	.uleb128 .LEHE102-.LEHB102
	.uleb128 .L1295-.LFB8643
	.uleb128 0
	.uleb128 .LEHB103-.LFB8643
	.uleb128 .LEHE103-.LEHB103
	.uleb128 .L1297-.LFB8643
	.uleb128 0
	.uleb128 .LEHB104-.LFB8643
	.uleb128 .LEHE104-.LEHB104
	.uleb128 .L1298-.LFB8643
	.uleb128 0
	.uleb128 .LEHB105-.LFB8643
	.uleb128 .LEHE105-.LEHB105
	.uleb128 .L1299-.LFB8643
	.uleb128 0
	.uleb128 .LEHB106-.LFB8643
	.uleb128 .LEHE106-.LEHB106
	.uleb128 .L1300-.LFB8643
	.uleb128 0
	.uleb128 .LEHB107-.LFB8643
	.uleb128 .LEHE107-.LEHB107
	.uleb128 .L1301-.LFB8643
	.uleb128 0
	.uleb128 .LEHB108-.LFB8643
	.uleb128 .LEHE108-.LEHB108
	.uleb128 .L1302-.LFB8643
	.uleb128 0
	.uleb128 .LEHB109-.LFB8643
	.uleb128 .LEHE109-.LEHB109
	.uleb128 .L1303-.LFB8643
	.uleb128 0
	.uleb128 .LEHB110-.LFB8643
	.uleb128 .LEHE110-.LEHB110
	.uleb128 .L1296-.LFB8643
	.uleb128 0
	.uleb128 .LEHB111-.LFB8643
	.uleb128 .LEHE111-.LEHB111
	.uleb128 .L1304-.LFB8643
	.uleb128 0
	.uleb128 .LEHB112-.LFB8643
	.uleb128 .LEHE112-.LEHB112
	.uleb128 .L1305-.LFB8643
	.uleb128 0
	.uleb128 .LEHB113-.LFB8643
	.uleb128 .LEHE113-.LEHB113
	.uleb128 .L1296-.LFB8643
	.uleb128 0
	.uleb128 .LEHB114-.LFB8643
	.uleb128 .LEHE114-.LEHB114
	.uleb128 .L1306-.LFB8643
	.uleb128 0
	.uleb128 .LEHB115-.LFB8643
	.uleb128 .LEHE115-.LEHB115
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB116-.LFB8643
	.uleb128 .LEHE116-.LEHB116
	.uleb128 .L1296-.LFB8643
	.uleb128 0
	.uleb128 .LEHB117-.LFB8643
	.uleb128 .LEHE117-.LEHB117
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB118-.LFB8643
	.uleb128 .LEHE118-.LEHB118
	.uleb128 .L1296-.LFB8643
	.uleb128 0
	.uleb128 .LEHB119-.LFB8643
	.uleb128 .LEHE119-.LEHB119
	.uleb128 0
	.uleb128 0
.LLSDACSE8643:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common21opp_latexInsertBreaksERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN7omnetpp6common21opp_latexInsertBreaksERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common21opp_latexInsertBreaksERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN7omnetpp6common21opp_latexInsertBreaksERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8644:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$616, %rsp
	.seh_stackalloc	616
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	16(%rcx), %r13
	movq	%rcx, %rbx
	movq	%r13, (%rcx)
	movq	(%rdx), %r12
	movq	8(%rdx), %rdi
	movq	%r12, %rax
	addq	%rdi, %rax
	je	.L1390
	testq	%r12, %r12
	je	.L1698
.L1390:
	cmpq	$15, %rdi
	movq	%rdi, 448(%rbp)
	ja	.L1699
	cmpq	$1, %rdi
	jne	.L1393
	movzbl	(%r12), %eax
	leaq	448(%rbp), %rsi
	movb	%al, 16(%rbx)
	movq	%r13, %rax
.L1394:
	movq	%rdi, 8(%rbx)
	movb	$0, (%rax,%rdi)
	movabsq	$8606216625674025773, %rdi
	movq	%rdi, 464(%rbp)
	leaq	16(%rsi), %rax
	leaq	416(%rbp), %rdi
	leaq	-32(%rbp), %r12
	movl	$32107, %ecx
	movl	$45, %r8d
	movq	%rax, 448(%rbp)
	leaq	16(%rdi), %rax
	movw	%cx, 28(%rsi)
	movl	$1634038370, 24(%rsi)
	movw	%r8w, 432(%rbp)
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movq	$14, 456(%rbp)
	movb	$0, 478(%rbp)
	movq	%rax, 416(%rbp)
	movq	$1, 424(%rbp)
.LEHB120:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE120:
	movq	-32(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1395
	cmpq	%rax, %r13
	movq	-24(%rbp), %r8
	movq	-16(%rbp), %rcx
	je	.L1700
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1397
	movq	%rax, -32(%rbp)
	movq	%r9, -16(%rbp)
.L1398:
	movq	$0, -24(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	-32(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1399
	call	_ZdlPv
.L1399:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1400
	call	_ZdlPv
.L1400:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1401
	call	_ZdlPv
.L1401:
	leaq	16(%rsi), %rax
	movabsq	$8606216625674025789, %rdx
	movq	%rsi, %r9
	movq	%rdx, 464(%rbp)
	movl	$61, %edx
	movq	%rdi, %r8
	movq	%rax, 448(%rbp)
	movl	$32107, %eax
	movl	$1634038370, 24(%rsi)
	movw	%ax, 28(%rsi)
	leaq	16(%rdi), %rax
	movw	%dx, 432(%rbp)
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movq	$14, 456(%rbp)
	movb	$0, 478(%rbp)
	movq	%rax, 416(%rbp)
	movq	%rbp, %r12
	movq	$1, 424(%rbp)
.LEHB121:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE121:
	movq	0(%rbp), %rdx
	leaq	16(%rbp), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1402
	cmpq	%rax, %r13
	movq	8(%rbp), %r8
	movq	16(%rbp), %rcx
	je	.L1701
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1404
	movq	%rax, 0(%rbp)
	movq	%r9, 16(%rbp)
.L1405:
	movq	$0, 8(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	0(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1406
	call	_ZdlPv
.L1406:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1407
	call	_ZdlPv
.L1407:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1408
	call	_ZdlPv
.L1408:
	leaq	16(%rsi), %rax
	movabsq	$8606216625674025772, %rdx
	leaq	32(%rbp), %r12
	movq	%rdx, 464(%rbp)
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rax, 448(%rbp)
	movl	$32107, %eax
	movl	$1634038370, 24(%rsi)
	movw	%ax, 28(%rsi)
	leaq	16(%rdi), %rax
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movq	$14, 456(%rbp)
	movb	$0, 478(%rbp)
	movq	%rax, 416(%rbp)
	movl	$44, %eax
	movq	$1, 424(%rbp)
	movw	%ax, 432(%rbp)
.LEHB122:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE122:
	movq	32(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1409
	cmpq	%rax, %r13
	movq	40(%rbp), %r8
	movq	48(%rbp), %rcx
	je	.L1702
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1411
	movq	%rax, 32(%rbp)
	movq	%r9, 48(%rbp)
.L1412:
	movq	$0, 40(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	32(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1413
	call	_ZdlPv
.L1413:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1414
	call	_ZdlPv
.L1414:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1415
	call	_ZdlPv
.L1415:
	leaq	16(%rsi), %rax
	movabsq	$8606216625674025775, %rdx
	leaq	64(%rbp), %r12
	movq	%rdx, 464(%rbp)
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rax, 448(%rbp)
	movl	$32107, %eax
	movl	$1634038370, 24(%rsi)
	movw	%ax, 28(%rsi)
	leaq	16(%rdi), %rax
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movq	$14, 456(%rbp)
	movb	$0, 478(%rbp)
	movq	%rax, 416(%rbp)
	movl	$47, %eax
	movq	$1, 424(%rbp)
	movw	%ax, 432(%rbp)
.LEHB123:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE123:
	movq	64(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1416
	cmpq	%rax, %r13
	movq	72(%rbp), %r8
	movq	80(%rbp), %rcx
	je	.L1703
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1418
	movq	%rax, 64(%rbp)
	movq	%r9, 80(%rbp)
.L1419:
	movq	$0, 72(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	64(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1420
	call	_ZdlPv
.L1420:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1421
	call	_ZdlPv
.L1421:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1422
	call	_ZdlPv
.L1422:
	leaq	16(%rsi), %rax
	leaq	96(%rbp), %r12
	movabsq	$8606216625674025792, %rdx
	movl	$32107, %r15d
	movq	%rdx, 464(%rbp)
	movq	%rsi, %r9
	movq	%rax, 448(%rbp)
	leaq	16(%rdi), %rax
	movl	$1634038370, 24(%rsi)
	movw	%r15w, 28(%rsi)
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%rax, 416(%rbp)
	movq	%r12, %rcx
	movl	$64, %eax
	movq	$14, 456(%rbp)
	movb	$0, 478(%rbp)
	movq	$1, 424(%rbp)
	movw	%ax, 432(%rbp)
.LEHB124:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE124:
	movq	96(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1423
	cmpq	%rax, %r13
	movq	104(%rbp), %r8
	movq	112(%rbp), %rcx
	je	.L1704
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1425
	movq	%rax, 96(%rbp)
	movq	%r9, 112(%rbp)
.L1426:
	movq	$0, 104(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	96(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1427
	call	_ZdlPv
.L1427:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1428
	call	_ZdlPv
.L1428:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1429
	call	_ZdlPv
.L1429:
	leaq	16(%rsi), %rax
	leaq	-64(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	movq	$16, -64(%rbp)
	movq	%rax, 448(%rbp)
.LEHB125:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE125:
	movq	-64(%rbp), %rdx
	movabsq	$9037424165587679087, %rcx
	movq	%rax, 448(%rbp)
	leaq	128(%rbp), %r12
	movl	$23588, %r14d
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rdx, 464(%rbp)
	movabsq	$7812726503417535524, %rdx
	movq	%rcx, 8(%rax)
	movq	%rdx, (%rax)
	movq	-64(%rbp), %rax
	movq	%r12, %rcx
	movq	448(%rbp), %rdx
	movq	%rax, 456(%rbp)
	movb	$0, (%rdx,%rax)
	leaq	16(%rdi), %rax
	movw	%r14w, 432(%rbp)
	movq	%rbx, %rdx
	movq	%rax, 416(%rbp)
	movb	$123, 2(%rax)
	movq	$3, 424(%rbp)
	movb	$0, 435(%rbp)
.LEHB126:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE126:
	movq	128(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1430
	cmpq	%rax, %r13
	movq	136(%rbp), %r8
	movq	144(%rbp), %rcx
	je	.L1705
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1432
	movq	%rax, 128(%rbp)
	movq	%r9, 144(%rbp)
.L1433:
	movq	$0, 136(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	128(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1434
	call	_ZdlPv
.L1434:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1435
	call	_ZdlPv
.L1435:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1436
	call	_ZdlPv
.L1436:
	leaq	16(%rsi), %rax
	movl	$32092, %r12d
	movabsq	$8028911401113976156, %rdx
	movw	%r12w, 432(%rbp)
	leaq	160(%rbp), %r12
	movl	$27489, %r11d
	movq	%rax, 448(%rbp)
	leaq	16(%rdi), %rax
	movq	%rdx, 464(%rbp)
	movq	%rsi, %r9
	movl	$1701995127, 24(%rsi)
	movw	%r11w, 28(%rsi)
	movb	$125, 30(%rsi)
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movq	$15, 456(%rbp)
	movb	$0, 479(%rbp)
	movq	%rax, 416(%rbp)
	movq	$2, 424(%rbp)
	movb	$0, 434(%rbp)
.LEHB127:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE127:
	movq	160(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1437
	cmpq	%rax, %r13
	movq	176(%rbp), %rcx
	movq	168(%rbp), %r8
	je	.L1706
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1439
	movq	%rax, 160(%rbp)
	movq	%r9, 176(%rbp)
.L1440:
	movq	$0, 168(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	160(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1441
	call	_ZdlPv
.L1441:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1442
	call	_ZdlPv
.L1442:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1443
	call	_ZdlPv
.L1443:
	leaq	16(%rsi), %rax
	leaq	-56(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	movq	$17, -56(%rbp)
	movq	%rax, 448(%rbp)
.LEHB128:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE128:
	movq	-56(%rbp), %rdx
	movabsq	$4340465565717980005, %rcx
	movq	%rax, 448(%rbp)
	leaq	192(%rbp), %r12
	movl	$14906, %r10d
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rdx, 464(%rbp)
	movabsq	$7809933825097481790, %rdx
	movq	%rcx, 8(%rax)
	movq	%rdx, (%rax)
	movb	$60, 16(%rax)
	movq	%r12, %rcx
	movq	-56(%rbp), %rax
	movq	448(%rbp), %rdx
	movq	%rax, 456(%rbp)
	movb	$0, (%rdx,%rax)
	leaq	16(%rdi), %rax
	movq	%rbx, %rdx
	movw	%r10w, 432(%rbp)
	movq	$2, 424(%rbp)
	movq	%rax, 416(%rbp)
	movb	$0, 434(%rbp)
.LEHB129:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE129:
	movq	192(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1444
	cmpq	%rax, %r13
	movq	200(%rbp), %r8
	movq	208(%rbp), %rcx
	je	.L1707
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1446
	movq	%rax, 192(%rbp)
	movq	%r9, 208(%rbp)
.L1447:
	movq	$0, 200(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	192(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1448
	call	_ZdlPv
.L1448:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1449
	call	_ZdlPv
.L1449:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1450
	call	_ZdlPv
.L1450:
	leaq	16(%rsi), %rax
	leaq	224(%rbp), %r12
	movabsq	$8606216625674025786, %rdx
	movl	$32107, %r8d
	movl	$58, %r9d
	movq	%rdx, 464(%rbp)
	movq	%rax, 448(%rbp)
	leaq	16(%rdi), %rax
	movw	%r8w, 28(%rsi)
	movl	$1634038370, 24(%rsi)
	movw	%r9w, 432(%rbp)
	movq	%rdi, %r8
	movq	%rsi, %r9
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movq	$14, 456(%rbp)
	movb	$0, 478(%rbp)
	movq	%rax, 416(%rbp)
	movq	$1, 424(%rbp)
.LEHB130:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE130:
	movq	224(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1451
	cmpq	%rax, %r13
	movq	232(%rbp), %r8
	movq	240(%rbp), %rcx
	je	.L1708
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1453
	movq	%rax, 224(%rbp)
	movq	%r9, 240(%rbp)
.L1454:
	movq	$0, 232(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	224(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1455
	call	_ZdlPv
.L1455:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1456
	call	_ZdlPv
.L1456:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1457
	call	_ZdlPv
.L1457:
	leaq	16(%rsi), %rax
	movabsq	$8028911401113958970, %rdx
	movl	$27489, %ecx
	movq	%rdx, 464(%rbp)
	leaq	-48(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rax, 448(%rbp)
	leaq	16(%rdi), %rax
	movw	%cx, 28(%rsi)
	movl	$1701995127, 24(%rsi)
	movb	$125, 30(%rsi)
	movq	%rdi, %rcx
	movq	$15, 456(%rbp)
	movb	$0, 479(%rbp)
	movq	%rax, 416(%rbp)
	movq	$17, -48(%rbp)
.LEHB131:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE131:
	movq	-48(%rbp), %rdx
	movabsq	$4340465565717980005, %rcx
	movq	%rax, 416(%rbp)
	leaq	256(%rbp), %r12
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rdx, 432(%rbp)
	movabsq	$7809933825097481790, %rdx
	movq	%rcx, 8(%rax)
	movq	%rdx, (%rax)
	movb	$60, 16(%rax)
	movq	%r12, %rcx
	movq	-48(%rbp), %rax
	movq	416(%rbp), %rdx
	movq	%rax, 424(%rbp)
	movb	$0, (%rdx,%rax)
	movq	%rbx, %rdx
.LEHB132:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE132:
	movq	256(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1458
	cmpq	%rax, %r13
	movq	264(%rbp), %r8
	movq	272(%rbp), %rcx
	je	.L1709
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1460
	movq	%rax, 256(%rbp)
	movq	%r9, 272(%rbp)
.L1461:
	movq	$0, 264(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	256(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1462
	call	_ZdlPv
.L1462:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1463
	call	_ZdlPv
.L1463:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1464
	call	_ZdlPv
.L1464:
	leaq	16(%rsi), %rax
	movabsq	$7813861293785235006, %rdx
	leaq	288(%rbp), %r12
	movq	%rdx, 464(%rbp)
	movl	$11822, %edx
	movq	%rsi, %r9
	movq	%rax, 448(%rbp)
	movl	$15420, %eax
	movl	$1953457253, 24(%rsi)
	movw	%ax, 28(%rsi)
	leaq	16(%rdi), %rax
	movb	$60, 30(%rsi)
	movw	%dx, 432(%rbp)
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%rax, 416(%rbp)
	movq	%r12, %rcx
	movb	$46, 2(%rax)
	movq	$15, 456(%rbp)
	movb	$0, 479(%rbp)
	movq	$3, 424(%rbp)
	movb	$0, 435(%rbp)
.LEHB133:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE133:
	movq	288(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1465
	cmpq	%rax, %r13
	movq	296(%rbp), %r8
	movq	304(%rbp), %rcx
	je	.L1710
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1467
	movq	%rax, 288(%rbp)
	movq	%r9, 304(%rbp)
.L1468:
	movq	$0, 296(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	288(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1469
	call	_ZdlPv
.L1469:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1470
	call	_ZdlPv
.L1470:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1471
	call	_ZdlPv
.L1471:
	leaq	16(%rsi), %rax
	leaq	320(%rbp), %r12
	movabsq	$7809933825097481790, %rdx
	movl	$15420, %r14d
	movq	%rdx, 464(%rbp)
	movl	$11822, %r15d
	movq	%rax, 448(%rbp)
	leaq	16(%rdi), %rax
	movl	$1953457253, 24(%rsi)
	movw	%r14w, 28(%rsi)
	movb	$60, 30(%rsi)
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movq	$15, 456(%rbp)
	movb	$0, 479(%rbp)
	movq	%rax, 416(%rbp)
	movw	%r15w, 432(%rbp)
	movq	$2, 424(%rbp)
	movb	$0, 434(%rbp)
.LEHB134:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE134:
	movq	320(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1472
	cmpq	%rax, %r13
	movq	328(%rbp), %r8
	movq	336(%rbp), %rcx
	je	.L1711
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1474
	movq	%rax, 320(%rbp)
	movq	%r9, 336(%rbp)
.L1475:
	movq	$0, 328(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	320(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1476
	call	_ZdlPv
.L1476:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1477
	call	_ZdlPv
.L1477:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1478
	call	_ZdlPv
.L1478:
	leaq	16(%rsi), %rax
	movl	$46, %r12d
	movabsq	$8606216625674025774, %rdx
	movw	%r12w, 432(%rbp)
	leaq	352(%rbp), %r12
	movl	$32107, %r11d
	movq	%rax, 448(%rbp)
	leaq	16(%rdi), %rax
	movq	%rdx, 464(%rbp)
	movq	%rsi, %r9
	movl	$1634038370, 24(%rsi)
	movw	%r11w, 28(%rsi)
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movq	$14, 456(%rbp)
	movb	$0, 478(%rbp)
	movq	%rax, 416(%rbp)
	movq	$1, 424(%rbp)
.LEHB135:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE135:
	movq	352(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1479
	cmpq	%rax, %r13
	movq	360(%rbp), %r8
	movq	368(%rbp), %rcx
	je	.L1712
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1481
	movq	%rax, 352(%rbp)
	movq	%r9, 368(%rbp)
.L1482:
	movq	$0, 360(%rbp)
	movb	$0, (%rax)
	addq	$16, %r12
	movq	352(%rbp), %rcx
	cmpq	%r12, %rcx
	je	.L1483
	call	_ZdlPv
.L1483:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1484
	call	_ZdlPv
.L1484:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1485
	call	_ZdlPv
.L1485:
	leaq	16(%rsi), %rax
	leaq	-40(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rsi, %rcx
	movq	$16, -40(%rbp)
	movq	%rax, 448(%rbp)
.LEHB136:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE136:
	movq	-40(%rbp), %rdx
	movabsq	$9037424165587679087, %rcx
	movq	%rax, 448(%rbp)
	leaq	384(%rbp), %r12
	movl	$15420, %r10d
	movq	%rsi, %r9
	movq	%rdi, %r8
	movq	%rdx, 464(%rbp)
	movabsq	$7812726503412477486, %rdx
	movq	%rcx, 8(%rax)
	movq	%rdx, (%rax)
	movq	-40(%rbp), %rax
	movq	%r12, %rcx
	movq	448(%rbp), %rdx
	movq	%rax, 456(%rbp)
	movb	$0, (%rdx,%rax)
	leaq	16(%rdi), %rax
	movabsq	$7813861293785235006, %rdx
	movq	%rdx, 432(%rbp)
	movq	%rbx, %rdx
	movq	%rax, 416(%rbp)
	movl	$1953457253, 8(%rax)
	movw	%r10w, 12(%rax)
	movb	$60, 14(%rax)
	movq	$15, 424(%rbp)
	movb	$0, 447(%rbp)
.LEHB137:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE137:
	movq	384(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1486
	cmpq	%rax, %r13
	movq	392(%rbp), %r8
	movq	400(%rbp), %rcx
	je	.L1713
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1488
	movq	%rax, 384(%rbp)
	movq	%r9, 400(%rbp)
.L1489:
	movq	$0, 392(%rbp)
	movb	$0, (%rax)
	leaq	16(%r12), %rax
	movq	384(%rbp), %rcx
	cmpq	%rax, %rcx
	je	.L1490
	call	_ZdlPv
.L1490:
	movq	416(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L1491
	call	_ZdlPv
.L1491:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1492
	call	_ZdlPv
.L1492:
	leaq	16(%rsi), %rax
	movabsq	$8028911401113955886, %rdx
	movl	$27489, %r8d
	movq	%rdx, 464(%rbp)
	movl	$15420, %r9d
	movabsq	$7809933825097481790, %rdx
	movq	%rax, 448(%rbp)
	leaq	16(%r12), %rax
	movq	%rdx, 400(%rbp)
	movw	%r8w, 28(%rsi)
	movl	$1701995127, 24(%rsi)
	movq	%r12, %r8
	movq	%rax, 384(%rbp)
	movb	$125, 30(%rsi)
	movq	%rbx, %rdx
	movw	%r9w, 12(%rax)
	movl	$1953457253, 8(%rax)
	movq	%rsi, %r9
	movb	$60, 14(%rax)
	movq	%rdi, %rcx
	movq	$15, 456(%rbp)
	movb	$0, 479(%rbp)
	movq	$15, 392(%rbp)
	movb	$0, 415(%rbp)
.LEHB138:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE138:
	movq	416(%rbp), %rdx
	leaq	16(%rdi), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1493
	cmpq	%rax, %r13
	movq	432(%rbp), %rcx
	movq	424(%rbp), %r8
	je	.L1714
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1495
	movq	%rax, 416(%rbp)
	movq	%r9, 432(%rbp)
.L1496:
	movq	$0, 424(%rbp)
	movb	$0, (%rax)
	leaq	16(%rdi), %rax
	movq	416(%rbp), %rcx
	cmpq	%rax, %rcx
	je	.L1497
	call	_ZdlPv
.L1497:
	movq	384(%rbp), %rcx
	leaq	16(%r12), %rax
	cmpq	%rax, %rcx
	je	.L1498
	call	_ZdlPv
.L1498:
	movq	448(%rbp), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L1499
	call	_ZdlPv
.L1499:
	leaq	16(%rdi), %rax
	movabsq	$8606216625674025760, %rdx
	movl	$32, %ecx
	movq	%rdx, 432(%rbp)
	movl	$32107, %edx
	movw	%cx, 400(%rbp)
	movq	%rax, 416(%rbp)
	leaq	16(%r12), %rax
	movw	%dx, 28(%rdi)
	movl	$1634038370, 24(%rdi)
	movq	%rdi, %r9
	movq	%r12, %r8
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	movq	$14, 424(%rbp)
	movb	$0, 446(%rbp)
	movq	%rax, 384(%rbp)
	movq	$1, 392(%rbp)
.LEHB139:
	call	_ZN7omnetpp6common20opp_replacesubstringERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_b.constprop.110
.LEHE139:
	movq	448(%rbp), %rdx
	leaq	16(%rsi), %rcx
	movq	(%rbx), %rax
	cmpq	%rcx, %rdx
	je	.L1500
	cmpq	%rax, %r13
	movq	456(%rbp), %r8
	movq	464(%rbp), %rcx
	je	.L1715
	testq	%rax, %rax
	movq	16(%rbx), %r9
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
	je	.L1502
	movq	%rax, 448(%rbp)
	movq	%r9, 464(%rbp)
.L1503:
	movq	$0, 456(%rbp)
	movb	$0, (%rax)
	leaq	16(%rsi), %rax
	movq	448(%rbp), %rcx
	cmpq	%rax, %rcx
	je	.L1504
	call	_ZdlPv
.L1504:
	movq	384(%rbp), %rcx
	addq	$16, %r12
	cmpq	%r12, %rcx
	je	.L1505
	call	_ZdlPv
.L1505:
	movq	416(%rbp), %rcx
	addq	$16, %rdi
	cmpq	%rdi, %rcx
	je	.L1506
	call	_ZdlPv
.L1506:
	movq	8(%rbx), %rax
	testl	%eax, %eax
	movq	%rax, -72(%rbp)
	jle	.L1389
	movq	(%rbx), %rax
	xorl	%edi, %edi
	movzbl	(%rax), %r12d
	jmp	.L1565
	.p2align 4,,10
.L1512:
	movq	(%rbx), %rax
	movslq	%edi, %r15
	testl	%edi, %edi
	movzbl	(%rax,%r15), %r14d
	je	.L1508
	cmpb	$99, %r12b
	je	.L1508
	movl	%r12d, %ecx
	call	*__imp_isalpha(%rip)
	testl	%eax, %eax
	je	.L1508
	movzbl	%r14b, %eax
	movl	%eax, -76(%rbp)
	movl	%eax, %ecx
	call	*__imp_isalpha(%rip)
	testl	%eax, %eax
	je	.L1508
	movl	%r12d, %ecx
	call	*__imp_islower(%rip)
	testl	%eax, %eax
	je	.L1508
	movl	-76(%rbp), %ecx
	call	*__imp_isupper(%rip)
	testl	%eax, %eax
	jne	.L1716
	.p2align 4,,10
.L1508:
	movzbl	%r14b, %r12d
.L1565:
	addl	$1, %edi
	cmpl	-72(%rbp), %edi
	jl	.L1512
.L1389:
	movq	%rbx, %rax
	addq	$616, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L1699:
	leaq	448(%rbp), %rsi
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movq	%rsi, %rdx
.LEHB140:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE140:
	movq	448(%rbp), %rdx
	movq	%rax, (%rbx)
	movq	%rdx, 16(%rbx)
.L1392:
	movq	%rdi, %r8
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	448(%rbp), %rdi
	movq	(%rbx), %rax
	jmp	.L1394
	.p2align 4,,10
.L1700:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1397:
	leaq	16(%r12), %rax
	movq	%rax, -32(%rbp)
	jmp	.L1398
	.p2align 4,,10
.L1715:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1502:
	leaq	16(%rsi), %rax
	movq	%rax, 448(%rbp)
	jmp	.L1503
	.p2align 4,,10
.L1714:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1495:
	leaq	16(%rdi), %rax
	movq	%rax, 416(%rbp)
	jmp	.L1496
	.p2align 4,,10
.L1702:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1411:
	leaq	16(%r12), %rax
	movq	%rax, 32(%rbp)
	jmp	.L1412
	.p2align 4,,10
.L1701:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1404:
	leaq	16(%r12), %rax
	movq	%rax, 0(%rbp)
	jmp	.L1405
	.p2align 4,,10
.L1706:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1439:
	leaq	16(%r12), %rax
	movq	%rax, 160(%rbp)
	jmp	.L1440
	.p2align 4,,10
.L1705:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1432:
	leaq	16(%r12), %rax
	movq	%rax, 128(%rbp)
	jmp	.L1433
	.p2align 4,,10
.L1704:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1425:
	leaq	16(%r12), %rax
	movq	%rax, 96(%rbp)
	jmp	.L1426
	.p2align 4,,10
.L1703:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1418:
	leaq	16(%r12), %rax
	movq	%rax, 64(%rbp)
	jmp	.L1419
	.p2align 4,,10
.L1713:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1488:
	leaq	16(%r12), %rax
	movq	%rax, 384(%rbp)
	jmp	.L1489
	.p2align 4,,10
.L1712:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1481:
	leaq	16(%r12), %rax
	movq	%rax, 352(%rbp)
	jmp	.L1482
	.p2align 4,,10
.L1711:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1474:
	leaq	16(%r12), %rax
	movq	%rax, 320(%rbp)
	jmp	.L1475
	.p2align 4,,10
.L1710:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1467:
	leaq	16(%r12), %rax
	movq	%rax, 288(%rbp)
	jmp	.L1468
	.p2align 4,,10
.L1709:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1460:
	leaq	16(%r12), %rax
	movq	%rax, 256(%rbp)
	jmp	.L1461
	.p2align 4,,10
.L1708:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1453:
	leaq	16(%r12), %rax
	movq	%rax, 224(%rbp)
	jmp	.L1454
	.p2align 4,,10
.L1707:
	movq	%rdx, (%rbx)
	movq	%r8, 8(%rbx)
	movq	%rcx, 16(%rbx)
.L1446:
	leaq	16(%r12), %rax
	movq	%rax, 192(%rbp)
	jmp	.L1447
	.p2align 4,,10
.L1393:
	testq	%rdi, %rdi
	movq	%r13, %rax
	leaq	448(%rbp), %rsi
	je	.L1394
	jmp	.L1392
	.p2align 4,,10
.L1500:
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	448(%rbp), %rax
	jmp	.L1503
	.p2align 4,,10
.L1493:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	416(%rbp), %rax
	jmp	.L1496
	.p2align 4,,10
.L1486:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	384(%rbp), %rax
	jmp	.L1489
	.p2align 4,,10
.L1479:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	352(%rbp), %rax
	jmp	.L1482
	.p2align 4,,10
.L1472:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	320(%rbp), %rax
	jmp	.L1475
	.p2align 4,,10
.L1465:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	288(%rbp), %rax
	jmp	.L1468
	.p2align 4,,10
.L1458:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	256(%rbp), %rax
	jmp	.L1461
	.p2align 4,,10
.L1451:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	224(%rbp), %rax
	jmp	.L1454
	.p2align 4,,10
.L1444:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	192(%rbp), %rax
	jmp	.L1447
	.p2align 4,,10
.L1437:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	160(%rbp), %rax
	jmp	.L1440
	.p2align 4,,10
.L1430:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	128(%rbp), %rax
	jmp	.L1433
	.p2align 4,,10
.L1423:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	96(%rbp), %rax
	jmp	.L1426
	.p2align 4,,10
.L1416:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	64(%rbp), %rax
	jmp	.L1419
	.p2align 4,,10
.L1409:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	32(%rbp), %rax
	jmp	.L1412
	.p2align 4,,10
.L1402:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	0(%rbp), %rax
	jmp	.L1405
	.p2align 4,,10
.L1395:
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	-32(%rbp), %rax
	jmp	.L1398
	.p2align 4,,10
.L1716:
	cmpq	-72(%rbp), %r15
	movl	$11612, %eax
	movb	$0, 450(%rbp)
	movw	%ax, 448(%rbp)
	ja	.L1717
	movq	$2, 32(%rsp)
	movq	%rsi, %r9
	xorl	%r8d, %r8d
	movq	%r15, %rdx
	movq	%rbx, %rcx
.LEHB141:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
	movq	%rsi, %rdx
.L1510:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L1510
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	cmove	%rcx, %rdx
	movl	%eax, %ecx
	addb	%al, %cl
	movq	8(%rbx), %rax
	sbbq	$3, %rdx
	subq	%rsi, %rdx
	addl	%edx, %edi
	movq	%rax, -72(%rbp)
	jmp	.L1508
.L1717:
	movq	-72(%rbp), %r9
	leaq	.LC4(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%r15, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.LEHE141:
.L1571:
.L1685:
	movq	416(%rbp), %rcx
	addq	$16, %rdi
	movq	%rax, %r12
	cmpq	%rdi, %rcx
	je	.L1556
	call	_ZdlPv
.L1556:
	movq	448(%rbp), %rcx
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	je	.L1517
	call	_ZdlPv
.L1517:
	movq	(%rbx), %rcx
	cmpq	%rcx, %r13
	je	.L1564
	call	_ZdlPv
.L1564:
	movq	%r12, %rcx
.LEHB142:
	call	_Unwind_Resume
.L1572:
	jmp	.L1685
.L1568:
	movq	%rax, %r12
	jmp	.L1517
.L1573:
	jmp	.L1685
.L1698:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.LEHE142:
.L1567:
	jmp	.L1685
.L1569:
	jmp	.L1685
.L1570:
	jmp	.L1685
.L1577:
	movq	%rax, %r12
	jmp	.L1556
.L1578:
	jmp	.L1685
.L1580:
	jmp	.L1685
.L1581:
	jmp	.L1685
.L1574:
	jmp	.L1685
.L1575:
	jmp	.L1685
.L1576:
	jmp	.L1685
.L1579:
	jmp	.L1685
.L1582:
	jmp	.L1685
.L1583:
	movq	384(%rbp), %rcx
	addq	$16, %r12
	movq	%rax, %rdi
	cmpq	%r12, %rcx
	je	.L1559
	call	_ZdlPv
.L1559:
	movq	448(%rbp), %rcx
	addq	$16, %rsi
	cmpq	%rsi, %rcx
	je	.L1560
	call	_ZdlPv
.L1560:
	movq	%rdi, %r12
	jmp	.L1517
.L1584:
	movq	384(%rbp), %rcx
	addq	$16, %r12
	movq	%rax, %rsi
	cmpq	%r12, %rcx
	je	.L1562
	call	_ZdlPv
.L1562:
	movq	416(%rbp), %rcx
	addq	$16, %rdi
	cmpq	%rdi, %rcx
	je	.L1563
	call	_ZdlPv
.L1563:
	movq	%rsi, %r12
	jmp	.L1517
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8644:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8644-.LLSDACSB8644
.LLSDACSB8644:
	.uleb128 .LEHB120-.LFB8644
	.uleb128 .LEHE120-.LEHB120
	.uleb128 .L1567-.LFB8644
	.uleb128 0
	.uleb128 .LEHB121-.LFB8644
	.uleb128 .LEHE121-.LEHB121
	.uleb128 .L1569-.LFB8644
	.uleb128 0
	.uleb128 .LEHB122-.LFB8644
	.uleb128 .LEHE122-.LEHB122
	.uleb128 .L1570-.LFB8644
	.uleb128 0
	.uleb128 .LEHB123-.LFB8644
	.uleb128 .LEHE123-.LEHB123
	.uleb128 .L1571-.LFB8644
	.uleb128 0
	.uleb128 .LEHB124-.LFB8644
	.uleb128 .LEHE124-.LEHB124
	.uleb128 .L1572-.LFB8644
	.uleb128 0
	.uleb128 .LEHB125-.LFB8644
	.uleb128 .LEHE125-.LEHB125
	.uleb128 .L1568-.LFB8644
	.uleb128 0
	.uleb128 .LEHB126-.LFB8644
	.uleb128 .LEHE126-.LEHB126
	.uleb128 .L1573-.LFB8644
	.uleb128 0
	.uleb128 .LEHB127-.LFB8644
	.uleb128 .LEHE127-.LEHB127
	.uleb128 .L1574-.LFB8644
	.uleb128 0
	.uleb128 .LEHB128-.LFB8644
	.uleb128 .LEHE128-.LEHB128
	.uleb128 .L1568-.LFB8644
	.uleb128 0
	.uleb128 .LEHB129-.LFB8644
	.uleb128 .LEHE129-.LEHB129
	.uleb128 .L1575-.LFB8644
	.uleb128 0
	.uleb128 .LEHB130-.LFB8644
	.uleb128 .LEHE130-.LEHB130
	.uleb128 .L1576-.LFB8644
	.uleb128 0
	.uleb128 .LEHB131-.LFB8644
	.uleb128 .LEHE131-.LEHB131
	.uleb128 .L1577-.LFB8644
	.uleb128 0
	.uleb128 .LEHB132-.LFB8644
	.uleb128 .LEHE132-.LEHB132
	.uleb128 .L1578-.LFB8644
	.uleb128 0
	.uleb128 .LEHB133-.LFB8644
	.uleb128 .LEHE133-.LEHB133
	.uleb128 .L1579-.LFB8644
	.uleb128 0
	.uleb128 .LEHB134-.LFB8644
	.uleb128 .LEHE134-.LEHB134
	.uleb128 .L1580-.LFB8644
	.uleb128 0
	.uleb128 .LEHB135-.LFB8644
	.uleb128 .LEHE135-.LEHB135
	.uleb128 .L1581-.LFB8644
	.uleb128 0
	.uleb128 .LEHB136-.LFB8644
	.uleb128 .LEHE136-.LEHB136
	.uleb128 .L1568-.LFB8644
	.uleb128 0
	.uleb128 .LEHB137-.LFB8644
	.uleb128 .LEHE137-.LEHB137
	.uleb128 .L1582-.LFB8644
	.uleb128 0
	.uleb128 .LEHB138-.LFB8644
	.uleb128 .LEHE138-.LEHB138
	.uleb128 .L1583-.LFB8644
	.uleb128 0
	.uleb128 .LEHB139-.LFB8644
	.uleb128 .LEHE139-.LEHB139
	.uleb128 .L1584-.LFB8644
	.uleb128 0
	.uleb128 .LEHB140-.LFB8644
	.uleb128 .LEHE140-.LEHB140
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB141-.LFB8644
	.uleb128 .LEHE141-.LEHB141
	.uleb128 .L1568-.LFB8644
	.uleb128 0
	.uleb128 .LEHB142-.LFB8644
	.uleb128 .LEHE142-.LEHB142
	.uleb128 0
	.uleb128 0
.LLSDACSE8644:
	.text
	.seh_endproc
	.section .rdata,"dr"
.LC41:
	.ascii "\\ttt{\0"
.LC42:
	.ascii "}\0"
	.align 8
.LC43:
	.ascii "Missing right backtick from text >>> %s <<<\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common16opp_markup2LatexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN7omnetpp6common16opp_markup2LatexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common16opp_markup2LatexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN7omnetpp6common16opp_markup2LatexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8645:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$152, %rsp
	.seh_stackalloc	152
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	16(%rcx), %rax
	movq	%rcx, %rdi
	movq	%rdx, 104(%rbp)
	movq	%rax, (%rcx)
	movq	(%rdx), %rsi
	movq	8(%rdx), %rbx
	movq	%rax, -72(%rbp)
	movq	%rsi, %rax
	addq	%rbx, %rax
	je	.L1719
	testq	%rsi, %rsi
	je	.L1768
.L1719:
	cmpq	$15, %rbx
	movq	%rbx, -16(%rbp)
	ja	.L1769
	cmpq	$1, %rbx
	jne	.L1722
	movzbl	(%rsi), %eax
	movb	%al, 16(%rdi)
	movq	-72(%rbp), %rax
.L1723:
	movq	%rbx, 8(%rdi)
	movb	$0, (%rax,%rbx)
	leaq	-16(%rbp), %rax
	xorl	%r13d, %r13d
	xorl	%esi, %esi
	movq	%rbp, %r15
	movq	%rax, -64(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	jmp	.L1738
	.p2align 4,,10
.L1771:
	cmpq	%r9, %rbx
	leaq	5(%rbx), %r12
	ja	.L1770
	leaq	.LC41(%rip), %r9
	movq	$5, 32(%rsp)
	movq	%rbx, %rdx
	movq	%rdi, %rcx
.LEHB143:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
	movq	%r12, %rsi
.L1727:
	movl	$1, %eax
	subl	%r13d, %eax
	movl	%eax, %r13d
.L1738:
	leaq	_ZZN7omnetpp6common16opp_markup2LatexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE9substring(%rip), %rdx
	movl	$1, %r9d
	movq	%rsi, %r8
	movq	%rdi, %rcx
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcyy
	cmpq	$-1, %rax
	movq	%rax, %rbx
	je	.L1724
	movq	8(%rdi), %r9
	movq	%r9, %r8
	subq	%rax, %r8
	movl	$1, %eax
	cmovne	%rax, %r8
	testl	%r13d, %r13d
	je	.L1771
	cmpq	%r9, %rbx
	ja	.L1772
	leaq	.LC42(%rip), %r9
	movq	$1, 32(%rsp)
	movq	%rbx, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
.LEHE143:
	movq	8(%rdi), %rsi
	subq	%r12, %rbx
	cmpq	%rsi, %r12
	ja	.L1773
	movq	(%rdi), %r14
	subq	%r12, %rsi
	movq	%r15, -16(%rbp)
	addq	%r12, %r14
	cmpq	%rbx, %rsi
	cmova	%rbx, %rsi
	movq	%r14, %rax
	addq	%rsi, %rax
	je	.L1730
	testq	%r14, %r14
	je	.L1774
.L1730:
	cmpq	$15, %rsi
	movq	%rsi, -48(%rbp)
	ja	.L1775
	cmpq	$1, %rsi
	jne	.L1733
	movzbl	(%r14), %eax
	movb	%al, 0(%rbp)
	movq	%r15, %rax
.L1734:
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	%rsi, -8(%rbp)
	movb	$0, (%rax,%rsi)
.LEHB144:
	call	_ZN7omnetpp6common21opp_latexInsertBreaksERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE144:
	movq	-16(%rbp), %rcx
	cmpq	%r15, %rcx
	je	.L1735
	call	_ZdlPv
.L1735:
	movq	-48(%rbp), %r14
	movq	%r14, %rcx
	call	strlen
	movq	8(%rdi), %r9
	leaq	1(%r12,%rax), %rsi
	movq	-40(%rbp), %rdx
	movq	%r9, %r8
	subq	%r12, %r8
	cmpq	%rbx, %r8
	cmova	%rbx, %r8
	cmpq	%r9, %r12
	ja	.L1776
	movq	%rdx, 32(%rsp)
	movq	%r14, %r9
	movq	%r12, %rdx
	movq	%rdi, %rcx
.LEHB145:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
.LEHE145:
	movq	-56(%rbp), %rax
	movq	-48(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L1727
	call	_ZdlPv
	jmp	.L1727
	.p2align 4,,10
.L1724:
	testl	%r13d, %r13d
	jne	.L1777
	movq	%rdi, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L1775:
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rcx
	xorl	%r8d, %r8d
.LEHB146:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE146:
	movq	-48(%rbp), %rdx
	movq	%rax, -16(%rbp)
	movq	%rdx, 0(%rbp)
.L1732:
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-48(%rbp), %rsi
	movq	-16(%rbp), %rax
	jmp	.L1734
	.p2align 4,,10
.L1733:
	testq	%rsi, %rsi
	movq	%r15, %rax
	je	.L1734
	jmp	.L1732
	.p2align 4,,10
.L1769:
	leaq	-16(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rdi, %rcx
.LEHB147:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE147:
	movq	-16(%rbp), %rdx
	movq	%rax, (%rdi)
	movq	%rdx, 16(%rdi)
.L1721:
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-16(%rbp), %rbx
	movq	(%rdi), %rax
	jmp	.L1723
	.p2align 4,,10
.L1722:
	testq	%rbx, %rbx
	movq	-72(%rbp), %rax
	je	.L1723
	jmp	.L1721
	.p2align 4,,10
.L1776:
	leaq	.LC4(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%r12, %r8
.LEHB148:
	call	_ZSt24__throw_out_of_range_fmtPKcz
.LEHE148:
.L1752:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	%rax, %rbx
	addq	$16, %rdx
	cmpq	%rdx, %rcx
	je	.L1742
.L1767:
	call	_ZdlPv
.L1742:
	movq	(%rdi), %rcx
	cmpq	%rcx, -72(%rbp)
	je	.L1746
	call	_ZdlPv
.L1746:
	movq	%rbx, %rcx
.LEHB149:
	call	_Unwind_Resume
.LEHE149:
	.p2align 4,,10
.L1770:
	leaq	.LC4(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rbx, %r8
.LEHB150:
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L1750:
	movq	%rax, %rbx
	jmp	.L1742
	.p2align 4,,10
.L1772:
	leaq	.LC4(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rbx, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L1773:
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rsi, %r9
	movq	%r12, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L1774:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.LEHE150:
.L1777:
	movl	$48, %ecx
	call	__cxa_allocate_exception
	movq	%rax, %rsi
	movq	104(%rbp), %rax
	leaq	.LC43(%rip), %rdx
	movq	%rsi, %rcx
	movq	(%rax), %r8
.LEHB151:
	call	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz
.LEHE151:
	leaq	_ZN7omnetpp6common17opp_runtime_errorD1Ev(%rip), %r8
	leaq	_ZTIN7omnetpp6common17opp_runtime_errorE(%rip), %rdx
	movq	%rsi, %rcx
.LEHB152:
	call	__cxa_throw
.LEHE152:
.L1768:
	leaq	.LC2(%rip), %rcx
.LEHB153:
	call	_ZSt19__throw_logic_errorPKc
.LEHE153:
.L1751:
	movq	-64(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	%rax, %rbx
	addq	$16, %rdx
	cmpq	%rdx, %rcx
	jne	.L1767
	jmp	.L1742
.L1753:
	movq	%rsi, %rcx
	movq	%rax, %rbx
	call	__cxa_free_exception
	jmp	.L1742
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8645:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8645-.LLSDACSB8645
.LLSDACSB8645:
	.uleb128 .LEHB143-.LFB8645
	.uleb128 .LEHE143-.LEHB143
	.uleb128 .L1750-.LFB8645
	.uleb128 0
	.uleb128 .LEHB144-.LFB8645
	.uleb128 .LEHE144-.LEHB144
	.uleb128 .L1751-.LFB8645
	.uleb128 0
	.uleb128 .LEHB145-.LFB8645
	.uleb128 .LEHE145-.LEHB145
	.uleb128 .L1752-.LFB8645
	.uleb128 0
	.uleb128 .LEHB146-.LFB8645
	.uleb128 .LEHE146-.LEHB146
	.uleb128 .L1750-.LFB8645
	.uleb128 0
	.uleb128 .LEHB147-.LFB8645
	.uleb128 .LEHE147-.LEHB147
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB148-.LFB8645
	.uleb128 .LEHE148-.LEHB148
	.uleb128 .L1752-.LFB8645
	.uleb128 0
	.uleb128 .LEHB149-.LFB8645
	.uleb128 .LEHE149-.LEHB149
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB150-.LFB8645
	.uleb128 .LEHE150-.LEHB150
	.uleb128 .L1750-.LFB8645
	.uleb128 0
	.uleb128 .LEHB151-.LFB8645
	.uleb128 .LEHE151-.LEHB151
	.uleb128 .L1753-.LFB8645
	.uleb128 0
	.uleb128 .LEHB152-.LFB8645
	.uleb128 .LEHE152-.LEHB152
	.uleb128 .L1750-.LFB8645
	.uleb128 0
	.uleb128 .LEHB153-.LFB8645
	.uleb128 .LEHE153-.LEHB153
	.uleb128 0
	.uleb128 0
.LLSDACSE8645:
	.text
	.seh_endproc
	.section	.text$_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
	.def	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev:
.LFB8893:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	8(%rcx), %rsi
	movq	(%rcx), %rbx
	movq	%rcx, %rdi
	cmpq	%rbx, %rsi
	je	.L1779
	.p2align 4,,10
.L1780:
	movq	(%rbx), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1781
	addq	$32, %rbx
	call	_ZdlPv
	cmpq	%rbx, %rsi
	jne	.L1780
.L1782:
	movq	(%rdi), %rbx
.L1779:
	testq	%rbx, %rbx
	je	.L1778
	movq	%rbx, %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	_ZdlPv
	.p2align 4,,10
.L1781:
	addq	$32, %rbx
	cmpq	%rbx, %rsi
	jne	.L1780
	jmp	.L1782
	.p2align 4,,10
.L1778:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	.def	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev:
.LFB8918:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	%rcx, %rbx
	addq	$16, %rax
	movq	%rax, (%rcx)
	movq	72(%rcx), %rcx
	leaq	88(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L1786
	call	_ZdlPv
.L1786:
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	leaq	56(%rbx), %rcx
	addq	$16, %rax
	movq	%rax, (%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	jmp	_ZNSt6localeD1Ev
	.seh_endproc
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common8opp_joinB5cxx11EPPKcS2_c
	.def	_ZN7omnetpp6common8opp_joinB5cxx11EPPKcS2_c;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common8opp_joinB5cxx11EPPKcS2_c
_ZN7omnetpp6common8opp_joinB5cxx11EPPKcS2_c:
.LFB8610:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$568, %rsp
	.seh_stackalloc	568
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	32(%rbp), %rsi
	movq	%rcx, %r13
	movq	%rdx, 520(%rbp)
	movq	%r8, 528(%rbp)
	movl	%r9d, %r12d
	leaq	128(%rsi), %rcx
	call	_ZNSt8ios_baseC2Ev
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rdi
	movb	$0, 384(%rbp)
	movq	$0, 376(%rbp)
	movb	$0, 385(%rbp)
	movq	$0, 392(%rbp)
	addq	$16, %rax
	movq	16(%rdi), %rbx
	movq	$0, 400(%rbp)
	movq	%rax, 160(%rbp)
	movq	24(%rdi), %rax
	movq	$0, 408(%rbp)
	movq	$0, 416(%rbp)
	movq	%rbx, 32(%rbp)
	movq	%rax, %rdx
	movq	%rax, -72(%rbp)
	movq	-24(%rbx), %rax
	movq	%rdx, 32(%rbp,%rax)
	movq	$0, 40(%rbp)
	xorl	%edx, %edx
	movq	-24(%rbx), %rcx
	addq	%rsi, %rcx
.LEHB154:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE154:
	movq	32(%rdi), %r14
	xorl	%edx, %edx
	movq	-24(%r14), %rax
	movq	%r14, 48(%rbp)
	leaq	16(%rsi,%rax), %rcx
	movq	40(%rdi), %rax
	movq	%rax, (%rcx)
	movq	%rax, -80(%rbp)
.LEHB155:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE155:
	movq	48(%rdi), %rax
	movq	8(%rdi), %r15
	leaq	80(%rsi), %rcx
	pxor	%xmm0, %xmm0
	movq	%rax, %rdx
	movq	%rax, -88(%rbp)
	movq	-24(%r15), %rax
	movq	%rdx, 32(%rbp,%rax)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 64(%rbp)
	addq	$24, %rax
	movaps	%xmm0, 80(%rbp)
	movq	%rax, 32(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 96(%rbp)
	addq	$104, %rax
	movq	%rax, 160(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$64, %rax
	movq	%rax, 48(%rbp)
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 56(%rbp)
	call	_ZNSt6localeC1Ev
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	leaq	24(%rsi), %rdx
	leaq	128(%rsi), %rcx
	movl	$24, 120(%rbp)
	movq	$0, 136(%rbp)
	movb	$0, 144(%rbp)
	addq	$16, %rax
	movq	%rax, 56(%rbp)
	leaq	112(%rsi), %rax
	movq	%rax, 128(%rbp)
.LEHB156:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE156:
	movq	520(%rbp), %rbx
	cmpq	$0, (%rbx)
	je	.L1802
	leaq	-50(%rbp), %rax
	leaq	16(%rsi), %r14
	movq	%rax, -80(%rbp)
	leaq	-49(%rbp), %rax
	movq	%rax, -88(%rbp)
.L1792:
	testb	%r12b, %r12b
	je	.L1798
.L1859:
	movq	-80(%rbp), %rdx
	movl	$1, %r8d
	movq	%r14, %rcx
	movb	%r12b, -50(%rbp)
.LEHB157:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	(%rbx), %rdx
	movq	%rax, %r15
	testq	%rdx, %rdx
	je	.L1857
	movq	%rdx, %rcx
	movq	%rdx, -72(%rbp)
	call	strlen
	movq	-72(%rbp), %rdx
	movq	%rax, %r8
	movq	%r15, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.L1801:
	movq	-88(%rbp), %rdx
	movl	$1, %r8d
	movq	%r15, %rcx
	movb	%r12b, -49(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.L1800:
	addq	$8, %rbx
	cmpq	$0, (%rbx)
	je	.L1802
.L1854:
	cmpq	%rbx, 520(%rbp)
	je	.L1792
	cmpq	$0, 528(%rbp)
	je	.L1858
	movq	528(%rbp), %rcx
	call	strlen
	movq	528(%rbp), %rdx
	movq	%rax, %r8
	movq	%r14, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	testb	%r12b, %r12b
	jne	.L1859
.L1798:
	movq	(%rbx), %r15
	testq	%r15, %r15
	je	.L1860
	movq	%r15, %rcx
	call	strlen
	movq	%r15, %rdx
	movq	%rax, %r8
	movq	%r14, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	addq	$8, %rbx
	cmpq	$0, (%rbx)
	jne	.L1854
.L1802:
	movq	96(%rbp), %rax
	leaq	16(%r13), %r14
	movq	$0, 8(%r13)
	movb	$0, 16(%r13)
	movq	%r14, 0(%r13)
	testq	%rax, %rax
	je	.L1861
	movq	80(%rbp), %rbx
	movq	88(%rbp), %r12
	cmpq	%rbx, %rax
	ja	.L1862
	leaq	-32(%rbp), %r15
	testq	%r12, %r12
	leaq	16(%r15), %rax
	movq	%rax, -32(%rbp)
	jne	.L1817
	testq	%rbx, %rbx
	jne	.L1863
.L1817:
	subq	%r12, %rbx
	cmpq	$15, %rbx
	movq	%rbx, -40(%rbp)
	ja	.L1864
	cmpq	$1, %rbx
	jne	.L1820
	movzbl	(%r12), %eax
	movb	%al, -16(%rbp)
	leaq	16(%r15), %rax
.L1821:
	movq	%rbx, -24(%rbp)
	movb	$0, (%rax,%rbx)
	leaq	16(%r15), %rcx
	movq	-32(%rbp), %rdx
	movq	0(%r13), %rax
	cmpq	%rcx, %rdx
	je	.L1822
	cmpq	%rax, %r14
	movq	-24(%rbp), %r8
	movq	-16(%rbp), %rcx
	je	.L1865
	testq	%rax, %rax
	movq	16(%r13), %r9
	movq	%rdx, 0(%r13)
	movq	%r8, 8(%r13)
	movq	%rcx, 16(%r13)
	je	.L1824
	movq	%rax, -32(%rbp)
	movq	%r9, -16(%rbp)
.L1825:
	movq	$0, -24(%rbp)
	movb	$0, (%rax)
	addq	$16, %r15
	movq	-32(%rbp), %rcx
	cmpq	%r15, %rcx
	jne	.L1856
	jmp	.L1816
	.p2align 4,,10
.L1858:
	movq	48(%rbp), %rax
	movq	-24(%rax), %rcx
	addq	%r14, %rcx
	movl	32(%rcx), %edx
	orl	$1, %edx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
	jmp	.L1792
	.p2align 4,,10
.L1860:
	movq	48(%rbp), %rax
	movq	-24(%rax), %rcx
	addq	%r14, %rcx
	movl	32(%rcx), %edx
	orl	$1, %edx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
	jmp	.L1800
	.p2align 4,,10
.L1857:
	movq	(%rax), %rax
	movq	-24(%rax), %rcx
	addq	%r15, %rcx
	movl	32(%rcx), %edx
	orl	$1, %edx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE157:
	jmp	.L1801
	.p2align 4,,10
.L1862:
	leaq	16(%rbp), %rdx
	testq	%r12, %r12
	movq	%rbp, %r15
	movq	%rdx, 0(%rbp)
	je	.L1866
	subq	%r12, %rax
	cmpq	$15, %rax
	movq	%rax, %rbx
	movq	%rax, -48(%rbp)
	ja	.L1867
	cmpq	$1, %rax
	jne	.L1809
	movzbl	(%r12), %eax
	movb	%al, 16(%rbp)
.L1810:
	movq	%rbx, 8(%rbp)
	movb	$0, (%rdx,%rbx)
	leaq	16(%r15), %rcx
	movq	0(%rbp), %rdx
	movq	0(%r13), %rax
	cmpq	%rcx, %rdx
	je	.L1811
	cmpq	%rax, %r14
	movq	8(%rbp), %r8
	movq	16(%rbp), %rcx
	je	.L1868
	testq	%rax, %rax
	movq	16(%r13), %r9
	movq	%rdx, 0(%r13)
	movq	%r8, 8(%r13)
	movq	%rcx, 16(%r13)
	je	.L1813
	movq	%rax, 0(%rbp)
	movq	%r9, 16(%rbp)
.L1814:
	movq	$0, 8(%rbp)
	movb	$0, (%rax)
	addq	$16, %r15
	movq	0(%rbp), %rcx
	cmpq	%r15, %rcx
	je	.L1816
.L1856:
	call	_ZdlPv
.L1816:
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rbx
	movq	128(%rbp), %rcx
	addq	$24, %rax
	addq	$64, %rbx
	movq	%rax, 32(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	%rbx, -72(%rbp)
	movq	-72(%rbp), %xmm0
	addq	$104, %rax
	movq	%rax, 160(%rbp)
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, -72(%rbp)
	leaq	112(%rsi), %rax
	movhps	-72(%rbp), %xmm0
	cmpq	%rax, %rcx
	movaps	%xmm0, 48(%rbp)
	je	.L1830
	call	_ZdlPv
.L1830:
	leaq	80(%rsi), %rcx
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 56(%rbp)
	call	_ZNSt6localeD1Ev
	movq	8(%rdi), %rax
	movq	48(%rdi), %rdx
	leaq	128(%rsi), %rcx
	movq	-24(%rax), %rax
	movq	%rdx, 32(%rbp,%rax)
	movq	32(%rdi), %rax
	movq	40(%rdi), %rdx
	movq	%rax, 48(%rbp)
	movq	-24(%rax), %rax
	movq	%rdx, 48(%rbp,%rax)
	movq	16(%rdi), %rax
	movq	24(%rdi), %rdx
	movq	%rax, 32(%rbp)
	movq	-24(%rax), %rax
	movq	%rdx, 32(%rbp,%rax)
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 40(%rbp)
	addq	$16, %rax
	movq	%rax, 160(%rbp)
	call	_ZNSt8ios_baseD2Ev
	movq	%r13, %rax
	addq	$568, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L1820:
	testq	%rbx, %rbx
	leaq	16(%r15), %rax
	je	.L1821
	jmp	.L1819
	.p2align 4,,10
.L1809:
	testq	%rax, %rax
	je	.L1810
	movq	%rdx, %rax
	jmp	.L1808
	.p2align 4,,10
.L1861:
	leaq	96(%rsi), %rdx
	movq	%r13, %rcx
.LEHB158:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	jmp	.L1816
	.p2align 4,,10
.L1864:
	leaq	-40(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-40(%rbp), %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -16(%rbp)
.L1819:
	movq	%rbx, %r8
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-40(%rbp), %rbx
	movq	-32(%rbp), %rax
	jmp	.L1821
	.p2align 4,,10
.L1867:
	leaq	-48(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rbp, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE158:
	movq	-48(%rbp), %rdx
	movq	%rax, 0(%rbp)
	movq	%rdx, 16(%rbp)
.L1808:
	movq	%rbx, %r8
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-48(%rbp), %rbx
	movq	0(%rbp), %rdx
	jmp	.L1810
	.p2align 4,,10
.L1868:
	movq	%rdx, 0(%r13)
	movq	%r8, 8(%r13)
	movq	%rcx, 16(%r13)
.L1813:
	leaq	16(%r15), %rax
	movq	%rax, 0(%rbp)
	jmp	.L1814
	.p2align 4,,10
.L1865:
	movq	%rdx, 0(%r13)
	movq	%r8, 8(%r13)
	movq	%rcx, 16(%r13)
.L1824:
	leaq	16(%r15), %rax
	movq	%rax, -32(%rbp)
	jmp	.L1825
	.p2align 4,,10
.L1811:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	0(%rbp), %rax
	jmp	.L1814
	.p2align 4,,10
.L1822:
	movq	%r15, %rdx
	movq	%r13, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	-32(%rbp), %rax
	jmp	.L1825
.L1837:
	movq	-24(%rbx), %rdx
	movq	-72(%rbp), %rdi
	movq	%rbx, 32(%rbp)
	movq	%rdi, 32(%rbp,%rdx)
	movq	$0, 40(%rbp)
	movq	%rax, %rdi
.L1790:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	leaq	128(%rsi), %rcx
	addq	$16, %rax
	movq	%rax, 160(%rbp)
	call	_ZNSt8ios_baseD2Ev
	movq	%rdi, %rcx
.LEHB159:
	call	_Unwind_Resume
.L1835:
	movq	%rax, %rdi
	jmp	.L1790
.L1834:
	movq	%rax, %rbx
.L1829:
	movq	%rsi, %rcx
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rcx
	call	_Unwind_Resume
.LEHE159:
.L1836:
	leaq	24(%rsi), %rcx
	movq	%rax, %rdi
	call	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	movq	-24(%r15), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, 32(%rbp,%rax)
	movq	-24(%r14), %rax
	movq	-80(%rbp), %rdx
	movq	%r14, 48(%rbp)
	movq	%rdx, 48(%rbp,%rax)
	movq	-24(%rbx), %rax
	movq	%rbx, 32(%rbp)
	movq	-72(%rbp), %rbx
	movq	%rbx, 32(%rbp,%rax)
	movq	$0, 40(%rbp)
	jmp	.L1790
.L1866:
	leaq	.LC2(%rip), %rcx
.LEHB160:
	call	_ZSt19__throw_logic_errorPKc
.L1863:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.LEHE160:
.L1838:
	movq	0(%r13), %rcx
	movq	%rax, %rbx
	cmpq	%rcx, %r14
	je	.L1829
	call	_ZdlPv
	jmp	.L1829
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8610:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8610-.LLSDACSB8610
.LLSDACSB8610:
	.uleb128 .LEHB154-.LFB8610
	.uleb128 .LEHE154-.LEHB154
	.uleb128 .L1835-.LFB8610
	.uleb128 0
	.uleb128 .LEHB155-.LFB8610
	.uleb128 .LEHE155-.LEHB155
	.uleb128 .L1837-.LFB8610
	.uleb128 0
	.uleb128 .LEHB156-.LFB8610
	.uleb128 .LEHE156-.LEHB156
	.uleb128 .L1836-.LFB8610
	.uleb128 0
	.uleb128 .LEHB157-.LFB8610
	.uleb128 .LEHE157-.LEHB157
	.uleb128 .L1834-.LFB8610
	.uleb128 0
	.uleb128 .LEHB158-.LFB8610
	.uleb128 .LEHE158-.LEHB158
	.uleb128 .L1838-.LFB8610
	.uleb128 0
	.uleb128 .LEHB159-.LFB8610
	.uleb128 .LEHE159-.LEHB159
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB160-.LFB8610
	.uleb128 .LEHE160-.LEHB160
	.uleb128 .L1838-.LFB8610
	.uleb128 0
.LLSDACSE8610:
	.text
	.seh_endproc
	.section .rdata,"dr"
.LC44:
	.ascii "_\0"
.LC45:
	.ascii "#_\0"
.LC46:
	.ascii "##\0"
.LC47:
	.ascii "#\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common18opp_filenameencodeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN7omnetpp6common18opp_filenameencodeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common18opp_filenameencodeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN7omnetpp6common18opp_filenameencodeERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8636:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$600, %rsp
	.seh_stackalloc	600
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	64(%rbp), %rdi
	movq	%rcx, %r14
	movq	%rdx, %rbx
	leaq	128(%rdi), %rcx
	call	_ZNSt8ios_baseC2Ev
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %r12
	xorl	%edx, %edx
	movb	$0, 416(%rbp)
	movq	$0, 408(%rbp)
	movb	$0, 417(%rbp)
	movq	$0, 424(%rbp)
	addq	$16, %rax
	movq	16(%r12), %r15
	movq	$0, 432(%rbp)
	movq	%rax, 192(%rbp)
	movq	24(%r12), %rax
	movq	$0, 440(%rbp)
	movq	$0, 448(%rbp)
	movq	%r15, 64(%rbp)
	movq	%rax, %rsi
	movq	%rax, -48(%rbp)
	movq	-24(%r15), %rax
	movq	%rsi, 64(%rbp,%rax)
	movq	$0, 72(%rbp)
	movq	-24(%r15), %rcx
	addq	%rdi, %rcx
.LEHB161:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE161:
	movq	32(%r12), %rax
	xorl	%edx, %edx
	movq	%rax, 80(%rbp)
	movq	%rax, -72(%rbp)
	movq	-24(%rax), %rax
	leaq	16(%rdi,%rax), %rcx
	movq	40(%r12), %rax
	movq	%rax, (%rcx)
	movq	%rax, -80(%rbp)
.LEHB162:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE162:
	movq	8(%r12), %rax
	movq	48(%r12), %rsi
	leaq	80(%rdi), %rcx
	pxor	%xmm0, %xmm0
	movq	%rax, -56(%rbp)
	movq	-24(%rax), %rax
	movq	%rsi, -64(%rbp)
	movq	%rsi, 64(%rbp,%rax)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 96(%rbp)
	addq	$24, %rax
	movaps	%xmm0, 112(%rbp)
	movq	%rax, 64(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 128(%rbp)
	addq	$104, %rax
	movq	%rax, 192(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$64, %rax
	movq	%rax, 80(%rbp)
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 88(%rbp)
	call	_ZNSt6localeC1Ev
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	leaq	24(%rdi), %rdx
	leaq	128(%rdi), %rcx
	movl	$24, 152(%rbp)
	movq	$0, 168(%rbp)
	movb	$0, 176(%rbp)
	addq	$16, %rax
	movq	%rax, 88(%rbp)
	leaq	112(%rdi), %rax
	movq	%rax, 160(%rbp)
.LEHB163:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE163:
	movq	(%rbx), %rsi
	movq	8(%rbx), %rax
	addq	%rsi, %rax
	cmpq	%rsi, %rax
	movq	%rax, -40(%rbp)
	je	.L1874
	leaq	-17(%rbp), %rax
	leaq	16(%rdi), %r13
	movq	%rax, -88(%rbp)
	jmp	.L1876
	.p2align 4,,10
.L1875:
	cmpb	$95, %bl
	je	.L1932
	cmpb	$35, %bl
	je	.L1933
	leal	-32(%rbx), %eax
	cmpb	$94, %al
	ja	.L1880
	leaq	.LC0(%rip), %rcx
	movsbl	%bl, %edx
	call	strchr
	testq	%rax, %rax
	je	.L1881
.L1880:
	leaq	.LC47(%rip), %rdx
	movl	$1, %r8d
	movq	%r13, %rcx
.LEHB164:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	80(%rbp), %rax
	movq	%r13, %rcx
	movq	-24(%rax), %rdx
	addq	%r13, %rdx
	movl	24(%rdx), %eax
	movq	$2, 16(%rdx)
	andl	$-75, %eax
	orl	$8, %eax
	movl	%eax, 24(%rdx)
	movsbl	%bl, %edx
	call	_ZNSolsEi
.L1878:
	addq	$1, %rsi
	cmpq	%rsi, -40(%rbp)
	je	.L1874
.L1876:
	movzbl	(%rsi), %ebx
	cmpb	$32, %bl
	jne	.L1875
	leaq	.LC44(%rip), %rdx
	movl	$1, %r8d
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	addq	$1, %rsi
	cmpq	%rsi, -40(%rbp)
	jne	.L1876
	.p2align 4,,10
.L1874:
	movq	128(%rbp), %rax
	leaq	16(%r14), %rbx
	movq	$0, 8(%r14)
	movb	$0, 16(%r14)
	movq	%rbx, (%r14)
	testq	%rax, %rax
	je	.L1882
	movq	112(%rbp), %rsi
	movq	120(%rbp), %r13
	cmpq	%rsi, %rax
	ja	.L1934
	leaq	16(%rbp), %rax
	testq	%r13, %r13
	movq	%rbp, %r15
	movq	%rax, 0(%rbp)
	jne	.L1895
	testq	%rsi, %rsi
	jne	.L1935
.L1895:
	subq	%r13, %rsi
	cmpq	$15, %rsi
	movq	%rsi, -8(%rbp)
	ja	.L1936
	cmpq	$1, %rsi
	jne	.L1898
	movzbl	0(%r13), %eax
	movb	%al, 16(%rbp)
	leaq	16(%r15), %rax
.L1899:
	movq	%rsi, 8(%rbp)
	movb	$0, (%rax,%rsi)
	leaq	16(%r15), %rcx
	movq	0(%rbp), %rdx
	movq	(%r14), %rax
	cmpq	%rcx, %rdx
	je	.L1900
	cmpq	%rax, %rbx
	movq	8(%rbp), %r8
	movq	16(%rbp), %rcx
	je	.L1937
	testq	%rax, %rax
	movq	16(%r14), %r9
	movq	%rdx, (%r14)
	movq	%r8, 8(%r14)
	movq	%rcx, 16(%r14)
	je	.L1902
	movq	%rax, 0(%rbp)
	movq	%r9, 16(%rbp)
.L1903:
	movq	$0, 8(%rbp)
	movb	$0, (%rax)
	addq	$16, %r15
	movq	0(%rbp), %rcx
	cmpq	%r15, %rcx
	jne	.L1931
	jmp	.L1904
	.p2align 4,,10
.L1932:
	leaq	.LC45(%rip), %rdx
	movl	$2, %r8d
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	jmp	.L1878
	.p2align 4,,10
.L1933:
	leaq	.LC46(%rip), %rdx
	movl	$2, %r8d
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	jmp	.L1878
	.p2align 4,,10
.L1934:
	leaq	32(%rbp), %r15
	testq	%r13, %r13
	leaq	16(%r15), %rdx
	movq	%rdx, 32(%rbp)
	je	.L1938
	subq	%r13, %rax
	cmpq	$15, %rax
	movq	%rax, %rsi
	movq	%rax, -16(%rbp)
	ja	.L1939
	cmpq	$1, %rax
	jne	.L1887
	movzbl	0(%r13), %eax
	movb	%al, 48(%rbp)
.L1888:
	movq	%rsi, 40(%rbp)
	movb	$0, (%rdx,%rsi)
	leaq	16(%r15), %rcx
	movq	32(%rbp), %rdx
	movq	(%r14), %rax
	cmpq	%rcx, %rdx
	je	.L1889
	cmpq	%rax, %rbx
	movq	48(%rbp), %rcx
	movq	40(%rbp), %r8
	je	.L1940
	testq	%rax, %rax
	movq	16(%r14), %r9
	movq	%rdx, (%r14)
	movq	%r8, 8(%r14)
	movq	%rcx, 16(%r14)
	je	.L1891
	movq	%rax, 32(%rbp)
	movq	%r9, 48(%rbp)
.L1892:
	movq	$0, 40(%rbp)
	movb	$0, (%rax)
	addq	$16, %r15
	movq	32(%rbp), %rcx
	cmpq	%r15, %rcx
	je	.L1904
.L1931:
	call	_ZdlPv
.L1904:
	movq	8(%r12), %rax
	movq	16(%r12), %r15
	movq	%rax, -56(%rbp)
	movq	48(%r12), %rax
	movq	%rax, -64(%rbp)
	movq	32(%r12), %rax
	movq	%rax, -72(%rbp)
	movq	40(%r12), %rax
	movq	%rax, -80(%rbp)
	movq	24(%r12), %rax
	movq	%rax, -48(%rbp)
.L1894:
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rbx
	movq	160(%rbp), %rcx
	addq	$24, %rax
	addq	$64, %rbx
	movq	%rax, 64(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	%rbx, -40(%rbp)
	movq	-40(%rbp), %xmm0
	addq	$104, %rax
	movq	%rax, 192(%rbp)
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, -40(%rbp)
	leaq	112(%rdi), %rax
	movhps	-40(%rbp), %xmm0
	cmpq	%rax, %rcx
	movaps	%xmm0, 80(%rbp)
	je	.L1908
	call	_ZdlPv
.L1908:
	leaq	80(%rdi), %rcx
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 88(%rbp)
	call	_ZNSt6localeD1Ev
	movq	-56(%rbp), %rax
	movq	-64(%rbp), %rbx
	leaq	128(%rdi), %rcx
	movq	-24(%rax), %rax
	movq	%rbx, 64(%rbp,%rax)
	movq	-72(%rbp), %rax
	movq	-80(%rbp), %rbx
	movq	%rax, 80(%rbp)
	movq	-24(%rax), %rax
	movq	%rbx, 80(%rbp,%rax)
	movq	-24(%r15), %rax
	movq	-48(%rbp), %rbx
	movq	%r15, 64(%rbp)
	movq	%rbx, 64(%rbp,%rax)
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 72(%rbp)
	addq	$16, %rax
	movq	%rax, 192(%rbp)
	call	_ZNSt8ios_baseD2Ev
	movq	%r14, %rax
	addq	$600, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L1881:
	movq	-88(%rbp), %rdx
	movl	$1, %r8d
	movq	%r13, %rcx
	movb	%bl, -17(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE164:
	jmp	.L1878
	.p2align 4,,10
.L1898:
	testq	%rsi, %rsi
	leaq	16(%r15), %rax
	je	.L1899
	jmp	.L1897
	.p2align 4,,10
.L1887:
	testq	%rax, %rax
	je	.L1888
	movq	%rdx, %rax
	jmp	.L1886
	.p2align 4,,10
.L1882:
	leaq	96(%rdi), %rdx
	movq	%r14, %rcx
.LEHB165:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	jmp	.L1894
	.p2align 4,,10
.L1936:
	leaq	-8(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-8(%rbp), %rdx
	movq	%rax, 0(%rbp)
	movq	%rdx, 16(%rbp)
.L1897:
	movq	%rsi, %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-8(%rbp), %rsi
	movq	0(%rbp), %rax
	jmp	.L1899
	.p2align 4,,10
.L1939:
	leaq	-16(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE165:
	movq	-16(%rbp), %rdx
	movq	%rax, 32(%rbp)
	movq	%rdx, 48(%rbp)
.L1886:
	movq	%rsi, %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-16(%rbp), %rsi
	movq	32(%rbp), %rdx
	jmp	.L1888
	.p2align 4,,10
.L1940:
	movq	%rdx, (%r14)
	movq	%r8, 8(%r14)
	movq	%rcx, 16(%r14)
.L1891:
	leaq	16(%r15), %rax
	movq	%rax, 32(%rbp)
	jmp	.L1892
	.p2align 4,,10
.L1937:
	movq	%rdx, (%r14)
	movq	%r8, 8(%r14)
	movq	%rcx, 16(%r14)
.L1902:
	leaq	16(%r15), %rax
	movq	%rax, 0(%rbp)
	jmp	.L1903
	.p2align 4,,10
.L1889:
	movq	%r15, %rdx
	movq	%r14, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	32(%rbp), %rax
	jmp	.L1892
	.p2align 4,,10
.L1900:
	movq	%r15, %rdx
	movq	%r14, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	0(%rbp), %rax
	jmp	.L1903
.L1914:
	movq	-24(%r15), %rdx
	movq	-48(%rbp), %rsi
	movq	%rax, %rbx
	movq	%r15, 64(%rbp)
	movq	%rsi, 64(%rbp,%rdx)
	movq	$0, 72(%rbp)
.L1872:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	leaq	128(%rdi), %rcx
	addq	$16, %rax
	movq	%rax, 192(%rbp)
	call	_ZNSt8ios_baseD2Ev
	movq	%rbx, %rcx
.LEHB166:
	call	_Unwind_Resume
.L1912:
	movq	%rax, %rbx
	jmp	.L1872
.L1913:
	leaq	24(%rdi), %rcx
	movq	%rax, %rbx
	call	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	movq	-56(%rbp), %rax
	movq	-64(%rbp), %rsi
	movq	-24(%rax), %rax
	movq	%rsi, 64(%rbp,%rax)
	movq	-72(%rbp), %rax
	movq	-80(%rbp), %rsi
	movq	%rax, 80(%rbp)
	movq	-24(%rax), %rax
	movq	%rsi, 80(%rbp,%rax)
	movq	-24(%r15), %rax
	movq	-48(%rbp), %rsi
	movq	%r15, 64(%rbp)
	movq	%rsi, 64(%rbp,%rax)
	movq	$0, 72(%rbp)
	jmp	.L1872
.L1911:
	movq	%rax, %rsi
.L1907:
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev
	movq	%rsi, %rcx
	call	_Unwind_Resume
.LEHE166:
.L1938:
	leaq	.LC2(%rip), %rcx
.LEHB167:
	call	_ZSt19__throw_logic_errorPKc
.L1935:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.LEHE167:
.L1915:
	movq	(%r14), %rcx
	movq	%rax, %rsi
	cmpq	%rcx, %rbx
	je	.L1907
	call	_ZdlPv
	jmp	.L1907
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8636:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8636-.LLSDACSB8636
.LLSDACSB8636:
	.uleb128 .LEHB161-.LFB8636
	.uleb128 .LEHE161-.LEHB161
	.uleb128 .L1912-.LFB8636
	.uleb128 0
	.uleb128 .LEHB162-.LFB8636
	.uleb128 .LEHE162-.LEHB162
	.uleb128 .L1914-.LFB8636
	.uleb128 0
	.uleb128 .LEHB163-.LFB8636
	.uleb128 .LEHE163-.LEHB163
	.uleb128 .L1913-.LFB8636
	.uleb128 0
	.uleb128 .LEHB164-.LFB8636
	.uleb128 .LEHE164-.LEHB164
	.uleb128 .L1911-.LFB8636
	.uleb128 0
	.uleb128 .LEHB165-.LFB8636
	.uleb128 .LEHE165-.LEHB165
	.uleb128 .L1915-.LFB8636
	.uleb128 0
	.uleb128 .LEHB166-.LFB8636
	.uleb128 .LEHE166-.LEHB166
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB167-.LFB8636
	.uleb128 .LEHE167-.LEHB167
	.uleb128 .L1915-.LFB8636
	.uleb128 0
.LLSDACSE8636:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common8opp_joinERKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS7_EEPKcc
	.def	_ZN7omnetpp6common8opp_joinERKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS7_EEPKcc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common8opp_joinERKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS7_EEPKcc
_ZN7omnetpp6common8opp_joinERKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS7_EEPKcc:
.LFB8611:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$584, %rsp
	.seh_stackalloc	584
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	48(%rbp), %r12
	movq	%rcx, 528(%rbp)
	movq	%rdx, %rdi
	movq	%r8, 544(%rbp)
	movb	%r9b, -56(%rbp)
	leaq	128(%r12), %rcx
	call	_ZNSt8ios_baseC2Ev
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %r15
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	xorl	%edx, %edx
	movb	$0, 400(%rbp)
	movq	$0, 392(%rbp)
	movb	$0, 401(%rbp)
	movq	$0, 408(%rbp)
	movq	16(%r15), %rbx
	addq	$16, %rax
	movq	24(%r15), %r14
	movq	%rax, 176(%rbp)
	movq	$0, 416(%rbp)
	movq	$0, 424(%rbp)
	movq	$0, 432(%rbp)
	movq	-24(%rbx), %rax
	movq	%rbx, 48(%rbp)
	movq	%r14, 48(%rbp,%rax)
	movq	$0, 56(%rbp)
	movq	-24(%rbx), %rcx
	addq	%r12, %rcx
.LEHB168:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE168:
	movq	32(%r15), %rsi
	xorl	%edx, %edx
	movq	-24(%rsi), %rax
	movq	%rsi, 64(%rbp)
	leaq	16(%r12,%rax), %rcx
	movq	40(%r15), %rax
	movq	%rax, (%rcx)
	movq	%rax, -64(%rbp)
.LEHB169:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE169:
	movq	48(%r15), %rax
	movq	8(%r15), %r13
	leaq	80(%r12), %rcx
	pxor	%xmm0, %xmm0
	movq	%rax, %rdx
	movq	%rax, -72(%rbp)
	movq	-24(%r13), %rax
	movq	%rdx, 48(%rbp,%rax)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 80(%rbp)
	addq	$24, %rax
	movaps	%xmm0, 96(%rbp)
	movq	%rax, 48(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 112(%rbp)
	addq	$104, %rax
	movq	%rax, 176(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$64, %rax
	movq	%rax, 64(%rbp)
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 72(%rbp)
	call	_ZNSt6localeC1Ev
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	leaq	24(%r12), %rdx
	leaq	128(%r12), %rcx
	movl	$24, 136(%rbp)
	movq	$0, 152(%rbp)
	movb	$0, 160(%rbp)
	addq	$16, %rax
	movq	%rax, 72(%rbp)
	leaq	112(%r12), %rax
	movq	%rax, 144(%rbp)
.LEHB170:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE170:
	movq	8(%rdi), %rax
	movq	(%rdi), %rsi
	cmpq	%rax, %rsi
	movq	%rax, -64(%rbp)
	je	.L1966
	leaq	16(%rbp), %r14
	leaq	16(%r14), %rax
	movq	%rax, 16(%rbp)
	movq	(%rsi), %r13
	movq	8(%rsi), %rbx
	movq	%r13, %rax
	addq	%rbx, %rax
	je	.L1951
	testq	%r13, %r13
	je	.L1949
.L1951:
	leaq	-40(%rbp), %rax
	addq	$32, %rsi
	movl	$1, %edi
	movq	%rax, -88(%rbp)
	leaq	-42(%rbp), %rax
	movq	%rax, -72(%rbp)
	leaq	-41(%rbp), %rax
	movq	%rax, -80(%rbp)
	jmp	.L1952
	.p2align 4,,10
.L1958:
	movzbl	-56(%rbp), %edi
	movq	-72(%rbp), %rdx
	leaq	16(%r12), %rcx
	movl	$1, %r8d
	movb	%dil, -42(%rbp)
.LEHB171:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	24(%rbp), %r8
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	-80(%rbp), %rdx
	movl	$1, %r8d
	movq	%rax, %rcx
	movb	%dil, -41(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.L1964:
	movq	16(%rbp), %rcx
	leaq	16(%r14), %rax
	cmpq	%rax, %rcx
	je	.L1963
	call	_ZdlPv
.L1963:
	cmpq	%rsi, -64(%rbp)
	je	.L1966
	leaq	16(%r14), %rax
	movq	%rax, 16(%rbp)
	movq	(%rsi), %r13
	movq	8(%rsi), %rbx
	movq	%r13, %rax
	addq	%rbx, %rax
	setne	%dil
	testq	%r13, %r13
	sete	%al
	addq	$32, %rsi
	andb	%al, %dil
	jne	.L1949
.L1952:
	cmpq	$15, %rbx
	movq	%rbx, -40(%rbp)
	ja	.L2027
	cmpq	$1, %rbx
	jne	.L1955
	movzbl	0(%r13), %eax
	movb	%al, 32(%rbp)
	movq	16(%rbp), %rax
.L1956:
	testb	%dil, %dil
	movq	%rbx, 24(%rbp)
	movb	$0, (%rax,%rbx)
	je	.L1957
.L1961:
	cmpb	$0, -56(%rbp)
	jne	.L1958
	movq	24(%rbp), %r8
	movq	16(%rbp), %rdx
	leaq	16(%r12), %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	jmp	.L1964
	.p2align 4,,10
.L1957:
	cmpq	$0, 544(%rbp)
	je	.L2028
	movq	544(%rbp), %rcx
	call	strlen
	movq	544(%rbp), %rdx
	leaq	16(%r12), %rcx
	movq	%rax, %r8
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE171:
	jmp	.L1961
	.p2align 4,,10
.L2027:
	movq	-88(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r14, %rcx
.LEHB172:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE172:
	movq	-40(%rbp), %rdx
	movq	%rax, 16(%rbp)
	movq	%rdx, 32(%rbp)
.L1954:
	movq	%rbx, %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-40(%rbp), %rbx
	movq	16(%rbp), %rax
	jmp	.L1956
	.p2align 4,,10
.L1955:
	testq	%rbx, %rbx
	leaq	16(%r14), %rax
	je	.L1956
	jmp	.L1954
	.p2align 4,,10
.L1966:
	movq	528(%rbp), %rax
	leaq	16(%rax), %rdi
	movq	$0, 8(%rax)
	movb	$0, 16(%rax)
	movq	%rdi, (%rax)
	movq	112(%rbp), %rax
	testq	%rax, %rax
	je	.L2029
	movq	96(%rbp), %rbx
	movq	104(%rbp), %rsi
	cmpq	%rbx, %rax
	ja	.L2030
	leaq	-16(%rbp), %r13
	testq	%rbx, %rbx
	leaq	16(%r13), %rax
	movq	%rax, -16(%rbp)
	je	.L1979
	testq	%rsi, %rsi
	je	.L2031
.L1979:
	subq	%rsi, %rbx
	cmpq	$15, %rbx
	movq	%rbx, -24(%rbp)
	ja	.L2032
	cmpq	$1, %rbx
	jne	.L1982
	movzbl	(%rsi), %eax
	movb	%al, 0(%rbp)
	leaq	16(%r13), %rax
.L1983:
	movq	%rbx, -8(%rbp)
	movb	$0, (%rax,%rbx)
	leaq	16(%r13), %rcx
	movq	-16(%rbp), %rdx
	movq	528(%rbp), %rax
	cmpq	%rcx, %rdx
	movq	(%rax), %rax
	je	.L1984
	cmpq	%rax, %rdi
	movq	-8(%rbp), %r8
	movq	0(%rbp), %rcx
	je	.L2033
	movq	528(%rbp), %rsi
	testq	%rax, %rax
	movq	16(%rsi), %r9
	movq	%rdx, (%rsi)
	movq	%r8, 8(%rsi)
	movq	%rcx, 16(%rsi)
	je	.L1986
	movq	%rax, -16(%rbp)
	movq	%r9, 0(%rbp)
.L1987:
	movq	$0, -8(%rbp)
	movb	$0, (%rax)
	addq	$16, %r13
	movq	-16(%rbp), %rcx
	cmpq	%r13, %rcx
	jne	.L2025
	jmp	.L1978
	.p2align 4,,10
.L2028:
	movq	64(%rbp), %rax
	movq	-24(%rax), %rax
	leaq	16(%r12,%rax), %rcx
	movl	32(%rcx), %edx
	orl	$1, %edx
.LEHB173:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE173:
	jmp	.L1961
	.p2align 4,,10
.L2030:
	leaq	16(%rbp), %r14
	testq	%rsi, %rsi
	leaq	16(%r14), %rdx
	movq	%rdx, 16(%rbp)
	je	.L2034
	subq	%rsi, %rax
	cmpq	$15, %rax
	movq	%rax, %rbx
	movq	%rax, -32(%rbp)
	ja	.L2035
	cmpq	$1, %rax
	jne	.L1971
	movzbl	(%rsi), %eax
	movb	%al, 32(%rbp)
.L1972:
	movq	%rbx, 24(%rbp)
	movb	$0, (%rdx,%rbx)
	leaq	16(%r14), %rcx
	movq	16(%rbp), %rdx
	movq	528(%rbp), %rax
	cmpq	%rcx, %rdx
	movq	(%rax), %rax
	je	.L1973
	cmpq	%rax, %rdi
	movq	32(%rbp), %rcx
	movq	24(%rbp), %r8
	je	.L2036
	movq	528(%rbp), %rsi
	testq	%rax, %rax
	movq	16(%rsi), %r9
	movq	%rdx, (%rsi)
	movq	%r8, 8(%rsi)
	movq	%rcx, 16(%rsi)
	je	.L1975
	movq	%rax, 16(%rbp)
	movq	%r9, 32(%rbp)
.L1976:
	movq	$0, 24(%rbp)
	movb	$0, (%rax)
	addq	$16, %r14
	movq	16(%rbp), %rcx
	cmpq	%r14, %rcx
	je	.L1978
.L2025:
	call	_ZdlPv
.L1978:
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rsi
	movq	144(%rbp), %rcx
	addq	$24, %rax
	addq	$64, %rsi
	movq	%rax, 48(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	%rsi, -56(%rbp)
	movq	-56(%rbp), %xmm0
	addq	$104, %rax
	movq	%rax, 176(%rbp)
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, -56(%rbp)
	leaq	112(%r12), %rax
	movhps	-56(%rbp), %xmm0
	cmpq	%rax, %rcx
	movaps	%xmm0, 64(%rbp)
	je	.L1992
	call	_ZdlPv
.L1992:
	leaq	80(%r12), %rcx
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 72(%rbp)
	call	_ZNSt6localeD1Ev
	movq	8(%r15), %rax
	movq	48(%r15), %rdx
	leaq	128(%r12), %rcx
	movq	-24(%rax), %rax
	movq	%rdx, 48(%rbp,%rax)
	movq	32(%r15), %rax
	movq	40(%r15), %rdx
	movq	%rax, 64(%rbp)
	movq	-24(%rax), %rax
	movq	%rdx, 64(%rbp,%rax)
	movq	16(%r15), %rax
	movq	24(%r15), %rdx
	movq	%rax, 48(%rbp)
	movq	-24(%rax), %rax
	movq	%rdx, 48(%rbp,%rax)
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 56(%rbp)
	addq	$16, %rax
	movq	%rax, 176(%rbp)
	call	_ZNSt8ios_baseD2Ev
	movq	528(%rbp), %rax
	addq	$584, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L1982:
	testq	%rbx, %rbx
	leaq	16(%r13), %rax
	je	.L1983
	jmp	.L1981
	.p2align 4,,10
.L1971:
	testq	%rax, %rax
	je	.L1972
	movq	%rdx, %rax
	jmp	.L1970
	.p2align 4,,10
.L2029:
	movq	528(%rbp), %rcx
	leaq	96(%r12), %rdx
.LEHB174:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	jmp	.L1978
	.p2align 4,,10
.L2032:
	leaq	-24(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r13, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-24(%rbp), %rdx
	movq	%rax, -16(%rbp)
	movq	%rdx, 0(%rbp)
.L1981:
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-24(%rbp), %rbx
	movq	-16(%rbp), %rax
	jmp	.L1983
	.p2align 4,,10
.L2035:
	leaq	-32(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r14, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE174:
	movq	-32(%rbp), %rdx
	movq	%rax, 16(%rbp)
	movq	%rdx, 32(%rbp)
.L1970:
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-32(%rbp), %rbx
	movq	16(%rbp), %rdx
	jmp	.L1972
	.p2align 4,,10
.L2036:
	movq	528(%rbp), %rax
	movq	%rdx, (%rax)
	movq	%r8, 8(%rax)
	movq	%rcx, 16(%rax)
.L1975:
	leaq	16(%r14), %rax
	movq	%rax, 16(%rbp)
	jmp	.L1976
	.p2align 4,,10
.L2033:
	movq	528(%rbp), %rax
	movq	%rdx, (%rax)
	movq	%r8, 8(%rax)
	movq	%rcx, 16(%rax)
.L1986:
	leaq	16(%r13), %rax
	movq	%rax, -16(%rbp)
	jmp	.L1987
	.p2align 4,,10
.L1973:
	movq	528(%rbp), %rcx
	movq	%r14, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	16(%rbp), %rax
	jmp	.L1976
	.p2align 4,,10
.L1984:
	movq	528(%rbp), %rcx
	movq	%r13, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	-16(%rbp), %rax
	jmp	.L1987
.L1949:
	leaq	.LC2(%rip), %rcx
.LEHB175:
	call	_ZSt19__throw_logic_errorPKc
.LEHE175:
.L1999:
	movq	%rax, %rbx
.L1991:
	movq	%r12, %rcx
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rcx
.LEHB176:
	call	_Unwind_Resume
.L2002:
	movq	-24(%rbx), %rdx
	movq	%rbx, 48(%rbp)
	movq	%rax, %rdi
	movq	%r14, 48(%rbp,%rdx)
	movq	$0, 56(%rbp)
.L1944:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	leaq	128(%r12), %rcx
	addq	$16, %rax
	movq	%rax, 176(%rbp)
	call	_ZNSt8ios_baseD2Ev
	movq	%rdi, %rcx
	call	_Unwind_Resume
.LEHE176:
.L2000:
	movq	%rax, %rdi
	jmp	.L1944
.L2001:
	leaq	24(%r12), %rcx
	movq	%rax, %rdi
	call	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	movq	-24(%r13), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 48(%rbp,%rax)
	movq	-24(%rsi), %rax
	movq	%rsi, 64(%rbp)
	movq	-64(%rbp), %rsi
	movq	%rsi, 64(%rbp,%rax)
	movq	-24(%rbx), %rax
	movq	%rbx, 48(%rbp)
	movq	%r14, 48(%rbp,%rax)
	movq	$0, 56(%rbp)
	jmp	.L1944
.L2003:
	movq	%rax, %rbx
	movq	528(%rbp), %rax
	movq	(%rax), %rcx
	cmpq	%rcx, %rdi
	je	.L1991
.L2026:
	call	_ZdlPv
	jmp	.L1991
.L2034:
	leaq	.LC2(%rip), %rcx
.LEHB177:
	call	_ZSt19__throw_logic_errorPKc
.L2031:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.LEHE177:
.L1998:
	movq	16(%rbp), %rcx
	addq	$16, %r14
	movq	%rax, %rbx
	cmpq	%r14, %rcx
	jne	.L2026
	jmp	.L1991
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8611:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8611-.LLSDACSB8611
.LLSDACSB8611:
	.uleb128 .LEHB168-.LFB8611
	.uleb128 .LEHE168-.LEHB168
	.uleb128 .L2000-.LFB8611
	.uleb128 0
	.uleb128 .LEHB169-.LFB8611
	.uleb128 .LEHE169-.LEHB169
	.uleb128 .L2002-.LFB8611
	.uleb128 0
	.uleb128 .LEHB170-.LFB8611
	.uleb128 .LEHE170-.LEHB170
	.uleb128 .L2001-.LFB8611
	.uleb128 0
	.uleb128 .LEHB171-.LFB8611
	.uleb128 .LEHE171-.LEHB171
	.uleb128 .L1998-.LFB8611
	.uleb128 0
	.uleb128 .LEHB172-.LFB8611
	.uleb128 .LEHE172-.LEHB172
	.uleb128 .L1999-.LFB8611
	.uleb128 0
	.uleb128 .LEHB173-.LFB8611
	.uleb128 .LEHE173-.LEHB173
	.uleb128 .L1998-.LFB8611
	.uleb128 0
	.uleb128 .LEHB174-.LFB8611
	.uleb128 .LEHE174-.LEHB174
	.uleb128 .L2003-.LFB8611
	.uleb128 0
	.uleb128 .LEHB175-.LFB8611
	.uleb128 .LEHE175-.LEHB175
	.uleb128 .L1999-.LFB8611
	.uleb128 0
	.uleb128 .LEHB176-.LFB8611
	.uleb128 .LEHE176-.LEHB176
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB177-.LFB8611
	.uleb128 .LEHE177-.LEHB177
	.uleb128 .L2003-.LFB8611
	.uleb128 0
.LLSDACSE8611:
	.text
	.seh_endproc
	.section .rdata,"dr"
.LC48:
	.ascii "&lt;\0"
.LC49:
	.ascii "&gt;\0"
.LC50:
	.ascii "&amp;\0"
.LC51:
	.ascii "&quot;\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common12opp_xmlQuoteERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN7omnetpp6common12opp_xmlQuoteERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common12opp_xmlQuoteERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN7omnetpp6common12opp_xmlQuoteERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8646:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$584, %rsp
	.seh_stackalloc	584
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	(%rdx), %rsi
	movq	%rcx, %r12
	movq	%rdx, %rbx
	movl	$60, %edx
	movq	%rsi, %rcx
	call	strchr
	testq	%rax, %rax
	je	.L2121
.L2038:
	leaq	48(%rbp), %rsi
	leaq	128(%rsi), %rcx
	call	_ZNSt8ios_baseC2Ev
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rdi
	movb	$0, 400(%rbp)
	movq	$0, 392(%rbp)
	movb	$0, 401(%rbp)
	movq	$0, 408(%rbp)
	addq	$16, %rax
	movq	16(%rdi), %r13
	movq	$0, 416(%rbp)
	movq	%rax, 176(%rbp)
	movq	24(%rdi), %rax
	movq	$0, 424(%rbp)
	movq	$0, 432(%rbp)
	movq	%r13, 48(%rbp)
	movq	%rax, %rdx
	movq	%rax, -56(%rbp)
	movq	-24(%r13), %rax
	movq	%rdx, 48(%rbp,%rax)
	movq	$0, 56(%rbp)
	xorl	%edx, %edx
	movq	-24(%r13), %rcx
	addq	%rsi, %rcx
.LEHB178:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE178:
	movq	32(%rdi), %r15
	xorl	%edx, %edx
	movq	-24(%r15), %rax
	movq	%r15, 64(%rbp)
	leaq	16(%rsi,%rax), %rcx
	movq	40(%rdi), %rax
	movq	%rax, (%rcx)
	movq	%rax, -80(%rbp)
.LEHB179:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE179:
	movq	8(%rdi), %rax
	movq	48(%rdi), %rdx
	leaq	80(%rsi), %rcx
	pxor	%xmm0, %xmm0
	movq	%rax, -64(%rbp)
	movq	-24(%rax), %rax
	movq	%rdx, -72(%rbp)
	movq	%rdx, 48(%rbp,%rax)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 80(%rbp)
	addq	$24, %rax
	movaps	%xmm0, 96(%rbp)
	movq	%rax, 48(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 112(%rbp)
	addq	$104, %rax
	movq	%rax, 176(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$64, %rax
	movq	%rax, 64(%rbp)
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 72(%rbp)
	call	_ZNSt6localeC1Ev
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	leaq	24(%rsi), %rdx
	leaq	128(%rsi), %rcx
	movl	$24, 136(%rbp)
	movq	$0, 152(%rbp)
	movb	$0, 160(%rbp)
	addq	$16, %rax
	movq	%rax, 72(%rbp)
	leaq	112(%rsi), %rax
	movq	%rax, 144(%rbp)
.LEHB180:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE180:
	movq	(%rbx), %rbx
	movzbl	(%rbx), %eax
	testb	%al, %al
	je	.L2049
	leaq	-33(%rbp), %rdx
	leaq	16(%rsi), %r14
	movq	%rdx, -88(%rbp)
	jmp	.L2056
	.p2align 4,,10
.L2052:
	cmpb	$60, %al
	je	.L2054
	cmpb	$62, %al
	jne	.L2050
	leaq	.LC49(%rip), %rdx
	movl	$4, %r8d
	movq	%r14, %rcx
.LEHB181:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.L2057:
	addq	$1, %rbx
	movzbl	(%rbx), %eax
	testb	%al, %al
	je	.L2049
.L2056:
	cmpb	$38, %al
	je	.L2051
	jg	.L2052
	cmpb	$34, %al
	jne	.L2050
	leaq	.LC51(%rip), %rdx
	movl	$6, %r8d
	movq	%r14, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	addq	$1, %rbx
	movzbl	(%rbx), %eax
	testb	%al, %al
	jne	.L2056
	.p2align 4,,10
.L2049:
	movq	112(%rbp), %rax
	leaq	16(%r12), %rbx
	movq	$0, 8(%r12)
	movb	$0, 16(%r12)
	movq	%rbx, (%r12)
	testq	%rax, %rax
	je	.L2058
	movq	96(%rbp), %r13
	movq	104(%rbp), %r14
	cmpq	%r13, %rax
	ja	.L2122
	leaq	-16(%rbp), %r15
	testq	%r13, %r13
	leaq	16(%r15), %rax
	movq	%rax, -16(%rbp)
	je	.L2071
	testq	%r14, %r14
	je	.L2123
.L2071:
	subq	%r14, %r13
	cmpq	$15, %r13
	movq	%r13, -24(%rbp)
	ja	.L2124
	cmpq	$1, %r13
	jne	.L2074
	movzbl	(%r14), %eax
	movb	%al, 0(%rbp)
	leaq	16(%r15), %rax
.L2075:
	movq	%r13, -8(%rbp)
	movb	$0, (%rax,%r13)
	leaq	16(%r15), %rcx
	movq	-16(%rbp), %rdx
	movq	(%r12), %rax
	cmpq	%rcx, %rdx
	je	.L2076
	cmpq	%rax, %rbx
	movq	-8(%rbp), %r8
	movq	0(%rbp), %rcx
	je	.L2125
	testq	%rax, %rax
	movq	16(%r12), %r9
	movq	%rdx, (%r12)
	movq	%r8, 8(%r12)
	movq	%rcx, 16(%r12)
	je	.L2078
	movq	%rax, -16(%rbp)
	movq	%r9, 0(%rbp)
.L2079:
	movq	$0, -8(%rbp)
	movb	$0, (%rax)
	addq	$16, %r15
	movq	-16(%rbp), %rcx
	cmpq	%r15, %rcx
	jne	.L2120
	jmp	.L2080
	.p2align 4,,10
.L2051:
	leaq	.LC50(%rip), %rdx
	movl	$5, %r8d
	movq	%r14, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	jmp	.L2057
	.p2align 4,,10
.L2050:
	movq	-88(%rbp), %rdx
	movl	$1, %r8d
	movq	%r14, %rcx
	movb	%al, -33(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	jmp	.L2057
	.p2align 4,,10
.L2054:
	leaq	.LC48(%rip), %rdx
	movl	$4, %r8d
	movq	%r14, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE181:
	jmp	.L2057
	.p2align 4,,10
.L2122:
	leaq	16(%rbp), %r15
	testq	%r14, %r14
	leaq	16(%r15), %rdx
	movq	%rdx, 16(%rbp)
	je	.L2126
	subq	%r14, %rax
	cmpq	$15, %rax
	movq	%rax, %r13
	movq	%rax, -32(%rbp)
	ja	.L2127
	cmpq	$1, %rax
	jne	.L2063
	movzbl	(%r14), %eax
	movb	%al, 32(%rbp)
.L2064:
	movq	%r13, 24(%rbp)
	movb	$0, (%rdx,%r13)
	leaq	16(%r15), %rcx
	movq	16(%rbp), %rdx
	movq	(%r12), %rax
	cmpq	%rcx, %rdx
	je	.L2065
	cmpq	%rax, %rbx
	movq	32(%rbp), %rcx
	movq	24(%rbp), %r8
	je	.L2128
	testq	%rax, %rax
	movq	16(%r12), %r9
	movq	%rdx, (%r12)
	movq	%r8, 8(%r12)
	movq	%rcx, 16(%r12)
	je	.L2067
	movq	%rax, 16(%rbp)
	movq	%r9, 32(%rbp)
.L2068:
	movq	$0, 24(%rbp)
	movb	$0, (%rax)
	addq	$16, %r15
	movq	16(%rbp), %rcx
	cmpq	%r15, %rcx
	je	.L2080
.L2120:
	call	_ZdlPv
.L2080:
	movq	8(%rdi), %rax
	movq	32(%rdi), %r15
	movq	16(%rdi), %r13
	movq	%rax, -64(%rbp)
	movq	48(%rdi), %rax
	movq	%rax, -72(%rbp)
	movq	40(%rdi), %rax
	movq	%rax, -80(%rbp)
	movq	24(%rdi), %rax
	movq	%rax, -56(%rbp)
.L2070:
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rdi
	movq	144(%rbp), %rcx
	addq	$24, %rax
	addq	$64, %rdi
	movq	%rax, 48(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	%rdi, -88(%rbp)
	movq	-88(%rbp), %xmm0
	addq	$104, %rax
	movq	%rax, 176(%rbp)
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, -88(%rbp)
	leaq	112(%rsi), %rax
	movhps	-88(%rbp), %xmm0
	cmpq	%rax, %rcx
	movaps	%xmm0, 64(%rbp)
	je	.L2084
	call	_ZdlPv
.L2084:
	leaq	80(%rsi), %rcx
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 72(%rbp)
	call	_ZNSt6localeD1Ev
	movq	-64(%rbp), %rax
	movq	-72(%rbp), %rdi
	leaq	128(%rsi), %rcx
	movq	-56(%rbp), %rbx
	movq	-24(%rax), %rax
	movq	%rdi, 48(%rbp,%rax)
	movq	-24(%r15), %rax
	movq	-80(%rbp), %rdi
	movq	%r15, 64(%rbp)
	movq	%rdi, 64(%rbp,%rax)
	movq	-24(%r13), %rax
	movq	%r13, 48(%rbp)
	movq	%rbx, 48(%rbp,%rax)
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 56(%rbp)
	addq	$16, %rax
	movq	%rax, 176(%rbp)
	call	_ZNSt8ios_baseD2Ev
.L2037:
	movq	%r12, %rax
	addq	$584, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L2121:
	movl	$62, %edx
	movq	%rsi, %rcx
	call	strchr
	testq	%rax, %rax
	jne	.L2038
	movl	$38, %edx
	movq	%rsi, %rcx
	call	strchr
	testq	%rax, %rax
	jne	.L2038
	movl	$34, %edx
	movq	%rsi, %rcx
	call	strchr
	testq	%rax, %rax
	jne	.L2038
	leaq	16(%r12), %rax
	movq	%rax, (%r12)
	movq	(%rbx), %rsi
	movq	8(%rbx), %rbx
	movq	%rsi, %rdi
	addq	%rbx, %rdi
	je	.L2039
	testq	%rsi, %rsi
	je	.L2129
.L2039:
	cmpq	$15, %rbx
	movq	%rbx, 48(%rbp)
	ja	.L2130
	cmpq	$1, %rbx
	jne	.L2042
	movzbl	(%rsi), %edx
	movb	%dl, 16(%r12)
.L2043:
	movq	%rbx, 8(%r12)
	movb	$0, (%rax,%rbx)
	jmp	.L2037
	.p2align 4,,10
.L2074:
	testq	%r13, %r13
	leaq	16(%r15), %rax
	je	.L2075
	jmp	.L2073
	.p2align 4,,10
.L2063:
	testq	%rax, %rax
	je	.L2064
	movq	%rdx, %rax
	jmp	.L2062
	.p2align 4,,10
.L2058:
	leaq	96(%rsi), %rdx
	movq	%r12, %rcx
.LEHB182:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	jmp	.L2070
	.p2align 4,,10
.L2124:
	leaq	-24(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-24(%rbp), %rdx
	movq	%rax, -16(%rbp)
	movq	%rdx, 0(%rbp)
.L2073:
	movq	%r13, %r8
	movq	%r14, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-24(%rbp), %r13
	movq	-16(%rbp), %rax
	jmp	.L2075
	.p2align 4,,10
.L2127:
	leaq	-32(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r15, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE182:
	movq	-32(%rbp), %rdx
	movq	%rax, 16(%rbp)
	movq	%rdx, 32(%rbp)
.L2062:
	movq	%r13, %r8
	movq	%r14, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-32(%rbp), %r13
	movq	16(%rbp), %rdx
	jmp	.L2064
	.p2align 4,,10
.L2128:
	movq	%rdx, (%r12)
	movq	%r8, 8(%r12)
	movq	%rcx, 16(%r12)
.L2067:
	leaq	16(%r15), %rax
	movq	%rax, 16(%rbp)
	jmp	.L2068
	.p2align 4,,10
.L2125:
	movq	%rdx, (%r12)
	movq	%r8, 8(%r12)
	movq	%rcx, 16(%r12)
.L2078:
	leaq	16(%r15), %rax
	movq	%rax, -16(%rbp)
	jmp	.L2079
	.p2align 4,,10
.L2065:
	movq	%r15, %rdx
	movq	%r12, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	16(%rbp), %rax
	jmp	.L2068
	.p2align 4,,10
.L2076:
	movq	%r15, %rdx
	movq	%r12, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	-16(%rbp), %rax
	jmp	.L2079
.L2130:
	leaq	48(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r12, %rcx
.LEHB183:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	48(%rbp), %rdx
	movq	%rax, (%r12)
	movq	%rdx, 16(%r12)
.L2041:
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	48(%rbp), %rbx
	movq	(%r12), %rax
	jmp	.L2043
.L2042:
	testq	%rbx, %rbx
	je	.L2043
	jmp	.L2041
.L2129:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.L2087:
	movq	%rax, %rdi
.L2083:
	movq	%rsi, %rcx
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev
	movq	%rdi, %rcx
	call	_Unwind_Resume
.L2089:
	leaq	24(%rsi), %rcx
	movq	%rax, %rbx
	call	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	movq	-64(%rbp), %rax
	movq	-72(%rbp), %rdi
	movq	-24(%rax), %rax
	movq	%rdi, 48(%rbp,%rax)
	movq	-24(%r15), %rax
	movq	-80(%rbp), %rdi
	movq	%r15, 64(%rbp)
	movq	%rdi, 64(%rbp,%rax)
	movq	-24(%r13), %rax
	movq	-56(%rbp), %rdi
	movq	%r13, 48(%rbp)
	movq	%rdi, 48(%rbp,%rax)
	movq	$0, 56(%rbp)
.L2047:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	leaq	128(%rsi), %rcx
	addq	$16, %rax
	movq	%rax, 176(%rbp)
	call	_ZNSt8ios_baseD2Ev
	movq	%rbx, %rcx
	call	_Unwind_Resume
.LEHE183:
.L2090:
	movq	-24(%r13), %rdx
	movq	-56(%rbp), %rdi
	movq	%rax, %rbx
	movq	%r13, 48(%rbp)
	movq	%rdi, 48(%rbp,%rdx)
	movq	$0, 56(%rbp)
	jmp	.L2047
.L2123:
	leaq	.LC2(%rip), %rcx
.LEHB184:
	call	_ZSt19__throw_logic_errorPKc
.L2126:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.LEHE184:
.L2088:
	movq	%rax, %rbx
	jmp	.L2047
.L2091:
	movq	(%r12), %rcx
	movq	%rax, %rdi
	cmpq	%rcx, %rbx
	je	.L2083
	call	_ZdlPv
	jmp	.L2083
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8646:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8646-.LLSDACSB8646
.LLSDACSB8646:
	.uleb128 .LEHB178-.LFB8646
	.uleb128 .LEHE178-.LEHB178
	.uleb128 .L2088-.LFB8646
	.uleb128 0
	.uleb128 .LEHB179-.LFB8646
	.uleb128 .LEHE179-.LEHB179
	.uleb128 .L2090-.LFB8646
	.uleb128 0
	.uleb128 .LEHB180-.LFB8646
	.uleb128 .LEHE180-.LEHB180
	.uleb128 .L2089-.LFB8646
	.uleb128 0
	.uleb128 .LEHB181-.LFB8646
	.uleb128 .LEHE181-.LEHB181
	.uleb128 .L2087-.LFB8646
	.uleb128 0
	.uleb128 .LEHB182-.LFB8646
	.uleb128 .LEHE182-.LEHB182
	.uleb128 .L2091-.LFB8646
	.uleb128 0
	.uleb128 .LEHB183-.LFB8646
	.uleb128 .LEHE183-.LEHB183
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB184-.LFB8646
	.uleb128 .LEHE184-.LEHB184
	.uleb128 .L2091-.LFB8646
	.uleb128 0
.LLSDACSE8646:
	.text
	.seh_endproc
	.p2align 4,,15
	.globl	_ZN7omnetpp6common10opp_formatB5cxx11ExPKc
	.def	_ZN7omnetpp6common10opp_formatB5cxx11ExPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common10opp_formatB5cxx11ExPKc
_ZN7omnetpp6common10opp_formatB5cxx11ExPKc:
.LFB8647:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$680, %rsp
	.seh_stackalloc	680
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	144(%rbp), %rbx
	movq	%rcx, %rdi
	movq	%rdx, 632(%rbp)
	movq	%r8, 640(%rbp)
	leaq	128(%rbx), %rcx
	call	_ZNSt8ios_baseC2Ev
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rsi
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	xorl	%edx, %edx
	movb	$0, 496(%rbp)
	movq	$0, 488(%rbp)
	movb	$0, 497(%rbp)
	movq	$0, 504(%rbp)
	movq	16(%rsi), %r12
	addq	$16, %rax
	movq	24(%rsi), %r14
	movq	%rax, 272(%rbp)
	movq	$0, 512(%rbp)
	movq	$0, 520(%rbp)
	movq	$0, 528(%rbp)
	movq	-24(%r12), %rax
	movq	%r12, 144(%rbp)
	movq	%r14, 144(%rbp,%rax)
	movq	$0, 152(%rbp)
	movq	-24(%r12), %rcx
	addq	%rbx, %rcx
.LEHB185:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE185:
	movq	32(%rsi), %r13
	xorl	%edx, %edx
	movq	-24(%r13), %rax
	movq	%r13, 160(%rbp)
	leaq	16(%rbx,%rax), %rcx
	movq	40(%rsi), %rax
	movq	%rax, (%rcx)
	movq	%rax, -72(%rbp)
.LEHB186:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE186:
	movq	48(%rsi), %rax
	movq	8(%rsi), %r15
	leaq	80(%rbx), %rcx
	pxor	%xmm0, %xmm0
	movq	%rax, %rdx
	movq	%rax, -80(%rbp)
	movq	-24(%r15), %rax
	movq	%rdx, 144(%rbp,%rax)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 176(%rbp)
	addq	$24, %rax
	movaps	%xmm0, 192(%rbp)
	movq	%rax, 144(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 208(%rbp)
	addq	$104, %rax
	movq	%rax, 272(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$64, %rax
	movq	%rax, 160(%rbp)
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 168(%rbp)
	call	_ZNSt6localeC1Ev
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	leaq	24(%rbx), %rdx
	leaq	128(%rbx), %rcx
	movl	$24, 232(%rbp)
	movq	$0, 248(%rbp)
	movb	$0, 256(%rbp)
	addq	$16, %rax
	movq	%rax, 168(%rbp)
	leaq	112(%rbx), %rax
	movq	%rax, 240(%rbp)
.LEHB187:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE187:
	movq	632(%rbp), %rdx
	leaq	16(%rbx), %rcx
.LEHB188:
	call	_ZNSo9_M_insertIxEERSoT_
.LEHE188:
	leaq	-16(%rbp), %rax
	movq	%rbp, -16(%rbp)
	movq	$0, -8(%rbp)
	movb	$0, 0(%rbp)
	movq	%rax, -72(%rbp)
	movq	208(%rbp), %rax
	testq	%rax, %rax
	je	.L2136
	movq	192(%rbp), %r12
	movq	200(%rbp), %r13
	cmpq	%r12, %rax
	ja	.L2258
	leaq	16(%rbp), %r14
	testq	%r13, %r13
	leaq	16(%r14), %rax
	movq	%rax, 16(%rbp)
	jne	.L2149
	testq	%r12, %r12
	jne	.L2259
.L2149:
	subq	%r13, %r12
	cmpq	$15, %r12
	movq	%r12, -40(%rbp)
	ja	.L2260
	cmpq	$1, %r12
	jne	.L2152
	movzbl	0(%r13), %eax
	movb	%al, 32(%rbp)
	leaq	16(%r14), %rax
.L2153:
	movq	%r12, 24(%rbp)
	movb	$0, (%rax,%r12)
	leaq	16(%r14), %rcx
	movq	16(%rbp), %rdx
	movq	-16(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L2154
	movq	-72(%rbp), %rcx
	movq	32(%rbp), %r8
	movq	24(%rbp), %r9
	addq	$16, %rcx
	cmpq	%rcx, %rax
	je	.L2261
	testq	%rax, %rax
	movq	0(%rbp), %rcx
	movq	%rdx, -16(%rbp)
	movq	%r9, -8(%rbp)
	movq	%r8, 0(%rbp)
	je	.L2156
	movq	%rax, 16(%rbp)
	movq	%rcx, 32(%rbp)
.L2157:
	movq	$0, 24(%rbp)
	movb	$0, (%rax)
	addq	$16, %r14
	movq	16(%rbp), %rcx
	cmpq	%r14, %rcx
	jne	.L2254
	jmp	.L2148
	.p2align 4,,10
.L2258:
	leaq	48(%rbp), %r14
	testq	%r13, %r13
	leaq	16(%r14), %rdx
	movq	%rdx, 48(%rbp)
	je	.L2262
	subq	%r13, %rax
	cmpq	$15, %rax
	movq	%rax, %r12
	movq	%rax, -48(%rbp)
	ja	.L2263
	cmpq	$1, %rax
	jne	.L2141
	movzbl	0(%r13), %eax
	movb	%al, 64(%rbp)
.L2142:
	movq	%r12, 56(%rbp)
	movb	$0, (%rdx,%r12)
	leaq	16(%r14), %rcx
	movq	48(%rbp), %rdx
	movq	-16(%rbp), %rax
	cmpq	%rcx, %rdx
	je	.L2143
	movq	-72(%rbp), %rcx
	movq	64(%rbp), %r8
	movq	56(%rbp), %r9
	addq	$16, %rcx
	cmpq	%rcx, %rax
	je	.L2264
	testq	%rax, %rax
	movq	0(%rbp), %rcx
	movq	%rdx, -16(%rbp)
	movq	%r9, -8(%rbp)
	movq	%r8, 0(%rbp)
	je	.L2145
	movq	%rax, 48(%rbp)
	movq	%rcx, 64(%rbp)
.L2146:
	movq	$0, 56(%rbp)
	movb	$0, (%rax)
	addq	$16, %r14
	movq	48(%rbp), %rcx
	cmpq	%r14, %rcx
	je	.L2148
.L2254:
	call	_ZdlPv
.L2148:
	leaq	112(%rbp), %r13
	movq	248(%rbp), %r8
	leaq	96(%rbx), %rcx
	movq	$0, 32(%rsp)
	xorl	%edx, %edx
	movq	$0, 120(%rbp)
	leaq	16(%r13), %r9
	movb	$0, 128(%rbp)
	movq	%r9, 112(%rbp)
.LEHB189:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
	xorl	%r9d, %r9d
	testb	$3, 232(%rbp)
	je	.L2162
	movq	248(%rbp), %r9
.L2162:
	movq	240(%rbp), %rdx
	leaq	24(%rbx), %rcx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE7_M_syncEPcyy
.LEHE189:
	movq	112(%rbp), %rcx
	leaq	16(%r13), %rax
	cmpq	%rax, %rcx
	je	.L2163
	call	_ZdlPv
.L2163:
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L2164
	xorl	%r12d, %r12d
	cmpq	$0, 640(%rbp)
	je	.L2208
	leaq	-49(%rbp), %rdx
	movl	$1431655766, %r15d
	leaq	-50(%rbp), %r14
	movq	%rdx, -80(%rbp)
	jmp	.L2169
	.p2align 4,,10
.L2168:
	movq	-16(%rbp), %rax
	leaq	16(%rbx), %rcx
	movl	$1, %r8d
	movq	%r14, %rdx
	movzbl	(%rax,%r12), %eax
	movb	%al, -50(%rbp)
.LEHB190:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	-8(%rbp), %rax
	addq	$1, %r12
	cmpq	%r12, %rax
	jbe	.L2164
.L2169:
	testq	%r12, %r12
	je	.L2168
	movl	%r12d, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	imull	%r15d
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	leal	(%rdx,%rdx,2), %eax
	cmpl	%eax, %ecx
	jne	.L2168
	movq	640(%rbp), %rcx
	call	strlen
	movq	640(%rbp), %rdx
	leaq	16(%rbx), %rcx
	movq	%rax, %r8
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	-16(%rbp), %rax
	movq	-80(%rbp), %rdx
	leaq	16(%rbx), %rcx
	movl	$1, %r8d
	movzbl	(%rax,%r12), %eax
	movb	%al, -49(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	-8(%rbp), %rax
	addq	$1, %r12
	cmpq	%r12, %rax
	ja	.L2169
	.p2align 4,,10
.L2164:
	movq	208(%rbp), %rax
	leaq	16(%rdi), %r15
	movq	$0, 8(%rdi)
	movb	$0, 16(%rdi)
	movq	%r15, (%rdi)
	testq	%rax, %rax
	je	.L2174
	movq	192(%rbp), %r12
	movq	200(%rbp), %r14
	cmpq	%r12, %rax
	jbe	.L2175
	leaq	16(%r13), %rdx
	testq	%r14, %r14
	movq	%rdx, 112(%rbp)
	je	.L2265
	subq	%r14, %rax
	cmpq	$15, %rax
	movq	%rax, %r12
	movq	%rax, -32(%rbp)
	ja	.L2266
	cmpq	$1, %rax
	jne	.L2179
	movzbl	(%r14), %eax
	movb	%al, 128(%rbp)
.L2180:
	movq	%r12, 120(%rbp)
	movb	$0, (%rdx,%r12)
	leaq	16(%r13), %rcx
	movq	112(%rbp), %rdx
	movq	(%rdi), %rax
	cmpq	%rcx, %rdx
	je	.L2181
	cmpq	%rax, %r15
	movq	120(%rbp), %r8
	movq	128(%rbp), %rcx
	je	.L2267
	testq	%rax, %rax
	movq	16(%rdi), %r9
	movq	%rdx, (%rdi)
	movq	%r8, 8(%rdi)
	movq	%rcx, 16(%rdi)
	je	.L2183
	movq	%rax, 112(%rbp)
	movq	%r9, 128(%rbp)
.L2184:
	movq	$0, 120(%rbp)
	movb	$0, (%rax)
	addq	$16, %r13
	movq	112(%rbp), %rcx
	cmpq	%r13, %rcx
	je	.L2186
.L2255:
	call	_ZdlPv
.L2186:
	movq	-72(%rbp), %rax
	movq	-16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L2200
	call	_ZdlPv
.L2200:
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rdx
	movq	240(%rbp), %rcx
	addq	$24, %rax
	addq	$64, %rdx
	movq	%rax, 144(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	%rdx, -72(%rbp)
	movq	-72(%rbp), %xmm0
	addq	$104, %rax
	movq	%rax, 272(%rbp)
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, -72(%rbp)
	leaq	112(%rbx), %rax
	movhps	-72(%rbp), %xmm0
	cmpq	%rax, %rcx
	movaps	%xmm0, 160(%rbp)
	je	.L2201
	call	_ZdlPv
.L2201:
	leaq	80(%rbx), %rcx
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 168(%rbp)
	call	_ZNSt6localeD1Ev
	movq	8(%rsi), %rax
	movq	48(%rsi), %rdx
	leaq	128(%rbx), %rcx
	movq	-24(%rax), %rax
	movq	%rdx, 144(%rbp,%rax)
	movq	32(%rsi), %rax
	movq	40(%rsi), %rdx
	movq	%rax, 160(%rbp)
	movq	-24(%rax), %rax
	movq	%rdx, 160(%rbp,%rax)
	movq	16(%rsi), %rax
	movq	24(%rsi), %rdx
	movq	%rax, 144(%rbp)
	movq	-24(%rax), %rax
	movq	%rdx, 144(%rbp,%rax)
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 152(%rbp)
	addq	$16, %rax
	movq	%rax, 272(%rbp)
	call	_ZNSt8ios_baseD2Ev
	movq	%rdi, %rax
	addq	$680, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L2152:
	testq	%r12, %r12
	leaq	16(%r14), %rax
	je	.L2153
	jmp	.L2151
	.p2align 4,,10
.L2141:
	testq	%rax, %rax
	je	.L2142
	movq	%rdx, %rax
	jmp	.L2140
	.p2align 4,,10
.L2175:
	leaq	80(%rbp), %r13
	testq	%r14, %r14
	leaq	16(%r13), %rax
	movq	%rax, 80(%rbp)
	jne	.L2187
	testq	%r12, %r12
	jne	.L2268
.L2187:
	subq	%r14, %r12
	cmpq	$15, %r12
	movq	%r12, -24(%rbp)
	ja	.L2269
	cmpq	$1, %r12
	jne	.L2190
	movzbl	(%r14), %eax
	movb	%al, 96(%rbp)
	leaq	16(%r13), %rax
.L2191:
	movq	%r12, 88(%rbp)
	movb	$0, (%rax,%r12)
	leaq	16(%r13), %rcx
	movq	80(%rbp), %rdx
	movq	(%rdi), %rax
	cmpq	%rcx, %rdx
	je	.L2192
	cmpq	%rax, %r15
	movq	88(%rbp), %r8
	movq	96(%rbp), %rcx
	je	.L2270
	testq	%rax, %rax
	movq	16(%rdi), %r9
	movq	%rdx, (%rdi)
	movq	%r8, 8(%rdi)
	movq	%rcx, 16(%rdi)
	je	.L2194
	movq	%rax, 80(%rbp)
	movq	%r9, 96(%rbp)
.L2195:
	movq	$0, 88(%rbp)
	movb	$0, (%rax)
	addq	$16, %r13
	movq	80(%rbp), %rcx
	cmpq	%r13, %rcx
	jne	.L2255
	jmp	.L2186
	.p2align 4,,10
.L2208:
	leaq	-49(%rbp), %rdx
	leaq	-50(%rbp), %r15
	leaq	16(%rbx), %r14
	movq	%rdx, -80(%rbp)
	jmp	.L2165
	.p2align 4,,10
.L2171:
	movq	-16(%rbp), %rax
	movl	$1, %r8d
	movq	%r15, %rdx
	movq	%r14, %rcx
	movzbl	(%rax,%r12), %eax
	movb	%al, -50(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.L2173:
	movq	-8(%rbp), %rax
	addq	$1, %r12
	cmpq	%rax, %r12
	jnb	.L2164
.L2165:
	testq	%r12, %r12
	je	.L2171
	movl	%r12d, %ecx
	movl	$1431655766, %edx
	subl	%eax, %ecx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	leal	(%rdx,%rdx,2), %eax
	cmpl	%eax, %ecx
	jne	.L2171
	movq	160(%rbp), %rax
	movq	-24(%rax), %rcx
	addq	%r14, %rcx
	movl	32(%rcx), %edx
	orl	$1, %edx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
	movq	-16(%rbp), %rax
	movq	-80(%rbp), %rdx
	movl	$1, %r8d
	movq	%r14, %rcx
	movzbl	(%rax,%r12), %eax
	movb	%al, -49(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE190:
	jmp	.L2173
	.p2align 4,,10
.L2174:
	leaq	96(%rbx), %rdx
	movq	%rdi, %rcx
.LEHB191:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
.LEHE191:
	jmp	.L2186
	.p2align 4,,10
.L2136:
	movq	-72(%rbp), %rcx
	leaq	96(%rbx), %rdx
.LEHB192:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
.LEHE192:
	jmp	.L2148
	.p2align 4,,10
.L2266:
	leaq	-32(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r13, %rcx
.LEHB193:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-32(%rbp), %rdx
	movq	%rax, 112(%rbp)
	movq	%rdx, 128(%rbp)
.L2178:
	movq	%r12, %r8
	movq	%r14, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-32(%rbp), %r12
	movq	112(%rbp), %rdx
	jmp	.L2180
	.p2align 4,,10
.L2269:
	leaq	-24(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r13, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE193:
	movq	-24(%rbp), %rdx
	movq	%rax, 80(%rbp)
	movq	%rdx, 96(%rbp)
.L2189:
	movq	%r12, %r8
	movq	%r14, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-24(%rbp), %r12
	movq	80(%rbp), %rax
	jmp	.L2191
	.p2align 4,,10
.L2260:
	leaq	-40(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r14, %rcx
.LEHB194:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-40(%rbp), %rdx
	movq	%rax, 16(%rbp)
	movq	%rdx, 32(%rbp)
.L2151:
	movq	%r12, %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-40(%rbp), %r12
	movq	16(%rbp), %rax
	jmp	.L2153
	.p2align 4,,10
.L2263:
	leaq	-48(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r14, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE194:
	movq	-48(%rbp), %rdx
	movq	%rax, 48(%rbp)
	movq	%rdx, 64(%rbp)
.L2140:
	movq	%r12, %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-48(%rbp), %r12
	movq	48(%rbp), %rdx
	jmp	.L2142
	.p2align 4,,10
.L2270:
	movq	%rdx, (%rdi)
	movq	%r8, 8(%rdi)
	movq	%rcx, 16(%rdi)
.L2194:
	leaq	16(%r13), %rax
	movq	%rax, 80(%rbp)
	jmp	.L2195
	.p2align 4,,10
.L2264:
	movq	%rdx, -16(%rbp)
	movq	%r9, -8(%rbp)
	movq	%r8, 0(%rbp)
.L2145:
	leaq	16(%r14), %rax
	movq	%rax, 48(%rbp)
	jmp	.L2146
	.p2align 4,,10
.L2261:
	movq	%rdx, -16(%rbp)
	movq	%r9, -8(%rbp)
	movq	%r8, 0(%rbp)
.L2156:
	leaq	16(%r14), %rax
	movq	%rax, 16(%rbp)
	jmp	.L2157
	.p2align 4,,10
.L2267:
	movq	%rdx, (%rdi)
	movq	%r8, 8(%rdi)
	movq	%rcx, 16(%rdi)
.L2183:
	leaq	16(%r13), %rax
	movq	%rax, 112(%rbp)
	jmp	.L2184
	.p2align 4,,10
.L2179:
	testq	%rax, %rax
	je	.L2180
	movq	%rdx, %rax
	jmp	.L2178
	.p2align 4,,10
.L2190:
	testq	%r12, %r12
	leaq	16(%r13), %rax
	je	.L2191
	jmp	.L2189
	.p2align 4,,10
.L2181:
	movq	%r13, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	112(%rbp), %rax
	jmp	.L2184
	.p2align 4,,10
.L2192:
	movq	%r13, %rdx
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	80(%rbp), %rax
	jmp	.L2195
	.p2align 4,,10
.L2143:
	movq	-72(%rbp), %rcx
	movq	%r14, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	48(%rbp), %rax
	jmp	.L2146
	.p2align 4,,10
.L2154:
	movq	-72(%rbp), %rcx
	movq	%r14, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	16(%rbp), %rax
	jmp	.L2157
.L2212:
	movq	112(%rbp), %rcx
	addq	$16, %r13
	movq	%rax, %rsi
	cmpq	%r13, %rcx
	je	.L2199
.L2256:
	call	_ZdlPv
.L2199:
	movq	-72(%rbp), %rdx
	movq	-16(%rbp), %rcx
	addq	$16, %rdx
	cmpq	%rdx, %rcx
	je	.L2161
.L2257:
	call	_ZdlPv
.L2161:
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev
	movq	%rsi, %rcx
.LEHB195:
	call	_Unwind_Resume
.L2211:
	movq	%rax, %rsi
	jmp	.L2161
.L2215:
	leaq	24(%rbx), %rcx
	movq	%rax, %rsi
	call	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	movq	-24(%r15), %rax
	movq	-80(%rbp), %rdi
	movq	%rdi, 144(%rbp,%rax)
	movq	-24(%r13), %rax
	movq	-72(%rbp), %rdi
	movq	%r13, 160(%rbp)
	movq	%rdi, 160(%rbp,%rax)
	movq	-24(%r12), %rax
	movq	%r12, 144(%rbp)
	movq	%r14, 144(%rbp,%rax)
	movq	$0, 152(%rbp)
.L2134:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	leaq	128(%rbx), %rcx
	addq	$16, %rax
	movq	%rax, 272(%rbp)
	call	_ZNSt8ios_baseD2Ev
	movq	%rsi, %rcx
	call	_Unwind_Resume
.LEHE195:
.L2216:
	movq	-24(%r12), %rdx
	movq	%r12, 144(%rbp)
	movq	%rax, %rsi
	movq	%r14, 144(%rbp,%rdx)
	movq	$0, 152(%rbp)
	jmp	.L2134
.L2214:
	movq	%rax, %rsi
	jmp	.L2134
.L2262:
	leaq	.LC2(%rip), %rcx
.LEHB196:
	call	_ZSt19__throw_logic_errorPKc
.L2259:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.LEHE196:
.L2265:
	leaq	.LC2(%rip), %rcx
.LEHB197:
	call	_ZSt19__throw_logic_errorPKc
.L2217:
	movq	%rax, %rsi
	movq	-72(%rbp), %rax
	movq	-16(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	.L2257
	jmp	.L2161
.L2218:
	movq	(%rdi), %rcx
	movq	%rax, %rsi
	cmpq	%rcx, %r15
	jne	.L2256
	jmp	.L2199
.L2268:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.LEHE197:
.L2213:
	movq	%rax, %rsi
	jmp	.L2199
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8647:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8647-.LLSDACSB8647
.LLSDACSB8647:
	.uleb128 .LEHB185-.LFB8647
	.uleb128 .LEHE185-.LEHB185
	.uleb128 .L2214-.LFB8647
	.uleb128 0
	.uleb128 .LEHB186-.LFB8647
	.uleb128 .LEHE186-.LEHB186
	.uleb128 .L2216-.LFB8647
	.uleb128 0
	.uleb128 .LEHB187-.LFB8647
	.uleb128 .LEHE187-.LEHB187
	.uleb128 .L2215-.LFB8647
	.uleb128 0
	.uleb128 .LEHB188-.LFB8647
	.uleb128 .LEHE188-.LEHB188
	.uleb128 .L2211-.LFB8647
	.uleb128 0
	.uleb128 .LEHB189-.LFB8647
	.uleb128 .LEHE189-.LEHB189
	.uleb128 .L2212-.LFB8647
	.uleb128 0
	.uleb128 .LEHB190-.LFB8647
	.uleb128 .LEHE190-.LEHB190
	.uleb128 .L2213-.LFB8647
	.uleb128 0
	.uleb128 .LEHB191-.LFB8647
	.uleb128 .LEHE191-.LEHB191
	.uleb128 .L2218-.LFB8647
	.uleb128 0
	.uleb128 .LEHB192-.LFB8647
	.uleb128 .LEHE192-.LEHB192
	.uleb128 .L2217-.LFB8647
	.uleb128 0
	.uleb128 .LEHB193-.LFB8647
	.uleb128 .LEHE193-.LEHB193
	.uleb128 .L2218-.LFB8647
	.uleb128 0
	.uleb128 .LEHB194-.LFB8647
	.uleb128 .LEHE194-.LEHB194
	.uleb128 .L2217-.LFB8647
	.uleb128 0
	.uleb128 .LEHB195-.LFB8647
	.uleb128 .LEHE195-.LEHB195
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB196-.LFB8647
	.uleb128 .LEHE196-.LEHB196
	.uleb128 .L2217-.LFB8647
	.uleb128 0
	.uleb128 .LEHB197-.LFB8647
	.uleb128 .LEHE197-.LEHB197
	.uleb128 .L2218-.LFB8647
	.uleb128 0
.LLSDACSE8647:
	.text
	.seh_endproc
	.section	.text$_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12emplace_backIJS5_EEEvDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12emplace_backIJS5_EEEvDpOT_
	.def	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12emplace_backIJS5_EEEvDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12emplace_backIJS5_EEEvDpOT_
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12emplace_backIJS5_EEEvDpOT_:
.LFB9054:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	8(%rcx), %rbx
	cmpq	16(%rcx), %rbx
	movq	%rcx, %r12
	je	.L2272
	testq	%rbx, %rbx
	je	.L2273
	leaq	16(%rbx), %rax
	movq	%rax, (%rbx)
	movq	(%rdx), %rcx
	leaq	16(%rdx), %rax
	cmpq	%rax, %rcx
	je	.L2321
	movq	%rcx, (%rbx)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%rbx)
.L2275:
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%rbx)
	movb	$0, 16(%rdx)
	movq	8(%r12), %rbx
	movq	%rax, (%rdx)
	movq	$0, 8(%rdx)
.L2273:
	addq	$32, %rbx
	movq	%rbx, 8(%r12)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
.L2321:
	movq	16(%rdx), %r9
	movq	24(%rdx), %r10
	movq	%r9, 16(%rbx)
	movq	%r10, 24(%rbx)
	jmp	.L2275
	.p2align 4,,10
.L2272:
	movq	%rbx, %r13
	subq	(%rcx), %r13
	movq	%r13, %rax
	sarq	$5, %rax
	testq	%rax, %rax
	je	.L2298
	leaq	(%rax,%rax), %rdi
	cmpq	%rdi, %rax
	jbe	.L2322
.L2300:
	movq	$-32, %rdi
.L2277:
	movq	%rdi, %rcx
	movq	%rdx, -8(%rbp)
	call	_Znwy
	movq	-8(%rbp), %rdx
	movq	%rax, %rsi
.L2278:
	movq	%r13, %rax
	addq	%rsi, %rax
	je	.L2279
	leaq	16(%rax), %rcx
	movq	(%rdx), %r8
	movq	%rcx, (%rax)
	leaq	16(%rdx), %rcx
	cmpq	%rcx, %r8
	je	.L2323
	movq	%r8, (%rax)
	movq	16(%rdx), %r8
	movq	%r8, 16(%rax)
.L2281:
	movq	8(%rdx), %r8
	movq	%rcx, (%rdx)
	movq	$0, 8(%rdx)
	movb	$0, 16(%rdx)
	movq	%r8, 8(%rax)
.L2279:
	movq	(%r12), %rax
	cmpq	%rax, %rbx
	je	.L2302
	leaq	32(%rax), %rcx
	movq	%rbx, %r10
	leaq	16(%rax), %rdx
	subq	%rcx, %r10
	movq	%rsi, %rcx
	movq	%r10, %r13
	leaq	48(%rax,%r10), %r8
	shrq	$5, %r13
	jmp	.L2286
	.p2align 4,,10
.L2284:
	movq	%rax, (%rcx)
	movq	(%rdx), %rax
	movq	%rax, 16(%rcx)
.L2285:
	movq	-8(%rdx), %rax
	movq	%rax, 8(%rcx)
	movq	%rdx, -16(%rdx)
	movq	$0, -8(%rdx)
	movb	$0, (%rdx)
.L2283:
	addq	$32, %rdx
	addq	$32, %rcx
	cmpq	%rdx, %r8
	je	.L2324
.L2286:
	testq	%rcx, %rcx
	je	.L2283
	leaq	16(%rcx), %rax
	movq	%rax, (%rcx)
	movq	-16(%rdx), %rax
	cmpq	%rdx, %rax
	jne	.L2284
	movq	(%rdx), %r9
	movq	8(%rdx), %r10
	movq	%r9, 16(%rcx)
	movq	%r10, 24(%rcx)
	jmp	.L2285
	.p2align 4,,10
.L2324:
	addq	$1, %r13
	salq	$5, %r13
	addq	%rsi, %r13
.L2282:
	movq	8(%r12), %r14
	addq	$32, %r13
	cmpq	%r14, %rbx
	je	.L2287
	leaq	32(%rbx), %rax
	leaq	16(%rbx), %rdx
	movq	%r13, %rcx
	subq	%rax, %r14
	movq	%r14, %r9
	leaq	48(%rbx,%r14), %r8
	shrq	$5, %r9
	jmp	.L2291
	.p2align 4,,10
.L2289:
	movq	%rax, (%rcx)
	movq	(%rdx), %rax
	movq	%rax, 16(%rcx)
.L2290:
	movq	-8(%rdx), %rax
	movq	%rax, 8(%rcx)
	movq	%rdx, -16(%rdx)
	movq	$0, -8(%rdx)
	movb	$0, (%rdx)
.L2288:
	addq	$32, %rdx
	addq	$32, %rcx
	cmpq	%r8, %rdx
	je	.L2325
.L2291:
	testq	%rcx, %rcx
	je	.L2288
	leaq	16(%rcx), %rax
	movq	%rax, (%rcx)
	movq	-16(%rdx), %rax
	cmpq	%rdx, %rax
	jne	.L2289
	movdqu	(%rdx), %xmm1
	movups	%xmm1, 16(%rcx)
	jmp	.L2290
	.p2align 4,,10
.L2325:
	leaq	1(%r9), %rax
	movq	8(%r12), %r14
	salq	$5, %rax
	addq	%rax, %r13
.L2287:
	movq	(%r12), %rbx
	cmpq	%r14, %rbx
	je	.L2292
	.p2align 4,,10
.L2293:
	movq	(%rbx), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L2294
	addq	$32, %rbx
	call	_ZdlPv
	cmpq	%r14, %rbx
	jne	.L2293
.L2295:
	movq	(%r12), %r14
.L2292:
	testq	%r14, %r14
	je	.L2297
	movq	%r14, %rcx
	call	_ZdlPv
.L2297:
	movq	%rsi, (%r12)
	addq	%rdi, %rsi
	movq	%r13, 8(%r12)
	movq	%rsi, 16(%r12)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
.L2294:
	addq	$32, %rbx
	cmpq	%r14, %rbx
	jne	.L2293
	jmp	.L2295
	.p2align 4,,10
.L2298:
	movl	$32, %edi
	jmp	.L2277
	.p2align 4,,10
.L2323:
	movq	16(%rdx), %r9
	movq	24(%rdx), %r10
	movq	%r9, 16(%rax)
	movq	%r10, 24(%rax)
	jmp	.L2281
	.p2align 4,,10
.L2322:
	movabsq	$576460752303423487, %rcx
	cmpq	%rcx, %rdi
	ja	.L2300
	xorl	%esi, %esi
	testq	%rdi, %rdi
	je	.L2278
	salq	$6, %rax
	movq	%rax, %rdi
	jmp	.L2277
	.p2align 4,,10
.L2302:
	movq	%rsi, %r13
	jmp	.L2282
	.seh_endproc
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common9opp_splitERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
	.def	_ZN7omnetpp6common9opp_splitERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common9opp_splitERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
_ZN7omnetpp6common9opp_splitERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_:
.LFB8595:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$120, %rsp
	.seh_stackalloc	120
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	xorl	%r12d, %r12d
	leaq	-48(%rbp), %rax
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movq	%rcx, %rsi
	movq	%rdx, %r13
	movq	%r8, %r14
	movq	8(%r8), %r9
	movq	%rax, -88(%rbp)
	leaq	16(%rax), %rdi
	jmp	.L2369
	.p2align 4,,10
.L2337:
	cmpq	$1, %rbx
	jne	.L2339
	movzbl	(%r15), %eax
	movb	%al, -32(%rbp)
	movq	%rdi, %rax
.L2340:
	movq	%rbx, -40(%rbp)
	movb	$0, (%rax,%rbx)
	movq	8(%rsi), %rbx
	cmpq	16(%rsi), %rbx
	movq	%rbx, %rdx
	je	.L2341
	testq	%rbx, %rbx
	movq	-48(%rbp), %rcx
	je	.L2343
	leaq	16(%rbx), %rax
	movq	%rax, (%rbx)
	movq	-48(%rbp), %rax
	cmpq	%rdi, %rax
	je	.L2413
	movq	%rax, (%rbx)
	movq	-32(%rbp), %rax
	movq	%rax, 16(%rbx)
.L2345:
	movq	-40(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, 8(%rdx)
	movq	%rdi, -48(%rbp)
	movq	$0, -40(%rbp)
	movb	$0, -32(%rbp)
.L2343:
	addq	$32, %rbx
	movq	%rbx, 8(%rsi)
.L2346:
	cmpq	%rdi, %rcx
	je	.L2368
	call	_ZdlPv
.L2368:
	movq	8(%r14), %r9
	addl	%r9d, %r12d
.L2369:
	movq	(%r14), %rdx
	movslq	%r12d, %rbx
	movq	%r13, %rcx
	movq	%rbx, %r8
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcyy
	cmpq	$-1, %rax
	movq	%rax, %r12
	je	.L2414
	movq	8(%r13), %r9
	subq	%rbx, %rax
	cmpq	%r9, %rbx
	ja	.L2415
	movq	0(%r13), %r15
	subq	%rbx, %r9
	movq	%rdi, -48(%rbp)
	addq	%rbx, %r15
	cmpq	%rax, %r9
	cmovbe	%r9, %rax
	movq	%rax, %rbx
	movq	%r15, %rax
	addq	%rbx, %rax
	je	.L2336
	testq	%r15, %r15
	je	.L2416
.L2336:
	cmpq	$15, %rbx
	movq	%rbx, -56(%rbp)
	jbe	.L2337
	movq	-88(%rbp), %rcx
	leaq	-56(%rbp), %rdx
	xorl	%r8d, %r8d
.LEHB198:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE198:
	movq	-56(%rbp), %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -32(%rbp)
.L2338:
	movq	%rbx, %r8
	movq	%r15, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-56(%rbp), %rbx
	movq	-48(%rbp), %rax
	jmp	.L2340
	.p2align 4,,10
.L2339:
	testq	%rbx, %rbx
	movq	%rdi, %rax
	je	.L2340
	jmp	.L2338
	.p2align 4,,10
.L2413:
	movq	-32(%rbp), %r9
	movq	-24(%rbp), %r10
	movq	%r9, 16(%rbx)
	movq	%r10, 24(%rbx)
	movq	8(%rsi), %rbx
	jmp	.L2345
	.p2align 4,,10
.L2414:
	movq	8(%r13), %r9
	cmpq	%r9, %rbx
	ja	.L2417
	leaq	-48(%rbp), %rdi
	leaq	16(%rdi), %rax
	movq	%rax, -48(%rbp)
	movq	0(%r13), %rax
	leaq	(%rax,%rbx), %r12
	addq	%r9, %rax
	je	.L2329
	testq	%r12, %r12
	je	.L2418
.L2329:
	subq	%rbx, %r9
	cmpq	$15, %r9
	movq	%r9, %rbx
	movq	%r9, -64(%rbp)
	ja	.L2419
	cmpq	$1, %r9
	jne	.L2332
	movzbl	(%r12), %eax
	movb	%al, -32(%rbp)
	leaq	16(%rdi), %rax
.L2333:
	movq	%rbx, -40(%rbp)
	movq	%rdi, %rdx
	movb	$0, (%rax,%rbx)
	movq	%rsi, %rcx
.LEHB199:
	call	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12emplace_backIJS5_EEEvDpOT_
.LEHE199:
	movq	-48(%rbp), %rcx
	leaq	16(%rdi), %rdx
	cmpq	%rdx, %rcx
	je	.L2326
	call	_ZdlPv
.L2326:
	movq	%rsi, %rax
	addq	$120, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L2341:
	movq	%rbx, %r15
	subq	(%rsi), %r15
	movq	%r15, %rax
	sarq	$5, %rax
	testq	%rax, %rax
	je	.L2377
	leaq	(%rax,%rax), %rdx
	cmpq	%rdx, %rax
	movq	%rdx, -80(%rbp)
	jbe	.L2420
.L2379:
	movq	$-32, -80(%rbp)
	movq	-80(%rbp), %rcx
.L2347:
.LEHB200:
	call	_Znwy
.LEHE200:
	movq	%rax, -72(%rbp)
.L2348:
	addq	-72(%rbp), %r15
	je	.L2349
	leaq	16(%r15), %rax
	movq	%rax, (%r15)
	movq	-48(%rbp), %rax
	cmpq	%rdi, %rax
	je	.L2421
	movq	%rax, (%r15)
	movq	-32(%rbp), %rax
	movq	%rax, 16(%r15)
.L2351:
	movq	-40(%rbp), %rax
	movq	%rdi, -48(%rbp)
	movq	$0, -40(%rbp)
	movb	$0, -32(%rbp)
	movq	%rax, 8(%r15)
.L2349:
	movq	(%rsi), %rdx
	cmpq	%rdx, %rbx
	je	.L2381
	leaq	32(%rdx), %rcx
	movq	%rbx, %r11
	leaq	16(%rdx), %rax
	subq	%rcx, %r11
	movq	%r11, %r15
	leaq	48(%rdx,%r11), %r8
	movq	-72(%rbp), %rdx
	shrq	$5, %r15
	jmp	.L2356
	.p2align 4,,10
.L2354:
	movq	%rcx, (%rdx)
	movq	(%rax), %rcx
	movq	%rcx, 16(%rdx)
.L2355:
	movq	-8(%rax), %rcx
	movq	%rcx, 8(%rdx)
	movq	%rax, -16(%rax)
	movq	$0, -8(%rax)
	movb	$0, (%rax)
.L2353:
	addq	$32, %rax
	addq	$32, %rdx
	cmpq	%rax, %r8
	je	.L2422
.L2356:
	testq	%rdx, %rdx
	je	.L2353
	leaq	16(%rdx), %rcx
	movq	%rcx, (%rdx)
	movq	-16(%rax), %rcx
	cmpq	%rax, %rcx
	jne	.L2354
	movq	(%rax), %r9
	movq	8(%rax), %r10
	movq	%r9, 16(%rdx)
	movq	%r10, 24(%rdx)
	jmp	.L2355
	.p2align 4,,10
.L2377:
	movq	$32, -80(%rbp)
	movq	-80(%rbp), %rcx
	jmp	.L2347
	.p2align 4,,10
.L2422:
	addq	$1, %r15
	salq	$5, %r15
	addq	-72(%rbp), %r15
.L2352:
	leaq	32(%r15), %r10
	movq	8(%rsi), %r15
	movq	%r10, -96(%rbp)
	cmpq	%r15, %rbx
	je	.L2357
	leaq	32(%rbx), %rcx
	movq	%r15, %rdx
	leaq	16(%rbx), %rax
	subq	%rcx, %rdx
	movq	%rdx, %r8
	leaq	48(%rbx,%rdx), %r9
	movq	%r10, %rdx
	shrq	$5, %r8
	jmp	.L2361
	.p2align 4,,10
.L2359:
	movq	%rcx, (%rdx)
	movq	(%rax), %rcx
	movq	%rcx, 16(%rdx)
.L2360:
	movq	-8(%rax), %rcx
	movq	%rcx, 8(%rdx)
	movq	%rax, -16(%rax)
	movq	$0, -8(%rax)
	movb	$0, (%rax)
.L2358:
	addq	$32, %rax
	addq	$32, %rdx
	cmpq	%r9, %rax
	je	.L2423
.L2361:
	testq	%rdx, %rdx
	je	.L2358
	leaq	16(%rdx), %rcx
	movq	%rcx, (%rdx)
	movq	-16(%rax), %rcx
	cmpq	%rax, %rcx
	jne	.L2359
	movq	(%rax), %rcx
	movq	8(%rax), %rbx
	movq	%rcx, 16(%rdx)
	movq	%rbx, 24(%rdx)
	jmp	.L2360
	.p2align 4,,10
.L2423:
	addq	$1, %r8
	movq	8(%rsi), %r15
	salq	$5, %r8
	addq	%r8, -96(%rbp)
.L2357:
	movq	(%rsi), %rbx
	cmpq	%r15, %rbx
	je	.L2362
	.p2align 4,,10
.L2363:
	movq	(%rbx), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L2364
	addq	$32, %rbx
	call	_ZdlPv
	cmpq	%r15, %rbx
	jne	.L2363
.L2365:
	movq	(%rsi), %r15
.L2362:
	testq	%r15, %r15
	je	.L2367
	movq	%r15, %rcx
	call	_ZdlPv
.L2367:
	movq	-72(%rbp), %rax
	movq	-96(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	%rax, (%rsi)
	addq	-80(%rbp), %rax
	movq	%rdx, 8(%rsi)
	movq	%rax, 16(%rsi)
	jmp	.L2346
	.p2align 4,,10
.L2364:
	addq	$32, %rbx
	cmpq	%r15, %rbx
	jne	.L2363
	jmp	.L2365
	.p2align 4,,10
.L2419:
	leaq	-64(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rdi, %rcx
.LEHB201:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-64(%rbp), %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -32(%rbp)
.L2331:
	movq	%rbx, %r8
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-64(%rbp), %rbx
	movq	-48(%rbp), %rax
	jmp	.L2333
	.p2align 4,,10
.L2421:
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 16(%r15)
	movq	%rdx, 24(%r15)
	jmp	.L2351
	.p2align 4,,10
.L2332:
	testq	%r9, %r9
	leaq	16(%rdi), %rax
	je	.L2333
	jmp	.L2331
	.p2align 4,,10
.L2420:
	movabsq	$576460752303423487, %rcx
	cmpq	%rcx, %rdx
	ja	.L2379
	testq	%rdx, %rdx
	movq	$0, -72(%rbp)
	je	.L2348
	salq	$6, %rax
	movq	%rax, -80(%rbp)
	movq	%rax, %rcx
	jmp	.L2347
	.p2align 4,,10
.L2381:
	movq	-72(%rbp), %r15
	jmp	.L2352
.L2415:
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rbx, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.LEHE201:
.L2382:
	movq	%rax, %rbx
.L2372:
	movq	%rsi, %rcx
	call	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
	movq	%rbx, %rcx
.LEHB202:
	call	_Unwind_Resume
.LEHE202:
.L2416:
	leaq	.LC2(%rip), %rcx
.LEHB203:
	call	_ZSt19__throw_logic_errorPKc
.L2417:
	leaq	.LC6(%rip), %rdx
	leaq	.LC5(%rip), %rcx
	movq	%rbx, %r8
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L2418:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.LEHE203:
.L2383:
	movq	-48(%rbp), %rcx
	leaq	16(%rdi), %rdx
	movq	%rax, %rbx
	cmpq	%rdx, %rcx
	je	.L2372
.L2412:
	call	_ZdlPv
	jmp	.L2372
.L2384:
	movq	-88(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	%rax, %rbx
	addq	$16, %rdx
	cmpq	%rdx, %rcx
	jne	.L2412
	jmp	.L2372
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8595:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8595-.LLSDACSB8595
.LLSDACSB8595:
	.uleb128 .LEHB198-.LFB8595
	.uleb128 .LEHE198-.LEHB198
	.uleb128 .L2382-.LFB8595
	.uleb128 0
	.uleb128 .LEHB199-.LFB8595
	.uleb128 .LEHE199-.LEHB199
	.uleb128 .L2383-.LFB8595
	.uleb128 0
	.uleb128 .LEHB200-.LFB8595
	.uleb128 .LEHE200-.LEHB200
	.uleb128 .L2384-.LFB8595
	.uleb128 0
	.uleb128 .LEHB201-.LFB8595
	.uleb128 .LEHE201-.LEHB201
	.uleb128 .L2382-.LFB8595
	.uleb128 0
	.uleb128 .LEHB202-.LFB8595
	.uleb128 .LEHE202-.LEHB202
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB203-.LFB8595
	.uleb128 .LEHE203-.LEHB203
	.uleb128 .L2382-.LFB8595
	.uleb128 0
.LLSDACSE8595:
	.text
	.seh_endproc
	.section	.text$_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4,,15
	.globl	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
	.def	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_:
.LFB9066:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	8(%rcx), %r13
	movq	(%rcx), %rbx
	movq	%rdx, %r14
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	%r13, %rax
	subq	%rbx, %r14
	subq	%rbx, %rax
	sarq	$2, %rax
	testq	%rax, %rax
	je	.L2432
	leaq	(%rax,%rax), %rdx
	movq	$-4, %r15
	cmpq	%rdx, %rax
	jbe	.L2442
.L2426:
	movq	%r15, %rcx
	movq	%r8, -88(%rbp)
	call	_Znwy
	movq	(%rsi), %rbx
	movq	8(%rsi), %r13
	movq	%rdi, %r9
	movq	-88(%rbp), %r8
	movq	%rax, %r12
	addq	%rax, %r15
	subq	%rbx, %r9
.L2427:
	addq	%r12, %r14
	je	.L2428
	movl	(%r8), %eax
	movl	%eax, (%r14)
.L2428:
	cmpq	%rbx, %rdi
	je	.L2429
	movq	%r9, %r8
	movq	%rbx, %rdx
	movq	%r12, %rcx
	movq	%r9, -88(%rbp)
	call	memmove
	movq	-88(%rbp), %r9
.L2429:
	movq	%r13, %r14
	leaq	4(%r12,%r9), %r9
	subq	%rdi, %r14
	cmpq	%rdi, %r13
	je	.L2430
	movq	%r9, %rcx
	movq	%r14, %r8
	movq	%rdi, %rdx
	call	memcpy
	movq	%rax, %r9
.L2430:
	addq	%r9, %r14
	testq	%rbx, %rbx
	je	.L2431
	movq	%rbx, %rcx
	call	_ZdlPv
.L2431:
	movq	%r12, (%rsi)
	movq	%r14, 8(%rsi)
	movq	%r15, 16(%rsi)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L2432:
	movl	$1, %edx
.L2425:
	leaq	0(,%rdx,4), %r15
	jmp	.L2426
	.p2align 4,,10
.L2442:
	movabsq	$4611686018427387903, %rax
	cmpq	%rax, %rdx
	ja	.L2426
	testq	%rdx, %rdx
	jne	.L2425
	movq	%r14, %r9
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	jmp	.L2427
	.seh_endproc
	.section .rdata,"dr"
.LC52:
	.ascii "\0"
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common15opp_formatTableERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiRKSt6vectorIiSaIiEE
	.def	_ZN7omnetpp6common15opp_formatTableERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiRKSt6vectorIiSaIiEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common15opp_formatTableERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiRKSt6vectorIiSaIiEE
_ZN7omnetpp6common15opp_formatTableERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEiRKSt6vectorIiSaIiEE:
.LFB8597:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$680, %rsp
	.seh_stackalloc	680
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	pxor	%xmm0, %xmm0
	movq	%rdx, 632(%rbp)
	leaq	144(%rbp), %rdx
	movl	%r8d, 640(%rbp)
	movl	$10, %r8d
	movq	%rcx, 624(%rbp)
	leaq	160(%rbp), %rax
	movq	%rdx, %rdi
	movq	%rdx, -40(%rbp)
	movw	%r8w, 160(%rbp)
	movq	%rdx, %r8
	movq	632(%rbp), %rdx
	leaq	48(%rbp), %rcx
	movq	%r9, 648(%rbp)
	movq	$0, 32(%rbp)
	movaps	%xmm0, 16(%rbp)
	movq	%rax, 144(%rbp)
	movq	$1, 152(%rbp)
	movq	%rcx, -96(%rbp)
.LEHB204:
	call	_ZN7omnetpp6common9opp_splitERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
.LEHE204:
	movq	144(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L2444
	call	_ZdlPv
.L2444:
	movq	56(%rbp), %rdx
	movq	48(%rbp), %rax
	cmpq	%rdx, %rax
	movq	%rdx, -56(%rbp)
	je	.L2489
	leaq	112(%rbp), %rdx
	movq	%rdx, -24(%rbp)
	leaq	128(%rbp), %rdx
	movq	%rdx, 112(%rbp)
	movq	(%rax), %rsi
	movq	8(%rax), %rbx
	movq	%rsi, %rdi
	addq	%rbx, %rdi
	je	.L2448
	testq	%rsi, %rsi
	je	.L2446
.L2448:
	addq	$32, %rax
	movq	%rax, -32(%rbp)
	leaq	80(%rbp), %rax
	movq	%rax, -64(%rbp)
	leaq	8(%rbp), %rax
	movq	%rax, -48(%rbp)
	.p2align 4,,10
.L2647:
	cmpq	$15, %rbx
	movq	%rbx, 144(%rbp)
	ja	.L2683
	cmpq	$1, %rbx
	jne	.L2452
	movzbl	(%rsi), %eax
	movb	%al, 128(%rbp)
	movq	112(%rbp), %rax
.L2453:
	movq	-40(%rbp), %rdi
	movl	$9, %ecx
	movq	%rbx, 120(%rbp)
	movq	-24(%rbp), %rdx
	movb	$0, (%rax,%rbx)
	movw	%cx, 160(%rbp)
	movq	-64(%rbp), %rcx
	leaq	16(%rdi), %rax
	movq	%rdi, %r8
	movq	$1, 152(%rbp)
	movq	%rax, 144(%rbp)
.LEHB205:
	call	_ZN7omnetpp6common9opp_splitERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
.LEHE205:
	movq	144(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L2454
	call	_ZdlPv
.L2454:
	movq	88(%rbp), %rbx
	movq	80(%rbp), %rdi
	movq	%rbx, %rax
	subq	%rdi, %rax
	cmpq	$63, %rax
	jbe	.L2684
	cmpq	%rbx, %rdi
	je	.L2456
	movq	-40(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 144(%rbp)
	movq	(%rdi), %r13
	movq	8(%rdi), %rsi
	movq	%r13, %rax
	addq	%rsi, %rax
	je	.L2469
	testq	%r13, %r13
	je	.L2467
.L2469:
	movq	-40(%rbp), %rax
	addq	$32, %rdi
	xorl	%r12d, %r12d
	leaq	16(%rax), %r14
	leaq	16(%rbp), %rax
	movq	%rax, -72(%rbp)
	.p2align 4,,10
.L2648:
	cmpq	$15, %rsi
	movl	%r12d, %r15d
	movq	%rsi, 8(%rbp)
	ja	.L2685
	cmpq	$1, %rsi
	jne	.L2473
	movzbl	0(%r13), %eax
	movb	%al, 160(%rbp)
	movq	144(%rbp), %rax
.L2474:
	movq	%rsi, 152(%rbp)
	movb	$0, (%rax,%rsi)
	movq	24(%rbp), %rdx
	movq	16(%rbp), %r8
	movq	152(%rbp), %rcx
	movq	%rdx, %rax
	subq	%r8, %rax
	movl	%ecx, 8(%rbp)
	sarq	$2, %rax
	cmpl	%eax, %r15d
	jge	.L2686
	leaq	(%r8,%r12,4), %rax
	cmpl	(%rax), %ecx
	jle	.L2478
	movl	%ecx, (%rax)
.L2478:
	movq	144(%rbp), %rcx
	cmpq	%r14, %rcx
	je	.L2480
	call	_ZdlPv
.L2480:
	cmpq	%rdi, %rbx
	je	.L2687
	movq	%r14, 144(%rbp)
	movq	(%rdi), %r13
	addq	$1, %r12
	movq	8(%rdi), %rsi
	addq	$32, %rdi
	movq	%r13, %rax
	addq	%rsi, %rax
	je	.L2648
	testq	%r13, %r13
	jne	.L2648
.L2467:
	leaq	.LC2(%rip), %rcx
.LEHB206:
	call	_ZSt19__throw_logic_errorPKc
	.p2align 4,,10
.L2686:
	cmpq	32(%rbp), %rdx
	je	.L2476
	testq	%rdx, %rdx
	je	.L2477
	movl	%ecx, (%rdx)
.L2477:
	addq	$4, %rdx
	movq	%rdx, 24(%rbp)
	jmp	.L2478
	.p2align 4,,10
.L2685:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rcx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE206:
	movq	8(%rbp), %rdx
	movq	%rax, 144(%rbp)
	movq	%rdx, 160(%rbp)
.L2472:
	movq	%rsi, %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	8(%rbp), %rsi
	movq	144(%rbp), %rax
	jmp	.L2474
	.p2align 4,,10
.L2684:
	cmpq	%rbx, %rdi
	je	.L2456
	.p2align 4,,10
.L2457:
	movq	(%rdi), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L2458
	addq	$32, %rdi
	call	_ZdlPv
	cmpq	%rdi, %rbx
	jne	.L2457
.L2459:
	movq	80(%rbp), %rbx
.L2456:
	testq	%rbx, %rbx
	je	.L2461
	movq	%rbx, %rcx
	call	_ZdlPv
.L2461:
	movq	-24(%rbp), %rax
	movq	112(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L2463
	call	_ZdlPv
.L2463:
	movq	-32(%rbp), %rdi
	cmpq	%rdi, -56(%rbp)
	je	.L2688
	movq	-24(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 112(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rsi
	movq	8(%rax), %rbx
	addq	$32, %rax
	movq	%rax, -32(%rbp)
	movq	%rsi, %rax
	addq	%rbx, %rax
	je	.L2647
	testq	%rsi, %rsi
	jne	.L2647
.L2446:
	leaq	.LC2(%rip), %rcx
.LEHB207:
	call	_ZSt19__throw_logic_errorPKc
	.p2align 4,,10
.L2473:
	testq	%rsi, %rsi
	movq	%r14, %rax
	je	.L2474
	jmp	.L2472
	.p2align 4,,10
.L2687:
	movq	88(%rbp), %rsi
	movq	80(%rbp), %rbx
	cmpq	%rbx, %rsi
	je	.L2456
.L2483:
	movq	(%rbx), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L2484
.L2689:
	addq	$32, %rbx
	call	_ZdlPv
	cmpq	%rsi, %rbx
	je	.L2459
	movq	(%rbx), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	jne	.L2689
.L2484:
	addq	$32, %rbx
	cmpq	%rsi, %rbx
	jne	.L2483
	movq	80(%rbp), %rbx
	jmp	.L2456
	.p2align 4,,10
.L2683:
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rcx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE207:
	movq	144(%rbp), %rdx
	movq	%rax, 112(%rbp)
	movq	%rdx, 128(%rbp)
.L2451:
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	144(%rbp), %rbx
	movq	112(%rbp), %rax
	jmp	.L2453
	.p2align 4,,10
.L2476:
	movq	-48(%rbp), %r8
	movq	-72(%rbp), %rcx
.LEHB208:
	call	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
.LEHE208:
	jmp	.L2478
	.p2align 4,,10
.L2458:
	addq	$32, %rdi
	cmpq	%rdi, %rbx
	jne	.L2457
	movq	80(%rbp), %rbx
	jmp	.L2456
	.p2align 4,,10
.L2452:
	movq	-24(%rbp), %rax
	addq	$16, %rax
	testq	%rbx, %rbx
	je	.L2453
	jmp	.L2451
	.p2align 4,,10
.L2688:
	movq	48(%rbp), %rax
	movq	56(%rbp), %rbx
	cmpq	%rax, %rbx
	movq	%rax, -56(%rbp)
	je	.L2489
	movq	%rax, %rsi
	.p2align 4,,10
.L2490:
	movq	(%rsi), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L2491
	addq	$32, %rsi
	call	_ZdlPv
	cmpq	%rbx, %rsi
	jne	.L2490
	movq	48(%rbp), %rax
	movq	%rax, -56(%rbp)
.L2489:
	movq	-56(%rbp), %rax
	testq	%rax, %rax
	je	.L2494
	movq	%rax, %rcx
	call	_ZdlPv
.L2494:
	movq	648(%rbp), %rax
	movq	16(%rbp), %r9
	movq	(%rax), %r8
	movq	8(%rax), %rcx
	subq	%r8, %rcx
	movq	%rcx, %rax
	movq	24(%rbp), %rcx
	sarq	$2, %rax
	subq	%r9, %rcx
	sarq	$2, %rcx
	cmpq	%rcx, %rax
	cmovbe	%rax, %rcx
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L2496
	.p2align 4,,10
.L2495:
	movl	(%r8,%rax,4), %edx
	testl	%edx, %edx
	jle	.L2509
	movl	%edx, (%r9,%rax,4)
.L2509:
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L2495
.L2496:
	movq	-40(%rbp), %r15
	leaq	128(%r15), %rcx
	call	_ZNSt8ios_baseC2Ev
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movb	$0, 496(%rbp)
	xorl	%edx, %edx
	movq	$0, 488(%rbp)
	movb	$0, 497(%rbp)
	movq	$0, 504(%rbp)
	movq	$0, 512(%rbp)
	addq	$16, %rax
	movq	$0, 520(%rbp)
	movq	$0, 528(%rbp)
	movq	%rax, 272(%rbp)
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	16(%rax), %rbx
	movq	24(%rax), %rdi
	movq	-24(%rbx), %rax
	movq	%rbx, 144(%rbp)
	movq	%rdi, 144(%rbp,%rax)
	movq	$0, 152(%rbp)
	movq	-24(%rbx), %rcx
	addq	%r15, %rcx
.LEHB209:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE209:
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	xorl	%edx, %edx
	movq	32(%rax), %rsi
	movq	-24(%rsi), %rax
	movq	%rsi, 160(%rbp)
	leaq	16(%r15,%rax), %rcx
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	40(%rax), %r14
	movq	%r14, (%rcx)
.LEHB210:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE210:
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	pxor	%xmm0, %xmm0
	leaq	80(%r15), %rcx
	movq	8(%rax), %r13
	movq	48(%rax), %r12
	movq	-24(%r13), %rax
	movq	%r12, 144(%rbp,%rax)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 176(%rbp)
	addq	$24, %rax
	movaps	%xmm0, 192(%rbp)
	movq	%rax, 144(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movaps	%xmm0, 208(%rbp)
	addq	$104, %rax
	movq	%rax, 272(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$64, %rax
	movq	%rax, 160(%rbp)
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 168(%rbp)
	call	_ZNSt6localeC1Ev
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	leaq	24(%r15), %rdx
	leaq	128(%r15), %rcx
	movl	$24, 232(%rbp)
	movq	$0, 248(%rbp)
	movb	$0, 256(%rbp)
	addq	$16, %rax
	movq	%rax, 168(%rbp)
	leaq	112(%r15), %rax
	movq	%rax, 240(%rbp)
.LEHB211:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE211:
	leaq	112(%rbp), %rdi
	movl	$10, %edx
	movq	-96(%rbp), %rcx
	movw	%dx, 128(%rbp)
	movq	632(%rbp), %rdx
	leaq	16(%rdi), %rax
	movq	%rdi, %r8
	movq	%rdi, -24(%rbp)
	movq	$1, 120(%rbp)
	movq	%rax, 112(%rbp)
.LEHB212:
	call	_ZN7omnetpp6common9opp_splitERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
.LEHE212:
	movq	112(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L2515
	call	_ZdlPv
.L2515:
	movq	56(%rbp), %rdx
	movq	48(%rbp), %rax
	cmpq	%rax, %rdx
	movq	%rdx, -80(%rbp)
	je	.L2516
	movq	%rax, -48(%rbp)
	leaq	80(%rbp), %rax
	movl	$0, -64(%rbp)
	movq	%rax, -72(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, -56(%rbp)
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rax
	movq	%rax, -88(%rbp)
	.p2align 4,,10
.L2517:
	movq	-24(%rbp), %rdi
	movq	-48(%rbp), %rdx
	movq	-72(%rbp), %rcx
	movq	$1, 120(%rbp)
	leaq	16(%rdi), %rax
	movq	%rdi, %r8
	movq	%rax, 112(%rbp)
	movl	$9, %eax
	movw	%ax, 128(%rbp)
.LEHB213:
	call	_ZN7omnetpp6common9opp_splitERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_
.LEHE213:
	movq	112(%rbp), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L2518
	call	_ZdlPv
.L2518:
	movq	88(%rbp), %rax
	movq	80(%rbp), %rsi
	cmpq	%rsi, %rax
	movq	%rax, -32(%rbp)
	je	.L2535
	movq	-24(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 112(%rbp)
	movq	(%rsi), %r12
	movq	8(%rsi), %rbx
	movq	%r12, %rax
	addq	%rbx, %rax
	je	.L2524
	testq	%r12, %r12
	je	.L2522
.L2524:
	movq	-24(%rbp), %rax
	addq	$32, %rsi
	xorl	%edi, %edi
	leaq	16(%rax), %r13
	movq	-40(%rbp), %rax
	leaq	16(%rax), %r15
	.p2align 4,,10
.L2649:
	cmpq	$15, %rbx
	movl	%edi, %r14d
	movq	%rbx, -8(%rbp)
	ja	.L2690
	cmpq	$1, %rbx
	jne	.L2528
	movzbl	(%r12), %eax
	movb	%al, 128(%rbp)
	movq	112(%rbp), %rax
.L2529:
	movq	%rbx, 120(%rbp)
	movb	$0, (%rax,%rbx)
	movq	%r15, %rcx
	movq	120(%rbp), %r8
	movq	112(%rbp), %rdx
.LEHB214:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	88(%rbp), %rax
	subq	80(%rbp), %rax
	sarq	$5, %rax
	subl	$1, %eax
	cmpl	%r14d, %eax
	je	.L2533
	movq	160(%rbp), %rax
	movl	640(%rbp), %ebx
	movq	%r15, %rcx
	movq	-24(%rax), %rdx
	movq	16(%rbp), %rax
	addl	(%rax,%rdi,4), %ebx
	movl	%ebx, %eax
	subl	120(%rbp), %eax
	cmpl	640(%rbp), %eax
	cmovl	640(%rbp), %eax
	xorl	%r8d, %r8d
	cltq
	movq	%rax, 176(%rbp,%rdx)
	leaq	.LC52(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE214:
.L2533:
	movq	112(%rbp), %rcx
	cmpq	%r13, %rcx
	je	.L2532
	call	_ZdlPv
.L2532:
	cmpq	%rsi, -32(%rbp)
	je	.L2535
	movq	%r13, 112(%rbp)
	movq	(%rsi), %r12
	addq	$1, %rdi
	movq	8(%rsi), %rbx
	addq	$32, %rsi
	movq	%r12, %rax
	addq	%rbx, %rax
	je	.L2649
	testq	%r12, %r12
	jne	.L2649
.L2522:
	leaq	.LC2(%rip), %rcx
.LEHB215:
	call	_ZSt19__throw_logic_errorPKc
	.p2align 4,,10
.L2690:
	movq	-56(%rbp), %rdx
	movq	-24(%rbp), %rcx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-8(%rbp), %rdx
	movq	%rax, 112(%rbp)
	movq	%rdx, 128(%rbp)
.L2527:
	movq	%rbx, %r8
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-8(%rbp), %rbx
	movq	112(%rbp), %rax
	jmp	.L2529
	.p2align 4,,10
.L2528:
	testq	%rbx, %rbx
	movq	%r13, %rax
	je	.L2529
	jmp	.L2527
	.p2align 4,,10
.L2535:
	movq	56(%rbp), %rax
	subq	48(%rbp), %rax
	movl	-64(%rbp), %edx
	sarq	$5, %rax
	leal	1(%rdx), %ebx
	subl	$1, %eax
	cmpl	%edx, %eax
	je	.L2521
	movq	160(%rbp), %rax
	movq	-24(%rax), %rax
	movq	400(%rbp,%rax), %rsi
	testq	%rsi, %rsi
	je	.L2691
	cmpb	$0, 56(%rsi)
	je	.L2539
	movsbl	67(%rsi), %edx
.L2540:
	movq	-40(%rbp), %rax
	leaq	16(%rax), %rcx
	call	_ZNSo3putEc
	movq	%rax, %rcx
	call	_ZNSo5flushEv
.L2521:
	movq	88(%rbp), %rsi
	movq	80(%rbp), %rdi
	cmpq	%rdi, %rsi
	je	.L2536
	.p2align 4,,10
.L2537:
	movq	(%rdi), %rcx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rcx
	je	.L2541
	addq	$32, %rdi
	call	_ZdlPv
	cmpq	%rsi, %rdi
	jne	.L2537
.L2542:
	movq	80(%rbp), %rdi
.L2536:
	testq	%rdi, %rdi
	je	.L2544
	movq	%rdi, %rcx
	call	_ZdlPv
	addq	$32, -48(%rbp)
	movq	-48(%rbp), %rax
	cmpq	%rax, -80(%rbp)
	je	.L2516
.L2545:
	movl	%ebx, -64(%rbp)
	jmp	.L2517
	.p2align 4,,10
.L2541:
	addq	$32, %rdi
	cmpq	%rdi, %rsi
	jne	.L2537
	jmp	.L2542
	.p2align 4,,10
.L2544:
	addq	$32, -48(%rbp)
	movq	-48(%rbp), %rax
	cmpq	%rax, -80(%rbp)
	jne	.L2545
.L2516:
	movq	624(%rbp), %rax
	leaq	16(%rax), %rbx
	movq	$0, 8(%rax)
	movb	$0, 16(%rax)
	movq	%rbx, (%rax)
	movq	208(%rbp), %rax
	testq	%rax, %rax
	je	.L2546
	movq	192(%rbp), %rdi
	movq	200(%rbp), %rsi
	cmpq	%rdi, %rax
	ja	.L2692
	leaq	80(%rbp), %rax
	testq	%rdi, %rdi
	movq	%rax, -72(%rbp)
	leaq	96(%rbp), %rax
	movq	%rax, 80(%rbp)
	je	.L2559
	testq	%rsi, %rsi
	je	.L2693
.L2559:
	subq	%rsi, %rdi
	cmpq	$15, %rdi
	movq	%rdi, 8(%rbp)
	ja	.L2694
	cmpq	$1, %rdi
	jne	.L2562
	movzbl	(%rsi), %eax
	movb	%al, 96(%rbp)
	movq	-72(%rbp), %rax
	addq	$16, %rax
.L2563:
	movq	%rdi, 88(%rbp)
	movb	$0, (%rax,%rdi)
	movq	-72(%rbp), %rdi
	movq	80(%rbp), %rdx
	movq	624(%rbp), %rax
	leaq	16(%rdi), %rcx
	movq	(%rax), %rax
	cmpq	%rcx, %rdx
	je	.L2564
	cmpq	%rax, %rbx
	movq	88(%rbp), %r8
	movq	96(%rbp), %rcx
	je	.L2695
	movq	624(%rbp), %rdi
	testq	%rax, %rax
	movq	16(%rdi), %r9
	movq	%rdx, (%rdi)
	movq	%r8, 8(%rdi)
	movq	%rcx, 16(%rdi)
	je	.L2566
	movq	%rax, 80(%rbp)
	movq	%r9, 96(%rbp)
.L2567:
	movq	$0, 88(%rbp)
	movb	$0, (%rax)
	movq	-72(%rbp), %rax
	movq	80(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	.L2676
	jmp	.L2558
	.p2align 4,,10
.L2539:
	movq	%rsi, %rcx
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rsi), %rax
	movl	$10, %edx
	movq	48(%rax), %rax
	cmpq	-88(%rbp), %rax
	je	.L2540
	movq	%rsi, %rcx
	call	*%rax
.LEHE215:
	movsbl	%al, %edx
	jmp	.L2540
	.p2align 4,,10
.L2491:
	addq	$32, %rsi
	cmpq	%rbx, %rsi
	jne	.L2490
	movq	48(%rbp), %rax
	movq	%rax, -56(%rbp)
	jmp	.L2489
	.p2align 4,,10
.L2692:
	movq	-24(%rbp), %rdi
	testq	%rsi, %rsi
	leaq	16(%rdi), %rdx
	movq	%rdx, 112(%rbp)
	je	.L2696
	subq	%rsi, %rax
	cmpq	$15, %rax
	movq	%rax, %rdi
	movq	%rax, 0(%rbp)
	ja	.L2697
	cmpq	$1, %rax
	jne	.L2551
	movzbl	(%rsi), %eax
	movb	%al, 128(%rbp)
.L2552:
	movq	%rdi, 120(%rbp)
	movb	$0, (%rdx,%rdi)
	movq	-24(%rbp), %rdi
	movq	112(%rbp), %rdx
	movq	624(%rbp), %rax
	leaq	16(%rdi), %rcx
	movq	(%rax), %rax
	cmpq	%rcx, %rdx
	je	.L2553
	cmpq	%rax, %rbx
	movq	120(%rbp), %r8
	movq	128(%rbp), %rcx
	je	.L2698
	movq	624(%rbp), %rdi
	testq	%rax, %rax
	movq	16(%rdi), %r9
	movq	%rdx, (%rdi)
	movq	%r8, 8(%rdi)
	movq	%rcx, 16(%rdi)
	je	.L2555
	movq	%rax, 112(%rbp)
	movq	%r9, 128(%rbp)
.L2556:
	movq	$0, 120(%rbp)
	movb	$0, (%rax)
	movq	-24(%rbp), %rax
	movq	112(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L2558
.L2676:
	call	_ZdlPv
.L2558:
	movq	56(%rbp), %rbx
	movq	48(%rbp), %rsi
	cmpq	%rsi, %rbx
	je	.L2572
	.p2align 4,,10
.L2573:
	movq	(%rsi), %rcx
	leaq	16(%rsi), %rax
	cmpq	%rax, %rcx
	je	.L2574
	addq	$32, %rsi
	call	_ZdlPv
	cmpq	%rbx, %rsi
	jne	.L2573
.L2575:
	movq	48(%rbp), %rsi
.L2572:
	testq	%rsi, %rsi
	je	.L2577
	movq	%rsi, %rcx
	call	_ZdlPv
.L2577:
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rdx
	movq	240(%rbp), %rcx
	addq	$24, %rax
	leaq	64(%rdx), %rdi
	movq	%rax, 144(%rbp)
	movq	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %xmm0
	addq	$104, %rax
	movq	%rax, 272(%rbp)
	movq	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movhps	-24(%rbp), %xmm0
	addq	$112, %rax
	cmpq	%rax, %rcx
	movaps	%xmm0, 160(%rbp)
	je	.L2578
	call	_ZdlPv
.L2578:
	movq	-40(%rbp), %rdi
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	leaq	80(%rdi), %rcx
	addq	$16, %rax
	movq	%rax, 168(%rbp)
	call	_ZNSt6localeD1Ev
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rdx
	leaq	128(%rdi), %rcx
	movq	8(%rax), %rax
	movq	48(%rdx), %rdx
	movq	-24(%rax), %rax
	movq	%rdx, 144(%rbp,%rax)
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rdx
	movq	32(%rax), %rax
	movq	40(%rdx), %rdx
	movq	%rax, 160(%rbp)
	movq	-24(%rax), %rax
	movq	%rdx, 160(%rbp,%rax)
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rdx
	movq	16(%rax), %rax
	movq	24(%rdx), %rdx
	movq	%rax, 144(%rbp)
	movq	-24(%rax), %rax
	movq	%rdx, 144(%rbp,%rax)
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 152(%rbp)
	addq	$16, %rax
	movq	%rax, 272(%rbp)
	call	_ZNSt8ios_baseD2Ev
	movq	16(%rbp), %rcx
	testq	%rcx, %rcx
	je	.L2443
	call	_ZdlPv
.L2443:
	movq	624(%rbp), %rax
	addq	$680, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.L2562:
	movq	-72(%rbp), %rax
	addq	$16, %rax
	testq	%rdi, %rdi
	je	.L2563
	jmp	.L2561
	.p2align 4,,10
.L2551:
	testq	%rax, %rax
	je	.L2552
	movq	%rdx, %rax
	jmp	.L2550
	.p2align 4,,10
.L2574:
	addq	$32, %rsi
	cmpq	%rsi, %rbx
	jne	.L2573
	jmp	.L2575
.L2546:
	movq	-40(%rbp), %rax
	movq	624(%rbp), %rcx
	leaq	96(%rax), %rdx
.LEHB216:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	jmp	.L2558
.L2694:
	movq	-72(%rbp), %rcx
	leaq	8(%rbp), %rdx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	8(%rbp), %rdx
	movq	%rax, 80(%rbp)
	movq	%rdx, 96(%rbp)
.L2561:
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	8(%rbp), %rdi
	movq	80(%rbp), %rax
	jmp	.L2563
.L2697:
	movq	-24(%rbp), %rcx
	movq	%rbp, %rdx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE216:
	movq	0(%rbp), %rdx
	movq	%rax, 112(%rbp)
	movq	%rdx, 128(%rbp)
.L2550:
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	0(%rbp), %rdi
	movq	112(%rbp), %rdx
	jmp	.L2552
.L2695:
	movq	624(%rbp), %rax
	movq	%rdx, (%rax)
	movq	%r8, 8(%rax)
	movq	%rcx, 16(%rax)
.L2566:
	movq	-72(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 80(%rbp)
	jmp	.L2567
.L2698:
	movq	624(%rbp), %rax
	movq	%rdx, (%rax)
	movq	%r8, 8(%rax)
	movq	%rcx, 16(%rax)
.L2555:
	movq	-24(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 112(%rbp)
	jmp	.L2556
.L2564:
	movq	624(%rbp), %rcx
	movq	%rdi, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	80(%rbp), %rax
	jmp	.L2567
.L2553:
	movq	624(%rbp), %rcx
	movq	%rdi, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	movq	112(%rbp), %rax
	jmp	.L2556
.L2599:
	movq	%rax, %rbx
.L2587:
	movq	-72(%rbp), %rcx
	call	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
.L2571:
	movq	-96(%rbp), %rcx
	call	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
.L2582:
	movq	-40(%rbp), %rcx
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev
.L2514:
	movq	16(%rbp), %rcx
	testq	%rcx, %rcx
	je	.L2588
	call	_ZdlPv
.L2588:
	movq	%rbx, %rcx
.LEHB217:
	call	_Unwind_Resume
.LEHE217:
.L2601:
	movq	%rax, %rbx
.L2505:
	movq	-64(%rbp), %rcx
	call	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
.L2502:
	movq	-24(%rbp), %rax
	movq	112(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L2507
	call	_ZdlPv
.L2507:
	movq	-96(%rbp), %rcx
	call	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
	jmp	.L2514
.L2608:
	movq	%rax, %rsi
	movq	624(%rbp), %rax
	movq	(%rax), %rcx
	cmpq	%rcx, %rbx
	je	.L2570
	call	_ZdlPv
.L2570:
	movq	%rsi, %rbx
	jmp	.L2571
.L2693:
	leaq	.LC2(%rip), %rcx
.LEHB218:
	call	_ZSt19__throw_logic_errorPKc
.L2696:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
.LEHE218:
.L2602:
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	144(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L2505
	call	_ZdlPv
	jmp	.L2505
.L2600:
	movq	%rax, %rbx
	jmp	.L2507
.L2598:
	movq	-24(%rbp), %rdx
	movq	112(%rbp), %rcx
	movq	%rax, %rbx
	addq	$16, %rdx
	cmpq	%rdx, %rcx
	je	.L2587
	call	_ZdlPv
	jmp	.L2587
.L2603:
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	144(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L2502
	call	_ZdlPv
	jmp	.L2502
.L2691:
.LEHB219:
	call	_ZSt16__throw_bad_castv
.LEHE219:
.L2607:
	movq	-24(%rbx), %rdx
	movq	%rbx, 144(%rbp)
	movq	%rax, %rbx
	movq	%rdi, 144(%rbp,%rdx)
	movq	$0, 152(%rbp)
.L2512:
	movq	-40(%rbp), %rcx
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	subq	$-128, %rcx
	addq	$16, %rax
	movq	%rax, 272(%rbp)
	call	_ZNSt8ios_baseD2Ev
	jmp	.L2514
.L2605:
	movq	%rax, %rbx
	jmp	.L2512
.L2596:
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	112(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L2582
	call	_ZdlPv
	jmp	.L2582
.L2606:
	movq	%rax, %r15
	movq	-40(%rbp), %rax
	leaq	24(%rax), %rcx
	call	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	movq	-24(%r13), %rax
	movq	%r12, 144(%rbp,%rax)
	movq	-24(%rsi), %rax
	movq	%rsi, 160(%rbp)
	movq	%r14, 160(%rbp,%rax)
	movq	-24(%rbx), %rax
	movq	%rbx, 144(%rbp)
	movq	%r15, %rbx
	movq	%rdi, 144(%rbp,%rax)
	movq	$0, 152(%rbp)
	jmp	.L2512
.L2604:
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	144(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L2514
	call	_ZdlPv
	jmp	.L2514
.L2597:
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	112(%rbp), %rcx
	addq	$16, %rax
	cmpq	%rax, %rcx
	je	.L2571
	call	_ZdlPv
	jmp	.L2571
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8597:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8597-.LLSDACSB8597
.LLSDACSB8597:
	.uleb128 .LEHB204-.LFB8597
	.uleb128 .LEHE204-.LEHB204
	.uleb128 .L2604-.LFB8597
	.uleb128 0
	.uleb128 .LEHB205-.LFB8597
	.uleb128 .LEHE205-.LEHB205
	.uleb128 .L2603-.LFB8597
	.uleb128 0
	.uleb128 .LEHB206-.LFB8597
	.uleb128 .LEHE206-.LEHB206
	.uleb128 .L2601-.LFB8597
	.uleb128 0
	.uleb128 .LEHB207-.LFB8597
	.uleb128 .LEHE207-.LEHB207
	.uleb128 .L2600-.LFB8597
	.uleb128 0
	.uleb128 .LEHB208-.LFB8597
	.uleb128 .LEHE208-.LEHB208
	.uleb128 .L2602-.LFB8597
	.uleb128 0
	.uleb128 .LEHB209-.LFB8597
	.uleb128 .LEHE209-.LEHB209
	.uleb128 .L2605-.LFB8597
	.uleb128 0
	.uleb128 .LEHB210-.LFB8597
	.uleb128 .LEHE210-.LEHB210
	.uleb128 .L2607-.LFB8597
	.uleb128 0
	.uleb128 .LEHB211-.LFB8597
	.uleb128 .LEHE211-.LEHB211
	.uleb128 .L2606-.LFB8597
	.uleb128 0
	.uleb128 .LEHB212-.LFB8597
	.uleb128 .LEHE212-.LEHB212
	.uleb128 .L2596-.LFB8597
	.uleb128 0
	.uleb128 .LEHB213-.LFB8597
	.uleb128 .LEHE213-.LEHB213
	.uleb128 .L2597-.LFB8597
	.uleb128 0
	.uleb128 .LEHB214-.LFB8597
	.uleb128 .LEHE214-.LEHB214
	.uleb128 .L2598-.LFB8597
	.uleb128 0
	.uleb128 .LEHB215-.LFB8597
	.uleb128 .LEHE215-.LEHB215
	.uleb128 .L2599-.LFB8597
	.uleb128 0
	.uleb128 .LEHB216-.LFB8597
	.uleb128 .LEHE216-.LEHB216
	.uleb128 .L2608-.LFB8597
	.uleb128 0
	.uleb128 .LEHB217-.LFB8597
	.uleb128 .LEHE217-.LEHB217
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB218-.LFB8597
	.uleb128 .LEHE218-.LEHB218
	.uleb128 .L2608-.LFB8597
	.uleb128 0
	.uleb128 .LEHB219-.LFB8597
	.uleb128 .LEHE219-.LEHB219
	.uleb128 .L2599-.LFB8597
	.uleb128 0
.LLSDACSE8597:
	.text
	.seh_endproc
	.section	.text$_ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_5__ops10_Iter_predIPFbcEEEET_SF_SF_T0_St26random_access_iterator_tag,"x"
	.linkonce discard
	.p2align 4,,15
	.globl	_ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_5__ops10_Iter_predIPFbcEEEET_SF_SF_T0_St26random_access_iterator_tag
	.def	_ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_5__ops10_Iter_predIPFbcEEEET_SF_SF_T0_St26random_access_iterator_tag;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_5__ops10_Iter_predIPFbcEEEET_SF_SF_T0_St26random_access_iterator_tag
_ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_5__ops10_Iter_predIPFbcEEEET_SF_SF_T0_St26random_access_iterator_tag:
.LFB9294:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rdx, %r12
	subq	%rcx, %rdx
	movq	%r8, %rsi
	movq	%rdx, %rax
	movq	%rcx, %rbx
	sarq	$2, %rax
	testq	%rax, %rax
	jle	.L2700
	leaq	(%rcx,%rax,4), %rdi
	jmp	.L2706
	.p2align 4,,10
.L2701:
	movsbl	1(%rbx), %ecx
	call	*%rsi
	testb	%al, %al
	jne	.L2725
	movsbl	2(%rbx), %ecx
	call	*%rsi
	testb	%al, %al
	jne	.L2726
	movsbl	3(%rbx), %ecx
	call	*%rsi
	testb	%al, %al
	jne	.L2727
	addq	$4, %rbx
	cmpq	%rdi, %rbx
	je	.L2728
.L2706:
	movsbl	(%rbx), %ecx
	call	*%rsi
	testb	%al, %al
	je	.L2701
.L2724:
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
.L2728:
	movq	%r12, %rdx
	subq	%rbx, %rdx
.L2700:
	cmpq	$2, %rdx
	je	.L2708
	cmpq	$3, %rdx
	je	.L2709
	cmpq	$1, %rdx
	je	.L2710
.L2707:
	movq	%r12, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
.L2725:
	leaq	1(%rbx), %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
.L2709:
	movsbl	(%rbx), %ecx
	call	*%rsi
	testb	%al, %al
	jne	.L2724
	addq	$1, %rbx
.L2708:
	movsbl	(%rbx), %ecx
	call	*%rsi
	testb	%al, %al
	jne	.L2724
	addq	$1, %rbx
.L2710:
	movsbl	(%rbx), %ecx
	call	*%rsi
	testb	%al, %al
	je	.L2707
	jmp	.L2724
	.p2align 4,,10
.L2726:
	leaq	2(%rbx), %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.p2align 4,,10
.L2727:
	leaq	3(%rbx), %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.seh_endproc
	.text
	.p2align 4,,15
	.globl	_ZN7omnetpp6common20opp_sanitizeFileNameERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN7omnetpp6common20opp_sanitizeFileNameERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN7omnetpp6common20opp_sanitizeFileNameERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN7omnetpp6common20opp_sanitizeFileNameERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8635:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	16(%rcx), %r14
	movq	%rcx, %rdi
	movq	%r14, (%rcx)
	movq	(%rdx), %rsi
	movq	8(%rdx), %rbx
	movq	%rsi, %rax
	addq	%rbx, %rax
	je	.L2730
	testq	%rsi, %rsi
	je	.L2752
.L2730:
	cmpq	$15, %rbx
	movq	%rbx, -88(%rbp)
	ja	.L2753
	cmpq	$1, %rbx
	jne	.L2733
	movzbl	(%rsi), %eax
	movb	%al, 16(%rdi)
	movq	%r14, %rax
.L2734:
	movq	%rbx, 8(%rdi)
	movb	$0, (%rax,%rbx)
	leaq	_ZN7omnetpp6commonL13isInvalidCharEc(%rip), %r8
	movq	(%rdi), %rcx
	movq	8(%rdi), %r13
	xorl	%r9d, %r9d
	addq	%rcx, %r13
	movq	%r13, %rdx
.LEHB220:
	call	_ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_5__ops10_Iter_predIPFbcEEEET_SF_SF_T0_St26random_access_iterator_tag
	cmpq	%rax, %r13
	movq	%rax, %r12
	je	.L2735
	leaq	1(%rax), %rbx
	cmpq	%rbx, %r13
	je	.L2735
	leaq	.LC0(%rip), %r15
	.p2align 4,,10
.L2738:
	movzbl	(%rbx), %esi
	leal	-32(%rsi), %eax
	cmpb	$94, %al
	ja	.L2737
	movsbl	%sil, %edx
	movq	%r15, %rcx
	call	strchr
	testq	%rax, %rax
	jne	.L2737
	movb	%sil, (%r12)
	addq	$1, %r12
.L2737:
	addq	$1, %rbx
	cmpq	%rbx, %r13
	jne	.L2738
.L2735:
	movq	(%rdi), %rax
	movq	%r12, %rdx
	subq	%rax, %rdx
	addq	8(%rdi), %rax
	cmpq	%rax, %r13
	je	.L2754
	movq	%r13, %r8
	movq	%rdi, %rcx
	subq	%r12, %r8
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8_M_eraseEyy
.LEHE220:
.L2729:
	movq	%rdi, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
.L2754:
	movq	%rdx, 8(%rdi)
	movb	$0, (%r12)
	jmp	.L2729
	.p2align 4,,10
.L2753:
	leaq	-88(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%rdi, %rcx
.LEHB221:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-88(%rbp), %rdx
	movq	%rax, (%rdi)
	movq	%rdx, 16(%rdi)
.L2732:
	movq	%rbx, %r8
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	memcpy
	movq	-88(%rbp), %rbx
	movq	(%rdi), %rax
	jmp	.L2734
	.p2align 4,,10
.L2733:
	testq	%rbx, %rbx
	movq	%r14, %rax
	je	.L2734
	jmp	.L2732
.L2744:
	movq	(%rdi), %rcx
	movq	%rax, %rbx
	cmpq	%rcx, %r14
	je	.L2742
	call	_ZdlPv
.L2742:
	movq	%rbx, %rcx
	call	_Unwind_Resume
.L2752:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
	nop
.LEHE221:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8635:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8635-.LLSDACSB8635
.LLSDACSB8635:
	.uleb128 .LEHB220-.LFB8635
	.uleb128 .LEHE220-.LEHB220
	.uleb128 .L2744-.LFB8635
	.uleb128 0
	.uleb128 .LEHB221-.LFB8635
	.uleb128 .LEHE221-.LEHB221
	.uleb128 0
	.uleb128 0
.LLSDACSE8635:
	.text
	.seh_endproc
	.section	.text.startup,"x"
	.p2align 4,,15
	.def	_GLOBAL__sub_I__ZN7omnetpp6common11opp_isblankEPKc;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I__ZN7omnetpp6common11opp_isblankEPKc
_GLOBAL__sub_I__ZN7omnetpp6common11opp_isblankEPKc:
.LFB9384:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitC1Ev
	leaq	__tcf_0(%rip), %rcx
	addq	$32, %rsp
	popq	%rbp
	jmp	atexit
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I__ZN7omnetpp6common11opp_isblankEPKc
	.globl	_ZTSSt9exception
	.section	.rdata$_ZTSSt9exception,"dr"
	.linkonce same_size
	.align 8
_ZTSSt9exception:
	.ascii "St9exception\0"
	.globl	_ZTISt9exception
	.section	.rdata$_ZTISt9exception,"dr"
	.linkonce same_size
	.align 8
_ZTISt9exception:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSSt9exception
	.globl	_ZTSSt13runtime_error
	.section	.rdata$_ZTSSt13runtime_error,"dr"
	.linkonce same_size
	.align 16
_ZTSSt13runtime_error:
	.ascii "St13runtime_error\0"
	.globl	_ZTISt13runtime_error
	.section	.rdata$_ZTISt13runtime_error,"dr"
	.linkonce same_size
	.align 8
_ZTISt13runtime_error:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt13runtime_error
	.quad	_ZTISt9exception
	.globl	_ZTSN7omnetpp6common17opp_runtime_errorE
	.section	.rdata$_ZTSN7omnetpp6common17opp_runtime_errorE,"dr"
	.linkonce same_size
	.align 32
_ZTSN7omnetpp6common17opp_runtime_errorE:
	.ascii "N7omnetpp6common17opp_runtime_errorE\0"
	.globl	_ZTIN7omnetpp6common17opp_runtime_errorE
	.section	.rdata$_ZTIN7omnetpp6common17opp_runtime_errorE,"dr"
	.linkonce same_size
	.align 8
_ZTIN7omnetpp6common17opp_runtime_errorE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSN7omnetpp6common17opp_runtime_errorE
	.quad	_ZTISt13runtime_error
	.globl	_ZTSN7omnetpp6common32opp_substitutevariables_resolverE
	.section	.rdata$_ZTSN7omnetpp6common32opp_substitutevariables_resolverE,"dr"
	.linkonce same_size
	.align 32
_ZTSN7omnetpp6common32opp_substitutevariables_resolverE:
	.ascii "N7omnetpp6common32opp_substitutevariables_resolverE\0"
	.globl	_ZTIN7omnetpp6common32opp_substitutevariables_resolverE
	.section	.rdata$_ZTIN7omnetpp6common32opp_substitutevariables_resolverE,"dr"
	.linkonce same_size
	.align 8
_ZTIN7omnetpp6common32opp_substitutevariables_resolverE:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSN7omnetpp6common32opp_substitutevariables_resolverE
	.section .rdata,"dr"
	.align 8
_ZTIN7omnetpp6common12_GLOBAL__N_116MapBasedResolverE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSN7omnetpp6common12_GLOBAL__N_116MapBasedResolverE
	.quad	_ZTIN7omnetpp6common32opp_substitutevariables_resolverE
	.align 32
_ZTSN7omnetpp6common12_GLOBAL__N_116MapBasedResolverE:
	.ascii "*N7omnetpp6common12_GLOBAL__N_116MapBasedResolverE\0"
	.globl	_ZTVN7omnetpp6common17opp_runtime_errorE
	.section	.rdata$_ZTVN7omnetpp6common17opp_runtime_errorE,"dr"
	.linkonce same_size
	.align 8
_ZTVN7omnetpp6common17opp_runtime_errorE:
	.quad	0
	.quad	_ZTIN7omnetpp6common17opp_runtime_errorE
	.quad	_ZN7omnetpp6common17opp_runtime_errorD1Ev
	.quad	_ZN7omnetpp6common17opp_runtime_errorD0Ev
	.quad	_ZNK7omnetpp6common17opp_runtime_error4whatEv
	.section .rdata,"dr"
	.align 8
_ZTVN7omnetpp6common12_GLOBAL__N_116MapBasedResolverE:
	.quad	0
	.quad	_ZTIN7omnetpp6common12_GLOBAL__N_116MapBasedResolverE
	.quad	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD1Ev
	.quad	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverD0Ev
	.quad	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolver18isVariableNameCharEc
	.quad	_ZN7omnetpp6common12_GLOBAL__N_116MapBasedResolverclERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZZN7omnetpp6common16opp_markup2LatexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE9substring:
	.ascii "`\0"
.lcomm _ZZN7omnetpp6common10opp_concatEPKcS2_S2_S2_E3buf,256,32
.lcomm _ZStL8__ioinit,1,1
	.align 16
.LC30:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC31:
	.long	-1
	.long	2146435071
	.align 8
.LC36:
	.long	-1
	.long	-1048577
	.ident	"GCC: (Rev2, Built by MSYS2 project) 7.1.0"
	.def	_ZdlPv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt13runtime_errorD2Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	strchr;	.scl	2;	.type	32;	.endef
	.def	__mingw_vsscanf;	.scl	2;	.type	32;	.endef
	.def	memcmp;	.scl	2;	.type	32;	.endef
	.def	__cxa_allocate_exception;	.scl	2;	.type	32;	.endef
	.def	_ZN7omnetpp6common17opp_runtime_errorC1EPKcz;	.scl	2;	.type	32;	.endef
	.def	__cxa_throw;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	_ZSt19__throw_logic_errorPKc;	.scl	2;	.type	32;	.endef
	.def	__cxa_free_exception;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcyy;	.scl	2;	.type	32;	.endef
	.def	_ZSt24__throw_out_of_range_fmtPKcz;	.scl	2;	.type	32;	.endef
	.def	__mingw_vsprintf;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	_Znay;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	_ZdaPv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEyc;	.scl	2;	.type	32;	.endef
	.def	__mingw_vsnprintf;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEyc;	.scl	2;	.type	32;	.endef
	.def	setlocale;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEcy;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEPKcyy;	.scl	2;	.type	32;	.endef
	.def	_ZSt20__throw_length_errorPKc;	.scl	2;	.type	32;	.endef
	.def	__mingw_strtod;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	strtol;	.scl	2;	.type	32;	.endef
	.def	strtoul;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtoull;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE14_M_replace_auxEyyyc;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6localeD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_baseC2Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6localeC1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_baseD2Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIxEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE7_M_syncEPcyy;	.scl	2;	.type	32;	.endef
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	_ZNSo3putEc;	.scl	2;	.type	32;	.endef
	.def	_ZNSo5flushEv;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt5ctypeIcE13_M_widen_initEv;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__throw_bad_castv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8_M_eraseEyy;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, "dr"
	.globl	.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE
	.linkonce	discard
.refptr._ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE:
	.quad	_ZTVNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE
	.section	.rdata$.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, "dr"
	.globl	.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE
	.linkonce	discard
.refptr._ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE:
	.quad	_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE
	.section	.rdata$.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE:
	.quad	_ZTVSt9basic_iosIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE:
	.quad	_ZTVSt15basic_streambufIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE, "dr"
	.globl	.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE
	.linkonce	discard
.refptr._ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE:
	.quad	_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE
