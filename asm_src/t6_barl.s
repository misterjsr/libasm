# Fibonacci en un vector de 'n' elementos.
# 'n' declarada como inicializada. El vector como no inicializado.
SIZE = 20
.data
n: .long 20
# BEGIN DEBUG
s: .asciz "%d\n"
# END DEBUG
.bss
.comm v,SIZE*4,4
.text
.global main
main:
 cmpl $1, n
 jl end # n < 1
 movl $0, %ecx
 movl $0, v(,%ecx,4)

 cmpl $2, n
 jl end # n < 2
 movl $1, %ecx
 movl $1, v(,%ecx,4)

 movl $0, %esi
 movl $1, %edi
 movl $2, %ecx
for:
 cmpl n, %ecx
 jg endfor # %ecx > n

 movl v(,%esi,4), %eax
 addl v(,%edi,4), %eax
 movl %eax, v(,%ecx,4)
 incl %esi
 incl %edi
 incl %ecx
 jmp for
endfor:

end:
# BEGIN DEBUG
 movl $0, %ecx
for_printf:
 cmpl n, %ecx
 jge endfor_printf # %ecx >= n

 pushl %ecx
 pushl v(,%ecx,4)
 pushl $s
 call printf
 addl $8, %esp
 popl %ecx

 incl %ecx
 jmp for_printf
endfor_printf:
# END DEBUG

 movl $0, %ebx
 movl $1, %eax
 int $0x80

