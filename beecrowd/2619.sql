--A nossa empresa está querendo fazer um novo contrato para o fornecimento de novos produtos superluxuosos, 
--e para isso precisamos de alguns dados dos nossos produtos.
--Seu trabalho é exibir o nome dos produtos, nome dos fornecedores e o preço, para os produtos cujo preço 
--seja maior que 1000 e sua categoria seja ‘Super Luxury.

IF OBJECT_ID ('TEMPDB.DBO.#PROVIDERS','U') IS NOT NULL DROP TABLE #PROVIDERS;
IF OBJECT_ID ('TEMPDB.DBO.#CATEGORIES','U') IS NOT NULL DROP TABLE #CATEGORIES;
IF OBJECT_ID ('TEMPDB.DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS;

CREATE TABLE #PROVIDERS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
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
	[AMOUNT] INT,
	[PRICE] NUMERIC(18,2),
	[ID_PROVIDERS] INT,
	[ID_CATEGORIES] INT
)

INSERT INTO #PROVIDERS ([NAME],[STREET],[CITY],[STATE]) VALUES
('Ajax SA','Rua Presidente Castelo Branco','Porto Alegre','RS'),
('Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
('South Chairs','Rua do Moinho','Santa Maria','RS'),
('Elon Electro','Rua Apolo','São Paulo','SP'),
('Mike electro','Rua Pedro da Cunha','Curitiba','PR')

INSERT INTO #CATEGORIES ([NAME]) VALUES 
('Super Luxury'),
('Imported'),
('Tech'),
('Vintage'),
('Supreme')

INSERT INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE],[ID_PROVIDERS],[ID_CATEGORIES]) VALUES
('Blue Chair',30,300,5,5),
('Red Chair',50,2150,2,1),
('Disney Wardrobe',400,829.50,4,1),
('Blue Toaster',20,9.90,3,1),
('TV',30,3000.25,2,2)


SELECT
	P1.[NAME],
	P2.[NAME],
	P1.[PRICE]
FROM
	#PRODUCTS P1 WITH(NOLOCK)
INNER JOIN
	#PROVIDERS P2 WITH(NOLOCK) ON (P2.ID = P1.ID_PROVIDERS)
INNER JOIN
	#CATEGORIES C1 WITH(NOLOCK) ON (C1.ID = P1.ID_CATEGORIES)
WHERE
	P1.[PRICE] > 1000 AND
	C1.[NAME] = 'Super Luxury'