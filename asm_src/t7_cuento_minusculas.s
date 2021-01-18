NUM_LETRAS = 26
SIZE_LETRAS = +4*NUM_LETRAS
OFFSET_LETRAS = -4*NUM_LETRAS
.data
s_intro: .asciz "Cuento las apariciones de letras minusculas.\n\n"
s1: .asciz "hola, muchas letras veo yo!"
s2: .asciz "murcielago"
s3: .asciz "9aaaaaaaaas"
s: .asciz "%d "
sc: .asciz "%c"
sr: .asciz "\n\n"
s_letras: .asciz "\na b c d e f g h i j k l m n o p q r s t u v w x y z\n"
.text
.global main
main:
 pushl $s_intro
 call printf
 addl $4, %esp

 pushl $s1
 call letras
 addl $4, %esp

 pushl $s2
 call letras
 addl $4, %esp

 pushl $s3
 call letras
 addl $4, %esp

 movl $0, %ebx
 movl $1, %eax
 int $0x80

letras:
 pushl %ebp
 movl %esp, %ebp
 subl $SIZE_LETRAS, %esp
 pushl %ebx
 pushl %esi

 movl $0, %ecx
 movl %ebp, %ebx
 addl $OFFSET_LETRAS, %ebx
letras_for0:
 cmpl $NUM_LETRAS, %ecx
 jge letras_endfor0 # %ecx>=$NUM_LETRAS
 movl $0, (%ebx,%ecx,4)
 incl %ecx
 jmp letras_for0
letras_endfor0:

 movl 8(%ebp), %esi
 movl $0, %ecx
letras_for1:
 cmpb $0, (%esi,%ecx)
 je letras_endfor1 # $0==(%esi,%ecx)

 pushl %ecx
 pushl (%esi,%ecx)
 pushl $sc
 call printf
 addl $8, %esp
 popl %ecx

 # passar de 'a' a 0, de 'b' a 1, ..., 'z' a 25
 movl $0, %eax
 movb (%esi,%ecx), %al
 # begin controlar que passa si (%al<'a' || %al>'z')
 cmpb $'a', %al
 jl letras_incfor1 # %al<'a'
 cmpb $'z', %al
 jg letras_incfor1 # %al>'z'
 # end controlar 
 subb $'a', %al
 
 incl (%ebx,%eax,4)

letras_incfor1:
 incl %ecx
 jmp letras_for1
letras_endfor1:
 
 pushl %ecx
 pushl $s_letras
 call printf
 addl $4, %esp
 popl %ecx

 movl $0, %ecx
letras_for2:
 cmpl $NUM_LETRAS, %ecx
 jge letras_endfor2 # %ecx>=$NUM_LETRAS

 pushl %ecx
 pushl (%ebx,%ecx,4)
 pushl $s
 call printf
 addl $8, %esp
 popl %ecx

 incl %ecx
 jmp letras_for2
letras_endfor2:

 pushl $sr
 call printf
 addl $4, %esp

 popl %esi
 popl %ebx
 movl %ebp, %esp
 popl %ebp
 ret

