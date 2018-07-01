 .386
.model flat,stdcall

include windows.inc
include kernel32.inc
include user32.inc
includelib kernel32.lib
includelib user32.lib
.data
stinf STARTUPINFO<>
prinf PROCESS_INFORMATION<>
path DB "Animation3D.exe",0
base dd 0045BFC4H
patch dd 74h
msg db "put the leader in the target folder",0
error db "error",0
.CODE
start

invoke CreateProcess,addr path,0,0,0,0,CREATE_SUSPENDED,0,0,addr stinf,addr prinf
.if eax==0
     invoke MessageBox,NULL,addr msg,NULL,MB_OK
     .else 
       invoke WriteProcessMemory,prinf.hProcess,base1,addr patch1,1,NULL
       .if eax==0
         invoke MessageBox,NULL,addr error,addr error,MB_OK
         invoke TerminateProcess,prinf.hProocess,0
         .enif
          invoke ResumeThread,prinf.hThread
         .endif
    invoke ExitProcess,0
end start