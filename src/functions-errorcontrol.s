.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
	filename: .ascii "output.txt\0"

	info: .ascii "File accessed successfully\n"
	.equ infolen, . -info
	
	denied: .ascii "Access denied\n"
	.equ deniedlen, . -denied

.text
.global _start
_start:
	bl createfile
	bl writeinfo
	b  quitappok

/*
 * function should open existing or create new file
 */
createfile:
	ldr r0, =filename
	mov r1, #(O_CREAT | O_WRONLY)
	mov r2, #(S_IRUSR | S_IWUSR | S_IRGRP)
	mov r7, #sys_open
	svc #0
	// set CPSR flags register
	cmp r0, #0
	// altenrative method to set flags
	movs r0, r0
	// r0<0 indicates error - cannot open the file
	// reaction to error
	bmi accessdenied
	bx lr
accessdenied:
	mov r0, #STDERR
	ldr r1, =denied
	mov r2, #deniedlen
	mov r7, #sys_write
	svc #0
	b errquitapp

/*
 * function should append message to the end of file
 */
writeinfo:
	// it assumes that r0 contains descriptor of the opened file
	// save r0 value for later and move to the end of file
	push {r0}
	mov r1, #0
	mov r2, #SEEK_END
	mov r7, #sys_lseek
	svc #0
	pop {r0}
	ldr r1, =info
	mov r2, #infolen
	mov r7, #sys_write
	svc #0
	bx lr

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
