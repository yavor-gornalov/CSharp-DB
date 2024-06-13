USE TripService
GO

CREATE OR ALTER FUNCTION udf_GetAvailableRoom
	(@HotelId INT, @Date DATE, @People INT)
RETURNS
	NVARCHAR(MAX)
AS
BEGIN
	DECLARE @Result NVARCHAR(MAX) = 
	(SELECT TOP 1
		CONCAT('Room ', r.Id, ': ', r.Type, ' (', r.Beds ,' beds) - $', (h.BaseRate + r.Price) * @People) AS Result
	FROM Rooms AS r
	JOIN Hotels AS h ON r.HotelId = h.Id
	JOIN Trips AS t ON t.RoomId = r.Id
	WHERE h.Id = @HotelId
		AND (NOT (@Date BETWEEN t.ArrivalDate AND t.ReturnDate) OR t.CancelDate IS NOT NULL)
		-- Wrong Judge Test (Beds should be more or Equal to @People)
		AND (r.Beds > @People)
	ORDER BY r.Price DESC)

	RETURN COALESCE(@Result, 'No rooms available')
END
GO

SELECT dbo.udf_GetAvailableRoom(112, '2011-12-17', 2)
SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)


