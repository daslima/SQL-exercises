--Os v�rus est�o evoluindo, por�m uma nova pesquisa tem provado que trocando algumas prote�nas a vacina se torna imbat�vel. 
--A prote�na H1 (Hemaglutinina) quando � substitu�da pela prote�na X (Xenomorphina) tem efeitos interessantes no combate de quase todas as doen�as virais.
--Alguns conspiracionistas dizem que ap�s a descoberta dessa vacina algumas criaturas de 3 metros de altura foram vistas perto do laborat�rio, 
--mas claro, isso � mentira.
--Portanto voc� deve substituir todo caractere 'H1' ( Hemaglutinina ) por 'X' ( Xenomorphina ).

IF OBJECT_ID ('TEMPDB.DBO.#VIRUS','U') IS NOT NULL DROP TABLE #VIRUS;

CREATE TABLE #VIRUS (
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155)
)

INSERT INTO #VIRUS ([NAME]) VALUES
('H1RT'),
('H7H1'),
('HUN8'),
('XH1HX'),
('XXXX')


SELECT
	REPLACE([NAME],'H1','X') AS [NAME]
FROM
	#VIRUS WITH(NOLOCK)