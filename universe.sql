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
    galaxy_type character varying(30),
    age_in_millions_of_years integer
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
    has_life boolean,
    circumference numeric(6,1),
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
    has_life boolean,
    planet_type character varying(30),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_more_info (
    planet_more_info_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.planet_more_info OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_more_info_planet_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_more_info_planet_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_more_info_planet_more_info_id_seq OWNED BY public.planet_more_info.planet_more_info_id;


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
    age_in_millions_of_years integer,
    distance_from_earth numeric(6,1),
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
-- Name: planet_more_info planet_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info ALTER COLUMN planet_more_info_id SET DEFAULT nextval('public.planet_more_info_planet_more_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 'The galaxy thatincludes our sololar system', 'spiral', 700);
INSERT INTO public.galaxy VALUES (2, 'Sombrrero', 'A peculiar galaxy', 'spiral', 4000);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Is a bared spiral galaxy', 'spiral', 800);
INSERT INTO public.galaxy VALUES (4, 'Cygnus A', 'A radio galaxy, and the strongest source of radio in the sky', 'Elliptical', 600);
INSERT INTO public.galaxy VALUES (5, 'Canis Major Dwarf', 'The closest galaxy to the Milky Way', 'Irregular', 100);
INSERT INTO public.galaxy VALUES (6, 'Antennae', 'A pair of interacting galaxies in the constellation curvos', 'Spiral', 300);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 54.9, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 78.9, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 80.9, 4);
INSERT INTO public.moon VALUES (5, 'Europa', false, 97.9, 5);
INSERT INTO public.moon VALUES (6, 'Gannymede', false, 67.9, 5);
INSERT INTO public.moon VALUES (7, 'lo', false, 37.9, 5);
INSERT INTO public.moon VALUES (8, 'Callisto', false, 67.9, 5);
INSERT INTO public.moon VALUES (9, 'Amalthea', false, 87.4, 5);
INSERT INTO public.moon VALUES (10, 'Himalia', false, 74.1, 5);
INSERT INTO public.moon VALUES (11, 'Valitudo', false, 54.1, 5);
INSERT INTO public.moon VALUES (12, 'Adratea', false, 44.3, 5);
INSERT INTO public.moon VALUES (13, 'Carme', false, 68.1, 5);
INSERT INTO public.moon VALUES (14, 'Elara', false, 77.6, 5);
INSERT INTO public.moon VALUES (15, 'Ananke', false, 74.6, 5);
INSERT INTO public.moon VALUES (16, 'Thebe', false, 41.7, 5);
INSERT INTO public.moon VALUES (17, 'pasiphea', false, 56.7, 5);
INSERT INTO public.moon VALUES (18, 'locaste', false, 88.8, 5);
INSERT INTO public.moon VALUES (19, 'Ainte', false, 77.8, 5);
INSERT INTO public.moon VALUES (20, 'Helike', false, 88.0, 5);
INSERT INTO public.moon VALUES (21, 'Herse', false, 71.9, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Rocky planet', 2);
INSERT INTO public.planet VALUES (2, 'Mercury', false, 'Rocky planet', 2);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'Rocky planet', 2);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'Rocky planet', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Gas planet', 2);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Gas planet', 2);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'Gas planet', 2);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'Gas planet', 2);
INSERT INTO public.planet VALUES (9, 'Planet Vigita', true, 'Rocky planet', 3);
INSERT INTO public.planet VALUES (10, 'Planet Orville', true, 'Rocky planet', 5);
INSERT INTO public.planet VALUES (11, 'Konoha', true, 'Rocky planet', 6);
INSERT INTO public.planet VALUES (12, 'Hogwarts', true, 'Rocky planet', 4);


--
-- Data for Name: planet_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_more_info VALUES (1, 'Earth', 1, 2);
INSERT INTO public.planet_more_info VALUES (2, 'Venus', 1, 2);
INSERT INTO public.planet_more_info VALUES (3, 'Mars', 1, 2);
INSERT INTO public.planet_more_info VALUES (4, 'Mercury', 1, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sol', 700, 8.8, 1);
INSERT INTO public.star VALUES (3, 'Star_2', 700, 8.8, 1);
INSERT INTO public.star VALUES (4, 'Star_3', 500, 90.8, 1);
INSERT INTO public.star VALUES (5, 'Star_4', 700, 97.8, 2);
INSERT INTO public.star VALUES (6, 'Star_5', 300, 760.8, 6);
INSERT INTO public.star VALUES (7, 'Star_6', 600, 890.9, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_more_info_planet_more_info_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet_more_info planet_more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_name_key UNIQUE (name);


--
-- Name: planet_more_info planet_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_pkey PRIMARY KEY (planet_more_info_id);


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
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

