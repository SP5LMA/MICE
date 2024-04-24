.include "include/consts.s"

.data
	hello: .asciz "Salut, Mundi!\n"

.text
.global	main
.syntax unified
.thumb
.type	main, %function
.thumb_func
main:
	ldr r0, =hello
	bl printf
	
	mov r0, #EXIT_SUCCESS
	bl exit
