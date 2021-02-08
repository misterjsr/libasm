section .text
	global _ft_strcmp

_ft_strcmp:
    mov     rax,    0
    mov     rcx,    -1

    loop:
            inc     rcx
            mov	    dl, byte [rdi + rcx]
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

