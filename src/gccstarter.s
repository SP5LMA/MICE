.arch armv7a
.syntax unified
.thumb

.text
.global main
.thumb_func
.type main,%function
main:
	mov	r0, #0
	mov	r7, #1
	svc	#0
