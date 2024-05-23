USE Boardgames
GO

BEGIN TRANSACTION

DECLARE @AddressesToDelete TABLE(
	AddressId INT
) 
INSERT INTO @AddressesToDelete
SELECT Id FROM Addresses WHERE LEFT(Town, 1) = 'L'

DECLARE @PublishersToDelete TABLE(
	PublisherId INT
) 
INSERT INTO @PublishersToDelete
SELECT Id FROM Publishers WHERE AddressId IN (SELECT AddressId FROM @AddressesToDelete)

DECLARE @BoardgamesToDelete TABLE (
	BoardgameId INT
)
INSERT INTO @BoardgamesToDelete
SELECT Id FROM Boardgames WHERE PublisherId IN (SELECT PublisherId FROM @PublishersToDelete)


DELETE FROM CreatorsBoardgames WHERE BoardgameId IN (SELECT BoardgameId FROM @BoardgamesToDelete)
DELETE FROM Boardgames WHERE Id IN (SELECT BoardgameId FROM @BoardgamesToDelete)
DELETE FROM Publishers WHERE Id IN (SELECT PublisherId FROM @PublishersToDelete)
DELETE FROM Addresses WHERE Id IN (SELECT AddressId FROM @AddressesToDelete)

ROLLBACK TRANSACTION