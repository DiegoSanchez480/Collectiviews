CREATE TABLE `movie` (
  `movieID` int PRIMARY KEY NOT NULL,
  `title` varchar(100) NOT NULL,
  `director` varchar(50),
  `genre` varchar(30),
  `releaseDate` date NOT NULL
);

CREATE TABLE `user` (
  `username` varchar(30) PRIMARY KEY NOT NULL,
  `name` varchar(50),
  `password_hash` varchar(30) NOT NULL,
  `birthYear` year NOT NULL
);

CREATE TABLE `review` (
  `username` varchar(30) NOT NULL,
  `movieID` int NOT NULL,
  `rating` tinyint NOT NULL,
  `writtenReview` varchar(2000),
  `reviewDate` datetime NOT NULL,
  PRIMARY KEY (`username`, `movieID`)
);

CREATE TABLE `watchedMovie` (
  `username` varchar(30) NOT NULL,
  `movieID` int NOT NULL,
  `watchedDate` date NOT NULL,
  PRIMARY KEY (`username`, `movieID`)
);

ALTER TABLE `review` ADD FOREIGN KEY (`username`) REFERENCES `user` (`username`);

ALTER TABLE `review` ADD FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`);

ALTER TABLE `watchedMovie` ADD FOREIGN KEY (`username`) REFERENCES `user` (`username`);

ALTER TABLE `watchedMovie` ADD FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`);
