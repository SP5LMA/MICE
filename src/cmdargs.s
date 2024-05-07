.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
.align	4
	resultfmt:	.asciz "[%s]\n"

.text
.align	4
.global main
.syntax unified
.thumb
.type main,%function
.thumb_func
main:
	ldr r5, [sp, #0xc]	// load pointer to initial frame
	ldr r4, [sp, #0x8]	// load number of arguments
//	add r5, r5, r4, LSL #2  // start from the last one
checkargc:
	cmp r4, #1		// check argument counter
	ble quiterr		// if argc <= 1 then halt
	ldr r0, =resultfmt	// load formatting string
//	ldr r1, [r5, #-0x4]!	// load pointer to argv[n-1]
	ldr r1, [r5, #0x4]!	// load pointer to argv[n+1]
	bl printf		// printf message with argv
	sub r4, #1		// decrement argc
	b checkargc		// repeat

/*
 * properly quit the app using different exit codes
 */
quiterr:
	mov r1, #EXIT_FAILURE
	b  _quit
quitok:
	mov	r0, #EXIT_SUCCESS
_quit:
	mov	r7, #sys_exit
	svc	#0
