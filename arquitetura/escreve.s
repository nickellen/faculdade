# generate 16-bit code
.code16 			   
# executable code location
.text 				   

.globl _start

# entry point
_start:				    

    # character to print
    movb $'x' , %al		

    # bios service code to print
    movb $0x0e, %ah	
    # bios service (interrupt) 
    int  $0x10		  

    xor %ax, %ax
    mov %ax, %ds       # ds set to 0

    mov $2, %ah         # int 13h função 2 - leitura
    mov $20, %al        # ler 20 setores
    mov $0,  %ch        # cilindro 0
    mov $1,  %cl        # setor numero 1
    mov $0,  %dh        # cabeçote num 0
    mov $0x80, %dl         # hard disk 1

    xor %bx, %bx    
    mov %bx, %es       # es deve ser 0
    mov $0x7e00, %bx   # 512 bytes do endereõ de origem 7c00h
    int $0x13


    movb $'x' , %al		

    # bios service code to print
    movb $0x0e, %ah	
    # bios service (interrupt) 
    int  $0x10	

    fim:
        jmp fim
        hlt


    # mov to 510th byte from 0 pos
    . = _start + 510	    
    
    # MBR boot signature 
    .byte 0x55		        
    # MBR boot signature 
    .byte 0xaa		        
