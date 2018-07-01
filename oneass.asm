
.MODEL SMALL
.STACK 100H
.DATA
num DB 5
userMsg DB 'Please enter a number: '
lenUserMsg equ $-userMsg
dispMsg DB 'You have entered: '
lenDispMsg equ $-dispMsg
 .CODE
 MAIN PROC
     mov ax,4 
       mov bx,1
       lea dx, userMsg
       int 21h 
       mov dx, lenUserMsg 
       int 80h
       
       mov ax, 3
       mov bx, 2
       lea dx, num 
       int 21h
       mov dx, 5
       int 80h
       mov ax, 4 
       mov bx, 1 
       lea dx, dispMsg
       int 21h 
       mov dx, lenDispMsg 
       int 80h
       mov ax, 4 
       mov bx, 1 
       ;mov ecx, num 
       mov dx, 5 
       int 80h
       
       mov ax, 1 
       mov bx, 0 
       int 80h
       ; return to DOS
       MOV AX, 4C00H
       INT 21H
       MAIN ENDP
       END MAIN