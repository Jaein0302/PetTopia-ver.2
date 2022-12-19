drop table ORDERINFO cascade constraints purge;
create table ORDERINFO(
order_id     	number(30) PRIMARY KEY,			--주문번호
order_member_id references member(member_id) on delete cascade, --주문아이디
order_item_id   references item(item_id) on delete cascade,	 --상품번호
order_item_sellerName varchar2(50), --판매자의 이름
order_item_name varchar2(50), --상품이름
order_item_price number(10), --상품가격
order_time varchar2(100), --예약 시간
order_location varchar2(100), --장소
order_image      VARCHAR2(100), --썸네일
order_seller varchar2(100), --주문할 상품을 판매하는사람, 판매자가 자신의 일정을 확인할때 필요,
order_item_tell varchar2(50), --구매자 연락처
order_member_tell varchar2(50)--판매자 연락처
)

delete ORDERINFO
select * from ORDERINFO

drop sequence order_seq
create sequence order_seq start with 80000 increment by 1;

insert into orderInfo values (
	10000010, 'buyer1', 10001, '해피동물병원', '예방주사',20000, to_char( sysdate , 'YYYY-MM-DD HH24:mm'),
	'서울 종로구 종로 1 (종로1가)','/2022-10-7/bbs202210727516686.jpg', 'treat1');
insert into orderInfo values (
	10000002, 'buyer1', 10001, '해피동물병원', '예방주사2',20000,'2022-10-09 16:30',
	'서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg','seller10');
insert into orderInfo values (
	10000003, 'buyer1', 10001, '해피동물병원', '예방주사',20000,'2022-10-09 14:30',
	'서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg','seller10');
insert into orderInfo values (
	10000004, 'buyer1', 10001, '해피동물병원', '예방주사4',20000,'2022-10-23 16:30',
	'서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg','seller10');
insert into orderInfo values (
	10000005, 'buyer1', 10001, '해피동물병원', '예방주사5',20000,'2022-10-24 11:30',
	'서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg','seller10');
insert into orderInfo values (
	10000006, 'buyer1', 10001, '해피동물병원', '예방주사6',20000, '2022-10-30 12:00',
	'서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg','seller10');
insert into orderInfo values (
	10000007, 'buyer1', 10001, '해피동물병원', '예방주사6',20000,'2022-11-07 12:30',
	'서울 종로구 종로 1 (종로1가)','\2022-10-7\bbs202210741029669.jpg','seller10');


select * from ORDERINFO where to_char(sysdate, 'YYYY. MM. DD. AM HH:MI:SS') > order_time
select to_char(sysdate, 'YYYY. MM. DD. AM HH:MI:SS') from dual


select to_date(sysdate, 'YYYY. MM. DD. AM HH:MI:SS')-to_date(order_time, 'YYYY. MM. DD. AM HH:MI:SS') from ORDERINFO


select to_date(sysdate, 'YYYY. MM. DD. AM HH:MI:SS')-to_date(sysdate, 'YYYY. MM. DD. AM HH:MI:SS') from ORDERINFO

		
		select orderinfo.*
		from orderinfo
		where to_date(sysdate, 'YYYY. MM. DD. AM HH:MI:SS') <= to_date(order_time, 'YYYY. MM. DD. AM HH:MI:SS')
		
		
SELECT  orderinfo.*
FROM ORDERINFO
where TO_TIMESTAMP(TO_CHAR(SYSTIMESTAMP, 'YYYY. MM. DD. AM HH:MI:SS'),'YYYY. MM. DD. AM HH:MI:SS') < TO_TIMESTAMP(order_time, 'YYYY. MM. DD. AM HH:MI:SS') 
