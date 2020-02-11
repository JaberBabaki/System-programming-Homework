.STACK 64
.DATA
   FIME DB "D:\JAH.TXT",0
   BUFFER 20,?,20 DUP("$")
   HANDLE DW ?
.CODE
   MAIN PROC FAR 
      MOV AX,@DATA
      MOV DS,AX
      
      MOV AH,0AH
      MOV DX,OFFSET BUFFER
      INT 21H
      
      MOV AH,3CH
      MOV CX,0
      MOV DX,OFFSET FIME
      
      INT 21H
       MOV HANDLE,AX
      
      MOV BX,HANDLE
      MOV AH,40H     
      MOV CH,0
      MOV CL,BUFFER+1
      MOV DH,0
      MOV DL,BUFFER+2 
      INT 21H
      
       
      
      MOV AX,4C00H
      INT 21H
      MAIN ENDP
   END MAIN