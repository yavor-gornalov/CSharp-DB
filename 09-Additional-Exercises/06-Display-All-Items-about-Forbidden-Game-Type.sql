USE Diablo
GO

SELECT
	i.Name AS [Item]
	, i.Price AS [Price]
	, i.MinLevel AS [MinLevel]
	, gt.Name AS [Forbidden Game Type]
FROM Items AS i
LEFT JOIN GameTypeForbiddenItems AS f ON i.Id = f.ItemId
LEFT JOIN GameTypes AS gt ON f.GameTypeId = gt.Id
ORDER BY [Forbidden Game Type] DESC, [Item]
