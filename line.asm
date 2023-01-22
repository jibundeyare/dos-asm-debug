a
; Bresenham line algorithm
;
jmp near 0100 ; OFFSET start
; data
; #x0
; x0 = 10
dw 000a
; #y0
; y0 = 10
dw 000a
; #x1
; x1 = 300
dw 012C
; #y1
; y1 = 80
dw 0050
; #delta_x
dw 0000
; #delta_y
dw 0000
; #x
dw 0000
; #y
dw 0000
; #distance
dw 0000
; #color
; red
db 04
; #start
; set video mode 13
; graphic mode 320x200
mov ah,00
mov al,13
int 10
; delta_x = x1 - x0
mov ax,[0100] ; OFFSET x1
sub ax,[0100] ; OFFSET x0
mov word ptr [0100],ax ; OFFSET delta_x
; delta_y = y1 - y0
mov ax,[0100] ; OFFSET y1
sub ax,[0100] ; OFFSET y0
mov word ptr [0100],ax ; OFFSET delta_y
; x = x0
mov ax,[0100] ; OFFSET x0
mov word ptr [0100],ax ; OFFSET x
; y = y0
mov ax,[0100] ; OFFSET y0
mov word ptr [0100],ax ; OFFSET y
; while x <= x1
; #while_x_le_x1
mov ax,[0100] ; OFFSET x
cmp ax,[0100] ; OFFSET x1
jnle 0100 ; OFFSET end_while_x_le_x1
; draw a pixel
mov ah,0c
mov cx,[0100] ; OFFSET x
mov dx,[0100] ; OFFSET y
mov al,[0100] ; OFFSET color
int 10
; if distance > 0
mov ax,[0100] ; OFFSET distance
cmp ax,0
jng 0100 ; OFFSET inc_x
; y += 1
inc word ptr [0100] ; OFFSET y
; distance += -delta_x
mov ax,[0100] ; OFFSET delta_x
sub word ptr [0100],ax ; OFFSET distance
; #inc_x
; x += 1
inc word ptr [0100] ; OFFSET x
; distance += delta_y
mov ax,[0100] ; OFFSET delta_y
add word ptr [0100],ax ; OFFSET distance
; goto while_x_le_x1
jmp near 0100 ; OFFSET while_x_le_x1
; #end_while_x_le_x1
; wait for a key press
mov ah,00
int 16
; restore video mode 03
; text mode
mov ah,00
mov al,03
int 10
; exit
mov ah,4C
mov al,0
int 21

q

