OUTDEC PROC
; Prints AX as a signed decimal integer
; input : AX
; Output : None
PUSH AX
PUSH BX
PUSH CX
PUSH DX
;if AX < 0
OR AX , AX
JGE @END_IF1
;Then
PUSH AX
MOV DL , '-'
MOV AH,2
INT 21H
POP AX
NEG AX
@END_IF1:
XOR CX , CX ;Get Decimal Digit
MOV BX , 10D
@REPEAT1:
XOR DX , DX
DIV BX
PUSH DX
INC CX
OR AX , AX
JNE @REPEAT1
;Convert Digits to characters and print them
MOV AH , 2
@PRINT_LOOP:
POP DX
OR DL , 30H
INT 21H
LOOP @PRINT_LOOP
POP DX
POP CX
POP BX
POP AX
RET
OUTDEC ENDP
INDEC PROC
; Reads a number in range -32768 to 32767
; input : None
; Output : AX = Binary equivalent Of Number
PUSH BX
PUSH CX
PUSH DX
@BEGIN: MOV AH , 2
MOV DL , '?'
INT 21H
XOR BX , BX ; total =0
XOR CX , CX
;Read A Character
MOV AH , 1
INT 21H
;Case Char of
CMP AL ,'-'
JE @MINUS
CMP AL , '+'
JE @PLUS
JMP @REPEAT2
@MINUS: MOV CX , 1
@PLUS: INT 21H
@REPEAT2:;If Character Between 0 AND 9
CMP AL , '0'
JNGE @NOT_DIGIT
CMP AL , '9'
JNLE @NOT_DIGIT
; Convert Character To Digit
AND AX ,000FH
PUSH AX
; TOTAL = TOTAL * 10 + DIGIT
MOV AX , 10 ;Get 10
MUL BX ;AX = TOTAL * 10
POP BX ;RETRIEVE DIGIT
ADD BX , AX ; TOTAL =
;Read A Character
MOV AH , 1
INT 21H
CMP AL,0DH
JNE @REPEAT2
MOV AX , BX
OR CX , CX
JE @EXIT
NEG AX
@EXIT: POP DX
POP CX
POP BX
RET
@NOT_DIGIT:
MOV AH , 2
MOV DL , 0DH
INT 21H
MOV DL , 0AH
INT 21H
JMP @BEGIN
INDEC ENDP