section .text
	global ft_list_remove_if
	extern free
	DATA equ 0
	NEXT equ 8


; rdi > **ptr_begin	  > rbx
; rsi > ptr data_ref  > r12
; rdx > ptr func cmp  > r13
; rcx > ptr func free > r14

ft_list_remove_if:
	push r12
	push r13
	push r14
	push r15

	mov r12, rsi
	mov r13, rdx
	mov r14, rcx
	mov r15, rdi	  

.loop:
	mov rcx, [r15]	  ; Node
	test rcx, rcx
	jz .end

	mov rdi, [rcx + DATA]
	mov rsi, r12
	push rcx				; curr node
	call r13
	pop rcx
	cmp eax, 0
	jnz .next
.del:
	mov rdx, [rcx + NEXT]	;get next before free
	push rdx				; push next
	push rcx				; push curr->data
	mov rdi, [rcx + DATA]
	call r14
	pop rdi					; get curr->data
	call free wrt ..plt
	pop rdx					; get next (new curr)
	mov [r15], rdx
	jmp .loop

.next:
	lea r15, [rcx + NEXT]
	jmp .loop


.end:
	pop r15
	pop r14
	pop r13
	pop r12
	xor rax, rax
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
