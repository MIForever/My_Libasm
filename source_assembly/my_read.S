section .text
global my_read


my_read:
    xor rax, rax
    syscall
    ret
