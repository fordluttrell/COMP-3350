;Author: Jeriel Ng
;
;Username: jzn0017
;
;Homework 2

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data
	input byte 1, 2, 3, 4, 5, 6, 7, 8
	shift byte 2
.code
main PROC

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	mov ah, [input]
	add ah, shift
	mov al, [input + 1]
	add al, shift
	mov bh, [input + 2]
	add bh, shift
	mov bl, [input + 3]
	add bl, shift
	mov ch, [input + 4]
	add ch, shift
	mov cl, [input + 5]
	add cl, shift
	mov dh, [input + 6]
	add dh, shift
	mov dl, [input + 7]
	add dl, shift

	invoke ExitProcess, 0

main endp
end main