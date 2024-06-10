USE Bakery
GO

CREATE OR ALTER VIEW v_UserWithCountries
AS
SELECT
	CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName 
	, c.Age
	, c.Gender
	, t.Name AS CountryName
FROM Customers AS c
JOIN Countries AS t ON c.CountryId = t.Id
GO

SELECT TOP 5 *
  FROM v_UserWithCountries
 ORDER BY Age
