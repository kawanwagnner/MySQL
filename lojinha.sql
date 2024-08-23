CREATE DATABASE lojinha;
 
 USE lojinha;
 
CREATE TABLE produtos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
nome VARCHAR(30),
quantidade INT, 
preco VARCHAR (30)
);
 
CREATE TABLE clientes(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR (30),
endereco VARCHAR (100)
);

CREATE TABLE pedido(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idCliente INT, 
    idProduto INT,
    FOREIGN KEY (idCliente) REFERENCES clientes(id),
    FOREIGN KEY (idProduto) REFERENCES produtos(id)
);