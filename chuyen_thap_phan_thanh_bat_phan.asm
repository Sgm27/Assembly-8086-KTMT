.model small
.stack 100h
.data
    msg_input   DB  13,"Nhap so thap phan : $"
    msg_output  DB  13,10,"Dang nhi phan tuong ung : $"
    x           DW  ?
    y           DW  ?
    num         DW  ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, msg_input
        mov ah, 9
        int 21h
        
        call read_int
        mov num, ax
        
        lea dx, msg_output
        mov ah, 9
        int 21h
        
        mov ax, num
        call write_int
        
        mov ah, 4ch
        int 21h
    main endp  
    
    read_int proc
        mov x, 0
        mov y, 0
        mov bx, 10
        
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
        mov bx, 8
        
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