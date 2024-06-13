USE TripService
GO

SELECT 
	a.FirstName
	, a.LastName
	, FORMAT(BirthDate, 'MM-dd-yyyy') AS BirthDate
	, c.Name AS Hometown
	, a.Email
FROM Accounts AS a
JOIN Cities AS c ON a.CityId = c.Id
WHERE LEFT(a.Email, 1) = 'e'
ORDER BY Hometown
