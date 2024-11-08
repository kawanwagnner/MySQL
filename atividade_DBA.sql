CREATE DATABASE rosaplane;
 
USE rosaplane;
 
CREATE TABLE destino (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nomeDestino VARCHAR(100),
país VARCHAR(50),
descricao VARCHAR(100)
);

CREATE TABLE pacotes (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_destino INT,
nomePacote VARCHAR(100),
preco DECIMAL(10,2),
dataInicio DATE,
dataTermino DATE,
  FOREIGN KEY (id_destino) REFERENCES destino(id)
);

CREATE TABLE clientes (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nomeCliente VARCHAR(100),
email VARCHAR(100),
telefone VARCHAR(20),
endereco VARCHAR(100)
);
 
CREATE TABLE reservas (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_clientes INT,
id_pacotes INT,
dataReserva DATE,
numeroPessoas INT,
STATUS ENUM('confirmada', 'pendente', 'cancelada') DEFAULT 'pendente',
FOREIGN KEY (id_clientes) REFERENCES clientes(id),
FOREIGN KEY (id_pacotes) REFERENCES pacotes(id)
);
 
INSERT INTO destino (nomeDestino, país, descricao) VALUES 
('Paris', 'França', 'Cidade da luz e do amor'),
('Roma', 'Itália', 'A cidade eterna com muita história'),
('Nova York', 'EUA', 'Cidade que nunca dorme'),
('Tóquio', 'Japão', 'Mistura de tradição e tecnologia');
 
INSERT INTO pacotes (id_destino, nomePacote, preco, dataInicio, dataTermino) VALUES 
(1, 'Pacote Paris Romântico', 2500.00, '2024-05-01', '2024-05-10'),
(2, 'Pacote Itália Histórica', 3000.00, '2024-06-15', '2024-06-25'),
(3, 'Pacote Nova York Urbana', 4000.00, '2024-07-01', '2024-07-10'),
(4, 'Pacote Tóquio Futurista', 3500.00, '2024-08-20', '2024-08-30');
 
INSERT INTO clientes (nomeCliente, email, telefone, endereco) VALUES 
('Carlos Silva', 'carlos@email.com', '111111111', 'Rua A, 123'),
('Maria Oliveira', 'maria@email.com', '222222222', 'Rua B, 456'),
('Ana Souza', 'ana@email.com', '333333333', 'Rua C, 789'),
('João Santos', 'joao@email.com', '444444444', 'Rua D, 101');
 
INSERT INTO reservas (id_clientes, id_pacotes, dataReserva, numeroPessoas, STATUS) VALUES 
(1, 1, '2024-03-01', 2, 'confirmada'),
(2, 2, '2024-03-15', 1, 'pendente'),	
(3, 3, '2024-04-10', 4, 'confirmada'),
(4, 4, '2024-05-05', 3, 'cancelada');
 
CREATE VIEW vw_reservas_detalhes AS
SELECT 
    r.id AS idReserva,
    r.dataReserva,
    r.numeroPessoas,
    r.STATUS AS statusReserva,
    c.nomeCliente,
    c.email,
    p.nomePacote,
    p.preco,
    d.nomeDestino,
    d.país AS paisDestino
FROM 
    reservas r
JOIN 
    clientes c ON r.id_clientes = c.id
JOIN 
    pacotes p ON r.id_pacotes = p.id
JOIN 
    destino d ON p.id_destino = d.id;
    -- ------------------------------------------------ 
    CREATE VIEW vw_pacotes_destinos AS
SELECT 
    p.id AS idPacote,
    p.nomePacote,
    p.preco,
    d.nomeDestino,
    d.país,
    d.descricao
FROM 
    pacotes p
JOIN 
    destino d ON p.id_destino = d.id;
-- --------------------------------------------------------
-- 1. Visualizar todas as reservas com detalhes completos
  SELECT * FROM vw_reservas_detalhes;
-- ---------------------------------------------------------
-- 2. Filtrar reservas pendentes
SELECT * FROM vw_reservas_detalhes
WHERE statusReserva = 'pendente';
-- ---------------------------------------------------------
-- 3. Pacotes com preço superior a 3000 e destinos
SELECT nomePacote, nomeDestino, preco
FROM vw_pacotes_destinos
WHERE preco > 3000;
-- ---------------------------------------------------------
-- 4. Clientes com reservas para destinos específicos, como 'Paris' e 'Londres'
SELECT c.nomeCliente, d.nomeDestino
FROM reservas r
JOIN clientes c ON r.id_clientes = c.id
JOIN pacotes p ON r.id_pacotes = p.id
JOIN destino d ON p.id_destino = d.id
WHERE d.nomeDestino IN ('Paris', 'Londres');
-- ---------------------------------------------------------
-- 5. Contagem de reservas por status
SELECT STATUS, COUNT(*) AS totalReservas
FROM reservas
GROUP BY STATUS;
-- ---------------------------------------------------------
-- 6. Receita total por destino com base em reservas confirmadas
SELECT d.nomeDestino, SUM(p.preco * r.numeroPessoas) AS receitaTotal
FROM reservas r
JOIN pacotes p ON r.id_pacotes = p.id
JOIN destino d ON p.id_destino = d.id
WHERE r.STATUS = 'confirmada'
GROUP BY d.nomeDestino;
-- ---------------------------------------------------------