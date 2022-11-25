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
-- CREATE DATABASE projeto_uesc;
-- ddl-end --


-- object: public.curso | type: TABLE --
-- DROP TABLE IF EXISTS public.curso CASCADE;
CREATE TABLE public.curso (
	id serial NOT NULL,
	curso varchar(50) NOT NULL,
	CONSTRAINT curso_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.curso OWNER TO postgres;
-- ddl-end --

-- object: public.formacao | type: TABLE --
-- DROP TABLE IF EXISTS public.formacao CASCADE;
CREATE TABLE public.formacao (
	id serial NOT NULL,
	formacao varchar(20) NOT NULL,
	CONSTRAINT formacao_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.formacao OWNER TO postgres;
-- ddl-end --

-- object: public.disciplina | type: TABLE --
-- DROP TABLE IF EXISTS public.disciplina CASCADE;
CREATE TABLE public.disciplina (
	id serial NOT NULL,
	cod varchar(20),
	disciplina varchar(150) NOT NULL,
	ch numeric(4) NOT NULL,
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

-- object: public.docente | type: TABLE --
-- DROP TABLE IF EXISTS public.docente CASCADE;
CREATE TABLE public.docente (
	id serial NOT NULL,
	nome varchar(200) NOT NULL,
	dt_inicio date NOT NULL,
	dt_fim date,
	id_cargo integer,
	id_titulo integer,
	id_area integer,
	CONSTRAINT docente_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.docente OWNER TO postgres;
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
	area varchar(100) NOT NULL,
	id_departamento integer,
	CONSTRAINT area_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.area OWNER TO postgres;
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

-- object: pro_reitoria_fk | type: CONSTRAINT --
-- ALTER TABLE public.semestre DROP CONSTRAINT IF EXISTS pro_reitoria_fk CASCADE;
ALTER TABLE public.semestre ADD CONSTRAINT pro_reitoria_fk FOREIGN KEY (id_pro_reitoria)
REFERENCES public.pro_reitoria (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: departamento_fk | type: CONSTRAINT --
-- ALTER TABLE public.area DROP CONSTRAINT IF EXISTS departamento_fk CASCADE;
ALTER TABLE public.area ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento)
REFERENCES public.departamento (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: area_fk | type: CONSTRAINT --
-- ALTER TABLE public.docente DROP CONSTRAINT IF EXISTS area_fk CASCADE;
ALTER TABLE public.docente ADD CONSTRAINT area_fk FOREIGN KEY (id_area)
REFERENCES public.area (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: area_fk | type: CONSTRAINT --
-- ALTER TABLE public.disciplina DROP CONSTRAINT IF EXISTS area_fk CASCADE;
ALTER TABLE public.disciplina ADD CONSTRAINT area_fk FOREIGN KEY (id_area)
REFERENCES public.area (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.turma | type: TABLE --
-- DROP TABLE IF EXISTS public.turma CASCADE;
CREATE TABLE public.turma (
	id serial NOT NULL,
	turma varchar(5) NOT NULL,
	id_disciplina integer,
	id_semestre integer,
	id_curso integer,
	CONSTRAINT turma_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.turma OWNER TO postgres;
-- ddl-end --

-- object: disciplina_fk | type: CONSTRAINT --
-- ALTER TABLE public.turma DROP CONSTRAINT IF EXISTS disciplina_fk CASCADE;
ALTER TABLE public.turma ADD CONSTRAINT disciplina_fk FOREIGN KEY (id_disciplina)
REFERENCES public.disciplina (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: semestre_fk | type: CONSTRAINT --
-- ALTER TABLE public.turma DROP CONSTRAINT IF EXISTS semestre_fk CASCADE;
ALTER TABLE public.turma ADD CONSTRAINT semestre_fk FOREIGN KEY (id_semestre)
REFERENCES public.semestre (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: curso_fk | type: CONSTRAINT --
-- ALTER TABLE public.turma DROP CONSTRAINT IF EXISTS curso_fk CASCADE;
ALTER TABLE public.turma ADD CONSTRAINT curso_fk FOREIGN KEY (id_curso)
REFERENCES public.curso (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.tipo_aula | type: TABLE --
-- DROP TABLE IF EXISTS public.tipo_aula CASCADE;
CREATE TABLE public.tipo_aula (
	id serial NOT NULL,
	tipo_aula varchar(19) NOT NULL,
	CONSTRAINT tipo_aula_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.tipo_aula OWNER TO postgres;
-- ddl-end --

-- object: public.aula | type: TABLE --
-- DROP TABLE IF EXISTS public.aula CASCADE;
CREATE TABLE public.aula (
	id serial NOT NULL,
	id_turma integer,
	id_tipo_aula integer,
	CONSTRAINT aula_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.aula OWNER TO postgres;
-- ddl-end --

-- object: turma_fk | type: CONSTRAINT --
-- ALTER TABLE public.aula DROP CONSTRAINT IF EXISTS turma_fk CASCADE;
ALTER TABLE public.aula ADD CONSTRAINT turma_fk FOREIGN KEY (id_turma)
REFERENCES public.turma (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: tipo_aula_fk | type: CONSTRAINT --
-- ALTER TABLE public.aula DROP CONSTRAINT IF EXISTS tipo_aula_fk CASCADE;
ALTER TABLE public.aula ADD CONSTRAINT tipo_aula_fk FOREIGN KEY (id_tipo_aula)
REFERENCES public.tipo_aula (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.doc_indicado | type: TABLE --
-- DROP TABLE IF EXISTS public.doc_indicado CASCADE;
CREATE TABLE public.doc_indicado (
	id_aula integer,
	id_docente integer

);
-- ddl-end --
ALTER TABLE public.doc_indicado OWNER TO postgres;
-- ddl-end --

-- object: aula_fk | type: CONSTRAINT --
-- ALTER TABLE public.doc_indicado DROP CONSTRAINT IF EXISTS aula_fk CASCADE;
ALTER TABLE public.doc_indicado ADD CONSTRAINT aula_fk FOREIGN KEY (id_aula)
REFERENCES public.aula (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: doc_indicado_uq | type: CONSTRAINT --
-- ALTER TABLE public.doc_indicado DROP CONSTRAINT IF EXISTS doc_indicado_uq CASCADE;
ALTER TABLE public.doc_indicado ADD CONSTRAINT doc_indicado_uq UNIQUE (id_aula);
-- ddl-end --

-- object: docente_fk | type: CONSTRAINT --
-- ALTER TABLE public.doc_indicado DROP CONSTRAINT IF EXISTS docente_fk CASCADE;
ALTER TABLE public.doc_indicado ADD CONSTRAINT docente_fk FOREIGN KEY (id_docente)
REFERENCES public.docente (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.doc_interessado | type: TABLE --
-- DROP TABLE IF EXISTS public.doc_interessado CASCADE;
CREATE TABLE public.doc_interessado (
	id_aula integer,
	id_docente integer

);
-- ddl-end --
ALTER TABLE public.doc_interessado OWNER TO postgres;
-- ddl-end --

-- object: docente_fk | type: CONSTRAINT --
-- ALTER TABLE public.doc_interessado DROP CONSTRAINT IF EXISTS docente_fk CASCADE;
ALTER TABLE public.doc_interessado ADD CONSTRAINT docente_fk FOREIGN KEY (id_docente)
REFERENCES public.docente (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: aula_fk | type: CONSTRAINT --
-- ALTER TABLE public.doc_interessado DROP CONSTRAINT IF EXISTS aula_fk CASCADE;
ALTER TABLE public.doc_interessado ADD CONSTRAINT aula_fk FOREIGN KEY (id_aula)
REFERENCES public.aula (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.titulo | type: TABLE --
-- DROP TABLE IF EXISTS public.titulo CASCADE;
CREATE TABLE public.titulo (
	id serial NOT NULL,
	titulo varchar(50),
	CONSTRAINT titulo_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.titulo OWNER TO postgres;
-- ddl-end --

-- object: public.cargo | type: TABLE --
-- DROP TABLE IF EXISTS public.cargo CASCADE;
CREATE TABLE public.cargo (
	id serial NOT NULL,
	cargo varchar(50),
	CONSTRAINT cargo_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.cargo OWNER TO postgres;
-- ddl-end --

-- object: titulo_fk | type: CONSTRAINT --
-- ALTER TABLE public.docente DROP CONSTRAINT IF EXISTS titulo_fk CASCADE;
ALTER TABLE public.docente ADD CONSTRAINT titulo_fk FOREIGN KEY (id_titulo)
REFERENCES public.titulo (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: cargo_fk | type: CONSTRAINT --
-- ALTER TABLE public.docente DROP CONSTRAINT IF EXISTS cargo_fk CASCADE;
ALTER TABLE public.docente ADD CONSTRAINT cargo_fk FOREIGN KEY (id_cargo)
REFERENCES public.cargo (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


