-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: projeto_uesc | type: DATABASE --
-- DROP DATABASE IF EXISTS projeto_uesc;
CREATE DATABASE projeto_uesc;
-- ddl-end --


-- object: public.colegiado | type: TABLE --
-- DROP TABLE IF EXISTS public.colegiado CASCADE;
CREATE TABLE public.colegiado (
	id serial NOT NULL,
	colegiado varchar(50) NOT NULL,
	CONSTRAINT colegiado_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.colegiado OWNER TO postgres;
-- ddl-end --

-- object: public.curso | type: TABLE --
-- DROP TABLE IF EXISTS public.curso CASCADE;
CREATE TABLE public.curso (
	id serial NOT NULL,
	curso varchar(50) NOT NULL,
	id_colegiado integer,
	CONSTRAINT curso_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.curso OWNER TO postgres;
-- ddl-end --

-- object: public.formacao | type: TABLE --
-- DROP TABLE IF EXISTS public.formacao CASCADE;
CREATE TABLE public.formacao (
	id serial NOT NULL,
	formacao char NOT NULL,
	CONSTRAINT formacao_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.formacao OWNER TO postgres;
-- ddl-end --

-- object: public.disciplina | type: TABLE --
-- DROP TABLE IF EXISTS public.disciplina CASCADE;
CREATE TABLE public.disciplina (
	id serial NOT NULL,
	cod varchar(20) NOT NULL,
	disciplina varchar(150) NOT NULL,
	ch numeric(4) NOT NULL,
	id_departamento integer,
	id_area integer,
	CONSTRAINT disciplina_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.disciplina OWNER TO postgres;
-- ddl-end --

-- object: public.disciplina_formacao | type: TABLE --
-- DROP TABLE IF EXISTS public.disciplina_formacao CASCADE;
CREATE TABLE public.disciplina_formacao (
	id_disciplina integer,
	id_formacao integer

);
-- ddl-end --
ALTER TABLE public.disciplina_formacao OWNER TO postgres;
-- ddl-end --

-- object: disciplina_fk | type: CONSTRAINT --
-- ALTER TABLE public.disciplina_formacao DROP CONSTRAINT IF EXISTS disciplina_fk CASCADE;
ALTER TABLE public.disciplina_formacao ADD CONSTRAINT disciplina_fk FOREIGN KEY (id_disciplina)
REFERENCES public.disciplina (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: formacao_fk | type: CONSTRAINT --
-- ALTER TABLE public.disciplina_formacao DROP CONSTRAINT IF EXISTS formacao_fk CASCADE;
ALTER TABLE public.disciplina_formacao ADD CONSTRAINT formacao_fk FOREIGN KEY (id_formacao)
REFERENCES public.formacao (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.curso_formacao | type: TABLE --
-- DROP TABLE IF EXISTS public.curso_formacao CASCADE;
CREATE TABLE public.curso_formacao (
	id_curso integer,
	id_formacao integer

);
-- ddl-end --
ALTER TABLE public.curso_formacao OWNER TO postgres;
-- ddl-end --

-- object: curso_fk | type: CONSTRAINT --
-- ALTER TABLE public.curso_formacao DROP CONSTRAINT IF EXISTS curso_fk CASCADE;
ALTER TABLE public.curso_formacao ADD CONSTRAINT curso_fk FOREIGN KEY (id_curso)
REFERENCES public.curso (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: formacao_fk | type: CONSTRAINT --
-- ALTER TABLE public.curso_formacao DROP CONSTRAINT IF EXISTS formacao_fk CASCADE;
ALTER TABLE public.curso_formacao ADD CONSTRAINT formacao_fk FOREIGN KEY (id_formacao)
REFERENCES public.formacao (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.departamento | type: TABLE --
-- DROP TABLE IF EXISTS public.departamento CASCADE;
CREATE TABLE public.departamento (
	id serial NOT NULL,
	sigla varchar(10) NOT NULL,
	nome varchar(200) NOT NULL,
	CONSTRAINT departamento_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.departamento OWNER TO postgres;
-- ddl-end --

-- object: departamento_fk | type: CONSTRAINT --
-- ALTER TABLE public.disciplina DROP CONSTRAINT IF EXISTS departamento_fk CASCADE;
ALTER TABLE public.disciplina ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento)
REFERENCES public.departamento (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.docente | type: TABLE --
-- DROP TABLE IF EXISTS public.docente CASCADE;
CREATE TABLE public.docente (
	id serial NOT NULL,
	nome varchar(200) NOT NULL,
	cargo varchar(70) NOT NULL,
	titulo varchar(20) NOT NULL,
	id_departamento integer,
	id_area integer,
	CONSTRAINT docente_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.docente OWNER TO postgres;
-- ddl-end --

-- object: departamento_fk | type: CONSTRAINT --
-- ALTER TABLE public.docente DROP CONSTRAINT IF EXISTS departamento_fk CASCADE;
ALTER TABLE public.docente ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento)
REFERENCES public.departamento (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.pro_reitoria | type: TABLE --
-- DROP TABLE IF EXISTS public.pro_reitoria CASCADE;
CREATE TABLE public.pro_reitoria (
	id serial NOT NULL,
	sigla varchar(20) NOT NULL,
	nome varchar(150) NOT NULL,
	CONSTRAINT pro_reitoria_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.pro_reitoria OWNER TO postgres;
-- ddl-end --

-- object: public.area | type: TABLE --
-- DROP TABLE IF EXISTS public.area CASCADE;
CREATE TABLE public.area (
	id serial NOT NULL,
	area varchar(50) NOT NULL,
	CONSTRAINT area_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.area OWNER TO postgres;
-- ddl-end --

-- object: area_fk | type: CONSTRAINT --
-- ALTER TABLE public.disciplina DROP CONSTRAINT IF EXISTS area_fk CASCADE;
ALTER TABLE public.disciplina ADD CONSTRAINT area_fk FOREIGN KEY (id_area)
REFERENCES public.area (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: area_fk | type: CONSTRAINT --
-- ALTER TABLE public.docente DROP CONSTRAINT IF EXISTS area_fk CASCADE;
ALTER TABLE public.docente ADD CONSTRAINT area_fk FOREIGN KEY (id_area)
REFERENCES public.area (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.semestre | type: TABLE --
-- DROP TABLE IF EXISTS public.semestre CASCADE;
CREATE TABLE public.semestre (
	id serial NOT NULL,
	semestre varchar(15) NOT NULL,
	id_pro_reitoria integer,
	CONSTRAINT semestre_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.semestre OWNER TO postgres;
-- ddl-end --

-- object: public.sem_disc | type: TABLE --
-- DROP TABLE IF EXISTS public.sem_disc CASCADE;
CREATE TABLE public.sem_disc (
	id serial NOT NULL,
	id_semestre integer,
	id_disciplina integer,
	CONSTRAINT semestre_disciplina_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.sem_disc OWNER TO postgres;
-- ddl-end --

-- object: pro_reitoria_fk | type: CONSTRAINT --
-- ALTER TABLE public.semestre DROP CONSTRAINT IF EXISTS pro_reitoria_fk CASCADE;
ALTER TABLE public.semestre ADD CONSTRAINT pro_reitoria_fk FOREIGN KEY (id_pro_reitoria)
REFERENCES public.pro_reitoria (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: semestre_fk | type: CONSTRAINT --
-- ALTER TABLE public.sem_disc DROP CONSTRAINT IF EXISTS semestre_fk CASCADE;
ALTER TABLE public.sem_disc ADD CONSTRAINT semestre_fk FOREIGN KEY (id_semestre)
REFERENCES public.semestre (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: disciplina_fk | type: CONSTRAINT --
-- ALTER TABLE public.sem_disc DROP CONSTRAINT IF EXISTS disciplina_fk CASCADE;
ALTER TABLE public.sem_disc ADD CONSTRAINT disciplina_fk FOREIGN KEY (id_disciplina)
REFERENCES public.disciplina (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: colegiado_fk | type: CONSTRAINT --
-- ALTER TABLE public.curso DROP CONSTRAINT IF EXISTS colegiado_fk CASCADE;
ALTER TABLE public.curso ADD CONSTRAINT colegiado_fk FOREIGN KEY (id_colegiado)
REFERENCES public.colegiado (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.sem_disc_curso | type: TABLE --
-- DROP TABLE IF EXISTS public.sem_disc_curso CASCADE;
CREATE TABLE public.sem_disc_curso (
	id_sem_disc integer,
	id_curso integer

);
-- ddl-end --
ALTER TABLE public.sem_disc_curso OWNER TO postgres;
-- ddl-end --

-- object: public.sem_disc_docente | type: TABLE --
-- DROP TABLE IF EXISTS public.sem_disc_docente CASCADE;
CREATE TABLE public.sem_disc_docente (
	id_docente integer,
	id_sem_disc integer

);
-- ddl-end --
ALTER TABLE public.sem_disc_docente OWNER TO postgres;
-- ddl-end --

-- object: sem_disc_fk | type: CONSTRAINT --
-- ALTER TABLE public.sem_disc_curso DROP CONSTRAINT IF EXISTS sem_disc_fk CASCADE;
ALTER TABLE public.sem_disc_curso ADD CONSTRAINT sem_disc_fk FOREIGN KEY (id_sem_disc)
REFERENCES public.sem_disc (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: curso_fk | type: CONSTRAINT --
-- ALTER TABLE public.sem_disc_curso DROP CONSTRAINT IF EXISTS curso_fk CASCADE;
ALTER TABLE public.sem_disc_curso ADD CONSTRAINT curso_fk FOREIGN KEY (id_curso)
REFERENCES public.curso (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: sem_disc_fk | type: CONSTRAINT --
-- ALTER TABLE public.sem_disc_docente DROP CONSTRAINT IF EXISTS sem_disc_fk CASCADE;
ALTER TABLE public.sem_disc_docente ADD CONSTRAINT sem_disc_fk FOREIGN KEY (id_sem_disc)
REFERENCES public.sem_disc (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: docente_fk | type: CONSTRAINT --
-- ALTER TABLE public.sem_disc_docente DROP CONSTRAINT IF EXISTS docente_fk CASCADE;
ALTER TABLE public.sem_disc_docente ADD CONSTRAINT docente_fk FOREIGN KEY (id_docente)
REFERENCES public.docente (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


