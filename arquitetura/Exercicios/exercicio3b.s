# Faça um programa em assembly para o 8086 do IBM-PC que seja capaz de ler uma string via teclado e armazená-la em uma posição da memória.
# A leitura deve ser interrompida apenas com a tecla enter. 

# Após a leitura, deve imprimir a string da memoria.

.code16
.text
.globl _start

_start:

    movb $'.' , %al		    # inicio do programa
    
    movb $0xe , %ah		    # imprime o al do telcado
    int $0x10
    
    movb $' ' , %al		
    
    movb $0xe , %ah		    # imprime o al do telcado
    int $0x10
    
    movw $0x2000, %ax		# move 0x2000 em ax
    movw %ax , %ds		    # move ax para ds - registrador de segmento de dados

    movw $0x100, %bx		# off-set = 0x100

    movw %bx, %cx           # armazenar off-set para impressao

    leitura:

        movb $0x00 , %ah 		# Serviço de teclado 0x0 leitura em al
        int $0x16
        
        cmp $13, %al		    # se for enter para
        je fimLeitura

        movb %al, (%bx)		    # bx vai armazenar um ponteiro que aponta para conteuso de al
        incw %bx			    # incrementa bx - offset incrementa uma palavra

        jmp leitura
        
    fimLeitura:

        mov $184, (%bx)

        mov %cx, %bx		    # bx vai armazenar um ponteiro que aponta para conteuso de al

        jmp imprime
        
    imprime:

        movb (%bx), %al		    # move o que está armazenado pelo ponteiro em bx para al
        
        cmpb $184, (%bx)	    # o final da string contem um byte nulo
        je final
        
        movb $0xe , %ah 	    # imprime o valor de al
        int $0x10
        
        incw %bx		        # proximo off-set
        
        jmp imprime
        
    final:
            
        hlt
        jmp final

. = _start + 510
.byte 0x55
.byte 0xaa