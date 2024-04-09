.Model Small
.Stack 100
.Data
    CRLF      DB    13,10,'$'
    ChaoTay   DB    'hello!$'   
    ChaoTa    DB    'ChaoBan!$'   
.Code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, ChaoTay
        mov ah, 9
        int 21h
        
        lea dx, CRLF
        int 21h
        
        lea dx, CHaoTa
        mov ah, 9
        int 21h   
        mov ah, 4ch
        int 21h
    main endp
End