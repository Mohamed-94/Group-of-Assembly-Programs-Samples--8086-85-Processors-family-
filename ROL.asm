.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
MOV DX ,16D ; :t8     7t(  
XOR AX,AX ; AX 6&O *B
MOV CL,1 ;4%  7(
Top : ROL BX,CL
MOV AH,09H
INT 21H
JNC NEXT
INC AX
NEXT: DEC DX
JNZ Top
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN