; =====================================================
; To assemble and run:
;	nasm -felf64 -gdwarf 03-interact.asm
;	ld 03-interact.o -o 03-interact
;	./03-interact
; =====================================================

%include "include/consts.inc"
%include "include/syscalls_x86-64.inc"

%define	USERNAMEMAXLEN	30

section   .data
	buf:		db		"Hello, what's your name?", 10
	count:		equ		$-buf
	buf2:		db		"I am pleased to meet you "
	count2:		equ		$-buf2

section .bss
	username:	resb	USERNAMEMAXLEN

section   .text
global    _start
_start:   
	mov rax, sys_write
	mov rdi, STDOUT
	mov	rsi, buf
	mov	rdx, count
	syscall

	mov rax, sys_read
	mov rdi, STDIN
	mov rsi, username
	mov rdx, USERNAMEMAXLEN
	syscall
	mov rbx, rax
	
	mov rax, sys_write
	mov rdi, STDOUT
	mov rsi, buf2
	mov rdx, count2
	syscall
	
	mov rax, sys_write
	mov rdi, STDOUT
	mov rsi, username
	mov rdx, rbx
	syscall

	mov	rax, sys_exit
	xor	rdi, rdi
	syscall

