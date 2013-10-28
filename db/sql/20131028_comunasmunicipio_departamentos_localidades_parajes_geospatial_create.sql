--
-- PostgreSQL database dump
--

--
-- Name: comunas_municipios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comunas_municipios (
    nombre character varying(255),
    categoria character varying(255),
    provincia_id integer,
    departamento_id_base integer,
    id_base integer,
    fuente character varying(255),
    agencia_id integer,
    departamento_id integer,
    id integer NOT NULL,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 22173))
);


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE departamentos (
    provincia_id integer,
    id_base integer,
    id integer NOT NULL,
    nombre character varying(255),
    cabecera character varying(255),
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 22173))
);


--
-- Name: localidades; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE localidades (
    nombre character varying(255),
    provincia_id integer,
    pobla_2001 double precision,
    id integer NOT NULL,
    the_geom geometry,
    departamento_id integer,
    id_base integer,
    comuna_municipio_id integer,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 22173))
);


--
-- Name: parajes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parajes (
    id integer NOT NULL,
    nombre character varying(255),
    localidad_id integer,
    tipo character varying(255),
    departamento_id integer,
    the_geom geometry,
    comuna_municipio_id integer,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 22173))
);


--
-- Name: comunas_municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comunas_municipios
    ADD CONSTRAINT comunas_municipios_pkey PRIMARY KEY (id);


--
-- Name: departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- Name: localidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY localidades
    ADD CONSTRAINT localidades_pkey PRIMARY KEY (id);


--
-- Name: parajes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parajes
    ADD CONSTRAINT parajes_pkey PRIMARY KEY (id);

--
-- PostgreSQL database dump complete
--

