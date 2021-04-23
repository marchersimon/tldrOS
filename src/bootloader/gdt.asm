gdt_start:

gdt_null:   ; mandatory null descriptor
    dd 0    ; dd = double word (4 Bytes)
    dd 0
    
gdt_code:
    dw 0xffff   ; limit (bits 0 - 15)
    dw 0x0      ; base (bits 16 - 31)
    db 0x0      ; base (bits 0 - 7)
    db 10011110b    ; segment type: readable code, descriptor type: code or data, privilege = 0, present = 1
    db 11001111b    ; segment limit: 0xffff, avl: not used, 64-bit: 0, 32-bit segment, granularity: 1
    db 0x0  ; another base
    
gdt_data:
    dw 0xffff   ; limit (bits 0 - 15)
    dw 0x0      ; base (bits 16 - 31)
    db 0x0      ; base (bits 0 - 7)
    db 10010010b    ; segment type: readable code, descriptor type: system, privilege = 0, present = 1
    db 11001111b    ; segment limit: 0xffff, avl: not used, 64-bit: 0, 32-bit segment, granularity: 1
    db 0x0  ; another base
    
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start
    
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

    
