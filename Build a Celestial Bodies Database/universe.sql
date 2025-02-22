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
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    distance_from_earth numeric(32,0)
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
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean DEFAULT true,
    planet_id integer NOT NULL
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
-- Name: person; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.person (
    person_id integer NOT NULL,
    name character varying(60) NOT NULL,
    height integer,
    weight integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.person OWNER TO freecodecamp;

--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.person_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_person_id_seq OWNER TO freecodecamp;

--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.person_person_id_seq OWNED BY public.person.person_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean DEFAULT true,
    star_id integer NOT NULL
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
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(32,0),
    is_spherical boolean DEFAULT true,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: person person_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.person ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Our home galaxy, a barred spiral galaxy.', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'The closest spiral galaxy to the Milky Way.', 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 'A small spiral galaxy in the Local Group.', 3000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 6500, 'An elliptical galaxy with a supermassive black hole.', 53500000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9000, 'A spiral galaxy with a large central bulge.', 31000000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 400, 'A face-on spiral galaxy with a bright nucleus.', 31000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4500, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4600, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4600, true, 2);
INSERT INTO public.moon VALUES (4, 'Proxima-b1', 6000, true, 3);
INSERT INTO public.moon VALUES (5, 'Proxima-b2', 6000, true, 3);
INSERT INTO public.moon VALUES (6, 'Proxima-c1', 6000, true, 4);
INSERT INTO public.moon VALUES (7, 'Proxima-c2', 6000, true, 4);
INSERT INTO public.moon VALUES (8, 'Andromeda-1a', 5000, true, 5);
INSERT INTO public.moon VALUES (9, 'Andromeda-1b', 5000, true, 5);
INSERT INTO public.moon VALUES (10, 'Andromeda-2a', 5000, true, 6);
INSERT INTO public.moon VALUES (11, 'Andromeda-2b', 5000, true, 6);
INSERT INTO public.moon VALUES (12, 'Triangulum Prime A', 7000, true, 7);
INSERT INTO public.moon VALUES (13, 'Triangulum Prime B', 7000, true, 7);
INSERT INTO public.moon VALUES (14, 'Triangulum Beta A', 7000, true, 8);
INSERT INTO public.moon VALUES (15, 'Triangulum Beta B', 7000, true, 8);
INSERT INTO public.moon VALUES (16, 'M87b-1', 5500, true, 9);
INSERT INTO public.moon VALUES (17, 'M87b-2', 5500, true, 9);
INSERT INTO public.moon VALUES (18, 'Whirlpool-1a', 400, true, 11);
INSERT INTO public.moon VALUES (19, 'Whirlpool-1b', 400, true, 11);
INSERT INTO public.moon VALUES (20, 'Whirlpool-2a', 400, true, 12);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.person VALUES (1, 'Alice Voyager', 170, 65, 1);
INSERT INTO public.person VALUES (2, 'Bob Martian', 180, 75, 2);
INSERT INTO public.person VALUES (3, 'Charlie Exo', 165, 60, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4600, true, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 6000, true, 2);
INSERT INTO public.planet VALUES (4, 'Proxima c', 6000, true, 2);
INSERT INTO public.planet VALUES (5, 'Andromeda-1', 5000, true, 3);
INSERT INTO public.planet VALUES (6, 'Andromeda-2', 5000, true, 3);
INSERT INTO public.planet VALUES (7, 'Triangulum Prime', 7000, true, 4);
INSERT INTO public.planet VALUES (8, 'Triangulum Beta', 7000, true, 4);
INSERT INTO public.planet VALUES (9, 'M87b', 5500, true, 5);
INSERT INTO public.planet VALUES (10, 'M87c', 5500, true, 5);
INSERT INTO public.planet VALUES (11, 'Whirlpool-1', 400, true, 6);
INSERT INTO public.planet VALUES (12, 'Whirlpool-2', 400, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 0, true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 6000, 4, true, 1);
INSERT INTO public.star VALUES (3, 'Andromeda A', 5000, 2537000, true, 2);
INSERT INTO public.star VALUES (4, 'Triangulum Alpha', 7000, 3000000, true, 3);
INSERT INTO public.star VALUES (5, 'M87 Star', 5500, 53500000, true, 4);
INSERT INTO public.star VALUES (6, 'Whirlpool Star', 400, 31000000, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.person_person_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: person person_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_name_key UNIQUE (name);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: person person_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

