# Faça uma moldura na tela utilizando os caracteres da tabela ASCII para molduras de tela (╚, ╔, ═, ...) .

.code16 		  # generate 16-bit code	   
.text 	          # executable code location
.globl _start

_start:	

    movb $0, %bl
    movb $0, %bh  
    
    linhaIni:
    	
        movb $61,%al 		
        
        movb $0x0e,%ah 	
        int $0x10 
        
        
        cmpb $ 5, %bh
        add $1, %bl
        
        cmpb $ 80, %bl
        je colunaIni
        
        jmp linhaIni
        
        
    linhaFim:
    	
        movb $61,%al 		
        
        movb $0x0e,%ah 		
        int $0x10 
        
        sub $1, %bl
        
        cmpb $ 0, %bl
        je fim
        
        jmp linhaFim
	
  
    colunaIni:
    	
    	movb $124,%al 		
	
        movb $0x0e,%ah 		
        int $0x10 
        
        sub $1, %bl
        
        jmp preenche
	

    preenche:
	
        movb $32,%al 		
        
        movb $0x0e,%ah 		
        int $0x10 
        
        sub $1, %bl
        
        cmpb $ 1, %bl
        je colunaFim
        
        jmp preenche
	
	
    colunaFim:
    	
    	movb $124,%al 		
	
        movb $0x0e,%ah 	
        int $0x10 
        
        sub $1, %bl
        
        movb $80, %bl
        
        add $1, %bh
        
        cmpb $ 5, %bh
        je linhaFim
        
        jmp colunaIni
		
    fim:
    	hlt
    	jmp fim

 # mov to 510th byte from 0 pos
. = _start + 510	

.byte 0x55		      # MBR boot signature 
.byte 0xaa		      # MBR boot signature 