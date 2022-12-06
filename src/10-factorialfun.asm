; =====================================================
; To assemble and run:
;   nasm -felf64 -gdwarf  10-factorialfun.asm
;   gcc 10-testfactorialfun.c 10-factorialfun.o  -o 10-factorialfun
;   ./10-factorialfun
; =====================================================

global factorial

section .text
factorial:
    cmp rdi, 0
    jne expnotzero
    mov eax, 1
    ret

expnotzero:
    mov eax, 1
loopfactorial:
    mul rdi
    cmp rdx, 0
    jnz overflow
    dec rdi
    jnz loopfactorial
    ret

overflow:
	xor rax, rax
	ret
