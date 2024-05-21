.arch armv7a
.include "include/consts.s"
.extern atoi, printf

.data
	fmtstr:		.asciz "%u\n"

.text
.align 2
.syntax unified
.thumb

.global	main
.type	main, %function
.thumb_func
main:
        ldr r0, [sp, #0xc]      // access _start frame
        ldr r1, [sp, #0x8]      // argc
checkargc:
        cmp r1, #1              // check argc
        bls quiterr             // if argc <= 1 
        ldr r0, [r0, #0x4]      // &argv[1]
	bl atoi

	// test fibonacci computation
	bl fiborecur

	// show result
	mov r1, r0
	ldr r0, =fmtstr
	bl printf
	
quitcorrect:
	mov r0, #EXIT_SUCCESS
	bl exit
quiterr:
	mov r0, #EXIT_FAILURE
	bl exit


.type	fiborecur, %function
.thumb_func
// fiborecur(n)
fiborecur:
	push {lr}
	// if (n <= 1) return n;
	cmp r0, #1
	ble _end_fibrec
	
	// return fiborecur(n-1) + fiborecur(n-2)
	push {r0}	// save n
	sub r0, r0, #1	// r0:=n-1
	bl fiborecur	// fiborecur(n-1)

	pop {r1}	// retrieve n
	push {r0}	// save fiborecur(n-1)
	sub r0, r1, #2	// r0:=n-2
	bl fiborecur	// fiborecur(n-2)

	pop {r1}
	add r0, r0, r1

_end_fibrec:
	pop {lr}
	bx lr


.type	fiboiter, %function
.thumb_func
// fiboiter(n)
fiboiter:
	push {lr}

	// base case
	cmp r0, #1
	bls _end_fiboite


	// initial values r2:=fibonacci[0], r3:=fibonacci[1]
	mov r2, #0
	mov r3, #1

	// internal counter r1
	mov r1, #1
_fiboite:
	add r1, r1, #1

	// calculate the next number
	add r2, r2, r3
	
	// swap registers
	eor r2, r2, r3
	eor r3, r2, r3
	eor r2, r2, r3

	cmp r0, r1
	bne _fiboite

	mov r0, r3


_end_fiboite:
	pop {lr}
	bx lr

