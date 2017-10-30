     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
	MOV r0, #0
	MOV r1, #1
	MOV r2, #2
	CMP r2, #0
	BEQ branch1
	SUB r2, #1
loop
	CMP r2, #0
	BEQ branch2
	MOV r3, r1 ; r3 is temporary variable
	ADD r1, r0
	MOV r0, r3
	SUB r2, #1
	B loop
branch1 ; if n==0
	MOV r4, r0 ; Output is stored in r4 if n is zero
	B stop
branch2 ; if n!=0
	MOV r4, r1 ; Output is stored in r4 if n is non zero
stop B stop ; stop program
     ENDFUNC
     END