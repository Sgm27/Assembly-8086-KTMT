                 .model small
.stack 1000
.data
    msg_input   DB  13,"Nhap chuoi : $"
    msg_output  DB  10,13,"Chuoi dao nguoc tuong ung la : $"
    Str         DB  1000 dup("$")
.code
    main proc 
        mov cx, 0
        mov ax, @data
        mov ds, ax
        
        lea dx, msg_input
        mov ah, 9
        int 21h
        
        lea dx, Str
        mov ah, 10
        int 21h    
        
        lea dx, msg_output
        mov ah, 9
        int 21h
        
        mov cl, [Str + 1]
        lea si, Str + 2
        
        loop_string:
            push [si]
            inc si
            loop loop_string
                     
        mov cl, [Str + 1]
        
        print_reverse_string:
            mov dx, 0
            pop dx
            mov ah, 2
            int 21h
            loop print_reverse_string
        
        mov ah, 4ch
        int 21h
    main endp        

END MAIN    
    