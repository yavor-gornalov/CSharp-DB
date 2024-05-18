USE SoftUni;
GO 

CREATE OR ALTER PROC usp_GetTownsStartingWith(@String NVARCHAR(20))
AS
	SELECT
		t.Name
	FROM Towns AS t
	WHERE t.Name LIKE (@String + '%')
GO

EXEC usp_GetTownsStartingWith 'b';
