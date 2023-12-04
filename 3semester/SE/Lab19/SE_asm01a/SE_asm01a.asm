.586P
.MODEL FLAT, STDCALL
.CODE
getmin PROC uses ecx esi ebx, parr: dword, elem: dword
      mov   ecx, elem       ; �������� ���������� ��������� ������� � ������� ecx
      mov   esi, parr       ; �������� ������ ������ ������� � ������� esi
      mov   ebx, [esi]      ; �������� ������� �������� ������� � ������� ebx

CYCLE: 
      lodsd                 ; �������� ���������� �������� ������� � eax � ��������� ������ esi
      cmp   eax, ebx        ; ��������� �������� �������� � ������� ����������� ��������� � ebx
      jge   FALSE           ; ������� � ����� FALSE, ���� ������� ������� ������ ��� ����� �������� ������������
      xchg  ebx, eax        ; ����� ���������� �������� �������� � �������� ������������
FALSE: 
      loop  CYCLE           ; ���������� �����, ���� �� ���������� ���������� ���������
      xchg eax, ebx         ; �������� ������������ �������� � eax ����� ���������
      ret                   ; ������� �� ���������
getmin ENDP


getmax PROC uses ecx esi ebx, parr: dword, elem: dword

      mov   ecx, elem
      mov   esi, parr
      mov   ebx, [esi]
CYCLE: 
      lodsd
      cmp   eax, ebx
      jle   FALSE
      xchg  ebx, eax 
FALSE: 
      loop  CYCLE
      xchg eax, ebx
	ret
getmax ENDP

end