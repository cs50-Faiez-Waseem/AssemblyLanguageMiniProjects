print macro p1
mov dl,p1   
mov ah,02
int 21h  
endm 
                 
;program to find Division of Two Unsigned Number
.model small
.stack 100h
.data   
   msg db "Enter Dividend:",0ah,0dh,"$"     
   msg2 db "Enter Divisor:",0ah,0dh,"$"
.code  
main proc

mov ax,@data
mov ds, ax


mov ax,6
mov bl,3
;performing division
div bl

; now al got the remainder
; and ah got the quotient

mov cl,al
mov ch,ah
add cl ,48
add ch,48
;printing Quotient
print cl 
print "."
print ch


mov ah,4ch
int 21h 
    
main endp
end main

                 