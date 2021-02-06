section .text
	global _ft_strcpy

_ft_strcpy:
    mov     rcx, -1
    loop:
            inc     rcx
            mov		dl, BYTE[rsi + rcx]
            mov		BYTE[rdi + rcx], dl
            cmp     dl, 0
            jne	    loop
            mov		rdx, rdi
			ret
