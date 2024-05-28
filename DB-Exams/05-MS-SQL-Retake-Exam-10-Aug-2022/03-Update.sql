USE NationalTouristSitesOfBulgaria
GO

BEGIN TRANSACTION

UPDATE Sites
	SET Establishment = '(not defined)'
WHERE Establishment IS NULL

ROLLBACK TRANSACTION
