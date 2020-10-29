BITS 64
global memmove

memmove:
    xor rcx, rcx

loop:
    cmp rcx, rdx
    je extract
    movsx rbx, BYTE[rsi + rcx]
    push rbx
    inc rcx
    jmp loop

extract:
    cmp rcx, 0
    je end
    dec rcx
    pop rbx
    mov BYTE[rdi + rcx], bl
    jmp extract

end:
    xor rcx, rcx
    mov rax, rdi
    ret

