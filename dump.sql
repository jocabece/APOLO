--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categoria (
    codc integer NOT NULL,
    descripcion text,
    nombrecateg character(60)
);


ALTER TABLE categoria OWNER TO postgres;

--
-- Name: claves; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE claves (
    clavedosificacion character(256) NOT NULL,
    fechaini date,
    fechafin date
);


ALTER TABLE claves OWNER TO postgres;

--
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE compra (
    codcompra integer NOT NULL,
    nit integer,
    fechacompra date
);


ALTER TABLE compra OWNER TO postgres;

--
-- Name: detcompra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detcompra (
    coddetc integer NOT NULL,
    codcompra integer,
    codproducto integer,
    cantdetc integer
);


ALTER TABLE detcompra OWNER TO postgres;

--
-- Name: detfactura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detfactura (
    coddetf integer NOT NULL,
    codproducto integer,
    nrofactura integer,
    nroautorizacion integer,
    cantdetf integer
);


ALTER TABLE detfactura OWNER TO postgres;

--
-- Name: detpedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detpedido (
    coddetp integer NOT NULL,
    codpedido integer,
    codproducto integer,
    cantdetp integer
);


ALTER TABLE detpedido OWNER TO postgres;

--
-- Name: detship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detship (
    coddets character(10) NOT NULL,
    cods integer,
    nrofactura integer,
    nroautorizacion integer,
    costo numeric(10,2)
);


ALTER TABLE detship OWNER TO postgres;

--
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE factura (
    nrofactura integer NOT NULL,
    nroautorizacion integer NOT NULL,
    clavedosificacion character(256),
    codusuario integer,
    estado boolean,
    fechafactura date
);


ALTER TABLE factura OWNER TO postgres;

--
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pedido (
    codpedido integer NOT NULL,
    fechapedido date
);


ALTER TABLE pedido OWNER TO postgres;

--
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE producto (
    codproducto integer NOT NULL,
    codc integer,
    precioc numeric(10,2),
    preciov numeric(10,2),
    cantidad integer,
    imagen character(254),
    descripcionp character(256),
    nombreprod character(60)
);


ALTER TABLE producto OWNER TO postgres;

--
-- Name: proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proveedor (
    nit integer NOT NULL,
    direccion character(256),
    telefono integer
);


ALTER TABLE proveedor OWNER TO postgres;

--
-- Name: ship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ship (
    cods integer NOT NULL,
    direccionship character(256)
);


ALTER TABLE ship OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    codusuario integer NOT NULL,
    nombreusuario character(60),
    password character(256),
    ci integer,
    tipo boolean,
    staff boolean,
    admi boolean
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categoria VALUES (11, 'Bebidas alcohólicas y gaseosas.', 'Bebidas                                                     ');
INSERT INTO categoria VALUES (22, '', 'Frutas y verduras                                           ');
INSERT INTO categoria VALUES (33, '', 'Cereales y semillas                                         ');
INSERT INTO categoria VALUES (44, '', 'Snacks                                                      ');
INSERT INTO categoria VALUES (55, '', 'Helados                                                     ');
INSERT INTO categoria VALUES (66, '', 'Comida para perros                                          ');
INSERT INTO categoria VALUES (77, '', 'Abarrotes                                                   ');


--
-- Data for Name: claves; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: detcompra; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: detfactura; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: detpedido; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: detship; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO producto VALUES (111, 11, 10.00, 15.00, 500, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Cerveza Huari                                               ');
INSERT INTO producto VALUES (112, 11, 9.00, 12.00, 500, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Cerveza Paceña                                              ');
INSERT INTO producto VALUES (113, 11, 10.00, 15.00, 300, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Cerveza Heineken                                            ');
INSERT INTO producto VALUES (114, 11, 9.00, 11.00, 1000, '                                                                                                                                                                                                                                                              ', 'Botella                                                                                                                                                                                                                                                         ', 'Coca-Cola                                                   ');
INSERT INTO producto VALUES (115, 11, 8.00, 10.00, 100, '                                                                                                                                                                                                                                                              ', 'Lata                                                                                                                                                                                                                                                            ', 'Coca-Cola                                                   ');
INSERT INTO producto VALUES (116, 11, 75.00, 80.00, 100, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Vodka                                                       ');
INSERT INTO producto VALUES (221, 22, 5.00, 8.00, 50, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Latas de maiz                                               ');
INSERT INTO producto VALUES (222, 22, 0.50, 2.00, 200, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Manzana                                                     ');
INSERT INTO producto VALUES (223, 22, 1.00, 2.50, 50, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Pera                                                        ');
INSERT INTO producto VALUES (224, 22, 8.00, 10.00, 50, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Piña                                                        ');
INSERT INTO producto VALUES (225, 22, 0.10, 0.50, 800, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Platano                                                     ');
INSERT INTO producto VALUES (331, 33, 20.00, 23.00, 200, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Zucaritas                                                   ');
INSERT INTO producto VALUES (332, 33, 18.00, 22.00, 70, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Nuez                                                        ');
INSERT INTO producto VALUES (441, 44, 1.00, 2.00, 700, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Oreo                                                        ');
INSERT INTO producto VALUES (442, 44, 12.00, 15.00, 200, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Pringles                                                    ');
INSERT INTO producto VALUES (443, 44, 1.00, 2.00, 100, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Bizcochos                                                   ');
INSERT INTO producto VALUES (551, 55, 1.50, 3.00, 500, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Helado                                                      ');
INSERT INTO producto VALUES (661, 66, 100.00, 110.00, 50, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Comida para perros                                          ');
INSERT INTO producto VALUES (771, 77, 8.00, 10.00, 100, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Aceite                                                      ');
INSERT INTO producto VALUES (772, 77, 7.00, 9.00, 100, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Vinagre                                                     ');
INSERT INTO producto VALUES (773, 77, 5.00, 7.00, 200, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Fideo                                                       ');
INSERT INTO producto VALUES (774, 77, 5.00, 7.00, 200, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Azucar                                                      ');
INSERT INTO producto VALUES (775, 77, 0.10, 0.30, 1000, '                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                ', 'Huevos                                                      ');


--
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ship; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: categoria pk_categoria; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT pk_categoria PRIMARY KEY (codc);


--
-- Name: claves pk_claves; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY claves
    ADD CONSTRAINT pk_claves PRIMARY KEY (clavedosificacion);


--
-- Name: compra pk_compra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT pk_compra PRIMARY KEY (codcompra);


--
-- Name: detcompra pk_detcompra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detcompra
    ADD CONSTRAINT pk_detcompra PRIMARY KEY (coddetc);


--
-- Name: detfactura pk_detfactura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detfactura
    ADD CONSTRAINT pk_detfactura PRIMARY KEY (coddetf);


--
-- Name: detpedido pk_detpedido; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detpedido
    ADD CONSTRAINT pk_detpedido PRIMARY KEY (coddetp);


--
-- Name: detship pk_detship; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detship
    ADD CONSTRAINT pk_detship PRIMARY KEY (coddets);


--
-- Name: factura pk_factura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura
    ADD CONSTRAINT pk_factura PRIMARY KEY (nrofactura, nroautorizacion);


--
-- Name: pedido pk_pedido; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pk_pedido PRIMARY KEY (codpedido);


--
-- Name: producto pk_producto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT pk_producto PRIMARY KEY (codproducto);


--
-- Name: proveedor pk_proveedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT pk_proveedor PRIMARY KEY (nit);


--
-- Name: ship pk_ship; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ship
    ADD CONSTRAINT pk_ship PRIMARY KEY (cods);


--
-- Name: usuario pk_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (codusuario);


--
-- Name: categoria_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX categoria_pk ON categoria USING btree (codc);


--
-- Name: claves_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX claves_pk ON claves USING btree (clavedosificacion);


--
-- Name: compra_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX compra_pk ON compra USING btree (codcompra);


--
-- Name: detcompra_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX detcompra_pk ON detcompra USING btree (coddetc);


--
-- Name: detfactura_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX detfactura_pk ON detfactura USING btree (coddetf);


--
-- Name: detpedido_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX detpedido_pk ON detpedido USING btree (coddetp);


--
-- Name: detship_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX detship_pk ON detship USING btree (coddets);


--
-- Name: factura_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX factura_pk ON factura USING btree (nrofactura, nroautorizacion);


--
-- Name: pedido_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pedido_pk ON pedido USING btree (codpedido);


--
-- Name: producto_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX producto_pk ON producto USING btree (codproducto);


--
-- Name: proveedor_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX proveedor_pk ON proveedor USING btree (nit);


--
-- Name: relationship_10_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_10_fk ON compra USING btree (nit);


--
-- Name: relationship_11_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_11_fk ON detcompra USING btree (codcompra);


--
-- Name: relationship_12_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_12_fk ON detcompra USING btree (codproducto);


--
-- Name: relationship_1_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_1_fk ON producto USING btree (codc);


--
-- Name: relationship_3_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_3_fk ON factura USING btree (clavedosificacion);


--
-- Name: relationship_4_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_4_fk ON detfactura USING btree (codproducto);


--
-- Name: relationship_5_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_5_fk ON detfactura USING btree (nrofactura, nroautorizacion);


--
-- Name: relationship_6_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_6_fk ON detship USING btree (cods);


--
-- Name: relationship_7_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_7_fk ON detship USING btree (nrofactura, nroautorizacion);


--
-- Name: relationship_8_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_8_fk ON detpedido USING btree (codpedido);


--
-- Name: relationship_9_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_9_fk ON detpedido USING btree (codproducto);


--
-- Name: ship_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ship_pk ON ship USING btree (cods);


--
-- Name: usuario_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuario_pk ON usuario USING btree (codusuario);


--
-- Name: compra fk_compra_relations_proveedo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT fk_compra_relations_proveedo FOREIGN KEY (nit) REFERENCES proveedor(nit) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: detcompra fk_detcompr_relations_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detcompra
    ADD CONSTRAINT fk_detcompr_relations_compra FOREIGN KEY (codcompra) REFERENCES compra(codcompra) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: detcompra fk_detcompr_relations_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detcompra
    ADD CONSTRAINT fk_detcompr_relations_producto FOREIGN KEY (codproducto) REFERENCES producto(codproducto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: detfactura fk_detfactu_relations_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detfactura
    ADD CONSTRAINT fk_detfactu_relations_factura FOREIGN KEY (nrofactura, nroautorizacion) REFERENCES factura(nrofactura, nroautorizacion) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: detfactura fk_detfactu_relations_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detfactura
    ADD CONSTRAINT fk_detfactu_relations_producto FOREIGN KEY (codproducto) REFERENCES producto(codproducto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: detpedido fk_detpedid_relations_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detpedido
    ADD CONSTRAINT fk_detpedid_relations_pedido FOREIGN KEY (codpedido) REFERENCES pedido(codpedido) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: detship fk_detship_relations_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detship
    ADD CONSTRAINT fk_detship_relations_factura FOREIGN KEY (nrofactura, nroautorizacion) REFERENCES factura(nrofactura, nroautorizacion) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: detship fk_detship_relations_ship; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detship
    ADD CONSTRAINT fk_detship_relations_ship FOREIGN KEY (cods) REFERENCES ship(cods) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: factura fk_factura_relations_claves; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura
    ADD CONSTRAINT fk_factura_relations_claves FOREIGN KEY (clavedosificacion) REFERENCES claves(clavedosificacion) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: factura fk_factura_relations_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura
    ADD CONSTRAINT fk_factura_relations_usuario FOREIGN KEY (codusuario) REFERENCES usuario(codusuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: producto fk_producto_relations_categori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT fk_producto_relations_categori FOREIGN KEY (codc) REFERENCES categoria(codc) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

