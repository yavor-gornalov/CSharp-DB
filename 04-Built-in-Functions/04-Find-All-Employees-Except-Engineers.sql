USE SoftUni;
GO

SELECT
	FirstName,
	LastName
FROM Employees
WHERE LOWER(JobTitle) NOT LIKE '%engineer%';
