;Author: Jeriel Ng
;
;Username: jzn0017
;
;Homework 4

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data
	s1 BYTE "DANGER"
	s2 BYTE "GARDEN"
.code
main PROC
	
	mov ecx, LENGTHOF s1
	mov edx, 0
	L1:
		L2:
			movzx ebx, s2[edx]
			cmp s1[ecx - 1], bl
			jz match
			INC edx
			cmp edx, LENGTHOF s2
			jnz L2
			jz continue
		match:
			mov s2[edx], 0
		continue:
			mov edx, 0
	loop L1

	mov ecx, LENGTHOF s2
	L3:
		cmp s2[ecx - 1], 0
		jnz notAnagram
	loop L3

	mov eax, 1
	jmp finish
	notAnagram:
		mov eax, 0
	finish:

	invoke ExitProcess, 0

main endp
end main
