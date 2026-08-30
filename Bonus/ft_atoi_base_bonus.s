section .text
	global ft_atoi_base
	extern ft_strlen
	extern ft_isspace
	extern ft_strchr

PLUS  equ 43
MINUS equ 45

; rdi = str =  r12
; rsi = base = rbx
; r13 = base_len
; r14 = sign (+1 / -1)
; r15 = acc

ft_atoi_base:
	push rbx
	push r12
	push r13
	push r14
	push r15
	sub rsp, 8	  ; realign rsp to 16

	mov r12, rdi
	mov rbx, rsi

.check_base:
	mov rdi, rsi
	call ft_strlen
	cmp rax, 1
	jle .bad_base
	mov r13, rax
	xor r14, r14


.check_base_char:
	cmp r14, r13
	jge .skip_ws
	movzx rdi, byte [rbx + r14]
	call ft_isspace
	test rax, rax
	jnz .bad_base
	cmp byte [rbx + r14], PLUS
	je .bad_base
	cmp byte [rbx + r14], MINUS
	je .bad_base
	lea rdi, [rbx + r14 + 1]        ; use the calcul as memory address for rdi
	movzx rsi, byte [rbx + r14]
	call ft_strchr
	test rax, rax
	jnz .bad_base
	inc r14
	jmp .check_base_char

.skip_ws:
	movzx rdi, byte [r12]
	call ft_isspace
	test rax, rax
	jz .sign_init
	inc r12
	jmp .skip_ws

.sign_init:
	mov r14, 1
.sign:
	cmp byte [r12], MINUS
	je .neg
	cmp byte [r12], PLUS
	je .pos
	jmp .number

.neg:
	neg r14

.pos:
	inc r12
	jmp .sign

.number:
	xor r15, r15
.loop_number:
	movzx eax, byte [r12]
	test  al, al
	jz    .done
	mov   rdi, rbx
	mov esi, eax
	call  ft_strchr
	test  rax, rax
	jz    .done
	sub   rax, rbx
	cmp   rax, r13
	je    .done
	imul  r15, r13
	add   r15, rax
	inc   r12
	jmp   .loop_number

.done:
	imul r15, r14
	mov rax, r15
	add rsp, 8
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	ret

.bad_base:
	add rsp, 8
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	xor rax, rax
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
