USE Diablo
GO

CREATE OR ALTER FUNCTION ufn_CashInUsersGames(@gameName NVARCHAR(50))
RETURNS TABLE
AS
	RETURN
	(
		SELECT 
			SUM(dt.Cash) AS SumCash
		FROM 
			(SELECT
				ROW_NUMBER() OVER (ORDER BY ug.Cash DESC) AS RowNumber
				,ug.Cash
			FROM UsersGames AS ug 
			JOIN Games AS g ON ug.GameId = g.Id
			WHERE g.Name = @gameName) AS dt
		WHERE dt.RowNumber % 2 <> 0
	)
GO

--DECLARE @gameName NVARCHAR(50) = 'Nerine'
DECLARE @gameName NVARCHAR(50) = 'Love in a mist'
