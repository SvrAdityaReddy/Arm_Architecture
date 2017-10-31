     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
	; if(r0 > r1) {
	;	if(r1 > r2) {
	;		if(r2 > r3) {
	;			r4=#4
	;		}
	;	} 
	; }
	MOV r0, #8
	MOV r1, #6
	MOV r2, #2
	MOV r3, #1
	CMP r0, r1
	ITTT GT
	SUBGT r5, r1, r2
	SUBGT r5, r2, r3
	MOVGT r4, #4
stop B stop ; stop program
     ENDFUNC
     END