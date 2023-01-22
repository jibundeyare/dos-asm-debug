a
; Pixels
;
; set video mode 13
; graphic mode 320x200
mov ah,00
mov al,13
int 10
; draw a pixel
mov ah,0c
mov cx,[0100] ; OFFSET x
mov dx,[0100] ; OFFSET y
mov al,[0100] ; OFFSET color
int 10
; increment pixel location
mov bx,0100 ; OFFSET x
inc word ptr [bx]
mov bx,0100 ; OFFSET y
inc word ptr [bx]
; change color
; blue
mov byte ptr [0100],03 ; OFFSET color
; draw a pixel
mov ah,0c
mov cx,[0100] ; OFFSET x
mov dx,[0100] ; OFFSET y
mov al,[0100] ; OFFSET color
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

q

