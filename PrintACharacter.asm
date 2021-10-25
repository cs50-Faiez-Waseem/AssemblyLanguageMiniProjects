.model small
.stack 100h
.data
.code
Main proc
    
MOV dl ,'A' 
MOV ah,02
INT 21h
MOV dl ,'L' 
MOV ah,02
INT 21h
MOV dl ,'I'

MOV ah,02
INT 21h

MOV ah,4ch
INT 21h    

Main endp
End Main