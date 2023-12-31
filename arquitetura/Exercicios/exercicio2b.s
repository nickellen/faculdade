# Ler um valor (unsigned) em ASCII entre 0 e (2^16 -1) e armazená-lo em um registrador. Utilize a int 0x16

.code16 			   
.text 				   
.globl _start

_start:	
    	
	movw $0x2000, %ax		# definir valor ax
	movw %ax, %ss			# definir o seletor de segmento com ax
	movw $0x000, %sp		# definir o ponteiro de pilha com 0x100 - conta para posicao na pilha: ((ss<<4 + sp) - bytes )

	# ax - armazena temporariamento o valor vindo da pilha
	# dx - registrador para armazenar inteiro final
	
	movw $1,%bx 			# registrador para armazenar o multiplicador
	push $0x40				# ponto de parada na pilha

	leitura:
	
		movb $0x0, %ah			# leitura de caracter
		int $0x16
	
		
		cmp $13, %al			# comparar entrada com enter- fim dos caracteres
    		je loop
    		
   		
		movb $0x0e, %ah			# imprimir caracter
		int  $0x10 
		
		movb $0, %ah			# zerar ah e colocar ax na pilha
		push %ax 			# mandar ax para a pilha	
		
		jmp leitura			# caso inteiro nao esteja completo

	loop:
		pop %ax				# ultimo caracter da pilha em ax
			
		sub $0x30, %ax			# ascii -> inteiro
				
		cmp $0x10, %ax			# comparar com ponto de parada na pilha
		je fim
		
		imul %bx, %ax			# multiplica o valor de ax(ultimo numero da pilha) por bx(multiplicador)
		
		add %ax, %dx			# somar ax(inteiro a somar) com dx(inteiro final)
	
		imul $10, %bx			# multiplica bx(multip.) por 10

		jmp loop
	   
    fim:
    	hlt
    	jmp fim
    	    
. = _start + 510	    		# mov to 510th byte from 0 pos

# MBR boot signature 
.byte 0x55		        
# MBR boot signature 
.byte 0xaa		