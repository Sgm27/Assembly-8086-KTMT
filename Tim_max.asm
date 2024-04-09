.Model small
.Stack 100H
.Data

list DB 1,4,0,8,7,2,4,6,2,5

.code 
main proc
    mov ax, @Data
    mov ds,ax
    cld
    mov cx, 9
    lea si, list
    mov bl, [si]
    inc si       
Start:
    lodsb
    cmp al,bl
    jle BYPASS
    mov bl,al
    BYPASS:
    loop Start
    add bl,'0'
    mov dl, bl
    mov ah, 2
    int 21H
    
    mov ah, 4CH
    int 21H
main endp
End Main