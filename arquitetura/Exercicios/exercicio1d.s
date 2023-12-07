# Ler caracteres via teclado e exibí-los na tela (um a um) (utilize a int 0x16 para leitura de caracteres via teclado)

.code16 		 	   
.text 	         
.globl _start

_start:	

    loop:
    	
        movb $0x00,%ah 		# read character
        int $0x16 		    # keyboard mode
        
        movb $0x0e,%ah 		# display character
        int $0x10 
        
        jmp loop

 # mov to 510th byte from 0 pos
. = _start + 510	

.byte 0x55		      # MBR boot signature 
.byte 0xaa		      # MBR boot signature 