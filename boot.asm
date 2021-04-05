[org 0x7c00]

mov ah, 0x0e

mov bp, 0x8000
mov sp, bp

mov bx, msg
call print_string
call print_lf

mov bx, 0x529C
call print_hex
call print_lf
mov bx, 0xA8CF
call print_hex
call print_lf
mov bx, 0x3FB0
call print_hex
call print_lf

jmp $

%include "/home/simon/Desktop/hlt/print.asm"

msg:
    db 'Hello', 0
     
times 510-($-$$) db 0

dw 0xaa55
