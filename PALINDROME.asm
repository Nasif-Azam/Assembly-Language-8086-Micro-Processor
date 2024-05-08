.MODEL SMALL 
.STACK 100H
.DATA
    A DB 10 DUP(?)
    ;A1 DB 10 DUP(?)
    N DB ?
    STR DB 0AH, 0DH, 'ENTER SIZE : $'
    STR1 DB 0AH, 0DH, 'ENTER THE ELEMENTS : $'
    STR2 DB 0AH, 0DH, 'IN ORDER : $' 
    STR3 DB 0AH, 0DH, 'REVERSE ORDER : $' 
    MSG1 DB 0AH, 0DH, 'PALINDROME$' 
    MSG2 DB 0AH, 0DH, 'NOT PALINDROME$'
        
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        MOV DX, OFFSET STR
        INT 21H
        
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        
        MOV N, AL
        
        MOV AH, 9
        MOV DX, OFFSET STR1
        INT 21H
        
        MOV CH, 0
        MOV CL, N
        
        MOV SI, 0
        
        INPUT:        
            MOV AH, 1
            INT 21H
            SUB AL, 30H
            MOV [SI], AL
            INC SI
            LOOP INPUT
        
        ;OUTPUT IN ORDER CONSOLE 
        MOV AH, 9
        MOV DX, OFFSET STR2
        INT 21H
           
        MOV CX, SI
        DEC SI
        MOV DI, 0
        CHECK:    
            MOV BX, [SI] 
            CMP BX, [DI]
            JNE NOT_PAL
            
            INC DI
            DEC SI
            LOOP CHECK 
            
        MOV AH, 9
        MOV DX, OFFSET MSG1
        INT 21H
        
        
        NOT_PAL:
            MOV AH, 9
            MOV DX, OFFSET MSG2
            INT 21H
            
            
        
        
    
    
    
    
        MOV AH, 4CH
        INT 21H
    
    
    MAIN ENDP      
END MAIN