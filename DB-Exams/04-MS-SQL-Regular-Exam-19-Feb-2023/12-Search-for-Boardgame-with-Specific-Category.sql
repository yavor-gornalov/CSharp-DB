USE Boardgames
GO

CREATE OR ALTER PROC usp_SearchByCategory(@category NVARCHAR(50)) 
AS
SELECT
	b.Name
	, b.YearPublished
	, b.Rating
	, c.Name AS CategoryName
	, p.Name AS PublisherName
	, CONCAT(pr.PlayersMin, ' people') AS MinPlayers
	, CONCAT(pr.PlayersMax, ' people') AS MaxPlayers
FROM Boardgames AS b
JOIN Categories AS c ON b.CategoryId = c.Id
	AND c.Name = @category
JOIN Publishers AS p ON b.PublisherId = p.Id
JOIN PlayersRanges AS pr ON b.PlayersRangeId = pr.Id
ORDER BY PublisherName, YearPublished DESC
GO

EXEC usp_SearchByCategory 'Wargames'
