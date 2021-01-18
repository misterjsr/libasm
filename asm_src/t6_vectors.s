.data
vw: .word 4,5,6 # short vw[3]={4,5,6};
.text
.global main
main:
	movw $1, %cx            # i=1;
	movswl %cx, %ebx        # Trampa!
	# Rb & Ri tienen que ser de 32 bits!
	movw %cx, vw(,%ebx,2)   # vw[i]=i;
	# Ahora vw={4,1,6}
	movl vw(,%ebx,2), %ebx
	
	movl $1,%eax
	int $0x80
