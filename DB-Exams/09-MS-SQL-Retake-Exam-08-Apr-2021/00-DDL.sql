CREATE DATABASE Service
GO

USE Service
GO

CREATE TABLE Users (
	Id INT IDENTITY PRIMARY KEY
	, Username VARCHAR(30) UNIQUE NOT NULL
	, Password VARCHAR(50) NOT NULL
	, Name VARCHAR(50)
	, Birthdate DATETIME
	, Age INT
	, Email VARCHAR(50) NOT NULL
	, CONSTRAINT ck_User_Age
	CHECK (Age BETWEEN 14 AND 110)
)

CREATE TABLE Departments (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) NOT NULL
)

CREATE TABLE Employees (
	Id INT IDENTITY PRIMARY KEY
	, FirstName VARCHAR(25)
	, LastName VARCHAR(25)
	, Birthdate DATETIME
	, Age INT
	, DepartmentId INT
	, CONSTRAINT ck_Employee_Age
	CHECK (Age BETWEEN 18 AND 110)
	, CONSTRAINT fk_Employees_Departments
	FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
)

CREATE TABLE Categories (
	Id INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) NOT NULL
	, DepartmentId INT NOT NULL
	, CONSTRAINT fk_Categories_Departments
	FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
)

CREATE TABLE Status (
	Id INT IDENTITY PRIMARY KEY
	, Label VARCHAR(20) NOT NULL
)

CREATE TABLE Reports (
	Id INT IDENTITY PRIMARY KEY
	, CategoryId INT NOT NULL
	, StatusId INT NOT NULL
	, OpenDate DATETIME NOT NULL
	, CloseDate DATETIME
	, Description VARCHAR(200) NOT NULL
	, UserId INT NOT NULL
	, EmployeeId INT
	, CONSTRAINT fk_Reports_Categories
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
	, CONSTRAINT fk_Reports_Status
	FOREIGN KEY (StatusId) REFERENCES Status(Id)
	, CONSTRAINT fk_Reports_Users
	FOREIGN KEY (UserId) REFERENCES Users(Id)
	, CONSTRAINT fk_Reports_Employees
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
)