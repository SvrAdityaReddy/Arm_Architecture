     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		 
        MOV r0, #0x11 ; load initial value
        LSL r1, r0, #1 ; shift 1 bit left
        LSL r2, r1, #1 ; shift 1 bit left
stop B stop ; stop program
     ENDFUNC
     END