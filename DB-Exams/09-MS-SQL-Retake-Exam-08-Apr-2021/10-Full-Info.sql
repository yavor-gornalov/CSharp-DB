USE Service
GO

SELECT
	CASE 
		WHEN CONCAT(e.FirstName, ' ', e.LastName) = ' ' THEN 'None'
		ELSE CONCAT(e.FirstName, ' ', e.LastName) 
	END AS Employee
	, COALESCE(d.Name, 'None') AS Department
	, c.Name AS Category
	, r.Description
	, FORMAT(r.OpenDate, 'dd.MM.yyyy') AS OpenDate
	, s.Label AS Status
	, u.Name AS "User"

FROM Reports AS r
LEFT JOIN Employees AS e ON r.EmployeeId = e.IdS
LEFT JOIN Departments AS d ON e.DepartmentId = d.Id
LEFT JOIN Categories AS c ON r.CategoryId = c.Id
LEFT JOIN Status AS s ON r.StatusId = s.Id
LEFT JOIN Users AS u ON r.UserId = u.Id

ORDER BY 
	e.FirstName DESC
	, e.LastName DESC
	, Department ASC
	, Category ASC
	, Description ASC
	, r.OpenDate ASC
	, Status ASC
	, "User" ASC
