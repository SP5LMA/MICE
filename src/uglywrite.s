.arch armv7a




.data
	hello: .ascii "Salut, Mundi!\n"


.text
.global main
.syntax unified
.thumb
.thumb_func
.type main,%function
main:
	mov	r0, #1
	ldr	r1, =hello
	mov	r2, #14
	mov	r7, #4
	svc	#0

	mov	r0, #0
	mov	r7, #1
	svc	#0
