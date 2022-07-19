create database board;
use board;

create table board(
	bon int auto_increment primary key, -- auto_increment는 자동으로 숫자를 순차적으로 나열해줌 1,2,3,4
    title varchar(50) not null,
    content varchar(1000) ,
    writer varchar(5) ,
    regdate datetime default now(), -- now() 현재날짜와 현재시간을 출력해주는 함수
    cnt int default 0,
    id varchar(20)

);

insert into board(title,content,writer,id)
		   values('안녕','운영진입니다.','운영진','admin'),
				 ('제목','내용 추가','정자바','aaaa1234');
				
select * from board;