USE Bitbucket
GO

SELECT TOP 5
	r.Id
	, r.Name
	, COUNT(rc.ContributorId) AS Commits
FROM Repositories AS r
JOIN Commits AS c ON r.Id = c.RepositoryId
JOIN  RepositoriesContributors AS rc ON rc.RepositoryId = r.Id
GROUP BY r.Id, r.Name
ORDER BY Commits DESC, r.Id, r.Name

