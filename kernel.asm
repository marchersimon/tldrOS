load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call print_string
    call print_lf
    
    mov bx, KERNEL_OFFSET   ; Load the kernel to 0x1000
    mov al, 1              ; Request 15 sectors (sector 2 - 16)
    
    call disk_load
    ret
    
MSG_LOAD_KERNEL: db 'Loading kernel into memory', 0
