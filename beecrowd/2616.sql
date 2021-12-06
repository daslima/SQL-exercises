--A locadora pretende fazer uma promo��o para os clientes que ainda n�o fizeram nenhuma loca��o.
--Seu trabalho � nos entregar o ID e o nome dos clientes que n�o realizaram nenhuma loca��o. Ordene a sa�da por ID.


IF OBJECT_ID ('TEMPDB.DBO.#CUSTOMERS','U') IS NOT NULL DROP TABLE #CUSTOMERS;
IF OBJECT_ID ('TEMPDB.DBO.#LOCATIONS','U') IS NOT NULL DROP TABLE #LOCATIONS;

CREATE TABLE #CUSTOMERS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[STREET] VARCHAR(155),
	[CITY] VARCHAR(100)
)

CREATE TABLE #LOCATIONS (
	[ID] INT IDENTITY,
	[LOCATION_DATE] DATE,
	[ID_CUSTOMERS] INT
)


INSERT INTO #CUSTOMERS ([NAME],[STREET],[CITY]) VALUES 
('Giovanna Goncalves Oliveira','Rua Mato Grosso','Canoas'),
('Kau� Azevedo Ribeiro','Travessa Ibi�','Uberl�ndia'),
('Rebeca Barbosa Santos','Rua Observat�rio Meteorol�gico','Salvador'),
('Sarah Carvalho Correia','Rua Ant�nio Carlos da Silva','Apucarana'),
('Jo�o Almeida Lima','Rua Rio Taiuva','Ponta Grossa'),
('Diogo Melo Dias','Rua Duzentos e Cinq�enta','V�rzea Grande')

INSERT INTO #LOCATIONS ([LOCATION_DATE],[ID_CUSTOMERS]) VALUES
('2016-10-09',3),
('2016-09-02',1),
('2016-08-02',4),
('2016-09-02',2),
('2016-03-02',6),
('2016-04-04',4)


SELECT
	C.[ID],
	C.[NAME]
FROM
	#CUSTOMERS C WITH(NOLOCK)
LEFT JOIN
	#LOCATIONS L WITH(NOLOCK) ON (L.ID_CUSTOMERS = C.ID)
WHERE
	L.ID IS NULL