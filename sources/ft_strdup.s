section .text
extern _malloc
extern _ft_strlen
extern _ft_strcpy
	global _ft_strdup

_ft_strdup:
	call    _ft_strlen
	inc     rax
    push    rdi
	mov     rdi, rax
	call     _malloc
	cmp     rax, 0
	je      return
	pop     rsi
	mov     rdi, rax
	call    _ft_strcpy
	return:
            ret