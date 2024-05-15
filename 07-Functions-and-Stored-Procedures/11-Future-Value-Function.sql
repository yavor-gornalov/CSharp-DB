USE Bank
GO

CREATE OR ALTER FUNCTION ufn_CalculateFutureValue
	(@sum DECIMAL(18,4), @interest FLOAT, @years INT)
RETURNS DECIMAL(18,4)
AS
BEGIN
	RETURN @sum * POWER((1 + @interest), @years) 
END
GO

SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5)
