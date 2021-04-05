print_string: ;assuming string isn't empty
    pusha
actually_print_string:
    call print_char
    add bx, 1
    cmp BYTE [bx], 0
    jne actually_print_string
    popa
    ret

print_char:
    mov al, [bx]
    int 0x10
    ret
