extern malloc
extern ft_strlen
extern ft_strcpy

section .text
global ft_strdup

ft_strdup:
	push rdi
	sub rsp, 8
	call ft_strlen
	add rax, 1
	mov rdi, rax
	call malloc wrt ..plt
	add rsp, 8
	test rax, rax
	je .fail
	pop rsi
	mov rdi, rax
	call ft_strcpy
	ret

.fail:
	pop rax
	xor rax, rax
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
