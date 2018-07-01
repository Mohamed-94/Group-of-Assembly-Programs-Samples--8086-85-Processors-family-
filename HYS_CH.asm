.MODEL SMALL
.STACK 100H
.DATA
LF EQU 0DH
CR EQU 0AH
prompt DB LF,CR,'Enter The Day : $'
MSG_M DB LF,CR,'Enter The Month: $'
MSG_Y DB LF,CR,'Enter The Year(1980..2099) : $'
MSGSUC DB LF,CR,'Your Date Is Changed.$'
MSGFAIL DB LF,CR,'Your Date Is Not Changed.'
DB LF,CR,'Do You Want To Try Again Y/N? $'
MSGINV DB LF,CR,'Invalid Date...'
DB LF,CR,'Do You Want To Try Again Y/N? $'
year DW '?'
month DB '?'
day DB '?'
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
begin :
; Display Prompy Message
MOV AH,9
LEA DX , prompt
INT 21H
; Read the Day
CALL INDEC
CMP AL , 1
JL begin
CMP AL , 31D
JG begin
MOV DAY , AL
@month :
MOV AH , 9
LEA DX , MSG_M
INT 21H
; Read the Month
CALL INDEC
CMP AL , 1
JL @MONTH
CMP AL , 31D
JG @MONTH
CALL INDEC
MOV MONTH , AL
@YEAR :
MOV AH,9
LEA DX , MSG_Y
INT 21H
; Read the Year
CALL INDEC
CMP AX , 1980D
JL @YEAR
CMP CX , 2099D
JG @YEAR
; Set Date using Function 2Bh
MOV CX , AX ; CX = The Year
MOV DH , MONTH ; DH = The Month
MOV DL , DAY ; DL = The Day
MOV AH , 2BH
INT 21H
;IS DATE CHANGED ?
CMP AL , 00H
JNE AGAIN
MOV AH , 9H
LEA DX , MSGSUC
INT 21H
JMP EXIT
AGAIN:
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