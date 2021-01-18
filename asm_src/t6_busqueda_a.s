# Retorna la posicion de la primera 'a' en v.
# ./t6_busqueda_a ; echo $?
# 10
# Si no hi hay ninguna 'a' retorna 255 (-1)

.data
v: .ascii "Esto es una cadena acabada en punto."
n: .long 0      # int n = 0;

.text
.global main
main:
	movl $0, %ecx   # for (i = 0; // ecx = i
for:
	cmpb $'.', v(%ecx)  # for(?;v[i]!='.'
	je endfor
	cmpb $'a', v(%ecx)  # && v[i]!='a';?) {
	je endfor
	incl %ecx       # for (?;?;i++)
	jmp for
endfor:
	cmpb $'a', v(%ecx)  # if (v[i]=='a')
	jne else
	movl %ecx, n    # n = i;
	jmp endif
else:
	movl $-1, n     # n = -1; (255)
endif:

	# LINUX EXIT
	movl n, %ebx    # return n
	movl $1, %eax
	int $0x80

