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
    name character varying(40) NOT NULL,
    galaxy_type text,
    description text,
    planet_count integer
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
    name character varying(40) NOT NULL,
    distance_from_planet numeric NOT NULL,
    planet_id integer,
    size character varying(5)
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
    name character varying(40) NOT NULL,
    has_life boolean,
    planet_types_id integer,
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    supports_life boolean NOT NULL,
    description text,
    name character varying(40) NOT NULL,
    has_rings boolean
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth numeric(15,6) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 'The galaxy that contains our Solar System, characterized by a central bar-shaped structure composed of stars.', 1000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The nearest major galaxy to the Milky Way, and is on a collision course with it.', 1000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'A smaller spiral galaxy in the Local Group, which also contains the Milky Way and Andromeda.', 400000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'A galaxy famous for its distinctive spiral shape and close companion galaxy, NGC 5195.', 300000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 'Named for its appearance, which resembles a sombrero hat, it features a bright nucleus and a large central bulge.', 800000000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 'A giant elliptical galaxy in the Virgo Cluster, known for housing a supermassive black hole.', 500000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (20, 'Moon', 384400, 37, 'M');
INSERT INTO public.moon VALUES (21, 'Phobos', 9377, 38, 'S');
INSERT INTO public.moon VALUES (22, 'Deimos', 23460, 38, 'S');
INSERT INTO public.moon VALUES (23, 'Proxima b Moon 1', 123000, 39, 'M');
INSERT INTO public.moon VALUES (24, 'Proxima b Moon 2', 340000, 39, 'M');
INSERT INTO public.moon VALUES (25, 'Proxima c Moon Alpha', 500000, 40, 'L');
INSERT INTO public.moon VALUES (26, 'Proxima c Moon Beta', 750000, 40, 'L');
INSERT INTO public.moon VALUES (27, 'Triangulum Prime Moon 1', 1100000, 41, 'XL');
INSERT INTO public.moon VALUES (28, 'Triangulum Prime Moon 2', 1500000, 41, 'L');
INSERT INTO public.moon VALUES (29, 'Whirlpool Alpha Moon A', 1000000, 42, 'S');
INSERT INTO public.moon VALUES (30, 'Whirlpool Alpha Moon B', 1300000, 42, 'S');
INSERT INTO public.moon VALUES (39, 'Whirlpool Gamma Moon C', 1700000, 42, 'M');
INSERT INTO public.moon VALUES (31, 'Sombrero Ice Moon 1', 2000000, 44, 'L');
INSERT INTO public.moon VALUES (32, 'Sombrero Ice Moon 2', 2500000, 44, 'XL');
INSERT INTO public.moon VALUES (33, 'Sombrero New Moon 1', 300000, 45, 'M');
INSERT INTO public.moon VALUES (34, 'Sombrero New Moon 2', 400000, 45, 'M');
INSERT INTO public.moon VALUES (35, 'Messier 87 Moon Alpha', 1400000, 46, 'L');
INSERT INTO public.moon VALUES (36, 'Messier 87 Moon Beta', 1600000, 46, 'L');
INSERT INTO public.moon VALUES (37, 'Messier 87 Frozen Moon 1', 1800000, 47, 'S');
INSERT INTO public.moon VALUES (38, 'Messier 87 Frozen Moon 2', 2200000, 47, 'M');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (37, 'Earth', true, 1, 1);
INSERT INTO public.planet VALUES (38, 'Mars', false, 1, 1);
INSERT INTO public.planet VALUES (39, 'Proxima b', true, 4, 2);
INSERT INTO public.planet VALUES (40, 'Proxima c', false, 2, 2);
INSERT INTO public.planet VALUES (41, 'Triangulum Prime', false, 2, 3);
INSERT INTO public.planet VALUES (42, 'Whirlpool Alpha I', false, 5, 4);
INSERT INTO public.planet VALUES (43, 'Whirlpool Beta II', false, 3, 4);
INSERT INTO public.planet VALUES (44, 'Sombrero Ice Planet', false, 3, 5);
INSERT INTO public.planet VALUES (45, 'Sombrero New World', true, 6, 5);
INSERT INTO public.planet VALUES (46, 'Messier 87 New World', true, 6, 6);
INSERT INTO public.planet VALUES (47, 'Messier 87 Frozen Planet', false, 3, 6);
INSERT INTO public.planet VALUES (48, 'Andromeda Distant Giant', false, 2, 2);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, true, 'A terrestrial planet with water, atmosphere, and conditions suitable for life.', 'Terrestrial', NULL);
INSERT INTO public.planet_types VALUES (2, false, 'A gas giant primarily composed of hydrogen and helium, with no solid surface.', 'Gas Giant', NULL);
INSERT INTO public.planet_types VALUES (3, false, 'A frozen planet with ice covering most of its surface, unsuitable for life.', 'Ice Giant', NULL);
INSERT INTO public.planet_types VALUES (4, true, 'A planet with a thick atmosphere that could support life, depending on conditions.', 'Super-Earth', NULL);
INSERT INTO public.planet_types VALUES (5, false, 'A small, rocky planet with no atmosphere or liquid water.', 'Dwarf Planet', NULL);
INSERT INTO public.planet_types VALUES (6, true, 'An Earth-like planet with conditions that may support life in certain areas.', 'Habitable Zone Planet', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.000000, 1, 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.246000, 2, 4500);
INSERT INTO public.star VALUES (3, 'Triangulum Star 1', 3000000.000000, 3, 5000);
INSERT INTO public.star VALUES (4, 'Whirlpool Star Alpha', 23000000.000000, 4, 6000);
INSERT INTO public.star VALUES (5, 'Sombrero Star Delta', 29000000.000000, 5, 6500);
INSERT INTO public.star VALUES (6, 'Messier 87 Star Beta', 53000000.000000, 6, 7000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 48, true);


--
-- Name: planet_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: planet_types unique_planet_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique_planet_type_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_type FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

