USE NationalTouristSitesOfBulgaria
GO

CREATE OR ALTER PROC usp_AnnualRewardLottery
	(@TouristName VARCHAR(50))
AS
UPDATE Tourists
SET Reward = CASE 
		WHEN (SELECT COUNT(*) FROM SitesTourists WHERE TouristId = Tourists.Id) >= 100 THEN 'Gold badge'
		WHEN (SELECT COUNT(*) FROM SitesTourists WHERE TouristId = Tourists.Id) >= 50 THEN 'Silver badge'
		WHEN (SELECT COUNT(*) FROM SitesTourists WHERE TouristId = Tourists.Id) >= 25 THEN 'Bronze badge'
	ELSE Reward
END
WHERE Name = @TouristName
SELECT Name, Reward FROM Tourists WHERE Name = @TouristName
GO

EXEC usp_AnnualRewardLottery 'Gerhild Lutgard'
