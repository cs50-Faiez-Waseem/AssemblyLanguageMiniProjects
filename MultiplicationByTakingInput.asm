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
      
                 
;program to find Multiplication of Two Numbers
.model small
.stack 100h
.data   
   msg db "Enter First Number:",0ah,0dh,"$"     
   msg2 db  0ah,0dh,"Enter Second Number:",0ah,0dh,"$" 
   newLine db 0ah,0dh,"$"   
   m1 db ?
   m2 db ?
.code  
main proc

mov ax,@data
mov ds, ax

Output msg
mov ah ,1
int 21h
mov m1 , al
mov cl,al
xor ch,ch
sub cx,48

 
Output msg2
mov ah , 01
int 21h 
mov m2 ,al 
sub m2,48

Output newLine

mov ax,cx
mov bl,m2
;performing Multiplication
mul bl

; now al got the  quotient
; and ah got the remainder

mov cl,al
mov ch,ah 
; converting output to ascii code
add cl ,48
add ch,48          


;printing Answer   
add m2 , 48 
print m1 
print "*"
print m2
print "="
print cl 
print "."
print ch


mov ah,4ch
int 21h 
    
main endp
end main
