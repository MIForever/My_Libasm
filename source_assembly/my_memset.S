section .text
global my_memset


my_memset:
    xor rcx, rcx
    cmp rdx, rcx
    je .end

.memset_loop:
    mov byte [rdi], sil

    inc rcx
    inc rdi

    cmp rcx, rdx
    je .end

    jmp .memset_loop

.end:
    ret
