# Implemente em assembly um programa para o processador 8086 que:

#  - tenha um código para tratamento de interrupção,
#  - que altere a IVT para endereçar o código da interrupção implementada.
#  - utilize a instrução int 0xXX para chamar a interrupção
#  - verificar o resultado no bochs.


.code16
.text
.globl _start

_start:
    
    mov $0x00, %ax       # configurar ivt
    mov $0x00, %dx       # dx recebe 0
    mov %ax, %ds         # o segmento recebe o valor do registrador ax
    mov $0x200, %bx      # move 0x80*0x04 para bx interrupção * 0x0s
    mov $0x7d00, (%bx)   # bx aponta para esse endereço de memória, onde ficará a int

    int $0x80             # chama a interrupção HELLO WORLD!

    fim:
        hlt 
        jmp fim
    
    .= _start + 0x100   # mov o inicio para 0x7c00 + 0x100 para dar o endereço de memória 0x7d00

        movb  $'H' , %al 
        movb $0x0e, %ah      
        int  $0x10   

        movb  $'E' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        movb  $'L' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        movb  $'L' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        movb  $'O' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        movb  $' ' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        movb  $'W' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        movb  $'O' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        movb  $'R' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        movb  $'L' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        movb  $'D' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        movb  $'!' , %al    
        movb $0x0e, %ah      
        int  $0x10   

        iret            # retorna da interrupção

    . = _start + 510      # mov to 510th byte from 0 pos

    .byte 0x55
    .byte 0xaa

    # DS*16+OFFSET
    # 0x80*0x04=0x200
    # mais alto é o offset, o mais baixo é o segmento
    # iret retorna do fim da interrupção