USE Accounting
GO

BEGIN TRANSACTION

DECLARE @ClientsToDelete TABLE 
(
    Id INT
);

INSERT INTO @ClientsToDelete (Id)
SELECT Id
FROM Clients
WHERE NumberVAT LIKE 'IT%';

DELETE
FROM Invoices 
WHERE ClientId IN (SELECT Id FROM @ClientsToDelete)

DELETE
FROM ProductsClients 
WHERE ClientId IN (SELECT Id FROM @ClientsToDelete)

DELETE
FROM Clients 
WHERE Id IN (SELECT Id FROM @ClientsToDelete)

ROLLBACK TRANSACTION