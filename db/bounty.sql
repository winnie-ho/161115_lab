DROP TABLE hunted_aliens;

CREATE TABLE hunted_aliens(
name VARCHAR (255),
species VARCHAR(255),
bounty INT4,
danger_level VARCHAR(255),
id SERIAL8 primary key
);