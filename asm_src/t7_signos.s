.data
s: .asciz "\nCeros:%d. Positivos:%d. Negativos:%d.\n"
sd: .asciz "%d, "
n1: .long 8
v1: .long 7,9,2,3,-4,-5,-6,0
n2: .long 6
v2: .long 1,2,3,-4,-5,-6
n3: .long 1
v3: .long 1
.text
.global main
main:
	pushl $v1
	pushl n1
	call signos         # signos(n1,v1)
	addl $8, %esp

	pushl $v2
	pushl n2
	call signos         # signos(n2,v2)
	addl $8, %esp

	pushl $v3
	pushl n3
	call signos         # signos(n3,v3)
	addl $8, %esp

	movl $0, %ebx
	movl $1, %eax
	int $0x80

signos:                 # void signos(int n, int *v)
	pushl %ebp          # Salvar antiguo base pointer
	movl %esp, %ebp     # Establecer enlace dinamico
	subl $12, %esp      # Reservar para 3 var long
	pushl %ebx          # Salvar regs %ebx %esi %edi

	movl $0, -4(%ebp)   # Inicializar VarLoc1 a 0
	movl $0, -8(%ebp)   # Inicializar VarLoc2 a 0
	movl $0, -12(%ebp)  # Inicializar VarLoc3 a 0
	movl $0, %ecx       # Inicializar indice a 0
	movl 12(%ebp), %ebx # Parametro2 ('v') a %ebx
signos_for:
	cmpl 8(%ebp), %ecx  # Comp Parametro1('n') y %ecx
	jge signos_endfor   # Si hemos recorrido 'v' salir

	pushl %ecx
	pushl (%ebx,%ecx,4) # <- esto es v[i]
	pushl $sd
	call printf         # printf("%d, ", v[i]);
	addl $8, %esp
	popl %ecx

	cmpl $0, (%ebx,%ecx,4) # cmp v[i] con 0
#   je signos_zero # == 0  # si v[i] es 0...
	jg signos_posi # > 0   # si v[i] es > 0...
	jl signos_nega # < 0   # si v[i] es < 0...
signos_zero:               # v[i] es 0
	incl -4(%ebp)          # VarLoc1++
	jmp signos_forinc      # salto a fin iteracion
signos_posi:               # v[i] es > 0
	incl -8(%ebp)          # VarLoc2++
	jmp signos_forinc      # salto a fin iteracion
signos_nega:               # v[i] es < 0
	incl -12(%ebp)         # VarLoc3++
#   jmp signos_forinc      # salto a fin iteracion
signos_forinc:             # final de iteracion
	incl %ecx              # i++ (contador de bucle)
	jmp signos_for         # salto a principio bucle
signos_endfor:             # final de bucle

	pushl %ecx
	pushl -12(%ebp)    # VarLoc3
	pushl -8(%ebp)     # VarLoc2
	pushl -4(%ebp)     # VarLoc1
	pushl $s
	call printf        # Imprimo las 3 Var locales
	addl $16, %esp
	popl %ecx

	popl %ebx          # Restaurar %edi, %esi, %ebx
	addl $12, %esp     # Liberar espacio Var Locales
	popl %ebp          # Deshacer enlace dinamico
	ret                # Retornar

