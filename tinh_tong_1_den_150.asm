.model small
.stack 100h
.data
    msg_output  DB  "Ket qua la : $"
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, msg_output
        mov ah, 9
        int 21h
        
        mov cx, 150
        mov bx, 0
        
        lap3:                                 
            add bx, cx
            loop lap3        
        
        mov ax, bx
        call write_int
        
        mov ah, 4ch
        int 21h
    main endp        
    
    write_int proc
        mov bx, 10
        mov cx, 0
        
        lap1:
            mov dx, 0
            div bx
            
            push dx
            inc cx
            
            cmp ax, 0
            jne lap1
        
        lap2:
            pop dx
            mov ah, 2
            
            add dl, '0'
            int 21h
            
            loop lap2
        ret                   
    write_int endp        
END MAIN    