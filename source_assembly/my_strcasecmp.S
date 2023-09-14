section .text
global my_strcasecmp

my_strcasecmp:
    xor rax, rax

.loop:
    mov al, byte [rdi]
    mov bl, byte [rsi]
    cmp al, 0
    je  .done

    cmp bl, 0
    je  .done

    cmp al, 'A'
    jl  .no_convert
    cmp al, 'Z'
    jg  .no_convert
    add al, 32

.no_convert:

    cmp bl, 'A'
    jl  .no_convert2
    cmp bl, 'Z'
    jg  .no_convert2
    add bl, 32

.no_convert2:

    cmp al, bl
    jne .done

    inc rdi
    inc rsi
    jmp .loop

.done:
    mov al, [rdi]
    mov bl, [rsi]
    sub al, bl
    ret
