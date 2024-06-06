USE CigarShop
GO

SELECT
	c.LastName
	, AVG(s.Length) AS CiagrLength
	, CEILING(AVG(s.RingRange))AS CiagrRingRange
FROM Clients AS c
JOIN ClientsCigars AS cg ON cg.ClientId = c.Id
JOIN Cigars AS g ON cg.CigarId = g.Id
JOIN Sizes AS s ON g.SizeId = s.Id
WHERE cg.CigarId IS NOT NULL
GROUP BY c.LastName
ORDER BY CiagrLength DESC
