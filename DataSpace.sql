CREATE SCHEMA SPACE;

CREATE TABLE GALAXY(
	name text NOT NULL,
	age bigint NOT NULL,
	PRIMARY KEY (name)
);

CREATE TABLE STAR(
	name text NOT NULL,
	position_latitude float NOT NULL,
	position_longitude float NOT NULL,
	spectral_type text NOT NULL,
	magnitude float NOT NULL,
	velocity_heliocentric float NOT NULL,
	velocity_rotational float NOT NULL,
	galaxy_name text NOT NULL,
	PRIMARY KEY (name),
	FOREIGN KEY (galaxy_name) REFERENCES GALAXY(name)
);
