--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE curso_computacao;
ALTER ROLE curso_computacao WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE departamento_dcet;
ALTER ROLE departamento_dcet WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE docente;
ALTER ROLE docente WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:4C7wRRa9Bt1MFIEBR+nt+Q==$Zyyv3lbkBemJGl+rJdeX3HAqj6a6oy6OvBrOmo8Ff8Q=:wulqEvJby5xfhG6iIYFYyLFkNDljMnwcMz+aaGbUEWM=';
CREATE ROLE pro_reitoria_prograd;
ALTER ROLE pro_reitoria_prograd WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE user_computacao;
ALTER ROLE user_computacao WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:sL3WP7j/0GtwEQ9McEyK+Q==$2W0W6LX8QkUbRjBDhlW7GiY1rl0gbiyD01HafxI5NzU=:a/UKtRYR6GHq7Ly0aMzwXrSfDrOcKnxypUby7Md41Yo=';
CREATE ROLE user_dcet;
ALTER ROLE user_dcet WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Y/bkZb4LOCUF2uPtELjS+Q==$FSwBqu1DxxST8Rvx/gr1/J5ClI87aeQOLThs/IXSrEg=:0a8FcVh3epwHjilQWgDMIM2/z6ip/tAvfZIDHnMO/0I=';
CREATE ROLE user_docente;
ALTER ROLE user_docente WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:0/CrH1TNItGjxVLqQzn8gw==$3S1HVrYucaXOR/hP391rRLHlaNUGyzC3eZVvRwujSqc=:89iMoSK5w+RryKzPcPEekB3KyG0dr63BPCjJbznvAPo=';
CREATE ROLE user_prograd;
ALTER ROLE user_prograd WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:l0rgNjOgiY0hGAIjaM/d9g==$WDsZ+QuNMO2vERIaIp8A6Sy95xXfLsijxoucoqkBL+Y=:LCuYfMgor8BNgnKb1FjxYQMyaygvIhhZuI84xd6/Ciw=';

--
-- User Configurations
--


--
-- Role memberships
--

GRANT curso_computacao TO user_computacao GRANTED BY postgres;
GRANT departamento_dcet TO user_dcet GRANTED BY postgres;
GRANT docente TO user_docente GRANTED BY postgres;
GRANT pro_reitoria_prograd TO user_prograd GRANTED BY postgres;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

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
-- PostgreSQL database dump complete
--

--
-- Database "uesc" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

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
-- Name: uesc; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE uesc WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt_BR.UTF-8';


ALTER DATABASE uesc OWNER TO postgres;

\connect uesc

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
-- Name: audit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA audit;


ALTER SCHEMA audit OWNER TO postgres;

--
-- Name: func_proc_audit(); Type: FUNCTION; Schema: audit; Owner: postgres
--

CREATE FUNCTION audit.func_proc_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    declare
        table_name_audit constant text := TG_TABLE_NAME || '_audit';
    begin
        execute format(
            'create table if not exists audit.%I (
                id bigserial primary key,
                log_autor varchar(50),
                log_data DATE,
                log_operacao VARCHAR(6),
                log_query VARCHAR(500));', table_name_audit);

        if(TG_OP = 'DELETE') then
            execute format('insert into audit.%I (log_autor, log_data, log_operacao, log_query) 
            values (%L, %L, %L, %L);', table_name_audit, USER, NOW(), TG_OP, current_query());
            return OLD;
        ELSIF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') then
            execute format('insert into audit.%I (log_autor, log_data, log_operacao, log_query) 
            values (%L, %L, %L, %L);', table_name_audit, USER, NOW(), TG_OP, current_query());
            return NEW;
        END IF;
    end;
    $$;


ALTER FUNCTION audit.func_proc_audit() OWNER TO postgres;

--
-- Name: calcula_tempo_servico(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calcula_tempo_servico() RETURNS TABLE(id integer, nome character varying, dt_inicio timestamp without time zone, tempo_servico character varying)
    LANGUAGE sql
    AS $$
			   
select docente.id, docente.nome, docente.dt_inicio, cast((CURRENT_DATE - docente.dt_inicio) / 365 as integer)
	|| ' anos, ' || cast((CURRENT_DATE - docente.dt_inicio) % 365 / 30 as integer) || ' meses e ' ||  
	cast((CURRENT_DATE - docente.dt_inicio) % 365 % 30 as integer) || ' dias' as tempo_servico from docente;
$$;


ALTER FUNCTION public.calcula_tempo_servico() OWNER TO postgres;

--
-- Name: calcula_tempo_servico_2(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calcula_tempo_servico_2(integer, integer, integer) RETURNS text
    LANGUAGE plpgsql
    AS $_$

declare
	anos_i alias for $1;
	meses_i alias for $2;
	dias_i alias for $3;
	
	anos_c integer := date_part('year', now());
	meses_c integer := date_part('month', now());
	dias_c integer := date_part('day', now());
	
	anos integer := abs(anos_c - anos_i);
	meses integer := abs(meses_c - meses_i);
	dias integer := abs(dias_c - dias_i);
	total_dias integer := (anos * 365) + (meses * 30) + dias;
begin
	return cast(total_dias / 365 as integer) || ' anos, ' || 
	cast(total_dias % 365 / 30 as integer) || ' meses e ' || 
	cast(total_dias % 365 % 30 as integer) || ' dias'; 
end;
$_$;


ALTER FUNCTION public.calcula_tempo_servico_2(integer, integer, integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area (
    id integer NOT NULL,
    area character varying(100) NOT NULL,
    id_departamento integer
);


ALTER TABLE public.area OWNER TO postgres;

--
-- Name: area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_id_seq OWNER TO postgres;

--
-- Name: area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.area_id_seq OWNED BY public.area.id;


--
-- Name: cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cargo (
    id integer NOT NULL,
    cargo character varying(50)
);


ALTER TABLE public.cargo OWNER TO postgres;

--
-- Name: cargo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cargo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cargo_id_seq OWNER TO postgres;

--
-- Name: cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cargo_id_seq OWNED BY public.cargo.id;


--
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    id integer NOT NULL,
    curso character varying(50) NOT NULL,
    id_formacao integer
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- Name: curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curso_id_seq OWNER TO postgres;

--
-- Name: curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curso_id_seq OWNED BY public.curso.id;


--
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamento (
    id integer NOT NULL,
    sigla character varying(10) NOT NULL,
    nome character varying(200) NOT NULL
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- Name: departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamento_id_seq OWNER TO postgres;

--
-- Name: departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamento_id_seq OWNED BY public.departamento.id;


--
-- Name: disciplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplina (
    id integer NOT NULL,
    cod character varying(20),
    disciplina character varying(150) NOT NULL,
    ch numeric(4,0) NOT NULL,
    id_area integer
);


ALTER TABLE public.disciplina OWNER TO postgres;

--
-- Name: disciplina_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disciplina_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disciplina_id_seq OWNER TO postgres;

--
-- Name: disciplina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disciplina_id_seq OWNED BY public.disciplina.id;


--
-- Name: doc_indicado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doc_indicado (
    id_turma integer,
    id_docente integer
);


ALTER TABLE public.doc_indicado OWNER TO postgres;

--
-- Name: doc_interessado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doc_interessado (
    id_turma integer,
    id_docente integer
);


ALTER TABLE public.doc_interessado OWNER TO postgres;

--
-- Name: docente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docente (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    dt_inicio date NOT NULL,
    id_cargo integer,
    id_titulo integer,
    id_area integer
);


ALTER TABLE public.docente OWNER TO postgres;

--
-- Name: docente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.docente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.docente_id_seq OWNER TO postgres;

--
-- Name: docente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.docente_id_seq OWNED BY public.docente.id;


--
-- Name: formacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formacao (
    id integer NOT NULL,
    formacao character varying(20) NOT NULL
);


ALTER TABLE public.formacao OWNER TO postgres;

--
-- Name: formacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.formacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formacao_id_seq OWNER TO postgres;

--
-- Name: formacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.formacao_id_seq OWNED BY public.formacao.id;


--
-- Name: pro_reitoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pro_reitoria (
    id integer NOT NULL,
    sigla character varying(20) NOT NULL,
    nome character varying(150) NOT NULL
);


ALTER TABLE public.pro_reitoria OWNER TO postgres;

--
-- Name: pro_reitoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pro_reitoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pro_reitoria_id_seq OWNER TO postgres;

--
-- Name: pro_reitoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pro_reitoria_id_seq OWNED BY public.pro_reitoria.id;


--
-- Name: semestre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semestre (
    id integer NOT NULL,
    semestre character varying(15) NOT NULL,
    id_pro_reitoria integer
);


ALTER TABLE public.semestre OWNER TO postgres;

--
-- Name: semestre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semestre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.semestre_id_seq OWNER TO postgres;

--
-- Name: semestre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semestre_id_seq OWNED BY public.semestre.id;


--
-- Name: tipo_aula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_aula (
    id integer NOT NULL,
    tipo_aula character varying(19) NOT NULL
);


ALTER TABLE public.tipo_aula OWNER TO postgres;

--
-- Name: tipo_aula_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_aula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_aula_id_seq OWNER TO postgres;

--
-- Name: tipo_aula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_aula_id_seq OWNED BY public.tipo_aula.id;


--
-- Name: titulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titulo (
    id integer NOT NULL,
    titulo character varying(50)
);


ALTER TABLE public.titulo OWNER TO postgres;

--
-- Name: titulo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.titulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.titulo_id_seq OWNER TO postgres;

--
-- Name: titulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.titulo_id_seq OWNED BY public.titulo.id;


--
-- Name: turma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turma (
    id integer NOT NULL,
    turma character varying(5) NOT NULL,
    id_disciplina integer,
    id_semestre integer,
    id_curso integer,
    id_tipo_aula integer
);


ALTER TABLE public.turma OWNER TO postgres;

--
-- Name: turma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.turma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.turma_id_seq OWNER TO postgres;

--
-- Name: turma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.turma_id_seq OWNED BY public.turma.id;


--
-- Name: view_alocacao_indicado; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_alocacao_indicado AS
 SELECT semestre.semestre,
    disciplina.cod,
    disciplina.disciplina,
    disciplina.ch AS carga_horaria,
    turma.turma,
    tipo_aula.tipo_aula,
    formacao.formacao,
    curso.curso AS colegiado,
    docente.nome AS docente_indicado
   FROM (((((((public.turma
     JOIN public.disciplina ON ((turma.id_disciplina = disciplina.id)))
     JOIN public.semestre ON ((semestre.id = turma.id_semestre)))
     JOIN public.curso ON ((curso.id = turma.id_curso)))
     JOIN public.formacao ON ((formacao.id = curso.id_formacao)))
     JOIN public.tipo_aula ON ((tipo_aula.id = turma.id_tipo_aula)))
     JOIN public.doc_indicado ON ((doc_indicado.id_turma = turma.id)))
     JOIN public.docente ON ((docente.id = doc_indicado.id_docente)))
  ORDER BY semestre.semestre DESC, disciplina.disciplina, turma.turma;


ALTER TABLE public.view_alocacao_indicado OWNER TO postgres;

--
-- Name: view_alocacao_interessado; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_alocacao_interessado AS
 SELECT semestre.semestre,
    disciplina.cod,
    disciplina.disciplina,
    disciplina.ch AS carga_horaria,
    turma.turma,
    tipo_aula.tipo_aula,
    formacao.formacao,
    curso.curso AS colegiado,
    docente.nome AS docente_inteview_alocacao_interessado
   FROM (((((((public.turma
     JOIN public.disciplina ON ((turma.id_disciplina = disciplina.id)))
     JOIN public.semestre ON ((semestre.id = turma.id_semestre)))
     JOIN public.curso ON ((curso.id = turma.id_curso)))
     JOIN public.formacao ON ((formacao.id = curso.id_formacao)))
     JOIN public.tipo_aula ON ((tipo_aula.id = turma.id_tipo_aula)))
     JOIN public.doc_interessado ON ((doc_interessado.id_turma = turma.id)))
     JOIN public.docente ON ((docente.id = doc_interessado.id_docente)))
  ORDER BY semestre.semestre DESC, disciplina.disciplina, turma.turma;


ALTER TABLE public.view_alocacao_interessado OWNER TO postgres;

--
-- Name: view_area_dcet; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_area_dcet AS
 SELECT area.id,
    area.area,
    area.id_departamento
   FROM public.area
  WHERE (area.id_departamento = 5);


ALTER TABLE public.view_area_dcet OWNER TO postgres;

--
-- Name: view_curso_computacao; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_curso_computacao AS
 SELECT curso.id,
    curso.curso,
    curso.id_formacao
   FROM public.curso
  WHERE (curso.id = 4);


ALTER TABLE public.view_curso_computacao OWNER TO postgres;

--
-- Name: view_departamento_dcet; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_departamento_dcet AS
 SELECT departamento.id,
    departamento.sigla,
    departamento.nome
   FROM public.departamento
  WHERE (departamento.id = 5);


ALTER TABLE public.view_departamento_dcet OWNER TO postgres;

--
-- Name: view_disciplina_dcet; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_disciplina_dcet AS
 SELECT disciplina.id,
    disciplina.cod,
    disciplina.disciplina,
    disciplina.ch,
    area.area,
    upper((departamento.sigla)::text) AS sigla
   FROM ((public.disciplina
     JOIN public.area ON ((disciplina.id_area = area.id)))
     JOIN public.departamento ON ((area.id_departamento = departamento.id)))
  WHERE ((departamento.sigla)::text = 'dcet'::text);


ALTER TABLE public.view_disciplina_dcet OWNER TO postgres;

--
-- Name: view_turma_computacao; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_turma_computacao AS
 SELECT turma.id,
    turma.turma,
    turma.id_disciplina,
    turma.id_semestre,
    turma.id_curso,
    turma.id_tipo_aula
   FROM public.turma
  WHERE (turma.id_curso = 4);


ALTER TABLE public.view_turma_computacao OWNER TO postgres;

--
-- Name: view_doc_indicado_computacao; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_doc_indicado_computacao AS
 SELECT doc_indicado.id_turma,
    doc_indicado.id_docente
   FROM public.doc_indicado
  WHERE (doc_indicado.id_turma IN ( SELECT view_turma_computacao.id
           FROM public.view_turma_computacao));


ALTER TABLE public.view_doc_indicado_computacao OWNER TO postgres;

--
-- Name: view_doc_interessado_computacao; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_doc_interessado_computacao AS
 SELECT doc_interessado.id_turma,
    doc_interessado.id_docente
   FROM public.doc_interessado
  WHERE (doc_interessado.id_turma IN ( SELECT view_turma_computacao.id
           FROM public.view_turma_computacao));


ALTER TABLE public.view_doc_interessado_computacao OWNER TO postgres;

--
-- Name: view_docente_dcet; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_docente_dcet AS
 SELECT docente.id,
    docente.nome,
    docente.dt_inicio,
    cargo.cargo,
    titulo.titulo,
    area.area,
    upper((departamento.sigla)::text) AS sigla
   FROM ((((public.docente
     JOIN public.cargo ON ((docente.id_cargo = cargo.id)))
     JOIN public.titulo ON ((docente.id_titulo = titulo.id)))
     JOIN public.area ON ((docente.id_area = area.id)))
     JOIN public.departamento ON ((area.id_departamento = departamento.id)))
  WHERE ((departamento.sigla)::text = 'dcet'::text);


ALTER TABLE public.view_docente_dcet OWNER TO postgres;

--
-- Name: view_pro_reitoria_prograd; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_pro_reitoria_prograd AS
 SELECT pro_reitoria.id,
    pro_reitoria.sigla,
    pro_reitoria.nome
   FROM public.pro_reitoria
  WHERE (pro_reitoria.id = 2);


ALTER TABLE public.view_pro_reitoria_prograd OWNER TO postgres;

--
-- Name: view_semestre_prograd; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_semestre_prograd AS
 SELECT semestre.id,
    semestre.semestre,
    semestre.id_pro_reitoria
   FROM public.semestre
  WHERE (semestre.id_pro_reitoria = 2);


ALTER TABLE public.view_semestre_prograd OWNER TO postgres;

--
-- Name: area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area ALTER COLUMN id SET DEFAULT nextval('public.area_id_seq'::regclass);


--
-- Name: cargo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo ALTER COLUMN id SET DEFAULT nextval('public.cargo_id_seq'::regclass);


--
-- Name: curso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN id SET DEFAULT nextval('public.curso_id_seq'::regclass);


--
-- Name: departamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento ALTER COLUMN id SET DEFAULT nextval('public.departamento_id_seq'::regclass);


--
-- Name: disciplina id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplina ALTER COLUMN id SET DEFAULT nextval('public.disciplina_id_seq'::regclass);


--
-- Name: docente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente ALTER COLUMN id SET DEFAULT nextval('public.docente_id_seq'::regclass);


--
-- Name: formacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formacao ALTER COLUMN id SET DEFAULT nextval('public.formacao_id_seq'::regclass);


--
-- Name: pro_reitoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pro_reitoria ALTER COLUMN id SET DEFAULT nextval('public.pro_reitoria_id_seq'::regclass);


--
-- Name: semestre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semestre ALTER COLUMN id SET DEFAULT nextval('public.semestre_id_seq'::regclass);


--
-- Name: tipo_aula id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_aula ALTER COLUMN id SET DEFAULT nextval('public.tipo_aula_id_seq'::regclass);


--
-- Name: titulo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulo ALTER COLUMN id SET DEFAULT nextval('public.titulo_id_seq'::regclass);


--
-- Name: turma id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma ALTER COLUMN id SET DEFAULT nextval('public.turma_id_seq'::regclass);


--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area (id, area, id_departamento) FROM stdin;
1	ciências básicas veterinária	1
2	ciência do desenvolvimento agrário	1
3	clínica e cirurgia em medicina veterinária	1
4	engenharia agrícola	1
5	ensino da geografia	1
6	ética e medicina veterinária preventiva	1
7	fitotecnia	1
8	análise e planejamento ambiental	1
9	recursos naturais renováveis	1
10	zootecnia	1
11	administraçâo	2
12	ciências contábeis	2
13	biofísica	3
14	biomédicas	3
15	bioquímica	3
16	botânica	3
17	ecologia	3
18	ensino de biologia	3
19	genética	3
20	imunologia	3
21	microbiologia	3
22	morfologia	3
23	oceanografia	3
24	zoologia	3
25	economia	4
26	computação	5
27	eng. civil	5
28	eng. elétrica	5
29	eng. mecânica	5
30	eng. produção	5
31	eng. química	5
32	estatística	5
33	física	5
34	matemática	5
35	química	5
36	didática	6
37	estágio e prática pedagógica	6
38	política e legislação da educação	6
39	fundamentos do cuidar em enfermagem	7
40	saúde coletiva	7
41	atenção à saúde nos ciclos do desenvolvimento humano	7
42	gestão e pesquisa em enfermagem	7
43	educação física	7
44	medicina i	7
45	medicina ii	7
46	medicina iii	7
47	medicina iv	7
48	bases biológicas	7
49	propedêuticas jurídicas	8
50	acesso à justiça e processo	8
51	relações privadas e direito	8
52	relações jurídicas de estado e sociedade	8
53	filosofia	9
54	psicologia	9
55	históriaciências sociais	9
56	metodologia do conhecimento científico	9
57	letras	10
58	línguas estrangeiras	10
59	comunicação social	10
\.


--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cargo (id, cargo) FROM stdin;
1	adjunto
2	assistente
3	auxiliar
4	auxiliar/substituto
5	pleno
6	substituto
7	titular
8	visitante
\.


--
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curso (id, curso, id_formacao) FROM stdin;
1	administração	1
2	agronomia	1
3	biomedicina	1
4	ciência da computação	1
5	ciências biológicas	1
6	ciências biológicas	2
7	ciências contábeis	1
8	ciências econômicas	1
9	ciências sociais	2
10	comunicação social	1
11	direito	1
12	economia	1
13	educação física	2
14	enfermagem	1
15	engenharia civil	1
16	engenharia de produção	1
17	engenharia elétrica	1
18	engenharia mecânica	1
19	engenharia química	1
20	filosofia	2
21	física	2
22	física	1
23	geografia	2
24	geografia	1
25	história	2
26	lea	1
27	letras	2
28	matemática	2
29	matemática	1
30	medicina	1
31	medicina veterinária	1
32	pedagogia	2
33	química	1
34	química	2
\.


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamento (id, sigla, nome) FROM stdin;
1	dcaa	departamento de ciências agrárias e ambientais
2	dcac	departamento de administração e ciências contábeis
3	dcb	departamento de ciências biológicas
4	dcec	departamento de ciências econômicas
5	dcet	departamento de ciências exatas e tecnológicas
6	dcie	departamento de ciências da educação
7	dcs	departamento de ciências da saúde
8	dcijur	departamento de ciências jurídicas
9	dfch	departamento de filosofia e ciências humanas
10	dla	departamento de letras e artes
\.


--
-- Data for Name: disciplina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplina (id, cod, disciplina, ch, id_area) FROM stdin;
1	CET154	química geral e orgânica	90	35
2	CET558	calculo aplicado a biomedicina	60	34
3	CET559	física aplicada a biomedicina	60	33
4	CIB520	bioestatistica	60	32
5	CIB517	bioinformática	60	26
6	CET791	química geral	45	35
7	CET792	física	75	33
8	CET793	matemática	30	34
9	CET794	química orgânica	45	35
10	CET006	análise química	60	35
11	CET795	desenho técnico	60	27
12	CET796	cálculo	75	34
13	CET797	elementos de estatística	60	32
14	CET076	metodologia e estatística experimental	75	32
15	CET423	fundamentos matemáticos	60	34
16	CET552	introdução a ciência dos computadores	60	26
17	CET398	matemática aplicada e financeira	60	34
18	CET392	estatistica i	60	32
19	CET399	estatistica ii	60	32
20	CET1295	estatística apllicada i	60	32
21	CET1296	estatística apllicada ii	60	32
22	CET1293	matemática aplicada i	60	34
23	CET1294	matemática aplicada ii	60	34
24	CET631	fundamentos de estatistica  - (curriculo atual)	45	32
25	CET701	quimica aplicada a analise ambiental - (curriculo atual)	60	35
26	CET702	fundamentos de estatistica - (curriculo novo  a partir de 2022)	60	32
27	CET699	estatística aplicada às ciências sociais i	60	32
28	CET700	estatística aplicada às ciências sociais ii	60	32
29	CET1200	intrudução à estatistica	60	32
30	CET561	cálculo	60	34
31	CET647	física para biologia	60	33
32	CET650	química aplicada à biologia	90	35
33	CET020	bioestatística	60	32
34	CET042	ciência dos materiais	60	29
35	CET045	termodinâmica	60	29
36	CET050	materiais metálicos	45	29
37	CET051	materiais cerâmicos	45	29
38	CET057	engenharia de saneamento ambiental	45	31
39	CET1010	petróleo, gás e biocombustíveis	45	31
40	CET1018	estágio obrigatório	180	29
41	CET1043	complementação de poços de petróleo	45	31
42	CET1044	motores de combustão	45	29
43	CET1045	materiais conjugados	45	29
44	CET1046	mecânica de precisão	45	29
45	CET1047	princípios de tribologia	45	29
46	CET1048	elementos de robótica	45	29
47	CET1049	geologia do petróleo	45	31
48	CET1050	perfilagem de poços de petróleo	45	31
49	CET1051	perfuração de poços de petróleo	45	31
50	CET1052	análise e caracterização de materiais	45	31
51	CET1053	corrosão metálica	45	31
52	CET1055	gestão da qualidade	45	30
53	CET1057	gestão do conhecimento	45	30
54	CET160	cálculo diferencial e integral i	90	34
55	CET162	cálculo diferencial e integral ii	90	34
56	CET164	física i	75	33
57	CET167	cálculo diferencial e integral iii	90	34
58	CET171	física ii	75	33
59	CET173	física ii	60	34
60	CET174	equações diferencias aplicadas i	75	33
61	CET176	física iii	75	33
62	CET178	equações diferenciais aplicadas ii	75	33
63	CET181	física iv	75	33
64	CET569	geometria analítica	75	34
65	CET581	cálculo numérico	75	34
66	CET788	física experimental i	30	33
67	CET789	química geral i	90	35
68	CET809	desenho mecânico i	75	29
69	CET810	introdução à engenharia	30	29
70	CET831	álgebra linear i	90	34
71	CET832	gestão ambiental	30	31
72	CET833	física experimental ii	30	33
73	CET835	química geral ii	60	35
74	CET836	programação i	60	26
75	CET838	física experimental iii	30	33
76	CET839	mecânica vetorial estática	60	29
77	CET840	programação ii	60	26
78	CET842	eletrotécnica geral	75	28
79	CET843	pesquisa operacional i	45	30
80	CET844	eletrônica aplicada e dispositivos de automação	75	28
81	CET851	gestão da qualidade	45	30
82	CET855	automação e controle	60	28
83	CET861	tecnologia limpa na indústria	45	31
84	CET868	refino de petróleo	45	31
85	CET870	energias alternativas	45	31
86	CET876	gestão energética industrial	45	30
87	CET943	desenho mecânico ii	60	29
88	CET944	física experimental iv	30	33
89	CET945	metodologia e projetos de experimentos	30	29
90	CET946	resistência dos materiais i	60	29
91	CET947	comportamento mecânico dos materiais	60	29
92	CET948	elementos de máquinas	60	29
93	CET950	mecânica dos fluidos	90	29
94	CET951	mecânica dos sólidos i	60	29
95	CET952	metrologia e controle da qualidade	45	29
96	CET953	dinâmica das máquinas	60	29
97	CET954	materiais de construção mecânica	30	29
98	CET955	mecânica dos sólidos ii	60	29
99	CET956	processos de conformação mecânica	75	29
100	CET957	processos de usinagem i	60	29
101	CET958	projeto assistido por computador	60	29
102	CET960	transferência de calor e massa	60	29
103	CET961	engenharia assistida por computador	45	29
104	CET962	fundição,soldagem e tratamentos térmicos	60	29
105	CET963	manufatura assistida por computador	45	29
106	CET964	máquinas térmicas e processos contínuos	75	29
107	CET965	processos de usinagem ii	60	29
108	CET966	projeto mecânico	90	29
109	CET967	máquinas hidráulicas e pneumáticas	90	29
110	CET968	mecanismos	60	29
111	CET969	planejamento e controle da produção	45	29
112	CET970	processos especiais de fabricação	45	29
113	CET971	sistemas frigoríficos	60	29
114	CET972	sistemas térmicos de potência	60	29
115	CET973	sistemas de elevação e transporte	90	29
116	CET974	sistemas de produção e gestão	60	30
117	CET975	trabalho de conclusão de curso i	45	29
118	CET977	trabalho de conclusão de curso ii	45	29
119	CET1237	química geral i	60	35
120	CET811	introdução à engenharia civil	45	27
121	CET1030	desenho técnico aplicado à engenharia civil	60	27
122	CET1238	química geral ii	60	35
123	CET1239	química geral e experimental	30	35
124	CET1031	arquitetura e urbanismo	45	27
125	CET1032	resitência de materiais i	60	27
126	CET596	mecânica dos fluídos	60	27
127	CET1033	análise estrutural i	60	27
128	CET1035	mecânica dos solos i	75	27
129	CET1036	resistência dos materiais ii	75	27
130	CET1240	materiais de construção i	60	27
131	CET1241	hidráulica	75	27
132	CET1242	instalações prediais: elétricas	60	27
133	CET1037	análise estrutural ii	75	27
134	CET1039	materiais de construção ii	75	27
135	CET1040	mecânica dos solos ii	75	27
136	CET1042	tecnologia das construções i	60	27
137	CET1243	sistemas de água, esgoto e drenagem	60	27
138	CET1244	instalações prediais: hidro-sanitárias	60	27
139	CET1041	projeto integrado i: materiais	30	27
140	CET1058	análise estrutural iii	75	27
141	CET1066	estruturas de concreto armado i	75	27
142	CET1069	sistemas de transporte	60	27
143	CET1245	análise financeira e orçamento das construções	60	27
144	CET1246	tecnologia das construções ii	60	27
145	CET1247	saneamento e tratamento de esgotos	60	27
146	CET1084	inovação e propriedade intelectual	45	30
147	CET1085	fontes fósseis e renováveis  de energia	45	31
148	CET1086	gestão ambiental	45	31
149	CET865	computação de alto desempenho	45	26
150	CET892	poluição e gestão de resíduos na construção	45	31
151	CET1072	estruturas de aço	60	27
152	CET1075	estruturas de madeira	45	27
153	CET1248	estruturas de concreto armado ii	60	27
154	CET1249	estradas e ferrovias	75	27
155	CET1250	fundações	75	27
156	CET1251	planejamento e gerenciamento de obras	60	27
157	CET1252	projeto integrado ii: águas e meio ambiente	30	27
158	CET1022	conhecimento e valoração da inovação	45	30
159	CET1090	estabilidade das estruturas	45	27
160	CET1091	estruturas pré-fabricadas de concreto armado	45	27
161	CET1099	higiene e segurança do trabalho	45	27
162	CET1102	modelagem computacional aplicada à engenharia	45	27
163	CET1103	projeto de engenharia auxiliado por computador	45	27
164	CET1260	materiais compósitos e sustentáveis	45	27
165	CET1261	introdução à dinâmica das estruturas	45	27
166	CET1070	trabalho de conclusão de curso i	45	27
167	CET1078	estrutura de concreto armado iii	60	27
168	CET1253	obras da terra	45	27
169	CET1254	projeto integrado iii: gestão e construção	30	27
170	CET1255	estágio obrigatório i	135	27
171	CET1074	introdução ao método dos elementos finitos	45	27
172	CET1087	tecnologia de construção sustentável e certificação verde	45	27
173	CET1089	detalhamento de estruturas de concreto armado	45	27
174	CET1094	projeto de portos e hidrovias	45	27
175	CET1096	projetos de edifícios de concreto armado	45	27
176	CET1098	estruturas esbeltas	45	27
177	CET1101	métodos matriciais para análise estrutural	45	27
178	CET1262	projeto de difícios de aço	45	27
179	CET1263	estruturas protendidas	45	27
180	CET1266	plataforma bim	45	27
181	CET1083	trabalho de conclusão de curso ii	45	27
182	CET1256	pavimentação	45	27
183	CET1257	pontes	60	27
184	CET1258	projeto integrado iv: estruturas e fundações	30	27
185	CET1259	estágio obrigatório ii	135	27
186	CET1095	projeto de coberturas	45	27
187	CET1100	gestão de obras de grande porte	45	27
188	CET1264	instalações prediais: gás e incêndio	45	27
189	CET583	resistência dos materiais i	60	27
190	CET858	processos de construção de edificações	60	27
191	CET812	desenho de engenharia	60	29
192	CET830	desenho técnico aplicado a ep	60	29
193	CET848	metodologia de projetos e experimentos	30	29
194	CET854	processamento de materiais metálicos	90	29
195	CET850	processos químicos de fabricação	90	31
196	CET846	fenômenos transportes i	60	31
197	CET563	introdução à engenharia de produção	30	30
198	CET834	organização do trabalho	60	30
199	CET606	gestão de sistemas de informação	60	30
200	CET847	gestão de projetos	60	30
201	CET849	pesquisa operacional ii	60	30
202	CET853	ergonomia e segurança do trabalho	45	30
203	CET604	logística	60	30
204	CET852	modelagem probabilísticas e simulação	60	30
205	CET880	planejamento e controle da produção i	90	30
206	CET600	manufatura auxiliada por computadores	60	30
207	CET856	engenharia da qualidade	60	30
208	CET881	estratégia competitiva	60	30
209	CET882	sistemas de gestão e normalização	45	30
210	CET883	planejamento e controle da produção ii	60	30
211	CET869	projeto do produto	60	30
212	CET884	engenharia de sustentabilidade	45	30
213	CET885	gestão da cadeia de suprimentos	60	30
214	CET889	gestão do conhecimento e inovação	60	30
215	CET886	planejamento e controle da produção iii	60	30
216	CET887	sistemas de produção agroindustriais	60	30
217	CET860	projetos industriais	90	30
218	CET888	gestão de operações em serviço	60	30
219	CET862	trabalho de conclusão de curso i	45	30
220	CET863	trabalho de conclusão de curso ii	45	30
221	CET864	estágio obrigatório	60	30
222	CET857	processamento de materiais cerâmicos	60	30
223	CET859	teoria das organizações	30	30
224	CET877	gestão de armazenagem	45	30
225	CET878	manufatura enxuta	45	30
226	CET891	logística reversa	45	30
227	CET597	engenharia de sistemas	45	30
228	CET808	introdução à engenharia elétrica	45	28
229	CET934	trabalho de conclusão de curso i	45	28
230	CET1215	trabalho de conclusão de curso ii	30	28
231	CET1333	desenho técnico i	60	27
232	CET1218	fenômenos de transporte i	60	31
233	CET1187	circuitos elétricos i	75	28
234	CET1188	laboratório de circuitos elétricos i	30	28
235	CET1183	química geral i	60	35
236	CET1184	química geral ii	60	35
237	CET1185	química experimental	30	35
238	CET894	materiais elétricos e magnéticos	60	28
239	CET1193	circuitos elétricos ii	105	28
240	CET1224	sistemas de controle i	90	28
241	CET1229	sistemas de controle ii	75	28
242	CET1191	conversão de energia	105	28
243	CET1216	eletromagnetismo	105	28
244	CET1189	eletrônica analógica i	105	28
245	CET1196	eletrônica analógica ii	90	28
246	CET1219	eletrônica digital	90	28
247	CET1223	sistemas embarcados e periféricos	90	28
248	CET1222	instrumentação industrial	90	28
249	CET1190	análise de sinais e sistemas	75	28
250	CET1217	eletrônica de potência	90	28
251	CET1230	acionamentos elétricos	90	28
252	CET918	máquinas elétricas	90	28
253	CET1225	máquinas síncronas	90	28
254	CET1195	laboratório de instalações elétricas prediais	30	28
255	CET1194	instalações elétricas prediais	60	28
256	CET1227	instalações elétricas industriais	90	28
257	CET1228	automação industrial	105	28
258	CET1298	transmissão de energia elétrica	105	28
259	CET1226	análise de sistemas elétricos de potência	105	28
260	CET1232	qualidade de energia elétrica	90	28
261	CET1231	proteção de sistemas elétricos de potência	90	28
262	CET1330	sistemas de geração de energia elétrica	90	28
263	CET1299	distribuição de energia elétrica	90	28
264	CET1186	projeto interdisciplinar	30	28
265	CET1198	fontes chaveadas	45	28
266	CET1199	conversores cc – ca	45	28
267	CET1202	fontes alternativas de energia elétrica	45	28
268	CET1203	projeto e instalação de sistemas fotovoltaicos	45	28
269	CET1334	tópicos especiais i	45	28
270	CET1335	tópicos especiais ii	45	28
271	CET1336	tópicos especiais iii	45	28
272	CET1337	tópicos especiais iv	45	28
273	CET1338	tópicos especiais v	45	28
274	CET1339	tópicos especiais vi	45	28
275	CET1340	tópicos especiais vii	45	28
276	CET1341	tópicos especiais viii	45	28
277	CET1342	tópicos especiais ix	45	28
278	CET1343	tópicos especiais x	45	28
279	CET1210	eficiência energética	45	28
280	CET1211	aterramentos elétricos	45	28
281	CET1212	segurança em eletricidade – nr10	45	28
282	CET1332	energia sociedade e meio-ambiente	45	28
283	CET1204	processamento digital de sinais	45	28
284	CET1205	sistemas em tempo real	45	28
285	CET1206	projeto de sistemas de automoção	45	28
286	CET1207 	redes industriais	45	28
287	CET1208	sistemas supervisórios	45	28
288	CET1209	robótica	45	28
289	CET1213	iintrodução á modelagem e identificação de sistemas	45	28
290	CET1214	introdução aos sistemas dinâmicos não lineares	45	28
291	CET935 	estágio supervisionado	180	28
292	CET786	desenho técnico i	60	27
293	CET787	introdução à engenharia química	30	31
294	CET941	físico quimica i	60	35
295	CET982	química inorgânica	90	35
296	CET984	físico quimica ii	60	35
297	CET986	química orgânica i	60	35
298	CET985	quimica analítica qualitativa	60	35
299	CET987	quimica analitica quantitativa	60	35
300	CET988	quimica orgânica ii	60	35
301	CET989	termodinâmica quimica i	60	31
302	CET991	seleção e caracterização de materiais	60	31
303	CET990	instrumentação e controle de qualidade	60	31
304	CET995	termodinâmica química ii	60	31
305	CET994	fenômenos de transporte ii	60	31
306	CET996	engenharia bioquímica	60	31
307	CET992	eletroquímica	60	31
308	CET997	águas industriais e de consumo	60	31
309	CET588	processos químicos de fabricação	60	31
310	CET993	análise instrumental	60	28
311	CET998	operações unitárias i	60	31
312	CET999	introdução a controle de processos	60	31
313	CET1001	engenharia de bioprocessos	60	31
314	CET1002	tratamento de efluentes i	60	31
315	CET1003	cinética química	60	31
316	CET1000	fenômenos de transporte iii	60	31
317	CET1004	aplicações industriais de calor	60	31
318	CET1005	operações unitárias ii	60	31
319	CET1006	controle de processos aplicado	60	31
320	CET1007	tratamento de efluentes ii	60	31
321	CET1008	calculo de reatores	60	31
322	CET1009	sistemas de gestão da produção na ind. química	60	31
323	CET1011	engenharia auxiliada por computador (cae)	60	31
324	CET1012	modelagem, simulação e otimização de processos químico	60	31
325	CET1013	planejamento e projeto integrado na ind. química	60	31
326	CET1014	petroquímica e química de fontes renováveis de energia	60	31
327	CET1015	ergonomia, higiene e engenharia de segurança	60	30
328	CET1016	trabalho de conclusão de curso i	45	31
329	CET1017	trabalho de conclusão de curso ii	45	31
330	CET056	materiais poliméricos	45	31
331	CET1019	modelagem matemática e simulação de processos químicos	45	31
332	CET1020	controle de qualidade com otimização online de processos	45	31
333	CET1021	projeto integrado adaptativo	45	31
334	CET1141	análise multicritério de processos e sistemas	45	31
335	CET871	processamento de alimentos e fermentações industriais	45	31
336	CET872	tecnologia de alimentos i	45	31
337	CET873	tecnologia de alimentos ii	45	31
338	CET1142	gestão do conhecimento e inovação	45	30
339	CET 158	geometria analítica	60	34
340	CET 160	cálculo diferencial e integral i	90	34
341	CET163	álgebra linear i	60	34
342	CET164 	física i	75	33
343	CET165	laboratório de física i	60	33
344	CET166	laboratório de computação i	75	26
345	CET169	laboratório de computação ii	75	26
346	CET170	evolução das idéias da física	60	33
347	CET172	laboratório de física ii	60	33
348	CET175	mecânica clássica	90	33
349	CET177	laboratório de física iii	60	33
350	CET179	termodinâmica	75	33
351	CET180	eletromagnetismo	75	33
352	CET182	laboratório de física iv	60	33
353	CET183	tópicos de física matemática	75	34
354	CET184	eletromagnetismo ii	75	33
355	CET185	mecânica analítica	90	33
356	CET186	física moderna	75	33
357	CET187	laboratório de física moderna	75	33
358	CET188	estrutura da matéria	60	33
359	CET189	mecânica estatística	75	33
360	CET194 	mecânica quântica i	90	33
361	CET195	trabalho de conclusão de curso i	90	33
362	CET196	física e sociedade	60	33
363	CET197	física computacional	90	33
364	CET198	trabalho de conclusão de curso ii	60	33
365	CET567	química geral	75	35
366	CET643	introdução à física	60	33
367	CET150	tratamento de água	60	23
368	CET262	introdução à astronomia e astrofísica	60	33
369	CET710	cálculo de formas e aplicações à física	60	33
370	CET199	instrumentação para o ensino de física	60	33
371	CET257	tópicos de mecânica clássica	60	33
372	CET258	introdução à física dos plasmas	60	33
373	CET260	óptica física	60	33
374	CET263	introdução à teoria dos campos	60	33
375	CET265	introdução à física médica	60	33
376	CET269	processos investigativos e emancipativos no ensino	60	33
377	CET270	física dos oceanos i	60	23
378	CET271	física dos oceanos ii	60	23
379	CET272	oceanografia física, costeira e estuarina	60	23
380	CET273	dinâmica de sistemas marinhos	60	23
381	CET274	mecânica dos meios contínuos	60	33
382	CET703	física matemática i	60	33
383	CET705	gravitação e cosmologia	60	33
384	CET707	mecânica clássica avançada	60	33
385	CET713	introdução à física molecular	60	33
386	CET259	espectroscopia atômica	60	33
387	CET261	mecânica quantica ii	60	33
388	CET264	teoria quântica de campos	60	33
389	CET266	produção de material didático	60	33
390	CET268	investigação no ensino de ciências	60	33
391	CET275	computação quântica	60	33
392	CET393	astrofísica estelar	60	33
393	CET394	astrofísica galáctica e extragaláctica	60	33
394	CET704	física nuclear	60	33
395	CET706	introdução à física das partículas e campos	60	33
396	CET708	mecânica estatística i	60	33
397	CET709	mecânica quântica iii	60	33
398	CET712	teoria de grupos aplicada à física	60	33
399	CET158	geometria analítica	60	34
400	CET267	pesquisa em ensino de física i	60	33
401	CET276	metodologia para ensino de física	60	33
402	CET277	elementos de mecânica clássica	90	33
403	CET278	estágio supervisionado em física i	90	33
404	CET279	estágio supervisionado em física ii	90	33
405	CET280	introdução ao eletromagnetismo	75	33
406	CET281	estágio supervisionado em física iii	90	33
407	CET282 	novas tecnologias para o ensino de física	60	33
408	CET283	estágio supervisionado em física iv	135	33
409	CET284 	pesquisa em ensino de física ii	60	33
410	CET194	mecânica quântica i	90	33
411	CET1104	introdução ao cálculo	90	34
412	CET1105	fundamentos de matemática i	90	34
413	CET1106	matemática experimental	90	34
414	CET1107	comunicação em matemática i	90	34
415	CET1108	fundamentos de matemática ii	90	34
416	CET1109	física experimental	60	33
417	CET1110	análse combinatória	75	34
418	CET1111	geometria analítica	90	34
419	CET1112	estruturas algébricas	60	34
420	CET1113	teoria dos números	75	34
421	CET635	linguagem de programação i	90	26
422	CET1114	análise i	90	34
423	CET1115	álgebra i	75	34
424	CET1116	álgebra linear i	75	34
425	CET1117	análise ii	90	34
426	CET1118	álgebra ii	75	34
427	CET1119	álgebra linear ii	75	34
428	CET641	linguagem de programação ii	90	26
429	CET1120	análise iii	90	34
430	CET1121	cálculo numérico i	90	34
431	CET1122	teoria das probabilidades	60	32
432	CET1123	equações diferencias ordinárias	90	34
433	CET1124	análise complexa i	90	34
434	CET1125	geometria diferencial i	90	34
435	CET1126	inferência estatística	60	32
436	CET1127	topologia geral i	90	34
437	CET1128	trabalho de conclusão de curso i	60	34
438	CET1129	comunicação em matemática ii	75	34
439	CET1130	equações diferenciais parciais i	90	34
440	CET1131	curvas algébricas	90	34
441	CET1132	trabalho de conclusão de curso ii	60	34
442	CET041	programação de computadores	75	26
443	CET159	introdução ao cálculo	75	34
444	CET285	geometria euclidiana plana	60	34
445	CET286	introdução à teoria dos números	60	34
446	CET287	lógica	45	34
447	CET157	álgebra i	60	34
448	CET161	informática aplicada ao cálculo	60	34
449	CET288	álgebra ii	60	34
450	CET289	filosofia da matemática	60	34
451	CET290	álgebra linear ii	60	34
452	CET291	geometria descritiva	60	34
453	CET292	história da matemática	60	34
454	CET293	análise matemática i	90	34
455	CET294	estatística aplicada à educação	60	32
456	CET295	contextos educacionais em educação matemática	60	34
457	CET296	didática da matemática	60	34
458	CET297	funções de uma variável complexa	60	34
459	CET298	cálculo numérico	60	34
460	CET334	desenho geométrico	60	34
461	CET333	metodologia do ensino da matemática	60	34
462	CET299	estágio supervisionado em matemática i	90	34
463	CET335	estágio supervisionado em matemática ii	90	34
464	CET336	pesquisa em ensino de matemática i	60	34
465	CET338	estágio supervisionado em matemática iii	90	34
466	CET337	pesquisa em ensino de matemática ii	60	34
467	CET339	estágio supervisionado em matemática iv	135	34
468	CET659	cálculo i	90	34
469	CET660	cálculo ii	90	34
470	CET664	cálculo iii	60	34
471	CET665	estatistica	60	32
472	CET661	física i	75	33
473	CET666	física ii	75	33
474	CET669	fisica iii	60	33
475	CET034	instrumentação e  segurança  de laboratório	60	35
476	CET698	química geral i	75	35
477	CET023	quimica geral ii	90	35
478	CET663	quimica orgânica i	60	35
479	CET668	quimica orgânica ii	90	35
480	CET672	quimica orgânica iii	90	35
481	CET676	técnicas de análise orgânica	60	35
482	CET662	química inorgânica fundamental	90	35
483	CET667	química inorgânica descritiva	120	35
484	CET671	química de coordenação	90	35
485	CET059	físico-quimica i	105	35
486	CET674	físico-química ii	120	35
487	CET142	química quântica	60	35
488	CET670	química analítica qualitativa	90	35
489	CET675	quimica analitica quantitativa	120	35
490	CET680	química instrumental	75	35
491	CET677	métodos de separação	60	35
492	CET673	bioquímica industrial	75	35
493	CET679	química industrial	75	35
494	CET682	química de alimentos	75	35
495	CET134	química ambiental	60	35
496	CET143	química verde	60	35
497	CET678	metodologia de pesquisa em química	60	35
498	CET681	projeto de pesquisa em química	60	35
499	CET683	tcc	60	35
500	CET130	história da química	60	35
501	CET022	cálculo diferencial e integral i	60	34
502	CET036	cálculo diferencial e integral ii	60	34
503	CET032	geometria analítica	60	34
504	CET025	estatística aplicada a química	45	34
505	CET054	física i para a química	75	33
506	CET027	física ii para a química	60	33
507	CET033	química geral i	90	35
508	CET037	quimica orgânica i	105	35
509	CET024	química inorgânica fundamental	105	35
510	CET038	química inorgânica descritiva	105	35
511	CET715	físico-química ii	90	35
512	CET060	quimica analitica quantitativa	105	35
513	CET126	estágio supervisionado i	90	35
514	CET129	estágio supervisionado ii	90	35
515	CET135	estágio supervisionado  iii	135	35
516	CET138	estágio supervisionado  iv	90	35
517	CET035	informática aplicada a formação	45	35
518	CET021	o professor e o ensino de química	30	35
519	CET127	metodologia e instrumentação para o ensino de química	60	35
520	CET714	metodologia de pesquisa no ensino de quimica	60	35
521	CET136	pesquisa no ensino de química	60	35
522	CET 137	pesquisa no ensino de química ii	60	35
523	CET103	administração e segurança de redes	60	26
524	CET074	álgebra abstrata	60	34
525	CET638	álgebra e geometria analítica	90	34
526	CET079	análise dos sistemas de informação	60	26
527	CET086	análise numérica	60	34
528	CET064	aquisição de conhecimento	75	26
529	CET090	banco de dados i	60	26
530	CET091	banco de dados ii	60	26
531	CET104	banco de dados orientado a objetos	60	26
532	CET632	cálculo aplicado i	75	34
533	CET639	cálculo aplicado ii	75	34
534	CET075	cálculo aplicado iii	60	34
535	CET058	compiladores	60	26
536	CET114	computação bioinspirada	60	26
537	CET080	computação gráfica	60	26
538	CET105	computação quântica	60	26
539	CET087	conceitos de linguagens de programação	60	26
540	CET062	controle de sistemas – tecnologias e dispositivos	60	26
541	CET106	dinâmica de sistemas	60	26
542	CET637	eletrônica	60	26
543	CET092	empreendedor de informática	60	26
544	CET095	engenharia de software	60	26
545	CET097	estágio supervisionado	450	26
546	CET077	estrutura de dados	60	26
547	CET633	física para ciência da computação	60	33
548	CET640	fundamentos matemáticos para computação	60	26
549	CET068	inteligência artificial	60	26
550	CET096	interface homem máquina	60	26
551	CET124	introdução à bioinformática	60	26
552	CET634	introdução à ciência da computação	60	26
553	CET123	introdução à pesquisa operacional	60	26
554	CET110	laboratório e organização de computadores	60	26
555	CET078	linguagem de programação iii	60	26
556	CET642	lógica digital i	60	26
557	CET065	lógica digital ii	60	26
558	CET636	lógica para computação	60	26
559	CET081	organização e arquitetura dos computadores	60	26
560	CET082	organização e recuperação da informação	60	26
561	CET083	probabilidade e estatística	60	32
562	CET115	processamento de imagens	60	26
563	CET107	processamento paralelo	60	26
564	CET1182	programação para aplicações web	60	26
565	CET084	projeto e análise de algoritmos	60	26
566	CET098	rede de computadores i	60	26
567	CET099	rede de computadores ii	60	26
568	CET100	sistemas distribuídos	60	26
569	CET108	sistemas especialistas	60	26
570	CET101	sistemas operacionais	60	26
571	CET088	software básico	60	26
572	CET109	tecnologia de redes à grandes distâncias	60	26
573	CET125	tecnologia e educação	60	26
574	CET102	tecnologia e sociedade	30	26
575	CET089	teoria da computação	60	26
576	CET113	tópicos avançados em algoritmos	60	26
577	CET111	tópicos avançados em computação i	60	26
578	CET112	tópicos avançados em computação ii	60	26
579	CET322	métodos quantitativos aplicados à administração i	60	34
580	CET496	métodos quantitativos aplicado à administração ii	60	34
581	CET497	métodos quantitativos aplicados à administração iii	60	34
582	CET117	introdução à estatística	60	32
583	CET498	estatística aplicada	60	32
584	CET1234	estatistica aplicada a saúde	60	32
585	CET1201	bioestatistica	75	32
\.


--
-- Data for Name: doc_indicado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doc_indicado (id_turma, id_docente) FROM stdin;
1	19
2	19
3	18
4	18
5	13
6	13
7	21
8	21
9	11
10	11
11	3
12	3
13	13
14	13
15	4
16	4
17	19
18	19
19	6
20	6
21	25
22	25
23	5
24	5
25	3
26	3
27	11
28	11
29	19
30	19
31	17
32	17
33	17
34	17
35	19
36	19
37	9
38	9
39	15
40	15
41	10
42	10
43	14
44	14
45	13
46	13
47	22
48	22
49	27
50	27
51	18
52	18
53	16
54	16
55	12
56	12
57	26
58	26
59	12
60	12
61	27
62	27
63	22
64	22
65	5
66	5
67	26
68	26
69	16
70	16
71	13
72	13
73	12
74	12
75	9
76	9
77	27
78	27
79	25
80	25
81	19
82	19
83	23
84	23
85	18
86	18
87	3
88	3
89	21
90	21
91	13
92	13
93	26
94	26
95	18
96	18
97	8
98	8
99	6
100	6
101	20
102	20
103	14
104	14
105	11
106	11
107	7
108	7
109	20
110	20
111	4
112	4
113	27
114	27
115	19
116	19
117	18
118	18
119	13
120	13
121	21
122	21
123	11
124	11
125	3
126	3
127	13
128	13
129	4
130	4
131	19
132	19
133	6
134	6
135	25
136	25
137	5
138	5
139	3
140	3
141	11
142	11
143	19
144	19
145	17
146	17
147	17
148	17
149	19
150	19
151	9
152	9
153	15
154	15
155	10
156	10
157	14
158	14
159	13
160	13
161	22
162	22
163	27
164	27
165	18
166	18
167	16
168	16
169	12
170	12
171	26
172	26
173	12
174	12
175	27
176	27
177	22
178	22
179	5
180	5
181	26
182	26
183	16
184	16
185	13
186	13
187	12
188	12
189	9
190	9
191	27
192	27
193	25
194	25
195	19
196	19
197	23
198	23
199	18
200	18
201	3
202	3
203	21
204	21
205	13
206	13
207	26
208	26
209	18
210	18
211	8
212	8
213	6
214	6
215	20
216	20
217	14
218	14
219	11
220	11
221	7
222	7
223	20
224	20
225	4
226	4
227	27
228	27
229	19
230	19
231	18
232	18
233	13
234	13
235	21
236	21
237	11
238	11
239	3
240	3
241	13
242	13
243	4
244	4
245	19
246	19
247	6
248	6
249	25
250	25
251	5
252	5
253	3
254	3
255	11
256	11
257	19
258	19
259	17
260	17
261	17
262	17
263	19
264	19
265	9
266	9
267	15
268	15
269	10
270	10
271	14
272	14
273	13
274	13
275	22
276	22
277	27
278	27
279	18
280	18
281	16
282	16
283	12
284	12
285	26
286	26
287	12
288	12
289	27
290	27
291	22
292	22
293	5
294	5
295	26
296	26
297	16
298	16
299	13
300	13
301	12
302	12
303	9
304	9
305	27
306	27
307	25
308	25
309	19
310	19
311	23
312	23
313	18
314	18
315	3
316	3
317	21
318	21
319	13
320	13
321	26
322	26
323	18
324	18
325	8
326	8
327	6
328	6
329	20
330	20
331	14
332	14
333	11
334	11
335	7
336	7
337	20
338	20
339	4
340	4
341	27
342	27
343	19
344	19
345	18
346	18
347	13
348	13
349	21
350	21
351	11
352	11
353	3
354	3
355	13
356	13
357	4
358	4
359	19
360	19
361	6
362	6
363	25
364	25
365	5
366	5
367	3
368	3
369	11
370	11
371	19
372	19
373	17
374	17
375	17
376	17
377	19
378	19
379	9
380	9
381	15
382	15
383	10
384	10
385	14
386	14
387	13
388	13
389	22
390	22
391	27
392	27
393	18
394	18
395	16
396	16
397	12
398	12
399	26
400	26
401	12
402	12
403	27
404	27
405	22
406	22
407	5
408	5
409	26
410	26
411	16
412	16
413	13
414	13
415	12
416	12
417	9
418	9
419	27
420	27
421	25
422	25
423	19
424	19
425	23
426	23
427	18
428	18
429	3
430	3
431	21
432	21
433	13
434	13
435	26
436	26
437	18
438	18
439	8
440	8
441	6
442	6
443	20
444	20
445	14
446	14
447	11
448	11
449	7
450	7
451	20
452	20
453	4
454	4
455	27
456	27
457	19
458	19
459	18
460	18
461	13
462	13
463	21
464	21
465	11
466	11
467	3
468	3
469	13
470	13
471	4
472	4
473	19
474	19
475	6
476	6
477	25
478	25
479	5
480	5
481	3
482	3
483	11
484	11
485	19
486	19
487	17
488	17
489	17
490	17
491	19
492	19
493	9
494	9
495	15
496	15
497	10
498	10
499	14
500	14
501	13
502	13
503	22
504	22
505	27
506	27
507	18
508	18
509	16
510	16
511	12
512	12
513	26
514	26
515	12
516	12
517	27
518	27
519	22
520	22
521	5
522	5
523	26
524	26
525	16
526	16
527	13
528	13
529	12
530	12
531	9
532	9
533	27
534	27
535	25
536	25
537	19
538	19
539	23
540	23
541	18
542	18
543	3
544	3
545	21
546	21
547	13
548	13
549	26
550	26
551	18
552	18
553	8
554	8
555	6
556	6
557	20
558	20
559	14
560	14
561	11
562	11
563	7
564	7
565	20
566	20
567	4
568	4
569	27
570	27
\.


--
-- Data for Name: doc_interessado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doc_interessado (id_turma, id_docente) FROM stdin;
1	9
2	9
1	17
2	17
1	11
2	11
3	3
4	3
3	13
4	13
3	17
4	17
3	27
4	27
5	22
6	22
5	24
6	24
5	11
6	11
7	4
8	4
7	12
8	12
9	11
10	11
9	3
10	3
9	21
10	21
9	10
10	10
11	21
12	21
11	12
12	12
11	3
12	3
11	5
12	5
13	13
14	13
13	5
14	5
13	7
14	7
15	3
16	3
15	25
16	25
17	27
18	27
17	14
18	14
19	13
20	13
21	26
22	26
21	21
22	21
21	20
22	20
23	20
24	20
23	18
24	18
25	17
26	17
25	7
26	7
27	15
28	15
29	3
30	3
29	17
30	17
31	8
32	8
31	22
32	22
31	9
32	9
33	3
34	3
33	17
34	17
35	17
36	17
35	10
36	10
37	7
38	7
39	10
40	10
39	21
40	21
39	15
40	15
39	12
40	12
41	14
42	14
41	11
42	11
41	9
42	9
43	6
44	6
45	3
46	3
45	17
46	17
45	20
46	20
47	27
48	27
47	15
48	15
47	7
48	7
47	25
48	25
49	11
50	11
51	6
52	6
53	21
54	21
53	15
54	15
53	12
54	12
55	23
56	23
55	20
56	20
57	23
58	23
59	18
60	18
61	24
62	24
61	27
62	27
61	20
62	20
63	15
64	15
63	27
64	27
65	27
66	27
65	4
66	4
65	11
66	11
67	25
68	25
67	22
68	22
67	25
68	25
67	16
68	16
69	5
70	5
69	24
70	24
71	13
72	13
71	20
72	20
71	15
72	15
71	13
72	13
73	27
74	27
75	11
76	11
75	21
76	21
75	26
76	26
75	20
76	20
77	3
78	3
77	18
78	18
77	21
78	21
79	8
80	8
79	4
80	4
81	19
82	19
81	15
82	15
83	20
84	20
83	3
84	3
85	12
86	12
85	25
86	25
87	9
88	9
87	3
88	3
87	12
88	12
89	11
90	11
89	5
90	5
91	25
92	25
91	26
92	26
91	15
92	15
91	25
92	25
93	23
94	23
93	6
94	6
93	20
94	20
93	13
94	13
95	23
96	23
95	23
96	23
95	21
96	21
97	13
98	13
97	15
98	15
97	19
98	19
97	10
98	10
99	24
100	24
99	10
100	10
101	22
102	22
101	25
102	25
101	14
102	14
103	15
104	15
103	12
104	12
105	21
106	21
105	8
106	8
107	11
108	11
107	22
108	22
107	3
108	3
109	17
110	17
109	5
110	5
109	26
110	26
109	7
110	7
111	4
112	4
111	11
112	11
113	13
114	13
115	20
116	20
115	12
116	12
117	16
118	16
117	18
118	18
117	15
118	15
117	14
118	14
119	25
120	25
121	15
122	15
123	17
124	17
123	8
124	8
123	18
124	18
125	10
126	10
127	21
128	21
127	20
128	20
127	19
128	19
129	24
130	24
129	22
130	22
129	10
130	10
131	3
132	3
131	5
132	5
131	25
132	25
131	5
132	5
133	15
134	15
133	6
134	6
135	8
136	8
137	5
138	5
137	22
138	22
139	23
140	23
139	8
140	8
139	15
140	15
141	20
142	20
141	19
142	19
141	27
142	27
143	10
144	10
145	25
146	25
145	4
146	4
145	19
146	19
145	22
146	22
147	14
148	14
147	22
148	22
149	21
150	21
149	15
150	15
149	16
150	16
151	23
152	23
153	6
154	6
153	3
154	3
155	18
156	18
155	19
156	19
155	8
156	8
155	24
156	24
157	23
158	23
157	11
158	11
159	20
160	20
161	11
162	11
161	14
162	14
161	22
162	22
163	13
164	13
165	19
166	19
165	24
166	24
165	20
166	20
167	13
168	13
169	18
170	18
169	4
170	4
171	24
172	24
171	19
172	19
171	6
172	6
173	16
174	16
173	9
174	9
173	20
174	20
175	11
176	11
175	8
176	8
175	23
176	23
177	9
178	9
177	27
178	27
177	25
178	25
177	8
178	8
179	8
180	8
179	9
180	9
179	17
180	17
179	26
180	26
181	3
182	3
181	20
182	20
181	4
182	4
181	19
182	19
183	12
184	12
183	10
184	10
185	7
186	7
185	17
186	17
185	9
186	9
187	4
188	4
189	27
190	27
189	7
190	7
189	9
190	9
191	15
192	15
191	6
192	6
191	15
192	15
191	18
192	18
193	24
194	24
193	8
194	8
195	12
196	12
195	13
196	13
197	23
198	23
197	7
198	7
197	13
198	13
197	18
198	18
199	3
200	3
199	22
200	22
199	9
200	9
199	17
200	17
201	10
202	10
203	3
204	3
203	21
204	21
203	23
204	23
205	12
206	12
205	24
206	24
205	25
206	25
207	9
208	9
207	9
208	9
207	7
208	7
209	11
210	11
209	18
210	18
209	22
210	22
211	11
212	11
211	13
212	13
211	6
212	6
213	8
214	8
213	12
214	12
213	22
214	22
215	21
216	21
215	10
216	10
217	24
218	24
217	27
218	27
217	17
218	17
217	6
218	6
219	9
220	9
221	10
222	10
221	27
222	27
223	6
224	6
225	4
226	4
227	8
228	8
227	5
228	5
229	9
230	9
229	13
230	13
229	3
230	3
229	11
230	11
231	7
232	7
231	5
232	5
231	6
232	6
231	24
232	24
233	13
234	13
233	22
234	22
235	21
236	21
235	10
236	10
235	11
236	11
237	7
238	7
237	10
238	10
237	12
238	12
237	8
238	8
239	14
240	14
239	6
240	6
239	13
240	13
239	14
240	14
241	14
242	14
243	4
244	4
243	4
244	4
243	3
244	3
245	13
246	13
247	18
248	18
247	24
248	24
249	20
250	20
249	7
250	7
249	20
250	20
251	26
252	26
253	7
254	7
253	4
254	4
253	27
254	27
255	21
256	21
255	24
256	24
255	18
256	18
257	11
258	11
257	15
258	15
259	18
260	18
261	19
262	19
261	18
262	18
263	12
264	12
263	21
264	21
263	5
264	5
263	3
264	3
265	19
266	19
265	13
266	13
265	8
266	8
267	15
268	15
267	19
268	19
267	3
268	3
269	16
270	16
269	20
270	20
271	13
272	13
271	18
272	18
273	8
274	8
273	15
274	15
273	7
274	7
275	26
276	26
275	4
276	4
275	24
276	24
277	24
278	24
279	17
280	17
279	8
280	8
281	5
282	5
281	23
282	23
283	9
284	9
285	9
286	9
287	25
288	25
287	14
288	14
289	8
290	8
289	9
290	9
289	16
290	16
291	12
292	12
291	17
292	17
291	18
292	18
293	11
294	11
293	16
294	16
295	7
296	7
295	23
296	23
295	13
296	13
295	6
296	6
297	4
298	4
297	27
298	27
299	27
300	27
299	12
300	12
299	21
300	21
299	19
300	19
301	17
302	17
303	16
304	16
305	7
306	7
307	21
308	21
307	12
308	12
307	7
308	7
309	15
310	15
309	7
310	7
309	12
310	12
311	9
312	9
313	5
314	5
315	17
316	17
315	7
316	7
317	16
318	16
317	14
318	14
319	5
320	5
319	19
320	19
321	3
322	3
321	21
322	21
323	19
324	19
323	24
324	24
323	24
324	24
323	8
324	8
325	26
326	26
325	5
326	5
325	21
326	21
327	23
328	23
327	11
328	11
327	19
328	19
329	25
330	25
329	6
330	6
329	13
330	13
329	27
330	27
331	17
332	17
331	26
332	26
333	17
334	17
333	10
334	10
333	17
334	17
335	16
336	16
335	16
336	16
337	3
338	3
339	24
340	24
339	11
340	11
339	8
340	8
341	26
342	26
341	14
342	14
343	6
344	6
343	25
344	25
345	17
346	17
345	13
346	13
347	13
348	13
347	23
348	23
347	17
348	17
349	16
350	16
351	4
352	4
351	5
352	5
351	19
352	19
353	13
354	13
353	27
354	27
353	3
354	3
355	16
356	16
355	5
356	5
357	12
358	12
359	17
360	17
361	25
362	25
361	22
362	22
363	17
364	17
363	4
364	4
363	16
364	16
365	11
366	11
367	27
368	27
369	7
370	7
369	10
370	10
369	18
370	18
371	4
372	4
371	16
372	16
371	24
372	24
373	20
374	20
375	9
376	9
375	7
376	7
377	7
378	7
377	12
378	12
377	20
378	20
379	17
380	17
381	10
382	10
381	11
382	11
381	5
382	5
381	10
382	10
383	13
384	13
383	26
384	26
385	10
386	10
385	17
386	17
385	22
386	22
385	12
386	12
387	18
388	18
387	24
388	24
387	24
388	24
387	6
388	6
389	7
390	7
391	17
392	17
391	18
392	18
393	15
394	15
393	15
394	15
395	9
396	9
395	14
396	14
395	11
396	11
397	27
398	27
397	21
398	21
397	12
398	12
399	18
400	18
399	19
400	19
399	7
400	7
399	5
400	5
401	8
402	8
403	27
404	27
403	27
404	27
403	14
404	14
405	22
406	22
405	4
406	4
405	5
406	5
405	14
406	14
407	6
408	6
409	25
410	25
411	25
412	25
413	23
414	23
413	10
414	10
415	9
416	9
415	9
416	9
415	26
416	26
417	10
418	10
419	16
420	16
419	14
420	14
419	17
420	17
419	25
420	25
421	26
422	26
421	25
422	25
421	11
422	11
421	26
422	26
423	26
424	26
423	26
424	26
423	4
424	4
425	22
426	22
425	21
426	21
425	22
426	22
427	12
428	12
429	24
430	24
429	16
430	16
429	17
430	17
431	19
432	19
431	21
432	21
431	8
432	8
431	18
432	18
433	3
434	3
433	18
434	18
435	18
436	18
435	18
436	18
435	7
436	7
435	6
436	6
437	24
438	24
437	18
438	18
437	3
438	3
439	10
440	10
441	5
442	5
443	14
444	14
443	8
444	8
445	6
446	6
445	26
446	26
445	23
446	23
447	12
448	12
449	18
450	18
451	26
452	26
451	25
452	25
451	15
452	15
453	7
454	7
453	25
454	25
453	27
454	27
455	6
456	6
457	24
458	24
457	22
458	22
459	11
460	11
459	19
460	19
461	27
462	27
463	6
464	6
463	16
464	16
463	13
464	13
465	9
466	9
467	13
468	13
467	16
468	16
467	19
468	19
467	23
468	23
469	5
470	5
469	9
470	9
469	17
470	17
471	11
472	11
471	4
472	4
471	24
472	24
473	27
474	27
475	6
476	6
475	17
476	17
477	26
478	26
477	6
478	6
479	4
480	4
479	11
480	11
479	25
480	25
481	15
482	15
481	5
482	5
481	27
482	27
483	10
484	10
485	13
486	13
485	19
486	19
485	26
486	26
485	20
486	20
487	13
488	13
487	5
488	5
487	27
488	27
487	17
488	17
489	19
490	19
489	11
490	11
491	23
492	23
491	9
492	9
491	27
492	27
491	13
492	13
493	3
494	3
493	21
494	21
495	7
496	7
495	3
496	3
495	17
496	17
495	18
496	18
497	22
498	22
497	12
498	12
497	17
498	17
499	27
500	27
499	8
500	8
501	17
502	17
501	4
502	4
501	19
502	19
503	4
504	4
503	13
504	13
505	14
506	14
505	9
506	9
505	7
506	7
507	23
508	23
507	15
508	15
509	17
510	17
509	8
510	8
509	15
510	15
511	15
512	15
511	23
512	23
513	7
514	7
515	11
516	11
515	6
516	6
517	26
518	26
519	4
520	4
519	22
520	22
519	16
520	16
521	22
522	22
523	20
524	20
523	19
524	19
525	17
526	17
525	4
526	4
525	20
526	20
525	16
526	16
527	20
528	20
527	6
528	6
529	18
530	18
529	18
530	18
529	20
530	20
531	7
532	7
533	5
534	5
533	9
534	9
533	19
534	19
533	8
534	8
535	3
536	3
535	11
536	11
535	6
536	6
537	4
538	4
539	16
540	16
539	17
540	17
541	22
542	22
541	9
542	9
543	13
544	13
543	23
544	23
543	6
544	6
543	19
544	19
545	23
546	23
545	4
546	4
547	20
548	20
547	22
548	22
549	27
550	27
549	14
550	14
551	14
552	14
551	5
552	5
553	5
554	5
553	24
554	24
555	13
556	13
555	7
556	7
555	18
556	18
557	10
558	10
557	8
558	8
559	14
560	14
561	18
562	18
561	8
562	8
561	10
562	10
563	22
564	22
565	15
566	15
565	7
566	7
567	24
568	24
567	13
568	13
567	20
568	20
567	23
568	23
569	11
570	11
569	7
570	7
569	4
570	4
569	24
570	24
\.


--
-- Data for Name: docente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docente (id, nome, dt_inicio, id_cargo, id_titulo, id_area) FROM stdin;
1	lúcio figueiredo de rezende	2004-08-01	2	1	23
2	marcelo friederichs landim de souza	2009-12-12	7	1	23
3	antônio henrique figueira louro	1999-01-26	1	1	26
4	aprígio augusto lopes bezerra	2013-10-19	1	1	26
5	césar alberto bravo pariente	2010-06-12	1	1	26
6	dany sanchez dominguez	2013-05-02	5	1	26
7	edgar alexander	2008-12-13	2	4	26
8	esbel tomás valero orellana	2002-09-23	5	1	26
9	felix mas milian	2007-02-10	5	1	26
10	francisco bruno souza oliveira	2011-05-08	7	1	26
11	hamilton josé brumatto	2001-08-13	2	4	26
12	hélder conceição almeida	2003-04-09	2	4	26
13	jauberth weyll abijaude	1998-04-07	2	4	26
14	jorge lima de oliveira filho	2009-03-07	1	1	26
15	leard de oliveira fernandes	2000-05-15	2	4	26
16	lilia marta brandão soussa modesto	2000-01-07	2	4	26
17	luciano ângelo de souza bernardes	2002-09-24	1	1	26
18	marcelo ossamu honda	2013-03-09	7	1	26
19	marta magda dornelles	2000-12-26	1	1	26
20	martha ximena torresdelgado	2007-10-06	7	1	26
21	paulo andré sperandio giacomin	2006-06-08	1	1	26
22	paulo eduardo ambrósio	2012-07-05	1	1	26
23	susana marrero iglesias	2008-06-04	5	1	26
24	sérgio fred ribeiro andrade	1997-12-01	1	1	26
25	tricia souto santos	1998-10-12	2	4	26
26	vânia cordeiro da silva	2013-10-24	1	1	26
27	álvaro vinícius de souza coelho	2010-12-02	7	1	26
28	admilson santa cruz do nascimento	2013-05-09	6	2	27
29	cleverson alves de lima	2010-03-10	1	1	27
30	danilo de santana nunes	1999-12-12	1	1	27
31	joabson lima alves	1998-03-12	2	4	27
32	jonathas sousa reis	2002-10-03	6	4	27
33	josé renato de castro pessoa	2001-11-16	1	1	27
34	lorena lopes novais	1998-01-27	6	2	27
35	manoel camilo moleiro cabrera	2009-07-10	1	1	27
36	marcelo tramontin souza	1999-06-13	1	1	27
37	maria lícia silva de queiroz	2001-06-25	2	4	27
38	ruan carlos de araújo moura	1999-03-21	2	1	27
39	stephanny conceição farias do egito costa	2003-01-06	2	4	27
40	thayse gama de carvalho	2005-10-22	2	4	27
41	adi neves rocha	2005-06-10	2	4	28
42	adjeferson custódio gomes	2003-05-23	1	1	28
43	clécio ribeiro cosenza	2007-02-09	4	4	28
44	fábio alexandre martins monteiro	2008-02-04	2	4	28
45	igor ferreira do prado	2002-02-04	2	4	28
46	lucas sampaio garcia	2004-06-04	1	1	28
47	maruedson pires martins	2005-11-18	5	1	28
48	matheus garcia soares	1998-10-10	1	1	28
49	rafael rodrigues de queiroz freitas	2006-09-18	1	1	28
50	thiago correia vieira	2004-06-09	1	1	28
51	thiago pereira das chagas	2013-01-12	7	1	28
52	andré luis vinagre pereira	2006-11-04	2	4	29
53	danilo maciel barquete	2006-03-01	5	1	29
54	erickson fabiano moura sousa silva	2008-11-16	2	4	29
55	fernando da silva oliveira	2000-02-02	4	3	29
56	josé carlos de camargo	2010-11-07	1	1	29
57	leonardo iusuti de medeiros	2003-10-22	2	4	29
58	nila cecilia de faria lopes medeiros	2012-02-08	2	4	29
59	renato reis monteiro	2008-06-01	7	1	29
60	vaneide gomes	1997-02-04	1	1	29
61	victor hugo martins de almeida 	1999-08-09	2	4	29
62	érica cristina almeida	2013-07-26	7	1	29
63	alex vinícius souza araújo	1997-09-11	4	4	30
64	alexandre do nascimento silva	2002-09-17	2	1	30
65	aline patricia mano	2010-03-21	1	1	30
66	enio antunes rezende	1997-12-27	7	1	30
67	fabiano rodrigues soriano	2005-05-15	1	1	30
68	felipe ungarato ferreira	2000-11-24	2	4	30
69	joão pedro de castro nunes pereira	2007-09-14	5	1	30
70	juliano zaffalon gerber	1998-07-14	1	1	30
71	priscila pereira suzart de carvalho	1999-11-25	2	1	30
72	sara meira moutta	2013-09-26	2	4	30
73	tarcilla silva dos santos	2010-01-15	6	4	30
74	thiago francisco de souza	2007-01-04	2	4	30
75	celso carlino maria fornari júnior	2009-01-28	5	1	31
76	claudia renata borges	2000-07-11	1	1	31
77	elilton rodrigues edwards	2003-04-12	7	1	31
78	elizama aguiar de oliveira	2005-11-15	1	1	31
79	franco dani rico amado	2004-04-25	5	1	31
80	geovana pires araujo lima	2000-09-12	4	4	31
81	janclei pereira coutinho	2004-03-24	1	1	31
82	jéssica barbosa da silva do nascimento	2010-01-23	2	4	31
83	mauro de paula moreira	2005-03-15	7	1	31
84	márcio barbalho dantas bezerra	2013-05-07	2	1	31
85	raimundo alves lima sobrinho	2000-07-07	2	1	31
86	tatiane benvenuti	1998-01-11	8	1	31
87	vera rosa capelossi	2002-02-16	7	1	31
88	ana cristina schilling	1999-10-05	7	1	32
89	enio galinkin jelihovschi	2013-09-18	5	1	32
90	ivan bezerra allaman	2005-02-22	1	1	32
91	jaênes miranda alves	1997-09-10	5	1	32
92	josé cláudio faria	2010-05-02	5	1	32
93	luiz roberto martins pinto	2000-11-06	5	1	32
94	lígia lins souza	2003-02-16	4	1	32
95	marcelo inácio ferreira ferraz	2003-11-13	7	1	32
96	miguel antônio quinteiro ribeiro	2005-10-09	1	1	32
97	sérgio josé ribeiro de oliveira	2010-08-24	1	1	32
98	verônica yumi kataoka	2008-12-23	7	1	32
99	adriano hoth cerqueira	2000-04-22	5	1	33
100	adriano marcus stuchi	2011-02-09	7	1	33
101	agnes maria da fonseca fausto	2002-04-08	1	1	33
102	alejandra kandus	2004-07-18	7	1	33
103	alejandro javier dimarco	2007-10-18	1	1	33
104	alex dos santos miranda	2006-11-18	1	1	33
105	anderson william mol	2010-09-14	7	1	33
106	andré luís batista ribeiro	2011-09-09	5	1	33
107	andréa de azevedo morégula	2006-09-23	7	1	33
108	antônio edsom carvalho filho	1998-04-25	2	4	33
109	antônio jamil mania	2012-02-05	5	1	33
110	arturo rodolfo samana	1997-11-21	1	1	33
111	décio tosta de santana	2009-03-13	2	2	33
112	fabiane alexsandra andrade de jesus	1997-11-25	1	1	33
113	fermin de la caridad garcia velasco	2004-07-17	5	1	33
114	fernando remigio tamariz luna	2008-06-26	1	1	33
115	george kouzo shinomiya	2007-08-24	7	1	33
116	henri michel pierre plana	2011-09-24	5	1	33
117	josé geraldo gonçalves de oliveira	2006-05-18	7	1	33
118	jules batista soares	2009-05-01	1	1	33
119	leandro de oliveira kerber	2001-03-18	7	1	33
120	marcelo bento pisani	2005-08-07	1	1	33
121	marcelo o'donnell krause	2002-04-07	4	4	33
122	maria jaqueline vasconcelos	1997-04-23	7	1	33
123	maxwell roger da purificação siqueira	2009-12-18	7	1	33
124	michel felipe lima de araújo	2012-01-21	6	1	33
125	orlando josé katime santrich	2007-11-28	8	1	33
126	roger magalhães da silva	2004-07-20	2	4	33
127	simoni tormohlen gehlen	2011-10-21	1	1	33
128	zolacir trindade de oliveira junior	1998-02-13	7	1	33
129	afonso henriques	2002-03-03	5	1	34
130	aida carvalho vita	2011-07-03	7	1	34
131	andré malvezzi lopes	2002-02-22	2	4	34
132	calixto john silva viana	1998-09-05	3	2	34
133	carlos luide bião dos reis	2009-12-16	2	4	34
134	claudemir mota da cruz	2008-12-03	2	4	34
135	claudio soriano de souza brandão	2011-02-24	1	1	34
136	cláudia ribeiro santana	2002-03-01	1	1	34
137	cícero alfredo da silva filho	2007-01-08	7	1	34
138	diná da silva correia	2009-07-18	1	1	34
139	eduardo delcides bernardes	2011-06-22	1	1	34
140	eduardo santos de oliveira 	2013-09-24	3	2	34
141	eduardo silva palmeira 	2004-03-10	7	1	34
142	elisângela silva farias	2011-06-18	2	4	34
143	eurivalda ribeiro dos santos santana	2005-12-22	5	1	34
144	fernanda gonçalves de paula	2005-08-15	7	1	34
145	flaviana dos santos silva	1998-11-21	1	1	34
146	geizane lima da silva	2006-07-08	1	1	34
147	geraldo de assis júnior	2007-07-23	1	1	34
148	german ignácio gomero ferrer	2000-05-27	1	1	34
149	gesil sampaio amarante segundo	2013-06-25	7	1	34
150	gildson queiroz de jesus 	2010-03-07	7	1	34
151	jorge henrique de oliveira sales	2013-08-17	7	1	34
152	josé carlos chagas	2005-07-09	3	2	34
153	josé valter alves da silva	2006-04-16	2	4	34
154	jurema lindote botelho peixoto	2006-11-23	1	1	34
155	karina kfouri sartori	1997-06-26	1	1	34
156	larissa brito de oliveira	2011-09-28	2	4	34
157	larissa pinca sarro gomes	2002-11-17	1	1	34
158	liliane xavier neves	1999-02-12	1	1	34
159	luciana cláudia de paula	2013-08-22	1	1	34
160	marcos dos santos ferreira	2005-11-03	1	1	34
161	marcos rogério neves	2011-11-22	1	1	34
162	maria margarete do rosário farias	2011-09-08	1	1	34
163	marlúbia corrêa de paula	2002-12-02	8	1	34
164	mirela vanina de mello	2007-02-11	7	1	34
165	natália rocha pinheiro	1997-12-01	2	4	34
166	nestor felipe castañeda centurion	2007-10-24	1	1	34
167	paulo henrique galão	2010-03-02	2	4	34
168	paulo sérgio da silva	1998-05-19	2	4	34
169	pryscilla dos santos ferreira silva	1998-09-19	1	1	34
170	ricardo martin bentin zacarias	2013-08-11	1	1	34
171	romenique da rocha silva	2007-05-08	1	1	34
172	rosane leite funato	2004-10-23	2	4	34
173	sandra maria pinto magina	2005-11-27	1	1	34
174	sérgio alvarez araujo correia	1999-03-04	2	1	34
175	vera lúcia merlini	2012-01-18	1	1	34
176	vinicius augusto takahashi arakawa	1998-12-24	7	1	34
177	weslem liberato silva	2011-11-14	7	1	34
178	acácia gomes pinho	2005-04-24	2	4	35
179	andrei steveen moreno rodriguez	2000-05-11	8	1	35
180	andré gustavo de araújo fernandes	1998-03-03	1	1	35
181	antônio de santana santos	1998-08-04	7	1	35
182	carla fernanda fávaro	2005-01-21	7	1	35
183	cleyde corrêa roncarati	2002-01-01	1	1	35
184	daniel de castro lima	2008-06-10	7	1	35
185	elisa prestes massena	2011-11-13	7	1	35
186	erik galvão paranhos da silva	1998-02-09	7	1	35
187	fernando cesário rangel	2011-05-06	1	1	35
188	fernando faustino de oliveira	1998-05-09	7	1	35
189	fábio alan carqueija amorim	1997-05-12	7	1	35
190	indman ruana lima queiroz	2011-04-25	2	4	35
191	ivete maria dos santos	2003-07-06	1	4	35
192	ivon pinheiro lobo	2010-06-27	1	1	35
193	julieta rangel de oliveira	2007-02-08	7	1	35
194	luana novaes santos	2004-01-21	7	1	35
195	luiz carlos salay	1998-12-27	7	1	35
196	luiza renata félix de carvalho lima	2001-12-27	2	1	35
197	marcelo franco	1997-07-05	5	1	35
198	maria elvira do rego barros bello	2009-05-13	1	1	35
199	miriam sanae tokumoto	2002-07-17	1	1	35
200	márcio luís oliveira ferreira	2011-04-15	7	1	35
201	neurivaldo josé de guzzi filho	2010-12-13	7	1	35
202	paulo neilson marques dos anjos	2012-02-07	7	1	35
203	raildo mota de jesus	2009-09-13	5	1	35
204	roberto carlos felício	2005-06-03	5	1	35
205	rodrigo luis da silva ribeiro dos santos	2004-07-04	7	1	35
206	rosenira serpa da cruz	2000-10-18	5	1	35
207	rosilene aparecida de oliveira	1998-04-24	5	1	35
208	tânia maria de brito	2004-09-20	7	1	35
\.


--
-- Data for Name: formacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formacao (id, formacao) FROM stdin;
1	bacharelado
2	licenciatura
\.


--
-- Data for Name: pro_reitoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pro_reitoria (id, sigla, nome) FROM stdin;
1	propp	pró-reitoria de pesquisa e pós-graduação
2	prograd	pró-reitoria de graduação
3	proex	pró-reitoria de extensão
4	proad	pró-reitoria administrativa
5	projur	procuradoria jurídica
\.


--
-- Data for Name: semestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semestre (id, semestre, id_pro_reitoria) FROM stdin;
1	2019.1	2
2	2019.2	2
3	2020.1	2
4	2020.2	2
5	2021.1	2
6	2021.2	2
7	2022.1	2
8	2022.2	2
\.


--
-- Data for Name: tipo_aula; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_aula (id, tipo_aula) FROM stdin;
1	pratica
2	teórica
\.


--
-- Data for Name: titulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.titulo (id, titulo) FROM stdin;
1	doutor(a)
2	especialista
3	graduado(a)
4	mestre
\.


--
-- Data for Name: turma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.turma (id, turma, id_disciplina, id_semestre, id_curso, id_tipo_aula) FROM stdin;
1	T1	421	4	4	1
2	T1	421	4	4	2
3	T2	421	4	4	1
4	T2	421	4	4	2
5	T1	421	5	4	1
6	T1	421	5	4	2
7	T2	421	5	4	1
8	T2	421	5	4	2
9	T1	421	6	4	1
10	T1	421	6	4	2
11	T2	421	6	4	1
12	T2	421	6	4	2
13	T1	421	7	4	1
14	T1	421	7	4	2
15	T2	421	7	4	1
16	T2	421	7	4	2
17	T1	421	8	4	1
18	T1	421	8	4	2
19	T2	421	8	4	1
20	T2	421	8	4	2
21	T1	428	4	4	1
22	T1	428	4	4	2
23	T2	428	4	4	1
24	T2	428	4	4	2
25	T1	428	5	4	1
26	T1	428	5	4	2
27	T2	428	5	4	1
28	T2	428	5	4	2
29	T1	428	6	4	1
30	T1	428	6	4	2
31	T2	428	6	4	1
32	T2	428	6	4	2
33	T1	428	7	4	1
34	T1	428	7	4	2
35	T2	428	7	4	1
36	T2	428	7	4	2
37	T1	428	8	4	1
38	T1	428	8	4	2
39	T2	428	8	4	1
40	T2	428	8	4	2
41	T1	524	4	4	1
42	T1	524	4	4	2
43	T1	524	5	4	1
44	T1	524	5	4	2
45	T1	524	6	4	1
46	T1	524	6	4	2
47	T1	524	7	4	1
48	T1	524	7	4	2
49	T1	524	8	4	1
50	T1	524	8	4	2
51	T1	525	4	4	1
52	T1	525	4	4	2
53	T2	525	4	4	1
54	T2	525	4	4	2
55	T1	525	5	4	1
56	T1	525	5	4	2
57	T2	525	5	4	1
58	T2	525	5	4	2
59	T1	525	6	4	1
60	T1	525	6	4	2
61	T2	525	6	4	1
62	T2	525	6	4	2
63	T1	525	7	4	1
64	T1	525	7	4	2
65	T2	525	7	4	1
66	T2	525	7	4	2
67	T1	525	8	4	1
68	T1	525	8	4	2
69	T2	525	8	4	1
70	T2	525	8	4	2
71	T1	526	4	4	1
72	T1	526	4	4	2
73	T1	526	5	4	1
74	T1	526	5	4	2
75	T1	526	6	4	1
76	T1	526	6	4	2
77	T1	526	7	4	1
78	T1	526	7	4	2
79	T1	526	8	4	1
80	T1	526	8	4	2
81	T1	527	4	4	1
82	T1	527	4	4	2
83	T1	527	5	4	1
84	T1	527	5	4	2
85	T1	527	6	4	1
86	T1	527	6	4	2
87	T1	527	7	4	1
88	T1	527	7	4	2
89	T1	527	8	4	1
90	T1	527	8	4	2
91	T1	529	4	4	1
92	T1	529	4	4	2
93	T1	529	5	4	1
94	T1	529	5	4	2
95	T1	529	6	4	1
96	T1	529	6	4	2
97	T1	529	7	4	1
98	T1	529	7	4	2
99	T1	529	8	4	1
100	T1	529	8	4	2
101	T1	530	4	4	1
102	T1	530	4	4	2
103	T1	530	5	4	1
104	T1	530	5	4	2
105	T1	530	6	4	1
106	T1	530	6	4	2
107	T1	530	7	4	1
108	T1	530	7	4	2
109	T1	530	8	4	1
110	T1	530	8	4	2
111	T1	532	4	4	1
112	T1	532	4	4	2
113	T1	532	5	4	1
114	T1	532	5	4	2
115	T1	532	6	4	1
116	T1	532	6	4	2
117	T1	532	7	4	1
118	T1	532	7	4	2
119	T1	532	8	4	1
120	T1	532	8	4	2
121	T1	533	4	4	1
122	T1	533	4	4	2
123	T1	533	5	4	1
124	T1	533	5	4	2
125	T1	533	6	4	1
126	T1	533	6	4	2
127	T1	533	7	4	1
128	T1	533	7	4	2
129	T1	533	8	4	1
130	T1	533	8	4	2
131	T1	535	4	4	1
132	T1	535	4	4	2
133	T1	535	5	4	1
134	T1	535	5	4	2
135	T1	535	6	4	1
136	T1	535	6	4	2
137	T1	535	7	4	1
138	T1	535	7	4	2
139	T1	535	8	4	1
140	T1	535	8	4	2
141	T1	537	4	4	1
142	T1	537	4	4	2
143	T1	537	5	4	1
144	T1	537	5	4	2
145	T1	537	6	4	1
146	T1	537	6	4	2
147	T1	537	7	4	1
148	T1	537	7	4	2
149	T1	537	8	4	1
150	T1	537	8	4	2
151	T1	539	4	4	1
152	T1	539	4	4	2
153	T1	539	5	4	1
154	T1	539	5	4	2
155	T1	539	6	4	1
156	T1	539	6	4	2
157	T1	539	7	4	1
158	T1	539	7	4	2
159	T1	539	8	4	1
160	T1	539	8	4	2
161	T1	542	4	4	1
162	T1	542	4	4	2
163	T2	542	4	4	1
164	T2	542	4	4	2
165	T1	542	5	4	1
166	T1	542	5	4	2
167	T2	542	5	4	1
168	T2	542	5	4	2
169	T1	542	6	4	1
170	T1	542	6	4	2
171	T2	542	6	4	1
172	T2	542	6	4	2
173	T1	542	7	4	1
174	T1	542	7	4	2
175	T2	542	7	4	1
176	T2	542	7	4	2
177	T1	542	8	4	1
178	T1	542	8	4	2
179	T2	542	8	4	1
180	T2	542	8	4	2
181	T1	543	4	4	1
182	T1	543	4	4	2
183	T1	543	5	4	1
184	T1	543	5	4	2
185	T1	543	6	4	1
186	T1	543	6	4	2
187	T1	543	7	4	1
188	T1	543	7	4	2
189	T1	543	8	4	1
190	T1	543	8	4	2
191	T1	544	4	4	1
192	T1	544	4	4	2
193	T1	544	5	4	1
194	T1	544	5	4	2
195	T1	544	6	4	1
196	T1	544	6	4	2
197	T1	544	7	4	1
198	T1	544	7	4	2
199	T1	544	8	4	1
200	T1	544	8	4	2
201	T1	545	4	4	1
202	T1	545	4	4	2
203	T2	545	4	4	1
204	T2	545	4	4	2
205	T1	545	5	4	1
206	T1	545	5	4	2
207	T2	545	5	4	1
208	T2	545	5	4	2
209	T1	545	6	4	1
210	T1	545	6	4	2
211	T2	545	6	4	1
212	T2	545	6	4	2
213	T1	545	7	4	1
214	T1	545	7	4	2
215	T2	545	7	4	1
216	T2	545	7	4	2
217	T1	545	8	4	1
218	T1	545	8	4	2
219	T2	545	8	4	1
220	T2	545	8	4	2
221	T1	546	4	4	1
222	T1	546	4	4	2
223	T2	546	4	4	1
224	T2	546	4	4	2
225	T1	546	5	4	1
226	T1	546	5	4	2
227	T2	546	5	4	1
228	T2	546	5	4	2
229	T1	546	6	4	1
230	T1	546	6	4	2
231	T2	546	6	4	1
232	T2	546	6	4	2
233	T1	546	7	4	1
234	T1	546	7	4	2
235	T2	546	7	4	1
236	T2	546	7	4	2
237	T1	546	8	4	1
238	T1	546	8	4	2
239	T2	546	8	4	1
240	T2	546	8	4	2
241	T1	547	4	4	1
242	T1	547	4	4	2
243	T1	547	5	4	1
244	T1	547	5	4	2
245	T1	547	6	4	1
246	T1	547	6	4	2
247	T1	547	7	4	1
248	T1	547	7	4	2
249	T1	547	8	4	1
250	T1	547	8	4	2
251	T1	548	4	4	1
252	T1	548	4	4	2
253	T2	548	4	4	1
254	T2	548	4	4	2
255	T1	548	5	4	1
256	T1	548	5	4	2
257	T2	548	5	4	1
258	T2	548	5	4	2
259	T1	548	6	4	1
260	T1	548	6	4	2
261	T2	548	6	4	1
262	T2	548	6	4	2
263	T1	548	7	4	1
264	T1	548	7	4	2
265	T2	548	7	4	1
266	T2	548	7	4	2
267	T1	548	8	4	1
268	T1	548	8	4	2
269	T2	548	8	4	1
270	T2	548	8	4	2
271	T1	549	4	4	1
272	T1	549	4	4	2
273	T1	549	5	4	1
274	T1	549	5	4	2
275	T1	549	6	4	1
276	T1	549	6	4	2
277	T1	549	7	4	1
278	T1	549	7	4	2
279	T1	549	8	4	1
280	T1	549	8	4	2
281	T1	550	4	4	1
282	T1	550	4	4	2
283	T1	550	5	4	1
284	T1	550	5	4	2
285	T1	550	6	4	1
286	T1	550	6	4	2
287	T1	550	7	4	1
288	T1	550	7	4	2
289	T1	550	8	4	1
290	T1	550	8	4	2
291	T1	551	4	4	1
292	T1	551	4	4	2
293	T1	551	5	4	1
294	T1	551	5	4	2
295	T1	551	6	4	1
296	T1	551	6	4	2
297	T1	551	7	4	1
298	T1	551	7	4	2
299	T1	551	8	4	1
300	T1	551	8	4	2
301	T1	552	4	4	1
302	T1	552	4	4	2
303	T2	552	4	4	1
304	T2	552	4	4	2
305	T1	552	5	4	1
306	T1	552	5	4	2
307	T2	552	5	4	1
308	T2	552	5	4	2
309	T1	552	6	4	1
310	T1	552	6	4	2
311	T2	552	6	4	1
312	T2	552	6	4	2
313	T1	552	7	4	1
314	T1	552	7	4	2
315	T2	552	7	4	1
316	T2	552	7	4	2
317	T1	552	8	4	1
318	T1	552	8	4	2
319	T2	552	8	4	1
320	T2	552	8	4	2
321	T1	555	4	4	1
322	T1	555	4	4	2
323	T2	555	4	4	1
324	T2	555	4	4	2
325	T1	555	5	4	1
326	T1	555	5	4	2
327	T2	555	5	4	1
328	T2	555	5	4	2
329	T1	555	6	4	1
330	T1	555	6	4	2
331	T2	555	6	4	1
332	T2	555	6	4	2
333	T1	555	7	4	1
334	T1	555	7	4	2
335	T2	555	7	4	1
336	T2	555	7	4	2
337	T1	555	8	4	1
338	T1	555	8	4	2
339	T2	555	8	4	1
340	T2	555	8	4	2
341	T1	556	4	4	1
342	T1	556	4	4	2
343	T2	556	4	4	1
344	T2	556	4	4	2
345	T1	556	5	4	1
346	T1	556	5	4	2
347	T2	556	5	4	1
348	T2	556	5	4	2
349	T1	556	6	4	1
350	T1	556	6	4	2
351	T2	556	6	4	1
352	T2	556	6	4	2
353	T1	556	7	4	1
354	T1	556	7	4	2
355	T2	556	7	4	1
356	T2	556	7	4	2
357	T1	556	8	4	1
358	T1	556	8	4	2
359	T2	556	8	4	1
360	T2	556	8	4	2
361	T1	557	4	4	1
362	T1	557	4	4	2
363	T2	557	4	4	1
364	T2	557	4	4	2
365	T1	557	5	4	1
366	T1	557	5	4	2
367	T2	557	5	4	1
368	T2	557	5	4	2
369	T1	557	6	4	1
370	T1	557	6	4	2
371	T2	557	6	4	1
372	T2	557	6	4	2
373	T1	557	7	4	1
374	T1	557	7	4	2
375	T2	557	7	4	1
376	T2	557	7	4	2
377	T1	557	8	4	1
378	T1	557	8	4	2
379	T2	557	8	4	1
380	T2	557	8	4	2
381	T1	558	4	4	1
382	T1	558	4	4	2
383	T2	558	4	4	1
384	T2	558	4	4	2
385	T1	558	5	4	1
386	T1	558	5	4	2
387	T2	558	5	4	1
388	T2	558	5	4	2
389	T1	558	6	4	1
390	T1	558	6	4	2
391	T2	558	6	4	1
392	T2	558	6	4	2
393	T1	558	7	4	1
394	T1	558	7	4	2
395	T2	558	7	4	1
396	T2	558	7	4	2
397	T1	558	8	4	1
398	T1	558	8	4	2
399	T2	558	8	4	1
400	T2	558	8	4	2
401	T1	559	4	4	1
402	T1	559	4	4	2
403	T1	559	5	4	1
404	T1	559	5	4	2
405	T1	559	6	4	1
406	T1	559	6	4	2
407	T1	559	7	4	1
408	T1	559	7	4	2
409	T1	559	8	4	1
410	T1	559	8	4	2
411	T1	560	4	4	1
412	T1	560	4	4	2
413	T1	560	5	4	1
414	T1	560	5	4	2
415	T1	560	6	4	1
416	T1	560	6	4	2
417	T1	560	7	4	1
418	T1	560	7	4	2
419	T1	560	8	4	1
420	T1	560	8	4	2
421	T1	561	4	4	1
422	T1	561	4	4	2
423	T1	561	5	4	1
424	T1	561	5	4	2
425	T1	561	6	4	1
426	T1	561	6	4	2
427	T1	561	7	4	1
428	T1	561	7	4	2
429	T1	561	8	4	1
430	T1	561	8	4	2
431	T1	562	4	4	1
432	T1	562	4	4	2
433	T1	562	5	4	1
434	T1	562	5	4	2
435	T1	562	6	4	1
436	T1	562	6	4	2
437	T1	562	7	4	1
438	T1	562	7	4	2
439	T1	562	8	4	1
440	T1	562	8	4	2
441	T1	565	4	4	1
442	T1	565	4	4	2
443	T2	565	4	4	1
444	T2	565	4	4	2
445	T1	565	5	4	1
446	T1	565	5	4	2
447	T2	565	5	4	1
448	T2	565	5	4	2
449	T1	565	6	4	1
450	T1	565	6	4	2
451	T2	565	6	4	1
452	T2	565	6	4	2
453	T1	565	7	4	1
454	T1	565	7	4	2
455	T2	565	7	4	1
456	T2	565	7	4	2
457	T1	565	8	4	1
458	T1	565	8	4	2
459	T2	565	8	4	1
460	T2	565	8	4	2
461	T1	566	4	4	1
462	T1	566	4	4	2
463	T1	566	5	4	1
464	T1	566	5	4	2
465	T1	566	6	4	1
466	T1	566	6	4	2
467	T1	566	7	4	1
468	T1	566	7	4	2
469	T1	566	8	4	1
470	T1	566	8	4	2
471	T1	567	4	4	1
472	T1	567	4	4	2
473	T1	567	5	4	1
474	T1	567	5	4	2
475	T1	567	6	4	1
476	T1	567	6	4	2
477	T1	567	7	4	1
478	T1	567	7	4	2
479	T1	567	8	4	1
480	T1	567	8	4	2
481	T1	568	4	4	1
482	T1	568	4	4	2
483	T2	568	4	4	1
484	T2	568	4	4	2
485	T1	568	5	4	1
486	T1	568	5	4	2
487	T2	568	5	4	1
488	T2	568	5	4	2
489	T1	568	6	4	1
490	T1	568	6	4	2
491	T2	568	6	4	1
492	T2	568	6	4	2
493	T1	568	7	4	1
494	T1	568	7	4	2
495	T2	568	7	4	1
496	T2	568	7	4	2
497	T1	568	8	4	1
498	T1	568	8	4	2
499	T2	568	8	4	1
500	T2	568	8	4	2
501	T1	570	4	4	1
502	T1	570	4	4	2
503	T1	570	5	4	1
504	T1	570	5	4	2
505	T1	570	6	4	1
506	T1	570	6	4	2
507	T1	570	7	4	1
508	T1	570	7	4	2
509	T1	570	8	4	1
510	T1	570	8	4	2
511	T1	571	4	4	1
512	T1	571	4	4	2
513	T1	571	5	4	1
514	T1	571	5	4	2
515	T1	571	6	4	1
516	T1	571	6	4	2
517	T1	571	7	4	1
518	T1	571	7	4	2
519	T1	571	8	4	1
520	T1	571	8	4	2
521	T1	574	4	4	1
522	T1	574	4	4	2
523	T1	574	5	4	1
524	T1	574	5	4	2
525	T1	574	6	4	1
526	T1	574	6	4	2
527	T1	574	7	4	1
528	T1	574	7	4	2
529	T1	574	8	4	1
530	T1	574	8	4	2
531	T1	575	4	4	1
532	T1	575	4	4	2
533	T1	575	5	4	1
534	T1	575	5	4	2
535	T1	575	6	4	1
536	T1	575	6	4	2
537	T1	575	7	4	1
538	T1	575	7	4	2
539	T1	575	8	4	1
540	T1	575	8	4	2
541	T1	576	4	4	1
542	T1	576	4	4	2
543	T1	576	5	4	1
544	T1	576	5	4	2
545	T1	576	6	4	1
546	T1	576	6	4	2
547	T1	576	7	4	1
548	T1	576	7	4	2
549	T1	576	8	4	1
550	T1	576	8	4	2
551	T1	577	4	4	1
552	T1	577	4	4	2
553	T1	577	5	4	1
554	T1	577	5	4	2
555	T1	577	6	4	1
556	T1	577	6	4	2
557	T1	577	7	4	1
558	T1	577	7	4	2
559	T1	577	8	4	1
560	T1	577	8	4	2
561	T1	578	4	4	1
562	T1	578	4	4	2
563	T1	578	5	4	1
564	T1	578	5	4	2
565	T1	578	6	4	1
566	T1	578	6	4	2
567	T1	578	7	4	1
568	T1	578	7	4	2
569	T1	578	8	4	1
570	T1	578	8	4	2
\.


--
-- Name: area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.area_id_seq', 1, false);


--
-- Name: cargo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cargo_id_seq', 1, false);


--
-- Name: curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curso_id_seq', 1, false);


--
-- Name: departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamento_id_seq', 1, false);


--
-- Name: disciplina_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disciplina_id_seq', 1, false);


--
-- Name: docente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.docente_id_seq', 1, false);


--
-- Name: formacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formacao_id_seq', 1, false);


--
-- Name: pro_reitoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pro_reitoria_id_seq', 1, false);


--
-- Name: semestre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semestre_id_seq', 1, false);


--
-- Name: tipo_aula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_aula_id_seq', 1, false);


--
-- Name: titulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.titulo_id_seq', 1, false);


--
-- Name: turma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.turma_id_seq', 1, false);


--
-- Name: area area_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pk PRIMARY KEY (id);


--
-- Name: cargo cargo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_pk PRIMARY KEY (id);


--
-- Name: curso curso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pk PRIMARY KEY (id);


--
-- Name: departamento departamento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pk PRIMARY KEY (id);


--
-- Name: disciplina disciplina_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT disciplina_pk PRIMARY KEY (id);


--
-- Name: doc_indicado doc_indicado_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doc_indicado
    ADD CONSTRAINT doc_indicado_uq UNIQUE (id_turma);


--
-- Name: docente docente_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT docente_pk PRIMARY KEY (id);


--
-- Name: formacao formacao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formacao
    ADD CONSTRAINT formacao_pk PRIMARY KEY (id);


--
-- Name: pro_reitoria pro_reitoria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pro_reitoria
    ADD CONSTRAINT pro_reitoria_pk PRIMARY KEY (id);


--
-- Name: semestre semestre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semestre
    ADD CONSTRAINT semestre_pk PRIMARY KEY (id);


--
-- Name: tipo_aula tipo_aula_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_aula
    ADD CONSTRAINT tipo_aula_pk PRIMARY KEY (id);


--
-- Name: titulo titulo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulo
    ADD CONSTRAINT titulo_pk PRIMARY KEY (id);


--
-- Name: turma turma_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_pk PRIMARY KEY (id);


--
-- Name: doc_indicado doc_indicado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_indicado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.doc_indicado FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: area doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.area FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: cargo doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.cargo FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: curso doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.curso FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: disciplina doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.disciplina FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: doc_interessado doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.doc_interessado FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: docente doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.docente FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: formacao doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.formacao FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: pro_reitoria doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.pro_reitoria FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: semestre doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.semestre FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: tipo_aula doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.tipo_aula FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: titulo doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.titulo FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: turma doc_interessado_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER doc_interessado_audit BEFORE INSERT OR DELETE OR UPDATE ON public.turma FOR EACH ROW EXECUTE FUNCTION audit.func_proc_audit();


--
-- Name: docente area_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT area_fk FOREIGN KEY (id_area) REFERENCES public.area(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: disciplina area_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT area_fk FOREIGN KEY (id_area) REFERENCES public.area(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: docente cargo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT cargo_fk FOREIGN KEY (id_cargo) REFERENCES public.cargo(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: turma curso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT curso_fk FOREIGN KEY (id_curso) REFERENCES public.curso(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: area departamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento) REFERENCES public.departamento(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: turma disciplina_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT disciplina_fk FOREIGN KEY (id_disciplina) REFERENCES public.disciplina(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: doc_interessado docente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doc_interessado
    ADD CONSTRAINT docente_fk FOREIGN KEY (id_docente) REFERENCES public.docente(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: doc_indicado docente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doc_indicado
    ADD CONSTRAINT docente_fk FOREIGN KEY (id_docente) REFERENCES public.docente(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: curso formacao_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT formacao_fk FOREIGN KEY (id_formacao) REFERENCES public.formacao(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: semestre pro_reitoria_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semestre
    ADD CONSTRAINT pro_reitoria_fk FOREIGN KEY (id_pro_reitoria) REFERENCES public.pro_reitoria(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: turma semestre_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT semestre_fk FOREIGN KEY (id_semestre) REFERENCES public.semestre(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: turma tipo_aula_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT tipo_aula_fk FOREIGN KEY (id_tipo_aula) REFERENCES public.tipo_aula(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: docente titulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT titulo_fk FOREIGN KEY (id_titulo) REFERENCES public.titulo(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: doc_interessado turma_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doc_interessado
    ADD CONSTRAINT turma_fk FOREIGN KEY (id_turma) REFERENCES public.turma(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: doc_indicado turma_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doc_indicado
    ADD CONSTRAINT turma_fk FOREIGN KEY (id_turma) REFERENCES public.turma(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

