USE Bitbucket
GO

CREATE OR ALTER FUNCTION udf_AllUserCommits
	(@username VARCHAR(30))
RETURNS INT
AS
BEGIN
	RETURN
	(
		SELECT
		COUNT(*)
		FROM Commits AS c WHERE c.ContributorId IN 
			(SELECT Id FROM Users WHERE Username = @username)
	)
END
GO

SELECT dbo.udf_AllUserCommits('UnderSinduxrein')
