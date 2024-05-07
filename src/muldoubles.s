.arch armv7a
.include "include/consts.s"

.data
	.align 2
	val1F:	.double 2.1
	val2F:	.double 3.7
	fmt:	.asciz "%.3lf * %.3f = %.3lf\n"

.text
.global _start
_start:

	push {fp, lr}
	add fp, sp, #4
	sub sp, sp, #40

	ldr r0, =val1F
	vldr.f64 d0, [r0]
	ldr r1, =val2F
	vldr.f64 d1, [r1]

	vmul.f64 d2, d1, d0

	vmov r2, r3, d0
	vstr.f64 d1, [sp]
	vstr.f64 d2, [sp, #8]

	ldr r0, =fmt
	bl printf

	sub sp, fp, #4
	pop {fp, lr}

	mov r0, #EXIT_SUCCESS
	bl exit
