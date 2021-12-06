--O setor financeiro precisa de um relatório sobre os fornecedores dos produtos que vendemos. 
--Os relatórios contemplam todas as categorias, mas por algum motivo, os fornecedores dos produtos cuja categoria é a executiva, não estão no relatório.
--Seu trabalho é retornar os nomes dos produtos e dos fornecedores cujo código da categoria é 6.

IF OBJECT_ID ('TEMPDB.DBO.#PROVIDERS','U') IS NOT NULL DROP TABLE #PROVIDERS;
IF OBJECT_ID ('TEMPDB.DBO.#CATEGORIES','U') IS NOT NULL DROP TABLE #CATEGORIES;
IF OBJECT_ID ('TEMPDB.DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS;


CREATE TABLE #PROVIDERS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME]VARCHAR(155),
	[STREET] VARCHAR(50),
	[CITY] VARCHAR(20),
	[STATE] CHAR(2)
)

CREATE TABLE #CATEGORIES (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(155)
)


CREATE TABLE #PRODUCTS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(155),
	[AMOUNT] NUMERIC (18,2),
	[PRICE] NUMERIC (18,2),
	[ID_PROVIDERS] INT,
	[ID_CATEGORIES] INT,
)

INSERT INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE],[ID_PROVIDERS],[ID_CATEGORIES]) VALUES
('Two-door wardrobe',100,800,6,8),
('Dining table',1000,560,1,9),
('Towel holder',10000,25.50,5,1),
('Computer desk',350, 320.50, 4, 6),
('Chair', 3000, 210.64, 3, 6),
('Single bed', 750, 450,1,2)

INSERT INTO #PROVIDERS ([NAME],[STREET],[CITY],[STATE]) VALUES 
('Henrique','Av Brasil','Rio de Janeiro','RJ'),
('Marcelo Augusto','Rua Imigrantes','Belo Horizonte','MG'),
('Caroline Silva','Av São Paulo','Salvador','BA'),
('Guilerme Staff','Rua Central','Porto Alegre','RS'),
('Isabela Moraes','Av Juiz Grande','Curitiba','PR'),
('Francisco Accerr','Av Paulista','São Paulo','SP')


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

SELECT
	A.[NAME],
	B.[NAME]
FROM 
	#PRODUCTS A WITH(NOLOCK)
INNER JOIN
	#CATEGORIES B WITH(NOLOCK) ON (B.ID = A.ID_CATEGORIES)
INNER JOIN
	#PROVIDERS C WITH(NOLOCK) ON (C.ID = A.ID_PROVIDERS)
WHERE
	B.ID = 6


