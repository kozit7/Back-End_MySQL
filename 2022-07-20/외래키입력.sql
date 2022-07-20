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


create table board(
	bon int auto_increment primary key, -- auto_increment는 자동으로 숫자를 순차적으로 나열해줌 1,2,3,4
    title varchar(50) not null,
    content varchar(1000) ,
    writer varchar(5) ,
    regdate datetime default now(), -- now() 현재날짜와 현재시간을 출력해주는 함수
    cnt int default 0,
    id varchar(20)

);
-- alter문으로 foreign key 설정
-- alter table 자식테이블명 add contraint 제약조건명
-- foreign key(자식테이블 컬럼명)references 부모 테이블명(부모테이블 필드명)
alter table board add constraint boardid_fk
foreign key(id) references member(id)
on delete cascade -- 기존테이블 데이터 삭제시 자식테이블 데이터도 자동 삭제
on update cascade -- 기존테이블 데이터 삭제시 자식테이블 데이터도 자동 변경
;
alter table board drop constraint boardid_fk;

delete from board where bon = '1';

insert into board(title,content,writer,id)
		   values('안녕','운영진입니다.','운영진','admin'),
				 ('제목','내용 추가','정자바','aaaa1234');
				
select * from board;

select * from member;

insert into board(title,content,writer,id)
		   values('안녕','운영진입니다.','운영진','zzz1111');
           
delete from member where id='aaaa1234';


