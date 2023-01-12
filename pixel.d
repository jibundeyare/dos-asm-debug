a
; Pixel
;
; set video mode 13
; graphic mode, 320x200
mov ah,00
mov al,13
int 10
; draw a pixel
mov ah,0c
mov cx,[0142] ; OFFSET x
mov dx,[0144] ; OFFSET y
mov al,[0146] ; OFFSET color
int 10
; increment pixel location
mov bx,0142 ; OFFSET x
inc WORD PTR [bx]
mov bx,0144 ; OFFSET y
inc WORD PTR [bx]
; change color
mov bx,0146 ; OFFSET color
dec BYTE PTR [bx]
; draw a pixel
mov ah,0c
mov cx,[0142] ; OFFSET x
mov dx,[0144] ; OFFSET y
mov al,[0146] ; OFFSET color
int 10
; wait for a key press
mov ah,00
int 16
; restore video mode 03
; text mode
mov ah,00
mov al,03
int 10
; exit
mov ax,4c00
int 21
; #x
; 160
dw 00a0
; #y
; 100
dw 0064
; #color
; red
db 04

n pixel.com
r cx
0147
w
q

