CREATE DATABASE RailwaysDb
GO

USE RailwaysDb
GO

CREATE TABLE Passengers (
	Id INT IDENTITY PRIMARY KEY
	,Name NVARCHAR(80) NOT NULL
)

CREATE TABLE Towns (
	Id INT IDENTITY PRIMARY KEY
	,Name NVARCHAR(30) NOT NULL
)

CREATE TABLE RailwayStations (
	Id INT IDENTITY PRIMARY KEY
	,Name NVARCHAR(50) NOT NULL
	,TownId INT NOT NULL
	,CONSTRAINT fk_RailwayStations_Towns
	FOREIGN KEY(TownId) REFERENCES Towns(Id)
)

CREATE TABLE Trains (
	Id INT IDENTITY PRIMARY KEY
	,HourOfDeparture NVARCHAR(5) NOT NULL
	,HourOfArrival NVARCHAR(5) NOT NULL
	,DepartureTownId INT NOT NULL
	,ArrivalTownId INT NOT NULL
	,CONSTRAINT fk_Trains_Towns_Departure
	FOREIGN KEY (DepartureTownId) REFERENCES Towns(Id)
	,CONSTRAINT fk_Trains_Towns_Arrival
	FOREIGN KEY (ArrivalTownId) REFERENCES Towns(Id)
)

CREATE TABLE TrainsRailwayStations (
	TrainId INT NOT NULL 
	,RailwayStationId INT NOT NULL
	,CONSTRAINT pk_TrainsRailwayStations
	PRIMARY KEY (TrainId, RailwayStationId)
	,CONSTRAINT fk_TrainsRailwayStations_Trains
	FOREIGN KEY (TrainId) REFERENCES Trains(Id)
	,CONSTRAINT fk_TrainsRailwayStations_RailwayStations
	FOREIGN KEY (RailwayStationId) REFERENCES RailwayStations(Id)
)

CREATE TABLE MaintenanceRecords (
	Id INT IDENTITY PRIMARY KEY
	,DateOfMaintenance DATE NOT NULL
	,Details NVARCHAR(2000) NOT NULL
	,TrainId INT NOT NULL
	,CONSTRAINT fk_MaintenanceRecords_Trains
	FOREIGN KEY (TrainId) REFERENCES Trains(Id)
)

CREATE TABLE Tickets (
	Id INT IDENTITY PRIMARY KEY
	,Price DECIMAL(18,2) NOT NULL
	,DateOfDeparture DATE NOT NULL
	,DateOfArrival DATE NOT NULL
	,TrainId INT NOT NULL
	,PassengerId INT NOT NULL
	,CONSTRAINT fk_Tickets_Trains
	FOREIGN KEY (TrainId) REFERENCES Trains(Id)
	,CONSTRAINT fk_Tickets_Passengers
	FOREIGN KEY (PassengerId) REFERENCES Passengers(Id)
)
