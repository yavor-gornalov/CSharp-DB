USE TripService
GO

SELECT
	t.Id
	, CONCAT_WS(' ', a.FirstName, a.MiddleName, a.LastName) AS [Full Name]
	, ht.Name AS [From]
	, c.Name AS [To]
	, CASE 
		WHEN t.CancelDate IS NOT NULL THEN 'Canceled'
		ELSE CONCAT(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate), ' days')
	END AS Duration
FROM Trips AS t
JOIN AccountsTrips AS at ON at.TripId = t.Id
JOIN Accounts AS a ON at.AccountId = a.Id
JOIN Cities AS ht ON a.CityId = ht.Id
JOIN Rooms AS r ON t.RoomId = r.Id
JOIN Hotels AS h ON r.HotelId = h.Id
JOIN Cities AS c ON h.CityId = c.Id
ORDER BY [Full Name], t.Id
