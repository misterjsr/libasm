#===[C equivalente]============
# int n=1, i=0;
# while (n<100 && i<64) {n=n*2; i++;}
# retornar n;

.data 		# initialized global data
n: .long 1	# int n = 1;
i: .long 0	# int i = 0;

.text		# code segment
.global main

main:
movl n, %eax
movl i, %ecx
while:
 cmpl $100, %eax
 jge endwhile   # %eax>=100
 cmpl $64, %ecx
 jge endwhile   # %ecx>=10
 imull $2, %eax
 incl %ecx
 jmp while
endwhile:
 movl %eax, n
 
 # LINUX EXIT
 movl n, %ebx # Retorna n%256 !
 movl $1, %eax
 int $0x80

