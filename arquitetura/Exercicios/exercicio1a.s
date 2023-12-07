# somar dois inteiros e analisar a resposta no debugger do Bochs

.code16 		  # generate 16-bit code	   
.text 	          # executable code location
.globl _start

_start:	

    mov $2, %ax     # coloca 2 no registrador ax
    mov $5, %bx     # coloca 5 no registrador bx

    add %bx, %ax    # soma ax com bx

    hlt             # r para verificar registradores com o valor da soma

 # mov to 510th byte from 0 pos
. = _start + 510	

.byte 0x55		      # MBR boot signature 
.byte 0xaa		      # MBR boot signature 