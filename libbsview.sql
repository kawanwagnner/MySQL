CREATE DATABASE libbsview;

USE libbsview;

CREATE TABLE produtos (
	id 	INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(100),
    quantidade INT,
    preco DECIMAL(10, 2),
    descricao VARCHAR(100)
);

CREATE TABLE clientes (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100)
);

CREATE TABLE pedidos (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idProduto INT,
    idCliente INT,
    FOREIGN KEY (idProduto) REFERENCES produtos(id),
    FOREIGN KEY (idCliente) REFERENCES clientes(id)
);

INSERT INTO produtos (nome, descricao, preco, quantidade) VALUES 
("coca cola", "gelada é bom", 20.0, 3),
("camisa do sp", "seleção", 1500.0, 1),
("Fazer FZ15", "Moto Linda", 20000.0, 7),
("Fazer FZ2015", "Moto Elite", 25000.0, 1);

INSERT INTO clientes (nome, email, senha) VALUES
("Arthur Rosa", "arthur@2025.com", "123"),
("Giovanni", "samuca@terra.com", "777"),
("Samuel", "Samuca@sla.com", "777");

INSERT INTO pedidos (idProduto, idCliente) VALUES 
(1,1), (2,2), (3,3);

-- Saber a quantidade total do estoque
SELECT SUM(quantidade) AS QuantidadeTotal FROM produtos;

CREATE VIEW visualizar_total_estoque AS
SELECT SUM(quantidade) AS QuantidadeTotal FROM produtos;

SELECT * FROM visualizar_total_estoque;

-- Calcular o faturamento total do estoque

CREATE VIEW visualizar_total_preco AS
SELECT (quantidade * preco) AS PrecoTotal FROM produtos;

SELECT SUM(PrecoTotal) AS totalPedidos FROM visualizar_total_preco;


SELECT * FROM visualizar_total_preco;

-- Crie uma consulta que vai selecionar todos os produtos que
-- foram pedidos
-- Crie a View

CREATE VIEW visualizar_produtos_pedidos AS
SELECT nome, descricao, pedidos.id FROM produtos
INNER JOIN pedidos ON produtos.id = pedidos.idProduto;

SELECT *  FROM visualizar_produtos_pedidos;

-- Visulizar o cliente o pedido e o produto
-- INNER JOIN => INNER JOIN
-- Criar uma VIEW

CREATE VIEW visualizar_comprador_pedido AS
SELECT clientes.nome AS nomeCliente, produtos.nome AS NomeProduto, pedidos.id AS idPedido
FROM clientes
INNER JOIN pedidos ON pedidos.idCliente = clientes.id
INNER JOIN produtos ON produtos.id = pedidos.idProduto;

SELECT * FROM visualizar_comprador_pedido;

