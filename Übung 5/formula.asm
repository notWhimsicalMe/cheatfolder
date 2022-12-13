; f(1) = 1
; f(2) = 1
; f(n) = f(n-1) + f(n-2) --> für n < 2
;Fibonacci Zahlen
;Iterativ

		global asm fib_it
		global asm_fib_rek
		

asm_fit_it:
		MOV rax, 0 ;k
		MOV rsi, 0 ;x
		MOV rdx, 1 ;y
		MOV rcx, 0

star:
		CMP rdi, 0
		JG loop
		JE end

loop:
		MOV rsi, rdx		;x = y
		MOV rdx, rax 		;y = k
		ADD rsdi, rdx 		;x+y
		MOV rcx, rsi 		;schiebe das Ergebnis in ein anderes Register
		MOV rax, rcx 		;gebe den Wert wieder zurück
		DEC rdi
		JMP start

end:
		RET


;Rekursiv

asm_fib_rek:
		MOV rax, 0
		CMP rdi, 3
		JL return
		SUB rdi, 1
		CALL asm_fib_rek	;Merke dir die Rücksprungadresse
		PUSH rax		;Schmeiß rax auf den Stack
		SUB rdi, 1
		CALL asm_fib_rek	;Merke Rücksprungsadresse für RET Befehlt später
		POP rax			;first-in-last-out
		ADD rax, rdx
		RET
		JMP return2

return:
		MOV rax, 1
		RET

return2:
		RET

