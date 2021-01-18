#===[C equivalente]============
# int n=7; m=1;
# while (n<100||m<100) {n=n*2; m=m*3;}
# retornar n;

.data 		# initialized global data
n: .long 7	# int n = 7;
m: .long 1	# int m = 1;

.text		# code segment
.global main

main:
 movl n, %eax
 movl m, %ebx
while:		# while
 cmpl $100, %eax
 jl ok		# %eax<100
 cmpl $100, %ebx
 jge endwhile	# %ebx>=100
ok:		# Cuerpo del bucle
 imull $2, %eax
 imull $3, %ebx
 jmp while
endwhile:
 movl %eax, n
 
 # LINUX EXIT
 movl n, %ebx
 movl $1, %eax
 int $0x80

