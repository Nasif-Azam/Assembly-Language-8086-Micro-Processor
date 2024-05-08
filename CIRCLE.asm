.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0AH, 0DH, 'ENTER THE RADIUS OF CIRCLE: $' 
    MSG2 DB 0AH, 0DH, 'AREA OF THE CIRCLE: $'
    PIE DB 3
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
        MUL BH
        
        MOV AH, PIE
        MUL AH
        ADD AL, 30H
        MOV AREA, AL
        
        MOV AH, 9
        MOV DX, OFFSET MSG2
        INT 21H
        
        MOV AH, 2
        MOV DL, AREA
        INT 21H
        
    
    MAIN ENDP
END MAIN


