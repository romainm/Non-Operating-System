[BITS 16]
[ORG 0x7C00]

;; Do nothing except display 'A' on the screen	 
main:
  mov ah, 0x0E
  mov bh, 0x00
  mov bl, 0x07
  mov al, 65
  int 0x10

  jmp $

	


times 510-($-$$) db 0
; the magic Number to be treated as a bootloader
dw 0xAA55			