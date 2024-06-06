USE CigarShop
GO

BEGIN TRANSACTION

UPDATE c
	SET PriceForSingleCigar *= 1.2
FROM Cigars AS c
JOIN Tastes AS t ON c.TastId = t.Id
WHERE t.TasteType = 'Spicy'

UPDATE Brands
	SET BrandDescription = 'New description'
WHERE BrandDescription IS NULL

ROLLBACK TRANSACTION
