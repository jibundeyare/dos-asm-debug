a
; Exit code
mov ah,4C
mov al,[0000] ; OFFSET errorcode
int 21
; #errorcode
db 1

q

