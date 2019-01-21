/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2016                    */
/* Created on:     21.01.2019 19:39:29                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CARD') and o.name = 'FK_CARD_ARTIST_CA_ARTIST')
alter table CARD
   drop constraint FK_CARD_ARTIST_CA_ARTIST
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CARD') and o.name = 'FK_CARD_LANGUAGE__LANGUAGE')
alter table CARD
   drop constraint FK_CARD_LANGUAGE__LANGUAGE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CARD_DESIGN') and o.name = 'FK_CARD_DES_CARD_DESI_CARD')
alter table CARD_DESIGN
   drop constraint FK_CARD_DES_CARD_DESI_CARD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CART') and o.name = 'FK_CART_PAYMENT_C_PAYMENT')
alter table CART
   drop constraint FK_CART_PAYMENT_C_PAYMENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CART_ITEM') and o.name = 'FK_CART_ITE_CART_CART_CART')
alter table CART_ITEM
   drop constraint FK_CART_ITE_CART_CART_CART
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COLOR_CARD') and o.name = 'FK_COLOR_CA_COLOR_CAR_CARD')
alter table COLOR_CARD
   drop constraint FK_COLOR_CA_COLOR_CAR_CARD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COLOR_CARD') and o.name = 'FK_COLOR_CA_COLOR_CAR_COLOR')
alter table COLOR_CARD
   drop constraint FK_COLOR_CA_COLOR_CAR_COLOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CUSTOMER_CUSTOMER') and o.name = 'FK_CUSTOMER_CUSTOMERA_CUSTOMER')
alter table CUSTOMER_CUSTOMER
   drop constraint FK_CUSTOMER_CUSTOMERA_CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CUSTOMER_CUSTOMER') and o.name = 'FK_CUSTOMER_CUSTOMERB_CUSTOMER')
alter table CUSTOMER_CUSTOMER
   drop constraint FK_CUSTOMER_CUSTOMERB_CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EVENT') and o.name = 'FK_EVENT_ADMIN_EVE_ADMIN')
alter table EVENT
   drop constraint FK_EVENT_ADMIN_EVE_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EVENT_CUSTOMER') and o.name = 'FK_EVENT_CU_EVENT_CUS_CUSTOMER')
alter table EVENT_CUSTOMER
   drop constraint FK_EVENT_CU_EVENT_CUS_CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EVENT_CUSTOMER') and o.name = 'FK_EVENT_CU_EVENT_CUS_EVENT')
alter table EVENT_CUSTOMER
   drop constraint FK_EVENT_CU_EVENT_CUS_EVENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EVENT_PRODUCT') and o.name = 'FK_EVENT_PR_EVENT_PRO_EVENT')
alter table EVENT_PRODUCT
   drop constraint FK_EVENT_PR_EVENT_PRO_EVENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MARKETPLACE') and o.name = 'FK_MARKETPL_CUSTOMER__CUSTOMER')
alter table MARKETPLACE
   drop constraint FK_MARKETPL_CUSTOMER__CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NEWS_ADMIN') and o.name = 'FK_NEWS_ADM_NEWS_ADMI_ADMIN')
alter table NEWS_ADMIN
   drop constraint FK_NEWS_ADM_NEWS_ADMI_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NEWS_ADMIN') and o.name = 'FK_NEWS_ADM_NEWS_ADMI_NEWS')
alter table NEWS_ADMIN
   drop constraint FK_NEWS_ADM_NEWS_ADMI_NEWS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PAYMENT') and o.name = 'FK_PAYMENT_CUSTOMER__CUSTOMER')
alter table PAYMENT
   drop constraint FK_PAYMENT_CUSTOMER__CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PAYMENT') and o.name = 'FK_PAYMENT_PAYMENT_C_CART')
alter table PAYMENT
   drop constraint FK_PAYMENT_PAYMENT_C_CART
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCT_CARD') and o.name = 'FK_PRODUCT__PRODUCT_C_CARD')
alter table PRODUCT_CARD
   drop constraint FK_PRODUCT__PRODUCT_C_CARD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCT_MERCHE') and o.name = 'FK_PRODUCT__PRODUCT_M_MERCHE')
alter table PRODUCT_MERCHE
   drop constraint FK_PRODUCT__PRODUCT_M_MERCHE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCT_SET') and o.name = 'FK_PRODUCT__PRODUCT_S_SET')
alter table PRODUCT_SET
   drop constraint FK_PRODUCT__PRODUCT_S_SET
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SET_CARD') and o.name = 'FK_SET_CARD_SET_CARD_CARD')
alter table SET_CARD
   drop constraint FK_SET_CARD_SET_CARD_CARD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SET_CARD') and o.name = 'FK_SET_CARD_SET_CARD2_SET')
alter table SET_CARD
   drop constraint FK_SET_CARD_SET_CARD2_SET
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ADMIN')
            and   type = 'U')
   drop table ADMIN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ARTIST')
            and   type = 'U')
   drop table ARTIST
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CARD')
            and   name  = 'LANGUAGE_CARD_FK'
            and   indid > 0
            and   indid < 255)
   drop index CARD.LANGUAGE_CARD_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CARD')
            and   name  = 'ARTIST_CARD_FK'
            and   indid > 0
            and   indid < 255)
   drop index CARD.ARTIST_CARD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CARD')
            and   type = 'U')
   drop table CARD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CARD_DESIGN')
            and   name  = 'CARD_DESIGN_CARD_FK'
            and   indid > 0
            and   indid < 255)
   drop index CARD_DESIGN.CARD_DESIGN_CARD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CARD_DESIGN')
            and   type = 'U')
   drop table CARD_DESIGN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CART')
            and   name  = 'PAYMENT_CART2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CART.PAYMENT_CART2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CART')
            and   type = 'U')
   drop table CART
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CART_ITEM')
            and   name  = 'CART_CART_ITEM_FK'
            and   indid > 0
            and   indid < 255)
   drop index CART_ITEM.CART_CART_ITEM_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CART_ITEM')
            and   type = 'U')
   drop table CART_ITEM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COLOR')
            and   type = 'U')
   drop table COLOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COLOR_CARD')
            and   name  = 'COLOR_CARD_FK'
            and   indid > 0
            and   indid < 255)
   drop index COLOR_CARD.COLOR_CARD_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COLOR_CARD')
            and   name  = 'COLOR_CARD2_FK'
            and   indid > 0
            and   indid < 255)
   drop index COLOR_CARD.COLOR_CARD2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COLOR_CARD')
            and   type = 'U')
   drop table COLOR_CARD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CUSTOMER')
            and   type = 'U')
   drop table CUSTOMER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CUSTOMER_CUSTOMER')
            and   name  = 'CUSTOMER_CUSTOMER_FK'
            and   indid > 0
            and   indid < 255)
   drop index CUSTOMER_CUSTOMER.CUSTOMER_CUSTOMER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CUSTOMER_CUSTOMER')
            and   name  = 'CUSTOMER_CUSTOMER2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CUSTOMER_CUSTOMER.CUSTOMER_CUSTOMER2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CUSTOMER_CUSTOMER')
            and   type = 'U')
   drop table CUSTOMER_CUSTOMER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EVENT')
            and   name  = 'ADMIN_EVENT_FK'
            and   indid > 0
            and   indid < 255)
   drop index EVENT.ADMIN_EVENT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EVENT')
            and   type = 'U')
   drop table EVENT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EVENT_CUSTOMER')
            and   name  = 'EVENT_CUSTOMER_FK'
            and   indid > 0
            and   indid < 255)
   drop index EVENT_CUSTOMER.EVENT_CUSTOMER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EVENT_CUSTOMER')
            and   name  = 'EVENT_CUSTOMER2_FK'
            and   indid > 0
            and   indid < 255)
   drop index EVENT_CUSTOMER.EVENT_CUSTOMER2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EVENT_CUSTOMER')
            and   type = 'U')
   drop table EVENT_CUSTOMER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EVENT_PRODUCT')
            and   name  = 'EVENT_PRODUCT2_FK'
            and   indid > 0
            and   indid < 255)
   drop index EVENT_PRODUCT.EVENT_PRODUCT2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EVENT_PRODUCT')
            and   type = 'U')
   drop table EVENT_PRODUCT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LANGUAGE')
            and   type = 'U')
   drop table LANGUAGE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MARKETPLACE')
            and   name  = 'CUSTOMER_MARKETPLACE_FK'
            and   indid > 0
            and   indid < 255)
   drop index MARKETPLACE.CUSTOMER_MARKETPLACE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MARKETPLACE')
            and   type = 'U')
   drop table MARKETPLACE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MERCHE')
            and   type = 'U')
   drop table MERCHE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NEWS')
            and   type = 'U')
   drop table NEWS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NEWS_ADMIN')
            and   name  = 'NEWS_ADMIN_FK'
            and   indid > 0
            and   indid < 255)
   drop index NEWS_ADMIN.NEWS_ADMIN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NEWS_ADMIN')
            and   name  = 'NEWS_ADMIN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index NEWS_ADMIN.NEWS_ADMIN2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NEWS_ADMIN')
            and   type = 'U')
   drop table NEWS_ADMIN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PAYMENT')
            and   name  = 'PAYMENT_CART_FK'
            and   indid > 0
            and   indid < 255)
   drop index PAYMENT.PAYMENT_CART_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PAYMENT')
            and   name  = 'CUSTOMER_PAYMENT_FK'
            and   indid > 0
            and   indid < 255)
   drop index PAYMENT.CUSTOMER_PAYMENT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PAYMENT')
            and   type = 'U')
   drop table PAYMENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRDUCT_GUTACHTEN')
            and   type = 'U')
   drop table PRDUCT_GUTACHTEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCT_CARD')
            and   name  = 'PRODUCT_CARD2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCT_CARD.PRODUCT_CARD2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCT_CARD')
            and   type = 'U')
   drop table PRODUCT_CARD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCT_MERCHE')
            and   name  = 'PRODUCT_MERCHE2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCT_MERCHE.PRODUCT_MERCHE2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCT_MERCHE')
            and   type = 'U')
   drop table PRODUCT_MERCHE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCT_SET')
            and   name  = 'PRODUCT_SET2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCT_SET.PRODUCT_SET2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCT_SET')
            and   type = 'U')
   drop table PRODUCT_SET
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"SET"')
            and   type = 'U')
   drop table "SET"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SET_CARD')
            and   name  = 'SET_CARD_FK'
            and   indid > 0
            and   indid < 255)
   drop index SET_CARD.SET_CARD_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SET_CARD')
            and   name  = 'SET_CARD2_FK'
            and   indid > 0
            and   indid < 255)
   drop index SET_CARD.SET_CARD2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SET_CARD')
            and   type = 'U')
   drop table SET_CARD
go

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN (
   ADMIN_ID             int                  not null,
   PERSON_ID            int                  not null,
   constraint PK_ADMIN primary key (ADMIN_ID)
)
go

/*==============================================================*/
/* Table: ARTIST                                                */
/*==============================================================*/
create table ARTIST (
   ARTIST_ID            int                  not null,
   ARTIST_FIRST_NAME    text                 not null,
   ARTIST_LAST_NAME     text                 not null,
   constraint PK_ARTIST primary key (ARTIST_ID)
)
go

/*==============================================================*/
/* Table: CARD                                                  */
/*==============================================================*/
create table CARD (
   CARD_ID              int                  not null,
   ARTIST_ID            int                  not null,
   LANGUAGE             text                 not null,
   EVALUATION_ID        int                  not null,
   CONVERTED_MANA_COST  text                 not null,
   CARD_TYPE            text                 not null,
   SUBTYPE              text                 null,
   POWER                text                 not null,
   THOUGNESS            text                 not null,
   RULES                text                 not null,
   RARITY               text                 not null,
   OTHER_CRITERIA       text                 null,
   NUMBER_IN_SET        int                  not null,
   STATE                text                 null,
   constraint PK_CARD primary key (CARD_ID)
)
go

/*==============================================================*/
/* Index: ARTIST_CARD_FK                                        */
/*==============================================================*/




create nonclustered index ARTIST_CARD_FK on CARD (ARTIST_ID ASC)
go

/*==============================================================*/
/* Index: LANGUAGE_CARD_FK                                      */
/*==============================================================*/




create nonclustered index LANGUAGE_CARD_FK on CARD (LANGUAGE ASC)
go

/*==============================================================*/
/* Table: CARD_DESIGN                                           */
/*==============================================================*/
create table CARD_DESIGN (
   CARD_ARD_ID          int                  not null,
   CARD_ID              int                  not null,
   IMAGE                text                 not null,
   COVER                text                 not null,
   constraint PK_CARD_DESIGN primary key (CARD_ARD_ID)
)
go

/*==============================================================*/
/* Index: CARD_DESIGN_CARD_FK                                   */
/*==============================================================*/




create nonclustered index CARD_DESIGN_CARD_FK on CARD_DESIGN (CARD_ID ASC)
go

/*==============================================================*/
/* Table: CART                                                  */
/*==============================================================*/
create table CART (
   CART_ID              int                  not null,
   PAYMENT_ID           int                  null,
   CARD_NAME            text                 not null,
   constraint PK_CART primary key (CART_ID)
)
go

/*==============================================================*/
/* Index: PAYMENT_CART2_FK                                      */
/*==============================================================*/




create nonclustered index PAYMENT_CART2_FK on CART (PAYMENT_ID ASC)
go

/*==============================================================*/
/* Table: CART_ITEM                                             */
/*==============================================================*/
create table CART_ITEM (
   CARD_ITEM_ID         int                  not null,
   CART_ID              int                  not null,
   QUANTITY             text                 not null,
   TOTAL_COST           text                 not null,
   constraint PK_CART_ITEM primary key (CARD_ITEM_ID)
)
go

/*==============================================================*/
/* Index: CART_CART_ITEM_FK                                     */
/*==============================================================*/




create nonclustered index CART_CART_ITEM_FK on CART_ITEM (CART_ID ASC)
go

/*==============================================================*/
/* Table: COLOR                                                 */
/*==============================================================*/
create table COLOR (
   COLOR_NAME           text                 not null,
   constraint PK_COLOR primary key (COLOR_NAME)
)
go

/*==============================================================*/
/* Table: COLOR_CARD                                            */
/*==============================================================*/
create table COLOR_CARD (
   CARD_ID              int                  not null,
   COLOR_NAME           text                 not null,
   constraint PK_COLOR_CARD primary key (CARD_ID, COLOR_NAME)
)
go

/*==============================================================*/
/* Index: COLOR_CARD2_FK                                        */
/*==============================================================*/




create nonclustered index COLOR_CARD2_FK on COLOR_CARD (COLOR_NAME ASC)
go

/*==============================================================*/
/* Index: COLOR_CARD_FK                                         */
/*==============================================================*/




create nonclustered index COLOR_CARD_FK on COLOR_CARD (CARD_ID ASC)
go

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER (
   CUSTOMER_ID          int                  not null,
   PERSON_ID            int                  not null,
   CUSTOMER_RATING      int                  null,
   constraint PK_CUSTOMER primary key (CUSTOMER_ID)
)
go

/*==============================================================*/
/* Table: CUSTOMER_CUSTOMER                                     */
/*==============================================================*/
create table CUSTOMER_CUSTOMER (
   CUS_CUSTOMER_ID      int                  not null,
   CUSTOMER_ID          int                  not null,
   constraint PK_CUSTOMER_CUSTOMER primary key (CUS_CUSTOMER_ID, CUSTOMER_ID)
)
go

/*==============================================================*/
/* Index: CUSTOMER_CUSTOMER2_FK                                 */
/*==============================================================*/




create nonclustered index CUSTOMER_CUSTOMER2_FK on CUSTOMER_CUSTOMER (CUSTOMER_ID ASC)
go

/*==============================================================*/
/* Index: CUSTOMER_CUSTOMER_FK                                  */
/*==============================================================*/




create nonclustered index CUSTOMER_CUSTOMER_FK on CUSTOMER_CUSTOMER (CUS_CUSTOMER_ID ASC)
go

/*==============================================================*/
/* Table: EVENT                                                 */
/*==============================================================*/
create table EVENT (
   EVENT_ID             int                  not null,
   ADMIN_ID             int                  null,
   EVENT_NAME           text                 not null,
   EVENT_END_DATE       datetime             not null,
   EVENT_START_DATE     datetime             not null,
   EVENT_RABBAT         float                null,
   constraint PK_EVENT primary key (EVENT_ID)
)
go

/*==============================================================*/
/* Index: ADMIN_EVENT_FK                                        */
/*==============================================================*/




create nonclustered index ADMIN_EVENT_FK on EVENT (ADMIN_ID ASC)
go

/*==============================================================*/
/* Table: EVENT_CUSTOMER                                        */
/*==============================================================*/
create table EVENT_CUSTOMER (
   CUSTOMER_ID          int                  not null,
   EVENT_ID             int                  not null,
   constraint PK_EVENT_CUSTOMER primary key (CUSTOMER_ID, EVENT_ID)
)
go

/*==============================================================*/
/* Index: EVENT_CUSTOMER2_FK                                    */
/*==============================================================*/




create nonclustered index EVENT_CUSTOMER2_FK on EVENT_CUSTOMER (EVENT_ID ASC)
go

/*==============================================================*/
/* Index: EVENT_CUSTOMER_FK                                     */
/*==============================================================*/




create nonclustered index EVENT_CUSTOMER_FK on EVENT_CUSTOMER (CUSTOMER_ID ASC)
go

/*==============================================================*/
/* Table: EVENT_PRODUCT                                         */
/*==============================================================*/
create table EVENT_PRODUCT (
   PRODUCT_ID           int                  not null,
   EVENT_ID             int                  not null,
   constraint PK_EVENT_PRODUCT primary key (PRODUCT_ID, EVENT_ID)
)
go

/*==============================================================*/
/* Index: EVENT_PRODUCT2_FK                                     */
/*==============================================================*/




create nonclustered index EVENT_PRODUCT2_FK on EVENT_PRODUCT (EVENT_ID ASC)
go

/*==============================================================*/
/* Table: LANGUAGE                                              */
/*==============================================================*/
create table LANGUAGE (
   LANGUAGE             text                 not null,
   constraint PK_LANGUAGE primary key (LANGUAGE)
)
go

/*==============================================================*/
/* Table: MARKETPLACE                                           */
/*==============================================================*/
create table MARKETPLACE (
   MARKETPLACE_ID       int                  not null,
   CUSTOMER_ID          int                  not null,
   MARKETPLACE_NAME     text                 not null,
   MARKETPLACE_RATING   int                  null,
   constraint PK_MARKETPLACE primary key (MARKETPLACE_ID)
)
go

/*==============================================================*/
/* Index: CUSTOMER_MARKETPLACE_FK                               */
/*==============================================================*/




create nonclustered index CUSTOMER_MARKETPLACE_FK on MARKETPLACE (CUSTOMER_ID ASC)
go

/*==============================================================*/
/* Table: MERCHE                                                */
/*==============================================================*/
create table MERCHE (
   MERCHE_ID            int                  not null,
   MERCHE_NAME          text                 not null,
   MERCHE_TYPE          text                 not null,
   constraint PK_MERCHE primary key (MERCHE_ID)
)
go

/*==============================================================*/
/* Table: NEWS                                                  */
/*==============================================================*/
create table NEWS (
   NEWS_ID              text                 not null,
   NEWS_START_DATE      datetime             not null,
   NEWS_END_DATE        datetime             not null,
   MESSAGE              text                 null,
   constraint PK_NEWS primary key (NEWS_ID)
)
go

/*==============================================================*/
/* Table: NEWS_ADMIN                                            */
/*==============================================================*/
create table NEWS_ADMIN (
   ADMIN_ID             int                  not null,
   NEWS_ID              text                 not null,
   constraint PK_NEWS_ADMIN primary key (ADMIN_ID, NEWS_ID)
)
go

/*==============================================================*/
/* Index: NEWS_ADMIN2_FK                                        */
/*==============================================================*/




create nonclustered index NEWS_ADMIN2_FK on NEWS_ADMIN (NEWS_ID ASC)
go

/*==============================================================*/
/* Index: NEWS_ADMIN_FK                                         */
/*==============================================================*/




create nonclustered index NEWS_ADMIN_FK on NEWS_ADMIN (ADMIN_ID ASC)
go

/*==============================================================*/
/* Table: PAYMENT                                               */
/*==============================================================*/
create table PAYMENT (
   PAYMENT_ID           int                  not null,
   CUSTOMER_ID          int                  not null,
   CART_ID              int                  not null,
   AMOUNT               int                  not null,
   PAYMENT_TYPE         text                 not null,
   DATE                 datetime             not null,
   STATUS               text                 not null,
   constraint PK_PAYMENT primary key (PAYMENT_ID)
)
go

/*==============================================================*/
/* Index: CUSTOMER_PAYMENT_FK                                   */
/*==============================================================*/




create nonclustered index CUSTOMER_PAYMENT_FK on PAYMENT (CUSTOMER_ID ASC)
go

/*==============================================================*/
/* Index: PAYMENT_CART_FK                                       */
/*==============================================================*/




create nonclustered index PAYMENT_CART_FK on PAYMENT (CART_ID ASC)
go

/*==============================================================*/
/* Table: PRDUCT_GUTACHTEN                                      */
/*==============================================================*/
create table PRDUCT_GUTACHTEN (
   PRODUCT_ID           int                  not null,
   EVALUATION_ID        int                  not null,
   constraint PK_PRDUCT_GUTACHTEN primary key (PRODUCT_ID, EVALUATION_ID)
)
go

/*==============================================================*/
/* Table: PRODUCT_CARD                                          */
/*==============================================================*/
create table PRODUCT_CARD (
   PRODUCT_ID           int                  not null,
   CARD_ID              int                  not null,
   constraint PK_PRODUCT_CARD primary key (PRODUCT_ID, CARD_ID)
)
go

/*==============================================================*/
/* Index: PRODUCT_CARD2_FK                                      */
/*==============================================================*/




create nonclustered index PRODUCT_CARD2_FK on PRODUCT_CARD (CARD_ID ASC)
go

/*==============================================================*/
/* Table: PRODUCT_MERCHE                                        */
/*==============================================================*/
create table PRODUCT_MERCHE (
   PRODUCT_ID           int                  not null,
   MERCHE_ID            int                  not null,
   constraint PK_PRODUCT_MERCHE primary key (PRODUCT_ID, MERCHE_ID)
)
go

/*==============================================================*/
/* Index: PRODUCT_MERCHE2_FK                                    */
/*==============================================================*/




create nonclustered index PRODUCT_MERCHE2_FK on PRODUCT_MERCHE (MERCHE_ID ASC)
go

/*==============================================================*/
/* Table: PRODUCT_SET                                           */
/*==============================================================*/
create table PRODUCT_SET (
   PRODUCT_ID           int                  not null,
   SET_ID               int                  not null,
   constraint PK_PRODUCT_SET primary key (PRODUCT_ID, SET_ID)
)
go

/*==============================================================*/
/* Index: PRODUCT_SET2_FK                                       */
/*==============================================================*/




create nonclustered index PRODUCT_SET2_FK on PRODUCT_SET (SET_ID ASC)
go

/*==============================================================*/
/* Table: "SET"                                                 */
/*==============================================================*/
create table "SET" (
   SET_ID               int                  not null,
   MAX_CARDS            int                  not null,
   SET_NAME             text                 not null,
   constraint PK_SET primary key (SET_ID)
)
go

/*==============================================================*/
/* Table: SET_CARD                                              */
/*==============================================================*/
create table SET_CARD (
   CARD_ID              int                  not null,
   SET_ID               int                  not null,
   constraint PK_SET_CARD primary key (CARD_ID, SET_ID)
)
go

/*==============================================================*/
/* Index: SET_CARD2_FK                                          */
/*==============================================================*/




create nonclustered index SET_CARD2_FK on SET_CARD (SET_ID ASC)
go

/*==============================================================*/
/* Index: SET_CARD_FK                                           */
/*==============================================================*/




create nonclustered index SET_CARD_FK on SET_CARD (CARD_ID ASC)
go

alter table CARD
   add constraint FK_CARD_ARTIST_CA_ARTIST foreign key (ARTIST_ID)
      references ARTIST (ARTIST_ID)
go

alter table CARD
   add constraint FK_CARD_LANGUAGE__LANGUAGE foreign key (LANGUAGE)
      references LANGUAGE (LANGUAGE)
go

alter table CARD_DESIGN
   add constraint FK_CARD_DES_CARD_DESI_CARD foreign key (CARD_ID)
      references CARD (CARD_ID)
go

alter table CART
   add constraint FK_CART_PAYMENT_C_PAYMENT foreign key (PAYMENT_ID)
      references PAYMENT (PAYMENT_ID)
go

alter table CART_ITEM
   add constraint FK_CART_ITE_CART_CART_CART foreign key (CART_ID)
      references CART (CART_ID)
go

alter table COLOR_CARD
   add constraint FK_COLOR_CA_COLOR_CAR_CARD foreign key (CARD_ID)
      references CARD (CARD_ID)
go

alter table COLOR_CARD
   add constraint FK_COLOR_CA_COLOR_CAR_COLOR foreign key (COLOR_NAME)
      references COLOR (COLOR_NAME)
go

alter table CUSTOMER_CUSTOMER
   add constraint FK_CUSTOMER_CUSTOMERA_CUSTOMER foreign key (CUS_CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID)
go

alter table CUSTOMER_CUSTOMER
   add constraint FK_CUSTOMER_CUSTOMERB_CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID)
go

alter table EVENT
   add constraint FK_EVENT_ADMIN_EVE_ADMIN foreign key (ADMIN_ID)
      references ADMIN (ADMIN_ID)
go

alter table EVENT_CUSTOMER
   add constraint FK_EVENT_CU_EVENT_CUS_CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID)
go

alter table EVENT_CUSTOMER
   add constraint FK_EVENT_CU_EVENT_CUS_EVENT foreign key (EVENT_ID)
      references EVENT (EVENT_ID)
go

alter table EVENT_PRODUCT
   add constraint FK_EVENT_PR_EVENT_PRO_EVENT foreign key (EVENT_ID)
      references EVENT (EVENT_ID)
go

alter table MARKETPLACE
   add constraint FK_MARKETPL_CUSTOMER__CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID)
go

alter table NEWS_ADMIN
   add constraint FK_NEWS_ADM_NEWS_ADMI_ADMIN foreign key (ADMIN_ID)
      references ADMIN (ADMIN_ID)
go

alter table NEWS_ADMIN
   add constraint FK_NEWS_ADM_NEWS_ADMI_NEWS foreign key (NEWS_ID)
      references NEWS (NEWS_ID)
go

alter table PAYMENT
   add constraint FK_PAYMENT_CUSTOMER__CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID)
go

alter table PAYMENT
   add constraint FK_PAYMENT_PAYMENT_C_CART foreign key (CART_ID)
      references CART (CART_ID)
go

alter table PRODUCT_CARD
   add constraint FK_PRODUCT__PRODUCT_C_CARD foreign key (CARD_ID)
      references CARD (CARD_ID)
go

alter table PRODUCT_MERCHE
   add constraint FK_PRODUCT__PRODUCT_M_MERCHE foreign key (MERCHE_ID)
      references MERCHE (MERCHE_ID)
go

alter table PRODUCT_SET
   add constraint FK_PRODUCT__PRODUCT_S_SET foreign key (SET_ID)
      references "SET" (SET_ID)
go

alter table SET_CARD
   add constraint FK_SET_CARD_SET_CARD_CARD foreign key (CARD_ID)
      references CARD (CARD_ID)
go

alter table SET_CARD
   add constraint FK_SET_CARD_SET_CARD2_SET foreign key (SET_ID)
      references "SET" (SET_ID)
go

