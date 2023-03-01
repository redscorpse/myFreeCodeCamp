# psql -U freecodecamp postgres

-- 4 tables, galaxy, star, planet and moon
CREATE DATABASE universe;
\c universe

CREATE TABLE about(about_id SERIAL PRIMARY KEY , name VARCHAR(30) UNIQUE NOT NULL, comments TEXT NOT NULL);
INSERT INTO about(name, comments) 
VALUES
('About this project', 'This is a project for getting the Relational Database certification from freecodecamp.org, the values from the tables may not be correct'), 
('About the author', 'You can check my curriculum progress at https://www.freecodecamp.org/redscorpse'), 
('About freecodecamp projects', 'This is the first certification project from Relational Database (Beta), you can check them all from https://www.freecodecamp.org/learn/relational-database/');

CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, description TEXT, age_myr INT, solar_mass NUMERIC(37,9), distance_ly NUMERIC(37, 9) NOT NULL);
CREATE TABLE star(star_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, description TEXT, age_myr INT, solar_mass NUMERIC(37,9), distance_ly NUMERIC(37, 9) NOT NULL, constellation VARCHAR(50));
CREATE TABLE planet(planet_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, description TEXT, age_myr INT, earth_mass NUMERIC(37,9), distance_ly NUMERIC(37, 9) NOT NULL, mean_radius_km NUMERIC(9,3), temperature_K INT, atmosphere BOOLEAN, composition TEXT, habitable BOOLEAN, has_moon BOOLEAN);
CREATE TABLE moon(moon_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, description TEXT, age_myr INT, mass_kg NUMERIC(37,9) NOT NULL, mean_orbit_radius_km NUMERIC(37, 9));

-- references: moon -> planet -> star -> galaxy
ALTER TABLE moon ADD COLUMN planet_id INT REFERENCES planet(planet_id);
ALTER TABLE planet ADD COLUMN star_id INT REFERENCES star(star_id);
ALTER TABLE star ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);

-- DATA --
-- 6 galaxies
INSERT INTO galaxy(name, description, age_myr, solar_mass, distance_ly) 
VALUES
('Milky Way', 'barred spiral galaxy that contains our Solar System', 13.6, 1.5e12, 0), 
('Andromeda', 'spiral galaxy located approximately 2.5 million light years away from the Milky Way', 10.1, 1.3e12, 2.5e6), 
('Triangulum Galaxy', 'spiral galaxy approximately 3 million light-years away from Earth', 30000, 6.4E+9, 3000000),
('Whirlpool', 'spiral galaxy located about 23 million light years away from Earth', 6.2, 4.8e10, 23e6), 
('Sombrero', 'spiral galaxy located approximately 28 million light years away from Earth', 9.1, 8.0e10, 28e6), 
('Large Magellanic Cloud', 'dwarf galaxy located approximately 163,000 light-years away from Earth', 13000, 3.3E+9, 163000);

-- 6 stars
INSERT INTO star(name, description, age_myr, solar_mass, distance_ly, constellation, galaxy_id) 
VALUES
('Sun', 'The star at the center of our Solar System', 4.6, 1, 0, 'N/A', 1), 
('WASP-76', 'yellow-white main sequence star in the constellation of Pisces', 50, 1.43, 390, 'Pisces', 1),
('HD 209458', 'yellow dwarf star in the constellation Pegasus', 7, 1.1, 153, 'Pegasus', 1),
('Kepler-452', 'G-type main-sequence star in the constellation Cygnus', 6, 1.04, 1402, 'Cygnus', 1),
('Proxima Centauri', 'red dwarf star in the constellation Centaurus', 4, 0.12, 4.24, 'Centaurus', 1),
('TOI-700', 'red dwarf star in the constellation Dorado', 1, 0.41, 101.5, 'Dorado', 1), 
('Sirius', 'The brightest star in the night sky', 240, 2.02, 8.6, 'Canis Major', 1), 
('Betelgeuse', 'A red supergiant star in the constellation Orion', 8.5, 18, 640, 'Orion', 1), 
('Polaris', 'The current North Star', 50, 4.5, 323, 'Ursa Minor', 1), 
('Vega', 'The fifth-brightest star in the night sky', 455, 2.1, 25, 'Lyra', 1), 
('Alpha Centauri', 'The closest star system to our solar system', 6.5, 1.1, 4.37, 'Centaurus', 1), 
('Antares', 'A red supergiant star in the constellation Scorpius', 12, 15, 550, 'Scorpius', 1), 
('Andromeda XXXI', 'star in the Andromeda galaxy', 10000, 0.7, 2530000, NULL, 2),
('M31 RV', 'red variable star in the Andromeda galaxy', 3000, 2.1, 2530000, NULL, 2),
('NGC 604', 'massive star-forming region in Triangulum Galaxy', 3, 25000, 3.5, NULL, 3),
('SK 15', 'Wolf-Rayet star in Triangulum Galaxy', 2, 50, 2.9, NULL, 3), 
('NGC 5194-B', 'Blue dwarf star in the Whirlpool Galaxy', 4000, 1.5, 31.1, NULL, 4), 
('Sombrero A', 'Yellow supergiant star in the Sombrero Galaxy', 9000, 12, 28, NULL, 5), 
('LMC B225-37', 'Red giant star in the Large Magellanic Cloud', 1500, 0.6, 163, NULL, 6);

-- 12 planets
INSERT INTO planet(name, description, age_myr, earth_mass, distance_ly, mean_radius_km, temperature_K, atmosphere, composition, habitable, has_moon, star_id) 
VALUES
('Mercury', 'Small, rocky planet that orbits close to the sun', 4568, 0.0553, 0.39, 2439.7, 440, FALSE, 'Rocky', FALSE, FALSE, 1),
('Venus', 'Similar in size and composition to Earth, but with a thick, toxic atmosphere', 4430, 0.815, 0.72, 6051.8, 737, TRUE, 'Mainly CO2', FALSE, FALSE, 1),
('Earth', 'The only known planet with abundant liquid water on its surface and the only planet known to support life', 4500, 1, 1, 6371, 288, TRUE, 'Nitrogen, Oxygen', TRUE, TRUE, 1),
('Mars', 'Small, cold, and dry, with a thin atmosphere', 4567, 0.107, 1.52, 3389.5, 210, FALSE, 'Rocky', FALSE, TRUE, 1),
('Jupiter', 'The largest planet in our solar system, with a thick atmosphere and many moons', 4590, 317.8, 5.2, 69911, 165, TRUE, 'Mainly hydrogen and helium', FALSE, TRUE, 1),
('Saturn', 'Known for its prominent rings, this gas giant has many moons', 4530, 95.2, 9.58, 58232, -140, TRUE, 'Mainly hydrogen and helium', FALSE, TRUE, 1),
('Uranus', 'A gas giant that rotates on its side, with a system of thin rings and many moons', 4590, 14.5, 19.18, 25362, -195, TRUE, 'Mainly hydrogen and helium', FALSE, TRUE, 1),
('Neptune', 'A blue gas giant with the strongest winds in our solar system and many moons', 4590, 17.1, 30.07, 24622, -200, TRUE, 'Mainly hydrogen and helium', FALSE, TRUE, 1), 
('WASP-76b', 'A gas giant with a very close orbit around its host star', NULL, 1.8, 390, 127000, 2400, TRUE, 'Hydrogen, Helium', FALSE, FALSE, 2), 
('HD 209458b', 'A gas giant with a large atmosphere that is evaporating into space', NULL, 1.1, 153, 71492, 1130, TRUE, 'Hydrogen, Helium', FALSE, FALSE, 3), 
('Kepler-452b', 'A rocky planet with an orbit in the habitable zone of its star', NULL, NULL, 1400, 24000, NULL, NULL, NULL, TRUE, FALSE, 4), 
('Proxima Centauri b', 'A rocky planet in the habitable zone of the closest star to our solar system', NULL, NULL, 4.2, 8300, NULL, NULL, NULL, TRUE, FALSE, 5), 
('TOI-700d', 'A rocky planet in the habitable zone of a star similar to our sun', NULL, 1.72, 100, 268, NULL, NULL, NULL, TRUE, FALSE, 6); 


-- 20 moons
INSERT INTO moon(name, description, age_myr, mass_kg, mean_orbit_radius_km, planet_id) 
VALUES
('Luna', 'The only natural satellite from Earth', 4.5, 0.0123, 384400, 3), 
('Phobos', 'A small, irregularly shaped moon of Mars', 4.5, 1.08e-9, 9376, 4), 
('Deimos', 'A small, irregularly shaped moon of Mars', 4.5, 2.4e-10, 23463.2, 4), 
('Ganymede', 'The largest moon in the Solar System, and one of the Galilean moons from Jupiter', 4.5, 2.02e-4, 1.07e6, 5), 
('Europa', 'A moon of Jupiter that is believed to have a subsurface ocean of liquid water', 4.5, 1.48e-4, 6.71e5, 5), 
('Io', 'A moon of Jupiter known for its volcanic activity', 4.5, 8.94e-5, 4.22e5, 5), 
('Titan', 'The largest moon of Saturn and the only moon in the Solar System with a dense atmosphere', 4.5, 2.33e-4, 1.22e6, 6), 
('Enceladus', 'A small, icy moon of Saturn known for its geysers', 4.5, 1.08e-8, 2.38e5, 6), 
('Miranda', 'A small, icy moon of Uranus with a chaotic terrain of jumbled ice blocks', 4.5, 6.59e-10, 1.29e5, 7), 
('Triton', 'The largest moon of Neptune and the only large moon in the Solar System that orbits in the opposite direction of the rotation of its planets', 4.5, 2.14e-4, 3.55e5, 8), 
('Charon', 'The largest moon of Pluto, and part of a binary system with Pluto', 4.5, 1.59e-7, 1.96e4, NULL), 
('Callisto', 'A large, heavily cratered moon of Jupiter.', 4510, 1.0759e23, 1882700, 5),
('Umbriel', 'A moon of Uranus that is heavily cratered and has a dark surface.', 4470, 1.27e21, 266000, 7),
('Ariel', 'A moon of Uranus with a young surface and many geological features.', 4500, 1.35e21, 191000, 7),
('Oberon', 'A heavily cratered moon of Uranus with a relatively homogeneous surface.', 4510, 3.014e21, 583520, 7),
('Titania', 'A moon of Uranus that is the eighth largest moon in the Solar System.', 4510, 3.49e21, 435910, 7),
('Iapetus', 'A moon of Saturn with a strange two-toned appearance.', 4530, 1.81e21, 3560820, 6),
('Dione', 'A heavily cratered moon of Saturn with a bright surface.', 4530, 1.095e21, 377400, 6),
('Rhea', 'A heavily cratered moon of Saturn with a heavily cratered surface and a faint atmosphere.', 4530, 2.316e21, 527108, 6),
('Tethys', 'A heavily cratered moon of Saturn with a very large impact crater on one side.', 4530, 6.174e20, 294619, 6),
('Hyperion', 'A strange, irregularly-shaped moon of Saturn with a very low density.', 4530, 5.62e18, 1481100, 6),
('Phoebe', 'An irregularly-shaped moon of Saturn with a retrograde orbit.', 4530, 8.292e18, 12947677, 6),
('Mimas', 'A heavily cratered moon of Saturn with a giant impact crater that makes it resemble the Death Star from Star Wars.', 4530, 3.75e19, 185520, 6);