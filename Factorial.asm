.MODEL SMALL
.STACK 100H
.DATA
    STR DB 0AH, 0DH, 'N: $'
    N DB ? 
    FACT DB ?
    STR2 DB 0AH, 0DH, 'FACTORIAL OF $'
    STR3 DB ' IS: $'

.CODE 
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ;LOOP VARIABLE INITIALIZATION
        MOV DX, OFFSET STR 
        MOV AH, 9
        INT 21H
                    
        MOV AH, 1
        INT 21H
        SUB AL, 30H       
        
        MOV N, AL
        
        MOV CH, 0H
        MOV CL, N
        MOV AX, CX
        DEC CL
                      
        START:
            MUL CL
            LOOP START
        
        MOV FACT, AL
        ;PRINT AL RESULT
        MOV DX, OFFSET STR2
        MOV AH, 9
        INT 21H
        
        ;PRINT N 
        MOV AH, 2
        MOV DL, N 
        ADD DL, 30H
        INT 21H
        
        ;PRINT
        MOV DX, OFFSET STR3
        MOV AH, 9
        INT 21H
        
        MOV AH, 2 
        MOV DL, FACT
        ADD DL, 30H
        INT 21H
        
        MOV AH, 4CH
        INT 21H           
    MAIN ENDP
END MAIN