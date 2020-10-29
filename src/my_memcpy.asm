BITS 64
global memcpy

memcpy:
    xor rcx, rcx
    xor rax, rax

memcpy_loop:
    cmp rcx, rdx
    jge end_loop
    mov r10b, BYTE[rsi]
    mov BYTE[rdi], r10b
    inc rdi
    inc rsi
    inc rcx
    jmp memcpy_loop

end_loop:
    cmp rcx, 0
    je  end
    dec rcx
    dec rdi
    dec rsi
    jmp end_loop

end:
    xor rcx, rcx
    mov rax, rdi
    ret