--A locadora tem objetivos de criar várias franquias espalhadas pelo Brasil. Para isso queremos saber em quais cidades nossos clientes moram.
--Para você nos ajudar selecione o nome de todas as cidades onde a locadora tem clientes. Mas por favor, não repita o nome da cidade.


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
('Kauã Azevedo Ribeiro','Travessa Ibiá','Uberlândia'),
('Rebeca Barbosa Santos','Rua Observatório Meteorológico','Salvador'),
('Sarah Carvalho Correia','Rua Antônio Carlos da Silva','Apucarana'),
('João Almeida Lima','Rua Rio Taiuva','Ponta Grossa'),
('Diogo Melo Dias','Rua Duzentos e Cinqüenta','Várzea Grande')


SELECT DISTINCT
	[CITY]
FROM 
	#CUSTOMERS WITH(NOLOCK)




