/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     21.01.2019 19:36:50                          */
/*==============================================================*/


alter table CARD
   drop constraint FK_CARD_ARTIST_CA_ARTIST;

alter table CARD
   drop constraint FK_CARD_LANGUAGE__LANGUAGE;

alter table CARD_DESIGN
   drop constraint FK_CARD_DES_CARD_DESI_CARD;

alter table CART
   drop constraint FK_CART_PAYMENT_C_PAYMENT;

alter table CART_ITEM
   drop constraint FK_CART_ITE_CART_CART_CART;

alter table COLOR_CARD
   drop constraint FK_COLOR_CA_COLOR_CAR_CARD;

alter table COLOR_CARD
   drop constraint FK_COLOR_CA_COLOR_CAR_COLOR;

alter table CUSTOMER_CUSTOMER
   drop constraint FK_CUSTOMER_CUSTOMERA_CUSTOMER;

alter table CUSTOMER_CUSTOMER
   drop constraint FK_CUSTOMER_CUSTOMERB_CUSTOMER;

alter table EVENT
   drop constraint FK_EVENT_ADMIN_EVE_ADMIN;

alter table EVENT_CUSTOMER
   drop constraint FK_EVENT_CU_EVENT_CUS_CUSTOMER;

alter table EVENT_CUSTOMER
   drop constraint FK_EVENT_CU_EVENT_CUS_EVENT;

alter table EVENT_PRODUCT
   drop constraint FK_EVENT_PR_EVENT_PRO_EVENT;

alter table MARKETPLACE
   drop constraint FK_MARKETPL_CUSTOMER__CUSTOMER;

alter table NEWS_ADMIN
   drop constraint FK_NEWS_ADM_NEWS_ADMI_ADMIN;

alter table NEWS_ADMIN
   drop constraint FK_NEWS_ADM_NEWS_ADMI_NEWS;

alter table PAYMENT
   drop constraint FK_PAYMENT_CUSTOMER__CUSTOMER;

alter table PAYMENT
   drop constraint FK_PAYMENT_PAYMENT_C_CART;

alter table PRODUCT_CARD
   drop constraint FK_PRODUCT__PRODUCT_C_CARD;

alter table PRODUCT_MERCHE
   drop constraint FK_PRODUCT__PRODUCT_M_MERCHE;

alter table PRODUCT_SET
   drop constraint FK_PRODUCT__PRODUCT_S_SET;

alter table SET_CARD
   drop constraint FK_SET_CARD_SET_CARD_CARD;

alter table SET_CARD
   drop constraint FK_SET_CARD_SET_CARD2_SET;

drop table ADMIN cascade constraints;

drop table ARTIST cascade constraints;

drop index LANGUAGE_CARD_FK;

drop index ARTIST_CARD_FK;

drop table CARD cascade constraints;

drop index CARD_DESIGN_CARD_FK;

drop table CARD_DESIGN cascade constraints;

drop index PAYMENT_CART2_FK;

drop table CART cascade constraints;

drop index CART_CART_ITEM_FK;

drop table CART_ITEM cascade constraints;

drop table COLOR cascade constraints;

drop index COLOR_CARD_FK;

drop index COLOR_CARD2_FK;

drop table COLOR_CARD cascade constraints;

drop table CUSTOMER cascade constraints;

drop index CUSTOMER_CUSTOMER_FK;

drop index CUSTOMER_CUSTOMER2_FK;

drop table CUSTOMER_CUSTOMER cascade constraints;

drop index ADMIN_EVENT_FK;

drop table EVENT cascade constraints;

drop index EVENT_CUSTOMER_FK;

drop index EVENT_CUSTOMER2_FK;

drop table EVENT_CUSTOMER cascade constraints;

drop index EVENT_PRODUCT2_FK;

drop table EVENT_PRODUCT cascade constraints;

drop table LANGUAGE cascade constraints;

drop index CUSTOMER_MARKETPLACE_FK;

drop table MARKETPLACE cascade constraints;

drop table MERCHE cascade constraints;

drop table NEWS cascade constraints;

drop index NEWS_ADMIN_FK;

drop index NEWS_ADMIN2_FK;

drop table NEWS_ADMIN cascade constraints;

drop index PAYMENT_CART_FK;

drop index CUSTOMER_PAYMENT_FK;

drop table PAYMENT cascade constraints;

drop table PRDUCT_GUTACHTEN cascade constraints;

drop index PRODUCT_CARD2_FK;

drop table PRODUCT_CARD cascade constraints;

drop index PRODUCT_MERCHE2_FK;

drop table PRODUCT_MERCHE cascade constraints;

drop index PRODUCT_SET2_FK;

drop table PRODUCT_SET cascade constraints;

drop table "SET" cascade constraints;

drop index SET_CARD_FK;

drop index SET_CARD2_FK;

drop table SET_CARD cascade constraints;

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN (
   ADMIN_ID             INTEGER               not null,
   PERSON_ID            INTEGER               not null,
   constraint PK_ADMIN primary key (ADMIN_ID)
);

/*==============================================================*/
/* Table: ARTIST                                                */
/*==============================================================*/
create table ARTIST (
   ARTIST_ID            INTEGER               not null,
   ARTIST_FIRST_NAME    CLOB                  not null,
   ARTIST_LAST_NAME     CLOB                  not null,
   constraint PK_ARTIST primary key (ARTIST_ID)
);

/*==============================================================*/
/* Table: CARD                                                  */
/*==============================================================*/
create table CARD (
   CARD_ID              INTEGER               not null,
   ARTIST_ID            INTEGER               not null,
   LANGUAGE             CLOB                  not null,
   EVALUATION_ID        INTEGER               not null,
   CONVERTED_MANA_COST  CLOB                  not null,
   CARD_TYPE            CLOB                  not null,
   SUBTYPE              CLOB,
   POWER                CLOB                  not null,
   THOUGNESS            CLOB                  not null,
   RULES                CLOB                  not null,
   RARITY               CLOB                  not null,
   OTHER_CRITERIA       CLOB,
   NUMBER_IN_SET        INTEGER               not null,
   STATE                CLOB,
   constraint PK_CARD primary key (CARD_ID)
);

/*==============================================================*/
/* Index: ARTIST_CARD_FK                                        */
/*==============================================================*/
create index ARTIST_CARD_FK on CARD (
   ARTIST_ID ASC
);

/*==============================================================*/
/* Index: LANGUAGE_CARD_FK                                      */
/*==============================================================*/
create index LANGUAGE_CARD_FK on CARD (
   LANGUAGE ASC
);

/*==============================================================*/
/* Table: CARD_DESIGN                                           */
/*==============================================================*/
create table CARD_DESIGN (
   CARD_ARD_ID          INTEGER               not null,
   CARD_ID              INTEGER               not null,
   IMAGE                CLOB                  not null,
   COVER                CLOB                  not null,
   constraint PK_CARD_DESIGN primary key (CARD_ARD_ID)
);

/*==============================================================*/
/* Index: CARD_DESIGN_CARD_FK                                   */
/*==============================================================*/
create index CARD_DESIGN_CARD_FK on CARD_DESIGN (
   CARD_ID ASC
);

/*==============================================================*/
/* Table: CART                                                  */
/*==============================================================*/
create table CART (
   CART_ID              INTEGER               not null,
   PAYMENT_ID           INTEGER,
   CARD_NAME            CLOB                  not null,
   constraint PK_CART primary key (CART_ID)
);

/*==============================================================*/
/* Index: PAYMENT_CART2_FK                                      */
/*==============================================================*/
create index PAYMENT_CART2_FK on CART (
   PAYMENT_ID ASC
);

/*==============================================================*/
/* Table: CART_ITEM                                             */
/*==============================================================*/
create table CART_ITEM (
   CARD_ITEM_ID         INTEGER               not null,
   CART_ID              INTEGER               not null,
   QUANTITY             CLOB                  not null,
   TOTAL_COST           CLOB                  not null,
   constraint PK_CART_ITEM primary key (CARD_ITEM_ID)
);

/*==============================================================*/
/* Index: CART_CART_ITEM_FK                                     */
/*==============================================================*/
create index CART_CART_ITEM_FK on CART_ITEM (
   CART_ID ASC
);

/*==============================================================*/
/* Table: COLOR                                                 */
/*==============================================================*/
create table COLOR (
   COLOR_NAME           CLOB                  not null,
   constraint PK_COLOR primary key (COLOR_NAME)
);

/*==============================================================*/
/* Table: COLOR_CARD                                            */
/*==============================================================*/
create table COLOR_CARD (
   CARD_ID              INTEGER               not null,
   COLOR_NAME           CLOB                  not null,
   constraint PK_COLOR_CARD primary key (CARD_ID, COLOR_NAME)
);

/*==============================================================*/
/* Index: COLOR_CARD2_FK                                        */
/*==============================================================*/
create index COLOR_CARD2_FK on COLOR_CARD (
   COLOR_NAME ASC
);

/*==============================================================*/
/* Index: COLOR_CARD_FK                                         */
/*==============================================================*/
create index COLOR_CARD_FK on COLOR_CARD (
   CARD_ID ASC
);

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER (
   CUSTOMER_ID          INTEGER               not null,
   PERSON_ID            INTEGER               not null,
   CUSTOMER_RATING      INTEGER,
   constraint PK_CUSTOMER primary key (CUSTOMER_ID)
);

/*==============================================================*/
/* Table: CUSTOMER_CUSTOMER                                     */
/*==============================================================*/
create table CUSTOMER_CUSTOMER (
   CUS_CUSTOMER_ID      INTEGER               not null,
   CUSTOMER_ID          INTEGER               not null,
   constraint PK_CUSTOMER_CUSTOMER primary key (CUS_CUSTOMER_ID, CUSTOMER_ID)
);

/*==============================================================*/
/* Index: CUSTOMER_CUSTOMER2_FK                                 */
/*==============================================================*/
create index CUSTOMER_CUSTOMER2_FK on CUSTOMER_CUSTOMER (
   CUSTOMER_ID ASC
);

/*==============================================================*/
/* Index: CUSTOMER_CUSTOMER_FK                                  */
/*==============================================================*/
create index CUSTOMER_CUSTOMER_FK on CUSTOMER_CUSTOMER (
   CUS_CUSTOMER_ID ASC
);

/*==============================================================*/
/* Table: EVENT                                                 */
/*==============================================================*/
create table EVENT (
   EVENT_ID             INTEGER               not null,
   ADMIN_ID             INTEGER,
   EVENT_NAME           CLOB                  not null,
   EVENT_END_DATE       DATE                  not null,
   EVENT_START_DATE     DATE                  not null,
   EVENT_RABBAT         FLOAT,
   constraint PK_EVENT primary key (EVENT_ID)
);

/*==============================================================*/
/* Index: ADMIN_EVENT_FK                                        */
/*==============================================================*/
create index ADMIN_EVENT_FK on EVENT (
   ADMIN_ID ASC
);

/*==============================================================*/
/* Table: EVENT_CUSTOMER                                        */
/*==============================================================*/
create table EVENT_CUSTOMER (
   CUSTOMER_ID          INTEGER               not null,
   EVENT_ID             INTEGER               not null,
   constraint PK_EVENT_CUSTOMER primary key (CUSTOMER_ID, EVENT_ID)
);

/*==============================================================*/
/* Index: EVENT_CUSTOMER2_FK                                    */
/*==============================================================*/
create index EVENT_CUSTOMER2_FK on EVENT_CUSTOMER (
   EVENT_ID ASC
);

/*==============================================================*/
/* Index: EVENT_CUSTOMER_FK                                     */
/*==============================================================*/
create index EVENT_CUSTOMER_FK on EVENT_CUSTOMER (
   CUSTOMER_ID ASC
);

/*==============================================================*/
/* Table: EVENT_PRODUCT                                         */
/*==============================================================*/
create table EVENT_PRODUCT (
   PRODUCT_ID           INTEGER               not null,
   EVENT_ID             INTEGER               not null,
   constraint PK_EVENT_PRODUCT primary key (PRODUCT_ID, EVENT_ID)
);

/*==============================================================*/
/* Index: EVENT_PRODUCT2_FK                                     */
/*==============================================================*/
create index EVENT_PRODUCT2_FK on EVENT_PRODUCT (
   EVENT_ID ASC
);

/*==============================================================*/
/* Table: LANGUAGE                                              */
/*==============================================================*/
create table LANGUAGE (
   LANGUAGE             CLOB                  not null,
   constraint PK_LANGUAGE primary key (LANGUAGE)
);

/*==============================================================*/
/* Table: MARKETPLACE                                           */
/*==============================================================*/
create table MARKETPLACE (
   MARKETPLACE_ID       INTEGER               not null,
   CUSTOMER_ID          INTEGER               not null,
   MARKETPLACE_NAME     CLOB                  not null,
   MARKETPLACE_RATING   INTEGER,
   constraint PK_MARKETPLACE primary key (MARKETPLACE_ID)
);

/*==============================================================*/
/* Index: CUSTOMER_MARKETPLACE_FK                               */
/*==============================================================*/
create index CUSTOMER_MARKETPLACE_FK on MARKETPLACE (
   CUSTOMER_ID ASC
);

/*==============================================================*/
/* Table: MERCHE                                                */
/*==============================================================*/
create table MERCHE (
   MERCHE_ID            INTEGER               not null,
   MERCHE_NAME          CLOB                  not null,
   MERCHE_TYPE          CLOB                  not null,
   constraint PK_MERCHE primary key (MERCHE_ID)
);

/*==============================================================*/
/* Table: NEWS                                                  */
/*==============================================================*/
create table NEWS (
   NEWS_ID              CLOB                  not null,
   NEWS_START_DATE      DATE                  not null,
   NEWS_END_DATE        DATE                  not null,
   MESSAGE              CLOB,
   constraint PK_NEWS primary key (NEWS_ID)
);

/*==============================================================*/
/* Table: NEWS_ADMIN                                            */
/*==============================================================*/
create table NEWS_ADMIN (
   ADMIN_ID             INTEGER               not null,
   NEWS_ID              CLOB                  not null,
   constraint PK_NEWS_ADMIN primary key (ADMIN_ID, NEWS_ID)
);

/*==============================================================*/
/* Index: NEWS_ADMIN2_FK                                        */
/*==============================================================*/
create index NEWS_ADMIN2_FK on NEWS_ADMIN (
   NEWS_ID ASC
);

/*==============================================================*/
/* Index: NEWS_ADMIN_FK                                         */
/*==============================================================*/
create index NEWS_ADMIN_FK on NEWS_ADMIN (
   ADMIN_ID ASC
);

/*==============================================================*/
/* Table: PAYMENT                                               */
/*==============================================================*/
create table PAYMENT (
   PAYMENT_ID           INTEGER               not null,
   CUSTOMER_ID          INTEGER               not null,
   CART_ID              INTEGER               not null,
   AMOUNT               INTEGER               not null,
   PAYMENT_TYPE         CLOB                  not null,
   "DATE"               DATE                  not null,
   STATUS               CLOB                  not null,
   constraint PK_PAYMENT primary key (PAYMENT_ID)
);

/*==============================================================*/
/* Index: CUSTOMER_PAYMENT_FK                                   */
/*==============================================================*/
create index CUSTOMER_PAYMENT_FK on PAYMENT (
   CUSTOMER_ID ASC
);

/*==============================================================*/
/* Index: PAYMENT_CART_FK                                       */
/*==============================================================*/
create index PAYMENT_CART_FK on PAYMENT (
   CART_ID ASC
);

/*==============================================================*/
/* Table: PRDUCT_GUTACHTEN                                      */
/*==============================================================*/
create table PRDUCT_GUTACHTEN (
   PRODUCT_ID           INTEGER               not null,
   EVALUATION_ID        INTEGER               not null,
   constraint PK_PRDUCT_GUTACHTEN primary key (PRODUCT_ID, EVALUATION_ID)
);

/*==============================================================*/
/* Table: PRODUCT_CARD                                          */
/*==============================================================*/
create table PRODUCT_CARD (
   PRODUCT_ID           INTEGER               not null,
   CARD_ID              INTEGER               not null,
   constraint PK_PRODUCT_CARD primary key (PRODUCT_ID, CARD_ID)
);

/*==============================================================*/
/* Index: PRODUCT_CARD2_FK                                      */
/*==============================================================*/
create index PRODUCT_CARD2_FK on PRODUCT_CARD (
   CARD_ID ASC
);

/*==============================================================*/
/* Table: PRODUCT_MERCHE                                        */
/*==============================================================*/
create table PRODUCT_MERCHE (
   PRODUCT_ID           INTEGER               not null,
   MERCHE_ID            INTEGER               not null,
   constraint PK_PRODUCT_MERCHE primary key (PRODUCT_ID, MERCHE_ID)
);

/*==============================================================*/
/* Index: PRODUCT_MERCHE2_FK                                    */
/*==============================================================*/
create index PRODUCT_MERCHE2_FK on PRODUCT_MERCHE (
   MERCHE_ID ASC
);

/*==============================================================*/
/* Table: PRODUCT_SET                                           */
/*==============================================================*/
create table PRODUCT_SET (
   PRODUCT_ID           INTEGER               not null,
   SET_ID               INTEGER               not null,
   constraint PK_PRODUCT_SET primary key (PRODUCT_ID, SET_ID)
);

/*==============================================================*/
/* Index: PRODUCT_SET2_FK                                       */
/*==============================================================*/
create index PRODUCT_SET2_FK on PRODUCT_SET (
   SET_ID ASC
);

/*==============================================================*/
/* Table: "SET"                                                 */
/*==============================================================*/
create table "SET" (
   SET_ID               INTEGER               not null,
   MAX_CARDS            INTEGER               not null,
   SET_NAME             CLOB                  not null,
   constraint PK_SET primary key (SET_ID)
);

/*==============================================================*/
/* Table: SET_CARD                                              */
/*==============================================================*/
create table SET_CARD (
   CARD_ID              INTEGER               not null,
   SET_ID               INTEGER               not null,
   constraint PK_SET_CARD primary key (CARD_ID, SET_ID)
);

/*==============================================================*/
/* Index: SET_CARD2_FK                                          */
/*==============================================================*/
create index SET_CARD2_FK on SET_CARD (
   SET_ID ASC
);

/*==============================================================*/
/* Index: SET_CARD_FK                                           */
/*==============================================================*/
create index SET_CARD_FK on SET_CARD (
   CARD_ID ASC
);

alter table CARD
   add constraint FK_CARD_ARTIST_CA_ARTIST foreign key (ARTIST_ID)
      references ARTIST (ARTIST_ID);

alter table CARD
   add constraint FK_CARD_LANGUAGE__LANGUAGE foreign key (LANGUAGE)
      references LANGUAGE (LANGUAGE);

alter table CARD_DESIGN
   add constraint FK_CARD_DES_CARD_DESI_CARD foreign key (CARD_ID)
      references CARD (CARD_ID);

alter table CART
   add constraint FK_CART_PAYMENT_C_PAYMENT foreign key (PAYMENT_ID)
      references PAYMENT (PAYMENT_ID);

alter table CART_ITEM
   add constraint FK_CART_ITE_CART_CART_CART foreign key (CART_ID)
      references CART (CART_ID);

alter table COLOR_CARD
   add constraint FK_COLOR_CA_COLOR_CAR_CARD foreign key (CARD_ID)
      references CARD (CARD_ID);

alter table COLOR_CARD
   add constraint FK_COLOR_CA_COLOR_CAR_COLOR foreign key (COLOR_NAME)
      references COLOR (COLOR_NAME);

alter table CUSTOMER_CUSTOMER
   add constraint FK_CUSTOMER_CUSTOMERA_CUSTOMER foreign key (CUS_CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID);

alter table CUSTOMER_CUSTOMER
   add constraint FK_CUSTOMER_CUSTOMERB_CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID);

alter table EVENT
   add constraint FK_EVENT_ADMIN_EVE_ADMIN foreign key (ADMIN_ID)
      references ADMIN (ADMIN_ID);

alter table EVENT_CUSTOMER
   add constraint FK_EVENT_CU_EVENT_CUS_CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID);

alter table EVENT_CUSTOMER
   add constraint FK_EVENT_CU_EVENT_CUS_EVENT foreign key (EVENT_ID)
      references EVENT (EVENT_ID);

alter table EVENT_PRODUCT
   add constraint FK_EVENT_PR_EVENT_PRO_EVENT foreign key (EVENT_ID)
      references EVENT (EVENT_ID);

alter table MARKETPLACE
   add constraint FK_MARKETPL_CUSTOMER__CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID);

alter table NEWS_ADMIN
   add constraint FK_NEWS_ADM_NEWS_ADMI_ADMIN foreign key (ADMIN_ID)
      references ADMIN (ADMIN_ID);

alter table NEWS_ADMIN
   add constraint FK_NEWS_ADM_NEWS_ADMI_NEWS foreign key (NEWS_ID)
      references NEWS (NEWS_ID);

alter table PAYMENT
   add constraint FK_PAYMENT_CUSTOMER__CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID);

alter table PAYMENT
   add constraint FK_PAYMENT_PAYMENT_C_CART foreign key (CART_ID)
      references CART (CART_ID);

alter table PRODUCT_CARD
   add constraint FK_PRODUCT__PRODUCT_C_CARD foreign key (CARD_ID)
      references CARD (CARD_ID);

alter table PRODUCT_MERCHE
   add constraint FK_PRODUCT__PRODUCT_M_MERCHE foreign key (MERCHE_ID)
      references MERCHE (MERCHE_ID);

alter table PRODUCT_SET
   add constraint FK_PRODUCT__PRODUCT_S_SET foreign key (SET_ID)
      references "SET" (SET_ID);

alter table SET_CARD
   add constraint FK_SET_CARD_SET_CARD_CARD foreign key (CARD_ID)
      references CARD (CARD_ID);

alter table SET_CARD
   add constraint FK_SET_CARD_SET_CARD2_SET foreign key (SET_ID)
      references "SET" (SET_ID);

