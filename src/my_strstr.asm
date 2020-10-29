BITS 64
global strstr

strstr:
    xor rcx, rcx
    xor rbx, rbx
    xor rax, rax

loop:
    mov rax, rcx
    mov rbx, 0

search_str:
    mov r10b, BYTE[rsi + rbx]
    cmp r10b, 0
    je end_found
    mov r11b, BYTE[rdi + rax]
    cmp r11b, 0
    je end_no_found
    cmp r11b, r10b
    jne not_same
    inc rax
    inc rbx
    jmp search_str

not_same:
    inc rcx
    jmp loop

end_found:
    mov rax, rdi
    add rax, rcx
    ret

end_no_found:
    mov rax, 0
    ret