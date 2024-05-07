.arch armv7a
.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
	.align	2
	vec1F:	.float 1.0, 2.0, 3.0, 4.0
	vec2F:	.float 5.0, 6.0, 7.0, 8.0

.bss
	vecOut:	.skip 16

.text
.global _start
_start:
	ldr r0, =vec1F
	vld1.32 {d0-d1}, [r0]

	ldr r1, =vec2F
	vld1.32 {d2-d3}, [r1]
	
	vmul.f32 q0, q0, q1
	
	ldr r2, =vecOut
	vst1.32 {d0-d1}, [r2]
    
	mov r0, #EXIT_SUCCESS
	mov r7, #sys_exit
	svc #0
