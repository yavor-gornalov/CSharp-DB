USE Airport
GO

CREATE OR ALTER PROC usp_SearchByAirportName
	(@airportName VARCHAR(70))
AS
SELECT
	AirportName
	, p.FullName
	, CASE
		WHEN f.TicketPrice <= 400 THEN 'Low'
		WHEN f.TicketPrice <= 1500 THEN 'Medium'
		ELSE 'High' 
	END AS LevelOfTickerPrice
	, c.Manufacturer
	, c.Condition
	, t.TypeName
FROM Airports AS a
JOIN FlightDestinations AS f ON f.AirportId = a.Id
JOIN Passengers AS p ON f.PassengerId = p.Id
JOIN Aircraft AS c ON f.AircraftId = c.Id
JOIN AircraftTypes AS t ON t.Id = c.TypeId
WHERE a.AirportName = @airportName
ORDER BY c.Manufacturer, p.FullName
GO

EXEC usp_SearchByAirportName 'Sir Seretse Khama International Airport'
