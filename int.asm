.ORIG x1200
ADD R6, R6, #-2;
STW R0, R6, #0 ; push r0 to stack
ADD R6, R6, #-2
STW R1, R6, #0 ; push r1 to stack

LEA R0, FIRST
LDW R0, R0, #0 ;R0 has x4000
LDW R1, R0, #0 ; R1 has the value in x4000
ADD R1, R1, #1 ; increment r1
STW R1, R0, #0 ; store incremented value back

LDW R1, R6, #0 ; pop r1 from stack
ADD R6, R6, #2 ;
LDW R0, R6, #0 ; pop r0 from stack
ADD R6, R6, #2 ; restore stack pointer

RTI
FIRST .FILL x4000

.END
