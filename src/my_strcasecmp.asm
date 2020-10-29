BITS 64
global strcasecmp

strcasecmp:
    xor rcx, rcx

strcasecmp_loop:
    mov r10b, BYTE[rdi]
    mov r11b, BYTE[rsi]
    cmp r10b, 0
    je end
    cmp r11b, 0
    je end
    inc rcx
    jmp compare

compare:
    cmp r10b, 97
    jne rdi_to_lower
    cmp r11b, 97
    jne rsi_to_lower
    jmp comparison

check_next:
    cmp r11b, 97
    jne rsi_to_lower
    jmp comparison

rdi_to_lower:
    cmp r10b, 65
    jl check_next
    cmp r10b, 90
    jg check_next
    jmp r_to_lower

rsi_to_lower:
    cmp r11b, 65
    jl comparison
    cmp r11b, 90
    jg comparison
    jmp s_to_lower

comparison:
    cmp r11b, r10b
    jne end
    inc rdi
    inc rsi
    jmp strcasecmp_loop

r_to_lower:
    add r10b, 32
    jmp check_next

s_to_lower:
    add r11b, 32
    jmp comparison

check_rdi:
    cmp r10b, 65
    jl check_rsi
    cmp r10b, 90
    jg check_rsi
    add r10b, 32
    jmp check_rsi

check_rsi:
    cmp r11b, 65
    jl my_return
    cmp r11b, 90
    jg my_return
    add r11b, 32
    jmp my_return

end:
    cmp rcx, 0
    jne check_rdi

my_return:
    movzx rax, r10b
    movzx rcx, r11b
    sub rax, rcx
    ret