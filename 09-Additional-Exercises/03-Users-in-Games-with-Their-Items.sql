USE Diablo
GO

SELECT
	u.Username AS [Username]
	,g.Name AS [Game]
	,COUNT(*) AS [Items Count]
	,SUM(i.Price) AS [Items Price]
FROM Games AS g
JOIN UsersGames AS ug ON g.Id = ug.GameId
JOIN UserGameItems AS ugi ON ug.Id = ugi.UserGameId
JOIN Users AS u ON ug.UserId = u.Id
JOIN Items AS i ON ugi.ItemId = i.Id

GROUP BY u.Username, g.Name
HAVING COUNT(*) >= 10
ORDER BY [Items Count] DESC, [Items Price] DESC, [Username]
