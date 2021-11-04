--O setor financeiro da nossa empresa, está querendo saber os menores e maiores valores dos produtos, que vendemos.
--Para isso exiba somente o maior e o menor preço da tabela produtos.

IF OBJECT_ID ('TEMPDB.DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS;

CREATE TABLE #PRODUCTS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[AMOUNT] NUMERIC (18,2),
	[PRICE] NUMERIC(18,2)
)

INSERT INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE]) VALUES 
('Two-doors wardrobe',100,800),
('Dining table',1000,560),
('Towel holder',10000,25.50),
('Computer desk',350,320.50),
('Chair',3000,210.64),
('Single bed',750,460)


SELECT
	MAX([PRICE]) AS Price, 
	MIN([PRICE]) AS Price
FROM
	#PRODUCTS WITH(NOLOCK)