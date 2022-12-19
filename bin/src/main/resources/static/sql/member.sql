DROP TABLE MEMBER CASCADE CONSTRAINTS PURGE;
create table member(
   MEMBER_ID VARCHAR2(15) primary key, --아이디
   MEMBER_PASSWORD VARCHAR2(60),  --패스워드
   MEMBER_NAME VARCHAR2(30),      --이름(기업명)
   MEMBER_POST CHAR(5),           --우편번호
   MEMBER_ADDRESS VARCHAR2(150),  --주소
   MEMBER_EMAIL VARCHAR2(30),     --이메일
   MEMBER_TELL VARCHAR2(30),      --연락처
   MEMBER_BTYPE VARCHAR2(30),     --업종
   MEMBER_REGNUM CHAR(10),        --사업자 등록번호
   AUTH VARCHAR2(100) not null    --권한
);

delete member;

-- 관리자 아이디 : admin / 비번 : 123
insert into member values ('admin','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','관리자','12345','서울','admin@pet.pet','010-1234-5678',null,null,'ROLE_ADMIN');

-- ▼▼▼ 기업 아이디 ▼▼▼   비번 : 123

-- 동물병원
insert into member values ('treat1','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','쓰담쓰담동물병원','12345','서울특별시 종로구 신영동 249-6','ssudam@pet-topia.pet','010-1234-5678','동물병원','1234567890','ROLE_MEMBER');
insert into member values ('treat2','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','올리브동물병원','12345','서울특별시 종로구 홍지동 126-8','olive@pet-topia.pet','010-1234-5678','동물병원','1234567890','ROLE_MEMBER');
-- 교육
insert into member values ('edu1','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','왈독 애견유치원','12345','서울특별시 도봉구 도봉로 586','waldog@pet-topia.pet','010-1234-5678','훈련기관','1234567890','ROLE_MEMBER');
insert into member values ('edu2','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','디어코코','12345','서울 중구 동호로12길 88','dearcoco@pet-topia.pet','010-1234-5678','훈련기관','1234567890','ROLE_MEMBER');
-- 미용
insert into member values ('beauty1','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','나나애견','12345','서울 종로구 지봉로 72-1','nana@pet-topia.pet','010-1234-5678','애견미용','1234567890','ROLE_MEMBER');
insert into member values ('beauty2','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','도그스푼','12345','서울 서대문구 홍은중앙로3길 22','dogspoon@pet-topia.pet','010-1234-5678','애견미용','1234567890','ROLE_MEMBER');



