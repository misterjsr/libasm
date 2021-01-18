#===[Equivalencia en C]============
# #define N = 10
# int i=2, j=3, k=6, r;
# r = (i + j) * ( k + (-2) ) + N;

N = 10		# define N 10

.data 		# initialized global data
i: .long 2	# int i = 2;
j: .long 3	# int j = 3;
k: .long 4	# int k = 4;

.bss		# uninitialized global data
.comm r,4,4	# int r;

.text		# code segment
.global main	# So the OS can call 'main'

main:		# main() {
 movl i, %eax	# i -> eax
 addl j, %eax	# i+j -> eax
 movl %eax, r	# i+j -> r

 movl k, %eax	# k -> eax
 addl $-2, %eax # k + (-2) -> eax
 imull r, %eax	# (i+j) * (k+(-2)) -> eax
# El operando destino de imul tiene que ser registro
 addl $N, %eax	# (i+j) * (k+(-2)) + N -> eax

 movl %eax, r	# (i+j) * (k+(-2)) + N -> r
 
 # LINUX EXIT
 #movl $0, %ebx	# Return 0 (the usual)
 movl r, %ebx	# Return r (its lowest byte)
 movl $1, %eax
 int $0x80

