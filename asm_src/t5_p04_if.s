#===[Equivalencia en C]============
# int a=3, b=3, r;
# if (a >= b) r=1; else r=0;

.data 		# initialized global data
a: .long 3	# int a = 3;
b: .long 3	# int b = 3;

.bss		# uninitialized global data
.comm r,4,4	# int r;

.text		# code segment
.global main

main:		# main() {
 movl a, %eax
 cmpl b, %eax	# if (a >= b)
 jl else	# {
 movl $1, r	#   r=1;
 jmp endif	# }
else:		# else {
 movl $0, r	#   r=0;
endif:		# }
 
 # LINUX EXIT
 #movl $0, %ebx	# Return 0 (the usual)
 movl r, %ebx	# Return r (its lowest byte)
 movl $1, %eax
 int $0x80

