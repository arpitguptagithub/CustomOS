ORG 0
BITS 16

jmp 0x7c0:start
start:
    cli ; Clear Interrupts
    mov ax, 0x07c0
    mov ds, ax
    mov es, ax
    mov ax, 0x00
    mov ss, ax
    mov sp, 0x7c00
    sti ; Set Interrupts
    
    mov si, message
    call print_string
    jmp $

print_string:
    mov bx, 0x000
.repeat:
    lodsb
    cmp al, 0
    je .done
    call print_char
    jmp .repeat

.done:
    ret

print_char:
    mov ah, 0x0e
    int 0x10
    ret

message db 'Hello, World!', 0

times 510-($-$$) db 0
dw 0xaa55
   