[org 0x7c00]	; Compensating the address offset
[bits 16]

jmp start		; jump to the code
db 0			; because jmp start only has 2 bytes and BPB has to start at 0x03

BPB:
db 'tldrOS  '	; OEM name
dw 0x200		; bytes per sector (will be 00 02, because little endian)
db 0x01			; number of sectors per cluster
dw 0x01			; number of reserved sectors (including boot sector)
db 0x02			; number of FAT tables
dw 224			; number of directory entries
dw 2880			; number of sectors
db 0xf0			; media descriptor
dw 0x09			; number of sectors per FAT
dw 0x09			; number of sectors per track
dw 0x02			; number of heads
dw 0x00 		; number of hidden sectors
EBPB:
dw 0x00			; number of hidden sectors (high word)
dd 0x00			; number of sectors if greater than 65535
db 0x80			; boot drive number
db 0x00			; reserved
db 0x28			; signature
dd 0x00			; volumeID
times 11 db ' '	; volume label
db 'FAT16   '	; file system type

KERNEL_OFFSET equ 0xA000	; Setting the address where the kernel should be loaded to

start:

mov bx, dx				; Store boot drive number, stored in dl
and bx, 0x00ff
mov [BOOT_DRIVE], bx

mov bp, 0x9000		; Move stack to 0x8000
mov sp, bp

mov bx, MSG_EXEC_SECTOR		; Print message
call print_string

mov bx, start				; Print starting sector
call print_hex

mov bx, MSG_EXEC_DISK		; Print message
call print_string

mov bx, [BOOT_DRIVE]		; Print boot drive number
call print_hex
call print_lf

call load_kernel		; Load the kernel to KERNEL_OFFSET

cli						; Disable interrupts to prepare for switch to 32 bit

lgdt [gdt_descriptor]	; Load the Global Descriptor Table

mov eax, cr0			; Indirectly set set first bit in cr0 to switch to 32 bit
or eax, 0x01
mov cr0, eax

jmp CODE_SEG:init_pm	; Make a far jump to flush the pipeline


%include "src/bootloader/print.asm"
%include "src/bootloader/disk.asm"
%include "src/bootloader/gdt.asm"
%include "src/bootloader/kernel.asm"

BOOT_DRIVE: dw 0
MSG_EXEC_SECTOR: db 'Executing boot sector at ', 0
MSG_EXEC_DISK: db ' from disk ', 0
MSG_PM: db 'Entered 32-bit Mode', 0

[bits 32]

init_pm:
mov ax, DATA_SEG	; Correct the offset registers
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax

mov esp, 0x108000
mov ebp, esp

mov ebx, MSG_PM		; Print message
call print_string_pm

call KERNEL_OFFSET	; Execute the kernel code

jmp $		; Infinite loop

times 510-($-$$) db 0

dw 0xaa55	; Set boot sector identifiers
