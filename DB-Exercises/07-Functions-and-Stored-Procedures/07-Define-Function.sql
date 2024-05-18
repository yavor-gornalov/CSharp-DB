CREATE OR ALTER FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(MAX), @word NVARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @i INT = 1
	WHILE @i <= LEN(@setOfLetters)
	BEGIN
		DECLARE @Symbol CHAR = SUBSTRING(LOWER(@setOfLetters), @i, 1 )
		IF (CHARINDEX(@Symbol, LOWER(@word)) <> 0) 
			SET @word = REPLACE(@word, @Symbol, '' )
		SET @i = @i + 1
	END
	IF (LEN(@word) = 0)
		RETURN 1
	RETURN 0
END
GO

WITH TestData (SetOfLetters, Word) AS (
    SELECT * FROM 
	(VALUES 
		('oistmiahf', 'Sofia')
		,('vdni', 'Vidin')
		,('pppppppp', 'Pleven')
		,('oistmiahf', 'halves')
		,('bobr', 'Rob')
		,('pppp', 'Guy')

    ) AS ValueTable(SetOfLetters, Word)
) 

SELECT 
	SetOfLetters
	,Word
	,dbo.ufn_IsWordComprised(SetOfLetters, Word) AS [Result]
FROM TestData;
