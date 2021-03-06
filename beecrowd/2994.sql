IF OBJECT_ID ('TEMPDB.DBO.#DOCTORS','U') IS NOT NULL DROP TABLE #DOCTORS;
IF OBJECT_ID ('TEMPDB.DBO.#WORK_SHIFTS','U') IS NOT NULL DROP TABLE #WORK_SHIFTS;
IF OBJECT_ID ('TEMPDB.DBO.#ATTENDANCES','U') IS NOT NULL DROP TABLE #ATTENDANCES;

CREATE TABLE #DOCTORS (
	[ID] INT IDENTITY PRIMARY KEY,
	[NAME] VARCHAR(255)
)

CREATE TABLE #WORK_SHIFTS (
	[ID] INT IDENTITY PRIMARY KEY,
	[NAME] VARCHAR(255),
	[BONUS] INT
)

CREATE TABLE #ATTENDANCES (
	[ID] INT IDENTITY PRIMARY KEY,
	[ID_DOCTOR] INT,
	[ID_WORK_SHIFTS] INT,
	[HOURS] INT
)

INSERT INTO #DOCTORS ([NAME]) VALUES
('Arlino'),
('Tiago'),
('Amanda'),
('Wellington')

INSERT INTO #WORK_SHIFTS ([NAME],[BONUS]) VALUES
('nocturnal',15),
('afternoon',2),
('day',1)

INSERT INTO #ATTENDANCES ([ID_DOCTOR],[HOURS], [ID_WORK_SHIFTS]) VALUES
(1,5,1),
(3,2,1),
(3,3,2),
(2,2,3),
(1,5,3),
(4,1,3),
(4,2,1),
(3,2,2),
(2,4,2)


SELECT
	D.[NAME],
	SUM((A.[HOURS] * 150) + W.[BONUS]) AS SALARY
FROM
	#ATTENDANCES A WITH(NOLOCK)
INNER JOIN
	#DOCTORS D WITH(NOLOCK) ON (D.ID = A.ID_DOCTOR)
INNER JOIN
	#WORK_SHIFTS W WITH(NOLOCK) ON (W.ID = A.ID_WORK_SHIFTS)
GROUP BY
	D.[NAME]
ORDER BY
	SALARY DESC