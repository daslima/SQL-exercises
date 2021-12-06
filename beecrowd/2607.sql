--Todos os meses a empresa pede um relat�rio das cidades que os fornecedores est�o cadastrados. 
--Dessa vez n�o vai ser diferente, fa�a uma consulta no Banco de Dados que retorne todas as cidades dos fornecedores, mas em ordem alfab�tica.

--OBS: Voc� n�o deve mostrar cidades repetidas.

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
('Caroline Silva','Av S�o Paulo','Salvador','BA'),
('Guilerme Staff','Rua Central','Porto Alegre','RS'),
('Isabela Moraes','Av Juiz Grande','Curitiba','PR'),
('Francisco Accerr','Av Paulista','S�o Paulo','SP')

SELECT DISTINCT 
	[CITY]
FROM	
	#PROVIDERS WITH(NOLOCK) 
ORDER BY [CITY] ASC