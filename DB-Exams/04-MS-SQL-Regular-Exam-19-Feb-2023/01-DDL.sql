CREATE DATABASE Boardgames
GO

USE Boardgames 
GO

CREATE TABLE Categories (
	Id INT IDENTITY PRIMARY KEY
	, Name NVARCHAR(50)
)

CREATE TABLE Addresses (
	Id INT IDENTITY PRIMARY KEY
	, StreetName NVARCHAR(100) NOT NULL
	, StreetNumber INT NOT NULL
	, Town NVARCHAR(30) NOT NULL
	, Country NVARCHAR(50) NOT NULL
	, ZIP INT NOT NULL
)

CREATE TABLE Publishers (
	Id INT IDENTITY PRIMARY KEY
	, Name NVARCHAR(30) UNIQUE NOT NULL 
	, AddressId INT NOT NULL
	, Website NVARCHAR(40) NOT NULL
	, Phone NVARCHAR(20) NOT NULL
	, CONSTRAINT fk_Publishers_Addresses
	FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
)

CREATE TABLE PlayersRanges (
	Id INT IDENTITY PRIMARY KEY
	, PlayersMin INT NOT NULL
	, PlayersMax INT NOT NULL
)

CREATE TABLE Boardgames (
	Id INT IDENTITY PRIMARY KEY
	, Name NVARCHAR(30) NOT NULL
	, YearPublished INT NOT NULL
	, Rating DECIMAL(10, 2) NOT NULL
	, CategoryId INT NOT NULL
	, PublisherId INT NOT NULL
	, PlayersRangeId INT NOT NULL
	, CONSTRAINT fk_Boardgames_Categories
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
	, CONSTRAINT fk_Boardgames_Publishers
	FOREIGN KEY (PublisherId) REFERENCES Publishers(Id)
	, CONSTRAINT fk_Boardgames_PlayersRanges
	FOREIGN KEY (PlayersRangeId) REFERENCES PlayersRanges(Id)
)

CREATE TABLE Creators (
	Id INT IDENTITY PRIMARY KEY
	, FirstName NVARCHAR(30) NOT NULL
	, LastName NVARCHAR(30) NOT NULL
	, Email NVARCHAR(30) NOT NULL
)

CREATE TABLE CreatorsBoardgames (
	CreatorId INT NOT NULL
	, BoardgameId INT NOT NULL
	, CONSTRAINT pk_CreatorsBoardgames
	PRIMARY KEY (CreatorId, BoardgameId)
	, CONSTRAINT fk_CreatorsBoardgames_Creators
	FOREIGN KEY (CreatorId) REFERENCES Creators(Id)
	, CONSTRAINT fk_CreatorsBoardgames_Boargames
	FOREIGN KEY (BoardgameId) REFERENCES Boardgames(Id)
)
