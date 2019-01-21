/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     21.01.2019 19:29:08                          */
/*==============================================================*/


drop table if exists ADMIN;

drop table if exists ARTIST;

drop table if exists CARD;

drop table if exists CARD_DESIGN;

drop table if exists CART;

drop table if exists CART_ITEM;

drop table if exists COLOR;

drop table if exists COLOR_CARD;

drop table if exists CUSTOMER;

drop table if exists CUSTOMER_CUSTOMER;

drop table if exists EVENT;

drop table if exists EVENT_CUSTOMER;

drop table if exists EVENT_PRODUCT;

drop table if exists LANGUAGE;

drop table if exists MARKETPLACE;

drop table if exists MERCHE;

drop table if exists NEWS;

drop table if exists NEWS_ADMIN;

drop table if exists PAYMENT;

drop table if exists PRDUCT_GUTACHTEN;

drop table if exists PRODUCT_CARD;

drop table if exists PRODUCT_MERCHE;

drop table if exists PRODUCT_SET;

drop table if exists "SET";

drop table if exists SET_CARD;

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN
(
   ADMIN_ID             int not null,
   PERSON_ID            int not null,
   primary key (ADMIN_ID)
);

/*==============================================================*/
/* Table: ARTIST                                                */
/*==============================================================*/
create table ARTIST
(
   ARTIST_ID            int not null,
   ARTIST_FIRST_NAME    text not null,
   ARTIST_LAST_NAME     text not null,
   primary key (ARTIST_ID)
);

/*==============================================================*/
/* Table: CARD                                                  */
/*==============================================================*/
create table CARD
(
   CARD_ID              int not null,
   ARTIST_ID            int not null,
   LANGUAGE             text not null,
   EVALUATION_ID        int not null,
   CONVERTED_MANA_COST  text not null,
   CARD_TYPE            text not null,
   SUBTYPE              text,
   POWER                text not null,
   THOUGNESS            text not null,
   RULES                text not null,
   RARITY               text not null,
   OTHER_CRITERIA       text,
   NUMBER_IN_SET        int not null,
   STATE                text,
   primary key (CARD_ID)
);

/*==============================================================*/
/* Table: CARD_DESIGN                                           */
/*==============================================================*/
create table CARD_DESIGN
(
   CARD_ARD_ID          int not null,
   CARD_ID              int not null,
   IMAGE                text not null,
   COVER                text not null,
   primary key (CARD_ARD_ID)
);

/*==============================================================*/
/* Table: CART                                                  */
/*==============================================================*/
create table CART
(
   CART_ID              int not null,
   PAYMENT_ID           int,
   CARD_NAME            text not null,
   primary key (CART_ID)
);

/*==============================================================*/
/* Table: CART_ITEM                                             */
/*==============================================================*/
create table CART_ITEM
(
   CARD_ITEM_ID         int not null,
   CART_ID              int not null,
   QUANTITY             text not null,
   TOTAL_COST           text not null,
   primary key (CARD_ITEM_ID)
);

/*==============================================================*/
/* Table: COLOR                                                 */
/*==============================================================*/
create table COLOR
(
   COLOR_NAME           text not null,
   primary key (COLOR_NAME)
);

/*==============================================================*/
/* Table: COLOR_CARD                                            */
/*==============================================================*/
create table COLOR_CARD
(
   CARD_ID              int not null,
   COLOR_NAME           text not null,
   primary key (CARD_ID, COLOR_NAME)
);

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER
(
   CUSTOMER_ID          int not null,
   PERSON_ID            int not null,
   CUSTOMER_RATING      int,
   primary key (CUSTOMER_ID)
);

/*==============================================================*/
/* Table: CUSTOMER_CUSTOMER                                     */
/*==============================================================*/
create table CUSTOMER_CUSTOMER
(
   CUS_CUSTOMER_ID      int not null,
   CUSTOMER_ID          int not null,
   primary key (CUS_CUSTOMER_ID, CUSTOMER_ID)
);

/*==============================================================*/
/* Table: EVENT                                                 */
/*==============================================================*/
create table EVENT
(
   EVENT_ID             int not null,
   ADMIN_ID             int,
   EVENT_NAME           text not null,
   EVENT_END_DATE       date not null,
   EVENT_START_DATE     date not null,
   EVENT_RABBAT         float,
   primary key (EVENT_ID)
);

/*==============================================================*/
/* Table: EVENT_CUSTOMER                                        */
/*==============================================================*/
create table EVENT_CUSTOMER
(
   CUSTOMER_ID          int not null,
   EVENT_ID             int not null,
   primary key (CUSTOMER_ID, EVENT_ID)
);

/*==============================================================*/
/* Table: EVENT_PRODUCT                                         */
/*==============================================================*/
create table EVENT_PRODUCT
(
   PRODUCT_ID           int not null,
   EVENT_ID             int not null,
   primary key (PRODUCT_ID, EVENT_ID)
);

/*==============================================================*/
/* Table: LANGUAGE                                              */
/*==============================================================*/
create table LANGUAGE
(
   LANGUAGE             text not null,
   primary key (LANGUAGE)
);

/*==============================================================*/
/* Table: MARKETPLACE                                           */
/*==============================================================*/
create table MARKETPLACE
(
   MARKETPLACE_ID       int not null,
   CUSTOMER_ID          int not null,
   MARKETPLACE_NAME     text not null,
   MARKETPLACE_RATING   int,
   primary key (MARKETPLACE_ID)
);

/*==============================================================*/
/* Table: MERCHE                                                */
/*==============================================================*/
create table MERCHE
(
   MERCHE_ID            int not null,
   MERCHE_NAME          text not null,
   MERCHE_TYPE          text not null,
   primary key (MERCHE_ID)
);

/*==============================================================*/
/* Table: NEWS                                                  */
/*==============================================================*/
create table NEWS
(
   NEWS_ID              text not null,
   NEWS_START_DATE      date not null,
   NEWS_END_DATE        date not null,
   MESSAGE              text,
   primary key (NEWS_ID)
);

/*==============================================================*/
/* Table: NEWS_ADMIN                                            */
/*==============================================================*/
create table NEWS_ADMIN
(
   ADMIN_ID             int not null,
   NEWS_ID              text not null,
   primary key (ADMIN_ID, NEWS_ID)
);

/*==============================================================*/
/* Table: PAYMENT                                               */
/*==============================================================*/
create table PAYMENT
(
   PAYMENT_ID           int not null,
   CUSTOMER_ID          int not null,
   CART_ID              int not null,
   AMOUNT               int not null,
   PAYMENT_TYPE         text not null,
   DATE                 date not null,
   STATUS               text not null,
   primary key (PAYMENT_ID)
);

/*==============================================================*/
/* Table: PRDUCT_GUTACHTEN                                      */
/*==============================================================*/
create table PRDUCT_GUTACHTEN
(
   PRODUCT_ID           int not null,
   EVALUATION_ID        int not null,
   primary key (PRODUCT_ID, EVALUATION_ID)
);

/*==============================================================*/
/* Table: PRODUCT_CARD                                          */
/*==============================================================*/
create table PRODUCT_CARD
(
   PRODUCT_ID           int not null,
   CARD_ID              int not null,
   primary key (PRODUCT_ID, CARD_ID)
);

/*==============================================================*/
/* Table: PRODUCT_MERCHE                                        */
/*==============================================================*/
create table PRODUCT_MERCHE
(
   PRODUCT_ID           int not null,
   MERCHE_ID            int not null,
   primary key (PRODUCT_ID, MERCHE_ID)
);

/*==============================================================*/
/* Table: PRODUCT_SET                                           */
/*==============================================================*/
create table PRODUCT_SET
(
   PRODUCT_ID           int not null,
   SET_ID               int not null,
   primary key (PRODUCT_ID, SET_ID)
);

/*==============================================================*/
/* Table: "SET"                                                 */
/*==============================================================*/
create table "SET"
(
   SET_ID               int not null,
   MAX_CARDS            int not null,
   SET_NAME             text not null,
   primary key (SET_ID)
);

/*==============================================================*/
/* Table: SET_CARD                                              */
/*==============================================================*/
create table SET_CARD
(
   CARD_ID              int not null,
   SET_ID               int not null,
   primary key (CARD_ID, SET_ID)
);

alter table CARD add constraint FK_ARTIST_CARD foreign key (ARTIST_ID)
      references ARTIST (ARTIST_ID) on delete restrict on update restrict;

alter table CARD add constraint FK_LANGUAGE_CARD foreign key (LANGUAGE)
      references LANGUAGE (LANGUAGE) on delete restrict on update restrict;

alter table CARD_DESIGN add constraint FK_CARD_DESIGN_CARD foreign key (CARD_ID)
      references CARD (CARD_ID) on delete restrict on update restrict;

alter table CART add constraint FK_PAYMENT_CART2 foreign key (PAYMENT_ID)
      references PAYMENT (PAYMENT_ID) on delete restrict on update restrict;

alter table CART_ITEM add constraint FK_CART_CART_ITEM foreign key (CART_ID)
      references CART (CART_ID) on delete restrict on update restrict;

alter table COLOR_CARD add constraint FK_COLOR_CARD foreign key (CARD_ID)
      references CARD (CARD_ID) on delete restrict on update restrict;

alter table COLOR_CARD add constraint FK_COLOR_CARD2 foreign key (COLOR_NAME)
      references COLOR (COLOR_NAME) on delete restrict on update restrict;

alter table CUSTOMER_CUSTOMER add constraint FK_CUSTOMER_CUSTOMER foreign key (CUS_CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID) on delete restrict on update restrict;

alter table CUSTOMER_CUSTOMER add constraint FK_CUSTOMER_CUSTOMER2 foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID) on delete restrict on update restrict;

alter table EVENT add constraint FK_ADMIN_EVENT foreign key (ADMIN_ID)
      references ADMIN (ADMIN_ID) on delete restrict on update restrict;

alter table EVENT_CUSTOMER add constraint FK_EVENT_CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID) on delete restrict on update restrict;

alter table EVENT_CUSTOMER add constraint FK_EVENT_CUSTOMER2 foreign key (EVENT_ID)
      references EVENT (EVENT_ID) on delete restrict on update restrict;

alter table EVENT_PRODUCT add constraint FK_EVENT_PRODUCT2 foreign key (EVENT_ID)
      references EVENT (EVENT_ID) on delete restrict on update restrict;

alter table MARKETPLACE add constraint FK_CUSTOMER_MARKETPLACE foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID) on delete restrict on update restrict;

alter table NEWS_ADMIN add constraint FK_NEWS_ADMIN foreign key (ADMIN_ID)
      references ADMIN (ADMIN_ID) on delete restrict on update restrict;

alter table NEWS_ADMIN add constraint FK_NEWS_ADMIN2 foreign key (NEWS_ID)
      references NEWS (NEWS_ID) on delete restrict on update restrict;

alter table PAYMENT add constraint FK_CUSTOMER_PAYMENT foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID) on delete restrict on update restrict;

alter table PAYMENT add constraint FK_PAYMENT_CART foreign key (CART_ID)
      references CART (CART_ID) on delete restrict on update restrict;

alter table PRODUCT_CARD add constraint FK_PRODUCT_CARD2 foreign key (CARD_ID)
      references CARD (CARD_ID) on delete restrict on update restrict;

alter table PRODUCT_MERCHE add constraint FK_PRODUCT_MERCHE2 foreign key (MERCHE_ID)
      references MERCHE (MERCHE_ID) on delete restrict on update restrict;

alter table PRODUCT_SET add constraint FK_PRODUCT_SET2 foreign key (SET_ID)
      references "SET" (SET_ID) on delete restrict on update restrict;

alter table SET_CARD add constraint FK_SET_CARD foreign key (CARD_ID)
      references CARD (CARD_ID) on delete restrict on update restrict;

alter table SET_CARD add constraint FK_SET_CARD2 foreign key (SET_ID)
      references "SET" (SET_ID) on delete restrict on update restrict;

