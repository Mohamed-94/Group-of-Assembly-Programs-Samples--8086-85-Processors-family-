INCLUDE DES_NUM.ASM
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
CALL MULTIPLY
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN