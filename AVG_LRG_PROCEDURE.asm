.MODEL SMALL
.STACK 100H
.DATA
    ARR DB 5 DUP(?)  
    SUM DB ?
    STR DB 0AH, 0DH, 'ENTER THE ELEMENTS : $' 
    STR1 DB 0AH, 0DH, 'AVERAGE : $'  
    STR2 DB 0AH, 0DH, 'LARGEST : $'
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        MOV DX, OFFSET STR
        INT 21H
        
        MOV CH, 0
        MOV CL, 5
        
        MOV SI, 0
        
        INPUT:
            MOV AH, 1
            INT 21H
            SUB AL, 30H
            MOV [SI], AL
            ;CMP [SI], AL
            ;JG CALL LARGEST
            ADD SUM, AL 
            INC SI
            LOOP INPUT
        
        CALL AVG
        CALL LARGEST
        
        
        MOV AH, 4CH
        INT 21H 
    
    MAIN ENDP 
    ;USER DEFINE PROCEDURE
    AVG PROC
        ;MSG
        MOV AH, 9
        MOV DX, OFFSET STR1
        INT 21H
        ;AVG
        MOV AH, 0
        MOV AL, SUM
        MOV BL, 5
        DIV BL
        
        MOV AH, 2
        MOV DL, AL
        ADD DL, 30H
        INT 21H        
        
        RET    
    AVG ENDP
    
    LARGEST PROC
        MOV CH, 0
        MOV CL, 5
        
        MOV SI, 0
        SUB AL, 30H
        
        CHECK:            
            CMP [SI], AL
            JG BIGGER
            INC SI
            LOOP CHECK
            
        BIGGER:
            ;MSG
            MOV AH, 9
            MOV DX, OFFSET STR2
            INT 21H
            
        
        
        
        MOV AH, 2
        MOV DL, [SI]
        INT 21H
            
    
    LARGEST ENDP
    
END MAIN
