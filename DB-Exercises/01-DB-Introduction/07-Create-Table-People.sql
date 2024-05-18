USE Minions

CREATE TABLE dbo.People
(
	[Id] INT IDENTITY(1, 1) PRIMARY KEY,
	[Name] NVARCHAR(200) NOT NULL,
	[Picture] VARBINARY,
	CHECK(DATALENGTH([Picture]) <= 2 * 10 ^ 6),
	[Height] DECIMAL(3,2),
	[Weight] DECIMAL(5,2),
	[Gender] CHAR(1),
	CHECK([Gender] in ('m', 'f')),
	[Birthdate] DATE NOT NULL,
	[Biography] NVARCHAR(MAX)
);

INSERT INTO dbo.People([Name], [Picture], [Height], [Weight], [Gender], [Birthdate], [Biography])
	VALUES
		('Ivan', NULL, 1.70, 70.50, 'm', '1999-01-01', 'N/A'),
		('Dragan', NULL, 1.80, 75.80, 'm', '1998-02-02', 'N/A'),
		('Bogdan', NULL, 1.75, 85.00, 'm', '1996-03-03', 'N/A'),
		('Pena', NULL, 1.65, 45.90, 'm', '1998-04-04', 'N/A'),
		('Gena', NULL, 1.62, 42.10, 'm', '1997-05-05', 'N/A');

SELECT * FROM dbo.People;