drop table Abn cascade constraints purge;
 drop table Aac cascade constraints purge;
 
 drop table Aac cascade constraints purge;
 CREATE TABLE Aac(
 AAC_NUMBER NUMBER references Aam(AAM_NUMBER) on delete cascade,
 AAC_CONTENT VARCHAR2(4000),
 AAC_DATE DATE
);
 
   
   <select id="getAskColumnList" parameterType="java.util.Map" resultType="Aam">
      select *  from
       (select b.*, rownum rnum  
       		from (select *
       			  from Aam where

       			    AAM_ANSCHECK IN ('답변대기','답변완료') and AAM_SUBJECT like ''
            	 
            	     order by AAM_ANSCHECK ASC
            	)b
            	
            	where rownum <10)
      where rnum >1 and rnum <=10
   </select> 