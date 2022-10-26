; =====================================================
; To assemble and run:
;	nasm -felf64 -gdwarf 04-functions.asm
;	ld 04-functions.o -o 04-functions
;	./04-functions
; =====================================================

%include "include/consts.inc"
%include "include/syscalls_x86-64.inc"

%define	SYSINFOLEN	128

section .bss
	sysinfobuf:		resb	SYSINFOLEN

section   .text
global    _start
_start:
	call mkdir
	call chdir
	call prepareinfo
	call saveinfo

	mov	rax, sys_exit
	xor	rdi, rdi
	syscall

mkdir:
	mov rax, sys_mkdir
	mov rdi, [rsp + 24]
	mov rsi, S_IRWXU | S_IRGRP | S_IXGRP
	syscall
	ret

chdir:
	mov rax, sys_chdir
	mov rdi, [rsp + 24]
	syscall
	ret

prepareinfo:
	mov rax, sys_sysinfo
	mov rdi, sysinfobuf
	syscall
	ret

saveinfo:
	mov rax, sys_open
	mov rdi, [rsp + 32]
	mov rsi, O_CREAT | O_WRONLY
	mov rdx, S_IRUSR | S_IWUSR | S_IRGRP
	syscall
	
	mov rdi, rax
	mov rax, sys_write
	mov rsi, sysinfobuf
	mov rdx, SYSINFOLEN
	syscall
	ret
