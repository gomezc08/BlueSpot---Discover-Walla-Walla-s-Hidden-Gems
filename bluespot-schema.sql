-- Bluespot: Chris Gomez, Shahrom Dehoti

USE bluespot;

DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Tags;
DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Photo;
DROP TABLE IF EXISTS BluespotUser;

CREATE TABLE BluespotUser (
	Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(50) NOT NULL UNIQUE,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    AvgRating FLOAT DEFAULT 0,
    PRIMARY KEY (Username, Email)
);

CREATE TABLE Photo (
    PID INT AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Title VARCHAR(25),
    PhotoDescription VARCHAR(200),
    DateUploaded DATETIME NOT NULL,
    PicImage BLOB NOT NULL,
    PicLocation VARCHAR (50),
    AvgRating FLOAT DEFAULT 0,
    PRIMARY KEY (PID),
    FOREIGN KEY(Username) REFERENCES BluespotUser(Username)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Comments (
	PID INT NOT NULL UNIQUE,
    DayTime DATETIME NOT NULL,
    Username VARCHAR(50) NOT NULL,
    Content VARCHAR(200),
    PRIMARY KEY(PID, DayTime, Username),
    FOREIGN KEY(Username) REFERENCES BluespotUser(Username)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY(PID) REFERENCES Photo(PID)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Tags (
	PID INT NOT NULL,
    Tag VARCHAR(20) NOT NULL,
    PRIMARY KEY(PID, Tag),
    FOREIGN KEY(PID) REFERENCES Photo(PID)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Ratings (
	PID INT NOT NULL,
    Rating FLOAT NOT NULL,
    DayTime DATETIME NOT NULL,
    PRIMARY KEY(PID, Rating, DayTime),
    FOREIGN KEY (PID) REFERENCES Photo (PID)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- trigger for user avgrating (c)

DELIMITER //

DROP TRIGGER IF EXISTS UpdateUserAvgRating;
CREATE TRIGGER UpdateUserAvgRating 
AFTER UPDATE 
ON Ratings
FOR EACH ROW
BEGIN
    DECLARE total_rating FLOAT;
    DECLARE total_photos INT;
    
    -- Get total rating and total photos for the user
    SELECT SUM(p.AvgRating), COUNT(*)
    INTO total_rating, total_photos
    FROM Photo p
    WHERE p.Username = (
        SELECT Username FROM Photo WHERE PID = NEW.PID
    );
    
    -- Update the user's average rating
    UPDATE BluespotUser
    SET AvgRating = total_rating / total_photos
    WHERE Username = (
        SELECT Username FROM Photo WHERE PID = NEW.PID
    );
END;
//

DELIMITER ;