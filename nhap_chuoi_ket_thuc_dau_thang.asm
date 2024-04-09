.model small
.stack 100h
.data
    msg_input   DB  13,"Nhap chuoi : $"
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, msg_input
        mov ah, 9
        int 21h        
               
        rp:
            mov ah, 1 
            int 21h
            
            cmp al, '#'
            jne rp               
               
        mov ah, 4ch
        int 21h
    main endp        
END MAIN                 