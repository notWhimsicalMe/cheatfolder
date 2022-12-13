		.global_floating

;Erstmal die Operanden einlesen
;Dann die Operanden addieren
;32 Bit Register-keine rax/rcx/rsi/rdi ect.

main_floating:
		MOV eax, flt	;lädt mem in meinen Akkumulator
		RCL eax, 1	;Akkumulator nach links shiften, um VOrzeichen zu entfernen
		MOV ebx, eax	;Speichere den Akkumulator
		AND eax, edx	;"AND" auf Akkumulator holt den Exponenten
		SHR eax, 24;
		MOV eax, ebx	;hole den Wert von rbx wieder
		RCL eax, 8; 	; schneide die linken 8 bits für den Wert
		MOV ebx, eax	;lagere in rbx
		MOV edx,000000000h;
		CMP ecx, 0;
		JE loop2;
		SHR eax, 1
		OR eax, 80000000h

loop1:
		SHR eax,1	;Shift alle Bits für den ganzen Wert
		ADD edx,1
		CMP ecx,0
		JA loop1;

loop2:
		mov edx, eax;

;Operator der ein Vorzeichen vergleicht
;in dem Fall +/-

sign:
		MOV rax, flt
		AND rax, 00000000h
		CMP rax, 10000000h		;ich glaube das habe ich so auf den Vorrechnungen bei dir gesehen
		JE	putssign;

putsign:
	RET



;Ich hab nachwievor extreme Probleme mit Assembler, ich weiß einfach nicht
;Im Vorfeld ist mir schon, dass ich diese Datei nicht compilieren kann
;Trotzdem investiere ich immer viel Zeit in Aufgabe 1 und Aufgabe 2.
;was ich mit BIT_MASK_VORZEICHEN mache oder BIT_MASK_MANTISSE
;Ich hätte auch Exponenten-Anpassung machen können mit CMP- und JMP- und SHF-Befehlen
;Zum Schluss die Significants hinzufügen
;Theoretisch ist das immer leicht, aber praktisch den code schreiben ist super anstrengend
