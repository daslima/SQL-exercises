--Os diretores do setor de comunica��o da sua empresa querem um relat�rio sobre os dados dos clientes f�sicos que est�o cadastrados no banco de dados. 
--Porem o antigo relat�rio teve um problema. Os dados do CPF dos clientes vieram sem a m�scara.
--Por isso seu trabalho agora � selecionar todos os CPFs de todos os clientes, e aplicar uma m�scara sobre o retorno dos dados.
--A m�scara do CPF � parecida com: '000.000.000-00'.

IF OBJECT_ID ('TEMPDB.DBO.#CUSTOMERS','U') IS NOT NULL DROP TABLE #CUSTOMERS;
IF OBJECT_ID ('TEMPDB.DBO.#NATURAL_PERSON','U') IS NOT NULL DROP TABLE #NATURAL_PERSON;

CREATE TABLE #CUSTOMERS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[STREET] VARCHAR(155),
	[CITY] VARCHAR(155),
	[STATE] CHAR(2),
	[CREDIT_LIMIT] NUMERIC(18,2)
)

CREATE TABLE #NATURAL_PERSON (
	[ID_CUSTOMERS] INT IDENTITY,
	[CPF] CHAR(14)
)

INSERT INTO #CUSTOMERS ([NAME],[STREET],[CITY],[STATE],[CREDIT_LIMIT]) VALUES
('Nicolas Diogo Cardoso','Acesso Um','Porto Alegre','RS',475),
('Cec�lia Olivia Rodrigues','Rua Sizuka Usuy','Cianorte','PR',3170),
('Augusto Fernando Carlos Eduardo Cardoso','Rua Baldomiro Koerich','Palho�a','SC',1067),
('Nicolas Diogo Cardoso','Acesso Um','Porto Alegre','RS',475),
('Sabrina Heloisa Gabriela Barros','Rua Engenheiro Tito Marques Fernandes','Porto Alegre','RS',4312),
('Joaquim Diego Lorenzo Ara�jo','Rua Vitorino','Novo Hamburgo','RS',2314)

INSERT INTO #NATURAL_PERSON ([CPF]) VALUES
('26774287840'),
('97918477200')


SELECT
	SUBSTRING(N.[CPF],1,3) + '.' + SUBSTRING(N.[CPF],4,3) + '.' + SUBSTRING(N.[CPF],7,3) + '-' + SUBSTRING(N.[CPF],10,2) AS CPF
FROM
	#CUSTOMERS C WITH(NOLOCK)
INNER JOIN
	#NATURAL_PERSON N WITH(NOLOCK) ON (N.[ID_CUSTOMERS] = C.[ID])