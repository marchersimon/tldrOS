[org 0x7c00]

mov ah, 0x0e

mov bp, 0x8000
mov sp, bp

mov bx, msg
call print_string

msg:
    db 'Hallo', 10, 13, 0
  
jmp $
   
times 510-($-$$) db 0

dw 0xaa55
