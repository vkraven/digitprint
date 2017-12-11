.globl _start

.data
space:
	.asciz " "
	alen = . - space
msg:
	.asciz "Round Number : "
	len = . - msg

.text

_start:
	movq $0,%r15
	movq $10000000,%r12
	jmp _loop

_end:
	movq $60,%rax
	movq $0,%rdi
	syscall

_loop:
	cmp %r12,%r15
	je _end
	push %r12
	push %r15
	call _print
	pop %r15
	pop %r12
	incq %r15
	jmp _loop

_print:
	movq %r15,%r13
	movq $0,%r14
	movq $0,%r11
_parse:
	movq %r13,%rax
	movq $0,%rdx
	movq $10,%r13
	div %r13
	movq %rax,%r13
	movq %rdx,%r14
	add $48,%r14
	push %r14
	inc %r11
	cmp $0,%r13
	jne _parse

_printloop:
	movq %r11,%r14
	movq $1,%rdi
	movq $1,%rax
	movq $msg,%rsi
	movq $len,%rdx
	syscall	

_digitprint:
	movq $1,%rax
	movq $1,%rdi
	pop %r12
	movb %r12b,space
	movq $space,%rsi
	movq $alen,%rdx
	syscall	
	dec %r14
	cmp $0,%r14
	jne _digitprint
	movq $1,%rax
	movq $1,%rdi
	movb $10,space
	movq $space,%rsi
	movq $alen,%rdx
	syscall
	ret
