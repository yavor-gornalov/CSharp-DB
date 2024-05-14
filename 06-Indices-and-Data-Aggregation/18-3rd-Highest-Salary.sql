USE SoftUni;
GO

SELECT
	dt.DepartmentID
	,dt.Salary
FROM
	(SELECT
		DepartmentID
		,Salary
		, DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
	FROM Employees) AS dt
WHERE dt.SalaryRank = 3 
GROUP BY dt.DepartmentID, dt.Salary
