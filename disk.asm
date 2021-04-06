disk_load:	; number of requested sectors have to be stored in al
    and ax, 0x00ff  ; mask out al
    push ax         ; save requested number of sectors on stack
    
    mov ah, 0x02    		; BIOS read sector function
    mov ch, 0x00			; Select cylinder 0
    mov dh, 0x00			; Select head 0
    mov dl, [BOOT_DRIVE]	; Select the boot drive
    mov cl, 0x02			; Start reading from sector 2 (after boot sector)
    
    int 0x13		; Actually read disk_load  
    jc disk_read_error	; In case the carry flag is set
    
    pop dx			; Restore number of requested sectors
    cmp dl, al		; Actually read sectors are stores in al
    jne disk_requested_error
disk_ret:
    ret
    
disk_read_error:
	mov bx, MSG_DISK_READ_ERROR
	call print_string
	call print_lf
	jmp $	

disk_requested_error:
	mov bx, MSG_DISK_REQUESTED_ERROR
	call print_string
	call print_lf
	jmp disk_ret

MSG_DISK_READ_ERROR: db 'Disk read error!', 0
MSG_DISK_REQUESTED_ERROR: db 'Couldnt read all requested sectors', 0
