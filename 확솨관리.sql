create table professors( --�������̺� �����ϱ�
     pcode char(3) not null, 
     pname varchar(15) not null, 
     dept varchar(30), 
     hiredate date, 
     title varchar(15), 
     salary int default 0, 
     primary key(pcode)
);

desc professors;
drop table professors;

create table students( --�л����̺� �����ϱ�
 scode char(8) not null, 
 sname varchar(15) not null, 
 dept varchar(30),
 year int default 1, 
 birthday date, 
 advisor char(3), 
 primary key(scode), 
 foreign key(advisor) references professors(pcode) /* on delete cascade */
);

desc students;
drop table students;

create table courses( --�������̺�����ϱ�
 lcode char(4) not null,
 lname varchar(50) not null, 
 hours int, room char(3),
 instructor char(3),
 capacity int default 0,
 persons int default 0, 
 primary key(lcode), /* constraint child_pk foreign key(instructor) references professors(pcode) */
 foreign key(instructor) references professors(pcode)
);

desc courses;
drop table courses;

create table enrollments( --������û���̺� �����ϱ�
 lcode char(4) not null, 
 scode char(8) not null, 
 edate date, 
 grade int default 0,
 primary key(lcode, scode),
 foreign key(lcode) references courses(lcode), 
 foreign key(scode) references students(scode)
);

desc enrollments;
drop table enrollments;


insert into professors(pcode,pname,dept,hiredate,title,salary) values('221','�̺���','����','75/04/03','������',3000000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('228','���籤','����','91/09/19','�α���',2500000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('311','������','����','94/06/09','�α���',2300000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('509','����ȯ','����','92/10/14','������',2000000);

 -- select from where ���� �����ϱ�.
select * from professors; --���� ���̺��� ��� �����͸� �˻��Ͻÿ�.
select pname, dept, title from professors; --���� ���̺��� ��� ������ �̸�, �Ҽ��а�, ������ �˻��Ͻÿ�.
select dept from professors; --�������̺��� �������� �Ҽ��а��� �˻��Ͻÿ�.
select distinct(dept) from professors; --���� ���̺��� �������� �ٹ��ϴ� �Ҽ��а� �̸��� �˻��Ͻÿ�(�� , �ߺ� ���� �����Ͻÿ�).
select pname, dept, hiredate from professors where hiredate < '93/03/01';--���� ���̺��� '1993��3��1��' ������ �ӿ�� �������� �̸� �Ҽ��а�, �ӿ볯¥�� �� �˻��Ͻÿ�.
select pcode, pname, title from professors where title = '������' or title = '�α���';--���� ���̺��� ������ ������, �α����� �������� ������ȣ, ������, ������ �˻�
select pcode, pname, title from professors where title in ('������', '�α���'); --���� ���̺��� ������ ������, �α����� �������� ������ȣ, ������, ������ �˻�


insert into students(scode,sname,dept,year,birthday,advisor) values('92414029','������','����',3,'73/10/06','228');
insert into students(scode,sname,dept,year,birthday,advisor) values('92414033','��â��','����',4,'73/10/26','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514009','������','����',4,'73/11/16','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514023','������','����',4,'73/08/29','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92454018','�̿���','����',3,'74/09/30','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95454003','���翵','����',4,'76/02/06','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95414058','������','����',4,'76/03/12','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('96414404','�����','����',3,'77/12/22','228');

select * from students;
select sname, scode, birthday from students where dept='����' and year=3; --�л� ���̺��� '����'�̸鼭 '3'�г� �л����� �̸�, �й�, ��������� �˻��Ͻÿ�.
select * from students where advisor != '221';--�л����̺��� ������ȣ�� '221'�� ������ �������� �ʴ� �л����� �˻��Ͻÿ�.
select * from students where advisor <> '221';--�л����̺��� ������ȣ�� '221'�� ������ �������� �ʴ� �л����� �˻��Ͻÿ�.
select scode, sname, birthday from students where dept = '����' order by sname asc, birthday desc;--'����'�� �л����� �й�, �̸�, ��������� �̸��� �������� ��������, = �̸��� ������쿡 -> ��������� �������� �������� ������ �Ͻÿ�. 
select scode, sname, birthday, dept from students order by dept asc, birthday desc;--'����'�� �л����� �й�, �̸�, ��������� �̸��� �������� ��������, = �̸��� ������쿡 -> ��������� �������� �������� ������ �Ͻÿ�. 


insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C301','����ó����', 3 ,'506','221',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C401','�����ͺ��̽�',3,'414','221',80,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C421','�˰���',3,'510','228',80,72);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C312','�ڷᱸ��',2,'510','228',100,60);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('E221','��ȸ��',3,'304','311',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('A109','�ѱ��ǰ��๮ȭ',2,'101','509',120,36);

select * from courses;
select lcode, lname, instructor, hours  from courses where lname like '%����%'; --���� ���̺��� �����̸��� �����̶�� �ܾ �����ϴ� ������ ���¹�ȣ, �����̸�, ��米��, ���ǽð����� �˻��Ͻÿ�





insert into enrollments(lcode, scode, edate, grade) values('C401','92414033','98/03/02',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','92414033','98/03/02',80);
insert into enrollments(lcode, scode, edate, grade) values('C421','92414033','98/03/02', 0);
insert into enrollments(lcode, scode, edate, grade) values('C401','95414058','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C301','95414058','98/03/03',80);
insert into enrollments(lcode, scode, edate, grade) values('C312','95414058','98/03/03',80);
insert into enrollments(lcode, scode, edate, grade) values('C401','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C301','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C421','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C301','92414029','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C421','92414029','98/03/03',0);
insert into enrollments(lcode, scode, edate, grade) values('C312','92414029','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('E221','92414029','98/03/03',75);
insert into enrollments(lcode, scode, edate, grade) values('A109','92414029','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C301','92514009','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C401','92514009','98/03/03',85);
insert into enrollments(lcode, scode, edate, grade) values('E221','92514009','98/03/03',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C401','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C421','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C312','92454018','98/03/04',90);
insert into enrollments(lcode, scode, edate, grade) values('E221','92454018','98/03/04',90);
insert into enrollments(lcode, scode, edate, grade) values('A109','95454003','98/03/05',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','95454003','98/03/05',83);
insert into enrollments(lcode, scode, edate, grade) values('E221','95454003','98/03/05',75);

select lcode, scode, grade from enrollments where grade >=80;--������û ���̺��� ������ 80���̻��� �����ȣ, �л���ȣ, ������ �˻�
select lcode, scode, edate from enrollments where edate between '98/03/01' and '98/03/03'; --������û ���̺��� 1998�� 3�� 1�Ͽ��� 3��3�� ���̿� ������û �� ���¹�ȣ, �л���ȣ, ������û���� �˻��Ͻÿ�.



select * from enrollments order by scode;
select count(*) from enrollments; -- ���̺� ���� � �ִ��� �˷��ִ°� 

select s.dept, sname, pname from students s, professors p  where advisor=pcode; /*�л����� �а�, �л��̸�, ���������̸��� �˻��Ͻÿ�. = ���� ���������� = �̳�����  */
select lcode, lname, pname from courses, professors where instructor = pcode; /*���¹�ȣ, ���¸�, �����̸��� �˻��Ͻÿ�.*/
select s.scode, sname, lcode, edate from enrollments e, students s where s.scode=e.scode order by scode;/*�й�, �л��̸�, �л����� ������û �� ���¹�ȣ, ������û���� �˻��Ͻÿ�*/
select s.scode, sname, c.lcode, c.lname, e.grade from enrollments e, students s, courses c  where s.scode=e.scode and c.lcode=e.lcode order by grade; /*�й�, �л����� ������û �� ���¹�ȣ, ���¸�, ������ �˻��Ͻÿ�.*/
create view view1 as select s.scode, sname, c.lcode, c.lname, e.grade from enrollments e, students s, courses c  where s.scode=e.scode and c.lcode=e.lcode order by grade; -- view �����
select * from view1; -- view�κ���
drop view view1;

 /*'�̺���'�� ������ �����ϴ� �л����� �̸�, �г�, ��������� �˻��Ͻÿ�*/
select sname, year, birthday from students, professors where pcode=advisor and pname='�̺���';
/*'98/03/03'�� ������û �� �л����� �й�, �л��̸�, ���¹�ȣ�� �˻��Ͻÿ�.*/
select s.scode, s.sname, c.lcode from enrollments e, courses c, students s where e.lcode=c.lcode and e.scode=s.scode ;
/*'����'�� �������� �����ϴ� �л����� �̸�, �г�, ��������� �˻��Ͻÿ�.*/
select sname, year, birthday from students s, professors p where pcode=advisor and p.dept='����';
/*�ڷᱸ��'�� �����ϴ� ������ �а���, ���� ���� �˻��Ͻÿ�.*/
select dept, pname from professors p, courses c where  p.pcode=c.instructor and c.lname='�ڷᱸ��'; 
 /*'����ó����'�� ������û �� �л����� �й�, ������û��, ������ �˻��Ͻÿ�.*/
select e.scode, e.edate, e.grade from courses c, enrollments e where e.lcode=c.lcode and c.lname = '����ó����';
/*'�ڷᱸ��' ������ ������û �� �л����� �а�, �л��̸�, ������ �˻��Ͻÿ�.*/
select s.dept, s.sname, e.grade from students s, enrollments e, courses c where e.scode=s.scode and c.lcode=e.lcode and c.lname = '�ڷᱸ��'; 
 /*'���ڰ�' �л����� �й�, �л��̸�, ������û �� ���¹�ȣ, ���� ��, ������ �˻��Ͻÿ�.*/
select s.scode, s.sname, c.lcode, c.lname, e.grade from students s, enrollments e, courses c where e.scode = s.scode and e.lcode = c.lcode and dept = '����';
/*'����ó����'�� �����ϴ� ������ �̸�, �� ������ �����ϴ� �л����� �й�, �л����� �˻��Ͻÿ�.*/
select p.pname, s.scode, s.sname from courses c, students s, professors p  where c.instructor = p.pcode and s.advisor = p.pcode and  c.lname = '����ó����'; 
/*'�����ͺ��̽�'�� �����ϴ� ������, �� ������ ������û �� �л����� �а�, �̸�, ������ �˻��Ͻÿ�.*/
select p.pname, s.dept, s.sname, e.grade from courses c, students s, enrollments e, professors p where p.pcode = c.instructor and c.lcode = e.lcode and e.scode = s.scode and c.lname = '�����ͺ��̽�'; 
/*������ 80�� �̻��� �л����� �й�, �л��̸�, ���¹�ȣ, ���¸�, ��米�� ���� �˻��Ͻÿ�.*/
select s.scode, s.sname, c.lname, c.instructor from courses c, students s, enrollments e, professors p where p.pcode = c.instructor and c.lcode = e.lcode and e.scode = s.scode and grade >= 80 ; 


/*3.��ȸ*/
/*�������� �� �޿��װ� ��� �޿����� ���Ͻÿ�.*/
select sum(salary), avg(salary) from professors;
select sum(salary) salary_sum, avg(salary) salary_avg from professors; --������̱� , �̸��̶� ���� ������ �ϰ������?
select pname, sum(salary) salary_sum, avg(salary) salary_avg from professors; --????
/*����� �������� �� �޿��װ� ��� �޿����� ���Ͻÿ�.*/
select sum(salary), avg(salary) from professors where dept = '����';
/*������û �� ����� �߿��� �ְ� ������ ���� ������ ���Ͻÿ�.*/
select max(grade), min(grade) from enrollments ;
/*����� �л����� ��� �� ������ ���Ͻÿ�.*/
select count(s.scode) from students s where dept = '����'; --(*)�� null�� ī��Ʈ, Ư�����Է��ϸ� null�� ī��Ʈx
/*������û �� �л����� ��� �� ������ ���Ͻÿ�.*/
select count(distinct(scode)) from enrollments; --scode�� ī��Ʈ�ϴµ�, �ߺ��������ϰ�
/*�� �а��� �л����� ���� ���Ͻÿ�.*/
select dept, count(scode) from students group by dept order by count(scode) desc; 
/*�������� �Ҽ��а���, ���޺��� �з��Ͽ� �� ���޺� ��� �޿��׼��� ���Ͻÿ�.*/
select dept, title, avg(salary) from professors group by dept, title order by dept; 
/*�� �л��鿡 ���� �й�, �л��̸�, ������û ������� ��� ������ ���Ͻÿ�.*/
select s.scode, s.sname, e.grade, avg(e.grade) from enrollments e, students s where e.scode = s.scode group by s.scode, s.sname, e.grade; --�׷�����ϸ� select�� �ڵ尡 �׷���̿� �־���Ѵ�.
select s.scode, s.sname, e.grade, avg(e.grade) from enrollments e, students s where e.scode = s.scode group by s.scode, s.sname, e.grade;
select s.scode, sname, avg(grade) from students s, enrollments e where s.scode=e.scode group by s.scode, sname; --������ٸ���
select s.scode, s.sname, e.grade, avg(e.grade), dept from enrollments e, students s where e.scode = s.scode group by s.scode, s.sname, e.grade, s.dept order by avg(grade) desc;
select s.scode, s.sname, e.grade, avg(e.grade), s.dept, p.pname from enrollments e, students s, professors p  where e.scode = s.scode and p.pcode = s.advisor group by s.scode, s.sname, e.grade, s.dept, p.pname order by avg(grade) desc;

create view enr_stu_pro as --������û �л� ���� 
select e.*, p.pname, s.sname, s.dept
from enrollments e, students s, professors p
where e.scode=s.scode and p.pcode=s.advisor;
--���� view�� �����س��� view�� group by�ϱ�  => �װ� from�� �ٰ� �־��ֱ�
select scode, sname, dept, avg(grade), pname
from enr_stu_pro
group by scode, sname, dept, pname;

select * from enr_stu_pro;
drop view enr_stu_pro;



create view enr_stu_cou as --������û �л� ���� 
select e.*, s.sname, c.lname
from enrollments e, students s, courses c
where e.scode = s.scode and e.lcode = c.lcode;

select * from enr_stu_cou;


/*�� �л��鿡 ���� ������û ������� ��� ������ ���Ͻÿ�.*/
select scode, sname, avg(grade), pname from enr_stu_pro group by scode, sname, pname order by avg(grade) desc;
select scode, sname, avg(grade), pname, dept from enr_stu_pro where dept='����' or dept='����' group by scode, sname, pname, dept order by dept, avg(grade) desc ;
select scode, sname, avg(grade), pname, dept 
from enr_stu_pro 
where dept='����' or dept='����' 
group by scode, sname, pname, dept
having avg(grade) >=75 
order by dept, avg(grade) desc ; --having�� groupby�Ѱſ� ���ǰɾ��ֱ�
select scode, avg(grade) from enrollments group by scode;


/*������û �� ������� �л����� �׷����Ͽ� ��� ������ ���� ����, �л���ȣ, ��� ������ ������ ���� ������ �����Ͽ� ����Ͻÿ�.*/
select scode, avg(grade) from enrollments group by scode order by avg(grade) desc;
/*������û ������� ��� ������ 85�� �̻��� �л����� �л���ȣ, ��� ������ ���Ͻÿ�.*/
select scode, avg(grade) from enrollments group by scode having avg(grade) >= 85;
/*���º� ��������� 80�� �̻��� ���µ��� ���¹�ȣ�� ��������� ����Ͻÿ�.*/
select lcode, avg(grade) from enrollments group by lcode having avg(grade) >= 80;
/*�л����� 3�� �̻��� �а� ���� ����, �а���, �л����� ����Ͻÿ�.*/
select dept, count(scode) from students group by dept having count(scode) >= 3;
/*������û ��������� 85�� �̻��� �л����� �л���ȣ, �л��̸�, ��� ������ ��������� ���� ������ ����Ͻÿ�.*/
select e.scode, s.sname, avg(e.grade) from enrollments e, students s group by e.scode, s.sname having avg(grade) >= 85 order by avg(e.grade) desc;
/*���º� ��������� 80�� �̻��� ���µ��� ���¹�ȣ, ���¸�, ��������� ��������� ���� ������ ����Ͻÿ�.*/
select s.scode, s.sname, avg(grade) from students s, enrollments e where s.scode=e.scode group by s.scode, s.sname having avg(grade) >= 85 order by avg(grade) desc;


/*4.��ȸ*/
/*'�˰���'�� �����ϴ� ������ ������ȣ, �����̸�, �Ҽ��а��� �˻��Ͻÿ�.*/
select pcode, pname, dept from professors where pcode in (select instructor from courses where lname='�˰���'); --�̰� ����������.
select * from professors where pcode=
(select instructor from courses where lname='�˰���'); --��ȣ�����ϰ� �տ��Ÿ� �Ѵ�.
/*���ǽ� '510'ȣ���� �����ϴ� ������ ������ȣ, �����̸�, �Ҽ��а��� �˻��Ͻÿ�.*/
select instructor from courses where room='510'; --�����̰ź��� �����
select * from professors where pcode in; --�̰Ÿ������ 
select * from professors where pcode in
(select instructor from courses where room='510'); --��������ؾ� �Ұſ� ��ȣ���ֱ�
/*'��â��' �л��� �Ҽӵ� �а��� �����ϴ� �������� �̸�, ����, �ӿ����ڸ� �˻��Ͻÿ�.*/
select pname, title, hiredate from professors where dept in (select dept from students where sname='��â��');
/*������û ������ ������ 90�� �̻��� �л����� �̸�, �л���ȣ, �Ҽ��а�, �г��� �˻��Ͻÿ�.*/
select sname, scode, dept, year from students where scode in 
(select scode from enrollments where grade >= 90);
--������û ������ ��������� 80�� �̻��� �л����� �̸�, �л���ȣ, �Ҽ��а�, �г��� �˻��Ͻÿ�
select scode from enrollments group by scode having avg(grade) >=80; --��������� //group by�� ������ having�̴�.
select * from students where scode in 
(select scode from enrollments group by scode having avg(grade) >=80);
/*'����'�� �������� ����ϴ� ������ �̸�, ���ǽð���, ���ǽ��� �˻��Ͻÿ�.*/
/*'98/03/02'�� ������û �� �л����� �а�, �й�, �л��̸�, �г��� �˻��Ͻÿ�.*/
/*'509'ȣ���� ���Ǹ� ��� �л����� �а�, �й�, �л��̸��� �˻��Ͻÿ�.*/
/*������û ������ ��������� 80�� �̻��� �л����� �̸�, �л���ȣ, �Ҽ��а�, �г��� �˻��Ͻÿ�.*/
/*'����'�� �л����� �����ϴ� ������ �̸�, ������ȣ, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*�л����� '3'�� �̻��� �а��� �ٹ��ϴ� �������� �̸�, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*'�̿���'�� ������û�� ������ ��ȣ, �����, ������ �˻��Ͻÿ�.*/
/*'�˰���'�� ������û�� �л����� �й�, �л��̸�, �а��� �˻��Ͻÿ�.*/
/*'1973'��� �л����� �����ϴ� �������� �̸�, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*��ü �л��� 30% �̻��� ������û�� ������ ��ȣ�� �˻��Ͻÿ�.*/

--'98414022', '������', '75-05-10', '����', '1' ���� �л����̺� �����Ͻÿ�.
insert into students(scode, sname, birthday, dept, year)  --��¥�� �г��� default�� 1�̶� 1�г��� �ȳ־ �Ȱ���. ������������� ������ �̳������� �Ұ���
values('98414022', '������', '79-05-10', '����', '1');
select * from students;
/*'1998�� 3�� 3��' ������ �߻��� ��� ������û �����͸� oldEnrollments���̺�� �����Ͻÿ�.*/
create table oldenrollments( --������û���̺� �����ϱ�
 lcode char(4) not null, 
 scode char(8) not null, 
 edate date, 
 grade int default 0,
 primary key(lcode, scode),
 foreign key(lcode) references courses(lcode), 
 foreign key(scode) references students(scode)
);

desc oldenrollments;
select * from oldenrollments ;
drop table oldenrollments;

insert into oldEnrollments(lcode, scode, edate, grade)
select lcode, scode, edate, grade from enrollments where edate <= '98-03-03'; --�Ⱓ������ �Ÿ� �����Ŵϱ� �Ⱓ������ �����ִ��� ã�ƺ����ϴ� select�� ����.
/*4�г� �л����� ��� �л� �����͸� oldstudents ���̺�� �����Ͻÿ�.*/
select * from students where year=4;

create table oldstudents( --������û���̺� �����ϱ�
 lcode char(4) not null, 
 scode char(8) not null, 
 edate date, 
 grade int default 0,
 primary key(lcode, scode),
 foreign key(lcode) references courses(lcode), 
 foreign key(scode) references students(scode)
);

desc oldstudents;
select * from oldstudents ;
drop table oldstudents;

insert into oldstudents select * from students where year=4;

/*�л����̺��� '������'�� �����͸� �����Ͻÿ�.*/
/*'1998�� 1�� 1��' ������ ��û�� ��� ������û �����͸� �����Ͻÿ�.*/
/*������û �� ���� ���� ������ ���� ���� ���� ������û �����͸� �����Ͻÿ�.*/
/*������û �� ���� ���� ������ ���� ���� ���� ������û �����͸� �����Ͻÿ�.*/
/*�л����̺��� ����� 3�г� �����͸� 4�г����� �����Ͻÿ�.*/
/*'����ȯ' ������ ������ '������'���� '�α���'�� �����Ͻÿ�.*/
/*'�����' �л��� ��û�� ��� ������û �����͸� �����Ͻÿ�.*/
/*'����'�� �������� �޿��� 10% ���� ��Ű�ÿ�.*/
/*��� �������� �޿��� 10% ���� ��Ű�ÿ�.*/
/*'����'�� �л����� ��û�� ������û �����͸� ��� �����Ͻÿ�.*/
/*'����'�� ������ ����ϴ� ������ ���ǽ��� ��� '123'ȣ�Ƿ� �����Ͻÿ�.*/

--'���籤' ������ �����ϴ� �л����� ���������� ������ȣ '221'�� �����Ͻÿ�.
update students set advisor='221' where advisor in (select pcode from professors where pname='���籤'); --�̰��� ��������
select * from professors;
select * from students;


/*'����ó����' ������ ������û �� �л����� ������ 5���� ���� ��Ű�ÿ�. */
update enrollments set grade=grade+5 where lcode in (select lcode from courses where lname='����ó����');

select * from enrollments;

/*'����'�� �л����� ������û �� ������û �������� ������ 0�� ó�� �Ͻÿ�.*/
/*'������' �л��� ���������� �����ϴ� ������ ���ǽ��� '304'ȣ�� �����Ͻÿ�.*/
/*'��ȸ��'�� �����ϴ� ������ �޿��� 100000�� �λ��Ͻÿ�.*/
/*������û�ο����� 80�� �̻��� ���¸� �����ϴ� �������� �޿��� 100000�� �λ��Ͻÿ�.*/
/*������' �л��� ��� ���� ������ 5���� ���� ��Ű�ÿ�.*/
/*'����'�� 3�г� �л����� ������û �� ������� ������ 5���� ���� ��Ű�ÿ�.*/
/*'����'�� '�α���'�� �����ϴ� ���ǽð����� 1�� ���� ��Ű�ÿ�.*/
/*������û �� ������3���� �̻��� �л����� �г��� 1�� ���� ��Ű�ÿ�.*/
/*������û ��������� 80�� �̸��� �л����� �г��� 1�� ���ҽ�Ű�ÿ�.*/
/*'����ó����'�� ������û �� �л����� �а��� '����'���� �����Ͻÿ�.*/
/*���º� ��������� 80�� �̻��� ������� ���ǽ��� '509'ȣ�� �����Ͻÿ�.*/
/*'����ȯ' ������ �����ϴ� ���¸� ��û�� ������û �����͸� �����Ͻÿ�.*/
/*'�ڷᱸ��'�� ������û �� �л��� �г��� 1�� ���� ��Ű�ÿ�.*/



























