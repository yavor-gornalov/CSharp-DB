USE Diablo
GO

SELECT
	Name
	,Price
	,MinLevel
	,Strength
	,Defence
	,Speed
	,Luck
	,Mind
FROM Items AS i
JOIN [Statistics] AS s ON i.StatisticId = s.Id
WHERE 
	Mind > (SELECT AVG(Mind) FROM Items AS i JOIN [Statistics] AS s ON i.StatisticId = s.Id) AND
	Luck > (SELECT AVG(Luck) FROM Items AS i JOIN [Statistics] AS s ON i.StatisticId = s.Id) AND
	Speed > (SELECT AVG(Speed) FROM Items AS i JOIN [Statistics] AS s ON i.StatisticId = s.Id)
ORDER BY Name
