--A Universidade Tecnológica de Marte está com seu concurso aberto para Pesquisadores. 
--Porém o computador que processava os dados dos candidatos estragou. Você deve mostrar a lista dos candidatos, contendo o nome do candidato e a sua pontuação final 
--(com duas casas decimais após a vírgula). 
--Lembre-se de mostrar a lista ordenada pela pontuação do candidato (maior pontuação no topo da lista).
--A pontuação do candidato é o resultado da média ponderada descrita abaixo:

IF OBJECT_ID ('TEMPDB.DBO.#CANDIDATE','U') IS NOT NULL DROP TABLE #CANDIDATE;
IF OBJECT_ID ('TEMPDB.DBO.#SCORE','U') IS NOT NULL DROP TABLE #SCORE;

CREATE TABLE #CANDIDATE (
	ID INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(50),
)

CREATE TABLE #SCORE (
	MATH DECIMAL(6,2),
	SPECIFIC DECIMAL(6,2),
	PROJECT_PLAN DECIMAL(6,2),
	CANDIDATE_ID INT IDENTITY
)

INSERT INTO #CANDIDATE ([NAME]) VALUES
('Michael P Cannon'),
('Barbra J Cable'),
('Ronald D Jones'),
('Timothy K Fitzsimmons'),
('Ivory B Morrison'),
('Sheila R Denis'),
('Edward C Durgan'),
('William K Spencer'),
('Donna D Pursley'),
('Ann C Davis')

INSERT INTO #SCORE (MATH,SPECIFIC,PROJECT_PLAN) VALUES
(76,58,21),
(4,5,22),
(15,59,12),
(41,42,99),
(22,90,9),
(82,77,15),
(82,99,56),
(11,4,22),
(16,29,94),
(1,7,59)


SELECT
	C.[NAME],
	CAST(AVG(((S.MATH * 2)  + (S.SPECIFIC * 3 ) + ( S.PROJECT_PLAN * 5)) / 10) AS NUMERIC(10,2)) AS AVG
FROM
	#CANDIDATE C WITH(NOLOCK)
INNER JOIN
	#SCORE S WITH(NOLOCK) ON (S.CANDIDATE_ID = C.ID)
GROUP BY
	C.[NAME]
ORDER BY
	AVG DESC