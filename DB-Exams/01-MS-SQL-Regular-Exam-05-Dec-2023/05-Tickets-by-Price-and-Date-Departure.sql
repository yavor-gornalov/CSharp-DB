USE RailwaysDb
GO

SELECT
	t.DateOfDeparture
	,t.Price
FROM Tickets AS t
ORDER BY t.Price, t.DateOfDeparture DESC