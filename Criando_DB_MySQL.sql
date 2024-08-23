-- Criando Database;
CREATE DATABASE nubank;

USE nubank; -- Selecionando o DB que vamos utilizar
CREATE TABLE professores(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    -- INT inteiro
    -- Primary Key -> Indica Chave primária
    -- Not Null -> Nunca vai ser Vazio
    -- Auto_Increment -> Auto adicionar novo número
    nome VARCHAR(60),
    materia VARCHAR(30)
);

-- Inserindo dados
INSERT INTO professores (nome, materia) VALUES
("Arthur Rosa", "Banco de Dados"),
("Samuel Bruce", "Flutter"),
("Giovanni Vickng", "React Native");
-- * -> Indica que estou buscando todas as colunas
SELECT * FROM professores;

-- Atualizar Dados
-- Atualize a tabela professores, ajuste materia = backend
-- Onde o ID seja igual a 1
-- if (ID == 1) { atualiza a materia }
UPDATE professores SET materia = 'Backend' WHERE id = 1;

-- Deletar User com ID
DELETE FROM professores WHERE id = 1;

CREATE TABLE alunos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    -- INT inteiro
    -- Primary Key -> Indica Chave primária
    -- Not Null -> Nunca vai ser Vazio
    -- Auto_Increment -> Auto adicionar novo número
    nome VARCHAR(60),
    idade INT
);

-- Inserindo dados
INSERT INTO alunos (nome, idade) VALUES
("Kawan", 18),
("Lucas", 19),
("João", 27);
-- * -> Indica que estou buscando todas as colunas
SELECT * FROM alunos;

-- Deletar Todos os Dados da Tabela
TRUNCATE TABLE alunos;

-- Deletar a Tabela
DROP TABLE alunos;

-- Deletar mais de um ID
DELETE FROM alunos WHERE id IN (1, 2, 3);

-- Atualizar mais de um ID
UPDATE alunos SET nome = "Arthur", idade = 22 WHERE id IN (1, 2, 3);

-- Colunas Modificar o tipo da coluna
    ALTER TABLE alunos 
    MODIFY COLUMN nome VARCHAR(40);
    -- Adicionar nova coluna
    ALTER TABLE alunos
    ADD COLUMN matricula VARCHAR(10);
    -- Deletar uma coluna
    ALTER TABLE alunos
    DROP COLUMN matricula;
    -- Trocar o nome
    ALTER TABLE alunos
    CHANGE COLUMN novoNome nome VARCHAR(30);
    -- Alterar o nome da tabela
    ALTER TABLE alunos 
    RENAME TO estudantes;