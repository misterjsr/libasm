.data
sp: .asciz "Intro 2 nums: "
ss: .asciz "%d %d"
sp2: .asciz "Los nums son: %d y %d. Scanf retorna %d.\n"
.bss
.comm n1,4,4
.comm n2,4,4
.comm ret,4,4
.text
.globl main
main:
	pushl $sp
	call printf
	addl $4, %esp

	pushl $n2
	pushl $n1
	pushl $ss
	call scanf
	addl $12, %esp
	movl %eax, ret

	pushl ret
	pushl n2
	pushl n1
	pushl $sp2
	call printf
	addl $16, %esp

	movl $0, %ebx
	movl $1, %eax
	int $0x80

