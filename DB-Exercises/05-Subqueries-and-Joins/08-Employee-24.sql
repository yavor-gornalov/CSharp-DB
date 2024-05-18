USE SoftUni
GO

SELECT
	e.EmployeeID
	,e.FirstName
	,CASE
		WHEN YEAR(p.StartDate) >= 2005 THEN NULL
		ELSE p.Name
	END AS ProjectName
FROM Employees AS e
JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID AND e.EmployeeID = 24
JOIN Projects AS p ON ep.ProjectID = p.ProjectID
