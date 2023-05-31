.include "include/consts.s"

.data
	fmtfactorialS:	.asciz "%d!=%d\n"
	numeratorD:	.word 1000000

.text
.global _start
_start:
// test factorial(7)
	mov	r0, #4
	push	{r0}
	bl	factorial

	pop	{r1}
	mov	r2, r0
	ldr	r0, =fmtfactorialS
	bl	printf

// test factorial in a loop
	mov	r5, #12
testloop:
	mov	r0, r5
	bl	factorial

	mov	r1, r5
	mov	r2, r0
	ldr	r0, =fmtfactorialS
	bl	printf
	
	sub	r5, #1
	cmp	r5, #4
	bge	testloop

// finish program
	mov	r0, #EXIT_SUCCESS
	bl	exit
