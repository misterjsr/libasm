.data
sfunc: .asciz "func: (%d) (%d)\n"
sswap: .asciz "swap: (@0x%X:%d) (@0x%X:%d)\n"
sswap2: .asciz "swap: (esi:%d) (edi:%d)\n"
.text
.global main
main:
	pushl $7
	call func
	addl $4, %esp

	movl $0, %ebx
	movl $1, %eax
	int $0x80

func:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	pushl %ebx

	movl $-7, -4(%ebp)

	pushl -4(%ebp)
	pushl 8(%ebp)
	pushl $sfunc
	call printf
	addl $12, %esp

	movl %ebp, %ebx
	subl $4, %ebx
	pushl %ebx # puntero a -4(%ebp)
	movl %ebp, %ebx
	addl $8, %ebx
	pushl %ebx # puntero a 8(%ebp)
	call swap
	addl $8, %esp

	pushl -4(%ebp)
	pushl 8(%ebp)
	pushl $sfunc
	call printf
	addl $12, %esp

	popl %ebx
	addl $4, %esp
	popl %ebp
	ret

swap:
	pushl %ebp
	movl %esp, %ebp
	pushl %esi
	pushl %edi

	movl 12(%ebp), %ecx
	pushl (%ecx)
	pushl %ecx
	movl 8(%ebp), %eax
	pushl (%eax)
	pushl %eax
	pushl $sswap
	call printf
	addl $20, %esp

	movl 8(%ebp), %eax
	movl 12(%ebp), %ecx
	movl (%eax), %esi
	movl (%ecx), %edi
	movl %edi, (%eax)
	movl %esi, (%ecx)

	pushl %edi
	pushl %esi
	pushl $sswap2
	call printf
	addl $12, %esp

	movl 12(%ebp), %ecx
	pushl (%ecx)
	pushl %ecx
	movl 8(%ebp), %eax
	pushl (%eax)
	pushl %eax
	pushl $sswap
	call printf
	addl $20, %esp

	popl %edi
	popl %esi
	popl %ebp
	ret

