USE SoftUni;
GO 

CREATE OR ALTER PROCEDURE usp_DeleteEmployeesFromDepartment
	(@departmentId int) 
AS
BEGIN
    ALTER TABLE Departments
    ALTER COLUMN ManagerID INT NULL

	UPDATE Employees
	SET ManagerID = NULL
	WHERE ManagerID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = @departmentId)

	UPDATE Departments
	SET ManagerID = NULL
	WHERE ManagerID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = @departmentId)

	DELETE
    FROM EmployeesProjects
    WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = @departmentId)

	DELETE
	FROM Employees
	WHERE DepartmentID = @departmentId

	DELETE
	FROM Departments
	WHERE DepartmentID = @departmentId

	SELECT
		COUNT(*) AS Result
	FROM Employees
	WHERE DepartmentID = @departmentId

END
GO

DECLARE @DepartmentToDelete INT = 13
EXEC usp_DeleteEmployeesFromDepartment @DepartmentToDelete;
