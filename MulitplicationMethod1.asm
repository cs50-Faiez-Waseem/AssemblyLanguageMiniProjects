.MODEL small

.STACK 1000h

.DATA
    num db '3', '4'
    result db '$$$'

.CODE
main PROC
    mov ax, @data
    mov ds, ax          ; DS! DS! NOT DX!

    mov ah, 01h         ; Wait for one character
    int 21h
    mov num, al         ; AL! AL! NOT DL!

    mov ah, 01h         ; Wait for one character
    int 21h
    mov num+1, al

    mov dl, 0Ah         ; Linefeed
    mov ah, 02h         ; Cooked output
    int 21h

    mov ax, word ptr [num]
    and ax, 0F0Fh       ; Convert ASCII numbers to integers
    mul ah              ; AX = AL * AH
    aam                 ; Convert integer in AL to unpacked BCD in AX
    or  ax, 3030h       ; Convert integers to ASCII
    xchg al, ah         ; Convert big endian to little endian
    mov word ptr [result], ax

    mov dx, OFFSET result
    mov ah, 09h         ; Output until '$'
    int 21h

    mov ax, 4C00h       ; Exit (0)
    int 21h
main ENDP

end main