USE Diablo
GO

WITH EmailProviders AS (
    SELECT
        SUBSTRING(
			u.Email, 
			CHARINDEX('@', u.Email, 1) + 1, 
			LEN(u.Email)
		) AS Provider
    FROM Users AS u
)
SELECT
    Provider AS [Email Provider],
    COUNT(*) AS [Number Of Users]
FROM EmailProviders
GROUP BY Provider
ORDER BY [Number Of Users] DESC, [Email Provider];
