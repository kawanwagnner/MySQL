CREATE DATABASE rainbank;
 
USE rainbank;
 
CREATE TABLE conta_bancaria (
id INT PRIMARY KEY AUTO_INCREMENT,
cliente VARCHAR(100),
-- 10 casa antes do . e duas casas depois 
-- 5600.00
saldo DECIMAL(10,2)
);
 
-- Definindo o inicio e depois o fim da procedure
DELIMITER // 
-- funcao nomeFuncao ( parametros )
CREATE PROCEDURE add_contabancaria(
	IN cb_nome VARCHAR(100),
    IN cb_saldo DECIMAL (10,2)
)
BEGIN
INSERT INTO conta_bancaria (cliente, saldo)
VALUES (cb_nome, cb_saldo);
END // 
DELIMITER ;
 
CALL add_contabancaria("Michael Tayson", 100.00);
CALL add_contabancaria("Lucas Alexandre", 90.00);
CALL add_contabancaria("Thiago Mendez", 100.00);

-- --------------------------------------
DELIMITER //
 
CREATE PROCEDURE update_contabancaria(
    IN cb_id INT,
    IN novo_nome VARCHAR (100),
    IN novo_saldo DECIMAL(10,2)
)
BEGIN
    UPDATE conta_bancaria
     SET cliente = novo_nome,
      saldo = novo_saldo
    WHERE id = cb_id;
END //
 
DELIMITER ;
 
 
-- --------------------------------------
CALL update_contabancaria(1, "Michael Tayson Gomez" ,150.00);
-- --------------------------------------
 
SELECT * FROM conta_bancaria;