section .text
	global	_ft_strdup
	extern	_malloc
	extern	_ft_strcpy
_ft_strdup:
			cmp		rdi, 0			;if (!src)
			jz		my_error
		
len:
			xor		rcx, rcx		; i = 0
			jmp		compare
increment:	
			inc		rcx				;i++;

compare:	
			cmp		BYTE[rdi + rcx], 0	;while(s[i] != '\0')
			jne		increment
malloc:
			inc		rcx				;if (!src = malloc(ft_strlen(s) + 1);
			push	rdi				;guardamos s en la pila
			call	_malloc
			pop		r10				;pasamos s a r10 para dejar libre rdi para el strcpy
			cmp		rax, 0			; si malloc es nulo nos vamos a error
			jz		my_error
cpy:	
			mov		rdi, rax		;movemos la salida del malloc a rdi
			mov		rsi, r10		;movemos s (que lo habiamos guardado en la pila) en rsi
			call	_ft_strcpy		;hacemos el copy de rdi y rsi
			jmp		return
my_error:
			xor		rax, rax
return:
			ret

