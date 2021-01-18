#===[Equivalencia en C]============
# int i=0, j=3, r;
# i++; j--;
# j = -j;
# r = i - j;

.data 		# initialized global data
i: .long 0	# int i = 0;
j: .long 3	# int j = 3;

.bss		# uninitialized global data
.comm r,4,4	# int r;

.text		# code segment
.global main

main:		# main() {
 incl i		# i++
 decl j		# j--
 negl j		# j = -j

 movl i, %eax	# i-> eax
 subl j, %eax	# i-j -> eax

 movl %eax, r	# i-j -> r
 
 # LINUX EXIT
 #movl $0, %ebx	# Return 0 (the usual)
 movl r, %ebx	# Return r (its lowest byte)
 movl $1, %eax
 int $0x80

