desc product;
desc sale;

drop table product;
drop table sale;
drop sequence seq_sale;

create table product(
    code char(3) not null primary key,
    name varchar(100) not null, --100보다길면 toolong에러 --
    price int default 0 
);

create table sale(
    seq int primary key,
    code char(3) not null,
    sale_date date default sysdate,
    qnt int default 1,
    price int default 0,
    foreign key(code) references product (code)
);
desc sale;

insert into product (code, name, price)
values('101', '냉장고', '3500000');
insert into product (code, name, price)
values('102', '세탁기', '2300000');
insert into product (code, name, price)
values('103', '스타일러', '1700000');
insert into product (code, name, price)
values('104', '공기청정기', '750000');


select * from product;

drop sequence seq_sale;
create sequence seq_sale increment by 1 start with 1;
insert into sale(seq, code)
values(seq_sale.nextval, '101');
insert into sale(seq, code)
values(seq_sale.nextval, '102');

insert into sale(seq, code, sale_date)
values(seq_sale.nextval, '102', '24-04-03');



select * from sale;
delete from product where code = '104'; 
update sale set qnt=30 where seq=1;
delete from sale where seq>0;


select p.*, s.* from product p, sale s; --code 101 -> seq 1234 // code 102 -> seq 1234 // code 103 -> seq 1234
select p.*, s.* from product p, sale s where p.code=s.code;


select code,  name, sale_date, sum(qnt)as qnt, price
from view_sale
group by code, name, sale_date, price
order by sale_date, code;
--group by 로 묶어보기


create view view_sale as 
select name, price, s.* 
from product p, sale s 
where p.code=s.code order by seq;

create view view_sale as 
select p.name, s.* 
from product p, sale s 
where p.code=s.code order by seq;

drop view view_sale;
select * from view_sale;

select * from sale where code = '103';

select name, sale_date, sum(qnt) qnt, sum(qnt)*price sum
from view_sale
where code = '101'
group by  name, sale_date, price;

commit;

insert into sale(seq, code, sale_date, qnt, price)
values(seq_sale.nextval, '101', '24-04-01', 3, 3200000);
insert into sale(seq, code, sale_date, qnt, price)
values(seq_sale.nextval, '102', '24-04-02', 1, 1680000);
insert into sale(seq, code, sale_date, qnt, price)
values(seq_sale.nextval, '101', '24-04-01', 1, 3500000);
insert into sale(seq, code, sale_date, qnt, price)
values(seq_sale.nextval, '102', '24-04-03', 1, 1780000);
insert into sale(seq, code, sale_date, qnt, price)
values(seq_sale.nextval, '103', '24-04-04', 2, 1100000);
insert into sale(seq, code, sale_date, qnt, price)
values(seq_sale.nextval, '103', '24-04-04', 1, 1200000);
insert into sale(seq, code, sale_date, qnt, price)
values(seq_sale.nextval, '101', '24-04-05', 1, 3500000);
insert into sale(seq, code, sale_date, qnt, price)
values(seq_sale.nextval, '102', '24-04-06', 1, 1900000);
insert into sale(seq, code, sale_date, qnt, price)
values(seq_sale.nextval, '102', '24-04-03', 1, 1987000);

select * from view_sale;

select sale_date, code, name, sum(qnt), sum(qnt*price) total --이거왜 as를 안하면 JAVA에서 열이름 오류가 난다.
from view_sale
group by sale_date, code, name
order by sale_date, code;




































--create table product(
--    code char(3) not null primary key,/* code는 3자리로 null들어가면안되고 primarykey이다.*/
--    name varchar(100) not null,
--    price int default 0 /* price는int고 값을 입력안하면 0으로 들어간다*/
--); /* 컬럼 정의하기 */
--
--desc product; /* 테이블 구조 확인하기 */
--
--insert into product(code, name, price) /* 괄호안에는 순서대로할거면 안써도된다.*/
--values('101', '냉장고', 3500000); /* 두번누르면 프라이머리키떄문에 오류남 unique constraint (PRODUCT.SYS_C006990) violated */
--insert into product(code, name, price)
--values('102', '세탁기', '2300000');
--insert into product(code, name, price)
--values('103', '스타일러', 1700000); /* 암거도 안넣으면 "cannot insert NULL into (%s)" 오류난다. */
--
--
--* from product; /* 데이터 출력해주는 거  *= 모든 컬럼을 다보겠다.*/
--select name from product; /* name만 보기*/
--drop table product; /* 자식이 있는데 부모부터 지우면 오류난다. 자식부터 지워야함 (만들때는 부모부터)*/
--
--create table sale(
--    seq int,
--    code char(3) not null,
--    sale_date date default sysdate, /*sysdate는 오늘날짜다  이름을 카멜로 표기하면 가능한가?*/
--    qnt int default 0,
--    primary key(code, sale_date), /* 프라이머리키를 코드랑 세일데이터랑 합쳐서 만들겠다 */
--    foreign key (code) references product (code)/* 참조키=외래키=포린키 다른거랑 연결 할때  => 지금테이블의 code가 references한다 product table의 code를*/
--);
--
--desc sale;
--drop table sale;
--
--
--insert into sale(seq, code, sale_date, qnt)
--values(1, '101', '2024-04-01', 12);
--insert into sale(seq, code, sale_date, qnt)
--values(2, '102', '2024-04-01', 5);
--insert into sale(seq, code, sale_date, qnt)
--values(3, '103', '2024-04-02', 6);
--insert into sale(seq, code, sale_date, qnt)
--values(4, '101', '2024-04-03', 15);
--
--
--DELETE from sale where code is not null; /* 데이터 지우기 */
--
--insert into sale(seq, code, sale_date, qnt)
--values(4, '101', '2024-04-03', 15); /* 프라이머리키를 지정해놨으니 다시입력안된다 */
--insert into sale(seq, code, sale_date, qnt)
--values(4, '104', '2024-04-03', 15); /* 포린키를 해놔서 104번이 없으니 오류난다.  integrity constraint (PRODUCT.SYS_C006998) violated - parent key not found */
--
--create sequence seq_sale increment by 1 start with 5;  /* 시퀀스 생성 해보기 -- 시퀀스 이름은 seq-sale이고 증가합니다 1씩 5부터*/
--drop sequence seq_sale; /* 시퀀스 삭제하기 */
--
--insert into sale(seq, code, sale_date, qnt)
--values(seq_sale.nextval, '103', '2024-04-05', 10);  /* 위에만든 시퀀스를 사용해서 등록하기 */
--delete from sale where seq=5; /* 지우겠따 sale에서 seq가 5번인거 근데 지우고 또등록하면 6이나옴.*/
--
--select * from sale;
--
--update sale set qnt=12 where seq=6; /* update하겠다 sale에 있는거 수량을 12로 어디에? seq가 6번인거 */
--
--select p.name, p.price, s.* from product p , sale s;  /* p이름과  p가격과 s모든것을 보겠다 근데 p와 s는 별명이다*/
--
--select p.name, p.price, s.* from product p , sale s where p.code=s.code;  /* p이름과  p가격과 s모든것을 보겠다 근데 p와 s는 별명이다 근데 p코드와 s코드와 같은거만*/
--
--create view view_sale as /* 뷰를 만들어 이름은 view_sale 하면 selcet문으로 view를 만들게 */
--select  s.code, name, price, sale_date, qnt from product p , sale s where p.code=s.code;  /*원하는 순서대로  p이름과  p가격과 s모든것을 보겠다 근데 p와 s는 별명이다 근데 p코드와 s코드와 같은거만*/
--
--select * from view_sale; /* 뷰를다보겠다 ~~ 이마리여 */
--select * from view_sale order by qnt desc;
--select * from view_sale where code='101';
--select * from view_sale where name='냉장고';
--select * from view_sale where price>=1800000;
--select * from view_sale where price>=1800000 order by price;
--
--    select max(code) +1 as code from product;
--
--commit;
--
--
--select * from product;
--select * from sale;
--delete from product where code = '104'; /*자식이 없는 데이터만 지울 수 있다.*/

















