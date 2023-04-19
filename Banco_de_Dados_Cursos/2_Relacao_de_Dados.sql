USE exercicio_c3;


SELECT c.curso, t.tipo 
	FROM cursos c 
	JOIN tipos t 
		ON c.tipo_codigo = t.codigo;

SELECT c.curso, t.tipo, i.instrutor, i.telefone 
	FROM cursos c 
	JOIN tipos t ON c.tipo_codigo = t.codigo
    JOIN instrutores i ON c.instrutor_codigo = i.codigo;

SELECT p.codigo, p.data_comp, p.hora_comp, pd.curso_codigo
	FROM pedidos p
    JOIN pedidos_detalhes pd ON p.aluno_codigo = pd.pedido_codigo;

SELECT p.codigo, p.data_comp, p.hora_comp, c.curso
	FROM pedidos p
    JOIN cursos c ON p.codigo = c.codigo;

SELECT p.codigo, p.data_comp, a.aluno, c.curso
	FROM pedidos p
    JOIN alunos a ON p.aluno_codigo = a.codigo
    JOIN cursos c ON p.codigo = c.codigo;



CREATE VIEW cursos_programacao AS
	SELECT curso, valor FROM cursos WHERE tipo_codigo = 2;
    
SELECT * FROM cursos_programacao;


CREATE VIEW cursos_informacao AS
	SELECT c.curso, c.valor, i.instrutor
		FROM cursos c
        JOIN instrutores i ON c.instrutor_codigo = i.codigo;

SELECT * FROM cursos_informacao;


CREATE VIEW pedidos_informacao AS
	SELECT a.aluno, p.data_comp, pd.pedido_codigo
		FROM pedidos p
        JOIN alunos a ON p.aluno_codigo = a.codigo
        JOIN pedidos_detalhes pd ON p.codigo = pd.pedido_codigo;

SELECT * FROM pedidos_informacao;

DROP VIEW pedidos_informacao;