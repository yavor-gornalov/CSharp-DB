USE WMS
GO

SELECT
	CONCAT(m.FirstName, ' ', m.LastName) AS Available
FROM Mechanics AS m
LEFT JOIN Jobs AS j ON j.MechanicId = m.MechanicId
WHERE j.Status = 'Finished' OR j.JobId IS NULL
GROUP BY m.MechanicId, m.FirstName, m.LastName
ORDER BY m.MechanicId
