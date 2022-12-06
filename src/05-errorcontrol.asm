; =====================================================
; To assemble and run:
;	nasm -felf64 -gdwarf 05-errorcontrol.asm
;	ld 05-errorcontrol.o -o 05-errorcontrol
;	./05-errorcontrol
; =====================================================

; This training example program is expected to fail 
; as not all of its conditions are supposed to be met.

%include "include/consts.inc"
%include "include/syscalls_x86-64.inc"

%define	SYSINFOLEN	128

section .bss
	sysinfobuf:		resb	SYSINFOLEN

section   .text
global    _start
_start:
	call openfile
	call prepareinfo
	call saveinfo
	xor	rdi, rdi
quitprog:
	mov	rax, sys_exit
	syscall

openfile:
	mov rax, sys_open
	mov rdi, [rsp + 24]
	mov rsi, O_WRONLY
	mov rdx, S_IRUSR | S_IWUSR | S_IRGRP
	syscall
	call verifyresult
	mov rbx, rax
	ret

prepareinfo:
	mov rax, sys_sysinfo
	mov rdi, sysinfobuf
	syscall
	call verifyresult
	ret

saveinfo:
	mov rax, sys_write
	mov rdi, rbx
	mov rsi, sysinfobuf
	mov rdx, SYSINFOLEN
	syscall
	call verifyresult
	ret

verifyresult:
	cmp rax, 0
	jl	badresult
	ret
badresult:
	mov rdi, EXIT_FAILURE
	jmp quitprog
