.MODEL SMALL
.STACK 100H

.DATA
    msg_1 DB 0AH, 0DH, 'ENTER THE FIRST CAPITAL LETTER : $'
    msg_2 DB 0AH, 0DH, 'ENTER THE SECOND CAPITAL LETTER : $'
    msg_3 DB 0AH, 0DH, 'THE GIVEN CAPITAL LETTER IN REVERSE ALPHABETIC ORDER : $'

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ;MSG-1
        MOV AH, 9 
        MOV DX, OFFSET msg_1 
        INT 21H

        MOV AH, 1 ; set input function
        INT 21H ; read first character

        MOV BL, AL ; save first character into BL
        
        ;MSG-2
        MOV AH, 9 
        MOV DX, OFFSET msg_2
        INT 21H

        MOV AH, 1 ; set input function
        INT 21H ; read second character

        MOV BH, AL ; save second character into BH

        MOV AH, 9
        MOV DX, OFFSET msg_3
        INT 21H

        MOV AH, 2 ; set output function

        CMP BL, BH
        JGE Larger_
        MOV DL, BH
        INT 21H

        MOV DL, BL
        INT 21H

        JMP _END

        Larger_:
        MOV DL, BL
        INT 21H

        MOV DL, BH
        INT 21H

        _END:
        MOV AH, 4CH

        INT 21H
    MAIN ENDP
END MAIN