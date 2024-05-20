USE RailwaysDb
GO

CREATE OR ALTER PROC usp_SearchByTown(@townName NVARCHAR(30))
AS
SELECT
	p.Name AS PassengerName
	,tc.DateOfDeparture AS DateOfDeparture
	,tr.HourOfDeparture AS HourOfDeparture
FROM Passengers AS p
JOIN Tickets AS tc ON p.Id = tc.PassengerId
JOIN Trains AS tr ON tc.TrainId = tr.Id
JOIN Towns AS tn ON tr.ArrivalTownId = tn.Id
WHERE tn.Name = @townName
ORDER BY DateOfDeparture DESC, PassengerName
GO

EXEC usp_SearchByTown 'Berlin'