--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    galaxy_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    distance numeric NOT NULL,
    discovered boolean DEFAULT false,
    description text,
    star_count integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
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
    moon_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    planet_id bigint,
    diameter numeric NOT NULL,
    has_atmosphere boolean DEFAULT false,
    orbit_period integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
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
    planet_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    star_id bigint,
    radius numeric NOT NULL,
    has_rings boolean DEFAULT false,
    orbit_period integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
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
    star_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id bigint,
    luminosity numeric NOT NULL,
    is_binary boolean DEFAULT false,
    temperature integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
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
-- Name: star_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_system (
    star_system_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    is_active boolean DEFAULT true
);


ALTER TABLE public.star_system OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_system_star_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_system_star_system_id_seq OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_system_star_system_id_seq OWNED BY public.star_system.star_system_id;


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
-- Name: star_system star_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system ALTER COLUMN star_system_id SET DEFAULT nextval('public.star_system_star_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, true, 'Our home galaxy', 10000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, true, 'Nearest galaxy to the Milky Way', 10000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, true, 'Small spiral galaxy', 100000);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 12000000, false, 'A large spiral galaxy', 1000000);
INSERT INTO public.galaxy VALUES (5, 'Messier 82', 12000000, false, 'A cigar-shaped galaxy', 1000000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 23000000, true, 'Spiral galaxy with prominent arms', 5000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 76, 3474, true, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 76, 22, false, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 76, 12, false, 1);
INSERT INTO public.moon VALUES (4, 'Kepler-22b I', 82, 4, true, 10);
INSERT INTO public.moon VALUES (5, 'Kepler-22b II', 82, 5, false, 15);
INSERT INTO public.moon VALUES (6, 'Kepler-22b III', 82, 6, true, 20);
INSERT INTO public.moon VALUES (7, 'Moon 1', 88, 5, true, 12);
INSERT INTO public.moon VALUES (8, 'Moon 2', 88, 6, false, 22);
INSERT INTO public.moon VALUES (9, 'Moon 3', 88, 7, true, 30);
INSERT INTO public.moon VALUES (10, 'WASP-18b I', 94, 6, true, 8);
INSERT INTO public.moon VALUES (11, 'WASP-18b II', 94, 7, false, 14);
INSERT INTO public.moon VALUES (12, 'WASP-18b III', 94, 8, true, 18);
INSERT INTO public.moon VALUES (13, 'Moon A', 100, 11, true, 28);
INSERT INTO public.moon VALUES (14, 'Moon B', 100, 12, false, 36);
INSERT INTO public.moon VALUES (15, 'Moon C', 100, 13, true, 40);
INSERT INTO public.moon VALUES (16, 'Proxima c I', 106, 8, true, 12);
INSERT INTO public.moon VALUES (17, 'Proxima c II', 106, 9, false, 20);
INSERT INTO public.moon VALUES (18, 'Proxima c III', 106, 10, true, 28);
INSERT INTO public.moon VALUES (19, 'Proxima c IV', 106, 11, false, 32);
INSERT INTO public.moon VALUES (20, 'Kepler-452b I', 107, 7, true, 15);
INSERT INTO public.moon VALUES (21, 'Kepler-452b II', 107, 8, false, 22);
INSERT INTO public.moon VALUES (22, 'Kepler-452b III', 107, 9, true, 28);
INSERT INTO public.moon VALUES (23, 'Kepler-452b IV', 107, 10, false, 34);
INSERT INTO public.moon VALUES (24, 'Kepler-452b V', 107, 11, true, 40);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (76, 'Earth', 17, 6371, true, 365);
INSERT INTO public.planet VALUES (77, 'Mars', 17, 3389, false, 687);
INSERT INTO public.planet VALUES (78, 'Jupiter', 17, 69911, true, 4333);
INSERT INTO public.planet VALUES (79, 'Saturn', 17, 58232, true, 10759);
INSERT INTO public.planet VALUES (80, 'Uranus', 17, 25362, true, 30687);
INSERT INTO public.planet VALUES (81, 'Neptune', 17, 24622, false, 60190);
INSERT INTO public.planet VALUES (82, 'Proxima Centauri b', 18, 1.1, false, 11);
INSERT INTO public.planet VALUES (83, 'Alpha Centauri B b', 18, 1.2, true, 4);
INSERT INTO public.planet VALUES (84, 'Luhman 16B', 18, 0.8, false, 9);
INSERT INTO public.planet VALUES (85, 'HD 189733 b', 18, 1.2, true, 2);
INSERT INTO public.planet VALUES (86, 'WASP-12b', 18, 1.4, false, 1);
INSERT INTO public.planet VALUES (87, 'TRAPPIST-1d', 18, 0.8, true, 1);
INSERT INTO public.planet VALUES (88, 'Kepler-22b', 19, 2.4, true, 290);
INSERT INTO public.planet VALUES (89, '55 Cancri e', 19, 1.5, true, 18);
INSERT INTO public.planet VALUES (90, 'HD 209458 b', 19, 1.3, false, 4);
INSERT INTO public.planet VALUES (91, 'Gliese 581g', 19, 1.2, false, 30);
INSERT INTO public.planet VALUES (92, 'Venus', 19, 6051, false, 225);
INSERT INTO public.planet VALUES (93, 'Mercury', 19, 2439, false, 88);
INSERT INTO public.planet VALUES (94, 'WASP-18b', 20, 2.0, true, 1);
INSERT INTO public.planet VALUES (95, 'HD 80606 b', 20, 1.4, true, 111);
INSERT INTO public.planet VALUES (96, 'Kepler-186f', 20, 1.0, false, 130);
INSERT INTO public.planet VALUES (97, 'HD 40307h', 20, 1.5, true, 1);
INSERT INTO public.planet VALUES (98, 'GJ 1214b', 20, 1.3, false, 2);
INSERT INTO public.planet VALUES (99, 'HD 40307g', 20, 1.5, true, 1);
INSERT INTO public.planet VALUES (100, 'Aldebaran', 21, 300, false, 4260);
INSERT INTO public.planet VALUES (101, 'Altair', 21, 10, true, 7500);
INSERT INTO public.planet VALUES (102, 'Deneb', 21, 20000, false, 8500);
INSERT INTO public.planet VALUES (103, 'Arcturus', 21, 30, true, 4300);
INSERT INTO public.planet VALUES (104, 'Vega', 21, 40, false, 9600);
INSERT INTO public.planet VALUES (105, 'Alpha Centauri B', 21, 1.8, true, 5600);
INSERT INTO public.planet VALUES (106, 'Proxima Centauri c', 22, 1.3, true, 12);
INSERT INTO public.planet VALUES (107, 'Kepler-452b', 22, 1.2, false, 384);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (17, 'Sun', 1, 1, false, 5778);
INSERT INTO public.star VALUES (18, 'Sirius', 1, 25.4, true, 9940);
INSERT INTO public.star VALUES (19, 'Betelgeuse', 1, 100000, false, 3500);
INSERT INTO public.star VALUES (20, 'Polaris', 1, 2000, false, 6000);
INSERT INTO public.star VALUES (21, 'Alpha Centauri', 1, 1.5, true, 5790);
INSERT INTO public.star VALUES (22, 'Rigel', 1, 120000, false, 12100);
INSERT INTO public.star VALUES (23, 'Proxima Centauri', 2, 0.5, true, 3050);
INSERT INTO public.star VALUES (24, 'Aldebaran', 2, 300, false, 4260);
INSERT INTO public.star VALUES (25, 'Altair', 2, 10, true, 7500);
INSERT INTO public.star VALUES (26, 'Deneb', 2, 20000, false, 8500);
INSERT INTO public.star VALUES (27, 'Arcturus', 3, 30, true, 4300);
INSERT INTO public.star VALUES (28, 'Vega', 3, 40, false, 9600);
INSERT INTO public.star VALUES (29, 'Alpha Centauri B', 4, 1.8, true, 5600);
INSERT INTO public.star VALUES (30, 'Epsilon Eridani', 4, 0.9, false, 5110);
INSERT INTO public.star VALUES (31, 'Fomalhaut', 5, 16, true, 8500);
INSERT INTO public.star VALUES (32, 'Achernar', 6, 2000, true, 11000);


--
-- Data for Name: star_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_system VALUES (1, 'Solar System', 1, 'The solar system including the Sun and its planets.', true);
INSERT INTO public.star_system VALUES (2, 'Alpha Centauri System', 1, 'The closest star system to Earth after the Solar System.', true);
INSERT INTO public.star_system VALUES (3, 'Proxima Centauri System', 2, 'A star system including Proxima Centauri and its planets.', true);
INSERT INTO public.star_system VALUES (4, 'Kepler-22 System', 3, 'A star system with the planet Kepler-22b.', true);
INSERT INTO public.star_system VALUES (5, 'HD 40307 System', 4, 'A star system with the planet HD 40307g.', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 107, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 32, true);


--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_system_star_system_id_seq', 5, true);


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
-- Name: star_system star_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_name_key UNIQUE (name);


--
-- Name: star_system star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_pkey PRIMARY KEY (star_system_id);


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
-- Name: star_system star_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--