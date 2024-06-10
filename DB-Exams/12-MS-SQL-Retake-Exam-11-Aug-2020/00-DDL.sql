CREATE DATABASE Bakery
GO

USE Bakery
GO

CREATE TABLE Countries (
	Id INT IDENTITY PRIMARY KEY
	, Name NVARCHAR(50) UNIQUE
)

CREATE TABLE Customers (
	Id INT IDENTITY PRIMARY KEY
	, FirstName NVARCHAR(25)
	, LastName NVARCHAR(25)
	, Gender CHAR(1) CONSTRAINT CK_Gender CHECK (Gender IN ('M', 'F'))
	, Age INT
	, PhoneNumber VARCHAR(10) CONSTRAINT CK_PhoneNumberLength CHECK (LEN(PhoneNumber) = 10)
	, CountryId INT CONSTRAINT FK_Customers_Countries FOREIGN KEY REFERENCES Countries(Id)
)

CREATE TABLE Products (
	Id INT IDENTITY PRIMARY KEY
	, Name NVARCHAR(25) UNIQUE
	, Description NVARCHAR(250) 
	, Recipe NVARCHAR(MAX)
	, Price MONEY CONSTRAINT CK_Price CHECK(Price >= 0)
)

CREATE TABLE Feedbacks (
	Id INT IDENTITY PRIMARY KEY
	, Description NVARCHAR(255)
	, Rate DECIMAL(5, 2) CONSTRAINT CK_Rate CHECK(Rate BETWEEN 0.0 AND 10.0) 
	, ProductId INT CONSTRAINT FK_Feedbacks_Products FOREIGN KEY REFERENCES Products(Id)
	, CustomerId INT CONSTRAINT FK_Feedbacks_Customers FOREIGN KEY REFERENCES Customers(Id)
)

CREATE TABLE Distributors (
	Id INT IDENTITY PRIMARY KEY
	, Name NVARCHAR(25) UNIQUE
	, AddressText NVARCHAR(30)
	, Summary NVARCHAR(200)
	, CountryId INT CONSTRAINT FK_Distributors_Countries FOREIGN KEY REFERENCES Countries(Id)
)

CREATE TABLE Ingredients (
	Id INT IDENTITY PRIMARY KEY
	, Name NVARCHAR(30)
	, Description NVARCHAR(200)
	, OriginCountryId INT CONSTRAINT FK_Ingredients_Countries FOREIGN KEY REFERENCES Countries(Id)
	, DistributorId INT CONSTRAINT FK_Ingredients_Distributors FOREIGN KEY REFERENCES Distributors(Id)
)

CREATE TABLE ProductsIngredients (
	ProductId INT CONSTRAINT FK_ProductsIngredients_Products FOREIGN KEY REFERENCES Products(Id)
	, IngredientId INT CONSTRAINT FK_ProductsIngredients_Ingredients FOREIGN KEY REFERENCES Ingredients(Id)
	, CONSTRAINT PK_ProductsIngredients PRIMARY KEY(ProductId, IngredientId)
)
