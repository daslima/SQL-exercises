--Uma V�deo locadora contratou seus servi�os para catalogar os filmes dela. 
--Eles precisam que voc� selecione o c�digo e o nome dos filmes cuja descri��o do g�nero seja 'Action'.


IF OBJECT_ID ('TEMPDB.DBO.#GENRES','U') IS NOT NULL DROP TABLE #GENRES;
IF OBJECT_ID ('TEMPDB.DBO.#MOVIES','U') IS NOT NULL DROP TABLE #MOVIES;


CREATE TABLE #GENRES (
	[ID] INT IDENTITY,
	[DESCRIPTION] VARCHAR(155)
)


CREATE TABLE #MOVIES (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(155),
	[ID_GENRES] INT 
)

INSERT INTO #GENRES ([DESCRIPTION]) VALUES 
('Animation'),
('Horror'),
('Action'),
('Drama'),
('Comedy')

INSERT INTO #MOVIES ([NAME],[ID_GENRES]) VALUES
('Batman',3),
('The Battle of the Dark River',3),
('White Duck',1),
('Breaking Barriers',4),
('The Two Hours',2)


SELECT
	M.[NAME]
FROM 
	#MOVIES M WITH(NOLOCK)
INNER JOIN
	#GENRES G WITH(NOLOCK) ON (G.ID = M.ID_GENRES)
WHERE
	G.[DESCRIPTION] = 'Action'