USE Airport
GO

SELECT
	a.AirportName
	, f.Start AS DayTime
	, f.TicketPrice
	, p.FullName
	, c.Manufacturer
	, c.Model
FROM FlightDestinations AS f
JOIN Airports AS a ON f.AirportId = a.Id
JOIN Passengers AS p ON f.PassengerId = p.Id
JOIN Aircraft AS c ON f.AircraftId = c.Id
WHERE FORMAT(f.Start, 'HH:MM') BETWEEN '06:00' AND '20:00'
	AND f.TicketPrice > 2500
ORDER BY c.Model