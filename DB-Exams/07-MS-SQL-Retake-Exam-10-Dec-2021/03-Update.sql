USE Airport
GO

BEGIN TRANSACTION

UPDATE Aircraft
	SET Condition = 'A'
WHERE Condition IN ('b', 'c')
	AND (FlightHours IS NULL OR FlightHours <= 100)
	AND Year >= 2013

ROLLBACK TRANSACTION
