USE Bakery
GO

SELECT
	c.FirstName
	, c.Age
	, c.PhoneNumber
FROM Customers AS c
JOIN Countries AS t ON c.CountryId = t.Id
WHERE (c.Age >= 21 AND c.FirstName LIKE '%an%')
	OR (c.PhoneNumber LIKE '%38' AND t.Name <> 'Greece')
ORDER BY c.FirstName, c.Age DESC
