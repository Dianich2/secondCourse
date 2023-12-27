		.586P																;������� ������(��������� Pentium)
	.MODEL FLAT, STDCALL												;������ ������, ���������� � �������
	includelib kernel32.lib												;������������: ����������� � kernel32

	ExitProcess PROTO : DWORD											;�������� ������� ��� ��������� �������� Windows
	MessageBoxA PROTO : DWORD, : DWORD, : DWORD, : DWORD				;�������� API-������� MessageBoxA
	getmin		PROTO : DWORD, : DWORD
	getmax		PROTO : DWORD, : DWORD

	.STACK 4096															;��������� �����

	.CONST																;������� ��������

	.DATA																;������� ������
	Array	SDWORD 1, 5, 6, -1, 8, 9, -4, 22, 9, 0													;												
	min		SDWORD ?
	max		SDWORD ?
													;������� ����� ������ 4 �����, �������������������

	.CODE																;������� ����

	getmin PROC parm1 : DWORD, parm2 : DWORD
    START:
        mov ecx, parm2    ; ��������� ����� ������� � ������� ecx
        mov esi, parm1    ; ��������� ����� ������� � ������� esi
        mov eax, [esi]    ; ��������� ������ ������� ������� � ������� eax
        dec ecx           ; ��������� ������� (����� �������) �� 1
        add esi, 4        ; ��������� � ���������� �������� �������

    CYCLE:
        mov edx, [esi]    ; ��������� ������� ������� ������� � ������� edx
        cmp eax, edx      ; ���������� ������� ������� � �����������
        jl minimum        ; ���� ������� ������� �� ������ ������������, ��������� � ����� minimum
        mov eax, edx      ; ����� ��������� �������� ������������ ��������

    minimum:
        add esi, 4        ; ��������� � ���������� �������� �������
        loop CYCLE        ; ��������� ����, �������� �������

    mov min, eax          ; ��������� ����������� �������� � ���������� min
    ret
getmin ENDP


getmax PROC parm1 : DWORD, parm2 : DWORD 
START:
	mov ecx, parm2
	mov esi, parm1
	mov eax, [esi]
	dec ecx
	add esi, 4
CYCLE:
	mov edx, [esi]
	cmp eax, edx
	jg maximum
	mov eax, edx

maximum:	
add esi, 4
loop CYCLE
mov max, eax
ret


getmax ENDP

	main PROC															;����� ����� main
	START :																;�����
			INVOKE getmin, OFFSET Array, LENGTHOF Array
			INVOKE getmax, OFFSET Array, LENGTHOF Array
	
			
		push 0														;��� �������� �������� Windows(�������� ExitProcess)
		call ExitProcess												;��� ����������� ����� ������� Windows

	main ENDP															;����� ���������

end main																;����� ������ main


		