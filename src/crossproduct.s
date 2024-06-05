.arch armv7a
.include "include/consts.s"

.data
.align 2
//	vecs:	.float x  , y  , z  , ---

// case 1:
	vec1a:	.float 1.0, 2.0, 3.0, 0.1
	vec1b:	.float 5.0, 6.0, 7.0, 0.2

// case 2:
	vec2a:	.float 1.0, 0.0, 0.0, 0.0
	vec2b:	.float 0.0, 1.0, 0.0, 0.0

	fmt:	.asciz "[%.2f, %.2f, %.2f]\n"

.text
.align	2
.global	main
.syntax unified
.thumb
.type	main, %function
.thumb_func
main:
	sub sp, sp, #40

	ldr r0, =vec1a
	ldr r1, =vec1b
	bl crossproduct
	bl display

	ldr r0, =vec2a
	ldr r1, =vec2b
	bl crossproduct
	bl display

	add sp, sp, #40

	mov r0, #EXIT_SUCCESS
	bl exit


.type	display, %function
.thumb_func
display:
	push {r4-r12, lr}

        vcvt.f64.f32 d4, s2
	vstr d4, [sp, #8]
        vcvt.f64.f32 d3, s1
	vstr d3, [sp]
        vcvt.f64.f32 d2, s0
        vmov r2, r3, d2
        ldr r0, =fmt
        bl printf

	pop {r4-r12, lr}
	bx lr

// crossproduct(int32_t *vec[4], int32_t *vec[4])
//
// Description: Function calculates cross product of two 3D vectors.
// sx = ay*bz - az*by
// sy = az*bx - ax*bz
// sz = ax*by - ay*bx
//
// Result: q0.f32
//
// Notes: 4th element might be ignored both in input and in output.
//	Function is not optimal in terms of efficiency instead it
//	is an example of vext instruction application.
.type	crossproduct, %function
.thumb_func
crossproduct:
	vld1.f32 {q1}, [r0]	// veca[ax, ay, az, 0]
	vld1.f32 {q2}, [r1]	// vecb[bx, by, bz, 0]
	vmov q3, q1		// also veca
	vmov q4, q2		// also vecb

// reorder veca to: ay, az, ax, 0
	vext.32 q1, q1, q1, #1	// ay, az, 0 , ax
	vext.32 d3, d3, d3, #1	// ay, az, ax, 0

// reorder vecb to: bz, bx, by, 0
	vext.32 d5, d5, d5, #1	// bx, by, 0,  bz
	vext.32 q2, q2, q2, #3	// bz, bx, by, 0
	
// multiply reordered vectors (q1, q2) to obtain first term (minuend)
	vmul.f32 q0, q1, q2

// reorder veca to: az, ax, ay, 0
	vext.32 d7, d7, d7, #1	// ax, ay, 0,  az
	vext.32 q3, q3, q3, #3	// az, ax, ay, 0

// reorder vecb to: by, bz, bx, 0
	vext.32 q4, q4, q4, #1	// by, bz, 0, bx
	vext.32 d9, d9, d9, #1	// by, bz, bx, 0

// multiply second pair of terms to obtain subtrahend and then difference
	vmls.f32 q0, q3, q4

	bx lr

