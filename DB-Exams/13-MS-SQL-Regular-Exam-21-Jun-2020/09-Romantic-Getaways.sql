USE TripService
GO

SELECT
	a.Id
	, a.Email
	, ht.Name AS CITY
	, COUNT(*) AS Trips
	
FROM Accounts AS a
JOIN AccountsTrips AS at ON at.AccountId = a.Id
JOIN Trips AS t ON at.TripId = t.Id
JOIN Rooms AS r ON t.RoomId = r.Id
JOIN Hotels AS h ON r.HotelId = h.Id
JOIN Cities AS c ON h.CityId = c.Id
JOIN Cities AS ht ON a.CityId = ht.Id
WHERE c.Id = ht.Id
GROUP BY a.Id, a.Email, ht.Name
ORDER BY Trips DESC, a.Id
