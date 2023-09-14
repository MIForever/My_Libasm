section .text
global my_strchr


my_strchr:
.strchr_loop:
    cmp byte [rdi], 0
    je .not_found

    cmp byte [rdi], sil
    je .return_strchr

    inc rdi

    jmp .strchr_loop

.return_strchr:
    mov rax, rdi
    ret

.not_found:
    xor rax, rax
    ret
