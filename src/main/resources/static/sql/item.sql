drop table ITEM cascade constraints purge;

create table ITEM (
   ITEM_ID              NUMBER(15) PRIMARY KEY,
   ITEM_NAME            VARCHAR2(30) NOT NULL,
   ITEM_CATEGORY         VARCHAR2(30) NOT NULL,
   ITEM_PRICE            NUMBER(20) NOT NULL,
   ITEM_CONTENT        VARCHAR2(1000) NOT NULL,
   ITEM_IMAGE_ORIGINAL  VARCHAR2(100) NOT NULL,
   ITEM_IMAGE_FILE      VARCHAR2(100) NOT NULL,
   ITEM_REG_DATE        DATE DEFAULT SYSDATE NOT NULL,
   ITEM_RSV_DATE       DATE DEFAULT SYSDATE NOT NULL,  -- 예약날짜
   ITEM_SCORE            NUMBER(20,1),  -- 후기
   ITEM_SEX            VARCHAR2(10), -- male, female
   ITEM_WEIGHT         VARCHAR2(5), -- L, M, S (수정)
   ITEM_SPECIES        VARCHAR2(10), -- dog, cat
   ITEM_ADDRESS         VARCHAR2(150),
   ITEM_SELLER          VARCHAR2(15), --안쓰는곳
   MEMBER_ID          VARCHAR2(15) references member(MEMBER_ID) --내가 등록한 상품에서 필요함 (추가), 등록한 사람의 아이디
);

select * from item;
delete item

		select * from item;

	select *
	from(select rownum rnum, a.*
		 from (select * 
			   from item
			   order by ITEM_REG_DATE desc) a
		 where rownum <= 8
		 )
	where rnum >= 2 and rnum <=8
	
			
		
		
		select * 
		from ( select rownum rnum, *
		  	   from ( select * from item)
		       where rownum &lt;= #{end}
			 )
		where rnum &gt;= #{start} and rnum &lt;= #{end}

drop sequence item_seq
create sequence item_seq start with 1 increment by 1;

insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES,ITEM_IMAGE_FILE, ITEM_IMAGE_ORIGINAL) 
values(item_seq.nextval, '다리수술', 'treat', 150000,'슬개골 탈구 수술', 'male', 'L', 'dog','1','1' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 50000, '슬개골 탈구 수술', 'male', 'S', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 55000, '슬개골 탈구 수술', 'female', 'S', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 80000, '슬개골 탈구 수술', 'female', 'S', 'cat' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 200000, '슬개골 탈구 수술', 'male', 'M', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '다리수술', 'treat', 100000, '슬개골 탈구 수술', 'male', 'M', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '종양수술', 'treat', 250000, '이개혈종 수술', 'male', 'L', 'dog' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '종양수술', 'treat', 150000, '이개혈종 수술', 'female', 'L', 'cat' );
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT, ITEM_SEX, ITEM_WEIGHT, ITEM_SPECIES) 
values(item_seq.nextval, '종양수술', 'treat', 150000, '이개혈종 수술', 'male', 'L', 'cat' );


insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '기초애견훈련', 'education', 50000, '강아지와 함께 살아가기 위한 필수 훈련');
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '올바른 산책방법', 'education', 60000, '산책 시간이 더 안전하고 재밌도록');
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '펫티켓', 'education', 70000, '반려견이 지켜야 할 에티켓');

insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '소형견 미용', 'beauty', 30000, '전문가 선생님의 손길로 예쁘게');
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '중형견 미용', 'beauty', 50000, '섬세한 특수견 미용');
insert into item(ITEM_ID, ITEM_NAME, ITEM_CATEGORY, ITEM_PRICE, ITEM_CONTENT) 
values(item_seq.nextval, '반려묘 미용', 'beauty', 50000, '안전한 고양이 마취 미용');


      select *  
      from item
      where ITEM_CATEGORY = 'treat'


