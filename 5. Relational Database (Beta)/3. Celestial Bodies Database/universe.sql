--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_myr integer,
    solar_mass numeric(37,9),
    distance_ly numeric(37,9) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_myr integer,
    mass_kg numeric(37,9) NOT NULL,
    mean_orbit_radius_km numeric(37,9),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_myr integer,
    earth_mass numeric(37,9),
    distance_ly numeric(37,9) NOT NULL,
    mean_radius_km numeric(9,3),
    temperature_k integer,
    atmosphere boolean,
    composition text,
    habitable boolean,
    has_moon boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_myr integer,
    solar_mass numeric(37,9),
    distance_ly numeric(37,9) NOT NULL,
    constellation character varying(50),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: units_reference; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.units_reference (
    units_reference_id integer NOT NULL,
    name character varying(30) NOT NULL,
    magnitude numeric(40,8),
    units text NOT NULL
);


ALTER TABLE public.units_reference OWNER TO freecodecamp;

--
-- Name: units_reference_units_reference_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.units_reference_units_reference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.units_reference_units_reference_id_seq OWNER TO freecodecamp;

--
-- Name: units_reference_units_reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.units_reference_units_reference_id_seq OWNED BY public.units_reference.units_reference_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: units_reference units_reference_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.units_reference ALTER COLUMN units_reference_id SET DEFAULT nextval('public.units_reference_units_reference_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral galaxy that contains our Solar System', 14, 1500000000000.000000000, 0.000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral galaxy located approximately 2.5 million light years away from the Milky Way', 10, 1300000000000.000000000, 2500000.000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'spiral galaxy approximately 3 million light-years away from Earth', 30000, 6400000000.000000000, 3000000.000000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'spiral galaxy located about 23 million light years away from Earth', 6, 48000000000.000000000, 23000000.000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'spiral galaxy located approximately 28 million light years away from Earth', 9, 80000000000.000000000, 28000000.000000000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'dwarf galaxy located approximately 163,000 light-years away from Earth', 13000, 3300000000.000000000, 163000.000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'The only natural satellite from Earth', 5, 0.012300000, 384400.000000000, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A small, irregularly shaped moon of Mars', 5, 0.000000001, 9376.000000000, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'A small, irregularly shaped moon of Mars', 5, 0.000000000, 23463.200000000, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'The largest moon in the Solar System, and one of the Galilean moons from Jupiter', 5, 0.000202000, 1070000.000000000, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'A moon of Jupiter that is believed to have a subsurface ocean of liquid water', 5, 0.000148000, 671000.000000000, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'A moon of Jupiter known for its volcanic activity', 5, 0.000089400, 422000.000000000, 5);
INSERT INTO public.moon VALUES (7, 'Titan', 'The largest moon of Saturn and the only moon in the Solar System with a dense atmosphere', 5, 0.000233000, 1220000.000000000, 6);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'A small, icy moon of Saturn known for its geysers', 5, 0.000000011, 238000.000000000, 6);
INSERT INTO public.moon VALUES (9, 'Miranda', 'A small, icy moon of Uranus with a chaotic terrain of jumbled ice blocks', 5, 0.000000001, 129000.000000000, 7);
INSERT INTO public.moon VALUES (10, 'Triton', 'The largest moon of Neptune and the only large moon in the Solar System that orbits in the opposite direction of the rotation of its planets', 5, 0.000214000, 355000.000000000, 8);
INSERT INTO public.moon VALUES (11, 'Charon', 'The largest moon of Pluto, and part of a binary system with Pluto', 5, 0.000000159, 19600.000000000, NULL);
INSERT INTO public.moon VALUES (12, 'Callisto', 'A large, heavily cratered moon of Jupiter.', 4510, 107590000000000000000000.000000000, 1882700.000000000, 5);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'A moon of Uranus that is heavily cratered and has a dark surface.', 4470, 1270000000000000000000.000000000, 266000.000000000, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 'A moon of Uranus with a young surface and many geological features.', 4500, 1350000000000000000000.000000000, 191000.000000000, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 'A heavily cratered moon of Uranus with a relatively homogeneous surface.', 4510, 3014000000000000000000.000000000, 583520.000000000, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 'A moon of Uranus that is the eighth largest moon in the Solar System.', 4510, 3490000000000000000000.000000000, 435910.000000000, 7);
INSERT INTO public.moon VALUES (17, 'Iapetus', 'A moon of Saturn with a strange two-toned appearance.', 4530, 1810000000000000000000.000000000, 3560820.000000000, 6);
INSERT INTO public.moon VALUES (18, 'Dione', 'A heavily cratered moon of Saturn with a bright surface.', 4530, 1095000000000000000000.000000000, 377400.000000000, 6);
INSERT INTO public.moon VALUES (19, 'Rhea', 'A heavily cratered moon of Saturn with a heavily cratered surface and a faint atmosphere.', 4530, 2316000000000000000000.000000000, 527108.000000000, 6);
INSERT INTO public.moon VALUES (20, 'Tethys', 'A heavily cratered moon of Saturn with a very large impact crater on one side.', 4530, 617400000000000000000.000000000, 294619.000000000, 6);
INSERT INTO public.moon VALUES (21, 'Hyperion', 'A strange, irregularly-shaped moon of Saturn with a very low density.', 4530, 5620000000000000000.000000000, 1481100.000000000, 6);
INSERT INTO public.moon VALUES (22, 'Phoebe', 'An irregularly-shaped moon of Saturn with a retrograde orbit.', 4530, 8292000000000000000.000000000, 12947677.000000000, 6);
INSERT INTO public.moon VALUES (23, 'Mimas', 'A heavily cratered moon of Saturn with a giant impact crater that makes it resemble the Death Star from Star Wars.', 4530, 37500000000000000000.000000000, 185520.000000000, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Small, rocky planet that orbits close to the sun', 4568, 0.055300000, 0.390000000, 2439.700, 440, false, 'Rocky', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Similar in size and composition to Earth, but with a thick, toxic atmosphere', 4430, 0.815000000, 0.720000000, 6051.800, 737, true, 'Mainly CO2', false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only known planet with abundant liquid water on its surface and the only planet known to support life', 4500, 1.000000000, 1.000000000, 6371.000, 288, true, 'Nitrogen, Oxygen', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Small, cold, and dry, with a thin atmosphere', 4567, 0.107000000, 1.520000000, 3389.500, 210, false, 'Rocky', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our solar system, with a thick atmosphere and many moons', 4590, 317.800000000, 5.200000000, 69911.000, 165, true, 'Mainly hydrogen and helium', false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its prominent rings, this gas giant has many moons', 4530, 95.200000000, 9.580000000, 58232.000, -140, true, 'Mainly hydrogen and helium', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'A gas giant that rotates on its side, with a system of thin rings and many moons', 4590, 14.500000000, 19.180000000, 25362.000, -195, true, 'Mainly hydrogen and helium', false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'A blue gas giant with the strongest winds in our solar system and many moons', 4590, 17.100000000, 30.070000000, 24622.000, -200, true, 'Mainly hydrogen and helium', false, true, 1);
INSERT INTO public.planet VALUES (9, 'WASP-76b', 'A gas giant with a very close orbit around its host star', NULL, 1.800000000, 390.000000000, 127000.000, 2400, true, 'Hydrogen, Helium', false, false, 2);
INSERT INTO public.planet VALUES (10, 'HD 209458b', 'A gas giant with a large atmosphere that is evaporating into space', NULL, 1.100000000, 153.000000000, 71492.000, 1130, true, 'Hydrogen, Helium', false, false, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 'A rocky planet with an orbit in the habitable zone of its star', NULL, NULL, 1400.000000000, 24000.000, NULL, NULL, NULL, true, false, 4);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 'A rocky planet in the habitable zone of the closest star to our solar system', NULL, NULL, 4.200000000, 8300.000, NULL, NULL, NULL, true, false, 5);
INSERT INTO public.planet VALUES (13, 'TOI-700d', 'A rocky planet in the habitable zone of a star similar to our sun', NULL, 1.720000000, 100.000000000, 268.000, NULL, NULL, NULL, true, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System', 5, 1.000000000, 0.000000000, 'N/A', 1);
INSERT INTO public.star VALUES (2, 'WASP-76', 'yellow-white main sequence star in the constellation of Pisces', 50, 1.430000000, 390.000000000, 'Pisces', 1);
INSERT INTO public.star VALUES (3, 'HD 209458', 'yellow dwarf star in the constellation Pegasus', 7, 1.100000000, 153.000000000, 'Pegasus', 1);
INSERT INTO public.star VALUES (4, 'Kepler-452', 'G-type main-sequence star in the constellation Cygnus', 6, 1.040000000, 1402.000000000, 'Cygnus', 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'red dwarf star in the constellation Centaurus', 4, 0.120000000, 4.240000000, 'Centaurus', 1);
INSERT INTO public.star VALUES (6, 'TOI-700', 'red dwarf star in the constellation Dorado', 1, 0.410000000, 101.500000000, 'Dorado', 1);
INSERT INTO public.star VALUES (7, 'Sirius', 'The brightest star in the night sky', 240, 2.020000000, 8.600000000, 'Canis Major', 1);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 'A red supergiant star in the constellation Orion', 9, 18.000000000, 640.000000000, 'Orion', 1);
INSERT INTO public.star VALUES (9, 'Polaris', 'The current North Star', 50, 4.500000000, 323.000000000, 'Ursa Minor', 1);
INSERT INTO public.star VALUES (10, 'Vega', 'The fifth-brightest star in the night sky', 455, 2.100000000, 25.000000000, 'Lyra', 1);
INSERT INTO public.star VALUES (11, 'Alpha Centauri', 'The closest star system to our solar system', 7, 1.100000000, 4.370000000, 'Centaurus', 1);
INSERT INTO public.star VALUES (12, 'Antares', 'A red supergiant star in the constellation Scorpius', 12, 15.000000000, 550.000000000, 'Scorpius', 1);
INSERT INTO public.star VALUES (13, 'Andromeda XXXI', 'star in the Andromeda galaxy', 10000, 0.700000000, 2530000.000000000, NULL, 2);
INSERT INTO public.star VALUES (14, 'M31 RV', 'red variable star in the Andromeda galaxy', 3000, 2.100000000, 2530000.000000000, NULL, 2);
INSERT INTO public.star VALUES (15, 'NGC 604', 'massive star-forming region in Triangulum Galaxy', 3, 25000.000000000, 3.500000000, NULL, 3);
INSERT INTO public.star VALUES (16, 'SK 15', 'Wolf-Rayet star in Triangulum Galaxy', 2, 50.000000000, 2.900000000, NULL, 3);
INSERT INTO public.star VALUES (17, 'NGC 5194-B', 'Blue dwarf star in the Whirlpool Galaxy', 4000, 1.500000000, 31.100000000, NULL, 4);
INSERT INTO public.star VALUES (18, 'Sombrero A', 'Yellow supergiant star in the Sombrero Galaxy', 9000, 12.000000000, 28.000000000, NULL, 5);
INSERT INTO public.star VALUES (19, 'LMC B225-37', 'Red giant star in the Large Magellanic Cloud', 1500, 0.600000000, 163.000000000, NULL, 6);


--
-- Data for Name: units_reference; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.units_reference VALUES (1, 'Solar Mass (M☉)', 1989000000000000000000000000000.00000000, 'kg');
INSERT INTO public.units_reference VALUES (2, 'Solar Radius (R☉)', 695700000.00000000, 'm');
INSERT INTO public.units_reference VALUES (3, 'Earth Mass', 5970000000000000000000000.00000000, 'kg');
INSERT INTO public.units_reference VALUES (4, 'Earth Radius', 6371000.00000000, 'm');
INSERT INTO public.units_reference VALUES (5, 'Light-year (ly)', 9460000000000.00000000, 'km');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 19, true);


--
-- Name: units_reference_units_reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.units_reference_units_reference_id_seq', 5, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: units_reference units_reference_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.units_reference
    ADD CONSTRAINT units_reference_name_key UNIQUE (name);


--
-- Name: units_reference units_reference_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.units_reference
    ADD CONSTRAINT units_reference_pkey PRIMARY KEY (units_reference_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

