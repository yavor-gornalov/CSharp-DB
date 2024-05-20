USE TouristAgency
GO

SELECT
	FORMAT(b.ArrivalDate, 'yyyy-MM-dd') AS ArrivalDate
	,b.AdultsCount
	,b.ChildrenCount
FROM Bookings AS b
JOIN Rooms AS r ON r.Id = b.RoomId
ORDER BY r.Price DESC, b.ArrivalDate
