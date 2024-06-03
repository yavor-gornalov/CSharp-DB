USE Airport
GO

SELECT DISTINCT
	a.Id
	, a.Manufacturer
	, a.FlightHours
	, COUNT(fd.AirportId) AS FlightDestinationsCount
	, ROUND(AVG(fd.TicketPrice), 2) AS AvgPrice
FROM Aircraft AS a
JOIN FlightDestinations AS fd ON fd.AircraftId = a.Id
GROUP BY a.Id, a.Manufacturer, a.FlightHours
HAVING COUNT(fd.AirportId) >= 2
ORDER BY FlightDestinationsCount DESC, a.Id
