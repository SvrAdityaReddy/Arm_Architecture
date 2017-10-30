     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		 
	MOV r1, #5
loop
result
	MOV r3, r1 ;Output is stored in r3
stop B stop ; stop program
     ENDFUNC
     END