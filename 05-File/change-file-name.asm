.STACK 64
.DATA 

     X db ?
     cBUFFER db 10,?, 10 dup('$'),"$" 

    
     Y DB ?
     nBUFFER db 10,?, 10 dup('$'),"$"
     
     EN DB 10,13,10,13,"$"
     
     PEY1 DB "PLEASE INSERT DESTINATION DRAIVE",10,13,10,13,"$" 
     PEY2 DB "PLEASE INSERT CURRENT FOR FILE",10,13,10,13,"$"
     PEY3 DB "PLEASE INSERT NEW NAME FOR FILE",10,13,10,13,"$"

     DRIVE DB ?
.CODE
   MAIN PROC FAR 
      MOV AX,@DATA
      MOV DS,AX
      
      MOV DX,OFFSET PEY1 
      MOV AH,9
      INT 21H
  
      MOV AH,1
      INT 21H 
      MOV DRIVE,AL
  
      MOV DX,OFFSET EN
      MOV AH,9
      INT 21H 
  
      MOV DX,OFFSET PEY2 
      MOV AH,9
      INT 21H
    
      MOV AH,0AH
      MOV DX,OFFSET cBUFFER
      INT 21H
   
      MOV BL,cBUFFER+1
      MOV BH,0
      MOV [cBUFFER+BX+2],0 
      
      MOV CL,DRIVE
      MOV [X],CL
      MOV [cBUFFER],":"
      MOV [cBUFFER+1],"\"
  
      MOV DX,OFFSET EN
      MOV AH,9
      INT 21H
      
      MOV DX,OFFSET PEY3 
      MOV AH,9
      INT 21H
      
      MOV AH,0AH
      MOV DX,OFFSET nBUFFER
      INT 21H
   
      MOV BL,nBUFFER+1
      MOV BH,0
      MOV [nBUFFER+BX+2],0 
      
      MOV CL,DRIVE
      MOV [Y],CL
      MOV [nBUFFER],":"
      MOV [nBUFFER+1],"\"
  
      MOV DX,OFFSET EN
      MOV AH,9
      INT 21H 
  
      MOV AH,9
      MOV DX,OFFSET X
      INT 21H
      
      MOV DX,OFFSET EN
      MOV AH,9
      INT 21H
      
      MOV DX,OFFSET Y
      MOV AH,9H
      INT 21H
  	
      MOV DX,OFFSET X
      MOV DI,OFFSET Y
      MOV AH,56H
      INT 21H  
      
      MOV AX,4C00H
      INT 21H
      MAIN ENDP
   END MAIN