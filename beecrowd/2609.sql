--Como de costume o setor de vendas está fazendo uma análise de quantos produtos temos em estoque, e você poderá ajudar eles.
--Então seu trabalho será exibir o nome e a quantidade de produtos de cada uma categoria.

IF OBJECT_ID ('TEMPDB.DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS;
IF OBJECT_ID('TEMPDB.DBO.#CATEGORIES','U') IS NOT NULL DROP TABLE #CATEGORIES

CREATE TABLE #CATEGORIES (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155)
)

CREATE TABLE #PRODUCTS (
	[ID]INT IDENTITY,
	[NAME] VARCHAR(155),
	[AMOUNT] NUMERIC(18,2),
	[PRICE] NUMERIC(18,2),
	[ID_CATEGORIES] INT
)

INSERT INTO #CATEGORIES ([NAME]) VALUES
('wood'),
('luxury'),
('vintage'),
('modern'),
('super luxury')


INSERT INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE],[ID_CATEGORIES]) VALUES
('Two-doors wardrobe',100,800,1),
('Dining table',1000,560,3),
('Towel holder',10000,25.50,4),
('Computer desk',350,320.50,2),
('Chair',3000,210.64,4),
('Single bed',750,460,1)

SELECT
	C.[NAME],
	SUM(P.[AMOUNT]) AS AMOUNT
FROM
	#PRODUCTS P WITH(NOLOCK)
INNER JOIN
	#CATEGORIES C WITH(NOLOCK) ON (C.ID = P.ID_CATEGORIES)
GROUP BY
	C.[NAME]

