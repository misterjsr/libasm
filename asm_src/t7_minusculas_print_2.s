SIZE = 100
.data
is: .asciz "Demasiadas Mayusculas PARA TAN pOcAs BalAs.\n"
.bss
.comm os,SIZE,1
.text
.global main
main:
	pushl $is
	call printf
	addl $4, %esp

	movl $0, %ecx
for:
	# is(%ecx)==$0
	cmpb $0, is(%ecx)
	je endfor
	pushl %ecx
	movsbl is(%ecx), %edx
	pushl %edx
	call minuscula
	addl $4, %esp
	popl %ecx
	movb %al, os(%ecx)
	incl %ecx
	jmp for
endfor:
	movb $0, os(%ecx)

	pushl $os
	call printf
	addl $4, %esp

	movl $0, %ebx
	movl $1, %eax
	int $0x80

minuscula:
	pushl %ebp
	movl %esp, %ebp

	movb 8(%ebp), %al
	# %al < $'A'
	cmpb $'A', %al
	jl minendif
	# %al > $'Z'
	cmpb $'Z', %al
	jg minendif
	addb $'a'-'A', %al

minendif:
	popl %ebp
	ret

