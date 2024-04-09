.model small
.stack 100h
.data 
    crlf            DB      13,10,"$"
    msg_in1         DB      "Nhap so thu nhat : $"
    msg_in2         DB      "Nhap so thu hai : $"
    msg_output      DB      "Tong hai so da nhap la : $"
    
    a               DW      ?
    b               DW      ?
    x               DW      ?
    y               DW      ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, msg_in1
        mov ah, 9
        int 21h
        
        call read_int               
        call endl   
        
        mov a, ax   
        
        lea dx, msg_in2
        mov ah, 9
        int 21h
        
        call read_int
        call endl
        
        add ax, a                                     
         
        push ax 
        lea dx, msg_output
        mov ah, 9
        int 21h
        pop ax
                                    
        call write_int            
        mov ah, 4ch
        int 21h            
    main endp
    endl proc
        push dx
        push ax
        
        lea dx, crlf
        mov ah, 9
        int 21h
        
        pop ax
        pop dx
        
        ret                
    endl endp        
    read_int proc 
        mov bx, 10
        mov x, 0
        mov y, 0
                
        rp_read:
            mov ah, 1
            int 21h
            
            cmp al, 13
            je read_complete
            
            sub al, '0'
            mov ah, 0
            mov y, ax
            
            mov ax, x
            mul bx
            add ax, y
            
            mov x, ax 
            
            jmp rp_read                          
        read_complete:
        mov ax, x                            
        ret            
    read_int endp
    
    write_int proc
        mov cx, 0
        mov bx, 10
        rp_write:
            mov dx, 0
            div bx
                    
            push dx
            inc cx
            
            cmp ax, 0
            jne rp_write
        lp_write:
            pop dx
            
            add dl, '0'
            mov ah, 2
            int 21h
            
            loop lp_write
        ret                     
    write_int endp        
END MAIN    