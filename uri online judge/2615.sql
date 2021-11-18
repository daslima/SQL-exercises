--A locadora tem objetivos de criar v�rias franquias espalhadas pelo Brasil. Para isso queremos saber em quais cidades nossos clientes moram.
--Para voc� nos ajudar selecione o nome de todas as cidades onde a locadora tem clientes. Mas por favor, n�o repita o nome da cidade.


IF OBJECT_ID ('TEMPDB.DBO.#CUSTOMERS','U') IS NOT NULL DROP TABLE #CUSTOMERS;


CREATE TABLE #CUSTOMERS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[STREET] VARCHAR(155),
	[CITY] VARCHAR(155)
)

CREATE TABLE #RENTALS (
	[ID] INT IDENTITY,
	[RENTALS_DATE] DATETIME,
	[ID_CUSTOMERS] INT
)

INSERT INTO #CUSTOMERS ([NAME],[STREET],[CITY]) VALUES
('Giovanna Goncalves Oliveira','Rua Mato Grosso','Canoas'),
('Kau� Azevedo Ribeiro','Travessa Ibi�','Uberl�ndia'),
('Rebeca Barbosa Santos','Rua Observat�rio Meteorol�gico','Salvador'),
('Sarah Carvalho Correia','Rua Ant�nio Carlos da Silva','Apucarana'),
('Jo�o Almeida Lima','Rua Rio Taiuva','Ponta Grossa'),
('Diogo Melo Dias','Rua Duzentos e Cinq�enta','V�rzea Grande')


SELECT DISTINCT
	[CITY]
FROM 
	#CUSTOMERS WITH(NOLOCK)




