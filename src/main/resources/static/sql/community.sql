drop table community cascade constraints purge;

create table community(
COMMU_NUM NUMBER primary key,   		--글번호
COMMU_NAME 		references member(member_id) on delete cascade,--글쓴이
COMMU_SUBJECT 	VARCHAR2(300),   		--제목
COMMU_CONTENT 	VARCHAR2(4000),   		--내용
COMMU_READCOUNT NUMBER,         		--조회수
COMMU_DATE 		DATE,            		--작성날짜
COMMU_THUMBNAIL VARCHAR2(200), 			--썸네일
COMMU_FILE 		VARCHAR2(100),      	--파일이름
COMMU_ORIGINAL  VARCHAR2(100)			--파일이름(가공)
);


select * from COMMUNITY;
select nvl(max(commu_num),0)+1 from community;

insert into community values(1,'user1','테스트 - 제목 1','테스트 - 내용 1',0,sysdate,null,null,null);
insert into community values(2,'user1','테스트 - 제목 2','테스트 - 내용 2',0,sysdate,null,null,null);
insert into community values(3,'user1','테스트 - 제목 3','테스트 - 내용 3',0,sysdate,null,null,null);
insert into community values(4,'user1','테스트 - 제목 4','테스트 - 내용 4',0,sysdate,null,null,null);
insert into community values(5,'user1','테스트 - 제목 5','테스트 - 내용 5',0,sysdate,null,null,null);
insert into community values(6,'user1','테스트 - 제목 6','테스트 - 내용 6',0,sysdate,null,null,null);
insert into community values(7,'user1','테스트 - 제목 7','테스트 - 내용 7',0,sysdate,null,null,null);
insert into community values(8,'user1','테스트 - 제목 8','테스트 - 내용 8',0,sysdate,null,null,null);
insert into community values(9,'user1','테스트 - 제목 9','테스트 - 내용 9',0,sysdate,null,null,null);
insert into community values(10,'user1','테스트 - 제목 10','테스트 - 내용 10',0,sysdate,null,null,null);
insert into community values(11,'user1','테스트 - 제목 11','테스트 - 내용 11',0,sysdate,null,null,null);
insert into community values(12,'user1','테스트 - 제목 12','테스트 - 내용 12',0,sysdate,null,null,null);



select * 
		from ( select rownum rnum, b.*
		  from (select community.*,  nvl(cnt,0) cnt
				from community left outer join (select COMMUNITY_COMM.COMMENT_COMMU_NUM, count(*) cnt
											 from COMMUNITY_COMM
											 group by COMMUNITY_COMM.COMMENT_COMMU_NUM) c
				on community.COMMU_NUM = c.COMMENT_COMMU_NUM
				order by community.COMMU_NUM desc	) b
		where rownum <= 10 
	) 
where rnum>=1 and rnum<=10


		select *
		 from ( select community.*, nvl(cnt,0) cnt
				from community left outer join (select COMMUNITY_COMM.COMMENT_COMMU_NUM, count(*) cnt
												from COMMUNITY_COMM
												group by COMMUNITY_COMM.COMMENT_COMMU_NUM) c
				on community.COMMU_NUM = c.COMMENT_COMMU_NUM
				order by community.COMMU_NUM desc)
		 order by cnt desc, COMMU_READCOUNT desc