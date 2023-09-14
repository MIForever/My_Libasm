section .text
global my_memcpy


my_memcpy:
    xor rcx, rcx
    cmp rdx, 0
    je .end

.main_loop:
    mov al, byte [rsi]
    mov byte [rdi], al
    inc rcx
    inc rdi
    inc rsi

    cmp rdx, rcx
    je .end

    jmp .main_loop

.end:
    ret
