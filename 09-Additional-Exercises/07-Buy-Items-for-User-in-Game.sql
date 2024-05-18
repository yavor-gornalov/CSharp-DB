USE Diablo
GO

BEGIN TRANSACTION

	-- Get UserGameId
	DECLARE @userGameId INT
	SELECT TOP 1 
		@userGameId =  ugi.UserGameId
	FROM Users AS u
	JOIN UsersGames AS ug ON u.Id = ug.UserId
	JOIN Games AS g ON ug.GameId = g.Id
	JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
	WHERE u.Username = 'Alex' AND g.Name = 'Edinburgh'

	-- Get items prices
    DECLARE @Items TABLE (ItemId INT, Price MONEY)
	INSERT INTO @Items 
		(ItemId, Price)
    SELECT 
		i.Id, 
		i.Price
	FROM Items AS i 
	WHERE i.Name IN ('Blackguard'
					,'Bottomless Potion of Amplification'
					,'Eye of Etlich (Diablo III)'
					,'Gem of Efficacious Toxin'
					,'Golden Gorget of Leoric'
					,'Hellfire Amulet');

	-- Insert item's Ids in UsersGameItems table 
    INSERT INTO UserGameItems 
		(ItemId, UserGameId)
    SELECT 
		ItemId
		,@userGameId 
	FROM @Items

	-- Calculate items price
    DECLARE @TotalPrice MONEY;
    SELECT @TotalPrice = SUM(Price) FROM @Items;

	-- Update user cash by removing items price
    UPDATE ug
    SET Cash = Cash - @TotalPrice
    FROM UsersGames AS ug
    JOIN Users u ON ug.UserId = u.Id
    JOIN Games g ON ug.GameId = g.Id
    WHERE u.Username = 'Alex' AND g.Name = 'Edinburgh';

	-- Get demanded result
	SELECT
		u.Username AS [Username]
		,g.Name AS [Name]
		,ug.Cash AS [Cash]
		,i.Name AS [Item Name]
	FROM Users AS u
	JOIN UsersGames AS ug ON u.Id = ug.UserId
	JOIN Games AS g ON ug.GameId = g.Id
	JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
	JOIN Items AS i ON ugi.ItemId = i.Id
	WHERE g.Name = 'Edinburgh'
	ORDER BY i.Name

ROLLBACK TRANSACTION