; Copyright Raducanu George-Cristian 311CA 2021-2022
section .text
	global sort
	extern printf

; struct node {
;     	int val;
;    	struct node* next;
; };

;; struct node* sort(int n, struct node* node);
; 	The function will link the nodes in the array
;	in ascending order and will return the address
;	of the new found head of the list
; @params:
;	n -> the number of nodes in the array
;	node -> a pointer to the beginning in the array
; @returns:
;	the address of the head of the sorted list
sort:
	enter 0,0

	push ebx

	xor ecx, ecx
	xor ebx, ebx
	mov ecx, [ebp + 8] ;n
	mov ebx, [ebp + 12] ; the begining addres of the vector
	xor esi, esi
	xor eax, eax ; clean eax in which there will be the addres of 1
	;first for in order to find the addres of 1

for:
	cmp dword [ebx + 8 * esi], 1
	je sar
	inc esi
	cmp esi, [ebp + 8]
	jne for
sar:
	lea eax, [ebx + 8 * esi] ; in eax I now have the addr of 1
	; eax do not touch from now on

	xor edi, edi ; for storing temporary addr
	xor esi, esi
	mov esi, [ebp + 8]; counter from n:1

foor:
	xor ecx, ecx; reset counter
caut:
	; search for esi
	cmp dword esi, [ebx + 8 * ecx]
	je bye
	inc ecx
	jmp caut
bye:

	;now at [ebx + 8 * ecx] we have esi
	mov dword [ebx + 8 * ecx + 4], edi
	lea edi, [ebx + 8 * ecx] ; updating the addres for the next step

	dec esi
	cmp esi, 0
	jne foor

	; The algorithm has O(n^2) complexity. I am sure it can be done better
	; but this is all I could do =)
	pop ebx
	
	leave
	ret
