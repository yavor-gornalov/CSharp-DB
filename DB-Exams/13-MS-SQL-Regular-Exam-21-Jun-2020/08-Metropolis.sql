USE TripService
GO

SELECT TOP 10
	c.Id
	, c.Name AS City
	, c.CountryCode AS Country
	, COUNT(*) AS Accounts
FROM Cities AS c
JOIN Accounts AS a ON a.CityId = c.Id
GROUP BY c.Id, c.Name, c.CountryCode
ORDER BY Accounts DESC
