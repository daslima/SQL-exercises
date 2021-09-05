--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as 
--both their first and last characters. Your result cannot contain duplicates.

IF OBJECT_ID ('TEMPDB.DBO.#STATION','U') IS NOT NULL DROP TABLE #STATION;


CREATE TABLE #STATION(
	ID INT PRIMARY KEY,
	CITY VARCHAR(21),
	STATE_ VARCHAR(2),
	LAT_N INT,
	LONG_W INT
)

INSERT INTO #STATION (ID,CITY,STATE_,LAT_N,LONG_W) VALUES 
(1,'Brooklyn','NY',40.7128,74.0060),
(2,'Miami','FL',27.6648,81.5158),
(3,'Orlando','FL',27.6648,81.5158),
(4,'Atlanta','GA',27.6648,81.5158),
(5,'Atlanta','GA',27.6648,81.5158)

SELECT DISTINCT
	CITY
FROM #STATION WITH(NOLOCK)
WHERE LEFT(UPPER(CITY),1) IN ('A','E','I','O','U')  AND 
RIGHT(UPPER(CITY),1) IN ('A','E','I','O','U')


