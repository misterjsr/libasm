# int n=7; m=1;
# while (n<100||m<100) {n=n*2; m=m*3;}
# retornar n;
.data
n: .long 7
m: .long 1
.text
.global main
main:
 movl n, %eax
 movl m, %ebx
loop:
 cmpl $100, %eax
 jl bodyloop # n<100
 cmpl $100, %ebx
 jl bodyloop # m<100
 jmp endloop
bodyloop:
 imul $2, %eax
 imul $3, %ebx
 jmp loop
endloop:
 movl %eax, n
 movl %ebx, m

 movl n, %ebx
 movl $1, %eax
 int $0x80

