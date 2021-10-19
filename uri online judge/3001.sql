--Seu amigo Z� Maria se encontra em uma emboscada porque fez um update sem where e acabou zerando todos os valores da coluna price. 
--Para sua sorte, o pre�o pode ser calculado novamente sabendo o tipo do produto.

--Se o tipo do produto � igual A, o pre�o ser� 20.0
--Se o tipo do produto � igual B, o pre�o ser� 70.0
--Se o tipo do produto � igual C, o pre�o ser� 530.5

--O seu trabalho � mostrar o nome e o pre�o de todos os produtos. Voc� tamb�m deve mostrar os produtos em conjuntos com a seguinte ordem: 
--primeiro todos os produtos do tipo A, segundo o tipo B, e por �ltimo o tipo C. Al�m disso, os produtos de cada um dos conjuntos (A,B,C), 
--devem est� ordenados pelo seu ID de forma decrescente.

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