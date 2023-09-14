section .text
global my_memmove


my_memmove:
    xor rcx, rcx
    cmp rdx, rcx
    je .end

.main_loop:
    mov al, byte [rsi]
    mov byte [rdi], al

    inc rdi
    inc rsi
    inc rcx

    cmp byte [rsi], 0
    je .end

    cmp rcx, rdx
    jnz .main_loop

.end:
    ret
