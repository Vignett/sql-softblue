CREATE DATABASE exercicio_c3;

USE exercicio_c3;

CREATE TABLE tipos (
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(20) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE instrutores (
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    instrutor VARCHAR(45) NOT NULL,
    telefone VARCHAR(10) NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE cursos (
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipo_codigo INT UNSIGNED DEFAULT NULL,
    instrutor_codigo INT UNSIGNED DEFAULT NULL,
    curso VARCHAR(30) NOT NULL,
    valor DOUBLE NOT NULL,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_curso_tipo FOREIGN KEY (tipo_codigo) REFERENCES tipos (codigo),
    CONSTRAINT fk_instrutor_tipo FOREIGN KEY (instrutor_codigo) REFERENCES instrutores (codigo)
);

CREATE TABLE alunos (
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    aluno VARCHAR(45) NOT NULL,
    endereco VARCHAR(50) NULL,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE pedidos (
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    aluno_codigo INT UNSIGNED DEFAULT NULL,
    data_hora DATETIME NOT NULL,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_aluno_pedido FOREIGN KEY (aluno_codigo) REFERENCES alunos (codigo)
);

CREATE TABLE pedidos_detalhes (
	curso_codigo INT UNSIGNED DEFAULT NULL,
	pedido_codigo INT UNSIGNED DEFAULT NULL,
	valor DOUBLE NOT NULL,
    CONSTRAINT fk_curso_pedidos_detalhes FOREIGN KEY (curso_codigo) REFERENCES cursos (codigo),
    CONSTRAINT fk_pedido_pedidos_detalhes FOREIGN KEY (pedido_codigo) REFERENCES pedidos (codigo)
);

ALTER TABLE alunos ADD COLUMN data_nascimento VARCHAR(10);
ALTER TABLE alunos CHANGE COLUMN data_nascimento nascimento DATE;

CREATE INDEX alunos ON alunos (aluno);

ALTER TABLE instrutores ADD COLUMN email VARCHAR(100);

CREATE INDEX instrutores ON cursos (instrutor_codigo);
ALTER TABLE instrutores DROP COLUMN email;

ALTER TABLE pedidos DROP COLUMN data_hora;
ALTER TABLE pedidos ADD COLUMN data_comp DATE;
ALTER TABLE pedidos ADD COLUMN hora_comp TIME;
DELETE FROM pedidos WHERE codigo = 1;

SELECT * FROM tipos;
SELECT * FROM instrutores;
SELECT * FROM cursos;
SELECT * FROM alunos;
SELECT * FROM pedidos;
SELECT * FROM pedidos_detalhes;