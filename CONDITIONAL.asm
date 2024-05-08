.MODEL SMALL
.STACK 100H

.DATA
    ;NUM1 DB ?
    ;NUM2 DB ?
    STR1 DB 0AH, 0DH, 'ENTER 1ST NUMBER: $'
    STR2 DB 0AH, 0DH, 'ENTER 2ND NUMBER: $'
    STR3 DB 0AH, 0DH, 'THE LARGEST NUMBER IS: $'  
    STR4 DB 0AH, 0DH, 'EQUAL: $' 
    
.CODE
    MAIN PROC
        ;INITIALIZATION
        MOV AX, @DATA
        MOV DS, AX  
        
        ;PRINT STRING1
        MOV AH, 9
        MOV DX, OFFSET STR1
        INT 21H        
        ;1ST NUMBER
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        
        MOV BL, AL

        ;PRINT STRING2
        MOV AH, 9     
        MOV DX, OFFSET STR2
        INT 21H 
        ;2ND NUMBER
        MOV AH,1 
        INT 21H
        SUB AL, 30H
        
        MOV BH, AL
        
        ;COMPARE
        CMP BL, BH
        JG LARGE
        JE EQUAL
       
        MOV DX, OFFSET STR3
        MOV AH, 9
        INT 21H
                
        MOV DL, BH
        MOV AH, 2
        ADD DL,30H
        INT 21H
                
        JMP EXIT

        LARGE: 
            MOV AH, 9
            MOV DX, OFFSET STR3
            INT 21H
            
            MOV DL, BL
            MOV AH, 2
            ADD DL,30H 
            INT 21H
            JMP EXIT
        
        EQUAL:
            MOV AH, 9
            MOV DX, OFFSET STR4
            INT 21H          
            
        
        EXIT: 
            MOV AH, 4CH
            INT 21H
    
    MAIN ENDP
END MAIN
