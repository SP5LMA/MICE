; =====================================================
; To assemble and run:
;   nasm -felf64 -gdwarf  10-factorialfun.asm
;   gcc 10-testfactorialfun.c 10-factorialfun.o  -o 10-factorialfun
;   ./10-factorialfun
; =====================================================

global factorial

section .text
factorial:
;    jmp recursivefactorial
    cmp rdi, 0
    jne loopversion
    mov eax, 1
    ret

loopversion:
    mov eax, 1
loopfactorial:
    mul rdi
    cmp rdx, 0
    jnz overflow
    dec rdi
    jnz loopfactorial
    ret

recursivefactorial:
    cmp rdi, 0
    jne notthereyet
    mov eax, 1
    ret
notthereyet:
    push rdi
    dec rdi
    call recursivefactorial
    pop rdi
    mul rdi
    cmp rdx, 0
    jne  overflow
belowlimit:
    ret

overflow:
    xor rax, rax
    ret

