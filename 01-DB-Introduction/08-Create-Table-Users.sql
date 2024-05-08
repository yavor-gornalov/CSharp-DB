USE Minions

CREATE TABLE Users
(
	Id INT IDENTITY UNIQUE,
	Username VARCHAR(30) NOT NULL,
	Password VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY,
	CHECK (DATALENGTH(ProfilePicture) <= 9 * 10 ^ 5),
	LastLoginTime DATETIME2,
	IsDeleted BIT
);

ALTER TABLE Users
ADD CONSTRAINT Pk_User PRIMARY KEY (Id);

INSERT INTO Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
	VALUES
	('user1', 'password1', NULL, NULL, 0),
	('user2', 'password2', NULL, NULL, 0),
	('user3', 'password3', NULL, NULL, 0),
	('user4', 'password4', NULL, NULL, 0),
	('user5', 'password5', NULL, NULL, 1);

SELECT * FROM Users;