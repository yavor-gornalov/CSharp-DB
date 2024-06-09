CREATE DATABASE Bitbucket
GO

USE Bitbucket
GO

CREATE TABLE Users (
	Id INT IDENTITY PRIMARY KEY
	, Username VARCHAR(30) NOT NULL
	, Password VARCHAR(30) NOT NULL 
	, Email VARCHAR(30) NOT NULL
)

CREATE TABLE Repositories (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) NOT NULL
)

CREATE TABLE RepositoriesContributors (
	RepositoryId INT CONSTRAINT FK_RepositoriesContributors_Repositories FOREIGN KEY REFERENCES Repositories(Id ) NOT NULL
	, ContributorId INT CONSTRAINT FK_RepositoriesContributors_Contributors FOREIGN KEY REFERENCES Users(Id) NOT NULL
	, CONSTRAINT PK_RepositoriesContributors PRIMARY KEY (RepositoryId, ContributorId)
)

CREATE TABLE Issues (
	Id INT IDENTITY PRIMARY KEY
	, Title VARCHAR(255) NOT NULL
	, IssueStatus VARCHAR(6) NOT NULL
	, RepositoryId INT CONSTRAINT FK_Issues_Repositories FOREIGN KEY REFERENCES Repositories(Id) NOT NULL
	, AssigneeId INT CONSTRAINT FK_Issues_Users FOREIGN KEY REFERENCES Users(Id) NOT NULL
)

CREATE TABLE Commits (
	Id INT IDENTITY PRIMARY KEY
	, Message VARCHAR(255) NOT NULL
	, IssueId INT CONSTRAINT FK_Commits_Issues FOREIGN KEY REFERENCES Issues(Id)
	, RepositoryId INT CONSTRAINT FK_Commits_Repositories FOREIGN KEY REFERENCES Repositories(Id) NOT NULL
	, ContributorId INT CONSTRAINT FK_Commits_Users FOREIGN KEY REFERENCES Users(Id) NOT NULL
)

CREATE TABLE Files (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(100) NOT NULL
	, Size DECIMAL(18,2) NOT NULL
	, ParentId INT CONSTRAINT FK_Files_Files FOREIGN KEY REFERENCES Files(Id)
	, CommitId INT CONSTRAINT FK_FIles_Commits FOREIGN KEY REFERENCES Commits(Id)
)