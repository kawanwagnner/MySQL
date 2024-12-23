CREATE DATABASE escola;
USE escola;

CREATE TABLE Turmas (
    turma_id INT PRIMARY KEY,
    descricao VARCHAR(255)
);

CREATE TABLE Professores (
    professor_id INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE Alunos (
    aluno_id INT PRIMARY KEY,
    nome VARCHAR(255),
    idade INT,
    turma_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id)
);

CREATE TABLE Turma_Professor (
    turma_id INT,
    professor_id INT,
    PRIMARY KEY (turma_id, professor_id),
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id),
    FOREIGN KEY (professor_id) REFERENCES Professores(professor_id)
);

CREATE TABLE Atividades (
    atividade_id INT PRIMARY KEY,
    descricao VARCHAR(255),
    turma_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id)
);

CREATE TABLE Notas (
    aluno_id INT,
    atividade_id INT,
    nota DECIMAL(5, 2),
    PRIMARY KEY (aluno_id, atividade_id),
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY (atividade_id) REFERENCES Atividades(atividade_id)
);

SELECT * FROM Turmas;

SELECT al.nome, al.idade, Turmas.turma_id, Turmas.descricao
FROM Alunos AS al
INNER JOIN Turmas ON Turmas.turma_id;
 

SELECT al.nome, al.aluno_id, Notas.atividade_id, Notas.nota
FROM Alunos AS al
LEFT JOIN Notas ON Notas.aluno_id = al.aluno_id AND atividade_id = 1;



SELECT Alunos.nome , nota.nota
FROM Notas AS nota
RIGHT JOIN Alunos ON Alunos.aluno_id = nota.aluno_id;



SELECT al.nome, Turmas.descricao, Professores.nome
FROM Alunos AS al
INNER JOIN Turmas ON al.turma_id = Turmas.turma_id
INNER JOIN Turma_Professor ON Turmas.turma_id = Turma_Professor.turma_id
INNER JOIN Professores ON Turma_Professor.professor_id = Professores.professor_id;


SELECT al.nome AS aluno_nome, Turmas.descricao AS turma_descricao
FROM Alunos AS al
LEFT JOIN Turmas ON al.turma_id - Turmas.turma_id;

