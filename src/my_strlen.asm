BITS 64
global strlen

strlen:
    xor   rax, rax

go_to_next:
    cmp   BYTE[rdi], 0
    je    end
    inc   rax
    inc   rdi
    jmp   go_to_next

end:
    ret