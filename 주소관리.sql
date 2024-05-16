drop table jusoes;

create table jusoes(
	uid int auto_increment primary key,
    uname varchar(100) not null,
    add1 varchar(100) not null, 
    add2 varchar(500),
    phone varchar(20),
	photo varchar(200),
	jdate datetime default now()
);

desc jusoes;

insert into jusoes(uname, add1, phone)
values('보선', '인청광역시', '010-4789-1565');
insert into jusoes(uname, add1, phone)
values('병존', '대구광역시', '010-1980-4890');
insert into jusoes(uname, add1, phone)
values('주치', '광주광역시', '010-9023-2456');
insert into jusoes(uname, add1, phone)
values('추태', '광주시', '010-3128-1320');
insert into jusoes(uname, add1, phone)
values('교구', '수원시', '010-6150-8913');
insert into jusoes(uname, add1, phone)
values('탑호', '의왕시', '010-0513-1593');


select * from  jusoes;

/* create view view_jusoes as */

select * from  jusoes order by uid desc;
select uid, uname, add1, phone from jusoes;
insert into jusoes (uname,add1,phone) values('백현','원주시','010-5712-9878');

