CREATE DATABASE libbs_school;

USE libbs_school;
CREATE TABLE professor (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(120), 
	idade INT
); 


CREATE TABLE aluno (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(120),
    idade INT
);

CREATE TABLE turma (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_aluno INT,
    id_professor INT,


    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_professor) REFERENCES professor(id)
);

INSERT INTO aluno (nome, idade) VALUES
('rafael', 10), -- 1
('jorge', 15), -- 2
('victor', 18), -- 3
('julia', 18), -- 4
('nakajima', 29); -- 5

INSERT INTO professor (nome, idade) VALUES 
('samuel', 30),
('giovani', 30),
('wleton', 30),
('arthur', 22);

INSERT INTO turma (id_professor, id_aluno) VALUES
(2, 4),
(1, 3),
(3, 2),
(4, 1),
(3, 2),
(1, 1),
(4, 3),
(2, 2),
(3, 1);

-- Aluno -> Turma
-- aluno.idade
SELECT al.nome, al.idade, turma.id_professor
FROM aluno AS al
INNER JOIN turma ON turma.id_aluno = al.id; -- aluno.id

-- Professor -> Turma
SELECT prof.nome, prof.idade, turma.id_aluno
FROM professor AS prof
INNER JOIN turma ON turma.id_professor = prof.id; -- professor.id

-- Professor -> Turma
SELECT prof.nome, prof.idade, turma.id_aluno
FROM professor AS prof
INNER JOIN turma ON turma.id_professor = prof.id;

-- Aluno -> Turma -> Professor
-- aluno.idade
-- Professor -> Turma
SELECT al.nome, al.idade, professor.nome
FROM aluno AS al
INNER JOIN turma ON turma.id_professor = al.id
INNER JOIN professor ON turma.id_professor = professor.id;



