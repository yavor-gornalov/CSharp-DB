USE CigarShop
GO

BEGIN TRANSACTION

DECLARE @AddressesToDelete TABLE (
	AddressId INT
)

INSERT INTO @AddressesToDelete
SELECT 
	Id
FROM Addresses
WHERE LEFT(Country, 1) = 'c'

DECLARE @ClientsToDelete TABLE (
	ClientId INT
)

INSERT INTO @ClientsToDelete
SELECT
	Id
FROM Clients
WHERE AddressId IN (SELECT AddressId FROM @AddressesToDelete)

DELETE
FROM Clients
WHERE Id IN (SELECT ClientId FROM @ClientsToDelete)

DELETE
FROM Addresses 
WHERE Id IN (SELECT AddressId FROM @AddressesToDelete)

ROLLBACK TRANSACTION
