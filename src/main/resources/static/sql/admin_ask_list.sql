drop table Aam cascade constraints purge;
drop sequence Aam_seq

--Adn 테이블 == 공지사항 게시판
Aam  AAM_ANSCHECK

--admin_askmember == Aam
CREATE TABLE Aam(
 AAM_NUMBER      NUMBER, --글번호
 AAM_NAME       VARCHAR2(300) references member(member_id) on delete cascade, --작성자
 AAM_SUBJECT     VARCHAR2(300), --제목
 AAM_CONTENT      VARCHAR2(2000), -- 내용
 AAM_DATE         DATE,  --글의 작성날짜
 AAM_ANSCHECK      VARCHAR2(1000) DEFAULT '답변대기',
 PRIMARY KEY(AAM_NUMBER) --글은 삭제 되지 않으며 중복되지 않는다.
 );
 
delete Aam where AAM_NUMBER=23
select * from aam;
 
--1:1문의 글쓰기 시퀀스
create sequence Aam_seq;


select * from Aam order by aam_ansdate desc;
      order by aam_number
      
      
       			select ROWNUM, x.*
		       			   from
				       			 (
				       			select a.* from Aam a order by a.aam_ansdate desc
				       			 )x
      
      
      
      
      
      
 	select * from (
					select b.*,rownum1 rnum3
							from (
						select z.*,rownum rownum1 from (
			      						
												select ROWNUM, x.*
					       			                  from
							       		                	 (
							       		          				select a.* from Aam a order by a.aam_ansdate desc
							       		             		  )x	
									
				       		             		   ) z 
				       		             		   
										where AAM_ANSCHECK IN ('답변대기','답변완료') and AAM_SUBJECT like '6565' order by AAM_ANSCHECK ASC 
									  )b
								where rownum1 <10
					)
			   where rnum3 > 1 and rnum3 < 10


      select * from aam
      
      
      
      
      
      
      
      
   
   
   
 