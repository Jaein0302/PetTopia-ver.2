drop table sch cascade constraints purge;

create table sch(
sch_id number(30) not null primary key, --구분을 위해
sch_order_id references orderinfo(order_id) on delete cascade, --삭제위해 필요함 - orderinfo의 order_id와 같아야함
sch_title varchar2(100), --스케줄 제목
sch_start varchar2(100), --시작 시간
sch_seller varchar2(100) --판매자id
)

select order_seq.nextval from dual
select sch_seq.nextval from dual

delete orderinfo
delete sch

select * from orderinfo
select * from sch

insert into orderInfo values (
	order_seq.nextval, 'buyer1', 10001, '해피동물병원', '예방주사',20000, to_char( sysdate , 'YYYY-MM-DD HH24:mm'),
	'서울 종로구 종로 1 (종로1가)','/2022-10-7/bbs202210727516686.jpg', 'treat1', null, null);


insert into sch
values (2, order_seq.nextval -1, '예방주사', '2022-10-13 20:00', 'treat2');

drop sequence sch_seq
create sequence sch_seq start with 1000 increment by 1;
   
   2022-10-13'T'15:38:12.339+0900
   2022-10-13T22:00:00.000Z --sch
   2022-10-13 22:00:00		--orderinfo

select * from sch
where sch_start = to_char((select order_time from orderinfo where order_time = '2022-10-13 22:00:00'))

select order_time from orderinfo where order_time = '2022-10-13 22:00:00';

--to_char(sysdate, 'YYYY-MM-DD HH24:MI')

SELECT to_char(systimestamp,'YYYY-MM-DD"''"THH24:MI:SS.FF3TZHTZM') FROM dual;

SELECT to_char(systimestamp,'YYYY-MM-DD"''"THH24:MI:SS.FF3TZHTZM') FROM dual;