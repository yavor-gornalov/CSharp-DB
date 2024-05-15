USE SoftUni;
GO 

CREATE OR ALTER PROC usp_GetEmployeesFromTown (@TownName NVARCHAR(100))
AS
	SELECT
		e.FirstName
		,e.LastName
	FROM Employees AS e
	JOIN Addresses AS a ON e.AddressID = a.AddressID
	JOIN Towns AS t ON a.TownID = t.TownID
	WHERE t.Name = @TownName
GO

EXEC usp_GetEmployeesFromTown 'Sofia';
