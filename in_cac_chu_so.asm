.model small
.stack 100h
.data
    msg_input   DB  13,"Nhap chuoi : $"
    msg_output  DB  13,10,"Cac chu so xuat hien la : $"
    Str         DB  1000 dup("$")
.code
    main proc
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
        
        mov cx, 0      
        mov cl, [Str + 1]
        lea si, Str + 2
        
        lp:
            cmp [si], '0'
            jl continue:
            cmp [si], '9'
            jg continue:
            
            mov ah, 2
            mov dl, [si]           
            int 21h
            
            continue:
            inc si
            
            loop lp              
              
        mov ah, 4ch
        int 21h
    main endp
END MAIN    