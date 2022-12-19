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
select * from member

-- 관리자 아이디 : admin / 비번 : 123
insert into member values ('admin','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','관리자','12345','서울','admin@pet.pet','010-1234-5678',null,null,'ROLE_ADMIN');
-- ▼▼▼ 기업 아이디 ▼▼▼   비번 : 123

-- 동물병원
insert into member values ('treat1','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','쓰담쓰담동물병원','12345','서울특별시 종로구 신영동 249-6','ssudam@pet-topia.pet','010-1234-5678','동물병원','1234567890','ROLE_SELLER');
insert into member values ('treat2','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','올리브동물병원','12345','서울특별시 종로구 홍지동 126-8','olive@pet-topia.pet','010-1234-5678','동물병원','1234567890','ROLE_SELLER');
-- 교육
insert into member values ('edu1','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','왈독 애견유치원','12345','서울특별시 도봉구 도봉로 586','waldog@pet-topia.pet','010-1234-5678','훈련기관','1234567890','ROLE_SELLER');
insert into member values ('edu2','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','디어코코','12345','서울 중구 동호로12길 88','dearcoco@pet-topia.pet','010-1234-5678','훈련기관','1234567890','ROLE_SELLER');
-- 미용
insert into member values ('beauty1','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','나나애견','12345','서울 종로구 지봉로 72-1','nana@pet-topia.pet','010-1234-5678','애견미용','1234567890','ROLE_SELLER');
insert into member values ('beauty2','$2a$10$sX/mIDAPPnFr5CZJ.zV0m.k2p5urxQXEobZ3n4yQaYciajryqIzVe','도그스푼','12345','서울 서대문구 홍은중앙로3길 22','dogspoon@pet-topia.pet','010-1234-5678','애견미용','1234567890','ROLE_SELLER');


-- 수술/치료
insert into item values(10001,'중성화 수술','treat',100000,'소형견 수컷 중성화 수술','소형견_수컷_중성화.jpg','/2022-10-10/소형견_수컷_중성화.jpg',sysdate,sysdate,null,'male','S','dog','서울특별시 종로구 신영동 249-6','treat1','treat1');
insert into item values(10002,'중성화 수술','treat',100000,'소형견 암컷 중성화 수술','소형견_암컷_중성화.jpg','/2022-10-10/소형견_암컷_중성화.jpg',sysdate,sysdate,null,'female','S','dog','서울특별시 종로구 신영동 249-6','treat1','treat1');
insert into item values(10003,'건강검진','treat',20000,'반려견 · 반려묘 건강검진','건강검진.jpg','/2022-10-10/건강검진.jpg',sysdate,sysdate,null,'male','S','dog','서울특별시 종로구 신영동 249-6','treat1','treat1');
insert into item values(10004,'스케일링','treat',50000,'반려견 · 반려묘 스케일링','스케일링.jpg','/2022-10-10/스케일링.jpg',sysdate,sysdate,null,'male','S','dog','서울특별시 종로구 신영동 249-6','treat1','treat1');
insert into item values(10005,'스케일링','treat',50000,'반려견 · 반려묘 스케일링','스케일링2.jpg','/2022-10-10/스케일링2.jpg',sysdate,sysdate,null,'male','S','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');
insert into item values(10006,'슬개골탈구','treat',200000,'반려견 · 반려묘 슬개골탈구 수술','슬개골탈구.jpg','/2022-10-10/슬개골탈구.jpg',sysdate,sysdate,null,'male','S','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');
insert into item values(10007,'중성화 수술','treat',200000,'중형견 수컷 중성화 수술','중형견_수컷_중성화.jpg','/2022-10-10/중형견_수컷_중성화.jpg',sysdate,sysdate,null,'male','M','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');
insert into item values(10008,'중성화 수술','treat',200000,'중형견 암컷 중성화 수술','중형견_암컷_중성화.jpg','/2022-10-10/중형견_암컷_중성화.jpg',sysdate,sysdate,null,'female','M','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');
insert into item values(10009,'중성화 수술','treat',300000,'대형견 수컷 중성화 수술','대형견_수컷_중성화.jpg','/2022-10-10/대형견_수컷_중성화.jpg',sysdate,sysdate,null,'male','L','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');
insert into item values(10010,'중성화 수술','treat',300000,'대형견 암컷 중성화 수술','대형견_암컷_중성화.jpg','/2022-10-10/대형견_암컷_중성화.jpg',sysdate,sysdate,null,'female','L','dog','서울특별시 종로구 홍지동 126-8','treat2','treat2');

--교육
insert into item values(20001,'애견 유치원','education',220000,'반려견을 위한 애견 유치원','애견유치원.jpg','/2022-10-10/애견유치원.jpg',sysdate,sysdate,null,'null','null','null','서울특별시 도봉구 도봉로 586','edu1','edu1');
insert into item values(20002,'반려견 1:1 훈련','education',99000,'보호자와 함께하는 반려견 훈련!','반려견1대1훈련.jpg','/2022-10-10/반려견1대1훈련.jpg',sysdate,sysdate,null,'null','null','null','서울특별시 도봉구 도봉로 586','edu1','edu1');
insert into item values(20003,'기초 교육','education',80000,'초보 반려인을 위한 기본 교육','반려견훈련.jpg','/2022-10-10/반려견훈련.jpg',sysdate,sysdate,null,'null','null','null','서울특별시 도봉구 도봉로 586','edu1','edu1');
insert into item values(20004,'사회화 교육','education',120000,'반려견의 사회화 이론과 기초 교육 방법의 이해','애견유치원1.jpg','/2022-10-10/애견유치원1.jpg',sysdate,sysdate,null,'null','null','null','서울특별시 도봉구 도봉로 586','edu1','edu1');
insert into item values(20005,'애견 유치원','education',182000,'걱정없이 안심하는 완벽 개린이집!','애견유치원2.jpg','/2022-10-10/애견유치원2.jpg',sysdate,sysdate,null,'null','null','null','서울 중구 동호로12길 88','edu2','edu2');
insert into item values(20006,'1:1방문교육','education',150000,'편안한 집에서 편안한 마음으로 행동교정 받자!','방문교육.jpg','/2022-10-10/방문교육.jpg',sysdate,sysdate,null,'null','null','null','서울 중구 동호로12길 88','edu2','edu2');

--미용
insert into item values(30001,'소형견 미용','beauty',20000,'세상 귀여운 소형견 미용, 더 합리적으로 받자!','소형견미용.jpg','/2022-10-10/소형견미용.jpg',sysdate,sysdate,null,'null','null','null','서울 종로구 지봉로 72-1','beauty1','beauty1');
insert into item values(30002,'중형견 미용','beauty',28000,'전문가 선생님의 손길로 완전 대박 예쁘게~ ','애견미용1.jpg','/2022-10-10/애견미용1.jpg',sysdate,sysdate,null,'null','null','null','서울 종로구 지봉로 72-1','beauty1','beauty1');
insert into item values(30003,'강아지 목욕 서비스','beauty',30000,'아이 맞춤 목욕과 서비스를 경험해요!','목욕.jpg','/2022-10-10/목욕.jpg',sysdate,sysdate,null,'null','null','null','서울 종로구 지봉로 72-1','beauty1','beauty1');
insert into item values(30004,'단독 촬영','beauty',100000,'소중하고 아름다운 그 순간, 가장 예쁘게 담아보세요!','사진촬영1.jpg','/2022-10-10/사진촬영1.jpg',sysdate,sysdate,null,'null','null','null','서울 종로구 지봉로 72-1','beauty1','beauty1');
insert into item values(30005,'애견 미용','beauty',30000,'섬세한 애견 미용','애견미용.jpg','/2022-10-10/애견미용.jpg',sysdate,sysdate,null,'null','null','null','서울 서대문구 홍은중앙로3길 22','beauty2','beauty2');
insert into item values(30006,'애견 스파','beauty',50000,'애견 스파','애견스파.jpg','/2022-10-10/애견스파.jpg',sysdate,sysdate,null,'null','null','null','서울 서대문구 홍은중앙로3길 22','beauty2','beauty2');
insert into item values(30007,'사진 촬영','beauty',100000,'아이와 진짜 가족사진을 남겨보세요!','사진촬영.jpg','/2022-10-10/사진촬영.jpg',sysdate,sysdate,null,'null','null','null','서울 서대문구 홍은중앙로3길 22','beauty2','beauty2');

