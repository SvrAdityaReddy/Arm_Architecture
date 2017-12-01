     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
	
number1 RN r0
number2 RN r1
number3 RN r2
	MOV number1, #1
	MOV number2, #2
	MOV number3, #3
	; check number1 > number2 if true change to branch 1 else branch2
	CMP number1, number2 
	BGE branch1
	B branch2
branch1
	MOV r3, number1
	; r3 will contain number1 which greatest among number1, number2
	B branch3
branch2
	MOV r3, number2
	; r3 will contain number2 which greatest among number1, number2
branch3
	; check r3 > number3 if true change to branch 4 else branch5
	CMP r3, number3
	BGE branch4
	B branch5
branch4
	MOV r4, r3 ; r4 stores greater of all three numbers number1, number2, number3
	B stop
branch5
	MOV r4, number3 ; r4 stores greater of all three numbers number1, number2, number3
stop B stop ; stop program
     ENDFUNC
     END