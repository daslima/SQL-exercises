--Query the following two values from the STATION table:

--The sum of all values in LAT_N rounded to a scale of 2 decimal places.
--The sum of all values in LONG_W rounded to a scale of 2 decimal places.
--Input Format
--The STATION table is described as follows:

IF OBJECT_ID ('TEMPDB.DBO.#STATION','U') IS NOT NULL DROP TABLE #STATION;


CREATE TABLE #STATION(
	ID INT PRIMARY KEY,
	CITY VARCHAR(21),
	STATE_ VARCHAR(2),
	LAT_N INT,
	LONG_W INT
)

SELECT * FROM #STATION WITH(NOLOCK)

INSERT INTO #STATION (ID,CITY,STATE_,LAT_N,LONG_W) VALUES (1,'Brooklyn','NY',40.7128,74.0060)
INSERT INTO #STATION (ID,CITY,STATE_,LAT_N,LONG_W) VALUES (2,'Miami','FL',27.6648,81.5158)


SELECT 
	Format(Round(Sum(LAT_N),2),'F2') LAT,
	Format(Round(Sum(LONG_W),),'#.00') LON
from #STATION

SELECT 
	Round(SUM(LAT_N),2) AS lat, 
	Round(SUM(LONG_W),2) AS lon 
FROM #STATION
