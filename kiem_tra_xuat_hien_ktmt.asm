.model small
.stack 100h
.data     
    crlf    DB    13,10,'$'  
    ktmt    DB    "ktmt"
    Str     DB    1000 dup("$")
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea si, Str
        mov cx, 0
        lap1:      
            mov ah, 1
            int 21h
            cmp al, '#'
            je read_complete
            
            mov [si], al
            inc si
            inc cx
            
            jmp lap1                        
        read_complete:
        
        lea si, Str
        lea di, ktmt  
        mov dl, 0
        mov bl, 0
        
        lap2:    
            mov al, [di]
            cmp [si], al
            je inc_cnt
            jne reset_cnt
            inc_cnt:
                inc di
                inc bl
                cmp bl, 4
                je update_ans 
                jne continue
            update_ans:
                mov dl, 1
                jmp break
            reset_cnt:
                mov bl, 0
                lea di, ktmt
                cmp [si], 'k'
                jne next
                inc bl
                inc di
                next:
                jmp continue                                             
            continue:
            inc si
            
            loop lap2
        break:
        
        push dx
        
        lea dx, crlf
        mov ah, 9
        int 21h
        
        pop dx                
        
        add dl, '0'
        mov ah, 2
        int 21h
                        
        mov ah, 4ch
        int 21h
    main endp
END MAIN
      