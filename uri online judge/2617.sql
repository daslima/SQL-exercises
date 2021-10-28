--O setor financeiro encontrou alguns problemas na entrega de um dos nossos fornecedores, a entrega dos produtos não condiz com a nota fiscal.
--Seu trabalho é exibir o nome dos produtos e o nome do fornecedor, para os produtos fornecidos pelo fornecedor ‘Ajax SA’.

IF OBJECT_ID('TEMPDB..DBO.#PROVIDERS','U') IS NOT NULL DROP TABLE #PROVIDERS
IF OBJECT_ID('TEMPDB..DBO.#PRODUCTS','U') IS NOT NULL DROP TABLE #PRODUCTS

CREATE TABLE #PROVIDERS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(155),
	[STREET] VARCHAR(155),
	[CITY] VARCHAR(155),
	[STATE] CHAR(2)
)

CREATE TABLE #PRODUCTS (
	[ID] INT PRIMARY KEY IDENTITY,
	[NAME] VARCHAR(155),
	[AMOUNT] INT,
	[PRICE] NUMERIC(18,2),
	[ID_PROVIDERS] INT
)


BEGIN TRANSACTION 
	BEGIN TRY

		INSERT INTO #PROVIDERS ([NAME],[STREET],[CITY],[STATE]) VALUES
		('Ajax SA','Presidente Castelo Branco','Porto Alegre','RS'),
		('Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
		('South Chairs','Av Moinho','Santa Maria','RS'),
		('Elon Electro','Apolo','São Paulo','SP'),
		('Mike Electro','Pedro da Cunha','Curitiba','PR')

		INSERT INTO #PRODUCTS ([NAME],[AMOUNT],[PRICE],[ID_PROVIDERS]) VALUES
		('Blue Chair',30,300.00,5),
		('Red Chair',50,2150.00,1),
		('Disney Wardrobe',400,829.50,4),
		('Blue Toaster',20,9.90,3),
		('Solar Panel',30,3000.25,4)

	END TRY
	
	BEGIN CATCH

		SELECT   
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,  
			ERROR_STATE() AS ErrorState,  
			ERROR_PROCEDURE() AS ErrorProcedure,  
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage  

		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION;  

	END CATCH;

	IF @@TRANCOUNT > 0  
        COMMIT TRANSACTION; 


SELECT
	P1.[NAME],
	P2.[NAME]
FROM
	#PRODUCTS P1 WITH(NOLOCK) 
INNER JOIN
	#PROVIDERS P2 WITH(NOLOCK) ON (P2.ID = P1.ID_PROVIDERS)
WHERE
	UPPER(P2.[NAME]) = UPPER('Ajax SA')