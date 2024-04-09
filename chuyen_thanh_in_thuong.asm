.model small
.stack 100h
.data
    msg_input   DB  13,"Nhap chuoi : $"
    msg_output  DB  13,10,"Chuoi in thuong tuong ung : $"
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
        rp:       
            cmp [si], 13
            je break
            
            cmp [si] ,'A'
            jl  print_char
            
            cmp [si] ,'Z'            
            jg  print_char 
                         
            add [si], 32
            
            print_char:
                mov dl, [si]
                mov ah, 2
                int 21h
            inc si   
            
            jmp rp             
            
        break:
        
        mov ah, 4ch
        int 21h
    main endp    
END MAIN    