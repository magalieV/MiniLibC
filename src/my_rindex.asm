BITS 64
global rindex

rindex:
    xor rax, rax
    xor rcx, rcx

to_end:
	mov r10b, [rdi + rcx]
	cmp r10b, 0
	je find
	inc rcx
	jmp to_end

find:
	mov r10b, [rdi + rcx]
	cmp rcx, -1
	je end_found
	cmp r10b, sil
	je found_last
	dec rcx
	jmp find

found_last:
	cmp rcx, 0
	je end_found
	inc rdi
	dec rcx
	jmp found_last

go_to_end:
	mov r10b, [rdi + rcx]
	cmp r10b, 0
	je my_return
	inc rcx
	jmp go_to_end

end_found:
    cmp sil, 0
    je go_to_end
    cmp rcx, -1
    je end_null
	jmp my_return

my_return:
    mov rax, rdi
    ret

end_null:
    xor rax, rax
    xor rcx, rcx
    ret