.data
s: .asciz "Hello World!\n"
.text
.global main
main:
	# Pasar param (puntero a s)
	pushl $s
	# Llamar subrutina
	call printf
	# Eliminar param de la pila
	addl $4, %esp

	movl $1, %eax
	movl $0, %ebx
	int $0x80

