N = 10
.data
v: .word 1,2,3,4,5,6,7,8,9,-1
.bss
.comm min,2,2
.comm max,2,2
.text
.global main
main:
	movl $0, %ecx
	movw v(,%ecx,2), %dx
	movw %dx, min
	movw %dx, max
	movl $1, %ecx
	movw v(,%ecx,2), %dx
for:
	# %ecx>=$N -> endfor
	cmpl $N, %ecx
	jge endfor

	# %dx<=max -> endifmax
	cmpw max, %dx
	jle endifmax
	movw %dx, max
endifmax:

	# %dx>=min -> endifmin
	cmpw min, %dx
	jge endifmin
	movw %dx, min
endifmin:

	incl %ecx
	movw v(,%ecx,2), %dx
	jmp for
endfor:

	movswl max, %ebx
	movl $1, %eax
	int $0x80

