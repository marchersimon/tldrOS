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
    pusha
    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    popa
    ret
    
print_lf:
    pusha
    mov ah, 0x0e
    mov al, 10
    int 0x10
    mov al, 13
    int 0x10
    popa
    ret
    
print_hex:
    pusha
    mov ah, 0x0e
    mov dx, 0
decode_hex:
    mov cx, bx
    and cx, 0x000F
    cmp cx, 0x0009
    jle num_to_ascii
    jg sym_to_ascii
continue:
    shr bx, 4
    inc dx
    cmp dx, 4
    jl decode_hex
    
    mov al, '0'
    int 0x10
    mov al, 'x'
    int 0x10
    mov dx, 0
print_hex_from_stack:
    pop cx
    mov al, cl
    int 0x10
    inc dx
    cmp dx, 4
    jne print_hex_from_stack
    popa
    ret
    
num_to_ascii:
    add cx, 0x30
    push cx
    jmp continue
    
sym_to_ascii:
    add cx, 0x37
    push cx
    jmp continue   


[bits 32]

VIDEO_MEMORY equ 0xb8000 + 320
WHITE_ON_BLACK equ 0x70

print_string_pm:
pusha
mov edx, VIDEO_MEMORY

print_string_pm_loop:
mov al, [ebx]
mov ah, WHITE_ON_BLACK

cmp al, 0
je done

mov [edx], ax

add ebx, 1
add edx, 2

jmp print_string_pm_loop

done:
    popa
    ret

[bits 16]
    
