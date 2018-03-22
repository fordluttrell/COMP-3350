;Author: Jeriel Ng
;
;Username: jzn0017
;
;Homework 5

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data
	pt BYTE "ASSEMBLY"
	key BYTE "MIKE"
	ct BYTE LENGTHOF pt DUP(?)
	keyFilled BYTE LENGTHOF pt DUP(?)
	alpha BYTE "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	grid BYTE 676 DUP(?)
	multiplier BYTE 26
.code
main PROC
	
	;This segment fills the key;
	mov eax, 0
	mov ebx, 0
	mov ecx, LENGTHOF pt
	mov edx, 0
	keyLoop:
		mov al, key[edx]
		mov keyFilled[ebx], al
		INC ebx
		INC edx
		cmp edx, LENGTHOF key
		jnz continue
		resetCounter:
			mov edx, 0
		continue:
	loop keyLoop

	;This segment creates the Vigenere grid;
	mov ebx, 0
	mov ecx, 26
	mov esi, OFFSET alpha
	mov edi, OFFSET grid
	rep movsb
	mov eax, 0
	mov edx, 25
	loopGrid:
		INC esi
		mov ecx, 25
		rep movsb
		mov bl, alpha[eax]
		mov [edi], bl
		INC edi
		INC eax
		DEC edx
		cmp edx, 0
		jnz loopGrid

	call Encrypt
	call Decrypt

	Encrypt PROC
		mov eax, 0
		mov ebx, 0
		mov ecx, LENGTHOF pt
		encryptLoop:
			NEG ecx
			mov al, pt[LENGTHOF pt + ecx]
			mov bl, keyFilled[LENGTHOF pt + ecx]
			SUB al, 65
			SUB bl, 65
			MUL multiplier
			ADD al, bl
			mov bl, grid[eax]
			mov ct[LENGTHOF pt + ecx], bl
			NEG ecx
		loop encryptLoop
		ret
	Encrypt ENDP

	Decrypt PROC
		mov eax, 0
		mov ebx, 0
		mov ecx, LENGTHOF ct
		decryptLoop:
			mov edx, -1
			NEG ecx
			mov al, keyFilled[LENGTHOF ct + ecx]
			mov bl, ct[LENGTHOF ct + ecx]
			SUB al, 65
			MUL multiplier
			checkCompare:
				INC edx
				cmp bl, grid[eax + edx]
				jnz checkCompare
			mov al, grid[edx]
			mov pt[LENGTHOF ct + ecx], al
			NEG ecx
		loop decryptLoop
		ret
	Decrypt ENDP

	invoke ExitProcess, 0

main endp
end main