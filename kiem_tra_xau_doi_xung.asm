.model small
.stack 100h
.data   
    msg_input       DB  13,"Nhap chuoi : $"
    msg_palin       DB  13,10,"Xau doi xung!$"
    msg_not_palin   DB  13,10,"Xau khong doi xung!$"
    Str             DB  1000 dup("$")
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
        
        lea si, Str + 2
        mov cx, 0
        
        rp:
            cmp [si], 13
            je break
            
            push [si]
            inc si
            inc cx    
            
            jmp rp
            
        break:
        
        lea si, Str + 2
        
        lp:
            pop dx
            cmp dl, [si]
            jne print_not_palin
            inc si
            loop lp                   
        
        lea dx, msg_palin
        mov ah, 9
        int 21h
        
        mov ah, 4ch
        int 21h
                                       
        print_not_palin:
            lea dx, msg_not_palin
            mov ah, 9
            int 21h  
                                                             
        mov ah, 4ch
        int 21h            
    main endp
END MAIN    