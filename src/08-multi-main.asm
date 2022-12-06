; =====================================================
; To assemble and run:
;	nasm -felf64 -gdwarf 08-multi-main.asm -o 08-multi-main.o
;	ld 08-multi-main.o 08-multi-func.o -o 08-multi
;	./08-multi
; =====================================================

%include "include/consts.inc"
%include "include/syscalls_x86-64.inc"

extern strlen
extern strchr
extern writeout

section .data
	databuf:	db	"Some string in memory.", 10, 0

section   .text
global    _start
_start:
	mov rdi, databuf
	mov rsi, qword 's'
	call strchr		; rax := address

	mov rdi, rax
	call writeout

	mov	rax, sys_exit
	xor	rdi, rdi
	syscall
