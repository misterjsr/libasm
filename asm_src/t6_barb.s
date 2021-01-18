# Copiar 'iv' a 'ov' cambiando ' 's por '_'s.
# 'iv' declarada como inicializada. El 'ov' como no inicializado.
SIZE = 100
.data
iv: .asciz "Hay mucho espacio en blanco por aqui."
# BEGIN DEBUG
s: .asciz "%c"
sr: .asciz "\n"
# END DEBUG
.bss
.comm ov,SIZE,1
.text
.global main
main:
 movl $0, %ecx
for:

 cmpb $0, iv(%ecx)
 je endfor # iv(%ecx) == $0

 cmpb $' ', iv(%ecx)
 je else # iv(%ecx) == $' '
 movb iv(%ecx), %al
 movb %al, ov(%ecx)
 jmp endif
else:
 movl $'_', ov(%ecx)
endif:

 incl %ecx
 jmp for
endfor:

# BEGIN DEBUG
 movl $0, %ecx
for_printf:
 cmpb $0, ov(%ecx)
 je endfor_printf # oc(%ecx) == 0

 pushl %ecx
 pushl ov(%ecx)
 pushl $s
 call printf
 addl $8, %esp
 popl %ecx

 incl %ecx
 jmp for_printf
endfor_printf:

 pushl $sr
 call printf
 addl $4, %esp

# END DEBUG

 movl $0, %ebx
 movl $1, %eax
 int $0x80

