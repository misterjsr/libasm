# Cuantos ceros, positivos y negativos hay en el vector 'v' de 'n' elementos?
# 'v' y 'n' declaradas como inicializadas. el resto como no inicializadas.
.data
n: .long 8
v: .long 7,9,2,3,-4,-5,-6,0
# BEGIN DEBUG
s: .asciz "Ceros:%d. Positivos:%d. Negativos:%d.\n"
# END DEBUG
.bss
.comm cero,4,4
.comm posi,4,4
.comm nega,4,4
.text
.global main
main:
 movl $0, cero
 movl $0, posi
 movl $0, nega
 movl $0, %ecx
etiq_for:
 cmpl n, %ecx
 jge etiq_endfor # %ecx >= n

 cmpl $0, v(,%ecx,4)
# je etiq_cero # == 0
 jg etiq_posi # > 0
 jl etiq_nega # < 0
etiq_cero:
 incl cero
 jmp etiq_forinc
etiq_posi:
 incl posi
 jmp etiq_forinc
etiq_nega:
 incl nega
# jmp etiq_forinc
etiq_forinc:
 incl %ecx
 jmp etiq_for
etiq_endfor:

# BEGIN DEBUG
 pushl %ecx
 pushl nega
 pushl posi
 pushl cero
 pushl $s
 call printf
 addl $16, %esp
 popl %ecx
# END DEBUG

 movl $0, %ebx
 movl $1, %eax
 int $0x80

