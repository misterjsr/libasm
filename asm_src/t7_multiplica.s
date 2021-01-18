.text
.global main
main:
	pushl $3
	pushl $2
	call multiplica
	addl $8, %esp
	movl %eax, %ebx
	
	pushl $2
	pushl $5
	call multiplica
	addl $8, %esp
	addl %eax, %ebx
	
	movl $1, %eax
	int $0x80

multiplica:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	pushl %ebx

	movl $0, -4(%ebp)
	movl 8(%ebp), %eax
	movl 12(%ebp), %ebx
multi_loop:
	cmp $0, %ebx
	je multi_endloop
	addl %eax, -4(%ebp)
	decl %ebx
	jmp multi_loop
multi_endloop:
	movl -4(%ebp), %eax
	popl %ebx
	addl $4, %esp
	popl %ebp
	ret

