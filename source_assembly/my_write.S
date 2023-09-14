section .text
global my_write

my_write:
    mov rax, 1
    syscall
    ret
