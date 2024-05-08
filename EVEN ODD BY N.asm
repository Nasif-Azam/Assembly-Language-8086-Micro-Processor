.MODEL SMALL
.DATA
    MSG1 DB 0AH, 0DH, 'PRESS 'N' TO START THE PROGRAM: $'
    MSG2 DB 0AH, 0DH, 'PRESSED LETTER IS NOT 'N'. SO TERMINATING!! $'
    MSG3 DB 0AH, 0DH, 'ENTER THE NUMBER : $'
    MSG4 DB 0AH, 0DH, 'THE NUMBER IS : $'
    EV DB 'Even$'
    OD DB 'Odd$'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        MOV DX, OFFSET MSG1
        INT 21H
        ;USER IP
        MOV AH, 1
        INT 21H
        
        CMP AL, 78
        JE CHECK
        
        MOV AH, 9
        MOV DX, OFFSET MSG2
        INT 21H        
        MOV AH, 4CH
        INT 21H
        
        CHECK:
            MOV DX, OFFSET MSG3
            MOV AH, 9
            INT 21H
            ;USER INPUT
            MOV AH, 1
            INT 21h
            MOV BL, 2
            DIV BL 
            ;COMPAER
            CMP AH, 0  

            MOV DX, OFFSET MSG4
            MOV AH, 9
            INT 21H
            JE IsEven          

            MOV DX, OFFSET OD
            MOV AH, 9
            INT 21h
            JMP EXIT
        
            IsEven:                
                MOV DX, OFFSET EV
                MOV AH, 9
                INT 21h                           
        
        EXIT:
            MOV AH, 4CH
            INT 21H
    
    MAIN ENDP
END MAIN