# Ler caracteres via teclado e exibí-los na tela (um a um) até que a sequência exit seja digitada 
# (utilize a int 0x16 para leitura de caracteres via teclado) (sugestão: utilizar uma estratégia baseada em automato)

.code16 		 	   
.text 	         
.globl _start

_start:	

    loopE:
            
        movb $0x00,%ah 		# ler character , vai pro al
        int $0x16 		    # keyboard mode

        movb $0x0e,%ah 		# imprimir character
        int $0x10 

        cmp $101, %al		# comparar com e
            je loopX


        jmp loopE

    loopX:
        
        movb $0x00,%ah 		# ler character , vai pro al
        int $0x16 		# keyboard mode
        
        movb $0x0e,%ah 		# imprimir character
        int $0x10 
        
        cmp $120, %al		# comparar com x
            je loopI
        
        cmp $101, %al		# comparar com e
            je loopX
        
        jmp loopE
	
    loopI:
        
        movb $0x00,%ah 		# ler character , vai pro al
        int $0x16 		# keyboard mode
        
        movb $0x0e,%ah 		# imprimir character
        int $0x10 
        
        cmp $105, %al		# comparar com e
            je loopT
        
        
        jmp loopE


    loopT:
        
        movb $0x00,%ah 		# ler character , vai pro al
        int $0x16 		# keyboard mode
        
        movb $0x0e,%ah 		# imprimir character
        int $0x10 
        
        cmp $116, %al		# comparar com e
            je fimloop
        
        
        jmp loopE
        
    fimloop:

        hlt
        jmp fimloop

 # mov to 510th byte from 0 pos
. = _start + 510	

.byte 0x55		      # MBR boot signature 
.byte 0xaa		      # MBR boot signature 