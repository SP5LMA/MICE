; =====================================================
; To assemble and run:
;	nasm -felf64 02-writingtext.asm -o 02-writingtext.o
;	ld 02-writingtext.o -o 02-writingtext
;	./02-writingtext
; =====================================================

%include "include/consts.inc"
%include "include/syscalls_x86-64.inc"

section   .text
global    _start
_start:   
	mov rax, sys_write
	mov rdi, STDOUT
	mov	rsi, buf
	mov	rdx, count
	syscall

	mov	rax, sys_exit
	xor	rdi, rdi
	syscall

section   .data
	buf:		db		"Salut, Mundi!", 10
	count:		equ		$-buf
