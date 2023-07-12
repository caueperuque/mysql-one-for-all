DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_title VARCHAR(50) NOT NULL,
    plan_value DECIMAL(3,2) NOT NULL DEFAULT 0.00
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (plan_id, plan_title, plan_value)
  VALUES
      (1, 'free', 0),
      (2, 'family', 7.99),
      (3, 'universitary', 5.99),
      (4, 'personal', 6.99);
    

CREATE TABLE SpotifyClone.artists(
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.artists (artist_id, artist_name)
  VALUES
      (1, 'Beyoncé'),
      (2, 'Queen'),
      (3, 'Elis Regina'),
      (4, 'Baco Exu do Blues'),
      (5, 'Blind Guardian'),
      (6, 'Nina Simone');


CREATE TABLE SpotifyClone.`users`(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    age INT UNSIGNED NOT NULL,
    plan_id INT NOT NULL,
    sign_date DATE NOT NULL,
    FOREIGN KEY (plan_id)
		REFERENCES SpotifyClone.plans(plan_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.`users` (user_id, user_name, age, plan_id, sign_date)
  VALUES
      (1, 'Barbara Liskov', 82, 1, '2019-10-20'),
      (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
      (3, 'Ada Lovelace', 37, 2, '2017-12-30'),
      (4, 'Martin Fowler', 46, 2, '2017-01-17'),
      (5, 'Sandi Metz', 58, 2, '2018-04-29'),
      (6, 'Paulo Freire', 19, 3, '2018-02-14'),
      (7, 'Bell Hooks', 26, 3, '2018-01-05'),
      (8, 'Christopher Alexander', 85, 4, '2019-06-05'),
      (9, 'Judith Butler', 45, 4, '2020-05-13'),
      (10, 'Jorge Amado', 58, 4, '2017-02-17');


CREATE TABLE SpotifyClone.album(
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_title VARCHAR(70) NOT NULL,
    artist_id INT NOT NULL,
    year_release YEAR NOT NULL,
    FOREIGN KEY (artist_id)
		REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.album (album_id, album_title, artist_id, year_release)
  VALUES
      (1, 'Renaissance', 1, 2022),
      (2, 'Jazz', 2, 1978),
      (3, 'Hot Space', 2, 1982),
      (4, 'Falso Brilhante', 3, 1998),
      (5, 'Vento de Maio', 3, 2001),
      (6, 'QVVJFA?', 4, 2003),
      (7, 'Somewhere Far Beyond', 5, 2007),
      (8, 'I Put A Spell On You', 6, 2012);


CREATE TABLE SpotifyClone.songs(
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    song_title VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    song_length INT UNSIGNED NOT NULL,
    FOREIGN KEY (album_id)
		REFERENCES SpotifyClone.album(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.songs (song_id, song_title, album_id, song_length)
  VALUES
      (1, 'BREAK MY SOUL', 1, 279),
      (2, "VIRGO'S GROOVE",1, 369),
      (3, 'ALIEN SUPERSTAR', 1, 116),
      (4, "Don't Stop Me Now", 2, 203),
      (5, 'Under Pressure', 3, 152),
      (6, 'Como Nossos Pais', 4, 105),
      (7, 'O Medo de Amar é o Medo de Ser Livre', 5, 207),
      (8, 'Samba em Paris', 6, 267),
      (9, "The Bard's Song", 7, 244),
      (10, 'Feeling Good', 8, 100);


CREATE TABLE SpotifyClone.user_history(
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    played_timestamp DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, song_id),
	FOREIGN KEY (user_id)
		REFERENCES SpotifyClone.users(user_id),
	FOREIGN KEY (song_id)
		REFERENCES SpotifyClone.songs(song_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.user_history (user_id, song_id, played_timestamp)
  VALUES
      (1, 8, '2022-02-28 10:45:55'),
      (1, 2, '2020-05-02 05:30:35'),
      (1, 10, '2020-03-06 11:22:33'),
      (2, 10, '2022-08-05 08:05:17'),
      (2, 7, '2020-01-02 07:40:33'),
      (3, 10, '2020-11-13 16:55:13'),
      (3, 2, '2020-12-05 18:38:30'),
      (4, 8, '2021-08-15 17:10:10'),
      (5, 8, '2022-01-09 01:44:33'),
      (5, 5, '2020-08-06 15:23:43'),
      (6, 7, '2017-01-24 00:31:17'),
      (6, 1, '2017-10-12 12:35:20'),
      (7, 4, '2011-12-15 22:30:49'),
      (8, 4, '2012-03-17 14:56:41'),
      (9, 9, '2022-02-24 21:14:22'),
      (10, 3, '2015-12-13 08:30:22');


CREATE TABLE SpotifyClone.user_follow(
    user_id INT NOT NULL,
    artist_id INT,
    CONSTRAINT PRIMARY KEY(user_id, artist_id),
	FOREIGN KEY (user_id)
		REFERENCES SpotifyClone.users(user_id),
	FOREIGN KEY (artist_id)
		REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.user_follow (user_id, artist_id)
  VALUES
      (1, 1),
      (1, 2),
      (1, 3),
      (2, 1),
      (2, 3),
      (3, 2),
      (4, 4),
      (5, 5),
      (5, 6),
      (6, 6),
      (6, 1),
      (7, 6),
      (9, 3),
      (10, 2);
