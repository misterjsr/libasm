section .text
	global _ft_strcpy

_ft_strcpy:
			xor		rcx, rcx			;dst = rdi, src = rsi
			cmp		rsi, 0				;tmp = 0 , i = 0
			je		return				;if (rsi == 0) -> vete a return
			jmp		copy				
			

increment:
			inc		rcx
copy:
			mov		dl, BYTE[rsi + rcx]
			mov		BYTE[rdi + rcx], dl
			cmp		dl, 0
			jne		increment

return:
			mov		rax, rdi
			ret