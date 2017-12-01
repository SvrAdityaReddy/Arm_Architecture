     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION	
exponent	SN s0
n	SN s1
sum SN s2
temp SN s3
	
	VMOV.F32 exponent, #2 ; x in e^x
	VMOV.F32 n, #13 ; n in taylor series expansion of e^x
	;e^x = 1 + (x/1) (1 + (x/2) (1 + (x/3) (........) ) ) equivalent final value stored in sum
	VMOV.F32 sum, #1 ; to store final value of e^x computed according to x, n
	VMOV.F32 temp, #1 ;temporary variable to store 1
loop 
	VCMP.F32 n, #0x00000000
	VMRS APSR_nzcv, FPSCR ; to copy FPSCR status registers to APSR and then check eq flag for branching 
	BEQ result
	VDIV.F32 sum, sum, n
	VMUL.F32 sum, sum, exponent
	VADD.F32 sum, sum, temp
	VSUB.F32 n, n, temp
	B loop
result
	VMOV.F32 s4, sum ; Output is stored in r4
stop B stop ; stop program
     ENDFUNC
     END