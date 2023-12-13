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
    has_life boolean NOT NULL,
    galaxy_type character varying(30),
    distance_from_earth integer,
    is_spherical boolean,
    galaxy_id integer NOT NULL,
    description text,
    name character varying(30)
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
-- Name: junction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    junction_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.junction OWNER TO freecodecamp;

--
-- Name: junction_junction_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.junction_junction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_junction_id_seq OWNER TO freecodecamp;

--
-- Name: junction_junction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.junction_junction_id_seq OWNED BY public.junction.junction_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    age_in_millions_of_years numeric(4,1) NOT NULL,
    is_spherical boolean NOT NULL,
    moon_id integer NOT NULL,
    has_life boolean,
    name character varying(30),
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
    has_life boolean NOT NULL,
    planet_types character varying(30),
    age_in_million_of_years numeric(4,1) NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30),
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
    age_in_million_of_years numeric(4,1) NOT NULL,
    star_id integer NOT NULL,
    distance_from_earth integer NOT NULL,
    name character varying(30),
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
-- Name: junction junction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction ALTER COLUMN junction_id SET DEFAULT nextval('public.junction_junction_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (false, 'spiral', 1000, false, 1, 'none', 'spiral1');
INSERT INTO public.galaxy VALUES (true, 'broad egg', 1232130, false, 2, 'none', 'Lilifoot');
INSERT INTO public.galaxy VALUES (false, 'houyhnhnm', 6666, true, 3, 'none', 'Gulliver');
INSERT INTO public.galaxy VALUES (true, 'giant', 61487, false, 4, 'none', 'Brobdingnag');
INSERT INTO public.galaxy VALUES (false, 'birth mark', 24867, true, 5, 'none', 'Laputa');
INSERT INTO public.galaxy VALUES (false, 'submarine', 80000, true, 6, 'none', 'Tressure Island');


--
-- Data for Name: junction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction VALUES (1, 1, 1, 1, NULL);
INSERT INTO public.junction VALUES (2, 2, 2, 2, NULL);
INSERT INTO public.junction VALUES (3, 3, 3, 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (661.6, false, 1, true, 'Athena', 1);
INSERT INTO public.moon VALUES (134.8, true, 2, true, 'Aphrodite', 3);
INSERT INTO public.moon VALUES (572.4, false, 3, false, 'Ares', 4);
INSERT INTO public.moon VALUES (742.1, true, 4, true, 'Cronus', 7);
INSERT INTO public.moon VALUES (413.7, false, 5, false, 'Eros', 8);
INSERT INTO public.moon VALUES (774.5, true, 6, false, 'Aeolus', 9);
INSERT INTO public.moon VALUES (123.7, false, 7, true, 'Artemis', 10);
INSERT INTO public.moon VALUES (778.5, true, 8, false, 'Dionysus', 13);
INSERT INTO public.moon VALUES (123.8, true, 9, true, 'Hermes', 14);
INSERT INTO public.moon VALUES (481.7, false, 10, true, 'Poseidon', 15);
INSERT INTO public.moon VALUES (741.5, false, 11, false, 'Zeus', 16);
INSERT INTO public.moon VALUES (841.1, true, 12, false, 'Acantha', 1);
INSERT INTO public.moon VALUES (472.4, false, 13, true, 'Atlas', 2);
INSERT INTO public.moon VALUES (773.1, true, 14, false, 'Demeter', 3);
INSERT INTO public.moon VALUES (413.7, false, 15, false, 'Hades', 4);
INSERT INTO public.moon VALUES (513.7, true, 16, false, 'Adrasteia', 7);
INSERT INTO public.moon VALUES (137.1, false, 17, true, 'Aecus', 8);
INSERT INTO public.moon VALUES (666.0, false, 18, true, 'Chaos', 7);
INSERT INTO public.moon VALUES (134.8, true, 19, true, 'Argus', 8);
INSERT INTO public.moon VALUES (713.8, false, 20, false, 'Aeson', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (true, 'red giant', 182.0, 1, 'Apollo', 1);
INSERT INTO public.planet VALUES (true, 'gas giant', 194.8, 2, 'Ceres', 2);
INSERT INTO public.planet VALUES (true, 'white dwarf', 192.2, 3, 'Consus', 3);
INSERT INTO public.planet VALUES (true, 'black hole', 193.9, 4, 'Janus', 4);
INSERT INTO public.planet VALUES (false, 'rock & roll', 42.0, 7, 'Mercury', 1);
INSERT INTO public.planet VALUES (false, 'hard rock', 197.1, 8, 'Freddy', 2);
INSERT INTO public.planet VALUES (false, 'metal', 782.2, 9, 'Minerva', 3);
INSERT INTO public.planet VALUES (false, 'black metal', 689.0, 10, 'Caelus', 4);
INSERT INTO public.planet VALUES (false, 'sand', 199.4, 13, 'Diana', 5);
INSERT INTO public.planet VALUES (false, 'love & roll', 434.0, 14, 'Cupid', 6);
INSERT INTO public.planet VALUES (true, 'rock', 188.2, 15, 'Mars', 5);
INSERT INTO public.planet VALUES (true, '3rd rock', 282.0, 16, 'Neptune', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5.0, 1, 182, 'Freya', 1);
INSERT INTO public.star VALUES (700.0, 2, 364, 'Odina', 2);
INSERT INTO public.star VALUES (167.0, 3, 248, 'Hel', 3);
INSERT INTO public.star VALUES (413.0, 4, 351, 'Loki', 4);
INSERT INTO public.star VALUES (417.0, 5, 990, 'Bragi', 5);
INSERT INTO public.star VALUES (477.0, 6, 780, 'Tyr', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: junction_junction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junction_junction_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


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
-- Name: junction junction_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_name_key UNIQUE (name);


--
-- Name: junction junction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_pkey PRIMARY KEY (junction_id);


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
-- Name: junction name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--