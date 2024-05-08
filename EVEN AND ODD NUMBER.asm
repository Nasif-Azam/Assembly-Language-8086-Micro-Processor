.MODEL SMALL 
.STACK 100H

.DATA
    MSG1 DB 0AH, 0DH, 'ENTER THE NUMBER : $'
    MSG2 DB 0AH, 0DH, 'THE NUMBER IS : $'
    EV DB 0AH, 0DH, 'Even$'
    OD DB 0AH, 0DH, 'Odd$'

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX  
        ;1ST MSG
        MOV DX, OFFSET MSG1
        MOV AH, 9
        INT 21H
        ;USER INPUT
        MOV AH, 1
        INT 21h
        MOV BL, 2
        DIV BL 
        ;COMPAER
        CMP AH, 0        
        ;2ND MSG
        MOV DX, OFFSET MSG2
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