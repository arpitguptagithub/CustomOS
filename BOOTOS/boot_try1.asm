ORG 0x7c00
BITS 16

start:
    mov si, message
    call print_string
    mov ah, 0eh
    mov al, 'A'
    mov bx, 0
    int 0x10
    jmp $

print_string:
    mov ah, 0eh
    lodsb
    cmp al, 0
    je .done

.done:
    ret

message db 'Hello, World!', 0
times 510-($-$$) db 0
dw 0xaa55
   