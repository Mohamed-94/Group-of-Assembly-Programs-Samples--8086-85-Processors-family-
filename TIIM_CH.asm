.MODEL SMALL
.STACK 100H
.DATA
LF EQU 0DH
CR EQU 0AH
PROMPT DB LF,CR,'Enter The Hour(0..23) :$'
MSG_M DB LF,CR,'Enter The Minute(0..59): $'
MSG_S DB LF,CR,'Enter The Second(0..59): $'
MSGSUC DB LF,CR,'Your time is changed.$'
MSGFAIL DB LF,CR,'Your Time Is Not Changed.'
DB LF,CR,'Do You Want To Try Again Y/N? $'
MSGINV DB LF,CR,'Invalid Time...'
DB LF,CR,'Do You Want To Try Again Y/N? $'
HOUR DB '?'
MINUTE DB '?'
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
begin :
; DISPLAY PROMPT MESSAGE
MOV AH , 9
LEA DX , prompt
INT 21H
; Read The Hour
CALL INDEC
MOV HOUR , AL
CMP AL , 23D
JG begin
@minute:
MOV AH , 9
LEA DX , MSG_M
INT 21H
; Read the Minute
CALL INDEC
CMP AL , 59D
JG @minute
MOV MINUTE , AL
@second :
MOV AH,9
LEA DX , MSG_S
INT 21H
; Read The Second
CALL INDEC
CMP AL , 59D
JG @second
; Set Time using Function 2Dh
MOV DH , AL ; DH = Seconds
MOV CL , MINUTE ; CL = Minutes
MOV CH , HOUR ; CH = Hour
MOV AH , 2DH
INT 21H
;IS DATE CHANGED ?
CMP AL , 00H
JNE AGAIN
MOV AH , 9H
LEA DX , MSGSUC
INT 21H
JMP EXIT
again:
MOV AH , 9H
LEA DX , MSGFAIL
INT 21H
answer: ;ANSWER Y/N
MOV AH , 1H
INT 21H
CMP AL , 'Y'
JE begin
CMP AL , 'y'
JE begin
CMP AL , 'n'
JE EXIT
CMP AL , 'N'
JE EXIT
JMP ANSWER
exit:
MOV AH , 4CH
INT 21H
MAIN ENDP
include DES_NUM.asm
END MAIN