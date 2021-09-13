
--Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
--Your result cannot contain duplicates.
IF OBJECT_ID ('TEMPDB.DBO.#STATION','U') IS NOT NULL DROP TABLE #STATION;


CREATE TABLE #STATION(
	ID INT PRIMARY KEY IDENTITY,
	CITY VARCHAR(21),
	STATE_ VARCHAR(2),
	LAT_N INT,
	LONG_W INT
)

INSERT INTO #STATION (CITY,STATE_,LAT_N,LONG_W) VALUES 
('Brooklyn','NY',40.7128,74.0060),
('Miami','FL',27.6648,81.5158),
('Orlando','FL',27.6648,81.5158),
('Atlanta','GA',27.6648,81.5158),
('Atlanta','GA',27.6648,81.5158)


SELECT DISTINCT 
	CITY
FROM #STATION
WHERE LEFT(UPPER(CITY),1) NOT IN ('A','E','I','O', 'U') AND RIGHT(UPPER(CITY),1) NOT IN ('A','E','I','O', 'U')