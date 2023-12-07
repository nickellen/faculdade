.code16 			   
.text 				   
.globl _start

# Digite um numero qualquer e imprima se ele é impar ou par

_start:			
    
	leitura:
	
		movb $0x0, %ah			# leitura de caracter
		int $0x16
	
		cmp $13, %al			# comparar entrada com enter - fim dos caracteres
    		je main
   		
        mov %al, %bl            # move ultimo caracter para bl

		movb $0x0e, %ah			# imprimir caracter
		int  $0x10 
				
		jmp leitura			# caso inteiro nao esteja completo

    
    main:

        mov $0x00, %dx      # zerar envolvidos na conta dx = resto, ax = resultado
        mov $0x00, %ax
        mov $2, %cx         # divisor

        mov %bx, %ax        # mover o ultimo carac para ax
        
        div %cx             # divide ax por bx = resto vai para dx

        mov $58, %al
        movb $0x0e, %ah			# imprimir caracter
		int  $0x10 

        mov $32, %al
        movb $0x0e, %ah			# imprimir caracter
		int  $0x10 

        cmp $1, %dl             # comparar dl com 1
            je imprimirImpar

        cmp $0, %dl             # comparar dl com 1
            je imprimirPar

        jmp fim

    
    imprimirImpar:

        mov $73, %al
        movb $0x0e, %ah			# imprimir caracter
		int  $0x10 

        mov $77, %al
        movb $0x0e, %ah			# imprimir caracter
		int  $0x10 

        jmp imprimirPar
    
    imprimirPar:

        mov $80, %al
        movb $0x0e, %ah			# imprimir caracter
		int  $0x10 

        mov $65, %al
        movb $0x0e, %ah			# imprimir caracter
		int  $0x10 

        mov $82, %al
        movb $0x0e, %ah			# imprimir caracter
		int  $0x10 

        jmp fim
    
    fim:
        hlt
        jmp fim

    # mov to 510th byte from 0 pos
    . = _start + 510	    
    
    # MBR boot signature 
    .byte 0x55		        
    # MBR boot signature 
    .byte 0xaa		        