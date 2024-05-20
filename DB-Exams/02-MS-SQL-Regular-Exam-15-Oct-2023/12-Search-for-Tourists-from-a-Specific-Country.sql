USE TouristAgency
GO

CREATE OR ALTER PROC 
	usp_SearchByCountry(@country NVARCHAR(50)) 
AS
SELECT
	t.Name
	,t.PhoneNumber
	,t.Email
	,COUNT(*) AS CountOfBookings
FROM Bookings AS b
JOIN Tourists AS t ON b.TouristId = t.Id
JOIN Countries AS c ON t.CountryId = c.Id
WHERE c.Name = @country
GROUP BY t.Name, t.PhoneNumber, t.Email
ORDER BY t.Name, CountOfBookings DESC
GO

EXEC usp_SearchByCountry 'Greece'

