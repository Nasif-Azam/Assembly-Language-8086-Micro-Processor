.MODEL SMALL
.STACK 100H
.DATA
    STR DB 'NUMBER1:$' 
    STR1 DB 'NUMBER2:$'
    N DB ?
    
.CODE
    MAIN PROC 
        
        MOV AX, @DATA
        MOV DS, AX  
        
        ; PRINT A STRING
        
        LEA DX,STR
        MOV AH,9
        INT 21H   
        
        ;INPUT THE LEFTMOST DIGIT
        
        MOV AH,1
        INT 21H     
        SUB AL,30H
        
        MOV AH,0H
        MOV BL,10H 
        MUL BL     
        
        
        ; MOV THE RESULT OF MULTIPLICATION TO VARIABLE N
        
        MOV N,AL      
        
        ;NEWLINE
        MOV AH,2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H  
        
        ; PRINT A STRING
        
        LEA DX,STR1
        MOV AH,9
        INT 21H 
        
        ; INPUT THE RIGHTMOST VALUE
        MOV AH,1
        INT 21H
        SUB AL,30H
        
        ADD N,AL     
        
        
       
        ;PRINT THE VALUE OF VARIABLE N
        
        ;MOV DL,N
        ;MOV AH,2
        ;INT 21H   
        
        LEA DX, N
        MOV AH, 9
        INT 21H
        
        
        
        
        
        
        
        MOV AH,4CH
        INT 21H
        
        
        
        
        
        
    MAIN ENDP
    
END MAIN