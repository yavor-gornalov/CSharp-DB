USE SoftUni;
GO 

CREATE OR ALTER FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4)) 
RETURNS VARCHAR(10)
AS
BEGIN
	IF (@salary < 30000) RETURN 'Low'
	IF (@salary <= 50000) RETURN 'Average'
	RETURN 'High'
END
GO

-- Define a CTE with the test salaries
WITH TestSalaries (Salary) AS (
    SELECT * FROM (VALUES 
        (13500.00),
        (43300.00),
        (125500.00)
    ) AS ValueTable(Salary)
)

-- Select from the CTE and calculate the salary levels using your function
SELECT
    Salary,
    dbo.ufn_GetSalaryLevel(Salary) AS [Salary Level]
FROM TestSalaries;