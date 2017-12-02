     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
first RN r0
second RN r1
number RN r2
	MOV first, #0 ; fibonacci(0) = 0
	MOV second, #1 ; fibonacci(1) = 1
	MOV number, #3 ; number whose fibonacci has to be calculated
	CMP number, #0
	; if number is 0 branched to branch1
	MOV r5, #0x20000000 ; initial address from which first (number+1) elements of fibonacci series is stored
	STR first, [R5]
	ADD r5, #4
	BEQ branch1
	SUB number, #1
	STR second, [R5]
	ADD r5, #4
loop
	CMP number, #0
	BEQ branch2
	MOV r3, second ; r3 is temporary variable
	ADD second, first
	STR second, [R5]
	ADD r5, #4
	MOV first, r3
	SUB number, #1
	B loop
branch1 ; if n==0
	MOV r4, first ; Output is stored in r4 if number is zero i.e fibonacci(0)
	B stop
branch2 ; if n!=0
	MOV r4, second ; Output is stored in r4 if number is non zero i.e fibonacci(number)
stop B stop ; stop program
     ENDFUNC
     END
		 
; References
; 