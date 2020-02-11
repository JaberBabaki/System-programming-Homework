INCLUDE E:/karshnasi/int8086.lib
.STACK 64
.DATA
X DW 100
Y DW 50
.CODE
MAIN PROC FAR
MOV AX,@DATA
MOV DS,AX
MOD_GRAF
FOR:
GET_ALL_CHAR
CMP AH,48H
JE UP
CMP AH,50H
JE DOWN
CMP AH,4BH
JE LEFT
CMP AH,4DH
JE RIGHT
JMP FOR
UP:
DEC Y
SET_PIC X,Y,2
JMP FOR
DOWN:
INC Y
SET_PIC X,Y,2
JMP FOR
LEFT:
DEC X
SET_PIC X,Y,2
JMP FOR
RIGHT:
INC X
SET_PIC X,Y,2
JMP FOR
EXIT
MAIN ENDP