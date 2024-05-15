USE Bank;
GO

CREATE OR ALTER PROC usp_GetHoldersFullName 
AS
SELECT
	CONCAT_WS(' ', FirstName, LastName) AS [Full Name]
FROM AccountHolders
GO

EXEC usp_GetHoldersFullName
