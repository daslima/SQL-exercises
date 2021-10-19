--Query the difference between the maximum and minimum populations in CITY.

IF OBJECT_ID ('TEMPDB.DBO.#CITY','U') IS NOT NULL DROP TABLE #CITY;

CREATE TABLE #CITY(
	[ID] INT IDENTITY,
	[NAME] VARCHAR(40),
	[COUTRYCODE] VARCHAR(3),
	[DISTRICT] VARCHAR(20),
	[POPULATION] INT
);

INSERT INTO #CITY ([NAME],COUTRYCODE,DISTRICT,[POPULATION]) VALUES
('São Paulo', 'SP','SP',102000),
('Rio de Janeiro','RJ','RJ',100000),
('Curitiba','PR','PR',90000),
('Campinas','SP','SP',13000)

SELECT
	(MAX([POPULATION]) - MIN([POPULATION])) AS 'difference '
FROM 
	#CITY WITH(NOLOCK)

