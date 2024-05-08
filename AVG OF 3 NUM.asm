.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0AH, 0DH, 'AVARAGE OF 3 NUM: $' 
    NUM1 DB 2
    NUM2 DB 2
    NUM3 DB 2
    AVG DB ?

.CODE
    MAIN PROC 
        ;DATA SEGMENT INITIALIZATION
        MOV AX, @DATA
        MOV DS,AX

        MOV AL, NUM1
        ADD AL, NUM2
        ADD NUM3, AL
        
        MOV AH, 0
        MOV AL, NUM3
        MOV BL, 3
        DIV BL
        ADD AL, 30H
        MOV AVG, AL        
        
        MOV AH, 9
        MOV DX, OFFSET MSG1
        INT 21H
        
        MOV AH, 2
        MOV DL, AVG
        INT 21H         
    
    MAIN ENDP
END MAIN


