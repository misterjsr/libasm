#===[Equivalencia en C]============
# int a=2, b=3, r;
# r = a + b;

.data 		# initialized global data
a: .long 2	# int a = 2;
b: .long 3	# int b = 3;

.bss		# uninitialized global data
.comm r,4,4	# int r;

.text		# code segment
.global main	# So the OS can call 'main'

main:		# main() {
 movl a, %eax	# a -> eax
 addl b, %eax	# b + eax -> eax
 movl %eax, r	# eax -> r
 
 # LINUX EXIT
 #movl $0, %ebx	# Return 0 (the usual)
 movl r, %ebx	# Return r (lowest byte)
 movl $1, %eax
 int $0x80

