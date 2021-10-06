--You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!
--The total score of a hacker is the sum of their maximum scores for all of the challenges. 
--Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, 
--then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.

--Sample Output

--4071 Rose 191
--74842 Lisa 174
--84072 Bonnie 100
--4806 Angela 89
--26071 Frank 85
--80305 Kimberly 67
--49438 Patrick 43

--Hacker 4071 submitted solutions for challenges 19797 and 49593, so the total score = 95 + MAX(43,96) = 191

--Hacker 74842 submitted solutions for challenges 19797 and 63132, so the total score = MAX(98,5) + 76 = 174

--Hacker 84072 submitted solutions for challenges 49593 and 63132, so the total score = 100 + 0 = 100

--The total scores for hackers 4806, 26071, 80305, and 49438 can be similarly calculated.

IF OBJECT_ID ('TEMPDB.DBO.#TBL_HACKER','U') IS NOT NULL DROP TABLE #TBL_HACKER;
IF OBJECT_ID ('TEMPDB.DBO.#TBL_SUBMISSION','U') IS NOT NULL DROP TABLE #TBL_SUBMISSION;


CREATE TABLE #TBL_HACKER (
	[hacker_id] INT PRIMARY KEY,
	[name] varchar(30)
)

CREATE TABLE #TBL_SUBMISSION (
	[submission_id] INT PRIMARY KEY,
	[challenge_id] INT,
	[score] int,
	[hacker_id] INT,
	CONSTRAINT FK_tESTE FOREIGN KEY (hacker_id) references #TBL_HACKER(hacker_id)
)


INSERT INTO #TBL_HACKER ([hacker_id],[name]) VALUES
(4071,'Rose'),
(4806,'Angela'),
(26071,'Frank'),
(49438,'Patrick'),
(74842,'Lisa'),
(80305,'Kimberly'),
(84072,'Bonnie'),
(87868,'Michael'),
(92118,'Todd'),
(95895,'Joe')

INSERT INTO #TBL_SUBMISSION ([submission_id],[hacker_id],[challenge_id],[score]) VALUES
(67194,74842,63132,76),
(64479,74842,19797,98),
(40742,26071,49593,20),
(17513,4806,49593,32),
(69846,80305,19797,19),
(41002,26071,89343,36),
(52826,49438,49593,9),
(31093,26071,19797,2),
(81614,84072,49593,100),
(44829,26071,89343,17),
(75147,80305,49593,48),
(14115,4806,49593,76),
(6943,4071,19797,95),
(12855,4806,25917,13),
(73343,80305,49593,42),
(84264,84072,63132,0),
(9951,4071,49593,43),
(53795,49438,19797,34),
(26363,26071,19797,29),
(10063,4071,49593,96)

SELECT
	TS.challenge_id,
	MAX(TS.score),
	TH.[name]
FROM 
	#TBL_SUBMISSION TS WITH(NOLOCK)
INNER JOIN 
	#TBL_HACKER TH WITH(NOLOCK) ON (TH.hacker_id = TS.hacker_id)
GROUP BY
	TS.challenge_id,
	TH.[name]


SELECT
	-- SOMANDO O TOTAL DE SCORE POR HACKER
	Dados.hacker_id,
	Dados.[name],
	SUM(Dados.total) AS Score
FROM ( 
		-- FILTRANDO OS DADOS , PARA QUE SÓ PEGUE O MAX SCORE DE CADA DESAFIO REALIZADO
		SELECT
			TH.hacker_id,
			TS.challenge_id,
			MAX(TS.score) as total,
			TH.[name]
		FROM 
			#TBL_SUBMISSION TS WITH(NOLOCK)
		INNER JOIN 
			#TBL_HACKER TH WITH(NOLOCK) ON (TH.hacker_id = TS.hacker_id)
		GROUP BY
			TH.hacker_id,
			TH.[name],
			TS.challenge_id
	 ) AS Dados
WHERE Dados.total > 0
GROUP BY
	Dados.hacker_id,
	Dados.[name]
ORDER BY
	Score DESC, hacker_id ASC