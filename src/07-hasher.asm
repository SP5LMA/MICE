; =====================================================
; To assemble and run:
;	nasm -felf64 -gdwarf 07-hasher.asm
;	ld 07-hasher.o -o 07-hasher
;	./07-hasher
; =====================================================

%include "include/consts.inc"
%include "include/syscalls_x86-64.inc"

%define CHUNKLEN	8

section .bss
	keybuf:		resb	CHUNKLEN
	databuf:	resb	CHUNKLEN
	fd:			resq	1

section   .text
global    _start
_start:
	; check how many arguments were provided
	cmp qword [rsp], 2
	jne badresult

	; open file with a function openfile
	call openfile
	mov [fd], rax
nextchunk:
	mov rdi, STDIN
	mov rsi, databuf
	mov rdx, CHUNKLEN
	mov rax, sys_read
	syscall
	call verifyresult
	cmp rax, 0
	je quitprog

	mov rdi, [fd]
	mov rsi, keybuf
	mov rdx, rax
	mov rax, sys_read
	syscall
	call verifyresult
	cmp rax, 0
	je quitprog

	mov rcx, rax
	call hashkeybuf

	mov rdx, rax
	call storefrombuf
	jmp nextchunk

	xor	rdi, rdi
quitprog:
	mov	rax, sys_exit
	syscall

; function openfile gets pointer to filename from stack
; in case of error ends the program
; returns file descriptor in rax otherwise
openfile:
	mov rax, sys_open
	mov rdi, [rsp + 24]
	mov rsi, O_RDONLY
	syscall
	call verifyresult
	ret

; function performs xor operation between datbuf and databuf
; number of bytes to hash is given provided in rdi register
; returns nothing
hashkeybuf:
	mov dl, byte [databuf + rcx - 1]
	xor byte [keybuf + rcx - 1], dl
    dec rcx
    jnz hashkeybuf
	ret

; function prints keybuf buffer to stdout
; number of bytes to print is provided with rdx register
; in case of error ends the program
; returns number of successfully saved bytes in rax otherwise
storefrombuf:
	mov rax, sys_write
	mov rdi, STDOUT
	mov rsi, keybuf
	syscall
	call verifyresult
	ret

; procedure checks if rax is lower than 0
; ends the program with error code in such case
; returns silently otherwise
verifyresult:
	cmp rax, 0
	jl	badresult
	ret
badresult:
	mov rdi, EXIT_FAILURE
	jmp quitprog
