; Configuration before calling disk_load:
; [number_of_sectors], [dest_adress] and [start_reading] have to be set
disk_load:

    mov dl, [BOOT_DRIVE]	; Retrieve the saved boot drive number
    mov ah, 0x42			; Set the int 0x13 mode to read ĻBA
    mov si, dap				; Set si to point to the Data Access Packet
    
    int 0x13				; Actually read from the disk
    jc disk_read_error		; Jump to disk_read_error in case of an error (if the carry flag is set)
    ret
    
disk_read_error:
	mov bx, MSG_DISK_READ_ERROR
	call print_string
	call print_lf
	jmp $	

MSG_DISK_READ_ERROR: db 'Disk read error!', 0

dap:
	db 0x10		; Size of the DAP (always 0x10)
	db 0x0 		; Reserved
	number_of_sectors:
	dw 0x00		; Number of sectors to read
	dest_adress:
	dw 0x0000	; Offset in Memory (Please note little endian)
	dw 0x0000   
	start_reading:
	dd 0x00     ; Address on disk
	dd 0x00
