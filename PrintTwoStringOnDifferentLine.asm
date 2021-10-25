
; printing two string on two different line

.model small
.stack 100h
.data
var1 db "Hello World$"
var2 db "Hello World 2 $"
.code
main proc

mov ax,@data
mov ds ,ax

;can alse write like this
; mov dx,offset var1
lea dx,var1

mov ah,09
int 21h

;  new Line
mov dx ,10 
mov ah,02
int 21h

;to the start of the new Line

mov dx,13
mov ah,02  
int 21h

lea dx,var2
mov ah,09
int 21h

mov ah,4ch
int 21h
    
main endp
end main
