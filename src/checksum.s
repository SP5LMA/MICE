.arch armv7a
.include "include/syscalls-eabi.s"
.include "include/consts.s"

.data
.align	2
    str1: .asciz "0123"
    str2: .asciz "I have no special talent. I am only passionately curious.\n"
    
.text
.align	2
.global	main
.syntax unified
.thumb
.type	main, %function
.thumb_func
main:
    mov r0, #0
    ldr r1, =str1
    ldrb r2, [r1], #1
    cmp r2, #0
    beq finish
shift:
    lsrs r2, #1
    IT cs
    addcs r0, #1
    bne shift
    nop
    nop
    nop

finish:
    mov	r0, #EXIT_SUCCESS
    mov	r7, #sys_exit
    svc	#0
