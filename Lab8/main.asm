; Author: Matthew Romleski
; Tech ID: 12676184
; A program which executes an infinite loop to toggle the LED in the XMEGA_A1U Xplained pro kit. The LED toggles every 500ms.
; The default clock generator is a 2MHz internal RC oscillator. Thus, we generate a delay for 500ms at 2MHz.

	.dseg
	.def	pinMask	= r16

	.cseg
	.org	0x00
	rjmp	start
	.org	0xF6

start:
	ldi		pinMask, 0x08 ; A mask to manipulate the 3rd pin of ports.
	sts		PORTQ_DIRSET, pinMask ; Sets the 3rd pin of port Q as an output.
forever:
	sts		PORTQ_OUTTGL, pinMask ; Toggles the 3rd pin of port Q.
	call	delay500msAt2MHz ; Delays.
	jmp		forever ; Loops.

delay500msAt2MHz:
; Generated by delay loop calculator
; at http://www.bretmulvey.com/avrdelay.html
; Delay 999,995 cycles (5 other cycles come from other functions in the loop).
; 500ms at 2 MHz

    ldi		r18, 6
    ldi		r19, 19
    ldi		r20, 170
L1: dec		r20
    brne	L1
    dec		r19
    brne	L1
    dec		r18
    brne	L1
	ret
