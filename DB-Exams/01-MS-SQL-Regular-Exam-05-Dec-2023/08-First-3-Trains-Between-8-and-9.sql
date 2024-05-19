USE RailwaysDb
GO

SELECT TOP 3
	TrainId
	,HourOfDeparture
	,tc.Price AS TicketPrice
	,t.Name AS Destination
FROM Trains AS tr
JOIN Tickets AS tc ON tc.TrainId = tr.Id
JOIN Towns AS t ON tr.ArrivalTownId = t.Id
WHERE tc.Price > 50 AND tr.HourOfDeparture BETWEEN '08:00' AND '08:59'
ORDER BY TicketPrice
