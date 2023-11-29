DELIMITER $

CREATE PROCEDURE login_trigger()
SQL SECURITY DEFINER
BEGIN
  INSERT INTO controle_de_acesso (id_conexao, user, login_ts)
  VALUES (CONNECTION_ID(), USER(), NOW());
END;

CREATE trigger logoff_trigger
BEFORE CONNECT ON *.* FOR EACH USER
BEGIN

  DECLARE qtd_select INT DEFAULT 0;

  SELECT variable_value
    INTO qtd_select
    FROM SESSION_STATUS
   WHERE variable_name = 'COM_SELECT';

  UPDATE teste
     SET logout_ts = NOW(), qtd_select = com_select
   WHERE id_conexao = CONNECTION_ID();
END;

$
DELIMITER ;