  SELECT aluno.primeiro_nome,
         aluno.ultimo_nome,
		 COUNT(aluno_curso.curso_id) numero_cursos
    FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
GROUP BY 1, 2
ORDER BY numero_cursos DESC
   LIMIT 1;
   
  SELECT curso.nome,
  		 COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
	JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1
ORDER BY numero_alunos DESC
   LIMIT 1;

SELECT aluno.primeiro_nome,
	   aluno.ultimo_nome,
	   COUNT(aluno_curso.curso_id) numero_cursos
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
GROUP BY 1, 2
ORDER BY numero_cursos DESC;

SELECT categoria.nome AS "Categoria mais requisitada",
	   COUNT(aluno_curso.curso_id) numero_vezes
FROM categoria
JOIN curso ON curso.categoria_id = categoria.id
JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1
ORDER BY numero_vezes DESC
LIMIT 1;

SELECT * FROM curso WHERE categoria_id IN(1,2);

SELECT * FROM curso WHERE categoria_id IN(
	SELECT id FROM categoria WHERE nome NOT LIKE '% %'
);

SELECT categoria.nome AS categoria,
        COUNT(curso.id) as numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria;

SELECT categoria.nome AS categoria,
			COUNT(curso.id) as numero_cursos
		FROM categoria
		JOIN curso ON curso.categoria_id = categoria.id
		GROUP BY categoria
		HAVING COUNT(curso.id) > 3;

SELECT categoria
FROM (
		SELECT categoria.nome AS categoria,
			COUNT(curso.id) as numero_cursos
		FROM categoria
		JOIN curso ON curso.categoria_id = categoria.id
		GROUP BY categoria
) AS categoria_cursos
WHERE numero_cursos > 3;

SELECT nome_curso,
	   cursos.numero_alunos
FROM (
	SELECT curso.nome AS nome_curso,
         COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	GROUP BY 1
) AS cursos
WHERE numero_alunos > 2
ORDER BY numero_alunos DESC;