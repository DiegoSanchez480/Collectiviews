DROP DATABASE IF EXISTS Collectiviews;
CREATE DATABASE IF NOT EXISTS Collectiviews;
USE Collectiviews;

-- Movie table
CREATE TABLE movie (
  movieID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  director VARCHAR(50),
  genre VARCHAR(30),
  releaseDate DATE NOT NULL
);

-- User table (keep name `user`, escape it with backticks)
CREATE TABLE `user` (
  username VARCHAR(30) NOT NULL PRIMARY KEY,
  name VARCHAR(50),
  password_hash VARCHAR(30) NOT NULL,
  birthDate DATE NOT NULL
);

-- Review table
CREATE TABLE review (
  username VARCHAR(30) NOT NULL,
  movieID INT NOT NULL,
  rating TINYINT NOT NULL,
  writtenReview VARCHAR(2000),
  reviewDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (username, movieID),
  FOREIGN KEY (username) REFERENCES `user`(username) ON DELETE CASCADE,
  FOREIGN KEY (movieID) REFERENCES movie(movieID) ON DELETE CASCADE
);

-- Watched movies table
CREATE TABLE watchedMovie (
  username VARCHAR(30) NOT NULL,
  movieID INT NOT NULL,
  watchedDate DATE NOT NULL,
  PRIMARY KEY (username, movieID),
  FOREIGN KEY (username) REFERENCES `user`(username) ON DELETE CASCADE,
  FOREIGN KEY (movieID) REFERENCES movie(movieID) ON DELETE CASCADE
);

-- Insert users
INSERT INTO `user` (username, name, password_hash, birthDate) VALUES
('jdoe', 'John Doe', 'pass123', '1995-07-21'),
('asmith', 'Alice Smith', 'alice456', '2000-01-14'),
('bwayne', 'Bruce Wayne', 'batman', '1980-02-14'),
('ckent', 'Clark Kent', 'superman', '1978-11-12');

-- Insert movies
INSERT INTO movie (title, director, genre, releaseDate) VALUES
('The Matrix', 'Lana Wachowski', 'Sci-Fi', '1999-03-31'),
('Inception', 'Christopher Nolan', 'Sci-Fi', '2010-07-16'),
('The Dark Knight', 'Christopher Nolan', 'Action', '2008-07-18'),
('Interstellar', 'Christopher Nolan', 'Sci-Fi', '2014-11-07');

-- Insert watched movies
INSERT INTO watchedMovie (username, movieID, watchedDate) VALUES
('jdoe', 1, '2023-05-01'),
('jdoe', 2, '2023-05-05'),
('asmith', 2, '2023-06-10'),
('asmith', 3, '2023-06-15');

-- Insert reviews
INSERT INTO review (username, movieID, rating, writtenReview, reviewDate) VALUES
('jdoe', 1, 9, 'Mind-blowing sci-fi classic!', '2023-05-02 14:30:00'),
('jdoe', 2, 8, 'Great movie, a bit confusing at times.', '2023-05-06 18:45:00'),
('asmith', 2, 9, 'Nolan never disappoints!', '2023-06-11 20:00:00');
