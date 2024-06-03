USE Airport
GO

CREATE OR ALTER FUNCTION udf_FlightDestinationsByEmail
	(@email VARCHAR(50))
RETURNS INT
AS
BEGIN
RETURN (
	SELECT
		COUNT(*)
	FROM Passengers AS p
	JOIN FlightDestinations AS f ON f.PassengerId = p.Id
	WHERE p.Email = @email)
END
GO

SELECT dbo.udf_FlightDestinationsByEmail('Montacute@gmail.com')
