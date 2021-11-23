
----A diretoria da empresa pediu para voc� um relat�rio simples de quantas cidades a empresa j� alcan�ou.
----Para fazer isso voc� deve exibir a quantidade de cidades distintas da tabela clientes.

IF OBJECT_ID ('TEMPDB.DBO.#CUSTOMERS','U') IS NOT NULL DROP TABLE #CUSTOMERS;

CREATE TABLE #CUSTOMERS(
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[STREET] VARCHAR(155),
	[CITY] VARCHAR(155),
	[STATE] CHAR(2),
	[CREDIT_LIMIT] INT
)

INSERT INTO #CUSTOMERS ([NAME],[STREET],[CITY],[STATE],[CREDIT_LIMIT]) VALUES
('Nicolas Diogo Cardoso','Acesso Um','Porto Alegre','RS',475),
('Cec�lia Olivia Rodrigues','Rua Sizuka Usuy','Cianorte','PR',3170),
('Augusto Fernando Carlos Eduardo Cardoso','Rua Baldomiro Koerich','Palho�a','SC',1067),
('Nicolas Diogo Cardoso','Acesso Um','Porto Alegre','RS',475),
('Sabrina Heloisa Gabriela Barros','Rua Engenheiro Tito Marques Fernandes','Porto Alegre','RS',4312),
('Joaquim Diego Lorenzo Ara�jo','Rua Vitorino','Novo Hamburgo','RS',2314)

SELECT
	COUNT(DISTINCT [CITY]) AS 'COUNT'
FROM
	#CUSTOMERS WITH(NOLOCK)