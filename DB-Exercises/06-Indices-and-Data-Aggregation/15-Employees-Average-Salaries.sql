USE SoftUni;
GO

SELECT 
	*
INTO
	#FilteredEmpoyes
FROM Employees AS e
WHERE e.Salary > 30000;

DELETE
FROM #FilteredEmpoyes 
WHERE ManagerID = 42;

UPDATE #FilteredEmpoyes
SET Salary = Salary + 5000
WHERE DepartmentID = 1;

SELECT
	fe.DepartmentID
	,AVG(fe.Salary) AS AverageSalary
FROM #FilteredEmpoyes AS fe
GROUP BY fe.DepartmentID;

DROP TABLE #FilteredEmpoyes;
