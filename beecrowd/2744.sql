--Voc� foi contratado para dar consultoria a uma empresa. 
--Analisando o banco de dados voc� notou que as senhas gravadas dos usu�rios est�o em formato de texto, 
--sendo que isso pode gerar uma falha de seguran�a, uma vez que elas n�o est�o criptografadas.
--Por tanto voc� deve selecionar o id, a senha atual e a senha transformada em MD5 de cada usu�rio na tabela

IF OBJECT_ID ('TEMPDB.DBO.#ACCOUNT','U') IS NOT NULL DROP TABLE #ACCOUNT;

CREATE TABLE #ACCOUNT(
	[ID] INT IDENTITY,
	[NAME] VARCHAR(155),
	[LOGIN] VARCHAR(155),
	[PASSWORD] VARCHAR (155)
)

INSERT INTO #ACCOUNT ([NAME],[LOGIN],[PASSWORD]) VALUES
('Joyce P. Parry','Promeraw','noh1Oozei'),
('Michael T. Gonzalez','Phers1942','Iath3see9bi'),
('Heather W. Lawless','Hankicht','diShono4'),
('Otis C. Hitt','Conalothe','zooFohH7w'),
('Roger N. Brownfield','Worseente','fah7ohNg')


SELECT
	A.[ID],
	A.[PASSWORD],
	LOWER(CONVERT(VARCHAR(32), HASHBYTES('MD5',A.[PASSWORD]),2)) AS MD5
FROM
	#ACCOUNT A WITH(NOLOCK)

