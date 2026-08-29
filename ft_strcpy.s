section .text
global ft_strcpy

ft_strcpy:
	mov rax, rdi
.loop:
	mov cl, [rsi]
	mov [rdi], cl
	test cl, cl
	je .done
	inc rdi
	inc rsi
	jmp .loop

.done:
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
