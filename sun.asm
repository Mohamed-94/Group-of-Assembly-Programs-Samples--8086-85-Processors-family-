 TITLE SUN
.MODEL SMALL
.STACK 100H
.DATA
 CR EQU 0DH
LF EQU 0AH
PROMPT DB 'TYPE A LINE OF TEXT',CR,LF,'$'
NOCAP_MSG DB CR,LF,'NO CAPITALS $'
CAP_MSG DB CR,LF,'FIRST CAPITAL ='
FIRST DB ']$'
DB ' LAST CAPITAL = '
LAST DB '@ $'
.CODE
MAIN PROC
; initialize DS
MOV AX,@DATA
MOV DS,AX
;display opening message
LEA DX,prompt
MOV AH,09H
INT 21H
;read and process a line of text
MOV AH,01H
INT 21H
WHILE_:
CMP AL,CR
JE END_WHILE
;if char is capital
CMP AL,'A'
JNGE END_IF
CMP AL,'Z'
JNLE END_IF
; if character precede first capital
CMP AL,FIRST
JNL CHECK_LAST
MOV FIRST,AL
CHECK_LAST:
; if character follow last capital
CMP AL,LAST
JNG END_IF
MOV LAST,AL
END_IF:
INT 21H
JMP WHILE_
END_WHILE:
MOV AH,9
;if no capital were typed
CMP FIRST,']'
JNE CAPS
LEA DX,NOCAP_MSG
JMP DISPLAY
CAPS:
LEA DX,CAP_MSG
DISPLAY:
;INT 21H
;exit to DOS
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN

;MOV AH,1
;REPEAT:
;INT 21H
;CMP AL ,'
;JNE REPEAT
 
;MOV CX,80
;MOV AH , 2
;MOV DL , *'
;Top: INT 21h
;LOOP top

;MOV AH , 1 
;INT 21h
;CMP AL , y'
;JE then
;CMP AL ,Y'
;JE Then
;JMP else_
;Then: MOV DL,AL
;MOV AH , 2
;INT 21h
;JMP End_if
;else:
;MOV AH ,4ch
;INT 21h
;End_if:


;MOV AH , 1 
;INT 21h
;CMP AL , A'
;JNGE End_IF
;CMP AL , Z'
;JNLE End_IF
;MOV DL , AL
;MOV AH , 2
;INT 21h
;End_IF:


;CMP AL , 1
;JE ODD
;CMP AL , 3
;JE ODD
;CMP AL , 2
;JE EVEN
;CMP AL , 4
;JE EVEN
;JMP END_CASE
;ODD: MOV DL , O'
;JMP DISPLAY
;EVEN: MOV DL , E'
;DISPLAY: MOV AH ,2
;INT 21H
;END_CASE:


;MOV AX,@DATA
;MOV DS,AX
;LEA DX,MSG
;MOV AH,2
;MOV CX,256
;MOV DL,0
;Print_Loop:
;INT 21H
;INC DL
;DEC CX
;JNZ PRINT_LOOP
;MOV AH,4CH
;INT 21H
;MAIN ENDP
;END MAIN
