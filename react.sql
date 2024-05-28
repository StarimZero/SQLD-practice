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



