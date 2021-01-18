#===[C equivalente]============
# n=0;
# for (i=1;i<5;i++)
#   for (j=i;j<5;j++)
#     n++; ret n;

.text		# code segment
.global main
main:		# main() {
 movl $0, %eax
 movl $1, %esi
fori:
 cmpl $5, %esi
 jge endfori #  %esi>=5
 movl %esi, %edi
forj:
 cmpl $5, %edi
 jge endforj #  %edi>=5
 incl %eax
 incl %edi
 jmp forj
endforj:
 incl %esi
 jmp fori
endfori:
 # LINUX EXIT
 movl %eax, %ebx
 movl $1, %eax
 int $0x80

