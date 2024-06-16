CREATE DATABASE TripService
GO

USE TripService
GO

CREATE TABLE Cities (
	Id INT IDENTITY PRIMARY KEY
	, Name NVARCHAR(20) NOT NULL
	, CountryCode CHAR(2)
)

CREATE TABLE Hotels (
	Id INT IDENTITY PRIMARY KEY
	, Name NVARCHAR(30) NOT NULL
	, CityId INT CONSTRAINT FK_Hotels_Cities FOREIGN KEY REFERENCES Cities(Id) NOT NULL
	, EmployeeCount INT NOT NULL
	, BaseRate DECIMAL(18,2)
)

CREATE TABLE Rooms (
	Id INT IDENTITY PRIMARY KEY
	, Price DECIMAL(18,2) NOT NULL
	, Type NVARCHAR(20) NOT NULL
	, Beds INT NOT NULL
	, HotelId INT CONSTRAINT FK_Rooms_Hotels FOREIGN KEY REFERENCES Hotels(Id) NOT NULL
)

CREATE TABLE Trips (
	Id INT IDENTITY PRIMARY KEY
	, RoomId INT CONSTRAINT FK_Trips_Rooms FOREIGN KEY REFERENCES Rooms(Id) NOT NULL
	, BookDate DATE NOT NULL
	, ArrivalDate DATE NOT NULL
	, ReturnDate DATE NOT NULL
	, CancelDate DATE
	, CONSTRAINT CHK_BookDate CHECK(Bookdate < ArrivalDate)
	, CONSTRAINT CHK_ArrivalDate CHECK (ArrivalDate < ReturnDate)
)

CREATE TABLE Accounts (
	Id INT IDENTITY PRIMARY KEY
	, FirstName NVARCHAR(50) NOT NULL
	, MiddleName NVARCHAR(20) 
	, LastName NVARCHAR(50) NOT NULL
	, CityId INT CONSTRAINT FK_Accounts_Cities FOREIGN KEY REFERENCES Cities(Id) NOT NULL
	, BirthDate DATE NOT NULL
	, Email VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE AccountsTrips (
	AccountId INT CONSTRAINT FK_AccountsTrips_Accounts FOREIGN KEY REFERENCES Accounts(Id) NOT NULL
	, TripId INT CONSTRAINT FK_AccountsTrips_Trips FOREIGN KEY REFERENCES Trips(Id) NOT NULL
	, Luggage INT CHECK (Luggage >= 0) NOT NULL 
	, CONSTRAINT PK_AccountsTrips PRIMARY KEY (AccountId, TripId)
)