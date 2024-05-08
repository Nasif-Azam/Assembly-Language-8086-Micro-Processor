.MODEL SMALL 
.STACK 100H
.DATA
    A DB 10 DUP(?)
    N DB ?
    STR DB 0AH, 0DH, 'ENTER SIZE : $'
    STR1 DB 0AH, 0DH, 'ENTER THE ELEMENTS : $'
    STR2 DB 0AH, 0DH, 'THE ARRAY IS : $'
        
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
        
        ;OUTPUT IN CONSOLE 
        MOV AH, 9
        MOV DX, OFFSET STR2
        INT 21H
           
        MOV CX, SI
        DEC SI
        MOV DI, SI
        OUTPUT:
            MOV AH, 2
            MOV DL, [DI]
            ADD DL, 30H
            INT 21H 
            ;CREATE SPACE
            MOV DL, 20H
            INT 21H 
            
            DEC DI
            LOOP OUTPUT    
    
    
    
    
    
        MOV AH, 4CH
        INT 21H
    
    
    MAIN ENDP      
END MAIN