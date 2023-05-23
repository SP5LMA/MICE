.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
	formatting: .asciz "%s\n"
	filename: .asciz "/root"

	denied: .ascii "Access denied\n"
	.equ deniedlen, . -denied

	bufsize: .word 0x0
	bufptr: .word 0x0
.bss
	.equ DIRBUF_SIZE, 65536
	dirbuf: .space DIRBUF_SIZE
	

.text
.global _start
_start:
	bl opendir
	bl getdents
	bl showdents
	b  quitappok

/*
 * function should open and load directory contents
 */
opendir:
	ldr r0, =filename
	mov r1, #(O_DIRECTORY)
	mov r7, #sys_open
	svc #0
	// set CPSR flags register
	cmp r0, #0
	bmi accessdenied
	bx lr

/*
 * get entries from properly opened directory
 * arguments:
 *  r0: file descriptor
 */
getdents:
	ldr r1, =dirbuf
	mov r2, #DIRBUF_SIZE
	mov r7, #sys_getdents
	svc #0
	cmp r0, #0
	bmi accessdenied
	ldr r1, =bufsize
	str r0, [r1]
	bx lr

/*
 * scans acquired directory entries
 */
showdents:
	push {r4, r5, r6, r7, r8, r9, r10, r11, r14}

next_entry:
	ldr r6, =dirbuf
	ldr r1, =bufptr
	ldr r1, [r1]
	ldr r2, =bufsize
	ldr r2, [r2]
	cmp r1, r2
	beq over
	add r6, r1

	ldrh r2, [r6, #0x08]	// load offset value

	// increase buffer pointer
	ldr r0, =bufptr
	ldr r1, [r0]
	add r1, r2
	str r1, [r0]

	ldr r0, =formatting
	add r1, r6, #0x0a
	bl printf

	b next_entry

over:
	pop {r4, r5, r6, r7, r8, r9, r10, r11, r14}
	bx lr

/*
 * prints error message
 */
accessdenied:
	mov r0, #STDERR
	ldr r1, =denied
	mov r2, #deniedlen
	mov r7, #sys_write
	svc #0
	b errquitapp

/*
 * properly quit the app using different exit codes
 */
errquitapp:
	mov r1, #EXIT_FAILURE
	b  quitapp
quitappok:
	mov	r0, #EXIT_SUCCESS
quitapp:
	mov	r7, #sys_exit
	svc	#0
