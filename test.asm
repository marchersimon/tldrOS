CMAIN:
print_hex:
    mov cx, bx
    and cx, 0x000F
    cmp cx, 0x0009
    jle num_to_ascii
    add cx, 0x0037
    jmp print_hex_char
    shr bx, 1
    mov cx, bx
    and cx, 0x000F
    cmp cx, 0x0009
    jle num_to_ascii
    add cx, 0x0037
    jmp print_hex_char
    
 print_hex_char:
    mov al, cl
    int 0x10
    ret
    
num_to_ascii:
    add cx, 0x30
    jmp print_hex_char
