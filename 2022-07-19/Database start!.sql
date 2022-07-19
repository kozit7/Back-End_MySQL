create database information;
use information;
create table member(
	id varchar(20) not null,
    password varchar(30) not null,
    addr varchar(20) not null,
    phone varchar(15),
    email varchar(20),
    name varchar(10),
    age varchar(3)
);
alter table member modify column phone varchar(12);
alter table member modify column id varchar(20) primary key;
-- insert into 테이블명(컬럼명,컬럼명,컬럼명, 컬럼명 ....)
insert into member(id,password,addr,phone,email,name,age)
values('abdc1234','1234','울산','010','green@naver.com','정자바',10);

insert into member(id,password,addr)
values('zzz1111','1234','울산');
-- member테이블에 있는 모든 컬럼을 조회.
-- select 컬럼명 from 테이블명
select * from member;
-- member테이블에있는 id,password,email 컬럼만 조회.
select id, password, email from member;


-- 개명(정자바->정씨샵)
-- update 테이블명
-- set 변경하고자하는 컬럼명 = 값

update member
set name = '정씨샵';


-- 비밀번호 변경
-- update 테이블명
-- set 변경하고자하는 컬럼명 = 값
update member
set password = '5678';

-- member테이블에 있는 모든 컬럼을 조회.
-- select 컬럼명 from 테이블명
-- select * from member;


-- member테이블 중에서 아이디가 'abcd1234'인 데이터에 모든 컬럼을 조회.
-- select 컬럼명
-- from 테이블명
-- where 조건식
 select *
 from member;
 update member
 set name= '정자바'
 where id='abdc1234';

-- 아이디가 'abdc1234'인 데이터는 member테이블에서 삭제
-- delete from 테이블명
-- where 조건식
delete from member
where id='abdc1234';
select *
from member;

insert into member(id,password,addr)
values('aaaa1234','8484','서울'),('bbbb222','9999','부산'); -- values()여기에 , 를 넣으면()2개이상의 행을 넣을수있다.

