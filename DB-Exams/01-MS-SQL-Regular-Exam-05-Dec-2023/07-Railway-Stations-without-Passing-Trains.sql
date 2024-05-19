USE RailwaysDb
GO

SELECT
	t.Name AS Town
	,rs.Name AS RailwayStation
FROM RailwayStations AS rs
LEFT JOIN TrainsRailwayStations AS ts ON rs.Id = ts.RailwayStationId
JOIN Towns AS t ON rs.TownId = t.Id
WHERE ts.TrainId IS NULL
ORDER BY Town, RailwayStation
