.include "include/syscalls-eabi.s"
.include "include/consts.s"

.set SYSINFOLEN, 128

.data
	filename: .ascii "sysinfo.bin\0"

.bss
	.align 2
	sysinfobuf: .space SYSINFOLEN

.text
.align	2
.global	main
.syntax unified
.thumb
.type	main, %function
.thumb_func
main:
	bl prepareinfo
	bl createfile
	bl writeinfo
	b  quitapp

prepareinfo:
	ldr r0, =sysinfobuf
	mov	r7, #sys_sysinfo
	svc #0
	bx lr //return method 1 - recommended

createfile:
	ldr r0, =filename
	mov r1, #(O_CREAT | O_WRONLY)
	mov r2, #(S_IRUSR | S_IWUSR | S_IRGRP)
	mov r7, #sys_open
	svc #0
	//after syscall file descriptor is returned via r0
	mov pc, lr //return method 2 - not recommended

writeinfo:
	push {r3, r4, lr} //makes possible to call other functions
	//this procedure assumes that r0 contains file descriptor
	ldr r1, =sysinfobuf
	mov r2, #SYSINFOLEN
	mov r7, #sys_write
	svc #0	
	pop {r3, r4, pc} //return method 3

quitapp:
	mov	r0, #EXIT_SUCCESS
	mov	r7, #sys_exit
	svc	#0
