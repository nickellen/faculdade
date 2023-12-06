!!!!!!
A variável init_connect chama a função de login caso se esteja utilizando o procedure.
 
Estratégia de procedure/triggers: SET GLOBAL init_connect = 'CALL teste.login_trigger()';
Estratégia de programa python:    SET GLOBAL init_connect = '';


ADICIONAR PROCEDURES E TRIGGERS NA TABELA: source nome_da_fonte.sql

OBS: programa python e procedures/triggers são estratégias separadas. O programa python funciona normalmente com a tabela sem os triggers/procedures ativados.
