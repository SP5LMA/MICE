; =====================================================
; To assemble and run:
;	nasm -felf64 01-starter.asm -o 01-starter.o
;	ld 01-starter.o -o 01-starter
;	./01-starter
; =====================================================

section   .text
global    _start
_start:   
	mov	rax, 0x1
	neg	rax
	inc	rax
	mov	rax, 60
	mov	rdi, 0
	syscall
