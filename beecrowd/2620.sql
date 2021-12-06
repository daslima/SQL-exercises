--A auditoria financeira da empresa está pedindo para nós um relatório do primeiro semestre de 2016. 
--Então exiba o nome dos clientes e o número do pedido para os clientes que fizeram pedidos no primeiro semestre de 2016.

IF OBJECT_ID ('TEMPDB.DBO.#CUSTOMERS','U') IS NOT NULL DROP TABLE #CUSTOMERS;
IF OBJECT_ID ('TEMPDB.DBO.#ORDERS','U') IS NOT NULL DROP TABLE #ORDERS;

-- CRIANDO TABELA TEMPORÁRIA 
CREATE TABLE #CUSTOMERS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(255),
	[STREET] VARCHAR(255),
	[CITY] VARCHAR(255),
	[STATE] CHAR(2),
	[CREDIT_LIMIT] NUMERIC (6,2)
)

CREATE TABLE #ORDERS (
	ID INT PRIMARY KEY IDENTITY,
	[ORDERS_DATE] DATETIME,
	[ID_CUSTOMERS] INT
)

-- INSERINDO DADOS NA TABELA TEMPORÁRIA
SET NOCOUNT ON
INSERT INTO #CUSTOMERS ([NAME],[STREET],[CITY],[STATE],[CREDIT_LIMIT]) VALUES
('Nicolas Diogo Cardoso', 'Acesso Um', 'Porto Alegre', 'RS',475),
('Cecília Olivia Rodrigues', 'Rua Sizuka Usuy','Cianorte','PR',3170 ),
('Augusto Fernando Carlos Eduardo Cardoso','Rua Baldomiro Koerich','Palhoça','SC',1067),
('Nicolas Diogo Cardoso','Acesso Um','Porto Alegre','RS',475),
('Sabrina Heloisa Gabriela Barros','Rua Engenheiro Tito Marques Fernandes','Porto Alegre','RS',4312),
('Joaquim Diego Lorenzo Aráujo','Rua Vitorino', 'Novo Hamburgo','RS',2314)

INSERT INTO #ORDERS ([ORDERS_DATE],[ID_CUSTOMERS]) VALUES
('2016-05-13',3),
('2016-01-12',2),
('2016-04-18',5),
('2016-09-07',4),
('2016-02-13',6),
('2016-08-05',3)


-- REALIZANDO A CONSULTA (PRIMEIRO SEMESTRE DE 2016.)
SELECT
	C.[NAME],
	O.[ID]
FROM
	#CUSTOMERS C WITH(NOLOCK)
INNER JOIN
	#ORDERS O WITH(NOLOCK) ON (O.ID_CUSTOMERS = C.ID)
WHERE
	MONTH(O.ORDERS_DATE) <= 6
