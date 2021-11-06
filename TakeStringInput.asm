        
;program to take input String and Display
.model small
.stack 100h
.data
 input db 100 dup('$')

.code   
main proc

mov ax,@data
mov ds,ax
;offset addres of first element in array
mov si, offset input


takingInput:
mov ah,1
int 21h
;checking if user pressed enter
cmp al,13  
;if input is equal to enter pressed then end program
je programEnd 
;else save input at index 
mov [si],al 
inc si
;get next character again / jump to label takeInput
jmp takingInput   
  
  
programEnd:  
mov dl,10
mov ah,02
int 21h
mov dx, offset input
mov ah,09
int 21h
mov ah,4ch
int 21h

main endp    
    end main      