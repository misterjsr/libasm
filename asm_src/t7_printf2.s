.data
i: .int 21, 15, 34, 11, 6, 50, 32, 80, 10, 0 # Acabado en 0
s: .asciz "i[%d] = %d\n" # .asciz es como .ascii pero acabado en '\0'
.text
.globl main
main:
	movl $0, %ecx
loop:
	pushl %ecx              # 1 Salvar eax,ecx,edx
	pushl i(,%ecx,4)        # 2 Pasar params
	pushl %ecx              # 2 Pasar params
	pushl $s                # 2 Pasar params
	call printf             # 3 Llamar subrutina
	                        # 12 Resultado en eax
	addl $12, %esp          # 13 Eliminar params
	popl %ecx               # 14 Restaurar eax,ecx,edx
	incl %ecx
	cmpl $0, i(,%ecx,4)
	jne loop

	movl $1, %eax
	movl $0, %ebx
	int $0x80

