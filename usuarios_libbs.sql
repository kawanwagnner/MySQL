CREATE DATABASE usuariosLibbs;
 
USE usuariosLibbs;
 
CREATE TABLE usuarios (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(40)
    );
INSERT INTO usuarios (nome, email, senha)
VALUES 
('arthur', 'a.a.a@a.a', '123'),
('giovanna', 'gigicynthia@gmail', '123'),
('lucas inutilismo', 'lu.inustilismo@sosia.com', '123');
 
UPDATE usuarios SET nome = "Lucas Santos" WHERE id = 3;
 
SELECT * FROM usuarios;
 
CREATE TABLE produtos (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60),
	preco DOUBLE,
	quantidade DOUBLE
);
INSERT INTO produtos (nome, preco, quantidade)
VALUES
('pc gamer', 5000, 10),
('ventilador', 300, 5),
('galaxy s21 fe', 3000, 1000),
('joão paulo', 1, 1),
('FONE BRUTUFI', 200, 100);

SELECT * FROM produtos;
