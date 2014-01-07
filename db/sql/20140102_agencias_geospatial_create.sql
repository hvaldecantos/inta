--
-- PostgreSQL database dump
--

--
-- Name: agencias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE agencias (
    id serial NOT NULL,
    codigo integer,
    nombre character varying(255),
    domicilio character varying(255),
    telefono_fijo character varying(255),
    telefono_celular character varying(255),
    email character varying(255),
    comuna_municipio_id integer,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 22173))
);

--
-- Name: agencias_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY agencias
    ADD CONSTRAINT agencias_pkey PRIMARY KEY (id);

--
-- PostgreSQL database dump complete
--

