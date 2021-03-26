.ORIG x3000
AND R0, R0, #0
ADD R0, R0, #1 ; r0 has 1
LEA R1, FIRST ; r1 has address of x4000
LDW R2, R1, #0 ;r2 has x4000
STW R0, R2, #0 ; puts 1 in x4000

LEA R0, START
LDW R0, R0, #0 ; r0 has xc000, will be used as base

LEA R1, TWENTY
LDW R1, R1, #0 ; r1 has the counter which starts at 20

AND R2, R2, #0 ; r2 holds current sum

LOOP LDB R3, R0, #0 ; r3 holds byte in memory
ADD R2, R2, R3 ; r2 has current sum
ADD R0, R0, #1 ;next memory location
ADD R1, R1, #-1
BRp LOOP

LEA R0, LAST ;r0 has address of xC014
LDW R0, R0, #0 ;r0 has xC014
STW R2, R0, #0 ; stores sum at xc014

LEA R0, PROT ;r0 has address of xC014
LDW R0, R0, #0 ;r0 has x0000
STW R2, R0, #0 ; stores sum at xc014


;UNKNOWN .FILL xA110

HALT

FIRST .FILL x4000
START .FILL xC000
LAST .FILL xC014
PROT .FILL x0000
UNAL .FILL xC017
TWENTY .FILL #20

.END
