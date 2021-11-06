
;program to loop through an array
.model small
.stack 100h
.data
  arr db 'a','b','c'
.code
main proc

mov ax,@data
mov ds,ax
mov cx,3
mov si , offset arr
l1:
mov dx,[si]
mov ah,02
int 21h
inc si

loop l1

mov ah,4ch
int 21h
main endp
end main