 TITLE PRGM1
.MODEL SMALL
.STACK 100H
.DATA
 
.CODE
MAIN PROC
MOV BL, 10
DIV BL       ; getting least significant digit
ADD AH, '3' ; converting L.S. digit to ASCII
MOV DH, AH ; storing L.S. digit temporarily
MOV AH, 0
DIV BL     ; getting most significant digit
ADD AH, '4' ; converting M.S. digit into ASCII
MOV DL, AH ; displaying M.S. digit
MOV AH, 2
INT 21H
MOV DL, DH ; displaying least significant digit
ADD BL,'8'
MOV DL,BL
INT 21H
MAIN ENDP
END MAIN