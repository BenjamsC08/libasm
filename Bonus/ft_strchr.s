section .text
	global ft_strchr

; rdi = box, sil = tf ; sil == 8 bits low rsi
ft_strchr:
	movzx eax, sil
.loop:
	movzx edx, byte [rdi]
	cmp edx, eax
	je .found
	test edx, edx
	je .miss
	inc rdi
	jmp .loop
.found:
	mov rax, rdi
	ret
.miss:
	xor rax, rax
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
