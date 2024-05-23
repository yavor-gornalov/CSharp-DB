USE Boardgames
GO

SELECT 
	c.Id
	, CONCAT_WS(' ', c.FirstName, c.LastName) AS CreatorName
	, c.Email
FROM Creators AS c
LEFT JOIN CreatorsBoardgames AS bc ON bc.CreatorId = c.Id
WHERE bc.BoardgameId IS NULL
