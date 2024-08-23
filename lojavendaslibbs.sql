CREATE DATABASE lojavendaslibbs;

-- Indicando banco de dados que vamos utilizar
USE lojavendaslibbs;
CREATE TABLE clientes (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT
);

CREATE TABLE produtos (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    preco VARCHAR(30)
);

CREATE TABLE fornecedores (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    cnpj VARCHAR(20)
    );

CREATE TABLE funcionarios (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR (11),
    ncarteira VARCHAR(30),
    salario INT
    );
    
    -- clientes, produtos, funcionarios, fornecedores
    
    CREATE TABLE pedidos (
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        idCliente INT,
        idProduto INT,
        idFuncionarios INT,
        idFornecedor INT,
        -- FK (colunaAtual) RF tabela ( nomeColuna )
        FOREIGN KEY (idCliente) REFERENCES clientes(id),
		FOREIGN KEY (idProduto) REFERENCES produtos(id),
		FOREIGN KEY (idFuncionarios) REFERENCES funcionarios(id),
		FOREIGN KEY (idFornecedor) REFERENCES fornecedores(id)
    );
    
INSERT INTO clientes (nome, idade) VALUES
('Tiquinho', 27),
('Soarez', 23),
('Edson', 43);

INSERT INTO produtos (nome, preco) VALUES
('Camiseta da Insider', 'R$ 120,00'),
('Tênis da Nike', 'R$ 620,00'),
('Pulseira da Pandora', 'R$ 1.200,00');

INSERT INTO fornecedores (nome, cnpj) VALUES
('Brás', '21.323/0001-21'),
('Heisenberg', '78.227/0001-32'),
('25Março', '32.921/0001-54');

INSERT INTO funcionarios (nome, cpf, ncarteira, salario) VALUES
('Tiquinho', '12345678910', '347679453', 5000),
('José', '12345678910', '4564654', 6000),
('Soarez', '12345678910', '347679453', 7000);