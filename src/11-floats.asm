; =====================================================
; To assemble and run:
;	nasm -felf64 11-floats.asm -o 11-floats.o
;	ld 11-floats.o -o 11-floats -lc --dynamic-linker=/lib64/ld-linux-x86-64.so.2 
;	./11-floats
; =====================================================

%include "include/syscalls_x86-64.inc"

extern printf
extern scanf

section .data
    queryinfo:		db "Please enter temperature in Celsius:",10,0
    queryformat:	db "%f",0
    results:		db "%.2f'C =  %.2f K = %.2f'F",10,0
    toosmallerror:	db "Error: provided value is too small.",10,0
    align 16
    absolutezero:	dq -273.15
    CtoFmultiplier:	dq 1.8
    CtoFoffset:		dq 32.0

section .bss
    align 16
    tempC:			resq 1

section .text
global _start
_start:
    mov rdi, queryinfo
    xor rax, rax
    call printf

    mov rdi, queryformat
    mov rsi, tempC
    xor rax, rax
    call scanf

    movsd xmm0,[tempC]
    movsd xmm2,[absolutezero]
    ucomisd xmm0, xmm2
    jb error

    movsd xmm1,xmm0
    subsd xmm1,xmm2

    movsd xmm2, [tempC]
    mulsd xmm2, [CtoFmultiplier]
    addsd xmm2, [CtoFoffset]
    
    mov rdi, results
    mov rax, 3
    call printf
    
    xor rdi, rdi
quit:
    mov rax, sys_exit
    syscall

error:
    mov rdi,toosmallerror
    xor rax,rax
    call printf
    mov rdi, 1
    jmp quit



