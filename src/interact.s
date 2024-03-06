.arch armv7a

.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
	hello: .ascii "Hello, what's your name?\n"
	.equ hellolen, . -hello
	respo: .ascii "I am pleased to meet you "
	.equ respolen, . -respo

.bss
.align  4
	username: .space 20
	.equ usernamelen, . -username

.text
.global main
.syntax unified
.thumb
.thumb_func
.type main,%function
main:
	mov	r0, #STDOUT
	ldr	r1, =hello
	mov	r2, #hellolen
	mov	r7, #sys_write
	svc	#0

	mov r0, #STDIN
	ldr r1, =username
	mov r2, #usernamelen
	mov r7, #sys_read
	svc #0
	mov r6, r0
	
	mov r0, #STDOUT
	ldr r1, =respo
	mov r2, #respolen
	mov r7, #sys_write
	svc #0
	
	mov r0, #STDOUT
	ldr r1, =username
	mov r2, r6
	mov r7, #sys_write
	svc #0

	mov	r0, #EXIT_SUCCESS
	mov	r7, #sys_exit
	svc	#0
