.include "include/syscalls-eabi.s"
.include "include/consts.s"

.text
.global _start
_start:
// addition
	mov r0, #17
	add r0, #0x17

	mov r1, #0x17
	mov r2, #017

	add r1, r2
	add r1, r1, r2
	add r3, r2, r0

// addition with carry 
	mov r0, #0xffffffff
	adds r0, #1
	adcs r1, #0
	
// subtraction
	eor r0, r0
	sub r0, #1
	
// subtraction with borrow (aka NOT Carry)
	mov r1, #1<<31
	eor r1, #1
	eor r0, r0
	subs r0, #1
	sbcs r1, #0

// reversed subtraction
	mov r1, #19
	rsb r0, r1, #31

// multiplication
	mov r1, #2
	mov r2, #-2
	mul r0, r1, r1
	muls r0, r1, r2
	muls r0, r2, r2

// multiplication by shift
	mov r0, #1
	lsl r0, #1
	lsl r0, r0

// division
	mov r0, #100
	mov r1, #25
	sdiv r4, r0, r1
	
	mov r0, #-0x80
	mov r1, #0x20
	sdiv r5, r0, r1
	
	mov r0, #-020
	mov r1, #-002
	sdiv r8, r0, r1
	
// division by shift
	mov r0, #100
	asr r4, r0, #4
	
	mov r0, #-2147483648
	mov r1, #0x20
	asr r5, r0, r1
	
// finish
	mov	r0, #EXIT_SUCCESS
	mov	r7, #sys_exit
	svc	#0
