USE exercicio_c3;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO tipos (tipo) VALUES ('Banco de dados');
INSERT INTO tipos (tipo) VALUES ('Programação');
INSERT INTO tipos (tipo) VALUES ('Modelagem de dados');

INSERT INTO instrutores (codigo, instrutor, telefone) VALUE (1, 'André Milani', '1111-1111');
INSERT INTO instrutores (codigo, instrutor, telefone) VALUE (2, 'Carlos Tosin', '1212-1212');

INSERT INTO cursos (codigo, tipo_codigo, instrutor_codigo, curso, valor) VALUES (1, 2, 2, 'Java Fundamentos', 270);
INSERT INTO cursos (codigo, tipo_codigo, instrutor_codigo, curso, valor) VALUES (2, 2, 2, 'Java Avançado', 330);
INSERT INTO cursos (codigo, tipo_codigo, instrutor_codigo, curso, valor) VALUES (3, 1, 1, 'SQL Completo', 170);
INSERT INTO cursos (codigo, tipo_codigo, instrutor_codigo, curso, valor) VALUES (4, 2, 1, 'Php Básico', 270);
INSERT INTO cursos (codigo, tipo_codigo, instrutor_codigo, curso, valor) VALUES (5, 2, 1, 'Python Fundamentos', 270);
INSERT INTO cursos (codigo, tipo_codigo, instrutor_codigo, curso, valor) VALUES (6, 3, 2, 'Análise de Dados com Power BI', 300);
INSERT INTO cursos (codigo, tipo_codigo, instrutor_codigo, curso, valor) VALUES (7, 3, 2, 'Big Data Fundamentos', 100);

INSERT INTO alunos (aluno, endereco, email) VALUES ('José', 'Rua XV de Novembro 72', 'jose@softblue.com.br');
INSERT INTO alunos (aluno, endereco, email) VALUES ('Wagner', 'Av. Paulista', 'wagner@softblue.com.br');
INSERT INTO alunos (aluno, endereco, email) VALUES ('Emílio', 'Rua Lajes 103, ap: 701', 'emilio@softblue.com.br');
INSERT INTO alunos (aluno, endereco, email) VALUES ('Cris', 'Rua Tauney 22', 'cris@softblue.com.br');
INSERT INTO alunos (aluno, endereco, email) VALUES ('Regina', 'Rua Salles 305', 'regina@softblue.com.br');
INSERT INTO alunos (aluno, endereco, email) VALUES ('Fernando', 'Av. Central 30', 'fernando@softblue.com.br');

INSERT INTO pedidos (codigo, aluno_codigo, data_comp, hora_comp) VALUES (1, 2, '2010-04-15', '11:23:32');
INSERT INTO pedidos (codigo, aluno_codigo, data_comp, hora_comp) VALUES (2, 2, '2010-04-15', '14:36:21');
INSERT INTO pedidos (codigo, aluno_codigo, data_comp, hora_comp) VALUES (3, 3, '2010-04-16', '11:17:45');
INSERT INTO pedidos (codigo, aluno_codigo, data_comp, hora_comp) VALUES (4, 4, '2010-04-17', '14:27:22');
INSERT INTO pedidos (codigo, aluno_codigo, data_comp, hora_comp) VALUES (5, 5, '2010-04-18', '11:18:19');
INSERT INTO pedidos (codigo, aluno_codigo, data_comp, hora_comp) VALUES (6, 6, '2010-04-19', '13:47:35');
INSERT INTO pedidos (codigo, aluno_codigo, data_comp, hora_comp) VALUES (7, 6, '2010-04-20', '18:13:44');

INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (1, 1, 270);
INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (1, 2, 330);
INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (2, 1, 270);
INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (2, 2, 330);
INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (2, 3, 170);
INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (3, 4, 270);
INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (4, 2, 330);
INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (4, 4, 270);
INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (5, 3, 170);
INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (6, 3, 170);
INSERT INTO pedidos_detalhes (curso_codigo, pedido_codigo, valor) VALUES (7, 4, 270);

SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM tipos;
SELECT curso FROM cursos;
SELECT curso, valor FROM cursos WHERE valor > 200;
SELECT curso, valor FROM cursos WHERE valor > 200 AND valor < 300;
SELECT * FROM pedidos WHERE data_comp = '2010-04-15';
SELECT * FROM pedidos WHERE data_comp >= '2010-04-15' AND data_comp <= '2010-04-18';

UPDATE alunos SET endereco = 'Av. Brasil 778' WHERE aluno = 'José';
UPDATE alunos SET email = 'cristiano@softblue.com.br' WHERE aluno = 'Cris';
UPDATE cursos SET valor = ROUND(valor * 1.1, 2) WHERE valor < 300;
UPDATE cursos SET curso = 'Php Fundamentos' WHERE codigo = 4;