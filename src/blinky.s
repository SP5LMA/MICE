.arch armv7a
.include "include/consts.s"
.extern gpiod_chip_open, gpiod_chip_get_line, gpiod_line_request_output, sleep

.data
	path:	.asciz	"/dev/gpiochip0"
	app:	.asciz	"MICE"

.bss
.align 2
	chip:	.word 0x0
	line:	.word 0x0

.text
.align 2
.syntax unified
.thumb

.global	main
.type	main, %function
.thumb_func
main:

	ldr	r0, =path
	bl	gpiod_chip_open
	ldr	r1, =chip
	str	r0, [r1]

	mov	r1, 21
	bl	gpiod_chip_get_line
	ldr	r1, =line
	str	r0, [r1]

	ldr	r0, =line
	ldr	r0, [r0]
	ldr	r1, =app
	eor	r2, r2
	bl	gpiod_line_request_output

loop:
	// OFF
	ldr r0, =line
	ldr r0, [r0]
	mov r1, 0
	bl gpiod_line_set_value
	mov r0, 1
	bl sleep

	// ON
	ldr r0, =line
	ldr r0, [r0]
	mov r1, 1
	bl gpiod_line_set_value
	mov r0, 1
	bl sleep

	b loop
