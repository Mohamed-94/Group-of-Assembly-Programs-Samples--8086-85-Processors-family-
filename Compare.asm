
.MODEL SMALL
.STACK 100H
.DATA
printCh dw '?'
MSGS DB 0DH,0AH,'Start Time is $'
Hs DB '?'
Ms DB '?'
Scs DB '?'
HSs DB '?'
MSGe DB 0DH,0AH,'Finish Time is $'
He DB '?'
Me DB '?'
Se DB '?'
HSe DB '?'
MSGR DB 0DH,0AH,'Run Time is $'
.CODE
MAIN PROC
;initialization
MOV AX , @DATA
MOV DS , AX
; Get start time
MOV AH,2CH
INT 21H
MOV Hs , CH
MOV Ms , CL
MOV Scs , DH
MOV HSs , DL
MOV AX,0B800h ;color active display
page
MOV DS,AX
MOV AH,17H
MOV BX,9
DISPLAY_ALL:
MOV AL,41h
AGAIN:
MOV DI,0
MOV CX,2000d
;fill active display page
FILL_BUF:
MOV [DI],AX
ADD DI,2
LOOP FILL_BUF ;loop until done
ADD AX,01H
CMP AL,'Z'
JLE AGAIN
DEC BX
JNZ DISPLAY_ALL
; Get finish time
MOV AX , @DATA
MOV DS , AX
MOV AH,2CH
INT 21H
MOV He , CH
MOV Me , CL
MOV Se , DH
MOV HSe , DL
; display start time
MOV AH , 9
LEA DX , MSGs
INT 21H
XOR AX , AX
MOV AL , Hs
CALL OUTDEC
MOV DL , ':'
MOV AH , 2
INT 21H
XOR AX , AX
MOV AL , Ms
CALL OUTDEC
MOV DL , ':'
MOV AH , 2
INT 21H
;
XOR AX , AX
MOV AL , Scs
CALL OUTDEC
MOV DL , '.'
MOV AH , 2
INT 21H
;
XOR AX , AX
MOV AL , HSs
CALL OUTDEC
MOV DL , ':'
MOV AH , 2
INT 21H
; display finish time
MOV AH , 9
LEA DX , MSGe
INT 21H
XOR AX , AX
MOV AL , He
CALL OUTDEC
MOV DL , ':'
MOV AH , 2
INT 21H
;
XOR AX , AX
MOV AL , Me
CALL OUTDEC
MOV DL , ':'
MOV AH , 2
INT 21H
;
XOR AX , AX
MOV AL , Se
CALL OUTDEC
MOV DL , '.'
MOV AH , 2
INT 21H
;
XOR AX , AX
MOV AL , Hse
CALL OUTDEC
MOV DL , ':'
MOV AH , 2
INT 21H
; display run time
MOV AH , 9
LEA DX , MSGR
INT 21H
XOR AX , AX
MOV AL , He
SUB AL , Hs
CALL OUTDEC
MOV DL , ':'
MOV AH , 2
INT 21H
XOR AX , AX
MOV AL , Me
SUB AL , Ms
CALL OUTDEC
MOV DL , ':'
MOV AH , 2
INT 21H
XOR AX , AX
MOV AL , Se
SUB AL , Scs
CALL OUTDEC
MOV DL , '.'
MOV AH , 2
INT 21H
XOR AX , AX
MOV AL , HSe
SUB AL , HSs
CALL OUTDEC
; dos exit
MOV AH,4CH
INT 21H
MAIN ENDP
Include DES_NUM.asm
END MAIN