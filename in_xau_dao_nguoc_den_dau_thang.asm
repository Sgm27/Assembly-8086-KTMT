   .model small
.stack 100h
.data
    msg_input   DB  13,"Nhap chuoi : $"
    msg_output  DB  13,10,"Chuoi dao nguoc tinh den dau # la : $"
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
            
        lea si, Str + 2            
        mov cx, 0
        rp:
            cmp [si], "#"
            je read_complete
            push [si]
            inc si
            inc cx
            jmp rp
        read_complete:
        
        write_out: 
            pop dx
            mov ah, 2
            int 21h
            loop write_out
        mov ah, 4ch
        int 21h
    main endp        
END MAIN    