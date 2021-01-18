# Retorna el numero de 'a's en v.
# ./t6_recorrido_a ; echo $?
# 7

.data
v: .ascii "Esto es una cadena acabada en punto."
n: .long 0      # int n = 0;

.text           # code segment
.global main
main:           # main() {
	movl $0, %ecx  # for (i = 0; // ecx = i
for:
	cmpb $'.', v(%ecx) # for(?;v[i]!='.';?) {
	je endfor
	cmpb $'a', v(%ecx) # if (v[i]=='a')
	jne endif
	incl n         # n++;
endif:
	incl %ecx      # for (?;?;i++)
	jmp for
endfor:
	
	# LINUX EXIT
	movl n, %ebx    # return n
	movl $1, %eax
	int $0x80

