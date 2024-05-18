USE SoftUni;
GO 

CREATE OR ALTER PROC usp_GetEmployeesSalaryAbove35000
AS
	SELECT
		e.FirstName
		,e.LastName
	FROM Employees AS e
	WHERE e.Salary > 35000;
GO

EXEC usp_GetEmployeesSalaryAbove35000;
