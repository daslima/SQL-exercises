--O setor financeiro da empresa precisa de um relatório que mostre o código e o nome dos produtos cujo preço são menores que 10 ou maiores que 100.


IF OBJECT_ID('TEMPDB..DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS

CREATE TABLE #PRODUCTS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(155),
	[AMOUNT] NUMERIC(18,2),
	[PRICE] NUMERIC(18,2)
)

INSERT INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE]) VALUES 
('Two-door wardrobe',100,80),
('Dining table',1000,560),
('Towel holder', 10000,5.50),
('Computer desk',350, 100),
('Chair',3000,210.64)

SELECT
	[ID] AS CODIGO,
	[NAME]
FROM
	#PRODUCTS WITH(NOLOCK)
WHERE
	[PRICE] < 10 OR PRICE > 100