     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION	
a	RN r1
b	RN r2
	MOV a, #2
	MOV b, #8
loop 
	TEQ a, b
	BEQ result
	CMP a, b
	ITE GT
	SUBGT a, b
	SUBLE b, a
	B loop
result
	MOV r3, a ;Output i.e gcd(a,b) is stored in r3
stop B stop ; stop program
     ENDFUNC
     END