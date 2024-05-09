CREATE DATABASE Hotel;
GO

USE Hotel;
GO

CREATE TABLE Employees (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Title NVARCHAR(50) NOT NULL,
    Notes NVARCHAR(MAX)
);

CREATE TABLE Customers (
    AccountNumber INT PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(15),
    EmergencyName NVARCHAR(100),
    EmergencyNumber NVARCHAR(15),
    Notes NVARCHAR(MAX)
);

CREATE TABLE RoomStatus (
    RoomStatus NVARCHAR(50) PRIMARY KEY,
    Notes NVARCHAR(MAX)
);

CREATE TABLE RoomTypes (
    RoomType NVARCHAR(50) PRIMARY KEY,
    Notes NVARCHAR(MAX)
);

CREATE TABLE BedTypes (
    BedType NVARCHAR(50) PRIMARY KEY,
    Notes NVARCHAR(MAX)
);

CREATE TABLE Rooms (
    RoomNumber INT PRIMARY KEY,
    RoomType NVARCHAR(50) NOT NULL REFERENCES RoomTypes(RoomType),
    BedType NVARCHAR(50) NOT NULL REFERENCES BedTypes(BedType),
    Rate DECIMAL(10, 2) NOT NULL,
    RoomStatus NVARCHAR(50) NOT NULL REFERENCES RoomStatus(RoomStatus),
    Notes NVARCHAR(MAX)
);

CREATE TABLE Payments (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeId INT NOT NULL REFERENCES Employees(Id),
    PaymentDate DATETIME2 NOT NULL,
    AccountNumber INT NOT NULL REFERENCES Customers(AccountNumber),
    FirstDateOccupied DATETIME2,
    LastDateOccupied DATETIME2,
    TotalDays INT,
    AmountCharged DECIMAL(10, 2),
    TaxRate DECIMAL(5, 2),
    TaxAmount DECIMAL(10, 2),
    PaymentTotal DECIMAL(10, 2),
    Notes NVARCHAR(MAX)
);

CREATE TABLE Occupancies (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeId INT NOT NULL REFERENCES Employees(Id),
    DateOccupied DATETIME2 NOT NULL,
    AccountNumber INT NOT NULL REFERENCES Customers(AccountNumber),
    RoomNumber INT NOT NULL REFERENCES Rooms(RoomNumber),
    RateApplied DECIMAL(10, 2) NOT NULL,
    PhoneCharge DECIMAL(10, 2),
    Notes NVARCHAR(MAX)
);


INSERT INTO Employees (FirstName, LastName, Title, Notes) VALUES
('John', 'Doe', 'Manager', 'Very responsible.'),
('Jane', 'Smith', 'Receptionist', 'Friendly and helpful.'),
('Carlos', 'Johnson', 'Housekeeper', 'Detail-oriented.');

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes) VALUES
(1001, 'Alice', 'Jones', '123-456-7890', 'Bob Jones', '987-654-3210', 'Frequent guest.'),
(1002, 'Michael', 'Brown', '234-567-8901', 'Sarah Brown', '876-543-2109', 'VIP customer.'),
(1003, 'Emma', 'Davis', '345-678-9012', 'David Davis', '765-432-1098', 'Special requirements: allergy to feathers.');

INSERT INTO RoomStatus (RoomStatus, Notes) VALUES
('Vacant', 'Ready for occupancy.'),
('Occupied', 'Currently occupied by a guest.'),
('Under Maintenance', 'Room is undergoing maintenance.');

INSERT INTO RoomTypes (RoomType, Notes) VALUES
('Standard', 'Basic room with essential amenities.'),
('Deluxe', 'Room with additional features and amenities.'),
('Suite', 'Luxurious accommodation with separate living and sleeping areas.');

INSERT INTO BedTypes (BedType, Notes) VALUES
('Single', 'One single bed.'),
('Double', 'One double bed.'),
('King', 'One king-sized bed.');

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes) VALUES
(101, 'Standard', 'Single', 80.00, 'Vacant', 'Room with city view.'),
(201, 'Deluxe', 'Double', 120.00, 'Occupied', 'Room with ocean view.'),
(301, 'Suite', 'King', 200.00, 'Vacant', 'Spacious suite with jacuzzi.');

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes) VALUES
(1, '2024-05-01', 1001, '2024-04-30', '2024-05-02', 2, 160.00, 7.00, 11.20, 171.20, 'Room charges and taxes.'),
(2, '2024-05-02', 1002, '2024-05-01', '2024-05-05', 4, 480.00, 7.00, 33.60, 513.60, 'Room charges and taxes.'),
(3, '2024-05-03', 1003, '2024-05-02', '2024-05-04', 2, 400.00, 7.00, 28.00, 428.00, 'Room charges and taxes.');

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes) VALUES
(1, '2024-04-30', 1001, 101, 80.00, 10.00, 'Room charges and phone usage.'),
(2, '2024-05-01', 1002, 201, 120.00, 15.00, 'Room charges and phone usage.'),
(3, '2024-05-02', 1003, 301, 200.00, 20.00, 'Room charges and phone usage.');
