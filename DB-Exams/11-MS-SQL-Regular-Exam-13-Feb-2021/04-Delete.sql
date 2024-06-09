USE Bitbucket
GO

BEGIN TRANSACTION

DECLARE @RepoIdToDelete INT
SET @RepoIdToDelete = (SELECT Id FROM Repositories WHERE Name = 'Softuni-Teamwork')

DECLARE @CommitsToDelete TABLE (CommitId INT)
INSERT INTO @CommitsToDelete
SELECT
	Id
FROM Commits WHERE RepositoryId = @RepoIdToDelete

DELETE
FROM RepositoriesContributors 
WHERE RepositoryId = @RepoIdToDelete

DELETE
FROM Issues
WHERE RepositoryId = @RepoIdToDelete

DELETE 
FROM Files
WHERE CommitId IN (SELECT CommitId FROM @CommitsToDelete)

DELETE
FROM Commits
WHERE Id IN (SELECT CommitId FROM @CommitsToDelete)

DELETE
FROM Repositories 
WHERE Id = @RepoIdToDelete

ROLLBACK TRANSACTION
