USE Service
GO

SELECT
	r.Description
	, FORMAT(r.OpenDate, 'dd-MM-yyyy') AS OpenDate
FROM Reports AS r
WHERE EmployeeId IS NULL
ORDER BY r.OpenDate, r.Description
