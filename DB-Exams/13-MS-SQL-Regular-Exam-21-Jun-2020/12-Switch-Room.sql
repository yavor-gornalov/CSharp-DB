USE TripService
GO

CREATE OR ALTER PROC usp_SwitchRoom
	(@TripId INT, @TargetRoomId INT)
AS
BEGIN 
	DECLARE @HotelId INT = 
	(SELECT HotelId 
	FROM Rooms AS r 
	JOIN Trips AS t ON t.RoomId = r.Id 
	WHERE t.Id = @TripId)
	
	DECLARE @People INT = 
	(SELECT 
		COUNT(*) 
	FROM Trips AS T 
	JOIN AccountsTrips AS at ON at.TripId = t.Id 
	WHERE t.Id = @TripId GROUP BY t.Id)

	IF ( NOT EXISTS (SELECT * FROM Rooms WHERE Id = @TargetRoomId AND HotelId = @HotelId))	
		THROW 50001, 'Target room is in another hotel!', 1

	IF ( NOT EXISTS (SELECT * FROM Rooms WHERE Id = @TargetRoomId AND Beds >= @People))
		THROW 50002, 'Not enough beds in target room!', 1

	UPDATE Trips
	SET RoomId = @TargetRoomId
	WHERE Id = @TripId
END
GO

--EXEC usp_SwitchRoom 10, 7

--EXEC usp_SwitchRoom 10, 8

EXEC usp_SwitchRoom 10, 11
SELECT RoomId FROM Trips WHERE Id = 10
