BITS 64
global strchr

strchr:
    xor r10b, r10b
    xor rax, rax

strchr_loop:
    mov r10b, BYTE[rdi]
    cmp r10b, 0
    je end_no_found
    cmp r10b, sil
    je end_found
    inc rdi
    jmp strchr_loop

end_no_found:
    cmp sil, 0
    je end_found
    xor r10b, r10b
    xor rax, rax
    ret

end_found:
    mov rax, rdi
    ret