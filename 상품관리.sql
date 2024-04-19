desc product;
desc sale;

drop table product;
drop table sale;
drop sequence seq_sale;

create table product(
    code char(3) not null primary key,
    name varchar(100) not null, --100���ٱ�� toolong���� --
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
values('101', '�����', '3500000');
insert into product (code, name, price)
values('102', '��Ź��', '2300000');
insert into product (code, name, price)
values('103', '��Ÿ�Ϸ�', '1700000');
insert into product (code, name, price)
values('104', '����û����', '750000');


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
--group by �� �����


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

select sale_date, code, name, sum(qnt), sum(qnt*price) total --�̰ſ� as�� ���ϸ� JAVA���� ���̸� ������ ����.
from view_sale
group by sale_date, code, name
order by sale_date, code;




































--create table product(
--    code char(3) not null primary key,/* code�� 3�ڸ��� null����ȵǰ� primarykey�̴�.*/
--    name varchar(100) not null,
--    price int default 0 /* price��int�� ���� �Է¾��ϸ� 0���� ����*/
--); /* �÷� �����ϱ� */
--
--desc product; /* ���̺� ���� Ȯ���ϱ� */
--
--insert into product(code, name, price) /* ��ȣ�ȿ��� ��������ҰŸ� �Ƚᵵ�ȴ�.*/
--values('101', '�����', 3500000); /* �ι������� �����̸Ӹ�Ű������ ������ unique constraint (PRODUCT.SYS_C006990) violated */
--insert into product(code, name, price)
--values('102', '��Ź��', '2300000');
--insert into product(code, name, price)
--values('103', '��Ÿ�Ϸ�', 1700000); /* �ϰŵ� �ȳ����� "cannot insert NULL into (%s)" ��������. */
--
--
--* from product; /* ������ ������ִ� ��  *= ��� �÷��� �ٺ��ڴ�.*/
--select name from product; /* name�� ����*/
--drop table product; /* �ڽ��� �ִµ� �θ���� ����� ��������. �ڽĺ��� �������� (���鶧�� �θ����)*/
--
--create table sale(
--    seq int,
--    code char(3) not null,
--    sale_date date default sysdate, /*sysdate�� ���ó�¥��  �̸��� ī��� ǥ���ϸ� �����Ѱ�?*/
--    qnt int default 0,
--    primary key(code, sale_date), /* �����̸Ӹ�Ű�� �ڵ�� ���ϵ����Ͷ� ���ļ� ����ڴ� */
--    foreign key (code) references product (code)/* ����Ű=�ܷ�Ű=����Ű �ٸ��Ŷ� ���� �Ҷ�  => �������̺��� code�� references�Ѵ� product table�� code��*/
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
--DELETE from sale where code is not null; /* ������ ����� */
--
--insert into sale(seq, code, sale_date, qnt)
--values(4, '101', '2024-04-03', 15); /* �����̸Ӹ�Ű�� �����س����� �ٽ��Է¾ȵȴ� */
--insert into sale(seq, code, sale_date, qnt)
--values(4, '104', '2024-04-03', 15); /* ����Ű�� �س��� 104���� ������ ��������.  integrity constraint (PRODUCT.SYS_C006998) violated - parent key not found */
--
--create sequence seq_sale increment by 1 start with 5;  /* ������ ���� �غ��� -- ������ �̸��� seq-sale�̰� �����մϴ� 1�� 5����*/
--drop sequence seq_sale; /* ������ �����ϱ� */
--
--insert into sale(seq, code, sale_date, qnt)
--values(seq_sale.nextval, '103', '2024-04-05', 10);  /* �������� �������� ����ؼ� ����ϱ� */
--delete from sale where seq=5; /* ����ڵ� sale���� seq�� 5���ΰ� �ٵ� ����� �ǵ���ϸ� 6�̳���.*/
--
--select * from sale;
--
--update sale set qnt=12 where seq=6; /* update�ϰڴ� sale�� �ִ°� ������ 12�� ���? seq�� 6���ΰ� */
--
--select p.name, p.price, s.* from product p , sale s;  /* p�̸���  p���ݰ� s������ ���ڴ� �ٵ� p�� s�� �����̴�*/
--
--select p.name, p.price, s.* from product p , sale s where p.code=s.code;  /* p�̸���  p���ݰ� s������ ���ڴ� �ٵ� p�� s�� �����̴� �ٵ� p�ڵ�� s�ڵ�� �����Ÿ�*/
--
--create view view_sale as /* �並 ����� �̸��� view_sale �ϸ� selcet������ view�� ����� */
--select  s.code, name, price, sale_date, qnt from product p , sale s where p.code=s.code;  /*���ϴ� �������  p�̸���  p���ݰ� s������ ���ڴ� �ٵ� p�� s�� �����̴� �ٵ� p�ڵ�� s�ڵ�� �����Ÿ�*/
--
--select * from view_sale; /* �並�ٺ��ڴ� ~~ �̸����� */
--select * from view_sale order by qnt desc;
--select * from view_sale where code='101';
--select * from view_sale where name='�����';
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
--delete from product where code = '104'; /*�ڽ��� ���� �����͸� ���� �� �ִ�.*/

















