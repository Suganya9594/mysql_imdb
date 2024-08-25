CREATE DATABASE IMDB;

USE IMDB;

CREATE TABLE Movies (
  MovieID INT PRIMARY KEY,
  Title VARCHAR(255),
  ReleaseYear INT,
  Duration INT
);

CREATE TABLE Media (
  MediaID INT PRIMARY KEY,
  MovieID INT,
  MediaType ENUM('Video', 'Image'),
  MediaURL VARCHAR(255),
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

CREATE TABLE Genres (
  GenreID INT PRIMARY KEY,
  GenreName VARCHAR(255)
);

CREATE TABLE MovieGenres (
  MovieID INT,
  GenreID INT,
  PRIMARY KEY (MovieID, GenreID),
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
  FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE Reviews (
  ReviewID INT PRIMARY KEY,
  MovieID INT,
  Rating INT,
  ReviewText TEXT,
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(255),
  Email VARCHAR(255)
);

CREATE TABLE Reviewers (
  ReviewID INT,
  UserID INT,
  PRIMARY KEY (ReviewID, UserID),
  FOREIGN KEY (ReviewID) REFERENCES Reviews(ReviewID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Artists (
  ArtistID INT PRIMARY KEY,
  Name VARCHAR(255),
  Bio TEXT
);

CREATE TABLE Skills (
  SkillID INT PRIMARY KEY,
  SkillName VARCHAR(255)
);

CREATE TABLE ArtistSkills (
  ArtistID INT,
  SkillID INT,
  PRIMARY KEY (ArtistID, SkillID),
  FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
  FOREIGN KEY (SkillID) REFERENCES Skills(SkillID)
);

CREATE TABLE Roles (
  RoleID INT PRIMARY KEY,
  RoleName VARCHAR(255)
);

CREATE TABLE ArtistRoles (
  ArtistID INT,
  MovieID INT,
  RoleID INT,
  PRIMARY KEY (ArtistID, MovieID, RoleID),
  FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
  FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

INSERT INTO Movies (MovieID, Title, ReleaseYear, Duration)
VALUES
  (1, 'Ponniyin Selvan: I', 2022, 169),
  (2, 'Vikram', 2022, 173),
  (3, 'Beast', 2022, 158),
  (4, 'Valimai', 2022, 179),
  (5, 'Don', 2022, 143),
  (6, 'RRR', 2022, 187),
  (7, 'KGF: Chapter 2', 2022, 168),
  (8, 'Etharkkum Thunindhavan', 2022, 149),
  (9, 'Mahaan', 2022, 156),
  (10, 'Viruman', 2022, 159);

INSERT INTO Media (MediaID, MovieID, MediaType, MediaURL)
VALUES
  (1, 1, 'Video', 'https://example.com/ponniyin-selvan.mp4'),
  (2, 1, 'Image', 'https://example.com/ponniyin-selvan.jpg'),
  (3, 2, 'Video', 'https://example.com/vikram.mp4'),
  (4, 3, 'Video', 'https://example.com/beast.mp4'),
  (5, 4, 'Video', 'https://example.com/valimai.mp4'),
  (6, 5, 'Video', 'https://example.com/don.mp4'),
  (7, 6, 'Video', 'https://example.com/rrr.mp4'),
  (8, 7, 'Video', 'https://example.com/kgf-chapter-2.mp4'),
  (9, 8, 'Video', 'https://example.com/etharkkum-thunindhavan.mp4'),
  (10, 9, 'Video', 'https://example.com/mahaan.mp4'),
  (11, 10, 'Video', 'https://example.com/viruman.mp4');

INSERT INTO Genres (GenreID, GenreName)
VALUES
  (1, 'Action'),
  (2, 'Drama'),
  (3, 'Thriller'),
  (4, 'Comedy'),
  (5, 'Romance');

INSERT INTO MovieGenres (MovieID, GenreID)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 4),
  (4, 1),
  (4, 2),
  (5, 4),
  (5, 5),
  (6, 1),
  (6, 2),
  (7, 1),
  (7, 3),
  (8, 1),
  (8, 2),
  (9, 2),
  (9, 5),
  (10, 1),
  (10, 4);

INSERT INTO Reviews (ReviewID, MovieID, Rating, ReviewText)
VALUES
  (1, 1, 5, 'Epic historical drama!'),
  (2, 2, 5, 'Kamal Haasan shines!'),
  (3, 3, 4, 'Vijay\'s energetic performance!'),
  (4, 4, 4, 'Ajith\'s action-packed!'),
  (5, 5, 4, 'Sivakarthikeyan\'s comedy timing!'),
  (6, 6, 5, 'RRR roars!'),
  (7, 7, 5, 'Yash\'s powerful performance!'),
  (8, 8, 4, 'Suriya\'s intense action!'),
  (9, 9, 4, 'Vikram\'s emotional depth!'),
  (10, 10, 4, 'Karthi\'s rural charm!');

INSERT INTO Users (UserID, Username, Email)
VALUES
  (1, 'tamil_cinema_fan', 'tamil.cinema.fan@example.com'),
  (2, 'movie_buff', 'movie.buff@example.com');
INSERT INTO Reviewers (ReviewID, UserID)
VALUES
  (1, 1),
  (2, 2),
  (3, 1),
  (4, 2),
  (5, 1),
  (6, 2),
  (7, 1),
  (8, 2),
  (9, 1),
  (10, 2);

INSERT INTO Artists (ArtistID, Name, Bio)
VALUES
  (1, 'Vikram', 'Tamil cinema icon'),
  (2, 'Kamal Haasan', 'Legendary actor and director'),
  (3, 'Vijay', 'Tamil cinema\'s Thalapathy'),
  (4, 'Ajith Kumar', 'Tamil cinema\'s Thala'),
  (5, 'Sivakarthikeyan', 'Tamil cinema\'s rising star'),
  (6, 'Ram Charan', 'Tollywood\'s Mega Power Star'),
  (7, 'Yash', 'Kannada cinema\'s Rocking Star'),
  (8, 'Suriya', 'Tamil cinema\'s versatile actor'),
  (9, 'Vikram Prabhu', 'Tamil cinema\'s young talent'),
  (10, 'Karthi', 'Tamil cinema\'s charming actor');

INSERT INTO Skills (SkillID, SkillName)
VALUES
  (1, 'Acting'),
  (2, 'Directing'),
  (3, 'Singing'),
  (4, 'Dancing'),
  (5, 'Screenwriting');

INSERT INTO ArtistSkills (ArtistID, SkillID)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 2),
  (3, 1),
  (3, 4),
  (4, 1),
  (4, 3),
  (5, 1),
  (5, 4),
  (6, 1),
  (6, 2),
  (7, 1),
  (7, 3),
  (8, 1),
  (8, 2),
  (9, 1),
  (9, 4),
  (10, 1),
  (10, 3);

INSERT INTO Roles (RoleID, RoleName)
VALUES
  (1, 'Hero'),
  (2, 'Villain'),
  (3, 'Comedian'),
  (4, 'Director'),
  (5, 'Producer');

INSERT INTO ArtistRoles (ArtistID, MovieID, RoleID)
VALUES
  (1, 1, 1),
  (2, 2, 1),
  (3, 3, 1),
  (4, 4, 1),
  (5, 5, 3),
  (6, 6, 1),
  (7, 7, 1),
  (8, 8, 1),
  (9, 9, 1),
  (10, 10, 1);