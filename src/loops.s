.arch armv7a
.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
	array: .asciz "\x1\x2\x20\x4X\x6\x7f\x80"
	.set arrayend, . 
	
.text
.align	2
.global	main
.syntax unified
.thumb
.type	main, %function
.thumb_func
main:



/////////////////////////////////////////////////////
forloopexample1:
    mov r1, #10       // counter
    mov r0, #0        // other value
loop_sum:             // begin of loop body
    add r0, r0, r1    // loop body
    nop
    nop
    subs r1, r1, #1   // counter decrementation
    bne loop_sum      // conditional branch

	nop
	nop
	nop
	nop

/////////////////////////////////////////////////////
forloopexample2:
    ldr r1, =array    // prepare iterator
    ldr r2, =arrayend // prepare limit
traversemem:          // begin of loop body
    cmp r1, r2        // condition check
    bhs finishloop    // conditional branch
    ldrh r3, [r1]      // loop body
    nop
    nop
    add r1, r1, #2    // iterate over mem
    b traversemem     // repeat loop body
finishloop:

    nop
    nop
    nop
    nop

/////////////////////////////////////////////////////
whileloopexample1:
    mov r1, #10        // counter
whileloop1:           // begin of the loop
    cmp r1, #5       // condition check
    blo whileloop1_end      // condition not met

    nop
    nop               // loop body
    nop

	sub r1, #1
    b whileloop1      // unconditional next try
whileloop1_end:

    nop
    nop
    nop
    nop

/////////////////////////////////////////////////////
whileloopexample2:
    ldr r1, =array		// prepare iterator
whileloop2:				// begin of the loop
    ldrb r0, [r1]      
    cmp r0, #0			// check condition
    beq whileloop2_end	// condition to finish loop met

    nop
    nop					// loop body
    nop
	
	add r1, #1			//iterate
    b whileloop2		// unconditional next try
whileloop2_end:

    nop					// other instructions
	nop
	nop
	nop
	
/////////////////////////////////////////////////////
doloopexample1:
	mov r0, #7
doloop1:
	nop
	nop
	nop
	subs r0, #1
	bne doloop1
	
    nop					// other instructions
	nop
	nop
	nop

/////////////////////////////////////////////////////
doloopexample2:
	ldr r1, =array
	ldr r2, =arrayend
	sub r2, #1 // ignore trailing zero
doloop2:
	ldrb r0, [r1]
	cmp r0, #0x20
	blo modify
	cmp r0, #0x7f
	bhs modify
	b notmodify
modify:
	mov r0, #'.'
	strb r0, [r1]
notmodify:
	add r1, r1, #1
	cmp r1, r2
	blo doloop2

/////////////////////////////////////////////////////
	mov	r0, #EXIT_SUCCESS
	mov	r7, #sys_exit
	svc	#0
