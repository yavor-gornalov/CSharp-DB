USE RailwaysDb
GO

SELECT
	tr.Id AS TrainID
	,tn.Name AS DepartureTown
	,m.Details AS Details
FROM MaintenanceRecords AS m
JOIN Trains AS tr ON m.TrainId = tr.Id
JOIN Towns AS tn ON tr.DepartureTownId = tn.Id
WHERE m.Details LIKE '%inspection%'
ORDER BY TrainId
