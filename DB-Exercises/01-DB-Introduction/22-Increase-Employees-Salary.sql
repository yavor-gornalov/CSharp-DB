-- Use SoftUni database
USE SoftUni;
GO

UPDATE Employees
SET Salary = 1.1 * Salary;

SELECT Salary FROM Employees;