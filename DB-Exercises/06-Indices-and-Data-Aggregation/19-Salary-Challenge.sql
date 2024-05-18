USE SoftUni;
GO

SELECT TOP 10
	e.FirstName
	,e.LastName
	,e.DepartmentID
FROM Employees AS e
WHERE e.Salary > (
	SELECT
		AVG(Salary) AS DepartmentAVG
	FROM Employees
	WHERE DepartmentID = e.DepartmentID)
ORDER BY e.DepartmentID;
