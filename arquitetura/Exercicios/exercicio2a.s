# Imprimir um valor binário (unsigned) de 16bits em um registrador em ASCII. Utilize a int 0x10.
# maior valor = (2 ^ 16) -1 = 65535

.code16 		  # generate 16-bit code	   
.text 	          # executable code location
.globl _start

_start:	

    # valor 65535 para imprimir

    mov $10000, %cx	    # move 10000 registrador cx = 10000 (divisor)
    movw $65535, %ax	# move 65535 registrador ax = 535 (valor a imprimir)

    mov $10, %bx	    # move 10 registrador  bx = 10 (valor a multiplicar e obter as casas)
    
    loop:

        mov $0, %dx	        # zerar dx devido a dx fazer parte da conta
        
        div %cx		        # Dividir o numero/resto - (5) vai para ax e o resto (35) vai para a pilha
            
        pushw %dx		    # empilhar na pilha o que está em dx(35)- resto da divisão 

        add $0x30, %al	    # Converter para ascii - o valor de ax(5)
                
        movb $0xe, %ah	    # imprimir o valor de ax (5)
        int $0x10
        
        mov $0, %dx		    # zerar dx devido a dx fazer parte da conta- estava com o valor da pilha(35)

        movw %cx, %ax	    # mover potencia de cx para ax - ax = 100 
        
        div %bx		        # Calcular nova potencia - ax = 10
        
        movw %ax, %cx   	# armazenar nova potencia em cx - de cx para ax cx = 10
        
        popw %ax		    # restaurar resto para ax - o que estava na pilha(35) vai para ax ax=35
        
        cmp $0, %ax		    # comparar se o numero e zero - se ax e 0 acabou a divisão
            je fimloop
        
        jmp loop


    fimloop:
        hlt
        jmp fimloop

 # mov to 510th byte from 0 pos
. = _start + 510	

.byte 0x55		      # MBR boot signature 
.byte 0xaa		      # MBR boot signature 