USE NationalTouristSitesOfBulgaria
GO

SELECT
	t.Name
	, t.Age
	, t.PhoneNumber
	, t.Nationality
	, COALESCE(b.Name, '(no bonus prize)') AS Reward
FROM Tourists AS t
LEFT JOIN TouristsBonusPrizes AS tb ON tb.TouristId = t.Id
LEFT JOIN BonusPrizes AS b ON tb.BonusPrizeId = b.Id
ORDER BY t.Name
