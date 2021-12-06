--Sua empresa está fazendo um levantamento de quantos clientes estão cadastrados nos estados, porém, faltou levantar os dados do estado do Rio Grande do Sul.
--Então você deve Exibir o nome de todos os clientes cujo estado seja ‘RS’.

IF OBJECT_ID ('TEMPDB.DBO.#CUSTOMERS','U') IS NOT NULL DROP TABLE #CUSTOMERS;

CREATE TABLE #CUSTOMERS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(255),
	[STREET] VARCHAR(255),
	[CITY] VARCHAR(255),
	[STATE] CHAR(2),
	[CREDIT_LIMIT] NUMERIC(6,2)
)

INSERT INTO #CUSTOMERS ([NAME],[STREET],[CITY],[STATE],[CREDIT_LIMIT]) VALUES
('Pedro Augusto da Rocha','Rua Pedro Carlos Hoffman','Porto Alegre','RS',700.00),
('Antonio Carlos Mamel','Av. Pinheiros','Belo Horizonte','MG',3500.50),
('Luiza Augusta Mhor','Rua Salto Grande','Niteroi','RJ',4000.00),
('Jane Ester','Av 7 de setembro	','Erechim','RS',800.00),
('Marcos Antônio dos Santos','Av Farrapos','Porto Alegre','RS',4250.25)



SELECT
	[NAME]
FROM
	#CUSTOMERS WITH(NOLOCK)
WHERE 
	[STATE] = 'RS'



