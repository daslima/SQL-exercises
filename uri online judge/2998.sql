--Uma empresa de investimentos deseja calcular o payback de seus clientes ao descobrir qual será o mês em que o acumulado das operações do empreendimento equivalem ou 
--são superiores ao investimento inicial. Por exemplo, o cliente Lucas investiu 1000$ e apenas no terceiro mês obteve o seu payback, já que a soma de todas as suas 
--operações foi superior ao seu investimento. Por outro lado, o cliente Daniel não conseguiu atingir seu payback já que seu investimento foi de 500$ e a soma de todas as 
--suas operações foi 230$. Você precisa mostrar o nome do cliente, o investimento inicial, qual o mês do payback e o valor do retorno (valor acumulado - valor investimento 
--inicial). Além disso, você deve mostrar o resultado ordenado do maior para o menor retorno.

--Exemplo de saída:

--[name	| investment |	month_of_payback |	return]
--[Lucas | 1000 | 3 | 300 ]
--[Oliveira |2000  | 2 | 0]


-- RESETANDO TABELAS TEMPORARIAS
IF OBJECT_ID ('TEMPDB.DBO.#CLIENTS','U') IS NOT NULL DROP TABLE #CLIENTS;
IF OBJECT_ID ('TEMPDB.DBO.#OPERATIONS','U') IS NOT NULL DROP TABLE #OPERATIONS;
IF OBJECT_ID ('TEMPDB.DBO.#TBL_VALOR_ACUMULADO','U') IS NOT NULL DROP TABLE #TBL_VALOR_ACUMULADO;
IF OBJECT_ID ('TEMPDB.DBO.#DADOS','U') IS NOT NULL DROP TABLE #DADOS;

-- CRIANDO TABELA DE CLIENTES
CREATE TABLE #CLIENTS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[INVESTMENT] NUMERIC(18,2)
)

-- CRIANDO TABELA DE OPERAÇÕES
CREATE TABLE #OPERATIONS (
	[ID] INT IDENTITY,
	[CLIENT_ID] INT,
	[MONTH] INT,
	[PROFIT] NUMERIC(18,2)
)

-- CRIANDO TABELA DE VALOR ACUMULADO
CREATE TABLE #TBL_VALOR_ACUMULADO (
	[MONTH] INT,
	[VALOR ACUMULADO] NUMERIC(18,2),
	[ID_CLIENT] INT
)

-- CRIANDO TABELA DE DADOS 
CREATE TABLE #DADOS (
	[ID_CLIENT] INT,
	[VALOR_ACUMULADO] NUMERIC(18,2),
	[MONTH] INT
)


-- INSERINDO OS CLIENTES
INSERT INTO #CLIENTS ([NAME],[INVESTMENT]) VALUES 
('Daniel', 500),
('Oliveira', 2000),
('Lucas',1000)

-- INSERINDO AS OPERAÇÕES
INSERT INTO #OPERATIONS ([CLIENT_ID],[MONTH],[PROFIT]) VALUES
(1,1,230),
(2,1,1000),
(2,2,1000),
(3,1,100),
(3,2,300),
(3,3,900),
(3,4,400)


-- 1º PASSO: REALIZANDO UM SELECT COM VALOR ACUMULADO DE CADA MÊS E INSERINDO NA TBL_VALOR_ACUMULADO
INSERT INTO #TBL_VALOR_ACUMULADO ([MONTH], [VALOR ACUMULADO],[ID_CLIENT]) 
SELECT
	O1.[MONTH],
	ISNULL(
		O1.[PROFIT] + (
			SELECT 
				SUM(O2.[PROFIT])
			FROM #OPERATIONS O2 WITH(NOLOCK)
			WHERE O2.CLIENT_ID = O1.CLIENT_ID AND O2.[ID] < O1.[ID]
		), O1.[PROFIT]
	)  AS [VALOR ACUMULADO],
	C.[ID] AS [ID_CLIENT]
FROM
	#OPERATIONS O1 WITH(NOLOCK)
INNER JOIN
	#CLIENTS C WITH(NOLOCK) ON (C.ID = O1.CLIENT_ID)


-- 2º PASSO: REALIZANDO UM SELECT E FILTRANDO AS OPERAÇÕES QUE TIVERAM UM VALOR ACUMULADO MAIOR QUE O INVESTIMENTO INICIAL
INSERT INTO #DADOS ([ID_CLIENT],[MONTH],[VALOR_ACUMULADO]) 
SELECT
	V.[ID_CLIENT],
	V.[MONTH],
	(V.[VALOR ACUMULADO])
FROM
	#TBL_VALOR_ACUMULADO V WITH(NOLOCK)
INNER JOIN
	#CLIENTS C WITH(NOLOCK) ON (C.ID = V.ID_CLIENT)
WHERE
	V.[VALOR ACUMULADO] >= C.INVESTMENT


-- 3º PASSO: REALIZANDO UM SELECT E MOSTRANDO AS INFORMAÇÕES DOS CLIENTES QUE TIVERAM UM RETORNO MAIOR QUE O INVESTIMENTO INICIAL
SELECT 
	C.[NAME] AS 'name',
	C.[INVESTMENT] AS 'investment',
	D.[MONTH] AS 'month_of_payback',
	(D.VALOR_ACUMULADO - C.[INVESTMENT]) AS 'return'
FROM 
	#DADOS D WITH(NOLOCK)
INNER JOIN
	#CLIENTS C WITH(NOLOCK) ON (C.ID = D.ID_CLIENT)
WHERE
	D.[VALOR_ACUMULADO] = (SELECT MIN(D1.VALOR_ACUMULADO) FROM #DADOS D1 WHERE D.ID_CLIENT = D1.ID_CLIENT)
ORDER BY 
	D.VALOR_ACUMULADO ASC

