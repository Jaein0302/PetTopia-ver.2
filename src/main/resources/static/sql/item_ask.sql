drop table item_ask cascade constraints purge;
create table ITEM_ASK(
	ITEM_ASK_NUM 		number(15) primary key,  -- 문의 번호
	ITEM_ASK_USERNAME 	varchar2(15),  -- 작성자 (memberid 가져옴)
	ITEM_ASK_ITEMID 	references ITEM(ITEM_ID) on delete cascade, -- 상품id
	ITEM_ASK_SUBJECT 	varchar2(100), -- 문의 제목
	ITEM_ASK_CONTENT 	varchar2(1000), -- 문의 내용
	ITEM_ASK_DATE 		date default sysdate -- 등록날짜
);


select * from ITEM_ASK

DELETE FROM ITEM_ASK

insert into item_ask


		select *
		from(select rownum rnum, a.*
		 	 from (select * 
			   	   from ITEM_ASK
			   	   order by ITEM_ASK_DATE desc) a
		 	 where rownum <= 5
		 	)
		where rnum >= 1  and rnum <=5
		and ITEM_ASK_ITEMID = '30002'
		
		
		select nvl(max(ITEM_ASK_NUM), 0)+1 from ITEM_ASK where ITEM_ASK_ITEMID = '20002'		
		
		
		select *
		from ITEM_ASK
		where ITEM_ASK_ITEMID = '30001'		
		order by ITEM_ASK_DATE desc


		select *
		from ITEM_ASK, ITEM
		where ITEM_ASK.ITEM_ASK_ITEMID = '10001'
		order by ITEM_ASK_NUM desc


