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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (5, 'Jimbo', 2, 4);
INSERT INTO public.users VALUES (15, 'user_1652302038696', 2, 792);
INSERT INTO public.users VALUES (27, 'user_1652302542481', 2, 419);
INSERT INTO public.users VALUES (14, 'user_1652302038697', 5, 360);
INSERT INTO public.users VALUES (26, 'user_1652302542482', 5, 75);
INSERT INTO public.users VALUES (1, 'Jim', 24, 8);
INSERT INTO public.users VALUES (8, 'tim', 1, 1);
INSERT INTO public.users VALUES (2, 'Dan', 2, 0);
INSERT INTO public.users VALUES (17, 'user_1652302062848', 2, 287);
INSERT INTO public.users VALUES (16, 'user_1652302062849', 5, 188);
INSERT INTO public.users VALUES (4, 'user_1652301397059', 2, 133);
INSERT INTO public.users VALUES (18, '', 0, 999);
INSERT INTO public.users VALUES (3, 'user_1652301397060', 5, 413);
INSERT INTO public.users VALUES (29, 'user_1652302660842', 2, 237);
INSERT INTO public.users VALUES (20, 'user_1652302186685', 2, 123);
INSERT INTO public.users VALUES (7, 'user_1652301584024', 2, 590);
INSERT INTO public.users VALUES (28, 'user_1652302660843', 5, 274);
INSERT INTO public.users VALUES (6, 'user_1652301584025', 5, 73);
INSERT INTO public.users VALUES (9, 'Timbo', 0, 999);
INSERT INTO public.users VALUES (19, 'user_1652302186686', 5, 50);
INSERT INTO public.users VALUES (10, 'jim', 1, 5);
INSERT INTO public.users VALUES (21, 'billyybob', 0, 999);
INSERT INTO public.users VALUES (11, 'jimbo', 0, 999);
INSERT INTO public.users VALUES (13, 'user_1652301798415', 2, 240);
INSERT INTO public.users VALUES (12, 'user_1652301798416', 5, 72);
INSERT INTO public.users VALUES (23, 'user_1652302296886', 2, 712);
INSERT INTO public.users VALUES (22, 'user_1652302296887', 5, 132);
INSERT INTO public.users VALUES (25, 'user_1652302336401', 2, 547);
INSERT INTO public.users VALUES (24, 'user_1652302336402', 5, 231);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 29, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--