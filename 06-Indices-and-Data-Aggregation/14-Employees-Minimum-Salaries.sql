USE SoftUni;
GO

SELECT
	e.DepartmentID
	,MIN(e.Salary) AS MinimumSalary
FROM Employees AS e
WHERE e.DepartmentID IN (2, 5, 7) 
	AND YEAR(e.HireDate) >= 2000
GROUP BY e.DepartmentID
