# Retorna la posicion del primer negativo en v.
# ./t6_busqueda_i ; echo $?
# 5
# Si no hay ningun neg retorna 255 (-1)

.data
v: .int 1,2,3,4,5,-6,7,8,9,0

.text
.global main
main:
	movl $0, %ecx   # for (i = 0; // ecx = i
for:
	cmpl $0, v(,%ecx,4)     # for(?;v[i]!=0
	je endfor
	cmpl $0, v(,%ecx,4)     # && v[i]>=0;?) {
	jl endfor
	incl %ecx       # for (?;?;i++)
	jmp for
endfor:
	cmpl $0, v(,%ecx,4)     # if (v[i]<0)
	jge else
	movl %ecx, %eax # a = i;
	jmp endif
else:
	movl $-1, %eax  # a = -1; (255)
endif:

	# LINUX EXIT
	movl %eax, %ebx # return a
	movl $1, %eax
	int $0x80

