--Seu amigo Zé Maria se encontra em uma emboscada porque fez um update sem where e acabou zerando todos os valores da coluna price. 
--Para sua sorte, o preço pode ser calculado novamente sabendo o tipo do produto.

--Se o tipo do produto é igual A, o preço será 20.0
--Se o tipo do produto é igual B, o preço será 70.0
--Se o tipo do produto é igual C, o preço será 530.5

--O seu trabalho é mostrar o nome e o preço de todos os produtos. Você também deve mostrar os produtos em conjuntos com a seguinte ordem: 
--primeiro todos os produtos do tipo A, segundo o tipo B, e por último o tipo C. Além disso, os produtos de cada um dos conjuntos (A,B,C), 
--devem está ordenados pelo seu ID de forma decrescente.

IF OBJECT_ID ('TEMPDB.DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS;

CREATE TABLE #PRODUCTS(
	[ID] INT IDENTITY,
	[NAME] VARCHAR(50),
	[TYPE] CHAR,
	[PRICE] NUMERIC (6,2)
)

INSERT INTO #PRODUCTS ([NAME],[TYPE],[PRICE]) VALUES 
('Monitor','B',0),
('Headset','A',0),
('PC Case','A',0),
('Computer Desk','C',0),
('Gaming Chair','C',0),
('Mouse','A',0)

SELECT
	[NAME],
	CASE	
		WHEN [TYPE] = 'A' THEN  20 
		WHEN [TYPE] = 'B' THEN	70 
		WHEN [TYPE] = 'C' THEN  530.5 
	END AS Price
FROM	
	#PRODUCTS
ORDER BY
	[TYPE] ASC