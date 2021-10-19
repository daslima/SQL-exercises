--O setor de vendas precisa de um relat�rio para saber quais produtos est�o sobrando em estoque.

--Para voc� ajudar o setor de vendas, exiba o nome do produto e o nome da categoria, 
--para os produtos cuja quantidade seja maior que 100 e o c�digo da categoria seja 1,2,3,6 ou 9. Mostre essas informa��es em ordem crescente pelo c�digo da categoria.

--Exemplo de sa�da
--name	name
--Red Chair	Super Luxury

IF OBJECT_ID ('TEMPDB.DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS;
IF OBJECT_ID ('TEMPDB.DBO.#CATEGORIES','U') IS NOT NULL DROP TABLE #CATEGORIES;

CREATE TABLE #PRODUCTS (
	[ID] INT IDENTITY  PRIMARY KEY,
	[NAME] VARCHAR(255),
	[AMOUNT] NUMERIC (6,2),
	[PRICE] NUMERIC (6,2),
	[ID_CATEGORY] INT
)

CREATE TABLE #CATEGORIES (
	[ID] INT IDENTITY PRIMARY KEY ,
	[NAME] VARCHAR(255)
)

INSERT INTO #CATEGORIES ([NAME]) VALUES
('Superior'),
('Super Luxury'),
('Modern'),
('Nerd'),
('Infantile'),
('Robust'),
('Wood')


INSERT INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE],[ID_CATEGORY])  VALUES
('Blue Chair', 30,300,9),
('Red Chair', 200,2150,2),
('Disney Wardrobe', 400, 829.50, 4),
('Blue Toaster', 20, 9.90, 3),
('Solar Panel', 30, 3000.25, 4)


SELECT
	P.[NAME],
	C.[NAME]
FROM 
	#PRODUCTS P WITH(NOLOCK)
INNER JOIN
	#CATEGORIES C WITH(NOLOCK) ON (C.ID = P.ID_CATEGORY)
WHERE
	(P.AMOUNT > 100) AND (C.ID IN (1,2,3,6,9))
ORDER BY
	C.ID