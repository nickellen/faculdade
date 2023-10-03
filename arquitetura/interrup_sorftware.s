.code16
.text

.globl _start

#implementando uma interrupção - exercicio 9


_start:
    
    mov $0x00, %ax       #configurar ivt
    mov $0x00, %dx       #dx recebe 0
    mov %ax, %ds         #o segmento recebe o valor do registrador ax
    mov $0x200, %bx      #move 0x80*0x04 para bx
    mov $0x7d00, (%bx)   #bx aponta para esse endereço de memória, onde ficará a int

    movb  $'.' , %al      #sinalizar início
    movb $0x0e, %ah      
    int  $0x10   

    int $0x80             #chama a interrupção

    fim:
        hlt 
        jmp fim
    
    .= _start + 0x100   # mov o inicio para 0x7c00 + 0x100 para dar o endereço de memória 0x7d00

        movb  $'x' , %al    
        movb $0x0e, %ah      
        int  $0x10   
        iret

    . = _start + 510      # mov to 510th byte from 0 pos

    .byte 0x55
    .byte 0xaa


    #DS*16+OFFSET
    #0x80*0x04=0x200
    #mais alto é o offset, o mais baixo é o segmento
    #iret retorna do fim da interrupção
