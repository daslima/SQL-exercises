--O Banco Central de Financiamentos perdeu vários registros após uma falha no servidor que ocorreu no mês de Outubro. 
--As datas de cobrança das parcelas foram perdidas. Porém uma cópia de segurança foi encontrada contendo as informações sobre as datas de pagamento das parcelas dos clientes.

--Por tanto, o Banco pede a sua ajuda para selecionar os nomes e o dia do mês que cada cliente deve pagar sua parcela.

--OBS: Obrigatoriamente o dia do mês precisa ser um inteiro.

IF OBJECT_ID ('TEMPDB.DBO.#LOAN','U') IS NOT NULL DROP TABLE #LOAN;

CREATE TABLE #LOAN (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(100),
	[VALUE] NUMERIC(6,2),
	[PAYDAY] DATE 
)

INSERT INTO #LOAN ([NAME],[VALUE],[PAYDAY]) VALUES
('Cristian Ghyprievy', 3000.50, '2017-10-19'),
('Jonh Serial', 1000, '2017-10-10'),
('Michael Seven',5000.40, '2017-10-17'),
('Joana Cabel', 2000, '2017-10-05'),
('Miguel Santos',4050,'2017-10-20')

SELECT 
	[NAME],
	CONVERT(INT,RIGHT([PAYDAY],2)) AS DAY
FROM
	#LOAN WITH(NOLOCK)

