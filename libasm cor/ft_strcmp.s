section .text
	global _ft_strcmp

_ft_strcmp:
			xor		rcx, rcx		; i = 0
			cmp		rdi, 0			; if (!s1 || !s2) -> saltamos a null si no saltamos a loop
			je		null
			cmp		rsi, 0
			je		null
			jmp		loop

loop:		
			cmp		BYTE[rdi + rcx], 0
			je		rdi_end					; while (s1[i] != '\0' || s2[i] != '\0')
			cmp		BYTE[rsi + rcx], 0		; si ese bucle se cumple saltamos a check_char si no a compare
			je		superior
			mov		dl, BYTE[rdi + rcx]		;tmp = s1[i]
			cmp		dl, BYTE[rsi + rcx]		; tmp = tmp - s2[i]
		 	jg		superior				; if (tmp == 0)-> si se cumple saltamos a equal si no saltamos a inferior
			jl		inferior
			inc		rcx
			jmp		loop
			
null:		cmp		rdi, rsi
			je		equal
			jg		superior
			jl		inferior
rdi_end:
			cmp		BYTE[rsi + rcx], 0
			jz		equal
			jmp		inferior
equal:		
			mov		rax, 0
			ret
superior:
			mov		rax, 1
			ret

inferior:
			mov		rax, -1
			ret

			