drop table Abn cascade constraints purge;
CREATE TABLE Abn(
 ABN_NUMBER   NUMBER, --글번호
 ABN_NAME      VARCHAR2(30), --작성자
 ABN_DIVISION VARCHAR2(100), --'일반' '공지' 구분
 ABN_SUBJECT  VARCHAR2(300), --제목
 ABN_CONTENT   VARCHAR2(4000), --내용
 ABN_DATE DATE,  --글의 작성날짜
 ABN_FILE   VARCHAR2(1000), --첨부파일명 가공
 ABN_ORIGINAL VARCHAR2(1000), --첨부파일명
 PRIMARY KEY(ABN_NUMBER)
 );
 
 SELECT * FROM ABN;

drop sequence Abn_seq;

create sequence Abn_seq;

      select z.*, rownum rnum  from
      
		 (select d.*, rownum rnum 
        
       			  from 
						(
       			  
       			  select c.*, rownum rnum
						
							from (


		       			select ROWNUM, x.*
		       			   from
				       			 (
				       			select a.* from Aam a order by a.aam_ansdate desc
				       			 )x				
		       			 
       					  )c  where AAM_ANSCHECK IN ('답변대기','답변완료') and AAM_SUBJECT like %% order by AAM_ANSCHECK ASC
            	
            	       )d where rownum <10
             )z
      where rnum >1 and rnum <10


     
   
   
   
 