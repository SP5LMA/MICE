.include "include/consts.s"

.equ USERNAMELEN, 7

.altmacro
.macro dynscanlen l
	.ascii "%","\l","s\0"
.endm

.data
	prompt: .asciz "Hello, what is your name?\n"
	fmtstr: dynscanlen %USERNAMELEN
	hello: .asciz "I am pleased to meet you %s.\n"

.bss
	username: .space USERNAMELEN

.text
.global _start
_start:
	ldr r0, =prompt
	bl printf

	ldr r0, =fmtstr
	ldr r1, =username
	bl scanf
	
	mov r0, #EXIT_SUCCESS
	bl exit
