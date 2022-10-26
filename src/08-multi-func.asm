; =====================================================
; To assemble and run:
;	nasm -felf64 -gdwarf 08-multi-func.asm -o 08-multi-func.o
; =====================================================

%include "include/consts.inc"
%include "include/syscalls_x86-64.inc"

global strchr
global strlen
global writeout

section   .text

; function strlen returns length of string
; rdi - address of a string
; returns length of string in rax
strlen:
    xor rcx, rcx
    not rcx
    xor rax, rax
    cld
    repnz scasb
    not rcx
    dec rcx
    mov rax, rcx
    ret

; function strchr returns address of character sought for
; returns end of string if character not found
; rdi - address of a string
; rsi - character we are looking for
; returns address of first occurence of character sought for in rax
strchr:
	push rdi
	push rsi
    call strlen
    mov rcx, rax
    inc rcx
    cld
    pop rax
    pop rdi
    repnz scasb
    dec rdi
    mov rax, rdi
    ret

; function prints string to the screen 
; rdi - address of string
writeout:
	push rdi
	call strlen
	mov rdx, rax
	pop rsi
	mov rax, sys_write
	mov rdi, STDOUT
	syscall
	ret
