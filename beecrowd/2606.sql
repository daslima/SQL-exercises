--Quando os dados foram migrados de Banco de Dados, houve um pequeno mal-entendido por parte do antigo DBA.
--Seu chefe precisa que você exiba o código e o nome dos produtos, cuja categoria inicie com 'super'.

IF OBJECT_ID('TEMPDB.DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS
IF OBJECT_ID('TEMPDB.DBO.#CATEGORIES','U') IS NOT NULL DROP TABLE #CATEGORIES

CREATE TABLE #PRODUCTS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(155),
	[AMOUNT] NUMERIC (18,2),
	[PRICE] NUMERIC (18,2),
	[ID_CATEGORIES] INT
)

CREATE TABLE #CATEGORIES (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(155)
)

INSERT INTO #CATEGORIES ([NAME]) VALUES
('old stock'),
('new stock'),
('modern'),
('commercial'),
('recyclable'),
('executive'),
('superior'),
('wood'),
('super luxury'),
('vintage')

INSERT INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE],[ID_CATEGORIES]) VALUES
('Lampshade',100,800,4),
('Table for painting', 1000,560,9),
('Notebook desk',10000,25.50,9),
('Computer desk',350,320.50,6),
('Chair',3000,210.64,9),
('Home alarm',750,460,4)


SELECT 
	P.[ID],
	P.[NAME]
FROM
	#PRODUCTS P WITH(NOLOCK)
INNER JOIN
	#CATEGORIES C WITH(NOLOCK) ON (C.ID = P.ID_CATEGORIES)
WHERE
	UPPER(C.[NAME]) LIKE 'SUPER%'



