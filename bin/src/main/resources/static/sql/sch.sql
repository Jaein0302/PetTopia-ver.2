drop table sch cascade constraints purge;

create table sch(
sch_id varchar2(100) not null primary key, --구분을 위해
sch_title varchar2(100), --스케줄 제목
sch_allday varchar2(15), --하루종일인지 아닌지 true/false
sch_start varchar2(100), --시작 시간
sch_end varchar2(100), --끝나는 시간
sch_seller varchar2(100) --판매자id
)