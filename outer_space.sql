-- from the terminal run:
-- psql < outer_space.sql
DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  planet TEXT NOT NULL
);

CREATE TABLE galaxys(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  moon TEXT NOT NULL
);

CREATE TABLE outer_space (
  id SERIAL PRIMARY KEY,
  planet INTEGER REFERENCES planets ON DELETE CASCADE,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy INTEGER REFERENCES galaxys ON DELETE CASCADE,
  moon INTEGER REFERENCES moons ON DELETE CASCADE
);


INSERT INTO planets (planet)
VALUES
('Earth'),
('Mars'),
('Venus'),
('Neptune'),
('Proxima Centauri b'),
('Gliese 876 b');

INSERT INTO galaxys (galaxy)
VALUES
('Milky Way');


INSERT INTO moons (moon)
VALUES
('The Moon'),
('Phobos'),
('Deimos'),
('Naiad'),
('Thalassa'),
('Despina'),
('Galatea'),
('Larissa'),
('S/2004 N 1'),
('Proteus'),
('Triton'),
('Nereid'),
('Halimede'),
('Sao'),
('Laomedeia'),
('Psamathe'),
('Neso');



INSERT INTO outer_space (planet,orbital_period_in_years,orbits_around,galaxy,moon)
VALUES 
(1,1.00,'The Sun',1,1),
(2,1.88,'The Sun',1,2),
(2,1.88,'The Sun',1,3),
(3,0.62,'The Sun',1,NULL),
(4,164.8,'The Sun',1,4),
(4,164.8,'The Sun',1,5),
(4,164.8,'The Sun',1,6),
(4,164.8,'The Sun',1,7),
(4,164.8,'The Sun',1,8),
(4,164.8,'The Sun',1,9),
(4,164.8,'The Sun',1,10),
(4,164.8,'The Sun',1,11),
(4,164.8,'The Sun',1,12),
(4,164.8,'The Sun',1,13),
(4,164.8,'The Sun',1,14),
(4,164.8,'The Sun',1,15),
(4,164.8,'The Sun',1,16),
(4,164.8,'The Sun',1,17),
(5,0.03,'Proxima Centauri',1,NULL),
(6,0.23,'Gliese 876',1,NULL);


SELECT planet,orbital_period_in_years,orbits_around,galaxy,moon FROM outer_space 
JOIN planets ON planets.id = outer_space.planet.id
JOIN galaxys ON galaxys.id = outer_space.galaxy.id
JOIN moons ON moons.id = outer_space.moon.id;