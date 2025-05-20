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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    star_id integer NOT NULL,
    discovered_by character varying(50) DEFAULT 'Unknown'::character varying NOT NULL
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    is_spiral boolean NOT NULL,
    discovered_by character varying(50) DEFAULT 'Unknown'::character varying NOT NULL
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
    description text NOT NULL,
    planet_id integer NOT NULL,
    discovered_by character varying(50) DEFAULT 'Unknown'::character varying NOT NULL
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
    description text NOT NULL,
    distance_from_its_sun_in_km numeric(5,1),
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    number_of_moons integer,
    discovered_by character varying(50) DEFAULT 'Unknown'::character varying NOT NULL
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
    description text NOT NULL,
    galaxy_id integer NOT NULL,
    number_of_planets integer,
    discovered_by character varying(50) DEFAULT 'Unknown'::character varying NOT NULL
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Eris', 'A doua cea mai masivă planetă pitică cunoscută din Sistemul Solar. Se află în centura Kuiper și are o orbită excentrică.', 1, 'Unknown');
INSERT INTO public.dwarf_planet VALUES (2, 'Haumea', 'Planetă pitică cu formă eliptică, situată în centura Kuiper. Cunoscută pentru rotația sa extrem de rapidă.', 1, 'Unknown');
INSERT INTO public.dwarf_planet VALUES (3, 'Pluto', 'Fostă a noua planetă a Sistemului Solar, acum clasificată ca planetă pitică. Are o orbită excentrică și 5 luni cunoscute.', 1, 'Unknown');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A huge collection of stars, dust and gas', true, 'Unknown');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now.', true, 'Unknown');
INSERT INTO public.galaxy VALUES (3, 'Hercules A', 'Hercules A is a bright astronomical radio source in the constellation Hercules corresponding to the galaxy 3C 348.', false, 'Unknown');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'A member of the Local Group, Triangulum is the third-largest galaxy in the group and a spiral galaxy like the Milky Way.', true, 'Unknown');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Famous for its bright nucleus and large central bulge, resembling a sombrero hat. It is a spiral galaxy in Virgo.', true, 'Unknown');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy in the Virgo Cluster, known for its massive black hole at the center, captured in the first black hole image.', false, 'Unknown');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', 'A spherical rocky body', 1, 'Unknown');
INSERT INTO public.moon VALUES (2, 'Io', 'Cea mai activă vulcanic lună din Sistemul Solar.', 3, 'Unknown');
INSERT INTO public.moon VALUES (3, 'Europa', 'Se crede că are un ocean sub calota de gheață, posibil locuibil.', 3, 'Unknown');
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Cea mai mare lună din Sistemul Solar, mai mare decât Mercur.', 3, 'Unknown');
INSERT INTO public.moon VALUES (5, 'Callisto', 'Suprafață presărată cu cratere, foarte veche.', 3, 'Unknown');
INSERT INTO public.moon VALUES (6, 'Amalthea', 'Lună mică și neregulată a lui Jupiter.', 3, 'Unknown');
INSERT INTO public.moon VALUES (7, 'Phobos', 'Lună mică și apropiată, cu orbită descendentă.', 2, 'Unknown');
INSERT INTO public.moon VALUES (8, 'Deimos', 'Lună mai mică și mai îndepărtată decât Phobos.', 2, 'Unknown');
INSERT INTO public.moon VALUES (9, 'Luna', 'Singura lună naturală a Pământului, importantă pentru maree și cultură.', 1, 'Unknown');
INSERT INTO public.moon VALUES (10, 'K186f-A1', 'Lună ipotetică a exoplanetei Kepler-186f.', 4, 'Unknown');
INSERT INTO public.moon VALUES (11, 'K186f-A2', 'Altă lună teoretică, modelată în simulări.', 4, 'Unknown');
INSERT INTO public.moon VALUES (12, 'M31-Moon1', 'Lună teoretică a planetei M31-Alpha.', 9, 'Unknown');
INSERT INTO public.moon VALUES (13, 'M31-Moon2', 'Parteneră în orbită a lui M31-Moon1.', 9, 'Unknown');
INSERT INTO public.moon VALUES (14, 'M31-Moon3', 'Satelit mic, stabil.', 9, 'Unknown');
INSERT INTO public.moon VALUES (15, 'M31-Ringlet', 'Obiect care ar putea fi considerat o lună sau parte dintr-un inel.', 11, 'Unknown');
INSERT INTO public.moon VALUES (16, 'M31-G1', 'Lună externă a gigantului gazos din Andromeda.', 11, 'Unknown');
INSERT INTO public.moon VALUES (17, 'K186e-B1', 'Lună ipotetică a lui Kepler-186e.', 8, 'Unknown');
INSERT INTO public.moon VALUES (18, 'K186d-M1', 'Satelit mic cu orbită excentrică.', 7, 'Unknown');
INSERT INTO public.moon VALUES (19, 'ExoMoon-X', 'Lună propusă în studiile de spectroscopie.', 5, 'Unknown');
INSERT INTO public.moon VALUES (20, 'Dusty', 'Lună formată recent din material de impact.', 6, 'Unknown');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 'Singura planetă cunoscută care susține viața. Are apă lichidă și o atmosferă echilibrată.', 149.6, 1, true, 1, 'Unknown');
INSERT INTO public.planet VALUES (3, 'Mars', 'Planetă terestră cu o atmosferă subțire, posibilă destinație pentru colonizare umană.', 227.9, 1, false, 2, 'Unknown');
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Cea mai mare planetă din Sistemul Solar, un gigant gazos cu peste 70 de luni.', 778.3, 1, false, 79, 'Unknown');
INSERT INTO public.planet VALUES (5, 'Kepler-186f', 'Exoplanetă de mărimea Pământului situată în zona locuibilă a stelei Kepler-186.', 112.5, 2, false, 0, 'Unknown');
INSERT INTO public.planet VALUES (6, 'Kepler-186b', 'A doua planetă cunoscută din sistemul Kepler-186. Probabil prea aproape de stea pentru viață.', 20.1, 2, false, 0, 'Unknown');
INSERT INTO public.planet VALUES (7, 'Kepler-186c', 'Se presupune că are o atmosferă subțire. Detalii limitate despre compoziție.', 34.5, 2, false, 0, 'Unknown');
INSERT INTO public.planet VALUES (8, 'Kepler-186d', 'Mai rece decât Kepler-186f, dar aflată în zona interesantă a sistemului.', 60.0, 2, false, 0, 'Unknown');
INSERT INTO public.planet VALUES (9, 'Kepler-186e', 'O planetă intermediară în sistem, posibilă atmosferă densă.', 85.0, 2, false, 0, 'Unknown');
INSERT INTO public.planet VALUES (10, 'M31-Alpha', 'Ipotetică planetă din Andromeda, observabilă doar prin simulări gravitaționale.', 300.0, 3, false, 1, 'Unknown');
INSERT INTO public.planet VALUES (11, 'M31-Beta', 'O planetă potențial telurică în orbită largă, greu de detectat.', 410.5, 3, false, 0, 'Unknown');
INSERT INTO public.planet VALUES (12, 'M31-GasPrime', 'Gigant gazos estimat în galaxia Andromeda. Posibil inel de luni.', 590.2, 3, false, 5, 'Unknown');
INSERT INTO public.planet VALUES (1, 'Counter Earth', 'A rocky terrestrial planet', 149.0, 1, true, 1, 'Unknown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'A yellow dwarf star', 1, 8, 'Unknown');
INSERT INTO public.star VALUES (2, 'Kepler-186', 'Stea de tip M, situată la aproximativ 500 de ani-lumină distanță în constelația Cygnus. A devenit celebră datorită exoplanetei Kepler-186f, prima planetă de mărimea Pământului găsită în zona locuibilă a unei alte stele.', 1, 5, 'Unknown');
INSERT INTO public.star VALUES (3, 'J00443799+4129236', 'Stea masivă de tip B, localizată în Andromeda, vizibilă în observații cu telescoape de mare putere. Este una dintre cele mai strălucitoare stele individuale identificate în galaxia Andromeda.', 2, 0, 'Unknown');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Cea mai apropiată stea de Soare, parte a sistemului Alpha Centauri. Stea pitică roșie cu potențial de exoplanete.', 1, NULL, 'Unknown');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Supergigantă roșie din constelația Orion, aproape de sfârșitul vieții sale. Extrem de luminoasă și instabilă.', 1, NULL, 'Unknown');
INSERT INTO public.star VALUES (6, 'M31-V1', 'Stea variabilă cefeidă din Andromeda, folosită istoric pentru a măsura distanțele galactice.', 2, NULL, 'Unknown');


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: dwarf_planet unique_dwarf_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT unique_dwarf_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

