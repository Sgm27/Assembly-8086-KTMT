.model small
.stack 100h
.data  
    crlf    DB  13,10,"$"
    list    DB  1,2,3,4,56,32,70
    msg_out DB  13,"So lon nhat la : $"
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea si, list
        mov cx, 7
        mov bl, [si]    
        
        lp2:               
            cmp bl, [si]
            jl xuly
            jge continue:
            xuly:
                mov bl, [si]
                jmp continue 
                                
            continue:              
            inc si            
            loop lp2
        
        mov bh, 0
        push bx
        
        lea dx, msg_out
        mov ah, 9
        int 21h
        
        pop ax        
        
        call write_int
        
            
        mov ah, 4ch
        int 21h
    main endp
    
    endl proc    
        push dx
        push ax        
        
        lea dx, crlf
        mov ah, 9
        int 21h
        
        pop ax
        pop dx
        ret
    endl endp        
    
    write_int proc        
        mov cx, 0 
        mov bx, 10
        ; in ra so tren thanh ghi ax
        rp1:
            mov dx, 0
            
            div bx
            
            push dx
            inc cx
             
            cmp ax, 0
            
            jne rp1                               
        
        lp1:
            pop dx
            
            add dl, '0'
            
            mov ah, 2
            int 21h
            
            loop lp1
        ret
    write_int endp        
END MAIN    