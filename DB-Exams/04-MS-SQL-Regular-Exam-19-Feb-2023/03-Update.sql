USE Boardgames
GO

BEGIN TRANSACTION

UPDATE PlayersRanges
	SET PlayersMax = 3
WHERE PlayersMin = 2 AND PlayersMax = 2

UPDATE Boardgames
	SET Name += 'V2'
WHERE YearPublished >= 2020

ROLLBACK TRANSACTION