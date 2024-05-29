.arch armv7a
.include "include/consts.s"

// This program calculates escape velocity according to formula:
// sqrt((2 * gravitational_constant * celestial_body_mass) / celestial_body_radius)

.data
	.align 2
	G2:	.double 13.3486E-11   // 2*G
	M:	.double 5.972e+24 // Earth [kg]
	R:	.double 6.378e+6  // Earth [m]
	mtokm:	.double 1000.0
	
	fmtms:	.asciz "%.3lf m/s\n"
	fmtkms:	.asciz "%.3lf km/s\n"

.text
.align 2
.syntax unified
.thumb

.global	main
.type	main, %function
.thumb_func
main:

	sub sp, sp, #40

	ldr r0, =G2
	vldr.f64 d0, [r0]
	ldr r1, =M
	vldr.f64 d1, [r1]
	ldr r2, =R
	vldr.f64 d2, [r2]

	vmul.f64 d0, d1, d0
	vdiv.f64 d0, d0, d2
	vsqrt.f64 d0, d0

	nop
	nop
	nop

	vmov r2, r3, d0
	ldr r0, =fmtms
	bl printf

	add sp, sp, #40

	mov r0, #EXIT_SUCCESS
	bl exit
