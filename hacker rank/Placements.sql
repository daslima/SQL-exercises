--You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
--Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
--Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

--Write a query to output the names of those students whose best friends got offered a higher salary than them. 
--Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got 
--same salary offer.


IF OBJECT_ID ('TEMPDB.DBO.#STUDENTS','U') IS NOT NULL DROP TABLE #STUDENTS;
IF OBJECT_ID ('TEMPDB.DBO.#FRIENDS','U') IS NOT NULL DROP TABLE #FRIENDS;
IF OBJECT_ID ('TEMPDB.DBO.#PACKAGES','U') IS NOT NULL DROP TABLE #PACKAGES;


CREATE TABLE #STUDENTS (
	ID INT,
	[NAME] VARCHAR(50)
)

CREATE TABLE #FRIENDS (
	ID INT,
	FRIEND_ID INT
)

CREATE TABLE #PACKAGES (
	ID INT,
	SALARY FLOAT
)


INSERT INTO #STUDENTS (ID,[NAME]) VALUES
(1,'Ashley'),
(2,'Samantha'),
(3,'Julia'),
(4,'Scarlet')

INSERT INTO #FRIENDS (ID,FRIEND_ID) VALUES
(1,2),
(2,3),
(3,4),
(4,1)

INSERT INTO #PACKAGES (ID, SALARY) VALUES
(1,15.20),
(2,10.06),
(3,11.55),
(4,12.12)

-- FRIEND SALARY
SELECT
	F.FRIEND_ID,
	P.SALARY
FROM #FRIENDS F WITH(NOLOCK)
INNER JOIN #PACKAGES P WITH(NOLOCK) ON (P.ID = F.FRIEND_ID)

-- STUDENTS SALARY
SELECT
	S.[NAME],
	P.SALARY
FROM #STUDENTS S WITH(NOLOCK)
INNER JOIN #PACKAGES P WITH(NOLOCK) ON (P.ID = S.ID)


SELECT
	S.[NAME]
FROM #STUDENTS S WITH(NOLOCK)
INNER JOIN #FRIENDS  F  WITH(NOLOCK) ON (F.ID = S.ID)
INNER JOIN #PACKAGES P1 WITH(NOLOCK) ON (P1.ID = S.ID)
INNER JOIN #PACKAGES P2 WITH (NOLOCK) ON (P2.ID = F.FRIEND_ID)
WHERE P2.SALARY > P1.SALARY
ORDER BY P2.SALARY



