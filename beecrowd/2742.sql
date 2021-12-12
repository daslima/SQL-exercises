--Richard é um cientista muito famoso por suas teorias do multiverso, 
--onde ele descreve que todo o conjunto hipotético de universos paralelos podem ser representados por meio de tabelas em um banco de dados. 
--E graças a essa teoria você tem um emprego.
--A sua primeira tarefa é selecionar todos os possíveis Richards das dimensões C875 e C774, junto a sua probabilidade de existência (o fator N) 
--com a precisão de 3 casas decimais.
--Lembre-se que (o fator N) é calculado multiplicando o valor omega por 1,618. Os dados devem ser ordenados pelo menor valor do campo omega.

IF OBJECT_ID ('TEMPDB.DBO.#DIMENSIONS','U') IS NOT NULL DROP TABLE #DIMENSIONS;
IF OBJECT_ID ('TEMPDB.DBO.#LIFE_REGISTRY','U') IS NOT NULL DROP TABLE #LIFE_REGISTRY;

CREATE TABLE #DIMENSIONS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155)
)

CREATE TABLE #LIFE_REGISTRY(
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[OMEGA] DECIMAL(18,2),
	[DIMENSIONS_ID] INT
)

INSERT INTO #DIMENSIONS ([NAME]) VALUES
('C774'),
('C784'),
('C794'),
('C824'),
('C875')

INSERT INTO #LIFE_REGISTRY ([NAME],[OMEGA],[DIMENSIONS_ID]) VALUES
('Richard Postman',5.6,2),
('Simple Jelly',1.4,1),
('Richard Gran Master',2.5,1),
('Richard Turing',6.4,4),
('Richard Strall',1.0,3)

SELECT
	L.[NAME],
	FORMAT(L.[OMEGA] * 1.618 ,'##.000') AS 'Fator N',
	CONVERT(DECIMAL(18,3),(L.[OMEGA] * 1.618)) AS 'TESTE'
FROM 
	#LIFE_REGISTRY L WITH(NOLOCK)
INNER JOIN
	#DIMENSIONS D WITH(NOLOCK) ON (D.ID = L.DIMENSIONS_ID)
WHERE
	LOWER(L.[NAME]) LIKE 'RICHARD%' AND
	D.[NAME] = 'C774' OR D.[NAME] = 'C875'