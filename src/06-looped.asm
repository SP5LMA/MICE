; =====================================================
; To assemble and run:
;	nasm -felf64 06-looped.asm -o 06-looped.o
;	ld 06-looped.o -o 06-looped
;	./06-looped
; =====================================================

; Modification so that program analyzes command line argument 
; and treats it as a number

%include "include/consts.inc"
%include "include/syscalls_x86-64.inc"

%define	MAXLINES	9

section .data
	space:	times MAXLINES		db	' '
	branch:	times MAXLINES		db	'X^'
	newline:					db	10

section   .text
global    _start
_start:
	cmp qword [rsp], 2
	jne quitprogfailure
;	call countchars
	call convertchar
	call printlines
	xor	rdi, rdi
quitprog:
	mov	rax, sys_exit
	syscall

; erroneous quit
quitprogfailure:
	mov rdi, EXIT_FAILURE
	jmp quitprog

convertchar:
	mov rsi, [rsp + 24]
	cmp byte[rsi +1], 0
	jne quitprogfailure
; these two instructions can be replaced with movzx
;	xor rcx, rcx
;	mov cl, byte [rsi]
	movzx rcx, byte [rsi]
	cmp rcx, 40h
	jae quitprogfailure
	cmp rcx, 30h
	jbe quitprogfailure
	xor rcx, 30h
	cmp rcx, MAXLINES
	ja quitprogfailure
	ret

; count number of characters in string
; given in command line
; procedure returns counted number
; of characters by rcx
countchars:
	mov rsi, [rsp + 24]
	xor rcx, rcx
looknext:
	cmp byte [rsi + rcx], 0
	je foundend
	inc rcx
	jmp looknext
foundend:
	cmp rcx, MAXLINES
	jbe finishcounting
	mov rcx, MAXLINES
finishcounting:
	ret

; decrements number of spaces by 1 and
; increments number of characters by 2
; function arguments:
;  rcx holds number of lines to print
printlines:
	mov rbx, newline - 1
	mov r12, 2
nextline:
	push rcx
	call drawline
	dec rbx
	dec rbx
	inc r12
	inc r12
	pop rcx
	loop nextline
	ret

; draws a line that starts with spaces
; and ends with some characters and new line
; function arguments:
;  rcx holds number of spaces
;  rbx holds pointer to character string
;  r12 holds number of characters to print
drawline:
	mov rax, sys_write
	mov rdi, STDOUT
	mov rsi, space
	mov rdx, rcx
	syscall
	mov rax, sys_write
	mov rdi, STDOUT
	mov rsi, rbx
	mov rdx, r12
	syscall
	ret
