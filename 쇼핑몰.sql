create table goods(
	gid char(11) primary key not null,
    title varchar(500) not null,
    price int default 0,
    brand varchar(500),
    image varchar(500),
    regDate datetime default now()
);

desc goods;

select * from goods;
select * from goods order by regDate desc;
select count(*) from goods;

drop table goods;

select * from goods where title like "%독도%";
ALTER TABLE goods ADD category3 VARCHAR(255);
ALTER TABLE goods ADD link VARCHAR(255);
ALTER TABLE goods ADD mallName VARCHAR(255);

create table users(
	uid varchar(20) not null primary key,
    upass varchar(200) not null,
    uname varchar(20) not null
);
desc users;

insert into users(uid, upass, uname)
values('red', 'red', '붉은사람');

insert into users(uid, upass, uname)
values('blue', 'blue', '푸른사람');

insert into users(uid, upass, uname)
values('sky', 'sky', '넓은사람');

insert into users(uid, upass, uname)
values('black', 'black', '검은사람');

insert into users(uid, upass, uname)
values('green', 'green', '눈편한사람');

insert into users(uid, upass, uname)
values('orange', 'orange', '뜨끈한복치');

insert into users(uid, upass, uname)
values('admin', 'admin', '관리자');

select * from users;

create table cart(
	uid varchar(20) not null,
    gid char(11) not null,
    qnt int default 0,
    primary key(uid, gid),
    foreign key(uid) references users(uid),
    foreign key(gid) references goods(gid)
);
desc cart;

select * from cart;

select c.*, g.title, g.price, g.image
from cart c, goods g
where c.gid=g.gid;

create view view_cart as
select c.*, g.title, g.price, g.image
from cart c, goods g
where c.gid=g.gid;

select * from view_cart;

create table favorite(
	uid varchar(20) not null,
    gid char(11) not null,
    regDate datetime default now(),
    primary key(uid, gid),
    foreign key(uid) references users(uid),
    foreign key(gid) references goods(gid)
);
desc favorite;

insert into favorite(uid, gid)
values('red','24700921936');

insert into favorite(uid, gid)
values('red','39160973682');

insert into favorite(uid, gid)
values('blue','39160973682');

insert into favorite(uid, gid)
values('sky','24700921936');

insert into favorite(uid, gid)
values('orange','39322810148');

insert into favorite(uid, gid)
values('black','41376626333');

insert into favorite(uid, gid)
values('red','41376626333');

insert into favorite(uid, gid)
values('blue','45563263312');


select * from favorite;

select * from favorite where uid='red';
select * from favorite where gid='24700921936';

select *, 
(select count(*) from favorite f where uid='red' and f.gid=g.gid) ucnt,
(select count(*) from favorite f where f.gid=g.gid) fcnt
from goods g
order by regDate desc;

select * from goods;


create table review(
	rid int auto_increment primary key,
    gid char(11) not null,
    uid varchar(20) not null,
    content text not null,
    revDate datetime default now(),
    foreign key(uid) references users(uid),
    foreign key(gid) references goods(gid)
);
desc review;

select * from review;

delete from review where uid='blue';

insert into review(gid, uid, content)
select gid, uid, content from review;

select count(*) from review;


create table purchase(
	pid char(13) not null primary key,
    uid varchar(20) not null,
    rname varchar(20) not null,
    rphone varchar(20) not null,
    radd1 varchar(500) not null,
    radd2 varchar(500) not null,
    pdate datetime default now(),
    sum int default 0,
    status int default 0, /* 0: 결제대기, 1: 결제확인, 2:배송준비, 3: 배송중 4:배송완료 5:주문완료 */
    foreign key(uid) references users(uid)
);

desc purchase;

create table orders(
	pid char(13) not null,
    gid char(11) not null,
    price int default 0,
    qnt int default 0,
    primary key(pid, gid),
    foreign key(pid) references purchase(pid),
    foreign key(gid) references goods(gid)
);

desc orders;
drop table orders;

alter table users add column phone varchar(20);
alter table users add column add1 varchar(500);
alter table users add column add2 varchar(500);

desc users;

update users
set phone = "010-0000-0000",
add1 = "경기 이천시 구만리로 191",
add2 = "이천롯데캐슬골드스카이 104동"
where uid = "red";

select * from users;
select * from purchase;
select * from orders;
select * from orders where pid="f5481611-564a";


delete from purchase
where pid > "";

delete from orders
where pid > "";

select o.*, g.title, g.image
from orders o, goods g
where o.gid=g.gid;

create view view_orders as
select o.*, g.title, g.image
from orders o, goods g
where o.gid=g.gid;

select * from view_orders where pid="f5481611-564a";


select * from purchase where radd1 like '%이천%' order by pdate desc limit 0, 4;



