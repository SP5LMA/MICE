; =====================================================
; To assemble and run:
;	nasm -felf64 09-libraryfun.asm -o 09-libraryfun.o
;	ld 09-libraryfun.o -o 09-libraryfun -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2
;	./09-libraryfun
; =====================================================

%include "include/consts.inc"
%include "include/syscalls_x86-64.inc"

extern scanf
extern printf

%define	USERNAMEMAXLEN	30
%defstr UNXLENS USERNAMEMAXLEN

section   .data
	intro:		db	"Hello, what's your name?", 10, 0
	welcome:	db	"I am pleased to meet you %s.", 10, 0
	scanform:	db	"%", UNXLENS, "s", 0

section .bss
	username:	resb	USERNAMEMAXLEN

section   .text
global    _start
_start:
	mov rdi, intro
	xor rax, rax
	call printf
	
	mov rdi, scanform
	mov rsi, username
	xor rax, rax
	call scanf

	mov rdi, welcome
	mov rsi, username
	xor rax, rax
	call printf
	
	mov	rax, sys_exit
	xor	rdi, rdi
	syscall
