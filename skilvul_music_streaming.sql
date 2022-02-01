CREATE TABLE user (
user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_name VARCHAR(25) NOT NULL,
email VARCHAR(25) NOT NULL,
password TEXT NOT NULL
);

CREATE TABLE singer (
singer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
singer_name VARCHAR(25) NOT NULL
);

CREATE TABLE album (
album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
album_name VARCHAR(25) NOT NULL,
singer_id INT,
CONSTRAINT fk_singer_id 
FOREIGN KEY (singer_id) 
REFERENCES singers(singer_id)
ON UPDATE SET NULL 
ON DELETE SET NULL,
);

CREATE TABLE playlist (
playlist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT, 
track_id INT,
CONSTRAINT fk_user_id 
FOREIGN KEY (user_id) 
REFERENCES user(user_id) 
ON UPDATE SET NULL 
ON DELETE SET NULL,
CONSTRAINT fk_track_id 
FOREIGN KEY (track_id) 
REFERENCES track(track_id)
ON UPDATE SET NULL 
ON DELETE SET NULL, 
);

CREATE TABLE track (
track_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
singer_id INT,
album_id INT,
title VARCHAR(25) NOT NULL,
CONSTRAINT fk_singer_id 
FOREIGN KEY (singer_id) 
REFERENCES singer(singer_id)
ON UPDATE SET NULL 
ON DELETE SET NULL,
CONSTRAINT fk_album_id 
FOREIGN KEY (album_id) 
REFERENCES album(album_id)
ON UPDATE SET NULL 
ON DELETE SET NULL
);

CREATE TABLE pivot1 (
track_id INT,
playlist_id INT, 
CONSTRAINT fk_track_id 
FOREIGN KEY (track_id) 
REFERENCES track(track_id)
ON UPDATE SET NULL 
ON DELETE SET NULL,
CONSTRAINT fk_playlist_id 
FOREIGN KEY (playlist_id) 
REFERENCES playlist(playlist_id)
ON UPDATE SET NULL 
ON DELETE SET NULL
);

CREATE TABLE pivot2 (
user_id INT,
playlist_id INT, 
CONSTRAINT fk_user_id 
FOREIGN KEY (user_id) 
REFERENCES user(user_id) 
ON UPDATE SET NULL 
ON DELETE SET NULL,
CONSTRAINT fk_playlist_id 
FOREIGN KEY (playlist_id) 
REFERENCES playlists(playlist_id)
ON UPDATE SET NULL 
ON DELETE SET NULL
);

INSERT INTO user(user_name, email, password)
VALUES
	('nazhwaameera', 'nazhwa@mail.com', 'nazhwa123'),
	('rosaamalia', 'rosa@mail.com', 'rosa123')
;

SELECT * FROM user;

INSERT INTO singer(singer_name)
VALUES
	('Carly Rae Jepsen'),
	('Taylor Swift'),
	('One Direction'),
	('Red Velvet')
;

SELECT * FROM singer;

INSERT INTO albums(album_name)
VALUES
	('The Midsummer Station'),
	('Red'),
	('Take Me Home'),
	('The ReVe Festival')
;

SELECT * FROM album;

INSERT INTO playlist(user_id)
VALUES
	(1),
	(2)
;

SELECT * FROM playlist;

INSERT INTO track(title)
VALUES
	('Good Time'),
	('Red'),
	("Live While We're Young"),
	('Psycho')
;

SELECT * FROM track;

UPDATE track 
SET 
    singer_id = 1,
    album_id = 1
WHERE
    track_id = 1;

UPDATE track 
SET 
    singer_id = 2,
    album_id = 2
WHERE
    title = 'Red';

UPDATE track 
SET 
    singer_id = 3,
    album_id = 3
WHERE
    track_id = 3;

UPDATE track 
SET 
    singer_id = 4,
    album_id = 4
WHERE
    track_id = 4;

INSERT INTO pivot1(track_id, playlist_id)
VALUES
	(1, 1),
	(2, 1),
	(4, 1),
	(2, 2),
	(3, 2),
	(4, 2)
;

SELECT * FROM pivot1;

INSERT INTO pivot2(user_id, playlist_id)
VALUES
	(1, 1),
	(2, 1),
	(2, 1),
	(1, 2),
	(1, 2),
	(2, 2)
;

SELECT * FROM pivot2;

SELECT singer_name AS singer, title AS song, album_name AS album FROM tracks 
JOIN singers ON tracks.singer_id = singers.singer_id
JOIN albums ON tracks.album_id = albums.album_id;

SELECT U.user_name AS username, Tr.title AS song, P.playlist_id AS playlist FROM playlists P
JOIN users U ON P.user_id = U.user_id
JOIN  table1 T ON P.playlist_id = T.playlist_id
JOIN tracks Tr ON T.track_id = Tr.track_id;