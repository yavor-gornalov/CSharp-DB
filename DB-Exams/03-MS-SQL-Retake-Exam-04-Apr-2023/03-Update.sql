USE Accounting
GO

BEGIN TRANSACTION

UPDATE Invoices
	SET DueDate = '2023-04-01'
WHERE YEAR(IssueDate) = 2022 AND MONTH(IssueDate) = 11

DECLARE @ClientsToUpdate TABLE 
(
	Id INT
)
INSERT INTO @ClientsToUpdate
SELECT
	Id
FROM Clients
WHERE Name LIKE '%CO%'

DECLARE @NewAddresId INT = (SELECT 
								a.Id
							FROM Addresses AS a JOIN Countries AS c ON a.CountryId = c.Id
							WHERE StreetName = 'Industriestr' AND StreetNumber = 79 AND
							PostCode = 2353 AND City = 'Guntramsdorf' AND c.Name = 'Austria')

UPDATE Clients
	SET AddressId = @NewAddresId
WHERE Id IN (SELECT Id FROM @ClientsToUpdate)

ROLLBACK TRANSACTION