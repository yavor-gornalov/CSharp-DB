USE Diablo
GO

SELECT
	g.Name AS [Game]
	,gt.Name AS [Game Type]
	,u.Username
	,ug.Level
	,ug.Cash
	,c.Name AS [Character]
FROM Users AS u
JOIN UsersGames AS ug ON u.Id = ug.UserId
JOIN Games AS g ON ug.GameId = g.Id
JOIN GameTypes AS gt ON gt.Id = g.GameTypeId
JOIN Characters AS c ON  c.Id = ug.CharacterId
ORDER BY ug.Level DESC, u.Username, g.Name 
