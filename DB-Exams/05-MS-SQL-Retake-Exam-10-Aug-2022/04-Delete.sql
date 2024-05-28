USE NationalTouristSitesOfBulgaria
GO

BEGIN TRANSACTION

DECLARE @PrizeIdToRemove INT = (SELECT
									Id
								FROM BonusPrizes
								WHERE Name = 'Sleeping bag')
DELETE
FROM TouristsBonusPrizes
WHERE BonusPrizeId = @PrizeIdToRemove

DELETE
FROM BonusPrizes
WHERE Id = @PrizeIdToRemove

ROLLBACK TRANSACTION
