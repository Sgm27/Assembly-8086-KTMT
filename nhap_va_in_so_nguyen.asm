.model small
.stack 100h
.data    
    msg_input   DB  13,"Nhap so : $"
    msg_output  DB  13,10,"So ban vua nhap la : $"
    x           DW  ?
    y           DW  ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov bx, 10 
        
        lea dx, msg_input
        mov ah, 9
        int 21h
        
        call read_int
        push ax  ; can luu lai ax vi khi in msg_out se thay doi ax
        
        lea dx, msg_output
        mov ah, 9
        int 21h
        
        pop ax
        call print_int
        
        mov ah, 4ch
        int 21h            
    main endp         
    
    read_int proc
        mov x, 0
        mov y, 0
        
        lpr:
            mov ah, 1
            int 21h
            
            cmp al, 13
            je read_done                
            
            sub al, '0'
            mov ah, 0
            mov y, ax
            
            mov ax, x
            mul bx
            add ax, y
            
            mov x, ax                
            jmp lpr
        read_done: 
        mov ax, x  ; luu lai ax de xu ly hon
        ret             
    read_int endp
    
    print_int proc
        mov cx, 0
        rpp:
            mov dx, 0
            div bx
            push dx
            inc cx
            cmp ax, 0          
            jne rpp
        lpp:
            pop dx
            add dl, '0'
            mov ah, 2
            int 21h
            loop lpp
        ret            
    print_int endp        
END MAIN    