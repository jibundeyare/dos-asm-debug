a
; Hello World
mov dx,0000 ; OFFSET String
mov ah,09
int 21
mov ah,4C
mov al,0
int 21
; #String
db "Hello World!",0D,"$"

q

