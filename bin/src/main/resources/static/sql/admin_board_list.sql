drop table Adn cascade constraints purge;
CREATE TABLE Adn(
 ADN_NUMBER   NUMBER, --글번호
 ADN_NAME		VARCHAR2(30), --작성자
 ADN_PASS   VARCHAR2(30), -- 비밀번호
 ADN_SUBJECT  VARCHAR2(300), --제목
 ADN_CONTENT   VARCHAR2(4000), --내용
 ADN_FILE   VARCHAR2(50), --첨부파일명 가공
 ADN_ORIGINAL VARCHAR2(50), --첨부파일명
 ADN_MAINCOLUMN VARCHAR2(50), --메인글 구분.
 ADN_DATE DATE,  --글의 작성날짜
 PRIMARY KEY(ADN_NUMBER)
 );
 
 select * from Adn;
insert into Adn values(4,'admin','1234','test4','test합니다','1','0','0',sysdate);
                                                                    --
                                                                
--0일때는 일반 글 
--1일때는 공지사항 메인으로 글 메인글일시 - 1 을 입력 -
--test는 1234번 글을 생성하고 2,3번글을 메인공지로 갈수있도록 해보기


select * from
			(select rownum rnum, b.*
			 from
			 	(select * from Adn
			 	 order by ADN_MAINCOLUMN desc,
			 	 ADN_DATE desc)b
			 where rownum <= 10
			)
		where rnum  >=  1 and rnum <= 10;	
		
 
 SELECT * FROM BOARD2;
 
 
 select *
 from emp,dept;
 
 select nvl(max(board_num),0)+1 from board
 
 
	 delete from board
     select * from comm
     
  select * from board;
  
  
  
  
select *  from(select b.*, rownum rnum  
                 from(select * from member  
                        where id != 'admin' and id like ? order by id) 
                        b) 
                          where rnum>=? and rnum<=?  
                          
                          
 트리거 문제
 create table emp01
 as
 select * from emp;
 
 select * from emp;
 
create table temp
as
select ename,job,empno from EMP 
where 1=0

create or replace trigger emp01_temp
after delete
on emp01
for each row
begin
	insert into temp
	values(:old.ename, :old.job, :old.empno);
	end;
	
	cmd에서는 /추가.
	
	select * from emp01;
	
	  7369 SMITH  CLERK     7902 1980-12-17 00:00:00.0  800 NULL     20
  7499 ALLEN  SALESMAN  7698 1981-02-20 00:00:00.0 1600  300     30
  7521 WARD   SALESMAN  7698 1981-02-22 00:00:00.0 1250  500     30
  7566 JONES  MANAGER   7839 1981-04-02 00:00:00.0 2975 NULL     20
  7654 MARTIN SALESMAN  7698 1981-09-28 00:00:00.0 1250 1400     30
  7698 BLAKE  MANAGER   7839 1981-05-01 00:00:00.0 2850 NULL     30
  7782 CLARK  MANAGER   7839 1981-06-09 00:00:00.0 2450 NULL     10
  7788 SCOTT  ANALYST   7566 1987-07-13 00:00:00.0 3000 NULL     20
  7839 KING   PRESIDENT NULL 1981-11-17 00:00:00.0 5000 NULL     10
  7844 TURNER SALESMAN  7698 1981-09-08 00:00:00.0 1500    0     30
  7876 ADAMS  CLERK     7788 1987-07-13 00:00:00.0 1100 NULL     20
  7900 JAMES  CLERK     7698 1981-12-03 00:00:00.0  950 NULL     30
  7902 FORD   ANALYST   7566 1981-12-03 00:00:00.0 3000 NULL     20
  7934 MILLER CLERK     7782 1982-01-23 00:00:00.0 1300 NULL     10

	total 14
	
	select * from temp;
	
	0
	
	delete emp01 where deptno=20;
	
 select *from user_triggers

	drop trigger EMP01_TEMP;
 
	select *from temp;
	
	
 select * 
	  from ( select rownum rnum, b.*
	          from  (select * 
	                 from member  
	                 where member_id != 'admin'
	                 <include refid="search_"/>
	                   order by member_id
	                  )b 
	           where rownum &lt;=  #{end}    
	        ) 
	  where rnum &gt;= #{start} and rnum  &lt;=  #{end}	
	  
	  
--sql 파일에 있는것 실행해보기

	  select * from
			(select rownum rnum, b.*
			 from
			 	(select * from Adn
			 	 order by ADN_MAINCOLUMN desc,
			 	 ADN_DATE desc) b
			 where rownum <=10
			)
		where rnum >= 1 and rnum <= 10	
	  
	  
	
	
	
 