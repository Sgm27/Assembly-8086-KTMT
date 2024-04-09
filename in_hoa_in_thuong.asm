.model small
.stack 1000
.data
	msg_input	DB	13,"Nhap chuoi : $"
	msg_lower	DB	10,13,"Chuoi in thuong tuong ung la : $"
	msg_upper	DB	10,13,"Chuoi in hoa tuong ung la : $"
	Str 		DB	1000 dup("$")
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
	    
	    lea dx, msg_lower
	    mov ah, 9
	    int 21h
	    call convert_to_lower
	    
	    lea dx, msg_upper
	    mov ah, 9
	    int 21h
	    call convert_to_upper
	
		mov ah, 4ch
		int 21h
	main endp
	
	convert_to_lower proc
	    lea si, Str + 2
	    
	    repeat_lower:
	        mov dl, [si]
	        cmp dl, 'A'
	        jl print_lower
	        cmp dl, 'Z'
	        jg print_lower
	        add dl, 32
	    print_lower:
	        mov ah, 2
	        int 21h
	        inc si
	        cmp [si], '$'
	        jne repeat_lower
	    ret
    convert_to_lower endp	 
	
	convert_to_upper proc
	    lea si, Str + 2
	    
	    repeat_upper:
	        mov dl, [si]
	        cmp dl, 'a'
	        jl print_upper
	        cmp dl, 'z'
	        jg print_upper
	        sub dl, 32
	    print_upper:
	        mov ah, 2
	        int 21h
	        inc si
	        cmp [si], '$'
	        jne repeat_upper
	    ret
    convert_to_upper endp
END