.data
	hello: .ascii "Salut, Mundi!\n"
	.equ hellolen, . -hello

.text
.global _start
_start:
	mov	r0, #1
	ldr	r1, =hello
	mov	r2, #14
	mov	r7, #4
	svc	#0

	mov	r0, #0
	mov	r7, #1
	svc	#0
