     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION	
a	RN r1
b	RN r2
	MOV a, #8
	MOV b, #2
loop 
	TEQ a, b
	BEQ result
	CMP a, b
	ITE GT
	SUBGT a, a, b
	SUBLE b, b, a
	B loop
result
	MOV r3, a ; Output i.e gcd(a,b) is stored in r3
stop B stop ; stop program
     ENDFUNC
     END