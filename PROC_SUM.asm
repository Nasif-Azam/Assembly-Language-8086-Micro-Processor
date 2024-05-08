.MODEL SMALL
.STACK 100H
.DATA
    A DB 5
    B DB 2
    SUM DB ?
    STR DB 0AH, 0DH, 'SUM IS : $'
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        CALL ADDITION
        
        ;PRINT STRING1        
        MOV AH,9H
        MOV DX, OFFSET STR
        INT 21H
        
        MOV AH, 2
        MOV DL, SUM
        INT 21H  
         
        
        MOV AH, 4CH
        INT 21H 
    
    MAIN ENDP 
    ;USER DEFINE PROCEDURE
    ADDITION PROC
        MOV BL, A
        ADD BL, B
        
        MOV SUM, BL
               
        
        RET
    
    ADDITION ENDP    
    
END MAIN
