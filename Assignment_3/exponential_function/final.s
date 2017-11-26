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
	VMOV.F32 exponent, #1
	VMOV.F32 n, #10
	VMOV.F32 sum, #1
	VMOV.F32 temp, #1
loop 
	VCMP.F32 n, #0x00000000
	VMRS APSR_nzcv, FPSCR
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