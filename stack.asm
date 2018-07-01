.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
; display user prompt
MOV AH,2
MOV DL,'?'
INT 21H
;initialize character count
XOR CX , CX
;read character
MOV AH , 1
INT 21H
;while character is not a carriage return do
WHILE_:
CMP AL ,0DH
JE END_WHILE
PUSH AX
INC CX
INT 21H
JMP WHILE_
END_WHILE:
MOV AH , 2
MOV DL , 0DH
INT 21H
MOV DL , 0AH
INT 21H
JCXZ EXIT
TOP:
POP DX
INT 21H
LOOP TOP
EXIT: MOV AH , 4CH
INT 21H
MAIN ENDP
END MAIN