--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-31 09:55:07

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

DROP DATABASE "family-chores";
--
-- TOC entry 2892 (class 1262 OID 32807)
-- Name: family-chores; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "family-chores" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE "family-chores" OWNER TO postgres;

\connect -reuse-previous=on "dbname='family-chores'"

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
-- TOC entry 658 (class 1247 OID 32856)
-- Name: choreType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."choreType" AS ENUM (
    'onetime',
    'recurring'
);


ALTER TYPE public."choreType" OWNER TO postgres;

--
-- TOC entry 651 (class 1247 OID 32845)
-- Name: memberType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."memberType" AS ENUM (
    'parent',
    'child'
);


ALTER TYPE public."memberType" OWNER TO postgres;

--
-- TOC entry 662 (class 1247 OID 32870)
-- Name: rewardType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."rewardType" AS ENUM (
    'monetary',
    'points'
);


ALTER TYPE public."rewardType" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 213 (class 1259 OID 32877)
-- Name: assignedFamilyChore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."assignedFamilyChore" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "familyChoreId" integer NOT NULL
);


ALTER TABLE public."assignedFamilyChore" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 32875)
-- Name: assignedFamilyChore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."assignedFamilyChore_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."assignedFamilyChore_id_seq" OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 212
-- Name: assignedFamilyChore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."assignedFamilyChore_id_seq" OWNED BY public."assignedFamilyChore".id;


--
-- TOC entry 208 (class 1259 OID 32830)
-- Name: chore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chore (
    id integer NOT NULL,
    title character varying(1000) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.chore OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 32828)
-- Name: chore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chore_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chore_id_seq OWNER TO postgres;

--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 207
-- Name: chore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chore_id_seq OWNED BY public.chore.id;


--
-- TOC entry 203 (class 1259 OID 32810)
-- Name: family; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.family OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 32852)
-- Name: familyChore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."familyChore" (
    id integer NOT NULL,
    "choreId" integer NOT NULL,
    type public."choreType" NOT NULL,
    "rewardType" public."rewardType" NOT NULL,
    "rewardAmount" double precision NOT NULL
);


ALTER TABLE public."familyChore" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 32861)
-- Name: familyChore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."familyChore_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."familyChore_id_seq" OWNER TO postgres;

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 211
-- Name: familyChore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."familyChore_id_seq" OWNED BY public."familyChore".id;


--
-- TOC entry 206 (class 1259 OID 32825)
-- Name: familyMember; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."familyMember" (
    family integer NOT NULL,
    "user" integer NOT NULL,
    id integer NOT NULL,
    type public."memberType" NOT NULL
);


ALTER TABLE public."familyMember" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 32836)
-- Name: familyMember_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."familyMember_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."familyMember_id_seq" OWNER TO postgres;

--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 209
-- Name: familyMember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."familyMember_id_seq" OWNED BY public."familyMember".id;


--
-- TOC entry 202 (class 1259 OID 32808)
-- Name: family_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.family_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.family_id_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 202
-- Name: family_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.family_id_seq OWNED BY public.family.id;


--
-- TOC entry 214 (class 1259 OID 32883)
-- Name: openFamilyChore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."openFamilyChore" (
    id integer NOT NULL,
    "familyChore" integer
);


ALTER TABLE public."openFamilyChore" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32886)
-- Name: openFamilyChore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."openFamilyChore_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."openFamilyChore_id_seq" OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 215
-- Name: openFamilyChore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."openFamilyChore_id_seq" OWNED BY public."openFamilyChore".id;


--
-- TOC entry 205 (class 1259 OID 32816)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    email character varying(254),
    password character varying(1000),
    salt character varying(4000)
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 32814)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 2739 (class 2604 OID 32880)
-- Name: assignedFamilyChore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assignedFamilyChore" ALTER COLUMN id SET DEFAULT nextval('public."assignedFamilyChore_id_seq"'::regclass);


--
-- TOC entry 2737 (class 2604 OID 32833)
-- Name: chore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chore ALTER COLUMN id SET DEFAULT nextval('public.chore_id_seq'::regclass);


--
-- TOC entry 2734 (class 2604 OID 32813)
-- Name: family id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family ALTER COLUMN id SET DEFAULT nextval('public.family_id_seq'::regclass);


--
-- TOC entry 2738 (class 2604 OID 32863)
-- Name: familyChore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."familyChore" ALTER COLUMN id SET DEFAULT nextval('public."familyChore_id_seq"'::regclass);


--
-- TOC entry 2736 (class 2604 OID 32838)
-- Name: familyMember id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."familyMember" ALTER COLUMN id SET DEFAULT nextval('public."familyMember_id_seq"'::regclass);


--
-- TOC entry 2740 (class 2604 OID 32888)
-- Name: openFamilyChore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."openFamilyChore" ALTER COLUMN id SET DEFAULT nextval('public."openFamilyChore_id_seq"'::regclass);


--
-- TOC entry 2735 (class 2604 OID 32819)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 2752 (class 2606 OID 32882)
-- Name: assignedFamilyChore assignedFamilyChore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assignedFamilyChore"
    ADD CONSTRAINT "assignedFamilyChore_pkey" PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 32835)
-- Name: chore chore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chore
    ADD CONSTRAINT chore_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 32868)
-- Name: familyChore familyChore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."familyChore"
    ADD CONSTRAINT "familyChore_pkey" PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 32843)
-- Name: familyMember familyMember_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."familyMember"
    ADD CONSTRAINT "familyMember_pkey" PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32900)
-- Name: family family_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32893)
-- Name: openFamilyChore openFamilyChore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."openFamilyChore"
    ADD CONSTRAINT "openFamilyChore_pkey" PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 32824)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 32894)
-- Name: familyChore chore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."familyChore"
    ADD CONSTRAINT chore_fkey FOREIGN KEY ("choreId") REFERENCES public.chore(id) NOT VALID;


--
-- TOC entry 2759 (class 2606 OID 32926)
-- Name: assignedFamilyChore familyChore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assignedFamilyChore"
    ADD CONSTRAINT "familyChore_fkey" FOREIGN KEY ("familyChoreId") REFERENCES public."familyChore"(id) NOT VALID;


--
-- TOC entry 2760 (class 2606 OID 32931)
-- Name: openFamilyChore familyChore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."openFamilyChore"
    ADD CONSTRAINT "familyChore_fkey" FOREIGN KEY ("familyChore") REFERENCES public.family(id) NOT VALID;


--
-- TOC entry 2755 (class 2606 OID 32901)
-- Name: familyMember family_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."familyMember"
    ADD CONSTRAINT family_fkey FOREIGN KEY (family) REFERENCES public.family(id) NOT VALID;


--
-- TOC entry 2756 (class 2606 OID 32906)
-- Name: familyMember user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."familyMember"
    ADD CONSTRAINT user_fkey FOREIGN KEY ("user") REFERENCES public."user"(id) NOT VALID;


--
-- TOC entry 2758 (class 2606 OID 32921)
-- Name: assignedFamilyChore user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assignedFamilyChore"
    ADD CONSTRAINT user_fkey FOREIGN KEY ("userId") REFERENCES public."user"(id) NOT VALID;


-- Completed on 2019-12-31 09:55:08

--
-- PostgreSQL database dump complete
--

