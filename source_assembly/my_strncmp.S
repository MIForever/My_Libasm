section .text
global my_strncmp


my_strncmp:
    xor rcx, rcx

.main_loop:
    cmp rcx, rdx
    je .equal

    mov al, byte [rdi]
    mov bl, byte [rsi]
    
    cmp al, bl
    jne .not_equal

    inc rdi
    inc rsi
    inc rcx

    cmp byte [rdi], 0
    je .equal
    cmp byte [rsi], 0
    je .equal

    jmp .main_loop

.equal:
    xor rax, rax
    ret

.not_equal:
    sub al, bl
    ret
