.arch armv7a
.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
// initial verses
	rhyme1: .ascii "Hickory dickory dock.\nThe mouse ran up the clock.\nThe clock struck "
	.equ rhyme1len, . -rhyme1
// final verses
	rhyme2: .ascii ",\nThe mouse ran down,\nHickory dickory dock\n\n"
	.equ rhyme2len, . -rhyme2

// textual counter
	.align 3
	one: .ascii "one"
	.equ onelen, . -one

	.align 3
	two: .ascii "two"	
	.equ twolen, . -two

	.align 3
	three: .ascii "three"
	.equ threelen, . -three

	.align 3
	four: .ascii "four"
	.equ fourlen, . -four

// table with pointers to texts
	numbers: .word one, two, three, four
// table with lengths
	lengths: .word onelen, twolen, threelen, fourlen

.text
.align	2
.global	main
.syntax unified
.thumb
.type	main, %function
.thumb_func
main:
//set iterator 
	mov	r8, #0
// 
	ldr	r4, =one	// better would be to use "numbers" table of pointers
	ldr	r5, =lengths	// lengths of texts are organized in table
__loop:
// "do-while" style of loop
// initial verses
	ldr	r1, =rhyme1
	mov	r2, #rhyme1len
	bl	print

// counting one, two, three...
	mov	r1, r4		// better would be to use "numbers" table of pointers
	ldr	r2, [r5], #4	// loading with offset post-indexed
	bl	print
	add	r4, #8
	
// final verses
	ldr	r1, =rhyme2
	mov	r2, #rhyme2len
	bl	print
	
// repeat up to hard-coded maximum
	add	r8, #1
	cmp	r8, #3
	bls	__loop
	b	exit

// execution should never reach this point
__neverending:
	b	__neverending


// print function prints message to STDOUT
// expects:
// r1 - pointer to message
// r2 - length of the message
print:
	push {r4, r5, r6, r7, r8, r9, r10, r11}
	mov	r0, #STDOUT
	mov	r7, #sys_write
	svc	#0
	pop	{r4, r5, r6, r7, r8, r9, r10, r11}
	bx	lr

// exit unconditionally finishes program execution
exit:
	mov	r0, #EXIT_SUCCESS
	mov	r7, #sys_exit
	svc	#0
