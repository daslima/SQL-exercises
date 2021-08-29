--Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
--For example, if there are three records in the table with CITY values 'New York', 'New York', 'Bengalaru', 
--there are 2 different city names: 'New York' and 'Bengalaru'. The query returns , because 
--total number of records - number of unique city names = 3 - 2 = 1.

IF OBJECT_ID ('TEMPDB.DBO.#STATION','U') IS NOT NULL DROP TABLE #STATION;

CREATE TABLE #STATION(
	ID INT PRIMARY KEY,
	CITY VARCHAR(21),
	STATE_ VARCHAR(2),
	LAT_N INT,
	LONG_W INT
)

INSERT INTO #STATION (ID,CITY,STATE_,LAT_N,LONG_W) VALUES 
(1,'NEW YORK','NY',40.7128,74.0060),
(2,'NEW YORK','FL',27.6648,81.5158),
(3,'BENGALURU','KA',27.6648,81.5158)

DECLARE @TOTAL INT, @DUPLICATES INT;

WITH tableCTE(nome, valor)
AS
(
	SELECT CITY, COUNT(*) FROM #STATION GROUP BY CITY
)

SELECT @DUPLICATES = valor FROM tableCTE WHERE valor >= 2;
SELECT @TOTAL = COUNT(*) FROM #STATION

SELECT  @TOTAL - @DUPLICATES

SELECT COUNT(CITY) - COUNT (DISTINCT City)
FROM #STATION ;