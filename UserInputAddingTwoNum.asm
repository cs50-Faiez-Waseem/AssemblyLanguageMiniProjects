
;Taking two input and adding them
; when we get value from user we are recieving ascii code
.model small
.stack 100h
.data
.code
main proc
 
mov dl,48 
 
;taking First One From User
mov ah,1
int 21h
;assinging first value to bl reg 
mov bl,al 
;subtracting the recieving num by 48
;because we recieved ascii code of that number so in order
;to get actual number need to subtract with starting ascii 
;code which for numbers is 48
sub bl,48
;taking value Second From User 
mov ah,1
int 21h
;assinging second value cl reg 
mov cl,al
sub cl,48


;adding both value now
add bl,cl 
;adding base ascii code 
add dl,bl


mov ah,02
int 21h

  
mov ah,4ch
int 21h    

main endp
end main