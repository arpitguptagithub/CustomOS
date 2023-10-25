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

    mov si, welcome_message
    call print_string

menu:
    mov si, menu_message
    call print_string

    mov si, option1_message
    call print_string
    mov si, option2_message
    call print_string

    ; Wait for user input
    mov ah, 0
    int 0x16
    cmp al, '1'
    je option1
    cmp al, '2'
    je option2
    jmp menu

option1:
    mov si, option1_selected_message
    call print_string
    ; Load and jump to the first kernel or program here
    jmp $

option2:
    mov si, option2_selected_message
    call print_string
    ; Load and jump to the second kernel or program here
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

welcome_message db 'Welcome to Boot Menu!', 0
menu_message db 'Select an option:', 0
option1_message db '1. Option 1', 0
option2_message db '2. Option 2', 0
option1_selected_message db 'Option 1 selected.', 0
option2_selected_message db 'Option 2 selected.', 0

times 510-($-$$) db 0
dw 0xAA55    ; Boot signature
