load_kernel:
    mov bx, MSG_LOAD_KERNEL		; Print a message
    call print_string
    call print_lf
    
    mov [number_of_sectors], word 0x15	; Request 15 sectors
    mov [dest_adress], word 0xA000		; Set destination address in Memory
    mov [start_reading], dword 0x01		; Address on disk to read from
    
    call disk_load
    ret
    
MSG_LOAD_KERNEL: db 'Loading kernel into memory', 0
