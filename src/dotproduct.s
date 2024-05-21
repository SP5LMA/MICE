; as -g -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4 dotproduct.s -o dotproduct.o
; gcc -g -znoexecstack dotproduct.o -o dotproduct
.arch armv7a
.include "include/consts.s"

.data
.align 2
	vec1:	.float 1.2, 2.3, 3.4, 4.5
	vec2:	.float 5.6, 6.7, 7.8, 8.9
	fmt:	.asciz "%.3f\n"

.text
.align	2
.global	main
.syntax unified
.thumb
.type	main, %function
.thumb_func
main:
	sub sp, sp, #40

	ldr r0, =vec1
	ldr r1, =vec2
	vld1.f32 {q0}, [r0]
	vld1.f32 {q1}, [r1]
	vmul.f32 q2, q0, q1
	vadd.f32 d6, d4, d5
	vpadd.f32 d7, d6, d6

	vcvt.f64.f32 d7, s14
	vmov r2, r3, d7

	ldr r0, =fmt
	bl printf

	add sp, sp, #40

	mov r0, #EXIT_SUCCESS
	bl exit
