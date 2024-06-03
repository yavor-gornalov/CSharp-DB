CREATE DATABASE Airport
GO

USE Airport
GO

CREATE TABLE Passengers (
	Id INT IDENTITY PRIMARY KEY
	, FullName VARCHAR(100) UNIQUE NOT NULL
	, Email VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE Pilots (
	Id INT IDENTITY PRIMARY KEY
	, FirstName VARCHAR(30) UNIQUE NOT NULL
	, LastName VARCHAR(30) UNIQUE NOT NULL
	, Age TINYINT NOT NULL
	, Rating FLOAT 
	, CONSTRAINT ck_Age 
	CHECK(Age BETWEEN 21 AND 62)
	, CONSTRAINT ck_Rating
	CHECK(Rating BETWEEN 0 AND 10)
)

CREATE TABLE AircraftTypes (
	Id INT IDENTITY PRIMARY KEY
	, TypeName VARCHAR(30) UNIQUE NOT NULL
)

CREATE TABLE Aircraft (
	Id INT IDENTITY PRIMARY KEY
	, Manufacturer VARCHAR(25) NOT NULL
	, Model VARCHAR(30) NOT NULL
	, Year INT NOT NULL
	, FlightHours INT 
	, Condition CHAR(1) NOT NULL
	, TypeId INT NOT NULL
	, CONSTRAINT fk_Aircraft_AircraftTypes
	FOREIGN KEY (TypeId) REFERENCES AircraftTypes(Id)
)

CREATE TABLE PilotsAircraft (
	AircraftId INT NOT NULL
	, PilotId INT NOT NULL
	, CONSTRAINT pk_PilotsAircraft
	PRIMARY KEY (AircraftId, PilotId)
	, CONSTRAINT fk_PilotsAircraft_Aircraft
	FOREIGN KEY (AircraftId) REFERENCES Aircraft(Id)
	, CONSTRAINT fk_PilotsAircraft_Pilots
	FOREIGN KEY (PilotId) REFERENCES Pilots(Id)
)

CREATE TABLE Airports (
	Id INT IDENTITY PRIMARY KEY
	, AirportName VARCHAR(70) UNIQUE NOT NULL
	, Country VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE FlightDestinations (
	Id INT IDENTITY PRIMARY KEY
	, AirportId INT NOT NULL
	, Start DATETIME NOT NULL
	, AircraftId INT NOT NULL
	, PassengerId INT NOT NULL
	, TicketPrice DECIMAL(18,2) NOT NULL DEFAULT 15
	, CONSTRAINT fk_FlightDestinations_Airports
	FOREIGN KEY (AirportId) REFERENCES Airports(Id)
	, CONSTRAINT fk_FlightDestinations_Aircraft
	FOREIGN KEY (AircraftId) REFERENCES Aircraft(Id)
	, CONSTRAINT fk_FlightDestinations_Passengers
	FOREIGN KEY (PassengerId) REFERENCES Passengers(Id)
)
