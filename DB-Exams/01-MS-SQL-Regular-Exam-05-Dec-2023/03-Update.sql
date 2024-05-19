USE RailwaysDb
GO

UPDATE Tickets
	SET DateOfDeparture = DATEADD (DAY , 7 , DateOfDeparture)	
WHERE DateOfDeparture >= '2023-11-01'
UPDATE Tickets
	SET DateOfArrival = DATEADD (DAY , 7 , DateOfArrival)	
WHERE DateOfDeparture >= '2023-11-01'
