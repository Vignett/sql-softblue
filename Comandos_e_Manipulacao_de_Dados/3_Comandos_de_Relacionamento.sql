USE curso_sql;

SELECT * FROM funcionarios;
SELECT * FROM veiculos;

SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.funcionario_id = f.id;

SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id;
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (null, "Moto", "SB-0003");

CREATE TABLE cpfs (
	id INT UNSIGNED NOT NULL,
    cpf VARCHAR(11),
    PRIMARY KEY (id),
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
);

ALTER TABLE cpfs CHANGE COLUMN cpf cpf VARCHAR(14);

INSERT INTO cpfs (id, cpf) VALUES ('1', '111.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES ('2', '222.222.222-22');
INSERT INTO cpfs (id, cpf) VALUES ('3', '333.333.333-33');
INSERT INTO cpfs (id, cpf) VALUES ('5', '555.555.555-55');

SELECT * FROM cpfs;

SELECT * FROM funcionarios f INNER JOIN cpfs c ON f.id = c.id;
SELECT * FROM funcionarios INNER JOIN cpfs USING(id);

CREATE TABLE clientes (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    quem_indicou INT UNSIGNED,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes(id)
);

INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'Carlos', NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'André', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Samuel', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Rafael', 1);

SELECT * FROM clientes;

SELECT a.nome, b.nome FROM clientes a JOIN clientes b ON a.quem_indicou = b.id;

SELECT * FROM funcionarios f 
INNER JOIN veiculos v ON v.funcionario_id = f.id 
INNER JOIN cpfs c ON c.id = f.id;

CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 1700;
SELECT * FROM funcionarios_a;

SELECT * FROM funcionarios_a;
CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 2000;