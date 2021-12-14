--O semestre acabou na Universidade do Sul da Transilvânia. Todos os cursos tiveram suas notas fechadas, 
--apenas a disciplina de Alquimia 104 não teve a lista de alunos aprovados.
--Portanto, você deverá mostrar a frase 'Approved: ' junto com o nome do aluno e a sua nota, para os alunos que foram aprovados (grade ≥7).
--Lembre-se de ordenar a lista pela maior nota.

IF OBJECT_ID ('TEMPDB.DBO.#STUDENTS','U') IS NOT NULL DROP TABLE #STUDENTS;

CREATE TABLE #STUDENTS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[GRADE] NUMERIC(18,1)
)

INSERT INTO #STUDENTS ([NAME],[GRADE]) VALUES
('Terry B. Padilla',7.3),
('William S. Ray',0.6),
('Barbara A. Gongora',5.2),
('Julie B. Manzer',6.7),
('Teresa J. Axtell',4.6),
('Ben M. Dantzler',9.6)

SELECT
	'Approved: ' + [NAME] AS 'NAME',
	[GRADE]
FROM 
	#STUDENTS
WHERE
	[GRADE] >= 7
ORDER BY
	[GRADE] DESC