USE RailwaysDb
GO

DECLARE @trainId INT
SELECT TOP 1 
	@trainId = tr.Id 
FROM Trains AS tr
JOIN Towns AS t ON tr.DepartureTownId = t.Id
WHERE t.Name = 'Berlin';

DELETE 
FROM MaintenanceRecords
WHERE TrainId =@trainId

DELETE
FROM Tickets
WHERE TrainId = @trainId

DELETE
FROM TrainsRailwayStations
WHERE TrainId = @trainId

DELETE
FROM Trains 
WHERE Id = @trainId		