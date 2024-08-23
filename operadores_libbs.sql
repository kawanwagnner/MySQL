CREATE DATABASE operadores_libbs;

USE operadores_libbs;

CREATE TABLE clientes (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(70),
    idade INT
);

CREATE TABLE empregados (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(70),
    idade INT,
    salario INT
);

SELECT * FROM empregados;
ALTER TABLE empregados
MODIFY COLUMN salario VARCHAR(70);

CREATE TABLE produtos (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(70),
    preco INT,
    qnt INT
);

INSERT INTO clientes (nome, idade)
VALUES ('Roger', 18), ('Geraldo', 23), ('Jonas', 33);

INSERT INTO empregados (nome, idade, salario)
VALUES ('Lucas', 18, "R$ 3000,00"), ('Ricardo', 23, "R$ 3000,00"), ('Mateus', 33, "R$ 3000,00");

INSERT INTO produtos (nome, preco, qnt)
VALUES ('TV', 4000, 10), ('Celular', 4000, 10), ('Tablet', 4000, 10);


