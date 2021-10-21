--A empresa fará um evento comemorando os 20 anos de mercado, 
--e para isso faremos uma grande comemoração na cidade de Porto Alegre. Queremos também convidar todos os nossos clientes que estão cadastrados nessa cidade.
--O seu trabalho é nos passar os nomes e os endereços dos clientes que moram em 'Porto Alegre', para entregar os convites pessoalmente.

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
('Pedro Augusto da Rocha','Rua Pedro Carlos Hoffman','Porto Alegre','RS',700),
('Antonio Carlos Mamel','Av. Pinheiros','Belo Horizonte','MG',3500.50),
('Luiza Augusta Mhor','Rua Salto Grande','Niteroi','RJ',4000),
('Jane Ester','Av 7 de setembro', 'Erechim','RS',800),
('Marcos Antônio dos Santos','Av Farrapos','Porto Alegre','RS',4250.25)

SELECT
	[NAME],
	[STREET]
FROM 
	#CUSTOMERS WITH(NOLOCK)
WHERE 
	UPPER([CITY]) = UPPER('Porto Alegre')