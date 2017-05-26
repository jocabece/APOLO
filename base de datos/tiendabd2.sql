/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     26/05/2017 09:17:54 a.m.                     */
/*==============================================================*/


drop index CATEGORIA_PK;

drop table CATEGORIA;

drop index CLAVES_PK;

drop table CLAVES;

drop index RELATIONSHIP_10_FK;

drop index COMPRA_PK;

drop table COMPRA;

drop index RELATIONSHIP_12_FK;

drop index RELATIONSHIP_11_FK;

drop index DETCOMPRA_PK;

drop table DETCOMPRA;

drop index RELATIONSHIP_5_FK;

drop index RELATIONSHIP_4_FK;

drop index DETFACTURA_PK;

drop table DETFACTURA;

drop index RELATIONSHIP_9_FK;

drop index RELATIONSHIP_8_FK;

drop index DETPEDIDO_PK;

drop table DETPEDIDO;

drop index RELATIONSHIP_7_FK;

drop index RELATIONSHIP_6_FK;

drop index DETSHIP_PK;

drop table DETSHIP;

drop index RELATIONSHIP_13_FK;

drop index RELATIONSHIP_3_FK;

drop index FACTURA_PK;

drop table FACTURA;

drop index PEDIDO_PK;

drop table PEDIDO;

drop index RELATIONSHIP_1_FK;

drop index PRODUCTO_PK;

drop table PRODUCTO;

drop index PROVEEDOR_PK;

drop table PROVEEDOR;

drop index SHIP_PK;

drop table SHIP;

drop index USUARIO_PK;

drop table USUARIO;

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA (
   CODC                 INT4                 not null,
   DESCRIPCION          TEXT                 null,
   NOMBRECATEG          CHAR(60)             null,
   constraint PK_CATEGORIA primary key (CODC)
);

/*==============================================================*/
/* Index: CATEGORIA_PK                                          */
/*==============================================================*/
create unique index CATEGORIA_PK on CATEGORIA (
CODC
);

/*==============================================================*/
/* Table: CLAVES                                                */
/*==============================================================*/
create table CLAVES (
   CLAVEDOSIFICACION    CHAR(256)            not null,
   FECHAINI             DATE                 null,
   FECHAFIN             DATE                 null,
   constraint PK_CLAVES primary key (CLAVEDOSIFICACION)
);

/*==============================================================*/
/* Index: CLAVES_PK                                             */
/*==============================================================*/
create unique index CLAVES_PK on CLAVES (
CLAVEDOSIFICACION
);

/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA (
   CODCOMPRA            INT4                 not null,
   NIT                  INT4                 null,
   FECHACOMPRA          DATE                 null,
   constraint PK_COMPRA primary key (CODCOMPRA)
);

/*==============================================================*/
/* Index: COMPRA_PK                                             */
/*==============================================================*/
create unique index COMPRA_PK on COMPRA (
CODCOMPRA
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on COMPRA (
NIT
);

/*==============================================================*/
/* Table: DETCOMPRA                                             */
/*==============================================================*/
create table DETCOMPRA (
   CODDETC              INT4                 not null,
   CODCOMPRA            INT4                 null,
   CODPRODUCTO          INT4                 null,
   CANTDETC             INT4                 null,
   constraint PK_DETCOMPRA primary key (CODDETC)
);

/*==============================================================*/
/* Index: DETCOMPRA_PK                                          */
/*==============================================================*/
create unique index DETCOMPRA_PK on DETCOMPRA (
CODDETC
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on DETCOMPRA (
CODCOMPRA
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on DETCOMPRA (
CODPRODUCTO
);

/*==============================================================*/
/* Table: DETFACTURA                                            */
/*==============================================================*/
create table DETFACTURA (
   CODDETF              INT4                 not null,
   CODPRODUCTO          INT4                 null,
   NROFACTURA           INT4                 null,
   NROAUTORIZACION      INT4                 null,
   CANTDETF             INT4                 null,
   constraint PK_DETFACTURA primary key (CODDETF)
);

/*==============================================================*/
/* Index: DETFACTURA_PK                                         */
/*==============================================================*/
create unique index DETFACTURA_PK on DETFACTURA (
CODDETF
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on DETFACTURA (
CODPRODUCTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on DETFACTURA (
NROFACTURA,
NROAUTORIZACION
);

/*==============================================================*/
/* Table: DETPEDIDO                                             */
/*==============================================================*/
create table DETPEDIDO (
   CODDETP              INT4                 not null,
   CODPEDIDO            INT4                 null,
   CODPRODUCTO          INT4                 null,
   CANTDETP             INT4                 null,
   constraint PK_DETPEDIDO primary key (CODDETP)
);

/*==============================================================*/
/* Index: DETPEDIDO_PK                                          */
/*==============================================================*/
create unique index DETPEDIDO_PK on DETPEDIDO (
CODDETP
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on DETPEDIDO (
CODPEDIDO
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on DETPEDIDO (
CODPRODUCTO
);

/*==============================================================*/
/* Table: DETSHIP                                               */
/*==============================================================*/
create table DETSHIP (
   CODDETS              INT4                 not null,
   CODS                 INT4                 null,
   NROFACTURA           INT4                 null,
   NROAUTORIZACION      INT4                 null,
   COSTO                DECIMAL(10,2)        null,
   constraint PK_DETSHIP primary key (CODDETS)
);

/*==============================================================*/
/* Index: DETSHIP_PK                                            */
/*==============================================================*/
create unique index DETSHIP_PK on DETSHIP (
CODDETS
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on DETSHIP (
CODS
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on DETSHIP (
NROFACTURA,
NROAUTORIZACION
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   NROFACTURA           INT4                 not null,
   NROAUTORIZACION      INT4                 not null,
   CLAVEDOSIFICACION    CHAR(256)            null,
   CODUSUARIO           INT4                 null,
   ESTADO               BOOL                 null,
   FECHAFACTURA         DATE                 null,
   constraint PK_FACTURA primary key (NROFACTURA, NROAUTORIZACION)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
NROFACTURA,
NROAUTORIZACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on FACTURA (
CLAVEDOSIFICACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on FACTURA (
CODUSUARIO
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO (
   CODPEDIDO            INT4                 not null,
   FECHAPEDIDO          DATE                 null,
   constraint PK_PEDIDO primary key (CODPEDIDO)
);

/*==============================================================*/
/* Index: PEDIDO_PK                                             */
/*==============================================================*/
create unique index PEDIDO_PK on PEDIDO (
CODPEDIDO
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   CODPRODUCTO          INT4                 not null,
   CODC                 INT4                 null,
   PRECIOC              DECIMAL(10,2)        null,
   PRECIOV              DECIMAL(10,2)        null,
   CANTIDAD             INT4                 null,
   IMAGEN               CHAR(254)            null,
   DESCRIPCIONP         CHAR(256)            null,
   NOMBREPROD           CHAR(60)             null,
   constraint PK_PRODUCTO primary key (CODPRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
CODPRODUCTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on PRODUCTO (
CODC
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   NIT                  INT4                 not null,
   DIRECCION            CHAR(256)            null,
   TELEFONO             INT4                 null,
   constraint PK_PROVEEDOR primary key (NIT)
);

/*==============================================================*/
/* Index: PROVEEDOR_PK                                          */
/*==============================================================*/
create unique index PROVEEDOR_PK on PROVEEDOR (
NIT
);

/*==============================================================*/
/* Table: SHIP                                                  */
/*==============================================================*/
create table SHIP (
   CODS                 INT4                 not null,
   DIRECCIONSHIP        CHAR(256)            null,
   constraint PK_SHIP primary key (CODS)
);

/*==============================================================*/
/* Index: SHIP_PK                                               */
/*==============================================================*/
create unique index SHIP_PK on SHIP (
CODS
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   CODUSUARIO           INT4                 not null,
   NOMBREUSUARIO        CHAR(60)             null,
   PASSWORD             CHAR(256)            null,
   CI                   INT4                 null,
   TIPO                 BOOL                 null,
   STAFF                BOOL                 null,
   ADMI                 BOOL                 null,
   constraint PK_USUARIO primary key (CODUSUARIO)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
CODUSUARIO
);

alter table COMPRA
   add constraint FK_COMPRA_RELATIONS_PROVEEDO foreign key (NIT)
      references PROVEEDOR (NIT)
      on delete restrict on update restrict;

alter table DETCOMPRA
   add constraint FK_DETCOMPR_RELATIONS_COMPRA foreign key (CODCOMPRA)
      references COMPRA (CODCOMPRA)
      on delete restrict on update restrict;

alter table DETCOMPRA
   add constraint FK_DETCOMPR_RELATIONS_PRODUCTO foreign key (CODPRODUCTO)
      references PRODUCTO (CODPRODUCTO)
      on delete restrict on update restrict;

alter table DETFACTURA
   add constraint FK_DETFACTU_RELATIONS_PRODUCTO foreign key (CODPRODUCTO)
      references PRODUCTO (CODPRODUCTO)
      on delete restrict on update restrict;

alter table DETFACTURA
   add constraint FK_DETFACTU_RELATIONS_FACTURA foreign key (NROFACTURA, NROAUTORIZACION)
      references FACTURA (NROFACTURA, NROAUTORIZACION)
      on delete restrict on update restrict;

alter table DETPEDIDO
   add constraint FK_DETPEDID_RELATIONS_PEDIDO foreign key (CODPEDIDO)
      references PEDIDO (CODPEDIDO)
      on delete restrict on update restrict;

alter table DETPEDIDO
   add constraint FK_DETPEDID_RELATIONS_PRODUCTO foreign key (CODPRODUCTO)
      references PRODUCTO (CODPRODUCTO)
      on delete restrict on update restrict;

alter table DETSHIP
   add constraint FK_DETSHIP_RELATIONS_SHIP foreign key (CODS)
      references SHIP (CODS)
      on delete restrict on update restrict;

alter table DETSHIP
   add constraint FK_DETSHIP_RELATIONS_FACTURA foreign key (NROFACTURA, NROAUTORIZACION)
      references FACTURA (NROFACTURA, NROAUTORIZACION)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_USUARIO foreign key (CODUSUARIO)
      references USUARIO (CODUSUARIO)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_CLAVES foreign key (CLAVEDOSIFICACION)
      references CLAVES (CLAVEDOSIFICACION)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_RELATIONS_CATEGORI foreign key (CODC)
      references CATEGORIA (CODC)
      on delete restrict on update restrict;

