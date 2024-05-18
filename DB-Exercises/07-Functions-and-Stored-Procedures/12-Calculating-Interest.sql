USE Bank
GO

CREATE OR ALTER PROC usp_CalculateFutureValueForAccount
	(@id INT, @rate FLOAT)
AS
	SELECT TOP 1
		ah.Id AS [Account Id]
		,ah.FirstName AS [First Name]
		,ah.LastName AS [Last Name]
		,a.Balance AS [Current Balance]
		,dbo.ufn_CalculateFutureValue(a.Balance, @rate, 5) AS [Balance in 5 years]
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON ah.Id = a.AccountHolderId
	WHERE ah.Id = @id
GO

EXEC usp_CalculateFutureValueForAccount 1, 0.1
