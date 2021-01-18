#===[Equivalencia en C]============
# int f=1, n=3, i;
# i=1; while(i<=n) {f=f*i;i++;}
# retornar f; // f <- n factorial

.data 		# initialized global data
f: .long 1	# int f = 1;
n: .long 3	# int n = 3;

.text		# code segment
.global main

main:		# main() {
 movl f, %eax
 movl $1, %ecx		# i = 1; // ecx = i
while:				# while (i<=n)
 cmpl n, %ecx
 jg endwhile
 imull %ecx, %eax	# f=f*i; # op2 registro!
 incl %ecx			# i++;
 jmp while
endwhile:
 movl %eax, f
 
 # LINUX EXIT
 movl f, %ebx		# Return f (its lowest byte)
 movl $1, %eax
 int $0x80

