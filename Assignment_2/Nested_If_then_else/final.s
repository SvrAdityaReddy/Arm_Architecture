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
	SUBSGT r5, r1, r2
	SUBSGT r5, r2, r3
	MOVGT r4, #4
	; if(r0 > r1) {
	;	if(r0 > r2) {
	;		r4=r0
	;	}
	;	else {
	;		r4=r2
	;	}
	; }
	MOV r0, #8
	MOV r1, #12
	MOV r2, #10
	CMP r0, r1
	ITTE GT
	SUBSGT r5, r0, r2
	MOVGT r4, r0
	MOVLE r4, r2
	; if(r0 > r1) {
	;	if(r0 > r2) {
	;		r4=r0
	;	}
	;	else {
	;		r4=r2
	;	}
	; }
	; else {
	; 	if(r1 > r2) {
	;		r4=r1
	;	}
	;	else {
	;		r4=r2
	;	}
	; }	
	MOV r0, #1
	MOV r1, #2
	MOV r2, #3
	CMP r0, r1
	BGE branch1
	B branch2
branch1
	MOV r3, r0
	B branch3
branch2
	MOV r3, r1
branch3
	CMP r3, r2
	BGE branch4
	B branch5
branch4
	MOV r4, r3 ; r4 stores greater of all three numbers number1, number2, number3
	B stop
branch5
	MOV r4, r2 ; r4 stores greater of all three numbers number1, number2, number3
stop B stop ; stop program
     ENDFUNC
     END