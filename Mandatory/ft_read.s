section .text 
	global ft_read
	extern __errno_location

ft_read:
	mov rax, 0
	syscall

	test rax, rax
	jl .error
	ret

.error:
	neg rax
	push rax		  ; pushing or use calle-saved like rbx
	;mov rbx, rax	;bu need to push rbx before
	call __errno_location wrt ..plt ;call alone only permit a 32bits jumps so
	;~2Go, this one jump to plt created by the linker
	; wrt `with respect to` ; ..plt NASM symbol to relatively redirect to plt
	;mov [rax], rbx
	pop rdx
	mov [rax], edx	  ; using edx, return value is int (32bis)
	mov rax, -1
	ret

section .note.GNU-stack noalloc noexec nowrite progbits

