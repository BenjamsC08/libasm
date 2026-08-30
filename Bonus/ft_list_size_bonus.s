section .text
	global ft_list_size
	NEXT equ 8

ft_list_size:
	xor rax, rax
.loop:
	test rdi, rdi
	jz .end
	mov rdi, [rdi + NEXT]
	inc rax
	jmp .loop

.end:
	ret





section .note.GNU-stack noalloc noexec nowrite progbits
