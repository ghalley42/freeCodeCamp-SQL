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
    name character varying(50),
    year_first_observed integer NOT NULL,
    description text,
    rating numeric,
    CONSTRAINT rating_check CHECK (((rating >= (1)::numeric) AND (rating <= (10)::numeric)))
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
    name character varying(50),
    year_discovered integer NOT NULL,
    planet_id integer NOT NULL,
    dr_evil_target boolean
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
    name character varying(50),
    star_id integer NOT NULL,
    circumference numeric,
    brief_description text
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
-- Name: space_missions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_missions (
    space_missions_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mission_goal text,
    success boolean NOT NULL
);


ALTER TABLE public.space_missions OWNER TO freecodecamp;

--
-- Name: space_missions_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_missions_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_missions_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_missions_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_missions_mission_id_seq OWNED BY public.space_missions.space_missions_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer NOT NULL,
    distance_from_earth numeric,
    number_of_planets integer
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
-- Name: space_missions space_missions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions ALTER COLUMN space_missions_id SET DEFAULT nextval('public.space_missions_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1610, 'Earth is here', 10);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1612, 'Visible by the naked eye from Earth', 7);
INSERT INTO public.galaxy VALUES (3, 'Messier 82', 1774, 'Called the cigar galaxy due to looking like a cigar', 10);
INSERT INTO public.galaxy VALUES (4, 'Eye of God', 1784, 'Face-on spiral galaxy with multi-arms', 5);
INSERT INTO public.galaxy VALUES (5, 'Eye of Sauron', 1970, 'Intermediate spiral Seyfert galaxy with weak inner ring', 6);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 1773, 'Interacting grand design galaxy with Seyfert 2 active galactic nucleus', 6.8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1609, 1, true);
INSERT INTO public.moon VALUES (2, 'Metis', 1979, 6, false);
INSERT INTO public.moon VALUES (3, 'Adrastea', 1979, 6, false);
INSERT INTO public.moon VALUES (4, 'Amalthea', 1892, 6, false);
INSERT INTO public.moon VALUES (5, 'Thebe', 1979, 6, false);
INSERT INTO public.moon VALUES (6, 'Io', 1610, 6, false);
INSERT INTO public.moon VALUES (7, 'Europa', 1610, 6, false);
INSERT INTO public.moon VALUES (8, 'Ganymede', 1610, 6, false);
INSERT INTO public.moon VALUES (9, 'Callisto', 1610, 6, false);
INSERT INTO public.moon VALUES (10, 'Themisto', 1975, 6, false);
INSERT INTO public.moon VALUES (11, 'Leda', 1974, 6, false);
INSERT INTO public.moon VALUES (12, 'Ersa', 2018, 6, false);
INSERT INTO public.moon VALUES (13, 'Himali', 1904, 6, false);
INSERT INTO public.moon VALUES (14, 'Elara', 1905, 6, false);
INSERT INTO public.moon VALUES (15, 'Mimas', 1789, 7, false);
INSERT INTO public.moon VALUES (16, 'Tethys', 1684, 7, false);
INSERT INTO public.moon VALUES (17, 'Enceladus', 1789, 7, false);
INSERT INTO public.moon VALUES (18, 'Dione', 1684, 7, false);
INSERT INTO public.moon VALUES (19, 'Rhea', 1672, 7, false);
INSERT INTO public.moon VALUES (20, 'Titan', 1655, 7, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 24901, 'Only known planet to harbor intelligent life');
INSERT INTO public.planet VALUES (2, 'M51-ULS-1B', 6, 191062, 'Could be the first extragalactic planet');
INSERT INTO public.planet VALUES (3, 'Mercury', 1, 9525.1, 'First planet from the sun');
INSERT INTO public.planet VALUES (4, 'Venus', 1, 23628, 'Second planet from the sun');
INSERT INTO public.planet VALUES (5, 'Mars', 1, 13262, 'Fourth planet from the sun');
INSERT INTO public.planet VALUES (6, 'Jupiter', 1, 278985, 'Largest planet in the solar system');
INSERT INTO public.planet VALUES (7, 'Saturn', 1, 235298, 'Second biggest planet in the solar system');
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 99786, 'Most frequently used planet in anus memes');
INSERT INTO public.planet VALUES (9, 'Neptune', 1, 96685, 'Farthest known planet from the Sun');
INSERT INTO public.planet VALUES (10, 'Onot', 5, 25381, '10th planet in the Rigel system');
INSERT INTO public.planet VALUES (11, 'Sirk', 5, 24500, '6th planet in the Rigel system');
INSERT INTO public.planet VALUES (12, 'Valosm', 5, 36760, '4th planet in the Rigel system');


--
-- Data for Name: space_missions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_missions VALUES (1, 'Apollo 11', 'Land on the Moon', true);
INSERT INTO public.space_missions VALUES (2, 'Apollo 13', 'Land on the Moon', true);
INSERT INTO public.space_missions VALUES (3, 'Challenger', 'Unclear', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1, 93000000, 8);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, 570200000000000, 0);
INSERT INTO public.star VALUES (3, 'Merach', 2, 1170000000000000, 0);
INSERT INTO public.star VALUES (4, 'Antares', 1, 3233000000000000, 0);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 5085000000000000, 14);
INSERT INTO public.star VALUES (6, 'M51-ULS-1', 6, 135208384000000000000, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_missions_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_missions_mission_id_seq', 3, true);


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
-- Name: space_missions space_missions_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions
    ADD CONSTRAINT space_missions_mission_name_key UNIQUE (name);


--
-- Name: space_missions space_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions
    ADD CONSTRAINT space_missions_pkey PRIMARY KEY (space_missions_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

