CREATE DATABASE walmart_senai;

USE walmart_senai;
CREATE TABLE produto ( 
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR (100),
	quantidade INT
);
 
CREATE TABLE cliente (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR (100),
	idade INT
);
 
CREATE TABLE fornecedor (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100)
);
 
CREATE TABLE pedido (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	id_produto INT,
	id_cliente INT,
	id_fornecedor INT,
	FOREIGN KEY (id_produto) REFERENCES produto(id),
	FOREIGN KEY (id_cliente) REFERENCES cliente(id),
	FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id)
);
 
INSERT INTO produto (nome,quantidade) VALUES 
	('chocolate', 10),
	('bala', 30),
	('refrigerante', 15),
	('macarrao', 5),
	('leite', 20);
 
INSERT INTO cliente (nome,idade) VALUES 
	('joao', 19),
	('ricardo', 20),
	('kawan', 18),
	('emerson', 21),
	('lucas', 20);
 
INSERT INTO fornecedor (nome) VALUES
	("Seara"),
	("Perdigão"),
	("Garoto"),
	("Mid"),
	("Sadia");

INSERT INTO pedido(id_produto, id_cliente, id_fornecedor) VALUES 
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4);
    
SELECT cli.nome , cli.idade, pedido.id_fornecedor
FROM cliente AS cli
INNER JOIN pedido ON pedido.id_cliente = cli.id;