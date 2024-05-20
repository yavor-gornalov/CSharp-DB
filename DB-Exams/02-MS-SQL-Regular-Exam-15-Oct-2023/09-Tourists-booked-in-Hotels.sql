USE TouristAgency
GO

SELECT
	h.Name AS HotelName
	,r.Price AS RoomPrice
FROM Tourists AS t
JOIN Bookings AS b ON b.TouristId = t.Id
JOIN Hotels AS h ON h.Id = b.HotelId
JOIN Rooms AS r ON r.Id = b.RoomId
WHERE t.Name NOT LIKE '%ez'
ORDER BY r.Price DESC
