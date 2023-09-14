section .text
global my_strcmp


my_strcmp:
.main_loop:
    cmp byte [rdi], 0
    je .ret_zero

    cmp byte [rsi], 0
    je .ret_zero

    cmp byte [rdi], al
    jne .end

    inc rdi
    inc rsi

    jmp .main_loop

.ret_zero:
    xor rax, rax
    ret

.end:
    mov rax, rdi
    sub rax, rsi
    ret
