--A vídeo locadora está fazendo seu relatório semestral e precisa da sua ajuda. 
--Basta você selecionar o nome dos clientes e a data de locação, das locações realizadas no mês de setembro de 2016.

IF OBJECT_ID ('TEMPDB.DBO.#CUSTOMERS','U') IS NOT NULL DROP TABLE #CUSTOMERS;
IF OBJECT_ID ('TEMPDB.DBO.#RENTALS','U') IS NOT NULL DROP TABLE #RENTALS;


CREATE TABLE #CUSTOMERS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(255),
	[STREET] VARCHAR(255),
	[CITY] VARCHAR(255)
)

CREATE TABLE #RENTALS (
	[ID] INT PRIMARY KEY IDENTITY,
	[RENTALS_DATE] DATETIME,
	[ID_CUSTOMERS] INT
)



INSERT INTO #CUSTOMERS ([NAME],[STREET],[CITY]) VALUES
('Giovanna Goncalves Oliveira','Rua Mato Grosso','Canoas'),
('Kauã Azevedo Ribeiro', 'Travessa Ibiá', 'Uberlândia'),
('Rebeca Barbosa Santos','Rua Observatório Meteorológico','Salvador'),
('Sarah Carvalho Correia', 'Rua Antônio Carlos da Silva', 'Apucarana'),
('João Almeida Lima', 'Rua Rio Taiuva', 'Ponta Grossa'),
('Diogo Melo Dias','Rua Duzentos e Cinqüenta','Várzea Grande')


INSERT INTO #RENTALS ([RENTALS_DATE],[ID_CUSTOMERS]) VALUES 
('2016-09-10',3),
('2016-02-09',1),
('2016-02-08',4),
('2016-02-09',2),
('2016-02-03',6),
('2016-04-04',4)


SELECT 
	C.[NAME],
	R.[RENTALS_DATE]
FROM	
	#RENTALS R WITH(NOLOCK)
INNER JOIN
	#CUSTOMERS C WITH(NOLOCK) ON C.[ID] = R.[ID_CUSTOMERS]
WHERE
	MONTH(R.RENTALS_DATE) = 9
