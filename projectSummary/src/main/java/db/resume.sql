--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-10-13 01:46:11

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

--
-- TOC entry 2869 (class 1262 OID 16393)
-- Name: resume; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE resume WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE resume OWNER TO postgres;

\connect resume

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
-- TOC entry 204 (class 1259 OID 19170)
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    contact_id bigint NOT NULL,
    name character varying(255),
    user_id bigint
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 19168)
-- Name: contacts_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_contact_id_seq OWNER TO postgres;

--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 203
-- Name: contacts_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_contact_id_seq OWNED BY public.contacts.contact_id;


--
-- TOC entry 202 (class 1259 OID 18363)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 19178)
-- Name: summary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.summary (
    summary_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.summary OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 19176)
-- Name: summary_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.summary_summary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.summary_summary_id_seq OWNER TO postgres;

--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 205
-- Name: summary_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.summary_summary_id_seq OWNED BY public.summary.summary_id;


--
-- TOC entry 207 (class 1259 OID 19184)
-- Name: summary_technology; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.summary_technology (
    technology_id bigint NOT NULL,
    summary_id bigint NOT NULL
);


ALTER TABLE public.summary_technology OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 19189)
-- Name: technology; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.technology (
    technology_id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.technology OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 19187)
-- Name: technology_technology_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.technology_technology_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.technology_technology_id_seq OWNER TO postgres;

--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 208
-- Name: technology_technology_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.technology_technology_id_seq OWNED BY public.technology.technology_id;


--
-- TOC entry 211 (class 1259 OID 19197)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    data character varying(255),
    lastname character varying(255),
    name character varying(255),
    sex character varying(255),
    surname character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 19195)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 2712 (class 2604 OID 19173)
-- Name: contacts contact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN contact_id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);


--
-- TOC entry 2713 (class 2604 OID 19181)
-- Name: summary summary_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.summary ALTER COLUMN summary_id SET DEFAULT nextval('public.summary_summary_id_seq'::regclass);


--
-- TOC entry 2714 (class 2604 OID 19192)
-- Name: technology technology_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technology ALTER COLUMN technology_id SET DEFAULT nextval('public.technology_technology_id_seq'::regclass);


--
-- TOC entry 2715 (class 2604 OID 19200)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 2856 (class 0 OID 19170)
-- Dependencies: 204
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contacts (contact_id, name, user_id) VALUES (1, '+375(29)123-45-67', 1);
INSERT INTO public.contacts (contact_id, name, user_id) VALUES (2, 'http:/github.com/petya', 1);
INSERT INTO public.contacts (contact_id, name, user_id) VALUES (3, 'petrovich@gmail.com', 1);
INSERT INTO public.contacts (contact_id, name, user_id) VALUES (4, '+375(29)87-65-43', 2);
INSERT INTO public.contacts (contact_id, name, user_id) VALUES (5, 'http:/github.com/vanya', 2);
INSERT INTO public.contacts (contact_id, name, user_id) VALUES (6, 'skype:ivanko', 2);
INSERT INTO public.contacts (contact_id, name, user_id) VALUES (7, '+375(29)999-99-99', 3);
INSERT INTO public.contacts (contact_id, name, user_id) VALUES (8, 'https:/www.linkedin.com/in/mariya/', 3);


--
-- TOC entry 2858 (class 0 OID 19178)
-- Dependencies: 206
-- Data for Name: summary; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.summary (summary_id, user_id) VALUES (1, 1);
INSERT INTO public.summary (summary_id, user_id) VALUES (2, 2);
INSERT INTO public.summary (summary_id, user_id) VALUES (3, 3);


--
-- TOC entry 2859 (class 0 OID 19184)
-- Dependencies: 207
-- Data for Name: summary_technology; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.summary_technology (technology_id, summary_id) VALUES (1, 1);
INSERT INTO public.summary_technology (technology_id, summary_id) VALUES (2, 1);
INSERT INTO public.summary_technology (technology_id, summary_id) VALUES (3, 1);
INSERT INTO public.summary_technology (technology_id, summary_id) VALUES (1, 2);
INSERT INTO public.summary_technology (technology_id, summary_id) VALUES (4, 2);
INSERT INTO public.summary_technology (technology_id, summary_id) VALUES (5, 2);
INSERT INTO public.summary_technology (technology_id, summary_id) VALUES (6, 3);
INSERT INTO public.summary_technology (technology_id, summary_id) VALUES (7, 3);
INSERT INTO public.summary_technology (technology_id, summary_id) VALUES (8, 3);


--
-- TOC entry 2861 (class 0 OID 19189)
-- Dependencies: 209
-- Data for Name: technology; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.technology (technology_id, name) VALUES (1, 'Git');
INSERT INTO public.technology (technology_id, name) VALUES (2, 'Spring Boot');
INSERT INTO public.technology (technology_id, name) VALUES (3, 'HTML');
INSERT INTO public.technology (technology_id, name) VALUES (4, 'JavaEE');
INSERT INTO public.technology (technology_id, name) VALUES (5, 'Java Core');
INSERT INTO public.technology (technology_id, name) VALUES (6, 'Maven');
INSERT INTO public.technology (technology_id, name) VALUES (7, 'REST');
INSERT INTO public.technology (technology_id, name) VALUES (8, 'Spring');


--
-- TOC entry 2863 (class 0 OID 19197)
-- Dependencies: 211
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (user_id, data, lastname, name, sex, surname) VALUES (1, '12.12.1986', 'Петрович', 'Петр', 'мужчина', 'Петров');
INSERT INTO public.users (user_id, data, lastname, name, sex, surname) VALUES (2, '4.4.1997', 'Иванович', 'Иван', 'мужчина', 'Иванов');
INSERT INTO public.users (user_id, data, lastname, name, sex, surname) VALUES (3, '07.11.1999', 'Васильевна', 'Мария', 'женщина', 'Морская');


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 203
-- Name: contacts_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_contact_id_seq', 8, true);


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 202
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 205
-- Name: summary_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.summary_summary_id_seq', 4, true);


--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 208
-- Name: technology_technology_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.technology_technology_id_seq', 8, true);


--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- TOC entry 2717 (class 2606 OID 19175)
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (contact_id);


--
-- TOC entry 2719 (class 2606 OID 19183)
-- Name: summary summary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.summary
    ADD CONSTRAINT summary_pkey PRIMARY KEY (summary_id);


--
-- TOC entry 2721 (class 2606 OID 19194)
-- Name: technology technology_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technology
    ADD CONSTRAINT technology_pkey PRIMARY KEY (technology_id);


--
-- TOC entry 2723 (class 2606 OID 19205)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2727 (class 2606 OID 19221)
-- Name: summary_technology fk6tgvcurp13onccj1nrbetpr62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.summary_technology
    ADD CONSTRAINT fk6tgvcurp13onccj1nrbetpr62 FOREIGN KEY (technology_id) REFERENCES public.technology(technology_id);


--
-- TOC entry 2725 (class 2606 OID 19211)
-- Name: summary fki6a4c02womv1p7yuq2thw6q4y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.summary
    ADD CONSTRAINT fki6a4c02womv1p7yuq2thw6q4y FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 2724 (class 2606 OID 19206)
-- Name: contacts fkna8bddygr3l3kq1imghgcskt8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT fkna8bddygr3l3kq1imghgcskt8 FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 2726 (class 2606 OID 19216)
-- Name: summary_technology fkt5gjmytcydarihv02baonfo3u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.summary_technology
    ADD CONSTRAINT fkt5gjmytcydarihv02baonfo3u FOREIGN KEY (summary_id) REFERENCES public.summary(summary_id);


-- Completed on 2020-10-13 01:46:11

--
-- PostgreSQL database dump complete
--

