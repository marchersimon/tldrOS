[org 0x7c00]    ; compensating the address offset
[bits 16]
start:
;mov bx, 0x7c0 ;this makes problems with the far jump for 32 bit mode somehow
;mov ds, bx

mov bp, 0x8000 ;move stack to 0x8000
mov sp, bp

mov bx, msg_executing
call print_string
mov bx, start
call print_hex
call print_lf

cli ; disable interrupts

lgdt [gdt_descriptor]   ; specify the location of the GDT descriptor

mov eax, cr0    ; indirectly set the LSB in cr0
or eax, 0x01
mov cr0, eax

jmp CODE_SEG:init_pm    ; jump to a different segment to flush the CPU pipeline

jmp $


%include "print.asm"
%include "gdt.asm"

[bits 32]
init_pm:

mov ax, DATA_SEG
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax


call print_string_pm

jmp $

msg_executing: db 'Executing boot sector at ', 0
msg_pm: db 'Entered 32-bit Mode', 0
         
times 510-($-$$) db 0

dw 0xaa55
