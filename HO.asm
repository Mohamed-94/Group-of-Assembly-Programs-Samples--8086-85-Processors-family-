TITLE SECOND: DISPLAY STRING
.MODEL SMALL
.STACK 100H
.DATA

userMsg DB 'Please enter a number: '
lenUserMsg equ $-userMsg
dispMsg DB 'You have entered: '
lenDispMsg equ $-dispMsg

section .bss
   num resb 5
section .text
   global main
 main:
       mov eax,4 
       mov ebx,1
       mov ecx, userMsg 
       mov edx, lenUserMsg 
       int 80h
       
       mov eax, 3
       mov ebx, 2
       mov ecx, num 
       mov edx, 5
       int 80h
       mov eax, 4 
       mov ebx, 1 
       mov ecx, dispMsg 
       mov edx, lenDispMsg 
       int 80h
       mov eax, 4 
       mov ebx, 1 
       mov ecx, num 
       mov edx, 5 
       int 80h
       
       mov eax, 1 
       mov ebx, 0 
       int 80h
       MAIN ENDP
END MAIN