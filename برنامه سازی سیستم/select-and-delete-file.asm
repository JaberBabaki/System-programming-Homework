.STACK 64
.DATA 

     x db ?
     BUFFER db 10,?, 10 dup('$'),"$" 
     PEY1 DB "PLEASE INSERT DESTINATION DRAIVE",10,13,10,13,"$" 
     PEY2 DB "PLEASE INSERT NAME FOR FOLDER",10,13,10,13,"$"
     EN DB 10,13,10,13,"$"

     ;FIME DB "D:\JAH.TXT",0
     ;HANDLE DW ?
     GG DB 10 DUP(?),"$"
.CODE
   MAIN PROC FAR 
      MOV AX,@DATA
      MOV DS,AX
      
      MOV DX,OFFSET PEY1 
      MOV AH,9
      INT 21H
  
      MOV AH,1
      INT 21H 
      MOV CL,AL
  
      MOV DX,OFFSET EN
      MOV AH,9
      INT 21H 
  
      MOV DX,OFFSET PEY2 
      MOV AH,9
      INT 21H
    
      MOV AH,0AH
      MOV DX,OFFSET BUFFER
      INT 21H
   
      MOV BL,BUFFER+1
      MOV BH,0
      MOV [BUFFER+BX+2],0 
  
      MOV [x],CL
      MOV [BUFFER],":"
      MOV [BUFFER+1],"\"
  
      MOV DX,OFFSET EN
      MOV AH,9
      INT 21H 
  
      MOV AH,9
      MOV DX,OFFSET x
      INT 21H
      
      MOV DX,OFFSET X
      MOV AH,41H
      INT 21H
  	
       
      
      MOV AX,4C00H
      INT 21H
      MAIN ENDP
   END MAIN