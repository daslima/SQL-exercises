--A Liga Internacional de Escavação Subterrânea já é um sucesso entre os esportes alternativos, 
--porém todos que trabalham na organização do evento trabalham com escavação e não computação. 
--Então você foi contratado para solucionar o problema da Liga.

--Selecione os três primeiros colocados da lista com a frase inicial Podium: e também, os dois últimos times que serão rebaixados 
--para série B com a frase inicial Demoted:

IF OBJECT_ID ('TEMPDB.DBO.#LEAGUE','U') IS NOT NULL DROP TABLE #LEAGUE;
IF OBJECT_ID ('TEMPDB.DBO.#PODIUM','U') IS NOT NULL DROP TABLE #PODIUM;
IF OBJECT_ID ('TEMPDB.DBO.#DEMOTED','U') IS NOT NULL DROP TABLE #DEMOTED;

CREATE TABLE #LEAGUE(
	[POSITION]  INT IDENTITY,
	[TEAM] VARCHAR(155)
)

INSERT INTO #LEAGUE ([TEAM]) VALUES
('The Quack Bats'),
('The Responsible Hornets'),
('The Bawdy Dolphins'),
('The Abstracted Sharks'),
('The Nervous Zebras'),
('The Oafish Owls'),
('The Unequaled Bison'),
('The Keen Kangaroos'),
('The Left Nightingales'),
('The Terrific Elks'),
('The Lumpy Frogs'),
('The Swift Buffalo'),
('The Big Chargers'),
('The Rough Robins'),
('The Silver Crocs')

CREATE TABLE #PODIUM (
	[NAME] VARCHAR(155)
)

CREATE TABLE #DEMOTED (
	[NAME] VARCHAR(155)
)

------------------------------------------------------------------------------

INSERT INTO #PODIUM ([NAME])
SELECT TOP 3
	'Podium:' + [TEAM]
FROM
	#LEAGUE WITH(NOLOCK)
ORDER BY 
	[POSITION] ASC


-------------------------------------------------------------------------------
INSERT INTO #DEMOTED ([NAME])
SELECT TOP 2
	'Demoted:' + RESULTADO.TEAM
FROM
	(
		SELECT TOP 2 * FROM #LEAGUE ORDER BY [POSITION] DESC
	) AS RESULTADO
ORDER BY 
	RESULTADO.POSITION ASC


------------------------------------------------------------------------------
SELECT * FROM #PODIUM
	UNION ALL
SELECT * FROM #DEMOTED 





