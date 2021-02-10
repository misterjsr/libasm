section .text
	global _ft_strcmp

_ft_strcmp:
    mov     rax,    0
    mov     rcx,    -1

    loop:
            inc     rcx
            cmp		byte[rdi + rcx], 0
			je		s1_null	
            mov	    dl, byte [rdi + rcx]
            cmp		byte[rsi + rcx], 0		
			je		first
		    mov	    dh, byte [rsi + rcx]
            cmp     dl, dh
            jg      first
            jl      second
            cmp     dl, 0
            jne     loop
            ret  
    first:
            mov     rax, 1
            ret
    second:
            mov     rax, -1
            ret   
    s1_null:
            cmp		byte[rsi + rcx], 0
            jz      same
            jmp     second
            ret
    same:
            mov     rax, 0
            ret

