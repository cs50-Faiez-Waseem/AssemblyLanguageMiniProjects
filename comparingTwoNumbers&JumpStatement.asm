
;program to print the input number is equal or not
;to the given number in program


.model small
.stack 100h
.data   

msg db "number is Equal$"
msg2 db "number is not Equal$"

.code   
main proc

mov ax,@data
mov ds,ax
;initializing a default value to compare
mov dl,'3'
;taking user input now
mov ah,1
int 21h

;comparing Both now
cmp al,dl
;if both are equal jump to
je l1
;if condition doesnot matched
mov dx,offset msg2
mov ah,9
int 21h
;returning after message printed
mov ah , 4ch
int 21h   


l1:
mov dx,offset msg
mov ah,9
int 21h
;returning after message printed
mov ah , 4ch
int 21h  
        
main endp
end main