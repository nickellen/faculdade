# Implemente um programa em assembly para o IBM PC 8086 para ler um número via teclado, imprimir números entre 0 e o número lido.
# Cada número deve ser impresso em uma nova linha. Organize seu código em procedimentos (rotinas chamadas via call).

# Programa funciona para numeros entre 0 e 9

.code16
.text
.globl _start

_start:

	# imprimir de 0 até numero lido
	# ler um numero e armazena num registrador - bl
	# um registrador começa em 0

    leitura:

		mov $0, %cl				# vai ser impresso
    	
    	movb $0x0, %ah			# ler um numero
    	int $0x16		
    	
    	sub $0x30, %al			# ascii -> int
    	
    	mov %al, %bl			# passar para bx o numero
    	
    	call imprimir

		jmp fim
      	
    imprimir:
    	
    	movb %cl, %al			# numero de cl para al para imprimir de al
    	add $0x30, %al			# int -> ascii
  
    	movb $0x0e, %ah			# imprimir numero de al
    	int $0x10	
    	
    	call comparar    
		ret	
    	
    comparar:
    	
    	cmp %cl, %bl		# se cl = bl, imprimiu todas ate bl
    	je fim	
    	
    	movb $0x0A, %al
    	movb $0x0e, %ah		# imprimir nextline
    	int $0x10

    	movb $0x08, %al
    	movb $0x0e, %ah		# imprimir backspace
    	int $0x10
    	
    	incb %cl		# incrementa 1 em cl
    	
    	call imprimir
		ret
 	
    fim:
    	hlt
    	jmp fim


. = _start + 510
.byte 0x55
.byte 0xaa