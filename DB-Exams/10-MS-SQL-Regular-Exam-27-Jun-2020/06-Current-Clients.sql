USE WMS
GO

SELECT
	CONCAT(c.FirstName, ' ', c.LastName) AS Client
	, DATEDIFF(DAY, j.IssueDate, '2017-04-24') AS "Days going"
	, j.Status
FROM Clients AS c
LEFT JOIN  Jobs AS j ON j.ClientId = c.ClientId
WHERE j.Status <> 'Finished'
