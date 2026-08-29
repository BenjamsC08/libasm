section .text
global ft_strcmp

ft_strcmp:
	xor rax, rax
.loop:
	mov al, [rdi]
	cmp al, [rsi]
	jne .diff
	test al, al
	je .done
	inc rdi
	inc rsi
	jmp .loop

.diff:
	sub al, [rsi]
	movsx eax, al
.done:
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
