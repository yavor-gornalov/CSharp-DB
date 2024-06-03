USE Airport
GO

SELECT
	p.FullName
	, COUNT(f.AircraftId) AS CountOfAircraft
	, SUM(f.TicketPrice) AS TotalPayed
FROM Passengers AS p
JOIN FlightDestinations AS f ON f.PassengerId = p.Id
WHERE SUBSTRING(p.FullName,2,1) = 'a'
GROUP BY p.FullName
HAVING COUNT(f.AircraftId) > 1
ORDER BY p.FullName
