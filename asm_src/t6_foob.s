# Copiar la tercera palabra de 'iv' a 'ov'.
# Asumimos que no hay dobles espacios ni signos de puntuacion.
# 'iv' declarada como inicializada. El 'ov' como no inicializado.
SIZE = 100
.data
iv: .asciz "Uno dos tres quatro cinco seis siete ocho nueve diez onze"
# BEGIN DEBUG
s2: .asciz "[%c]"
s: .asciz "%c"
sr: .asciz "\n"
# END DEBUG
.bss
.comm ov,SIZE,1
.text
.global main
main:
 movl $1, %ebx # numero de palabra
 movl $0, %esi
for0:
 cmpl $3, %ebx
 je endfor0 # %ebx == $3
 cmpb $' ', iv(%esi)
 jne no_space # iv(%esi) != $' '
 incl %ebx
no_space:
 incl %esi
 jmp for0
endfor0:

 movl $0, %edi
for:
 cmpb $' ', iv(%esi)
 je endfor # iv(%esi) == $' '
 movb iv(%esi), %dl
 movb %dl, ov(%edi)
 incl %esi
 incl %edi
 jmp for
endfor:

# BEGIN DEBUG
 movb $0, ov(%edi) # Terminar ov con '\0'

 movl $0, %edi
for_printf:
 cmpb $0, ov(%edi)
 je endfor_printf # oc(%edi) == 0

 pushl ov(%edi)
 pushl $s
 call printf
 addl $8, %esp

 incl %edi
 jmp for_printf
endfor_printf:

 pushl $sr
 call printf
 addl $4, %esp

# END DEBUG

 movl $0, %ebx
 movl $1, %eax
 int $0x80

