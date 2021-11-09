--Na empresa que voc� trabalha est� sendo feito um levantamento sobre os valores dos produtos que s�o comercializados.

--Para ajudar o setor que est� fazendo esse levantamento voc� deve calcular e exibir o valor m�dio do pre�o dos produtos.

--OBS: Mostrar o valor com dois n�meros ap�s o ponto.

IF OBJECT_ID ('TEMPDB.DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS;

CREATE TABLE #PRODUCTS (
	[ID]INT IDENTITY,
	[NAME] VARCHAR(155),
	[AMOUNT] NUMERIC(18,2),
	[PRICE] NUMERIC(18,2)
)

INSERT INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE]) VALUES
('Two-doors wardrobe',100,800),
('Dining table', 1000,560),
('Towel holder',10000,25.50),
('Computer desk',350,320.50),
('Chair',3000,210.64),
('Single bed',750,460)


SELECT
	FORMAT(AVG([PRICE]),'#.00') AS PRICE
FROM 
	#PRODUCTS WITH(NOLOCK)

