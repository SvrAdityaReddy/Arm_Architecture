     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
	; Getting the remainder of a division:
	; udiv                rT,rA,rB                    /* rT = rA / rB      (example: 1 = 17 / 10) */
	; mls                 rT,rT,rB,rA                 /* rT = rA - rT * rB (example: 7 = 17 - (1 * 10)) */
divisor RN r0
number RN r1
	MOV divisor, #2
	MOV number, #5
	udiv r2, number, divisor
	MLS r2, r2, divisor, number
	CMP r2, #0
	ITE EQ
	MOVEQ r3, #0 ; r3=0 if number is even
	MOVNE r3, #1 ; r3=1 if number is odd
stop B stop ; stop program
     ENDFUNC
     END

; References
; https://community.arm.com/processors/b/blog/posts/arm-cortex-m3-and-later-basic-integer-math-operations-32-bit-1-5