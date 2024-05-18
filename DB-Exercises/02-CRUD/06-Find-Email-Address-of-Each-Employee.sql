USE SoftUni;
GO

SELECT CONCAT_WS('.', FirstName, LastName) + '@softuni.bg' AS [Full Email Address]
FROM Employees;