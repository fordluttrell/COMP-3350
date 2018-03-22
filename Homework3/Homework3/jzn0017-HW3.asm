;Author: Jeriel Ng
;
;Username: jzn0017
;
;Homework 3

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data
	input byte 5,0Ah,3,6,0Ch
	output byte LENGTHOF input DUP(?)
	shift dword 3
.code
main PROC
	
	mov eax, 0
	mov ebx, 0
	mov ecx, shift

	movFirst:
		NEG ecx
		mov al, input[LENGTHOF input + ecx]
		mov output[ebx], al
		NEG ecx
		INC ebx
	loop movFirst

	mov ecx, LENGTHOF input
	sub ecx, shift
	mov edx, 0

	movRest:
		mov al, input[edx]
		mov output[ebx], al
		INC ebx
		INC edx
	loop movRest

	invoke ExitProcess, 0

main endp
end main