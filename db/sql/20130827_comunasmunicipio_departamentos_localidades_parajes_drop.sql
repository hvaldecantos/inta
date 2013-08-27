--
-- PostgreSQL database dump
--

ALTER TABLE ONLY public.parajes DROP CONSTRAINT parajes_pkey;
ALTER TABLE ONLY public.localidades DROP CONSTRAINT localidades_pkey;
ALTER TABLE ONLY public.departamentos DROP CONSTRAINT departamentos_pkey;
ALTER TABLE ONLY public.comunas_municipios DROP CONSTRAINT comunas_municipios_pkey;
DROP TABLE public.parajes;
DROP TABLE public.localidades;
DROP TABLE public.departamentos;
DROP TABLE public.comunas_municipios;
