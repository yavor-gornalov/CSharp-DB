USE Diablo
GO

SELECT
	u.Username AS [Username]
	,g.Name AS [Game]
	,MAX(c.Name) AS [Character]
	,SUM(itmStats.Strength) + MAX(charStats.Strength) + MAX(bonusStats.Strength) AS [Strength]
	,SUM(itmStats.Defence) + MAX(charStats.Defence) + MAX(bonusStats.Defence) AS [Defence]
	,SUM(itmStats.Speed) + MAX(charStats.Speed) + MAX(bonusStats.Speed) AS [Speed]
	,SUM(itmStats.Mind) + MAX(charStats.Mind) + MAX(bonusStats.Mind) AS [Mind]
	,SUM(itmStats.Luck) + MAX(charStats.Luck) + MAX(bonusStats.Luck) AS [Luck]
FROM Users AS u
JOIN UsersGames AS ug ON u.Id = ug.UserId
JOIN Games AS g ON ug.GameId = g.Id
JOIN Characters AS c ON ug.CharacterId = c.Id
JOIN [Statistics] AS charStats ON c.StatisticId = charStats.Id
JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
JOIN Items AS i ON ugi.ItemId = i.Id
JOIN [Statistics] AS itmStats ON itmStats.Id = i.StatisticId 
JOIN GameTypes AS gt ON g.GameTypeId = gt.Id
JOIN [Statistics] AS bonusStats ON gt.BonusStatsId = bonusStats.Id

GROUP BY u.Username, g.Name
ORDER BY [Strength] DESC, [Defence] DESC, [Speed] DESC, [Mind] DESC, [Luck] DESC
