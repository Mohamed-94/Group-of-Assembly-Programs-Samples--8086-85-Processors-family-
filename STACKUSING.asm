.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
; Disply user prompt
MOV AH,2
MOV DL,'?'
INT 21H
XOR CX,CX
; recive an input
MOV AH,1
INT 21H
;WHILE LOOP
WHILE_:
; if input not equal CR 
CMP AL,0DH
; go to end_while
JE END_WHILE
PUSH AX
INC CX
INT 21H
JMP WHILE_
;end_while..
END_WHILE:
; if CR
MOV AH,2
MOV DL,0DH
; if LF
MOV DL,0AH
INT 21H
; exute if CX is ZERO
JCXZ EXIT
TOP:
POP DX
INT 21H
LOOP TOP
; if done end programme
EXIT:
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN