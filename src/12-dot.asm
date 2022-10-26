; =====================================================
; To assemble and run:
;	nasm -felf64 -gdwarf 11-floats.asm
;	ld 11-floats.o -o 11-floats -lc --dynamic-linker=/lib64/ld-linux-x86-64.so.2 
;	./11-floats
; =====================================================

%include "include/syscalls_x86-64.inc"

extern printf
extern scanf

section .data
    results:			db "[%.2lf, %.2lf, %.2lf, %.2lf]",10,0
	dot:		db "%.2lf", 10, 0
    
    align 16
    vec1			dd	1.0, 3.0, -5.0, 7.0
    vec2			dd	4.0, -2.0, -1.0, 6.0

section .bss
    align 16
    vecout			resd 4

section .text
global _start
_start:
    movaps xmm0, [vec1]
    call prepvecv1 ; expand xmm0 to xmm[0-4] 
    call printvec  ; and print as (doubles)

    movaps xmm0, [vec2]
    call prepvecv1 ; expand xmm0 to xmm[0-4] 
    call printvec  ; and print as (doubles)

    movaps xmm0, [vec1]
    movaps xmm1, [vec2]
    mulps xmm0, xmm1    ; multiply vectors
    movaps [vecout], xmm0 ; store result in mem
    call prepvecv1 ; expand xmm0 to xmm[0-4] 
    call printvec  ; and print as (doubles)

    ; get result from mem and calculate dot product
    movaps xmm0, [vecout]
    haddps xmm0, xmm0 ; horizontal add 1
    haddps xmm0, xmm0 ; horizontal add 2
    cvtps2pd xmm0, xmm0 ; increase precision
    mov rdi, dot
    mov rax, 1
    call printf
    
; SSE 4.1 (non-VEX cpu)
;    movaps xmm0, [vec1]
;    movaps xmm1, [vec2]
;    dpps xmm0, xmm1, 0xff
;    call prepvecv1
;    call printvec

    xor rdi, rdi
quit:
    mov rax, sys_exit
    syscall

error:
    mov rdi, 1
    jmp quit

prepvecv1:
    movaps xmm1, xmm0
    shufps xmm1, xmm1, 0x39
    movaps xmm2, xmm1
    shufps xmm2, xmm2, 0x39
    movaps xmm3, xmm2
    shufps xmm3, xmm3, 0x39
    cvtss2sd xmm0, xmm0
    cvtss2sd xmm1, xmm1
    cvtss2sd xmm2, xmm2
    cvtss2sd xmm3, xmm3
    ret

prepvecv2:
    movaps xmm3, xmm0   ; copy
    shufps xmm3, xmm3, 0x1b ; reverse order
    cvtps2pd xmm3, xmm3 ; extend precision (xmm3 done)
    movaps xmm2, xmm3 ; copy
    shufps xmm2, xmm2, 0x4e ; swap (xmm2 done)
    cvtps2pd xmm0, xmm0 ; extend precision (xmm0 done)
    movaps xmm1, xmm0 ; copy
    shufps xmm1, xmm1, 0x4e ; swap (xmm1 done)
    ret

printvec:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rdi, results
    mov rax, 4
    call printf
    add rsp, 16
    mov rsp, rbp
    pop rbp
    ret

