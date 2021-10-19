
--We define an employee's salary x months total earnings to be their monthly  worked, 
--and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
--Write a query to find the maximum total earnings for all employees as well as the total number of employees 
--who have maximum total earnings. Then print these values as  space-separated integers.

--Sample Output: 69952 1

--The maximum earnings value is 69952 . The only employee with earnings  is Kimberly, 
--so we print the maximum earnings value (69952) and a count of the number of employees who have earned 69952
--(which is 1) as two space-separated values.


IF OBJECT_ID ('TEMPDB.DBO.#Employee ','U') IS NOT NULL DROP TABLE #Employee;

CREATE TABLE #EMPLOYEE (
	EMPLOYEE_ID INT,
	[NAME] VARCHAR(50),
	MONTHS INT,
	SALARY INT
)


INSERT INTO #EMPLOYEE (EMPLOYEE_ID, [NAME], MONTHS, SALARY ) VALUES
(12228, 'Rose', 15, 1968),
(33656, 'Angela',1,3443),
(45692, 'Frank', 17,1608),
(56118, 'Patrick', 7, 1345),
(59725, 'Lisa', 11, 2330),
(74197, 'Kimberly',16,4372),
(78454, 'Bonnie', 8, 1771),
(83565, 'Michael', 6, 2017),
(98607, 'Todd', 5, 3396),
(99989, 'Joe', 9, 3573)


SELECT
	CONVERT(VARCHAR, MAX(SALARY * MONTHS)) + '  ' + CONVERT(VARCHAR, COUNT(*)) AS Earnings 
FROM 
	#EMPLOYEE  WITH(NOLOCK)
WHERE 
	SALARY * MONTHS = (SELECT MAX(SALARY * MONTHS) FROM #EMPLOYEE WITH(NOLOCK))

