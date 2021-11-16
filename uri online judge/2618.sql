--O setor de importa��o da nossa empresa precisa de um relat�rio sobre a importa��o de produtos do nosso fornecedor Sansul.
--Sua tarefa � exibir o nome dos produtos, o nome do fornecedor e o nome da categoria, para os produtos fornecidos pelo fornecedor 
--�Sansul SA� e cujo nome da categoria seja 'Imported'.


IF OBJECT_ID ('TEMPDB.DBO.#PROVIDERS','U') IS NOT NULL DROP TABLE #PROVIDERS;
IF OBJECT_ID ('TEMPDB.DBO.#CATEGORIES','U') IS NOT NULL DROP TABLE #CATEGORIES;
IF OBJECT_ID ('TEMPDB.DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS;

CREATE TABLE #PROVIDERS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(55),
	[STREET] VARCHAR(155),
	[CITY] VARCHAR(155),
	[STATE] CHAR(2)
)

CREATE TABLE #CATEGORIES (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155)
)

CREATE TABLE #PRODUCTS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[AMOUNT] NUMERIC(18,2),
	[PRICE] NUMERIC(18,2),
	[ID_PROVIDERS] INT,
	[ID_CATEGORIES] INT
)

INSERT INTO #PROVIDERS ([NAME],[STREET],[CITY],[STATE]) VALUES
('Ajax SA','Rua Presidente Castelo Branco','Porto Alegre','RS'),
('Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
('South Chairs','Rua do Moinho','Santa Maria','RS'),
('Elon Electro','Rua Apolo','S�o Paulo','SP'),
('Mike Electro','Rua Pedro da Cunha','Curitiba','PR')

INSERT INTO #CATEGORIES ([NAME]) VALUES 
('Super Luxury'),
('Imported'),
('Tech'),
('Vintage'),
('Supreme')

INSERT INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE],[ID_PROVIDERS],[ID_CATEGORIES]) VALUES
('Blue Chair',30,300.00	,5,5),
('Red Chair',50,2150.00	,2,1),
('Disney Wardrobe',400,829.50,4,1),
('Blue Toaster',20,9.90,3,1),
('TV',30,3000.25,2,2)


SELECT
	PROD.[NAME],
	PROV.[NAME],
	CATE.[NAME]
FROM
	#PRODUCTS PROD WITH(NOLOCK) 
INNER JOIN
	#PROVIDERS PROV WITH(NOLOCK) ON (PROV.[ID] = PROD.[ID_PROVIDERS])
INNER JOIN
	#CATEGORIES CATE WITH(NOLOCK) ON (CATE.[ID] = PROD.[ID_CATEGORIES])
WHERE
	PROV.[NAME] = 'Sansul SA' AND CATE.[NAME] = 'Imported'