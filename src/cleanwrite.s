.arch armv7a

.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
	hello: .ascii "Salut, Mundi!\n"
	.equ hellolen, . -hello

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

	mov	r0, #EXIT_SUCCESS
	mov	r7, #sys_exit
	svc	#0
