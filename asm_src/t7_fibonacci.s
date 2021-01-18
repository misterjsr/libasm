SIZE = 20
.data
s: .asciz "%d\n"
.bss
.comm v,4*SIZE,4
.text
.global main
main:
 # fibonacci[0]=0
 movl $0, %ecx
 movl $0, v(, %ecx,4)
 # fibonacci[1]=1
 movl $1, %ecx
 movl $1, v(, %ecx,4)
 # fibonacci[2..SIZE]
 movl $2, %ecx
loop:
 # %ecx>=$SIZE
 cmpl $SIZE, %ecx
 jge endloop

 push %ecx
 push $v
 call fibonacci
 addl $4, %esp
 popl %ecx

 incl %ecx
 jmp loop
endloop:

 # printf the array
 movl $0, %ecx
loop_print:
 cmpl $SIZE, %ecx
 jge endloop_print
 pushl %ecx
 pushl v(,%ecx,4)
 pushl $s
 call printf
 addl $8, %esp
 popl %ecx
 incl %ecx
 jmp loop_print
endloop_print:

 # the end
 movl $0, %ebx
 movl $1, %eax
 int $0x80

fibonacci:
 pushl %ebp
 movl %esp, %ebp
 pushl %ebx

 movl 12(%ebp), %ecx
 movl 8(%ebp), %ebx

 movl -4(%ebx,%ecx,4), %edx
 addl -8(%ebx,%ecx,4), %edx
 movl %edx, (%ebx,%ecx,4)

 popl %ebx
 popl %ebp
 ret

