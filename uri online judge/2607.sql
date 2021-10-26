--Todos os meses a empresa pede um relatório das cidades que os fornecedores estão cadastrados. 
--Dessa vez não vai ser diferente, faça uma consulta no Banco de Dados que retorne todas as cidades dos fornecedores, mas em ordem alfabética.

--OBS: Você não deve mostrar cidades repetidas.

IF OBJECT_ID ('TEMPDB.DBO.#PROVIDERS','U') IS NOT NULL DROP TABLE #PROVIDERS;


CREATE TABLE #PROVIDERS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME]VARCHAR(155),
	[STREET] VARCHAR(50),
	[CITY] VARCHAR(20),
	[STATE] CHAR(2)
)

INSERT INTO  #PROVIDERS ([NAME],[STREET],[CITY],[STATE]) VALUES
('Henrique','Av Brasil','Rio de Janeiro','RJ'),
('Marcelo Augusto','Rua Imigrantes','Belo Horizonte','MG'),
('Caroline Silva','Av São Paulo','Salvador','BA'),
('Guilerme Staff','Rua Central','Porto Alegre','RS'),
('Isabela Moraes','Av Juiz Grande','Curitiba','PR'),
('Francisco Accerr','Av Paulista','São Paulo','SP')

SELECT DISTINCT 
	[CITY]
FROM	
	#PROVIDERS WITH(NOLOCK) 
ORDER BY [CITY] ASC