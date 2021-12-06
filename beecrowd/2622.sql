--O setor de vendas quer fazer uma promoção para todos os clientes que são pessoas jurídicas. 
--Para isso você deve exibir o nome dos clientes que sejam pessoa jurídica.

IF OBJECT_ID ('TEMPDB.DBO.#CUSTOMERS','U') IS NOT NULL DROP TABLE #CUSTOMERS;
IF OBJECT_ID ('TEMPDB.DBO.#LEGAL_PERSON','U') IS NOT NULL DROP TABLE #LEGAL_PERSON;

CREATE TABLE #CUSTOMERS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(255),
	[STREET] VARCHAR(255),
	[CITY] VARCHAR(255),
	[STATE] CHAR(2),
	[CREDIT_LIMIT] INT
)

CREATE TABLE #LEGAL_PERSON (
	[ID] INT PRIMARY KEY IDENTITY,
	[ID_CUSTOMERS] INT,
	[CNPJ] VARCHAR(18),
	[CONTACT] VARCHAR(50)
)

SET NOCOUNT ON

INSERT INTO #CUSTOMERS ([NAME],[STREET],[CITY],[STATE],[CREDIT_LIMIT]) VALUES
('Nicolas Diogo Cardoso','Acesso Um','Porto Alegre','RS',475),
('Cecília Olivia Rodrigues','Rua Sizuka Usuy','Cianorte','PR',3170),
('Augusto Fernando Carlos Eduardo Cardoso','Rua Baldomiro Koerich','Palhoça','SC',1067),
('Nicolas Diogo Cardoso','Acesso Um','Porto Alegre','RS',475),
('Sabrina Heloisa Gabriela Barros','Rua Engenheiro Tito Marques Fernandes','Porto Alegre','RS',4312),
('Joaquim Diego Lorenzo Araújo','Rua Vitorino','Novo Hamburgo','RS',2314)

INSERT INTO #LEGAL_PERSON ([ID_CUSTOMERS],[CNPJ],[CONTACT]) VALUES
(4,'85883842000191','99767-0562'),
(5,'47773848000117','99100-8965')

SELECT
	C.[NAME]
FROM 
	#CUSTOMERS C WITH(NOLOCK)
INNER JOIN
	#LEGAL_PERSON L WITH(NOLOCK) ON (L.ID_CUSTOMERS = C.ID)