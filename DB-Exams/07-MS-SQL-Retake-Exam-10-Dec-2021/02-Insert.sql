USE Airport
GO

BEGIN TRANSACTION

INSERT INTO Passengers
	(FullName, Email)
SELECT
	CONCAT(p.FirstName, ' ', p.LastName) AS FullName  
	, CONCAT(p.FirstName, p.LastName, '@gmail.com') AS Email 
FROM Pilots AS p
WHERE p.Id BETWEEN 5 AND 15

ROLLBACK TRANSACTION
