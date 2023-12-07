.code16 			   
.text 				   
.globl _start

# Digite um numero qualquer e imprima um quadrado de X de tamanho NxN, que forme um X em seu interior

_start:	

	mov $175, %al
	movb $0x0e, %ah			# nextline
	int  $0x10 

	mov $32, %al
	movb $0x0e, %ah			# nextline
	int  $0x10 

	movw $0x1000, %ax		# definir valor ax
	movw %ax, %ss			# definir o seletor de segmento com ax
	movw $0x100, %sp		# definir o ponteiro de pilha com 0x100 - conta para posicao na pilha: ((ss<<4 + sp) - bytes )

	# ax - armazena temporariamento o valor vindo da pilha
	# dx - registrador para armazenar inteiro final
	
	movw $1,%bx 			# registrador para armazenar o multiplicador
	push $0x40				# ponto de parada na pilha

	leitura:
	
		movb $0x0, %ah			# leitura de caracter
		int $0x16
	
		
		cmp $13, %al			# comparar entrada com enter- fim dos caracteres
    		je loop

        movb $0x0e, %ah			# volta ao inicio da linha
		int  $0x10 
		
		movb $0, %ah			# zerar ah e colocar ax na pilha
		push %ax 				# mandar ax para a pilha	
		
		jmp leitura				# caso inteiro nao esteja completo

	loop:
	
		pop %ax					# ultimo caracter da pilha em ax
			
		sub $0x30, %ax			# ascii -> inteiro
				
		cmp $0x10, %ax			# comparar com ponto de parada na pilha
		je main
		
		imul %bx, %ax			# multiplica o valor de ax(ultimo numero da pilha) por bx(multiplicador)
		
		add %ax, %dx			# somar ax(inteiro a somar) com dx(inteiro final)
	
		imul $10, %bx			# multiplica bx(multip.) por 10

		jmp loop
	   

	# verificar se o numero e impar ou par
    main:


		mov %dx, %ax		# passar valor total para ax, para divisao
		mov %dx, %bx		#  passar valor total para bx, para verificacao

		mov $0x00, %dx      # zerar envolvidos na conta dx = resto, ax = resultado
        mov $2, %cx         # divisor
        
        div %cx             # divide ax por cx = resto vai para dx

        cmp $1, %dl             # comparar dl com 1
            je imprimirImpar

        cmp $0, %dl             # comparar dl com 1
            je imprimirPar

        jmp fim

    imprimirImpar:

		mov $10, %al
		movb $0x0e, %ah			# nextline
		int  $0x10 

		mov $13, %al
        movb $0x0e, %ah			# volta ao inicio da linha
		int  $0x10 

		# valor esta em bx = 5
		mov $0x00, %ax
		mov $0x00, %dx
		mov %bx, %cx		# cx vai armazenar bx tambem

		call funcao

        jmp fim

	# funcao para imprimir n linhas, chamada em cada interacao a funcao para preencher com x cada linha
	funcao:

		mov %cx, %dx			# dx vai aramazenar valor para comparação das colunas

		call preenche			# imprimir restante dos x

		mov $10, %al
        movb $0x0e, %ah			# nextline
		int  $0x10 

		mov $13, %al
        movb $0x0e, %ah			# volta ao inicio da linha
		int  $0x10 

		sub $1, %bx				# diminui 1 de bx - valor das linhas
		cmp $0, %bx				# verifica se bx está zerado
			jne funcao

		ret

	# preenche a linha com x ou ponto
	# algoritmo sera:  imprime x se linha(bx)=coluna(dx) ou se linha+coluna=tamanho(cx)+1
	#   			ou imprime x se for a primera coluna, primeira linha, ultima linha ou ultima coluna
	preenche:

		add $1, %cx			# para obtermos tamanho+1
		
		mov $0, %ax			# para obtermos linha+coluna , armazenada em ax
		add %bx, %ax
		add %dx, %ax

		cmp %cx, %ax		# se linha+coluna=tamanho+1
			je imprimeXA
		
		sub $1, %cx			# restaura o valor de cx para utilizar o reg novamente

		cmp $1, %dx			# se e a primeira coluna
			je imprimeX
		
		cmp %cx, %dx		# se é a ultima coluna
			je imprimeX

		cmp $1, %bx			# se é a primeira linha
			je imprimeX
		
		cmp %cx, %bx		# se é a ultima linha
			je imprimeX

		cmp %bx, %dx		# se linha!=coluna
			jne imprimePonto

		cmp %bx, %dx		# se linha=coluna
			je imprimeX

		
	imprimeXA:

		sub $1, %cx				# restaura o valor de cx

		mov $88, %al
		movb $0x0e, %ah			# imprimir x
		int  $0x10

		sub $1, %dx
		cmp $0, %dx
			jne preenche

		ret


	imprimePonto:

		mov $46, %al
		movb $0x0e, %ah			# imprimir ponto
		int  $0x10

		sub $1, %dx
		cmp $0, %dx
			jne preenche

		ret

	imprimeX:

		mov $88, %al
		movb $0x0e, %ah			# imprimir x
		int  $0x10

		sub $1, %dx
		cmp $0, %dx
			jne preenche

		ret
    
    imprimirPar:

		mov $10, %al
		movb $0x0e, %ah			# nextline
		int  $0x10 

		mov $13, %al
        movb $0x0e, %ah			# volta ao inicio da linha
		int  $0x10 

        mov $69, %al
        movb $0x0e, %ah			# imprimir caracter
		int  $0x10 

        mov $82, %al
        movb $0x0e, %ah
		int  $0x10 

        mov $82, %al
        movb $0x0e, %ah			
		int  $0x10 

		mov $79, %al
        movb $0x0e, %ah			
		int  $0x10

        jmp fim
    
    fim:

        hlt
        jmp fim


    	hlt
    	jmp fim
    	    
. = _start + 510	    	

.byte 0x55		        
.byte 0xaa