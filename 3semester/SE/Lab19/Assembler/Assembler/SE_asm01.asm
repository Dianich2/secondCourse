		.586P																;система команд(процессор Pentium)
	.MODEL FLAT, STDCALL												;модель памяти, соглашение о вызовах
	includelib kernel32.lib												;компоновщику: компоновать с kernel32

	ExitProcess PROTO : DWORD											;прототип функции для заверения процесса Windows
	MessageBoxA PROTO : DWORD, : DWORD, : DWORD, : DWORD				;прототип API-функции MessageBoxA
	getmin		PROTO : DWORD, : DWORD
	getmax		PROTO : DWORD, : DWORD

	.STACK 4096															;выделение стека

	.CONST																;сегмент констант

	.DATA																;сегмент данных
	Array	SDWORD 1, 5, 6, -1, 8, 9, -4, 22, 9, 0													;												
	min		SDWORD ?
	max		SDWORD ?
													;двойное слово длиной 4 байта, неинициализированно

	.CODE																;сенмент кода

	getmin PROC parm1 : DWORD, parm2 : DWORD
    START:
        mov ecx, parm2    ; Загружаем длину массива в регистр ecx
        mov esi, parm1    ; Загружаем адрес массива в регистр esi
        mov eax, [esi]    ; Загружаем первый элемент массива в регистр eax
        dec ecx           ; Уменьшаем счетчик (длину массива) на 1
        add esi, 4        ; Переходим к следующему элементу массива

    CYCLE:
        mov edx, [esi]    ; Загружаем текущий элемент массива в регистр edx
        cmp eax, edx      ; Сравниваем текущий элемент с минимальным
        jl minimum        ; Если текущий элемент не меньше минимального, переходим к метке minimum
        mov eax, edx      ; Иначе обновляем значение минимального элемента

    minimum:
        add esi, 4        ; Переходим к следующему элементу массива
        loop CYCLE        ; Повторяем цикл, уменьшая счетчик

    mov min, eax          ; Сохраняем минимальное значение в переменной min
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

	main PROC															;точка входа main
	START :																;метка
			INVOKE getmin, OFFSET Array, LENGTHOF Array
			INVOKE getmax, OFFSET Array, LENGTHOF Array
	
			
		push 0														;код возврата процесса Windows(параметр ExitProcess)
		call ExitProcess												;так завершается любой процесс Windows

	main ENDP															;конец процедуры

end main																;конец модуля main


		