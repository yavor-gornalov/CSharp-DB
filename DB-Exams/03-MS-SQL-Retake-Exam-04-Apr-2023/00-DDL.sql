CREATE DATABASE Accounting
GO

USE Accounting
GO

CREATE TABLE Countries
(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(10) NOT NULL
);

CREATE TABLE Addresses
(
    Id INT IDENTITY PRIMARY KEY
    ,StreetName NVARCHAR(20) NOT NULL
	,StreetNumber INT
	,PostCode INT NOT NULL
	,City NVARCHAR(25) NOT NULL
	,CountryId INT NOT NUll
	CONSTRAINT fk_Addresses_Countries
	FOREIGN KEY REFERENCES Countries(Id) 
);

CREATE TABLE Vendors
(
    Id INT IDENTITY PRIMARY KEY
    ,Name NVARCHAR(25) NOT NULL
	,NumberVAT NVARCHAR(15) NOT NULL
	,AddressId INT NOT NULL
	CONSTRAINT fk_Vendors_Addresses
	FOREIGN KEY REFERENCES Addresses(Id)
);

CREATE TABLE Clients
(
    Id INT IDENTITY PRIMARY KEY
    ,Name NVARCHAR(25) NOT NULL
	,NumberVAT NVARCHAR(15) NOT NULL
	,AddressId INT NOT NULL
	CONSTRAINT fk_Clients_Addresses 
	FOREIGN KEY REFERENCES Addresses(Id)
);

CREATE TABLE Categories
(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(10) NOT NULL
);

CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY
    ,Name NVARCHAR(35) NOT NULL
	,Price DECIMAL(18,2) NOT NULL
	,CategoryId INT NOT NULL
	CONSTRAINT fk_Products_Categories 
	FOREIGN KEY REFERENCES Categories(Id) 
	,VendorId  INT NOT NULL
	CONSTRAINT fk_Products_Vendors
	FOREIGN KEY REFERENCES Vendors(Id)
);

CREATE TABLE Invoices
(
	Id INT IDENTITY PRIMARY KEY
	,Number INT UNIQUE NOT NULL
	,IssueDate DATETIME2 NOT NULL
	,DueDate DATETIME2 NOT NULL
	,Amount DECIMAL(18, 2) NOT NULL
	,Currency NVARCHAR(5) NOT NULL
	,ClientId INT NOT NULL
	CONSTRAINT fk_Invoices_Clients
	FOREIGN KEY REFERENCES Clients(Id)
)

CREATE TABLE ProductsClients
(
	ProductId INT
	CONSTRAINT fk_ProductsClients_Products
	FOREIGN KEY REFERENCES Products(Id)
	,ClientId INT
	CONSTRAINT fk_ProductsClients_Clients
	FOREIGN KEY REFERENCES Clients(Id)
	,CONSTRAINT pk_ProductsClients
	PRIMARY KEY (ProductId, ClientId)
)