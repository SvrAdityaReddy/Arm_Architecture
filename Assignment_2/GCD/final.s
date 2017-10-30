     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		 
	MOV r1, #2
	MOV r2, #2
loop 
	TEQ r1, r2
	BEQ result
	CMP r1, r2
	ITE GT
	SUBGT r1, r2
	SUBLE r2, r1
	B loop
result
	MOV r3, r1 ;Output is stored in r3
stop B stop ; stop program
     ENDFUNC
     END