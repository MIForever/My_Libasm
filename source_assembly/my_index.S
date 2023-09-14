section .text
global my_index


my_index:
    xor rax, rax

.main_loop:
    cmp byte [rdi], sil
    je .found

    inc rax
    inc rdi

    cmp byte [rdi], 0
    je .ret_zero

    jmp .main_loop

.found:
    mov rax, rdi
    ret

.ret_zero:
    xor rax, rax
    ret
