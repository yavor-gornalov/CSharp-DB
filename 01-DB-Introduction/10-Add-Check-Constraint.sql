USE Minions

ALTER TABLE Users
ADD CONSTRAINT Check_Password CHECK (LEN(Password) > 5);

INSERT INTO Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
	VALUES
	('user', 'pass', NULL, NULL, 0)

SELECT * FROM Users;

