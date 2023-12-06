DELIMITER $

CREATE TRIGGER after_insert_trigger
AFTER INSERT ON livro
FOR EACH ROW
BEGIN

  UPDATE controle_de_acesso
     SET qtd_insert = qtd_insert+1
   WHERE id_conexao = CONNECTION_ID();
END;


CREATE TRIGGER after_delete_trigger
AFTER DELETE ON livro
FOR EACH ROW
BEGIN

  UPDATE controle_de_acesso
     SET qtd_delete = qtd_delete+1
   WHERE id_conexao = CONNECTION_ID();
END;


CREATE TRIGGER after_update_trigger
AFTER UPDATE ON livro
FOR EACH ROW
BEGIN

  UPDATE controle_de_acesso
     SET qtd_update = qtd_update+1
   WHERE id_conexao = CONNECTION_ID();
END;

$
DELIMITER ;
