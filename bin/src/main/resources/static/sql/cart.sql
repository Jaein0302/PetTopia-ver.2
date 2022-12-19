drop table cart CASCADE CONSTRAINTS PURGE;
create table CART (
   CART_ID            VARCHAR2(15) primary key,
   CART_ITEM_ID       NUMBER(15) not null references ITEM(ITEM_ID),
   CART_MEMBER_ID     VARCHAR2(15) not null references MEMBER(MEMBER_ID),
   CART_ITEM_NAME     VARCHAR2(20) not null,
   CART_ITEM_IMAGE    VARCHAR2(100) not null,
   CART_AMOUNT        NUMBER(20) not null,
   ITEM_RSV_DATE      DATE default sysdate not null,
   CART_ITEM_PRICE    NUMBER(20) not null
)

