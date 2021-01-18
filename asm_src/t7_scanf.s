.data
s: .asciz "Introduce un num :"
is: .asciz "%d"
os: .asciz "El num es: %d. Scanf retorna %d.\n"
.bss
.comm n,4,4
.text
.global main
main:
	#printf(s);
	pushl $s
	call printf
	addl $4, %esp

	#scanf(is, &n);
	pushl $n
	pushl $is
	call scanf
	addl $8, %esp

	#printf(os,n,eax)
	pushl %eax
	pushl n
	pushl $os
	call printf
	addl $12, %esp

	movl $0, %ebx
	movl $1, %eax
	int $0x80

