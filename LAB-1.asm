.MODEL SMALL
.STACK 100H

.DATA
    STR1 DB 0AH, 0DH, 'NUMBER1: $'
    STR2 DB 0AH, 0DH, 'NUMBER2: $'
    STR3 DB 0AH, 0DH, 'THE 2 DIGIT NUMBER IS: $'
    REM DB ?
    N DB ?      

.CODE
    MAIN PROC
        ;INITIALIZATION
        MOV AX, @DATA
        MOV DS, AX
        
        ;PRINT STRING1        
        MOV AH,9H
        MOV DX, OFFSET STR1
        INT 21H  
                
        ;INPUT THE LEFTMOST DIGIT
        MOV AH, 1H
        INT 21H
        SUB AL, 30H  
              
        ;MULTIPLE THE LSB BY 10
        MOV AH, 0
        MOV BL, 10H
        MUL BL      
          
        ;STORE THE RESULT OF MULTIPLICATION TO VARIABLE N
        MOV N, AL        
        ;PRINT STRING2 
        MOV AH, 9H
        MOV DX, OFFSET STR2        
        INT 21H     
                
        ;INPUT THE RIGHTMOST VALUE 
        MOV AH, 1H
        INT 21H
        SUB AL, 30H
        ADD N,AL      
                 
        ;PRINT STRING3 
        MOV AH, 9H
        MOV DX, OFFSET STR3        
        INT 21H        
        MOV DL, N         
        
        ;DIVISION
        MOV AH, 0
        MOV AL, N
        MOV BL, 10H
        DIV BL          
        
        ;STORE THE REMINDER TO VARIABLE REM
        MOV REM, AH
        ;PRINT LEFTMOST VALUE
        MOV DL, AL
        ADD DL, 30H
        MOV AH, 2H
        INT 21H                
        
        ;PRINT RIGHTMOST VALUE OR REM
        MOV DL, REM
        ADD DL, 30H
        MOV AH, 2H
        INT 21H               
    MAIN ENDP
END MAIN



