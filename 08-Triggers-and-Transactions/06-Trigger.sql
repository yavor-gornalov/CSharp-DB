USE Diablo
GO

--Add bonus cash of 50000 to users: baleremuda, loosenoise, inguinalself, buildingdeltoid, monoxidecos in the game "Bali".
UPDATE UsersGames
SET Cash = Cash + 50000
FROM UsersGames AS ug
JOIN Games AS g ON g.Id = ug.GameId
JOIN Users AS u ON u.Id = ug.UserId
WHERE g.Name = 'Bali' AND
	u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos')
GO 

CREATE TRIGGER tr_RestrictBuyingItems
ON UserGameItems
INSTEAD OF INSERT 
AS
BEGIN
    INSERT INTO UserGameItems
    SELECT
		it.Id,
		ug.Id
    FROM Inserted AS i
    JOIN UsersGames AS ug ON i.UserGameId = ug.Id
    JOIN Items AS it ON i.ItemId = it.Id
    WHERE ug.Level >= it.MinLevel
END
GO

CREATE PROC
	usp_BuyItems(@Username NVARCHAR(50)) AS
BEGIN
    DECLARE @UserId INT =
						(SELECT [dbo].[Users].[Id]
						 FROM [dbo].[Users]
						 WHERE [dbo].[Users].[Username] = @Username)
    DECLARE @GameId INT=
						(SELECT [dbo].[Games].[Id]
						 FROM [dbo].[Games]
						 WHERE [dbo].[Games].[Name] = 'Bali')
    DECLARE @UserGameId INT=
						(SELECT [dbo].[UsersGames].[Id]
						 FROM [dbo].[UsersGames]
						 WHERE [dbo].[UsersGames].[UserId] = @UserId AND [dbo].[UsersGames].[GameId] = @GameId)
    DECLARE @UserGameLevel INT=
						(SELECT [dbo].[UsersGames].[Level]
						 FROM [dbo].[UsersGames]
						 WHERE [dbo].[UsersGames].[Id] = @UserGameId)
    DECLARE @IdCounter INT = 251;

    WHILE @IdCounter <= 539
        BEGIN
            DECLARE @ItemId INT = @IdCounter;
            DECLARE @ItemPrice money =
						(SELECT [dbo].[Items].[Price]
						 FROM [dbo].[Items]
						 WHERE [dbo].[Items].[Id] = @ItemId)
            DECLARE @ItemLevel INT=
						(SELECT [dbo].[Items].[MinLevel]
						 FROM [dbo].[Items]
						 WHERE [dbo].[Items].[Id] = @ItemId)
            DECLARE @UserGameCash money=
						(SELECT [dbo].[UsersGames].[Cash]
						 FROM [dbo].[UsersGames]
						 WHERE [dbo].[UsersGames].[Id] = @UserGameId)

            IF (@UserGameCash >= @ItemPrice AND @UserGameLevel >= @ItemLevel)
                BEGIN
                    UPDATE
						[dbo].[UsersGames]
                    SET
						[dbo].[UsersGames].[Cash] -= @ItemPrice
                    WHERE
						[dbo].[UsersGames].[Id] = @UserGameId
                    INSERT INTO
						[dbo].[UserGameItems]
                    VALUES
						(@ItemId, @UserGameId)
                END

            SET @IdCounter+=1;
            IF (@IdCounter = 300)
                BEGIN
                    SET @IdCounter = 501;
                END
        END
END

GO

EXEC usp_BuyItems 'baleremuda'
EXEC usp_BuyItems 'loosenoise'
EXEC usp_BuyItems 'inguinalself'
EXEC usp_BuyItems 'buildingdeltoid'
EXEC usp_BuyItems 'monoxidecos'

GO

---

SELECT
	[dbo].[Users].[Username] AS [Username],
    [dbo].[Games].[Name] AS [Name],
    [dbo].[UsersGames].[Cash] AS [Cash],
    [dbo].[Items].[Name] AS [Item Name]
FROM
	[dbo].[UsersGames]
JOIN
	[dbo].[Users]
	ON [dbo].[Users].[Id] = [dbo].[UsersGames].[UserId]
JOIN
	[dbo].[Games]
	ON [dbo].[Games].[Id] = [dbo].[UsersGames].[GameId]
JOIN
	[dbo].[Items]
	ON [dbo].[Games].[Name] = [dbo].[Items].[Name]
WHERE
	[dbo].[Games].[Name] = 'Bali'
ORDER BY
	[Username] ASC,
	[Item Name] ASC

GO