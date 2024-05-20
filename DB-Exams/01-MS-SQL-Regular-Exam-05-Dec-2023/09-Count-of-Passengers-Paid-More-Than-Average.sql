USE RailwaysDb
GO

SELECT
	tn.Name AS TownName
	,COUNT(*) AS PassengersCount
FROM Tickets AS t
JOIN Trains AS tr ON t.TrainId = tr.Id
JOIN Towns AS tn ON tr.ArrivalTownId = tn.Id
WHERE t.Price > 76.99
GROUP BY tn.Name
ORDER BY TownName
