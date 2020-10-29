BITS 64
global memset

memset:
    xor rcx, rcx
    xor rax, rax

memset_loop:
    cmp rcx, rdx
    jge end_loop
    mov BYTE[rdi], sil
    inc rdi
    inc rcx
    jmp memset_loop

end_loop:
    cmp rcx, 0
    je  end
    dec rcx
    dec rdi
    jmp end_loop

end:
    xor rcx, rcx
    mov rax, rdi
    ret