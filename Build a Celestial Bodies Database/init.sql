-- pg_dump -cC --inserts -U freecodecamp universe > universe.sql
-- psql -U freecodecamp -f init.sql

-- Create database
CREATE DATABASE universe;

-- Connect to database
\c universe

-- Create table
CREATE TABLE galaxy(
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(60) UNIQUE NOT NULL,
    age_in_millions_of_years INT,
    description TEXT,
    distance_from_earth NUMERIC(32)
);
INSERT INTO galaxy (name, age_in_millions_of_years, description, distance_from_earth) VALUES
('Milky Way', 13600, 'Our home galaxy, a barred spiral galaxy.', 0),
('Andromeda', 10000, 'The closest spiral galaxy to the Milky Way.', 2537000),
('Triangulum', 12000, 'A small spiral galaxy in the Local Group.', 3000000),
('Messier 87', 6500, 'An elliptical galaxy with a supermassive black hole.', 53500000),
('Sombrero', 9000, 'A spiral galaxy with a large central bulge.', 31000000),
('Whirlpool', 400, 'A face-on spiral galaxy with a bright nucleus.', 31000000);


CREATE TABLE star(
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(60) UNIQUE NOT NULL,
    age_in_millions_of_years INT,
    distance_from_earth NUMERIC(32),
    is_spherical BOOLEAN DEFAULT TRUE,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);
INSERT INTO star (name, age_in_millions_of_years, distance_from_earth, galaxy_id) VALUES
('Sun', 4600, 0, (SELECT galaxy_id FROM galaxy WHERE name = 'Milky Way')),
('Alpha Centauri', 6000, 4.37, (SELECT galaxy_id FROM galaxy WHERE name = 'Milky Way')),
('Andromeda A', 5000, 2537000, (SELECT galaxy_id FROM galaxy WHERE name = 'Andromeda')),
('Triangulum Alpha', 7000, 3000000, (SELECT galaxy_id FROM galaxy WHERE name = 'Triangulum')),
('M87 Star', 5500, 53500000, (SELECT galaxy_id FROM galaxy WHERE name = 'Messier 87')),
('Whirlpool Star', 400, 31000000, (SELECT galaxy_id FROM galaxy WHERE name = 'Whirlpool'));

CREATE TABLE planet(
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(60) UNIQUE NOT NULL,
    age_in_millions_of_years INT,
    is_spherical BOOLEAN DEFAULT TRUE,
    star_id INT NOT NULL REFERENCES star(star_id)
);
INSERT INTO planet (name, age_in_millions_of_years, star_id) VALUES
('Earth', 4500, (SELECT star_id FROM star WHERE name = 'Sun')),
('Mars', 4600, (SELECT star_id FROM star WHERE name = 'Sun')),
('Proxima b', 6000, (SELECT star_id FROM star WHERE name = 'Alpha Centauri')),
('Proxima c', 6000, (SELECT star_id FROM star WHERE name = 'Alpha Centauri')),
('Andromeda-1', 5000, (SELECT star_id FROM star WHERE name = 'Andromeda A')),
('Andromeda-2', 5000, (SELECT star_id FROM star WHERE name = 'Andromeda A')),
('Triangulum Prime', 7000, (SELECT star_id FROM star WHERE name = 'Triangulum Alpha')),
('Triangulum Beta', 7000, (SELECT star_id FROM star WHERE name = 'Triangulum Alpha')),
('M87b', 5500, (SELECT star_id FROM star WHERE name = 'M87 Star')),
('M87c', 5500, (SELECT star_id FROM star WHERE name = 'M87 Star')),
('Whirlpool-1', 400, (SELECT star_id FROM star WHERE name = 'Whirlpool Star')),
('Whirlpool-2', 400, (SELECT star_id FROM star WHERE name = 'Whirlpool Star'));

CREATE TABLE moon(
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(60) UNIQUE NOT NULL,
    age_in_millions_of_years INT,
    is_spherical BOOLEAN DEFAULT TRUE,
    planet_id INT NOT NULL REFERENCES planet(planet_id)
);
INSERT INTO moon (name, age_in_millions_of_years, planet_id) VALUES
('Luna', 4500, (SELECT planet_id FROM planet WHERE name = 'Earth')),
('Phobos', 4600, (SELECT planet_id FROM planet WHERE name = 'Mars')),
('Deimos', 4600, (SELECT planet_id FROM planet WHERE name = 'Mars')),
('Proxima-b1', 6000, (SELECT planet_id FROM planet WHERE name = 'Proxima b')),
('Proxima-b2', 6000, (SELECT planet_id FROM planet WHERE name = 'Proxima b')),
('Proxima-c1', 6000, (SELECT planet_id FROM planet WHERE name = 'Proxima c')),
('Proxima-c2', 6000, (SELECT planet_id FROM planet WHERE name = 'Proxima c')),
('Andromeda-1a', 5000, (SELECT planet_id FROM planet WHERE name = 'Andromeda-1')),
('Andromeda-1b', 5000, (SELECT planet_id FROM planet WHERE name = 'Andromeda-1')),
('Andromeda-2a', 5000, (SELECT planet_id FROM planet WHERE name = 'Andromeda-2')),
('Andromeda-2b', 5000, (SELECT planet_id FROM planet WHERE name = 'Andromeda-2')),
('Triangulum Prime A', 7000, (SELECT planet_id FROM planet WHERE name = 'Triangulum Prime')),
('Triangulum Prime B', 7000, (SELECT planet_id FROM planet WHERE name = 'Triangulum Prime')),
('Triangulum Beta A', 7000, (SELECT planet_id FROM planet WHERE name = 'Triangulum Beta')),
('Triangulum Beta B', 7000, (SELECT planet_id FROM planet WHERE name = 'Triangulum Beta')),
('M87b-1', 5500, (SELECT planet_id FROM planet WHERE name = 'M87b')),
('M87b-2', 5500, (SELECT planet_id FROM planet WHERE name = 'M87b')),
('Whirlpool-1a', 400, (SELECT planet_id FROM planet WHERE name = 'Whirlpool-1')),
('Whirlpool-1b', 400, (SELECT planet_id FROM planet WHERE name = 'Whirlpool-1')),
('Whirlpool-2a', 400, (SELECT planet_id FROM planet WHERE name = 'Whirlpool-2'));

CREATE TABLE person(
    person_id SERIAL PRIMARY KEY,
    name VARCHAR(60) UNIQUE NOT NULL,
    height INT,
    weight INT,
    planet_id INT NOT NULL REFERENCES planet(planet_id)
);
INSERT INTO person (name, height, weight, planet_id) VALUES
('Alice Voyager', 170, 65, (SELECT planet_id FROM planet WHERE name = 'Earth')),
('Bob Martian', 180, 75, (SELECT planet_id FROM planet WHERE name = 'Mars')),
('Charlie Exo', 165, 60, (SELECT planet_id FROM planet WHERE name = 'Proxima b'));
