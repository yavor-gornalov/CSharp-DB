--DATABASE CREATION

CREATE DATABASE CarRental;
GO

USE CarRental;
GO

--TABLES CREATION

CREATE TABLE Categories 
(
	Id INT IDENTITY PRIMARY KEY, 
	CategoryName NVARCHAR(50) NOT NULL, 
	DailyRate DECIMAL(5,2) DEFAULT 0.0, 
	WeeklyRate DECIMAL(5,2) DEFAULT 0.0, 
	MonthlyRate DECIMAL(5,2) DEFAULT 0.0, 
	WeekendRate DECIMAL(5,2) DEFAULT 0.0
);

CREATE TABLE Cars 
(
	Id INT IDENTITY PRIMARY KEY, 
	PlateNumber NVARCHAR(20) NOT NULL, 
	Manufacturer NVARCHAR(50), 
	Model NVARCHAR(50), 
	CarYear SMALLINT, 
	CategoryId INT NOT NULL, 
	Doors TINYINT, 
	Picture VARBINARY,
	Condition VARCHAR(4),
	Available BIT,

	CHECK (DATALENGTH(Picture) <= 2 * 10 ^ 6),
	CHECK (Condition IN ('good', 'bad')),
	CONSTRAINT Fk_Cars_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(id)
);

CREATE TABLE Employees 
(
	Id INT IDENTITY PRIMARY KEY, 
	FirstName NVARCHAR(50) NOT NULL, 
	LastName NVARCHAR(50) NOT NULL, 
	Title NVARCHAR(50) NOT NULL, 
	Notes NVARCHAR(MAX)
)

CREATE TABLE Customers 
(
	Id INT IDENTITY PRIMARY KEY, 
	DriverLicenceNumber NVARCHAR(20) NOT NULL, 
	FullName NVARCHAR(100) NOT NULL, 
	Address NVARCHAR(50) NOT NULL, 
	City NVARCHAR(50) NOT NULL, 
	ZIPCode SMALLINT, 
	Notes NVARCHAR(MAX)
);

CREATE TABLE RentalOrders 
(
	Id INT IDENTITY PRIMARY KEY, 
	EmployeeId INT NOT NULL, 
	CustomerId INT NOT NULL, 
	CarId INT NOT NULL, 
	TankLevel DECIMAL(5,2), 
	KilometrageStart INT NOT NULL, 
	KilometrageEnd INT NOT NULL, 
	TotalKilometrage INT NOT NULL, 
	StartDate DATETIME2, 
	EndDate DATETIME2, 
	TotalDays INT, 
	RateApplied DECIMAL(5,2) NOT NULL, 
	TaxRate DECIMAL(5,2) NOT NULL, 
	OrderStatus VARCHAR(20) DEFAULT 'In Process', 
	Notes NVARCHAR(MAX),

	CONSTRAINT Fk_RentalOrders_Employees FOREIGN KEY (EmployeeId) REFERENCES Employees(id),
	CONSTRAINT Fk_RentalOrders_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(id),
	CONSTRAINT Fk_RentalOrders_Cars FOREIGN KEY (CarId) REFERENCES Cars(id),
	CHECK (OrderStatus IN ('In Process', 'Approved', 'Finished'))
)

--POPULATE TABLES WITH DATA

INSERT INTO Categories(CategoryName) 
	VALUES 
		 ('PickUp')
		 ,('SUV')
		 ,('Sedan')

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Condition, Available)
	VALUES
		 ('CT0010', 'BMW', 'M5', 2018, 3, 'good', 1)
		,('CT0011', 'Renault', 'Capture', 2017, 2, 'good', 1)
		,('CT0012', 'Toyota', 'Tundra', 2016, 1, 'bad', 0)

INSERT INTO Employees(FirstName, LastName, Title)
	VALUES
		 ('Ivan', 'Ivanov', 'Manager')
		,('Peter', 'Petrov', 'Technician')
		,('George', 'Georgiev', 'Technician')

INSERT INTO Customers(DriverLicenceNumber, FullName, Address, City)
	VALUES
		 ('0123456789', 'Dragan Draganov', 'Street 10', 'Plovdiv')
		,('1234567890', 'Vasil Vasilev', 'Street 11', 'Sofia')
		,('2345678901', 'Emil Emilov', 'Street 12', 'Varna')


INSERT INTO RentalOrders(EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus)
	VALUES 
		 (1, 1, 1, 50.0, 100, 200, 100, '2024-01-01', '2024-01-03', 2, 10, 5, 'Finished')
		,(2, 2, 2, 51.0, 200, 500, 300, '2024-01-10', '2024-01-15', 5, 9, 7, 'Approved')
		,(3, 3, 3, 55.0, 200, 1500, 1300, '2024-01-20', '2024-01-31', 11, 3, 2, 'In Process')
