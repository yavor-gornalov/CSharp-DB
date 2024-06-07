USE Service
GO

CREATE OR ALTER PROCEDURE usp_AssignEmployeeToReport
    (@EmployeeId INT, @ReportId INT)
AS
BEGIN
	DECLARE @EmployeeDepartment INT = (SELECT 
											e.DepartmentId 
										FROM Employees AS e 
										WHERE e.Id = @EmployeeId)
	
	DECLARE @ReportDepartment INT = (SELECT 
										c.DepartmentId 
									FROM Reports AS r
									JOIN Categories AS c ON r.CategoryId = c.Id
									WHERE r.Id = @ReportId)

	IF (@EmployeeDepartment <> @ReportDepartment)
		THROW 50000, 'Employee doesn''t belong to the appropriate department!', 1

	UPDATE Reports
		SET EmployeeId = @EmployeeId
	WHERE Id = @ReportId
END
GO

EXEC usp_AssignEmployeeToReport 17, 2
