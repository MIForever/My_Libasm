section .text
global my_strlen


my_strlen:
    mov rax, 0

.strlen_loop:
    cmp byte [rdi], 0
    je .return_value

    inc rax
    inc rdi

    jmp .strlen_loop

.return_value:
    ret
