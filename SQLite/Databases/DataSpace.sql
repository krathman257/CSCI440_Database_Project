--CREATE SCHEMA SPACE;

CREATE TABLE GALAXY(
	name text NOT NULL,
	age bigint,
	PRIMARY KEY (name)
);

CREATE TABLE STAR(
	name text NOT NULL,
	position_latitude float,
	position_longitude float,
	spectral_type text,
	magnitude float,
	velocity_heliocentric float,
	velocity_rotational float,
	galaxy_name text,
	PRIMARY KEY (name),
	FOREIGN KEY (galaxy_name) REFERENCES GALAXY(name)
);

INSERT INTO GALAXY
VALUES ("Milky Way Galaxy", 13510000000);

BULK INSERT STAR
FROM 'starDatabaseCleaned.csv'
WITH (FIRSTROW = 2,
	  FIELDTERMINATOR = ',',
	  ROWTERMINATOR = '\n'
);