.arch armv7a
.include "include/consts.s"

.data
	.align 2
	val1F:	.float 2.1
	val2F:	.float 3.7

.bss
	valResultF:	.double

.text
.global _start
_start:
	ldr r0, =val1F
	vldr.f32 s0, [r0]
	ldr r1, =val2F
	vldr.f32 s1, [r1]

	vadd.f32 s2, s1, s0

	ldr r2, =valResultF
	vstr.f32 s2, [r2]

	mov r0, #EXIT_SUCCESS
	bl exit
