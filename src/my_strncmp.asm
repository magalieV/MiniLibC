BITS 64
global strncmp

strncmp:
    xor rcx, rcx

strncmp_loop:
    mov r10b, BYTE[rdi]
    mov r11b, BYTE[rsi]
    cmp r10b, 0
    je  end
    cmp r11b, 0
    je  end
    cmp r10b, r11B
    jne end
    inc rdi
    inc rsi
    inc rcx
    cmp rcx, rdx
    jge end
    jmp strncmp_loop

end:
    movzx rax, r10b
    movzx rcx, r11b
    sub rax, rcx
    ret