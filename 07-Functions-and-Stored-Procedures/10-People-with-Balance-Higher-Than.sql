USE Bank;
GO

CREATE OR ALTER PROC usp_GetHoldersWithBalanceHigherThan
	(@number MONEY)
AS
	SELECT 
		FirstName
		,LastName
	FROM AccountHolders
	WHERE Id IN (
		SELECT
			a.AccountHolderId
		FROM AccountHolders AS ah
		JOIN Accounts AS a ON ah.Id = a.AccountHolderId
		GROUP BY a.AccountHolderId
		HAVING SUM(a.Balance) > @number)
	ORDER BY FirstName, LastName 
GO

EXEC usp_GetHoldersWithBalanceHigherThan 10000
