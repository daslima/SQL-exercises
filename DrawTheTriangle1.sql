--P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
--Write a query to print the pattern P(20).


DECLARE @P INT = 20, 
		@COUNT INT = 0,
		@W VARCHAR(MAX) = '';

WHILE @COUNT < @P
	BEGIN
		WHILE @COUNT < @P
			BEGIN
				SET @W += ' * ';
				SET @COUNT += 1;
			END;
			SET @COUNT = 0;
			SET @P -= 1;
		PRINT(@W);
		SET @W = '';
	END;

