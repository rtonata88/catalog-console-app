
CREATE DATABASE `catalog`
    WITH 
    OWNER = postgres /*insert the username of your installation here */
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


CREATE TABLE IF NOT EXISTS items (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  	publish_date DATE NOT NULL,
  	archived BOOLEAN default false
);

CREATE TABLE music_albums (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items (id),
  on_spotify BOOLEAN NOT NULL
)

CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(20) NOT NULL
)
