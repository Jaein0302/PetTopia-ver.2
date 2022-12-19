DROP TABLE review CASCADE CONSTRAINTS PURGE;

create table review(
	review_num      primary key references orderinfo(order_id) on delete cascade,
	review_id 		references member(member_id) on delete cascade,
	review_item_id  references item(item_id) on delete cascade,
	review_score    number(5) not null,
	review_subject   varchar2(50) not null,
	review_content   varchar2(2000) not null,
	review_text		 varchar2(1000),
	review_reg_date date default sysdate,
	review_image    varchar2(200)
)

delete review
select * from review


--지난 예약리스트 && 리뷰쓰기 중복
select * 
			from ( select rownum rnum, b.*
			  from (select orderinfo.* , nvl(cnt,0) cnt
			  		from orderinfo left outer join (select review.review_num, count(*) cnt 
			  										from review
			  										group by review.review_num)r
			  		on orderinfo.order_id = r.review_num
					where orderinfo.order_member_id = 'user1'
					order by orderinfo.order_id desc) b
			  where rownum <= 10
			  and to_char(sysdate, 'YYYY. MM. DD. HH:MI') >= order_time
			)
		where rnum >= 1 and rnum <= 10



			select review.*
		from review left outer join orderinfo
	 	on review.review_num = orderinfo.order_id

insert into review 
		select * 
			from ( select rownum rnum, b.*
			  from (select review.*
					from review 
					where review_id = 'admin'
					order by review.review_reg_date desc) b
			  where rownum <= 10
			)
		where rnum >= 1 and rnum <= 10
		
		
      select item.*,  nvl(cnt,0) cnt
	  from item left outer join (select review.review_item_id, count(*) cnt
									from review
									group by review_item_id) c
	  on item.item_id = c.review_item_id
      order by item.ITEM_SCORE desc
      
      
      