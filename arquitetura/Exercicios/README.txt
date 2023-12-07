<b2> SEGUE O CONTEÚDO DOS EXERCÍCIOS <b2>

1 - Fazer os seguintes programas em Assembly:

    1a : Somar dois inteiros e analisar a resposta no debugger do Bochs
   
    1b: Exibir uma linha cheia de caracteres '0'
    
    1c: Faça uma moldura na tela utilizando os caracteres da tabela ASCII para molduras de tela (╚, ╔, ═, ...) .
    
    1d: Ler caracteres via teclado e exibí-los na tela (um a um) (utilize a int 0x16 para leitura de caracteres via teclado)
    
    1e: Ler caracteres via teclado e exibí-los na tela (um a um) até que a sequência exit seja digitada (utilize a int 0x16 para leitura de caracteres via teclado) (sugestão: utilizar uma estratégia baseada em automato)

2 - Fazer os seguintes programas em Assembly:
    2a: Implemente códigos em assembly do 8086 para:

    2b: Imprimir um valor binário (unsigned) de 16bits em um registrador em ASCII. Utilize a int 0x10.
    
    2c: Ler um valor (unsigned) em ASCII entre 0 e (2^16 -1) e armazená-lo em um registrador. Utilize a int 0x16

3 - Fazer os seguintes programas em Assembly:

    3a: Faça um programa em assembly para o 8086 do IBM-PC que seja capaz de ler uma string via teclado e armazená-la em uma posição da memória. 
      A leitura deve ser interrompida apenas com a tecla enter. O final da string deverá conter um byte nulo.
      Utilize o debugger do bochs para visualizar o conteúdo da memória onde a string foi armazenada.
      Sugestão: Utilize um segmento de dados diferente de 0 para armazenar a string e evite armazená-la em posições reservadas como, por exemplo, primeiros 1024 bytes da memória.

    3b: Exercicio 3, mas imprimindo o numero da memoria apos a gravação

4 - Implemente um programa em assembly para o IBM PC 8086 para ler um número via teclado, imprimir números entre 0 e o número lido. Cada número deve ser impresso em uma nova linha. Organize seu código em procedimentos (rotinas chamadas via call).

5 -  Implemente em assembly um programa para o processador 8086 que:

      - tenha um código para tratamento de interrupção,
      - que altere a IVT para endereçar o código da interrupção implementada.
      - utilize a instrução int 0xXX para chamar a interrupção
      - verificar o resultado no bochs.
