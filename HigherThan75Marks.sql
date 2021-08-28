----Query the Name of any student in STUDENTS who scored higher than  Marks. 
----Order your output by the last three characters of each name. 
----If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
----secondary sort them by ascending ID.

IF OBJECT_ID ('TEMPDB.DBO.#STUDENTS','U') IS NOT NULL DROP TABLE #STUDENTS;


CREATE TABLE #STUDENTS(
	ID INT PRIMARY KEY,
	NOME VARCHAR(100),
	MARKS INT
)

SET NOCOUNT ON
INSERT INTO #STUDENTS (ID, NOME, MARKS) VALUES (1,'Ashley',81)
INSERT INTO #STUDENTS (ID, NOME, MARKS) VALUES (2,'Samantha',75)
INSERT INTO #STUDENTS (ID, NOME, MARKS) VALUES (3,'Julia',76)	
INSERT INTO #STUDENTS (ID, NOME, MARKS) VALUES (4,'Belvet',84)	
INSERT INTO #STUDENTS (ID, NOME, MARKS) VALUES (5,'David',99)	
INSERT INTO #STUDENTS (ID, NOME, MARKS) VALUES (6,'Joe',88)	
INSERT INTO #STUDENTS (ID, NOME, MARKS) VALUES (7,'Amina',24)	
INSERT INTO #STUDENTS (ID, NOME, MARKS) VALUES (8,'Priya',90)	
INSERT INTO #STUDENTS (ID, NOME, MARKS) VALUES (9,'Salma',30)	

SELECT 
	NOME
FROM #STUDENTS 
WHERE MARKS > 75
ORDER BY RIGHT(NOME,3), ID ASC;