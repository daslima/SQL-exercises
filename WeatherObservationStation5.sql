--Query the two cities in STATION with the shortest and longest CITY names, 
--as well as their respective lengths (i.e.: number of characters in the name). 
--If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
--When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths 3,3,4  and 3. 
--The longest name is PQRS, but there are  options for shortest named city. 
--Choose ABC, because it comes first alphabetically.
--Sample Output
--ABC 3
--PQRS 4

IF OBJECT_ID ('TEMPDB.DBO.#STATION','U') IS NOT NULL DROP TABLE #STATION;

CREATE TABLE #STATION(
	ID INT PRIMARY KEY,
	CITY VARCHAR(21),
	STATE_ VARCHAR(2),
	LAT_N INT,
	LONG_W INT
)

INSERT INTO #STATION (ID,CITY,STATE_,LAT_N,LONG_W) VALUES 
(1,'Amo','NY',40.7128,74.0060),
(2,'Lee','FL',27.6648,81.5158),
(3,'Alba','FL',27.6648,81.5158),
(4,'Bono','FL',27.6648,81.5158),
(5,'Acme','FL',27.6648,81.5158),
(6,'Roy','FL',27.6648,81.5158),
(7,'Dale','FL',27.6648,81.5158)


SELECT TOP 1
	CITY,
	LEN(CITY)
FROM #STATION
ORDER BY LEN(CITY) , CITY ASC;

SELECT TOP 1
	CITY,
	LEN(CITY)
FROM #STATION
ORDER BY LEN(CITY) DESC;
