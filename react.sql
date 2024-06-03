create table users(
	uid varchar(20) not null primary key,
    upass varchar(200) not null,
    uname varchar(20) not null,
	add1 varchar(500),
    add2 varchar(500),
    phone varchar(20),
    photo varchar(200),
    regDate datetime default now()
);

desc users;
drop table users;

insert into users(uid, upass, uname)
values("blue", "blue", "파란인간");

insert into users(uid, upass, uname)
values("red", "red", "빨간인간");

insert into users(uid, upass, uname)
values("green", "green", "초록인간");

insert into users(uid, upass, uname)
values("orange", "orange", "뜨끈한복치");

select * from users;

update users set phone = "010-4444-4444", add1 = "서울 관악구 신림로29길 8", add2="신림현대아파트 107동" where uid= "green";
update users set photo = null where uid = "red";


create table books (
	bid int auto_increment primary key, 
    title varchar(500) not null,
    price int default 0,
    contents text,
    isbn varchar(100),
    publisher varchar(100),
    image varchar(200),
    author varchar(200),
    regDate datetime default now()
);
desc books;
drop table books;

select * from books;
select count(*) from books;
delete from books where bid="118";
select *, date_format(regDate, "%Y-%m-%d %H시-%i분-%s초 %d일") fmtdate, format(price,0) fmtprice from books order by bid desc limit 0,5;

alter table books add column updateDate datetime;

alter table books drop column updatedate;
desc books;
alter table books add column bigimage varchar(200);


create table likes(
	uid varchar(20) not null,
    bid int not null,
    regDate datetime default now(),
    primary key(uid, bid),
    foreign key(uid) references users(uid),
    foreign key(bid) references books(bid)
);

desc likes;
select * from likes;


select *,date_format(regdate,'%Y-%m-%d') fmtdate,format(price,0) fmtprice,
(select count(*) from likes where books.bid=likes.bid) lcnt,
(select count(*) from likes where books.bid=likes.bid and uid='green') ucnt
from books
order by bid desc
limit 0, 6;

select *,date_format(regdate,'%Y-%m-%d') fmtdate,format(price,0) fmtprice,
(select count(*) from likes where books.bid=likes.bid) lcnt,
(select count(*) from likes where books.bid=likes.bid and uid='green') ucnt
from books
where bid=119;

create table review(
	rid int auto_increment primary key,
    bid int not null,
    uid varchar(20) not null,
    contents text not null,
    regDate datetime default now(),
    foreign key(bid) references books(bid),
    foreign key(uid) references users(uid)
	
);

desc review;
select * from review;

drop view view_review;

create view view_review as
select r.*, u.uname, u.photo, date_format(r.regdate, '%Y-%m-%d %T') fmtdate
from review r, users u
where r.uid=u.uid;

select * from view_review
where bid='117'
order by rid desc
limit 0, 3;


/* 리뷰개수 */
select *,date_format(regdate,'%Y-%m-%d') fmtdate,format(price,0) fmtprice,
(select count(*) from likes where books.bid=likes.bid) lcnt,
(select count(*) from likes where books.bid=likes.bid and uid='red') ucnt,
(select count(*) from review where books.bid=review.bid) rcnt
from books
order by bid desc
limit 0, 6;

create table cart(
	uid varchar(20) not null,
    bid int not null,
    qnt int default 1,
    regDate datetime default now(),
    primary key(uid, bid),
    foreign key(bid) references books(bid),
    foreign key(uid) references users(uid)
);

drop table cart;
desc cart;
select * from cart;



select c.*, b.title, b.image
from cart c, books b
where c.bid=b.bid;

create view view_cart as
select c.*, b.title, b.image, b.price, format(b.price,0) fmtprice
from cart c, books b
where c.bid=b.bid;

select * from view_cart;
drop view view_cart;

select * from view_cart where uid="red" order by regDate desc;


create table purchase( 
	pid char(13) not null primary key,
    uid varchar(20) not null,
    uname varchar(20) not null,
    phone varchar(20) not null,
    add1 varchar(500) not null,
    add2 varchar(500) not null,
    pdate datetime default now(),
    sum int default 0,
    status int default 0, /*0:결제대기,1:결제확인,2:배송준비,3:배송완료, 4.주문완료*/
    foreign key(uid) references users(uid)
);

desc purchase;
select * from purchase;


create table orders(
	pid char(13) not null,
    bid int not null,
    price int default 0,
    qnt int default 0,
    primary key(pid, bid),
    foreign key(pid) references purchase(pid),
    foreign key(bid) references books(bid)
);

desc orders;
select * from orders;









