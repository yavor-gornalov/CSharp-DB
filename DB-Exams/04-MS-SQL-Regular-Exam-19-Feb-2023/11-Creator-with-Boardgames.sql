USE Boardgames
GO

CREATE OR ALTER FUNCTION udf_CreatorWithBoardgames
	(@name NVARCHAR(30)) 
RETURNS INT
AS
BEGIN
RETURN
(
	SELECT
		COUNT(cb.BoardgameId)
	FROM Creators AS c
	JOIN CreatorsBoardgames AS cb ON cb.CreatorId = c.Id 
		AND c.FirstName = @name
)
END
GO

SELECT dbo.udf_CreatorWithBoardgames('Bruno')
