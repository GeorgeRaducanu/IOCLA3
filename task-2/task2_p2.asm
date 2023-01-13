; Copyright Raducanu George-Cristian 311CA 2021-2022
section .text
	global par

;; int par(int str_length, char* str)
;
; check for balanced brackets in an expression
par:
	push ebp
	push esp
	pop ebp

	push ebx

	xor esi, esi
	add esi, [ebp + 8] ; str_length
	xor ebx, ebx
	add ebx, [ebp + 12] ; addr of str

	xor edi, edi; count index
	xor ecx, ecx; counter for '('
	xor edx, edx; counter for ')'

foor:
	inc edx
	cmp byte [ebx + edi], 40 ; in ascii 40 is '('
	jne sar ; the else case
	inc ecx
	dec edx
sar:
	cmp ecx, edx
	jl escape
	inc edi
	cmp edi, esi
	jne foor
	cmp ecx, edx
	jne escape

good_jump:
	xor eax, eax
	inc eax
	jmp end

escape:
	xor eax, eax

end:
	pop ebx

	push ebp
	pop esp
	pop ebp
	ret