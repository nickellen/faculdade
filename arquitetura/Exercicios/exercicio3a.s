# Faça um programa em assembly para o 8086 do IBM-PC que seja capaz de ler uma string via teclado e armazená-la em uma posição da memória.
# A leitura deve ser interrompida apenas com a tecla enter. O final da string deverá conter um byte nulo.

# Utilize o debugger do bochs para visualizar o conteúdo da memória onde a string foi armazenada.

# Sugestão: 1) Utilize um segmento de dados diferente de 0 para armazenar a string e evite armazená-la em posições reservadas 
# como, por exemplo, primeiros 1024 bytes da memória

# !!! Acessar posicao na memoria : x /16bx 0x2000(data segment):0x100(off-set), ou ds<<4 + offset

.code16
.text
.globl _start

_start:

    movb $'.' , %al		    # al = .
    
    movb $0xe , %ah		    # imprime o al do telcado
    int $0x10
    
    movw $0x2000, %ax		# move 0x01 em ax
    movw %ax , %ds		    # move 0x01 para ds - registrador de segmento de dados

    movw $0x100, %bx		# off-set = 0x100

leitura:

    movb $0x00 , %ah 		# Serviço de teclado 0x0 leitura em al
    int $0x16
    
    cmp $13, %al		    # se for um enter para
    je final
   
    movb $0xe , %ah 		# Imprimir um byte em al
    int $0x10

    movb %al, (%bx)		    # bx vai armazenar um ponteiro que aponta para conteuso de al
    incw %bx			    #  incrementa bx - offset incrementa uma palavra

    jmp leitura
    
    
final:
		
	hlt
	jmp final

. = _start + 510
.byte 0x55
.byte 0xaa
