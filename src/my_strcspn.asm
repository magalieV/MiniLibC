BITS 64
global strcspn

strcspn:
    xor rbx, rbx
    xor rax, rax

loop:
    mov r10b, BYTE[rdi + rax]
    cmp r10b, 0
    je  end
    mov rbx, 0

count:
    mov r11b, BYTE[rsi + rbx]
    cmp r11b, 0
    je  increase
    cmp r10b, r11b
    je  end
    inc rbx
    jmp count

increase:
    inc rax
    jmp loop

end:
    ret