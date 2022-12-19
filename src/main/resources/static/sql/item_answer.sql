drop table ITEM_ANSWER cascade constraints purge;

create table ITEM_ANSWER(
   ITEM_ANSWER_NUM          NUMBER(15)  primary key, -- 답변 번호
   ITEM_ANSWER_USERNAME       references member(MEMBER_ID) on delete cascade, -- 판매자(memberid 가져옴)
   ITEM_ANSWER_CONTENT       VARCHAR2(1000), -- 답변 내용
   ITEM_ANSWER_DATE          DATE DEFAULT SYSDATE,  -- 답변 날짜
   ITEM_ASK_NUM              references ITEM_ASK(ITEM_ASK_NUM) on delete cascade
);

select * from ITEM_ANSWER


drop sequence answer_seq
create sequence answer_seq start with 1 increment by 1;

insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 150000,'슬개골 탈구 수술', 'male', 'L', 'dog' );