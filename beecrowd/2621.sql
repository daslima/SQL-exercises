--Na hora de entregar o relatório de quantos produtos a empresa tem em estoque, uma parte do relatório ficou corrompida, por isso o responsável do estoque lhe pediu uma ajuda, ele quer que você exiba os seguintes dados para ele.
--Exiba o nome dos produtos cujas quantidades estejam entre 10 e 20 e cujo nome do fornecedor inicie com a letra ‘P’.


-- RESETANDO TABELAS
IF OBJECT_ID ('TEMPDB.DBO.#PROVIDERS','U') IS NOT NULL DROP TABLE #PROVIDERS;
IF OBJECT_ID ('TEMPDB.DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS;

-- CRIANDO TABELA TEMPORÁRIA
CREATE TABLE #PROVIDERS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[STREET] VARCHAR(155),
	[CITY] VARCHAR(155),
	[STATE] CHAR(2)
)

CREATE TABLE #PRODUCTS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[AMOUNT] NUMERIC(18,2),
	[PRICE] NUMERIC(18,2),
	[ID_PROVIDERS] INT
)

-- INSERINDO OS DADOS

INSERT INTO #PROVIDERS ([NAME],[STREET],[CITY],[STATE]) VALUES 
('Ajax SA','Rua Presidente Castelo Branco','Porto Alegre','RS'),
('Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
('Pr Sheppard Chairs','Rua do Moinho','Santa Maria','RS'),
('Elon Electro','Rua Apolo','São Paulo','SP'),
('Mike Electro','Rua Pedro da Cunha','Curitiba','PR')

INSERT  INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE],[ID_PROVIDERS]) VALUES
('Blue Chair',30,300.00,5),
('Red Chair',50,2150.00,2),
('Disney Wardrobe',400,829.50,4),
('Executive Chair',17,9.90,3),
('Solar Panel',30,3000.25,4)


-- REALIZANDO A CONSULTA
SELECT
	P2.[NAME]
FROM
	#PROVIDERS P1 WITH(NOLOCK)
INNER JOIN
	#PRODUCTS P2 WITH(NOLOCK) ON (P2.ID_PROVIDERS = P1.ID)
WHERE
	P1.[NAME] LIKE 'P%' AND (P2.[AMOUNT] BETWEEN 10 AND 20 )

