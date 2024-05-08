.model small
.stack 100h
.data

MSG1 db "              ........WELCOME TO YOUR FIRST QUIZ.......$"
MSG2 db "Rules : $"
MSG3 db "*. For Every Correct answer you wil get 1 point. $"
MSG4 db "*. For Every Wrong answer 1 Point will cut from your total point. $"
MSG5 db "Press Enter to stsrt the Quiz: $"
MSG6 db "Right Answer.... $"
MSG7 db "Wrong Answer.... $"
MSG8 db "You have successfully completed your quiz. $"
MSG9 db "Your Total obtained point is: $"
MSG10 db "Press 1 to Re-attempt quiz or 0 to Exit. $"
MSG11 db "             ***Thank you.! **** $"  
Q1 db "1. 2+3=? $"
QA1 db "a) 5    b) 6  c) 7 $"
Q2 db "2. 5+6=? $"
QA2 db "a) 10  b) 11  c) 12 $"
Q3 db "3. 15-12=? $"
QA3 db "a) 5  b) 1 c) 3 $"
Q4 db "4. 3*6=? $"
QA4 db "a) 10  b) 18  c) 12 $"
Q5 db "5. 6/3=? $"
QA5 db "a) 2   b) 1  c)12 $"
Q6 db "6. 8-8=? $"
QA6 db "a)-1  b) -2  c) 0 $"
Q7 db "7. 3*12=? $"
QA7 db "a) 33  b) 36  c)38 $"
Q8 db "8. 9*9=? $"
QA8 db "a) 72  b) 91  c)81 $"
Q9 db "9. 11+13=? $"
QA9 db "a) 24   b) 26  c) 19 $"
Q10 db "10. 56/8 = ? $"
QA10 db "a) 7  b) 9  c) 6 $"

.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,MSG1
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,MSG2
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,MSG3
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,MSG4
    mov ah,9
    int 21h
    
    START:
    mov bl,0
    call NL
    
    lea dx,MSG5
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    CMP al,0Dh
    JE QSN1
    JNE START
    
    QSN1:
    call NL
    
    lea dx,Q1
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,QA1
    mov ah,9
    int 21h
    
    call NL
    
    mov ah,1
    int 21h
    CMP al,"a"
    JE QSN2
    JNE QSNW2
    
    QSN2:
    call NL
    
    lea dx,MSG6
    mov ah,9
    int 21h
    
    inc bl
    call NL
    
    call QN2
    call INPUT
    
    CMP al,"b"
    JE QSN3
    JNE QSNW3
    
    QSNW2:
    call NL
    
    lea dx,MSG7
    mov ah,9
    int 21h
    
    dec bl
    call NL
    
    call QN2
    call INPUT
    
    CMP al,"b"
    JE QSN3
    JNE QSNW3 
    
    
    QSN3:
    call NL
    
    lea dx,MSG6
    mov ah,9
    int 21h
    
    inc bl
    call NL
    
    call QN3
    call INPUT
    
    CMP al,"c"
    JE QSN4
    JNE QSNW4
    
    QSNW3:
    call NL
    
    lea dx,MSG7
    mov ah,9
    int 21h
    
    dec bl
    call NL
    
    call QN3
    call INPUT
    
    CMP al,"c"
    JE QSN4
    JNE QSNW4
    
    ;;
    ;;
    
    QSN4:
    call NL
    
    lea dx,MSG6
    mov ah,9
    int 21h
    
    inc bl
    call NL
    
    call QN4
    call INPUT
    
    CMP al,"b"
    JE QSN5
    JNE QSNW5
    
    QSNW4:
    call NL
    
    lea dx,MSG7
    mov ah,9
    int 21h
    
    dec bl
    call NL
    
    call QN4
    call INPUT
    
    CMP al,"b"
    JE QSN5
    JNE QSNW5 
    ;;
    ;;
    
    QSN5:
    call NL
    
    lea dx,MSG6
    mov ah,9
    int 21h
    
    inc bl
    call NL
    
    call QN5
    call INPUT
    
    CMP al,"a"
    JE QSN6
    JNE QSNW6
    
    QSNW5:
    call NL
    
    lea dx,MSG7
    mov ah,9
    int 21h
    
    dec bl
    call NL
    
    call QN5
    call INPUT
    
    CMP al,"a"
    JE QSN6
    JNE QSNW6
    ;;
    ;;
    QSN6:
    call NL
    
    lea dx,MSG6
    mov ah,9
    int 21h
    
    inc bl
    call NL
    
    call QN6
    call INPUT
    
    CMP al,"c"
    JE QSN7
    JNE QSNW7
    
    QSNW6:
    call NL
    
    lea dx,MSG7
    mov ah,9
    int 21h
    
    dec bl
    call NL
    
    call QN6
    call INPUT
    
    CMP al,"c"
    JE QSN7
    JNE QSNW7
    ;;
    ;; 
    QSN7:
    call NL
    
    lea dx,MSG6
    mov ah,9
    int 21h
    
    inc bl
    call NL
    
    call QN7
    call INPUT
    
    CMP al,"b"
    JE QSN8
    JNE QSNW8
    
    QSNW7:
    call NL
    
    lea dx,MSG7
    mov ah,9
    int 21h
    
    dec bl
    call NL
    
    call QN7
    call INPUT
    
    CMP al,"b"
    JE QSN8
    JNE QSNW8
    ;;
    ;;
    
    QSN8:
    call NL
    
    lea dx,MSG6
    mov ah,9
    int 21h
    
    inc bl
    call NL
    
    call QN8
    call INPUT
    
    CMP al,"c"
    JE QSN9
    JNE QSNW9
    
    QSNW8:
    call NL
    
    lea dx,MSG7
    mov ah,9
    int 21h
    
    dec bl
    call NL
    
    call QN8
    call INPUT
    
    CMP al,"c"
    JE QSN9
    JNE QSNW9
    ;;
    ;;
    QSN9:
    call NL
    
    lea dx,MSG6
    mov ah,9
    int 21h
    
    inc bl
    call NL
    
    call QN9
    call INPUT
    
    CMP al,"a"
    JE QSN10
    JNE QSNW10
    
    QSNW9:
    call NL
    
    lea dx,MSG7
    mov ah,9
    int 21h
    
    dec bl
    call NL
    
    call QN9
    call INPUT
    
    CMP al,"a"
    JE QSN10
    JNE QSNW10
    ;;
    ;;
    QSN10:
    call NL
    
    lea dx,MSG6
    mov ah,9
    int 21h
    
    inc bl
    call NL
    
    call QN10
    call INPUT
    
    CMP al,"a"
    JE EXIT
    JNE EXITW
    
    QSNW10:
    call NL
    
    lea dx,MSG7
    mov ah,9
    int 21h
    
    dec bl
    call NL
    
    call QN10
    call INPUT
    
    CMP al,"a"
    JE EXIT
    JNE EXITW
    ;;
    ;;
    EXIT:
    call NL
    
    lea dx,MSG6
    mov ah,9
    int 21h
    
    inc bl
    call NL
    call NL
    
    lea dx,MSG8
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,MSG9
    mov ah,9
    int 21h
    
    add bl,48
    
    CMP bl,57
    JG TEN
    mov ah,2
    mov dl,bl
    int 21h
    JMP EXIT1
    
    EXITW:
    call NL
    
    lea dx,MSG7
    mov ah,9
    int 21h
    
    dec bl
    call NL
    call NL
    
    lea dx,MSG8
    mov ah,9
    int 21h
    
    call NL
    call NL
    
    lea dx,MSG9
    mov ah,9
    int 21h
    
    add bl,48
    mov ah,2
    mov dl,bl
    int 21h
    
    JMP EXIT1
    
    ;double digit print
    
    TEN:
    mov ah,2
    mov dl,"1"
    int 21h
    mov dl,"0"
    int 21h
    JMP EXIT1
    
    NL:
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    ret
    
    QN2:
    lea dx,Q2
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,QA2
    mov ah,9
    int 21h
    ret
    
    QN3:
    lea dx,Q3
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,QA3
    mov ah,9
    int 21h
    ret
    ;;
    ;;
    QN4:
    lea dx,Q4
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,QA4
    mov ah,9
    int 21h
    ret   
    
    QN5:
    lea dx,Q5
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,QA5
    mov ah,9
    int 21h
    ret      
    
    QN6:
    lea dx,Q6
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,QA6
    mov ah,9
    int 21h
    ret
    
    QN7:
    lea dx,Q7
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,QA7
    mov ah,9
    int 21h
    ret
    
    QN8:
    lea dx,Q8
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,QA8
    mov ah,9
    int 21h
    ret
      
    QN9:
    lea dx,Q9
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,QA9
    mov ah,9
    int 21h
    ret
    
    QN10:
    lea dx,Q10
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,QA10
    mov ah,9
    int 21h
    ret        
    
    INPUT:
    call NL 
    
    mov ah,1
    int 21h
    ret
    
    EXIT1:
    call NL
    call NL
    
    lea dx,MSG10
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    CMP al,"1"
    JE START
    
    call NL
    call NL
    
    lea dx, MSG11
    mov ah,9
    int 21h
    
    mov ah,4Ch
    int 21h
    
    main endp
end main
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    