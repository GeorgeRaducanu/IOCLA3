; Copyright Raducanu George-Cristian 311CA 2021-2022
section .text
	global cmmmc

;; int cmmmc(int a, int b)
;
;; calculate least common multiple fow 2 numbers, a and b
cmmmc:
	push ebp
	push esp
	pop ebp

	push ebx

	xor ecx, ecx
	add ecx, [ebp + 8] ; a
	xor edx, edx
	add edx, [ebp + 12] ;b
	; I have used this trick in order not to use mov as a command
	
	; cmmmc(a, b) = (a * b) / cmmdc(a, b);
	; the algorithm below is Euclid's algorithm for gcd with substractions
	cmp ecx, edx
	jne while
	je bye
if1:
	sub ecx, edx
	cmp ecx, edx
	je bye
	jmp while

if2:
	sub edx, ecx
	cmp ecx, edx
	je bye
	jmp while

while:
	cmp ecx, edx
	jg if1
	jl if2

bye:
	; in ecx we have gcd(a, b)

	xor eax, eax
	xor ebx, ebx
	add eax, dword [ebp + 8] ; a the original values
	add ebx, dword [ebp + 12] ; b the original values
	mul ebx ; in eax we have a*b
	
	div ecx ; in eax we have stored a*b / ecx
	; so in the eax there is the exact result

	pop ebx

	push ebp
	pop esp
	pop ebp
	
	ret
