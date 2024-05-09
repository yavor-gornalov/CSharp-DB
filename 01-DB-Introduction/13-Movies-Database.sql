CREATE DATABASE Movies;

USE Movies;

CREATE TABLE dbo.Directors
(
    Id INT IDENTITY PRIMARY KEY,
    DirectorName NVARCHAR(100) NOT NULL,
	Notes NVARCHAR(MAX)
);

CREATE TABLE dbo.Genres
(
    Id INT IDENTITY PRIMARY KEY,
    GenreName NVARCHAR(100) NOT NULL,
	Notes NVARCHAR(MAX)
);

CREATE TABLE dbo.Categories
(
    Id INT IDENTITY PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
	Notes NVARCHAR(MAX)
);

CREATE TABLE dbo.Movies 
(
    Id INT IDENTITY PRIMARY KEY,
    Title NVARCHAR(100),
	DirectorId INT CONSTRAINT Fk_Movies_Directors REFERENCES Directors(Id),
	CopyrightYear INT,
	Length FLOAT(2),
	GenreId INT CONSTRAINT Fk_Movies_Genres REFERENCES Genres(Id),
	CategoryId INT CONSTRAINT Fk_Movies_Categories REFERENCES Categories(Id),
	Rating FLOAT(2),
	Notes NVARCHAR(MAX)
);

INSERT INTO dbo.Directors ([DirectorName], [Notes])
	VALUES
	 ('Director1', 'N/A')
	,('Director2', 'N/A')
	,('Director3', 'N/A')
	,('Director4', 'N/A')
	,('Director5', 'N/A');

INSERT INTO dbo.Genres  ([GenreName], [Notes])
	VALUES
	 ('Genre1', 'N/A')
	,('Genre2', 'N/A')
	,('Genre3', 'N/A')
	,('Genre4', 'N/A')
	,('Genre5', 'N/A');

INSERT INTO dbo.Categories([CategoryName], [Notes])
	VALUES
	 ('Category1', 'N/A')
	,('Category2', 'N/A')
	,('Category3', 'N/A')
	,('Category4', 'N/A')
	,('Category5', 'N/A');

INSERT INTO dbo.Movies([Title], [DirectorId], [CopyrightYear], [Length], [GenreId], [CategoryId], [Rating], [Notes])
	VALUES
	 ('Title1', 1, 2011, 95.1, 1, 1, 9.1, 'N/A')
	,('Title2', 2, 2012, 95.2, 2, 2, 9.2, 'N/A')
	,('Title3', 3, 2013, 95.3, 3, 3, 9.3, 'N/A')
	,('Title4', 4, 2014, 95.4, 4, 4, 9.4, 'N/A')
	,('Title5', 5, 2015, 95.5, 5, 5, 9.5, 'N/A');

SELECT * FROM Movies;