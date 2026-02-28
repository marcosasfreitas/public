CREATE DATABASE universe;
\c universe;

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    distance_from_earth INT NOT NULL,
    age_in_millions INT,
    mass NUMERIC,
    has_life BOOLEAN,
    is_spherical BOOLEAN
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    distance_from_earth INT NOT NULL,
    age_in_millions INT,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    distance_from_earth INT NOT NULL,
    age_in_millions INT,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    star_id INT REFERENCES star(star_id)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    distance_from_earth INT NOT NULL,
    age_in_millions INT,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    planet_id INT REFERENCES planet(planet_id)
);

CREATE TABLE astronaut (
    astronaut_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    age INT NOT NULL,
    missions_flown INT,
    is_active BOOLEAN,
    has_degree BOOLEAN
);

INSERT INTO galaxy (name, description, distance_from_earth, age_in_millions, mass, has_life, is_spherical) VALUES
('Milky Way', 'Our home galaxy', 0, 13600, 1.5, TRUE, FALSE),
('Andromeda', 'Nearest major galaxy', 2537000, 10000, 1.2, FALSE, FALSE),
('Triangulum', 'Third largest in local group', 3000000, 10000, 0.5, FALSE, FALSE),
('Sombrero', 'Has a bright nucleus', 31100000, 10000, 0.8, FALSE, FALSE),
('Whirlpool', 'Interacting grand design', 23000000, 10000, 0.4, FALSE, FALSE),
('Pinwheel', 'Face-on spiral', 21000000, 10000, 0.6, FALSE, FALSE);

INSERT INTO star (name, description, distance_from_earth, age_in_millions, is_spherical, has_life, galaxy_id) VALUES
('Sun', 'Center of solar system', 0, 4600, TRUE, TRUE, 1),
('Sirius', 'Brightest star in night sky', 8, 300, TRUE, FALSE, 1),
('Betelgeuse', 'Red supergiant', 642, 10, TRUE, FALSE, 1),
('Rigel', 'Blue supergiant', 860, 8, TRUE, FALSE, 1),
('Vega', 'Fifth brightest star', 25, 455, TRUE, FALSE, 1),
('Altair', 'Twelfth brightest star', 16, 1200, TRUE, FALSE, 1);

INSERT INTO planet (name, description, distance_from_earth, age_in_millions, is_spherical, has_life, star_id) VALUES
('Mercury', 'Smallest planet', 91, 4500, TRUE, FALSE, 1),
('Venus', 'Hottest planet', 41, 4500, TRUE, FALSE, 1),
('Earth', 'Our home', 0, 4500, TRUE, TRUE, 1),
('Mars', 'Red planet', 78, 4500, TRUE, FALSE, 1),
('Jupiter', 'Largest planet', 628, 4500, TRUE, FALSE, 1),
('Saturn', 'Ringed planet', 1275, 4500, TRUE, FALSE, 1),
('Uranus', 'Ice giant', 2723, 4500, TRUE, FALSE, 1),
('Neptune', 'Farthest planet', 4351, 4500, TRUE, FALSE, 1),
('Kepler-22b', 'Exoplanet', 620, 4000, TRUE, FALSE, 2),
('Kepler-186f', 'Exoplanet', 582, 4000, TRUE, FALSE, 2),
('Proxima Centauri b', 'Exoplanet', 4, 4000, TRUE, FALSE, 3),
('TRAPPIST-1e', 'Exoplanet', 39, 4000, TRUE, FALSE, 4);

INSERT INTO moon (name, description, distance_from_earth, age_in_millions, is_spherical, has_life, planet_id) VALUES
('Luna', 'Earth moon', 0, 4500, TRUE, FALSE, 3),
('Phobos', 'Mars moon', 78, 4500, FALSE, FALSE, 4),
('Deimos', 'Mars moon', 78, 4500, FALSE, FALSE, 4),
('Io', 'Jupiter moon', 628, 4500, TRUE, FALSE, 5),
('Europa', 'Jupiter moon', 628, 4500, TRUE, FALSE, 5),
('Ganymede', 'Jupiter moon', 628, 4500, TRUE, FALSE, 5),
('Callisto', 'Jupiter moon', 628, 4500, TRUE, FALSE, 5),
('Titan', 'Saturn moon', 1275, 4500, TRUE, FALSE, 6),
('Rhea', 'Saturn moon', 1275, 4500, TRUE, FALSE, 6),
('Iapetus', 'Saturn moon', 1275, 4500, TRUE, FALSE, 6),
('Dione', 'Saturn moon', 1275, 4500, TRUE, FALSE, 6),
('Tethys', 'Saturn moon', 1275, 4500, TRUE, FALSE, 6),
('Enceladus', 'Saturn moon', 1275, 4500, TRUE, FALSE, 6),
('Mimas', 'Saturn moon', 1275, 4500, TRUE, FALSE, 6),
('Miranda', 'Uranus moon', 2723, 4500, TRUE, FALSE, 7),
('Ariel', 'Uranus moon', 2723, 4500, TRUE, FALSE, 7),
('Umbriel', 'Uranus moon', 2723, 4500, TRUE, FALSE, 7),
('Titania', 'Uranus moon', 2723, 4500, TRUE, FALSE, 7),
('Oberon', 'Uranus moon', 2723, 4500, TRUE, FALSE, 7),
('Triton', 'Neptune moon', 4351, 4500, TRUE, FALSE, 8);

INSERT INTO astronaut (name, description, age, missions_flown, is_active, has_degree) VALUES
('Neil Armstrong', 'First man on moon', 82, 2, FALSE, TRUE),
('Buzz Aldrin', 'Second man on moon', 94, 2, FALSE, TRUE),
('Yuri Gagarin', 'First man in space', 34, 1, FALSE, TRUE);