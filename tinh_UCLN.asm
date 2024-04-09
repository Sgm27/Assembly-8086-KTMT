.model small
.stack 100h
.data
    msg_ina     DB      13,"Nhap a : $"
    msg_inb     DB      13,10,"Nhap b : $"
    msg_out     DB      13,10,"Ket qua la : $"
    x           DW      ?
    y           DW      ?
    a           DW      ?
    b           DW      ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, msg_ina
        mov ah, 9
        int 21h
        
        call read_int
        mov a, ax
        
        lea dx, msg_inb
        mov ah, 9
        int 21h
        
        call read_int
        mov b, ax
                         
        lea dx, msg_out
        mov ah, 9
        int 21h
        
        mov ax, a
        mov bx, b 
        
        repp:
            cmp ax, bx
            je done
            jg xuly1
            jl xuly2
            xuly1:
                sub ax, bx
                jmp ra
            xuly2:
                sub bx, ax
                jmp ra    
            ra:          
            jmp repp
        done:  
            
        call write_int
                           
        mov ah, 4ch
        int 21h    
    main endp        

    read_int proc
    mov x, 0
    mov y, 0   
    mov bx, 10
    rp:
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
        jmp rp
    read_complete:
    mov ax, x
    ret            
    read_int endp 
    
    write_int proc
        mov cx, 0
        mov bx, 10
        rp1:
            mov dx, 0
            div bx
            
            push dx
            inc cx
            
            cmp ax, 0
            jne rp1
        
        lp1:
            pop dx
            add dl, '0'
            mov ah, 2
            int 21h
            loop lp1
        ret
    write_int endp        
END MAIN        