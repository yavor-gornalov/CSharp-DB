-- Create SoftUni database
CREATE DATABASE SoftUni;
GO

-- Use SoftUni database
USE SoftUni;
GO

-- Create Towns table
CREATE TABLE Towns (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);
GO

-- Create Addresses table
CREATE TABLE Addresses (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    AddressText NVARCHAR(255) NOT NULL,
    TownId INT NOT NULL,
    CONSTRAINT FK_Addresses_Towns FOREIGN KEY (TownId) REFERENCES Towns(Id)
);
GO

-- Create Departments table
CREATE TABLE Departments (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);
GO

-- Create Employees table
CREATE TABLE Employees (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    MiddleName NVARCHAR(100),
    LastName NVARCHAR(100) NOT NULL,
    JobTitle NVARCHAR(100) NOT NULL,
    DepartmentId INT NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    AddressId INT NOT NULL,
    CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
    CONSTRAINT FK_Employees_Addresses FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
);
GO
