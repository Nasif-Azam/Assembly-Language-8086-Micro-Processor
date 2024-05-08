.MODEL SMALL
.STACK 100H
 
 .DATA
    MSG  DB  'THE NATURAL NUMBERS 0 to 9 is : $'
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX
 
     MOV AH, 9
     MOV DX, OFFSET MSG 
     INT 21H
 
     MOV CX, 10                   
 
     MOV AH, 2                    
     MOV DL, 48                   
 
     LOOP:                      
       INT 21H                    
 
       INC DL                     
       DEC CX                     
     JNZ LOOP                   

   MAIN ENDP
 END MAIN