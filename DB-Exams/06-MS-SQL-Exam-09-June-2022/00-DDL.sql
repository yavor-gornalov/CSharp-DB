CREATE DATABASE Zoo
GO

USE Zoo
GO

CREATE TABLE Owners (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) NOT NULL
	, PhoneNumber VARCHAR(15) NOT NULL
	, Address VARCHAR(50)
)

CREATE TABLE AnimalTypes (
	Id INT IDENTITY PRIMARY KEY
	, AnimalType VARCHAR(30) NOT NULL
)

CREATE TABLE Cages (
	Id INT IDENTITY PRIMARY KEY
	, AnimalTypeId INT NOT NULL
	, CONSTRAINT fk_Cages_AnimalTypes
	FOREIGN KEY (AnimalTypeId) REFERENCES AnimalTypes(Id)
)

CREATE TABLE Animals (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(30) NOT NULL
	, BirthDate DATE NOT NULL
	, OwnerId INT
	, AnimalTypeId INT NOT NULL
	, CONSTRAINT fk_Animals_Owners
	FOREIGN KEY (OwnerId) REFERENCES Owners(Id)
	, CONSTRAINT fk_Animals_AnimalTypes
	FOREIGN KEY (AnimalTypeId) REFERENCES AnimalTypes(Id)
)

CREATE TABLE AnimalsCages (
	CageId INT NOT NULL
	, AnimalId INT NOT NULL
	, CONSTRAINT pk_AnimalsCages
	PRIMARY KEY (CageId, AnimalId)
	, CONSTRAINT fk_AnimalCages_Cages
	FOREIGN KEY (CageId) REFERENCES Cages(Id)
	, CONSTRAINT fk_AnimalCages_Animals
	FOREIGN KEY (AnimalId) REFERENCES Animals(Id)
)

CREATE TABLE VolunteersDepartments (
	Id INT IDENTITY PRIMARY KEY
	, DepartmentName VARCHAR(30) NOT NULL
)

CREATE TABLE Volunteers (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) NOT NULL
	, PhoneNumber VARCHAR(15) NOT NULL
	, Address VARCHAR(50)
	, AnimalId INT
	, DepartmentId INT NOT NULL
	, CONSTRAINT fk_Volunteers_Animals
	FOREIGN KEY (AnimalId) REFERENCES Animals(Id)
	, CONSTRAINT fk_Volunteers_VolunteersDepartments
	FOREIGN KEY (DepartmentId) REFERENCES VolunteersDepartments(Id)
)
