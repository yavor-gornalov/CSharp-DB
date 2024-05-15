USE SoftUni;
GO 

CREATE OR ALTER PROC usp_GetEmployeesSalaryAboveNumber(@Number DECIMAL(18,4))
AS
	SELECT
		e.FirstName
		,e.LastName
	FROM Employees AS e
	WHERE e.Salary >= @Number;
GO

EXEC usp_GetEmployeesSalaryAboveNumber 48100;
