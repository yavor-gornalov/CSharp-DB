USE Boardgames
GO

SELECT
	CONCAT_WS(' ', c.FirstName, c.LastName) AS FullName
	, c.Email
	, MAX(b.Rating) AS Rating
FROM Creators AS c
JOIN CreatorsBoardgames AS cb ON cb.CreatorId = c.Id
JOIN Boardgames AS b ON cb.BoardgameId = b.Id
WHERE RIGHT(c.Email,4) = '.com'
GROUP BY CONCAT_WS(' ', c.FirstName, c.LastName), c.Email
ORDER BY FullName ASC
