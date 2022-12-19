drop table WISH cascade constraints purge;

create table WISH (
	WISH_ID         VARCHAR2(15) NOT NULL PRIMARY KEY, --찜목록 아이디
	WISH_ITEM_ID      NUMBER(8) REFERENCES ITEM(ITEM_ID) ON DELETE CASCADE, --찜목록에 담을 상품아이디
	WISH_MEMBER_ID		VARCHAR2(100), --찜목록에 담은 사람의 아이디
	WISH_ITEM_NAME      VARCHAR2(50) , --상품 이름
	WISH_ITEM_IMAGE      VARCHAR2(100), --상품 썸네일
	WISH_RSV_DATE		VARCHAR2(100) DEFAULT SYSDATE, --담은 시간
	WISH_ITEM_PRICE		NUMBER(8) --상품 가격
);

delete wish;
select * from wish;

drop sequence wish_seq;
create sequence wish_seq start with 1 increment by 1;

		select *
		from wish
		where WISH_ITEM_ID = 10001
		and WISH_MEMBER_ID = 'buyer1'