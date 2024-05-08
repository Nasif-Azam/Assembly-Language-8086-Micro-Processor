.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DB 7
    NUM2 DB 2

.CODE
    MAIN PROC 
        ;DATA SEGMENT INITIALIZATION
        MOV AX, @DATA
        MOV DS,AX
        
        ;MUL/DIV
        MOV AH, 0H
        MOV AL, NUM1
        MOV BL, NUM2
        MUL BL
        
        MOV AH, 0H
        MOV AL, NUM1
        MOV BL, NUM2
        DIV BL
    
    MAIN ENDP
END MAIN


