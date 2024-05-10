USE SoftUni;
GO

UPDATE Employees
	SET Salary = 1.12 * Salary
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE d.Name IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services');

SELECT
	Salary
FROM Employees;

UPDATE Employees
	SET Salary = Salary / 1.12
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE d.Name IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services');
