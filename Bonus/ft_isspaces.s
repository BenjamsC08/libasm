section .text
	global ft_isspace

ft_isspace:
	xor eax, eax
	cmp dil, 9
	jl .done
	cmp dil, 13
	jle .space
	cmp dil, 32
	je .space
	ret

.space:
	mov eax, 1
.done:
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
