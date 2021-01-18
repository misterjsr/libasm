# Retorna la suma de los elementos de un vector acabado en 0.
# ./t6_recorrido_i ; echo $?
# 45

.data
v: .int 1,2,3,4,5,6,7,8,9,0

.text
.global main
main:
	movl $0, %eax
	movl $0, %ecx   # for (i = 0;
for:
	cmpl $0, v(,%ecx,4)     # for(?;v[i]!=0;?) {
	je endfor
	addl v(,%ecx,4), %eax   # a=a+v[i];
	incl %ecx       # for (?;?;i++)
	jmp for
endfor:
	
	# LINUX EXIT
	movl %eax, %ebx # return a
	movl $1, %eax
	int $0x80

