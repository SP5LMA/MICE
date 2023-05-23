.include "include/consts.s"

.data
	hello: .asciz "Salut, Mundi!\n"

.text
.global _start
_start:
	ldr r0, =hello
	bl printf
	
	mov r0, #EXIT_SUCCESS
	bl exit
