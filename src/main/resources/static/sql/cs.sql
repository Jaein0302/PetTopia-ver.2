DROP TABLE cs CASCADE CONSTRAINTS PURGE;
create table CS(
CS_ID VARCHAR2(20) primary key,
CS_SUBJECT VARCHAR2(50) NOT NULL,
CS_CONTENT VARCHAR2(1000)NOT NULL,
cs_writer varchar2(100) not null references member(member_id)
);