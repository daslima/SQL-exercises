--Uma empresa de investimentos deseja calcular o payback de seus clientes ao descobrir qual ser� o m�s em que o acumulado das opera��es do empreendimento equivalem ou 
--s�o superiores ao investimento inicial. Por exemplo, o cliente Lucas investiu 1000$ e apenas no terceiro m�s obteve o seu payback, j� que a soma de todas as suas 
--opera��es foi superior ao seu investimento. Por outro lado, o cliente Daniel n�o conseguiu atingir seu payback j� que seu investimento foi de 500$ e a soma de todas as 
--suas opera��es foi 230$. Voc� precisa mostrar o nome do cliente, o investimento inicial, qual o m�s do payback e o valor do retorno (valor acumulado - valor investimento 
--inicial). Al�m disso, voc� deve mostrar o resultado ordenado do maior para o menor retorno.

--Exemplo de sa�da:

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

-- CRIANDO TABELA DE OPERA��ES
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

-- INSERINDO AS OPERA��ES
INSERT INTO #OPERATIONS ([CLIENT_ID],[MONTH],[PROFIT]) VALUES
(1,1,230),
(2,1,1000),
(2,2,1000),
(3,1,100),
(3,2,300),
(3,3,900),
(3,4,400)


-- 1� PASSO: REALIZANDO UM SELECT COM VALOR ACUMULADO DE CADA M�S E INSERINDO NA TBL_VALOR_ACUMULADO
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


-- 2� PASSO: REALIZANDO UM SELECT E FILTRANDO AS OPERA��ES QUE TIVERAM UM VALOR ACUMULADO MAIOR QUE O INVESTIMENTO INICIAL
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


-- 3� PASSO: REALIZANDO UM SELECT E MOSTRANDO AS INFORMA��ES DOS CLIENTES QUE TIVERAM UM RETORNO MAIOR QUE O INVESTIMENTO INICIAL
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

