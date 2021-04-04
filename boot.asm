[org 0x7c00]

mov ah, 0x0e

mov bp, 0x8000
mov sp, bp

mov bx, msg
call print_string

msg:
    db 'Hallo', 10, 13, 0

print_string:
    call print_char
    add bx, 1
    cmp BYTE [bx], 0
    jne print_string
    ret

print_char:
    mov al, [bx]
    int 0x10
    ret

  
jmp $
   
times 510-($-$$) db 0

dw 0xaa55
