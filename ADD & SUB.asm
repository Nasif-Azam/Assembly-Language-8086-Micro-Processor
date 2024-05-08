.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DB 5
    NUM2 DB 6
    SUM DB ?
    SUBT DB ?
    
.CODE
    MAIN PROC
        ;DATA SEGMENT INITIALIZATION
        MOV AX,@DATA
        MOV DS, AX
        
        ;ADD/SUB
        MOV BL, NUM1
        ADD BL, NUM2
        MOV SUM, BL
        
        MOV BL, NUM1
        SUB BL, NUM2
        MOV SUBT, BL
        
    MAIN ENDP
END MAIN



