CREATE DATABASE Collectiviews_DB;

CREATE OR REPLACE ROLE Fantastic4_DBA;

GRANT ALL PRIVILEGES ON Collectiviews_DB TO Fantastic4_DBA;

CREATE TABLE `movie` (
  `movieID` int PRIMARY KEY NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `director` VARCHAR(50),
  `genre` VARCHAR(30),
  `releaseDate` DATE NOT NULL
);

CREATE TABLE `user` (
  `username` VARCHAR(30) PRIMARY KEY NOT NULL,
  `name` VARCHAR(50),
  `password_hash` VARCHAR(30) NOT NULL,
  `birthYear` DATE NOT NULL
);

CREATE TABLE `review` (
  `username` VARCHAR(30) NOT NULL,
  `movieID` INT NOT NULL,
  `rating` TINYINT NOT NULL,
  `writtenReview` VARCHAR(2000),
  `reviewDate` DATETIME NOT NULL,
  PRIMARY KEY (`username`, `movieID`)
);

CREATE TABLE `watchedMovie` (
  `username` VARCHAR(30) NOT NULL,
  `movieID` INT NOT NULL,
  `watchedDate` DATE NOT NULL,
  PRIMARY KEY (`username`, `movieID`)
);

ALTER TABLE `review` ADD FOREIGN KEY (`username`) REFERENCES `user` (`username`);

ALTER TABLE `review` ADD FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`);

ALTER TABLE `watchedMovie` ADD FOREIGN KEY (`username`) REFERENCES `user` (`username`);

ALTER TABLE `watchedMovie` ADD FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`);
