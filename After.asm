.MODEL SMALL
.STACK
.DATA
CR EQU 0DH
one DB "THIS IS SOMTHING$",CR,"$"
TWO DB "ONOTHER ONE$"
.CODE
MAIN PROC
;inializing DS
MOV AX,@DATA
MOV DS,AX
;disply the message
LEA DX,one
MOV AH,09H
INT 21H
;for loop
For_Loop:
LEA DX,one
MOV AH,09H
INT 21H
MOV CX,10
DEC CX
CMP CX,0
JE For_Loop
;end programme
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
