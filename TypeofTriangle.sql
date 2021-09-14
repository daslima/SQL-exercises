--Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
--Output one of the following statements for each record in the table:

--Equilateral: It's a triangle with 3  sides of equal length.
--Isosceles: It's a triangle with 2 sides of equal length.
--Scalene: It's a triangle with 3 sides of differing lengths.
--Not A Triangle: The given values of A, B, and C don't form a triangle.

IF OBJECT_ID ('TEMPDB.DBO.#TRIANGLES','U') IS NOT NULL DROP TABLE #TRIANGLES;

CREATE TABLE #TRIANGLES(
	A INT,
	B INT,
	C INT
);


INSERT INTO #TRIANGLES (A,B,C) 
VALUES 
(20,20,23),
(20,20,20),
(20,21,22),
(13,14,30),
(20,40,20),
(32,30,64),
(10,20,50)


SELECT 
	CASE
		WHEN (A + B) > C AND (B + C) > A AND (A + C) > B  THEN
			CASE 
				WHEN (A = B) AND (B = C) THEN 'Equilateral'
				WHEN (A = B) OR (B = C) OR (A = C) THEN 'Isosceles'
				ELSE 'Scalene'
			END
		ELSE 
			'Not A Triangle'
	END
FROM #TRIANGLES


