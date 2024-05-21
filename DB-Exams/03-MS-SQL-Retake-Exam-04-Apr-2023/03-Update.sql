USE Accounting
GO

BEGIN TRANSACTION

UPDATE Invoices
	SET DueDate = '2023-04-01'
WHERE IssueDate BETWEEN '2022-11-01' AND '2022-11-30'

UPDATE Clients
	SET AddressId = 3 
					--(SELECT 
					--	a.Id
					--FROM Addresses AS a JOIN Countries AS c ON a.CountryId = c.Id
					--WHERE StreetName = 'Industriestr' AND StreetNumber = 79 AND
					--PostCode = 2353 AND City = 'Guntramsdorf' AND c.Name = 'Austria')
WHERE Id IN (SELECT
				c.AddressId
			FROM Clients AS c
			WHERE c.Name LIKE '%CO%')

ROLLBACK TRANSACTION