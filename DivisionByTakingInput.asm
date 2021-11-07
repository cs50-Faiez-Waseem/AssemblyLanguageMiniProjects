print macro p1
mov dl,p1   
mov ah,02
int 21h  
endm 
Output macro p1
mov dx,offset p1   
mov ah,09
int 21h  
endm 
      
                 
;program to find Division of Two Unsigned Number
.model small
.stack 100h
.data   
   msg db "Enter Dividend:",0ah,0dh,"$"     
   msg2 db  0ah,0dh,"Enter Divisor:",0ah,0dh,"$" 
   newLine db 0ah,0dh,"$"   
   dividend db ?
   divisor db ?
.code  
main proc

mov ax,@data
mov ds, ax

Output msg
mov ah ,1
int 21h
mov dividend , al
mov cl,al
xor ch,ch
sub cx,48

 
Output msg2
mov ah , 01
int 21h 
mov divisor ,al 
sub divisor,48

Output newLine

mov ax,cx
mov bl,divisor
;performing division
div bl

; now al got the  quotient
; and ah got the remainder

mov cl,al
mov ch,ah 
; converting output to ascii code
add cl ,48
add ch,48          


;printing Answer   
add divisor , 48 
print dividend 
print "/"
print divisor
print "="
print cl 
print "."
print ch


mov ah,4ch
int 21h 
    
main endp
end main
