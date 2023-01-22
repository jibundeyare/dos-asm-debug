a
; jmp
;
; jmp 0081 is 3 bytes <- near jump
; jmp 0082 is 2 bytes <- short jump
; hex: 0100 - 0081 = 7F
; dec: 256 - 129 = 127
; hex: 0100 - 0082 = 7E
; dec: 256 - 130 = 126
;
; jmp 0181 is 2 bytes <- short jump
; jmp 0182 is 3 bytes <- near jump
; hex: 0181 - 0100 = 81
; dec: 385 - 256 = 129
; hex: 0181 - 0102 = 7F
; dec: 385 - 258 = 127
;
; hex: 0182 - 0100 = 82
; dec: 386 - 256 = 130
; hex: 0182 - 0103 = 7F
; dec: 386 - 259 = 127
;
; add near to force coding offset in a word
jmp near 0100 ; OFFSET start
; #start
; ...
; #exit
mov ah,4C
mov al,0
int 21

q

