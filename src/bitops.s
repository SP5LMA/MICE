.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
	testmsg: .ascii "@@@@\n"
	.equ testmsglen, . -testmsg

.text
.global _start
_start:
	ldr r1, =testmsg
	ldr r0, [r1]
	orrs r0, #0x21
	str r0, [r1]

	ldr r2, =#0x21222324
	orrs r0, r2
	str r0, [r1]
	
	ands r0, #0x0ff00000
	mvns r0, r0
	strb r0, [r1]

	ldrb r0, [r1]
	eors r0, #0xDe
	strb r0, [r1]
	
	mov	r0, #STDOUT
	ldr	r1, =testmsg
	mov	r2, #testmsglen
	mov	r7, #sys_write
	svc	#0

	mov	r0, #EXIT_SUCCESS
	mov	r7, #sys_exit
	svc	#0
