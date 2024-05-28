CREATE DATABASE NationalTouristSitesOfBulgaria
GO

USE NationalTouristSitesOfBulgaria
GO

CREATE TABLE Categories (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) NOT NULL
)

CREATE TABLE Locations (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) NOT NULL
	, Municipality VARCHAR(50)
	, Province VARCHAR(50)
)

CREATE TABLE Sites (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(100) NOT NULL
	, LocationId INT NOT NULL
	, CategoryId INT NOT NULL
	, Establishment VARCHAR(15)
	, CONSTRAINT fk_Sites_Loactions
	FOREIGN KEY (LocationId) REFERENCES Locations(Id)
	, CONSTRAINT fk_Sites_Categories
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
)

CREATE TABLE Tourists (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) NOT NULL
	, Age INT NOT NULL
	, PhoneNumber VARCHAR(20) NOT NULL
	, Nationality VARCHAR(30) NOT NULL
	, Reward VARCHAR(20) 
	, CONSTRAINT ch_Tourist_Age
	CHECK (Age BETWEEN 0 AND 120)
)

CREATE TABLE SitesTourists (
	TouristId INT NOT NULL
	, SiteId INT NOT NULL
	, CONSTRAINT pk_SitesTourists
	PRIMARY KEY (TouristId, SiteId)
	, CONSTRAINT fk_SitesTourists_Tourists
	FOREIGN KEY (TouristId) REFERENCES Tourists(Id)
	, CONSTRAINT fk_SitesTourists_Sites
	FOREIGN KEY (SiteId) REFERENCES Sites(Id)
)

CREATE TABLE BonusPrizes (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) NOT NULL
)

CREATE TABLE TouristsBonusPrizes (
	TouristId INT NOT NULL
	, BonusPrizeId INT NOT NULL
	, CONSTRAINT pk_TouristsBonusPrizes
	PRIMARY KEY (TouristId, BonusPrizeId)
	, CONSTRAINT fk_TouristsBonusPrizes_Tourists
	FOREIGN KEY (TouristId) REFERENCES Tourists(Id)
	, CONSTRAINT fk_TouristsBonusPrizes_BonusPrizes
	FOREIGN KEY (BonusPrizeId) REFERENCES BonusPrizes(Id)
)
