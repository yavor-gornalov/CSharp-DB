USE WMS
GO

BEGIN TRANSACTION

DECLARE @PendingJobs TABLE (JobId INT)

INSERT INTO @PendingJobs 
SELECT JobId FROM Jobs WHERE Status = 'Pending' 

UPDATE Jobs 
	SET MechanicId = (SELECT TOP 1
						MechanicId
					FROM Mechanics WHERE FirstName = 'Ryan' AND LastName = 'Harnos') 
WHERE JobId IN (SELECT JobId FROM @PendingJobs) 

UPDATE Jobs 
	SET Status = 'In Progress'
WHERE JobId IN (SELECT JobId FROM @PendingJobs) 

ROLLBACK TRANSACTION
