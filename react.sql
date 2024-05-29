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
delete from books where bid="109";
select *, date_format(regDate, "%Y-%m-%d %H시-%i분-%s초 %d일") fmtdate, format(price,0) fmtprice from books order by bid desc limit 0,5;


