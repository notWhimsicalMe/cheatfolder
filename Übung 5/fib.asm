global asm_fib_it, asm_fib_rek

;fibonacci Zahlen iterativ ausgerechnet
asm_fib_it:
    mov rcx, 0      ;x = 0
    mov rsi, 1      ;y = 1
    mov rax, 0      ;k = 0

while:
    cmp rdi, 0      ;vergleich n mit 0
    jbe return      ;abbruch der while schleife bei n <= 0
    mov rcx, rsi    ;x = y
    mov rsi, rax    ;y = k
    mov r8, rsi
    add r8, rcx    ;x + y
    mov rax, r8    ;Ergebnis der Addition in k schreiben
    dec rdi         ;n--
    jmp while       ;while schleife

return:
    ret
    
;--------------------------------------------------------------------

;fibonacci Zahlen rekursiv ausgerechnet

;hier befinden sich jetzt viele fehlerhafte codes,
;an denen ich bis zum verzweifeln gearbeitet habe
;und für die ich viel brain verbaucht habe
;aber nichts davon funktioniert also why even bother
;danke btw dass wirs nachreichen können 

;-------------

;asm_fib_rek:
;    cmp rdi, 2
;    jg fib_calc
;
;anchor:
;    mov rax, 1
;    ret
;
;fib_calc:
;    dec rdi              ;rdi-1
;    push rdi             ;push rdi-1 on position 1 in Stack
;    dec rdi              ;rdi -2
;    push rdi             ;push rdi-2 on position 2 in Stack
;    call asm_fib_rek     ;call funktion
;    pop rsi              ;pop position 2(rdi -2) to rsi
;    pop rdx              ;pop position 1(rdi-1) to rdx
;    add rsi, rdx         ;adds rdi-2 and rdi-1
;    mov rax, rsi         ;
;    ret

;-------------
;asm_fib_rek:
;	mov rax, 0
;	cmp rdi, 2
;	jl return2
;	dec rdi
;	call asm_fib_rek	
;	push rax		
;	call asm_fib_rek	
;    pop rdx
;    add rax, rdx
;	ret
;	jmp return2
;
;return2:
;	mov rax, 1
;	ret

;-------------

;asm_fib_rek:
;    mov r8, 3
;    xor rax, rax
;    cmp rdi, r8
;    je return4
;    dec rdi
;    mov rdx, 1
;    push rdx
;    call asm_fib_rek
;    mov r9, rdi
;    dec r9
;    mov rdx, 1
;    push rdx
;    cmp r9, 2
;    je return5
;    call asm_fib_rek
;    pop r8
;    add rdx, r8
;    pop r8
;    add rdx, r8
;    ret
;
;return4:
;    ret
;
;return5:
;    ret

;-------------

;asm_fib_rek:
;    mov rax, 1
;    mov rdx, rdi
;    dec rdi
;
;recursion:
;    cmp rdx, 2
;    je label1
;    dec rdx
;    push rax
;    call recursion
;    pop rsi
;    add r8, rsi
;    cmp rdi, 2
;    je label1
;    dec rdi
;    push rax
;    call recursion
;    pop rsi
;    add r8, rsi
;
;label1:
;    ret

;-------------

;asm_fib_rek:
;    cmp rdi, 2
;    je label3
;;    push rdi
;    dec rdi
;    call asm_fib_rek
;    cmp rdi, 2
;    je label3
;    dec rdi
;;    pop rax
;;    add rsi, rax
;    call asm_fib_rek
;    pop rax
;    add rsi, rax
;    ret
;
;label3:
;    mov rcx, 1
;    push rcx
;    ret