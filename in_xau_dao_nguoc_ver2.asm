.model small
.stack 100h
.data 
    msg_input   DB  13,"Nhap chuoi : $"
    msg_output  DB  13,10,"Chuoi dao nguoc tuong ung la : $"
    Str         DB  1000 dup("")
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, msg_input
        mov ah, 9
        int 21h                    
                            
        lea si, Str
        mov cx, 0           
        rp:        
            mov ah, 1
            int 21h  
            
            cmp al, 13
            je read_complete
            
            mov ah, 0
            push ax 
            
            inc cx
            inc si
            
            jmp rp
            
        read_complete:   
        
        lea dx, msg_output
        mov ah, 9
        int 21h            
                     
        rp2:   
            pop dx     
            mov dh, 0
            mov ah, 2
            int 21h
            loop rp2                              
                                          
        mov ah, 4ch
        int 21h                    
    main endp        
END MAIN