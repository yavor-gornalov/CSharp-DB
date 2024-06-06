USE CigarShop
GO

CREATE OR ALTER FUNCTION udf_ClientWithCigars
	(@name NVARCHAR(30))
RETURNS INT
AS
BEGIN
	RETURN (
		SELECT
			COUNT(cg.CigarId)
		FROM Clients AS c
		JOIN ClientsCigars AS cg ON cg.ClientId = c.Id
		WHERE c.FirstName = @name
	)
END
GO

SELECT dbo.udf_ClientWithCigars('Betty')
