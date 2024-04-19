create table professors( /* ���̺� ����� */
    pcode char(3) primary key, /* 3ĭ�� �������� ���� ���� ���̿� ������� = �ڸ����� �������ִ°� ex) �ֹι�ȣ, �й� //// primaryŰ�� ���ʿ�, �����س��� �ߺ��Ǹ� �˾Ƽ� �����߻�*/ 
    pname varchar(15), /* ������ ��������� ���� �������� �ڸ�����x �ڸ������� ������ ���� ������ ex)�����̸�*/
    dept varchar(30),
    hiredate date,
    title varchar(15),
    salary int
);

insert into professors(pcode,pname,dept,hiredate,title,salary)
values('221','�̺���','����','75/04/03','������',3000000); /* int�� ,������ ������ �ȵ�.*/ /*ORA-00001: unique constraint (JAVA.SYS_C006987) violated => �����̸Ӹ�Ű�����ִµ� �ǽ����ϸ� ������*/
insert into professors(pcode,pname,dept,hiredate,title,salary) 
values('228','���籤','����','91/09/19','�α���',2500000);
insert into professors(pcode,pname,dept,hiredate,title,salary) 
values('311','������','����','94/06/09','�α���',2300000);
insert into professors(pcode,pname,dept,hiredate,title,salary) 
values('509','����ȯ','����','92/10/14','������',2000000);



select * from professors; /* ������ ������ִ� ��  *= ��� �÷��� �ٺ��ڴ�.*/
select * from professors  where dept='����'; /* �����а��� ����*/
select * from professors where pname like '��%'; /* �̾� ���� ���� */
select * from professors where pcode like '%1%';  /* pcode�� 1�� ��ư �ִ°� */
select * from professors order by pname; /* �����ټ����� */
select * from professors order by salary asc; /* �������� = ascending asc�� �������� �⺻�� ��������*/
select * from professors order by salary desc; /* �������� = descending desc�� �����Ұ� */ 
/* select pcode,pname from professors;  pcde�� pname�� ����*/
select * from professors order by pcode;

delete from professors where pcode='221'; /* pcode ''�ΰ� �����ϴ°��� primary key�󼭸� �����Ǵ°Ǿƴѵ� primary key�� ������ �����ϴ�. */
delete from professors where pcode is not null; /* pcode����  null�� �ƴѰ� ������. */

/*drop table professors; ���̺� �����ϱ�*/

update professors set pname = '�躴��' where pcode = '221'; /* ������Ʈ �Ұǵ� pname�� �躴�ķ� �ٲܲ��� ���? pcode�� 221�ΰ� */
update professors set pname = '�̺���', dept = '����' where pcode = '221'; /* ������Ʈ �Ұǵ� pname�� �躴�ķ� dept�� �������� �ٲܲ��� ���? pcode�� 221�ΰ� */

commit; /*�����ϱ�*/

select max(pcode)+1 as code from professors; /*  ���� �ƽ� +1 as�� ���� ������ code �̴�.*/
/*SELECT FLOOR(RAND() * (SELECT MAX(pcode) FROM professors)) + 1 AS ran FROM professors;*/
select * from professors where pcode = ?; /* pcode��... ''�ΰ� ����ϱ�*/
/*SELECT MOD(ABS(DBMS_RANDOM.RANDOM),900) + 100 FROM professors;*/
select * from professors;
delete from professors where pcode = ?;

update professors set dept = '����', hiredate='24/04/16', title='������', salary='4000000' where pcode='845';





