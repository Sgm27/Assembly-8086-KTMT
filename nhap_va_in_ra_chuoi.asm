                .model small
.stack 1000
.data
    message_input   DB   13,"Nhap chuoi : $"
    message_output  DB   13,10,"Chuoi vua nhap la : $"
    Str             DB   1000 dup("$")
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, message_input
        mov ah, 9
        int 21h
        
        lea dx, Str
        mov ah, 10
        int 21h
        
        lea dx, message_output
        mov ah, 9
        int 21h
        
        lea dx, Str + 2
        mov ah, 9
        int 21h
    main endp
END
   