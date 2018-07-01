TITLE THIRD: CASE CONVERSION PROGRAM
.MODEL SMALL
.STACK 100H
.DATA
CR EQU 0DH
LF EQU 0AH
;include 
;ORG 100h
LEA SI, msg1 ; ask for the number
CALL print_string 
CALL scan_num ; get number in CX.
MOV AX, CX ; copy the number to AX.
; print the following string:
CALL pthis
DB 13, 10, 'You have entered: ', 0
CALL print_num ; print number in AX.
RET ; return to operating system.
msg1 DB 'Enter the number: ', 0
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS ; required for print_num.
DEFINE_PTHIS
END ; directive to stop the compiler.