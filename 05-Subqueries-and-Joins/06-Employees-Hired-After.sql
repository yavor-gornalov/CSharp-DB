USE SoftUni;
GO

SELECT
	e.FirstName
	,e.LastName
	,e.HireDate
	,d.Name
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
AND d.Name IN ('Sales', 'Finance')
WHERE YEAR(e.HireDate) > 1999
ORDER BY e.HireDate;
