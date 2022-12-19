drop table COMMUNITY_COMM cascade constraints purge;
drop sequence comm_seq;

create table COMMUNITY_COMM(
COMMENT_NUM       number       primary key,
COMMENT_NAME      VARCHAR2(15) references member(MEMBER_ID),
COMMENT_CONTENT      varchar2(200),
COMMENT_DATE      date,
COMMENT_COMMU_NUM  references community(COMMU_NUM) on delete cascade
                                 --COMMUNITY_COMM테이블이 참조하는 보드 글 번호
);

--댓글 시퀀스
create sequence comm_seq;


insert into COMMUNITY_COMM values(comm_seq.nextval,'admin','댓글내용111',sysdate,1)


select * 
		from(select rownum rnum, c.*
		  from(select *
		  		 from community_comm
		  		 where comment_commu_num = 1
		  		 order by comment_date desc
		  		 ) c
		  where rownum <= 10
		)
		where rnum between 1 and 10
