.arch armv7a
.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
.align 3
	array: .asciz "this should be a good Title 1 `a23 xYz ~ ! !z zzz aAaa aaa aaaA \n"
	.set arraylen, . - array - 1
.align 2, 0x21
	test: .asciz "This little foo is safe\n"
	
.text
.align	4
.global	main
.syntax unified
.thumb
.type	main, %function
.thumb_func
main:
	ldr r0, =array
	ldr r1, =arraylen
	bl title
	ldr r0, =array
	ldr r1, =arraylen
	bl print

quitapp:
	mov	r0, #EXIT_SUCCESS
	mov	r7, #sys_exit
	svc	#0

.align 5
print:
	push {r4 - r12, lr}
	mov r2, r1
	mov r1, r0
	mov r0, #STDOUT
	mov r7, #sys_write
	svc #0
	pop {r4 - r12, lr}
	bx lr

/* 
 * Procedure capitalizes characters in string in title-like style
 * r0 - address of (pointer to) string
 * r1 - scan at most this number of characters
 */
title:
	push {r4 - r12, lr}
	// r2 - previous char, is assumed
	mov r2, #' '
_scannextchar:
	// finish if number of chars reached
	movs r1, r1
	beq _fintitle

    // one less characters to analyze
	sub r1, #1

    // store previous char in r3
	mov r3, r2

	// get current char to r2
	ldrb r2, [r0], #1

	// finish if reached character zero - ASCIIZ
	movs r2, r2
	beq _fintitle

	// check if previous char was space
	cmp r3, #' '
	bne _scannextchar

	// skip if this is below small letter set
	cmp r2, #'a'
	blo _scannextchar
    // skip if this is above small letter set
	cmp r2, #'z'
	bhi _scannextchar

	// capitalize character and store it back to mem
	and r2, #0xdf
	strb r2, [r0, #-1]

    // rinse and repeat
	b _scannextchar

_fintitle:
	pop {r4 - r12, lr}
	bx lr

/*
 * Function checks for a lowercase character
 * r0 - character to check
 * The returned value is nonzero if the character is lower case.
 */
islower:
	push {r4 - r12, lr}
	nop
	nop
	pop {r4 - r12, lr}
	bx lr

