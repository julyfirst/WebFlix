drop table tbl_board;
drop table tbl_reply;
drop sequence seq_board;
drop sequence seq_reply;;
drop table authorities;
drop table users;
drop table tbl_member_auth;
drop table tbl_member;
drop table persistent_logins;


create sequence seq_board;

create table tbl_board(
	bno number(10,0),
	title varchar2(200) not null,
	content varchar2(2000) not null,
	writer varchar2(50) not null,
	regdate date default sysdate,
	updatedate date default sysdate
);

alter table tbl_board add constraint pk_board primary key(bno);

insert into tbl_board(bno,title,content,writer) values(seq_board.nextval, '테스트 제목','테스트 내용', 'user00');
-- bno라는 칼럼을 이용해 해당 댓글이 어떤 게시물의 댓글인지를 명시하도록 함
-- 댓글 자체는 단독으로 CRUD가 가능하므로 별도의 PK를 부여하도록하고 외래키 설정을 통해 tbl_board 테이블을 참조하도록 설정
create table tbl_reply(
	rno number(10,0),
	bno number(10,0) not null,
	reply varchar2(1000) not null,
	replyer varchar2(50) not null,
	replyDate date default sysdate,
	updateDate date default sysdate
);

create sequence seq_reply;
alter table tbl_reply add constraint pk_reply primary key(rno);

alter table tbl_reply add constraint fk_reply_board foreign key(bno) references tbl_board(bno);
-- 인덱스 생성 
-- 사용이유 : 정렬을 피할 수 있음
create index idx_reply on tbl_reply(bno desc, rno asc);

-- 연습
select /*+INDEX(tbl_reply, idx_reply)*/
	rownum rn, bno, rno, reply, replyer, replyDate, updateDate
	from tbl_reply
	where bno = 5302 --(게시물번호_)
	and rno > 0
	
select rno, bno, reply, replyer, replydate, updatedate
from
	(
		select /*+INDEX(tbl_reply idx_reply)*/
			rownum rn, bno, rno, reply, replyer, replyDate, updatedate
		from tbl_reply
		where bno = 게시물 번호
			and rno > 0
			and rownum <= 20
	)where rn > 10
;
-- 쓰지않기******
-- 회원가입 user table xxxxx
create table users(
	username varchar2(50) not null primary key,
	password varchar2(50) not null,
	enabled char(1) default '1'
);
-- 권한테이블 xxxx
create table authorities(
	username varchar2(50) not null,
	authority varchar2(50) not null,
	constraint fk_authorities_users foreign key(username) references users(username)
); 

create unique index ix_auth_username on authorities(username, authority);

insert into users(username, password) values('user00', 'pw00');
insert into users(username, password) values('member00', 'pw00');
insert into users(username, password) values('admin00', 'pw00');


insert into authorities(username, authority) values('user00', 'ROLE_USER');
insert into authorities(username, authority) values('member00', 'ROLE_MANAGER');
insert into authorities(username, authority) values('admin00', 'ROLE_MANAGER');
insert into authorities(username, authority) values('admin00', 'ROLE_ADMIN');
commit;--여기까지 쓰지 않기 *****

----  인증  / 권한을 위한 테이블(수정버전) 20-05-27 이걸로 !!
drop sequence seq_member;
create sequence seq_member
  start with 0
  increment BY 1
  minvalue 0
  maxvalue 10000;
-- 멤버테이블
create table tbl_member(
	id number(10) constraint pk_member primary key, -- 회원번호
	userid varchar2(50) not null, -- 유저 아이디
	userpw varchar2(100) not null, -- 유저 패스워드
	username varchar2(100) not null, -- 이름
	email varchar2(100) not null,-- 이메일
	phonenumber varchar2(20) default '010-1234-1234', -- 핸드폰번호
	birth_date varchar2(20) default sysdate, -- 생일
	regdate date default sysdate, -- 가입일
	updatedate date default sysdate, -- 수정일
	enabled char(1) default '1' -- 계정사용여부
);
-- 인증 관련된 테이블 
create table tbl_member_authorities(
	id 	number(10) not null,
	userid varchar2(50) not null,
	authorities varchar2(50) not null,
	constraint fk_member_authorities foreign key(id) references tbl_member(id)
);

-- 자동로그인
create table persistent_logins(
	username varchar2(64) not null,
	series varchar2(64) primary key,
	token varchar2(64) not null,
	last_used timestamp not null
);
-- 영화 테이블, 주문 테이블

drop table tbl_movie;
drop table tbl_order;
drop SEQUENCE seq_order;


create sequence seq_order -- 주문 인덱스 번호
  start with 0
  increment BY 1
  minvalue 0
  maxvalue 10000;
create sequence seq_movie -- 영화 인덱스 번호
  start with 0
  increment BY 1
  minvalue 0
  maxvalue 10000;
  
  

-- 영화 테이블
create table tbl_movie(
	movie_id number(10)constraint pk_movie_id primary key, -- 영화코드
	movie_name varchar2(50) , -- 영화 이름
    movie_genre varchar2(100) not null, -- 장르
	movie_price1 varchar2(100) not null,-- 원가
	movie_price2 varchar2(100) not null,-- 판매가	
	movie_releasedate date default sysdate, -- 개봉일
	movie_regdate date default sysdate, -- 영화 등록일
	enabled char(1) default '1'
);
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '루키스', '액션', '10,000', '8,000');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '리벤지', '액션', '10,000', '8,500');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '킬러의 보디가드', '액션', '10,000', '8,500');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '비커밍 제인', '멜로', '10,000', '8,500');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '동감', '멜로', '10,000', '8,500');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '레이니 데이 인 뉴욕', '멜로', '10,000', '8,500');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '호텔 레이크', '공포', '10,000', '8,000');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '그집', '공포', '10,000', '8,000');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '오픈 더 도어', '공포', '10,000', '8,000');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '루팡 3세: 더 퍼스트', '애니', '10,000', '7,000');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '날씨의 아이', '애니', '10,000', '7,000');
insert into tbl_movie(movie_id, movie_name, movie_genre, movie_price1, movie_price2) values (seq_movie.nextval, '이별의 아침에 약속의 꽃을 장식하자', '애니', '10,000', '7,000');
-- 구매목록 테이블(주문)

create table tbl_order(
	id number(10) constraint pk_order primary key, -- 주문 번호
	movie_id number(10) , -- 영화코드에 대한 FK 역할 병행
    member_id number(10) , -- 회원에 대한 FK 역할 병행
    purchase_date date default sysdate, -- 구입한날짜  
    deal_price varchar2(50),    --거래 금액
    delivery_complete char(1) default '1',  -- download 등의 각종 수단으로 배달/배송 완료 여부
    constraint fk_movie_id foreign key(movie_id) references tbl_movie(movie_id),
    constraint fk_member_id foreign key(member_id) references tbl_member(id)
);


-- 20-06-24 댓글 수 보기
alter table tbl_board add(replycnt number default 0);
-- 기존에 댓글이 존재했다면 replyCnt에 반영해 두어야 하므로 아래쿼리 실행        
update tbl_board set replycnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);


insert into tbl_board(bno, title, content, writer)
values(seq_board.nextval, '안녕하세요', '테스트 내용', '이순신');

insert into tbl_board(bno, title, content, writer)
values(seq_board.nextval, '영화추천', '영화 뭐가 재밌나요?', '이상현');

insert into tbl_board(bno, title, content, writer)
values(seq_board.nextval, '예고편', '예고편이 뭘까', '세종대왕');

insert into tbl_board(bno, title, content, writer)
values(seq_board.nextval, '자유게시판 테스트', '자유게시판 테스트', '김유신');

insert into tbl_board(bno, title, content, writer)
values(seq_board.nextval, '반가워용', '반가워용 테스트', '나친절');





  