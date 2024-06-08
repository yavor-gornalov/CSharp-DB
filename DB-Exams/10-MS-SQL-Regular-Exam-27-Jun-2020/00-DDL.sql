CREATE DATABASE WMS
GO

USE WMS
GO

CREATE TABLE Clients (
	ClientId INT IDENTITY PRIMARY KEY
	, FirstName VARCHAR(50) NOT NULL
	, LastName VARCHAR(50) NOT NULL
	, Phone CHAR(12) NOT NULL
)

CREATE TABLE Mechanics (
	MechanicId INT IDENTITY PRIMARY KEY
	, FirstName VARCHAR(50) NOT NULL
	, LastName VARCHAR(50) NOT NULL
	, Address  VARCHAR(255) NOT NULL
)

CREATE TABLE Models (
	ModelId INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE Jobs (
	JobId INT IDENTITY PRIMARY KEY
	, ModelId INT NOT NULL
	, Status VARCHAR(11) DEFAULT 'Pending' NOT NULL
	, ClientId INT NOT NULL
	, MechanicId INT
	, IssueDate DATE NOT NULL
	, FinishDate DATE
	, CONSTRAINT fk_Jobs_Models
	FOREIGN KEY (ModelId) REFERENCES Models(ModelId)
	, CONSTRAINT ck_Status
	CHECK (Status IN ('Pending', 'In Progress', 'Finished'))
	, CONSTRAINT fk_Jobs_Clients
	FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
	, CONSTRAINT fk_Jobs_Mechanics
	FOREIGN KEY (MechanicId) REFERENCES Mechanics(MechanicId)
)

CREATE TABLE Orders (
	OrderId INT IDENTITY PRIMARY KEY
	, JobId INT NOT NULL
	, IssueDate DATE
	, Delivered BIT NOT NULL DEFAULT 0
	, CONSTRAINT fk_Orders_Jobs
	FOREIGN KEY (JobId) REFERENCES Jobs(JobId)
)

CREATE TABLE Vendors (
	VendorId INT IDENTITY PRIMARY KEY
	, Name VARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE Parts (
	PartId INT IDENTITY PRIMARY KEY
	, SerialNumber VARCHAR(50) NOT NULL UNIQUE
	, Description VARCHAR(255) NOT NULL
	, Price MONEY  NOT NULL 
	, VendorId INT NOT NULL
	, StockQty INT NOT NULL DEFAULT 0
	, CONSTRAINT fk_PartsVendors
	FOREIGN KEY (VendorId) REFERENCES Vendors(VendorId)
	, CONSTRAINT ck_Price_Not_Negative
	CHECK (Price > 0)
	, CONSTRAINT ck_Qty_Not_Negative
	CHECK (StockQty >= 0)
)

CREATE TABLE OrderParts (
	OrderId INT NOT NULL
	, PartId INT NOT NULL
	, Quantity INT NOT NULL DEFAULT 1
	, CONSTRAINT pk_OrderParts
	PRIMARY KEY (OrderId, PartId)
	, CONSTRAINT fk_OrderParts_Orders
	FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
	, CONSTRAINT fk_OrderParts_Parts
	FOREIGN KEY (PartId) REFERENCES Parts(PartId)
	, CONSTRAINT ck_OrderQty_Not_Negative
	CHECK (Quantity > 0)
)

CREATE TABLE PartsNeeded (
	JobId INT NOT NULL
	, PartId INT NOT NULL
	, Quantity INT NOT NULL DEFAULT 1
	, CONSTRAINT pk_PartsNeeded
	PRIMARY KEY (JobId, PartId)
	, CONSTRAINT fk_PartsNeeded_Jobs
	FOREIGN KEY (JobId) REFERENCES Jobs(JobId)
	, CONSTRAINT fk_PartsNeeded_Parts
	FOREIGN KEY (PartId) REFERENCES Parts(PartId)
	, CONSTRAINT ck_PartNeededQty_Not_Negative
	CHECK (Quantity > 0)
)
