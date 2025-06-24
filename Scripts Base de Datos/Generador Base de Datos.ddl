-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2025-02-03 17:10:52 CET
--   sitio:      Oracle Database 10g
--   tipo:      Oracle Database 10g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE SEQUENCE seqcategoria START WITH 1 INCREMENT BY 1 MAXVALUE 99 MINVALUE 1 NOCACHE;
CREATE SEQUENCE seqcliente START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;
CREATE SEQUENCE seqdetalle START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;
CREATE SEQUENCE seqjuego START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;
CREATE SEQUENCE seqpedido START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;

CREATE TABLE categoria (
    categoria_id NUMBER(2) NOT NULL,
    nombre       VARCHAR2(20) NOT NULL,
    descripcion  VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( categoria_id );

ALTER TABLE categoria ADD CONSTRAINT categoria__un UNIQUE ( nombre );

CREATE TABLE cliente (
    cliente_id NUMBER(4) NOT NULL,
    nombre     VARCHAR2(20) NOT NULL,
    apellido   VARCHAR2(20) NOT NULL,
    apellido2  VARCHAR2(20),
    contrasena VARCHAR2(100) NOT NULL,
    telefono   CHAR(9) NOT NULL,
    email      VARCHAR2(30) NOT NULL,
    localidad  VARCHAR2(20) NOT NULL,
    ciudad     VARCHAR2(20) NOT NULL,
    calle      VARCHAR2(20) NOT NULL,
    numero     NUMBER(3) NOT NULL
)
LOGGING;

ALTER TABLE cliente ADD CONSTRAINT cliente_ck_1 CHECK ( email LIKE '_%@_%._%' );

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cliente_id );

ALTER TABLE cliente ADD CONSTRAINT cliente__un UNIQUE ( email,
                                                        telefono );

CREATE TABLE detalle_pedido (
    detalle_id NUMBER(4) NOT NULL,
    juego_id   NUMBER(4) NOT NULL,
    pedido_id  NUMBER(4) NOT NULL,
    cantidad   NUMBER(2) NOT NULL
)
LOGGING;

ALTER TABLE detalle_pedido ADD CONSTRAINT detalle_pedido_pk PRIMARY KEY ( detalle_id );

CREATE TABLE juego (
    juego_id          NUMBER(4) NOT NULL,
    codigo            NUMBER(4) NOT NULL,
    nombre            VARCHAR2(30) NOT NULL,
    precio            NUMBER(4, 2) NOT NULL,
    descripcion       VARCHAR2(50) NOT NULL,
    stock             NUMBER(3) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    categoria_id      NUMBER(2) NOT NULL
)
LOGGING;

ALTER TABLE juego ADD CONSTRAINT juego_pk PRIMARY KEY ( juego_id );

ALTER TABLE juego ADD CONSTRAINT producto__un UNIQUE ( codigo );

CREATE TABLE pedido (
    pedido_id     NUMBER(4) NOT NULL,
    fecha_pedido  DATE NOT NULL,
    fecha_entrega DATE,
    estado        CHAR(1) NOT NULL,
    detalles      VARCHAR2(50),
    cliente_id    NUMBER(4) NOT NULL
)
LOGGING;


ALTER TABLE pedido ADD CONSTRAINT pedido_ck_1 CHECK (estado IN ('E', 'P', 'C'));


ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( pedido_id );

ALTER TABLE detalle_pedido
    ADD CONSTRAINT detalle_pedido_juego_fk FOREIGN KEY ( juego_id )
        REFERENCES juego ( juego_id )
    NOT DEFERRABLE;

ALTER TABLE detalle_pedido
    ADD CONSTRAINT detalle_pedido_pedido_fk FOREIGN KEY ( pedido_id )
        REFERENCES pedido ( pedido_id )
    NOT DEFERRABLE;

ALTER TABLE pedido
    ADD CONSTRAINT pedido_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( cliente_id )
    NOT DEFERRABLE;

ALTER TABLE juego
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_id )
        REFERENCES categoria ( categoria_id )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          5
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
