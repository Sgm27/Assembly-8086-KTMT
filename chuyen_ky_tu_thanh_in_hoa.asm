; nhap ky tu thuong tu ban phim va in ra ky tu in hoa tuong ung
.model small
.stack 100
.data
    message_input    DB    "Nhap ky tu : $"
    message_output   DB    13,10,"Ky tu tuong ung la : $"
    Char             DB    ?
.code
    main proc      
        mov ax, @data
        mov ds, ax 
        
        lea dx, message_input
        mov ah, 9
        int 21h
        
        mov ah, 1   
        int 21h
        sub al, 32
        mov Char, al            
        
        lea dx, message_output
        mov ah, 9
        int 21h
        
        mov ah, 2
        mov dl, Char
        int 21h
    main endp
END