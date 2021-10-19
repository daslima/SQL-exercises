--Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880  and less than  137.2345 
--Truncate your answer to 4 decimal places.

IF OBJECT_ID('TEMPDB.DBO.#STATION','U') IS NOT NULL DROP TABLE #STATION

CREATE TABLE #STATION(
	ID INT PRIMARY KEY IDENTITY,
	CITY VARCHAR(21),
	STATE_ VARCHAR(2),
	LAT_N DECIMAL(10,5),
	LONG_W DECIMAL(10,5)
)

INSERT INTO #STATION (CITY,STATE_,LAT_N,LONG_W) VALUES 
('Brooklyn','NY',40.7128,74.0060),
('Miami','FL',27.6648,81.5158),
('Orlando','FL',27.6648,81.5158),
('Atlanta','GA',27.6648,81.5158),
('Atlanta','GA',27.6648,81.5158)

SELECT 
	FORMAT(SUM(LAT_N),'#.0000') 
FROM #STATION 
WHERE 
	LAT_N BETWEEN 38.7880 AND 137.2345


