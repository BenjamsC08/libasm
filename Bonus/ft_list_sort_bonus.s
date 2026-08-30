section .text
	global ft_list_sort
	DATA equ 0
	NEXT equ 8
; rbx tlist **begin
; r12 cmp (ptr func)

ft_list_sort:
	push rbx  ; **ptr begin
	push r12  ;	cmp ptr func
	push r13  ; curr node
	push r14  ; next node

	mov rbx, rdi
	mov r12, rsi
	mov r13, [rbx]
	test r13, r13
	jz .end
.loop_1:
	mov r14, [r13 + NEXT]
	test r14, r14
	jz .next

.cmp_loop:
	mov rdi, [r13 + DATA]
	mov rsi, [r14 + DATA]
	call r12
	cmp eax, 0 ; check with eax because strcmp return int, if not it will always
; be a positive number
	jg .swap
.continue_cmp:
	mov r14, [r14 + NEXT]
	test r14, r14
	jnz .cmp_loop
.next:
	mov r13, [r13 + NEXT]
	test r13, r13
	jnz .loop_1

.end:
	pop r14
	pop r13
	pop r12
	pop rbx
	ret

.swap:
	mov rax, [r13 + DATA]
	mov rcx, [r14 + DATA]
	mov [r13 + DATA], rcx
	mov [r14 + DATA], rax
	jmp .continue_cmp

section .note.GNU-stack noalloc noexec nowrite progbits
