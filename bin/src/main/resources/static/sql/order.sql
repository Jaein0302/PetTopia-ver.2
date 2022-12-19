drop table ORDERINFO cascade constraints purge;

create table ORDERINFO(
order_id     	NUMBER(15) PRIMARY KEY,			--주문번호
order_member_id references member(member_id) on delete cascade, --주문아이디
order_item_id   references item(item_id) on delete cascade,	 --상품번호
order_price  	NUMBER(20),			--가격
order_seller 	VARCHAR(50),		--판매자
order_address	VARCHAR(100),		--판매자 주소
order_date 		DATE,				--예약날짜


)

insert into orderInfo
values (1, 20001, 'buyer1', 1, 1000)

select * from ORDERINFO