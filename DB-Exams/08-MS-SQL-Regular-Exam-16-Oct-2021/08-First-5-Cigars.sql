USE CigarShop
GO

SELECT TOP 5
	c.CigarName
	, PriceForSingleCigar
	, ImageURL

FROM Cigars AS c
JOIN Sizes AS s ON c.SizeId = s.Id

WHERE (s.Length >= 12 
	AND (c.CigarName LIKE '%ci%' OR (c.PriceForSingleCigar > 50) 
	AND s.RingRange > 2.55) )

ORDER BY c.CigarName, c.PriceForSingleCigar DESC
