--Antigamente a locadora fez um evento em que vários filmes estavam em promoção, queremos saber que filmes eram esses.
--Seu trabalho para nós ajudar é selecionar o ID e o nome dos filmes cujo preço for menor que 2.00.

IF OBJECT_ID ('TEMPDB.DBO.#MOVIES','U') IS NOT NULL DROP TABLE #MOVIES;
IF OBJECT_ID ('TEMPDB.DBO.#PRICES','U') IS NOT NULL DROP TABLE #PRICES;


CREATE TABLE #PRICES (
	[ID] INT IDENTITY,
	[CATEGORY] VARCHAR(155),
	[VALUE] NUMERIC(18,2)
)

CREATE TABLE #MOVIES (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[ID_PRICES] NUMERIC(18,2)
)

INSERT INTO #PRICES ([CATEGORY],[VALUE]) VALUES
('Releases',3.50),
('Bronze Seal',2.00),
('Silver Seal',2.50),
('Gold Seal',3.00),
('Promotion',1.50)

INSERT INTO #MOVIES ([NAME],[ID_PRICES]) VALUES
('Batman',3),
('The Battle of the Dark River',3),
('White Duck',5),
('Breaking Barriers',4),
('The Two Hours',2)

SELECT 
	M.[ID],
	M.[NAME]
FROM 
	#MOVIES M WITH(NOLOCK)
INNER JOIN
	#PRICES P WITH(NOLOCK) ON (P.[ID] = M.[ID_PRICES])
WHERE
	P.[VALUE] < 2.00