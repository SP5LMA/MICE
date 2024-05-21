.arch armv7a

.text
.align 2
.global factorial
.syntax unified
.thumb
.type	factorial, %function
.thumb_func
factorial:
// initialize calculation
	mov	r1, r0
	sub	r1, r1, #1

// loop factorial going downwards
_factloop:
	mul	r0, r1, r0
	subs	r1, r1, #1
	bne	_factloop

	bx	lr
