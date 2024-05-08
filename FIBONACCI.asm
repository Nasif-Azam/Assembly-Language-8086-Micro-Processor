.MODEL SMALL
.DATA 
    MSG DB 0AH, 0DH, 'ENTER FIBONACCI DIGIT: $'
    SUM DW ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        MOV DX, OFFSET MSG
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV CH, 0
        MOV CL, 9
        
        MOV AX, 0
        MOV BX, 1
        ;MOV CX, 9
        
        UMT:
            ADD AX, BX
            MOV DX, AX
            MOV AX, BX
            MOV BX, DX
        LOOP UMT
        SUB BX, 1
        MOV [SUM], BX
        
        MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
END MAIN