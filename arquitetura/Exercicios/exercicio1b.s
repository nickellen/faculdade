.code16 		  # generate 16-bit code	   
.text 	          # executable code location
.globl _start

# imprimir uma linha de 0

_start:	

	movb $89, %bl  # linha tem espaco para 80 carac

	loop:
		
		movb $'0',%al 		# coloca 0 no registrador al

		movb $0x0e,%ah 		# imprimir conteudo de al
		int $0x10 

		sub $1, %bl         # diminui 1 de bl

		cmpb $ 0, %bl       # comparar 0 com bl
		je fim              # se bl for 0 -> pular para fim

		jmp loop            # caso contrario continua no loop

	fim:
		hlt
		jmp fim

 # mov to 510th byte from 0 pos
. = _start + 510	

.byte 0x55		      # MBR boot signature 
.byte 0xaa		      # MBR boot signature 