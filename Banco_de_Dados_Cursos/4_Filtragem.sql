use exercicio_c3;

SELECT * FROM alunos;
SELECT * FROM pedidos;
SELECT * FROM pedidos_detalhes;
SELECT pedido_codigo, SUM(valor) FROM pedidos_detalhes GROUP BY pedido_codigo;
SELECT * FROM instrutores;
SELECT * FROM cursos;


SELECT DISTINCT a.codigo, a.aluno, p.data_comp 
	FROM alunos a
    JOIN pedidos p
		ON p.aluno_codigo = a.codigo
	ORDER BY data_comp;
    
SELECT DISTINCT a.codigo, a.aluno, p.data_comp 
	FROM alunos a
    JOIN pedidos p
		ON p.aluno_codigo = a.codigo
	ORDER BY data_comp
    LIMIT 1;
    
SELECT DISTINCT a.codigo, a.aluno, p.data_comp 
	FROM alunos a
    JOIN pedidos p
		ON p.aluno_codigo = a.codigo
	ORDER BY data_comp DESC
    LIMIT 1;
    
SELECT DISTINCT a.codigo, a.aluno, p.data_comp 
	FROM alunos a
    JOIN pedidos p
		ON p.aluno_codigo = a.codigo
	ORDER BY data_comp
    LIMIT 2, 1;
    
SELECT COUNT(codigo) AS listagem_pedidos FROM pedidos;
SELECT SUM(valor) AS soma_pedidos FROM pedidos_detalhes;
SELECT ROUND(AVG(valor), 2) AS media_pedidos FROM pedidos_detalhes;

SELECT MAX(valor) FROM pedidos_detalhes;
SELECT MIN(valor) FROM pedidos_detalhes;

SELECT pedido_codigo, SUM(valor) AS valor_total FROM pedidos_detalhes GROUP BY pedido_codigo;

SELECT i.instrutor, COUNT(c.codigo) AS curso_quantidade
	FROM instrutores i
    JOIN cursos c
		ON c.instrutor_codigo = i.codigo
	GROUP BY i.codigo;

SELECT pd.pedido_codigo, a.aluno, SUM(pd.valor) AS pedido_soma
	FROM pedidos_detalhes pd
	JOIN pedidos p
		ON p.codigo = pd.pedido_codigo
	JOIN alunos a
		ON a.codigo = p.aluno_codigo
    GROUP BY pd.pedido_codigo
	HAVING SUM(pd.valor) > 500;
    
SELECT pd.pedido_codigo, a.aluno, COUNT(pd.curso_codigo) AS cursos_quantidade
	FROM pedidos_detalhes pd
	JOIN pedidos p
		ON p.codigo = pd.pedido_codigo
	JOIN alunos a
		ON a.codigo = p.aluno_codigo
    GROUP BY pd.pedido_codigo
    HAVING COUNT(pd.curso_codigo) > 2;

SELECT aluno, endereco FROM alunos WHERE endereco LIKE "Av%";
SELECT curso FROM cursos WHERE curso LIKE "Java%";


SELECT * FROM tipos;

SELECT curso, valor FROM cursos ORDER BY valor LIMIT 1;

SELECT tipo_codigo, curso FROM cursos
WHERE tipo_codigo IN 
	(
    SELECT codigo FROM tipos WHERE tipo = "Programação"
    );
    
SELECT tipo_codigo, curso FROM cursos
WHERE EXISTS 
	(
    SELECT codigo FROM tipos WHERE tipo = "Programação"
    );
    
SELECT i.instrutor, SUM(c.valor) 
	FROM instrutores i
	JOIN cursos c
		ON c.instrutor_codigo = i.codigo
	GROUP BY i.instrutor;

CREATE VIEW alunos_compras AS
SELECT a.aluno, SUM(pd.valor)
	FROM pedidos_detalhes pd
    JOIN pedidos p
		ON p.codigo = pd.curso_codigo
	JOIN alunos a
		ON a.codigo = p.aluno_codigo
	GROUP BY a.aluno;
        
SELECT * FROM alunos_compras;
DROP VIEW alunos_compras;