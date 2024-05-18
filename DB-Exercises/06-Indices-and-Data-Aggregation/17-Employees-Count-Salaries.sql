USE SoftUni;
GO

SELECT
	COUNT(*) AS [Count]
FROM Employees AS e
WHERE e.ManagerID IS NULL;
