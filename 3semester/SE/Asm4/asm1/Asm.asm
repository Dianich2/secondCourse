.586P
.MODEL FLAT, STDCALL
includelib kernel32.lib

ExitProcess PROTO : DWORD
MessageBoxA PROTO : DWORD, : DWORD, : DWORD, : DWORD

.STACK 4096

.CONST

.DATA

MB_OK	EQU 0
STR1	DB "Programm", 0
HW		DD ?
INTF	DD 356
STRF	DB "Valentine Korneliuk", 0

.CODE

main PROC

START: 
	mov eax, INTF
	INVOKE MessageBoxA, HW, OFFSET STRF, OFFSET STR1, MB_OK
	push 0
	call ExitProcess
main ENDP
end main
