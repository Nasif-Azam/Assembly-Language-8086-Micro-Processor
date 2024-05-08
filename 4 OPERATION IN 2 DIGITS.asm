.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0AH, 0DH, 'Enter the first digit : $'
    MSG2 DB 0AH, 0DH, 'Enter the second digit : $'
    SUM DB 0AH, 0DH, 'SUMMATION IS : $'  
    SUBT DB 0AH, 0DH, 'SUBTRACTION IS : $'
    MULT DB 0AH, 0DH, 'MULTIPLICATION : $'
    DIVIS DB 0AH, 0DH, 'DIVISION : $' 
    REM DB 0AH, 0DH, 'REMINDER : $'
    DIGIT1 DB ?
    DIGIT2 DB ?

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ;MSG-1
        MOV AH, 9 
        MOV DX, OFFSET MSG1 
        INT 21H

        MOV AH, 1 ; set input function
        INT 21H ; read first character    
        SUB AL, 30H

        MOV BH, AL ; save first character into BL
        MOV DIGIT1, AL
        
        ;MSG-2
        MOV AH, 9 
        MOV DX, OFFSET MSG2
        INT 21H

        MOV AH, 1 ; set input function 
        INT 21H ; read second character
        SUB AL, 30H

        MOV BL, AL ; save second character into BH
        MOV DIGIT2, AL 
               
        ;MSG FOR ADDITION
        MOV AH, 9 
        MOV DX, OFFSET SUM
        INT 21H     
        
        ;ADDITION
        ADD BH, BL
        ADD BH, 30H
        MOV AH, 2
        MOV DL, BH
        INT 21H
             
        ;MSG FOR SUBTRACTION
        MOV AH, 9 
        MOV DX, OFFSET SUBT
        INT 21H     
             
        ;SUBTRACTION  
        MOV BH, DIGIT1
        MOV BL, DIGIT2
        SUB BH, BL
        ADD BH, 30H
        MOV AH, 2
        MOV DL, BH
        INT 21H
        
        ;MSG FOR MULTIPLICATION
        MOV AH, 9
        MOV DX, OFFSET MULT
        INT 21H
        
        ;MULTIPLICATION
        MOV AH, 0H
        MOV AL, DIGIT1
        ;MOV BL, DIGIT2
        MUL BL
        ADD AL, 30H
        
        MOV AH, 2
        MOV DL, AL
        INT 21H 
        
        ;MSG FOR DIVISION
        MOV AH, 9
        MOV DX, OFFSET DIVIS
        INT 21H
        
        ;DIVISION
        MOV AH, 0H
        MOV AL, DIGIT1
        ;MOV BL, DIGIT2
        DIV BL
        ADD AH, 30H
        ADD AL, 30H 
        
        MOV BH, AH
        MOV BL, AL  
        
        MOV AH, 2
        MOV DL, BL
        INT 21H
        
        ;MSG FOR REMINDER
        MOV AH, 9
        MOV DX, OFFSET REM
        INT 21H
        
        MOV AH, 2
        MOV DL, BH
        INT 21H
         
        ;EXIT
        MOV AH, 4CH 
        INT 21H     
        
    MAIN ENDP
END MAIN