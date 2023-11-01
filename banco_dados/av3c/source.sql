DELIMITER $

    -- Esse trigger não está funcionando devido a surgir o seguinte problema:
    -- quando se faz o insert de uma nova ocorrencia com uma chave primária já utilizada, ocorre um erro devido a duplicacão da chave
    -- porém ao tentar deletar esse ocorrência antes da nova insercão, tem-se outro problema:
    -- voce não pode alterar a tabela (deletar o registro) enquanto o trigger de insert esta acionado

    -- Outras abordagem foi pensada: 
    -- ao verificar que a chave ja existe, bloquear o insert e realizar o update utilizando os novos dados
    -- Porém não conseguimos encontrar maneira de implementar a ação

    -- Criar Trigger para inserir antigo registro, se já existir, no log antes de inserir o novo na tabela
    CREATE TRIGGER inserir_no_log BEFORE INSERT ON livro FOR EACH ROW
    BEGIN       
        -- obtem o isbn do livro que vai ser inserido
        SET @old_isbn = (SELECT isbn from livro where isbn = NEW.isbn);

        -- verifica se o isbn já exite
        IF @old_isbn = NEW.isbn THEN
            INSERT INTO livro_log VALUES(NEW.isbn, NEW.nome, NEW.autor, NEW.genero);
            delete from livro where isbn=NEW.isbn;
        END IF;
    END$

    -- Criar Trigger para atualizar row na tabela
    CREATE TRIGGER atualizar_no_log BEFORE UPDATE ON livro FOR EACH ROW
    BEGIN       
        -- adiciona o registro antigo ao log
        INSERT INTO livro_log VALUES(OLD.isbn, OLD.nome, OLD.autor, OLD.genero);
    END$


    -- Trigger para excluir row da tabela
    CREATE TRIGGER excluir_no_log BEFORE DELETE ON livro FOR EACH ROW
    BEGIN       
        -- adiciona o registro antigo ao log
        INSERT INTO livro_log VALUES(OLD.isbn, OLD.nome, OLD.autor, OLD.genero);
    END$

DELIMITER ;
