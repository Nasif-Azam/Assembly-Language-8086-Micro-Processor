.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0AH, 0DH, 'ENTER THE HEIGHT OF TRIANGLE: $' 
    MSG2 DB 0AH, 0DH, 'ENTER THE BASE OF TRIANGLE: $'
    MSG3 DB 0AH, 0DH, 'AREA OF THE TRIANGLE: $'
    AREA DB ?

.CODE
    MAIN PROC 
        ;DATA SEGMENT INITIALIZATION
        MOV AX, @DATA
        MOV DS,AX
        
        MOV AH, 9
        MOV DX, OFFSET MSG1
        INT 21H
        
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV BH, AL
        
        MOV AH, 9
        MOV DX, OFFSET MSG2
        INT 21H
        
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MUL BH
        
        MOV BL, 2
        DIV BL
        ADD AL, 30H
        MOV AREA, AL 
        
        MOV AH, 9
        MOV DX, OFFSET MSG3
        INT 21H
        
        MOV AH, 2
        MOV DL, AREA
        INT 21H
        
    
    MAIN ENDP
END MAIN


