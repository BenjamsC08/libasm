section .text
	global ft_list_push_front
	extern malloc

DATA equ 0
NEXT equ 8

ft_list_push_front:
	push rdi
	push rsi
	mov rdi, 16
	call malloc wrt ..plt
	pop rsi
	pop rdi
	test rax, rax
	jz .fail
	mov [rax + DATA], rsi	; fill data
	mov rcx, [rdi]			; old begin == next new
	mov [rax + NEXT], rcx
	mov [rdi], rax			; Begin == new

.fail:
	xor rax, rax
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
