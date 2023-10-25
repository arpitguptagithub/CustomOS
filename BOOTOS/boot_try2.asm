ORG 0x7C00    ; Origin of bootloader

BITS 16

start:
    cli           ; Clear interrupts
    mov ax, 0x07C0
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov sp, 0x7C00
    sti           ; Set interrupts

    ; Load the kernel
    mov ah, 0x02  ; Function code for Read
    mov al, 1     ; Number of sectors to read
    mov ch, 0     ; Cylinder number
    mov dh, 0     ; Head number
    mov cl, 2     ; Sector number (assuming kernel is in 2nd sector)
    mov bx, 0x8000 ; Address to load the kernel (0x8000:0x0000)
    int 0x13      ; BIOS disk interrupt

    ; Check for carry flag (CF) to see if read was successful
    jc disk_error

    ; Jump to the loaded kernel
    jmp 0x8000:0x0000

disk_error:
    mov si, disk_error_message
    call print_string
    jmp $

print_string:
    mov ah, 0x0E
.repeat:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .repeat

.done:
    ret

disk_error_message db 'Disk Read Error!', 0

times 510-($-$$) db 0
dw 0xAA55    ; Boot signature
