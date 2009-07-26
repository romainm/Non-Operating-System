
[BITS 16]
[ORG 0x7C00]

;; Display a string on the screen
main:
    mov ax, 0x0000	; Setup the Data Segment register
    mov ds, ax
    mov si, HelloWorld	; Load the string into position for the procedure.
    call PutStr

    ;;  never ending loop
    jmp $	


PutStr:
 ; Set up the registers for the interrupt call
    mov ah,0x0E	; The function to display a character (teletype)
    mov bh,0x00	; Page number
    mov bl,0x07	; Normal text attribute

.nextchar:
    lodsb ; think of LOad String Block
		  ; Loads [SI] into AL and increases SI by one

    ; Check for end of string '0' 
    or al,al	; Sets the zero flag if al = 0 
    jz .return

    int 0x10	; Display char using the BIOS interrupt
    ;; process next char
    jmp .nextchar
    
.return:
    ret		; return to main program

; Data

HelloWorld db 'Hello World',13,10,0


    
times 510-($-$$) db 0
; the magic Number to be treated as a bootloader
dw 0xAA55

