BITS 64
global strpbrk

strpbrk:
    xor rcx, rcx
    xor rax, rax
    xor r10b, r10b

strpbrk_loop:
    mov rcx, 0
    cmp BYTE[rdi], 0
    je  end_null
    jmp check

check:
    mov r11b, BYTE[rsi]
    cmp BYTE[rdi], r11b
    je  end
    cmp r11b, 0
    je  re_start
    inc rsi
    inc rcx
    jmp check

to_go:
    inc rdi
    jmp strpbrk_loop

re_start:
    cmp rcx, 0
    je  to_go
    dec rsi
    dec rcx
    jmp re_start

end_null:
    xor rcx, rcx
    xor r10b, r10b
    xor rax, rax
    ret

end:
    mov rax, rdi
    ret
