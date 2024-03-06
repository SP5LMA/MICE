.arch armv7a

.text
.global main
.syntax unified
.thumb
.thumb_func
.type main,%function
main:
	mov	r0, #0
	mov	r7, #1
	svc	#0
