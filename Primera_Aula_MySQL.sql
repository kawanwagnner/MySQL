-- Comentário em Banco de dados
-- Criar novo Arquivo -> Cntrl + T 

-- Mostra as permições para root ( usuário ) localhost ( conexão )
SHOW GRANTS FOR 'root'@'localhost';

-- Mostra as permições para novousuario ( usuário ) localhost ( conexão )
SHOW GRANTS FOR 'novousuario'@'localhost';

CREATE USER 'novousuario'@'localhost'
IDENTIFIED BY 'senha123';

DROP USER 'novousuario'@'localhost';

GRANT
	SELECT,
    INSERT,
    UPDATE
ON sys.sys_config
TO 'novousuario'@'localhost';

REVOKE
	SELECT,
    INSERT,
    UPDATE
ON sys.sys_config
FROM 'novousuario'@'localhost';