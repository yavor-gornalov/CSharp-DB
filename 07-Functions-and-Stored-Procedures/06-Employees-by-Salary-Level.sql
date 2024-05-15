USE SoftUni;
GO 

CREATE OR ALTER PROC usp_EmployeesBySalaryLevel (@SalaryLevel VARCHAR(10))
AS
	SELECT
		e.FirstName
		,e.LastName
	FROM Employees AS e
	WHERE dbo.ufn_GetSalaryLevel(e.Salary) = @SalaryLevel
GO

EXEC usp_EmployeesBySalaryLevel 'High';
