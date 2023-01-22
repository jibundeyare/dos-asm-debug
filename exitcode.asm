a
; Exit code
mov ah,4C
mov al,[0100] ; OFFSET errorcode
int 21
; #errorcode
db 1

q

