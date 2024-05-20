USE TouristAgency
GO

CREATE OR ALTER FUNCTION 
	udf_RoomsWithTourists(@name NVARCHAR(40)) 
RETURNS INT
AS
BEGIN
RETURN (
	SELECT
		SUM(b.AdultsCount + b.ChildrenCount)
	FROM Bookings AS b
	JOIN Rooms AS r ON b.RoomId = r.Id
	WHERE r.Type = @name
)
END
GO

SELECT dbo.udf_RoomsWithTourists('Double Room')